const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Low-power Temperature Sensor
pub const LP_TSENS = extern struct {
    /// Tsens configuration.
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Temperature sensor data out.
        OUT: u8,
        /// Indicate temperature sensor out ready.
        READY: u1,
        /// Enable sample signal for wakeup module.
        SAMPLE_EN: u1,
        /// Wake up signal mask.
        WAKEUP_MASK: u1,
        reserved12: u1 = 0,
        /// Enable temperature sensor to send out interrupt.
        INT_EN: u1,
        /// Invert temperature sensor data.
        IN_INV: u1,
        /// Temperature sensor clock divider.
        CLK_DIV: u8,
        /// Temperature sensor power up.
        POWER_UP: u1,
        /// 1: dump out & power up controlled by SW, 0: by FSM.
        POWER_UP_FORCE: u1,
        padding: u8 = 0,
    }),
    /// Tsens configuration.
    /// offset: 0x04
    CTRL2: mmio.Mmio(packed struct(u32) {
        /// N/A
        XPD_WAIT: u12,
        /// N/A
        XPD_FORCE: u2,
        /// N/A
        CLK_INV: u1,
        padding: u17 = 0,
    }),
    /// Tsens interrupt raw registers.
    /// offset: 0x08
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// Tsens wakeup interrupt raw.
        COCPU_TSENS_WAKE_INT_RAW: u1,
        padding: u31 = 0,
    }),
    /// Tsens interrupt status registers.
    /// offset: 0x0c
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// Tsens wakeup interrupt status.
        COCPU_TSENS_WAKE_INT_ST: u1,
        padding: u31 = 0,
    }),
    /// Tsens interrupt enable registers.
    /// offset: 0x10
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// Tsens wakeup interrupt enable.
        COCPU_TSENS_WAKE_INT_ENA: u1,
        padding: u31 = 0,
    }),
    /// Tsens interrupt clear registers.
    /// offset: 0x14
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Tsens wakeup interrupt clear.
        COCPU_TSENS_WAKE_INT_CLR: u1,
        padding: u31 = 0,
    }),
    /// Tsens regbank configuration registers.
    /// offset: 0x18
    CLK_CONF: mmio.Mmio(packed struct(u32) {
        /// Tsens regbank clock gating enable.
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// Tsens wakeup interrupt enable assert.
    /// offset: 0x1c
    INT_ENA_W1TS: mmio.Mmio(packed struct(u32) {
        /// Write 1 to this field to assert interrupt enable.
        COCPU_TSENS_WAKE_INT_ENA_W1TS: u1,
        padding: u31 = 0,
    }),
    /// Tsens wakeup interrupt enable deassert.
    /// offset: 0x20
    INT_ENA_W1TC: mmio.Mmio(packed struct(u32) {
        /// Write 1 to this field to deassert interrupt enable.
        COCPU_TSENS_WAKE_INT_ENA_W1TC: u1,
        padding: u31 = 0,
    }),
    /// Tsens wakeup control registers.
    /// offset: 0x24
    WAKEUP_CTRL: mmio.Mmio(packed struct(u32) {
        /// Lower threshold.
        WAKEUP_TH_LOW: u8,
        reserved14: u6 = 0,
        /// Upper threshold.
        WAKEUP_TH_HIGH: u8,
        reserved29: u7 = 0,
        /// Indicates that this wakeup event arose from exceeding upper threshold.
        WAKEUP_OVER_UPPER_TH: u1,
        /// Tsens wakeup enable.
        WAKEUP_EN: u1,
        /// 0:absolute value comparison mode. 1: relative value comparison mode.
        WAKEUP_MODE: u1,
    }),
    /// Hardware automatic sampling control registers.
    /// offset: 0x28
    SAMPLE_RATE: mmio.Mmio(packed struct(u32) {
        /// Hardware automatic sampling rate.
        SAMPLE_RATE: u16,
        padding: u16 = 0,
    }),
    /// N/A
    /// offset: 0x2c
    RND_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// N/A
        RND_ECO_LOW: u32,
    }),
    /// N/A
    /// offset: 0x30
    RND_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// N/A
        RND_ECO_HIGH: u32,
    }),
    /// N/A
    /// offset: 0x34
    RND_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// N/A
        RND_ECO_EN: u1,
        /// N/A
        RND_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
};
