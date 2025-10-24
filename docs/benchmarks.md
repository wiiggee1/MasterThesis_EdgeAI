### Inference + Compile Optimizations: 

Modes available: Debug , ReleaseSafe , ReleaseFast and ReleaseSmall
Loaded Model Size: 3.875000 KiB

**Benchmark test - inference on one window(T = 10)**: 

- Debug: 

[warn] : Inference Benchmark Performance:
[info] :        Inference - CPU:
                ΔTime = 133683.940µs
                Δmcyle = 2138943
                Δminstret = 1123704
                IPC (Δminstret / Δmcyle) = 0.525
[info] :        Inference - Stack report: Used = 32768 / 32768 bytes (0 free bytes)

Stack utilization(%) in Debug: Undetermined, might clobber the stack and enter the not used heap region. 


- ReleaseSafe: 
[info] :        Inference - CPU:
                ΔTime = 36951.625µs
                Δmcyle = 591226                                                                                       
                Δminstret = 83369
                IPC (Δminstret / Δmcyle) = 0.141
[info] :        Inference - Stack report: Used = 24128 / 32768 bytes (8640 free bytes)

Stack utilization(%) in ReleaseSafe: ~0.7363 = 73.6%

- ReleaseFast: 
[info] :        Inference - CPU:
                ΔTime = 31822.062µs
                Δmcyle = 509153                                                                                       
                Δminstret = 79367
                IPC (Δminstret / Δmcyle) = 0.156
[info] :        Inference - Stack report: Used = 25280 / 32768 bytes (7488 free bytes)

Stack utilization(%) in ReleaseFast: ~0.7714 = 77.1%

- ReleaseSmall: 
[info] :        Inference - CPU:
                ΔTime = 38528.312µs
                Δmcyle = 616453                                                                                       
                Δminstret = 336344
                IPC (Δminstret / Δmcyle) = 0.546

[info] :        Inference - Stack report: Used = 24512 / 32768 bytes (8256 free bytes)

Stack utilization(%) in ReleaseSmall: ~0.7480 = 74.8%


**Summary**
- Average stack used in bytes: (24128 + 25280 + 24512 ) / 3 = 24640 → 24640 / 1024 = 24.0625 Kb

### Quantization + Speedup

- print("speedup: %0.1fx" % (best_model_f32_time / int8_model_time))

### Predictions per seconds (PPS)

- Frequency (f) = 1 / T and Time period (T) = 1 / f
- Predictions per seconds (PPS) as frequency: 
    - Period (time per prediction): τ = sec / pred
    - Frequency (prediction per time): f = pred/s [Hz]
- PPS = 1 / T = 1000 / T_ms ←→ 1000_000 / T_µs
- → PPS = 1 / T, T = 1 / PPS

```zig

const t0 = esp_timer_get_time();   // µs
run_inference();
const dt_us: u64 = esp_timer_get_time() - t0;

const T: f32 = dt_us / 1e6;              // seconds per prediction
const PPS: f32 = 1.0 / T;                // predictions per second
```


***Average Result - 10 iterations (Old model)***:

- Debug:

    [info] : Average Inference Result - CPU:
                ΔTime = 15614.125µs
                Δmcyle = 1409736
                Δminstret = 1132034
                IPC (Δminstret / Δmcyle) = 0.803
                PPS = 64.044 predicts/sec

    [info] : Average Inference - Stack report:
                Used = 32768
                free bytes = 0
                mem utilization = 1.000 = 100.00%



- ReleaseSafe:

    [info] : Average Inference Result - CPU:
                ΔTime = 1713.875µs = 1.713875 ms
                Δmcyle = 155230
                Δminstret = 73354
                IPC (Δminstret / Δmcyle) = 0.473
                PPS = 583.458 predicts/sec

    [info] : Average Inference - Stack report:
                Used = 23680
                free bytes = 9088
                mem utilization = 0.723 = 72.23%



- ReleaseFast:

    [info] : Average Inference Result - CPU:
                ΔTime = 1573.375µs = 1.573375 ms
                Δmcyle = 141843
                Δminstret = 79426
                IPC (Δminstret / Δmcyle) = 0.560
                PPS = 635.564 predicts/sec

    [info] : Average Inference - Stack report:
                Used = 23872
                free bytes = 8896
                mem utilization = 0.729 = 72.90%


- ReleaseSmall: 

    [info] : Average Inference Result - CPU:
                ΔTime = 4523.938µs = 4.523938 ms 
                Δmcyle = 408659
                Δminstret = 338742
                IPC (Δminstret / Δmcyle) = 0.829
                PPS = 221.045 predicts/sec

    [info] : Average Inference - Stack report:
                Used = 24512
                free bytes = 8256
                mem utilization = 0.748 = 74.80%


**Some Notes**

The implied CPU frequency can be calculated by cpu_freq = Δmcycle / ΔTime which is approx: 
- Safe: 155230 / 0.001713875 ≈ 90.6 MHz

- Fast: 141843 / 0.001573375 ≈ 90.2 MHz

- Small: 408659 / 0.004523938 ≈ 90.3 MHz

Meaning for the different profiles, the CPU is running at approx ~90 MHz during each inference runs. However, it should be emphasized that this is distinct from the 16 MHz system timer, which measure the wall-time.

The \textbf{Predictions per seconds} (PPS), is giving us the throughput for sequential inference runs. 
A general formula for PPS is: PPS = N / average(total time), N being the number of iterations.

Comparing the ReleaseSmall, we can see that it is slower, but have a higher IPC(0.829). This might indicate, that we have fewer stalls and a denser compute, but more total of work (cycles) per inference. Hence the longer delta time(4523.938 µs) compared to the ReleaseFast (1573.375 µs)


***Average Result - 10 iterations (New model + Optimizations)***:
Loaded Model Size: 4.250000 KiB
Model Dimensions: T = 25, Layers(16-10-16)

- Debug:

    [info] : Average Inference Result - CPU:
                ΔTime = 30591.875µs
                Δmcyle = 2764818
                Δminstret = 1190730
                IPC (Δminstret / Δmcyle) = 0.431
                PPS = 32.688 predicts/sec

    [info] : Average Inference - Stack report:
                Used = 32768
                free bytes = 0
                mem utilization = 1.000 = 100.00%



- ReleaseSafe:

    [info] : Average Inference Result - CPU:
                ΔTime = 1829.125µs
                Δmcyle = 165519
                Δminstret = 103104
                IPC (Δminstret / Δmcyle) = 0.623
                PPS = 546.708 predicts/sec

    [info] : Average Inference - Stack report:
                Used = 23680
                free bytes = 9088
                mem utilization = 0.723 = 72.23%



- ReleaseFast:

    [info] : Average Inference Result - CPU:
                ΔTime = 1549.875µs
                Δmcyle = 139703
                Δminstret = 84574
                IPC (Δminstret / Δmcyle) = 0.605
                PPS = 645.190 predicts/sec

    [info] : Average Inference - Stack report:
                Used = 25664
                free bytes = 7104
                mem utilization = 0.783 = 78.320%


- ReleaseSmall: 

    [info] : Average Inference Result - CPU:
                ΔTime = 2620.438µs
                Δmcyle = 237373
                Δminstret = 172155
                IPC (Δminstret / Δmcyle) = 0.725
                PPS = 381.607 predicts/sec

    [info] : Average Inference - Stack report:
                Used = 24512
                free bytes = 8256
                mem utilization = 0.748 = 74.805%


NOTES:

1. 
- CPU frequency is consistent across all builds (~90 MHz)
- ReleaseFast is ~21× faster than Debug.
- ReleaseSafe trades a small speed drop for safety checks (≈ 85 % of ReleaseFast speed
- ReleaseSmall is a compact build with moderate speed (≈ 60 % of ReleaseFast

2. 
Instruction efficiency (IPC) improves notably in release builds (0.43 → 0.6–0.7), confirming compiler optimizations reduce stalls and overhead. 
3. 
Memory usage (stack) decreases substantially from Debug to optimized builds (100 % → ~72–78 %), showing better inlining and fewer temporaries.

### Model Classification benchmark (Timewindow = 10)


- Q = 0.9, persistance = 2

threshold: 1.72982e-06
Confusion matrix [[TN,FP],[FN,TP]]:
[[48980  8751]
 [ 7775  1353]]
F1:   0.1407
AUROC: 0.444289191457051
AUPRC: 0.13301341161680777

Classification report:
               precision    recall  f1-score   support

           0     0.8630    0.8484    0.8557     57731
           1     0.1339    0.1482    0.1407      9128

    accuracy                         0.7528     66859
   macro avg     0.4985    0.4983    0.4982     66859
weighted avg     0.7635    0.7528    0.7580     66859


- Q = 0.80, persistance = 1

threshold: 9.43466e-07
Confusion matrix [[TN,FP],[FN,TP]]:
[[36513 21218]
 [ 6294  2834]]
F1:   0.1708
AUROC: 0.444289191457051
AUPRC: 0.13301341161680777

Classification report:
               precision    recall  f1-score   support

           0     0.8530    0.6325    0.7264     57731
           1     0.1178    0.3105    0.1708      9128

    accuracy                         0.5885     66859
   macro avg     0.4854    0.4715    0.4486     66859
weighted avg     0.7526    0.5885    0.6505     66859


### Model Classification benchmark (Timewindow = 20, VAL-RATIO = 0.20)

- Hidden encoder: 18
- latent: 10
- hidden decoder: 18

--- Test Evaluation ---
threshold: 3.8897e-08
Confusion matrix [[TN,FP],[FN,TP]]:
[[29189 28392]
 [ 3019  6179]]
F1:   0.2823
AUROC: 0.5676298546722534
AUPRC: 0.16296384458387642

Classification report:
               precision    recall  f1-score   support

           0     0.9063    0.5069    0.6502     57581
           1     0.1787    0.6718    0.2823      9198

    accuracy                         0.5296     66779
   macro avg     0.5425    0.5893    0.4663     66779
weighted avg     0.8061    0.5296    0.5995     66779

### Model benchmark ((Timewindow = 25, VAL-RATIO = 0.15, 18-10-18))

--- Test Evaluation ---
threshold: 1.38205e-07
Confusion matrix [[TN,FP],[FN,TP]]:
[[5034   36]
 [2025 1188]]
F1:   0.5355
AUROC: 0.8553573653875313
AUPRC: 0.8452262710681397

Classification report:
               precision    recall  f1-score   support

           0     0.7131    0.9929    0.8301      5070
           1     0.9706    0.3697    0.5355      3213

    accuracy                         0.7512      8283
   macro avg     0.8419    0.6813    0.6828      8283
weighted avg     0.8130    0.7512    0.7158      8283


--- Test Evaluation (Balanced) ---
threshold: 1.38205e-07
Confusion matrix [[TN,FP],[FN,TP]]:
[[3190   23]
 [2025 1188]]
F1:   0.5371
AUROC: 0.8525961340721231
AUPRC: 0.8829478156261903

Classification report:
               precision    recall  f1-score   support

           0     0.6117    0.9928    0.7570      3213
           1     0.9810    0.3697    0.5371      3213

    accuracy                         0.6813      6426
   macro avg     0.7964    0.6813    0.6470      6426
weighted avg     0.7964    0.6813    0.6470      6426
