const mmio = @import("mmio");
const types = @import("../../types.zig");

/// LP_TOUCH Peripheral
pub const LP_TOUCH = extern struct {
    /// need_des
    /// offset: 0x00
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// need_des
        SCAN_DONE_INT_RAW: u1,
        /// need_des
        DONE_INT_RAW: u1,
        /// need_des
        ACTIVE_INT_RAW: u1,
        /// need_des
        INACTIVE_INT_RAW: u1,
        /// need_des
        TIMEOUT_INT_RAW: u1,
        /// need_des
        APPROACH_LOOP_DONE_INT_RAW: u1,
        padding: u26 = 0,
    }),
    /// need_des
    /// offset: 0x04
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// need_des
        SCAN_DONE_INT_ST: u1,
        /// need_des
        DONE_INT_ST: u1,
        /// need_des
        ACTIVE_INT_ST: u1,
        /// need_des
        INACTIVE_INT_ST: u1,
        /// need_des
        TIMEOUT_INT_ST: u1,
        /// need_des
        APPROACH_LOOP_DONE_INT_ST: u1,
        padding: u26 = 0,
    }),
    /// need_des
    /// offset: 0x08
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// need_des
        SCAN_DONE_INT_ENA: u1,
        /// need_des
        DONE_INT_ENA: u1,
        /// need_des
        ACTIVE_INT_ENA: u1,
        /// need_des
        INACTIVE_INT_ENA: u1,
        /// need_des
        TIMEOUT_INT_ENA: u1,
        /// need_des
        APPROACH_LOOP_DONE_INT_ENA: u1,
        padding: u26 = 0,
    }),
    /// need_des
    /// offset: 0x0c
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// need_des
        SCAN_DONE_INT_CLR: u1,
        /// need_des
        DONE_INT_CLR: u1,
        /// need_des
        ACTIVE_INT_CLR: u1,
        /// need_des
        INACTIVE_INT_CLR: u1,
        /// need_des
        TIMEOUT_INT_CLR: u1,
        /// need_des
        APPROACH_LOOP_DONE_INT_CLR: u1,
        padding: u26 = 0,
    }),
    /// need_des
    /// offset: 0x10
    CHN_STATUS: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD_ACTIVE: u15,
        /// need_des
        MEAS_DONE: u1,
        /// need_des
        SCAN_CURR: u4,
        padding: u12 = 0,
    }),
    /// need_des
    /// offset: 0x14
    STATUS_0: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD0_DATA: u16,
        /// need_des
        PAD0_DEBOUNCE_CNT: u3,
        /// need_des
        PAD0_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x18
    STATUS_1: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD1_DATA: u16,
        /// need_des
        PAD1_DEBOUNCE_CNT: u3,
        /// need_des
        PAD1_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x1c
    STATUS_2: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD2_DATA: u16,
        /// need_des
        PAD2_DEBOUNCE_CNT: u3,
        /// need_des
        PAD2_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x20
    STATUS_3: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD3_DATA: u16,
        /// need_des
        PAD3_DEBOUNCE_CNT: u3,
        /// need_des
        PAD3_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x24
    STATUS_4: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD4_DATA: u16,
        /// need_des
        PAD4_DEBOUNCE_CNT: u3,
        /// need_des
        PAD4_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x28
    STATUS_5: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD5_DATA: u16,
        /// need_des
        PAD5_DEBOUNCE_CNT: u3,
        /// need_des
        PAD5_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x2c
    STATUS_6: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD6_DATA: u16,
        /// need_des
        PAD6_DEBOUNCE_CNT: u3,
        /// need_des
        PAD6_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x30
    STATUS_7: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD7_DATA: u16,
        /// need_des
        PAD7_DEBOUNCE_CNT: u3,
        /// need_des
        PAD7_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x34
    STATUS_8: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD8_DATA: u16,
        /// need_des
        PAD8_DEBOUNCE_CNT: u3,
        /// need_des
        PAD8_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x38
    STATUS_9: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD9_DATA: u16,
        /// need_des
        PAD9_DEBOUNCE_CNT: u3,
        /// need_des
        PAD9_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x3c
    STATUS_10: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD10_DATA: u16,
        /// need_des
        PAD10_DEBOUNCE_CNT: u3,
        /// need_des
        PAD10_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x40
    STATUS_11: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD11_DATA: u16,
        /// need_des
        PAD11_DEBOUNCE_CNT: u3,
        /// need_des
        PAD11_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x44
    STATUS_12: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD12_DATA: u16,
        /// need_des
        PAD12_DEBOUNCE_CNT: u3,
        /// need_des
        PAD12_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x48
    STATUS_13: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD13_DATA: u16,
        /// need_des
        PAD13_DEBOUNCE_CNT: u3,
        /// need_des
        PAD13_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x4c
    STATUS_14: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD14_DATA: u16,
        /// need_des
        PAD14_DEBOUNCE_CNT: u3,
        /// need_des
        PAD14_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x50
    STATUS_15: mmio.Mmio(packed struct(u32) {
        /// need_des
        SLP_DATA: u16,
        /// need_des
        SLP_DEBOUNCE_CNT: u3,
        /// need_des
        SLP_NEG_NOISE_CNT: u4,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x54
    STATUS_16: mmio.Mmio(packed struct(u32) {
        /// need_des
        APPROACH_PAD2_CNT: u8,
        /// need_des
        APPROACH_PAD1_CNT: u8,
        /// need_des
        APPROACH_PAD0_CNT: u8,
        /// need_des
        SLP_APPROACH_CNT: u8,
    }),
    /// need_des
    /// offset: 0x58
    STATUS_17: mmio.Mmio(packed struct(u32) {
        /// Reserved
        DCAP_LPF: u7,
        /// need_des
        DRES_LPF: u2,
        /// need_des
        DRV_LS: u4,
        /// need_des
        DRV_HS: u5,
        /// need_des
        DBIAS: u5,
        /// need_des
        RTC_FREQ_SCAN_CNT: u2,
        padding: u7 = 0,
    }),
    /// need_des
    /// offset: 0x5c
    CHN_TMP_STATUS: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD_INACTIVE_STATUS: u15,
        /// need_des
        PAD_ACTIVE_STATUS: u15,
        padding: u2 = 0,
    }),
    /// offset: 0x60
    reserved96: [160]u8,
    /// need_des
    /// offset: 0x100
    DATE: mmio.Mmio(packed struct(u32) {
        /// need_des
        RTC_DATE: u28,
        reserved31: u3 = 0,
        /// need_des
        RTC_CLK_EN: u1,
    }),
};
