#!/bin/bash

set -a
set -e
clear

FLASH_TARGET=""
# BINARY_PATH=""

# Running ./script.sh → Variable are lost after script exits.
# While running: `source script.sh` → Make variables presist in current shell.
# source "$HOME/esp/esp-idf/export.sh"

if [[ "$1" == "--board" ]]; then
    FLASH_TARGET="$2"
fi

if [[ "$1" == "--target" ]]; then
    FLASH_TARGET="$2"
fi

if [[ "$1" == "--example" ]]; then
    FLASH_TARGET="$2"
fi

# if [[ "$3" == "--bin_path" ]]; then
#     BINARY_PATH="$4"
# else if [[ "$3" == "--path" ]]; then
#     BINARY_PATH="$4"
# fi

# idf.py -p /dev/ttyACM0 flash monitor
# python3 -m esptool -port /dev/ttyACM0 write_flash 0 ./zig-out/bin/$1.bin

# Flash command (esptool):
# python -m esptool --chip esp32p4 -b 460800 --before default-reset --after hard-reset write-flash --flash-mode dio --flash-size 2MB --flash-freq 40m 0x2000 build/bootloader/bootloader.bin 0x8000 build/partition_table/partition-table.bin 0x10000 ./zig-out/bin/$1.bin

esptool \
  --chip esp32p4 \
  --port /dev/ttyACM0 \
  --baud 115200 \
  write-flash --flash-mode dio --flash-size 4MB 0x00000000 zig-out/bin/$2.bin \
  # --verify
picocom --baud 115200 /dev/ttyACM0
