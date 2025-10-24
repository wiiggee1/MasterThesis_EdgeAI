## Dataset info 
The dataset used in this master thesis, is based on the Soil Moisture Active Passive satellite - *SMAP*, and the Curiosity Rover on Mars (*MSL*) dataset. 
Referenced by Hundman (arXiv:1802.04431). This dataset contain telemetry data, 
relevant for multivariate anomaly detection. 

#### Labels and metadata info

- Channel ID: Represent the data source or channel, e.g., P = power, T = temperature
and so on...

- Spacecraft: *SMAP* or *MSL*. 

- Anomaly Sequence: start and end indices of ground truth anomalies in the channel stream.

- Class: type or class of anomaly, e.g., point-, or contextual-based anomaly kind. 

- Num values: amount of telemetry data values for each stream. 

In their research paper Hundman et al (2018) they proposed *Single-Channel Models*, 
for each telemetry channel. They emphasize the importance of traceability, for 
easier find in what channel a certain anomaly would occure in. Which could be 
detrimental for real-time monitoring of potential deviated data stream anomalies. 
This further highlights the importance of sequential data and how multiple data 
points might have an associated information attach to it. A trade-off here is 
that a bigger time-window (sequence length) would increase the processing time, 
during inference. For real-time applications (domains) fast processing
time for catching anomaly points would be more favourable. This is also true 
for when you choose what type of algorithm you use, for calculating the 
threshold and anomaly score (what to consider as being an anomaly). 
In simpler terms processing historical data for real-time inference is expensive. 

"Point anomalies are single values that fall within low-density regions of
values, collective anomalies indicate that a sequence of values is anomalous
rather than any single value by itself, and contextual anomalies are single
values that do not fall within low-density regions yet are anomalous with
regard to local values". 


- One dimensional vector of errors. 

- Exponentially Weighted Average (EWMA).

- Pruning - removing less important parameters from the model's neural network. 
Which would reduce the memory footprint (model size), hence creating more efficient
model inference. 

#### Scope and limitations
The context of applying an efficient model design for embedded hardware, empose 
a big challenge. With limited memory, we need to carefully design models by 
considering the trade-off between the amount of historical temporal data points 
used. How we compress the models to fit our requirement. But also in terms of 
the accuracy and performance of our model. 

To limit the scope of this work. Contextual-based datapoints have been neglected 
as much as possible. Also this dataset is made anonymized with regards to the 
time. Meaning each data sample of a specific channel is treated as discrete 
timestamp. This allow us to define our time requirement for our specific domain
problem in terms of what we need. Hence, creating flexibility what time-window
of T steps we want to use for our embedded target.

