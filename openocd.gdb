# Usage: riscv32-elf-gdb -q -x openocd.gdb

set remotetimeout 10
target remote :3333
monitor reset halt
maintenance flush register-cache

thbreak _start
thbreak app_main
continue

# print demangled symbols
# set print asm-demangle on

# set backtrace limit to not have infinite backtrace loops
# set backtrace limit 32

# *try* to stop at the user entry point (it might be gone due to inlining)
# break main

# load

