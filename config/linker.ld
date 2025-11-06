OUTPUT_ARCH(riscv)
ENTRY(_start) /* The ENTRY(_start) sets the program entry point - the reset handler.*/
 
/* This is the Memory Configuration from the `bootloader.map`:  
 * Memory Configuration
 * Name             Origin             Length             Attributes
 * iram_seg         0x4ff2abd0         0x00002000         xrw
 * iram_loader_seg  0x4ff2cbd0         0x00007000         xrw
 * dram_seg         0x4ff33bd0         0x00005000         rw
 * *default*        0x00000000         0xffffffff
 *
 * */

/* Memory regions and lengths from bootloader map */
bootloader_usable_dram_end = 0x4ff3abd0;
bootloader_stack_overhead = 0x2000;    /* Safety margin for stacks */
bootloader_dram_seg_len = 0x5000;
bootloader_iram_loader_seg_len = 0x7000;
bootloader_iram_seg_len = 0x2000;

/* Calculate segment start/end addresses */
bootloader_dram_seg_end = bootloader_usable_dram_end - bootloader_stack_overhead;
bootloader_dram_seg_start = bootloader_dram_seg_end - bootloader_dram_seg_len;
bootloader_iram_loader_seg_start = bootloader_dram_seg_start - bootloader_iram_loader_seg_len;
bootloader_iram_seg_start = bootloader_iram_loader_seg_start - bootloader_iram_seg_len;

ASSERT(bootloader_iram_loader_seg_start == 0x4FF2CBD0, "bootloader_iram_loader_seg_start inconsistent");

sram_low_start = 0x4FF00000;
sram_low_end = 0x4FF2CBD0; /* 2nd stage bootloader iram_loader_seg start address. See above! */
sram_low_size = sram_low_end - sram_low_start; 

CONFIG_CACHE_L2_CACHE_SIZE = 0x20000; /* L2 Cache Size: 128KB or 0x20000 */
sram_high_start = 0x4FF40000;
sram_high_size = 0x80000 - CONFIG_CACHE_L2_CACHE_SIZE;
sram_high_end = sram_high_start + sram_high_size;

CONFIG_MMU_PAGE_SIZE = 0x10000;

lp_rom_dram_start = 0x5010fa80; 
lp_ram_end = 0x50110000;
lp_rom_dram_size = lp_ram_end - lp_rom_dram_start;


/* ---------- Memory map (ESP32-P4) ---------- */
/* XIP flash VA window is 0x4000_0000..0x43FF_FFFF.
   ROM/bootloader expect XIP sections to start at 0x40000020 (IROM).
   When using a *separate* DROM VMA, place it at 0x40020020 so it lands
   in a different 64 KiB MMU window than IROM(0x40000020). */

MEMORY
{
    /* TCM */
    TCM_RAM (rx) : ORIGIN = 0x30100000, LENGTH = 0x2000

    /* FLASH or IROM segment - flashed mapped instruction data 
     * XIP flash (code) VMA = LMA for XIP sections placed "> IROM".*/ 

    IROM (rx) : ORIGIN = 0x40000020, LENGTH = 0x4000000 - 0x20 /* 0x4000000 - 0x20 = 0x03FFFFE0 
    /* FLASH (rx) : ORIGIN = 0x40000020, LENGTH = 0x4000000 - 0x20 /* 0x4000000 - 0x20 = 0x03FFFFE0  */
 
    /* Flash mapped constant data. 
      XIP flash (const). Uses a different VA window to avoid overlapping. */
    /* DROM (r) :  ORIGIN = 0x40040020, LENGTH = 0x4000000 - 0x400020 */
    DROM (r)  : ORIGIN = 0x40200020, LENGTH = 0x44000000 - 0x40200020 /* = 0x03DFFFE0 */
    /* DROM (r)  : ORIGIN = 0x40400020, LENGTH = 0x44000000 - 0x40400020 /* = 0x03BFFFE0 */ 


    /* 768 KB of on SOC RAM, HP L2MEM (0x4FF0_0000 ~ 0x4FFB_FFFF)
    * Main Image Entry point: 0x4ff003fe, where 0x3FE = 1022 should be 1024
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
/* PROVIDE(_stack_size = 0x4000); */
/* Stack size of 0x8000 = 32 KiB */
PROVIDE(_stack_size = 0x8000);

/* Stack size of 0xC000 = 48 KB */
/* PROVIDE(_stack_size = 0xC000); */
PROVIDE(_stack_bottom = _stack_top - _stack_size);

/* This is where the code (.text) in flash starts. */
PROVIDE(_stext = ORIGIN(IROM));

PROVIDE(_bss_size = _bss_end - _bss_start);
PROVIDE(_bss_end = ADDR(.bss) + SIZEOF(.bss));

/* ROM console & helpers */
PROVIDE(ets_printf                 = 0x4fc00024);
PROVIDE(ets_install_uart_printf    = 0x4fc00030);
PROVIDE(ets_install_usb_printf     = 0x4fc00034);
PROVIDE(ets_delay_us               = 0x4fc0003c);
PROVIDE(rtc_get_reset_reason       = 0x4fc00018);
PROVIDE(ets_get_cpu_frequency      = 0x4fc00040);


PROVIDE(software_reset             = 0x4fc00094);
PROVIDE(software_reset_cpu         = 0x4fc00098);

/* Optional UART bring-up from ROM */
PROVIDE(Uart_Init                  = 0x4fc000c0);

SECTIONS
{

    /* =======================================================
     RUN IN RAM (VMA in SRAM), BYTES STORED IN FLASH (LMA)
     =======================================================
     For sections that must *run from RAM* (IRAM code, .data),
     we give them a RAM VMA ("> SRAM_LOW") and a FLASH LMA.
     Using “AT > IROM” packs their bytes *after* .flash.text
     in the IROM load, which keeps the image compact and yields
     two flash segments total: one IROM (code+copy data) and one
     DROM (rodata XIP).
  */

    . = ORIGIN(IROM);

    /* .flash.text _stext : ALIGN(4) { */

    .flash.text : ALIGN(4) {
        _stext = .;
        _instruction_reserved_start = ABSOLUTE(.);

        /* Beginning of RAM, and where the PC starts when it exits the reset */
        _text_start = ABSOLUTE(.); /* start of .text segment */

        /* PROVIDE(_start = _text_start); */

        *(.text) *(.text.*) /* Place Normal code, our main app here in .text section */
        KEEP(*(.text.app_main))
        *(.gnu.linkonce.t.*)

        . = ALIGN(16);

        _text_end = ABSOLUTE(.); /* end of .text segment */
        _instruction_reserved_end = .;
        _etext = .;
        _flash_cache_start = ABSOLUTE(0);
    } > IROM /* VMA in IROM Flash at 0x40000020... */
  
    /* ASSERT(ADDR(.flash.text) == ORIGIN(IROM), "flash.text must start at 0x40000020") */

    _flash_text_end = .;
    /* . = ORIGIN(IROM); */

    . = ORIGIN(DROM);

    .flash.appdesc : ALIGN(0x10) { 
    /**
     * Mark flash.rodata start.
     * This can be used for mmu driver to maintain virtual address
     */
    _rodata_reserved_start = ABSOLUTE(.);
    _rodata_start = ABSOLUTE(.);

    /* !DO NOT PUT ANYTHING BEFORE THIS! */

    /* Should be the first.  App version info. */
    *(.rodata_desc .rodata_desc.*)
    /* Should be the second. Custom app version info. */
    *(.rodata_custom_desc .rodata_custom_desc.*)

    . += 0x100; /* 256 - Make it non empty! */

    /**
     * Create an empty gap within this section. Thanks to this, the end of this
     * section will match .flash.rodata's begin address. Thus, both sections
     * will be merged when creating the final bin image.
     */
    . = ALIGN(ALIGNOF(.flash.rodata));
    /* . = ALIGN(16); */
    } > DROM
    
    /* ASSERT(ADDR(.flash.appdesc) == 0x40020020, "appdesc must start at 0x40020020") */

    /* Rounds up to the next block of 64KiB (MMU sisze) and add 0x20 */
    _flash_rodata_lma = ((ADDR(.flash.text) + SIZEOF(.flash.text) + 0xFFFF) & ~0xFFFF) + 0x20;
    
    /* .flash.rodata: const data; runs from 0x40020020 (DROM) */
    .flash.rodata : ALIGN(0x10)  {
        /* . = ALIGN(16); */
        _rodata_start = ABSOLUTE(.);
        PROVIDE(_drom_start = _rodata_start);

        *(.irom1.text) /* catch strays */
        *(.gnu.linkonce.r.*)
        *(.rodata .rodata.* .rodata1) /* .text section of the IROM (FLASH) */
            
        /* *(.srodata .srodata.* .sdata2 .sdata2.*) */
        *(.gcc_except_table .gcc_except_table.*)
        *(.gnu.linkonce.e.*)

        _rodata_end = ABSOLUTE(.);
    } > DROM

    . = ORIGIN(SRAM_LOW);
    .iram0.text : ALIGN(0x40) {
        /* Ensure 64-byte alignment for vector table as required by hardware */
        . = ALIGN(0x40); /* Run address (VMA) in SRAM_LOW */
        _iram_start = ABSOLUTE(.);

        ASSERT(ABSOLUTE(.) % 0x40 == 0, "vector address must be 64 byte aligned");
        PROVIDE(_vector_table = .); /* This would set the external var to the start address */ 

        KEEP(*(.iram0.vectors))
        KEEP(*(.iram0.mtvt)) /* This is the vector table containing the ISR callback functions. */ 
        KEEP(*(.iram0.isr_handler))

        /* Here is code that should be running in the IRAM so it needs to be aligned by 4. */
        . = ALIGN(4);                 
        _iram_text_start = ABSOLUTE(.);
        
        KEEP(*(.iram0.entry)) /* Entry point symbol points here - Startup Code */
        KEEP(*(.iram0.startup))
        KEEP(*(.iram0.isr*))

        PROVIDE(_iram_end = .);
    } > SRAM_LOW AT > IROM
    
    PROVIDE(_iram0_lma = LOADADDR(.iram0.text));

    /* RAM sections (64 Mb external RAM, 768 KB L2-MEM, 32 KB LP SRAM): */
    /* .dram0 represent the lower part of the ram, e.g., .dram0.data → SRAM_LOW and .dram1.data → SRAM_HIGH */
    .data : ALIGN(8){
        _dram0_start = ABSOLUTE(.); /* beginning of .data or RAM segment here */
        *(.gnu.linkonce.d.*)
        *(.data*)
        *(.data.*)
        *(.data1)
        PROVIDE(__global_pointer$ = . + 0x800); /* Linker relaxation */
        *(.sdata) *(.sdata.*)
        *(.gnu.linkonce.s.*)
        _dram0_end = ABSOLUTE(.); /* end of data or RAM segment here */
    } > SRAM_LOW AT > IROM /* the .data segment should start directly after the .text section in FLASH (ROM) */

    /* Appending a section to a memory region:  
     * > SRAM_LOW is the VMA, while > DROM is the LMA 
     * This is the same as defining at the top as: 
     * .data ORIGIN(ram) : AT(ORIGIN(DROM)) 
     * Which use the format as .section <VMA> : AT(<LMA>)
     * */

    /* Uninitialized data is set to 0 when <RESET> by our _startup code */
    .bss (NOLOAD) : ALIGN(16) {
        . = ALIGN(16);                 
        _bss_start = ABSOLUTE(.); /* beginning of RAM .bss section */
        *(.bss) *(.bss*)
        *(.sbss*)
        *(COMMON)
        PROVIDE(_bss_end = .);
    } > SRAM_LOW

    /* Recall that the stack grows downwards, from higher address towards lower addresses 
        The stack uses decreasing addresses as new functions are called. */

    .ram.model (NOLOAD) : ALIGN(64) {
        . = ALIGN(64);
        __model_ram_start = .;
        KEEP(*(.ram.model*))
        __model_ram_end = .;
    } > SRAM_LOW
    
    .ram.inference (NOLOAD) : ALIGN(64) {
        . = ALIGN(64);
        __inference_ram_start = .;
        KEEP(*(.ram.inference*))
        __inference_ram_end = .;
    } > SRAM_LOW
    
    ASSERT(__model_ram_start     >= ORIGIN(SRAM_LOW), "model not in SRAM_LOW")
    ASSERT(__model_ram_end       <= ORIGIN(SRAM_LOW) + LENGTH(SRAM_LOW), "model too large for SRAM_LOW")
    ASSERT(__inference_ram_start >= ORIGIN(SRAM_LOW), "inference not in SRAM_LOW")
    ASSERT(__inference_ram_end   <= ORIGIN(SRAM_LOW) + LENGTH(SRAM_LOW), "inference too large for SRAM_LOW")

    /* Heap ends at top of dram0_0_seg */
    .heap (NOLOAD) : {
        . = ALIGN(16);
        _start_heap = .;
        /* . = ORIGIN(SRAM_LOW) + LENGTH(SRAM_LOW); */
        _end_heap = .;
         /* PROVIDE(_heap_size = _end_heap - _start_heap); */
    } > SRAM_LOW
      
    .stack (NOLOAD) : {
        PROVIDE(_stack_top = .); /* Represent the top of the stack (Lower address value) */
        . += _stack_size; /* the stack size is reserved below the _sp (stack pointer) */  
        PROVIDE(_stack_bottom = .); /* Represent the bottom of the stack (High address value) */
    } > SRAM_HIGH

    PROVIDE (end = . );
    PROVIDE (_end = . );

    PROVIDE(_data_start = LOADADDR(.data));
    PROVIDE(_iram0_lma  = LOADADDR(.iram0.text));

    PROVIDE(_end_heap = (ORIGIN(SRAM_HIGH) + LENGTH(SRAM_HIGH)) - _stack_size);
    PROVIDE(_start_heap = _data_start + (_bss_end - _dram0_start));
    PROVIDE(_heap_size = _end_heap - _start_heap);

    ASSERT(SIZEOF(.flash.text) <= (LENGTH(IROM) - 0x20), "FLASH IROM Overflow (.flash.text)!")
    ASSERT(SIZEOF(.flash.rodata) <= (LENGTH(DROM) - 0x20), "FLASH DROM Overflow (.flash.rodata)!")
    
    /* rodata must begin IMMEDIATELY after appdesc (no gap) */
    ASSERT(ADDR(.flash.rodata) == ADDR(.flash.appdesc) + SIZEOF(.flash.appdesc),
       "The gap and .flash.rodata must begin IMMEDIATELY after .flash.appdesc the final bin image.")

}


