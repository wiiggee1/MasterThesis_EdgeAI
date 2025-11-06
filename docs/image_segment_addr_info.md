Memory Configuration - Image:
====================

Name             Origin             Length             Attributes
tcm_idram_seg    0x30100000         0x00002000         xr
irom_seg         0x40000020         0x03ffffe0         xr
sram_low         0x4ff00000         0x0002cbd0         xrw
sram_high        0x4ff40000         0x00060000         rw
drom_seg         0x40000020         0x03ffffe0         r
lp_ram_seg       0x50108018         0x00007fe8         rw
lp_reserved_seg  0x50108000         0x00000018         rw
extern_ram_seg   0x48000000         0x04000000         xrw
*default*          0x00000000         0xffffffff


Memory Configuration - Bootloader
====================

Name             Origin             Length             Attributes
iram_seg         0x4ff2abd0         0x00002000         xrw
iram_loader_seg  0x4ff2cbd0         0x00007000         xrw
dram_seg         0x4ff33bd0         0x00005000         rw
*default*          0x00000000         0xffffffff

--------------------

Image size: 208768 bytes

ESP32P4 Image Header
====================
Image version: 1
Entry point: **0x4ff003fe** → *<call_start_cpu0>* 
Segments: 6
Flash size: 2MB
Flash freq: 80m
Flash mode: DIO

Segments Information
====================
Segment   Length   Load addr   File offs  Memory types
-------  -------  ----------  ----------  ------------
      0  0x0a038  0x40020020  0x00000018  DROM, IROM
      1  0x00044  0x30100000  0x0000a058
      2  0x05f6c  0x4ff00000  0x0000a0a4  DRAM, BYTE_ACCESSIBLE, IRAM
      3  0x18e10  0x40000020  0x00010018  DROM, IROM
      4  0x08380  0x4ff05f6c  0x00028e30  DRAM, BYTE_ACCESSIBLE, IRAM
      5  0x01d94  0x4ff0e300  0x000311b8  DRAM, BYTE_ACCESSIBLE, IRAM

Firmware Image Format - Header: 
- The image header is 8 bytes long. 

| Byte |   Description   
|   0  | Magic byte (always 0xE9)
|   1  | Number of segments 
|   2  | SPI Flash Mode (QIO = 0, QOUT = 1, DIO = 2, DOUT = 3)
|   3  | High four bits - Flash Size (0-7 as 1MB - 128MB). Lower four bits - Flash Frequency (0, 1, 2, 0xf)
|  4-7 | Entry point address 

Image Header hex dump: 
====================

00000000: e906 021f fe03 f04f ee00 0000 1200 0001  .......O........
00000010: 00c7 0000 0000 0001 2000 0240 38a0 0000  ........ ..@8...
00000020: 3254 cdab 0000 0000 0000 0000 0000 0000  2T..............
00000030: 3100 0000 0000 0000 0000 0000 0000 0000  1...............
00000040: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000050: 6d61 696e 0000 0000 0000 0000 0000 0000  main............
00000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000070: 3131 3a34 323a 3531 0000 0000 0000 0000  11:42:51........
00000080: 4175 6720 2038 2032 3032 3500 0000 0000  Aug  8 2025.....
00000090: 7635 2e34 2e32 0000 0000 0000 0000 0000  v5.4.2..........

During Flash: 
====================

I (87) esp_image: segment 0: paddr=00010020 vaddr=40020020 size=0a038h ( 41016) map
I (101) esp_image: segment 1: paddr=0001a060 vaddr=30100000 size=00044h (    68) load
I (103) esp_image: segment 2: paddr=0001a0ac vaddr=4ff00000 size=05f6ch ( 24428) load
I (114) esp_image: segment 3: paddr=00020020 vaddr=40000020 size=18e10h (101904) map
I (132) esp_image: segment 4: paddr=00038e38 vaddr=4ff05f6c size=08380h ( 33664) load
I (139) esp_image: segment 5: paddr=000411c0 vaddr=4ff0e300 size=01d94h (  7572) load
