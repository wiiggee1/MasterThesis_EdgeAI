const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Input/Output Multiplexer
pub const IO_MUX = extern struct {
    /// offset: 0x00
    reserved0: [4]u8,
    /// iomux control register for gpio0
    /// offset: 0x04
    gpio0: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO0_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO0_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO0_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO0_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO0_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO0_MCU_DRV: u2,
        /// pull-down enable
        GPIO0_FUN_WPD: u1,
        /// pull-up enable
        GPIO0_FUN_WPU: u1,
        /// input enable
        GPIO0_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO0_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO0_MCU_SEL: u3,
        /// input filter enable
        GPIO0_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio1
    /// offset: 0x08
    gpio1: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO1_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO1_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO1_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO1_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO1_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO1_MCU_DRV: u2,
        /// pull-down enable
        GPIO1_FUN_WPD: u1,
        /// pull-up enable
        GPIO1_FUN_WPU: u1,
        /// input enable
        GPIO1_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO1_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO1_MCU_SEL: u3,
        /// input filter enable
        GPIO1_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio2
    /// offset: 0x0c
    gpio2: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO2_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO2_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO2_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO2_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO2_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO2_MCU_DRV: u2,
        /// pull-down enable
        GPIO2_FUN_WPD: u1,
        /// pull-up enable
        GPIO2_FUN_WPU: u1,
        /// input enable
        GPIO2_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO2_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO2_MCU_SEL: u3,
        /// input filter enable
        GPIO2_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio3
    /// offset: 0x10
    gpio3: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO3_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO3_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO3_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO3_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO3_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO3_MCU_DRV: u2,
        /// pull-down enable
        GPIO3_FUN_WPD: u1,
        /// pull-up enable
        GPIO3_FUN_WPU: u1,
        /// input enable
        GPIO3_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO3_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO3_MCU_SEL: u3,
        /// input filter enable
        GPIO3_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio4
    /// offset: 0x14
    gpio4: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO4_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO4_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO4_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO4_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO4_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO4_MCU_DRV: u2,
        /// pull-down enable
        GPIO4_FUN_WPD: u1,
        /// pull-up enable
        GPIO4_FUN_WPU: u1,
        /// input enable
        GPIO4_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO4_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO4_MCU_SEL: u3,
        /// input filter enable
        GPIO4_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio5
    /// offset: 0x18
    gpio5: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO5_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO5_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO5_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO5_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO5_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO5_MCU_DRV: u2,
        /// pull-down enable
        GPIO5_FUN_WPD: u1,
        /// pull-up enable
        GPIO5_FUN_WPU: u1,
        /// input enable
        GPIO5_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO5_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO5_MCU_SEL: u3,
        /// input filter enable
        GPIO5_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio6
    /// offset: 0x1c
    gpio6: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO6_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO6_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO6_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO6_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO6_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO6_MCU_DRV: u2,
        /// pull-down enable
        GPIO6_FUN_WPD: u1,
        /// pull-up enable
        GPIO6_FUN_WPU: u1,
        /// input enable
        GPIO6_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO6_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO6_MCU_SEL: u3,
        /// input filter enable
        GPIO6_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio7
    /// offset: 0x20
    gpio7: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO7_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO7_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO7_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO7_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO7_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO7_MCU_DRV: u2,
        /// pull-down enable
        GPIO7_FUN_WPD: u1,
        /// pull-up enable
        GPIO7_FUN_WPU: u1,
        /// input enable
        GPIO7_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO7_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO7_MCU_SEL: u3,
        /// input filter enable
        GPIO7_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio8
    /// offset: 0x24
    gpio8: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO8_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO8_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO8_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO8_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO8_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO8_MCU_DRV: u2,
        /// pull-down enable
        GPIO8_FUN_WPD: u1,
        /// pull-up enable
        GPIO8_FUN_WPU: u1,
        /// input enable
        GPIO8_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO8_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO8_MCU_SEL: u3,
        /// input filter enable
        GPIO8_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio9
    /// offset: 0x28
    gpio9: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO9_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO9_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO9_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO9_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO9_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO9_MCU_DRV: u2,
        /// pull-down enable
        GPIO9_FUN_WPD: u1,
        /// pull-up enable
        GPIO9_FUN_WPU: u1,
        /// input enable
        GPIO9_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO9_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO9_MCU_SEL: u3,
        /// input filter enable
        GPIO9_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio10
    /// offset: 0x2c
    gpio10: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO10_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO10_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO10_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO10_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO10_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO10_MCU_DRV: u2,
        /// pull-down enable
        GPIO10_FUN_WPD: u1,
        /// pull-up enable
        GPIO10_FUN_WPU: u1,
        /// input enable
        GPIO10_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO10_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO10_MCU_SEL: u3,
        /// input filter enable
        GPIO10_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio11
    /// offset: 0x30
    gpio11: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO11_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO11_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO11_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO11_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO11_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO11_MCU_DRV: u2,
        /// pull-down enable
        GPIO11_FUN_WPD: u1,
        /// pull-up enable
        GPIO11_FUN_WPU: u1,
        /// input enable
        GPIO11_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO11_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO11_MCU_SEL: u3,
        /// input filter enable
        GPIO11_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio12
    /// offset: 0x34
    gpio12: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO12_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO12_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO12_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO12_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO12_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO12_MCU_DRV: u2,
        /// pull-down enable
        GPIO12_FUN_WPD: u1,
        /// pull-up enable
        GPIO12_FUN_WPU: u1,
        /// input enable
        GPIO12_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO12_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO12_MCU_SEL: u3,
        /// input filter enable
        GPIO12_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio13
    /// offset: 0x38
    gpio13: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO13_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO13_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO13_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO13_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO13_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO13_MCU_DRV: u2,
        /// pull-down enable
        GPIO13_FUN_WPD: u1,
        /// pull-up enable
        GPIO13_FUN_WPU: u1,
        /// input enable
        GPIO13_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO13_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO13_MCU_SEL: u3,
        /// input filter enable
        GPIO13_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio14
    /// offset: 0x3c
    gpio14: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO14_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO14_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO14_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO14_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO14_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO14_MCU_DRV: u2,
        /// pull-down enable
        GPIO14_FUN_WPD: u1,
        /// pull-up enable
        GPIO14_FUN_WPU: u1,
        /// input enable
        GPIO14_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO14_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO14_MCU_SEL: u3,
        /// input filter enable
        GPIO14_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio15
    /// offset: 0x40
    gpio15: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO15_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO15_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO15_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO15_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO15_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO15_MCU_DRV: u2,
        /// pull-down enable
        GPIO15_FUN_WPD: u1,
        /// pull-up enable
        GPIO15_FUN_WPU: u1,
        /// input enable
        GPIO15_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO15_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO15_MCU_SEL: u3,
        /// input filter enable
        GPIO15_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio16
    /// offset: 0x44
    gpio16: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO16_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO16_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO16_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO16_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO16_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO16_MCU_DRV: u2,
        /// pull-down enable
        GPIO16_FUN_WPD: u1,
        /// pull-up enable
        GPIO16_FUN_WPU: u1,
        /// input enable
        GPIO16_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO16_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO16_MCU_SEL: u3,
        /// input filter enable
        GPIO16_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio17
    /// offset: 0x48
    gpio17: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO17_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO17_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO17_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO17_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO17_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO17_MCU_DRV: u2,
        /// pull-down enable
        GPIO17_FUN_WPD: u1,
        /// pull-up enable
        GPIO17_FUN_WPU: u1,
        /// input enable
        GPIO17_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO17_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO17_MCU_SEL: u3,
        /// input filter enable
        GPIO17_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio18
    /// offset: 0x4c
    gpio18: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO18_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO18_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO18_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO18_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO18_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO18_MCU_DRV: u2,
        /// pull-down enable
        GPIO18_FUN_WPD: u1,
        /// pull-up enable
        GPIO18_FUN_WPU: u1,
        /// input enable
        GPIO18_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO18_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO18_MCU_SEL: u3,
        /// input filter enable
        GPIO18_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio19
    /// offset: 0x50
    gpio19: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO19_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO19_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO19_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO19_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO19_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO19_MCU_DRV: u2,
        /// pull-down enable
        GPIO19_FUN_WPD: u1,
        /// pull-up enable
        GPIO19_FUN_WPU: u1,
        /// input enable
        GPIO19_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO19_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO19_MCU_SEL: u3,
        /// input filter enable
        GPIO19_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio20
    /// offset: 0x54
    gpio20: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO20_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO20_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO20_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO20_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO20_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO20_MCU_DRV: u2,
        /// pull-down enable
        GPIO20_FUN_WPD: u1,
        /// pull-up enable
        GPIO20_FUN_WPU: u1,
        /// input enable
        GPIO20_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO20_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO20_MCU_SEL: u3,
        /// input filter enable
        GPIO20_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio21
    /// offset: 0x58
    gpio21: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO21_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO21_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO21_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO21_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO21_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO21_MCU_DRV: u2,
        /// pull-down enable
        GPIO21_FUN_WPD: u1,
        /// pull-up enable
        GPIO21_FUN_WPU: u1,
        /// input enable
        GPIO21_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO21_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO21_MCU_SEL: u3,
        /// input filter enable
        GPIO21_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio22
    /// offset: 0x5c
    gpio22: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO22_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO22_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO22_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO22_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO22_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO22_MCU_DRV: u2,
        /// pull-down enable
        GPIO22_FUN_WPD: u1,
        /// pull-up enable
        GPIO22_FUN_WPU: u1,
        /// input enable
        GPIO22_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO22_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO22_MCU_SEL: u3,
        /// input filter enable
        GPIO22_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio23
    /// offset: 0x60
    gpio23: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO23_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO23_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO23_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO23_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO23_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO23_MCU_DRV: u2,
        /// pull-down enable
        GPIO23_FUN_WPD: u1,
        /// pull-up enable
        GPIO23_FUN_WPU: u1,
        /// input enable
        GPIO23_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO23_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO23_MCU_SEL: u3,
        /// input filter enable
        GPIO23_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio24
    /// offset: 0x64
    gpio24: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO24_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO24_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO24_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO24_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO24_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO24_MCU_DRV: u2,
        /// pull-down enable
        GPIO24_FUN_WPD: u1,
        /// pull-up enable
        GPIO24_FUN_WPU: u1,
        /// input enable
        GPIO24_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO24_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO24_MCU_SEL: u3,
        /// input filter enable
        GPIO24_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio25
    /// offset: 0x68
    gpio25: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO25_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO25_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO25_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO25_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO25_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO25_MCU_DRV: u2,
        /// pull-down enable
        GPIO25_FUN_WPD: u1,
        /// pull-up enable
        GPIO25_FUN_WPU: u1,
        /// input enable
        GPIO25_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO25_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO25_MCU_SEL: u3,
        /// input filter enable
        GPIO25_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio26
    /// offset: 0x6c
    gpio26: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO26_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO26_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO26_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO26_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO26_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO26_MCU_DRV: u2,
        /// pull-down enable
        GPIO26_FUN_WPD: u1,
        /// pull-up enable
        GPIO26_FUN_WPU: u1,
        /// input enable
        GPIO26_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO26_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO26_MCU_SEL: u3,
        /// input filter enable
        GPIO26_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio27
    /// offset: 0x70
    gpio27: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO27_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO27_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO27_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO27_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO27_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO27_MCU_DRV: u2,
        /// pull-down enable
        GPIO27_FUN_WPD: u1,
        /// pull-up enable
        GPIO27_FUN_WPU: u1,
        /// input enable
        GPIO27_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO27_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO27_MCU_SEL: u3,
        /// input filter enable
        GPIO27_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio28
    /// offset: 0x74
    gpio28: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO28_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO28_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO28_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO28_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO28_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO28_MCU_DRV: u2,
        /// pull-down enable
        GPIO28_FUN_WPD: u1,
        /// pull-up enable
        GPIO28_FUN_WPU: u1,
        /// input enable
        GPIO28_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO28_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO28_MCU_SEL: u3,
        /// input filter enable
        GPIO28_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio29
    /// offset: 0x78
    gpio29: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO29_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO29_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO29_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO29_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO29_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO29_MCU_DRV: u2,
        /// pull-down enable
        GPIO29_FUN_WPD: u1,
        /// pull-up enable
        GPIO29_FUN_WPU: u1,
        /// input enable
        GPIO29_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO29_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO29_MCU_SEL: u3,
        /// input filter enable
        GPIO29_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio30
    /// offset: 0x7c
    gpio30: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO30_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO30_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO30_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO30_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO30_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO30_MCU_DRV: u2,
        /// pull-down enable
        GPIO30_FUN_WPD: u1,
        /// pull-up enable
        GPIO30_FUN_WPU: u1,
        /// input enable
        GPIO30_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO30_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO30_MCU_SEL: u3,
        /// input filter enable
        GPIO30_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio31
    /// offset: 0x80
    gpio31: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO31_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO31_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO31_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO31_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO31_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO31_MCU_DRV: u2,
        /// pull-down enable
        GPIO31_FUN_WPD: u1,
        /// pull-up enable
        GPIO31_FUN_WPU: u1,
        /// input enable
        GPIO31_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO31_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO31_MCU_SEL: u3,
        /// input filter enable
        GPIO31_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio32
    /// offset: 0x84
    gpio32: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO32_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO32_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO32_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO32_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO32_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO32_MCU_DRV: u2,
        /// pull-down enable
        GPIO32_FUN_WPD: u1,
        /// pull-up enable
        GPIO32_FUN_WPU: u1,
        /// input enable
        GPIO32_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO32_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO32_MCU_SEL: u3,
        /// input filter enable
        GPIO32_FILTER_EN: u1,
        /// NA
        GPIO32_RUE_I3C: u1,
        /// NA
        GPIO32_RU_I3C: u2,
        /// NA
        GPIO32_RUE_SEL_I3C: u1,
        padding: u12 = 0,
    }),
    /// iomux control register for gpio33
    /// offset: 0x88
    gpio33: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO33_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO33_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO33_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO33_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO33_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO33_MCU_DRV: u2,
        /// pull-down enable
        GPIO33_FUN_WPD: u1,
        /// pull-up enable
        GPIO33_FUN_WPU: u1,
        /// input enable
        GPIO33_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO33_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO33_MCU_SEL: u3,
        /// input filter enable
        GPIO33_FILTER_EN: u1,
        /// NA
        GPIO33_RUE_I3C: u1,
        /// NA
        GPIO33_RU_I3C: u2,
        /// NA
        GPIO33_RUE_SEL_I3C: u1,
        padding: u12 = 0,
    }),
    /// iomux control register for gpio34
    /// offset: 0x8c
    gpio34: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO34_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO34_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO34_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO34_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO34_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO34_MCU_DRV: u2,
        /// pull-down enable
        GPIO34_FUN_WPD: u1,
        /// pull-up enable
        GPIO34_FUN_WPU: u1,
        /// input enable
        GPIO34_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO34_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO34_MCU_SEL: u3,
        /// input filter enable
        GPIO34_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio35
    /// offset: 0x90
    gpio35: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO35_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO35_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO35_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO35_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO35_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO35_MCU_DRV: u2,
        /// pull-down enable
        GPIO35_FUN_WPD: u1,
        /// pull-up enable
        GPIO35_FUN_WPU: u1,
        /// input enable
        GPIO35_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO35_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO35_MCU_SEL: u3,
        /// input filter enable
        GPIO35_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio36
    /// offset: 0x94
    gpio36: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO36_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO36_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO36_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO36_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO36_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO36_MCU_DRV: u2,
        /// pull-down enable
        GPIO36_FUN_WPD: u1,
        /// pull-up enable
        GPIO36_FUN_WPU: u1,
        /// input enable
        GPIO36_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO36_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO36_MCU_SEL: u3,
        /// input filter enable
        GPIO36_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio37
    /// offset: 0x98
    gpio37: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO37_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO37_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO37_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO37_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO37_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO37_MCU_DRV: u2,
        /// pull-down enable
        GPIO37_FUN_WPD: u1,
        /// pull-up enable
        GPIO37_FUN_WPU: u1,
        /// input enable
        GPIO37_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO37_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO37_MCU_SEL: u3,
        /// input filter enable
        GPIO37_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio38
    /// offset: 0x9c
    gpio38: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO38_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO38_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO38_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO38_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO38_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO38_MCU_DRV: u2,
        /// pull-down enable
        GPIO38_FUN_WPD: u1,
        /// pull-up enable
        GPIO38_FUN_WPU: u1,
        /// input enable
        GPIO38_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO38_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO38_MCU_SEL: u3,
        /// input filter enable
        GPIO38_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio39
    /// offset: 0xa0
    gpio39: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO39_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO39_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO39_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO39_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO39_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO39_MCU_DRV: u2,
        /// pull-down enable
        GPIO39_FUN_WPD: u1,
        /// pull-up enable
        GPIO39_FUN_WPU: u1,
        /// input enable
        GPIO39_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO39_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO39_MCU_SEL: u3,
        /// input filter enable
        GPIO39_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio40
    /// offset: 0xa4
    gpio40: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO40_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO40_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO40_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO40_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO40_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO40_MCU_DRV: u2,
        /// pull-down enable
        GPIO40_FUN_WPD: u1,
        /// pull-up enable
        GPIO40_FUN_WPU: u1,
        /// input enable
        GPIO40_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO40_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO40_MCU_SEL: u3,
        /// input filter enable
        GPIO40_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio41
    /// offset: 0xa8
    gpio41: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO41_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO41_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO41_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO41_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO41_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO41_MCU_DRV: u2,
        /// pull-down enable
        GPIO41_FUN_WPD: u1,
        /// pull-up enable
        GPIO41_FUN_WPU: u1,
        /// input enable
        GPIO41_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO41_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO41_MCU_SEL: u3,
        /// input filter enable
        GPIO41_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio42
    /// offset: 0xac
    gpio42: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO42_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO42_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO42_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO42_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO42_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO42_MCU_DRV: u2,
        /// pull-down enable
        GPIO42_FUN_WPD: u1,
        /// pull-up enable
        GPIO42_FUN_WPU: u1,
        /// input enable
        GPIO42_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO42_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO42_MCU_SEL: u3,
        /// input filter enable
        GPIO42_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio43
    /// offset: 0xb0
    gpio43: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO43_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO43_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO43_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO43_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO43_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO43_MCU_DRV: u2,
        /// pull-down enable
        GPIO43_FUN_WPD: u1,
        /// pull-up enable
        GPIO43_FUN_WPU: u1,
        /// input enable
        GPIO43_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO43_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO43_MCU_SEL: u3,
        /// input filter enable
        GPIO43_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio44
    /// offset: 0xb4
    gpio44: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO44_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO44_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO44_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO44_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO44_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO44_MCU_DRV: u2,
        /// pull-down enable
        GPIO44_FUN_WPD: u1,
        /// pull-up enable
        GPIO44_FUN_WPU: u1,
        /// input enable
        GPIO44_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO44_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO44_MCU_SEL: u3,
        /// input filter enable
        GPIO44_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio45
    /// offset: 0xb8
    gpio45: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO45_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO45_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO45_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO45_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO45_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO45_MCU_DRV: u2,
        /// pull-down enable
        GPIO45_FUN_WPD: u1,
        /// pull-up enable
        GPIO45_FUN_WPU: u1,
        /// input enable
        GPIO45_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO45_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO45_MCU_SEL: u3,
        /// input filter enable
        GPIO45_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio46
    /// offset: 0xbc
    gpio46: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO46_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO46_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO46_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO46_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO46_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO46_MCU_DRV: u2,
        /// pull-down enable
        GPIO46_FUN_WPD: u1,
        /// pull-up enable
        GPIO46_FUN_WPU: u1,
        /// input enable
        GPIO46_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO46_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO46_MCU_SEL: u3,
        /// input filter enable
        GPIO46_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio47
    /// offset: 0xc0
    gpio47: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO47_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO47_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO47_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO47_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO47_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO47_MCU_DRV: u2,
        /// pull-down enable
        GPIO47_FUN_WPD: u1,
        /// pull-up enable
        GPIO47_FUN_WPU: u1,
        /// input enable
        GPIO47_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO47_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO47_MCU_SEL: u3,
        /// input filter enable
        GPIO47_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio48
    /// offset: 0xc4
    gpio48: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO48_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO48_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO48_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO48_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO48_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO48_MCU_DRV: u2,
        /// pull-down enable
        GPIO48_FUN_WPD: u1,
        /// pull-up enable
        GPIO48_FUN_WPU: u1,
        /// input enable
        GPIO48_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO48_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO48_MCU_SEL: u3,
        /// input filter enable
        GPIO48_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio49
    /// offset: 0xc8
    gpio49: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO49_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO49_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO49_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO49_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO49_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO49_MCU_DRV: u2,
        /// pull-down enable
        GPIO49_FUN_WPD: u1,
        /// pull-up enable
        GPIO49_FUN_WPU: u1,
        /// input enable
        GPIO49_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO49_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO49_MCU_SEL: u3,
        /// input filter enable
        GPIO49_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio50
    /// offset: 0xcc
    gpio50: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO50_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO50_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO50_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO50_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO50_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO50_MCU_DRV: u2,
        /// pull-down enable
        GPIO50_FUN_WPD: u1,
        /// pull-up enable
        GPIO50_FUN_WPU: u1,
        /// input enable
        GPIO50_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO50_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO50_MCU_SEL: u3,
        /// input filter enable
        GPIO50_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio51
    /// offset: 0xd0
    gpio51: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO51_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO51_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO51_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO51_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO51_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO51_MCU_DRV: u2,
        /// pull-down enable
        GPIO51_FUN_WPD: u1,
        /// pull-up enable
        GPIO51_FUN_WPU: u1,
        /// input enable
        GPIO51_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO51_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO51_MCU_SEL: u3,
        /// input filter enable
        GPIO51_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio52
    /// offset: 0xd4
    gpio52: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO52_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO52_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO52_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO52_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO52_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO52_MCU_DRV: u2,
        /// pull-down enable
        GPIO52_FUN_WPD: u1,
        /// pull-up enable
        GPIO52_FUN_WPU: u1,
        /// input enable
        GPIO52_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO52_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO52_MCU_SEL: u3,
        /// input filter enable
        GPIO52_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio53
    /// offset: 0xd8
    gpio53: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO53_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO53_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO53_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO53_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO53_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO53_MCU_DRV: u2,
        /// pull-down enable
        GPIO53_FUN_WPD: u1,
        /// pull-up enable
        GPIO53_FUN_WPU: u1,
        /// input enable
        GPIO53_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO53_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO53_MCU_SEL: u3,
        /// input filter enable
        GPIO53_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio54
    /// offset: 0xdc
    gpio54: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO54_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO54_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO54_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO54_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO54_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO54_MCU_DRV: u2,
        /// pull-down enable
        GPIO54_FUN_WPD: u1,
        /// pull-up enable
        GPIO54_FUN_WPU: u1,
        /// input enable
        GPIO54_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO54_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO54_MCU_SEL: u3,
        /// input filter enable
        GPIO54_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio55
    /// offset: 0xe0
    gpio55: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO55_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO55_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO55_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO55_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO55_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO55_MCU_DRV: u2,
        /// pull-down enable
        GPIO55_FUN_WPD: u1,
        /// pull-up enable
        GPIO55_FUN_WPU: u1,
        /// input enable
        GPIO55_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO55_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO55_MCU_SEL: u3,
        /// input filter enable
        GPIO55_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// iomux control register for gpio56
    /// offset: 0xe4
    gpio56: mmio.Mmio(packed struct(u32) {
        /// output enable on sleep mode
        GPIO56_MCU_OE: u1,
        /// io sleep mode enable. set 1 to enable sleep mode.
        GPIO56_SLP_SEL: u1,
        /// pull-down enable on sleep mode
        GPIO56_MCU_WPD: u1,
        /// pull-up enable on sleep mode
        GPIO56_MCU_WPU: u1,
        /// input enable on sleep mode
        GPIO56_MCU_IE: u1,
        /// select drive strenth on sleep mode
        GPIO56_MCU_DRV: u2,
        /// pull-down enable
        GPIO56_FUN_WPD: u1,
        /// pull-up enable
        GPIO56_FUN_WPU: u1,
        /// input enable
        GPIO56_FUN_IE: u1,
        /// select drive strenth, 0:5mA, 1:10mA, 2:20mA, 3:40mA
        GPIO56_FUN_DRV: u2,
        /// 0:select function0, 1:select function1 ...
        GPIO56_MCU_SEL: u3,
        /// input filter enable
        GPIO56_FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// offset: 0xe8
    reserved232: [28]u8,
    /// iomux version
    /// offset: 0x104
    DATE: mmio.Mmio(packed struct(u32) {
        /// csv date
        DATE: u28,
        padding: u4 = 0,
    }),
};
