#!/bin/bash

set -a
set -e

FLASH_TARGET=""

# Running ./script.sh → Variable are lost after script exits.
# While running: `source script.sh` → Make variables presist in current shell.
source "$HOME/esp/esp-idf/export.sh"

if [[ "$1" == "--board" ]]; then
    FLASH_TARGET="$2"
fi

if [[ "$1" == "--target" ]]; then
    FLASH_TARGET="$2"
fi

if [[ "$1" == "--example" ]]; then
    FLASH_TARGET="$2"
fi

echo "Creating Main App Image, using elf2image (esptool.py)...\n"

# --min-rev-full INTEGER RANGE [0<=x<=65536]  Minimal chip revision (in format: major * 100minor).                                                                                                                                         
# --max-rev-full  INTEGER RANGE [0<=x<=65536]  Maximal chip revision (in format: major * 100 + minor).

esptool \
    --chip esp32p4 \
    elf2image \
    --flash-mode dio \
    --flash-freq 80m \
    --flash-size 2MB \
    --min-rev-full 0 --max-rev-full 199 \
    --output zig-out/bin/main.bin zig-out/bin/$2.elf

echo "Fetching pre-built bootloader image...\n"
cp -r config/bootloader/bootloader.bin zig-out/bin/

echo "Creating the Partition Binary from the 'partition_table.csv'...\n"
gen_esp32part.py config/bootloader/partition_table.csv zig-out/bin/partition.bin

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
