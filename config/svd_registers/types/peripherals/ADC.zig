const mmio = @import("mmio");
const types = @import("../../types.zig");

/// ADC (Analog to Digital Converter)
pub const ADC = extern struct {
    /// Register
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        START_FORCE: u1,
        /// need_des
        START: u1,
        /// 0: single mode, 1: double mode, 2: alternate mode
        WORK_MODE: u2,
        /// 0: SAR1, 1: SAR2, only work for single SAR mode
        SAR_SEL: u1,
        /// need_des
        SAR_CLK_GATED: u1,
        /// SAR clock divider
        SAR_CLK_DIV: u8,
        /// 0 ~ 15 means length 1 ~ 16
        SAR1_PATT_LEN: u4,
        /// 0 ~ 15 means length 1 ~ 16
        SAR2_PATT_LEN: u4,
        /// clear the pointer of pattern table for DIG ADC1 CTRL
        SAR1_PATT_P_CLEAR: u1,
        /// clear the pointer of pattern table for DIG ADC2 CTRL
        SAR2_PATT_P_CLEAR: u1,
        /// 1: sar_sel will be coded by the MSB of the 16-bit output data, in this case the resolution should not be larger than 11 bits.
        DATA_SAR_SEL: u1,
        /// 1: I2S input data is from SAR ADC (for DMA), 0: I2S input data is from GPIO matrix
        DATA_TO_I2S: u1,
        /// force option to xpd sar1 blocks
        XPD_SAR1_FORCE: u2,
        /// force option to xpd sar2 blocks
        XPD_SAR2_FORCE: u2,
        /// wait arbit signal stable after sar_done
        WAIT_ARB_CYCLE: u2,
    }),
    /// Register
    /// offset: 0x04
    CTRL2: mmio.Mmio(packed struct(u32) {
        /// need_des
        MEAS_NUM_LIMIT: u1,
        /// max conversion number
        MAX_MEAS_NUM: u8,
        /// 1: data to DIG ADC1 CTRL is inverted, otherwise not
        SAR1_INV: u1,
        /// 1: data to DIG ADC2 CTRL is inverted, otherwise not
        SAR2_INV: u1,
        /// 1: select saradc timer 0: i2s_ws trigger
        TIMER_SEL: u1,
        /// to set saradc timer target
        TIMER_TARGET: u12,
        /// to enable saradc timer trigger
        TIMER_EN: u1,
        padding: u7 = 0,
    }),
    /// Register
    /// offset: 0x08
    FILTER_CTRL1: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        FILTER_FACTOR1: u3,
        /// need_des
        FILTER_FACTOR0: u3,
    }),
    /// Register
    /// offset: 0x0c
    FSM_WAIT: mmio.Mmio(packed struct(u32) {
        /// need_des
        XPD_WAIT: u8,
        /// need_des
        RSTB_WAIT: u8,
        /// need_des
        STANDBY_WAIT: u8,
        padding: u8 = 0,
    }),
    /// Register
    /// offset: 0x10
    SAR1_STATUS: mmio.Mmio(packed struct(u32) {
        SAR1_STATUS: u32,
    }),
    /// Register
    /// offset: 0x14
    SAR2_STATUS: mmio.Mmio(packed struct(u32) {
        SAR2_STATUS: u32,
    }),
    /// Register
    /// offset: 0x18
    SAR1_PATT_TAB1: mmio.Mmio(packed struct(u32) {
        /// item 0 ~ 3 for pattern table 1 (each item one byte)
        SAR1_PATT_TAB1: u24,
        padding: u8 = 0,
    }),
    /// Register
    /// offset: 0x1c
    SAR1_PATT_TAB2: mmio.Mmio(packed struct(u32) {
        /// Item 4 ~ 7 for pattern table 1 (each item one byte)
        SAR1_PATT_TAB2: u24,
        padding: u8 = 0,
    }),
    /// Register
    /// offset: 0x20
    SAR1_PATT_TAB3: mmio.Mmio(packed struct(u32) {
        /// Item 8 ~ 11 for pattern table 1 (each item one byte)
        SAR1_PATT_TAB3: u24,
        padding: u8 = 0,
    }),
    /// Register
    /// offset: 0x24
    SAR1_PATT_TAB4: mmio.Mmio(packed struct(u32) {
        /// Item 12 ~ 15 for pattern table 1 (each item one byte)
        SAR1_PATT_TAB4: u24,
        padding: u8 = 0,
    }),
    /// Register
    /// offset: 0x28
    SAR2_PATT_TAB1: mmio.Mmio(packed struct(u32) {
        /// item 0 ~ 3 for pattern table 2 (each item one byte)
        SAR2_PATT_TAB1: u24,
        padding: u8 = 0,
    }),
    /// Register
    /// offset: 0x2c
    SAR2_PATT_TAB2: mmio.Mmio(packed struct(u32) {
        /// Item 4 ~ 7 for pattern table 2 (each item one byte)
        SAR2_PATT_TAB2: u24,
        padding: u8 = 0,
    }),
    /// Register
    /// offset: 0x30
    SAR2_PATT_TAB3: mmio.Mmio(packed struct(u32) {
        /// Item 8 ~ 11 for pattern table 2 (each item one byte)
        SAR2_PATT_TAB3: u24,
        padding: u8 = 0,
    }),
    /// Register
    /// offset: 0x34
    SAR2_PATT_TAB4: mmio.Mmio(packed struct(u32) {
        /// Item 12 ~ 15 for pattern table 2 (each item one byte)
        SAR2_PATT_TAB4: u24,
        padding: u8 = 0,
    }),
    /// Register
    /// offset: 0x38
    ARB_CTRL: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// adc2 arbiter force to enableapb controller
        ARB_APB_FORCE: u1,
        /// adc2 arbiter force to enable rtc controller
        ARB_RTC_FORCE: u1,
        /// adc2 arbiter force to enable wifi controller
        ARB_WIFI_FORCE: u1,
        /// adc2 arbiter force grant
        ARB_GRANT_FORCE: u1,
        /// Set adc2 arbiterapb priority
        ARB_APB_PRIORITY: u2,
        /// Set adc2 arbiter rtc priority
        ARB_RTC_PRIORITY: u2,
        /// Set adc2 arbiter wifi priority
        ARB_WIFI_PRIORITY: u2,
        /// adc2 arbiter uses fixed priority
        ARB_FIX_PRIORITY: u1,
        padding: u19 = 0,
    }),
    /// Register
    /// offset: 0x3c
    FILTER_CTRL0: mmio.Mmio(packed struct(u32) {
        reserved14: u14 = 0,
        /// need_des
        FILTER_CHANNEL1: u5,
        /// apb_adc1_filter_factor
        FILTER_CHANNEL0: u5,
        reserved31: u7 = 0,
        /// enable apb_adc1_filter
        FILTER_RESET: u1,
    }),
    /// Register
    /// offset: 0x40
    SAR1_DATA_STATUS: mmio.Mmio(packed struct(u32) {
        /// need_des
        APB_SARADC1_DATA: u17,
        padding: u15 = 0,
    }),
    /// Register
    /// offset: 0x44
    THRES0_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        THRES0_CHANNEL: u5,
        /// saradc1's thres0 monitor thres
        THRES0_HIGH: u13,
        /// saradc1's thres0 monitor thres
        THRES0_LOW: u13,
        padding: u1 = 0,
    }),
    /// Register
    /// offset: 0x48
    THRES1_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        THRES1_CHANNEL: u5,
        /// saradc1's thres0 monitor thres
        THRES1_HIGH: u13,
        /// saradc1's thres0 monitor thres
        THRES1_LOW: u13,
        padding: u1 = 0,
    }),
    /// Register
    /// offset: 0x4c
    THRES_CTRL: mmio.Mmio(packed struct(u32) {
        reserved27: u27 = 0,
        /// need_des
        THRES_ALL_EN: u1,
        /// need_des
        THRES3_EN: u1,
        /// need_des
        THRES2_EN: u1,
        /// need_des
        THRES1_EN: u1,
        /// need_des
        THRES0_EN: u1,
    }),
    /// Register
    /// offset: 0x50
    INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        THRES1_LOW_INT_ENA: u1,
        /// need_des
        THRES0_LOW_INT_ENA: u1,
        /// need_des
        THRES1_HIGH_INT_ENA: u1,
        /// need_des
        THRES0_HIGH_INT_ENA: u1,
        /// need_des
        SAR2_DONE_INT_ENA: u1,
        /// need_des
        SAR1_DONE_INT_ENA: u1,
    }),
    /// Register
    /// offset: 0x54
    INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        THRES1_LOW_INT_RAW: u1,
        /// need_des
        THRES0_LOW_INT_RAW: u1,
        /// need_des
        THRES1_HIGH_INT_RAW: u1,
        /// need_des
        THRES0_HIGH_INT_RAW: u1,
        /// need_des
        SAR2_DONE_INT_RAW: u1,
        /// need_des
        SAR1_DONE_INT_RAW: u1,
    }),
    /// Register
    /// offset: 0x58
    INT_ST: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        THRES1_LOW_INT_ST: u1,
        /// need_des
        THRES0_LOW_INT_ST: u1,
        /// need_des
        THRES1_HIGH_INT_ST: u1,
        /// need_des
        THRES0_HIGH_INT_ST: u1,
        /// need_des
        APB_SARADC2_DONE_INT_ST: u1,
        /// need_des
        APB_SARADC1_DONE_INT_ST: u1,
    }),
    /// Register
    /// offset: 0x5c
    INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        THRES1_LOW_INT_CLR: u1,
        /// need_des
        THRES0_LOW_INT_CLR: u1,
        /// need_des
        THRES1_HIGH_INT_CLR: u1,
        /// need_des
        THRES0_HIGH_INT_CLR: u1,
        /// need_des
        APB_SARADC2_DONE_INT_CLR: u1,
        /// need_des
        APB_SARADC1_DONE_INT_CLR: u1,
    }),
    /// Register
    /// offset: 0x60
    DMA_CONF: mmio.Mmio(packed struct(u32) {
        /// the dma_in_suc_eof gen when sample cnt = spi_eof_num
        APB_ADC_EOF_NUM: u16,
        reserved30: u14 = 0,
        /// reset_apb_adc_state
        APB_ADC_RESET_FSM: u1,
        /// enable apb_adc use spi_dma
        APB_ADC_TRANS: u1,
    }),
    /// Register
    /// offset: 0x64
    SAR2_DATA_STATUS: mmio.Mmio(packed struct(u32) {
        /// need_des
        APB_SARADC2_DATA: u17,
        padding: u15 = 0,
    }),
    /// Register
    /// offset: 0x68
    CALI: mmio.Mmio(packed struct(u32) {
        /// need_des
        CFG: u17,
        padding: u15 = 0,
    }),
    /// Register
    /// offset: 0x6c
    RND_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// rnd eco low
        RND_ECO_LOW: u32,
    }),
    /// Register
    /// offset: 0x70
    RND_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// rnd eco high
        RND_ECO_HIGH: u32,
    }),
    /// Register
    /// offset: 0x74
    RND_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// need_des
        RND_ECO_EN: u1,
        /// need_des
        RND_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x78
    reserved120: [900]u8,
    /// Register
    /// offset: 0x3fc
    CTRL_DATE: mmio.Mmio(packed struct(u32) {
        /// need_des
        CTRL_DATE: u31,
        /// need_des
        CLK_EN: u1,
    }),
};
