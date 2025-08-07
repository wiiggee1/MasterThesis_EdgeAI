const mmio = @import("mmio");
const types = @import("../../types.zig");

/// LP_PERI Peripheral
pub const LP_PERI = extern struct {
    /// need_des
    /// offset: 0x00
    CLK_EN: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// need_des
        CK_EN_RNG: u1,
        /// need_des
        CK_EN_LP_TSENS: u1,
        /// need_des
        CK_EN_LP_PMS: u1,
        /// need_des
        CK_EN_LP_EFUSE: u1,
        /// need_des
        CK_EN_LP_IOMUX: u1,
        /// need_des
        CK_EN_LP_TOUCH: u1,
        /// need_des
        CK_EN_LP_SPI: u1,
        /// need_des
        CK_EN_LP_ADC: u1,
        /// need_des
        CK_EN_LP_I2S_TX: u1,
        /// need_des
        CK_EN_LP_I2S_RX: u1,
        /// need_des
        CK_EN_LP_I2S: u1,
        /// need_des
        CK_EN_LP_I2CMST: u1,
        /// need_des
        CK_EN_LP_I2C: u1,
        /// need_des
        CK_EN_LP_UART: u1,
        /// need_des
        CK_EN_LP_INTR: u1,
        /// write 1 to force on lp_core clk
        CK_EN_LP_CORE: u1,
    }),
    /// need_des
    /// offset: 0x04
    CORE_CLK_SEL: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// need_des
        LP_I2S_TX_CLK_SEL: u2,
        /// need_des
        LP_I2S_RX_CLK_SEL: u2,
        /// need_des
        LP_I2C_CLK_SEL: u2,
        /// need_des
        LP_UART_CLK_SEL: u2,
    }),
    /// need_des
    /// offset: 0x08
    RESET_EN: mmio.Mmio(packed struct(u32) {
        reserved18: u18 = 0,
        /// need_des
        RST_EN_LP_TSENS: u1,
        /// need_des
        RST_EN_LP_PMS: u1,
        /// need_des
        RST_EN_LP_EFUSE: u1,
        /// need_des
        RST_EN_LP_IOMUX: u1,
        /// need_des
        RST_EN_LP_TOUCH: u1,
        /// need_des
        RST_EN_LP_SPI: u1,
        /// need_des
        RST_EN_LP_ADC: u1,
        /// need_des
        RST_EN_LP_I2S: u1,
        /// need_des
        RST_EN_LP_I2CMST: u1,
        /// need_des
        RST_EN_LP_I2C: u1,
        /// need_des
        RST_EN_LP_UART: u1,
        /// need_des
        RST_EN_LP_INTR: u1,
        /// need_des
        RST_EN_LP_ROM: u1,
        /// need_des
        RST_EN_LP_CORE: u1,
    }),
    /// need_des
    /// offset: 0x0c
    CPU: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LPCORE_DBGM_UNAVAILABLE: u1,
    }),
    /// offset: 0x10
    reserved16: [24]u8,
    /// need_des
    /// offset: 0x28
    MEM_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_UART_WAKEUP_FLAG_CLR: u1,
        /// need_des
        LP_UART_WAKEUP_FLAG: u1,
        reserved29: u27 = 0,
        /// need_des
        LP_UART_WAKEUP_EN: u1,
        /// need_des
        LP_UART_MEM_FORCE_PD: u1,
        /// need_des
        LP_UART_MEM_FORCE_PU: u1,
    }),
    /// need_des
    /// offset: 0x2c
    ADC_CTRL: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// need_des
        SAR2_CLK_FORCE_ON: u1,
        /// need_des
        SAR1_CLK_FORCE_ON: u1,
        /// need_des
        LPADC_FUNC_DIV_NUM: u8,
        /// need_des
        LPADC_SAR2_DIV_NUM: u8,
        /// need_des
        LPADC_SAR1_DIV_NUM: u8,
    }),
    /// need_des
    /// offset: 0x30
    LP_I2S_RXCLK_DIV_NUM: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// need_des
        LP_I2S_RX_CLKM_DIV_NUM: u8,
    }),
    /// need_des
    /// offset: 0x34
    LP_I2S_RXCLK_DIV_XYZ: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// need_des
        LP_I2S_RX_CLKM_DIV_YN1: u1,
        /// need_des
        LP_I2S_RX_CLKM_DIV_Z: u9,
        /// need_des
        LP_I2S_RX_CLKM_DIV_Y: u9,
        /// need_des
        LP_I2S_RX_CLKM_DIV_X: u9,
    }),
    /// need_des
    /// offset: 0x38
    LP_I2S_TXCLK_DIV_NUM: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// need_des
        LP_I2S_TX_CLKM_DIV_NUM: u8,
    }),
    /// need_des
    /// offset: 0x3c
    LP_I2S_TXCLK_DIV_XYZ: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// need_des
        LP_I2S_TX_CLKM_DIV_YN1: u1,
        /// need_des
        LP_I2S_TX_CLKM_DIV_Z: u9,
        /// need_des
        LP_I2S_TX_CLKM_DIV_Y: u9,
        /// need_des
        LP_I2S_TX_CLKM_DIV_X: u9,
    }),
    /// offset: 0x40
    reserved64: [956]u8,
    /// need_des
    /// offset: 0x3fc
    DATE: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        CLK_EN: u1,
    }),
};
