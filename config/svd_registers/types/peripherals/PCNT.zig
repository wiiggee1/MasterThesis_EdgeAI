const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Pulse Count Controller
pub const PCNT = extern struct {
    /// Configuration register 0 for unit %s
    /// offset: 0x00
    U0_CONF0: mmio.Mmio(packed struct(u32) {
        /// This sets the maximum threshold, in APB_CLK cycles, for the filter. Any pulses with width less than this will be ignored when the filter is enabled.
        FILTER_THRES_U: u10,
        /// This is the enable bit for unit %s's input filter.
        FILTER_EN_U: u1,
        /// This is the enable bit for unit %s's zero comparator.
        THR_ZERO_EN_U: u1,
        /// This is the enable bit for unit %s's thr_h_lim comparator. Configures it to enable the high limit interrupt.
        THR_H_LIM_EN_U: u1,
        /// This is the enable bit for unit %s's thr_l_lim comparator. Configures it to enable the low limit interrupt.
        THR_L_LIM_EN_U: u1,
        /// This is the enable bit for unit %s's thres0 comparator.
        THR_THRES0_EN_U: u1,
        /// This is the enable bit for unit %s's thres1 comparator.
        THR_THRES1_EN_U: u1,
        /// This register sets the behavior when the signal input of channel 0 detects a negative edge. 1: Increase the counter.2: Decrease the counter.0, 3: No effect on counter
        CH0_NEG_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 0 detects a positive edge. 1: Increase the counter.2: Decrease the counter.0, 3: No effect on counter
        CH0_POS_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is high. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH0_HCTRL_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is low. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH0_LCTRL_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 1 detects a negative edge. 1: Increment the counter.2: Decrement the counter.0, 3: No effect on counter
        CH1_NEG_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 1 detects a positive edge. 1: Increment the counter.2: Decrement the counter.0, 3: No effect on counter
        CH1_POS_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is high. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH1_HCTRL_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is low. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH1_LCTRL_MODE_U: u2,
    }),
    /// Configuration register 1 for unit %s
    /// offset: 0x04
    U0_CONF1: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the thres0 value for unit %s.
        CNT_THRES0_U: u16,
        /// This register is used to configure the thres1 value for unit %s.
        CNT_THRES1_U: u16,
    }),
    /// Configuration register 2 for unit %s
    /// offset: 0x08
    U0_CONF2: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the thr_h_lim value for unit %s. When pcnt reaches this value, the counter will be cleared to 0.
        CNT_H_LIM_U: u16,
        /// This register is used to configure the thr_l_lim value for unit %s. When pcnt reaches this value, the counter will be cleared to 0.
        CNT_L_LIM_U: u16,
    }),
    /// Configuration register 0 for unit %s
    /// offset: 0x0c
    U1_CONF0: mmio.Mmio(packed struct(u32) {
        /// This sets the maximum threshold, in APB_CLK cycles, for the filter. Any pulses with width less than this will be ignored when the filter is enabled.
        FILTER_THRES_U: u10,
        /// This is the enable bit for unit %s's input filter.
        FILTER_EN_U: u1,
        /// This is the enable bit for unit %s's zero comparator.
        THR_ZERO_EN_U: u1,
        /// This is the enable bit for unit %s's thr_h_lim comparator. Configures it to enable the high limit interrupt.
        THR_H_LIM_EN_U: u1,
        /// This is the enable bit for unit %s's thr_l_lim comparator. Configures it to enable the low limit interrupt.
        THR_L_LIM_EN_U: u1,
        /// This is the enable bit for unit %s's thres0 comparator.
        THR_THRES0_EN_U: u1,
        /// This is the enable bit for unit %s's thres1 comparator.
        THR_THRES1_EN_U: u1,
        /// This register sets the behavior when the signal input of channel 0 detects a negative edge. 1: Increase the counter.2: Decrease the counter.0, 3: No effect on counter
        CH0_NEG_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 0 detects a positive edge. 1: Increase the counter.2: Decrease the counter.0, 3: No effect on counter
        CH0_POS_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is high. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH0_HCTRL_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is low. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH0_LCTRL_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 1 detects a negative edge. 1: Increment the counter.2: Decrement the counter.0, 3: No effect on counter
        CH1_NEG_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 1 detects a positive edge. 1: Increment the counter.2: Decrement the counter.0, 3: No effect on counter
        CH1_POS_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is high. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH1_HCTRL_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is low. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH1_LCTRL_MODE_U: u2,
    }),
    /// Configuration register 1 for unit %s
    /// offset: 0x10
    U1_CONF1: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the thres0 value for unit %s.
        CNT_THRES0_U: u16,
        /// This register is used to configure the thres1 value for unit %s.
        CNT_THRES1_U: u16,
    }),
    /// Configuration register 2 for unit %s
    /// offset: 0x14
    U1_CONF2: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the thr_h_lim value for unit %s. When pcnt reaches this value, the counter will be cleared to 0.
        CNT_H_LIM_U: u16,
        /// This register is used to configure the thr_l_lim value for unit %s. When pcnt reaches this value, the counter will be cleared to 0.
        CNT_L_LIM_U: u16,
    }),
    /// Configuration register 0 for unit %s
    /// offset: 0x18
    U2_CONF0: mmio.Mmio(packed struct(u32) {
        /// This sets the maximum threshold, in APB_CLK cycles, for the filter. Any pulses with width less than this will be ignored when the filter is enabled.
        FILTER_THRES_U: u10,
        /// This is the enable bit for unit %s's input filter.
        FILTER_EN_U: u1,
        /// This is the enable bit for unit %s's zero comparator.
        THR_ZERO_EN_U: u1,
        /// This is the enable bit for unit %s's thr_h_lim comparator. Configures it to enable the high limit interrupt.
        THR_H_LIM_EN_U: u1,
        /// This is the enable bit for unit %s's thr_l_lim comparator. Configures it to enable the low limit interrupt.
        THR_L_LIM_EN_U: u1,
        /// This is the enable bit for unit %s's thres0 comparator.
        THR_THRES0_EN_U: u1,
        /// This is the enable bit for unit %s's thres1 comparator.
        THR_THRES1_EN_U: u1,
        /// This register sets the behavior when the signal input of channel 0 detects a negative edge. 1: Increase the counter.2: Decrease the counter.0, 3: No effect on counter
        CH0_NEG_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 0 detects a positive edge. 1: Increase the counter.2: Decrease the counter.0, 3: No effect on counter
        CH0_POS_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is high. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH0_HCTRL_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is low. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH0_LCTRL_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 1 detects a negative edge. 1: Increment the counter.2: Decrement the counter.0, 3: No effect on counter
        CH1_NEG_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 1 detects a positive edge. 1: Increment the counter.2: Decrement the counter.0, 3: No effect on counter
        CH1_POS_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is high. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH1_HCTRL_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is low. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH1_LCTRL_MODE_U: u2,
    }),
    /// Configuration register 1 for unit %s
    /// offset: 0x1c
    U2_CONF1: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the thres0 value for unit %s.
        CNT_THRES0_U: u16,
        /// This register is used to configure the thres1 value for unit %s.
        CNT_THRES1_U: u16,
    }),
    /// Configuration register 2 for unit %s
    /// offset: 0x20
    U2_CONF2: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the thr_h_lim value for unit %s. When pcnt reaches this value, the counter will be cleared to 0.
        CNT_H_LIM_U: u16,
        /// This register is used to configure the thr_l_lim value for unit %s. When pcnt reaches this value, the counter will be cleared to 0.
        CNT_L_LIM_U: u16,
    }),
    /// Configuration register 0 for unit %s
    /// offset: 0x24
    U3_CONF0: mmio.Mmio(packed struct(u32) {
        /// This sets the maximum threshold, in APB_CLK cycles, for the filter. Any pulses with width less than this will be ignored when the filter is enabled.
        FILTER_THRES_U: u10,
        /// This is the enable bit for unit %s's input filter.
        FILTER_EN_U: u1,
        /// This is the enable bit for unit %s's zero comparator.
        THR_ZERO_EN_U: u1,
        /// This is the enable bit for unit %s's thr_h_lim comparator. Configures it to enable the high limit interrupt.
        THR_H_LIM_EN_U: u1,
        /// This is the enable bit for unit %s's thr_l_lim comparator. Configures it to enable the low limit interrupt.
        THR_L_LIM_EN_U: u1,
        /// This is the enable bit for unit %s's thres0 comparator.
        THR_THRES0_EN_U: u1,
        /// This is the enable bit for unit %s's thres1 comparator.
        THR_THRES1_EN_U: u1,
        /// This register sets the behavior when the signal input of channel 0 detects a negative edge. 1: Increase the counter.2: Decrease the counter.0, 3: No effect on counter
        CH0_NEG_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 0 detects a positive edge. 1: Increase the counter.2: Decrease the counter.0, 3: No effect on counter
        CH0_POS_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is high. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH0_HCTRL_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is low. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH0_LCTRL_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 1 detects a negative edge. 1: Increment the counter.2: Decrement the counter.0, 3: No effect on counter
        CH1_NEG_MODE_U: u2,
        /// This register sets the behavior when the signal input of channel 1 detects a positive edge. 1: Increment the counter.2: Decrement the counter.0, 3: No effect on counter
        CH1_POS_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is high. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH1_HCTRL_MODE_U: u2,
        /// This register configures how the CH%s_POS_MODE/CH%s_NEG_MODE settings will be modified when the control signal is low. 0: No modification.1: Invert behavior (increase -> decrease, decrease -> increase).2, 3: Inhibit counter modification
        CH1_LCTRL_MODE_U: u2,
    }),
    /// Configuration register 1 for unit %s
    /// offset: 0x28
    U3_CONF1: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the thres0 value for unit %s.
        CNT_THRES0_U: u16,
        /// This register is used to configure the thres1 value for unit %s.
        CNT_THRES1_U: u16,
    }),
    /// Configuration register 2 for unit %s
    /// offset: 0x2c
    U3_CONF2: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the thr_h_lim value for unit %s. When pcnt reaches this value, the counter will be cleared to 0.
        CNT_H_LIM_U: u16,
        /// This register is used to configure the thr_l_lim value for unit %s. When pcnt reaches this value, the counter will be cleared to 0.
        CNT_L_LIM_U: u16,
    }),
    /// Counter value for unit %s
    /// offset: 0x30
    U0_CNT: mmio.Mmio(packed struct(u32) {
        /// This register stores the current pulse count value for unit %s.
        PULSE_CNT_U: u16,
        padding: u16 = 0,
    }),
    /// Counter value for unit %s
    /// offset: 0x34
    U1_CNT: mmio.Mmio(packed struct(u32) {
        /// This register stores the current pulse count value for unit %s.
        PULSE_CNT_U: u16,
        padding: u16 = 0,
    }),
    /// Counter value for unit %s
    /// offset: 0x38
    U2_CNT: mmio.Mmio(packed struct(u32) {
        /// This register stores the current pulse count value for unit %s.
        PULSE_CNT_U: u16,
        padding: u16 = 0,
    }),
    /// Counter value for unit %s
    /// offset: 0x3c
    U3_CNT: mmio.Mmio(packed struct(u32) {
        /// This register stores the current pulse count value for unit %s.
        PULSE_CNT_U: u16,
        padding: u16 = 0,
    }),
    /// Interrupt raw status register
    /// offset: 0x40
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the PCNT_CNT_THR_EVENT_U0_INT interrupt.
        CNT_THR_EVENT_U0_INT_RAW: u1,
        /// The raw interrupt status bit for the PCNT_CNT_THR_EVENT_U1_INT interrupt.
        CNT_THR_EVENT_U1_INT_RAW: u1,
        /// The raw interrupt status bit for the PCNT_CNT_THR_EVENT_U2_INT interrupt.
        CNT_THR_EVENT_U2_INT_RAW: u1,
        /// The raw interrupt status bit for the PCNT_CNT_THR_EVENT_U3_INT interrupt.
        CNT_THR_EVENT_U3_INT_RAW: u1,
        padding: u28 = 0,
    }),
    /// Interrupt status register
    /// offset: 0x44
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// The masked interrupt status bit for the PCNT_CNT_THR_EVENT_U0_INT interrupt.
        CNT_THR_EVENT_U0_INT_ST: u1,
        /// The masked interrupt status bit for the PCNT_CNT_THR_EVENT_U1_INT interrupt.
        CNT_THR_EVENT_U1_INT_ST: u1,
        /// The masked interrupt status bit for the PCNT_CNT_THR_EVENT_U2_INT interrupt.
        CNT_THR_EVENT_U2_INT_ST: u1,
        /// The masked interrupt status bit for the PCNT_CNT_THR_EVENT_U3_INT interrupt.
        CNT_THR_EVENT_U3_INT_ST: u1,
        padding: u28 = 0,
    }),
    /// Interrupt enable register
    /// offset: 0x48
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the PCNT_CNT_THR_EVENT_U0_INT interrupt.
        CNT_THR_EVENT_U0_INT_ENA: u1,
        /// The interrupt enable bit for the PCNT_CNT_THR_EVENT_U1_INT interrupt.
        CNT_THR_EVENT_U1_INT_ENA: u1,
        /// The interrupt enable bit for the PCNT_CNT_THR_EVENT_U2_INT interrupt.
        CNT_THR_EVENT_U2_INT_ENA: u1,
        /// The interrupt enable bit for the PCNT_CNT_THR_EVENT_U3_INT interrupt.
        CNT_THR_EVENT_U3_INT_ENA: u1,
        padding: u28 = 0,
    }),
    /// Interrupt clear register
    /// offset: 0x4c
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the PCNT_CNT_THR_EVENT_U0_INT interrupt.
        CNT_THR_EVENT_U0_INT_CLR: u1,
        /// Set this bit to clear the PCNT_CNT_THR_EVENT_U1_INT interrupt.
        CNT_THR_EVENT_U1_INT_CLR: u1,
        /// Set this bit to clear the PCNT_CNT_THR_EVENT_U2_INT interrupt.
        CNT_THR_EVENT_U2_INT_CLR: u1,
        /// Set this bit to clear the PCNT_CNT_THR_EVENT_U3_INT interrupt.
        CNT_THR_EVENT_U3_INT_CLR: u1,
        padding: u28 = 0,
    }),
    /// PNCT UNIT%s status register
    /// offset: 0x50
    U0_STATUS: mmio.Mmio(packed struct(u32) {
        /// The pulse counter status of PCNT_U%s corresponding to 0. 0: pulse counter decreases from positive to 0. 1: pulse counter increases from negative to 0. 2: pulse counter is negative. 3: pulse counter is positive.
        CNT_THR_ZERO_MODE_U: u2,
        /// The latched value of thres1 event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thres1 and thres1 event is valid. 0: others
        CNT_THR_THRES1_LAT_U: u1,
        /// The latched value of thres0 event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thres0 and thres0 event is valid. 0: others
        CNT_THR_THRES0_LAT_U: u1,
        /// The latched value of low limit event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thr_l_lim and low limit event is valid. 0: others
        CNT_THR_L_LIM_LAT_U: u1,
        /// The latched value of high limit event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thr_h_lim and high limit event is valid. 0: others
        CNT_THR_H_LIM_LAT_U: u1,
        /// The latched value of zero threshold event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to 0 and zero threshold event is valid. 0: others
        CNT_THR_ZERO_LAT_U: u1,
        padding: u25 = 0,
    }),
    /// PNCT UNIT%s status register
    /// offset: 0x54
    U1_STATUS: mmio.Mmio(packed struct(u32) {
        /// The pulse counter status of PCNT_U%s corresponding to 0. 0: pulse counter decreases from positive to 0. 1: pulse counter increases from negative to 0. 2: pulse counter is negative. 3: pulse counter is positive.
        CNT_THR_ZERO_MODE_U: u2,
        /// The latched value of thres1 event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thres1 and thres1 event is valid. 0: others
        CNT_THR_THRES1_LAT_U: u1,
        /// The latched value of thres0 event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thres0 and thres0 event is valid. 0: others
        CNT_THR_THRES0_LAT_U: u1,
        /// The latched value of low limit event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thr_l_lim and low limit event is valid. 0: others
        CNT_THR_L_LIM_LAT_U: u1,
        /// The latched value of high limit event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thr_h_lim and high limit event is valid. 0: others
        CNT_THR_H_LIM_LAT_U: u1,
        /// The latched value of zero threshold event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to 0 and zero threshold event is valid. 0: others
        CNT_THR_ZERO_LAT_U: u1,
        padding: u25 = 0,
    }),
    /// PNCT UNIT%s status register
    /// offset: 0x58
    U2_STATUS: mmio.Mmio(packed struct(u32) {
        /// The pulse counter status of PCNT_U%s corresponding to 0. 0: pulse counter decreases from positive to 0. 1: pulse counter increases from negative to 0. 2: pulse counter is negative. 3: pulse counter is positive.
        CNT_THR_ZERO_MODE_U: u2,
        /// The latched value of thres1 event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thres1 and thres1 event is valid. 0: others
        CNT_THR_THRES1_LAT_U: u1,
        /// The latched value of thres0 event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thres0 and thres0 event is valid. 0: others
        CNT_THR_THRES0_LAT_U: u1,
        /// The latched value of low limit event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thr_l_lim and low limit event is valid. 0: others
        CNT_THR_L_LIM_LAT_U: u1,
        /// The latched value of high limit event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thr_h_lim and high limit event is valid. 0: others
        CNT_THR_H_LIM_LAT_U: u1,
        /// The latched value of zero threshold event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to 0 and zero threshold event is valid. 0: others
        CNT_THR_ZERO_LAT_U: u1,
        padding: u25 = 0,
    }),
    /// PNCT UNIT%s status register
    /// offset: 0x5c
    U3_STATUS: mmio.Mmio(packed struct(u32) {
        /// The pulse counter status of PCNT_U%s corresponding to 0. 0: pulse counter decreases from positive to 0. 1: pulse counter increases from negative to 0. 2: pulse counter is negative. 3: pulse counter is positive.
        CNT_THR_ZERO_MODE_U: u2,
        /// The latched value of thres1 event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thres1 and thres1 event is valid. 0: others
        CNT_THR_THRES1_LAT_U: u1,
        /// The latched value of thres0 event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thres0 and thres0 event is valid. 0: others
        CNT_THR_THRES0_LAT_U: u1,
        /// The latched value of low limit event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thr_l_lim and low limit event is valid. 0: others
        CNT_THR_L_LIM_LAT_U: u1,
        /// The latched value of high limit event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to thr_h_lim and high limit event is valid. 0: others
        CNT_THR_H_LIM_LAT_U: u1,
        /// The latched value of zero threshold event of PCNT_U%s when threshold event interrupt is valid. 1: the current pulse counter equals to 0 and zero threshold event is valid. 0: others
        CNT_THR_ZERO_LAT_U: u1,
        padding: u25 = 0,
    }),
    /// Control register for all counters
    /// offset: 0x60
    CTRL: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear unit 0's counter.
        PULSE_CNT_RST_U0: u1,
        /// Set this bit to freeze unit 0's counter.
        CNT_PAUSE_U0: u1,
        /// Set this bit to clear unit 1's counter.
        PULSE_CNT_RST_U1: u1,
        /// Set this bit to freeze unit 1's counter.
        CNT_PAUSE_U1: u1,
        /// Set this bit to clear unit 2's counter.
        PULSE_CNT_RST_U2: u1,
        /// Set this bit to freeze unit 2's counter.
        CNT_PAUSE_U2: u1,
        /// Set this bit to clear unit 3's counter.
        PULSE_CNT_RST_U3: u1,
        /// Set this bit to freeze unit 3's counter.
        CNT_PAUSE_U3: u1,
        /// Configures this bit to enable unit 0's step comparator.
        DALTA_CHANGE_EN_U0: u1,
        /// Configures this bit to enable unit 1's step comparator.
        DALTA_CHANGE_EN_U1: u1,
        /// Configures this bit to enable unit 2's step comparator.
        DALTA_CHANGE_EN_U2: u1,
        /// Configures this bit to enable unit 3's step comparator.
        DALTA_CHANGE_EN_U3: u1,
        reserved16: u4 = 0,
        /// The registers clock gate enable signal of PCNT module. 1: the registers can be read and written by application. 0: the registers can not be read or written by application
        CLK_EN: u1,
        padding: u15 = 0,
    }),
    /// Configuration register for unit $n's step value.
    /// offset: 0x64
    U3_CHANGE_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the step value for unit 3.
        CNT_STEP_U3: u16,
        /// Configures the step limit value for unit 3.
        CNT_STEP_LIM_U3: u16,
    }),
    /// Configuration register for unit $n's step value.
    /// offset: 0x68
    U2_CHANGE_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the step value for unit 2.
        CNT_STEP_U2: u16,
        /// Configures the step limit value for unit 2.
        CNT_STEP_LIM_U2: u16,
    }),
    /// Configuration register for unit $n's step value.
    /// offset: 0x6c
    U1_CHANGE_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the step value for unit 1.
        CNT_STEP_U1: u16,
        /// Configures the step limit value for unit 1.
        CNT_STEP_LIM_U1: u16,
    }),
    /// Configuration register for unit $n's step value.
    /// offset: 0x70
    U0_CHANGE_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the step value for unit 0.
        CNT_STEP_U0: u16,
        /// Configures the step limit value for unit 0.
        CNT_STEP_LIM_U0: u16,
    }),
    /// offset: 0x74
    reserved116: [136]u8,
    /// PCNT version control register
    /// offset: 0xfc
    DATE: mmio.Mmio(packed struct(u32) {
        /// This is the PCNT version control register.
        DATE: u32,
    }),
};
