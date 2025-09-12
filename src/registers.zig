const std = @import("std");
const Peripheral = @import("peripherals.zig").Peripheral;

pub fn AnyRegister(comptime P: Peripheral, comptime T: type) type{
    return struct {
        const Self = @This();
        const Reg = Register.fromPeripheral(P);
        const RegisterType = Reg.intoType();

        pub const Block: T = Reg.into(RegisterType);
    };
}

/// External structs:
/// =================================================
/// C-ABI compatible struct memory-layout, representing 
/// a `RegisterBlock`. C Memory Layout means: 
/// - Field appear in order when they are defined,
/// - Each field is aligned according to C, 
/// - The compiler may insert padding to satisfy alignment,
/// - Size of the struct, is rounded up to a multiple of its strongest field alignment. 
/// =================================================
/// On ESP32-P4, little-endian, 4-byte alignment for u32 is used. 
/// Little-endian: Stores the LSB at the smallest address. 
/// E.g., 0x0A0B0C0D: 
///     → Index N:   0D (LSB)
///     → Index N+1: 0C   |
///     → Index N+2: 0B   |
///     → Index N+3: 0A (MSB)
/// =================================================
pub const RegisterBlockDummy = extern struct {
    REG_0: u32,     // Offset: 0x0000
    PADDING: u32,   // 0x0004: Padding to satisfy the alignment
    REG_2: u32,     // 0x0008

    pub fn register(base_addr: usize) *volatile RegisterBlockDummy{
        const reg_ptr: *volatile RegisterBlockDummy = @ptrFromInt(base_addr);
        return reg_ptr;
    }
};

/// The `Register` union type contain the underlying
/// peripheral and some user defined registers. 
pub const Register = union(Peripheral) {
    USB_JTAG: UsbJtagRegister,
    UART0: UartRegister,
    GPIO: GpioRegister,
    SYSTIMER: SysTimerRegister,
    SYSREG: SysRegister,
    INTERRUPT_MATRIX: InterruptMatrixRegister,
    TIMERG0: TimerGroupRegister,
    CLIC: ClicRegister,

    // pub fn into(comptime reg: Register, comptime register_block: type) register_block{
    pub fn into(comptime reg: Register, comptime RegisterBlock: type) RegisterBlock{
        return comptime switch (reg) {
            .USB_JTAG => |usb_jtag| usb_jtag,
            .UART0 => |uart| uart,
            .GPIO => |gpio| gpio,
            .SYSTIMER => |systime| systime,
            .SYSREG => |sysreg| sysreg,
            .INTERRUPT_MATRIX => |intrp_mat| intrp_mat,
            .TIMERG0 => |timergroup| timergroup,
            .CLIC => |clic| clic,
        };
    }
    pub fn intoRegisterBlock(comptime reg: Register) type{
        return comptime switch (reg) {
            .USB_JTAG => |usb_jtag| usb_jtag,
            .UART0 => |uart| uart,
            .GPIO => |gpio| gpio,
            .SYSTIMER => |systime| systime,
            .SYSREG => |sysreg| sysreg,
            .INTERRUPT_MATRIX => |intrp_mat| intrp_mat,
            .TIMERG0 => |timergroup| timergroup,
            .CLIC => |clic| clic,
        };
    }

    pub inline fn intoType(comptime self: Register) type{
        return comptime switch (self) {
            .USB_JTAG => UsbJtagRegister,
            .UART0 => UartRegister,
            .GPIO => GpioRegister,
            .SYSTIMER => SysTimerRegister,
            .SYSREG => SysRegister,
            .INTERRUPT_MATRIX => InterruptMatrixRegister,
            .TIMERG0 => TimerGroupRegister,
            .CLIC => ClicRegister,
        };
    }

    pub fn fromPeripheral(comptime peripheral: Peripheral) Register {
        return comptime switch(peripheral){
            .USB_JTAG => return Register{.USB_JTAG = undefined},
            .UART0 => return Register{.UART0 = undefined},
            .GPIO => return Register{.GPIO = undefined},
            .SYSTIMER => Register{.SYSTIMER = undefined},
            .SYSREG => return Register{.SYSREG = undefined},
            .INTERRUPT_MATRIX => return Register{.INTERRUPT_MATRIX = undefined},
            .TIMERG0 => return Register{.TIMERG0 = undefined},
            .CLIC => return Register{.CLIC = undefined},
        };
    }

    // pub fn RegisterType(comptime PERIPHERAL: Peripheral) switch (PERIPHERAL) {
    //         .SYSTIMER => @FieldType(Register, "SYSTIMER"),
    //         .GPIO => @FieldType(Register, "GPIO"), 
    //         .USB_JTAG => @FieldType(Register, "USB_JTAG"), 
    //         .UART0 => @FieldType(Register, "UART0"),
    //         .SYSREG => @FieldType(Register, "SYSREG"),
    //         .INTERRUPT_MATRIX => @FieldType(Register, "INTERRUPT_MATRIX"),
    //         .TIMERG0 => @FieldType(Register, "TIMERG0"),
    //         .CLIC => @FieldType(Register, "CLIC"),
    // } {
    //     return switch (PERIPHERAL) {
    //         .SYSTIMER => return @FieldType(Register, "SYSTIMER"),
    //         .GPIO => return @FieldType(Register, "GPIO"), 
    //         .USB_JTAG => return @FieldType(Register, "USB_JTAG"), 
    //         .UART0 => return @FieldType(Register, "UART0"),
    //         .SYSREG => return @FieldType(Register, "SYSREG"),
    //         .INTERRUPT_MATRIX => return @FieldType(Register, "INTERRUPT_MATRIX"),
    //         .TIMERG0 => return @FieldType(Register, "TIMERG0"),
    //         .CLIC => return @FieldType(Register, "CLIC"),
    //     };
    // }

    pub fn intoPeripheral(comptime self: Register) Peripheral{
        switch (self) {
            .SYSTIMER => return Peripheral.SYSTIMER,
            .GPIO => return Peripheral.GPIO,
            .USB_JTAG => return Peripheral.USB_JTAG,
            .UART0 => return Peripheral.UART0,
            .SYSREG => return Peripheral.SYSREG,
            .INTERRUPT_MATRIX => return Peripheral.INTERRUPT_MATRIX,
            .TIMERG0 => return Peripheral.TIMERG0,
            .CLIC => return Peripheral.CLIC,
        }
    }
};

pub const UsbJtagRegister = struct {
    const Self = @This();
    EP1_DATA: u32 = 0x0000, // Offset: 0x0000
    EP1_CONF: u32 = 0x0004, // Offset: 0x0004
    EP1_JFIFO_ST: u32 = 0x0020, // 
    EP1_ST: u32 = 0x002C, // Endpoint 1 status register.
};

pub const GpioRegister = struct {
    const Self = @This();
    PADDING: u32 = 0x0000,
    OUT: u32 = 0x0004,
    W1TS_REG: u32 = 0x0008,
    W1TC_REG: u32 = 0x000C,
    ENABLE: u32 = 0x0020,
    IN: u32 = 0x3C,
};

pub const UartRegister = struct {
    const Self = @This();
    reg0: u32 = undefined, // 0x0000 
    padding: u32 = undefined, // Padding to satisfy the alignment of 4 bytes.
    reg2: u32 = undefined, // 0x0008
};

pub const SysTimerRegister = struct {
    const Self = @This();
    CONF: u32 = 0x0000,
    UNIT0_OP: u32 = 0x0004,
    UNIT0_LOAD_HI: u32 = 0x000C,
    UNIT0_LOAD_LO: u32 = 0x0010,
    UNIT0_VALUE_HI: u32 = 0x0040,
    UNIT0_VALUE_LO: u32 = 0x0044,
    UNIT0_LOAD_REG: u32 = 0x005C,
    CTRL21_REG: u32 = 0x0098, //FIX: This offset should be moved to the Reset and Clock Peripheral.

    TARGET0_COMP_HI: u32 = 0x001C,
    TARGET0_COMP_LO: u32 = 0x0020,
    TARGET0_COMP_CONF: u32 = 0x0034,
    COMP0_LOAD_REG: u32 = 0x0050,
    

    UNIT1_LOAD_REG: u32 = 0x0060,
    UNIT1_VALUE_LO: u32 = 0x004C,
    UNIT1_VALUE_HI: u32 = 0x0048,
    UNIT1_LOAD_LO: u32 = 0x0018,
    UNIT1_LOAD_HI: u32 = 0x0014,
    UNIT1_OP: u32 = 0x0008,

    TARGET1_COMP_HI: u32 = 0x0024,
    TARGET1_COMP_LO: u32 = 0x0028,
    TARGET1_COMP_CONF: u32 = 0x0038,
    COMP1_LOAD_REG: u32 = 0x0054,
    
    TARGET2_COMP_HI: u32 = 0x002C,
    TARGET2_COMP_LO: u32 = 0x0030,
    TARGET2_COMP_CONF: u32 = 0x003C,
    COMP2_LOAD_REG: u32 = 0x0058,

    /// Enable interrupt: 
    /// bit[0]: SYSTIMER_TARGET0_INT_ENA
    /// bit[1]: SYSTIMER_TARGET1_INT_ENA
    /// bit[2]: SYSTIMER_TARGET2_INT_ENA
    INT_ENA: u32 = 0x0064,
    /// The raw interrupt status: 
    /// bit[0]: SYSTIMER_TARGET0_INT_RAW
    /// bit[1]: SYSTIMER_TARGET1_INT_RAW
    /// bit[2]: SYSTIMER_TARGET2_INT_RAW
    INT_RAW: u32 = 0x0068,
    /// Clear interrupt: 
    /// bit[0]: SYSTIMER_TARGET0_INT_CLR
    /// bit[1]: SYSTIMER_TARGET1_INT_CLR
    /// bit[2]: SYSTIMER_TARGET2_INT_CLR
    INT_CLR: u32 = 0x006C,
    INT_ST: u32 = 0x0070,

    /// Actual target value of COMP0, low 32 bits
    REAL_TARGET0_LO: u32 = 0x0074,
    /// Actual target value of COMP0, high 20 bits
    REAL_TARGET0_HI: u32 = 0x0078,

};

pub const SysRegister = struct {
    const Self = @This();
    // pub const BaseAddress: usize = Peripheral.SYSREG.baseAddress();
    DUMMY_FIELD: u32 = undefined,
};

/// Base address start at: 0x500E_6000.
pub const ResetClockRegister = struct {
    const Self = @This();
    CTRL21_REG: u32 = 0x0098,
    /// Enabling bus clock of HP CPU0 CLIC. 
    CLKRST_SOC_CLK_CTRL0_REG: u32 = 0x0014,
    CLKRST_SOC_CLK_CTRL2_REG: u32 = 0x001C,
    CLKRST_HP_RST_EN1_REG: u32 = 0x00C4,
    /// E.g. Bit[3:0] → CPUICM_DELAY configures time required from entering WFI mode 
    /// to the actual shutdown of the CPU clock. 
    /// This offset (at 0x0004) at bit[4], can also configure if you want to update the 
    /// divisors value for either `CPU_CLK`, `MEM_CLK`, `SYS_CLK` and `APB_CLK`.
    HP_SYS_CLKRST_ROOT_CLK_CTRL0: u32 = 0x0004,
    /// For e.g., configuring the integer part of the SYS_CLK divisor at bits[31:24].
    HP_SYS_CLKRST_ROOT_CLK_CTRL1: u32 = 0x0008,
    /// Configures e.g., the numerator and denominator for the divisor fraction. 
    /// At: CLKRST_SYS_CLK_DIV_NUMERATOR and respectively CLKRST_SYS_CLK_DIV_DENOMINATOR
    HP_SYS_CLKRST_ROOT_CLK_CTRL2: u32 = 0x000C,
    HP_SYS_CLKRST_ROOT_CLK_CTRL3: u32 = 0x0010,

};

/// The Interrupt Matrix receives interrupt signals (sources) sent 
/// from peripheral sources. It then outputs CPU peripheral interrupt 
/// signals to the CPU. From the CPU's perspective, the interrupt 
/// source from the Interrupt Matrix becomes the sources and are sent 
/// to the CPU core, togheter with the `core local interrupt source`.
/// ---------
/// ```NOTE 1
/// The Interrupt Matrix Registers are relative to the interrupt matrix 
/// base address (0x500D_6000). So each source to signal mapping, is 
/// accessed through their offset to the base address (0x500D_6000).
/// ```NOTE 2
/// Assigning external peripheral interrupt source 
/// to the HP CPU0, is conducted in the mapping register
/// `COREx_SOURCE_Y_MAP_REG`. By defining the interrupt 
/// "SOURCE" to index of HP CPU (16~47), would assign that
/// specific interrupt source to the Interrupt ID (ID: 16~47).
pub const InterruptMatrixRegister = struct {
    const Self = @This();
    pub const BaseAddress: usize = Peripheral.INTERRUPT_MATRIX.baseAddress();
    /// This is the base address for mapping interrupt 
    /// signals of source_y to one of CPU0's external 
    /// interrupts. Valid offset range 0x0000 - 0x01FC.
    /// Where the offset corresponds to the external 
    /// peripheral interrupt source relative to the 
    /// base address of the `INTERRUPT_MATRIX`.
    /// The index of the of the HP CPU interrupt 
    /// can be between 16 ~ 47.
    CORE0_SOURCE_Y_MAP_REG: u32 = 0x0000,
    /// Represent status of the interrupt sources from 0 ~ 31.
    /// Where each bit corresponds to one interrupt source. 
    CORE0_INTR_STATUS_REG_0_REG: u32 = 0x0200,
    /// Status of the interrupt sources from 32 ~ 63.
    CORE0_INTR_STATUS_REG_1_REG: u32 = 0x0204,
    /// Status of the interrupt sources from 64 ~ 95.
    CORE0_INTR_STATUS_REG_2_REG: u32 = 0x0208,
    /// Status of the interrupt sources from 96 ~ 127.
    /// Where 99 and 112 are reserved.
    CORE0_INTR_STATUS_REG_3_REG: u32 = 0x020C,
};

pub const TimerGroupRegister = struct{
    const Self = @This();
    WDTWPROTECT: u32 = 0x0064,
    /// WDT_EN: bit 31, (0: disable, 1: enable)
    /// WDT_FLASHBOOT_MOD: bit: 14, (0: disable, 1: enable)
    WDTCONFIG0: u32 = 0x0048,
};

pub const ClicRegister = struct{
    const Self = @This();
    CLIC_BASE: usize = 0x2080_0000,
    CTRL_OFFSET: usize = 0x0000_1000,
    CTRL_BASE: usize = 0x2080_1000, // 0x2080_1000
    
    /// Represent the `cliccfg` - configures *nlbits*
    /// (how many bits used in `clicintctl` that are level bits).
    CLIC_CFG_REG: usize = 0x2080_0000 + 0x0,
    CLIC_INFO_REG: usize = 0x2080_0000 + 0x4,
    THRESH_REG: usize = 0x2080_0000 + 0x8,
};
