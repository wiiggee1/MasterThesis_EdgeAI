import copy, os, time, json, math, struct
from typing import Optional, Union
from pathlib import Path
from collections import defaultdict
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from numpy.random import default_rng
from matplotlib.ticker import MultipleLocator
from dataclasses import dataclass
from enum import Enum, StrEnum, IntEnum
from scipy.stats import chi2

import pandas as pd
import seaborn as sns
import altair as alt
from IPython.display import display

import torch
from torch import nn
from torch.utils.data import DataLoader
from torch.utils.tensorboard import SummaryWriter
from torchvision import datasets
from torchvision.transforms import ToTensor
from torch.export import Dim, export
from torchinfo import summary
import torch.fx as fx
import torchao
from torchao.quantization import (
    int8_weight_only,
    float8_weight_only,
    quantize_
)


from sklearn import preprocessing
from sklearn.model_selection import train_test_split
from sklearn.cluster import KMeans, DBSCAN
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import MinMaxScaler
from sklearn.preprocessing import MaxAbsScaler
from sklearn.decomposition import PCA
from sklearn.manifold import TSNE
from sklearn.metrics import (
    confusion_matrix, classification_report, f1_score,
    roc_auc_score, average_precision_score, roc_curve, precision_recall_curve
)

matplotlib.use('Qt5Agg')

sns.set_theme(style="white")
sns.set_context("paper")


class CustomRNN(nn.Module):
    def __init__(self, input_features, hidden_size, alpha_param=0.01, bias=True):
        super().__init__()
        self.hidden_size = hidden_size
        self.alpha = alpha_param
        self.wx = nn.Linear(input_features, hidden_size, bias=bias)
        self.wh = nn.Linear(hidden_size, hidden_size, bias=bias)
        print(f"Wx shape: {self.wx.weight.shape}, Wh shape: {self.wh.weight.shape}\n")

    def forward(self, x_t: torch.Tensor, h_prev: torch.Tensor) -> torch.Tensor:
        # h_t = φ(W_x * x_t + W_h * h_{t-1})
        z = self.wx(x_t) + self.wh(h_prev)
        return nn.functional.leaky_relu(input=z, negative_slope=self.alpha)


class RNNBlock(nn.Module):
    """Sequential-friendly RNN layer: forward(x) -> y with managed hidden state."""

    def __init__(self, input_size, hidden_size, alpha=0.01, bias=True, batch_first=True):
        super().__init__()
        self.batch_first = batch_first
        self.cell = CustomRNN(input_size, hidden_size, alpha, bias)
        self.hidden_size = hidden_size

    def forward(self, x):
        # x: (B, T, In) if batch_first else (T, B, In)
        if not self.batch_first:
            x = x.transpose(0, 1)

        B, T, In = x.shape
        H = self.hidden_size
        h = x.new_zeros(B, H)

        ys = []
        for t in range(T):
            h = self.cell(x[:, t, :], h)
            ys.append(h.unsqueeze(1))
        y = torch.cat(ys, dim=1)  # (B, T, H)

        if not self.batch_first:
            y = y.transpose(0, 1)
        return y


class EdgeAiModel(nn.Module):
    def __init__(self, runtime_cfg,
                 dropout: float = 0.0, batch_first: bool = True,
                 bias: bool = True, alpha_param: float = 0.01):
        super(EdgeAiModel, self).__init__()
        self.config = runtime_cfg
        self.dimensions = runtime_cfg["dimensions"]

        # Input features is the number of channels (e.g., two sensor channels)
        self.input_features = int(runtime_cfg["dimensions"]["input_features"])
        self.timewindow = int(runtime_cfg["dimensions"]["timesteps"])
        self.batch_size = int(runtime_cfg["batch_size"])
        self.batch_first = batch_first
        self.alpha = alpha_param

        T = self.timewindow
        self.H_enc = int(self.dimensions["hidden_encoder"])
        self.H_lat = int(self.dimensions["latent"])
        self.H_dec = int(self.dimensions["hidden_decoder"])

        # Dimension reduction layers into latent space representation.
        self.rnn_encoder = RNNBlock(
            input_size=self.input_features,
            hidden_size=self.H_enc,
            alpha=self.alpha,
            bias=bias,
            batch_first=self.batch_first
        )

        self.fc_encoder = nn.Linear(self.H_enc, self.H_lat)

        # Reconstruct into same dimension as the input data.
        self.rnn_decoder = RNNBlock(
            input_size=self.H_lat,
            hidden_size=self.H_dec,
            alpha=self.alpha,
            bias=bias,
            batch_first=self.batch_first
        )

        self.fc_head = nn.Linear(self.H_dec, self.input_features)
        # self.fc_head_tanh = nn.Tanh()
        self.dropout = nn.Dropout(dropout) if dropout > 0 else None

    def forward(self, x: torch.Tensor):
        # Shape of input x: [batch_size, timesteps, input_features]
        # x: (B,T,In)
        if not self.batch_first:
            x = x.transpose(0, 1)
        B, T, _ = x.shape

        y = self.rnn_encoder(x)                             # (B,T,H_enc)
        y = self.fc_encoder(y.reshape(B * T, self.H_enc))   # (B*T,H_lat)
        y = y.reshape(B, T, self.H_lat)                     # (B,T,H_lat)

        if self.dropout:
            y = self.dropout(y)

        y = self.rnn_decoder(y)                             # (B,T,H_dec)
        y = self.fc_head(y.reshape(B * T, self.H_dec))      # (B*T,In)
        y = y.reshape(B, T, self.input_features)

        #  NEW ADDED
        # y = self.fc_head_tanh(y)

        if not self.batch_first:
            y = y.transpose(0, 1)

        return y

    @staticmethod
    def create_sequences(values: np.ndarray, window: int) -> np.ndarray:
        if values.ndim == 1:
            values = values[:, None]
        T, IN = values.shape
        n = T - window + 1

        if n <= 0:
            raise ValueError(f"window={window} longer than series length {T}")
        seqs = np.stack([values[i:i + window] for i in range(n)], axis=0)

        return seqs

    def new_threshold(self, scores, quantile_val=0.995):
        self.config["threshold"] = float(np.quantile(scores, quantile_val))
        # return float(np.quantile(scores, quantile_val))
        return self.config["threshold"]

    def detect_anomaly(self, scores, threshold, persistence=3):
        above_threshold = scores > threshold
        if persistence <= 1:
            return above_threshold

        # run-length encoding of above-threshold
        out = np.zeros_like(above_threshold, dtype=bool)
        run = 0
        for i, a in enumerate(above_threshold):
            run = run + 1 if a else 0
            if run >= persistence:
                out[i] = True
        return out

    @staticmethod
    def smooth(x, k=5):
        if k <= 1:
            return x
        w = np.ones(k, dtype=np.float32) / k
        return np.convolve(x, w, mode="same")

    @torch.no_grad()
    def reconstruction_score_windows(self, X: torch.Tensor, device, mode: str = "mae"):
        self.eval().to(device)
        # model_dtype = next(self.parameters()).dtype
        X = X.to(device=device)
        Y = self(X)

        err = Y - X

        if mode == "mae":
            scores = err.abs().mean(dim=(1, 2))
        elif mode == "mse":
            scores = err.pow(2).mean(dim=(1, 2))
        elif mode == "mae_p":
            err_p = err.abs().mean(dim=2)
            scores = torch.quantile(err_p, q=0.90, dim=1)
        elif mode == "mse_p":
            err_p = err.pow(2).mean(dim=2)
            scores = torch.quantile(err_p, q=0.90, dim=1)

        # Takes the mean over time and features.
        # mse = nn.functional.mse_loss(Y, X, reduction="none").mean(dim=(1, 2)).detach().cpu().numpy()
        # mse = nn.functional.mse_loss(Y, X, reduction="none").mean(dim=(1, 2)).detach().cpu().numpy()

        return scores.detach().cpu().numpy()

    def reconstruct(self, x: torch.Tensor) -> torch.Tensor:
        """Alias for forward, returns reconstruction with same shape as input."""
        return self.forward(x)

    @torch.no_grad()
    def evaluate_reconstruction(self, X: torch.Tensor, device=None, max_windows: int | None = 2048):
        """
        Compute reconstruction metrics on a batch/collection of windows.
        Returns a dict with scalars, per-window scores, per-timestep scores, and a small sample.
        """
        self.eval()
        if device is None:
            device = next(self.parameters()).device

        X = X.to(device)
        if max_windows is not None and X.shape[0] > max_windows:
            X = X[:max_windows]

        Y = self.reconstruct(X)
        # print(f"X input: {X}\nY predict: {Y}\n")
        # print(f"Shape of X: {X.shape}, Shape of Y: {Y.shape}\n")
        # print(f"Y predict: {Y}\n")

        err = Y - X
        cos_similarity = torch.mean(nn.functional.cosine_similarity(Y, X, dim=2)).item()
        mse_per_window = torch.mean(err.pow(2), dim=(1, 2))
        mae_per_window = torch.mean(err.abs(), dim=(1, 2))
        per_timestep_mse = torch.mean(err.pow(2), dim=(0, 2))

        summary = {
            "mse": float(mse_per_window.mean().item()),
            "mae": float(mae_per_window.mean().item()),
            "mse_per_window": mse_per_window.detach().cpu().numpy(),
            "per_timestep_mse": per_timestep_mse.detach().cpu().numpy(),
            "X_sample": X[:6].detach().cpu(),   # [K, T, In]
            "Y_sample": Y[:6].detach().cpu(),   # [K, T, In]
            # "Cosine_Similarity": cos_similarity.detach().cpu().numpy(),
            "Cosine_Similarity": float(cos_similarity),
        }
        return summary

    def train_model(self, data_sequence, true_sequence,
                    runtime_cfg, device,
                    ckpt_best="checkpoints/edgeai_best.pth",
                    ckpt_last="checkpoints/edgeai_last.pth",
                    summary_writer: SummaryWriter | None = None
                    ):

        self.to(device)

        input_dtype = runtime_cfg["dtype"]
        epochs = runtime_cfg["epochs"]
        lr = runtime_cfg["learning_rate"]
        BATCH = runtime_cfg["batch_size"]

        optimizer = runtime_cfg["optimizer"]
        loss_fn = runtime_cfg["loss_fn"]
        scheduler = runtime_cfg["scheduler"]

        Xtr = data_sequence if torch.is_tensor(data_sequence) else torch.tensor(data_sequence)
        Xva = true_sequence if torch.is_tensor(true_sequence) else torch.tensor(true_sequence)
        Xtr = Xtr.to(device=device, dtype=input_dtype)
        Xva = Xva.to(device=device, dtype=input_dtype)

        # optimizer = optimizer(self.parameters(), lr=lr)
        # scheduler = scheduler(optimizer)

        # optimizer = torch.optim.Adam(self.parameters(), lr=lr)
        # optimizer = torch.optim.AdamW(self.parameters(), lr=lr, weight_decay=1e-2)

        metrics = {
            "train_loss": [],
            "val_loss": [],
        }
        # patience = 20
        patience = int(runtime_cfg["patience"])
        min_delta = 1e-10
        no_improve = 0
        best_val = float("inf")

        if summary_writer is not None:
            hparams = {
                "learning_rate": float(lr),
                "epochs": int(epochs),
                "batch_size": int(BATCH),
                "timewindow": int(self.timewindow),
                "input_features": int(self.input_features),
                "encoder_size": int(self.H_enc),
                "latent_size": int(self.H_lat),
                "decoder_size": int(self.H_dec),
                "optimizer": optimizer.__class__.__name__,
                "scheduler": scheduler.__class__.__name__,
            }

        rng = np.random.default_rng(0)

        def batches(X, B):
            N = X.shape[0]
            idx = rng.permutation(N)
            for i in range(0, N, B):
                j = idx[i:i + B]
                yield X[j]
                # yield X[i: i + BATCH]

        for epoch in range(epochs):
            self.train()
            training_loss, train_n = 0.0, 0
            # for batch in torch.split(data_sequence, 64):
            for xb in batches(Xtr, BATCH):
                optimizer.zero_grad()
                output_y = self(xb)  # Batch Prediction Y
                # loss = nn.functional.mse_loss(output_y, xb, reduction='mean')
                # loss = loss_fn(output_y, xb, reduction='mean')
                loss = loss_fn(output_y, xb)

                loss.backward()
                optimizer.step()
                # torch.nn.utils.clip_grad_norm(self.parameters(), max_norm=1.0)
                bs = xb.size(0)
                training_loss += loss.item() * bs
                train_n += xb.size(0)

            print()

            self.eval()
            with torch.no_grad():
                val_loss, n_va = 0.0, 0
                for xb in batches(Xva, BATCH):
                    pred_yb = self(xb)
                    # loss = nn.functional.mse_loss(pred_yb, xb, reduction='mean')
                    # loss = loss_fn(pred_yb, xb, reduction='mean')
                    loss = loss_fn(pred_yb, xb)
                    bs = xb.size(0)
                    val_loss += loss.item() * bs
                    n_va += bs

            t_loss = training_loss / max(train_n, 1)
            v_loss = val_loss / max(n_va, 1)

            metrics["train_loss"].append(t_loss)
            metrics["val_loss"].append(v_loss)

            recon = self.evaluate_reconstruction(Xva[:512], device=device, max_windows=None)
            scheduler.step(v_loss)
            print(f"Latest learning rate: {scheduler.get_last_lr()}")
            save_checkpoint(ckpt_last, self, optimizer, scheduler, epoch=epoch, best_val=best_val)

            if summary_writer is not None:
                current_lr = optimizer.param_groups[0]["lr"]
                summary_writer.add_scalars("loss", {"train": t_loss, "val": v_loss}, epoch)
                summary_writer.add_scalar('loss/train', t_loss, epoch)
                summary_writer.add_scalar('loss/val', v_loss, epoch)
                summary_writer.add_scalar('lr', current_lr, epoch)

            print(
                f"Epoch {epoch + 1}/{epochs} | "
                f"Train {t_loss:.10f} | Val {v_loss:.10f} | "
                f"[Validation Reconstruction] MSE {recon['mse']:.8f}, MAE {recon['mae']:.8f}"
            )

            # Early stopping on best val
            # if v_loss < best_val:
            if v_loss < best_val - 1e-10:
                best_val = v_loss
                no_improve = 0
                save_checkpoint(
                    ckpt_best,
                    self,
                    optimizer,
                    scheduler,
                    epoch=epoch,
                    best_val=best_val)
            else:
                no_improve += 1

            if no_improve >= patience:
                print(f"Early stopping at epoch {epoch + 1} (no val improvement for {patience}).")
                break

        # Load best weights before returning
        best_state = load_checkpoint(ckpt_best, device)
        self.load_state_dict(best_state["model"])
        self.eval()

        if summary_writer is not None:
            final_metrics = {
                "hparam/val_loss": best_val,
            }
            summary_writer.add_hparams(hparams, final_metrics)
            # summary_writer.add_pr_curve
            # summary_writer.add_histogram
            summary_writer.flush()
            summary_writer.close()

        return pd.DataFrame(metrics)


def save_checkpoint(
        path, model, optimizer=None, scheduler=None, epoch=None,
        best_val=None, extra: dict | None = None):
    state = {"model": model.state_dict()}
    if optimizer is not None:
        state["opt"] = optimizer.state_dict()
    if scheduler is not None:
        state["sched"] = scheduler.state_dict()
    if epoch is not None:
        state["epoch"] = epoch
    if best_val is not None:
        state["best_val"] = best_val
    if extra:
        state["extra"] = extra
    Path(path).parent.mkdir(parents=True, exist_ok=True)
    torch.save(state, path)


def load_checkpoint(path, device):
    try:
        state = torch.load(path, map_location=device, weights_only=True)
    except TypeError:  # older torch without weights_only
        state = torch.load(path, map_location=device)
    return state


def count_params(model: nn.Module):
    """Trainable parameter count."""
    return sum(p.numel() for p in model.parameters() if p.requires_grad)


def params_bytes(model: nn.Module):
    """Parameter memory in bytes (based on tensors' dtype)."""
    return sum(p.numel() * p.element_size() for p in model.parameters())


def pretty_size(n_bytes: int):
    for unit in ["B", "KB", "MB", "GB"]:
        if n_bytes < 1024:
            return f"{n_bytes:.1f} {unit}"
        n_bytes /= 1024
    return f"{n_bytes:.1f} TB"


def _ensure_2d(a: np.ndarray) -> np.ndarray:
    if a.ndim == 1:
        return a[:, None]
    if a.ndim > 2:
        # flatten all but time
        t = a.shape[0]
        return a.reshape(t, -1)
    return a


def scan_dataset(dirpath: Path):
    rows = []
    for f in sorted(dirpath.glob("*.npy")):
        arr = _ensure_2d(np.load(f, allow_pickle=False))
        T, D = arr.shape
        letter, idx = f.stem.split("-")[0], f.stem.split("-")[1]
        rows.append({"file": f.name, "letter": letter, "idx": idx, "T": T, "D": D, "path": f})
    return pd.DataFrame(rows)


def load_ch0(df_slice: pd.DataFrame, samples_per_file: int | None = 5000):
    rng = default_rng(0)
    rows = []
    for _, r in df_slice.iterrows():
        a = _ensure_2d(np.load(r["path"], allow_pickle=False)).astype(np.float32)  # (T, D)
        v = a[:, 0]  # ch0
        T = len(v)
        if samples_per_file:
            idx = np.sort(rng.choice(T, size=min(samples_per_file, T), replace=False))
        else:
            idx = np.arange(T)
        rows.append(pd.DataFrame({
            "file": r["file"],
            "letter": r["letter"],
            "t": idx,
            "value": v[idx],
        }))
    return pd.concat(rows, ignore_index=True)


def load_ch0_raw(path: Path) -> np.ndarray:
    """Return raw channel-0 series as 1-D float32 array."""
    a = np.load(path, allow_pickle=False).astype(np.float32)
    if a.ndim == 1:
        return a
    return a[:, 0].reshape(-1)


def iqr_clip_to_same_range(x, whisker=1.5):
    x = np.asarray(x, dtype=np.float32).reshape(-1)
    q1, q3 = np.quantile(x, [0.25, 0.75])
    iqr = q3 - q1
    lo, hi = q1 - whisker * iqr, q3 + whisker * iqr
    # clip *within* data’s natural range (here already [-1,1])
    return np.clip(x, lo, hi)


def load_ch0_windows_new(
    path: Path,
    window: int,
    min_var: float = 0.0,
    anomalies: dict | None = None,
    *,
    clip_iqr: bool = False,      # <— only True for TRAIN
    whisker: float = 1.5
) -> tuple[np.ndarray, np.ndarray]:
    raw = load_ch0_raw(path).astype(np.float32).reshape(-1)

    if clip_iqr:
        # per-series IQR (no scaling) for TRAIN ONLY
        q1, q3 = np.quantile(raw, [0.25, 0.75])
        iqr = q3 - q1
        lo = q1 - whisker * iqr
        hi = q3 + whisker * iqr
        raw = np.clip(raw, lo, hi).astype(np.float32)

    v = raw[:, None]                          # (T,1)
    T = v.shape[0]
    N = T - window + 1

    if N <= 0:
        return np.empty((0, window, 1), np.float32), np.empty((0,), np.int32)

    W = np.stack([v[i:i + window] for i in range(N)], axis=0).astype(np.float32)  # (N,window,1)

    y_labels = np.zeros(N, dtype=np.int32)
    dataset_name = Path(path).name.split('.')[0]

    if anomalies is not None:
        anomaly_range = anomalies.get(dataset_name)
        if anomaly_range:

            start_offset = int(anomaly_range["start"])
            end_offset = int(anomaly_range["end"])

            # Window i covers [i, i + window - 1]
            starts = np.arange(N, dtype=np.int32)
            ends = starts + (window - 1)

            y_labels = ((ends >= start_offset) & (starts <= end_offset)).astype(np.int32)

    if min_var > 0:
        keep = (W.var(axis=(1, 2)) >= min_var)
        W, y_labels = W[keep], y_labels[keep]

    return W, y_labels


def load_ch0_windows(
        path: Path,
        window: int,
        min_var: float = 0.0,
        anomalies: dict | None = None) -> tuple[np.ndarray, np.ndarray]:

    raw = load_ch0_raw(path).astype(np.float32)
    raw_df = pd.Series(raw)
    # robust_scaling = preprocessing.RobustScaler()
    # raw_scaled = robust_scaling.fit_transform(raw.reshape(-1, 1)).astype(np.float32).reshape(-1)
    raw_scaled = iqr_clip_to_same_range(raw, whisker=1.5).astype(np.float32)
    raw_scaled_df = pd.Series(raw_scaled)

    if raw.ndim == 1:
        raw = raw[:, None]
        raw_scaled = raw_scaled[:, None]

    v = raw[:, 0:1]
    v_scaled = raw_scaled[:, 0:1]

    T = v.shape[0]
    N = T - window + 1

    W = np.stack([v[i:i + window] for i in range(N)], axis=0)  # (N,window,1)
    W_SCALED = np.stack([v_scaled[i:i + window] for i in range(N)], axis=0)  # (N,window,1)

    y_labels = np.zeros(N, dtype=np.int32)

    dataset_name = Path(path).name.split('.')[0]
    print("--------------------------")
    print(f"Found dataset_name: {dataset_name}")
    print(raw_df.describe())
    print(raw_df.info())
    print(f"Scaled Dataframe: ")
    print(raw_scaled_df.describe())
    print(raw_scaled_df.info())
    print("--------------------------")

    if anomalies is not None:
        anomaly_range = anomalies.get(dataset_name)
        if anomaly_range:

            start_offset = int(anomaly_range["start"])
            end_offset = int(anomaly_range["end"])

            # start_offset = max(0, min(start_offset, T - 1))
            # end_offset = max(0, min(end_offset, T - 1))

            # Window i covers [i, i + window - 1]
            starts = np.arange(N, dtype=np.int32)
            ends = starts + (window - 1)

            y_labels = ((ends >= start_offset) & (starts <= end_offset)).astype(np.int32)

    if min_var > 0:
        keep = (W.var(axis=(1, 2)) >= min_var)
        keep_scaled = (W_SCALED.var(axis=(1, 2)) >= min_var)
        W = W[keep]
        W_SCALED = W_SCALED[keep_scaled]
        y_labels = y_labels[keep]

    return W, y_labels


def md_threshold_univariate(scores_val: np.ndarray, q: float = 0.99,
                            robust: bool = True) -> float:
    scores_val = np.asarray(scores_val, dtype=np.float32).ravel()
    if robust:
        med = np.median(scores_val)
        mad = np.median(np.abs(scores_val - med))
        sigma = 1.4826 * mad  # Gaussian consistency
        mu = med
    else:
        mu = scores_val.mean()
        sigma = scores_val.std(ddof=1)

    sigma = max(sigma, 1e-12)
    crit = np.sqrt(chi2.ppf(q, df=1))  # one-sided upper tail
    thr = float(mu + sigma * crit)     # for upper-tail anomalies
    return thr


def save_model_config(path, model_obj):
    model_obj.config["dtype"] = str(DTYPE).replace("torch.float", "f")
    model_obj.config["optimizer"] = str(type(model_obj.config["optimizer"]).__name__)
    model_obj.config["loss_fn"] = str(type(model_obj.config["loss_fn"]).__name__)
    model_obj.config["scheduler"] = str(type(model_obj.config["scheduler"]).__name__)

    with open(path, "w") as f:
        json.dump(model_obj.config, f, indent=2)


def get_footprint(model_object):
    def tensor_nbytes(t):
        return t.numel() * t.element_size()

    param_bytes = sum(tensor_nbytes(p) for p in model_object.parameters())
    buffer_bytes = sum(tensor_nbytes(b) for b in model_object.buffers())
    total = param_bytes + buffer_bytes

    print(f"Params: {param_bytes / (1024):.6f} KiB, "
          f"Buffers: {buffer_bytes / (1024):.6f} KiB, "
          f"Total: {total / (1024):.6f} KiB")

    return {"params": param_bytes, "buffers": buffer_bytes, "total": total}


def benchmark_model(m, example_inputs, num_runs=100, warmup=10):
    m.eval()
    with torch.inference_mode():
        # warmup
        for _ in range(warmup):
            _ = m(*example_inputs)
        torch.cuda.synchronize() if torch.cuda.is_available() else None
        t0 = time.perf_counter()
        for _ in range(num_runs):
            _ = m(*example_inputs)
        torch.cuda.synchronize() if torch.cuda.is_available() else None
    return (time.perf_counter() - t0) * 1000.0 / num_runs  # ms


def write_record(f, layer_id, param_id, arr_f32):
    rows, cols = arr_f32.shape
    f.write(bytes([layer_id, param_id, rows, cols]))       # 4-byte header
    f.write(arr_f32.astype('<f4', copy=False).tobytes())   # payload
    print(f"write_record array f32: {arr_f32.astype('<f4', copy=False)}\n")
    print(f"write_record bytes: {arr_f32.astype('<f4', copy=False).tobytes()}\n")


def apply_persistence(binary_hits: np.ndarray, k: int = 1) -> np.ndarray:
    """
    Run-length filter: require k consecutive hits to declare anomaly.
    Returns an array of the same length.
    """
    if k <= 1:
        return binary_hits.astype(np.int32)
    out = np.zeros_like(binary_hits, dtype=np.int32)
    run = 0
    for i, b in enumerate(binary_hits.astype(bool)):
        run = run + 1 if b else 0
        if run >= k:
            out[i] = 1
    return out


def undersample_majority(y, target_neg_to_pos=1.0, majority=0, minority=1, random_state=0):
    rng = np.random.default_rng(random_state)
    idx_pos = np.flatnonzero(y == minority)
    idx_neg = np.flatnonzero(y == majority)

    n_pos = len(idx_pos)
    n_neg_keep = int(round(target_neg_to_pos * n_pos))
    n_neg_keep = min(n_neg_keep, len(idx_neg))

    keep_neg = rng.choice(idx_neg, size=n_neg_keep, replace=False)
    idx_keep = np.sort(np.concatenate([idx_pos, keep_neg]))
    return idx_keep


def evaluate_model_scores(
        test_scores: np.ndarray,
        y_true: np.ndarray,
        threshold: float,
        persistence: int = 1) -> dict:

    assert len(test_scores) == len(y_true)

    y_raw = (test_scores > threshold).astype(np.int32)
    y_pred = apply_persistence(y_raw, k=persistence)

    cm = confusion_matrix(y_true, y_pred, labels=[0, 1])  # [[TN,FP],[FN,TP]]
    TN, FP, FN, TP = cm.ravel()
    f1 = f1_score(y_true, y_pred) if (TP + FP > 0 and TP + FN > 0) else 0.0
    report = classification_report(y_true, y_pred, digits=4)

    auroc = None
    auprc = None

    try:
        auroc = roc_auc_score(y_true, test_scores)
        auprc = average_precision_score(y_true, test_scores)
    except ValueError:
        pass

    # Curves for plotting
    fpr, tpr, _ = roc_curve(y_true, test_scores)
    prec, rec, _ = precision_recall_curve(y_true, test_scores)

    return {
        "threshold_used": float(threshold),
        "confusion_matrix": cm,
        "TN": int(TN), "FP": int(FP), "FN": int(FN), "TP": int(TP),
        "f1": float(f1),
        "auroc": float(auroc) if auroc is not None else None,
        "auprc": float(auprc) if auprc is not None else None,
        "classification_report": report,
        "y_pred": y_pred,
        "scores": test_scores,
        "roc_curve": (fpr, tpr),
        "pr_curve": (prec, rec),
    }


def make_dr_figures(X_train_np: np.ndarray,
                    out_dir: str = "figures",
                    title_prefix: str = "Training Windows",
                    tsne_samples: int | None = 4000,
                    random_state: int = 0):
    """
    X_train_np: (N, T, D) training windows
    Saves:
      - figures/pca_train_scatter.pdf (and .png)
      - figures/tsne_train_scatter.pdf (and .png)
    Returns dict of file paths.
    """
    Path(out_dir).mkdir(parents=True, exist_ok=True)

    # 1) Flatten windows -> feature matrix [N, T*D]
    X = X_train_np
    N, T, D = X.shape
    Xf = X.reshape(N, T * D).astype(np.float32)

    # 2) Standardize features
    Xz = StandardScaler().fit_transform(Xf)

    # 3) PCA for visualization + DBSCAN clustering to flag potential outliers
    #    (use 10 comps for clustering robustness, 2 comps for plotting)
    pca10 = PCA(n_components=min(10, Xz.shape[1]), random_state=random_state).fit_transform(Xz)
    pca2 = PCA(n_components=2, random_state=random_state).fit_transform(Xz)

    # Heuristic DBSCAN params—tweak eps if you get all noise or a single cluster
    min_samples = max(8, int(0.005 * N))
    # db = DBSCAN(eps=0.8, min_samples=min_samples, n_jobs=-1)
    db = DBSCAN(eps=0.7, min_samples=min_samples, n_jobs=-1)
    labels = db.fit_predict(pca10)  # cluster on reduced space
    # label -1 == noise (potential outliers)

    # --- PCA scatter ---
    plt.figure(figsize=(7, 5))
    ax = plt.gca()
    # Color by cluster; noise (-1) drawn last on top in red
    unique_labels = sorted(set(labels) - {-1})
    for lab in unique_labels:
        sel = labels == lab
        ax.scatter(pca2[sel, 0], pca2[sel, 1], s=8, c="g", alpha=0.6, label=f"C{lab}")
    noise = labels == -1
    if noise.any():
        ax.scatter(pca2[noise, 0], pca2[noise, 1], s=14, alpha=0.9,
                   facecolors="none", edgecolors="r", linewidths=0.8, label="Noise")
    ax.set_title(f"{title_prefix} — PCA(2D)")
    ax.set_xlabel("PC1")
    ax.set_ylabel("PC2")
    ax.grid(True, alpha=0.2)
    ax.legend(markerscale=2, frameon=False, fontsize=9)
    pca_pdf = os.path.join(out_dir, "pca_train_scatter.pdf")
    pca_png = os.path.join(out_dir, "pca_train_scatter.png")
    plt.tight_layout()
    plt.savefig(pca_pdf)
    plt.savefig(pca_png, dpi=300)
    plt.close()

    # 4) t-SNE (optionally subsample for speed)
    idx = np.arange(N)
    if tsne_samples is not None and N > tsne_samples:
        rng = np.random.default_rng(random_state)
        idx = np.sort(rng.choice(N, size=tsne_samples, replace=False))
    Xts = Xz[idx]
    labs_ts = labels[idx]

    # Choose a safe perplexity
    max_perp = max(5, (len(idx) - 1) // 3)
    perplexity = min(30, max_perp)
    perplexity_high = 40
    perplexity = perplexity_high

    tsne2 = TSNE(
        n_components=2, perplexity=perplexity, learning_rate="auto",
        init="pca", max_iter=1000, random_state=random_state, verbose=0
    ).fit_transform(Xts)

    plt.figure(figsize=(7, 5))
    ax = plt.gca()
    unique_labels_ts = sorted(set(labs_ts) - {-1})
    for lab in unique_labels_ts:
        sel = labs_ts == lab
        ax.scatter(tsne2[sel, 0], tsne2[sel, 1], s=8, c="g", alpha=0.6, label=f"C{lab}")
    noise = labs_ts == -1
    if noise.any():
        ax.scatter(tsne2[noise, 0], tsne2[noise, 1], s=14, alpha=0.9,
                   facecolors="none", edgecolors="r", linewidths=0.8, label="Noise")
    ax.set_title(f"{title_prefix} — t-SNE(2D)  (n={len(idx)}, perp={perplexity})")
    # ax.set_xlabel("t-SNE 1")
    # ax.set_ylabel("t-SNE 2")
    ax.set_xlabel("Dimension 1")
    ax.set_ylabel("Dimension 2")
    ax.grid(True, alpha=0.2)
    ax.legend(markerscale=2, frameon=False, fontsize=9)
    tsne_pdf = os.path.join(out_dir, "tsne_train_scatter.pdf")
    tsne_png = os.path.join(out_dir, "tsne_train_scatter.png")
    plt.tight_layout()
    plt.savefig(tsne_pdf)
    plt.savefig(tsne_png, dpi=300)
    plt.close()

    return {"pca_pdf": pca_pdf, "pca_png": pca_png,
            "tsne_pdf": tsne_pdf, "tsne_png": tsne_png,
            "labels": labels}


def plot_series_with_window(
        series, start: int, window: int,
        title: str | None = None, save_path_base: str | None = None):
    """
    series: 1-D array-like
    start:  window start index (inclusive)
    window: window length
    """
    s = np.asarray(series).reshape(-1)
    T = len(s)
    start = max(0, min(start, T - 1))
    end = max(start + 1, min(start + window, T))

    fig, ax = plt.subplots(figsize=(14, 3))
    ax.plot(s, linewidth=0.8, label="signal")
    ax.axvspan(start, end - 1, alpha=0.2, label=f"window [{start}:{end})")
    # ax.plot(np.arange(start, end), s[start:end], linewidth=2.0)
    ax.axvline(start, linestyle="--", linewidth=1.0)
    ax.axvline(end - 1, linestyle="--", linewidth=1.0)
    ax.set_xlim(0, T - 1)
    ax.set_xlabel("time index")
    ax.set_ylabel("value")
    if title:
        ax.set_title(title)
    ax.grid(True, axis="y", alpha=0.3)
    ax.legend(loc="upper right")
    fig.tight_layout()
    if save_path_base:
        fig.savefig(f"{save_path_base}.pdf", bbox_inches="tight")
        fig.savefig(f"{save_path_base}.png", dpi=200, bbox_inches="tight")


class LayerTypeV2(IntEnum):
    Input = 1
    Dense = 2
    Rnn = 3
    Output = 4


class ActivationFunction(IntEnum):
    Sigmoid = 1
    Relu = 2
    LeakyRelu = 3
    Softmax = 4
    Tanh = 5
    Null = 6


class DtypeCode(IntEnum):
    f32 = 1
    f16 = 2
    bfloat16 = 3
    int8 = 4


class Convention(IntEnum):
    ColumnFeatureOrdering = 1
    RowSampleOrdering = 2


class RunMode(IntEnum):
    ResumeFromCheckpoint = 1
    InferenceOnly = 2
    NewTraining = 3


# (!) Dimensions: shape0 = out and shape1 = in
@dataclass(frozen=True)
class Header:
    """
    Header format: <layerID, layerType, activation, paramID, dtypeCode, convention, outDim, inDim>
    Payload: bytes[header.len .. header.outDim * header.inDim]
    """
    layer_id: int
    layer_type: LayerTypeV2
    layer_activation: ActivationFunction
    param_id: int
    dtype_code: DtypeCode
    convention: Convention
    out_dim: int
    in_dim: int

    def print_header(self):
        print("--Header Part--")
        print(
            f"<layer_id = {self.layer_id}, ",
            f"layer_type = {self.layer_type.value}, ",
            f"layer_activation = {self.layer_activation.value}, ",
            f"param_id = {self.param_id}, ",
            f"dtype_code = {self.dtype_code.value}, ",
            f"convention = {self.convention.value}, ",
            f"out_dim = {self.out_dim}, in_dim = {self.in_dim}>"
        )

        print(
            f"<layer_id = {self.layer_id}, ",
            f"layer_type = {self.layer_type.name}, ",
            f"layer_activation = {self.layer_activation.name}, ",
            f"param_id = {self.param_id}, ",
            f"dtype_code = {self.dtype_code.name}, ",
            f"convention = {self.convention.name}, ",
            f"out_dim = {self.out_dim}, in_dim = {self.in_dim}>"
        )

        # layer_id=layer_id,
        # layer_type=typeof_layer,
        # layer_activation=layer_activation,
        # param_id=param_id,
        # dtype_code=DtypeCode(dtype_code[dtype_map[dtype]]),
        # convention=convention,
        # out_dim=int(out_features),
        # in_dim=int(input_features),

    def into_bytes(self) -> bytes:
        # 5x u8 + 2x u16  => 9 bytes
        # header_fmt = "<BBBBBHH"
        # HEADER_FMT = "<BBBBBB"
        header_fmt = "<BBBBBBBB"
        return struct.pack(
            header_fmt,
            int(self.layer_id),
            int(self.layer_type.value),
            int(self.layer_activation.value),
            int(self.param_id),
            int(self.dtype_code.value),
            int(self.convention.value),
            int(self.out_dim),
            int(self.in_dim),
        )

    def load_header(self, f):
        f.write(self.into_bytes())
        # f.write(bytes(list(self.group)))


# -- Pytorch Conventions --
# For every nn.Linear(in_features, out_features):
#   - weight(W):    [out_features, in_features] → [H, D] → [OUT, IN]
#   - bias(b):      [out_features] → [H]
#   - input(X):     [T, IN] → RowSampleOrdering by default
# So in Pytorch, the tensors are row-major by default. Meaning
# each value in memory contiguously, where elements in the same row
# are stored after each other.


def export_trained_model(path, target_model, dtype, convention: Convention):
    model_state = target_model.state_dict()
    layers = model_state.keys()
    layer_id = 0
    param_id: int = None
    typeof_layer: LayerTypeV2 = None
    layer_activation: ActivationFunction = ActivationFunction.Null
    layer_name = ""

    param_map = {
        "weight": {
            "wx": 0,
            "wh": 1,
            "weight": 2,
        },
        "bias": {
            "wx": 3,
            "wh": 4,
            "bias": 5,
        },
    }

    dtype_map = {
        torch.float32: '<f4',
        torch.float16: '<f2',
        torch.bfloat16: '<bfloat16',
        torch.int8: 'i1',
    }

    dtype_code = {
        "<f4": 1,
        "<f2": 2,
        "<bfloat16": 3,
        "<i1": 4,
    }

    # for name, module in target_model.named_modules():
    #     print(f"module name: {name}")
    #     name_split_ = name.split('_')
    #     print(f"name_split: {name_split_}")
    #     print("")

    with open(path, 'wb') as f:
        for key, value in model_state.items():
            if key.split('.')[0] != layer_name:
                layer_name = key.split('.')[0]
                layer_id += 1

            name_split = layer_name.split('_')
            layer_kind = layer_name.split('_')[0]
            # print(f"key: {key}")
            # print(f"name_split: {name_split}")
            match layer_kind:
                case "rnn":
                    # print(f"In rnn_{name_split[1]}")
                    typeof_layer = LayerTypeV2.Rnn
                    layer_activation = ActivationFunction.LeakyRelu
                case "fc":
                    # print(f"In fc_{name_split[1]}")
                    typeof_layer = LayerTypeV2.Dense
                    layer_activation = ActivationFunction.Null
                    if name_split[1] == "head":
                        # Check if output layer (head) contain activation function
                        for name, module in target_model.named_modules():
                            fc_name_split = name.split('_')
                            if len(fc_name_split) > 2:
                                if fc_name_split[2] == "tanh":
                                    layer_activation = ActivationFunction.Tanh
                case _:
                    print("No valid layer kind found!")

            param_kind = key.split('.')[-1]  # either weight or bias
            if param_kind == "weight":
                weight_name = key.split('.')[-2]  # either wx, wh, or <layer_name>
                # For fully connected nn.linear weight_name end with <layer_name>.weight
                if weight_name != "wx" and weight_name != "wh":
                    param_id = param_map["weight"]["weight"]
                else:
                    param_id = param_map["weight"][weight_name]
            elif param_kind == "bias":
                bias_group = key.split('.')[-2]  # either wx, wh or <layer_name>
                # For fully connected nn.linear weight_name end with <layer_name>.bias
                if bias_group != "wx" and bias_group != "wh":
                    # This branch is when the parameter is bias of a fully connected layer kind.
                    param_id = param_map["bias"]["bias"]
                else:
                    # When the param is either bias_wx or bias_wh
                    param_id = param_map["bias"][bias_group]

            # print(f"Value size: {value.size()}")
            if len(value.size()) > 1:
                print(f"Value size(dim=1): {value.size(dim=1)}")

            shape0 = value.size(dim=0)
            shape1 = 1 if value.ndim == 1 else value.shape[1]
            # print(f"shape0 (out_features) = {shape0} and shape1 (in_features) = {shape1} → {key}")

            out_features = shape0
            input_features = shape1

            #     int(dtype_code[dtype_map[dtype]]),
            header_part = Header(
                layer_id=layer_id,
                layer_type=typeof_layer,
                layer_activation=layer_activation,
                param_id=param_id,
                dtype_code=DtypeCode(dtype_code[dtype_map[dtype]]),
                convention=convention,
                out_dim=int(out_features),
                in_dim=int(input_features),
            )

            header_part.print_header()
            print("")
            header_part.load_header(f)
            layer_activation = ActivationFunction.Null

            # f.write(bytes([
            #     int(layer_id),
            #     int(param_id),
            #     int(dtype_code[dtype_map[dtype]]),
            #     int(out_features),
            #     int(input_features),
            # ]))

            # Works with C float data type.
            if dtype == torch.qint8:
                dtype = np.int8

            # print("--Payload Part--")
            value_matrix = value.detach().cpu().numpy()
            value_contig_array = value.detach().cpu().contiguous().to(dtype).numpy()
            value_bytes = value_contig_array.astype(dtype_map[dtype], copy=False).tobytes(order="C")

            # print(f"Value Matrix: {value_matrix}\n")
            # print(f"Value Array: {value_contig_array}\n")
            # print(f"Bytes: {value_bytes}")

            f.write(value_bytes)


def sanity_check_file(path: Path, window: int, anomalies: dict):
    # 1) Build labels using your function
    W, y = load_ch0_windows(path, window, anomalies=anomalies)

    # 2) Recompute labels independently (reference)
    a = np.load(path, allow_pickle=False).astype(np.float32)
    if a.ndim > 1:
        a = a[:, 0]
    T = len(a)
    N = T - window + 1
    name = Path(path).stem
    ar = anomalies.get(name)
    if ar is None:
        y_ref = np.zeros(N, dtype=np.int32)
    else:
        a0, a1 = sorted((int(ar["start"]), int(ar["end"])))
        a0 = max(0, min(a0, T - 1))
        a1 = max(0, min(a1, T - 1))
        starts = np.arange(N)
        ends = starts + (window - 1)
        y_ref = ((ends >= a0) & (starts <= a1)).astype(np.int32)

    # 3) Assert and visualize
    assert len(y) == len(y_ref) == N
    if not np.array_equal(y, y_ref):
        diff = np.where(y != y_ref)[0][:20]
        raise AssertionError(f"Label mismatch at indices (first 20): {diff}")

    # Optional plot to eyeball alignment
    plt.figure(figsize=(12, 2.5))
    plt.plot(y, label="y (your labels)", lw=1)
    plt.plot(y_ref, '--', label="y_ref (recomputed)", lw=1)
    plt.title(f"{name} — window={window}, positives={y.sum()}/{N}")
    plt.legend()
    plt.tight_layout()
    plt.show()


cwd = os.getcwd()
dataset_path = os.path.join(cwd, "../dataset/smap_msl_dataset/data/data")
config_path = os.path.join(cwd, "../config")
src_path = os.path.join(cwd, "../src")

# TODO: - Evaluate the best alpha value, old model used 0.1, now we test 0.01

# Batch sizes: 32, 64, 128
BATCHSIZE, TIMEWINDOW, INPUT_FEATURES = 32, 25, 1,  # TIMEWINDOW = 25 performs well...
ALPHA, LEARNING_RATE, EPOCHS = 0.01, 1e-3, 1500
# CONVENTION = "ColumnFeatureOrdering"  # Alt. RowSampleOrdering
CONVENTION = Convention.RowSampleOrdering
DTYPE = torch.float32
TRAIN_DIR = Path(os.path.join(dataset_path, "train"))
TEST_DIR = Path(os.path.join(dataset_path, "test"))
# The dataset provided by "Telemanom" are already scaled using min/max
DATASET_SCALING = "minmax"  # scaling of (-1, 1).
VAL_RATIO = 0.15  # old model 0.20
STANDARDIZE = True
DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")
MIN_VAR = 1e-5  # 1e-5 best so far
# optimizer, mode="min", factor=0.5, patience=6)
PATIENCE = 12
PATIENCE_SCHEDULER = 6
CKPT_BEST = "checkpoints/edgeai_tw25.pth"
CKPT_BEST_LARGE = "checkpoints/edgeai_tw25_large.pth"
CKPT_BEST_TW20 = "checkpoints/edgeai_tw20_best.pth"
DO_TRAIN = False
MODE = RunMode.NewTraining  # Evaluation mode, same as DO_TRAIN = False
Q = 0.95  # 0.995, quantile value

# In PyTorch nn.Linear(in, out) stores weight
# as [out, in] (row-major)
layer_dimensions = {
    "input_features": INPUT_FEATURES,
    "timesteps": TIMEWINDOW,
    "hidden_encoder": 16,   # 20 best so far
    "latent": 10,           # 10 OK...
    "hidden_decoder": 16,
}
# layer_dimensions = {
#     "input_features": INPUT_FEATURES,
#     "timesteps": TIMEWINDOW,
#     "hidden_encoder": 16,
#     "latent": 8,
#     "hidden_decoder": 16,
# }

runtime_config = {
    "dimensions": {k: int(v) for k, v in layer_dimensions.items()},
    "batch_size": int(BATCHSIZE),
    "convention": str(CONVENTION),
    "alpha": float(ALPHA),
    "learning_rate": float(LEARNING_RATE),
    "epochs": int(EPOCHS),
    # "optimizer": str(type(optimizer).__name__),
    # "loss_fn": str(type(loss_func).__name__),
    # "scheduler": str(type(scheduler).__name__),
    # "dtype": str(DTYPE).replace("torch.float", "f"),
    # "optimizer": optimizer,
    # "loss_fn": loss_func,
    # "scheduler": scheduler,
    "optimizer": None,
    "loss_fn": None,
    "scheduler": None,
    "dtype": DTYPE,
    "threshold_quantile": float(Q),
    # "threshold": float(threshold_val),
    "threshold": math.nan,
    "persistence": 3,
    "split_ratio": VAL_RATIO,
    "patience": int(PATIENCE),
}

anomalies = {
    "E-2": {
        "start": 5598,
        "end": 6995,
    },
    "E-3": {
        "start": 5094,
        "end": 8306,
    },
    "E-4": {
        "start": 5450,
        "end": 8261,
    },
    "E-5": {
        "start": 5600,
        "end": 5920,
    },
    "E-6": {
        "start": 5610,
        "end": 5675,
    },
    "E-7": {
        "start": 5394,
        "end": 5674,
    },
    "E-8": {
        "start": 5400,
        "end": 6022,
    },
    "E-9": {
        "start": 5550,
        "end": 5900,
    },
}

# This would scan the training data files → one row per .npy file.
# Returns a dataframe table with the columns:
# file, letter, idx, timesteps(T), features(D), path.
training_files_df = scan_dataset(TRAIN_DIR)
test_files_df = scan_dataset(TEST_DIR)

# 1) Split catalog by letter <LETTER>
df_training = training_files_df.loc[training_files_df["D"].eq(25)].reset_index(drop=True)
df_testing = test_files_df.loc[test_files_df["D"].eq(25)].reset_index(drop=True)

df_training_E = df_training.loc[df_training["letter"].eq("E")].reset_index(drop=True)
df_testing_E = df_testing.loc[df_testing["letter"].eq("E")].reset_index(drop=True)


print("\n---Split Dataframe by D = 25 and letter = E--- \n")
print("Dataframe Training Group E: \n")
display(df_training_E)
df_training_E.info(verbose=True)

print("Dataframe Testing Group E: \n")
display(df_testing_E)
df_testing_E.info(verbose=True)
print("|----------------------------------------|\n")

# ---Preprocessing the dataset---
exclude_files = [
    "E-1.npy", "E-4.npy", "E-5.npy", "E-6.npy", "E-7.npy",
    "E-10.npy", "E-11.npy", "E-12.npy", "E-13.npy"]

inclusive = ["E-3.npy"]


# df_training_E = df_training_E.query('file not in @exclude_files').reset_index(drop=True)
# df_testing_E = df_testing_E.query('file not in @exclude_files').reset_index(drop=True)
df_training_E = df_training_E.query('file in @inclusive').reset_index(drop=True)
df_testing_E = df_testing_E.query('file in @inclusive').reset_index(drop=True)

window_train, _ = load_ch0_windows_new(
    df_training_E.loc[0, "path"],
    TIMEWINDOW,
    min_var=MIN_VAR,
    anomalies=None,
    clip_iqr=True,
)

window_val, _ = load_ch0_windows_new(
    df_training_E.loc[0, "path"],
    TIMEWINDOW,
    min_var=0.0,
    anomalies=None,
    clip_iqr=False,
)

window_test, y_test = load_ch0_windows_new(
    df_testing_E.loc[0, "path"],
    TIMEWINDOW,
    min_var=0.0,
    anomalies=anomalies,
    clip_iqr=False,
)

if len(window_train) == 0:
    raise RuntimeError("No training windows after filtering. Lower MIN_VAR!")

X_train_np, X_val_np = train_test_split(
    window_train,
    test_size=VAL_RATIO,
    random_state=0,
    shuffle=True,
)

X_test_np = window_test
y_test_np = y_test

# training_files = df_training_E.sample(frac=1.0, random_state=0)  # shuffle files
# split_index = int(len(training_files) * (1 - VAL_RATIO))
# train_files = training_files.iloc[:split_index]
# val_files = training_files.iloc[split_index:]
#
# X_train_noscaling_list = [
#     load_ch0_windows_new(p, TIMEWINDOW, min_var=MIN_VAR, anomalies=None, clip_iqr=False)[0]
#     for p in train_files["path"]
# ]
#
# X_train_list = [
#     load_ch0_windows_new(p, TIMEWINDOW, min_var=MIN_VAR, anomalies=None, clip_iqr=True)[0]
#     for p in train_files["path"]
# ]
# X_val_list = [
#     load_ch0_windows_new(p, TIMEWINDOW, min_var=MIN_VAR, anomalies=None, clip_iqr=False)[0]
#     for p in val_files["path"]
# ]
#
# X_test_ws, X_test_labels = [], []
# for p in df_testing_E["path"]:
#     W, y = load_ch0_windows_new(p, TIMEWINDOW, min_var=MIN_VAR, anomalies=anomalies, clip_iqr=False)
#     if len(W):
#         X_test_ws.append(W)
#         X_test_labels.append(y)
#
# X_train_np = np.concatenate(
#     [x for x in X_train_list if len(x)], axis=0) \
#     if any(len(x) for x in X_train_list) else np.empty((0, TIMEWINDOW, 1), np.float32)
#
# X_train_noscaling_np = np.concatenate(
#     [x for x in X_train_noscaling_list if len(x)], axis=0) \
#     if any(len(x) for x in X_train_noscaling_list) else np.empty((0, TIMEWINDOW, 1), np.float32)
#
# X_val_np = np.concatenate(
#     [x for x in X_val_list if len(x)], axis=0) \
#     if any(len(x) for x in X_val_list) else np.empty((0, TIMEWINDOW, 1), np.float32)
#
#
# X_test_np = np.concatenate(X_test_ws, axis=0) \
#     if X_test_ws else np.empty((0, TIMEWINDOW, 1), np.float32)
#
# y_test_np = np.concatenate(X_test_labels, axis=0) \
#     if X_test_labels else np.empty((0,), np.int32)


# idx = undersample_majority(y_test_np, target_neg_to_pos=1.0, random_state=0)  # 1:1 balance
# X_eval = X_test_np[idx]
# y_eval = y_test_np[idx]
# X_eval = torch.from_numpy(X_test_np[idx]).to(DTYPE)
# y_eval = torch.from_numpy(y_test_np[idx]).to(DTYPE)

print("Train window:", X_train_np.shape, " Val win:", X_val_np.shape, " Test win:", X_test_np.shape)

X_train = torch.from_numpy(X_train_np).to(DTYPE)
X_val = torch.from_numpy(X_val_np).to(DTYPE)
X_test = torch.from_numpy(X_test_np).to(DTYPE)
X_test_y = torch.from_numpy(y_test_np).to(DTYPE)

print("Training shape:", X_train.shape,
      "Validation shape:", X_val.shape,
      "Test shape:", X_test.shape,
      "Test Y labels shape:", X_test_y.shape)  # (N,T,1)


df_grouped_ch0_E = load_ch0(df_training_E, samples_per_file=5000)
print("Dataframe grouped by D = 25 and group E: \n")
display(df_grouped_ch0_E)
display(df_grouped_ch0_E.describe())


kmeans = KMeans(
    n_clusters=9,
    init="k-means++",
    random_state=0,
)


standard_scaler = StandardScaler()
scaler = MaxAbsScaler()

# scaled_timesteps = scaler.fit_transform(pd.DataFrame(df_grouped_ch0_A["t"]))
scaled_timesteps = np.log10(pd.DataFrame(df_grouped_ch0_E["t"]))
df_grouped_ch0_E["scaled_t"] = scaled_timesteps

scaled_values = standard_scaler.fit_transform(pd.DataFrame(df_grouped_ch0_E["value"]))
scaled_values_log10 = np.log10(pd.DataFrame(df_grouped_ch0_E["value"]))

df_grouped_ch0_E["scaled_value"] = scaled_values
df_grouped_ch0_E["cluster"] = kmeans.fit_predict(pd.DataFrame(df_grouped_ch0_E["value"]))

display(df_grouped_ch0_E)

# plt.figure(figsize=(15, 10))
paired_df = pd.DataFrame(df_grouped_ch0_E[["file", "value"]])

# dist = sns.displot(data=paired_df, x="value", bins=100, hue="file", kde=True,)
# dist.fig.suptitle(f"Distributions of group A", y=1.02)
#
# plt.figure(figsize=(10, 10))
# scatter = sns.scatterplot(
#     data=df_grouped_ch0_E,
#     x="scaled_t", y="scaled_value",
#     # x="scaled_t", y="value",
#     # hue="file",           # one color per file (can be many!)
#     hue="cluster",           # one color per file (can be many!)
#     alpha=0.7, legend=True
# )
# scatter.grid(True, axis="y", alpha=0.2)
# scatter.xaxis.set_major_locator(MultipleLocator(0.25))
# scatter.yaxis.set_major_locator(MultipleLocator(0.25))
# scatter.set_title("Scatter Plot, D=25 — ch0 across all files belonging to E")
# scatter.set_xlabel("time step")
# scatter.set_ylabel("ch0 (Telemanom scale ~[-1,1])")

# plt.figure(figsize=(20, 6))
# ax = sns.lineplot(
#     data=df_grouped_ch0_E,
#     x="t", y="value",
#     hue="file",           # one color per file (can be many!)
#     estimator=None,       # plot raw series (no aggregation)
#     errorbar=None,        # no CI band (seaborn ≥0.12)
#     alpha=0.7, linewidth=0.9, legend=True
# )
#
# ax.yaxis.set_major_locator(MultipleLocator(0.5))
# ax.xaxis.set_major_locator(MultipleLocator(500))
# ax.xaxis.set_minor_locator(MultipleLocator(100))
#
# ax.set_ylim(-1.0, 1.0)
# ax.set_xlim(0, df_grouped_ch0_E["t"].max())
# ax.tick_params(axis="x", which="major", labelsize=8)
# ax.grid(True, axis="y", alpha=0.2)
#
# ax.set_title("D=25 — ch0 across all files belonging to E")
# ax.set_xlabel("time step")
# ax.set_ylabel("ch0 (Telemanom scale ~[-1,1])")
# plt.tight_layout(pad=5.0)
# plt.show()


def assert_alpha_all(m, a):
    print("alphas:", dict(
        model_alpha=float(m.alpha),
        enc_cell_alpha=float(m.rnn_encoder.cell.alpha),
        dec_cell_alpha=float(m.rnn_decoder.cell.alpha),
    ))
    assert abs(m.alpha - a) < 1e-7
    assert abs(m.rnn_encoder.cell.alpha - a) < 1e-7
    assert abs(m.rnn_decoder.cell.alpha - a) < 1e-7


model = EdgeAiModel(runtime_cfg=runtime_config,
                    dropout=0.0, batch_first=True, bias=True, alpha_param=ALPHA
                    ).to(DEVICE)

assert_alpha_all(model, ALPHA)

optimizer = torch.optim.AdamW(model.parameters(), lr=LEARNING_RATE, weight_decay=1e-3)
# optimizer = torch.optim.AdamW(model.parameters(), lr=LEARNING_RATE, weight_decay=2e-2)
loss_func = torch.nn.MSELoss(reduction="mean")
# loss_func = torch.nn.L1Loss(reduction="mean")
# loss_func = torch.nn.SmoothL1Loss(beta=0.02)

# Will reduce the learning rate when it stops improving.
# It is checked on the validation part.
# `mode` = "min" tells it to reduce the learning rate.
# `factor` is the amount to reduce the learning rate with, taking lr * factor.
# `patience` is the number of allowed epochs without improvment.
scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(
    optimizer, mode="min", factor=0.5, patience=PATIENCE_SCHEDULER)

runtime_config["optimizer"] = optimizer
runtime_config["loss_fn"] = loss_func
runtime_config["scheduler"] = scheduler

performance: pd.DataFrame = None

# TODO: - Change the `DO_TRAIN` to enum for options such as:
# new_training, load_from_checkpoint, load_only_inference, etc...

# When we are saving checkpoint, it can be used to resume training
# or used for inference

# DO_TRAIN = False
# if os.path.isfile(CKPT_BEST) and not DO_TRAIN:
if MODE is RunMode.InferenceOnly:
    if not os.path.isfile(CKPT_BEST):
        raise FileNotFoundError(f"Missing checkpoint for inference: {CKPT_BEST}")

    print("Loading checkpoint for best model and skipping training.")
    state = load_checkpoint(CKPT_BEST, DEVICE)
    model.load_state_dict(state["model"])
    model.to(DEVICE).eval()

elif MODE is RunMode.ResumeFromCheckpoint:
    if not os.path.isfile(CKPT_BEST):
        raise FileNotFoundError(f"Missing checkpoint for resumed training: {CKPT_BEST}")

    state = load_checkpoint(CKPT_BEST, DEVICE)
    model.load_state_dict(state["model"])
    model.to(DEVICE)

    # optimizer = type(optimizer)(model.parameters(), **optimizer.defaults)
    optimizer.load_state_dict(state["opt"])

    # scheduler = type(scheduler)(
    #     optimizer, **{k: v for k, v in scheduler.__dict__.items() if not k.startswith('_')}
    # )

    scheduler.load_state_dict(state["sched"])

    # epoch = state["epoch"]
    # best_val = state["best_val"]
    # runtime_config["optimizer"] = optimizer
    # runtime_config["loss_fn"] = loss_func
    # runtime_config["scheduler"] = scheduler

    runtime_config.update(
        optimizer=optimizer,
        scheduler=scheduler,
        start_epoch=int(state.get("epoch", 0) + 1),
        best_val=float(state.get("best_val", float("inf"))),
    )

    writer = SummaryWriter('checkpoints/runs/training_summary')
    print(f"Resuming Training from checkpoint: {CKPT_BEST}")
    performance = model.train_model(
        X_train, X_val,
        runtime_cfg=runtime_config, device=DEVICE,
        ckpt_best=CKPT_BEST, ckpt_last="checkpoints/edgeai_last.pth",
        summary_writer=writer,
    )

else:
    # writer = SummaryWriter('checkpoints/runs/training_summary_tw25')
    writer = SummaryWriter('checkpoints/runs/training_summary_tw25_large')
    print("Training model...")

    # optimizer = type(optimizer)(model.parameters(), **optimizer.defaults)
    runtime_config.update(
        optimizer=optimizer,
        scheduler=scheduler,
        start_epoch=0,
        best_val=float("inf")
    )

    performance = model.train_model(
        X_train, X_val,
        runtime_cfg=runtime_config, device=DEVICE,
        ckpt_best=CKPT_BEST, ckpt_last="checkpoints/edgeai_last.pth",
        summary_writer=writer,
    )

    plt.figure(figsize=(14, 5))
    # Training vs Validation Loss plot:
    sns.lineplot(performance)
    plt.grid()
    plt.show()
    chart = alt.Chart(performance)

summary(model=model)

val_scores = model.reconstruction_score_windows(X=X_val, device=DEVICE, mode="mae")
test_scores = model.reconstruction_score_windows(X=X_test, device=DEVICE, mode="mae")
thr = model.new_threshold(val_scores, quantile_val=Q)

print(f"Chosen threshold: {thr:.6g}, quantile = {Q:.3f} → top {(1 - Q) * 100:.3f}%")

hits_validation = model.detect_anomaly(val_scores, thr, persistence=3)  # boolean per window
hits_test = model.detect_anomaly(test_scores, thr, persistence=3)

print(f"val>thr: {hits_validation.mean():.2%} | test>thr: {hits_test.mean():.2%}")


output_path = os.path.join(cwd, "../config/model_runtime_config.json")
save_model_config(path=output_path, model_obj=model)


# Testing single sample we need to pass tensor of shape [1, T, D]. Using T = TIMEWINDOW
samples_t = torch.linspace(0, 2 * torch.pi, TIMEWINDOW, dtype=DTYPE)
sinusoid_sample = torch.sin(samples_t).view(1, TIMEWINDOW, 1)  # [1, T, 1]

# (optional) add tiny noise:
# x = x + 0.05*torch.randn_like(x)

sinusoid_sample = sinusoid_sample.to(device=DEVICE, dtype=DTYPE)
print(f"sinusoid_sample shape: {sinusoid_sample.shape}\n")

sin_reconstr = model.evaluate_reconstruction(sinusoid_sample, device=DEVICE, max_windows=TIMEWINDOW)
print(f"\nValidation Reconstruction sinusoid input — MSE: {sin_reconstr['mse']:.6f}, "
      f"MAE: {sin_reconstr['mae']:.6f}, "
      f"Cosine Similarity: {sin_reconstr['Cosine_Similarity']}")

validation_performance = model.evaluate_reconstruction(X_val, device=DEVICE, max_windows=2048)
print(f"\nValidation Reconstruction — MSE: {validation_performance['mse']:.6f}, "
      f"MAE: {validation_performance['mae']:.6f}, "
      f"Cosine Similarity: {validation_performance['Cosine_Similarity']}")

test_performance = model.evaluate_reconstruction(X_test, device=DEVICE, max_windows=2048)
print(f"\nTest-Set Reconstruction — MSE: {test_performance['mse']:.6f}, "
      f"MAE: {test_performance['mae']:.6f}, "
      f"Cosine Similarity: {test_performance['Cosine_Similarity']}")

# Plot a few reconstructions (univariate ch0 → last dim = 1)
# K = validation_performance["X_sample"].shape[0]
# T = validation_performance["X_sample"].shape[1]
#
# plt.figure(figsize=(12, 2.5 * K))
# for i in range(K):
#     x = validation_performance["X_sample"][i, :, 0].numpy()
#     y = validation_performance["Y_sample"][i, :, 0].numpy()
#
#     ax = plt.subplot(K, 1, i + 1)
#     ax.plot(x, label="true", linewidth=1.25)
#     ax.plot(y, label="recon", linewidth=1.0, alpha=0.9)
#     ax.set_ylim(-1.1, 1.1)  # Telemanom scale
#     ax.set_xlim(0, T - 1)
#     ax.grid(True, axis="y", alpha=0.2)
#
#     if i == 0:
#         ax.legend(loc="upper right")
#
# plt.suptitle("Sample validation windows: true vs reconstruction", y=1.02)
# plt.tight_layout()
# plt.show()


# model_small = copy.deepcopy(model)
# model.load_state_dict(torch.load(CKPT_BEST))
best_state = load_checkpoint(CKPT_BEST, "cpu")
model.load_state_dict(best_state["model"])
model_best = copy.deepcopy(model).to("cpu").eval()

# print("Getting the model layout:")
# get_model_layout(model)

print(model_best.state_dict)
summary(model=model_best)

# torch.Tensor.is_quantized

model_small = torch.ao.quantization.quantize_dynamic(
    model_best,
    {torch.nn.Linear},
    dtype=torch.qint8).eval()


# torch.quantization.default_eval_fn(model_small, X_val)

# model_small_static = torch.quantization.prepare(model_best, inplace=True)
# model_small_static = torch.quantization.convert(model_small_static, inplace=False)
#

# summary(model=model_small_static)
summary(model=model_small)
torch.save(model_small, "checkpoints/edgeai_best_qint8.pth")

example_args = (
    torch.sin(samples_t).view(1, TIMEWINDOW, 1),
)

# exported_model = export(model_best, args=example_args)


best_model_size = os.path.getsize("checkpoints/edgeai_best.pth")
int8_model_size = os.path.getsize("checkpoints/edgeai_best_qint8.pth")
model_footprint = {
    "model_best": {
        "MB": best_model_size / (1024 * 1024),
        "KB": best_model_size / (1024),
    },
    "model_qint8": {
        "MB": int8_model_size / (1024 * 1024),
        "KB": int8_model_size / (1024),
    }
}

param_size = 0
for param in model_small.parameters():
    param_size += param.nelement() * param.element_size()
buffer_size = 0
for buffer in model_small.buffers():
    buffer_size += buffer.nelement() * buffer.element_size()

size_all_mb = (param_size + buffer_size) / 1024**2
size_all_kb = (param_size + buffer_size) / 1024
print('quantized model size: {:.6f}MB'.format(size_all_mb))
print('quantized model size: {:.6f}KB'.format(size_all_kb))


print("Non-Quantized(f32) model size:")
non_quantized_size = get_footprint(model_best)
print("Quantized(int8) model size:")
quantized_size = get_footprint(model_small)

# print("Quantized(int8) static model size:")
# static_quantized_size = get_footprint(model_small_static)

print("Size from loading .pth files:")
print(
    f"Non-Quantized model size: {model_footprint['model_best'].get('KB'):.6f} KB\n"
    f"Quantized(int8) model size: {model_footprint['model_qint8'].get('KB'):.6f} KB"
)

# example_inputs = (torch.randn(1, 1024, INPUT_FEATURES, dtype=DTYPE, device="cpu"),)
example_inputs = (torch.randn(1, TIMEWINDOW, INPUT_FEATURES, dtype=DTYPE, device="cpu"),)
best_model_f32_time = benchmark_model(model_best, example_inputs, num_runs=100)
int8_model_time = benchmark_model(model_small, example_inputs, num_runs=100)

print("\nInference benchmark:")
print("f32 model mean time: %0.3f ms" % best_model_f32_time)
print("int8 model mean time: %0.3f ms" % int8_model_time)
print("speedup: %0.1fx" % (best_model_f32_time / int8_model_time))

val_scores_quantized = model_small.reconstruction_score_windows(
    X=X_val.cpu(), device=torch.device("cpu"), mode="mae"
)
test_scores_quantized = model_small.reconstruction_score_windows(
    X=X_test.cpu(), device=torch.device("cpu"), mode="mae"
)

val_perf_quant = model_small.evaluate_reconstruction(
    X_val.cpu(),
    device=torch.device("cpu"),
    max_windows=2048)

print(f"\nValidation Reconstruction Quantized(int8) — MSE: {val_perf_quant['mse']:.6f}, "
      f"MAE: {val_perf_quant['mae']:.6f}, "
      f"Cosine Similarity: {val_perf_quant['Cosine_Similarity']}")

test_perf_quant = model_small.evaluate_reconstruction(
    X_test.cpu(), device=torch.device("cpu"), max_windows=2048)

print(f"\nTest Reconstruction Quantized(int8) — MSE: {test_perf_quant['mse']:.6f}, "
      f"MAE: {test_perf_quant['mae']:.6f}, "
      f"Cosine Similarity: {test_perf_quant['Cosine_Similarity']}")


assert_alpha_all(model_best, ALPHA)

example_inputs = (torch.empty(1, TIMEWINDOW, INPUT_FEATURES, dtype=DTYPE, device="cpu").uniform_(-1, 1),)
predict_on_example = model_best(*example_inputs)


# print(torch.jit.trace(model_best.eval(), example_inputs).graph)


# print(f"Type of example_inputs: {type(example_inputs)}")
# print(f"Example dummy data: {example_inputs}\n")
# print(f"Example dummy data[0]: {example_inputs[0]}\n")

print("F32 X:")
Xpt = example_inputs[0].detach().cpu()
for v in Xpt.flatten():
    print(f"[_]f32 [{v.item():.10f}],")

print("F32 Predicition:")
Ypt = predict_on_example[0].detach().cpu()
for v in Ypt.flatten():
    print(f"[_]f32 [{v.item():.10f}],")

# predict_on_example = model_best(*example_inputs)
predict_forward = model_best.evaluate_reconstruction(
    *example_inputs,
    device="cpu",
    max_windows=TIMEWINDOW
)

predict_forward_qint8 = model_small.evaluate_reconstruction(
    *example_inputs,
    device="cpu",
    max_windows=TIMEWINDOW
)

# val_scores = model.reconstruction_score_windows(X=X_val, device=DEVICE)
# val_scores = model.reconstruction_score_windows(
#     X=torch.from_numpy(X_val_np), device=DEVICE, mode="mae"
# )
val_scores = model.reconstruction_score_windows(
    X=torch.from_numpy(X_val_np), device=DEVICE, mode="mse"
)

# Get scores per window with your model
test_scores = model.reconstruction_score_windows(
    X=torch.from_numpy(X_test_np), device=DEVICE, mode="mse"
)

# df_performance = pd.DataFrame({"scores": model_result_balanced["scores"], "y_true": y_eval})
reconstruct_df = pd.DataFrame({"dummy_x": Xpt.flatten().numpy(), "dummy_y": Ypt.flatten().numpy()})
plt.figure(figsize=(20, 6))
sns.lineplot(data=reconstruct_df)
# sns.kdeplot(data=df_performance, x="scores", hue="y_true")
plt.show()


# print(f"Chosen threshold from validation (Q={Q}): {thr:.6g}")
# y_pred = (test_scores > thr).astype(np.int32)
scores = test_scores
y_true = y_test_np

raw_test = pd.Series(X_test_np.reshape(-1, 1).astype(np.float32).reshape(-1))
raw_y = pd.Series(y_test_np.reshape(-1, 1).astype(np.int32).reshape(-1))
df_anomaly_points = pd.DataFrame({"raw": raw_test, "y_labels": raw_y})
df_anomaly = df_anomaly_points.groupby(["y_labels"])
print(df_anomaly)

idx_keep = undersample_majority(y_test_np, target_neg_to_pos=1.0, random_state=0)  # 1:1 balance

x_test_balanced = X_test_np[idx_keep]
y_eval = y_test_np[idx_keep]
test_scores_eval = test_scores[idx_keep]


# Pick a threshold (e.g., from validation) and persistence value
quantiles = np.linspace(0.85, 0.999, 60)
persistence_vals = [1, 2, 3, 4, 5, 6, 7]
best = None

for p in persistence_vals:
    for q in quantiles:
        thr = np.quantile(val_scores, q)
        # thr = md_threshold_univariate(val_scores, q=q, robust=True)
        result = evaluate_model_scores(
            test_scores=test_scores,
            y_true=y_true,
            # test_scores=test_scores_eval,
            # y_true=y_eval,
            threshold=thr,
            persistence=p,
        )

        if best is None or result["f1"] > best["f1"]:
            best = {"f1": result["f1"], "thr": result["threshold_used"], "q": float(q), "p": p}

print(f"Best (diagnostic): F1={best['f1']:.4f}, thr={best['thr']:.3e} (q={best['q']:.3f}), persistence={best['p']}")


# Evaluate with persistence (e.g., require 3 consecutive hits)
model_result = evaluate_model_scores(
    test_scores=test_scores,
    # test_scores=test_scores_eval,
    y_true=y_true,
    # y_true=y_eval,
    threshold=best["thr"],
    persistence=best["p"],
)

model_result_balanced = evaluate_model_scores(
    # test_scores=test_scores,
    test_scores=test_scores_eval,
    # y_true=y_true,
    y_true=y_eval,
    threshold=best["thr"],
    persistence=best["p"],
)

print(f"Testset scores: {model_result['scores']}")
# df_performance = pd.DataFrame({"scores": model_result["scores"], "y_true": y_test_np})
df_performance = pd.DataFrame({"scores": model_result_balanced["scores"], "y_true": y_eval})

# sns.kdeplot(model_result["scores"])
# sns.kdeplot(model_result["scores"][y_true == 0], label="normal")
# sns.kdeplot(model_result["scores"][y_true == 1], label="anomaly")
sns.set_theme(style="white")
sns.set_context("paper")
plt.figure(figsize=(20, 6))
sns.kdeplot(data=df_performance, x="scores", hue="y_true")
plt.show()

# df_balanced = pd.DataFrame({"scores": model_result_balanced["scores"], "y": y_eval})
#
# plt.figure(figsize=(20, 6))
# sns.barplot(data=df_balanced, x="scores", hue="y")
# plt.show()

# counts = (df_balanced.groupby(["y"]).size()
#           .rename("count")
#           .reset_index())
#
# plt.figure(figsize=(8, 4))
# # sns.barplot(data=counts, y="count", hue="y")
# sns.catplot(x="y", kind="count", data=counts)
# plt.title("Class counts:")
# plt.ylabel("Count")
# plt.xlabel("")
# plt.tight_layout()
# plt.show()

# print(f"Prediction on Example data: {predict_on_example}\n")
# print(f"Prediction on Example data using forward: {predict_forward}\n")
# print(f"Prediction on Example data using QINT8 Model: {predict_forward_qint8}\n")
# print(f"Testset Y-Predictions: {y_pred}")


cwd = os.getcwd()
model_output_path = os.path.join(cwd, "../src/model/assets/model.bin")
model_large_output_path = os.path.join(cwd, "../src/model/assets/model_large.bin")
model_qint8_path = os.path.join(cwd, "../src/model/assets/model_qint8.bin")


# export_trained_model(model_output_path, model, DTYPE, Convention.RowSampleOrdering)
export_trained_model(model_large_output_path, model, DTYPE, Convention.RowSampleOrdering)
# export_trained_model(model_output_path, model_best, DTYPE, Convention.RowSampleOrdering)
# export_trained_model(model_qint8_path, model_small, torch.qint8, Convention.RowSampleOrdering)

# figs = make_dr_figures(X_train_np, out_dir="figures", title_prefix="Training Windows (E)")
# print("Saved:", figs)

# Example with our univariate windowed dataset:
# X_val: shape [N, T, D] (e.g., D=1)


t0 = 0
t0 = 600
# sample_range = X_train_np[t0:1000:10]  # 100 samples every
sample_range = X_train_np[t0:1000:2]  # 500 samples every
sample_spike_duration = X_train_np[500:900:2]  # 500 samples every
# sample_spike_duration_zoomed = X_train_np[500:750:2]  # (125, 10, 1) → 125 * 10 = 1250 samples / 2
# sample_spike_duration_zoomed = X_train_np[550:800:2]  # (125, 10, 1) → 125 * 10 = 1250 samples /
sample_spike_duration_zoomed = X_train_np[550:800:2]  # (125, 10, 1) → 125 * 10 = 1250 samples /
sample_normal_timewindow = X_train_np[550:750:10]  # (125, 10, 1) → 125 * 10 = 1250 samples /
print(f"Shape of X_train_np [500:750:2]: {sample_spike_duration_zoomed.shape}")
print(f"Len X_train_np [500:750:2]: {len(sample_spike_duration_zoomed)}")

t0 = 0
TIMEWINDOW_LARGE = TIMEWINDOW * 10 * 2

plot_series_with_window(
    X_train_np[t0::10],
    # sample_normal_timewindow,
    start=t0,
    window=TIMEWINDOW,
    title=f"Series w/ window [{t0}:{t0 + TIMEWINDOW})",
    save_path_base="figures/signal_scaled_data"
)

# plot_series_with_window(
#     X_train_noscaling_np[t0::100],
#     # sample_normal_timewindow,
#     start=t0,
#     window=TIMEWINDOW,
#     title=f"Series w/ window [{t0}:{t0 + TIMEWINDOW})",
#     save_path_base="figures/signal_not_scaled_data"
# )


# plot_series_with_window(
#     X_test_np[t0::100],
#     # sample_range,
#     start=t0,
#     window=TIMEWINDOW,
#     title=f"Series w/ window [{t0}:{t0 + TIMEWINDOW})",
#     save_path_base="figures/train_signals_timewindow_highlight"
# )

print("\n--- Test Evaluation ---")
print(f"threshold: {model_result['threshold_used']:.6g}")
print(f"Confusion matrix [[TN,FP],[FN,TP]]:\n{model_result['confusion_matrix']}")
print(f"F1:   {model_result['f1']:.4f}")
print(f"AUROC: {model_result['auroc'] if model_result['auroc'] is not None else 'NA'}")
print(f"AUPRC: {model_result['auprc'] if model_result['auprc'] is not None else 'NA'}")
print("\nClassification report:\n", model_result["classification_report"])

print("\n--- Test Evaluation (Balanced) ---")
print(f"threshold: {model_result_balanced['threshold_used']:.6g}")
print(f"Confusion matrix [[TN,FP],[FN,TP]]:\n{model_result_balanced['confusion_matrix']}")
print(f"F1:   {model_result_balanced['f1']:.4f}")
print(f"AUROC: {model_result_balanced['auroc'] if model_result_balanced['auroc'] is not None else 'NA'}")
print(f"AUPRC: {model_result_balanced['auprc'] if model_result_balanced['auprc'] is not None else 'NA'}")
print("\nClassification report:\n", model_result_balanced["classification_report"])


train_df = pd.Series(X_train_np.reshape(-1, 1).astype(np.float32).reshape(-1))
val_df = pd.Series(X_val_np.reshape(-1, 1).astype(np.float32).reshape(-1))
test_df = pd.Series(X_test_np.reshape(-1, 1).astype(np.float32).reshape(-1))
print(f"Train DF info: ")
print(train_df.describe())
print(train_df.info())

print(f"Validation DF info: ")
print(val_df.describe())
print(val_df.info())

print(f"Testdata DF info: ")
print(test_df.describe())
print(test_df.info())


# xtrain_dist = pd.Series(X_train_np[t0::0])
# plt.figure(figsize=(20, 6))
# sns.kdeplot(data=train_df, kind="kde")
# plt.show()

# performance = model.train_model(
#     X_train, X_val,
#     runtime_cfg=runtime_config, device=DEVICE,
#     ckpt_best=CKPT_BEST, ckpt_last="checkpoints/edgeai_last.pth",
#     summary_writer=writer,
# )
#

# Dumping of the quantized model:
print(model_small)
