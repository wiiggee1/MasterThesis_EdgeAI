## Domain Specific Anomaly Detection


#### Local states and domain
Often when we train our anomaly detection models, we need to consider the 
main problem to solve of our domain. Common approaches train model on 
a data pool from similar domains to learn the general data distribution 
representation. In order to map a trained model, to our application domain, 
we need techniques that consider this aspect. This can be done in the form 
of calibration and fine-tuning, but require deep knowledge of what should 
be considered as "normal" vs "anomalous" data. Another challenge regarding 
this, is that raw data sources are often unstructured, and has no label. 
In the context of unsupervised learning. 

One approach is to train unique model for each asset (sensor, machine, etc...), 
to learn the distribution of that data source. Different hardware, and 
devices have their own specifications and threshold values. Making it a 
big challenge to create a uniformed representation. Another approach 
is to use self-supervised model designs and then apply fine-tuning. This 
way we can adapt to the specific device's local states. This also address
the importance for adapters and users of embedded edge AI technologies 
to set clear goals of what problem, they want their AI model to solve. 

- Multiple Channels: simultaneous variables sampled each tick. 
- *Early Fusion*: stack the channels, using shared sampling rate and time alignment.

Example of *per-group* inputs:
- Group X - *telemetry sources* (e.g., temp, loop ms, protocol latency).
- Group Y - *environmental sensors* (e.g., humidity...).

#### Fine-Tuning and Transfer-Learning
How do we adapt and deploy a pre-trained model on the embedded hardware. 
Common approaches today, is to apply compression techniques, to make 
trained and larger model fit within the constraint of the embedded device. 
But how do we actually generalize a model to our specific domain problem? 

One approach is to utilize something called *transfer learning* that leverage 
the trained weights of a model, by freezing the layers of the neural network 
and add new additional layers for the domain specific task. By training 
only these new ones. Another common approach is to apply *fine-tuning*, 
that would also consider and re-train previous layers in the graph network. 
These two techniques are key cornerstone, for domain specific adaptation. 

In essence, the source domains data distribution often need to have the same 
feature space as the target domain. But have different data distributions. 
This can be explained below as going from the input space to the output 
space by applying an intermediate step between the two data distributions. 

For unsupervised models (no labels)...

**Domain adaption - Transfer Learning**\
$$
Source Domain → Transfer-Learning Layer → Target Domain (different data distribution)
$$

Below is a visualization how two different data distributions with the same 
or similar feature space, can be mapped to the new domain representation. 
Using conditional probability such as the *Bayes' Theorem*. 

SHOW IMAGE HERE OF INPUT, FEATURE and SCORE SPACE before and after adaption!

#### Loss function and Anomaly detection score metric

Working with streams of telemetry data in an unsupervised learning approach, we need 
a way to quantify what to consider as being an anomaly. Often in related research, 
this is addressed using various threshold methods to quantify this. To solve this 
we need to consider what is meant as anomalies.

An anomaly is a quantifiable point in time that either sticks out from the baseline 
of a data-distribution. But can also have characteristics such as contextual 
dependencies, meaning two correlated telemetry data streams might depend on each 
other. Other key considerations is to be able to generalize well, since any domain-
specific data distribution space can have noise. Hence, shouldn't always be classified 
as being an abnormal data. High variance in data, is a good starting point to capture 
deviating behavior in the dataset. 

In this work, quantifying anomalies are done using a shallow RNN-based autoencoder, 
that is propagated through encoder layer and reconstructed via the decoder layer. 
The purpose of using an autoencoder approach is to be able to reconstruct the input 
time window. So we define an anomaly scoring using a *per-window reconstruction error*. 
The anomaly score is defined as: 
$$
s_i = func(\hat{x_i}, x_i), x ∈ ℝ[B, T, D] ←→ T×D for (univariate D = 1).
$$


## Model design for anomaly detection
In this work, the imposed problem to solve, is mainly dedicated to real-time processing 
and embedded hardware. In many of the cases processing real-time data streams, include 
running inference on a sequence of values. That have some sort of temporal characteristics
attach to it. Making sense of a single data point, migh have less to none information 
associated to it. Therefore, the model introduced in thos work is mainly focused on 
generalizing data points during a shared time-domain. According to Goodfellow et al [REF NUM], 
Using some sort of recurrent neural network design, would make the model's network 
share the same weights for several time steps. Which is important for real-time applications.

To design good model design for anomaly detection, on embedded target devices, 
is to adapt a thinking, of treating the target as a closed-loop system. That react 
to both external- and internal environmental changes, such as sensor and hardware. 
Comparing model designs in related research work, we face the design choice of 
balancing the performance vs the memory footprint. In terms of model design, we 
should emphasize the real-time constraint, and the model complexity. Often in 
theory, model complexity is often refered to as how many parameters the model 
needs in order to perform well during training but also affect the inference 
and feedforward step. Neural networks can be either *shallow* or *deep*. Meaning 
a deep neural network is a design that have more *hidden layers*. Which has a 
direct impact on the memory footprint. Because more layers mean more internal 
nodes (or neurons) that dictate the weight matrix size. 

- Input data Shape: [B, T, D], batch first → Row-Major Ordering
    - *B* = batch size.
    - *T* = time window sequence length.
    - *D* = number of features per timestep (univariate, D = 1).
- Encoder RNN Layer: 
    - x = [B, T, D] → `rnn_encoder as RNNBlock` = [B, T, H_enc].
- Fully Connected Encoder = `nn.Linear(H_enc, H_lat)` → outputs [B, T, H_lat]
- Decoder RNN Layer: 
    - Takes input [B, T, H_lat] and outputs [B, T, H_dec]

- Fully Connected Last Layer:
    - `nn.Linear(H_dec, H_lat)` applies: `y = x · Wᵀ + b`
    - Inputs [B, T, H_dec] → reshape → [B*T, H_dec] .
    - Outputs [B, T, D] = Same as Input dimensions.

**Model Dimensions:**

```python
y = self.rnn_encoder(x)         # (B, T, H_enc)
y = self.fc_encoder(y)          # (B, T, H_lat)   ← no reshape needed
y = self.rnn_decoder(y)         # (B, T, H_dec)
y = self.fc_head(y)             # (B, T, D)
```

- PyTorch nn.Linear(out, in) stores weight.shape == (out, in).
- With batch_first=True, you pass (B,T,D)

Into Zig type mappings: 
```zig

```

**NOTE**: 

```txt
"Using nn.Linear with 3D Input: nn.Linear expects a 2D input, but sometimes you might mistakenly pass a 3D input (for example, from a convolutional layer in a CNN). This will result in a runtime error. To fix this, you can use torch.flatten or view to reshape the input to 2D"
```


```txt
*batch_first* – If True, then the input and output tensors are provided as (batch, seq, feature) instead of (seq, batch, feature). Note that this does not apply to hidden or cell states
```

However, utilizing LSTM and RNN-based architecture also comes with an increased memory 
footprint. Which is not preferable on limited and constrained embedded hardware. We 
need to put a high emphasis on the trade-off between model complexity, memory footprint, 
and the runtime inference performance. Comparing the parameter count for the LSTM 
approach compared to the RNN approach we can see a big significant difference. 
Below is a quick table comparision of the two: 

| **Aspect**            | **RNN**                               | **LSTM (Long Short-Term Memory)**            |
|-----------------------|---------------------------------------|----------------------------------------------|
| **Parameter Count**    | Low – ~1× baseline                     | High – ~4× RNN (due to gating mechanisms)    |
| **Model Size (Flash)** | Small footprint                        | 4× larger than RNN                           |
| **Compute Complexity** | Simple (1 matrix multiply + tanh)      | Heavy (4 matrix multiplies + multiple activations) |
| **RAM Usage**          | Low – stores single hidden state       | High – stores hidden + cell state + gates    |
| **Inference Speed**    | Fast – lightweight operations          | Slower – 3–4× slower than RNN                |


## Loading the model (pipeline)

Whenever, we want to deploy a model on the edge, efficient and fast ways of deploying AI 
models on the edge devices. Essentially *Time to deployment* (TTD) is of utterly importance. 
So how do one design a pipeline for parsing and loading models from different frameworks? 
One approach would be to use the open standard and the format *.onnx*. Which address the 
importance of having uniformed methods for deploying models on the edge. 

In this work, using open sourced standards would emphasis the design thought of *extendibility* 
but also *modularity*. My pipeline design for this, is slighly different. 

#### Pipeline for extendibility
- Loading and parsing the domain specific model. 
    - Requirements: 
        - Fast TTD,
        - Unified model format for export and import,
        - ...

Parsing and loading the model into program-language specific data types should be easy. 
Working with *.onnx* exported models, would utilize the concept of flatbuffers or 
protocol buffers (protobufs). But the drawback of using flatbuffers, can sometimes be 
resource intensive

Below is a list of terminology related to .onnx files. 

- *opset_import* - describe things such as padding constraints etc.
- *graph*:
    - *node[]* - array representing the node specific operations (e.g., linear transformations, ReLU, etc).
    - *initializer[]* - array of trained parameters such as the weights and so on. 
    - *input[], output[]* - arrays describing the graph I/O types and shapes. 

So in order to load the trained weights we would need to parse the entry *graph* from the 
.onnx file and the field *graph.initializer[]*. The key idea how ONNX models work is that, 
it uses directed graph to describe nodes as operations and edges how the data flow between 
these connected edges. As mentioned above, this format uses protobufs for serialization 
as its file format. 

Example of a model deployment pipeline using the `.onnx` format could be: 

1. Train model using a framework such as *Pytorch* or *TensorFlow*. 
2. Convert or export the model to into the ONNX format using APIs. 
3. Parse the ONXX file format into the program-languages specific data types. 

Another approach is to use pytorch API `torch.export`, which allows to create 
a directed and traced graph that can represent the model. 

## Related work, comparing model designs (anomaly detection)

```latex

When it comes to the research community, for anomaly detection models on time-series data. There are quiet some good findings.
In the used dataset \cite{telemanom}, they proposed shallow models with only two number of hidden layers. However, in their 
work they used a wide timewindow with a sequence length of 250 timesteps. This is good for capturing more sophisticated 
temporal relationships. But is a design question, that should emphasised specially for smaller edge devices. However, in 
a survey they concluded that the optimal timewindow for capturing anomalies in real-time applications are dependent on XYZ... \cite{}. 
\\
\\
Include figure showcasing the relationship between timewindow size for capturing point-based data anomalies...
\\
\\
In another paper, in the context of real-time analysis for the deployment of AI models. Vasquez \texit{et al.} evaluated 
a deep learning-based model on multivariate sensor data for real-time detection for anomalies \cite{10875005}. They state 
that univariate data models (using only one feature) missout in capturing contextual-based anomalies. This is in fact true, 
but also comes with an increased model complexity, and is something that makes the source of origin of the actual anomaly 
harder to debug according to Hundman \textit{et al.} \cite{telemanom}. Other approaches of model designs that have showned 
good capabilities in anomaly detection applications are the usage of \texit{variational autoencoder} \cite{kingma2022autoencodingvariationalbayes}. 
Many of the latest related research present models using this type of deep learning autoencoder architectures,
acheiving good performance. 


```






