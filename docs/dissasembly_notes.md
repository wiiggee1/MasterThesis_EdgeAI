### Prologue and Epilogue

- *Prologue*: is the instructions at the start of a function or ISR that 
sets up a stack frame and *save any registers*. 

For example the instruction in our `mtvt` table of the dissasembled code, 
that says `addi sp, sp, -160`, make up stack space. 

- *Epilogue*: located at the end of the stack frame, and *restore* the 
registers (the context), and tear down the frame, then finally return. 
For Risc-V interrupt handlers the *Epilogue* is ended by 
restoring the stack space through: `addi sp, sp, 160` and then calls 
the `mret` at the end.

The context and the registers that are saved, is dependent on the 
target extensions enabled for the riscv-32 target. If the *F* 
extension is enabled. The ISR (Epilogue + Prologue) would save 
*FP* (Floating Point) registers as the register context for ISRs. 

**NOTE**: If we turn off extensions such as *F* and *D*, we would get
a much smaller or shorter ISR latency (less instructions). Which leads 
to a smaller stack frame. 

**Summary**
- *Prologue*: saves states and sets up the frame.
- *Epilogue*: restores and returns via `mret`.


