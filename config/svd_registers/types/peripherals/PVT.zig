const mmio = @import("mmio");
const types = @import("../../types.zig");

/// PVT Peripheral
pub const PVT = extern struct {
    /// select valid pvt channel
    /// offset: 0x00
    PMUP_BITMAP_HIGH0: mmio.Mmio(packed struct(u32) {
        /// select valid high channel0
        PUMP_BITMAP_HIGH0: u32,
    }),
    /// select valid pvt channel
    /// offset: 0x04
    PMUP_BITMAP_HIGH1: mmio.Mmio(packed struct(u32) {
        /// select valid high channel1
        PUMP_BITMAP_HIGH1: u32,
    }),
    /// select valid pvt channel
    /// offset: 0x08
    PMUP_BITMAP_HIGH2: mmio.Mmio(packed struct(u32) {
        /// select valid high channel2
        PUMP_BITMAP_HIGH2: u32,
    }),
    /// select valid pvt channel
    /// offset: 0x0c
    PMUP_BITMAP_HIGH3: mmio.Mmio(packed struct(u32) {
        /// select valid high channel3
        PUMP_BITMAP_HIGH3: u32,
    }),
    /// select valid pvt channel
    /// offset: 0x10
    PMUP_BITMAP_HIGH4: mmio.Mmio(packed struct(u32) {
        /// select valid high channel4
        PUMP_BITMAP_HIGH4: u32,
    }),
    /// select valid pvt channel
    /// offset: 0x14
    PMUP_BITMAP_LOW0: mmio.Mmio(packed struct(u32) {
        /// select valid low channel0
        PUMP_BITMAP_LOW0: u32,
    }),
    /// select valid pvt channel
    /// offset: 0x18
    PMUP_BITMAP_LOW1: mmio.Mmio(packed struct(u32) {
        /// select valid low channel1
        PUMP_BITMAP_LOW1: u32,
    }),
    /// select valid pvt channel
    /// offset: 0x1c
    PMUP_BITMAP_LOW2: mmio.Mmio(packed struct(u32) {
        /// select valid low channel2
        PUMP_BITMAP_LOW2: u32,
    }),
    /// select valid pvt channel
    /// offset: 0x20
    PMUP_BITMAP_LOW3: mmio.Mmio(packed struct(u32) {
        /// select valid low channel3
        PUMP_BITMAP_LOW3: u32,
    }),
    /// select valid pvt channel
    /// offset: 0x24
    PMUP_BITMAP_LOW4: mmio.Mmio(packed struct(u32) {
        /// select valid low channel4
        PUMP_BITMAP_LOW4: u32,
    }),
    /// configure pump drv
    /// offset: 0x28
    PMUP_DRV_CFG: mmio.Mmio(packed struct(u32) {
        reserved9: u9 = 0,
        /// configure pvt charge xpd
        PUMP_EN: u1,
        /// force register clken
        CLK_EN: u1,
        /// configure cmd4 drv
        PUMP_DRV4: u4,
        /// configure cmd3 drv
        PUMP_DRV3: u4,
        /// configure cmd2 drv
        PUMP_DRV2: u4,
        /// configure cmd1 drv
        PUMP_DRV1: u4,
        /// configure cmd0 drv
        PUMP_DRV0: u4,
        padding: u1 = 0,
    }),
    /// configure the code of valid pump channel code
    /// offset: 0x2c
    PMUP_CHANNEL_CFG: mmio.Mmio(packed struct(u32) {
        reserved7: u7 = 0,
        /// configure cmd4 code
        PUMP_CHANNEL_CODE4: u5,
        /// configure cmd3 code
        PUMP_CHANNEL_CODE3: u5,
        /// configure cmd2 code
        PUMP_CHANNEL_CODE2: u5,
        /// configure cmd1 code
        PUMP_CHANNEL_CODE1: u5,
        /// configure cmd0 code
        PUMP_CHANNEL_CODE0: u5,
    }),
    /// configure pvt clk
    /// offset: 0x30
    CLK_CFG: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        PUMP_CLK_DIV_NUM: u8,
        /// needs field desc
        MONITOR_CLK_PVT_EN: u1,
        reserved31: u22 = 0,
        /// select pvt clk
        CLK_SEL: u1,
    }),
    /// needs desc
    /// offset: 0x34
    DBIAS_CHANNEL_SEL0: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// needs field desc
        DBIAS_CHANNEL3_SEL: u7,
        /// needs field desc
        DBIAS_CHANNEL2_SEL: u7,
        /// needs field desc
        DBIAS_CHANNEL1_SEL: u7,
        /// needs field desc
        DBIAS_CHANNEL0_SEL: u7,
    }),
    /// needs desc
    /// offset: 0x38
    DBIAS_CHANNEL_SEL1: mmio.Mmio(packed struct(u32) {
        reserved25: u25 = 0,
        /// needs field desc
        DBIAS_CHANNEL4_SEL: u7,
    }),
    /// needs desc
    /// offset: 0x3c
    DBIAS_CHANNEL0_SEL: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        DBIAS_CHANNEL0_CFG: u17,
        padding: u15 = 0,
    }),
    /// needs desc
    /// offset: 0x40
    DBIAS_CHANNEL1_SEL: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        DBIAS_CHANNEL1_CFG: u17,
        padding: u15 = 0,
    }),
    /// needs desc
    /// offset: 0x44
    DBIAS_CHANNEL2_SEL: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        DBIAS_CHANNEL2_CFG: u17,
        padding: u15 = 0,
    }),
    /// needs desc
    /// offset: 0x48
    DBIAS_CHANNEL3_SEL: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        DBIAS_CHANNEL3_CFG: u17,
        padding: u15 = 0,
    }),
    /// needs desc
    /// offset: 0x4c
    DBIAS_CHANNEL4_SEL: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        DBIAS_CHANNEL4_CFG: u17,
        padding: u15 = 0,
    }),
    /// needs desc
    /// offset: 0x50
    DBIAS_CMD0: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        DBIAS_CMD0: u17,
        padding: u15 = 0,
    }),
    /// needs desc
    /// offset: 0x54
    DBIAS_CMD1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        DBIAS_CMD1: u17,
        padding: u15 = 0,
    }),
    /// needs desc
    /// offset: 0x58
    DBIAS_CMD2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        DBIAS_CMD2: u17,
        padding: u15 = 0,
    }),
    /// needs desc
    /// offset: 0x5c
    DBIAS_CMD3: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        DBIAS_CMD3: u17,
        padding: u15 = 0,
    }),
    /// needs desc
    /// offset: 0x60
    DBIAS_CMD4: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        DBIAS_CMD4: u17,
        padding: u15 = 0,
    }),
    /// needs desc
    /// offset: 0x64
    DBIAS_TIMER: mmio.Mmio(packed struct(u32) {
        reserved15: u15 = 0,
        /// needs field desc
        TIMER_TARGET: u16,
        /// needs field desc
        TIMER_EN: u1,
    }),
    /// needs desc
    /// offset: 0x68
    COMB_PD_SITE0_UNIT0_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE0_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE0_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE0_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE0_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE0_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0x6c
    COMB_PD_SITE0_UNIT1_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE0_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE0_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE0_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE0_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE0_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0x70
    COMB_PD_SITE0_UNIT2_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE0_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE0_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE0_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE0_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE0_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0x74
    COMB_PD_SITE0_UNIT3_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE0_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE0_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE0_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE0_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE0_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0x78
    COMB_PD_SITE0_UNIT0_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE0_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE0_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE0_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE0_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE0_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0x7c
    COMB_PD_SITE0_UNIT1_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE0_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE0_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE0_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE0_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE0_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0x80
    COMB_PD_SITE0_UNIT2_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE0_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE0_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE0_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE0_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE0_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0x84
    COMB_PD_SITE0_UNIT3_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE0_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE0_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE0_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE0_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE0_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0x88
    COMB_PD_SITE0_UNIT0_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE0_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE0_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE0_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE0_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE0_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0x8c
    COMB_PD_SITE0_UNIT1_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE0_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE0_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE0_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE0_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE0_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0x90
    COMB_PD_SITE0_UNIT2_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE0_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE0_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE0_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE0_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE0_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0x94
    COMB_PD_SITE0_UNIT3_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE0_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE0_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE0_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE0_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE0_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0x98
    COMB_PD_SITE1_UNIT0_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE1_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE1_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE1_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE1_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE1_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0x9c
    COMB_PD_SITE1_UNIT1_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE1_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE1_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE1_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE1_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE1_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0xa0
    COMB_PD_SITE1_UNIT2_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE1_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE1_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE1_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE1_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE1_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0xa4
    COMB_PD_SITE1_UNIT3_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE1_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE1_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE1_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE1_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE1_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0xa8
    COMB_PD_SITE1_UNIT0_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE1_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE1_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE1_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE1_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE1_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0xac
    COMB_PD_SITE1_UNIT1_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE1_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE1_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE1_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE1_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE1_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0xb0
    COMB_PD_SITE1_UNIT2_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE1_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE1_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE1_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE1_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE1_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0xb4
    COMB_PD_SITE1_UNIT3_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE1_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE1_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE1_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE1_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE1_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0xb8
    COMB_PD_SITE1_UNIT0_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE1_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE1_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE1_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE1_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE1_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0xbc
    COMB_PD_SITE1_UNIT1_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE1_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE1_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE1_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE1_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE1_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0xc0
    COMB_PD_SITE1_UNIT2_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE1_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE1_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE1_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE1_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE1_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0xc4
    COMB_PD_SITE1_UNIT3_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE1_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE1_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE1_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE1_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE1_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0xc8
    COMB_PD_SITE2_UNIT0_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE2_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE2_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE2_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE2_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE2_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0xcc
    COMB_PD_SITE2_UNIT1_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE2_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE2_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE2_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE2_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE2_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0xd0
    COMB_PD_SITE2_UNIT2_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE2_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE2_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE2_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE2_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE2_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0xd4
    COMB_PD_SITE2_UNIT3_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE2_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE2_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE2_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE2_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE2_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0xd8
    COMB_PD_SITE2_UNIT0_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE2_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE2_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE2_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE2_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE2_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0xdc
    COMB_PD_SITE2_UNIT1_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE2_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE2_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE2_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE2_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE2_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0xe0
    COMB_PD_SITE2_UNIT2_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE2_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE2_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE2_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE2_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE2_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0xe4
    COMB_PD_SITE2_UNIT3_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE2_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE2_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE2_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE2_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE2_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0xe8
    COMB_PD_SITE2_UNIT0_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE2_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE2_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE2_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE2_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE2_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0xec
    COMB_PD_SITE2_UNIT1_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE2_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE2_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE2_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE2_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE2_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0xf0
    COMB_PD_SITE2_UNIT2_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE2_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE2_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE2_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE2_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE2_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0xf4
    COMB_PD_SITE2_UNIT3_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE2_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE2_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE2_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE2_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE2_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0xf8
    COMB_PD_SITE3_UNIT0_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE3_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE3_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE3_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE3_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE3_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0xfc
    COMB_PD_SITE3_UNIT1_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE3_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE3_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE3_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE3_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE3_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0x100
    COMB_PD_SITE3_UNIT2_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE3_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE3_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE3_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE3_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE3_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0x104
    COMB_PD_SITE3_UNIT3_VT0_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT0_PD_SITE3_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT0_PD_SITE3_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT0_PD_SITE3_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT0_PD_SITE3_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT0_PD_SITE3_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0x108
    COMB_PD_SITE3_UNIT0_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE3_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE3_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE3_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE3_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE3_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0x10c
    COMB_PD_SITE3_UNIT1_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE3_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE3_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE3_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE3_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE3_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0x110
    COMB_PD_SITE3_UNIT2_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE3_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE3_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE3_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE3_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE3_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0x114
    COMB_PD_SITE3_UNIT3_VT1_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT1_PD_SITE3_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT1_PD_SITE3_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT1_PD_SITE3_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT1_PD_SITE3_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT1_PD_SITE3_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0x118
    COMB_PD_SITE3_UNIT0_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE3_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE3_UNIT0: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE3_UNIT0: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE3_UNIT0: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE3_UNIT0: u1,
    }),
    /// needs desc
    /// offset: 0x11c
    COMB_PD_SITE3_UNIT1_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE3_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE3_UNIT1: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE3_UNIT1: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE3_UNIT1: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE3_UNIT1: u1,
    }),
    /// needs desc
    /// offset: 0x120
    COMB_PD_SITE3_UNIT2_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE3_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE3_UNIT2: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE3_UNIT2: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE3_UNIT2: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE3_UNIT2: u1,
    }),
    /// needs desc
    /// offset: 0x124
    COMB_PD_SITE3_UNIT3_VT2_CONF1: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EN_VT2_PD_SITE3_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_CLR_VT2_PD_SITE3_UNIT3: u1,
        /// needs field desc
        DELAY_LIMIT_VT2_PD_SITE3_UNIT3: u8,
        reserved23: u13 = 0,
        /// needs field desc
        DELAY_NUM_O_VT2_PD_SITE3_UNIT3: u8,
        /// needs field desc
        TIMING_ERR_VT2_PD_SITE3_UNIT3: u1,
    }),
    /// needs desc
    /// offset: 0x128
    COMB_PD_SITE0_UNIT0_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE0_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE0_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE0_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x12c
    COMB_PD_SITE0_UNIT1_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE0_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE0_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE0_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x130
    COMB_PD_SITE0_UNIT2_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE0_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE0_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE0_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x134
    COMB_PD_SITE0_UNIT3_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE0_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE0_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE0_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x138
    COMB_PD_SITE0_UNIT0_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE0_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE0_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE0_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x13c
    COMB_PD_SITE0_UNIT1_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE0_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE0_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE0_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x140
    COMB_PD_SITE0_UNIT2_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE0_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE0_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE0_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x144
    COMB_PD_SITE0_UNIT3_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE0_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE0_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE0_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x148
    COMB_PD_SITE0_UNIT0_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE0_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE0_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE0_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x14c
    COMB_PD_SITE0_UNIT1_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE0_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE0_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE0_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x150
    COMB_PD_SITE0_UNIT2_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE0_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE0_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE0_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x154
    COMB_PD_SITE0_UNIT3_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE0_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE0_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE0_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x158
    COMB_PD_SITE1_UNIT0_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE1_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE1_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE1_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x15c
    COMB_PD_SITE1_UNIT1_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE1_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE1_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE1_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x160
    COMB_PD_SITE1_UNIT2_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE1_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE1_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE1_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x164
    COMB_PD_SITE1_UNIT3_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE1_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE1_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE1_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x168
    COMB_PD_SITE1_UNIT0_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE1_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE1_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE1_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x16c
    COMB_PD_SITE1_UNIT1_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE1_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE1_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE1_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x170
    COMB_PD_SITE1_UNIT2_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE1_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE1_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE1_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x174
    COMB_PD_SITE1_UNIT3_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE1_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE1_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE1_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x178
    COMB_PD_SITE1_UNIT0_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE1_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE1_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE1_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x17c
    COMB_PD_SITE1_UNIT1_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE1_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE1_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE1_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x180
    COMB_PD_SITE1_UNIT2_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE1_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE1_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE1_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x184
    COMB_PD_SITE1_UNIT3_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE1_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE1_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE1_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x188
    COMB_PD_SITE2_UNIT0_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE2_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE2_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE2_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x18c
    COMB_PD_SITE2_UNIT1_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE2_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE2_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE2_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x190
    COMB_PD_SITE2_UNIT2_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE2_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE2_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE2_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x194
    COMB_PD_SITE2_UNIT3_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE2_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE2_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE2_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x198
    COMB_PD_SITE2_UNIT0_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE2_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE2_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE2_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x19c
    COMB_PD_SITE2_UNIT1_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE2_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE2_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE2_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x1a0
    COMB_PD_SITE2_UNIT2_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE2_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE2_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE2_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x1a4
    COMB_PD_SITE2_UNIT3_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE2_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE2_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE2_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x1a8
    COMB_PD_SITE2_UNIT0_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE2_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE2_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE2_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x1ac
    COMB_PD_SITE2_UNIT1_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE2_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE2_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE2_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x1b0
    COMB_PD_SITE2_UNIT2_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE2_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE2_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE2_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x1b4
    COMB_PD_SITE2_UNIT3_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE2_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE2_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE2_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x1b8
    COMB_PD_SITE3_UNIT0_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE3_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE3_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE3_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x1bc
    COMB_PD_SITE3_UNIT1_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE3_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE3_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE3_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x1c0
    COMB_PD_SITE3_UNIT2_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE3_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE3_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE3_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x1c4
    COMB_PD_SITE3_UNIT3_VT0_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT0_PD_SITE3_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT0_PD_SITE3_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT0_PD_SITE3_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x1c8
    COMB_PD_SITE3_UNIT0_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE3_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE3_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE3_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x1cc
    COMB_PD_SITE3_UNIT1_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE3_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE3_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE3_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x1d0
    COMB_PD_SITE3_UNIT2_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE3_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE3_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE3_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x1d4
    COMB_PD_SITE3_UNIT3_VT1_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT1_PD_SITE3_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT1_PD_SITE3_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT1_PD_SITE3_UNIT3: u16,
    }),
    /// needs desc
    /// offset: 0x1d8
    COMB_PD_SITE3_UNIT0_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE3_UNIT0: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE3_UNIT0: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE3_UNIT0: u16,
    }),
    /// needs desc
    /// offset: 0x1dc
    COMB_PD_SITE3_UNIT1_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE3_UNIT1: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE3_UNIT1: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE3_UNIT1: u16,
    }),
    /// needs desc
    /// offset: 0x1e0
    COMB_PD_SITE3_UNIT2_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE3_UNIT2: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE3_UNIT2: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE3_UNIT2: u16,
    }),
    /// needs desc
    /// offset: 0x1e4
    COMB_PD_SITE3_UNIT3_VT2_CONF2: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        MONITOR_EDG_MOD_VT2_PD_SITE3_UNIT3: u2,
        reserved15: u13 = 0,
        /// needs field desc
        DELAY_OVF_VT2_PD_SITE3_UNIT3: u1,
        /// needs field desc
        TIMING_ERR_CNT_O_VT2_PD_SITE3_UNIT3: u16,
    }),
    /// needs field desc
    /// offset: 0x1e8
    VALUE_UPDATE: mmio.Mmio(packed struct(u32) {
        /// needs field desc
        VALUE_UPDATE: u1,
        /// needs field desc
        BYPASS: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x1ec
    reserved492: [3600]u8,
    /// version register
    /// offset: 0xffc
    DATE: mmio.Mmio(packed struct(u32) {
        /// version register
        DATE: u32,
    }),
};
