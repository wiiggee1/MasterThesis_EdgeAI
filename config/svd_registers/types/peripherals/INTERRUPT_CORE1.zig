const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Interrupt Controller (Core 1)
pub const INTERRUPT_CORE1 = extern struct {
    /// NA
    /// offset: 0x00
    LP_RTC_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_RTC_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x04
    LP_WDT_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_WDT_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x08
    LP_TIMER_REG_0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_TIMER_REG_0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x0c
    LP_TIMER_REG_1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_TIMER_REG_1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x10
    MB_HP_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_MB_HP_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x14
    MB_LP_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_MB_LP_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x18
    PMU_REG_0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_PMU_REG_0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1c
    PMU_REG_1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_PMU_REG_1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x20
    LP_ANAPERI_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_ANAPERI_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x24
    LP_ADC_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_ADC_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x28
    LP_GPIO_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_GPIO_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x2c
    LP_I2C_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_I2C_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x30
    LP_I2S_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_I2S_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x34
    LP_SPI_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_SPI_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x38
    LP_TOUCH_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_TOUCH_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x3c
    LP_TSENS_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_TSENS_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x40
    LP_UART_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_UART_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x44
    LP_EFUSE_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_EFUSE_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x48
    LP_SW_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_SW_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x4c
    LP_SYSREG_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_SYSREG_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x50
    LP_HUK_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LP_HUK_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x54
    SYS_ICM_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_SYS_ICM_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x58
    USB_DEVICE_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_USB_DEVICE_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x5c
    SDIO_HOST_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_SDIO_HOST_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x60
    GDMA_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_GDMA_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x64
    SPI2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_SPI2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x68
    SPI3_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_SPI3_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x6c
    I2S0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_I2S0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x70
    I2S1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_I2S1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x74
    I2S2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_I2S2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x78
    UHCI0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_UHCI0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x7c
    UART0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_UART0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x80
    UART1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_UART1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x84
    UART2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_UART2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x88
    UART3_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_UART3_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x8c
    UART4_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_UART4_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x90
    LCD_CAM_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LCD_CAM_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x94
    ADC_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_ADC_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x98
    PWM0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_PWM0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x9c
    PWM1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_PWM1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xa0
    CAN0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CAN0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xa4
    CAN1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CAN1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xa8
    CAN2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CAN2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xac
    RMT_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_RMT_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xb0
    I2C0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_I2C0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xb4
    I2C1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_I2C1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xb8
    TIMERGRP0_T0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_TIMERGRP0_T0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xbc
    TIMERGRP0_T1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_TIMERGRP0_T1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xc0
    TIMERGRP0_WDT_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_TIMERGRP0_WDT_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xc4
    TIMERGRP1_T0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_TIMERGRP1_T0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xc8
    TIMERGRP1_T1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_TIMERGRP1_T1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xcc
    TIMERGRP1_WDT_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_TIMERGRP1_WDT_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xd0
    LEDC_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LEDC_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xd4
    SYSTIMER_TARGET0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_SYSTIMER_TARGET0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xd8
    SYSTIMER_TARGET1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_SYSTIMER_TARGET1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xdc
    SYSTIMER_TARGET2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_SYSTIMER_TARGET2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xe0
    AHB_PDMA_IN_CH0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AHB_PDMA_IN_CH0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xe4
    AHB_PDMA_IN_CH1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AHB_PDMA_IN_CH1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xe8
    AHB_PDMA_IN_CH2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AHB_PDMA_IN_CH2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xec
    AHB_PDMA_OUT_CH0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AHB_PDMA_OUT_CH0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xf0
    AHB_PDMA_OUT_CH1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AHB_PDMA_OUT_CH1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xf4
    AHB_PDMA_OUT_CH2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AHB_PDMA_OUT_CH2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xf8
    AXI_PDMA_IN_CH0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AXI_PDMA_IN_CH0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xfc
    AXI_PDMA_IN_CH1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AXI_PDMA_IN_CH1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x100
    AXI_PDMA_IN_CH2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AXI_PDMA_IN_CH2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x104
    AXI_PDMA_OUT_CH0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AXI_PDMA_OUT_CH0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x108
    AXI_PDMA_OUT_CH1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AXI_PDMA_OUT_CH1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x10c
    AXI_PDMA_OUT_CH2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AXI_PDMA_OUT_CH2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x110
    RSA_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_RSA_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x114
    AES_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_AES_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x118
    SHA_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_SHA_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x11c
    ECC_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_ECC_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x120
    ECDSA_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_ECDSA_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x124
    KM_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_KM_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x128
    GPIO_INT0_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_GPIO_INT0_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x12c
    GPIO_INT1_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_GPIO_INT1_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x130
    GPIO_INT2_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_GPIO_INT2_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x134
    GPIO_INT3_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_GPIO_INT3_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x138
    GPIO_PAD_COMP_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_GPIO_PAD_COMP_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x13c
    CPU_INT_FROM_CPU_0_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CPU_INT_FROM_CPU_0_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x140
    CPU_INT_FROM_CPU_1_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CPU_INT_FROM_CPU_1_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x144
    CPU_INT_FROM_CPU_2_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CPU_INT_FROM_CPU_2_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x148
    CPU_INT_FROM_CPU_3_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CPU_INT_FROM_CPU_3_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x14c
    CACHE_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CACHE_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x150
    FLASH_MSPI_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_FLASH_MSPI_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x154
    CSI_BRIDGE_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CSI_BRIDGE_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x158
    DSI_BRIDGE_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_DSI_BRIDGE_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x15c
    CSI_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CSI_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x160
    DSI_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_DSI_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x164
    GMII_PHY_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_GMII_PHY_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x168
    LPI_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_LPI_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x16c
    PMT_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_PMT_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x170
    SBD_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_SBD_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x174
    USB_OTG_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_USB_OTG_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x178
    USB_OTG_ENDP_MULTI_PROC_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_USB_OTG_ENDP_MULTI_PROC_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x17c
    JPEG_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_JPEG_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x180
    PPA_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_PPA_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x184
    CORE0_TRACE_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CORE0_TRACE_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x188
    CORE1_TRACE_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_CORE1_TRACE_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x18c
    HP_CORE_CTRL_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_HP_CORE_CTRL_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x190
    ISP_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_ISP_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x194
    I3C_MST_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_I3C_MST_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x198
    I3C_SLV_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_I3C_SLV_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x19c
    USB_OTG11_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_USB_OTG11_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1a0
    DMA2D_IN_CH0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_DMA2D_IN_CH0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1a4
    DMA2D_IN_CH1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_DMA2D_IN_CH1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1a8
    DMA2D_OUT_CH0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_DMA2D_OUT_CH0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1ac
    DMA2D_OUT_CH1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_DMA2D_OUT_CH1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1b0
    DMA2D_OUT_CH2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_DMA2D_OUT_CH2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1b4
    PSRAM_MSPI_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_PSRAM_MSPI_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1b8
    HP_SYSREG_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_HP_SYSREG_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1bc
    PCNT_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_PCNT_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1c0
    HP_PAU_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_HP_PAU_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1c4
    HP_PARLIO_RX_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_HP_PARLIO_RX_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1c8
    HP_PARLIO_TX_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_HP_PARLIO_TX_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1cc
    H264_DMA2D_OUT_CH0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_OUT_CH0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1d0
    H264_DMA2D_OUT_CH1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_OUT_CH1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1d4
    H264_DMA2D_OUT_CH2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_OUT_CH2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1d8
    H264_DMA2D_OUT_CH3_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_OUT_CH3_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1dc
    H264_DMA2D_OUT_CH4_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_OUT_CH4_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1e0
    H264_DMA2D_IN_CH0_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_IN_CH0_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1e4
    H264_DMA2D_IN_CH1_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_IN_CH1_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1e8
    H264_DMA2D_IN_CH2_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_IN_CH2_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1ec
    H264_DMA2D_IN_CH3_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_IN_CH3_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1f0
    H264_DMA2D_IN_CH4_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_IN_CH4_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1f4
    H264_DMA2D_IN_CH5_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_DMA2D_IN_CH5_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1f8
    H264_REG_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_H264_REG_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x1fc
    ASSIST_DEBUG_INT_MAP: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_ASSIST_DEBUG_INT_MAP: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x200
    INTR_STATUS_REG_0: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_INTR_STATUS_0: u32,
    }),
    /// NA
    /// offset: 0x204
    INTR_STATUS_REG_1: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_INTR_STATUS_1: u32,
    }),
    /// NA
    /// offset: 0x208
    INTR_STATUS_REG_2: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_INTR_STATUS_2: u32,
    }),
    /// NA
    /// offset: 0x20c
    INTR_STATUS_REG_3: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_INTR_STATUS_3: u32,
    }),
    /// NA
    /// offset: 0x210
    CLOCK_GATE: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_REG_CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x214
    reserved532: [488]u8,
    /// NA
    /// offset: 0x3fc
    INTERRUPT_REG_DATE: mmio.Mmio(packed struct(u32) {
        /// NA
        CORE1_INTERRUPT_REG_DATE: u28,
        padding: u4 = 0,
    }),
};
