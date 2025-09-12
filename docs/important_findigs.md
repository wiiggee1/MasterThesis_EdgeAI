## Interrupts not working with system-timer:

- Find out that using the floating-point extension "F" would cause undefined behavior
and freeze my program. 

By setting and disabling the following CPU features (extensions) in `build.zig`: 

```zig
    .cpu_features_sub = std.Target.riscv.featureSet(&.{ .zca, .zcb, .zcmt, .zcmp, .f }),
```
Made my program fire my system timer ISR. I think this happened whenever I 
convert from a time unit into ticks, for division operations that causing us 
to get floating would trigger undefined behavior and hence entering the 
panic handler trap. 

**TODO**: 

- Do I need to enable the floating-point extension somewhere, by 
setting some RISCV CSRs? 
