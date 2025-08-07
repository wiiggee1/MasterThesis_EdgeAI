const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Input/Output Multiplexer
pub const IO_MUX = extern struct {
    /// offset: 0x00
    reserved0: [4]u8,
    /// IO_MUX Control Register
    /// offset: 0x04
    GPIO0: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x08
    GPIO1: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x0c
    GPIO2: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x10
    GPIO3: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x14
    GPIO4: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x18
    GPIO5: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x1c
    GPIO6: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x20
    GPIO7: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x24
    GPIO8: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x28
    GPIO9: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x2c
    GPIO10: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x30
    GPIO11: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x34
    GPIO12: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x38
    GPIO13: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x3c
    GPIO14: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x40
    GPIO15: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x44
    GPIO16: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x48
    GPIO17: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x4c
    GPIO18: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x50
    GPIO19: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x54
    GPIO20: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x58
    GPIO21: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x5c
    GPIO22: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x60
    GPIO23: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x64
    GPIO24: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x68
    GPIO25: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x6c
    GPIO26: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x70
    GPIO27: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x74
    GPIO28: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x78
    GPIO29: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x7c
    GPIO30: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x80
    GPIO31: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x84
    GPIO32: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x88
    GPIO33: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x8c
    GPIO34: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x90
    GPIO35: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x94
    GPIO36: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x98
    GPIO37: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0x9c
    GPIO38: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xa0
    GPIO39: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xa4
    GPIO40: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xa8
    GPIO41: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xac
    GPIO42: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xb0
    GPIO43: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xb4
    GPIO44: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xb8
    GPIO45: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xbc
    GPIO46: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xc0
    GPIO47: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xc4
    GPIO48: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xc8
    GPIO49: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xcc
    GPIO50: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xd0
    GPIO51: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xd4
    GPIO52: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// IO_MUX Control Register
    /// offset: 0xd8
    GPIO53: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the output of GPIOn in sleep mode. 0: Disable 1: Enable
        MCU_OE: u1,
        /// Configures whether or not to enter sleep mode for GPIOn. 0: Not enter 1: Enter
        SLP_SEL: u1,
        /// Configure whether or not to enable pull-down resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPD: u1,
        /// Configures whether or not to enable pull-up resistor of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_WPU: u1,
        /// Configures whether or not to enable the input of GPIOn during sleep mode. 0: Disable 1: Enable
        MCU_IE: u1,
        /// Configures the drive strength of GPIOn during sleep mode. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        MCU_DRV: u2,
        /// Configures whether or not to enable pull-down resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPD: u1,
        /// Configures whether or not enable pull-up resistor of GPIOn. 0: Disable 1: Enable
        FUN_WPU: u1,
        /// Configures whether or not to enable input of GPIOn. 0: Disable 1: Enable
        FUN_IE: u1,
        /// Configures the drive strength of GPIOn. 0: ~5 mA 1: ~10 mA 2: ~20 mA 3: ~40 mA
        FUN_DRV: u2,
        /// Configures to select IO MUX function for this pin. 0: Select Function 0 1: Select Function 1 ......
        MCU_SEL: u3,
        /// Configures whether or not to enable filter for pin input signals. 0: Disable 1: Enable
        FILTER_EN: u1,
        padding: u16 = 0,
    }),
    /// offset: 0xdc
    reserved220: [40]u8,
    /// iomux version
    /// offset: 0x104
    DATE: mmio.Mmio(packed struct(u32) {
        /// csv date
        DATE: u28,
        padding: u4 = 0,
    }),
};
