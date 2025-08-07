### ESP32-P4 Memory Types:

Two separate types that is distinguished by one *instruction* memory bus (IRAM, IROM, RTC Fast), 
and a *data* memory bus (DRAM, DROM). 

**MEMORIES:**
- 128 KB of ROM → *Non-Volatile*.
- 768 KB of L2MEM → *RAM (Volatile)*.
- 32 KB of LP SRAM.
- 16 MB of PSRAM.

------------------
##### DRAM (Data RAM):
- DRAM (Data RAM): `.data` and `.bss` is placed by the linker into Internal SRAM as data memory. 
while the remaining space in this region is used for the runtime *heap*. 

DRAM → SRAM (Internal data memory) → `.data`, `.bss`, *runtime heap*. 

- All DRAM memory is *single-byte* accessible. 

------------------
##### IRAM (Instruction RAM):
- Timing critical code, can be placed in IRAM to reduce the penalty associated with loading
the code from flash. Placing functions in IRAM can reduce delays caused by *cache misses*.

- Instruction Memory: 4-byte aligned words. 

##### TCM (Tightly-Coupled-Memory):
The TCM memory is placed close the CPU, and is accessible at CPU frequency without passing through a cache. 
Often useful for time-critical routines. 

#### Stack and Heap (Linker Scripts):

The linker script *reserves* memory regions for the `.stack` and `.heap`. 
But the CPU does not enforce any boundaries between them. It is my 
responsibility to avoid overflows at runtime. The memory regions in the 
linker script are in the same regions unless you split it into multiple 
`MEMORY {}` regions in the script. 
| MEMORY LAYOUT   |
|---|
| a  |
| b  |
| c  |
| d  |
| e  |
| f  |



#### Memory Layout Sections:
1. Bootloader / Reset Vector: 
At the lowest address, the memory is reserved for the bootloader or reset vector. 
Which purpose is to initialize the hardware and loads the main application. 

2. *Vector Table*: 
After the prior bootloader (or reset vector) step, the vector table contain 
addresses of ISRs. That allows to jump to handle different hardware interrupts. 

3. Text, Code Section:
This memory section holds the executable instructions of the main application. 
It usally lives in the flash memory. 

4. *Data Sections*: 
- *Read-Only Data* (ROM) - constants, static data that do not change. 

- Initialized Data - global and static variables initialized to specific values, 
loaded into RAM at startup. 

- *BSS* - uninitialized global and static variables typically zero-filled at startup 
and located in RAM. 

----------------------
`.text` → Flash → program code. 
`.data` → RAM (copied from Flash to RAM) → Initialized global/static variables.
`.bss` → RAM → Zero-initialized global/static variables.
`stack` → RAM → Function call/return, local variables. 
`heap` → RAM → Dynamic allocated memory.
`MMIO` → Reserved peripheral address space → Direct hardware access.

The `.data` is copied from *Flash* to *RAM* at startup (startup code).

----------------------

#### Terminology: 

- *Internal Memory* - Refer to the main or primary memory 
- *External Memory* - Also called *secondary memory* that retain and store data presistently. 

Two types of *internal memory*: 
- ROM: Read-Only memory that is non-volatile, meaning it retains data without power. 
Used often for starting and booting the computer. 

- RAM: "Random-Access-Memory", that stores data temporarily while the CPU is executing 
tasks. RAM is volatile, that means it will not retain data if there is no power. 

Two types of *RAM*:

- **DRAM** - *Dynamic RAM*, often used as the main memory. But DRAM has to bre refreshed 
every few miliseconds (periodically) to retain its data. Because of storing in capacitors.

- **SRAM** - *Static RAM*, in contrast to the DRAM, it keeps data in the memory as long 
as power is supplied to the system. Hence, SRAM is faster but more expensive. Internally 
it stores a bit using flip-flops. 

```

                    Internal Primary Memory
                     /                 \
                    /                   \
                   ROM                  RAM
              (Non-Volatile)         (Volatile)
                    |                 /      \
                  FLASH             SRAM    DRAM
              (storing code)
```








