### Master Thesis in Computer Science and Engineering, Specialisation Embedded System.

---

<em><strong> 
This is material related to my Master Thesis work. 
</strong></em>
The goal is to discover and gain knowledge about the current
state of **Edge AI** by using the Zig programming langugage. 
Below follows steps how to setup and run the project, as well 
as useful [documents](./docs). 

---

#### Initial Setup: 

##### Setting up the environment using ESP-IDF run these steps:

1. First download the [esp-idf](https://github.com/espressif/esp-idf.git).

```zsh
    mkdir -p ~/esp
    cd ~/esp
    git clone --recursive https://github.com/espressif/esp-idf.git
```

2. Next install by running the following commands: 

```zsh
cd ~/esp/esp-idf
./install.sh esp32p4
. $HOME/esp/esp-idf/export.sh
sudo pacman -S esptool
sudo pacman -S picocom
sudo pacman -S riscv32-elf-binutils
sudo pacman -S riscv32-elf-gdb
```


##### Build target and Zig setup:
Building through Zig's build-system and for linking against the C-based APIs 
from the ESP-IDF framework. Is explained below. 


###### Xtensa Target
```zsh
    `wget https://github.com/kassane/zig-espressif-bootstrap/releases/download/0.14.0-xtensa-dev/zig-relsafe-espressif-x86_64-linux-musl-baseline.tar.xz`
    `zig build -Dtarget=xtensa-freestanding-none -Dcpu=esp32s3`
```

###### Baremetal RISCV-32 Target
Building, running, flashing the target: 

Building and flashing directly can be done via the following CLI command + flags:  
- `zig build flash -- --example <file> --profile <str>`, the `--example` flag 
expects the name of the firmware file to flash, and `--profile` have the supported values: 
    - Debug
    - ReleaseSafe
    - ReleaseFast
    - ReleaseSmall

Example for building and flash the example firmware: 

```zsh
zig build flash -- --example edge_ai --profile ReleaseFast
```


---

<!-- Flashing is internally done via `idf.py` command-line tool, which is a wrapper around the  -->
<!-- `CMAKE` build system. `idf.py` internally calls the python library `esptool`. -->
<!-- <br> -->
<!-- <br> -->
<!-- After setting up the ESP-IDF environment and running the `export.sh` -->
<!-- accessed by the following PATH: `$IDF_PATH/tools/idf.py`. -->
<!-- We gain access to the python script `idf.py -p /dev/ttyACM0 flash monitor`.  -->
<!---->
<!-- **Flashing the Firmware** -->
<!-- ```zsh -->
<!-- idf.py -p /dev/ttyACM0 flash monitor -->
<!-- ... -->
<!-- python3 -m esptool -port /dev/ttyACM0 write_flash 0 ./zig-out/bin/$1.bin -->
<!---->
<!-- python -m esptool --chip esp32p4 -b 460800 --before default-reset --after hard-reset write-flash --flash-mode dio --flash-size 2MB --flash-freq 40m 0x2000 build/bootloader/bootloader.bin 0x8000 build/partition_table/partition-table.bin 0x10000 ./zig-out/bin/$1.bin -->
<!---->
<!-- ``` -->


