# Application and Bootloader Startup sequence

1. First stage ROM bootloader loads the *second stage* bootloader image to RAM (IRAM & DRAM)
from flash offset **0x2000.**

2. **Second Stage Bootloader** loads the *partition table* and *main app* from flash. 
The main app includes both RAM segments (IRAM & DRAM) and *read-only* segments mapped 
via flash cache. 

3. **Application Startup** executes → Entrypoint.

- *Second Stage Bootloader binary image* is loaded from the start of flash at offset **0x2000.**
Meaning that if we have set the FLASH in the linker script as: 

    FLASH (rx) : ORIGIN = 0x40000020, LENGTH = 4M /* 4 MB Flash 

It will get mapped or live in the address space: 0x40000020 + 0x2000 → *0x40002020.*

After loading the *second stage bootloader*, it will jump to the second stage bootloader 
**Entrypoint,** that is found in the binary image header. 

**NOTE:** This Entrypoint is not the same as our startup entrypoint!?

After reading and jumping to the entrypoint, it reads the partition table at offset **0x8000.**
At the selected partition, the second stage bootloader reads the *binary image* from flash 
one segment at a time. Here it will perform the following: 

- For segments with load addresses in internal *IRAM* or *DRAM* the contents are copied
from flash to the load address.

- For segments which have load addresses in *DROM (Data stored in flash)* or *IROM (Code executed from flash)* 
regions, the flash *MMU* is configured to provide the correct mapping from the flash to the load address.

Once all segments are processed - code loaded and flash MMU is set up, it will jump to the 
application *entrypoint* found in the *binary image header.*

Bootloader Image Header, Segments, and Memory Configuration:
====================

Below is an exmaple of a *Main* Image Header and associated Memory Configuration: 

## ESP32P4 Image Header - Main
====================
Image version: 1
Entry point: **0x4ff003fe** → *<call_start_cpu0>* 
Segments: 6
Flash size: 2MB
Flash freq: 80m
Flash mode: DIO

## Segments Information - Main Segments
====================
Segment   Length   Load addr   File offs  Memory types
-------  -------  ----------  ----------  ------------
      0  0x0a038  0x40020020  0x00000018  DROM, IROM
      1  0x00044  0x30100000  0x0000a058
      2  0x05f6c  0x4ff00000  0x0000a0a4  DRAM, BYTE_ACCESSIBLE, IRAM
      3  0x18e10  0x40000020  0x00010018  DROM, IROM
      4  0x08380  0x4ff05f6c  0x00028e30  DRAM, BYTE_ACCESSIBLE, IRAM
      5  0x01d94  0x4ff0e300  0x000311b8  DRAM, BYTE_ACCESSIBLE, IRAM


## Memory Configuration - Main
====================
Name             Origin             Length             Attributes
iram_seg         0x4ff2abd0         0x00002000         xrw
iram_loader_seg  0x4ff2cbd0         0x00007000         xrw
dram_seg         0x4ff33bd0         0x00005000         rw
*default*          0x00000000         0xffffffff


Below is an exmaple of a *Bootloader* Image Header and associated Memory Configuration: 

## ESP32P4 Image Header - Bootloader
====================
Image version: 1
Entry point: **0x4ff2abda**
Segments: 3
Flash size: 2MB
Flash freq: 80m
Flash mode: DIO


## Segments Information - Bootloader Segments
====================
Segment   Length   Load addr   File offs  Memory types
-------  -------  ----------  ----------  ------------
      0  0x01634  0x4ff33ce0  0x00000018  DRAM, BYTE_ACCESSIBLE, IRAM
      1  0x00d80  0x4ff2abd0  0x00001654  DRAM, BYTE_ACCESSIBLE, IRAM
      2  0x03310  0x4ff2cbd0  0x000023dc  DRAM, BYTE_ACCESSIBLE, IRAM


## Memory Configuration - Bootloader
====================
Name             Origin             Length             Attributes
iram_seg         0x4ff2abd0         0x00002000         xrw
iram_loader_seg  0x4ff2cbd0         0x00007000         xrw
dram_seg         0x4ff33bd0         0x00005000         rw
*default*          0x00000000         0xffffffff

# Summary:

We have two distinct binary images: 
- bootloader.bin, Entry point: **0x4ff2abda** → *<call_start_cpu0>*, Flashed at offset: *0x2000*
- main.bin, Entry point: **0x4ff003fe** → *<call_start_cpu0>*, Flashed at offset: *0x10000*  

While the parition table binary is at offset: **0x8000**. 

1. Bootloader (section .iram.text)





