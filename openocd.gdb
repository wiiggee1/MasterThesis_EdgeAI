# Usage: riscv32-elf-gdb -q -x openocd.gdb


# Some useful alias shortcuts: 

set pagination off
set print pretty on
set print address on
set confirm off
set history save on
set remotetimeout 20
set remote hardware-watchpoint-limit 3

set disassemble-next-line on

set $USBJTAG_BASE = 0x500D2000
set $GPIO_BASE = 0x500E0000
set $SYSTIMER_BASE = 0x500E2000
set $UART0_BASE = 0x500CA000
set $SYSREG_BASE = 0x500E5000
set $INTERRUPT_MATRIX_BASE = 0x500D6000
set $TIMERG0_BASE = 0x500C2000

define mdw
  if $argc == 0
    echo Usage: mdw <addr> [count]\n
  else
    set $addr = $arg0
    set $n = ($argc>=2) ? $arg1 : 4
    x/$nwx $addr
  end
end
document mdw
  mdw <addr> [count]: examine 32-bit words at addr
end

define r32
  if $argc == 0
    echo Usage: r32 <addr> [count]\n
  else
    set $addr = $arg0
    set $n = ($argc>=2) ? $arg1 : 1
    x/$nwx $addr
  end
end
document r32
  r32 <addr> [count]: read 32-bit words
end

define regs32
  info registers
end
document regs32
  Show general registers (quick alias).
end

define riscv-state
  if $argc == 0
    echo mstatus:\n 
    p/x $mstatus
    echo mie:\n 
    p/x $mie
    echo mip:\n 
    p/x $mip
    echo mtvec:\n 
    p/x $mtvec      
    echo mtvt:\n 
    p/x $mtvt    
    echo mcause:\n 
    p/x $mcause
    echo mepc:\n 
    p/x $mepc
    echo mtval:\n 
    p/x $mtval
    end
end
document riscv-state
    For inspecting the current state of common riscv CSRs.
end


define fs
    set $fs = (($mstatus >> 13) & 3)
    echo FS (bit 14:13):
    p/x $fs
    if $fs == 0 || $fs == 1 || $fs == 2
        if $fs == 0
            echo \t...FS → Off (no FP allowed)\n
        end 
        if $fs == 1
            echo \t...FS → Initial (first FP use traps/initializes on some cores)\n
        end
        if $fs == 2
            echo \t...FS → Clean (FP state present, no dirty)\n
        end
  else
    echo \t...FS → Dirty (FP allowed and used)\n
  end
end
document fs
  Print the mstatus.FS field (bits 14:13).
end

define mstatus-decode
  echo mstatus=\n
  p/x $mstatus
  echo  MIE  (bit3): 
  p/x (($mstatus>>3)&1)
  echo  MPIE (bit7): 
  p/x (($mstatus>>7)&1)
  echo  MPP (12:11):
  p/x (($mstatus>>11)&3)
  fs
end
document mstatus-decode
  Decodes common mstatus fields: MIE, MPIE, MPP, FS.
  NOTE: bit positions are per RV32 privileged spec; adjust if your core differs.
end

# $arg0 + $arg1 + $arg2

define mtvt-status
    echo mtvt (GDB):\n
    p/x $mtvt
    if $argc != 0
        echo mtvt[$arg0] @ 0x4ff00040:\n
        x/wx 0x4ff00040 + 4*$arg0
        x/a  0x4ff00040 + 4*$arg0
    end
end
document mtvt-status
  Show mtvt and isr entry status.
  mtvt-status <index>: show mtvt at <index>.
end

define mtvec-info
  set $mode = ($mtvec & 3)
  echo mtvec =
  p/x $mtvec
  if $mode == 0
    echo  MODE= 0 (Direct)\n
  elseif $mode == 1
    echo  MODE=1 (Vectored)\n
  elseif $mode == 3
    echo  MODE= 3 (CLIC)\n
  else
    echo  MODE= 2 (Reserved)\n
  end
end
document mtvec-info
  Show mtvec value and decode its mode (0=Direct, 1=Vectored, 3=CLIC).
end

define riscv-debug
  echo --- Debug layer ---\n
  p/x $dcsr
  echo --- Trap layer ---\n
  echo mcause: 
  p/x $mcause
  echo \nmepc: 
  p/x $mepc
  echo \nmtval: 
  p/x $mtval
  echo \nmepc value: 
  x/6i $mepc
  echo --- Vectors ---\n
  mtvec-info
  # mtvt may not be exposed by every OpenOCD/GDB; try both:
  echo mtvt (GDB):\n
  p/x $mtvt
  echo --- MSTATUS Info ---\n
  mstatus-decode
end
document riscv-debug
  Summarize why the hart halted: dcsr (debug cause), mcause/mepc/mtval,
  mtvec mode, and mtvt (if readable).
end


# source /path/to/gdb.py
# svd_load [your_svd_file].svd
# source scripts/PyCortexMDebug/scripts/gdb.py
# svd_load config/svd_registers/esp32p4.base.svd

file zig-out/bin/edge_ai.elf
# target extended-remote :3333

target extended-remote :3333
monitor reset halt
maintenance flush register-cache
thbreak app_main:80
riscv-state
continue

# load

# thbreak - HW breakpoint
# thbreak app_main
# hbreak app_main      # or thbreak if you want it temporary
# break app_main

# Startup info: 
# info all-registers
# regs32

# run

# continue

# per-interrupt enable in CLIC (MMIO)
# (gdb) x/16bx CLIC_BASE + 0x400

# *try* to stop at the user entry point (it might be gone due to inlining)
# break main

# load

