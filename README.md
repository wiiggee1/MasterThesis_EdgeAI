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

##### Setting up the environment using ESP-IDF run thee steps:

First download the [esp-idf](https://github.com/espressif/esp-idf.git).

```zsh
    mkdir -p ~/esp
    cd ~/esp
    git clone --recursive https://github.com/espressif/esp-idf.git
```

Next install by running the following commands: 

```zsh
cd ~/esp/esp-idf
./install.sh esp32s3
. $HOME/esp/esp-idf/export.sh
```


##### Build target and Zig setup:
Building through Zig's build-system and for linking against the C-based APIs 
from the ESP-IDF framework. Is explained below. 


###### Xtensa Target
```zsh
    `wget https://github.com/kassane/zig-espressif-bootstrap/releases/download/0.14.0-xtensa-dev/zig-relsafe-espressif-x86_64-linux-musl-baseline.tar.xz`
    `zig build -Dtarget=xtensa-freestanding-none -Dcpu=esp32s3`
```

###### RISCV-32 Target
Building, running, flashing the target: 

```zsh
 zig build run -- --<arg> <value> --<arg2>=<value2>
```

```zsh
 zig build flash -- --example <file> --target <str> 
```


Flashing is internally done via `idf.py` command-line tool, which is a wrapper around the 
`CMAKE` build system. 
<br>
<br>
After setting up the ESP-IDF environment and running the `export.sh`
accessed by the following PATH: `$IDF_PATH/tools/idf.py`.
We gain access to the python script `idf.py -p /dev/ttyACM0 flash monitor`. 

---

### Benchmarks

**TODO** ...
