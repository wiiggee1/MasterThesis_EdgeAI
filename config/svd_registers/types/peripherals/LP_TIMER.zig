const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Low-power Timer
pub const LP_TIMER = extern struct {
    /// need_des
    /// offset: 0x00
    TAR0_LOW: mmio.Mmio(packed struct(u32) {
        /// need_des
        MAIN_TIMER_TAR_LOW0: u32,
    }),
    /// need_des
    /// offset: 0x04
    TAR0_HIGH: mmio.Mmio(packed struct(u32) {
        /// need_des
        MAIN_TIMER_TAR_HIGH0: u16,
        reserved31: u15 = 0,
        /// need_des
        MAIN_TIMER_TAR_EN0: u1,
    }),
    /// need_des
    /// offset: 0x08
    TAR1_LOW: mmio.Mmio(packed struct(u32) {
        /// need_des
        MAIN_TIMER_TAR_LOW1: u32,
    }),
    /// need_des
    /// offset: 0x0c
    TAR1_HIGH: mmio.Mmio(packed struct(u32) {
        /// need_des
        MAIN_TIMER_TAR_HIGH1: u16,
        reserved31: u15 = 0,
        /// need_des
        MAIN_TIMER_TAR_EN1: u1,
    }),
    /// need_des
    /// offset: 0x10
    UPDATE: mmio.Mmio(packed struct(u32) {
        reserved28: u28 = 0,
        /// need_des
        MAIN_TIMER_UPDATE: u1,
        /// need_des
        MAIN_TIMER_XTAL_OFF: u1,
        /// need_des
        MAIN_TIMER_SYS_STALL: u1,
        /// need_des
        MAIN_TIMER_SYS_RST: u1,
    }),
    /// need_des
    /// offset: 0x14
    MAIN_BUF0_LOW: mmio.Mmio(packed struct(u32) {
        /// need_des
        MAIN_TIMER_BUF0_LOW: u32,
    }),
    /// need_des
    /// offset: 0x18
    MAIN_BUF0_HIGH: mmio.Mmio(packed struct(u32) {
        /// need_des
        MAIN_TIMER_BUF0_HIGH: u16,
        padding: u16 = 0,
    }),
    /// need_des
    /// offset: 0x1c
    MAIN_BUF1_LOW: mmio.Mmio(packed struct(u32) {
        /// need_des
        MAIN_TIMER_BUF1_LOW: u32,
    }),
    /// need_des
    /// offset: 0x20
    MAIN_BUF1_HIGH: mmio.Mmio(packed struct(u32) {
        /// need_des
        MAIN_TIMER_BUF1_HIGH: u16,
        padding: u16 = 0,
    }),
    /// need_des
    /// offset: 0x24
    MAIN_OVERFLOW: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        MAIN_TIMER_ALARM_LOAD: u1,
    }),
    /// need_des
    /// offset: 0x28
    INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        OVERFLOW_RAW: u1,
        /// need_des
        SOC_WAKEUP_INT_RAW: u1,
    }),
    /// need_des
    /// offset: 0x2c
    INT_ST: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        OVERFLOW_ST: u1,
        /// need_des
        SOC_WAKEUP_INT_ST: u1,
    }),
    /// need_des
    /// offset: 0x30
    INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        OVERFLOW_ENA: u1,
        /// need_des
        SOC_WAKEUP_INT_ENA: u1,
    }),
    /// need_des
    /// offset: 0x34
    INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        OVERFLOW_CLR: u1,
        /// need_des
        SOC_WAKEUP_INT_CLR: u1,
    }),
    /// need_des
    /// offset: 0x38
    LP_INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        MAIN_TIMER_OVERFLOW_LP_INT_RAW: u1,
        /// need_des
        MAIN_TIMER_LP_INT_RAW: u1,
    }),
    /// need_des
    /// offset: 0x3c
    LP_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        MAIN_TIMER_OVERFLOW_LP_INT_ST: u1,
        /// need_des
        MAIN_TIMER_LP_INT_ST: u1,
    }),
    /// need_des
    /// offset: 0x40
    LP_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        MAIN_TIMER_OVERFLOW_LP_INT_ENA: u1,
        /// need_des
        MAIN_TIMER_LP_INT_ENA: u1,
    }),
    /// need_des
    /// offset: 0x44
    LP_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        MAIN_TIMER_OVERFLOW_LP_INT_CLR: u1,
        /// need_des
        MAIN_TIMER_LP_INT_CLR: u1,
    }),
    /// offset: 0x48
    reserved72: [948]u8,
    /// need_des
    /// offset: 0x3fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// need_des
        DATE: u31,
        /// need_des
        CLK_EN: u1,
    }),
};
