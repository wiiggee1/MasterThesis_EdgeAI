#!/bin/bash

set -a
set -e # Exit on error

arg="$1"
CURR_DIR=$(pwd)
cd ..
PROJECT_ROOT=$(pwd)
# PROJECT_ROOT="$CURR_DIR/../"
COMP_DIR=$IDF_PATH/components/

TARGET=""
TOOLCHAIN_VERSION=""
SYSROOT_PATH=""

echo "Arg recieved: $arg"
cd "$PROJECT_ROOT"

# Running ./script.sh → Variable are lost after script exits.
# While running: `source script.sh` → Make variables presist in current shell.
source "$HOME/esp/esp-idf/export.sh"
source "$IDF_PATH/add_path.sh"

# Remember operations is space sensitive in bash. 
if [[ "$arg" == "esp32p4" ]]; then
    TARGET="esp32p4"
    TOOLCHAIN_VERSION=$(riscv32-esp-elf-gcc --version | head -n 1 | grep -oE 'esp-[0-9]+\.[0-9]+\.[0-9]+_[0-9]+')
    SYSROOT_PATH="$HOME/.espressif/tools/riscv32-esp-elf/$TOOLCHAIN_VERSION/riscv32-esp-elf/riscv32-esp-elf/include"
    export CMAKE_C_COMPILER=$(riscv32-esp-elf-gcc)
    export CMAKE_CXX_COMPILER=$(riscv32-esp-elf-g++)
    export CMAKE_ASM_COMPILER=$(riscv32-esp-elf-gcc)
fi 

if [[ "$arg" == "esp32s3" ]]; then
    TARGET="esp32s3"
    TOOLCHAIN_VERSION=$(xtensa-esp-elf-gcc --version | head -n 1 | grep -oE 'esp-[0-9]+\.[0-9]+\.[0-9]+_[0-9]+')
    SYSROOT_PATH="$HOME/.espressif/tools/xtensa-esp-elf/$TOOLCHAIN_VERSION/xtensa-esp-elf/xtensa-esp-elf/include"
    # echo $ZIG_XTENSA
    # $ZIG_XTENSA build "$@"
fi

######################################
idf.py set-target "$TARGET"
export TOOLCHAIN_VERSION
export SYSROOT_PATH
# python3 -m esptool -port /dev/ttyACM0 write_flash 0 ./zig-out/bin/$1.bin
######################################
echo "CURRENT_DIR: $CURR_DIR"
echo "PROJECT_DIR: $PROJECT_ROOT"
echo "COMPONENT_DIR: $COMP_DIR"
echo "Target Board: $TARGET"
echo "TOOLCHAIN_VERSION: $TOOLCHAIN_VERSION"
echo "SYSROOT_PATH: $SYSROOT_PATH"
echo "IDF_PATH: $IDF_PATH"


# Source before building 
# source env.sh
# zig build
