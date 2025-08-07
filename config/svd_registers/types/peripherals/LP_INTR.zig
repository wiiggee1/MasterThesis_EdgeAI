const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Low-power Interrupt Controller
pub const LP_INTR = extern struct {
    /// need_des
    /// offset: 0x00
    SW_INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_SW_INT_RAW: u1,
    }),
    /// need_des
    /// offset: 0x04
    SW_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_SW_INT_ST: u1,
    }),
    /// need_des
    /// offset: 0x08
    SW_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_SW_INT_ENA: u1,
    }),
    /// need_des
    /// offset: 0x0c
    SW_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_SW_INT_CLR: u1,
    }),
    /// need_des
    /// offset: 0x10
    STATUS: mmio.Mmio(packed struct(u32) {
        reserved10: u10 = 0,
        /// need_des
        LP_HUK_INTR_ST: u1,
        /// need_des
        SYSREG_INTR_ST: u1,
        /// need_des
        LP_SW_INTR_ST: u1,
        /// need_des
        LP_EFUSE_INTR_ST: u1,
        /// need_des
        LP_UART_INTR_ST: u1,
        /// need_des
        LP_TSENS_INTR_ST: u1,
        /// need_des
        LP_TOUCH_INTR_ST: u1,
        /// need_des
        LP_SPI_INTR_ST: u1,
        /// need_des
        LP_I2S_INTR_ST: u1,
        /// need_des
        LP_I2C_INTR_ST: u1,
        /// need_des
        LP_GPIO_INTR_ST: u1,
        /// need_des
        LP_ADC_INTR_ST: u1,
        /// need_des
        ANAPERI_INTR_ST: u1,
        /// need_des
        PMU_REG_1_INTR_ST: u1,
        /// need_des
        PMU_REG_0_INTR_ST: u1,
        /// need_des
        MB_LP_INTR_ST: u1,
        /// need_des
        MB_HP_INTR_ST: u1,
        /// need_des
        LP_TIMER_REG_1_INTR_ST: u1,
        /// need_des
        LP_TIMER_REG_0_INTR_ST: u1,
        /// need_des
        LP_WDT_INTR_ST: u1,
        /// need_des
        LP_RTC_INTR_ST: u1,
        /// need_des
        HP_INTR_ST: u1,
    }),
    /// offset: 0x14
    reserved20: [1000]u8,
    /// need_des
    /// offset: 0x3fc
    DATE: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        CLK_EN: u1,
    }),
};
