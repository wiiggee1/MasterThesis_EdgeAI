const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Timer Group 0
pub const TIMG0 = extern struct {
    /// Timer %s configuration register
    /// offset: 0x00
    T0CONFIG: mmio.Mmio(packed struct(u32) {
        reserved9: u9 = 0,
        /// 1: Use XTAL_CLK as the source clock of timer group. 0: Use APB_CLK as the source clock of timer group.
        USE_XTAL: u1,
        /// When set, the alarm is enabled. This bit is automatically cleared once an alarm occurs.
        ALARM_EN: u1,
        reserved12: u1 = 0,
        /// When set, Timer %s 's clock divider counter will be reset.
        DIVCNT_RST: u1,
        /// Timer %s clock (T%s_clk) prescaler value.
        DIVIDER: u16,
        /// When set, timer %s auto-reload at alarm is enabled.
        AUTORELOAD: u1,
        /// When set, the timer %s time-base counter will increment every clock tick. When cleared, the timer %s time-base counter will decrement.
        INCREASE: u1,
        /// When set, the timer %s time-base counter is enabled.
        EN: u1,
    }),
    /// Timer %s current value, low 32 bits
    /// offset: 0x04
    T0LO: mmio.Mmio(packed struct(u32) {
        /// After writing to TIMG_T%sUPDATE_REG, the low 32 bits of the time-base counter of timer %s can be read here.
        LO: u32,
    }),
    /// Timer %s current value, high 22 bits
    /// offset: 0x08
    T0HI: mmio.Mmio(packed struct(u32) {
        /// After writing to TIMG_T%sUPDATE_REG, the high 22 bits of the time-base counter of timer %s can be read here.
        HI: u22,
        padding: u10 = 0,
    }),
    /// Write to copy current timer value to TIMGn_T%s_(LO/HI)_REG
    /// offset: 0x0c
    T0UPDATE: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// After writing 0 or 1 to TIMG_T%sUPDATE_REG, the counter value is latched.
        UPDATE: u1,
    }),
    /// Timer %s alarm value, low 32 bits
    /// offset: 0x10
    T0ALARMLO: mmio.Mmio(packed struct(u32) {
        /// Timer %s alarm trigger time-base counter value, low 32 bits.
        ALARM_LO: u32,
    }),
    /// Timer %s alarm value, high bits
    /// offset: 0x14
    T0ALARMHI: mmio.Mmio(packed struct(u32) {
        /// Timer %s alarm trigger time-base counter value, high 22 bits.
        ALARM_HI: u22,
        padding: u10 = 0,
    }),
    /// Timer %s reload value, low 32 bits
    /// offset: 0x18
    T0LOADLO: mmio.Mmio(packed struct(u32) {
        /// Low 32 bits of the value that a reload will load onto timer %s time-base Counter.
        LOAD_LO: u32,
    }),
    /// Timer %s reload value, high 22 bits
    /// offset: 0x1c
    T0LOADHI: mmio.Mmio(packed struct(u32) {
        /// High 22 bits of the value that a reload will load onto timer %s time-base counter.
        LOAD_HI: u22,
        padding: u10 = 0,
    }),
    /// Write to reload timer from TIMG_T%s_(LOADLOLOADHI)_REG
    /// offset: 0x20
    T0LOAD: mmio.Mmio(packed struct(u32) {
        /// Write any value to trigger a timer %s time-base counter reload.
        LOAD: u32,
    }),
    /// offset: 0x24
    reserved36: [36]u8,
    /// Watchdog timer configuration register
    /// offset: 0x48
    WDTCONFIG0: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// WDT reset CPU enable.
        WDT_APPCPU_RESET_EN: u1,
        /// WDT reset CPU enable.
        WDT_PROCPU_RESET_EN: u1,
        /// When set, Flash boot protection is enabled.
        WDT_FLASHBOOT_MOD_EN: u1,
        /// System reset signal length selection. 0: 100 ns, 1: 200 ns, 2: 300 ns, 3: 400 ns, 4: 500 ns, 5: 800 ns, 6: 1.6 us, 7: 3.2 us.
        WDT_SYS_RESET_LENGTH: u3,
        /// CPU reset signal length selection. 0: 100 ns, 1: 200 ns, 2: 300 ns, 3: 400 ns, 4: 500 ns, 5: 800 ns, 6: 1.6 us, 7: 3.2 us.
        WDT_CPU_RESET_LENGTH: u3,
        /// choose WDT clock:0-apb_clk, 1-xtal_clk.
        WDT_USE_XTAL: u1,
        /// update the WDT configuration registers
        WDT_CONF_UPDATE_EN: u1,
        /// Stage 3 configuration. 0: off, 1: interrupt, 2: reset CPU, 3: reset system.
        WDT_STG3: u2,
        /// Stage 2 configuration. 0: off, 1: interrupt, 2: reset CPU, 3: reset system.
        WDT_STG2: u2,
        /// Stage 1 configuration. 0: off, 1: interrupt, 2: reset CPU, 3: reset system.
        WDT_STG1: u2,
        /// Stage 0 configuration. 0: off, 1: interrupt, 2: reset CPU, 3: reset system.
        WDT_STG0: u2,
        /// When set, MWDT is enabled.
        WDT_EN: u1,
    }),
    /// Watchdog timer prescaler register
    /// offset: 0x4c
    WDTCONFIG1: mmio.Mmio(packed struct(u32) {
        /// When set, WDT 's clock divider counter will be reset.
        WDT_DIVCNT_RST: u1,
        reserved16: u15 = 0,
        /// MWDT clock prescaler value. MWDT clock period = 12.5 ns * TIMG_WDT_CLK_PRESCALE.
        WDT_CLK_PRESCALE: u16,
    }),
    /// Watchdog timer stage 0 timeout value
    /// offset: 0x50
    WDTCONFIG2: mmio.Mmio(packed struct(u32) {
        /// Stage 0 timeout value, in MWDT clock cycles.
        WDT_STG0_HOLD: u32,
    }),
    /// Watchdog timer stage 1 timeout value
    /// offset: 0x54
    WDTCONFIG3: mmio.Mmio(packed struct(u32) {
        /// Stage 1 timeout value, in MWDT clock cycles.
        WDT_STG1_HOLD: u32,
    }),
    /// Watchdog timer stage 2 timeout value
    /// offset: 0x58
    WDTCONFIG4: mmio.Mmio(packed struct(u32) {
        /// Stage 2 timeout value, in MWDT clock cycles.
        WDT_STG2_HOLD: u32,
    }),
    /// Watchdog timer stage 3 timeout value
    /// offset: 0x5c
    WDTCONFIG5: mmio.Mmio(packed struct(u32) {
        /// Stage 3 timeout value, in MWDT clock cycles.
        WDT_STG3_HOLD: u32,
    }),
    /// Write to feed the watchdog timer
    /// offset: 0x60
    WDTFEED: mmio.Mmio(packed struct(u32) {
        /// Write any value to feed the MWDT. (WO)
        WDT_FEED: u32,
    }),
    /// Watchdog write protect register
    /// offset: 0x64
    WDTWPROTECT: mmio.Mmio(packed struct(u32) {
        /// If the register contains a different value than its reset value, write protection is enabled.
        WDT_WKEY: u32,
    }),
    /// RTC calibration configure register
    /// offset: 0x68
    RTCCALICFG: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// 0: one-shot frequency calculation,1: periodic frequency calculation,
        RTC_CALI_START_CYCLING: u1,
        /// 0:rtc slow clock. 1:clk_8m, 2:xtal_32k.
        RTC_CALI_CLK_SEL: u2,
        /// indicate one-shot frequency calculation is done.
        RTC_CALI_RDY: u1,
        /// Configure the time to calculate RTC slow clock's frequency.
        RTC_CALI_MAX: u15,
        /// Set this bit to start one-shot frequency calculation.
        RTC_CALI_START: u1,
    }),
    /// RTC calibration configure1 register
    /// offset: 0x6c
    RTCCALICFG1: mmio.Mmio(packed struct(u32) {
        /// indicate periodic frequency calculation is done.
        RTC_CALI_CYCLING_DATA_VLD: u1,
        reserved7: u6 = 0,
        /// When one-shot or periodic frequency calculation is done, read this value to calculate RTC slow clock's frequency.
        RTC_CALI_VALUE: u25,
    }),
    /// Interrupt enable bits
    /// offset: 0x70
    INT_ENA_TIMERS: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the TIMG_T0_INT interrupt.
        T0_INT_ENA: u1,
        /// The interrupt enable bit for the TIMG_T1_INT interrupt.
        T1_INT_ENA: u1,
        /// The interrupt enable bit for the TIMG_WDT_INT interrupt.
        WDT_INT_ENA: u1,
        padding: u29 = 0,
    }),
    /// Raw interrupt status
    /// offset: 0x74
    INT_RAW_TIMERS: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the TIMG_T0_INT interrupt.
        T0_INT_RAW: u1,
        /// The raw interrupt status bit for the TIMG_T1_INT interrupt.
        T1_INT_RAW: u1,
        /// The raw interrupt status bit for the TIMG_WDT_INT interrupt.
        WDT_INT_RAW: u1,
        padding: u29 = 0,
    }),
    /// Masked interrupt status
    /// offset: 0x78
    INT_ST_TIMERS: mmio.Mmio(packed struct(u32) {
        /// The masked interrupt status bit for the TIMG_T0_INT interrupt.
        T0_INT_ST: u1,
        /// The masked interrupt status bit for the TIMG_T1_INT interrupt.
        T1_INT_ST: u1,
        /// The masked interrupt status bit for the TIMG_WDT_INT interrupt.
        WDT_INT_ST: u1,
        padding: u29 = 0,
    }),
    /// Interrupt clear bits
    /// offset: 0x7c
    INT_CLR_TIMERS: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the TIMG_T0_INT interrupt.
        T0_INT_CLR: u1,
        /// Set this bit to clear the TIMG_T1_INT interrupt.
        T1_INT_CLR: u1,
        /// Set this bit to clear the TIMG_WDT_INT interrupt.
        WDT_INT_CLR: u1,
        padding: u29 = 0,
    }),
    /// Timer group calibration register
    /// offset: 0x80
    RTCCALICFG2: mmio.Mmio(packed struct(u32) {
        /// RTC calibration timeout indicator
        RTC_CALI_TIMEOUT: u1,
        reserved3: u2 = 0,
        /// Cycles that release calibration timeout reset
        RTC_CALI_TIMEOUT_RST_CNT: u4,
        /// Threshold value for the RTC calibration timer. If the calibration timer's value exceeds this threshold, a timeout is triggered.
        RTC_CALI_TIMEOUT_THRES: u25,
    }),
    /// offset: 0x84
    reserved132: [116]u8,
    /// Timer version control register
    /// offset: 0xf8
    NTIMERS_DATE: mmio.Mmio(packed struct(u32) {
        /// Timer version control register
        NTIMGS_DATE: u28,
        padding: u4 = 0,
    }),
    /// Timer group clock gate register
    /// offset: 0xfc
    REGCLK: mmio.Mmio(packed struct(u32) {
        reserved28: u28 = 0,
        /// enable timer's etm task and event
        ETM_EN: u1,
        /// enable WDT's clock
        WDT_CLK_IS_ACTIVE: u1,
        /// enable Timer 30's clock
        TIMER_CLK_IS_ACTIVE: u1,
        /// Register clock gate signal. 1: Registers can be read and written to by software. 0: Registers can not be read or written to by software.
        CLK_EN: u1,
    }),
};
