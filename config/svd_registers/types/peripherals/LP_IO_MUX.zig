const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Low-power Input/Output Multiplexer
pub const LP_IO_MUX = extern struct {
    /// Reserved
    /// offset: 0x00
    CLK_EN: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// Reserved
    /// offset: 0x04
    VER_DATE: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_VER_DATE: u28,
        padding: u4 = 0,
    }),
    /// Reserved
    /// offset: 0x08
    PAD0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD0_DRV: u2,
        /// Reserved
        REG_PAD0_RDE: u1,
        /// Reserved
        REG_PAD0_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD0_MUX_SEL: u1,
        /// function sel
        REG_PAD0_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD0_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD0_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD0_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD0_FUN_IE: u1,
        /// need des
        REG_PAD0_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x0c
    PAD1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD1_DRV: u2,
        /// Reserved
        REG_PAD1_RDE: u1,
        /// Reserved
        REG_PAD1_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD1_MUX_SEL: u1,
        /// function sel
        REG_PAD1_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD1_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD1_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD1_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD1_FUN_IE: u1,
        /// need des
        REG_PAD1_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x10
    PAD2: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD2_DRV: u2,
        /// Reserved
        REG_PAD2_RDE: u1,
        /// Reserved
        REG_PAD2_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD2_MUX_SEL: u1,
        /// function sel
        REG_PAD2_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD2_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD2_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD2_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD2_FUN_IE: u1,
        /// need des
        REG_PAD2_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x14
    PAD3: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD3_DRV: u2,
        /// Reserved
        REG_PAD3_RDE: u1,
        /// Reserved
        REG_PAD3_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD3_MUX_SEL: u1,
        /// function sel
        REG_PAD3_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD3_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD3_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD3_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD3_FUN_IE: u1,
        /// need des
        REG_PAD3_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x18
    PAD4: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD4_DRV: u2,
        /// Reserved
        REG_PAD4_RDE: u1,
        /// Reserved
        REG_PAD4_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD4_MUX_SEL: u1,
        /// function sel
        REG_PAD4_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD4_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD4_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD4_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD4_FUN_IE: u1,
        /// need des
        REG_PAD4_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x1c
    PAD5: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD5_DRV: u2,
        /// Reserved
        REG_PAD5_RDE: u1,
        /// Reserved
        REG_PAD5_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD5_MUX_SEL: u1,
        /// function sel
        REG_PAD5_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD5_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD5_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD5_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD5_FUN_IE: u1,
        /// need des
        REG_PAD5_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x20
    PAD6: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD6_DRV: u2,
        /// Reserved
        REG_PAD6_RDE: u1,
        /// Reserved
        REG_PAD6_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD6_MUX_SEL: u1,
        /// function sel
        REG_PAD6_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD6_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD6_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD6_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD6_FUN_IE: u1,
        /// need des
        REG_PAD6_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x24
    PAD7: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD7_DRV: u2,
        /// Reserved
        REG_PAD7_RDE: u1,
        /// Reserved
        REG_PAD7_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD7_MUX_SEL: u1,
        /// function sel
        REG_PAD7_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD7_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD7_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD7_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD7_FUN_IE: u1,
        /// need des
        REG_PAD7_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x28
    PAD8: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD8_DRV: u2,
        /// Reserved
        REG_PAD8_RDE: u1,
        /// Reserved
        REG_PAD8_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD8_MUX_SEL: u1,
        /// function sel
        REG_PAD8_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD8_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD8_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD8_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD8_FUN_IE: u1,
        /// need des
        REG_PAD8_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x2c
    PAD9: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD9_DRV: u2,
        /// Reserved
        REG_PAD9_RDE: u1,
        /// Reserved
        REG_PAD9_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD9_MUX_SEL: u1,
        /// function sel
        REG_PAD9_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD9_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD9_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD9_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD9_FUN_IE: u1,
        /// need des
        REG_PAD9_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x30
    PAD10: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD10_DRV: u2,
        /// Reserved
        REG_PAD10_RDE: u1,
        /// Reserved
        REG_PAD10_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD10_MUX_SEL: u1,
        /// function sel
        REG_PAD10_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD10_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD10_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD10_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD10_FUN_IE: u1,
        /// need des
        REG_PAD10_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x34
    PAD11: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD11_DRV: u2,
        /// Reserved
        REG_PAD11_RDE: u1,
        /// Reserved
        REG_PAD11_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD11_MUX_SEL: u1,
        /// function sel
        REG_PAD11_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD11_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD11_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD11_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD11_FUN_IE: u1,
        /// need des
        REG_PAD11_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x38
    PAD120: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD12_DRV: u2,
        /// Reserved
        REG_PAD12_RDE: u1,
        /// Reserved
        REG_PAD12_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD12_MUX_SEL: u1,
        /// function sel
        REG_PAD12_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD12_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD12_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD12_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD12_FUN_IE: u1,
        /// need des
        REG_PAD12_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x3c
    PAD13: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD13_DRV: u2,
        /// Reserved
        REG_PAD13_RDE: u1,
        /// Reserved
        REG_PAD13_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD13_MUX_SEL: u1,
        /// function sel
        REG_PAD13_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD13_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD13_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD13_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD13_FUN_IE: u1,
        /// need des
        REG_PAD13_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x40
    PAD14: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD14_DRV: u2,
        /// Reserved
        REG_PAD14_RDE: u1,
        /// Reserved
        REG_PAD14_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD14_MUX_SEL: u1,
        /// function sel
        REG_PAD14_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD14_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD14_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD14_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD14_FUN_IE: u1,
        /// need des
        REG_PAD14_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x44
    PAD15: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PAD15_DRV: u2,
        /// Reserved
        REG_PAD15_RDE: u1,
        /// Reserved
        REG_PAD15_RUE: u1,
        /// 1:use LP GPIO,0: use digital GPIO
        REG_PAD15_MUX_SEL: u1,
        /// function sel
        REG_PAD15_FUN_SEL: u2,
        /// 1: enable sleep mode during sleep,0: no sleep mode
        REG_PAD15_SLP_SEL: u1,
        /// input enable in sleep mode
        REG_PAD15_SLP_IE: u1,
        /// output enable in sleep mode
        REG_PAD15_SLP_OE: u1,
        /// input enable in work mode
        REG_PAD15_FUN_IE: u1,
        /// need des
        REG_PAD15_FILTER_EN: u1,
        padding: u20 = 0,
    }),
    /// Reserved
    /// offset: 0x48
    EXT_WAKEUP0_SEL: mmio.Mmio(packed struct(u32) {
        /// select LP GPIO 0 ~ 15 to control XTAL
        REG_XTL_EXT_CTR_SEL: u5,
        /// Reserved
        REG_EXT_WAKEUP0_SEL: u5,
        padding: u22 = 0,
    }),
    /// Reserved
    /// offset: 0x4c
    LP_PAD_HOLD: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_LP_GPIO_HOLD: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x50
    LP_PAD_HYS: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_LP_GPIO_HYS: u16,
        padding: u16 = 0,
    }),
};
