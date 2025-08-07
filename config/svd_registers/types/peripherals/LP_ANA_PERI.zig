const mmio = @import("mmio");
const types = @import("../../types.zig");

/// LP_ANA_PERI Peripheral
pub const LP_ANA_PERI = extern struct {
    /// need_des
    /// offset: 0x00
    LP_ANA_BOD_MODE0_CNTL: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// need_des
        LP_ANA_BOD_MODE0_CLOSE_FLASH_ENA: u1,
        /// need_des
        LP_ANA_BOD_MODE0_PD_RF_ENA: u1,
        /// need_des
        LP_ANA_BOD_MODE0_INTR_WAIT: u10,
        /// need_des
        LP_ANA_BOD_MODE0_RESET_WAIT: u10,
        /// need_des
        LP_ANA_BOD_MODE0_CNT_CLR: u1,
        /// need_des
        LP_ANA_BOD_MODE0_INTR_ENA: u1,
        /// need_des
        LP_ANA_BOD_MODE0_RESET_SEL: u1,
        /// need_des
        LP_ANA_BOD_MODE0_RESET_ENA: u1,
    }),
    /// need_des
    /// offset: 0x04
    LP_ANA_BOD_MODE1_CNTL: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_ANA_BOD_MODE1_RESET_ENA: u1,
    }),
    /// need_des
    /// offset: 0x08
    LP_ANA_VDD_SOURCE_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_DETMODE_SEL: u8,
        /// need_des
        LP_ANA_VGOOD_EVENT_RECORD: u8,
        /// need_des
        LP_ANA_VBAT_EVENT_RECORD_CLR: u8,
        /// need_des
        LP_ANA_BOD_SOURCE_ENA: u8,
    }),
    /// need_des
    /// offset: 0x0c
    LP_ANA_VDDBAT_BOD_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_VDDBAT_UNDERVOLTAGE_FLAG: u1,
        reserved10: u9 = 0,
        /// need_des
        LP_ANA_VDDBAT_CHARGER: u1,
        /// need_des
        LP_ANA_VDDBAT_CNT_CLR: u1,
        /// need_des
        LP_ANA_VDDBAT_UPVOLTAGE_TARGET: u10,
        /// need_des
        LP_ANA_VDDBAT_UNDERVOLTAGE_TARGET: u10,
    }),
    /// need_des
    /// offset: 0x10
    LP_ANA_VDDBAT_CHARGE_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UNDERVOLTAGE_FLAG: u1,
        reserved10: u9 = 0,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_CHARGER: u1,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_CNT_CLR: u1,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UPVOLTAGE_TARGET: u10,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UNDERVOLTAGE_TARGET: u10,
    }),
    /// need_des
    /// offset: 0x14
    LP_ANA_CK_GLITCH_CNTL: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_ANA_CK_GLITCH_RESET_ENA: u1,
    }),
    /// need_des
    /// offset: 0x18
    LP_ANA_PG_GLITCH_CNTL: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_ANA_POWER_GLITCH_RESET_ENA: u1,
    }),
    /// need_des
    /// offset: 0x1c
    LP_ANA_FIB_ENABLE: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_ANA_FIB_ENA: u32,
    }),
    /// need_des
    /// offset: 0x20
    LP_ANA_INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved27: u27 = 0,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UPVOLTAGE_INT_RAW: u1,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UNDERVOLTAGE_INT_RAW: u1,
        /// need_des
        LP_ANA_VDDBAT_UPVOLTAGE_INT_RAW: u1,
        /// need_des
        LP_ANA_VDDBAT_UNDERVOLTAGE_INT_RAW: u1,
        /// need_des
        LP_ANA_BOD_MODE0_INT_RAW: u1,
    }),
    /// need_des
    /// offset: 0x24
    LP_ANA_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved27: u27 = 0,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UPVOLTAGE_INT_ST: u1,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UNDERVOLTAGE_INT_ST: u1,
        /// need_des
        LP_ANA_VDDBAT_UPVOLTAGE_INT_ST: u1,
        /// need_des
        LP_ANA_VDDBAT_UNDERVOLTAGE_INT_ST: u1,
        /// need_des
        LP_ANA_BOD_MODE0_INT_ST: u1,
    }),
    /// need_des
    /// offset: 0x28
    LP_ANA_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved27: u27 = 0,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UPVOLTAGE_INT_ENA: u1,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UNDERVOLTAGE_INT_ENA: u1,
        /// need_des
        LP_ANA_VDDBAT_UPVOLTAGE_INT_ENA: u1,
        /// need_des
        LP_ANA_VDDBAT_UNDERVOLTAGE_INT_ENA: u1,
        /// need_des
        LP_ANA_BOD_MODE0_INT_ENA: u1,
    }),
    /// need_des
    /// offset: 0x2c
    LP_ANA_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved27: u27 = 0,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UPVOLTAGE_INT_CLR: u1,
        /// need_des
        LP_ANA_VDDBAT_CHARGE_UNDERVOLTAGE_INT_CLR: u1,
        /// need_des
        LP_ANA_VDDBAT_UPVOLTAGE_INT_CLR: u1,
        /// need_des
        LP_ANA_VDDBAT_UNDERVOLTAGE_INT_CLR: u1,
        /// need_des
        LP_ANA_BOD_MODE0_INT_CLR: u1,
    }),
    /// need_des
    /// offset: 0x30
    LP_ANA_LP_INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_ANA_BOD_MODE0_LP_INT_RAW: u1,
    }),
    /// need_des
    /// offset: 0x34
    LP_ANA_LP_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_ANA_BOD_MODE0_LP_INT_ST: u1,
    }),
    /// need_des
    /// offset: 0x38
    LP_ANA_LP_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_ANA_BOD_MODE0_LP_INT_ENA: u1,
    }),
    /// need_des
    /// offset: 0x3c
    LP_ANA_LP_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_ANA_BOD_MODE0_LP_INT_CLR: u1,
    }),
    /// offset: 0x40
    reserved64: [188]u8,
    /// need_des
    /// offset: 0xfc
    LP_ANA_TOUCH_APPROACH_WORK_MEAS_NUM: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_APPROACH_MEAS_NUM2: u10,
        /// need_des
        LP_ANA_TOUCH_APPROACH_MEAS_NUM1: u10,
        /// need_des
        LP_ANA_TOUCH_APPROACH_MEAS_NUM0: u10,
        padding: u2 = 0,
    }),
    /// need_des
    /// offset: 0x100
    LP_ANA_TOUCH_SCAN_CTRL1: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_SHIELD_PAD_EN: u1,
        /// need_des
        LP_ANA_TOUCH_INACTIVE_CONNECTION: u1,
        /// need_des
        LP_ANA_TOUCH_SCAN_PAD_MAP: u15,
        /// need_des
        LP_ANA_TOUCH_XPD_WAIT: u15,
    }),
    /// need_des
    /// offset: 0x104
    LP_ANA_TOUCH_SCAN_CTRL2: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// need_des
        LP_ANA_TOUCH_TIMEOUT_NUM: u16,
        /// need_des
        LP_ANA_TOUCH_TIMEOUT_EN: u1,
        /// need_des
        LP_ANA_TOUCH_OUT_RING: u4,
        /// need_des
        LP_ANA_FREQ_SCAN_EN: u1,
        /// need_des
        LP_ANA_FREQ_SCAN_CNT_LIMIT: u2,
        padding: u2 = 0,
    }),
    /// need_des
    /// offset: 0x108
    LP_ANA_TOUCH_WORK: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// need_des
        LP_ANA_DIV_NUM2: u3,
        /// need_des
        LP_ANA_DIV_NUM1: u3,
        /// need_des
        LP_ANA_DIV_NUM0: u3,
        /// need_des
        LP_ANA_TOUCH_OUT_SEL: u1,
        /// need_des
        LP_ANA_TOUCH_OUT_RESET: u1,
        /// need_des
        LP_ANA_TOUCH_OUT_GATE: u1,
        padding: u4 = 0,
    }),
    /// need_des
    /// offset: 0x10c
    LP_ANA_TOUCH_WORK_MEAS_NUM: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_MEAS_NUM2: u10,
        /// need_des
        LP_ANA_TOUCH_MEAS_NUM1: u10,
        /// need_des
        LP_ANA_TOUCH_MEAS_NUM0: u10,
        padding: u2 = 0,
    }),
    /// need_des
    /// offset: 0x110
    LP_ANA_TOUCH_FILTER1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        LP_ANA_TOUCH_NEG_NOISE_DISUPDATE_BASELINE_EN: u1,
        /// need_des
        LP_ANA_TOUCH_HYSTERESIS: u2,
        /// need_des
        LP_ANA_TOUCH_NEG_NOISE_THRES: u2,
        /// need_des
        LP_ANA_TOUCH_NOISE_THRES: u2,
        /// need_des
        LP_ANA_TOUCH_SMOOTH_LVL: u2,
        /// need_des
        LP_ANA_TOUCH_JITTER_STEP: u4,
        /// need_des
        LP_ANA_TOUCH_FILTER_MODE: u3,
        /// need_des
        LP_ANA_TOUCH_FILTER_EN: u1,
        /// need_des
        LP_ANA_TOUCH_NEG_NOISE_LIMIT: u4,
        /// need_des
        LP_ANA_TOUCH_APPROACH_LIMIT: u8,
        /// need_des
        LP_ANA_TOUCH_DEBOUNCE_LIMIT: u3,
    }),
    /// need_des
    /// offset: 0x114
    LP_ANA_TOUCH_FILTER2: mmio.Mmio(packed struct(u32) {
        reserved15: u15 = 0,
        /// need_des
        LP_ANA_TOUCH_OUTEN: u15,
        /// need_des
        LP_ANA_TOUCH_BYPASS_NOISE_THRES: u1,
        /// need_des
        LP_ANA_TOUCH_BYPASS_NEG_NOISE_THRES: u1,
    }),
    /// need_des
    /// offset: 0x118
    LP_ANA_TOUCH_FILTER3: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_BASELINE_SW: u16,
        /// need_des
        LP_ANA_TOUCH_UPDATE_BASELINE_SW: u1,
        padding: u15 = 0,
    }),
    /// need_des
    /// offset: 0x11c
    LP_ANA_TOUCH_SLP0: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_SLP_TH0: u16,
        /// need_des
        LP_ANA_TOUCH_SLP_CHANNEL_CLR: u1,
        /// need_des
        LP_ANA_TOUCH_SLP_PAD: u4,
        padding: u11 = 0,
    }),
    /// need_des
    /// offset: 0x120
    LP_ANA_TOUCH_SLP1: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_SLP_TH2: u16,
        /// need_des
        LP_ANA_TOUCH_SLP_TH1: u16,
    }),
    /// need_des
    /// offset: 0x124
    LP_ANA_TOUCH_CLR: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_CHANNEL_CLR: u15,
        /// need_des
        LP_ANA_TOUCH_STATUS_CLR: u1,
        padding: u16 = 0,
    }),
    /// need_des
    /// offset: 0x128
    LP_ANA_TOUCH_APPROACH: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD0: u4,
        /// need_des
        PAD1: u4,
        /// need_des
        PAD2: u4,
        /// need_des
        LP_ANA_TOUCH_SLP_APPROACH_EN: u1,
        padding: u19 = 0,
    }),
    /// need_des
    /// offset: 0x12c
    LP_ANA_TOUCH_FREQ0_SCAN_PARA: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_FREQ0_DCAP_LPF: u7,
        /// need_des
        LP_ANA_TOUCH_FREQ0_DRES_LPF: u2,
        /// need_des
        LP_ANA_TOUCH_FREQ0_DRV_LS: u4,
        /// need_des
        LP_ANA_TOUCH_FREQ0_DRV_HS: u5,
        /// need_des
        LP_ANA_TOUCH_FREQ0_DBIAS: u5,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x130
    LP_ANA_TOUCH_FREQ1_SCAN_PARA: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_FREQ1_DCAP_LPF: u7,
        /// need_des
        LP_ANA_TOUCH_FREQ1_DRES_LPF: u2,
        /// need_des
        LP_ANA_TOUCH_FREQ1_DRV_LS: u4,
        /// need_des
        LP_ANA_TOUCH_FREQ1_DRV_HS: u5,
        /// need_des
        LP_ANA_TOUCH_FREQ1_DBIAS: u5,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x134
    LP_ANA_TOUCH_FREQ2_SCAN_PARA: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_FREQ2_DCAP_LPF: u7,
        /// need_des
        LP_ANA_TOUCH_FREQ2_DRES_LPF: u2,
        /// need_des
        LP_ANA_TOUCH_FREQ2_DRV_LS: u4,
        /// need_des
        LP_ANA_TOUCH_FREQ2_DRV_HS: u5,
        /// need_des
        LP_ANA_TOUCH_FREQ2_DBIAS: u5,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x138
    LP_ANA_TOUCH_ANA_PARA: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_TOUCH_BUF_DRV: u3,
        /// need_des
        LP_ANA_TOUCH_TOUCH_EN_CAL: u1,
        /// need_des
        LP_ANA_TOUCH_TOUCH_DCAP_CAL: u7,
        padding: u21 = 0,
    }),
    /// need_des
    /// offset: 0x13c
    LP_ANA_TOUCH_MUX0: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// need_des
        LP_ANA_TOUCH_DATA_SEL: u2,
        /// need_des
        LP_ANA_TOUCH_FREQ_SEL: u2,
        /// need_des
        LP_ANA_TOUCH_BUFSEL: u15,
        /// need_des
        LP_ANA_TOUCH_DONE_EN: u1,
        /// need_des
        LP_ANA_TOUCH_DONE_FORCE: u1,
        /// need_des
        LP_ANA_TOUCH_FSM_EN: u1,
        /// need_des
        LP_ANA_TOUCH_START_EN: u1,
        /// need_des
        LP_ANA_TOUCH_START_FORCE: u1,
    }),
    /// need_des
    /// offset: 0x140
    LP_ANA_TOUCH_MUX1: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_TOUCH_START: u15,
        /// need_des
        LP_ANA_TOUCH_XPD: u15,
        padding: u2 = 0,
    }),
    /// need_des
    /// offset: 0x144
    LP_ANA_TOUCH_PAD0_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD0_TH0: u16,
    }),
    /// need_des
    /// offset: 0x148
    LP_ANA_TOUCH_PAD0_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD0_TH1: u16,
    }),
    /// need_des
    /// offset: 0x14c
    LP_ANA_TOUCH_PAD0_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD0_TH2: u16,
    }),
    /// need_des
    /// offset: 0x150
    LP_ANA_TOUCH_PAD1_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD1_TH0: u16,
    }),
    /// need_des
    /// offset: 0x154
    LP_ANA_TOUCH_PAD1_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD1_TH1: u16,
    }),
    /// need_des
    /// offset: 0x158
    LP_ANA_TOUCH_PAD1_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD1_TH2: u16,
    }),
    /// need_des
    /// offset: 0x15c
    LP_ANA_TOUCH_PAD2_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD2_TH0: u16,
    }),
    /// need_des
    /// offset: 0x160
    LP_ANA_TOUCH_PAD2_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD2_TH1: u16,
    }),
    /// need_des
    /// offset: 0x164
    LP_ANA_TOUCH_PAD2_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD2_TH2: u16,
    }),
    /// need_des
    /// offset: 0x168
    LP_ANA_TOUCH_PAD3_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD3_TH0: u16,
    }),
    /// need_des
    /// offset: 0x16c
    LP_ANA_TOUCH_PAD3_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD3_TH1: u16,
    }),
    /// need_des
    /// offset: 0x170
    LP_ANA_TOUCH_PAD3_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD3_TH2: u16,
    }),
    /// need_des
    /// offset: 0x174
    LP_ANA_TOUCH_PAD4_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD4_TH0: u16,
    }),
    /// need_des
    /// offset: 0x178
    LP_ANA_TOUCH_PAD4_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD4_TH1: u16,
    }),
    /// need_des
    /// offset: 0x17c
    LP_ANA_TOUCH_PAD4_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD4_TH2: u16,
    }),
    /// need_des
    /// offset: 0x180
    LP_ANA_TOUCH_PAD5_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD5_TH0: u16,
    }),
    /// need_des
    /// offset: 0x184
    LP_ANA_TOUCH_PAD5_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD5_TH1: u16,
    }),
    /// need_des
    /// offset: 0x188
    LP_ANA_TOUCH_PAD5_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD5_TH2: u16,
    }),
    /// need_des
    /// offset: 0x18c
    LP_ANA_TOUCH_PAD6_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD6_TH0: u16,
    }),
    /// need_des
    /// offset: 0x190
    LP_ANA_TOUCH_PAD6_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD6_TH1: u16,
    }),
    /// need_des
    /// offset: 0x194
    LP_ANA_TOUCH_PAD6_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD6_TH2: u16,
    }),
    /// need_des
    /// offset: 0x198
    LP_ANA_TOUCH_PAD7_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD7_TH0: u16,
    }),
    /// need_des
    /// offset: 0x19c
    LP_ANA_TOUCH_PAD7_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD7_TH1: u16,
    }),
    /// need_des
    /// offset: 0x1a0
    LP_ANA_TOUCH_PAD7_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD7_TH2: u16,
    }),
    /// need_des
    /// offset: 0x1a4
    LP_ANA_TOUCH_PAD8_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD8_TH0: u16,
    }),
    /// need_des
    /// offset: 0x1a8
    LP_ANA_TOUCH_PAD8_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD8_TH1: u16,
    }),
    /// need_des
    /// offset: 0x1ac
    LP_ANA_TOUCH_PAD8_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD8_TH2: u16,
    }),
    /// need_des
    /// offset: 0x1b0
    LP_ANA_TOUCH_PAD9_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD9_TH0: u16,
    }),
    /// need_des
    /// offset: 0x1b4
    LP_ANA_TOUCH_PAD9_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD9_TH1: u16,
    }),
    /// need_des
    /// offset: 0x1b8
    LP_ANA_TOUCH_PAD9_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD9_TH2: u16,
    }),
    /// need_des
    /// offset: 0x1bc
    LP_ANA_TOUCH_PAD10_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD10_TH0: u16,
    }),
    /// need_des
    /// offset: 0x1c0
    LP_ANA_TOUCH_PAD10_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD10_TH1: u16,
    }),
    /// need_des
    /// offset: 0x1c4
    LP_ANA_TOUCH_PAD10_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD10_TH2: u16,
    }),
    /// need_des
    /// offset: 0x1c8
    LP_ANA_TOUCH_PAD11_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD11_TH0: u16,
    }),
    /// need_des
    /// offset: 0x1cc
    LP_ANA_TOUCH_PAD11_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD11_TH1: u16,
    }),
    /// need_des
    /// offset: 0x1d0
    LP_ANA_TOUCH_PAD11_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD11_TH2: u16,
    }),
    /// need_des
    /// offset: 0x1d4
    LP_ANA_TOUCH_PAD12_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD12_TH0: u16,
    }),
    /// need_des
    /// offset: 0x1d8
    LP_ANA_TOUCH_PAD12_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD12_TH1: u16,
    }),
    /// need_des
    /// offset: 0x1dc
    LP_ANA_TOUCH_PAD12_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD12_TH2: u16,
    }),
    /// need_des
    /// offset: 0x1e0
    LP_ANA_TOUCH_PAD13_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD13_TH0: u16,
    }),
    /// need_des
    /// offset: 0x1e4
    LP_ANA_TOUCH_PAD13_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD13_TH1: u16,
    }),
    /// need_des
    /// offset: 0x1e8
    LP_ANA_TOUCH_PAD13_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD13_TH2: u16,
    }),
    /// need_des
    /// offset: 0x1ec
    LP_ANA_TOUCH_PAD14_TH0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD14_TH0: u16,
    }),
    /// need_des
    /// offset: 0x1f0
    LP_ANA_TOUCH_PAD14_TH1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD14_TH1: u16,
    }),
    /// need_des
    /// offset: 0x1f4
    LP_ANA_TOUCH_PAD14_TH2: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Reserved
        LP_ANA_TOUCH_PAD14_TH2: u16,
    }),
    /// offset: 0x1f8
    reserved504: [516]u8,
    /// need_des
    /// offset: 0x3fc
    LP_ANA_DATE: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ANA_LP_ANA_DATE: u31,
        /// need_des
        LP_ANA_CLK_EN: u1,
    }),
};
