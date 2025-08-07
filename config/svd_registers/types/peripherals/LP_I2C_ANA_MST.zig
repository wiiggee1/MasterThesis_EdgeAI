const mmio = @import("mmio");
const types = @import("../../types.zig");

/// LP_I2C_ANA_MST Peripheral
pub const LP_I2C_ANA_MST = extern struct {
    /// need des
    /// offset: 0x00
    I2C0_CTRL: mmio.Mmio(packed struct(u32) {
        /// need des
        I2C0_CTRL: u25,
        /// need des
        I2C0_BUSY: u1,
        padding: u6 = 0,
    }),
    /// need des
    /// offset: 0x04
    I2C1_CTRL: mmio.Mmio(packed struct(u32) {
        /// need des
        I2C1_CTRL: u25,
        /// need des
        I2C1_BUSY: u1,
        padding: u6 = 0,
    }),
    /// need des
    /// offset: 0x08
    I2C0_CONF: mmio.Mmio(packed struct(u32) {
        /// need des
        I2C0_CONF: u24,
        /// need des
        I2C0_STATUS: u8,
    }),
    /// need des
    /// offset: 0x0c
    I2C1_CONF: mmio.Mmio(packed struct(u32) {
        /// need des
        I2C1_CONF: u24,
        /// need des
        I2C1_STATUS: u8,
    }),
    /// need des
    /// offset: 0x10
    I2C_BURST_CONF: mmio.Mmio(packed struct(u32) {
        /// need des
        I2C_MST_BURST_CTRL: u32,
    }),
    /// need des
    /// offset: 0x14
    I2C_BURST_STATUS: mmio.Mmio(packed struct(u32) {
        /// need des
        I2C_MST_BURST_DONE: u1,
        /// need des
        I2C_MST0_BURST_ERR_FLAG: u1,
        /// need des
        I2C_MST1_BURST_ERR_FLAG: u1,
        reserved20: u17 = 0,
        /// need des
        I2C_MST_BURST_TIMEOUT_CNT: u12,
    }),
    /// need des
    /// offset: 0x18
    ANA_CONF0: mmio.Mmio(packed struct(u32) {
        /// need des
        ANA_CONF0: u24,
        /// need des
        ANA_STATUS0: u8,
    }),
    /// need des
    /// offset: 0x1c
    ANA_CONF1: mmio.Mmio(packed struct(u32) {
        /// need des
        ANA_CONF1: u24,
        /// need des
        ANA_STATUS1: u8,
    }),
    /// need des
    /// offset: 0x20
    ANA_CONF2: mmio.Mmio(packed struct(u32) {
        /// need des
        ANA_CONF2: u24,
        /// need des
        ANA_STATUS2: u8,
    }),
    /// need des
    /// offset: 0x24
    I2C0_CTRL1: mmio.Mmio(packed struct(u32) {
        /// need des
        I2C0_SCL_PULSE_DUR: u6,
        /// need des
        I2C0_SDA_SIDE_GUARD: u5,
        padding: u21 = 0,
    }),
    /// need des
    /// offset: 0x28
    I2C1_CTRL1: mmio.Mmio(packed struct(u32) {
        /// need des
        I2C1_SCL_PULSE_DUR: u6,
        /// need des
        I2C1_SDA_SIDE_GUARD: u5,
        padding: u21 = 0,
    }),
    /// need des
    /// offset: 0x2c
    HW_I2C_CTRL: mmio.Mmio(packed struct(u32) {
        /// need des
        HW_I2C_SCL_PULSE_DUR: u6,
        /// need des
        HW_I2C_SDA_SIDE_GUARD: u5,
        /// need des
        ARBITER_DIS: u1,
        padding: u20 = 0,
    }),
    /// need des
    /// offset: 0x30
    NOUSE: mmio.Mmio(packed struct(u32) {
        /// need des
        I2C_MST_NOUSE: u32,
    }),
    /// need des
    /// offset: 0x34
    CLK160M: mmio.Mmio(packed struct(u32) {
        /// need des
        CLK_I2C_MST_SEL_160M: u1,
        padding: u31 = 0,
    }),
    /// need des
    /// offset: 0x38
    DATE: mmio.Mmio(packed struct(u32) {
        /// need des
        DATE: u28,
        /// need des
        I2C_MST_CLK_EN: u1,
        padding: u3 = 0,
    }),
};
