#!/bin/bash

set -a
set -e
clear

FLASH_TARGET=""

# Running ./script.sh → Variable are lost after script exits.
# While running: `source script.sh` → Make variables presist in current shell.
source "$HOME/esp/esp-idf/export.sh"

clear

if [[ "$1" == "--board" ]]; then
    FLASH_TARGET="$2"
fi

if [[ "$1" == "--target" ]]; then
    FLASH_TARGET="$2"
fi

if [[ "$1" == "--example" ]]; then
    FLASH_TARGET="$2"
fi

# echo "Creating Main App Image, using elf2image (esptool.py)..."
#
# esptool \
#     --chip esp32p4 \
#     elf2image \
#     --flash-mode dio \
#     --flash-freq 80m \
#     --flash-size 2MB \
#     --output zig-out/bin/main.bin zig-out/bin/$2.elf
#
# echo "\nCreating the Partition Binary from the 'partition_table.csv'..."
#
# gen_esp32part.py config/bootloader/partition_table.csv zig-out/bin/partition.bin

# qio = 0
# qout = 1
# dio = 2
# dout = 3

# ESP32P4 Image Header
# ====================
# Image version: 1
# Entry point: 0x4ff2abda
# Segments: 3
# Flash size: 2MB
# Flash freq: 80m
# Flash mode: DIO

# Baud rate's tested: 115200, 460800
#
# python -m esptool --chip esp32p4 -b 460800 --before default_reset --after hard_reset write_flash --flash_mode dio --flash_size 2MB --flash_freq 80m 0x2000 build/bootloader/bootloader.bin 0x8000 build/partition_table/partition-table.bin 0x10000 build/main.bin

# esptool.py v4.10.dev2
# Creating esp32p4 image...

esptool \
    --chip esp32p4 \
    --port /dev/ttyACM0 \
    erase-flash

esptool \
    --chip esp32p4 \
    --port /dev/ttyACM0 \
    --baud 115200 \
    --before default-reset \
    --after hard-reset \
    write-flash --flash-mode dio --flash-size 2MB --flash-freq 80m \
    0x2000 zig-out/bin/bootloader.bin \
    0x8000 zig-out/bin/partition.bin \
    0x10000 zig-out/bin/main.bin \
    # --verify
picocom --baud 115200 /dev/ttyACM0

# esptool.py \
#   --chip esp32p4 \
#   --port /dev/ttyACM0 \
#   --baud 460800 \
#   --before=default_reset \
#   --after=hard_reset \
#   write_flash 0x10000 zig-out/bin/$2.bin \
#   --verify
# picocom --baud 460800 /dev/ttyACM0
