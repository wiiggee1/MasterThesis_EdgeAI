const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Low-power Watchdog Timer
pub const LP_WDT = extern struct {
    /// need_des
    /// offset: 0x00
    CONFIG0: mmio.Mmio(packed struct(u32) {
        /// need_des
        WDT_CHIP_RESET_WIDTH: u8,
        /// need_des
        WDT_CHIP_RESET_EN: u1,
        /// need_des
        WDT_PAUSE_IN_SLP: u1,
        /// need_des
        WDT_APPCPU_RESET_EN: u1,
        /// need_des
        WDT_PROCPU_RESET_EN: u1,
        /// need_des
        WDT_FLASHBOOT_MOD_EN: u1,
        /// need_des
        WDT_SYS_RESET_LENGTH: u3,
        /// need_des
        WDT_CPU_RESET_LENGTH: u3,
        /// need_des
        WDT_STG3: u3,
        /// need_des
        WDT_STG2: u3,
        /// need_des
        WDT_STG1: u3,
        /// need_des
        WDT_STG0: u3,
        /// need_des
        WDT_EN: u1,
    }),
    /// need_des
    /// offset: 0x04
    CONFIG1: mmio.Mmio(packed struct(u32) {
        /// need_des
        WDT_STG0_HOLD: u32,
    }),
    /// need_des
    /// offset: 0x08
    CONFIG2: mmio.Mmio(packed struct(u32) {
        /// need_des
        WDT_STG1_HOLD: u32,
    }),
    /// need_des
    /// offset: 0x0c
    CONFIG3: mmio.Mmio(packed struct(u32) {
        /// need_des
        WDT_STG2_HOLD: u32,
    }),
    /// need_des
    /// offset: 0x10
    CONFIG4: mmio.Mmio(packed struct(u32) {
        /// need_des
        WDT_STG3_HOLD: u32,
    }),
    /// need_des
    /// offset: 0x14
    FEED: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        FEED: u1,
    }),
    /// need_des
    /// offset: 0x18
    WPROTECT: mmio.Mmio(packed struct(u32) {
        /// need_des
        WDT_WKEY: u32,
    }),
    /// need_des
    /// offset: 0x1c
    SWD_CONFIG: mmio.Mmio(packed struct(u32) {
        /// need_des
        SWD_RESET_FLAG: u1,
        reserved18: u17 = 0,
        /// need_des
        SWD_AUTO_FEED_EN: u1,
        /// need_des
        SWD_RST_FLAG_CLR: u1,
        /// need_des
        SWD_SIGNAL_WIDTH: u10,
        /// need_des
        SWD_DISABLE: u1,
        /// need_des
        SWD_FEED: u1,
    }),
    /// need_des
    /// offset: 0x20
    SWD_WPROTECT: mmio.Mmio(packed struct(u32) {
        /// need_des
        SWD_WKEY: u32,
    }),
    /// need_des
    /// offset: 0x24
    INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        SUPER_WDT_INT_RAW: u1,
        /// need_des
        LP_WDT_INT_RAW: u1,
    }),
    /// need_des
    /// offset: 0x28
    INT_ST: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        SUPER_WDT_INT_ST: u1,
        /// need_des
        LP_WDT_INT_ST: u1,
    }),
    /// need_des
    /// offset: 0x2c
    INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        SUPER_WDT_INT_ENA: u1,
        /// need_des
        LP_WDT_INT_ENA: u1,
    }),
    /// need_des
    /// offset: 0x30
    INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        SUPER_WDT_INT_CLR: u1,
        /// need_des
        LP_WDT_INT_CLR: u1,
    }),
    /// offset: 0x34
    reserved52: [968]u8,
    /// need_des
    /// offset: 0x3fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_WDT_DATE: u31,
        /// need_des
        CLK_EN: u1,
    }),
};
