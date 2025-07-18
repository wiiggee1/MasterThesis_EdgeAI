#!/bin/bash

set -e
set -x 
clear

# Running ./script.sh → Variable are lost after script exits.
# While running: `source script.sh` → Make variables presist in current shell.
source "$HOME/esp/esp-idf/export.sh"

# idf.py -p /dev/ttyACM0 flash monitor
# python3 -m esptool -port /dev/ttyACM0 write_flash 0 ./zig-out/bin/$1.bin

# Build command (esptool):
python -m esptool --chip esp32p4 -b 460800 --before default_reset --after hard_reset write_flash --flash_mode dio --flash_size 2MB --flash_freq 80m 0x2000 build/bootloader/bootloader.bin 0x8000 build/partition_table/partition-table.bin 0x10000 build/hello_world.bin

# Flash command (esptool):
python -m esptool --chip esp32p4 -b 460800 --before default-reset --after hard-reset write-flash --flash-mode dio --flash-size 2MB --flash-freq 40m 0x2000 build/bootloader/bootloader.bin 0x8000 build/partition_table/partition-table.bin 0x10000 ./zig-out/bin/$1.bin

# python -m esptool --chip esp32p4 -b 460800 --before default-reset --after hard-reset write-flash "@flash_args"

clear

### Application Startup Flow ### 
# 1. First stage (ROM) bootloader loads image to RAM (IRAM & DRAM)
# from flash offset 0x2000.
#
# 2. Second Stage Bootloader - loads partition table and main app image from flash. 
#   - The partition-table is flashed to (default offset) 0x8000 in the flash.
#   - Firmware binary (factory app) is flashed at offset 0x10000.
#
# Example Partition Table (hello_world example):
# *******************************************************************************
#   # ESP-IDF Partition Table
#   # Name, Type, SubType, Offset, Size, Flags
#   nvs,data,nvs,0x9000,24K,
#   phy_init,data,phy,0xf000,4K,
#   factory,app,factory,0x10000,1M,
# *******************************************************************************
#
# 3. Application Startup execution: 
#   - Second CPU and RTOS scheduler are started. 
#
#
