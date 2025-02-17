#!/bin/sh

set -x 

ZIG_PATH=$HOME/zig_versions/zig-relsafe-espressif-x86_64-linux-musl-baseline/

# "-fp-s32c1i" is the only way to skip floating point support
# https://github.com/espressif/llvm-project/issues/91

$ZIG_PATH/zig translate-c \
    -lc \
    -target xtensa-freestanding-none \
    -mcpu=esp32s3-fp-s32c1i \
    -D __xtensa \
    -D __COUNTER__=0 \
    -I $IDF_PATH/components/freertos/FreeRTOS-Kernel/include \
    -I $IDF_PATH/components/freertos/config/include/freertos/ \
    -I $IDF_PATH/components/freertos/config/xtensa/include \
    -I $IDF_PATH/components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos \
    -I $IDF_PATH/components/esp_hw_support/include \
    -I $IDF_PATH/components/soc/esp32s3/include \
    -I $IDF_PATH/components/esp_common/include \
    -I $IDF_PATH/components/xtensa/include \
    -I $IDF_PATH/components/xtensa/esp32s3/include \
    -I $IDF_PATH/components/soc/esp32s3/register \
    -I $IDF_PATH/components/esp_system/include \
    -I $IDF_PATH/components/newlib/include \
    -I $IDF_PATH/components/newlib/platform_include/sys \
    -I $IDF_PATH/components/newlib/platform_include \
    -I $IDF_PATH/components/hal/platform_port/include \
    -I $HOME/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20240530/xtensa-esp-elf/xtensa-esp-elf/include \
    -I $IDF_PATH/components/heap/include \
    -I $IDF_PATH/components/esp_rom/include \
    -I $IDF_PATH/components/esp_netif/include \
    -I $IDF_PATH/components/esp_wifi/include \
    -I $IDF_PATH/components/esp_event/include \
    -I $IDF_PATH/components/lwip/include \
    -I $IDF_PATH/components/lwip/lwip/src/include \
    -I $IDF_PATH/components/lwip/port/include \
    -I $IDF_PATH/components/freertos/config/include \
    -I $IDF_PATH/components/lwip/port/freertos/include \
    -I $IDF_PATH/components/lwip/port/esp32xx/include \
    -I $IDF_PATH/components/log/include \
    -I $IDF_PATH/components/nvs_flash/include \
    -I $IDF_PATH/components/esp_partition/include \
    -I $IDF_PATH/components/esp_event/include \
    -I ../build/config \
    -I $PWD/ \
    bindings.h >  bindings.zig
