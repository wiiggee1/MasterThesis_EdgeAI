## Setting up Zig build with ESP-IDFs build system

### Building Zig Embedded Firmware:
Building and compiling embedded firmware using zigs build system can
be summarized by two distinct parts. The first part is what would 
generate the binary build files. Either as `.elf` or `.bin`. This 
step is refered to as the *Compile Step* below. The second part is 
the *Run Step*, which dictate what should be executed and potentially 
flashed to the specific embedded target. 


- Alternative approach:     
        ```
        1. `zig translate-c` (convert C headers into Zig bindings/declarations): 
        2. `-I` flags to tell Zig where to find C headers. 
        3. Use `@cImport(@cInclude("header.h"))` to include C headers in Zig.
        4. Finally `build.zig` to compile and link against C code with Zig.
        ```
Example:
    ```sh
    zig translate-c \
    -lc \
    -target xtensa-freestanding-none \
    -mcpu=esp32s3-fp-s32c1i \
    -D __xtensa \
    -D __COUNTER__=0 \
    -I $HOME/esp-idf/components/freertos/FreeRTOS-Kernel/include \
    -I $HOME/esp-idf/components/freertos/config/include/freertos/ \
    -I $HOME/esp-idf/components/freertos/config/xtensa/include \
    bindings.h > bindings.zig
    ```


### Installation Artifacts 

*Generated build files*:
```
zig-out/
└── bin → <std.Build.Step.Compile.Kind>
    └── <exe_name>.<format>
    └── firmware.bin

```

### Compile & Run Step

*Compile Step*
"
The Compile step can be configured the same as any executable, library, or
object file, for example by linking against system libraries, setting target
options, or adding additional compilation units
"


In our Compile Step we need to define the following options: 
- Target to Build, e.g., RISCV or Xtensa targets.
- Optimization Profile, e.g., Debug, Safe, or Fast. 
- Linking against libraries, adding header and source files. 


*Run Step*
"
The Run step can be configured the same as any Run step, for example by
skipping execution when the host is not capable of executing the binary.
"

### ESP IDF Component dependencies: 

- Project `sdkconfig` file (Target- and Board-Specific):

    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/riscv/ld/rom.api.ld
    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/soc/esp32p4/ld/esp32p4.peripherals.ld

- Bootloader Build part: 
    ```txt
    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.ld
    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.api.ld
    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.rvfp.ld
    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.wdt.ld
    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.systimer.ld
    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.version.ld
    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.newlib.ld
    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/bootloader/subproject/main/ld/esp32p4/bootloader.ld
    -- Adding linker script /home/wiiggee1/esp/esp-idf/components/bootloader/subproject/main/ld/esp32p4/bootloader.rom.ld
    -- Components: bootloader bootloader_support efuse esp_app_format esp_bootloader_format esp_common esp_hw_support esp_rom esp_security esp_system esptool_py freertos hal log main micro-ecc newlib partition_table riscv soc spi_flash
    ```
  
    *→ Generating binary image from built executable:*
    ```txt
        esptool.py v4.9.0
        Creating esp32p4 image...
        Merged 2 ELF sections
        Successfully created esp32p4 image.
        Generated /home/wiiggee1/esp/hello_world/build/bootloader/bootloader.bin
        [123/123] cd /home/wiiggee1/esp/hello_world/build/bootloader...ome/wiiggee1/esp/hello_world/build/bootloader/bootloader.bin
        Bootloader binary size 0x56e0 bytes. 0x920 bytes (10%) free
    ```

- Firmware (Binary Image) from built executable (main file):
    ```txt
    [1000/1002] Generating binary image from built executable
    esptool.py v4.9.0
    Creating esp32p4 image...
    Merged 3 ELF sections
    Successfully created esp32p4 image.
    Generated /home/wiiggee1/esp/hello_world/build/hello_world.bin
    [1001/1002] cd /home/wiiggee1/esp/hello_world/build/esp-idf/...ble.bin /home/wiiggee1/esp/hello_world/build/hello_world.bin
    hello_world.bin binary size 0x33220 bytes. Smallest app partition is 0x100000 bytes. 0xccde0 bytes (80%) free.
    ```

---

```txt
Components: app_trace app_update bootloader bootloader_support bt cmock console
cxx driver efuse esp-tls esp_adc esp_app_format esp_bootloader_format esp_coex
esp_common esp_driver_ana_cmpr esp_driver_cam esp_driver_dac esp_driver_gpio
esp_driver_gptimer esp_driver_i2c esp_driver_i2s esp_driver_isp esp_driver_jpeg
esp_driver_ledc esp_driver_mcpwm esp_driver_parlio esp_driver_pcnt
esp_driver_ppa esp_driver_rmt esp_driver_sdio esp_driver_sdm esp_driver_sdmmc
esp_driver_sdspi esp_driver_spi esp_driver_touch_sens esp_driver_tsens
esp_driver_uart esp_driver_usb_serial_jtag esp_eth esp_event esp_gdbstub
esp_hid esp_http_client esp_http_server esp_https_ota esp_https_server
esp_hw_support esp_lcd esp_local_ctrl esp_mm esp_netif esp_netif_stack
esp_partition esp_phy esp_pm esp_psram esp_ringbuf esp_rom esp_security
esp_system esp_timer esp_vfs_console esp_wifi espcoredump esptool_py fatfs
freertos hal heap http_parser idf_test ieee802154 json log lwip *main* mbedtls
mqtt newlib nvs_flash nvs_sec_provider openthread partition_table protobuf-c
protocomm pthread riscv rt sdmmc soc spi_flash spiffs tcp_transport ulp unity
usb vfs wear_levelling wifi_provisioning wpa_supplicant
```

Observe the `main` components above, which is our app firmware. 

**Linking phase:**
Linking means telling the compiler where to find the compiled implementation of the functions declared in the `.h` files. 
The ESP-IDF components are precompiled into both `.a` and `.o` files, which contains all the compiled `.c` files for a module.

- ROM (Read-Only Memory) is what holds our firmware and boot (bootloader) code. 

- While Flash memory retains and used for storing our application code. 


```zsh
-- App "hello_world" version: 1
-- Adding linker script /home/wiiggee1/esp/hello_world/build/esp-idf/esp_system/ld/memory.ld
-- Adding linker script /home/wiiggee1/esp/hello_world/build/esp-idf/esp_system/ld/sections.ld.in
-- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.ld
-- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.api.ld
-- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.rvfp.ld
-- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.wdt.ld
-- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.systimer.ld
-- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.version.ld
-- Adding linker script /home/wiiggee1/esp/esp-idf/components/esp_rom/esp32p4/ld/esp32p4.rom.newlib.ld
-- Adding linker script /home/wiiggee1/esp/esp-idf/components/soc/esp32p4/ld/esp32p4.peripherals.ld
```


- **Linking in Zig**: `addLibraryPath()` + `linkSystemLibrary()` = linking against static libs `.a`. Alternativ to link against object files `.o` = `addObjectFile()`.


-  Common components requirments is: 
    - cxx, newlib, freertos, esp_hw_support, heap, log, soc, hal, esp_rom,
    - esp_common, esp_system, xtensa/riscv.

