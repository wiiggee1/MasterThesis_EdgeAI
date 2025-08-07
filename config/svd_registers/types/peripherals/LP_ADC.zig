const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Low-power Analog to Digital Converter
pub const LP_ADC = extern struct {
    /// Control the read operation of ADC1.
    /// offset: 0x00
    READER1_CTRL: mmio.Mmio(packed struct(u32) {
        /// Clock divider.
        SAR1_CLK_DIV: u8,
        reserved18: u10 = 0,
        /// N/A
        SAR1_CLK_GATED: u1,
        /// N/A
        SAR1_SAMPLE_NUM: u8,
        reserved28: u1 = 0,
        /// Invert SAR ADC1 data.
        SAR1_DATA_INV: u1,
        /// Enable saradc1 to send out interrupt.
        SAR1_INT_EN: u1,
        /// Force enable adc en_pad to analog circuit 2'b11: force enable .
        SAR1_EN_PAD_FORCE_ENABLE: u2,
    }),
    /// N/A
    /// offset: 0x04
    READER1_STATUS: mmio.Mmio(packed struct(u32) {
        /// N/A
        SAR1_READER_STATUS: u32,
    }),
    /// N/A
    /// offset: 0x08
    MEAS1_CTRL1: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// N/A
        FORCE_XPD_AMP: u2,
        /// N/A
        AMP_RST_FB_FORCE: u2,
        /// N/A
        AMP_SHORT_REF_FORCE: u2,
        /// N/A
        AMP_SHORT_REF_GND_FORCE: u2,
    }),
    /// ADC1 configuration registers.
    /// offset: 0x0c
    MEAS1_CTRL2: mmio.Mmio(packed struct(u32) {
        /// SAR ADC1 data.
        MEAS1_DATA_SAR: u16,
        /// SAR ADC1 conversion done indication.
        MEAS1_DONE_SAR: u1,
        /// SAR ADC1 controller (in RTC) starts conversion.
        MEAS1_START_SAR: u1,
        /// 1: SAR ADC1 controller (in RTC) is started by SW.
        MEAS1_START_FORCE: u1,
        /// SAR ADC1 pad enable bitmap.
        SAR1_EN_PAD: u12,
        /// 1: SAR ADC1 pad enable bitmap is controlled by SW.
        SAR1_EN_PAD_FORCE: u1,
    }),
    /// SAR ADC1 MUX register.
    /// offset: 0x10
    MEAS1_MUX: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// 1: SAR ADC1 controlled by DIG ADC1 CTRL.
        SAR1_DIG_FORCE: u1,
    }),
    /// ADC1 attenuation registers.
    /// offset: 0x14
    ATTEN1: mmio.Mmio(packed struct(u32) {
        /// 2-bit attenuation for each pad.
        SAR1_ATTEN: u32,
    }),
    /// N/A
    /// offset: 0x18
    AMP_CTRL1: mmio.Mmio(packed struct(u32) {
        /// N/A
        SAR_AMP_WAIT1: u16,
        /// N/A
        SAR_AMP_WAIT2: u16,
    }),
    /// N/A
    /// offset: 0x1c
    AMP_CTRL2: mmio.Mmio(packed struct(u32) {
        /// N/A
        SAR1_DAC_XPD_FSM_IDLE: u1,
        /// N/A
        XPD_SAR_AMP_FSM_IDLE: u1,
        /// N/A
        AMP_RST_FB_FSM_IDLE: u1,
        /// N/A
        AMP_SHORT_REF_FSM_IDLE: u1,
        /// N/A
        AMP_SHORT_REF_GND_FSM_IDLE: u1,
        /// N/A
        XPD_SAR_FSM_IDLE: u1,
        /// N/A
        SAR_RSTB_FSM_IDLE: u1,
        reserved16: u9 = 0,
        /// N/A
        SAR_AMP_WAIT3: u16,
    }),
    /// N/A
    /// offset: 0x20
    AMP_CTRL3: mmio.Mmio(packed struct(u32) {
        /// N/A
        SAR1_DAC_XPD_FSM: u4,
        /// N/A
        XPD_SAR_AMP_FSM: u4,
        /// N/A
        AMP_RST_FB_FSM: u4,
        /// N/A
        AMP_SHORT_REF_FSM: u4,
        /// N/A
        AMP_SHORT_REF_GND_FSM: u4,
        /// N/A
        XPD_SAR_FSM: u4,
        /// N/A
        SAR_RSTB_FSM: u4,
        padding: u4 = 0,
    }),
    /// Control the read operation of ADC2.
    /// offset: 0x24
    READER2_CTRL: mmio.Mmio(packed struct(u32) {
        /// Clock divider.
        SAR2_CLK_DIV: u8,
        reserved16: u8 = 0,
        /// Wait arbit stable after sar_done.
        SAR2_WAIT_ARB_CYCLE: u2,
        /// N/A
        SAR2_CLK_GATED: u1,
        /// N/A
        SAR2_SAMPLE_NUM: u8,
        /// Force enable adc en_pad to analog circuit 2'b11: force enable .
        SAR2_EN_PAD_FORCE_ENABLE: u2,
        /// Invert SAR ADC2 data.
        SAR2_DATA_INV: u1,
        /// Enable saradc2 to send out interrupt.
        SAR2_INT_EN: u1,
        padding: u1 = 0,
    }),
    /// N/A
    /// offset: 0x28
    READER2_STATUS: mmio.Mmio(packed struct(u32) {
        /// N/A
        SAR2_READER_STATUS: u32,
    }),
    /// ADC2 configuration registers.
    /// offset: 0x2c
    MEAS2_CTRL1: mmio.Mmio(packed struct(u32) {
        /// saradc2_cntl_fsm.
        SAR2_CNTL_STATE: u3,
        /// RTC control pwdet enable.
        SAR2_PWDET_CAL_EN: u1,
        /// RTC control pkdet enable.
        SAR2_PKDET_CAL_EN: u1,
        /// SAR2_EN_TEST.
        SAR2_EN_TEST: u1,
        /// N/A
        SAR2_RSTB_FORCE: u2,
        /// N/A
        SAR2_STANDBY_WAIT: u8,
        /// N/A
        SAR2_RSTB_WAIT: u8,
        /// N/A
        SAR2_XPD_WAIT: u8,
    }),
    /// ADC2 configuration registers.
    /// offset: 0x30
    MEAS2_CTRL2: mmio.Mmio(packed struct(u32) {
        /// SAR ADC2 data.
        MEAS2_DATA_SAR: u16,
        /// SAR ADC2 conversion done indication.
        MEAS2_DONE_SAR: u1,
        /// SAR ADC2 controller (in RTC) starts conversion.
        MEAS2_START_SAR: u1,
        /// 1: SAR ADC2 controller (in RTC) is started by SW.
        MEAS2_START_FORCE: u1,
        /// SAR ADC2 pad enable bitmap.
        SAR2_EN_PAD: u12,
        /// 1: SAR ADC2 pad enable bitmap is controlled by SW.
        SAR2_EN_PAD_FORCE: u1,
    }),
    /// SAR ADC2 MUX register.
    /// offset: 0x34
    MEAS2_MUX: mmio.Mmio(packed struct(u32) {
        reserved28: u28 = 0,
        /// SAR2_PWDET_CCT.
        SAR2_PWDET_CCT: u3,
        /// In sleep, force to use rtc to control ADC.
        SAR2_RTC_FORCE: u1,
    }),
    /// ADC1 attenuation registers.
    /// offset: 0x38
    ATTEN2: mmio.Mmio(packed struct(u32) {
        /// 2-bit attenuation for each pad.
        SAR2_ATTEN: u32,
    }),
    /// In sleep, force to use rtc to control ADC
    /// offset: 0x3c
    FORCE_WPD_SAR: mmio.Mmio(packed struct(u32) {
        /// 2'b11:software control, force on. 2'b10:software control, force off. 2'b0x:hardware control.
        FORCE_XPD_SAR1: u2,
        /// 2'b11:software control, force on. 2'b10:software control, force off. 2'b0x:hardware control.
        FORCE_XPD_SAR2: u2,
        padding: u28 = 0,
    }),
    /// N/A
    /// offset: 0x40
    MEAS_STATUS: mmio.Mmio(packed struct(u32) {
        /// N/A
        SARADC_MEAS_STATUS: u8,
        padding: u24 = 0,
    }),
    /// N/A
    /// offset: 0x44
    REG_CLKEN: mmio.Mmio(packed struct(u32) {
        /// N/A
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// Interrupt raw registers.
    /// offset: 0x48
    COCPU_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// ADC1 Conversion is done, int raw.
        COCPU_SARADC1_INT_RAW: u1,
        /// ADC2 Conversion is done, int raw.
        COCPU_SARADC2_INT_RAW: u1,
        /// An errro occurs from ADC1, int raw.
        COCPU_SARADC1_ERROR_INT_RAW: u1,
        /// An errro occurs from ADC2, int raw.
        COCPU_SARADC2_ERROR_INT_RAW: u1,
        /// A wakeup event is triggered from ADC1, int raw.
        COCPU_SARADC1_WAKE_INT_RAW: u1,
        /// A wakeup event is triggered from ADC2, int raw.
        COCPU_SARADC2_WAKE_INT_RAW: u1,
        padding: u26 = 0,
    }),
    /// Interrupt enable registers.
    /// offset: 0x4c
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// ADC1 Conversion is done, int enable.
        COCPU_SARADC1_INT_ENA: u1,
        /// ADC2 Conversion is done, int enable.
        COCPU_SARADC2_INT_ENA: u1,
        /// An errro occurs from ADC1, int enable.
        COCPU_SARADC1_ERROR_INT_ENA: u1,
        /// An errro occurs from ADC2, int enable.
        COCPU_SARADC2_ERROR_INT_ENA: u1,
        /// A wakeup event is triggered from ADC1, int enable.
        COCPU_SARADC1_WAKE_INT_ENA: u1,
        /// A wakeup event is triggered from ADC2, int enable.
        COCPU_SARADC2_WAKE_INT_ENA: u1,
        padding: u26 = 0,
    }),
    /// Interrupt status registers.
    /// offset: 0x50
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// ADC1 Conversion is done, int status.
        COCPU_SARADC1_INT_ST: u1,
        /// ADC2 Conversion is done, int status.
        COCPU_SARADC2_INT_ST: u1,
        /// An errro occurs from ADC1, int status.
        COCPU_SARADC1_ERROR_INT_ST: u1,
        /// An errro occurs from ADC2, int status.
        COCPU_SARADC2_ERROR_INT_ST: u1,
        /// A wakeup event is triggered from ADC1, int status.
        COCPU_SARADC1_WAKE_INT_ST: u1,
        /// A wakeup event is triggered from ADC2, int status.
        COCPU_SARADC2_WAKE_INT_ST: u1,
        padding: u26 = 0,
    }),
    /// Interrupt clear registers.
    /// offset: 0x54
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// ADC1 Conversion is done, int clear.
        COCPU_SARADC1_INT_CLR: u1,
        /// ADC2 Conversion is done, int clear.
        COCPU_SARADC2_INT_CLR: u1,
        /// An errro occurs from ADC1, int clear.
        COCPU_SARADC1_ERROR_INT_CLR: u1,
        /// An errro occurs from ADC2, int clear.
        COCPU_SARADC2_ERROR_INT_CLR: u1,
        /// A wakeup event is triggered from ADC1, int clear.
        COCPU_SARADC1_WAKE_INT_CLR: u1,
        /// A wakeup event is triggered from ADC2, int clear.
        COCPU_SARADC2_WAKE_INT_CLR: u1,
        padding: u26 = 0,
    }),
    /// Interrupt enable assert registers.
    /// offset: 0x58
    INT_ENA_W1TS: mmio.Mmio(packed struct(u32) {
        /// ADC1 Conversion is done, write 1 to assert int enable.
        COCPU_SARADC1_INT_ENA_W1TS: u1,
        /// ADC2 Conversion is done, write 1 to assert int enable.
        COCPU_SARADC2_INT_ENA_W1TS: u1,
        /// An errro occurs from ADC1, write 1 to assert int enable.
        COCPU_SARADC1_ERROR_INT_ENA_W1TS: u1,
        /// An errro occurs from ADC2, write 1 to assert int enable.
        COCPU_SARADC2_ERROR_INT_ENA_W1TS: u1,
        /// A wakeup event is triggered from ADC1, write 1 to assert int enable.
        COCPU_SARADC1_WAKE_INT_ENA_W1TS: u1,
        /// A wakeup event is triggered from ADC2, write 1 to assert int enable.
        COCPU_SARADC2_WAKE_INT_ENA_W1TS: u1,
        padding: u26 = 0,
    }),
    /// Interrupt enable deassert registers.
    /// offset: 0x5c
    INT_ENA_W1TC: mmio.Mmio(packed struct(u32) {
        /// ADC1 Conversion is done, write 1 to deassert int enable.
        COCPU_SARADC1_INT_ENA_W1TC: u1,
        /// ADC2 Conversion is done, write 1 to deassert int enable.
        COCPU_SARADC2_INT_ENA_W1TC: u1,
        /// An errro occurs from ADC1, write 1 to deassert int enable.
        COCPU_SARADC1_ERROR_INT_ENA_W1TC: u1,
        /// An errro occurs from ADC2, write 1 to deassert int enable.
        COCPU_SARADC2_ERROR_INT_ENA_W1TC: u1,
        /// A wakeup event is triggered from ADC1, write 1 to deassert int enable.
        COCPU_SARADC1_WAKE_INT_ENA_W1TC: u1,
        /// A wakeup event is triggered from ADC2, write 1 to deassert int enable.
        COCPU_SARADC2_WAKE_INT_ENA_W1TC: u1,
        padding: u26 = 0,
    }),
    /// ADC1 wakeup configuration registers.
    /// offset: 0x60
    WAKEUP1: mmio.Mmio(packed struct(u32) {
        /// Lower threshold.
        SAR1_WAKEUP_TH_LOW: u12,
        reserved14: u2 = 0,
        /// Upper threshold.
        SAR1_WAKEUP_TH_HIGH: u12,
        reserved29: u3 = 0,
        /// Indicates that this wakeup event arose from exceeding upper threshold.
        SAR1_WAKEUP_OVER_UPPER_TH: u1,
        /// Wakeup function enable.
        SAR1_WAKEUP_EN: u1,
        /// 0:absolute value comparison mode. 1: relative value comparison mode.
        SAR1_WAKEUP_MODE: u1,
    }),
    /// ADC2 wakeup configuration registers.
    /// offset: 0x64
    WAKEUP2: mmio.Mmio(packed struct(u32) {
        /// Lower threshold.
        SAR2_WAKEUP_TH_LOW: u12,
        reserved14: u2 = 0,
        /// Upper threshold.
        SAR2_WAKEUP_TH_HIGH: u12,
        reserved29: u3 = 0,
        /// Indicates that this wakeup event arose from exceeding upper threshold.
        SAR2_WAKEUP_OVER_UPPER_TH: u1,
        /// Wakeup function enable.
        SAR2_WAKEUP_EN: u1,
        /// 0:absolute value comparison mode. 1: relative value comparison mode.
        SAR2_WAKEUP_MODE: u1,
    }),
    /// Wakeup source select register.
    /// offset: 0x68
    WAKEUP_SEL: mmio.Mmio(packed struct(u32) {
        /// 0: ADC1. 1: ADC2.
        SAR_WAKEUP_SEL: u1,
        padding: u31 = 0,
    }),
    /// Hardware automatic sampling registers for wakeup function.
    /// offset: 0x6c
    SAR1_HW_WAKEUP: mmio.Mmio(packed struct(u32) {
        /// Enable hardware automatic sampling.
        ADC1_HW_READ_EN_I: u1,
        /// Hardware automatic sampling rate.
        ADC1_HW_READ_RATE_I: u16,
        padding: u15 = 0,
    }),
    /// Hardware automatic sampling registers for wakeup function.
    /// offset: 0x70
    SAR2_HW_WAKEUP: mmio.Mmio(packed struct(u32) {
        /// Enable hardware automatic sampling.
        ADC2_HW_READ_EN_I: u1,
        /// Hardware automatic sampling rate.
        ADC2_HW_READ_RATE_I: u16,
        padding: u15 = 0,
    }),
    /// N/A
    /// offset: 0x74
    RND_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// N/A
        RND_ECO_LOW: u32,
    }),
    /// N/A
    /// offset: 0x78
    RND_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// N/A
        RND_ECO_HIGH: u32,
    }),
    /// N/A
    /// offset: 0x7c
    RND_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// N/A
        RND_ECO_EN: u1,
        /// N/A
        RND_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
};
