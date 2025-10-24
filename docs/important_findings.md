## Interrupts not working with system-timer:

- Find out that using the floating-point extension "F" would cause undefined behavior
and freeze my program. 

By setting and disabling the following CPU features (extensions) in `build.zig`: 

```zig
    .cpu_features_sub = std.Target.riscv.featureSet(&.{ .zca, .zcb, .zcmt, .zcmp, .f }),
```
Made my program fire my system timer ISR. I think by not disabling FPU and floating point
extensions and whenever I convert from a time unit into ticks. The division operations 
would causing us to get floating point value, triggering undefined behavior.
Hence entering the panic handler trap, causing the program to freeze. 

**TODO**: 

- Do I need to enable the floating-point extension somewhere, by 
setting some RISCV CSRs? 

### IPC comparing optimization profiles: 

- *ReleaseSafe*: 
    CPU dummy test: Δmcyle = 21518, Δminstret = 7057, IPC (Δminstret / Δmcyle) = 0.328

- *ReleaseFast*: 
    CPU dummy test: Δmcyle = 16750, Δminstret = 3027, IPC (Δminstret / Δmcyle) = 0.181

- *Debug*: 
    CPU dummy test: Δmcyle = 48878, Δminstret = 22718, IPC (Δminstret / Δmcyle) = 0.465

### MatMul Optimization compare:

- *ReleaseSafe*: 
```
---MatMul---
           Δmcyle = 349
           Δminstret = 29
           IPC (Δminstret / Δmcyle) = 0.083
           ΔTime = 21.813µs
```

- *ReleaseFast*: 
```
---MatMul---
           Δmcyle = 242
           Δminstret = 16
           IPC (Δminstret / Δmcyle) = 0.066
           ΔTime = 15.125µs
```

- *Debug*: 
```
---MatMul---
           Δmcyle = 39983
           Δminstret = 4684
           IPC (Δminstret / Δmcyle) = 0.117
           ΔTime = 2498.938µs
```

- *ReleaseSmall*: 
```
---MatMul---
           Δmcyle = 26
           Δminstret = 16
           IPC (Δminstret / Δmcyle) = 0.615
           ΔTime = 1.625µs
```

**NOTES**:

Using the `ReleaseSmall` might indicate fewer cache misses hence making it faster. 
Due to landing more frequently contiguously in IRAM (aligning with the MMU page size).
However, ... 

## Model summary (Pytorch)

***Model using dtype = f32***

- Non-Quantized(f32) model size:
    - Params: 3.410156 KiB, Buffers: 0.000000 KiB, Total: 3.410156 KiB

- Size from loading .pth files:
    - Non-Quantized model size: 25.354492 KB
    - Quantized(int8) model size: 10.362305 KB

- Inference benchmark:
        - f32 model mean time: 0.176 ms
        - int8 model mean time: 0.659 ms
        - speedup: 0.3x

**Validation Reconstruction:**
MSE: 0.000000, MAE: 0.000320, Cosine Similarity: 0.9999998807907104

*Test-Set Reconstruction:*
MSE: 0.000000, MAE: 0.000381, Cosine Similarity: 0.9999980330467224


