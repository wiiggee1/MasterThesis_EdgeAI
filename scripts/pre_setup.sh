#!/bin/bash

set -a

# Running ./script.sh → Variable are lost after script exits.
# While running: `source script.sh` → Make variables presist in current shell.
source "$HOME/esp/esp-idf/export.sh"
source idf.py set-target esp32p4
export TARGET_BOARD = "PATH..."
# python3 -m esptool -port /dev/ttyACM0 write_flash 0 ./zig-out/bin/$1.bin

#######################################
echo $ZIG_XTENSA
current_dir=$(pwd)
component_dir=$IDF_PATH/components/

echo "$current_dir"
echo "$component_dir"
######################################
echo $IDF_PATH 
source $IDF_PATH/export.sh
source $IDF_PATH/add_path.sh

######################################
cd "$current_dir"/main
$ZIG_XTENSA build "$@"

idf.py set-target esp32s3
idf.py build

# Source before building 
source env.sh
zig build
