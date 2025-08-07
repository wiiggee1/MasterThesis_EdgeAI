const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Event Task Matrix
pub const SOC_ETM = extern struct {
    /// Channel enable status register
    /// offset: 0x00
    CH_ENA_AD0: mmio.Mmio(packed struct(u32) {
        /// Represents ch0 enable status.\\0: Disable\\1: Enable
        CH_ENA0: u1,
        /// Represents ch1 enable status.\\0: Disable\\1: Enable
        CH_ENA1: u1,
        /// Represents ch2 enable status.\\0: Disable\\1: Enable
        CH_ENA2: u1,
        /// Represents ch3 enable status.\\0: Disable\\1: Enable
        CH_ENA3: u1,
        /// Represents ch4 enable status.\\0: Disable\\1: Enable
        CH_ENA4: u1,
        /// Represents ch5 enable status.\\0: Disable\\1: Enable
        CH_ENA5: u1,
        /// Represents ch6 enable status.\\0: Disable\\1: Enable
        CH_ENA6: u1,
        /// Represents ch7 enable status.\\0: Disable\\1: Enable
        CH_ENA7: u1,
        /// Represents ch8 enable status.\\0: Disable\\1: Enable
        CH_ENA8: u1,
        /// Represents ch9 enable status.\\0: Disable\\1: Enable
        CH_ENA9: u1,
        /// Represents ch10 enable status.\\0: Disable\\1: Enable
        CH_ENA10: u1,
        /// Represents ch11 enable status.\\0: Disable\\1: Enable
        CH_ENA11: u1,
        /// Represents ch12 enable status.\\0: Disable\\1: Enable
        CH_ENA12: u1,
        /// Represents ch13 enable status.\\0: Disable\\1: Enable
        CH_ENA13: u1,
        /// Represents ch14 enable status.\\0: Disable\\1: Enable
        CH_ENA14: u1,
        /// Represents ch15 enable status.\\0: Disable\\1: Enable
        CH_ENA15: u1,
        /// Represents ch16 enable status.\\0: Disable\\1: Enable
        CH_ENA16: u1,
        /// Represents ch17 enable status.\\0: Disable\\1: Enable
        CH_ENA17: u1,
        /// Represents ch18 enable status.\\0: Disable\\1: Enable
        CH_ENA18: u1,
        /// Represents ch19 enable status.\\0: Disable\\1: Enable
        CH_ENA19: u1,
        /// Represents ch20 enable status.\\0: Disable\\1: Enable
        CH_ENA20: u1,
        /// Represents ch21 enable status.\\0: Disable\\1: Enable
        CH_ENA21: u1,
        /// Represents ch22 enable status.\\0: Disable\\1: Enable
        CH_ENA22: u1,
        /// Represents ch23 enable status.\\0: Disable\\1: Enable
        CH_ENA23: u1,
        /// Represents ch24 enable status.\\0: Disable\\1: Enable
        CH_ENA24: u1,
        /// Represents ch25 enable status.\\0: Disable\\1: Enable
        CH_ENA25: u1,
        /// Represents ch26 enable status.\\0: Disable\\1: Enable
        CH_ENA26: u1,
        /// Represents ch27 enable status.\\0: Disable\\1: Enable
        CH_ENA27: u1,
        /// Represents ch28 enable status.\\0: Disable\\1: Enable
        CH_ENA28: u1,
        /// Represents ch29 enable status.\\0: Disable\\1: Enable
        CH_ENA29: u1,
        /// Represents ch30 enable status.\\0: Disable\\1: Enable
        CH_ENA30: u1,
        /// Represents ch31 enable status.\\0: Disable\\1: Enable
        CH_ENA31: u1,
    }),
    /// Channel enable set register
    /// offset: 0x04
    CH_ENA_AD0_SET: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable ch0.\\0: Invalid, No effect\\1: Enable
        CH_SET0: u1,
        /// Configures whether or not to enable ch1.\\0: Invalid, No effect\\1: Enable
        CH_SET1: u1,
        /// Configures whether or not to enable ch2.\\0: Invalid, No effect\\1: Enable
        CH_SET2: u1,
        /// Configures whether or not to enable ch3.\\0: Invalid, No effect\\1: Enable
        CH_SET3: u1,
        /// Configures whether or not to enable ch4.\\0: Invalid, No effect\\1: Enable
        CH_SET4: u1,
        /// Configures whether or not to enable ch5.\\0: Invalid, No effect\\1: Enable
        CH_SET5: u1,
        /// Configures whether or not to enable ch6.\\0: Invalid, No effect\\1: Enable
        CH_SET6: u1,
        /// Configures whether or not to enable ch7.\\0: Invalid, No effect\\1: Enable
        CH_SET7: u1,
        /// Configures whether or not to enable ch8.\\0: Invalid, No effect\\1: Enable
        CH_SET8: u1,
        /// Configures whether or not to enable ch9.\\0: Invalid, No effect\\1: Enable
        CH_SET9: u1,
        /// Configures whether or not to enable ch10.\\0: Invalid, No effect\\1: Enable
        CH_SET10: u1,
        /// Configures whether or not to enable ch11.\\0: Invalid, No effect\\1: Enable
        CH_SET11: u1,
        /// Configures whether or not to enable ch12.\\0: Invalid, No effect\\1: Enable
        CH_SET12: u1,
        /// Configures whether or not to enable ch13.\\0: Invalid, No effect\\1: Enable
        CH_SET13: u1,
        /// Configures whether or not to enable ch14.\\0: Invalid, No effect\\1: Enable
        CH_SET14: u1,
        /// Configures whether or not to enable ch15.\\0: Invalid, No effect\\1: Enable
        CH_SET15: u1,
        /// Configures whether or not to enable ch16.\\0: Invalid, No effect\\1: Enable
        CH_SET16: u1,
        /// Configures whether or not to enable ch17.\\0: Invalid, No effect\\1: Enable
        CH_SET17: u1,
        /// Configures whether or not to enable ch18.\\0: Invalid, No effect\\1: Enable
        CH_SET18: u1,
        /// Configures whether or not to enable ch19.\\0: Invalid, No effect\\1: Enable
        CH_SET19: u1,
        /// Configures whether or not to enable ch20.\\0: Invalid, No effect\\1: Enable
        CH_SET20: u1,
        /// Configures whether or not to enable ch21.\\0: Invalid, No effect\\1: Enable
        CH_SET21: u1,
        /// Configures whether or not to enable ch22.\\0: Invalid, No effect\\1: Enable
        CH_SET22: u1,
        /// Configures whether or not to enable ch23.\\0: Invalid, No effect\\1: Enable
        CH_SET23: u1,
        /// Configures whether or not to enable ch24.\\0: Invalid, No effect\\1: Enable
        CH_SET24: u1,
        /// Configures whether or not to enable ch25.\\0: Invalid, No effect\\1: Enable
        CH_SET25: u1,
        /// Configures whether or not to enable ch26.\\0: Invalid, No effect\\1: Enable
        CH_SET26: u1,
        /// Configures whether or not to enable ch27.\\0: Invalid, No effect\\1: Enable
        CH_SET27: u1,
        /// Configures whether or not to enable ch28.\\0: Invalid, No effect\\1: Enable
        CH_SET28: u1,
        /// Configures whether or not to enable ch29.\\0: Invalid, No effect\\1: Enable
        CH_SET29: u1,
        /// Configures whether or not to enable ch30.\\0: Invalid, No effect\\1: Enable
        CH_SET30: u1,
        /// Configures whether or not to enable ch31.\\0: Invalid, No effect\\1: Enable
        CH_SET31: u1,
    }),
    /// Channel enable clear register
    /// offset: 0x08
    CH_ENA_AD0_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear ch0 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR0: u1,
        /// Configures whether or not to clear ch1 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR1: u1,
        /// Configures whether or not to clear ch2 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR2: u1,
        /// Configures whether or not to clear ch3 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR3: u1,
        /// Configures whether or not to clear ch4 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR4: u1,
        /// Configures whether or not to clear ch5 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR5: u1,
        /// Configures whether or not to clear ch6 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR6: u1,
        /// Configures whether or not to clear ch7 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR7: u1,
        /// Configures whether or not to clear ch8 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR8: u1,
        /// Configures whether or not to clear ch9 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR9: u1,
        /// Configures whether or not to clear ch10 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR10: u1,
        /// Configures whether or not to clear ch11 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR11: u1,
        /// Configures whether or not to clear ch12 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR12: u1,
        /// Configures whether or not to clear ch13 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR13: u1,
        /// Configures whether or not to clear ch14 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR14: u1,
        /// Configures whether or not to clear ch15 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR15: u1,
        /// Configures whether or not to clear ch16 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR16: u1,
        /// Configures whether or not to clear ch17 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR17: u1,
        /// Configures whether or not to clear ch18 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR18: u1,
        /// Configures whether or not to clear ch19 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR19: u1,
        /// Configures whether or not to clear ch20 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR20: u1,
        /// Configures whether or not to clear ch21 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR21: u1,
        /// Configures whether or not to clear ch22 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR22: u1,
        /// Configures whether or not to clear ch23 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR23: u1,
        /// Configures whether or not to clear ch24 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR24: u1,
        /// Configures whether or not to clear ch25 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR25: u1,
        /// Configures whether or not to clear ch26 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR26: u1,
        /// Configures whether or not to clear ch27 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR27: u1,
        /// Configures whether or not to clear ch28 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR28: u1,
        /// Configures whether or not to clear ch29 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR29: u1,
        /// Configures whether or not to clear ch30 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR30: u1,
        /// Configures whether or not to clear ch31 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR31: u1,
    }),
    /// Channel enable status register
    /// offset: 0x0c
    CH_ENA_AD1: mmio.Mmio(packed struct(u32) {
        /// Represents ch32 enable status.\\0: Disable\\1: Enable
        CH_ENA32: u1,
        /// Represents ch33 enable status.\\0: Disable\\1: Enable
        CH_ENA33: u1,
        /// Represents ch34 enable status.\\0: Disable\\1: Enable
        CH_ENA34: u1,
        /// Represents ch35 enable status.\\0: Disable\\1: Enable
        CH_ENA35: u1,
        /// Represents ch36 enable status.\\0: Disable\\1: Enable
        CH_ENA36: u1,
        /// Represents ch37 enable status.\\0: Disable\\1: Enable
        CH_ENA37: u1,
        /// Represents ch38 enable status.\\0: Disable\\1: Enable
        CH_ENA38: u1,
        /// Represents ch39 enable status.\\0: Disable\\1: Enable
        CH_ENA39: u1,
        /// Represents ch40 enable status.\\0: Disable\\1: Enable
        CH_ENA40: u1,
        /// Represents ch41 enable status.\\0: Disable\\1: Enable
        CH_ENA41: u1,
        /// Represents ch42 enable status.\\0: Disable\\1: Enable
        CH_ENA42: u1,
        /// Represents ch43 enable status.\\0: Disable\\1: Enable
        CH_ENA43: u1,
        /// Represents ch44 enable status.\\0: Disable\\1: Enable
        CH_ENA44: u1,
        /// Represents ch45 enable status.\\0: Disable\\1: Enable
        CH_ENA45: u1,
        /// Represents ch46 enable status.\\0: Disable\\1: Enable
        CH_ENA46: u1,
        /// Represents ch47 enable status.\\0: Disable\\1: Enable
        CH_ENA47: u1,
        /// Represents ch48 enable status.\\0: Disable\\1: Enable
        CH_ENA48: u1,
        /// Represents ch49 enable status.\\0: Disable\\1: Enable
        CH_ENA49: u1,
        padding: u14 = 0,
    }),
    /// Channel enable set register
    /// offset: 0x10
    CH_ENA_AD1_SET: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable ch32.\\0: Invalid, No effect\\1: Enable
        CH_SET32: u1,
        /// Configures whether or not to enable ch33.\\0: Invalid, No effect\\1: Enable
        CH_SET33: u1,
        /// Configures whether or not to enable ch34.\\0: Invalid, No effect\\1: Enable
        CH_SET34: u1,
        /// Configures whether or not to enable ch35.\\0: Invalid, No effect\\1: Enable
        CH_SET35: u1,
        /// Configures whether or not to enable ch36.\\0: Invalid, No effect\\1: Enable
        CH_SET36: u1,
        /// Configures whether or not to enable ch37.\\0: Invalid, No effect\\1: Enable
        CH_SET37: u1,
        /// Configures whether or not to enable ch38.\\0: Invalid, No effect\\1: Enable
        CH_SET38: u1,
        /// Configures whether or not to enable ch39.\\0: Invalid, No effect\\1: Enable
        CH_SET39: u1,
        /// Configures whether or not to enable ch40.\\0: Invalid, No effect\\1: Enable
        CH_SET40: u1,
        /// Configures whether or not to enable ch41.\\0: Invalid, No effect\\1: Enable
        CH_SET41: u1,
        /// Configures whether or not to enable ch42.\\0: Invalid, No effect\\1: Enable
        CH_SET42: u1,
        /// Configures whether or not to enable ch43.\\0: Invalid, No effect\\1: Enable
        CH_SET43: u1,
        /// Configures whether or not to enable ch44.\\0: Invalid, No effect\\1: Enable
        CH_SET44: u1,
        /// Configures whether or not to enable ch45.\\0: Invalid, No effect\\1: Enable
        CH_SET45: u1,
        /// Configures whether or not to enable ch46.\\0: Invalid, No effect\\1: Enable
        CH_SET46: u1,
        /// Configures whether or not to enable ch47.\\0: Invalid, No effect\\1: Enable
        CH_SET47: u1,
        /// Configures whether or not to enable ch48.\\0: Invalid, No effect\\1: Enable
        CH_SET48: u1,
        /// Configures whether or not to enable ch49.\\0: Invalid, No effect\\1: Enable
        CH_SET49: u1,
        padding: u14 = 0,
    }),
    /// Channel enable clear register
    /// offset: 0x14
    CH_ENA_AD1_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear ch32 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR32: u1,
        /// Configures whether or not to clear ch33 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR33: u1,
        /// Configures whether or not to clear ch34 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR34: u1,
        /// Configures whether or not to clear ch35 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR35: u1,
        /// Configures whether or not to clear ch36 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR36: u1,
        /// Configures whether or not to clear ch37 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR37: u1,
        /// Configures whether or not to clear ch38 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR38: u1,
        /// Configures whether or not to clear ch39 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR39: u1,
        /// Configures whether or not to clear ch40 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR40: u1,
        /// Configures whether or not to clear ch41 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR41: u1,
        /// Configures whether or not to clear ch42 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR42: u1,
        /// Configures whether or not to clear ch43 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR43: u1,
        /// Configures whether or not to clear ch44 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR44: u1,
        /// Configures whether or not to clear ch45 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR45: u1,
        /// Configures whether or not to clear ch46 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR46: u1,
        /// Configures whether or not to clear ch47 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR47: u1,
        /// Configures whether or not to clear ch48 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR48: u1,
        /// Configures whether or not to clear ch49 enable.\\0: Invalid, No effect\\1: Clear
        CH_CLR49: u1,
        padding: u14 = 0,
    }),
    /// Channel0 event id register
    /// offset: 0x18
    CH0_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch0_evt_id
        CH0_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel0 task id register
    /// offset: 0x1c
    CH0_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch0_task_id
        CH0_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel1 event id register
    /// offset: 0x20
    CH1_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch1_evt_id
        CH1_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel1 task id register
    /// offset: 0x24
    CH1_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch1_task_id
        CH1_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel2 event id register
    /// offset: 0x28
    CH2_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch2_evt_id
        CH2_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel2 task id register
    /// offset: 0x2c
    CH2_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch2_task_id
        CH2_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel3 event id register
    /// offset: 0x30
    CH3_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch3_evt_id
        CH3_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel3 task id register
    /// offset: 0x34
    CH3_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch3_task_id
        CH3_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel4 event id register
    /// offset: 0x38
    CH4_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch4_evt_id
        CH4_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel4 task id register
    /// offset: 0x3c
    CH4_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch4_task_id
        CH4_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel5 event id register
    /// offset: 0x40
    CH5_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch5_evt_id
        CH5_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel5 task id register
    /// offset: 0x44
    CH5_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch5_task_id
        CH5_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel6 event id register
    /// offset: 0x48
    CH6_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch6_evt_id
        CH6_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel6 task id register
    /// offset: 0x4c
    CH6_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch6_task_id
        CH6_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel7 event id register
    /// offset: 0x50
    CH7_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch7_evt_id
        CH7_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel7 task id register
    /// offset: 0x54
    CH7_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch7_task_id
        CH7_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel8 event id register
    /// offset: 0x58
    CH8_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch8_evt_id
        CH8_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel8 task id register
    /// offset: 0x5c
    CH8_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch8_task_id
        CH8_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel9 event id register
    /// offset: 0x60
    CH9_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch9_evt_id
        CH9_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel9 task id register
    /// offset: 0x64
    CH9_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch9_task_id
        CH9_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel10 event id register
    /// offset: 0x68
    CH10_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch10_evt_id
        CH10_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel10 task id register
    /// offset: 0x6c
    CH10_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch10_task_id
        CH10_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel11 event id register
    /// offset: 0x70
    CH11_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch11_evt_id
        CH11_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel11 task id register
    /// offset: 0x74
    CH11_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch11_task_id
        CH11_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel12 event id register
    /// offset: 0x78
    CH12_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch12_evt_id
        CH12_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel12 task id register
    /// offset: 0x7c
    CH12_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch12_task_id
        CH12_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel13 event id register
    /// offset: 0x80
    CH13_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch13_evt_id
        CH13_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel13 task id register
    /// offset: 0x84
    CH13_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch13_task_id
        CH13_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel14 event id register
    /// offset: 0x88
    CH14_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch14_evt_id
        CH14_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel14 task id register
    /// offset: 0x8c
    CH14_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch14_task_id
        CH14_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel15 event id register
    /// offset: 0x90
    CH15_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch15_evt_id
        CH15_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel15 task id register
    /// offset: 0x94
    CH15_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch15_task_id
        CH15_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel16 event id register
    /// offset: 0x98
    CH16_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch16_evt_id
        CH16_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel16 task id register
    /// offset: 0x9c
    CH16_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch16_task_id
        CH16_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel17 event id register
    /// offset: 0xa0
    CH17_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch17_evt_id
        CH17_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel17 task id register
    /// offset: 0xa4
    CH17_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch17_task_id
        CH17_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel18 event id register
    /// offset: 0xa8
    CH18_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch18_evt_id
        CH18_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel18 task id register
    /// offset: 0xac
    CH18_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch18_task_id
        CH18_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel19 event id register
    /// offset: 0xb0
    CH19_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch19_evt_id
        CH19_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel19 task id register
    /// offset: 0xb4
    CH19_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch19_task_id
        CH19_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel20 event id register
    /// offset: 0xb8
    CH20_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch20_evt_id
        CH20_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel20 task id register
    /// offset: 0xbc
    CH20_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch20_task_id
        CH20_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel21 event id register
    /// offset: 0xc0
    CH21_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch21_evt_id
        CH21_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel21 task id register
    /// offset: 0xc4
    CH21_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch21_task_id
        CH21_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel22 event id register
    /// offset: 0xc8
    CH22_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch22_evt_id
        CH22_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel22 task id register
    /// offset: 0xcc
    CH22_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch22_task_id
        CH22_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel23 event id register
    /// offset: 0xd0
    CH23_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch23_evt_id
        CH23_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel23 task id register
    /// offset: 0xd4
    CH23_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch23_task_id
        CH23_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel24 event id register
    /// offset: 0xd8
    CH24_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch24_evt_id
        CH24_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel24 task id register
    /// offset: 0xdc
    CH24_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch24_task_id
        CH24_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel25 event id register
    /// offset: 0xe0
    CH25_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch25_evt_id
        CH25_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel25 task id register
    /// offset: 0xe4
    CH25_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch25_task_id
        CH25_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel26 event id register
    /// offset: 0xe8
    CH26_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch26_evt_id
        CH26_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel26 task id register
    /// offset: 0xec
    CH26_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch26_task_id
        CH26_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel27 event id register
    /// offset: 0xf0
    CH27_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch27_evt_id
        CH27_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel27 task id register
    /// offset: 0xf4
    CH27_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch27_task_id
        CH27_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel28 event id register
    /// offset: 0xf8
    CH28_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch28_evt_id
        CH28_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel28 task id register
    /// offset: 0xfc
    CH28_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch28_task_id
        CH28_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel29 event id register
    /// offset: 0x100
    CH29_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch29_evt_id
        CH29_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel29 task id register
    /// offset: 0x104
    CH29_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch29_task_id
        CH29_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel30 event id register
    /// offset: 0x108
    CH30_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch30_evt_id
        CH30_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel30 task id register
    /// offset: 0x10c
    CH30_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch30_task_id
        CH30_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel31 event id register
    /// offset: 0x110
    CH31_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch31_evt_id
        CH31_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel31 task id register
    /// offset: 0x114
    CH31_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch31_task_id
        CH31_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel32 event id register
    /// offset: 0x118
    CH32_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch32_evt_id
        CH32_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel32 task id register
    /// offset: 0x11c
    CH32_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch32_task_id
        CH32_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel33 event id register
    /// offset: 0x120
    CH33_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch33_evt_id
        CH33_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel33 task id register
    /// offset: 0x124
    CH33_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch33_task_id
        CH33_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel34 event id register
    /// offset: 0x128
    CH34_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch34_evt_id
        CH34_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel34 task id register
    /// offset: 0x12c
    CH34_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch34_task_id
        CH34_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel35 event id register
    /// offset: 0x130
    CH35_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch35_evt_id
        CH35_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel35 task id register
    /// offset: 0x134
    CH35_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch35_task_id
        CH35_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel36 event id register
    /// offset: 0x138
    CH36_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch36_evt_id
        CH36_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel36 task id register
    /// offset: 0x13c
    CH36_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch36_task_id
        CH36_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel37 event id register
    /// offset: 0x140
    CH37_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch37_evt_id
        CH37_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel37 task id register
    /// offset: 0x144
    CH37_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch37_task_id
        CH37_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel38 event id register
    /// offset: 0x148
    CH38_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch38_evt_id
        CH38_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel38 task id register
    /// offset: 0x14c
    CH38_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch38_task_id
        CH38_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel39 event id register
    /// offset: 0x150
    CH39_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch39_evt_id
        CH39_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel39 task id register
    /// offset: 0x154
    CH39_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch39_task_id
        CH39_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel40 event id register
    /// offset: 0x158
    CH40_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch40_evt_id
        CH40_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel40 task id register
    /// offset: 0x15c
    CH40_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch40_task_id
        CH40_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel41 event id register
    /// offset: 0x160
    CH41_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch41_evt_id
        CH41_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel41 task id register
    /// offset: 0x164
    CH41_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch41_task_id
        CH41_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel42 event id register
    /// offset: 0x168
    CH42_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch42_evt_id
        CH42_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel42 task id register
    /// offset: 0x16c
    CH42_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch42_task_id
        CH42_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel43 event id register
    /// offset: 0x170
    CH43_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch43_evt_id
        CH43_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel43 task id register
    /// offset: 0x174
    CH43_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch43_task_id
        CH43_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel44 event id register
    /// offset: 0x178
    CH44_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch44_evt_id
        CH44_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel44 task id register
    /// offset: 0x17c
    CH44_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch44_task_id
        CH44_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel45 event id register
    /// offset: 0x180
    CH45_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch45_evt_id
        CH45_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel45 task id register
    /// offset: 0x184
    CH45_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch45_task_id
        CH45_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel46 event id register
    /// offset: 0x188
    CH46_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch46_evt_id
        CH46_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel46 task id register
    /// offset: 0x18c
    CH46_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch46_task_id
        CH46_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel47 event id register
    /// offset: 0x190
    CH47_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch47_evt_id
        CH47_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel47 task id register
    /// offset: 0x194
    CH47_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch47_task_id
        CH47_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel48 event id register
    /// offset: 0x198
    CH48_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch48_evt_id
        CH48_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel48 task id register
    /// offset: 0x19c
    CH48_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch48_task_id
        CH48_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel49 event id register
    /// offset: 0x1a0
    CH49_EVT_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch49_evt_id
        CH49_EVT_ID: u8,
        padding: u24 = 0,
    }),
    /// Channel49 task id register
    /// offset: 0x1a4
    CH49_TASK_ID: mmio.Mmio(packed struct(u32) {
        /// Configures ch49_task_id
        CH49_TASK_ID: u8,
        padding: u24 = 0,
    }),
    /// Events trigger status register
    /// offset: 0x1a8
    EVT_ST0: mmio.Mmio(packed struct(u32) {
        /// Represents GPIO_evt_ch0_rise_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH0_RISE_EDGE_ST: u1,
        /// Represents GPIO_evt_ch1_rise_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH1_RISE_EDGE_ST: u1,
        /// Represents GPIO_evt_ch2_rise_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH2_RISE_EDGE_ST: u1,
        /// Represents GPIO_evt_ch3_rise_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH3_RISE_EDGE_ST: u1,
        /// Represents GPIO_evt_ch4_rise_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH4_RISE_EDGE_ST: u1,
        /// Represents GPIO_evt_ch5_rise_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH5_RISE_EDGE_ST: u1,
        /// Represents GPIO_evt_ch6_rise_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH6_RISE_EDGE_ST: u1,
        /// Represents GPIO_evt_ch7_rise_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH7_RISE_EDGE_ST: u1,
        /// Represents GPIO_evt_ch0_fall_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH0_FALL_EDGE_ST: u1,
        /// Represents GPIO_evt_ch1_fall_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH1_FALL_EDGE_ST: u1,
        /// Represents GPIO_evt_ch2_fall_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH2_FALL_EDGE_ST: u1,
        /// Represents GPIO_evt_ch3_fall_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH3_FALL_EDGE_ST: u1,
        /// Represents GPIO_evt_ch4_fall_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH4_FALL_EDGE_ST: u1,
        /// Represents GPIO_evt_ch5_fall_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH5_FALL_EDGE_ST: u1,
        /// Represents GPIO_evt_ch6_fall_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH6_FALL_EDGE_ST: u1,
        /// Represents GPIO_evt_ch7_fall_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH7_FALL_EDGE_ST: u1,
        /// Represents GPIO_evt_ch0_any_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH0_ANY_EDGE_ST: u1,
        /// Represents GPIO_evt_ch1_any_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH1_ANY_EDGE_ST: u1,
        /// Represents GPIO_evt_ch2_any_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH2_ANY_EDGE_ST: u1,
        /// Represents GPIO_evt_ch3_any_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH3_ANY_EDGE_ST: u1,
        /// Represents GPIO_evt_ch4_any_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH4_ANY_EDGE_ST: u1,
        /// Represents GPIO_evt_ch5_any_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH5_ANY_EDGE_ST: u1,
        /// Represents GPIO_evt_ch6_any_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH6_ANY_EDGE_ST: u1,
        /// Represents GPIO_evt_ch7_any_edge trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_CH7_ANY_EDGE_ST: u1,
        /// Represents GPIO_evt_zero_det_pos0 trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_ZERO_DET_POS0_ST: u1,
        /// Represents GPIO_evt_zero_det_neg0 trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_ZERO_DET_NEG0_ST: u1,
        /// Represents GPIO_evt_zero_det_pos1 trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_ZERO_DET_POS1_ST: u1,
        /// Represents GPIO_evt_zero_det_neg1 trigger status.\\0: Not triggered\\1: Triggered
        GPIO_EVT_ZERO_DET_NEG1_ST: u1,
        /// Represents LEDC_evt_duty_chng_end_ch0 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_DUTY_CHNG_END_CH0_ST: u1,
        /// Represents LEDC_evt_duty_chng_end_ch1 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_DUTY_CHNG_END_CH1_ST: u1,
        /// Represents LEDC_evt_duty_chng_end_ch2 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_DUTY_CHNG_END_CH2_ST: u1,
        /// Represents LEDC_evt_duty_chng_end_ch3 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_DUTY_CHNG_END_CH3_ST: u1,
    }),
    /// Events trigger status clear register
    /// offset: 0x1ac
    EVT_ST0_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear GPIO_evt_ch0_rise_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH0_RISE_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch1_rise_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH1_RISE_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch2_rise_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH2_RISE_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch3_rise_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH3_RISE_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch4_rise_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH4_RISE_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch5_rise_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH5_RISE_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch6_rise_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH6_RISE_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch7_rise_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH7_RISE_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch0_fall_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH0_FALL_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch1_fall_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH1_FALL_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch2_fall_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH2_FALL_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch3_fall_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH3_FALL_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch4_fall_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH4_FALL_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch5_fall_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH5_FALL_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch6_fall_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH6_FALL_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch7_fall_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH7_FALL_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch0_any_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH0_ANY_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch1_any_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH1_ANY_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch2_any_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH2_ANY_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch3_any_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH3_ANY_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch4_any_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH4_ANY_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch5_any_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH5_ANY_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch6_any_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH6_ANY_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_ch7_any_edge trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_CH7_ANY_EDGE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_zero_det_pos0 trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_ZERO_DET_POS0_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_zero_det_neg0 trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_ZERO_DET_NEG0_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_zero_det_pos1 trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_ZERO_DET_POS1_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_evt_zero_det_neg1 trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_EVT_ZERO_DET_NEG1_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_duty_chng_end_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_DUTY_CHNG_END_CH0_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_duty_chng_end_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_DUTY_CHNG_END_CH1_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_duty_chng_end_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_DUTY_CHNG_END_CH2_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_duty_chng_end_ch3 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_DUTY_CHNG_END_CH3_ST_CLR: u1,
    }),
    /// Events trigger status register
    /// offset: 0x1b0
    EVT_ST1: mmio.Mmio(packed struct(u32) {
        /// Represents LEDC_evt_duty_chng_end_ch4 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_DUTY_CHNG_END_CH4_ST: u1,
        /// Represents LEDC_evt_duty_chng_end_ch5 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_DUTY_CHNG_END_CH5_ST: u1,
        /// Represents LEDC_evt_duty_chng_end_ch6 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_DUTY_CHNG_END_CH6_ST: u1,
        /// Represents LEDC_evt_duty_chng_end_ch7 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_DUTY_CHNG_END_CH7_ST: u1,
        /// Represents LEDC_evt_ovf_cnt_pls_ch0 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_OVF_CNT_PLS_CH0_ST: u1,
        /// Represents LEDC_evt_ovf_cnt_pls_ch1 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_OVF_CNT_PLS_CH1_ST: u1,
        /// Represents LEDC_evt_ovf_cnt_pls_ch2 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_OVF_CNT_PLS_CH2_ST: u1,
        /// Represents LEDC_evt_ovf_cnt_pls_ch3 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_OVF_CNT_PLS_CH3_ST: u1,
        /// Represents LEDC_evt_ovf_cnt_pls_ch4 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_OVF_CNT_PLS_CH4_ST: u1,
        /// Represents LEDC_evt_ovf_cnt_pls_ch5 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_OVF_CNT_PLS_CH5_ST: u1,
        /// Represents LEDC_evt_ovf_cnt_pls_ch6 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_OVF_CNT_PLS_CH6_ST: u1,
        /// Represents LEDC_evt_ovf_cnt_pls_ch7 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_OVF_CNT_PLS_CH7_ST: u1,
        /// Represents LEDC_evt_time_ovf_timer0 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_TIME_OVF_TIMER0_ST: u1,
        /// Represents LEDC_evt_time_ovf_timer1 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_TIME_OVF_TIMER1_ST: u1,
        /// Represents LEDC_evt_time_ovf_timer2 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_TIME_OVF_TIMER2_ST: u1,
        /// Represents LEDC_evt_time_ovf_timer3 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_TIME_OVF_TIMER3_ST: u1,
        /// Represents LEDC_evt_timer0_cmp trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_TIMER0_CMP_ST: u1,
        /// Represents LEDC_evt_timer1_cmp trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_TIMER1_CMP_ST: u1,
        /// Represents LEDC_evt_timer2_cmp trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_TIMER2_CMP_ST: u1,
        /// Represents LEDC_evt_timer3_cmp trigger status.\\0: Not triggered\\1: Triggered
        LEDC_EVT_TIMER3_CMP_ST: u1,
        /// Represents TG0_evt_cnt_cmp_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG0_EVT_CNT_CMP_TIMER0_ST: u1,
        /// Represents TG0_evt_cnt_cmp_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG0_EVT_CNT_CMP_TIMER1_ST: u1,
        /// Represents TG1_evt_cnt_cmp_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG1_EVT_CNT_CMP_TIMER0_ST: u1,
        /// Represents TG1_evt_cnt_cmp_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG1_EVT_CNT_CMP_TIMER1_ST: u1,
        /// Represents SYSTIMER_evt_cnt_cmp0 trigger status.\\0: Not triggered\\1: Triggered
        SYSTIMER_EVT_CNT_CMP0_ST: u1,
        /// Represents SYSTIMER_evt_cnt_cmp1 trigger status.\\0: Not triggered\\1: Triggered
        SYSTIMER_EVT_CNT_CMP1_ST: u1,
        /// Represents SYSTIMER_evt_cnt_cmp2 trigger status.\\0: Not triggered\\1: Triggered
        SYSTIMER_EVT_CNT_CMP2_ST: u1,
        /// Represents MCPWM0_evt_timer0_stop trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TIMER0_STOP_ST: u1,
        /// Represents MCPWM0_evt_timer1_stop trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TIMER1_STOP_ST: u1,
        /// Represents MCPWM0_evt_timer2_stop trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TIMER2_STOP_ST: u1,
        /// Represents MCPWM0_evt_timer0_tez trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TIMER0_TEZ_ST: u1,
        /// Represents MCPWM0_evt_timer1_tez trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TIMER1_TEZ_ST: u1,
    }),
    /// Events trigger status clear register
    /// offset: 0x1b4
    EVT_ST1_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear LEDC_evt_duty_chng_end_ch4 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_DUTY_CHNG_END_CH4_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_duty_chng_end_ch5 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_DUTY_CHNG_END_CH5_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_duty_chng_end_ch6 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_DUTY_CHNG_END_CH6_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_duty_chng_end_ch7 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_DUTY_CHNG_END_CH7_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_ovf_cnt_pls_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_OVF_CNT_PLS_CH0_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_ovf_cnt_pls_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_OVF_CNT_PLS_CH1_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_ovf_cnt_pls_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_OVF_CNT_PLS_CH2_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_ovf_cnt_pls_ch3 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_OVF_CNT_PLS_CH3_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_ovf_cnt_pls_ch4 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_OVF_CNT_PLS_CH4_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_ovf_cnt_pls_ch5 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_OVF_CNT_PLS_CH5_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_ovf_cnt_pls_ch6 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_OVF_CNT_PLS_CH6_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_ovf_cnt_pls_ch7 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_OVF_CNT_PLS_CH7_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_time_ovf_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_TIME_OVF_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_time_ovf_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_TIME_OVF_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_time_ovf_timer2 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_TIME_OVF_TIMER2_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_time_ovf_timer3 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_TIME_OVF_TIMER3_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_timer0_cmp trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_TIMER0_CMP_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_timer1_cmp trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_TIMER1_CMP_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_timer2_cmp trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_TIMER2_CMP_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_evt_timer3_cmp trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_EVT_TIMER3_CMP_ST_CLR: u1,
        /// Configures whether or not to clear TG0_evt_cnt_cmp_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_EVT_CNT_CMP_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG0_evt_cnt_cmp_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_EVT_CNT_CMP_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear TG1_evt_cnt_cmp_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_EVT_CNT_CMP_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG1_evt_cnt_cmp_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_EVT_CNT_CMP_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear SYSTIMER_evt_cnt_cmp0 trigger status.\\0: Invalid, No effect\\1: Clear
        SYSTIMER_EVT_CNT_CMP0_ST_CLR: u1,
        /// Configures whether or not to clear SYSTIMER_evt_cnt_cmp1 trigger status.\\0: Invalid, No effect\\1: Clear
        SYSTIMER_EVT_CNT_CMP1_ST_CLR: u1,
        /// Configures whether or not to clear SYSTIMER_evt_cnt_cmp2 trigger status.\\0: Invalid, No effect\\1: Clear
        SYSTIMER_EVT_CNT_CMP2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_timer0_stop trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TIMER0_STOP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_timer1_stop trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TIMER1_STOP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_timer2_stop trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TIMER2_STOP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_timer0_tez trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TIMER0_TEZ_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_timer1_tez trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TIMER1_TEZ_ST_CLR: u1,
    }),
    /// Events trigger status register
    /// offset: 0x1b8
    EVT_ST2: mmio.Mmio(packed struct(u32) {
        /// Represents MCPWM0_evt_timer2_tez trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TIMER2_TEZ_ST: u1,
        /// Represents MCPWM0_evt_timer0_tep trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TIMER0_TEP_ST: u1,
        /// Represents MCPWM0_evt_timer1_tep trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TIMER1_TEP_ST: u1,
        /// Represents MCPWM0_evt_timer2_tep trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TIMER2_TEP_ST: u1,
        /// Represents MCPWM0_evt_op0_tea trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP0_TEA_ST: u1,
        /// Represents MCPWM0_evt_op1_tea trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP1_TEA_ST: u1,
        /// Represents MCPWM0_evt_op2_tea trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP2_TEA_ST: u1,
        /// Represents MCPWM0_evt_op0_teb trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP0_TEB_ST: u1,
        /// Represents MCPWM0_evt_op1_teb trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP1_TEB_ST: u1,
        /// Represents MCPWM0_evt_op2_teb trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP2_TEB_ST: u1,
        /// Represents MCPWM0_evt_f0 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_F0_ST: u1,
        /// Represents MCPWM0_evt_f1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_F1_ST: u1,
        /// Represents MCPWM0_evt_f2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_F2_ST: u1,
        /// Represents MCPWM0_evt_f0_clr trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_F0_CLR_ST: u1,
        /// Represents MCPWM0_evt_f1_clr trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_F1_CLR_ST: u1,
        /// Represents MCPWM0_evt_f2_clr trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_F2_CLR_ST: u1,
        /// Represents MCPWM0_evt_tz0_cbc trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TZ0_CBC_ST: u1,
        /// Represents MCPWM0_evt_tz1_cbc trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TZ1_CBC_ST: u1,
        /// Represents MCPWM0_evt_tz2_cbc trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TZ2_CBC_ST: u1,
        /// Represents MCPWM0_evt_tz0_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TZ0_OST_ST: u1,
        /// Represents MCPWM0_evt_tz1_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TZ1_OST_ST: u1,
        /// Represents MCPWM0_evt_tz2_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_TZ2_OST_ST: u1,
        /// Represents MCPWM0_evt_cap0 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_CAP0_ST: u1,
        /// Represents MCPWM0_evt_cap1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_CAP1_ST: u1,
        /// Represents MCPWM0_evt_cap2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_CAP2_ST: u1,
        /// Represents MCPWM0_evt_op0_tee1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP0_TEE1_ST: u1,
        /// Represents MCPWM0_evt_op1_tee1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP1_TEE1_ST: u1,
        /// Represents MCPWM0_evt_op2_tee1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP2_TEE1_ST: u1,
        /// Represents MCPWM0_evt_op0_tee2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP0_TEE2_ST: u1,
        /// Represents MCPWM0_evt_op1_tee2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP1_TEE2_ST: u1,
        /// Represents MCPWM0_evt_op2_tee2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_EVT_OP2_TEE2_ST: u1,
        /// Represents MCPWM1_evt_timer0_stop trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TIMER0_STOP_ST: u1,
    }),
    /// Events trigger status clear register
    /// offset: 0x1bc
    EVT_ST2_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear MCPWM0_evt_timer2_tez trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TIMER2_TEZ_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_timer0_tep trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TIMER0_TEP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_timer1_tep trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TIMER1_TEP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_timer2_tep trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TIMER2_TEP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op0_tea trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP0_TEA_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op1_tea trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP1_TEA_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op2_tea trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP2_TEA_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op0_teb trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP0_TEB_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op1_teb trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP1_TEB_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op2_teb trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP2_TEB_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_f0 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_F0_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_f1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_F1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_f2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_F2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_f0_clr trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_F0_CLR_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_f1_clr trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_F1_CLR_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_f2_clr trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_F2_CLR_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_tz0_cbc trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TZ0_CBC_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_tz1_cbc trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TZ1_CBC_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_tz2_cbc trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TZ2_CBC_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_tz0_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TZ0_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_tz1_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TZ1_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_tz2_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_TZ2_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_cap0 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_CAP0_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_cap1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_CAP1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_cap2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_CAP2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op0_tee1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP0_TEE1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op1_tee1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP1_TEE1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op2_tee1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP2_TEE1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op0_tee2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP0_TEE2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op1_tee2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP1_TEE2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_evt_op2_tee2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_EVT_OP2_TEE2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_timer0_stop trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TIMER0_STOP_ST_CLR: u1,
    }),
    /// Events trigger status register
    /// offset: 0x1c0
    EVT_ST3: mmio.Mmio(packed struct(u32) {
        /// Represents MCPWM1_evt_timer1_stop trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TIMER1_STOP_ST: u1,
        /// Represents MCPWM1_evt_timer2_stop trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TIMER2_STOP_ST: u1,
        /// Represents MCPWM1_evt_timer0_tez trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TIMER0_TEZ_ST: u1,
        /// Represents MCPWM1_evt_timer1_tez trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TIMER1_TEZ_ST: u1,
        /// Represents MCPWM1_evt_timer2_tez trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TIMER2_TEZ_ST: u1,
        /// Represents MCPWM1_evt_timer0_tep trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TIMER0_TEP_ST: u1,
        /// Represents MCPWM1_evt_timer1_tep trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TIMER1_TEP_ST: u1,
        /// Represents MCPWM1_evt_timer2_tep trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TIMER2_TEP_ST: u1,
        /// Represents MCPWM1_evt_op0_tea trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP0_TEA_ST: u1,
        /// Represents MCPWM1_evt_op1_tea trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP1_TEA_ST: u1,
        /// Represents MCPWM1_evt_op2_tea trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP2_TEA_ST: u1,
        /// Represents MCPWM1_evt_op0_teb trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP0_TEB_ST: u1,
        /// Represents MCPWM1_evt_op1_teb trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP1_TEB_ST: u1,
        /// Represents MCPWM1_evt_op2_teb trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP2_TEB_ST: u1,
        /// Represents MCPWM1_evt_f0 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_F0_ST: u1,
        /// Represents MCPWM1_evt_f1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_F1_ST: u1,
        /// Represents MCPWM1_evt_f2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_F2_ST: u1,
        /// Represents MCPWM1_evt_f0_clr trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_F0_CLR_ST: u1,
        /// Represents MCPWM1_evt_f1_clr trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_F1_CLR_ST: u1,
        /// Represents MCPWM1_evt_f2_clr trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_F2_CLR_ST: u1,
        /// Represents MCPWM1_evt_tz0_cbc trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TZ0_CBC_ST: u1,
        /// Represents MCPWM1_evt_tz1_cbc trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TZ1_CBC_ST: u1,
        /// Represents MCPWM1_evt_tz2_cbc trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TZ2_CBC_ST: u1,
        /// Represents MCPWM1_evt_tz0_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TZ0_OST_ST: u1,
        /// Represents MCPWM1_evt_tz1_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TZ1_OST_ST: u1,
        /// Represents MCPWM1_evt_tz2_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_TZ2_OST_ST: u1,
        /// Represents MCPWM1_evt_cap0 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_CAP0_ST: u1,
        /// Represents MCPWM1_evt_cap1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_CAP1_ST: u1,
        /// Represents MCPWM1_evt_cap2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_CAP2_ST: u1,
        /// Represents MCPWM1_evt_op0_tee1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP0_TEE1_ST: u1,
        /// Represents MCPWM1_evt_op1_tee1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP1_TEE1_ST: u1,
        /// Represents MCPWM1_evt_op2_tee1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP2_TEE1_ST: u1,
    }),
    /// Events trigger status clear register
    /// offset: 0x1c4
    EVT_ST3_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear MCPWM1_evt_timer1_stop trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TIMER1_STOP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_timer2_stop trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TIMER2_STOP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_timer0_tez trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TIMER0_TEZ_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_timer1_tez trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TIMER1_TEZ_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_timer2_tez trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TIMER2_TEZ_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_timer0_tep trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TIMER0_TEP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_timer1_tep trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TIMER1_TEP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_timer2_tep trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TIMER2_TEP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op0_tea trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP0_TEA_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op1_tea trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP1_TEA_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op2_tea trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP2_TEA_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op0_teb trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP0_TEB_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op1_teb trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP1_TEB_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op2_teb trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP2_TEB_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_f0 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_F0_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_f1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_F1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_f2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_F2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_f0_clr trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_F0_CLR_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_f1_clr trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_F1_CLR_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_f2_clr trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_F2_CLR_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_tz0_cbc trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TZ0_CBC_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_tz1_cbc trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TZ1_CBC_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_tz2_cbc trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TZ2_CBC_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_tz0_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TZ0_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_tz1_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TZ1_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_tz2_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_TZ2_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_cap0 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_CAP0_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_cap1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_CAP1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_cap2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_CAP2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op0_tee1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP0_TEE1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op1_tee1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP1_TEE1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op2_tee1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP2_TEE1_ST_CLR: u1,
    }),
    /// Events trigger status register
    /// offset: 0x1c8
    EVT_ST4: mmio.Mmio(packed struct(u32) {
        /// Represents MCPWM1_evt_op0_tee2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP0_TEE2_ST: u1,
        /// Represents MCPWM1_evt_op1_tee2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP1_TEE2_ST: u1,
        /// Represents MCPWM1_evt_op2_tee2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_EVT_OP2_TEE2_ST: u1,
        /// Represents ADC_evt_conv_cmplt0 trigger status.\\0: Not triggered\\1: Triggered
        ADC_EVT_CONV_CMPLT0_ST: u1,
        /// Represents ADC_evt_eq_above_thresh0 trigger status.\\0: Not triggered\\1: Triggered
        ADC_EVT_EQ_ABOVE_THRESH0_ST: u1,
        /// Represents ADC_evt_eq_above_thresh1 trigger status.\\0: Not triggered\\1: Triggered
        ADC_EVT_EQ_ABOVE_THRESH1_ST: u1,
        /// Represents ADC_evt_eq_below_thresh0 trigger status.\\0: Not triggered\\1: Triggered
        ADC_EVT_EQ_BELOW_THRESH0_ST: u1,
        /// Represents ADC_evt_eq_below_thresh1 trigger status.\\0: Not triggered\\1: Triggered
        ADC_EVT_EQ_BELOW_THRESH1_ST: u1,
        /// Represents ADC_evt_result_done0 trigger status.\\0: Not triggered\\1: Triggered
        ADC_EVT_RESULT_DONE0_ST: u1,
        /// Represents ADC_evt_stopped0 trigger status.\\0: Not triggered\\1: Triggered
        ADC_EVT_STOPPED0_ST: u1,
        /// Represents ADC_evt_started0 trigger status.\\0: Not triggered\\1: Triggered
        ADC_EVT_STARTED0_ST: u1,
        /// Represents REGDMA_evt_done0 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_EVT_DONE0_ST: u1,
        /// Represents REGDMA_evt_done1 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_EVT_DONE1_ST: u1,
        /// Represents REGDMA_evt_done2 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_EVT_DONE2_ST: u1,
        /// Represents REGDMA_evt_done3 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_EVT_DONE3_ST: u1,
        /// Represents REGDMA_evt_err0 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_EVT_ERR0_ST: u1,
        /// Represents REGDMA_evt_err1 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_EVT_ERR1_ST: u1,
        /// Represents REGDMA_evt_err2 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_EVT_ERR2_ST: u1,
        /// Represents REGDMA_evt_err3 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_EVT_ERR3_ST: u1,
        /// Represents TMPSNSR_evt_over_limit trigger status.\\0: Not triggered\\1: Triggered
        TMPSNSR_EVT_OVER_LIMIT_ST: u1,
        /// Represents I2S0_evt_rx_done trigger status.\\0: Not triggered\\1: Triggered
        I2S0_EVT_RX_DONE_ST: u1,
        /// Represents I2S0_evt_tx_done trigger status.\\0: Not triggered\\1: Triggered
        I2S0_EVT_TX_DONE_ST: u1,
        /// Represents I2S0_evt_x_words_received trigger status.\\0: Not triggered\\1: Triggered
        I2S0_EVT_X_WORDS_RECEIVED_ST: u1,
        /// Represents I2S0_evt_x_words_sent trigger status.\\0: Not triggered\\1: Triggered
        I2S0_EVT_X_WORDS_SENT_ST: u1,
        /// Represents I2S1_evt_rx_done trigger status.\\0: Not triggered\\1: Triggered
        I2S1_EVT_RX_DONE_ST: u1,
        /// Represents I2S1_evt_tx_done trigger status.\\0: Not triggered\\1: Triggered
        I2S1_EVT_TX_DONE_ST: u1,
        /// Represents I2S1_evt_x_words_received trigger status.\\0: Not triggered\\1: Triggered
        I2S1_EVT_X_WORDS_RECEIVED_ST: u1,
        /// Represents I2S1_evt_x_words_sent trigger status.\\0: Not triggered\\1: Triggered
        I2S1_EVT_X_WORDS_SENT_ST: u1,
        /// Represents I2S2_evt_rx_done trigger status.\\0: Not triggered\\1: Triggered
        I2S2_EVT_RX_DONE_ST: u1,
        /// Represents I2S2_evt_tx_done trigger status.\\0: Not triggered\\1: Triggered
        I2S2_EVT_TX_DONE_ST: u1,
        /// Represents I2S2_evt_x_words_received trigger status.\\0: Not triggered\\1: Triggered
        I2S2_EVT_X_WORDS_RECEIVED_ST: u1,
        /// Represents I2S2_evt_x_words_sent trigger status.\\0: Not triggered\\1: Triggered
        I2S2_EVT_X_WORDS_SENT_ST: u1,
    }),
    /// Events trigger status clear register
    /// offset: 0x1cc
    EVT_ST4_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear MCPWM1_evt_op0_tee2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP0_TEE2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op1_tee2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP1_TEE2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_evt_op2_tee2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_EVT_OP2_TEE2_ST_CLR: u1,
        /// Configures whether or not to clear ADC_evt_conv_cmplt0 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_EVT_CONV_CMPLT0_ST_CLR: u1,
        /// Configures whether or not to clear ADC_evt_eq_above_thresh0 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_EVT_EQ_ABOVE_THRESH0_ST_CLR: u1,
        /// Configures whether or not to clear ADC_evt_eq_above_thresh1 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_EVT_EQ_ABOVE_THRESH1_ST_CLR: u1,
        /// Configures whether or not to clear ADC_evt_eq_below_thresh0 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_EVT_EQ_BELOW_THRESH0_ST_CLR: u1,
        /// Configures whether or not to clear ADC_evt_eq_below_thresh1 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_EVT_EQ_BELOW_THRESH1_ST_CLR: u1,
        /// Configures whether or not to clear ADC_evt_result_done0 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_EVT_RESULT_DONE0_ST_CLR: u1,
        /// Configures whether or not to clear ADC_evt_stopped0 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_EVT_STOPPED0_ST_CLR: u1,
        /// Configures whether or not to clear ADC_evt_started0 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_EVT_STARTED0_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_evt_done0 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_EVT_DONE0_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_evt_done1 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_EVT_DONE1_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_evt_done2 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_EVT_DONE2_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_evt_done3 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_EVT_DONE3_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_evt_err0 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_EVT_ERR0_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_evt_err1 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_EVT_ERR1_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_evt_err2 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_EVT_ERR2_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_evt_err3 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_EVT_ERR3_ST_CLR: u1,
        /// Configures whether or not to clear TMPSNSR_evt_over_limit trigger status.\\0: Invalid, No effect\\1: Clear
        TMPSNSR_EVT_OVER_LIMIT_ST_CLR: u1,
        /// Configures whether or not to clear I2S0_evt_rx_done trigger status.\\0: Invalid, No effect\\1: Clear
        I2S0_EVT_RX_DONE_ST_CLR: u1,
        /// Configures whether or not to clear I2S0_evt_tx_done trigger status.\\0: Invalid, No effect\\1: Clear
        I2S0_EVT_TX_DONE_ST_CLR: u1,
        /// Configures whether or not to clear I2S0_evt_x_words_received trigger status.\\0: Invalid, No effect\\1: Clear
        I2S0_EVT_X_WORDS_RECEIVED_ST_CLR: u1,
        /// Configures whether or not to clear I2S0_evt_x_words_sent trigger status.\\0: Invalid, No effect\\1: Clear
        I2S0_EVT_X_WORDS_SENT_ST_CLR: u1,
        /// Configures whether or not to clear I2S1_evt_rx_done trigger status.\\0: Invalid, No effect\\1: Clear
        I2S1_EVT_RX_DONE_ST_CLR: u1,
        /// Configures whether or not to clear I2S1_evt_tx_done trigger status.\\0: Invalid, No effect\\1: Clear
        I2S1_EVT_TX_DONE_ST_CLR: u1,
        /// Configures whether or not to clear I2S1_evt_x_words_received trigger status.\\0: Invalid, No effect\\1: Clear
        I2S1_EVT_X_WORDS_RECEIVED_ST_CLR: u1,
        /// Configures whether or not to clear I2S1_evt_x_words_sent trigger status.\\0: Invalid, No effect\\1: Clear
        I2S1_EVT_X_WORDS_SENT_ST_CLR: u1,
        /// Configures whether or not to clear I2S2_evt_rx_done trigger status.\\0: Invalid, No effect\\1: Clear
        I2S2_EVT_RX_DONE_ST_CLR: u1,
        /// Configures whether or not to clear I2S2_evt_tx_done trigger status.\\0: Invalid, No effect\\1: Clear
        I2S2_EVT_TX_DONE_ST_CLR: u1,
        /// Configures whether or not to clear I2S2_evt_x_words_received trigger status.\\0: Invalid, No effect\\1: Clear
        I2S2_EVT_X_WORDS_RECEIVED_ST_CLR: u1,
        /// Configures whether or not to clear I2S2_evt_x_words_sent trigger status.\\0: Invalid, No effect\\1: Clear
        I2S2_EVT_X_WORDS_SENT_ST_CLR: u1,
    }),
    /// Events trigger status register
    /// offset: 0x1d0
    EVT_ST5: mmio.Mmio(packed struct(u32) {
        /// Represents ULP_evt_err_intr trigger status.\\0: Not triggered\\1: Triggered
        ULP_EVT_ERR_INTR_ST: u1,
        /// Represents ULP_evt_halt trigger status.\\0: Not triggered\\1: Triggered
        ULP_EVT_HALT_ST: u1,
        /// Represents ULP_evt_start_intr trigger status.\\0: Not triggered\\1: Triggered
        ULP_EVT_START_INTR_ST: u1,
        /// Represents RTC_evt_tick trigger status.\\0: Not triggered\\1: Triggered
        RTC_EVT_TICK_ST: u1,
        /// Represents RTC_evt_ovf trigger status.\\0: Not triggered\\1: Triggered
        RTC_EVT_OVF_ST: u1,
        /// Represents RTC_evt_cmp trigger status.\\0: Not triggered\\1: Triggered
        RTC_EVT_CMP_ST: u1,
        /// Represents PDMA_AHB_evt_in_done_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_DONE_CH0_ST: u1,
        /// Represents PDMA_AHB_evt_in_done_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_DONE_CH1_ST: u1,
        /// Represents PDMA_AHB_evt_in_done_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_DONE_CH2_ST: u1,
        /// Represents PDMA_AHB_evt_in_suc_eof_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_SUC_EOF_CH0_ST: u1,
        /// Represents PDMA_AHB_evt_in_suc_eof_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_SUC_EOF_CH1_ST: u1,
        /// Represents PDMA_AHB_evt_in_suc_eof_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_SUC_EOF_CH2_ST: u1,
        /// Represents PDMA_AHB_evt_in_fifo_empty_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_FIFO_EMPTY_CH0_ST: u1,
        /// Represents PDMA_AHB_evt_in_fifo_empty_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_FIFO_EMPTY_CH1_ST: u1,
        /// Represents PDMA_AHB_evt_in_fifo_empty_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_FIFO_EMPTY_CH2_ST: u1,
        /// Represents PDMA_AHB_evt_in_fifo_full_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_FIFO_FULL_CH0_ST: u1,
        /// Represents PDMA_AHB_evt_in_fifo_full_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_FIFO_FULL_CH1_ST: u1,
        /// Represents PDMA_AHB_evt_in_fifo_full_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_IN_FIFO_FULL_CH2_ST: u1,
        /// Represents PDMA_AHB_evt_out_done_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_DONE_CH0_ST: u1,
        /// Represents PDMA_AHB_evt_out_done_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_DONE_CH1_ST: u1,
        /// Represents PDMA_AHB_evt_out_done_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_DONE_CH2_ST: u1,
        /// Represents PDMA_AHB_evt_out_eof_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_EOF_CH0_ST: u1,
        /// Represents PDMA_AHB_evt_out_eof_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_EOF_CH1_ST: u1,
        /// Represents PDMA_AHB_evt_out_eof_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_EOF_CH2_ST: u1,
        /// Represents PDMA_AHB_evt_out_total_eof_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_TOTAL_EOF_CH0_ST: u1,
        /// Represents PDMA_AHB_evt_out_total_eof_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_TOTAL_EOF_CH1_ST: u1,
        /// Represents PDMA_AHB_evt_out_total_eof_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_TOTAL_EOF_CH2_ST: u1,
        /// Represents PDMA_AHB_evt_out_fifo_empty_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_FIFO_EMPTY_CH0_ST: u1,
        /// Represents PDMA_AHB_evt_out_fifo_empty_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_FIFO_EMPTY_CH1_ST: u1,
        /// Represents PDMA_AHB_evt_out_fifo_empty_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_FIFO_EMPTY_CH2_ST: u1,
        /// Represents PDMA_AHB_evt_out_fifo_full_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_FIFO_FULL_CH0_ST: u1,
        /// Represents PDMA_AHB_evt_out_fifo_full_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_FIFO_FULL_CH1_ST: u1,
    }),
    /// Events trigger status clear register
    /// offset: 0x1d4
    EVT_ST5_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear ULP_evt_err_intr trigger status.\\0: Invalid, No effect\\1: Clear
        ULP_EVT_ERR_INTR_ST_CLR: u1,
        /// Configures whether or not to clear ULP_evt_halt trigger status.\\0: Invalid, No effect\\1: Clear
        ULP_EVT_HALT_ST_CLR: u1,
        /// Configures whether or not to clear ULP_evt_start_intr trigger status.\\0: Invalid, No effect\\1: Clear
        ULP_EVT_START_INTR_ST_CLR: u1,
        /// Configures whether or not to clear RTC_evt_tick trigger status.\\0: Invalid, No effect\\1: Clear
        RTC_EVT_TICK_ST_CLR: u1,
        /// Configures whether or not to clear RTC_evt_ovf trigger status.\\0: Invalid, No effect\\1: Clear
        RTC_EVT_OVF_ST_CLR: u1,
        /// Configures whether or not to clear RTC_evt_cmp trigger status.\\0: Invalid, No effect\\1: Clear
        RTC_EVT_CMP_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_done_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_DONE_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_done_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_DONE_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_done_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_DONE_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_suc_eof_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_SUC_EOF_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_suc_eof_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_SUC_EOF_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_suc_eof_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_SUC_EOF_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_fifo_empty_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_FIFO_EMPTY_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_fifo_empty_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_FIFO_EMPTY_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_fifo_empty_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_FIFO_EMPTY_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_fifo_full_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_FIFO_FULL_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_fifo_full_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_FIFO_FULL_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_in_fifo_full_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_IN_FIFO_FULL_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_done_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_DONE_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_done_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_DONE_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_done_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_DONE_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_eof_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_EOF_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_eof_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_EOF_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_eof_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_EOF_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_total_eof_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_TOTAL_EOF_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_total_eof_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_TOTAL_EOF_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_total_eof_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_TOTAL_EOF_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_fifo_empty_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_FIFO_EMPTY_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_fifo_empty_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_FIFO_EMPTY_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_fifo_empty_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_FIFO_EMPTY_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_fifo_full_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_FIFO_FULL_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_evt_out_fifo_full_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_FIFO_FULL_CH1_ST_CLR: u1,
    }),
    /// Events trigger status register
    /// offset: 0x1d8
    EVT_ST6: mmio.Mmio(packed struct(u32) {
        /// Represents PDMA_AHB_evt_out_fifo_full_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_EVT_OUT_FIFO_FULL_CH2_ST: u1,
        /// Represents PDMA_AXI_evt_in_done_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_DONE_CH0_ST: u1,
        /// Represents PDMA_AXI_evt_in_done_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_DONE_CH1_ST: u1,
        /// Represents PDMA_AXI_evt_in_done_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_DONE_CH2_ST: u1,
        /// Represents PDMA_AXI_evt_in_suc_eof_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_SUC_EOF_CH0_ST: u1,
        /// Represents PDMA_AXI_evt_in_suc_eof_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_SUC_EOF_CH1_ST: u1,
        /// Represents PDMA_AXI_evt_in_suc_eof_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_SUC_EOF_CH2_ST: u1,
        /// Represents PDMA_AXI_evt_in_fifo_empty_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_FIFO_EMPTY_CH0_ST: u1,
        /// Represents PDMA_AXI_evt_in_fifo_empty_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_FIFO_EMPTY_CH1_ST: u1,
        /// Represents PDMA_AXI_evt_in_fifo_empty_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_FIFO_EMPTY_CH2_ST: u1,
        /// Represents PDMA_AXI_evt_in_fifo_full_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_FIFO_FULL_CH0_ST: u1,
        /// Represents PDMA_AXI_evt_in_fifo_full_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_FIFO_FULL_CH1_ST: u1,
        /// Represents PDMA_AXI_evt_in_fifo_full_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_IN_FIFO_FULL_CH2_ST: u1,
        /// Represents PDMA_AXI_evt_out_done_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_DONE_CH0_ST: u1,
        /// Represents PDMA_AXI_evt_out_done_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_DONE_CH1_ST: u1,
        /// Represents PDMA_AXI_evt_out_done_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_DONE_CH2_ST: u1,
        /// Represents PDMA_AXI_evt_out_eof_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_EOF_CH0_ST: u1,
        /// Represents PDMA_AXI_evt_out_eof_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_EOF_CH1_ST: u1,
        /// Represents PDMA_AXI_evt_out_eof_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_EOF_CH2_ST: u1,
        /// Represents PDMA_AXI_evt_out_total_eof_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_TOTAL_EOF_CH0_ST: u1,
        /// Represents PDMA_AXI_evt_out_total_eof_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_TOTAL_EOF_CH1_ST: u1,
        /// Represents PDMA_AXI_evt_out_total_eof_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_TOTAL_EOF_CH2_ST: u1,
        /// Represents PDMA_AXI_evt_out_fifo_empty_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_FIFO_EMPTY_CH0_ST: u1,
        /// Represents PDMA_AXI_evt_out_fifo_empty_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_FIFO_EMPTY_CH1_ST: u1,
        /// Represents PDMA_AXI_evt_out_fifo_empty_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_FIFO_EMPTY_CH2_ST: u1,
        /// Represents PDMA_AXI_evt_out_fifo_full_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_FIFO_FULL_CH0_ST: u1,
        /// Represents PDMA_AXI_evt_out_fifo_full_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_FIFO_FULL_CH1_ST: u1,
        /// Represents PDMA_AXI_evt_out_fifo_full_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_EVT_OUT_FIFO_FULL_CH2_ST: u1,
        /// Represents PMU_evt_sleep_weekup trigger status.\\0: Not triggered\\1: Triggered
        PMU_EVT_SLEEP_WEEKUP_ST: u1,
        /// Represents DMA2D_evt_in_done_ch0 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_IN_DONE_CH0_ST: u1,
        /// Represents DMA2D_evt_in_done_ch1 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_IN_DONE_CH1_ST: u1,
        /// Represents DMA2D_evt_in_suc_eof_ch0 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_IN_SUC_EOF_CH0_ST: u1,
    }),
    /// Events trigger status clear register
    /// offset: 0x1dc
    EVT_ST6_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear PDMA_AHB_evt_out_fifo_full_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_EVT_OUT_FIFO_FULL_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_done_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_DONE_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_done_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_DONE_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_done_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_DONE_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_suc_eof_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_SUC_EOF_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_suc_eof_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_SUC_EOF_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_suc_eof_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_SUC_EOF_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_fifo_empty_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_FIFO_EMPTY_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_fifo_empty_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_FIFO_EMPTY_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_fifo_empty_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_FIFO_EMPTY_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_fifo_full_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_FIFO_FULL_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_fifo_full_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_FIFO_FULL_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_in_fifo_full_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_IN_FIFO_FULL_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_done_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_DONE_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_done_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_DONE_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_done_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_DONE_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_eof_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_EOF_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_eof_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_EOF_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_eof_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_EOF_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_total_eof_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_TOTAL_EOF_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_total_eof_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_TOTAL_EOF_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_total_eof_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_TOTAL_EOF_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_fifo_empty_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_FIFO_EMPTY_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_fifo_empty_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_FIFO_EMPTY_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_fifo_empty_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_FIFO_EMPTY_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_fifo_full_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_FIFO_FULL_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_fifo_full_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_FIFO_FULL_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_evt_out_fifo_full_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_EVT_OUT_FIFO_FULL_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PMU_evt_sleep_weekup trigger status.\\0: Invalid, No effect\\1: Clear
        PMU_EVT_SLEEP_WEEKUP_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_in_done_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_IN_DONE_CH0_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_in_done_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_IN_DONE_CH1_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_in_suc_eof_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_IN_SUC_EOF_CH0_ST_CLR: u1,
    }),
    /// Events trigger status register
    /// offset: 0x1e0
    EVT_ST7: mmio.Mmio(packed struct(u32) {
        /// Represents DMA2D_evt_in_suc_eof_ch1 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_IN_SUC_EOF_CH1_ST: u1,
        /// Represents DMA2D_evt_out_done_ch0 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_OUT_DONE_CH0_ST: u1,
        /// Represents DMA2D_evt_out_done_ch1 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_OUT_DONE_CH1_ST: u1,
        /// Represents DMA2D_evt_out_done_ch2 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_OUT_DONE_CH2_ST: u1,
        /// Represents DMA2D_evt_out_eof_ch0 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_OUT_EOF_CH0_ST: u1,
        /// Represents DMA2D_evt_out_eof_ch1 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_OUT_EOF_CH1_ST: u1,
        /// Represents DMA2D_evt_out_eof_ch2 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_OUT_EOF_CH2_ST: u1,
        /// Represents DMA2D_evt_out_total_eof_ch0 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_OUT_TOTAL_EOF_CH0_ST: u1,
        /// Represents DMA2D_evt_out_total_eof_ch1 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_OUT_TOTAL_EOF_CH1_ST: u1,
        /// Represents DMA2D_evt_out_total_eof_ch2 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_EVT_OUT_TOTAL_EOF_CH2_ST: u1,
        padding: u22 = 0,
    }),
    /// Events trigger status clear register
    /// offset: 0x1e4
    EVT_ST7_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear DMA2D_evt_in_suc_eof_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_IN_SUC_EOF_CH1_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_out_done_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_OUT_DONE_CH0_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_out_done_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_OUT_DONE_CH1_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_out_done_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_OUT_DONE_CH2_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_out_eof_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_OUT_EOF_CH0_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_out_eof_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_OUT_EOF_CH1_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_out_eof_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_OUT_EOF_CH2_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_out_total_eof_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_OUT_TOTAL_EOF_CH0_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_out_total_eof_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_OUT_TOTAL_EOF_CH1_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_evt_out_total_eof_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_EVT_OUT_TOTAL_EOF_CH2_ST_CLR: u1,
        padding: u22 = 0,
    }),
    /// Tasks trigger status register
    /// offset: 0x1e8
    TASK_ST0: mmio.Mmio(packed struct(u32) {
        /// Represents GPIO_task_ch0_set trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH0_SET_ST: u1,
        /// Represents GPIO_task_ch1_set trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH1_SET_ST: u1,
        /// Represents GPIO_task_ch2_set trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH2_SET_ST: u1,
        /// Represents GPIO_task_ch3_set trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH3_SET_ST: u1,
        /// Represents GPIO_task_ch4_set trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH4_SET_ST: u1,
        /// Represents GPIO_task_ch5_set trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH5_SET_ST: u1,
        /// Represents GPIO_task_ch6_set trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH6_SET_ST: u1,
        /// Represents GPIO_task_ch7_set trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH7_SET_ST: u1,
        /// Represents GPIO_task_ch0_clear trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH0_CLEAR_ST: u1,
        /// Represents GPIO_task_ch1_clear trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH1_CLEAR_ST: u1,
        /// Represents GPIO_task_ch2_clear trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH2_CLEAR_ST: u1,
        /// Represents GPIO_task_ch3_clear trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH3_CLEAR_ST: u1,
        /// Represents GPIO_task_ch4_clear trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH4_CLEAR_ST: u1,
        /// Represents GPIO_task_ch5_clear trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH5_CLEAR_ST: u1,
        /// Represents GPIO_task_ch6_clear trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH6_CLEAR_ST: u1,
        /// Represents GPIO_task_ch7_clear trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH7_CLEAR_ST: u1,
        /// Represents GPIO_task_ch0_toggle trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH0_TOGGLE_ST: u1,
        /// Represents GPIO_task_ch1_toggle trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH1_TOGGLE_ST: u1,
        /// Represents GPIO_task_ch2_toggle trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH2_TOGGLE_ST: u1,
        /// Represents GPIO_task_ch3_toggle trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH3_TOGGLE_ST: u1,
        /// Represents GPIO_task_ch4_toggle trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH4_TOGGLE_ST: u1,
        /// Represents GPIO_task_ch5_toggle trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH5_TOGGLE_ST: u1,
        /// Represents GPIO_task_ch6_toggle trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH6_TOGGLE_ST: u1,
        /// Represents GPIO_task_ch7_toggle trigger status.\\0: Not triggered\\1: Triggered
        GPIO_TASK_CH7_TOGGLE_ST: u1,
        /// Represents LEDC_task_timer0_res_update trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER0_RES_UPDATE_ST: u1,
        /// Represents LEDC_task_timer1_res_update trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER1_RES_UPDATE_ST: u1,
        /// Represents LEDC_task_timer2_res_update trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER2_RES_UPDATE_ST: u1,
        /// Represents LEDC_task_timer3_res_update trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER3_RES_UPDATE_ST: u1,
        /// Represents LEDC_task_duty_scale_update_ch0 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_DUTY_SCALE_UPDATE_CH0_ST: u1,
        /// Represents LEDC_task_duty_scale_update_ch1 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_DUTY_SCALE_UPDATE_CH1_ST: u1,
        /// Represents LEDC_task_duty_scale_update_ch2 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_DUTY_SCALE_UPDATE_CH2_ST: u1,
        /// Represents LEDC_task_duty_scale_update_ch3 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_DUTY_SCALE_UPDATE_CH3_ST: u1,
    }),
    /// Tasks trigger status clear register
    /// offset: 0x1ec
    TASK_ST0_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear GPIO_task_ch0_set trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH0_SET_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch1_set trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH1_SET_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch2_set trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH2_SET_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch3_set trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH3_SET_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch4_set trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH4_SET_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch5_set trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH5_SET_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch6_set trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH6_SET_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch7_set trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH7_SET_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch0_clear trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH0_CLEAR_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch1_clear trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH1_CLEAR_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch2_clear trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH2_CLEAR_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch3_clear trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH3_CLEAR_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch4_clear trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH4_CLEAR_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch5_clear trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH5_CLEAR_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch6_clear trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH6_CLEAR_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch7_clear trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH7_CLEAR_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch0_toggle trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH0_TOGGLE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch1_toggle trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH1_TOGGLE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch2_toggle trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH2_TOGGLE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch3_toggle trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH3_TOGGLE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch4_toggle trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH4_TOGGLE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch5_toggle trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH5_TOGGLE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch6_toggle trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH6_TOGGLE_ST_CLR: u1,
        /// Configures whether or not to clear GPIO_task_ch7_toggle trigger status.\\0: Invalid, No effect\\1: Clear
        GPIO_TASK_CH7_TOGGLE_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer0_res_update trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER0_RES_UPDATE_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer1_res_update trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER1_RES_UPDATE_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer2_res_update trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER2_RES_UPDATE_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer3_res_update trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER3_RES_UPDATE_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_duty_scale_update_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_DUTY_SCALE_UPDATE_CH0_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_duty_scale_update_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_DUTY_SCALE_UPDATE_CH1_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_duty_scale_update_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_DUTY_SCALE_UPDATE_CH2_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_duty_scale_update_ch3 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_DUTY_SCALE_UPDATE_CH3_ST_CLR: u1,
    }),
    /// Tasks trigger status register
    /// offset: 0x1f0
    TASK_ST1: mmio.Mmio(packed struct(u32) {
        /// Represents LEDC_task_duty_scale_update_ch4 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_DUTY_SCALE_UPDATE_CH4_ST: u1,
        /// Represents LEDC_task_duty_scale_update_ch5 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_DUTY_SCALE_UPDATE_CH5_ST: u1,
        /// Represents LEDC_task_duty_scale_update_ch6 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_DUTY_SCALE_UPDATE_CH6_ST: u1,
        /// Represents LEDC_task_duty_scale_update_ch7 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_DUTY_SCALE_UPDATE_CH7_ST: u1,
        /// Represents LEDC_task_timer0_cap trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER0_CAP_ST: u1,
        /// Represents LEDC_task_timer1_cap trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER1_CAP_ST: u1,
        /// Represents LEDC_task_timer2_cap trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER2_CAP_ST: u1,
        /// Represents LEDC_task_timer3_cap trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER3_CAP_ST: u1,
        /// Represents LEDC_task_sig_out_dis_ch0 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_SIG_OUT_DIS_CH0_ST: u1,
        /// Represents LEDC_task_sig_out_dis_ch1 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_SIG_OUT_DIS_CH1_ST: u1,
        /// Represents LEDC_task_sig_out_dis_ch2 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_SIG_OUT_DIS_CH2_ST: u1,
        /// Represents LEDC_task_sig_out_dis_ch3 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_SIG_OUT_DIS_CH3_ST: u1,
        /// Represents LEDC_task_sig_out_dis_ch4 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_SIG_OUT_DIS_CH4_ST: u1,
        /// Represents LEDC_task_sig_out_dis_ch5 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_SIG_OUT_DIS_CH5_ST: u1,
        /// Represents LEDC_task_sig_out_dis_ch6 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_SIG_OUT_DIS_CH6_ST: u1,
        /// Represents LEDC_task_sig_out_dis_ch7 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_SIG_OUT_DIS_CH7_ST: u1,
        /// Represents LEDC_task_ovf_cnt_rst_ch0 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_OVF_CNT_RST_CH0_ST: u1,
        /// Represents LEDC_task_ovf_cnt_rst_ch1 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_OVF_CNT_RST_CH1_ST: u1,
        /// Represents LEDC_task_ovf_cnt_rst_ch2 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_OVF_CNT_RST_CH2_ST: u1,
        /// Represents LEDC_task_ovf_cnt_rst_ch3 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_OVF_CNT_RST_CH3_ST: u1,
        /// Represents LEDC_task_ovf_cnt_rst_ch4 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_OVF_CNT_RST_CH4_ST: u1,
        /// Represents LEDC_task_ovf_cnt_rst_ch5 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_OVF_CNT_RST_CH5_ST: u1,
        /// Represents LEDC_task_ovf_cnt_rst_ch6 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_OVF_CNT_RST_CH6_ST: u1,
        /// Represents LEDC_task_ovf_cnt_rst_ch7 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_OVF_CNT_RST_CH7_ST: u1,
        /// Represents LEDC_task_timer0_rst trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER0_RST_ST: u1,
        /// Represents LEDC_task_timer1_rst trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER1_RST_ST: u1,
        /// Represents LEDC_task_timer2_rst trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER2_RST_ST: u1,
        /// Represents LEDC_task_timer3_rst trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER3_RST_ST: u1,
        /// Represents LEDC_task_timer0_resume trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER0_RESUME_ST: u1,
        /// Represents LEDC_task_timer1_resume trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER1_RESUME_ST: u1,
        /// Represents LEDC_task_timer2_resume trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER2_RESUME_ST: u1,
        /// Represents LEDC_task_timer3_resume trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER3_RESUME_ST: u1,
    }),
    /// Tasks trigger status clear register
    /// offset: 0x1f4
    TASK_ST1_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear LEDC_task_duty_scale_update_ch4 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_DUTY_SCALE_UPDATE_CH4_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_duty_scale_update_ch5 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_DUTY_SCALE_UPDATE_CH5_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_duty_scale_update_ch6 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_DUTY_SCALE_UPDATE_CH6_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_duty_scale_update_ch7 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_DUTY_SCALE_UPDATE_CH7_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer0_cap trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER0_CAP_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer1_cap trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER1_CAP_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer2_cap trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER2_CAP_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer3_cap trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER3_CAP_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_sig_out_dis_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_SIG_OUT_DIS_CH0_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_sig_out_dis_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_SIG_OUT_DIS_CH1_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_sig_out_dis_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_SIG_OUT_DIS_CH2_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_sig_out_dis_ch3 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_SIG_OUT_DIS_CH3_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_sig_out_dis_ch4 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_SIG_OUT_DIS_CH4_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_sig_out_dis_ch5 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_SIG_OUT_DIS_CH5_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_sig_out_dis_ch6 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_SIG_OUT_DIS_CH6_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_sig_out_dis_ch7 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_SIG_OUT_DIS_CH7_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_ovf_cnt_rst_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_OVF_CNT_RST_CH0_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_ovf_cnt_rst_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_OVF_CNT_RST_CH1_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_ovf_cnt_rst_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_OVF_CNT_RST_CH2_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_ovf_cnt_rst_ch3 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_OVF_CNT_RST_CH3_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_ovf_cnt_rst_ch4 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_OVF_CNT_RST_CH4_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_ovf_cnt_rst_ch5 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_OVF_CNT_RST_CH5_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_ovf_cnt_rst_ch6 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_OVF_CNT_RST_CH6_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_ovf_cnt_rst_ch7 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_OVF_CNT_RST_CH7_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer0_rst trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER0_RST_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer1_rst trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER1_RST_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer2_rst trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER2_RST_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer3_rst trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER3_RST_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer0_resume trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER0_RESUME_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer1_resume trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER1_RESUME_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer2_resume trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER2_RESUME_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer3_resume trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER3_RESUME_ST_CLR: u1,
    }),
    /// Tasks trigger status register
    /// offset: 0x1f8
    TASK_ST2: mmio.Mmio(packed struct(u32) {
        /// Represents LEDC_task_timer0_pause trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER0_PAUSE_ST: u1,
        /// Represents LEDC_task_timer1_pause trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER1_PAUSE_ST: u1,
        /// Represents LEDC_task_timer2_pause trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER2_PAUSE_ST: u1,
        /// Represents LEDC_task_timer3_pause trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_TIMER3_PAUSE_ST: u1,
        /// Represents LEDC_task_gamma_restart_ch0 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESTART_CH0_ST: u1,
        /// Represents LEDC_task_gamma_restart_ch1 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESTART_CH1_ST: u1,
        /// Represents LEDC_task_gamma_restart_ch2 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESTART_CH2_ST: u1,
        /// Represents LEDC_task_gamma_restart_ch3 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESTART_CH3_ST: u1,
        /// Represents LEDC_task_gamma_restart_ch4 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESTART_CH4_ST: u1,
        /// Represents LEDC_task_gamma_restart_ch5 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESTART_CH5_ST: u1,
        /// Represents LEDC_task_gamma_restart_ch6 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESTART_CH6_ST: u1,
        /// Represents LEDC_task_gamma_restart_ch7 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESTART_CH7_ST: u1,
        /// Represents LEDC_task_gamma_pause_ch0 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_PAUSE_CH0_ST: u1,
        /// Represents LEDC_task_gamma_pause_ch1 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_PAUSE_CH1_ST: u1,
        /// Represents LEDC_task_gamma_pause_ch2 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_PAUSE_CH2_ST: u1,
        /// Represents LEDC_task_gamma_pause_ch3 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_PAUSE_CH3_ST: u1,
        /// Represents LEDC_task_gamma_pause_ch4 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_PAUSE_CH4_ST: u1,
        /// Represents LEDC_task_gamma_pause_ch5 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_PAUSE_CH5_ST: u1,
        /// Represents LEDC_task_gamma_pause_ch6 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_PAUSE_CH6_ST: u1,
        /// Represents LEDC_task_gamma_pause_ch7 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_PAUSE_CH7_ST: u1,
        /// Represents LEDC_task_gamma_resume_ch0 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESUME_CH0_ST: u1,
        /// Represents LEDC_task_gamma_resume_ch1 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESUME_CH1_ST: u1,
        /// Represents LEDC_task_gamma_resume_ch2 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESUME_CH2_ST: u1,
        /// Represents LEDC_task_gamma_resume_ch3 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESUME_CH3_ST: u1,
        /// Represents LEDC_task_gamma_resume_ch4 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESUME_CH4_ST: u1,
        /// Represents LEDC_task_gamma_resume_ch5 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESUME_CH5_ST: u1,
        /// Represents LEDC_task_gamma_resume_ch6 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESUME_CH6_ST: u1,
        /// Represents LEDC_task_gamma_resume_ch7 trigger status.\\0: Not triggered\\1: Triggered
        LEDC_TASK_GAMMA_RESUME_CH7_ST: u1,
        /// Represents TG0_task_cnt_start_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG0_TASK_CNT_START_TIMER0_ST: u1,
        /// Represents TG0_task_alarm_start_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG0_TASK_ALARM_START_TIMER0_ST: u1,
        /// Represents TG0_task_cnt_stop_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG0_TASK_CNT_STOP_TIMER0_ST: u1,
        /// Represents TG0_task_cnt_reload_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG0_TASK_CNT_RELOAD_TIMER0_ST: u1,
    }),
    /// Tasks trigger status clear register
    /// offset: 0x1fc
    TASK_ST2_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear LEDC_task_timer0_pause trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER0_PAUSE_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer1_pause trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER1_PAUSE_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer2_pause trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER2_PAUSE_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_timer3_pause trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_TIMER3_PAUSE_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_restart_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESTART_CH0_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_restart_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESTART_CH1_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_restart_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESTART_CH2_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_restart_ch3 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESTART_CH3_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_restart_ch4 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESTART_CH4_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_restart_ch5 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESTART_CH5_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_restart_ch6 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESTART_CH6_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_restart_ch7 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESTART_CH7_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_pause_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_PAUSE_CH0_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_pause_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_PAUSE_CH1_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_pause_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_PAUSE_CH2_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_pause_ch3 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_PAUSE_CH3_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_pause_ch4 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_PAUSE_CH4_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_pause_ch5 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_PAUSE_CH5_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_pause_ch6 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_PAUSE_CH6_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_pause_ch7 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_PAUSE_CH7_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_resume_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESUME_CH0_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_resume_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESUME_CH1_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_resume_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESUME_CH2_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_resume_ch3 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESUME_CH3_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_resume_ch4 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESUME_CH4_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_resume_ch5 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESUME_CH5_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_resume_ch6 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESUME_CH6_ST_CLR: u1,
        /// Configures whether or not to clear LEDC_task_gamma_resume_ch7 trigger status.\\0: Invalid, No effect\\1: Clear
        LEDC_TASK_GAMMA_RESUME_CH7_ST_CLR: u1,
        /// Configures whether or not to clear TG0_task_cnt_start_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_TASK_CNT_START_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG0_task_alarm_start_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_TASK_ALARM_START_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG0_task_cnt_stop_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_TASK_CNT_STOP_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG0_task_cnt_reload_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_TASK_CNT_RELOAD_TIMER0_ST_CLR: u1,
    }),
    /// Tasks trigger status register
    /// offset: 0x200
    TASK_ST3: mmio.Mmio(packed struct(u32) {
        /// Represents TG0_task_cnt_cap_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG0_TASK_CNT_CAP_TIMER0_ST: u1,
        /// Represents TG0_task_cnt_start_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG0_TASK_CNT_START_TIMER1_ST: u1,
        /// Represents TG0_task_alarm_start_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG0_TASK_ALARM_START_TIMER1_ST: u1,
        /// Represents TG0_task_cnt_stop_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG0_TASK_CNT_STOP_TIMER1_ST: u1,
        /// Represents TG0_task_cnt_reload_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG0_TASK_CNT_RELOAD_TIMER1_ST: u1,
        /// Represents TG0_task_cnt_cap_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG0_TASK_CNT_CAP_TIMER1_ST: u1,
        /// Represents TG1_task_cnt_start_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG1_TASK_CNT_START_TIMER0_ST: u1,
        /// Represents TG1_task_alarm_start_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG1_TASK_ALARM_START_TIMER0_ST: u1,
        /// Represents TG1_task_cnt_stop_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG1_TASK_CNT_STOP_TIMER0_ST: u1,
        /// Represents TG1_task_cnt_reload_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG1_TASK_CNT_RELOAD_TIMER0_ST: u1,
        /// Represents TG1_task_cnt_cap_timer0 trigger status.\\0: Not triggered\\1: Triggered
        TG1_TASK_CNT_CAP_TIMER0_ST: u1,
        /// Represents TG1_task_cnt_start_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG1_TASK_CNT_START_TIMER1_ST: u1,
        /// Represents TG1_task_alarm_start_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG1_TASK_ALARM_START_TIMER1_ST: u1,
        /// Represents TG1_task_cnt_stop_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG1_TASK_CNT_STOP_TIMER1_ST: u1,
        /// Represents TG1_task_cnt_reload_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG1_TASK_CNT_RELOAD_TIMER1_ST: u1,
        /// Represents TG1_task_cnt_cap_timer1 trigger status.\\0: Not triggered\\1: Triggered
        TG1_TASK_CNT_CAP_TIMER1_ST: u1,
        /// Represents MCPWM0_task_cmpr0_a_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CMPR0_A_UP_ST: u1,
        /// Represents MCPWM0_task_cmpr1_a_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CMPR1_A_UP_ST: u1,
        /// Represents MCPWM0_task_cmpr2_a_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CMPR2_A_UP_ST: u1,
        /// Represents MCPWM0_task_cmpr0_b_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CMPR0_B_UP_ST: u1,
        /// Represents MCPWM0_task_cmpr1_b_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CMPR1_B_UP_ST: u1,
        /// Represents MCPWM0_task_cmpr2_b_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CMPR2_B_UP_ST: u1,
        /// Represents MCPWM0_task_gen_stop trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_GEN_STOP_ST: u1,
        /// Represents MCPWM0_task_timer0_syn trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_TIMER0_SYN_ST: u1,
        /// Represents MCPWM0_task_timer1_syn trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_TIMER1_SYN_ST: u1,
        /// Represents MCPWM0_task_timer2_syn trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_TIMER2_SYN_ST: u1,
        /// Represents MCPWM0_task_timer0_period_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_TIMER0_PERIOD_UP_ST: u1,
        /// Represents MCPWM0_task_timer1_period_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_TIMER1_PERIOD_UP_ST: u1,
        /// Represents MCPWM0_task_timer2_period_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_TIMER2_PERIOD_UP_ST: u1,
        /// Represents MCPWM0_task_tz0_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_TZ0_OST_ST: u1,
        /// Represents MCPWM0_task_tz1_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_TZ1_OST_ST: u1,
        /// Represents MCPWM0_task_tz2_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_TZ2_OST_ST: u1,
    }),
    /// Tasks trigger status clear register
    /// offset: 0x204
    TASK_ST3_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear TG0_task_cnt_cap_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_TASK_CNT_CAP_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG0_task_cnt_start_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_TASK_CNT_START_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear TG0_task_alarm_start_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_TASK_ALARM_START_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear TG0_task_cnt_stop_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_TASK_CNT_STOP_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear TG0_task_cnt_reload_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_TASK_CNT_RELOAD_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear TG0_task_cnt_cap_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG0_TASK_CNT_CAP_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear TG1_task_cnt_start_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_TASK_CNT_START_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG1_task_alarm_start_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_TASK_ALARM_START_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG1_task_cnt_stop_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_TASK_CNT_STOP_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG1_task_cnt_reload_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_TASK_CNT_RELOAD_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG1_task_cnt_cap_timer0 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_TASK_CNT_CAP_TIMER0_ST_CLR: u1,
        /// Configures whether or not to clear TG1_task_cnt_start_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_TASK_CNT_START_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear TG1_task_alarm_start_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_TASK_ALARM_START_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear TG1_task_cnt_stop_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_TASK_CNT_STOP_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear TG1_task_cnt_reload_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_TASK_CNT_RELOAD_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear TG1_task_cnt_cap_timer1 trigger status.\\0: Invalid, No effect\\1: Clear
        TG1_TASK_CNT_CAP_TIMER1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_cmpr0_a_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CMPR0_A_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_cmpr1_a_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CMPR1_A_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_cmpr2_a_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CMPR2_A_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_cmpr0_b_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CMPR0_B_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_cmpr1_b_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CMPR1_B_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_cmpr2_b_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CMPR2_B_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_gen_stop trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_GEN_STOP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_timer0_syn trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_TIMER0_SYN_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_timer1_syn trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_TIMER1_SYN_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_timer2_syn trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_TIMER2_SYN_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_timer0_period_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_TIMER0_PERIOD_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_timer1_period_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_TIMER1_PERIOD_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_timer2_period_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_TIMER2_PERIOD_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_tz0_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_TZ0_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_tz1_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_TZ1_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_tz2_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_TZ2_OST_ST_CLR: u1,
    }),
    /// Tasks trigger status register
    /// offset: 0x208
    TASK_ST4: mmio.Mmio(packed struct(u32) {
        /// Represents MCPWM0_task_clr0_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CLR0_OST_ST: u1,
        /// Represents MCPWM0_task_clr1_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CLR1_OST_ST: u1,
        /// Represents MCPWM0_task_clr2_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CLR2_OST_ST: u1,
        /// Represents MCPWM0_task_cap0 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CAP0_ST: u1,
        /// Represents MCPWM0_task_cap1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CAP1_ST: u1,
        /// Represents MCPWM0_task_cap2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM0_TASK_CAP2_ST: u1,
        /// Represents MCPWM1_task_cmpr0_a_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CMPR0_A_UP_ST: u1,
        /// Represents MCPWM1_task_cmpr1_a_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CMPR1_A_UP_ST: u1,
        /// Represents MCPWM1_task_cmpr2_a_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CMPR2_A_UP_ST: u1,
        /// Represents MCPWM1_task_cmpr0_b_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CMPR0_B_UP_ST: u1,
        /// Represents MCPWM1_task_cmpr1_b_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CMPR1_B_UP_ST: u1,
        /// Represents MCPWM1_task_cmpr2_b_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CMPR2_B_UP_ST: u1,
        /// Represents MCPWM1_task_gen_stop trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_GEN_STOP_ST: u1,
        /// Represents MCPWM1_task_timer0_syn trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_TIMER0_SYN_ST: u1,
        /// Represents MCPWM1_task_timer1_syn trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_TIMER1_SYN_ST: u1,
        /// Represents MCPWM1_task_timer2_syn trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_TIMER2_SYN_ST: u1,
        /// Represents MCPWM1_task_timer0_period_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_TIMER0_PERIOD_UP_ST: u1,
        /// Represents MCPWM1_task_timer1_period_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_TIMER1_PERIOD_UP_ST: u1,
        /// Represents MCPWM1_task_timer2_period_up trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_TIMER2_PERIOD_UP_ST: u1,
        /// Represents MCPWM1_task_tz0_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_TZ0_OST_ST: u1,
        /// Represents MCPWM1_task_tz1_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_TZ1_OST_ST: u1,
        /// Represents MCPWM1_task_tz2_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_TZ2_OST_ST: u1,
        /// Represents MCPWM1_task_clr0_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CLR0_OST_ST: u1,
        /// Represents MCPWM1_task_clr1_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CLR1_OST_ST: u1,
        /// Represents MCPWM1_task_clr2_ost trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CLR2_OST_ST: u1,
        /// Represents MCPWM1_task_cap0 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CAP0_ST: u1,
        /// Represents MCPWM1_task_cap1 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CAP1_ST: u1,
        /// Represents MCPWM1_task_cap2 trigger status.\\0: Not triggered\\1: Triggered
        MCPWM1_TASK_CAP2_ST: u1,
        /// Represents ADC_task_sample0 trigger status.\\0: Not triggered\\1: Triggered
        ADC_TASK_SAMPLE0_ST: u1,
        /// Represents ADC_task_sample1 trigger status.\\0: Not triggered\\1: Triggered
        ADC_TASK_SAMPLE1_ST: u1,
        /// Represents ADC_task_start0 trigger status.\\0: Not triggered\\1: Triggered
        ADC_TASK_START0_ST: u1,
        /// Represents ADC_task_stop0 trigger status.\\0: Not triggered\\1: Triggered
        ADC_TASK_STOP0_ST: u1,
    }),
    /// Tasks trigger status clear register
    /// offset: 0x20c
    TASK_ST4_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear MCPWM0_task_clr0_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CLR0_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_clr1_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CLR1_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_clr2_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CLR2_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_cap0 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CAP0_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_cap1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CAP1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM0_task_cap2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM0_TASK_CAP2_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_cmpr0_a_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CMPR0_A_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_cmpr1_a_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CMPR1_A_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_cmpr2_a_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CMPR2_A_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_cmpr0_b_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CMPR0_B_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_cmpr1_b_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CMPR1_B_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_cmpr2_b_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CMPR2_B_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_gen_stop trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_GEN_STOP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_timer0_syn trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_TIMER0_SYN_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_timer1_syn trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_TIMER1_SYN_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_timer2_syn trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_TIMER2_SYN_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_timer0_period_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_TIMER0_PERIOD_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_timer1_period_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_TIMER1_PERIOD_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_timer2_period_up trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_TIMER2_PERIOD_UP_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_tz0_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_TZ0_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_tz1_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_TZ1_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_tz2_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_TZ2_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_clr0_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CLR0_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_clr1_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CLR1_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_clr2_ost trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CLR2_OST_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_cap0 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CAP0_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_cap1 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CAP1_ST_CLR: u1,
        /// Configures whether or not to clear MCPWM1_task_cap2 trigger status.\\0: Invalid, No effect\\1: Clear
        MCPWM1_TASK_CAP2_ST_CLR: u1,
        /// Configures whether or not to clear ADC_task_sample0 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_TASK_SAMPLE0_ST_CLR: u1,
        /// Configures whether or not to clear ADC_task_sample1 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_TASK_SAMPLE1_ST_CLR: u1,
        /// Configures whether or not to clear ADC_task_start0 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_TASK_START0_ST_CLR: u1,
        /// Configures whether or not to clear ADC_task_stop0 trigger status.\\0: Invalid, No effect\\1: Clear
        ADC_TASK_STOP0_ST_CLR: u1,
    }),
    /// Tasks trigger status register
    /// offset: 0x210
    TASK_ST5: mmio.Mmio(packed struct(u32) {
        /// Represents REGDMA_task_start0 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_TASK_START0_ST: u1,
        /// Represents REGDMA_task_start1 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_TASK_START1_ST: u1,
        /// Represents REGDMA_task_start2 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_TASK_START2_ST: u1,
        /// Represents REGDMA_task_start3 trigger status.\\0: Not triggered\\1: Triggered
        REGDMA_TASK_START3_ST: u1,
        /// Represents TMPSNSR_task_start_sample trigger status.\\0: Not triggered\\1: Triggered
        TMPSNSR_TASK_START_SAMPLE_ST: u1,
        /// Represents TMPSNSR_task_stop_sample trigger status.\\0: Not triggered\\1: Triggered
        TMPSNSR_TASK_STOP_SAMPLE_ST: u1,
        /// Represents I2S0_task_start_rx trigger status.\\0: Not triggered\\1: Triggered
        I2S0_TASK_START_RX_ST: u1,
        /// Represents I2S0_task_start_tx trigger status.\\0: Not triggered\\1: Triggered
        I2S0_TASK_START_TX_ST: u1,
        /// Represents I2S0_task_stop_rx trigger status.\\0: Not triggered\\1: Triggered
        I2S0_TASK_STOP_RX_ST: u1,
        /// Represents I2S0_task_stop_tx trigger status.\\0: Not triggered\\1: Triggered
        I2S0_TASK_STOP_TX_ST: u1,
        /// Represents I2S1_task_start_rx trigger status.\\0: Not triggered\\1: Triggered
        I2S1_TASK_START_RX_ST: u1,
        /// Represents I2S1_task_start_tx trigger status.\\0: Not triggered\\1: Triggered
        I2S1_TASK_START_TX_ST: u1,
        /// Represents I2S1_task_stop_rx trigger status.\\0: Not triggered\\1: Triggered
        I2S1_TASK_STOP_RX_ST: u1,
        /// Represents I2S1_task_stop_tx trigger status.\\0: Not triggered\\1: Triggered
        I2S1_TASK_STOP_TX_ST: u1,
        /// Represents I2S2_task_start_rx trigger status.\\0: Not triggered\\1: Triggered
        I2S2_TASK_START_RX_ST: u1,
        /// Represents I2S2_task_start_tx trigger status.\\0: Not triggered\\1: Triggered
        I2S2_TASK_START_TX_ST: u1,
        /// Represents I2S2_task_stop_rx trigger status.\\0: Not triggered\\1: Triggered
        I2S2_TASK_STOP_RX_ST: u1,
        /// Represents I2S2_task_stop_tx trigger status.\\0: Not triggered\\1: Triggered
        I2S2_TASK_STOP_TX_ST: u1,
        /// Represents ULP_task_wakeup_cpu trigger status.\\0: Not triggered\\1: Triggered
        ULP_TASK_WAKEUP_CPU_ST: u1,
        /// Represents ULP_task_int_cpu trigger status.\\0: Not triggered\\1: Triggered
        ULP_TASK_INT_CPU_ST: u1,
        /// Represents RTC_task_start trigger status.\\0: Not triggered\\1: Triggered
        RTC_TASK_START_ST: u1,
        /// Represents RTC_task_stop trigger status.\\0: Not triggered\\1: Triggered
        RTC_TASK_STOP_ST: u1,
        /// Represents RTC_task_clr trigger status.\\0: Not triggered\\1: Triggered
        RTC_TASK_CLR_ST: u1,
        /// Represents RTC_task_triggerflw trigger status.\\0: Not triggered\\1: Triggered
        RTC_TASK_TRIGGERFLW_ST: u1,
        /// Represents PDMA_AHB_task_in_start_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_TASK_IN_START_CH0_ST: u1,
        /// Represents PDMA_AHB_task_in_start_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_TASK_IN_START_CH1_ST: u1,
        /// Represents PDMA_AHB_task_in_start_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_TASK_IN_START_CH2_ST: u1,
        /// Represents PDMA_AHB_task_out_start_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_TASK_OUT_START_CH0_ST: u1,
        /// Represents PDMA_AHB_task_out_start_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_TASK_OUT_START_CH1_ST: u1,
        /// Represents PDMA_AHB_task_out_start_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AHB_TASK_OUT_START_CH2_ST: u1,
        /// Represents PDMA_AXI_task_in_start_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_TASK_IN_START_CH0_ST: u1,
        /// Represents PDMA_AXI_task_in_start_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_TASK_IN_START_CH1_ST: u1,
    }),
    /// Tasks trigger status clear register
    /// offset: 0x214
    TASK_ST5_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear REGDMA_task_start0 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_TASK_START0_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_task_start1 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_TASK_START1_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_task_start2 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_TASK_START2_ST_CLR: u1,
        /// Configures whether or not to clear REGDMA_task_start3 trigger status.\\0: Invalid, No effect\\1: Clear
        REGDMA_TASK_START3_ST_CLR: u1,
        /// Configures whether or not to clear TMPSNSR_task_start_sample trigger status.\\0: Invalid, No effect\\1: Clear
        TMPSNSR_TASK_START_SAMPLE_ST_CLR: u1,
        /// Configures whether or not to clear TMPSNSR_task_stop_sample trigger status.\\0: Invalid, No effect\\1: Clear
        TMPSNSR_TASK_STOP_SAMPLE_ST_CLR: u1,
        /// Configures whether or not to clear I2S0_task_start_rx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S0_TASK_START_RX_ST_CLR: u1,
        /// Configures whether or not to clear I2S0_task_start_tx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S0_TASK_START_TX_ST_CLR: u1,
        /// Configures whether or not to clear I2S0_task_stop_rx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S0_TASK_STOP_RX_ST_CLR: u1,
        /// Configures whether or not to clear I2S0_task_stop_tx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S0_TASK_STOP_TX_ST_CLR: u1,
        /// Configures whether or not to clear I2S1_task_start_rx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S1_TASK_START_RX_ST_CLR: u1,
        /// Configures whether or not to clear I2S1_task_start_tx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S1_TASK_START_TX_ST_CLR: u1,
        /// Configures whether or not to clear I2S1_task_stop_rx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S1_TASK_STOP_RX_ST_CLR: u1,
        /// Configures whether or not to clear I2S1_task_stop_tx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S1_TASK_STOP_TX_ST_CLR: u1,
        /// Configures whether or not to clear I2S2_task_start_rx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S2_TASK_START_RX_ST_CLR: u1,
        /// Configures whether or not to clear I2S2_task_start_tx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S2_TASK_START_TX_ST_CLR: u1,
        /// Configures whether or not to clear I2S2_task_stop_rx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S2_TASK_STOP_RX_ST_CLR: u1,
        /// Configures whether or not to clear I2S2_task_stop_tx trigger status.\\0: Invalid, No effect\\1: Clear
        I2S2_TASK_STOP_TX_ST_CLR: u1,
        /// Configures whether or not to clear ULP_task_wakeup_cpu trigger status.\\0: Invalid, No effect\\1: Clear
        ULP_TASK_WAKEUP_CPU_ST_CLR: u1,
        /// Configures whether or not to clear ULP_task_int_cpu trigger status.\\0: Invalid, No effect\\1: Clear
        ULP_TASK_INT_CPU_ST_CLR: u1,
        /// Configures whether or not to clear RTC_task_start trigger status.\\0: Invalid, No effect\\1: Clear
        RTC_TASK_START_ST_CLR: u1,
        /// Configures whether or not to clear RTC_task_stop trigger status.\\0: Invalid, No effect\\1: Clear
        RTC_TASK_STOP_ST_CLR: u1,
        /// Configures whether or not to clear RTC_task_clr trigger status.\\0: Invalid, No effect\\1: Clear
        RTC_TASK_CLR_ST_CLR: u1,
        /// Configures whether or not to clear RTC_task_triggerflw trigger status.\\0: Invalid, No effect\\1: Clear
        RTC_TASK_TRIGGERFLW_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_task_in_start_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_TASK_IN_START_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_task_in_start_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_TASK_IN_START_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_task_in_start_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_TASK_IN_START_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_task_out_start_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_TASK_OUT_START_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_task_out_start_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_TASK_OUT_START_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AHB_task_out_start_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AHB_TASK_OUT_START_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_task_in_start_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_TASK_IN_START_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_task_in_start_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_TASK_IN_START_CH1_ST_CLR: u1,
    }),
    /// Tasks trigger status register
    /// offset: 0x218
    TASK_ST6: mmio.Mmio(packed struct(u32) {
        /// Represents PDMA_AXI_task_in_start_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_TASK_IN_START_CH2_ST: u1,
        /// Represents PDMA_AXI_task_out_start_ch0 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_TASK_OUT_START_CH0_ST: u1,
        /// Represents PDMA_AXI_task_out_start_ch1 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_TASK_OUT_START_CH1_ST: u1,
        /// Represents PDMA_AXI_task_out_start_ch2 trigger status.\\0: Not triggered\\1: Triggered
        PDMA_AXI_TASK_OUT_START_CH2_ST: u1,
        /// Represents PMU_task_sleep_req trigger status.\\0: Not triggered\\1: Triggered
        PMU_TASK_SLEEP_REQ_ST: u1,
        /// Represents DMA2D_task_in_start_ch0 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_TASK_IN_START_CH0_ST: u1,
        /// Represents DMA2D_task_in_start_ch1 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_TASK_IN_START_CH1_ST: u1,
        /// Represents DMA2D_task_in_dscr_ready_ch0 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_TASK_IN_DSCR_READY_CH0_ST: u1,
        /// Represents DMA2D_task_in_dscr_ready_ch1 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_TASK_IN_DSCR_READY_CH1_ST: u1,
        /// Represents DMA2D_task_out_start_ch0 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_TASK_OUT_START_CH0_ST: u1,
        /// Represents DMA2D_task_out_start_ch1 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_TASK_OUT_START_CH1_ST: u1,
        /// Represents DMA2D_task_out_start_ch2 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_TASK_OUT_START_CH2_ST: u1,
        /// Represents DMA2D_task_out_dscr_ready_ch0 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_TASK_OUT_DSCR_READY_CH0_ST: u1,
        /// Represents DMA2D_task_out_dscr_ready_ch1 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_TASK_OUT_DSCR_READY_CH1_ST: u1,
        /// Represents DMA2D_task_out_dscr_ready_ch2 trigger status.\\0: Not triggered\\1: Triggered
        DMA2D_TASK_OUT_DSCR_READY_CH2_ST: u1,
        padding: u17 = 0,
    }),
    /// Tasks trigger status clear register
    /// offset: 0x21c
    TASK_ST6_CLR: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to clear PDMA_AXI_task_in_start_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_TASK_IN_START_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_task_out_start_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_TASK_OUT_START_CH0_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_task_out_start_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_TASK_OUT_START_CH1_ST_CLR: u1,
        /// Configures whether or not to clear PDMA_AXI_task_out_start_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        PDMA_AXI_TASK_OUT_START_CH2_ST_CLR: u1,
        /// Configures whether or not to clear PMU_task_sleep_req trigger status.\\0: Invalid, No effect\\1: Clear
        PMU_TASK_SLEEP_REQ_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_task_in_start_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_TASK_IN_START_CH0_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_task_in_start_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_TASK_IN_START_CH1_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_task_in_dscr_ready_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_TASK_IN_DSCR_READY_CH0_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_task_in_dscr_ready_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_TASK_IN_DSCR_READY_CH1_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_task_out_start_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_TASK_OUT_START_CH0_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_task_out_start_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_TASK_OUT_START_CH1_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_task_out_start_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_TASK_OUT_START_CH2_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_task_out_dscr_ready_ch0 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_TASK_OUT_DSCR_READY_CH0_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_task_out_dscr_ready_ch1 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_TASK_OUT_DSCR_READY_CH1_ST_CLR: u1,
        /// Configures whether or not to clear DMA2D_task_out_dscr_ready_ch2 trigger status.\\0: Invalid, No effect\\1: Clear
        DMA2D_TASK_OUT_DSCR_READY_CH2_ST_CLR: u1,
        padding: u17 = 0,
    }),
    /// ETM clock enable register
    /// offset: 0x220
    CLK_EN: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to open register clock gate.\\0: Open the clock gate only when application writes registers\\1: Force open the clock gate for register
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// ETM date register
    /// offset: 0x224
    DATE: mmio.Mmio(packed struct(u32) {
        /// Configures the version.
        DATE: u28,
        padding: u4 = 0,
    }),
};
