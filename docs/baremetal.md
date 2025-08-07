### Setting up Baremetal for ESP32-P4 (riscv):

- *IRAM (Instruction RAM)* or *DRAM (Data RAM)* are copied from flash to the load address. 

- *DROM (Data Stored in flash)* or *IROM (Code Executed from flash)* regions, the flash MMU provide the correct mapping from flash to the load address.

3. Lastly if OK, it jumps to the application entry point found in the binary image header. 

#### Boot Code and application startup
After the power-on reset sequence the CPU initially points to the address
of the *reset vector*. This address is the very first instruction that is 
executed by the CPU. Often it loads the stack pointer *sp* and the *pc* 
to address of the *bootloader* or *startup* code.

**BOOT CODE:**
Is executed before the `main()` and conduct the following: 
- Loading the CPUs stack pointer. 
- Setting up the heap.
- Copy the initialized variable data from ROM (flash) to RAM. 
- Sets the `.bss` segment to all zeros. 
- Lastly calling the `main()` (our application code).



#### Interrupt Vectors

Two different interrupt controller modes supported by the CPU (esp32-p4): 
- CLIC - Core Local Interrupt Controller.
- INTC - Platform-level Interrupt Controller, "standard mode" (`mtvec`-based).

###### CLIC Interrupt Table: 
The CLIC supports `direct hardware preemption`. Key points of using CLIC, is features such as `preemption`, `low-latency`, `vectored` and `priority-based interrupts`. 

**Terminology (Interrupts)**: 
- `Entry Code` - first few instructions executed by CPU after an interrupt or exception occurs. Among others it determine the cause `mcause` and redirect to the appropriate handler function (`ISR`). This so called entry code, is located in the `vector.S` file. Each vector (e.g., `j _interrupt_handler`) jumps into the *entry code*. It's also known as the *stub* or the low-level hadnler in assembly. 

- `Trap Frame` - is a snapshot of a CPU state saved on the stack (or in memory), when handling an interrupt or exception. Its needed to *resume* normal execution after handling the "trap". Allows preemptive interrupt handlers to safely restore state. These tram frames, are often saved in the *vectors.S* or *trap.S*. 

- `Handling Logic` - after the entry code has prepared the trap frame, the system enters the handling logic. Our *Interrupt* or *Exception* handler. In low-level logic in the assembly `_interrupt_handler` or `_panic_handler` the following is done: 
    - Reads `mcause` to determine the interrupt number. 
    - Clears the interrupr pending bit. 
    - Dispatch to the correct per-interrupt handler (via table or switch).
    - Can call C/Zig functions (ISR).


Simple Flow Summary: 
[Hardware Trap (IRQ or exception)] → mtvec points to _vector_table
→ _interrupt_handler (entry code)
→ Save trap frame to stack
→ Read mcause
→ Dispatch to C/Zig handler
→ Handle logic
→ Restore trap frame
→ mret (return from trap)

RISC-V (`vector.S`) example: 

```asm
.global _interrupt_handler
_interrupt_handler:
    addi sp, sp, -128        # Reserve trap frame
    sw ra, 0(sp)
    csrr t0, mcause
    call dispatch_interrupt  # Pass mcause in t0
    lw ra, 0(sp)
    addi sp, sp, 128
    mret

```

Example of `mcause` values: 

0x00000005	Exception #5 (load access fault)
0x80000007	Interrupt #7 (timer interrupt)
0x8000001A	Interrupt #26 (memprot fault)


### Commands: 

```zsh
esptool elf2image firmware-app.elf --chip esp32p4 --output firmware_image

./regz esp32p4.svd --format svd --output_path . > esp32p4.zig
```

### Startup code and stubs: 




