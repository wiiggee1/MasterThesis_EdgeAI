/* Default entry point: */
/* ENTRY(call_start_cpu0);*/
OUTPUT_ARCH(riscv)
ENTRY(_start) /* The ENTRY(_start) sets the program entry point - the reset handler.*/
 
/* Internal Memory on SOC RAM: 
       HP ROM (128 KB): Read-only memory dedicated to the HP system and is not programable. 
       HP L2MEM (768 KB): Volatile memory accessible by the HP CPU, LP CPU or DMA peripherals. 
       LP ROM (16 KB): Read-only, memory, containing code for booting the LP CPU. 
       LP SRAM (32 KB): Volatile memory accessible by both HP CPU and LP CPU.
       HP SPM (8 KB): Volatile Memory accessed by the HP CPU, takes two cycles to finish. 
                   | → 128 KB HP ROM (0x4FC0_0000 ~ 0x4FC1_FFFF)          | 
                   | → 768 KB HP L2MEM (0x4FF0_0000 ~ 0x4FFB_FFFF)        |
                   | → 64 MB external flash (0x4000_0000 ~ 0x43FF_FFFF)   | 
                   | → 64 MB external RAM (0x4800_0000 ~ 0x4BFF_FFFF)     | 

External Memory: 
        FLASH address space:  0x4000_0000 ~ 0x43FF_FFF (Cached flash) & 0x8000_0000 ~ 0x83FF_FFF (non cache, slower).
        RAM address space:  0x4800_0000 ~ 0x4BFF_FFF (Cached RAM) &  0x8800_0000 ~ 0x8BFF_FFF (non cached, RAM).
*/
    
    /* The code and read-only data goes into the IRAM - Instruction RAM:
     
     IROM (Code Executed from flash) 
        → Most of the application's binary code is placed here, since IRAM is limited. 
     ...During Application Startup the bootloader (which runs from IRAM) configures 
        the MMU flash cache to map the app's instruction code region to the instruction space. 

    DROM (Data Stored in flash)
        → Same as IROM section, but is for read-only data not executable code. */
MEMORY
{
    /* IDROM_SEG_SIZE (CONFIG_MMU_PAGE_SIZE << 10) = 64 MB */

    FLASH (rx) : ORIGIN = 0x40000020, LENGTH = 4M /* 4 MB Flash 
    /* FLASH (rx) : ORIGIN = 0x40000020, LENGTH = 0x1000000 - 0x20   */
    /* irom_seg (RX) :  org = 0x40000020, len = IDROM_SEG_SIZE - 0x20 */

    /* IROM (rx) : ORIGIN = 0x40000020, LENGTH = 0x1000000 - 0x20 */
    /* DROM (r) :  ORIGIN = 0x41000020, LENGTH = 0x1000000 - 0x20 */

    /* 768 KB of on SOC RAM, HP L2MEM (0x4FF0_0000 ~ 0x4FFB_FFFF)
       Used for stack, .bss , .data, (heap), interrupt vector tables. 
    */
    SRAM_LOW (rwx) : ORIGIN = 0x4FF00000, LENGTH = 0x0002CBD0 /* .data, .bss, .heap */
    SRAM_HIGH (rw) : ORIGIN = 0x4FF40000, LENGTH = 0x00060000 /* stack */

    /* External RAM - Higher latency, larger size, heap, files etc...*/
    /* EXTERNAL_RAM (rwx) : ORIGIN = 0x48000000, LENGTH = 0x04000000 */
}


/* PROVIDE - define a symbol only if it is referenced and is not defined by any object included in the link */

/*  The `.` syntax is the linker location counter (i.e., current memory address being filled).*/
PROVIDE(_max_hart_id = 0);
PROVIDE(_stack_top = ORIGIN(SRAM_HIGH) + LENGTH(SRAM_HIGH)); /* stack start */
PROVIDE(_stack_size = 0x4000);
PROVIDE(_stack_bottom = _stack_top - _stack_size);

PROVIDE(_stext = ORIGIN(FLASH));
/* PROVIDE(_stext = ORIGIN(IROM)); */
/* PROVIDE(_text_end = ...) */

/* PROVIDE(_interrupt_handler = ...); */
/* PROVIDE(_panic_handler = ...); */

/* PROVIDE(_dram0_size = ...); */
/* PROVIDE(_dram0_end = ...); */

PROVIDE(_bss_size = _bss_end - _bss_start);
PROVIDE(_bss_end = ADDR(.bss) + SIZEOF(.bss));

SECTIONS
{
    /* . = ABSOLUTE(_stext); */
    /* _start = ABSOLUTE(.);  */

    .text : ALIGN(4){
        /* Beginning of RAM, and where the PC starts when it exits the reset */
        _instruction_reserved_start = ABSOLUTE(.);
        _text_start = ABSOLUTE(.); /* start of .text segment */

        PROVIDE(_start = _text_start);
        KEEP(*(.text.entry)) /* Our Startup Code */
        KEEP(*(.text.startup))

        *(.text) *(.text.*) /* Place Normal code, our main app here in .text section */
        *(.gnu.linkonce.t.*)
        _text_end = ABSOLUTE(.); /* end of .text segment */
    } > FLASH
    /* } > IROM */

    .iram0.mtvt : ALIGN(0x40) {
        _iram_start = ABSOLUTE(.);
        /* PROVIDE(_iram_start = _iram_start); */
        /* . = ALIGN(64); */
        ASSERT(ABSOLUTE(.) % 0x40 == 0, "vector address must be 64 byte aligned");
        PROVIDE(_vector_table = .); /* This would set the external var to the start address */ 
        /* *(.iram0.mtvt) */
        KEEP(*(.iram0.mtvt)) /* This is the vector table containing the ISR callback functions. */ 

        /* . = ALIGN(X);                  */
        /* SYMBOL = ABSOLUTE(.); */

        PROVIDE(_iram_end = .);
        . = ALIGN(8); /* Advance the location counter */
    } > SRAM_LOW 

    
    .rodata : ALIGN(0x10){
        _rodata_start = ABSOLUTE(.);
        PROVIDE(_drom_start = _rodata_start);
        /* Should be the second. Custom app version info. */
        /* *(.rodata_startup_info .rodata_startup_info.*) */
        *(.rodata .rodata.*) /* .text section of the IROM (FLASH) */
            
        *(.srodata .srodata.* .sdata2 .sdata2.*)
        *(.gnu.linkonce.r.*)

        *(.rela.data .rela.data.*) 
        *(.rela.gnu.linkonce.r.*)

        _rodata_end = ABSOLUTE(.);
    } > FLASH
    /* } > DROM */

    _drom_size = . - _drom_start;

    /* RAM sections (64 Mb external RAM, 768 KB L2-MEM, 32 KB LP SRAM): */
    .data : ALIGN(8){
        . = ALIGN(8);                 
        _dram0_start = ABSOLUTE(.); /* beginning of .data or RAM segment here */

        *(.data*) *(.data.*)
        *(.gnu.linkonce.d.*)
        /* PROVIDE(__global_pointer$ = . + 0x800); /* Linker relaxation */ */
        *(.sdata*) *(.sdata.*)
        *(.gnu.linkonce.s.*)

        _dram0_end = ABSOLUTE(.); /* end of data or RAM segment here */
    } > SRAM_LOW AT > FLASH /* the .data segment should start directly after the .text section in FLASH (ROM) */
    /* } > SRAM_LOW AT > DROM /* the .data segment should start directly after the .text section in FLASH (ROM) */ 

    /* Uninitialized data is set to 0 when <RESET> by our _startup code */
    .bss (NOLOAD) : {
        . = ALIGN(16);                 
        _bss_start = ABSOLUTE(.); /* beginning of RAM .bss section */
        *(.bss*)
        *(.sbss*)
        /* *(.gnu.linkonce.sb.*) */
        /* *(.gnu.linkonce.b.*) */
        /* *(COMMON) */
        PROVIDE(_bss_end = .);
    } > SRAM_LOW

    /* Recall that the stack grows downwards, from higher address towards lower addresses 
        The stack uses decreasing addresses as new functions are called. */

    .stack (NOLOAD) : {
        PROVIDE(_stack_top = .); /* Represent the top of the stack (Lower address value) */
        . += _stack_size; /* the stack size is reserved below the _sp (stack pointer) */  
        PROVIDE(_stack_bottom = .); /* Represent the bottom of the stack (High address value) */
    } > SRAM_HIGH

    
    /* Heap ends at top of dram0_0_seg */
    .heap (NOLOAD) : {
        . = ALIGN(16);
        _start_heap = .;
        /* . = ORIGIN(SRAM_LOW) + LENGTH(SRAM_LOW); */
        _end_heap = .;
         /* PROVIDE(_heap_size = _end_heap - _start_heap); */
    } > SRAM_LOW

    PROVIDE(_data_start = LOADADDR(.data));
    PROVIDE(__global_pointer$ = _dram0_start + 0x800); /* Linker relaxation */

    PROVIDE(_end_of_heap = (ORIGIN(SRAM_HIGH) + LENGTH(SRAM_HIGH)) - _stack_size);
    PROVIDE(_start_heap = _data_start + (_bss_end - _dram0_start));

    PROVIDE(_end_heap = _end_of_heap);
    PROVIDE(_heap_size = _end_heap - _start_heap);
}

    /* #define ALIGNED_SYMBOL(X, SYMBOL)   \ */
    /* \n    . = ALIGN(X);                 \ */
    /* \n    SYMBOL = ABSOLUTE(.); */

  /* [Nr] Name              Type            Address  Off    Size   ES Flg Lk Inf Al */
  /* [ 8] .iram0.text       PROGBITS        4ff00000 046000 00e2ea 00  AX  0   0 64 */
  /* [ 9] .iram0.text_end   NOBITS          4ff0e2ea 0542ea 000016 00  WA  0   0  1 */
  /* [10] .iram0.data       PROGBITS        4ff0e300 057000 000000 00   W  0   0  1 */
  /* [11] .iram0.bss        PROGBITS        4ff0e300 057000 000000 00   W  0   0  1 */
  /* [12] .dram0.data       PROGBITS        4ff0e300 054300 001d91 00  WA  0   0  8 */
  /* [13] .dram1.data       PROGBITS        4ff40000 057000 000000 00  WA  0   0  8 */
  /* [14] .noinit           NOBITS          4ff10091 056091 000003 00  WA  0   0  1 */
  /* [15] .flash.text       PROGBITS        40000020 002020 018d50 00  AX  0   0  2 */
  /* [16] .flash_rodata_dummy NOBITS        40000020 01b020 020000 00  WA  0   0  1 */
  /* [17] .flash.appdesc    PROGBITS        40020020 03b020 000100 00   A  0   0 16 */
  /* [18] .flash.rodata     PROGBITS        40020120 03b120 009e34 00   A  0   0 16 */
  /* [19] .flash.init_array INIT_ARRAY      40029f54 044f54 0000ec 04  WA  0   0  4 */
  /* [20] .eh_frame_hdr     PROGBITS        4002a040 057000 000000 00   W  0   0  1 */
  /* [21] .eh_frame         PROGBITS        4002a040 057000 000000 00   W  0   0  1 */
  /* [22] .flash.tdata      PROGBITS        4002a040 057000 000000 00   W  0   0  1 */
  /* [23] .dram0.bss        NOBITS          4ff100a0 056091 00173c 00  WA  0   0 16 */
  /* [24] .dram1.bss        NOBITS          4ff40000 057000 000000 00  WA  0   0 16 */
  /* [25] .dram0.heap_start_low NOBITS      4ff117dc 056091 000004 00  WA  0   0  1 */
  /* [26] .dram1.heap_start_high PROGBITS   4ff40000 057000 000000 00   W  0   0  1 */


