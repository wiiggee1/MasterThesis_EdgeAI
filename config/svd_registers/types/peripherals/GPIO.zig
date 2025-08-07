const mmio = @import("mmio");
const types = @import("../../types.zig");

/// General Purpose Input/Output
pub const GPIO = extern struct {
    /// GPIO bit select register
    /// offset: 0x00
    BT_SELECT: mmio.Mmio(packed struct(u32) {
        /// GPIO bit select register
        BT_SEL: u32,
    }),
    /// GPIO output register for GPIO0-31
    /// offset: 0x04
    OUT: mmio.Mmio(packed struct(u32) {
        /// GPIO output register for GPIO0-31
        DATA_ORIG: u32,
    }),
    /// GPIO output set register for GPIO0-31
    /// offset: 0x08
    OUT_W1TS: mmio.Mmio(packed struct(u32) {
        /// GPIO output set register for GPIO0-31
        OUT_W1TS: u32,
    }),
    /// GPIO output clear register for GPIO0-31
    /// offset: 0x0c
    OUT_W1TC: mmio.Mmio(packed struct(u32) {
        /// GPIO output clear register for GPIO0-31
        OUT_W1TC: u32,
    }),
    /// GPIO output register for GPIO32-56
    /// offset: 0x10
    OUT1: mmio.Mmio(packed struct(u32) {
        /// GPIO output register for GPIO32-56
        DATA_ORIG: u25,
        padding: u7 = 0,
    }),
    /// GPIO output set register for GPIO32-56
    /// offset: 0x14
    OUT1_W1TS: mmio.Mmio(packed struct(u32) {
        /// GPIO output set register for GPIO32-56
        OUT1_W1TS: u25,
        padding: u7 = 0,
    }),
    /// GPIO output clear register for GPIO32-56
    /// offset: 0x18
    OUT1_W1TC: mmio.Mmio(packed struct(u32) {
        /// GPIO output clear register for GPIO32-56
        OUT1_W1TC: u25,
        padding: u7 = 0,
    }),
    /// offset: 0x1c
    reserved28: [4]u8,
    /// GPIO output enable register for GPIO0-31
    /// offset: 0x20
    ENABLE: mmio.Mmio(packed struct(u32) {
        /// GPIO output enable register for GPIO0-31
        DATA: u32,
    }),
    /// GPIO output enable set register for GPIO0-31
    /// offset: 0x24
    ENABLE_W1TS: mmio.Mmio(packed struct(u32) {
        /// GPIO output enable set register for GPIO0-31
        ENABLE_W1TS: u32,
    }),
    /// GPIO output enable clear register for GPIO0-31
    /// offset: 0x28
    ENABLE_W1TC: mmio.Mmio(packed struct(u32) {
        /// GPIO output enable clear register for GPIO0-31
        ENABLE_W1TC: u32,
    }),
    /// GPIO output enable register for GPIO32-56
    /// offset: 0x2c
    ENABLE1: mmio.Mmio(packed struct(u32) {
        /// GPIO output enable register for GPIO32-56
        DATA: u25,
        padding: u7 = 0,
    }),
    /// GPIO output enable set register for GPIO32-56
    /// offset: 0x30
    ENABLE1_W1TS: mmio.Mmio(packed struct(u32) {
        /// GPIO output enable set register for GPIO32-56
        ENABLE1_W1TS: u25,
        padding: u7 = 0,
    }),
    /// GPIO output enable clear register for GPIO32-56
    /// offset: 0x34
    ENABLE1_W1TC: mmio.Mmio(packed struct(u32) {
        /// GPIO output enable clear register for GPIO32-56
        ENABLE1_W1TC: u25,
        padding: u7 = 0,
    }),
    /// pad strapping register
    /// offset: 0x38
    STRAP: mmio.Mmio(packed struct(u32) {
        /// pad strapping register
        STRAPPING: u16,
        padding: u16 = 0,
    }),
    /// GPIO input register for GPIO0-31
    /// offset: 0x3c
    IN: mmio.Mmio(packed struct(u32) {
        /// GPIO input register for GPIO0-31
        DATA_NEXT: u32,
    }),
    /// GPIO input register for GPIO32-56
    /// offset: 0x40
    IN1: mmio.Mmio(packed struct(u32) {
        /// GPIO input register for GPIO32-56
        DATA_NEXT: u25,
        padding: u7 = 0,
    }),
    /// GPIO interrupt status register for GPIO0-31
    /// offset: 0x44
    STATUS: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt status register for GPIO0-31
        INTERRUPT: u32,
    }),
    /// GPIO interrupt status set register for GPIO0-31
    /// offset: 0x48
    STATUS_W1TS: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt status set register for GPIO0-31
        STATUS_W1TS: u32,
    }),
    /// GPIO interrupt status clear register for GPIO0-31
    /// offset: 0x4c
    STATUS_W1TC: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt status clear register for GPIO0-31
        STATUS_W1TC: u32,
    }),
    /// GPIO interrupt status register for GPIO32-56
    /// offset: 0x50
    STATUS1: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt status register for GPIO32-56
        INTERRUPT: u25,
        padding: u7 = 0,
    }),
    /// GPIO interrupt status set register for GPIO32-56
    /// offset: 0x54
    STATUS1_W1TS: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt status set register for GPIO32-56
        STATUS1_W1TS: u25,
        padding: u7 = 0,
    }),
    /// GPIO interrupt status clear register for GPIO32-56
    /// offset: 0x58
    STATUS1_W1TC: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt status clear register for GPIO32-56
        STATUS1_W1TC: u25,
        padding: u7 = 0,
    }),
    /// GPIO interrupt 0 status register for GPIO0-31
    /// offset: 0x5c
    INTR_0: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt 0 status register for GPIO0-31
        INT_0: u32,
    }),
    /// GPIO interrupt 0 status register for GPIO32-56
    /// offset: 0x60
    INTR1_0: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt 0 status register for GPIO32-56
        INT1_0: u25,
        padding: u7 = 0,
    }),
    /// GPIO interrupt 1 status register for GPIO0-31
    /// offset: 0x64
    INTR_1: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt 1 status register for GPIO0-31
        INT_1: u32,
    }),
    /// GPIO interrupt 1 status register for GPIO32-56
    /// offset: 0x68
    INTR1_1: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt 1 status register for GPIO32-56
        INT1_1: u25,
        padding: u7 = 0,
    }),
    /// GPIO interrupt source register for GPIO0-31
    /// offset: 0x6c
    STATUS_NEXT: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt source register for GPIO0-31
        STATUS_INTERRUPT_NEXT: u32,
    }),
    /// GPIO interrupt source register for GPIO32-56
    /// offset: 0x70
    STATUS_NEXT1: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt source register for GPIO32-56
        STATUS_INTERRUPT_NEXT1: u25,
        padding: u7 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x74
    PIN0: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x78
    PIN1: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x7c
    PIN2: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x80
    PIN3: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x84
    PIN4: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x88
    PIN5: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x8c
    PIN6: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x90
    PIN7: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x94
    PIN8: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x98
    PIN9: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x9c
    PIN10: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xa0
    PIN11: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xa4
    PIN12: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xa8
    PIN13: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xac
    PIN14: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xb0
    PIN15: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xb4
    PIN16: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xb8
    PIN17: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xbc
    PIN18: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xc0
    PIN19: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xc4
    PIN20: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xc8
    PIN21: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xcc
    PIN22: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xd0
    PIN23: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xd4
    PIN24: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xd8
    PIN25: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xdc
    PIN26: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xe0
    PIN27: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xe4
    PIN28: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xe8
    PIN29: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xec
    PIN30: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xf0
    PIN31: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xf4
    PIN32: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xf8
    PIN33: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0xfc
    PIN34: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x100
    PIN35: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x104
    PIN36: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x108
    PIN37: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x10c
    PIN38: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x110
    PIN39: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x114
    PIN40: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x118
    PIN41: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x11c
    PIN42: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x120
    PIN43: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x124
    PIN44: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x128
    PIN45: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x12c
    PIN46: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x130
    PIN47: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x134
    PIN48: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x138
    PIN49: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x13c
    PIN50: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x140
    PIN51: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x144
    PIN52: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x148
    PIN53: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x14c
    PIN54: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x150
    PIN55: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// GPIO pin configuration register
    /// offset: 0x154
    PIN56: mmio.Mmio(packed struct(u32) {
        /// set GPIO input_sync2 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC2_BYPASS: u2,
        /// set this bit to select pad driver. 1:open-drain. 0:normal.
        PAD_DRIVER: u1,
        /// set GPIO input_sync1 signal mode. 0:disable. 1:trigger at negedge. 2or3:trigger at posedge.
        SYNC1_BYPASS: u2,
        reserved7: u2 = 0,
        /// set this value to choose interrupt mode. 0:disable GPIO interrupt. 1:trigger at posedge. 2:trigger at negedge. 3:trigger at any edge. 4:valid at low level. 5:valid at high level
        INT_TYPE: u3,
        /// set this bit to enable GPIO wakeup.(can only wakeup CPU from Light-sleep Mode)
        WAKEUP_ENABLE: u1,
        /// reserved
        CONFIG: u2,
        /// set bit 13 to enable CPU interrupt. set bit 14 to enable CPU(not shielded) interrupt.
        INT_ENA: u5,
        padding: u14 = 0,
    }),
    /// offset: 0x158
    reserved344: [4]u8,
    /// GPIO input function configuration register
    /// offset: 0x15c
    FUNC1_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x160
    FUNC2_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x164
    FUNC3_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x168
    FUNC4_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x16c
    FUNC5_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x170
    FUNC6_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x174
    FUNC7_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x178
    FUNC8_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x17c
    FUNC9_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x180
    FUNC10_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x184
    FUNC11_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x188
    FUNC12_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x18c
    FUNC13_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x190
    FUNC14_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x194
    FUNC15_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x198
    FUNC16_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x19c
    FUNC17_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1a0
    FUNC18_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1a4
    FUNC19_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1a8
    FUNC20_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1ac
    FUNC21_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1b0
    FUNC22_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1b4
    FUNC23_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1b8
    FUNC24_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1bc
    FUNC25_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1c0
    FUNC26_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1c4
    FUNC27_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1c8
    FUNC28_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1cc
    FUNC29_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1d0
    FUNC30_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1d4
    FUNC31_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1d8
    FUNC32_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1dc
    FUNC33_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1e0
    FUNC34_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1e4
    FUNC35_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1e8
    FUNC36_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1ec
    FUNC37_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1f0
    FUNC38_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1f4
    FUNC39_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1f8
    FUNC40_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x1fc
    FUNC41_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x200
    FUNC42_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x204
    FUNC43_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x208
    FUNC44_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x20c
    FUNC45_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x210
    FUNC46_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x214
    FUNC47_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x218
    FUNC48_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x21c
    FUNC49_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x220
    FUNC50_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x224
    FUNC51_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x228
    FUNC52_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x22c
    FUNC53_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x230
    FUNC54_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x234
    FUNC55_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x238
    FUNC56_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x23c
    FUNC57_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x240
    FUNC58_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x244
    FUNC59_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x248
    FUNC60_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x24c
    FUNC61_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x250
    FUNC62_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x254
    FUNC63_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x258
    FUNC64_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x25c
    FUNC65_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x260
    FUNC66_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x264
    FUNC67_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x268
    FUNC68_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x26c
    FUNC69_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x270
    FUNC70_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x274
    FUNC71_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x278
    FUNC72_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x27c
    FUNC73_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x280
    FUNC74_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x284
    FUNC75_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x288
    FUNC76_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x28c
    FUNC77_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x290
    FUNC78_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x294
    FUNC79_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x298
    FUNC80_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x29c
    FUNC81_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2a0
    FUNC82_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2a4
    FUNC83_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2a8
    FUNC84_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2ac
    FUNC85_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2b0
    FUNC86_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2b4
    FUNC87_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2b8
    FUNC88_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2bc
    FUNC89_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2c0
    FUNC90_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2c4
    FUNC91_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2c8
    FUNC92_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2cc
    FUNC93_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2d0
    FUNC94_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2d4
    FUNC95_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2d8
    FUNC96_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2dc
    FUNC97_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2e0
    FUNC98_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2e4
    FUNC99_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2e8
    FUNC100_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2ec
    FUNC101_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2f0
    FUNC102_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2f4
    FUNC103_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2f8
    FUNC104_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x2fc
    FUNC105_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x300
    FUNC106_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x304
    FUNC107_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x308
    FUNC108_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x30c
    FUNC109_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x310
    FUNC110_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x314
    FUNC111_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x318
    FUNC112_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x31c
    FUNC113_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x320
    FUNC114_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x324
    FUNC115_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x328
    FUNC116_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x32c
    FUNC117_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x330
    FUNC118_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x334
    FUNC119_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x338
    FUNC120_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x33c
    FUNC121_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x340
    FUNC122_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x344
    FUNC123_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x348
    FUNC124_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x34c
    FUNC125_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x350
    FUNC126_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x354
    FUNC127_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x358
    FUNC128_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x35c
    FUNC129_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x360
    FUNC130_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x364
    FUNC131_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x368
    FUNC132_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x36c
    FUNC133_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x370
    FUNC134_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x374
    FUNC135_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x378
    FUNC136_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x37c
    FUNC137_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x380
    FUNC138_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x384
    FUNC139_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x388
    FUNC140_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x38c
    FUNC141_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x390
    FUNC142_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x394
    FUNC143_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x398
    FUNC144_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x39c
    FUNC145_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3a0
    FUNC146_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3a4
    FUNC147_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3a8
    FUNC148_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3ac
    FUNC149_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3b0
    FUNC150_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3b4
    FUNC151_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3b8
    FUNC152_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3bc
    FUNC153_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3c0
    FUNC154_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3c4
    FUNC155_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3c8
    FUNC156_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3cc
    FUNC157_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3d0
    FUNC158_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3d4
    FUNC159_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3d8
    FUNC160_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3dc
    FUNC161_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3e0
    FUNC162_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3e4
    FUNC163_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3e8
    FUNC164_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3ec
    FUNC165_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3f0
    FUNC166_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3f4
    FUNC167_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3f8
    FUNC168_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x3fc
    FUNC169_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x400
    FUNC170_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x404
    FUNC171_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x408
    FUNC172_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x40c
    FUNC173_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x410
    FUNC174_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x414
    FUNC175_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x418
    FUNC176_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x41c
    FUNC177_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x420
    FUNC178_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x424
    FUNC179_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x428
    FUNC180_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x42c
    FUNC181_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x430
    FUNC182_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x434
    FUNC183_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x438
    FUNC184_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x43c
    FUNC185_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x440
    FUNC186_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x444
    FUNC187_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x448
    FUNC188_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x44c
    FUNC189_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x450
    FUNC190_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x454
    FUNC191_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x458
    FUNC192_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x45c
    FUNC193_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x460
    FUNC194_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x464
    FUNC195_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x468
    FUNC196_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x46c
    FUNC197_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x470
    FUNC198_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x474
    FUNC199_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x478
    FUNC200_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x47c
    FUNC201_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x480
    FUNC202_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x484
    FUNC203_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x488
    FUNC204_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x48c
    FUNC205_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x490
    FUNC206_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x494
    FUNC207_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x498
    FUNC208_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x49c
    FUNC209_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4a0
    FUNC210_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4a4
    FUNC211_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4a8
    FUNC212_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4ac
    FUNC213_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4b0
    FUNC214_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4b4
    FUNC215_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4b8
    FUNC216_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4bc
    FUNC217_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4c0
    FUNC218_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4c4
    FUNC219_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4c8
    FUNC220_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4cc
    FUNC221_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4d0
    FUNC222_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4d4
    FUNC223_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4d8
    FUNC224_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4dc
    FUNC225_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4e0
    FUNC226_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4e4
    FUNC227_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4e8
    FUNC228_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4ec
    FUNC229_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4f0
    FUNC230_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4f4
    FUNC231_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4f8
    FUNC232_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x4fc
    FUNC233_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x500
    FUNC234_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x504
    FUNC235_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x508
    FUNC236_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x50c
    FUNC237_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x510
    FUNC238_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x514
    FUNC239_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x518
    FUNC240_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x51c
    FUNC241_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x520
    FUNC242_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x524
    FUNC243_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x528
    FUNC244_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x52c
    FUNC245_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x530
    FUNC246_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x534
    FUNC247_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x538
    FUNC248_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x53c
    FUNC249_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x540
    FUNC250_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x544
    FUNC251_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x548
    FUNC252_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x54c
    FUNC253_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// GPIO input function configuration register
    /// offset: 0x550
    FUNC254_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// set this value: s=0-56: connect GPIO[s] to this port. s=0x3F: set this port always high level. s=0x3E: set this port always low level.
        IN_SEL: u6,
        /// set this bit to invert input signal. 1:invert. 0:not invert.
        IN_INV_SEL: u1,
        /// set this bit to bypass GPIO. 1:do not bypass GPIO. 0:bypass GPIO.
        SEL: u1,
        padding: u24 = 0,
    }),
    /// offset: 0x554
    reserved1364: [4]u8,
    /// GPIO output function select register
    /// offset: 0x558
    FUNC0_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x55c
    FUNC1_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x560
    FUNC2_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x564
    FUNC3_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x568
    FUNC4_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x56c
    FUNC5_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x570
    FUNC6_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x574
    FUNC7_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x578
    FUNC8_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x57c
    FUNC9_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x580
    FUNC10_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x584
    FUNC11_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x588
    FUNC12_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x58c
    FUNC13_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x590
    FUNC14_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x594
    FUNC15_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x598
    FUNC16_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x59c
    FUNC17_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5a0
    FUNC18_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5a4
    FUNC19_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5a8
    FUNC20_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5ac
    FUNC21_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5b0
    FUNC22_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5b4
    FUNC23_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5b8
    FUNC24_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5bc
    FUNC25_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5c0
    FUNC26_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5c4
    FUNC27_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5c8
    FUNC28_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5cc
    FUNC29_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5d0
    FUNC30_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5d4
    FUNC31_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5d8
    FUNC32_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5dc
    FUNC33_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5e0
    FUNC34_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5e4
    FUNC35_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5e8
    FUNC36_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5ec
    FUNC37_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5f0
    FUNC38_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5f4
    FUNC39_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5f8
    FUNC40_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x5fc
    FUNC41_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x600
    FUNC42_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x604
    FUNC43_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x608
    FUNC44_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x60c
    FUNC45_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x610
    FUNC46_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x614
    FUNC47_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x618
    FUNC48_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x61c
    FUNC49_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x620
    FUNC50_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x624
    FUNC51_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x628
    FUNC52_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x62c
    FUNC53_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x630
    FUNC54_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x634
    FUNC55_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO output function select register
    /// offset: 0x638
    FUNC56_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// The value of the bits: 0<=s<=256. Set the value to select output signal. s=0-255: output of GPIO[n] equals input of peripheral[s]. s=256: output of GPIO[n] equals GPIO_OUT_REG[n].
        OUT_SEL: u9,
        /// set this bit to invert output signal.1:invert.0:not invert.
        INV_SEL: u1,
        /// set this bit to select output enable signal.1:use GPIO_ENABLE_REG[n] as output enable signal.0:use peripheral output enable signal.
        OEN_SEL: u1,
        /// set this bit to invert output enable signal.1:invert.0:not invert.
        OEN_INV_SEL: u1,
        padding: u20 = 0,
    }),
    /// GPIO interrupt 2 status register for GPIO0-31
    /// offset: 0x63c
    INTR_2: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt 2 status register for GPIO0-31
        INT_2: u32,
    }),
    /// GPIO interrupt 2 status register for GPIO32-56
    /// offset: 0x640
    INTR1_2: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt 2 status register for GPIO32-56
        INT1_2: u25,
        padding: u7 = 0,
    }),
    /// GPIO interrupt 3 status register for GPIO0-31
    /// offset: 0x644
    INTR_3: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt 3 status register for GPIO0-31
        INT_3: u32,
    }),
    /// GPIO interrupt 3 status register for GPIO32-56
    /// offset: 0x648
    INTR1_3: mmio.Mmio(packed struct(u32) {
        /// GPIO interrupt 3 status register for GPIO32-56
        INT1_3: u25,
        padding: u7 = 0,
    }),
    /// GPIO clock gate register
    /// offset: 0x64c
    CLOCK_GATE: mmio.Mmio(packed struct(u32) {
        /// set this bit to enable GPIO clock gate
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x650
    reserved1616: [176]u8,
    /// analog comparator interrupt raw
    /// offset: 0x700
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// analog comparator pos edge interrupt raw
        COMP0_NEG_INT_RAW: u1,
        /// analog comparator neg edge interrupt raw
        COMP0_POS_INT_RAW: u1,
        /// analog comparator neg or pos edge interrupt raw
        COMP0_ALL_INT_RAW: u1,
        /// analog comparator pos edge interrupt raw
        COMP1_NEG_INT_RAW: u1,
        /// analog comparator neg edge interrupt raw
        COMP1_POS_INT_RAW: u1,
        /// analog comparator neg or pos edge interrupt raw
        COMP1_ALL_INT_RAW: u1,
        /// pad bistok interrupt raw
        BISTOK_INT_RAW: u1,
        /// pad bistfail interrupt raw
        BISTFAIL_INT_RAW: u1,
        padding: u24 = 0,
    }),
    /// analog comparator interrupt status
    /// offset: 0x704
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// analog comparator pos edge interrupt status
        COMP0_NEG_INT_ST: u1,
        /// analog comparator neg edge interrupt status
        COMP0_POS_INT_ST: u1,
        /// analog comparator neg or pos edge interrupt status
        COMP0_ALL_INT_ST: u1,
        /// analog comparator pos edge interrupt status
        COMP1_NEG_INT_ST: u1,
        /// analog comparator neg edge interrupt status
        COMP1_POS_INT_ST: u1,
        /// analog comparator neg or pos edge interrupt status
        COMP1_ALL_INT_ST: u1,
        /// pad bistok interrupt status
        BISTOK_INT_ST: u1,
        /// pad bistfail interrupt status
        BISTFAIL_INT_ST: u1,
        padding: u24 = 0,
    }),
    /// analog comparator interrupt enable
    /// offset: 0x708
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// analog comparator pos edge interrupt enable
        COMP0_NEG_INT_ENA: u1,
        /// analog comparator neg edge interrupt enable
        COMP0_POS_INT_ENA: u1,
        /// analog comparator neg or pos edge interrupt enable
        COMP0_ALL_INT_ENA: u1,
        /// analog comparator pos edge interrupt enable
        COMP1_NEG_INT_ENA: u1,
        /// analog comparator neg edge interrupt enable
        COMP1_POS_INT_ENA: u1,
        /// analog comparator neg or pos edge interrupt enable
        COMP1_ALL_INT_ENA: u1,
        /// pad bistok interrupt enable
        BISTOK_INT_ENA: u1,
        /// pad bistfail interrupt enable
        BISTFAIL_INT_ENA: u1,
        padding: u24 = 0,
    }),
    /// analog comparator interrupt clear
    /// offset: 0x70c
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// analog comparator pos edge interrupt clear
        COMP0_NEG_INT_CLR: u1,
        /// analog comparator neg edge interrupt clear
        COMP0_POS_INT_CLR: u1,
        /// analog comparator neg or pos edge interrupt clear
        COMP0_ALL_INT_CLR: u1,
        /// analog comparator pos edge interrupt clear
        COMP1_NEG_INT_CLR: u1,
        /// analog comparator neg edge interrupt clear
        COMP1_POS_INT_CLR: u1,
        /// analog comparator neg or pos edge interrupt clear
        COMP1_ALL_INT_CLR: u1,
        /// pad bistok interrupt enable
        BISTOK_INT_CLR: u1,
        /// pad bistfail interrupt enable
        BISTFAIL_INT_CLR: u1,
        padding: u24 = 0,
    }),
    /// GPIO analog comparator zero detect filter count
    /// offset: 0x710
    ZERO_DET0_FILTER_CNT: mmio.Mmio(packed struct(u32) {
        /// GPIO analog comparator zero detect filter count
        ZERO_DET0_FILTER_CNT: u32,
    }),
    /// GPIO analog comparator zero detect filter count
    /// offset: 0x714
    ZERO_DET1_FILTER_CNT: mmio.Mmio(packed struct(u32) {
        /// GPIO analog comparator zero detect filter count
        ZERO_DET1_FILTER_CNT: u32,
    }),
    /// High speed sdio pad bist send sequence
    /// offset: 0x718
    SEND_SEQ: mmio.Mmio(packed struct(u32) {
        /// High speed sdio pad bist send sequence
        SEND_SEQ: u32,
    }),
    /// High speed sdio pad bist recive sequence
    /// offset: 0x71c
    RECIVE_SEQ: mmio.Mmio(packed struct(u32) {
        /// High speed sdio pad bist recive sequence
        RECIVE_SEQ: u32,
    }),
    /// High speed sdio pad bist in pad sel
    /// offset: 0x720
    BISTIN_SEL: mmio.Mmio(packed struct(u32) {
        /// High speed sdio pad bist in pad sel 0:pad39, 1: pad40...
        BISTIN_SEL: u4,
        padding: u28 = 0,
    }),
    /// High speed sdio pad bist control
    /// offset: 0x724
    BIST_CTRL: mmio.Mmio(packed struct(u32) {
        /// High speed sdio pad bist out pad oe
        BIST_PAD_OE: u1,
        /// High speed sdio pad bist start
        BIST_START: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x728
    reserved1832: [212]u8,
    /// GPIO version register
    /// offset: 0x7fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// version register
        DATE: u28,
        padding: u4 = 0,
    }),
};
