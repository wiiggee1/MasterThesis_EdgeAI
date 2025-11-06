## Hardware loop 

[info] : Scheduler SUMMARY: miss_rate=0.000000%                                                 
[info] : Scalar time: Δmcyle: 3985, Δminstret: 3218                                             
[info] : HWLP time: Δmcyle: 4165, Δminstret: 2431


**With Float Mode to Optimized**:

### Matmul benchmark: 

- Model(T=25, 16-10-16):
    - MatmulFn.base:
    [info] : Average Inference Result - CPU:
                    ΔTime = 1667.063µs
                    Δmcyle = 150254
                    Δminstret = 129231
                    IPC (Δminstret / Δmcyle) = 0.860
                    PPS = 599.849 predicts/sec

    - MatmulFn.vecdot:
    [info] : Average Inference Result - CPU:
                    ΔTime = 3936.500µs
                    Δmcyle = 354513
                    Δminstret = 277755
                    IPC (Δminstret / Δmcyle) = 0.783
                    PPS = 254.030 predicts/sec

    - MatmulFn.hwlp:
    [info] : Average Inference Result - CPU:
                    ΔTime = 4547.938µs
                    Δmcyle = 409555
                    Δminstret = 323824
                    IPC (Δminstret / Δmcyle) = 0.791
                    PPS = 219.880 predicts/sec

- Model(T=25, 15-10-15):
    - MatmulFn.base:
    [info] : Average Inference Result - CPU:
                ΔTime = 1503.563µs
                Δmcyle = 135559
                Δminstret = 116012
                IPC (Δminstret / Δmcyle) = 0.856
                PPS = 665.073 predicts/sec
    - MatmulFn.vecdot:
    [info] : Average Inference Result - CPU:
                ΔTime = 3210.750µs
                Δmcyle = 289202
                Δminstret = 235595
                IPC (Δminstret / Δmcyle) = 0.815
                PPS = 311.454 predicts/sec
    - MatmulFn.hwlp:
    [info] : Average Inference Result - CPU:
                ΔTime = 3210.938µs
                Δmcyle = 289223
                Δminstret = 235595
                IPC (Δminstret / Δmcyle) = 0.815
                PPS = 311.431 predicts/sec


*NOTES:*
Even a slight decrease in the encoder and decoder layer sizes indicate a significant speed-up refered to the model complexity chapter. Addressing the need of balancing the model footprint, and its performance on constraint edge devices.



### Matmul benchmark + fused bias + activation: 
[info] : Average Inference Result - CPU:
                ΔTime = 1272.813µs
                Δmcyle = 114788
                Δminstret = 88398
                IPC (Δminstret / Δmcyle) = 0.770
                PPS = 785.658 predicts/sec
[info] : Average Inference - Stack report:
                Used = 25664
                free bytes = 7104
                mem utilization = 0.783 = 78.320%

## Thesis 

Add in the optimization method section explaning, that optimization was focused on hardware optimization on the target device. By focusing on frequently executed matrix and vector operations such as the different Matmul functions. 

The HWLP optimization approach tends to be slower due to CSR setup seemed to dominate the load. 

### Hot-path Optimizations - Software (algorithm)

1. Prepack or pre-compute a packed buffer where each column if contiguous. Hence fewer loads, better locality.  

2. Tiled/blocked matmul (more cache-friendly):
    - 

3. Precision tuning:

4. Fusing bias + activation



### Optimization - Off (ReleaseFast):
[warn] : ---Inference Benchmark Performance (iter = 10)---
[info] : Average Inference Result - CPU:
                ΔTime = 4507.313µs
                Δmcyle = 405897
                Δminstret = 251359
                IPC (Δminstret / Δmcyle) = 0.619
                PPS = 221.862 predicts/sec
[info] : Average Inference - Stack report:
                Used=31016
                free bytes=1752
                mem utilization = 0.947 = 94.653%


### Compiler optimization - After final optimization

- Debug:
[info] : Average Inference Result - CPU:
                ΔTime = 23768.063µs
                Δmcyle = 2149615
                Δminstret = 948094
                IPC (Δminstret / Δmcyle) = 0.441
                PPS = 42.073 predicts/sec
- ReleaseSafe:
[info] : Average Inference Result - CPU:
                ΔTime = 1351.625µs
                Δmcyle = 122522
                Δminstret = 96384
                IPC (Δminstret / Δmcyle) = 0.787
                PPS = 739.833 predicts/sec

- ReleaseFast:
[info] : Average Inference Result - CPU:                                                                             ΔTime = 1351.563µs
                Δmcyle = 122513
                Δminstret = 96384
                IPC (Δminstret / Δmcyle) = 0.787
                PPS = 739.874 predicts/sec

- ReleaseSmall:
[info] : Average Inference Result - CPU:                                                                             ΔTime = 1516.375µs
                Δmcyle = 137947
                Δminstret = 98510
                IPC (Δminstret / Δmcyle) = 0.714
                PPS = 659.457 predicts/sec

### Miss rate (final optimized build)

- Miss Rate (1.65ms): 0 misses

- Miss Rate (1.6ms): 0 misses

- Miss Rate (1.55ms): 0 misses

- Miss Rate (1.50ms): 0 misses

- Miss Rate (1.45ms): 0 misses

- Miss Rate (1.42ms): 0 misses

- Miss Rate (1.41ms): 0 misses

- Miss Rate (1.40ms): 1 miss, miss rate = 0.027988%

- Miss Rate (1.30ms): 1923 misses, miss rate = 49.974014\%

### Compiler optimization - After final optimization (NEW)

The following benchmark compare the optimization builds, running at a period of 1.45ms.

- Model: T = 25, 15-10-15


- Debug:
[info] : Average Inference Result - CPU:
                ΔTime = 23779.688µs
                Δmcyle = 2150695
                Δminstret = 948711
                IPC (Δminstret / Δmcyle) = 0.441
                PPS = 42.053 predicts/sec
[info] : Average Inference - Stack report:
                Used = 32768
                free bytes = 0
                mem utilization = 1.000 = 100.000%

- ReleaseSafe:
[info] : Average Inference Result - CPU:
                ΔTime = 1351.938µs
                Δmcyle = 122549
                Δminstret = 96395
                IPC (Δminstret / Δmcyle) = 0.787
                PPS = 739.652 predicts/sec
[info] : Average Inference - Stack report:                                                                              
                Used = 24320 
                free bytes = 8448
                mem utilization = 0.742 = 74.219%

- ReleaseFast:
[info] : Average Inference Result - CPU:
                ΔTime = 1276.875µs
                Δmcyle = 115157
                Δminstret = 88403
                IPC (Δminstret / Δmcyle) = 0.768
                PPS = 783.158 predicts/sec
[info] : Average Inference - Stack report: 
                Used = 25664
                free bytes = 7104
                mem utilization = 0.783 = 78.320%

- ReleaseSmall:
[info] : Average Inference Result - CPU:
                ΔTime = 1516.438µs
                Δmcyle = 137972
                Δminstret = 98542
                IPC (Δminstret / Δmcyle) = 0.714
                PPS = 659.440 predicts/sec
[info] : Average Inference - Stack report:
                Used = 24704
                free bytes = 8064
                mem utilization = 0.754 = 75.391%


