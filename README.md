#### Master Thesis in Computer Science and Engineering, Specialisation Embedded System.

>This is some material related to the Master Thesis. Related to AI models, setup and the Zig programming language: 

    - For exploratory analysis and model plotting, check out: gnuplot and 
    @cImport({@cInclude("stdio.h")}), alt. using std in Zig for piping command in linux. 

    - Potential AI models to try: Autoencoder, RNN + Autoencoder...

    - AI framework: "https://github.com/zml/zml"

    - Microcontroller OS: Ubuntu Core (IoT) on the Raspberry Pi 5.


#### Setup phase: 

>To setup the environment, using ESP-IDF and Zig the following step is conducted: 

- 1. 
    ```
    mkdir -p ~/esp
    cd ~/esp
    git clone --recursive https://github.com/espressif/esp-idf.git
    ```
- 2. 
    ```
    cd ~/esp/esp-idf
    ./install.sh esp32s3
    . $HOME/esp/esp-idf/export.sh
    ```
- 3. Build target and Zig setup: 
    `zig build -Dtarget=xtensa-freestanding-none -Dcpu=esp32s3`
    ...
    ...

#### Running and flashing the program: 

>Flashing is done via `idf.py` command-line tool, which can be access after running the `export.sh` script by the following path: `$IDF_PATH/tools/idf.py`. 
