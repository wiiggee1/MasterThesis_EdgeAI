const mmio = @import("mmio");
const types = @import("../../types.zig");

/// LED Control PWM (Pulse Width Modulation)
pub const LEDC = extern struct {
    /// Configuration register 0 for channel %s
    /// offset: 0x00
    CH0_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures which timer is channel %s selected.\\0: Select timer0\\1: Select timer1\\2: Select timer2\\3: Select timer3
        TIMER_SEL_CH: u2,
        /// Configures whether or not to enable signal output on channel %s.\\0: Signal output disable\\1: Signal output enable
        SIG_OUT_EN_CH: u1,
        /// Configures the output value when channel %s is inactive. Valid only when LEDC_SIG_OUT_EN_CH%s is 0.\\0: Output level is low\\1: Output level is high
        IDLE_LV_CH: u1,
        /// Configures whether or not to update LEDC_HPOINT_CH%s, LEDC_DUTY_START_CH%s, LEDC_SIG_OUT_EN_CH%s, LEDC_TIMER_SEL_CH%s, LEDC_DUTY_NUM_CH%s, LEDC_DUTY_CYCLE_CH%s, LEDC_DUTY_SCALE_CH%s, LEDC_DUTY_INC_CH%s, and LEDC_OVF_CNT_EN_CH%s fields for channel %s, and will be automatically cleared by hardware.\\0: Invalid. No effect\\1: Update
        PARA_UP_CH: u1,
        /// Configures the maximum times of overflow minus 1.The LEDC_OVF_CNT_CH%s_INT interrupt will be triggered when channel %s overflows for (LEDC_OVF_NUM_CH%s + 1) times.
        OVF_NUM_CH: u10,
        /// Configures whether or not to enable the ovf_cnt of channel %s.\\0: Disable\\1: Enable
        OVF_CNT_EN_CH: u1,
        /// Configures whether or not to reset the ovf_cnt of channel %s.\\0: Invalid. No effect\\1: Reset the ovf_cnt
        OVF_CNT_RESET_CH: u1,
        padding: u15 = 0,
    }),
    /// High point register for channel %s
    /// offset: 0x04
    CH0_HPOINT: mmio.Mmio(packed struct(u32) {
        /// Configures high point of signal output on channel %s. The output value changes to high when the selected timers has reached the value specified by this register.
        HPOINT_CH: u20,
        padding: u12 = 0,
    }),
    /// Initial duty cycle register for channel %s
    /// offset: 0x08
    CH0_DUTY: mmio.Mmio(packed struct(u32) {
        /// Configures the duty of signal output on channel %s.
        DUTY_CH: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 1 for channel %s
    /// offset: 0x0c
    CH0_CONF1: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Configures whether the duty cycle fading configurations take effect.\\0: Not take effect\\1: Take effect
        DUTY_START_CH: u1,
    }),
    /// Current duty cycle register for channel %s
    /// offset: 0x10
    CH0_DUTY_R: mmio.Mmio(packed struct(u32) {
        /// Represents the current duty of output signal on channel %s.
        DUTY_CH_R: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 0 for channel %s
    /// offset: 0x14
    CH1_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures which timer is channel %s selected.\\0: Select timer0\\1: Select timer1\\2: Select timer2\\3: Select timer3
        TIMER_SEL_CH: u2,
        /// Configures whether or not to enable signal output on channel %s.\\0: Signal output disable\\1: Signal output enable
        SIG_OUT_EN_CH: u1,
        /// Configures the output value when channel %s is inactive. Valid only when LEDC_SIG_OUT_EN_CH%s is 0.\\0: Output level is low\\1: Output level is high
        IDLE_LV_CH: u1,
        /// Configures whether or not to update LEDC_HPOINT_CH%s, LEDC_DUTY_START_CH%s, LEDC_SIG_OUT_EN_CH%s, LEDC_TIMER_SEL_CH%s, LEDC_DUTY_NUM_CH%s, LEDC_DUTY_CYCLE_CH%s, LEDC_DUTY_SCALE_CH%s, LEDC_DUTY_INC_CH%s, and LEDC_OVF_CNT_EN_CH%s fields for channel %s, and will be automatically cleared by hardware.\\0: Invalid. No effect\\1: Update
        PARA_UP_CH: u1,
        /// Configures the maximum times of overflow minus 1.The LEDC_OVF_CNT_CH%s_INT interrupt will be triggered when channel %s overflows for (LEDC_OVF_NUM_CH%s + 1) times.
        OVF_NUM_CH: u10,
        /// Configures whether or not to enable the ovf_cnt of channel %s.\\0: Disable\\1: Enable
        OVF_CNT_EN_CH: u1,
        /// Configures whether or not to reset the ovf_cnt of channel %s.\\0: Invalid. No effect\\1: Reset the ovf_cnt
        OVF_CNT_RESET_CH: u1,
        padding: u15 = 0,
    }),
    /// High point register for channel %s
    /// offset: 0x18
    CH1_HPOINT: mmio.Mmio(packed struct(u32) {
        /// Configures high point of signal output on channel %s. The output value changes to high when the selected timers has reached the value specified by this register.
        HPOINT_CH: u20,
        padding: u12 = 0,
    }),
    /// Initial duty cycle register for channel %s
    /// offset: 0x1c
    CH1_DUTY: mmio.Mmio(packed struct(u32) {
        /// Configures the duty of signal output on channel %s.
        DUTY_CH: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 1 for channel %s
    /// offset: 0x20
    CH1_CONF1: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Configures whether the duty cycle fading configurations take effect.\\0: Not take effect\\1: Take effect
        DUTY_START_CH: u1,
    }),
    /// Current duty cycle register for channel %s
    /// offset: 0x24
    CH1_DUTY_R: mmio.Mmio(packed struct(u32) {
        /// Represents the current duty of output signal on channel %s.
        DUTY_CH_R: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 0 for channel %s
    /// offset: 0x28
    CH2_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures which timer is channel %s selected.\\0: Select timer0\\1: Select timer1\\2: Select timer2\\3: Select timer3
        TIMER_SEL_CH: u2,
        /// Configures whether or not to enable signal output on channel %s.\\0: Signal output disable\\1: Signal output enable
        SIG_OUT_EN_CH: u1,
        /// Configures the output value when channel %s is inactive. Valid only when LEDC_SIG_OUT_EN_CH%s is 0.\\0: Output level is low\\1: Output level is high
        IDLE_LV_CH: u1,
        /// Configures whether or not to update LEDC_HPOINT_CH%s, LEDC_DUTY_START_CH%s, LEDC_SIG_OUT_EN_CH%s, LEDC_TIMER_SEL_CH%s, LEDC_DUTY_NUM_CH%s, LEDC_DUTY_CYCLE_CH%s, LEDC_DUTY_SCALE_CH%s, LEDC_DUTY_INC_CH%s, and LEDC_OVF_CNT_EN_CH%s fields for channel %s, and will be automatically cleared by hardware.\\0: Invalid. No effect\\1: Update
        PARA_UP_CH: u1,
        /// Configures the maximum times of overflow minus 1.The LEDC_OVF_CNT_CH%s_INT interrupt will be triggered when channel %s overflows for (LEDC_OVF_NUM_CH%s + 1) times.
        OVF_NUM_CH: u10,
        /// Configures whether or not to enable the ovf_cnt of channel %s.\\0: Disable\\1: Enable
        OVF_CNT_EN_CH: u1,
        /// Configures whether or not to reset the ovf_cnt of channel %s.\\0: Invalid. No effect\\1: Reset the ovf_cnt
        OVF_CNT_RESET_CH: u1,
        padding: u15 = 0,
    }),
    /// High point register for channel %s
    /// offset: 0x2c
    CH2_HPOINT: mmio.Mmio(packed struct(u32) {
        /// Configures high point of signal output on channel %s. The output value changes to high when the selected timers has reached the value specified by this register.
        HPOINT_CH: u20,
        padding: u12 = 0,
    }),
    /// Initial duty cycle register for channel %s
    /// offset: 0x30
    CH2_DUTY: mmio.Mmio(packed struct(u32) {
        /// Configures the duty of signal output on channel %s.
        DUTY_CH: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 1 for channel %s
    /// offset: 0x34
    CH2_CONF1: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Configures whether the duty cycle fading configurations take effect.\\0: Not take effect\\1: Take effect
        DUTY_START_CH: u1,
    }),
    /// Current duty cycle register for channel %s
    /// offset: 0x38
    CH2_DUTY_R: mmio.Mmio(packed struct(u32) {
        /// Represents the current duty of output signal on channel %s.
        DUTY_CH_R: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 0 for channel %s
    /// offset: 0x3c
    CH3_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures which timer is channel %s selected.\\0: Select timer0\\1: Select timer1\\2: Select timer2\\3: Select timer3
        TIMER_SEL_CH: u2,
        /// Configures whether or not to enable signal output on channel %s.\\0: Signal output disable\\1: Signal output enable
        SIG_OUT_EN_CH: u1,
        /// Configures the output value when channel %s is inactive. Valid only when LEDC_SIG_OUT_EN_CH%s is 0.\\0: Output level is low\\1: Output level is high
        IDLE_LV_CH: u1,
        /// Configures whether or not to update LEDC_HPOINT_CH%s, LEDC_DUTY_START_CH%s, LEDC_SIG_OUT_EN_CH%s, LEDC_TIMER_SEL_CH%s, LEDC_DUTY_NUM_CH%s, LEDC_DUTY_CYCLE_CH%s, LEDC_DUTY_SCALE_CH%s, LEDC_DUTY_INC_CH%s, and LEDC_OVF_CNT_EN_CH%s fields for channel %s, and will be automatically cleared by hardware.\\0: Invalid. No effect\\1: Update
        PARA_UP_CH: u1,
        /// Configures the maximum times of overflow minus 1.The LEDC_OVF_CNT_CH%s_INT interrupt will be triggered when channel %s overflows for (LEDC_OVF_NUM_CH%s + 1) times.
        OVF_NUM_CH: u10,
        /// Configures whether or not to enable the ovf_cnt of channel %s.\\0: Disable\\1: Enable
        OVF_CNT_EN_CH: u1,
        /// Configures whether or not to reset the ovf_cnt of channel %s.\\0: Invalid. No effect\\1: Reset the ovf_cnt
        OVF_CNT_RESET_CH: u1,
        padding: u15 = 0,
    }),
    /// High point register for channel %s
    /// offset: 0x40
    CH3_HPOINT: mmio.Mmio(packed struct(u32) {
        /// Configures high point of signal output on channel %s. The output value changes to high when the selected timers has reached the value specified by this register.
        HPOINT_CH: u20,
        padding: u12 = 0,
    }),
    /// Initial duty cycle register for channel %s
    /// offset: 0x44
    CH3_DUTY: mmio.Mmio(packed struct(u32) {
        /// Configures the duty of signal output on channel %s.
        DUTY_CH: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 1 for channel %s
    /// offset: 0x48
    CH3_CONF1: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Configures whether the duty cycle fading configurations take effect.\\0: Not take effect\\1: Take effect
        DUTY_START_CH: u1,
    }),
    /// Current duty cycle register for channel %s
    /// offset: 0x4c
    CH3_DUTY_R: mmio.Mmio(packed struct(u32) {
        /// Represents the current duty of output signal on channel %s.
        DUTY_CH_R: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 0 for channel %s
    /// offset: 0x50
    CH4_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures which timer is channel %s selected.\\0: Select timer0\\1: Select timer1\\2: Select timer2\\3: Select timer3
        TIMER_SEL_CH: u2,
        /// Configures whether or not to enable signal output on channel %s.\\0: Signal output disable\\1: Signal output enable
        SIG_OUT_EN_CH: u1,
        /// Configures the output value when channel %s is inactive. Valid only when LEDC_SIG_OUT_EN_CH%s is 0.\\0: Output level is low\\1: Output level is high
        IDLE_LV_CH: u1,
        /// Configures whether or not to update LEDC_HPOINT_CH%s, LEDC_DUTY_START_CH%s, LEDC_SIG_OUT_EN_CH%s, LEDC_TIMER_SEL_CH%s, LEDC_DUTY_NUM_CH%s, LEDC_DUTY_CYCLE_CH%s, LEDC_DUTY_SCALE_CH%s, LEDC_DUTY_INC_CH%s, and LEDC_OVF_CNT_EN_CH%s fields for channel %s, and will be automatically cleared by hardware.\\0: Invalid. No effect\\1: Update
        PARA_UP_CH: u1,
        /// Configures the maximum times of overflow minus 1.The LEDC_OVF_CNT_CH%s_INT interrupt will be triggered when channel %s overflows for (LEDC_OVF_NUM_CH%s + 1) times.
        OVF_NUM_CH: u10,
        /// Configures whether or not to enable the ovf_cnt of channel %s.\\0: Disable\\1: Enable
        OVF_CNT_EN_CH: u1,
        /// Configures whether or not to reset the ovf_cnt of channel %s.\\0: Invalid. No effect\\1: Reset the ovf_cnt
        OVF_CNT_RESET_CH: u1,
        padding: u15 = 0,
    }),
    /// High point register for channel %s
    /// offset: 0x54
    CH4_HPOINT: mmio.Mmio(packed struct(u32) {
        /// Configures high point of signal output on channel %s. The output value changes to high when the selected timers has reached the value specified by this register.
        HPOINT_CH: u20,
        padding: u12 = 0,
    }),
    /// Initial duty cycle register for channel %s
    /// offset: 0x58
    CH4_DUTY: mmio.Mmio(packed struct(u32) {
        /// Configures the duty of signal output on channel %s.
        DUTY_CH: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 1 for channel %s
    /// offset: 0x5c
    CH4_CONF1: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Configures whether the duty cycle fading configurations take effect.\\0: Not take effect\\1: Take effect
        DUTY_START_CH: u1,
    }),
    /// Current duty cycle register for channel %s
    /// offset: 0x60
    CH4_DUTY_R: mmio.Mmio(packed struct(u32) {
        /// Represents the current duty of output signal on channel %s.
        DUTY_CH_R: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 0 for channel %s
    /// offset: 0x64
    CH5_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures which timer is channel %s selected.\\0: Select timer0\\1: Select timer1\\2: Select timer2\\3: Select timer3
        TIMER_SEL_CH: u2,
        /// Configures whether or not to enable signal output on channel %s.\\0: Signal output disable\\1: Signal output enable
        SIG_OUT_EN_CH: u1,
        /// Configures the output value when channel %s is inactive. Valid only when LEDC_SIG_OUT_EN_CH%s is 0.\\0: Output level is low\\1: Output level is high
        IDLE_LV_CH: u1,
        /// Configures whether or not to update LEDC_HPOINT_CH%s, LEDC_DUTY_START_CH%s, LEDC_SIG_OUT_EN_CH%s, LEDC_TIMER_SEL_CH%s, LEDC_DUTY_NUM_CH%s, LEDC_DUTY_CYCLE_CH%s, LEDC_DUTY_SCALE_CH%s, LEDC_DUTY_INC_CH%s, and LEDC_OVF_CNT_EN_CH%s fields for channel %s, and will be automatically cleared by hardware.\\0: Invalid. No effect\\1: Update
        PARA_UP_CH: u1,
        /// Configures the maximum times of overflow minus 1.The LEDC_OVF_CNT_CH%s_INT interrupt will be triggered when channel %s overflows for (LEDC_OVF_NUM_CH%s + 1) times.
        OVF_NUM_CH: u10,
        /// Configures whether or not to enable the ovf_cnt of channel %s.\\0: Disable\\1: Enable
        OVF_CNT_EN_CH: u1,
        /// Configures whether or not to reset the ovf_cnt of channel %s.\\0: Invalid. No effect\\1: Reset the ovf_cnt
        OVF_CNT_RESET_CH: u1,
        padding: u15 = 0,
    }),
    /// High point register for channel %s
    /// offset: 0x68
    CH5_HPOINT: mmio.Mmio(packed struct(u32) {
        /// Configures high point of signal output on channel %s. The output value changes to high when the selected timers has reached the value specified by this register.
        HPOINT_CH: u20,
        padding: u12 = 0,
    }),
    /// Initial duty cycle register for channel %s
    /// offset: 0x6c
    CH5_DUTY: mmio.Mmio(packed struct(u32) {
        /// Configures the duty of signal output on channel %s.
        DUTY_CH: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 1 for channel %s
    /// offset: 0x70
    CH5_CONF1: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Configures whether the duty cycle fading configurations take effect.\\0: Not take effect\\1: Take effect
        DUTY_START_CH: u1,
    }),
    /// Current duty cycle register for channel %s
    /// offset: 0x74
    CH5_DUTY_R: mmio.Mmio(packed struct(u32) {
        /// Represents the current duty of output signal on channel %s.
        DUTY_CH_R: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 0 for channel %s
    /// offset: 0x78
    CH6_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures which timer is channel %s selected.\\0: Select timer0\\1: Select timer1\\2: Select timer2\\3: Select timer3
        TIMER_SEL_CH: u2,
        /// Configures whether or not to enable signal output on channel %s.\\0: Signal output disable\\1: Signal output enable
        SIG_OUT_EN_CH: u1,
        /// Configures the output value when channel %s is inactive. Valid only when LEDC_SIG_OUT_EN_CH%s is 0.\\0: Output level is low\\1: Output level is high
        IDLE_LV_CH: u1,
        /// Configures whether or not to update LEDC_HPOINT_CH%s, LEDC_DUTY_START_CH%s, LEDC_SIG_OUT_EN_CH%s, LEDC_TIMER_SEL_CH%s, LEDC_DUTY_NUM_CH%s, LEDC_DUTY_CYCLE_CH%s, LEDC_DUTY_SCALE_CH%s, LEDC_DUTY_INC_CH%s, and LEDC_OVF_CNT_EN_CH%s fields for channel %s, and will be automatically cleared by hardware.\\0: Invalid. No effect\\1: Update
        PARA_UP_CH: u1,
        /// Configures the maximum times of overflow minus 1.The LEDC_OVF_CNT_CH%s_INT interrupt will be triggered when channel %s overflows for (LEDC_OVF_NUM_CH%s + 1) times.
        OVF_NUM_CH: u10,
        /// Configures whether or not to enable the ovf_cnt of channel %s.\\0: Disable\\1: Enable
        OVF_CNT_EN_CH: u1,
        /// Configures whether or not to reset the ovf_cnt of channel %s.\\0: Invalid. No effect\\1: Reset the ovf_cnt
        OVF_CNT_RESET_CH: u1,
        padding: u15 = 0,
    }),
    /// High point register for channel %s
    /// offset: 0x7c
    CH6_HPOINT: mmio.Mmio(packed struct(u32) {
        /// Configures high point of signal output on channel %s. The output value changes to high when the selected timers has reached the value specified by this register.
        HPOINT_CH: u20,
        padding: u12 = 0,
    }),
    /// Initial duty cycle register for channel %s
    /// offset: 0x80
    CH6_DUTY: mmio.Mmio(packed struct(u32) {
        /// Configures the duty of signal output on channel %s.
        DUTY_CH: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 1 for channel %s
    /// offset: 0x84
    CH6_CONF1: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Configures whether the duty cycle fading configurations take effect.\\0: Not take effect\\1: Take effect
        DUTY_START_CH: u1,
    }),
    /// Current duty cycle register for channel %s
    /// offset: 0x88
    CH6_DUTY_R: mmio.Mmio(packed struct(u32) {
        /// Represents the current duty of output signal on channel %s.
        DUTY_CH_R: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 0 for channel %s
    /// offset: 0x8c
    CH7_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures which timer is channel %s selected.\\0: Select timer0\\1: Select timer1\\2: Select timer2\\3: Select timer3
        TIMER_SEL_CH: u2,
        /// Configures whether or not to enable signal output on channel %s.\\0: Signal output disable\\1: Signal output enable
        SIG_OUT_EN_CH: u1,
        /// Configures the output value when channel %s is inactive. Valid only when LEDC_SIG_OUT_EN_CH%s is 0.\\0: Output level is low\\1: Output level is high
        IDLE_LV_CH: u1,
        /// Configures whether or not to update LEDC_HPOINT_CH%s, LEDC_DUTY_START_CH%s, LEDC_SIG_OUT_EN_CH%s, LEDC_TIMER_SEL_CH%s, LEDC_DUTY_NUM_CH%s, LEDC_DUTY_CYCLE_CH%s, LEDC_DUTY_SCALE_CH%s, LEDC_DUTY_INC_CH%s, and LEDC_OVF_CNT_EN_CH%s fields for channel %s, and will be automatically cleared by hardware.\\0: Invalid. No effect\\1: Update
        PARA_UP_CH: u1,
        /// Configures the maximum times of overflow minus 1.The LEDC_OVF_CNT_CH%s_INT interrupt will be triggered when channel %s overflows for (LEDC_OVF_NUM_CH%s + 1) times.
        OVF_NUM_CH: u10,
        /// Configures whether or not to enable the ovf_cnt of channel %s.\\0: Disable\\1: Enable
        OVF_CNT_EN_CH: u1,
        /// Configures whether or not to reset the ovf_cnt of channel %s.\\0: Invalid. No effect\\1: Reset the ovf_cnt
        OVF_CNT_RESET_CH: u1,
        padding: u15 = 0,
    }),
    /// High point register for channel %s
    /// offset: 0x90
    CH7_HPOINT: mmio.Mmio(packed struct(u32) {
        /// Configures high point of signal output on channel %s. The output value changes to high when the selected timers has reached the value specified by this register.
        HPOINT_CH: u20,
        padding: u12 = 0,
    }),
    /// Initial duty cycle register for channel %s
    /// offset: 0x94
    CH7_DUTY: mmio.Mmio(packed struct(u32) {
        /// Configures the duty of signal output on channel %s.
        DUTY_CH: u25,
        padding: u7 = 0,
    }),
    /// Configuration register 1 for channel %s
    /// offset: 0x98
    CH7_CONF1: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Configures whether the duty cycle fading configurations take effect.\\0: Not take effect\\1: Take effect
        DUTY_START_CH: u1,
    }),
    /// Current duty cycle register for channel %s
    /// offset: 0x9c
    CH7_DUTY_R: mmio.Mmio(packed struct(u32) {
        /// Represents the current duty of output signal on channel %s.
        DUTY_CH_R: u25,
        padding: u7 = 0,
    }),
    /// Timer %s configuration register
    /// offset: 0xa0
    TIMER0_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the range of the counter in timer %s.
        TIMER_DUTY_RES: u5,
        /// Configures the divisor for the divider in timer %s.The least significant eight bits represent the fractional part.
        CLK_DIV_TIMER: u18,
        /// Configures whether or not to pause the counter in timer %s.\\0: Normal\\1: Pause
        TIMER_PAUSE: u1,
        /// Configures whether or not to reset timer %s. The counter will show 0 after reset.\\0: Not reset\\1: Reset
        TIMER_RST: u1,
        /// Configures which clock is timer %s selected. Unused.
        TICK_SEL_TIMER: u1,
        /// Configures whether or not to update LEDC_CLK_DIV_TIMER%s and LEDC_TIMER%s_DUTY_RES.\\0: Invalid. No effect\\1: Update
        TIMER_PARA_UP: u1,
        padding: u5 = 0,
    }),
    /// Timer %s current counter value register
    /// offset: 0xa4
    TIMER0_VALUE: mmio.Mmio(packed struct(u32) {
        /// Represents the current counter value of timer %s.
        TIMER_CNT: u20,
        padding: u12 = 0,
    }),
    /// Timer %s configuration register
    /// offset: 0xa8
    TIMER1_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the range of the counter in timer %s.
        TIMER_DUTY_RES: u5,
        /// Configures the divisor for the divider in timer %s.The least significant eight bits represent the fractional part.
        CLK_DIV_TIMER: u18,
        /// Configures whether or not to pause the counter in timer %s.\\0: Normal\\1: Pause
        TIMER_PAUSE: u1,
        /// Configures whether or not to reset timer %s. The counter will show 0 after reset.\\0: Not reset\\1: Reset
        TIMER_RST: u1,
        /// Configures which clock is timer %s selected. Unused.
        TICK_SEL_TIMER: u1,
        /// Configures whether or not to update LEDC_CLK_DIV_TIMER%s and LEDC_TIMER%s_DUTY_RES.\\0: Invalid. No effect\\1: Update
        TIMER_PARA_UP: u1,
        padding: u5 = 0,
    }),
    /// Timer %s current counter value register
    /// offset: 0xac
    TIMER1_VALUE: mmio.Mmio(packed struct(u32) {
        /// Represents the current counter value of timer %s.
        TIMER_CNT: u20,
        padding: u12 = 0,
    }),
    /// Timer %s configuration register
    /// offset: 0xb0
    TIMER2_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the range of the counter in timer %s.
        TIMER_DUTY_RES: u5,
        /// Configures the divisor for the divider in timer %s.The least significant eight bits represent the fractional part.
        CLK_DIV_TIMER: u18,
        /// Configures whether or not to pause the counter in timer %s.\\0: Normal\\1: Pause
        TIMER_PAUSE: u1,
        /// Configures whether or not to reset timer %s. The counter will show 0 after reset.\\0: Not reset\\1: Reset
        TIMER_RST: u1,
        /// Configures which clock is timer %s selected. Unused.
        TICK_SEL_TIMER: u1,
        /// Configures whether or not to update LEDC_CLK_DIV_TIMER%s and LEDC_TIMER%s_DUTY_RES.\\0: Invalid. No effect\\1: Update
        TIMER_PARA_UP: u1,
        padding: u5 = 0,
    }),
    /// Timer %s current counter value register
    /// offset: 0xb4
    TIMER2_VALUE: mmio.Mmio(packed struct(u32) {
        /// Represents the current counter value of timer %s.
        TIMER_CNT: u20,
        padding: u12 = 0,
    }),
    /// Timer %s configuration register
    /// offset: 0xb8
    TIMER3_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the range of the counter in timer %s.
        TIMER_DUTY_RES: u5,
        /// Configures the divisor for the divider in timer %s.The least significant eight bits represent the fractional part.
        CLK_DIV_TIMER: u18,
        /// Configures whether or not to pause the counter in timer %s.\\0: Normal\\1: Pause
        TIMER_PAUSE: u1,
        /// Configures whether or not to reset timer %s. The counter will show 0 after reset.\\0: Not reset\\1: Reset
        TIMER_RST: u1,
        /// Configures which clock is timer %s selected. Unused.
        TICK_SEL_TIMER: u1,
        /// Configures whether or not to update LEDC_CLK_DIV_TIMER%s and LEDC_TIMER%s_DUTY_RES.\\0: Invalid. No effect\\1: Update
        TIMER_PARA_UP: u1,
        padding: u5 = 0,
    }),
    /// Timer %s current counter value register
    /// offset: 0xbc
    TIMER3_VALUE: mmio.Mmio(packed struct(u32) {
        /// Represents the current counter value of timer %s.
        TIMER_CNT: u20,
        padding: u12 = 0,
    }),
    /// Interrupt raw status register
    /// offset: 0xc0
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// Raw status bit: The raw interrupt status of LEDC_TIMER0_OVF_INT. Triggered when the timer0 has reached its maximum counter value.
        TIMER0_OVF_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_TIMER1_OVF_INT. Triggered when the timer1 has reached its maximum counter value.
        TIMER1_OVF_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_TIMER2_OVF_INT. Triggered when the timer2 has reached its maximum counter value.
        TIMER2_OVF_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_TIMER3_OVF_INT. Triggered when the timer3 has reached its maximum counter value.
        TIMER3_OVF_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_DUTY_CHNG_END_CH0_INT. Triggered when the fading of duty has finished.
        DUTY_CHNG_END_CH0_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_DUTY_CHNG_END_CH1_INT. Triggered when the fading of duty has finished.
        DUTY_CHNG_END_CH1_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_DUTY_CHNG_END_CH2_INT. Triggered when the fading of duty has finished.
        DUTY_CHNG_END_CH2_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_DUTY_CHNG_END_CH3_INT. Triggered when the fading of duty has finished.
        DUTY_CHNG_END_CH3_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_DUTY_CHNG_END_CH4_INT. Triggered when the fading of duty has finished.
        DUTY_CHNG_END_CH4_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_DUTY_CHNG_END_CH5_INT. Triggered when the fading of duty has finished.
        DUTY_CHNG_END_CH5_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_DUTY_CHNG_END_CH6_INT. Triggered when the fading of duty has finished.
        DUTY_CHNG_END_CH6_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_DUTY_CHNG_END_CH7_INT. Triggered when the fading of duty has finished.
        DUTY_CHNG_END_CH7_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_OVF_CNT_CH0_INT. Triggered when the ovf_cnt has reached the value specified by LEDC_OVF_NUM_CH0.
        OVF_CNT_CH0_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_OVF_CNT_CH1_INT. Triggered when the ovf_cnt has reached the value specified by LEDC_OVF_NUM_CH1.
        OVF_CNT_CH1_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_OVF_CNT_CH2_INT. Triggered when the ovf_cnt has reached the value specified by LEDC_OVF_NUM_CH2.
        OVF_CNT_CH2_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_OVF_CNT_CH3_INT. Triggered when the ovf_cnt has reached the value specified by LEDC_OVF_NUM_CH3.
        OVF_CNT_CH3_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_OVF_CNT_CH4_INT. Triggered when the ovf_cnt has reached the value specified by LEDC_OVF_NUM_CH4.
        OVF_CNT_CH4_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_OVF_CNT_CH5_INT. Triggered when the ovf_cnt has reached the value specified by LEDC_OVF_NUM_CH5.
        OVF_CNT_CH5_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_OVF_CNT_CH6_INT. Triggered when the ovf_cnt has reached the value specified by LEDC_OVF_NUM_CH6.
        OVF_CNT_CH6_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of LEDC_OVF_CNT_CH7_INT. Triggered when the ovf_cnt has reached the value specified by LEDC_OVF_NUM_CH7.
        OVF_CNT_CH7_INT_RAW: u1,
        padding: u12 = 0,
    }),
    /// Interrupt masked status register
    /// offset: 0xc4
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// Masked status bit: The masked interrupt status of LEDC_TIMER0_OVF_INT. Valid only when LEDC_TIMER0_OVF_INT_ENA is set to 1.
        TIMER0_OVF_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_TIMER1_OVF_INT. Valid only when LEDC_TIMER1_OVF_INT_ENA is set to 1.
        TIMER1_OVF_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_TIMER2_OVF_INT. Valid only when LEDC_TIMER2_OVF_INT_ENA is set to 1.
        TIMER2_OVF_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_TIMER3_OVF_INT. Valid only when LEDC_TIMER3_OVF_INT_ENA is set to 1.
        TIMER3_OVF_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_DUTY_CHNG_END_CH0_INT. Valid only when LEDC_DUTY_CHNG_END_CH0_INT_ENA is set to 1.
        DUTY_CHNG_END_CH0_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_DUTY_CHNG_END_CH1_INT. Valid only when LEDC_DUTY_CHNG_END_CH1_INT_ENA is set to 1.
        DUTY_CHNG_END_CH1_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_DUTY_CHNG_END_CH2_INT. Valid only when LEDC_DUTY_CHNG_END_CH2_INT_ENA is set to 1.
        DUTY_CHNG_END_CH2_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_DUTY_CHNG_END_CH3_INT. Valid only when LEDC_DUTY_CHNG_END_CH3_INT_ENA is set to 1.
        DUTY_CHNG_END_CH3_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_DUTY_CHNG_END_CH4_INT. Valid only when LEDC_DUTY_CHNG_END_CH4_INT_ENA is set to 1.
        DUTY_CHNG_END_CH4_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_DUTY_CHNG_END_CH5_INT. Valid only when LEDC_DUTY_CHNG_END_CH5_INT_ENA is set to 1.
        DUTY_CHNG_END_CH5_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_DUTY_CHNG_END_CH6_INT. Valid only when LEDC_DUTY_CHNG_END_CH6_INT_ENA is set to 1.
        DUTY_CHNG_END_CH6_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_DUTY_CHNG_END_CH7_INT. Valid only when LEDC_DUTY_CHNG_END_CH7_INT_ENA is set to 1.
        DUTY_CHNG_END_CH7_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_OVF_CNT_CH0_INT. Valid only when LEDC_OVF_CNT_CH0_INT_ENA is set to 1.
        OVF_CNT_CH0_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_OVF_CNT_CH1_INT. Valid only when LEDC_OVF_CNT_CH1_INT_ENA is set to 1.
        OVF_CNT_CH1_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_OVF_CNT_CH2_INT. Valid only when LEDC_OVF_CNT_CH2_INT_ENA is set to 1.
        OVF_CNT_CH2_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_OVF_CNT_CH3_INT. Valid only when LEDC_OVF_CNT_CH3_INT_ENA is set to 1.
        OVF_CNT_CH3_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_OVF_CNT_CH4_INT. Valid only when LEDC_OVF_CNT_CH4_INT_ENA is set to 1.
        OVF_CNT_CH4_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_OVF_CNT_CH5_INT. Valid only when LEDC_OVF_CNT_CH5_INT_ENA is set to 1.
        OVF_CNT_CH5_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_OVF_CNT_CH6_INT. Valid only when LEDC_OVF_CNT_CH6_INT_ENA is set to 1.
        OVF_CNT_CH6_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of LEDC_OVF_CNT_CH7_INT. Valid only when LEDC_OVF_CNT_CH7_INT_ENA is set to 1.
        OVF_CNT_CH7_INT_ST: u1,
        padding: u12 = 0,
    }),
    /// Interrupt enable register
    /// offset: 0xc8
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// Enable bit: Write 1 to enable LEDC_TIMER0_OVF_INT.
        TIMER0_OVF_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_TIMER1_OVF_INT.
        TIMER1_OVF_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_TIMER2_OVF_INT.
        TIMER2_OVF_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_TIMER3_OVF_INT.
        TIMER3_OVF_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_DUTY_CHNG_END_CH0_INT.
        DUTY_CHNG_END_CH0_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_DUTY_CHNG_END_CH1_INT.
        DUTY_CHNG_END_CH1_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_DUTY_CHNG_END_CH2_INT.
        DUTY_CHNG_END_CH2_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_DUTY_CHNG_END_CH3_INT.
        DUTY_CHNG_END_CH3_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_DUTY_CHNG_END_CH4_INT.
        DUTY_CHNG_END_CH4_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_DUTY_CHNG_END_CH5_INT.
        DUTY_CHNG_END_CH5_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_DUTY_CHNG_END_CH6_INT.
        DUTY_CHNG_END_CH6_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_DUTY_CHNG_END_CH7_INT.
        DUTY_CHNG_END_CH7_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_OVF_CNT_CH0_INT.
        OVF_CNT_CH0_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_OVF_CNT_CH1_INT.
        OVF_CNT_CH1_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_OVF_CNT_CH2_INT.
        OVF_CNT_CH2_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_OVF_CNT_CH3_INT.
        OVF_CNT_CH3_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_OVF_CNT_CH4_INT.
        OVF_CNT_CH4_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_OVF_CNT_CH5_INT.
        OVF_CNT_CH5_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_OVF_CNT_CH6_INT.
        OVF_CNT_CH6_INT_ENA: u1,
        /// Enable bit: Write 1 to enable LEDC_OVF_CNT_CH7_INT.
        OVF_CNT_CH7_INT_ENA: u1,
        padding: u12 = 0,
    }),
    /// Interrupt clear register
    /// offset: 0xcc
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Clear bit: Write 1 to clear LEDC_TIMER0_OVF_INT.
        TIMER0_OVF_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_TIMER1_OVF_INT.
        TIMER1_OVF_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_TIMER2_OVF_INT.
        TIMER2_OVF_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_TIMER3_OVF_INT.
        TIMER3_OVF_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_DUTY_CHNG_END_CH0_INT.
        DUTY_CHNG_END_CH0_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_DUTY_CHNG_END_CH1_INT.
        DUTY_CHNG_END_CH1_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_DUTY_CHNG_END_CH2_INT.
        DUTY_CHNG_END_CH2_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_DUTY_CHNG_END_CH3_INT.
        DUTY_CHNG_END_CH3_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_DUTY_CHNG_END_CH4_INT.
        DUTY_CHNG_END_CH4_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_DUTY_CHNG_END_CH5_INT.
        DUTY_CHNG_END_CH5_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_DUTY_CHNG_END_CH6_INT.
        DUTY_CHNG_END_CH6_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_DUTY_CHNG_END_CH7_INT.
        DUTY_CHNG_END_CH7_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_OVF_CNT_CH0_INT.
        OVF_CNT_CH0_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_OVF_CNT_CH1_INT.
        OVF_CNT_CH1_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_OVF_CNT_CH2_INT.
        OVF_CNT_CH2_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_OVF_CNT_CH3_INT.
        OVF_CNT_CH3_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_OVF_CNT_CH4_INT.
        OVF_CNT_CH4_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_OVF_CNT_CH5_INT.
        OVF_CNT_CH5_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_OVF_CNT_CH6_INT.
        OVF_CNT_CH6_INT_CLR: u1,
        /// Clear bit: Write 1 to clear LEDC_OVF_CNT_CH7_INT.
        OVF_CNT_CH7_INT_CLR: u1,
        padding: u12 = 0,
    }),
    /// offset: 0xd0
    reserved208: [48]u8,
    /// Ledc ch%s gamma config register.
    /// offset: 0x100
    CH0_GAMMA_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the number of duty cycle fading rages for LEDC ch%s.
        CH_GAMMA_ENTRY_NUM: u5,
        /// Configures whether or not to pause duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Pause
        CH_GAMMA_PAUSE: u1,
        /// Configures whether or nor to resume duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Resume
        CH_GAMMA_RESUME: u1,
        padding: u25 = 0,
    }),
    /// Ledc ch%s gamma config register.
    /// offset: 0x104
    CH1_GAMMA_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the number of duty cycle fading rages for LEDC ch%s.
        CH_GAMMA_ENTRY_NUM: u5,
        /// Configures whether or not to pause duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Pause
        CH_GAMMA_PAUSE: u1,
        /// Configures whether or nor to resume duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Resume
        CH_GAMMA_RESUME: u1,
        padding: u25 = 0,
    }),
    /// Ledc ch%s gamma config register.
    /// offset: 0x108
    CH2_GAMMA_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the number of duty cycle fading rages for LEDC ch%s.
        CH_GAMMA_ENTRY_NUM: u5,
        /// Configures whether or not to pause duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Pause
        CH_GAMMA_PAUSE: u1,
        /// Configures whether or nor to resume duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Resume
        CH_GAMMA_RESUME: u1,
        padding: u25 = 0,
    }),
    /// Ledc ch%s gamma config register.
    /// offset: 0x10c
    CH3_GAMMA_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the number of duty cycle fading rages for LEDC ch%s.
        CH_GAMMA_ENTRY_NUM: u5,
        /// Configures whether or not to pause duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Pause
        CH_GAMMA_PAUSE: u1,
        /// Configures whether or nor to resume duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Resume
        CH_GAMMA_RESUME: u1,
        padding: u25 = 0,
    }),
    /// Ledc ch%s gamma config register.
    /// offset: 0x110
    CH4_GAMMA_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the number of duty cycle fading rages for LEDC ch%s.
        CH_GAMMA_ENTRY_NUM: u5,
        /// Configures whether or not to pause duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Pause
        CH_GAMMA_PAUSE: u1,
        /// Configures whether or nor to resume duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Resume
        CH_GAMMA_RESUME: u1,
        padding: u25 = 0,
    }),
    /// Ledc ch%s gamma config register.
    /// offset: 0x114
    CH5_GAMMA_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the number of duty cycle fading rages for LEDC ch%s.
        CH_GAMMA_ENTRY_NUM: u5,
        /// Configures whether or not to pause duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Pause
        CH_GAMMA_PAUSE: u1,
        /// Configures whether or nor to resume duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Resume
        CH_GAMMA_RESUME: u1,
        padding: u25 = 0,
    }),
    /// Ledc ch%s gamma config register.
    /// offset: 0x118
    CH6_GAMMA_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the number of duty cycle fading rages for LEDC ch%s.
        CH_GAMMA_ENTRY_NUM: u5,
        /// Configures whether or not to pause duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Pause
        CH_GAMMA_PAUSE: u1,
        /// Configures whether or nor to resume duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Resume
        CH_GAMMA_RESUME: u1,
        padding: u25 = 0,
    }),
    /// Ledc ch%s gamma config register.
    /// offset: 0x11c
    CH7_GAMMA_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the number of duty cycle fading rages for LEDC ch%s.
        CH_GAMMA_ENTRY_NUM: u5,
        /// Configures whether or not to pause duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Pause
        CH_GAMMA_PAUSE: u1,
        /// Configures whether or nor to resume duty cycle fading of LEDC ch%s.\\0: Invalid. No effect\\1: Resume
        CH_GAMMA_RESUME: u1,
        padding: u25 = 0,
    }),
    /// Ledc event task enable bit register0.
    /// offset: 0x120
    EVT_TASK_EN0: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable the ledc_ch0_duty_chng_end event.\\0: Disable\\1: Enable
        EVT_DUTY_CHNG_END_CH0_EN: u1,
        /// Configures whether or not to enable the ledc_ch1_duty_chng_end event.\\0: Disable\\1: Enable
        EVT_DUTY_CHNG_END_CH1_EN: u1,
        /// Configures whether or not to enable the ledc_ch2_duty_chng_end event.\\0: Disable\\1: Enable
        EVT_DUTY_CHNG_END_CH2_EN: u1,
        /// Configures whether or not to enable the ledc_ch3_duty_chng_end event.\\0: Disable\\1: Enable
        EVT_DUTY_CHNG_END_CH3_EN: u1,
        /// Configures whether or not to enable the ledc_ch4_duty_chng_end event.\\0: Disable\\1: Enable
        EVT_DUTY_CHNG_END_CH4_EN: u1,
        /// Configures whether or not to enable the ledc_ch5_duty_chng_end event.\\0: Disable\\1: Enable
        EVT_DUTY_CHNG_END_CH5_EN: u1,
        /// Configures whether or not to enable the ledc_ch6_duty_chng_end event.\\0: Disable\\1: Enable
        EVT_DUTY_CHNG_END_CH6_EN: u1,
        /// Configures whether or not to enable the ledc_ch7_duty_chng_end event.\\0: Disable\\1: Enable
        EVT_DUTY_CHNG_END_CH7_EN: u1,
        /// Configures whether or not to enable the ledc_ch0_ovf_cnt_pls event.\\0: Disable\\1: Enable
        EVT_OVF_CNT_PLS_CH0_EN: u1,
        /// Configures whether or not to enable the ledc_ch1_ovf_cnt_pls event.\\0: Disable\\1: Enable
        EVT_OVF_CNT_PLS_CH1_EN: u1,
        /// Configures whether or not to enable the ledc_ch2_ovf_cnt_pls event.\\0: Disable\\1: Enable
        EVT_OVF_CNT_PLS_CH2_EN: u1,
        /// Configures whether or not to enable the ledc_ch3_ovf_cnt_pls event.\\0: Disable\\1: Enable
        EVT_OVF_CNT_PLS_CH3_EN: u1,
        /// Configures whether or not to enable the ledc_ch4_ovf_cnt_pls event.\\0: Disable\\1: Enable
        EVT_OVF_CNT_PLS_CH4_EN: u1,
        /// Configures whether or not to enable the ledc_ch5_ovf_cnt_pls event.\\0: Disable\\1: Enable
        EVT_OVF_CNT_PLS_CH5_EN: u1,
        /// Configures whether or not to enable the ledc_ch6_ovf_cnt_pls event.\\0: Disable\\1: Enable
        EVT_OVF_CNT_PLS_CH6_EN: u1,
        /// Configures whether or not to enable the ledc_ch7_ovf_cnt_pls event.\\0: Disable\\1: Enable
        EVT_OVF_CNT_PLS_CH7_EN: u1,
        /// Configures whether or not to enable the ledc_timer0_ovf event.\\0: Disable\\1: Enable
        EVT_TIME_OVF_TIMER0_EN: u1,
        /// Configures whether or not to enable the ledc_timer1_ovf event.\\0: Disable\\1: Enable
        EVT_TIME_OVF_TIMER1_EN: u1,
        /// Configures whether or not to enable the ledc_timer2_ovf event.\\0: Disable\\1: Enable
        EVT_TIME_OVF_TIMER2_EN: u1,
        /// Configures whether or not to enable the ledc_timer3_ovf event.\\0: Disable\\1: Enable
        EVT_TIME_OVF_TIMER3_EN: u1,
        /// Configures whether or not to enable the ledc_timer0_cmp event.\\0: Disable\\1: Enable
        EVT_TIME0_CMP_EN: u1,
        /// Configures whether or not to enable the ledc_timer1_cmp event.\\0: Disable\\1: Enable
        EVT_TIME1_CMP_EN: u1,
        /// Configures whether or not to enable the ledc_timer2_cmp event.\\0: Disable\\1: Enable
        EVT_TIME2_CMP_EN: u1,
        /// Configures whether or not to enable the ledc_timer3_cmp event.\\0: Disable\\1: Enable
        EVT_TIME3_CMP_EN: u1,
        /// Configures whether or not to enable the ledc_ch0_duty_scale_update task.\\0: Disable\\1: Enable
        TASK_DUTY_SCALE_UPDATE_CH0_EN: u1,
        /// Configures whether or not to enable the ledc_ch1_duty_scale_update task.\\0: Disable\\1: Enable
        TASK_DUTY_SCALE_UPDATE_CH1_EN: u1,
        /// Configures whether or not to enable the ledc_ch2_duty_scale_update task.\\0: Disable\\1: Enable
        TASK_DUTY_SCALE_UPDATE_CH2_EN: u1,
        /// Configures whether or not to enable the ledc_ch3_duty_scale_update task.\\0: Disable\\1: Enable
        TASK_DUTY_SCALE_UPDATE_CH3_EN: u1,
        /// Configures whether or not to enable the ledc_ch4_duty_scale_update task.\\0: Disable\\1: Enable
        TASK_DUTY_SCALE_UPDATE_CH4_EN: u1,
        /// Configures whether or not to enable the ledc_ch5_duty_scale_update task.\\0: Disable\\1: Enable
        TASK_DUTY_SCALE_UPDATE_CH5_EN: u1,
        /// Configures whether or not to enable the ledc_ch6_duty_scale_update task.\\0: Disable\\1: Enable
        TASK_DUTY_SCALE_UPDATE_CH6_EN: u1,
        /// Configures whether or not to enable the ledc_ch7_duty_scale_update task.\\0: Disable\\1: Enable
        TASK_DUTY_SCALE_UPDATE_CH7_EN: u1,
    }),
    /// Ledc event task enable bit register1.
    /// offset: 0x124
    EVT_TASK_EN1: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable ledc_timer0_res_update task.\\0: Disable\\1: Enable
        TASK_TIMER0_RES_UPDATE_EN: u1,
        /// Configures whether or not to enable ledc_timer1_res_update task.\\0: Disable\\1: Enable
        TASK_TIMER1_RES_UPDATE_EN: u1,
        /// Configures whether or not to enable ledc_timer2_res_update task.\\0: Disable\\1: Enable
        TASK_TIMER2_RES_UPDATE_EN: u1,
        /// Configures whether or not to enable ledc_timer3_res_update task.\\0: Disable\\1: Enable
        TASK_TIMER3_RES_UPDATE_EN: u1,
        /// Configures whether or not to enable ledc_timer0_cap task.\\0: Disable\\1: Enable
        TASK_TIMER0_CAP_EN: u1,
        /// Configures whether or not to enable ledc_timer1_cap task.\\0: Disable\\1: Enable
        TASK_TIMER1_CAP_EN: u1,
        /// Configures whether or not to enable ledc_timer2_cap task.\\0: Disable\\1: Enable
        TASK_TIMER2_CAP_EN: u1,
        /// Configures whether or not to enable ledc_timer3_cap task.\\0: Disable\\1: Enable
        TASK_TIMER3_CAP_EN: u1,
        /// Configures whether or not to enable ledc_ch0_sig_out_dis task.\\0: Disable\\1: Enable
        TASK_SIG_OUT_DIS_CH0_EN: u1,
        /// Configures whether or not to enable ledc_ch1_sig_out_dis task.\\0: Disable\\1: Enable
        TASK_SIG_OUT_DIS_CH1_EN: u1,
        /// Configures whether or not to enable ledc_ch2_sig_out_dis task.\\0: Disable\\1: Enable
        TASK_SIG_OUT_DIS_CH2_EN: u1,
        /// Configures whether or not to enable ledc_ch3_sig_out_dis task.\\0: Disable\\1: Enable
        TASK_SIG_OUT_DIS_CH3_EN: u1,
        /// Configures whether or not to enable ledc_ch4_sig_out_dis task.\\0: Disable\\1: Enable
        TASK_SIG_OUT_DIS_CH4_EN: u1,
        /// Configures whether or not to enable ledc_ch5_sig_out_dis task.\\0: Disable\\1: Enable
        TASK_SIG_OUT_DIS_CH5_EN: u1,
        /// Configures whether or not to enable ledc_ch6_sig_out_dis task.\\0: Disable\\1: Enable
        TASK_SIG_OUT_DIS_CH6_EN: u1,
        /// Configures whether or not to enable ledc_ch7_sig_out_dis task.\\0: Disable\\1: Enable
        TASK_SIG_OUT_DIS_CH7_EN: u1,
        /// Configures whether or not to enable ledc_ch0_ovf_cnt_rst task.\\0: Disable\\1: Enable
        TASK_OVF_CNT_RST_CH0_EN: u1,
        /// Configures whether or not to enable ledc_ch1_ovf_cnt_rst task.\\0: Disable\\1: Enable
        TASK_OVF_CNT_RST_CH1_EN: u1,
        /// Configures whether or not to enable ledc_ch2_ovf_cnt_rst task.\\0: Disable\\1: Enable
        TASK_OVF_CNT_RST_CH2_EN: u1,
        /// Configures whether or not to enable ledc_ch3_ovf_cnt_rst task.\\0: Disable\\1: Enable
        TASK_OVF_CNT_RST_CH3_EN: u1,
        /// Configures whether or not to enable ledc_ch4_ovf_cnt_rst task.\\0: Disable\\1: Enable
        TASK_OVF_CNT_RST_CH4_EN: u1,
        /// Configures whether or not to enable ledc_ch5_ovf_cnt_rst task.\\0: Disable\\1: Enable
        TASK_OVF_CNT_RST_CH5_EN: u1,
        /// Configures whether or not to enable ledc_ch6_ovf_cnt_rst task.\\0: Disable\\1: Enable
        TASK_OVF_CNT_RST_CH6_EN: u1,
        /// Configures whether or not to enable ledc_ch7_ovf_cnt_rst task.\\0: Disable\\1: Enable
        TASK_OVF_CNT_RST_CH7_EN: u1,
        /// Configures whether or not to enable ledc_timer0_rst task.\\0: Disable\\1: Enable
        TASK_TIMER0_RST_EN: u1,
        /// Configures whether or not to enable ledc_timer1_rst task.\\0: Disable\\1: Enable
        TASK_TIMER1_RST_EN: u1,
        /// Configures whether or not to enable ledc_timer2_rst task.\\0: Disable\\1: Enable
        TASK_TIMER2_RST_EN: u1,
        /// Configures whether or not to enable ledc_timer3_rst task.\\0: Disable\\1: Enable
        TASK_TIMER3_RST_EN: u1,
        /// Configures whether or not to enable ledc_timer0_pause_resume task.\\0: Disable\\1: Enable
        TASK_TIMER0_PAUSE_RESUME_EN: u1,
        /// Configures whether or not to enable ledc_timer1_pause_resume task.\\0: Disable\\1: Enable
        TASK_TIMER1_PAUSE_RESUME_EN: u1,
        /// Configures whether or not to enable ledc_timer2_pause_resume task.\\0: Disable\\1: Enable
        TASK_TIMER2_PAUSE_RESUME_EN: u1,
        /// Configures whether or not to enable ledc_timer3_pause_resume task.\\0: Disable\\1: Enable
        TASK_TIMER3_PAUSE_RESUME_EN: u1,
    }),
    /// Ledc event task enable bit register2.
    /// offset: 0x128
    EVT_TASK_EN2: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable ledc_ch0_gamma_restart task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESTART_CH0_EN: u1,
        /// Configures whether or not to enable ledc_ch1_gamma_restart task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESTART_CH1_EN: u1,
        /// Configures whether or not to enable ledc_ch2_gamma_restart task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESTART_CH2_EN: u1,
        /// Configures whether or not to enable ledc_ch3_gamma_restart task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESTART_CH3_EN: u1,
        /// Configures whether or not to enable ledc_ch4_gamma_restart task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESTART_CH4_EN: u1,
        /// Configures whether or not to enable ledc_ch5_gamma_restart task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESTART_CH5_EN: u1,
        /// Configures whether or not to enable ledc_ch6_gamma_restart task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESTART_CH6_EN: u1,
        /// Configures whether or not to enable ledc_ch7_gamma_restart task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESTART_CH7_EN: u1,
        /// Configures whether or not to enable ledc_ch0_gamma_pause task.\\0: Disable\\1: Enable
        TASK_GAMMA_PAUSE_CH0_EN: u1,
        /// Configures whether or not to enable ledc_ch1_gamma_pause task.\\0: Disable\\1: Enable
        TASK_GAMMA_PAUSE_CH1_EN: u1,
        /// Configures whether or not to enable ledc_ch2_gamma_pause task.\\0: Disable\\1: Enable
        TASK_GAMMA_PAUSE_CH2_EN: u1,
        /// Configures whether or not to enable ledc_ch3_gamma_pause task.\\0: Disable\\1: Enable
        TASK_GAMMA_PAUSE_CH3_EN: u1,
        /// Configures whether or not to enable ledc_ch4_gamma_pause task.\\0: Disable\\1: Enable
        TASK_GAMMA_PAUSE_CH4_EN: u1,
        /// Configures whether or not to enable ledc_ch5_gamma_pause task.\\0: Disable\\1: Enable
        TASK_GAMMA_PAUSE_CH5_EN: u1,
        /// Configures whether or not to enable ledc_ch6_gamma_pause task.\\0: Disable\\1: Enable
        TASK_GAMMA_PAUSE_CH6_EN: u1,
        /// Configures whether or not to enable ledc_ch7_gamma_pause task.\\0: Disable\\1: Enable
        TASK_GAMMA_PAUSE_CH7_EN: u1,
        /// Configures whether or not to enable ledc_ch0_gamma_resume task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESUME_CH0_EN: u1,
        /// Configures whether or not to enable ledc_ch1_gamma_resume task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESUME_CH1_EN: u1,
        /// Configures whether or not to enable ledc_ch2_gamma_resume task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESUME_CH2_EN: u1,
        /// Configures whether or not to enable ledc_ch3_gamma_resume task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESUME_CH3_EN: u1,
        /// Configures whether or not to enable ledc_ch4_gamma_resume task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESUME_CH4_EN: u1,
        /// Configures whether or not to enable ledc_ch5_gamma_resume task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESUME_CH5_EN: u1,
        /// Configures whether or not to enable ledc_ch6_gamma_resume task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESUME_CH6_EN: u1,
        /// Configures whether or not to enable ledc_ch7_gamma_resume task.\\0: Disable\\1: Enable
        TASK_GAMMA_RESUME_CH7_EN: u1,
        padding: u8 = 0,
    }),
    /// offset: 0x12c
    reserved300: [20]u8,
    /// Ledc timer%s compare value register.
    /// offset: 0x140
    TIMER0_CMP: mmio.Mmio(packed struct(u32) {
        /// Configures the comparison value for LEDC timer%s.
        TIMER_CMP: u20,
        padding: u12 = 0,
    }),
    /// Ledc timer%s compare value register.
    /// offset: 0x144
    TIMER1_CMP: mmio.Mmio(packed struct(u32) {
        /// Configures the comparison value for LEDC timer%s.
        TIMER_CMP: u20,
        padding: u12 = 0,
    }),
    /// Ledc timer%s compare value register.
    /// offset: 0x148
    TIMER2_CMP: mmio.Mmio(packed struct(u32) {
        /// Configures the comparison value for LEDC timer%s.
        TIMER_CMP: u20,
        padding: u12 = 0,
    }),
    /// Ledc timer%s compare value register.
    /// offset: 0x14c
    TIMER3_CMP: mmio.Mmio(packed struct(u32) {
        /// Configures the comparison value for LEDC timer%s.
        TIMER_CMP: u20,
        padding: u12 = 0,
    }),
    /// Ledc timer%s captured count value register.
    /// offset: 0x150
    TIMER0_CNT_CAP: mmio.Mmio(packed struct(u32) {
        /// Represents the captured LEDC timer%s count value.
        TIMER_CNT_CAP: u20,
        padding: u12 = 0,
    }),
    /// Ledc timer%s captured count value register.
    /// offset: 0x154
    TIMER1_CNT_CAP: mmio.Mmio(packed struct(u32) {
        /// Represents the captured LEDC timer%s count value.
        TIMER_CNT_CAP: u20,
        padding: u12 = 0,
    }),
    /// Ledc timer%s captured count value register.
    /// offset: 0x158
    TIMER2_CNT_CAP: mmio.Mmio(packed struct(u32) {
        /// Represents the captured LEDC timer%s count value.
        TIMER_CNT_CAP: u20,
        padding: u12 = 0,
    }),
    /// Ledc timer%s captured count value register.
    /// offset: 0x15c
    TIMER3_CNT_CAP: mmio.Mmio(packed struct(u32) {
        /// Represents the captured LEDC timer%s count value.
        TIMER_CNT_CAP: u20,
        padding: u12 = 0,
    }),
    /// offset: 0x160
    reserved352: [16]u8,
    /// LEDC global configuration register
    /// offset: 0x170
    CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the clock source for the four timers.\\0: APB_CLK\\1: RC_FAST_CLK\\2: XTAL_CLK\\3: Invalid. No clock
        APB_CLK_SEL: u2,
        /// Configures whether or not to open LEDC ch0 gamma ram clock gate.\\0: Open the clock gate only when application writes or reads LEDC ch0 gamma ram\\1: Force open the clock gate for LEDC ch0 gamma ram
        GAMMA_RAM_CLK_EN_CH0: u1,
        /// Configures whether or not to open LEDC ch1 gamma ram clock gate.\\0: Open the clock gate only when application writes or reads LEDC ch1 gamma ram\\1: Force open the clock gate for LEDC ch1 gamma ram
        GAMMA_RAM_CLK_EN_CH1: u1,
        /// Configures whether or not to open LEDC ch2 gamma ram clock gate.\\0: Open the clock gate only when application writes or reads LEDC ch2 gamma ram\\1: Force open the clock gate for LEDC ch2 gamma ram
        GAMMA_RAM_CLK_EN_CH2: u1,
        /// Configures whether or not to open LEDC ch3 gamma ram clock gate.\\0: Open the clock gate only when application writes or reads LEDC ch3 gamma ram\\1: Force open the clock gate for LEDC ch3 gamma ram
        GAMMA_RAM_CLK_EN_CH3: u1,
        /// Configures whether or not to open LEDC ch4 gamma ram clock gate.\\0: Open the clock gate only when application writes or reads LEDC ch4 gamma ram\\1: Force open the clock gate for LEDC ch4 gamma ram
        GAMMA_RAM_CLK_EN_CH4: u1,
        /// Configures whether or not to open LEDC ch5 gamma ram clock gate.\\0: Open the clock gate only when application writes or reads LEDC ch5 gamma ram\\1: Force open the clock gate for LEDC ch5 gamma ram
        GAMMA_RAM_CLK_EN_CH5: u1,
        /// Configures whether or not to open LEDC ch6 gamma ram clock gate.\\0: Open the clock gate only when application writes or reads LEDC ch6 gamma ram\\1: Force open the clock gate for LEDC ch6 gamma ram
        GAMMA_RAM_CLK_EN_CH6: u1,
        /// Configures whether or not to open LEDC ch7 gamma ram clock gate.\\0: Open the clock gate only when application writes or reads LEDC ch7 gamma ram\\1: Force open the clock gate for LEDC ch7 gamma ram
        GAMMA_RAM_CLK_EN_CH7: u1,
        reserved31: u21 = 0,
        /// Configures whether or not to open register clock gate.\\0: Open the clock gate only when application writes registers\\1: Force open the clock gate for register
        CLK_EN: u1,
    }),
    /// Version control register
    /// offset: 0x174
    DATE: mmio.Mmio(packed struct(u32) {
        /// Configures the version.
        LEDC_DATE: u28,
        padding: u4 = 0,
    }),
};
