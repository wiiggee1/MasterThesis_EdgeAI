const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Sigma-Delta Modulation
pub const GPIO_SD = extern struct {
    /// Duty Cycle Configure Register of SDM%s
    /// offset: 0x00
    SIGMADELTA0: mmio.Mmio(packed struct(u32) {
        /// This field is used to configure the duty cycle of sigma delta modulation output.
        SD_IN: u8,
        /// This field is used to set a divider value to divide APB clock.
        SD_PRESCALE: u8,
        padding: u16 = 0,
    }),
    /// Duty Cycle Configure Register of SDM%s
    /// offset: 0x04
    SIGMADELTA1: mmio.Mmio(packed struct(u32) {
        /// This field is used to configure the duty cycle of sigma delta modulation output.
        SD_IN: u8,
        /// This field is used to set a divider value to divide APB clock.
        SD_PRESCALE: u8,
        padding: u16 = 0,
    }),
    /// Duty Cycle Configure Register of SDM%s
    /// offset: 0x08
    SIGMADELTA2: mmio.Mmio(packed struct(u32) {
        /// This field is used to configure the duty cycle of sigma delta modulation output.
        SD_IN: u8,
        /// This field is used to set a divider value to divide APB clock.
        SD_PRESCALE: u8,
        padding: u16 = 0,
    }),
    /// Duty Cycle Configure Register of SDM%s
    /// offset: 0x0c
    SIGMADELTA3: mmio.Mmio(packed struct(u32) {
        /// This field is used to configure the duty cycle of sigma delta modulation output.
        SD_IN: u8,
        /// This field is used to set a divider value to divide APB clock.
        SD_PRESCALE: u8,
        padding: u16 = 0,
    }),
    /// Duty Cycle Configure Register of SDM%s
    /// offset: 0x10
    SIGMADELTA4: mmio.Mmio(packed struct(u32) {
        /// This field is used to configure the duty cycle of sigma delta modulation output.
        SD_IN: u8,
        /// This field is used to set a divider value to divide APB clock.
        SD_PRESCALE: u8,
        padding: u16 = 0,
    }),
    /// Duty Cycle Configure Register of SDM%s
    /// offset: 0x14
    SIGMADELTA5: mmio.Mmio(packed struct(u32) {
        /// This field is used to configure the duty cycle of sigma delta modulation output.
        SD_IN: u8,
        /// This field is used to set a divider value to divide APB clock.
        SD_PRESCALE: u8,
        padding: u16 = 0,
    }),
    /// Duty Cycle Configure Register of SDM%s
    /// offset: 0x18
    SIGMADELTA6: mmio.Mmio(packed struct(u32) {
        /// This field is used to configure the duty cycle of sigma delta modulation output.
        SD_IN: u8,
        /// This field is used to set a divider value to divide APB clock.
        SD_PRESCALE: u8,
        padding: u16 = 0,
    }),
    /// Duty Cycle Configure Register of SDM%s
    /// offset: 0x1c
    SIGMADELTA7: mmio.Mmio(packed struct(u32) {
        /// This field is used to configure the duty cycle of sigma delta modulation output.
        SD_IN: u8,
        /// This field is used to set a divider value to divide APB clock.
        SD_PRESCALE: u8,
        padding: u16 = 0,
    }),
    /// Clock Gating Configure Register
    /// offset: 0x20
    CLOCK_GATE: mmio.Mmio(packed struct(u32) {
        /// Clock enable bit of configuration registers for sigma delta modulation.
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// MISC Register
    /// offset: 0x24
    SIGMADELTA_MISC: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// Clock enable bit of sigma delta modulation.
        FUNCTION_CLK_EN: u1,
        /// Reserved.
        SPI_SWAP: u1,
    }),
    /// offset: 0x28
    reserved40: [8]u8,
    /// Glitch Filter Configure Register of Channel%s
    /// offset: 0x30
    GLITCH_FILTER_CH0: mmio.Mmio(packed struct(u32) {
        /// Glitch Filter channel enable bit.
        FILTER_CH0_EN: u1,
        /// Glitch Filter input io number.
        FILTER_CH0_INPUT_IO_NUM: u6,
        /// Glitch Filter window threshold.
        FILTER_CH0_WINDOW_THRES: u6,
        /// Glitch Filter window width.
        FILTER_CH0_WINDOW_WIDTH: u6,
        padding: u13 = 0,
    }),
    /// Glitch Filter Configure Register of Channel%s
    /// offset: 0x34
    GLITCH_FILTER_CH1: mmio.Mmio(packed struct(u32) {
        /// Glitch Filter channel enable bit.
        FILTER_CH0_EN: u1,
        /// Glitch Filter input io number.
        FILTER_CH0_INPUT_IO_NUM: u6,
        /// Glitch Filter window threshold.
        FILTER_CH0_WINDOW_THRES: u6,
        /// Glitch Filter window width.
        FILTER_CH0_WINDOW_WIDTH: u6,
        padding: u13 = 0,
    }),
    /// Glitch Filter Configure Register of Channel%s
    /// offset: 0x38
    GLITCH_FILTER_CH2: mmio.Mmio(packed struct(u32) {
        /// Glitch Filter channel enable bit.
        FILTER_CH0_EN: u1,
        /// Glitch Filter input io number.
        FILTER_CH0_INPUT_IO_NUM: u6,
        /// Glitch Filter window threshold.
        FILTER_CH0_WINDOW_THRES: u6,
        /// Glitch Filter window width.
        FILTER_CH0_WINDOW_WIDTH: u6,
        padding: u13 = 0,
    }),
    /// Glitch Filter Configure Register of Channel%s
    /// offset: 0x3c
    GLITCH_FILTER_CH3: mmio.Mmio(packed struct(u32) {
        /// Glitch Filter channel enable bit.
        FILTER_CH0_EN: u1,
        /// Glitch Filter input io number.
        FILTER_CH0_INPUT_IO_NUM: u6,
        /// Glitch Filter window threshold.
        FILTER_CH0_WINDOW_THRES: u6,
        /// Glitch Filter window width.
        FILTER_CH0_WINDOW_WIDTH: u6,
        padding: u13 = 0,
    }),
    /// Glitch Filter Configure Register of Channel%s
    /// offset: 0x40
    GLITCH_FILTER_CH4: mmio.Mmio(packed struct(u32) {
        /// Glitch Filter channel enable bit.
        FILTER_CH0_EN: u1,
        /// Glitch Filter input io number.
        FILTER_CH0_INPUT_IO_NUM: u6,
        /// Glitch Filter window threshold.
        FILTER_CH0_WINDOW_THRES: u6,
        /// Glitch Filter window width.
        FILTER_CH0_WINDOW_WIDTH: u6,
        padding: u13 = 0,
    }),
    /// Glitch Filter Configure Register of Channel%s
    /// offset: 0x44
    GLITCH_FILTER_CH5: mmio.Mmio(packed struct(u32) {
        /// Glitch Filter channel enable bit.
        FILTER_CH0_EN: u1,
        /// Glitch Filter input io number.
        FILTER_CH0_INPUT_IO_NUM: u6,
        /// Glitch Filter window threshold.
        FILTER_CH0_WINDOW_THRES: u6,
        /// Glitch Filter window width.
        FILTER_CH0_WINDOW_WIDTH: u6,
        padding: u13 = 0,
    }),
    /// Glitch Filter Configure Register of Channel%s
    /// offset: 0x48
    GLITCH_FILTER_CH6: mmio.Mmio(packed struct(u32) {
        /// Glitch Filter channel enable bit.
        FILTER_CH0_EN: u1,
        /// Glitch Filter input io number.
        FILTER_CH0_INPUT_IO_NUM: u6,
        /// Glitch Filter window threshold.
        FILTER_CH0_WINDOW_THRES: u6,
        /// Glitch Filter window width.
        FILTER_CH0_WINDOW_WIDTH: u6,
        padding: u13 = 0,
    }),
    /// Glitch Filter Configure Register of Channel%s
    /// offset: 0x4c
    GLITCH_FILTER_CH7: mmio.Mmio(packed struct(u32) {
        /// Glitch Filter channel enable bit.
        FILTER_CH0_EN: u1,
        /// Glitch Filter input io number.
        FILTER_CH0_INPUT_IO_NUM: u6,
        /// Glitch Filter window threshold.
        FILTER_CH0_WINDOW_THRES: u6,
        /// Glitch Filter window width.
        FILTER_CH0_WINDOW_WIDTH: u6,
        padding: u13 = 0,
    }),
    /// offset: 0x50
    reserved80: [16]u8,
    /// Etm Config register of Channel%s
    /// offset: 0x60
    ETM_EVENT_CH0_CFG: mmio.Mmio(packed struct(u32) {
        /// Etm event channel select gpio.
        ETM_CH0_EVENT_SEL: u6,
        reserved7: u1 = 0,
        /// Etm event send enable bit.
        ETM_CH0_EVENT_EN: u1,
        padding: u24 = 0,
    }),
    /// Etm Config register of Channel%s
    /// offset: 0x64
    ETM_EVENT_CH1_CFG: mmio.Mmio(packed struct(u32) {
        /// Etm event channel select gpio.
        ETM_CH0_EVENT_SEL: u6,
        reserved7: u1 = 0,
        /// Etm event send enable bit.
        ETM_CH0_EVENT_EN: u1,
        padding: u24 = 0,
    }),
    /// Etm Config register of Channel%s
    /// offset: 0x68
    ETM_EVENT_CH2_CFG: mmio.Mmio(packed struct(u32) {
        /// Etm event channel select gpio.
        ETM_CH0_EVENT_SEL: u6,
        reserved7: u1 = 0,
        /// Etm event send enable bit.
        ETM_CH0_EVENT_EN: u1,
        padding: u24 = 0,
    }),
    /// Etm Config register of Channel%s
    /// offset: 0x6c
    ETM_EVENT_CH3_CFG: mmio.Mmio(packed struct(u32) {
        /// Etm event channel select gpio.
        ETM_CH0_EVENT_SEL: u6,
        reserved7: u1 = 0,
        /// Etm event send enable bit.
        ETM_CH0_EVENT_EN: u1,
        padding: u24 = 0,
    }),
    /// Etm Config register of Channel%s
    /// offset: 0x70
    ETM_EVENT_CH4_CFG: mmio.Mmio(packed struct(u32) {
        /// Etm event channel select gpio.
        ETM_CH0_EVENT_SEL: u6,
        reserved7: u1 = 0,
        /// Etm event send enable bit.
        ETM_CH0_EVENT_EN: u1,
        padding: u24 = 0,
    }),
    /// Etm Config register of Channel%s
    /// offset: 0x74
    ETM_EVENT_CH5_CFG: mmio.Mmio(packed struct(u32) {
        /// Etm event channel select gpio.
        ETM_CH0_EVENT_SEL: u6,
        reserved7: u1 = 0,
        /// Etm event send enable bit.
        ETM_CH0_EVENT_EN: u1,
        padding: u24 = 0,
    }),
    /// Etm Config register of Channel%s
    /// offset: 0x78
    ETM_EVENT_CH6_CFG: mmio.Mmio(packed struct(u32) {
        /// Etm event channel select gpio.
        ETM_CH0_EVENT_SEL: u6,
        reserved7: u1 = 0,
        /// Etm event send enable bit.
        ETM_CH0_EVENT_EN: u1,
        padding: u24 = 0,
    }),
    /// Etm Config register of Channel%s
    /// offset: 0x7c
    ETM_EVENT_CH7_CFG: mmio.Mmio(packed struct(u32) {
        /// Etm event channel select gpio.
        ETM_CH0_EVENT_SEL: u6,
        reserved7: u1 = 0,
        /// Etm event send enable bit.
        ETM_CH0_EVENT_EN: u1,
        padding: u24 = 0,
    }),
    /// offset: 0x80
    reserved128: [32]u8,
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xa0
    ETM_TASK_P0_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO0_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO0_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO1_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO1_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO2_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO2_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO3_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO3_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xa4
    ETM_TASK_P1_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO4_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO4_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO5_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO5_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO6_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO6_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO7_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO7_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xa8
    ETM_TASK_P2_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO8_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO8_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO9_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO9_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO10_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO10_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO11_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO11_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xac
    ETM_TASK_P3_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO12_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO12_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO13_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO13_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO14_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO14_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO15_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO15_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xb0
    ETM_TASK_P4_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO16_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO16_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO17_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO17_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO18_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO18_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO19_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO19_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xb4
    ETM_TASK_P5_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO20_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO20_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO21_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO21_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO22_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO22_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO23_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO23_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xb8
    ETM_TASK_P6_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO24_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO24_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO25_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO25_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO26_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO26_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO27_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO27_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xbc
    ETM_TASK_P7_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO28_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO28_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO29_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO29_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO30_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO30_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO31_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO31_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xc0
    ETM_TASK_P8_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO32_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO32_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO33_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO33_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO34_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO34_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO35_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO35_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xc4
    ETM_TASK_P9_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO36_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO36_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO37_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO37_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO38_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO38_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO39_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO39_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xc8
    ETM_TASK_P10_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO40_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO40_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO41_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO41_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO42_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO42_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO43_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO43_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xcc
    ETM_TASK_P11_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO44_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO44_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO45_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO45_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO46_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO46_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO47_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO47_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xd0
    ETM_TASK_P12_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO48_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO48_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO49_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO49_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO50_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO50_SEL: u3,
        reserved24: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO51_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO51_SEL: u3,
        padding: u4 = 0,
    }),
    /// Etm Configure Register to decide which GPIO been chosen
    /// offset: 0xd4
    ETM_TASK_P13_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO52_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO52_SEL: u3,
        reserved8: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO53_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO53_SEL: u3,
        reserved16: u4 = 0,
        /// Enable bit of GPIO response etm task.
        ETM_TASK_GPIO54_EN: u1,
        /// GPIO choose a etm task channel.
        ETM_TASK_GPIO54_SEL: u3,
        padding: u12 = 0,
    }),
    /// offset: 0xd8
    reserved216: [36]u8,
    /// Version Control Register
    /// offset: 0xfc
    VERSION: mmio.Mmio(packed struct(u32) {
        /// Version control register.
        GPIO_SD_DATE: u28,
        padding: u4 = 0,
    }),
};
