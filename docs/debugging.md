## Debbuing using Openocd + gdb

#### GDB useful commands: 

**Showing Register bits:**
```gdb
(gdb) x/1wt 0x500C2064
0x500c2064:     01010000110110000011101010100001
(gdb) x/1wx 0x500C2064
```

**Printing locals:**

```gdb
(gdb) print/x LPWDT_WPROTECT
$8 = 0x50116018
(gdb) print/t LPWDT_WPROTECT
$9 = 1010000000100010110000000011000
```

**Listing Memory Regions:**

```gdb
info files
```

**Stack Size and Contents:**

```gdb
info files

```

**Show recent values:**
```gdb
show values
```


## RISC-V-32 Debugging notes: 

Getting the value of `mtvec` = 0x4ff00203, is interpreted as: 

- Low bits ...03, means we are set to the mode = 3, which equal 
the *CLIC mode*. While the following bits represent the base bits 
as `0x4ff00200`.

For identifying the main cause when debugging we look at `mcause`. 
E.g., the lower bits in the `mcause` tells us the exception or 
interrupt cause. For example: 
- `mcause` = 0x30000002 → low bits = 2 → *Illegal instruction exception*.
- `mepc`   = 0x4ff00200 → at what address the illegal instruction was fetched.

- `mtval`  = 0x000077da → here is the *faulty instruction*, 
    - A value of `0x77da` is a 16-bit pattern that is not a legal instruction. 
      Meaning we executed garbage bytes as code. 

The bit 13 in the `mstatus`, e.g., `mstatus_FS = $mstatus | (3 << 13)`. 
According to the \emp{The RISC-V Instruction Set Manual} the FS bit of 
the *mstatus* is described as: 

```text
"The FS field encodes the status of the floating-point unit state, including the floating-point registers f0–f31 and the CSRs fcsr, frm, and fflags."
```

If we disable the RISC-V *F-extension*, our ISR prologues and epilogues 
won't include the *FP* registers. Then for floating point operations, 
the compiler will instead implement all floating-point operations in 
*software* instead of the *FPU*. Which is slower, but with the trade-off
of gaining faster ISR or interrupt handling. 







