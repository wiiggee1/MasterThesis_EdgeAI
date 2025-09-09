### Retreiving the ISR from the Vector Table

After an `IRQ` - Interrupt Request, the current context is saved, the next step is to determine 
what ISR - Interrupt Service Routine, to call. This is done by looking in the 
`interrupt vector table` (IVT). Which is located at a specific area of memory on your processor. 

1. IRQ triggered.
2. Save context. 
3. Lookup in the IVT - *Interrupt Vector Table* (list of callback functions one for each interrupt).
4. Call the appropriate ISR callback from the IVT list. 

#### Interrupt Vector Table (IVT):
The IVT, is a list of callback functions, where a callback function being a function pointer. 
This list of function pointers are often implemented in assembly. The vector table is 
located at a specific address in memory, set by the linker script. Usally in a section 
or linker variable named something like `.isr_vector`. 

In the ISR startup code, you often have the following: 

- _estack → The initial stack pointer, pointing to the beginning of the stack. 
- A `Reset Vector` → address of the code that is called during system boots up or resets. 
- Later in the table, are often the peripheral interrupts, such as timers etc...

Each interrupt has an associated interrupt number. So whenever an interrupt occur, 
it is signaled by this specific number. Hence, the part of the processor that 
generates the IRQ sends it to the part of the processor that looks up the handler 
in the vector table as the number. The processor uses the interrupt number and 
the structure of the vector table to look up the address to call (callback 
or function pointer) when the interrupt arrives. 

#### Restore the Context:
After an ISR has finished, you need to return to normal execution. The program counter points 
to the machine instruction you are are about to run. Whenever, you call a function, 
the address of the next instruction (program counter + 1 instruction) is put on the stack
as the return address. When you return from the function (rts or rti), the program counter 
is set to that address. 

- Interrupt, have a special call (rti); its a jump to the instruction handler, 
that restores the context to its state prior to the function call. 

### Configuring Interrupts: 
First you have to *disable* interrupts. Setting up the interrupts uses memory mapped registers. 
After disabling, you can configure it to trigger an IRQ when the timer has expired. 
All the operations made use the structure (struct) that points to the memory map 
of the processors registers for this peripheral (TIMER). 

- The `CSR` - Control and Status Registers are registers in CPUs and microcontrollers
that are used for reading status and changing configuration. Its a special-purpose 
registers used to control and monitor various aspects of the RISC-V operation. 

## Interrupts and Exceptions (ESP32-P4, RISCV):

Simplified Interupt Flow: 

Peripheral's internal interrupt → 126 interrupt signals → Interrupt Matrix Controller → ...
... → 32 HP CPU0 / HP CPU1 peripheral interrupt signal → HP CPU Interrupt Controller. 

##### Interrupt Control and Status Registers (CSRs)
Some interrupt related registers for the "Machine mode" are: 
- `mstatus` - Status register containing interrupt enables for all previlege modes. 
- `mcause` - Status register indicating if an exception or interrupt occured + code type.

- `mie` - Interrupt enable register for local interrupts when using *CLINT*. While in 
          *CLIC* mode this is set to 0 and enabling interrupt are handled in the memory 
          mapped register `clicintie[i]`.

- `mtvec` - Machine Trap Vector register that holds the base address of the interrupt
            vector table, as well as the interrupt mode configuration as either 
            *direct mode* or *vectored mode* for CLINT and CLIC controllers. 
            All synchronous exceptions also use the `mtvec`. 

- `mtvt` - Used only in *CLIC* modes of operation. It contains the base address of 
           the interrupt vector table for selecting the vectored interrupt in CLIC
           *direct mode*, and for all vectored interrupts in CLIC vectored mode. 

##### Common Registers to both CLIC and CLINT
- `msip` - Machine mode software interrupt pending register. 
- `mtime` - Machine mode timer register, running at a constant frequency. 

- `mtimecmp` - Memory mapped machine mode timer compare register, used to trigger 
               an interrupt when `mtimecmp` is greater than or eqaul to `mtime`.

#### Early Boot Setup `mtvec` Register
Early in the boot flow sequence the `mtvec` register is required to be setup. 
The interrupts are not fully configured early in the boot flow, but exception 
handling is important to setup early. This is important in order to catch 
anything that goes wrong early during the boot process. 
This is referred to as setting up *trap vector*. 

**NOTE**: A *trap* is referred to as the *synchronous transfer of control* 
          to a *trap handler* caused by an exception condition occuring. 

Example in assembly: 

```asm
la t0, early_trap_vector
csrw mtvec, t0
```

Below is an early trap vector that does nothing. More sophisticated 
trap handlers are often required, after the initial bootup is completed.
That can be written in your programming language using inline assembly. 

**NOTE**: Disable interrupts globally using `mstatus.mie` prior changing
          the `mtvec` register. 
```asm
    .section .text.init.trapvec
    .align 2
early_trap_vector: 
    .cfi startproc
    csrr t0, mcause
    csrr t1, mepc
    csrr t2, mtval
    j early_trap_vector
    .cfi_endproc
```

#### Entry and Exit steps for Interrupt Handlers: 
Whenever interrupt occurs, the hardware automatically save and restore 
important registers. The following steps are conducted when an interrupt 
handler is entered: 

1. Save `pc` to `mepc`.
2. Save *Previlege* level to `mstatus.mpp`.
3. Save `mie` to `mstatus.mpie`.
4. Set `pc` to interrupt handler address, based on mode of operation. 
5. Disable interrupts by setting `mstatus.mie` = 0.

After these 5 steps, the control is transfered over to the software 
where the interrupt processing can begin. At the end of the interrupt 
handler the `mret` instruction will perform the following: 

1. Restore `mepc` to *pc*
2. Restore `mstatus.mpp` to the current privilege level (Machine = 3, Supervisor = 1, User = 0).
3. Restore `mstatus.mpie` to `mie`.

In the `mcause` register the bit at [bit 31] or the MSB if [bit 31] = 1 then its an interrupt 
else if [bit 31] = 0 then its an exception. While the lower bits show the `mcause.code`
value, basically the type and what to do with it. 
    
- *mcause\_value* is given by the assembly: 
```asm
csrr t0, mcause
```

**Lower bits that shows MCAUSE code:**
- MCAUSE\_CODE\_MASK: 0111\_1111\_1111\_1111\_1111\_1111\_1111\_1111 = 0x7FFFFFFF

Where the MSB at the 31-bit is set to exception mode since [bit 31] = 0.
Branching to the interrupt handler address function (callback) can be done by: 

interrupt\_handler = mcause\_value & MCAUSE\_CODE\_MASK

**IMPORTANT NOTE** - Using Vectored mode introduces a method to create a vector 
table that hardware uses for *lower interrupt handling latency*. Compared to 
the *direct mode* that handles it in software.

#### Vector Mode Interrupts: 
Whenever, an interrupt occurs in vectored mode, the *pc* will get assigned 
by the hardware to the address of the vector table index corresponding to
the interrupt ID. Next and from the vector table index, a jump will occur 
to service the interrupt via the ISR. 

The interrupt handler offset is calculated by: `mtvec.base + (mtvec.code * 4)`. 
E.g., a software interrupt with ID = 3 would trap to the offset: `mtvec.base + 0xC`
or as binary: `mtvec.base + 0b1100`. Since `mtvec.base + (3 * 4) → mtvec.base + 0xC`. 

##### Core Local Interrupt Controller (CLIC)
To configure CLIC as vectored mode we assign `mtvec.mode = 0x03`. Again 
as in CLINT, an interrupt vector table is used for specific interrupts. 
However, in CLIC vectored mode, the handler table contains the address
of the interrupt handler instead of an opcode containing a jump instruction. 

When an interrupt occurs in the CLIC vectored mode, the address of the handler 
entry from the vector table is loaded and then jumped to in hardware. CLIC 
vectored mode uses `mtvec` exclusively for exception handling, since the 
`mtvt` is used to define the base address for all vectored interrupts. 

**NOTE:** To access the `mtvt` sometimes you need to do it directly 
using the CSR number = 0x307 instead of the `mtvt` keyword. E.g., 
```asm
csrr %0, 0x307 : "=r(mtvt_read_value)"
```

***SUMMRARY:***

**NOTE:** When using `CLINT` vectored mode offset is given by: `mtvec + (4 * X)`

**NOTE:** While `CLIC` vectored mode offset: `mtvt + (Interrupt ID * XLEN/8)`

- Local Interrupts, Id: 16..X → `mtvec + (4 * X) ... mtvec + 0x40`
- CLIC s/w Interrupt, ID: 12 → `mtvec + 0x30`.
- External Interrupt, ID: 11 → `mtvec + 0x2C`,
- Timer Interrupt, ID: 7 → `mtvec + 0x1C`,
- Software Interrupt, ID: 3 → `mtvec + 0x0C`.

**CLIC:**
1. Vectored interrupts jumps directly to their vector table offset. 
2. ISR, interrupt handler address is given by: `mtvt + (Interrupt ID * XLEN/8)`. 

**Enabling Preemption in CLIC:** `mstatus.mie` (machine interrupt enable) 
needs to be enabled (non zero) within the handler. Prior re-enabling 
interrupts via `mstatus.mie`, first `mepc` and `mcause`must be saved 
and restored before executing `mret` at the end of the handler. 

**Registers within the CLIC:**
- `cliccfg` - Memory mapped CLIC configuration register. E.g., setting 
the mode to *direct mode* or *vectored mode*. 

- `clicintcfg[i]` - Memory mapped CLIC interrupt configuration register. 
This register sets the *pre-emption level* and *priority* of a given interrupt. 

- `clicintie[i]` - Memory mapped CLIC interrupt *enable* register. 
- `clicintip[i]` - Memory mapped CLIC interrupt *pending* register

- `mtvt` - CSR which holds the Machine Trap Vector Table base address 
for CLIC vectored interrupts. The `mtvt.base` require a minimum of 
64-byte alignment. 

- `mnxti` - CSR containing the *Machine Next Interrupt Handler* and *Interrupt-Enable*. 
A read to this CSR returns the address of an entry in the vector table `mtvt`.

- `mintstatus` - Read only CSR which holds the *Active Machine Mode Interrupt Level*. 

In *CLIC Mode* the following CSRs changes is made: 
- `mstatus.mpp` and `mstatus.mpie` are now accessible via fields in the `mcause` register.
- `mie` and `mip` are hardwired to zero and replaced with `clicintie[i]` and `clicintip[i]`.
- `mtvec` is replaced with `mtvt` register for CLIC modes, with CSR number for `mtvt` = 0x307.

#### CLIC Pseudo Code to Setup Interrupt:

1. Write to `mtvt` to configure the interrupt mode and base address for interrupt vector table.

2. Enable interrupts via the memory mapped CLIC register space: `clicintie`

3. Write to `clicintie[i]` to enable the software, timer and external interrupt enables for 
each CLIC modes of operation. 

4. Write `mstatus` to enable interrupts globaly for each supported privilege mode. 


## Defining "weak" exported ISR handlers in Zig

##### Define and setup ISRs (startup code):
The first initial step conducted in the start/boot code related to ISRs. 
Is to define *weak* default interrupt handles (ISRs). We are using a 
*CLIC* as our interrupt controller. So first we need to enable and set 
the the mode to *vectored mode*. During this mode, our CPU will jump to 
addresses located at `mtvt + 4 * interrupt id`.

By utilizing the `export` keyword in Zig, we create symbols that is 
visable to the linker. In addition to using the `export`, we can also 
set the exported symbol as `weak`. Meaning we can re-define the same 
export declaration with a "non-weak" (strong) symbol. This allows us
to override the weak symbol with the new stronger one. 

##### Register/create the `mtvt` (vector table)
```zig
pub fn set_mtvt(addr: usize) void {
    asm volatile ("csrw 0x307, a0" :: [a0] "{a0}" (addr));
}
```

```zsh
riscv32-esp-elf-nm -n edge_ai.elf | grep isr
4001b2fc W ledc_isr
4001b320 W systimer_target0_isr
4001b338 W systimer_target1_isr
4001b350 W gpio0_isr
4001b368 W gpio1_isr
4001b380 W flash_mspi_isr
4001b398 W usb_device_isr
4001b3b0 W usb_otg_isr
4001b3c8 W core0_trace_isr
4001b3e0 W assist_debug_isr
```

Where `W` = Weak symbol. 

Checking its setup correctly: 

```zsh
riscv32-esp-elf-readelf -S edge_ai.elf
llvm-readelf -S edge_ai.elf
llvm-readelf -S edge_ai.elf | grep -E "Name|.text|.rodata|.srodata.cst4|.mtvt|.data|.bss|.heap|.stack"

riscv32-esp-elf-objdump -D edge_ai.elf --start-address=0x4ff00000 | less
llvm-objdump -D edge_ai.elf | grep -A150 "<app_main>*"

riscv32-esp-elf-objdump -d firmware-app.elf | grep -A100 "<mtvt>*"
riscv32-esp-elf-objdump -d edge_ai.elf | grep -A100 "<_startup_init>*"
riscv32-esp-elf-objdump -d edge_ai.elf | grep -A100 "<systimer_target0>*"
```

-----------------

##### Mapping Interrupt Sources to CPU Interrupt Signals
We have 128 peripheral interrupt sources that maps into 32 *external* interrupts, 
where external interrupt refer to peripheral sources. And 16 *internal* 
representing e.g., timer and software interrupts. 

1. Identify interrupt source (peripheral trigger) and the associated 
mapping register. For example the source named `USB_SERIAL_JTAG_INTR_SOURCE`
is mapped into index 22. Given by `Offset 0x0058 = 88 → 88/4 = 22`. 

- General mapping formula:
    - `mtvt + 4 * interrupt id` → `addr(mtvt) + offset`
    - Vector offset = `4 * id`, e.g., ID 22 yield offset: `4 * 22 = 88 = 0x0058`

So for each source, there is a corresponding mapping register that is referenced 
as `CORE0_<SOURCE>_INT_MAP_REG` (for CPU0) and so on.

2. For the ESP32-P4 board, the CPU has a pre-defined interrupt number ordering. 
The peripheral interrupt have the dedicated numbers *16 to 47*. In the 
meanwhile, in CLIC-mode the interrupt numbers *0-15* are reserved for 
core-local or *internal* interrupts such as machine timer, software interrupts etc.
While the numbers 16-47 (as mentioned) are used for the 32 interrupt lines 
coming from the interrupt matrix. 

3. After choosing the *interrupt source* in the previous step(2), we need to 
setup and program the mapping register. 
    > 3.1. First we pick the CPU interrupt number into the mapping register 
    for that source. This will route the peripheral's interrupt signal 
    to that CPU interrupt line. 

For example, to map *Timer Group0* (ID 46) to CPU0 interrupt 16, we would 
write the value 16 into the `CORE0_TIMERGRP0_T0_INT_MAP_REG`. 

**Pseudo-code example:**

```zig
const CORE0_SOURCE_INT_MAP_REG: *volatile u32 = @ptrFromInt(base + src_offset);
const interrupt_id = 16;
CORE0_SOURCE_INT_MAP_REG.* = interrupt_id; // <Source> ID X → CPI0 interrupt 16. 
```

***Interrupt Vector Table (MTVT) and Selecting ISR indices***

When we use CLIC in *vectored mode* the CPU automatically vectors to the 
correct ISR using a vector table. The `mtvt` register holds the base 
address of an interrupt vector table in memory. Each entry in this table 
is a pointer (or jump) to an ISR callback for a specific interrupt number.

- *Vector Index = Interrupt number* 

Given that the vector index equal the interrupt number, means that 
*we must place the ISR at the index corresponding to the CPU interrupt 
number we mapped the source to*. From the example above (Pseudo-code), 
we would place the ISR handler function pointer into our `_mtvt_table`
at index 16 in the array/vector table. So the SOURCE ISR pointer would 
be placed at `_mtvt_table[16]`. 

- *Software Interrupts* - ESP32-P4 provide four software interrupt sources. 
These are not tied to a specific peripheral. Where each has its own mapping 
register `COREn_CPU_INTR_FROM_CPU_x_MAP_REG`. Software interrupt serve as a 
way to intentionally cause an interrupt in code. 

| **Source**            	| **Source ID** 	| **Mapping Register**               	| **Interrupt ID** 	|
|:-----------------------:	|:---------------:	|:------------------------------------:	|:------------------:|
| SYSTIMER_TARGET0_INTR 	| 53            	| CORE0_SYSTIMER_TARGET0_INT_MAP_REG 	|                  	|
| SYSTIMER_TARGET1_INTR 	| 54            	| CORE0_SYSTIMER_TARGET1_INT_MAP_REG 	|                  	|
| SYSTIMER_TARGET2_INTR 	| 55            	| CORE0_SYSTIMER_TARGET2_INT_MAP_REG 	|                  	|
| CPU_INTR_FROM_CPU_0   	| 79            	| CORE0_CPU_INTR_FROM_CPU_0_MAP_REG  	|                  	|
| CPU_INTR_FROM_CPU_1   	| 80            	| CORE0_CPU_INTR_FROM_CPU_1_MAP_REG  	|                  	|
| CPU_INTR_FROM_CPU_2   	| 81            	| CORE0_CPU_INTR_FROM_CPU_2_MAP_REG  	|                  	|
| CPU_INTR_FROM_CPU_3   	| 82            	| CORE0_CPU_INTR_FROM_CPU_3_MAP_REG  	|                  	|


***Configuring the CLIC***
- Interrupt Type: Level- or Edge-Triggered.
- Interrupt Priority: Higher priority can preempt lower priorities.
- Enabling the Interrupt: each interrupt line has an enable bit. 
- Interrupt Threshold: filters out interrupts based on priority. 

Enabling interrupt, is done via CSRs (riscv), e.g., by setting the 
global interrupt enable bit `MIE` in the `mstatus` CSR. 

4. After mapping in prior steps (see above) we would configure as: 

    4.1. `set_interrupt_trigger_type(INTR_ID, LEVEL/EDGE);`
    4.2. `set_priority(INTR_ID, priority_num);`
    4.3. `mtvt_table[INTR_ID] = &my_isr_handler;`
    4.4. `enable_interrupt_line(INTR_ID);`

##### Summary:

1. *Find the source ID and corresponding mapping register*.

2. *Route interrupt source to a CPU interrupt line* by writing 
into the `CORE0_SOURCE_INT_MAP_REG` for that source. 

3. *Setup the CPU's interrupt vector table*: Make sure the `mtvt_table`
has an entry at the index equal to the interrupt number choosed. 

4. *Configure interrupt trigger mode and priority*.

5. *Enable the interrupts*: Set enable bit in the CPU's enable 
register. Also enable global interrupt, by `MIE` in `mstatus` CSR.

6. *Define handle and clear logic for the ISR* 

**OBS:**

If we write *1* to `clicintattr[i].shv` we would set the interrupt *i* to vectored. 
The trap handler function address is fetch from the base of `mtvt`, and can be 
explained as (where exccode = interrupt id):
`pc := M[MTVT_BASE + XLEN/8 * exccode] & ~1`

The vector table layout for RV32 (4-byte or 32-bit function pointers):
```
mtvt → 0x4ff00000 # Interrupt 0 handler function pointer
       0x4ff00004 # Interrupt 1 handler function pointer
       0x4ff00008 # Interrupt 2 handler function pointer
       0x4ff0000c # Interrupt 3 handler function pointer
```
With this CLIC vectored mode, we reads a handler function address from 
the table, and jumps to it in hardware. The vector table contains vector 
addresses rather than instructions. More specifically, the entries in the 
table are simple *XLEN-bit* function pointers.

Returning pointer to the trap handler entry (ISR) in our `mtvt` table 
are done using the following pseudo-code: 

```
rd = MTVT_BASE + XLEN/8 * interrupt id // Return pointer to trap handler entry.
```

- Machine XLEN = 1 (32-bit), according to the `misa` (0x301) CSR. 











