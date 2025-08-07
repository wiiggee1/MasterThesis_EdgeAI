const mmio = @import("mmio");
const types = @import("../../types.zig");

/// HP_SYS_CLKRST Peripheral
pub const HP_SYS_CLKRST = extern struct {
    /// Reserved
    /// offset: 0x00
    CLK_EN0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// Reserved
    /// offset: 0x04
    ROOT_CLK_CTRL0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_CPUICM_DELAY_NUM: u4,
        /// Reserved
        REG_SOC_CLK_DIV_UPDATE: u1,
        /// Reserved
        REG_CPU_CLK_DIV_NUM: u8,
        /// Reserved
        REG_CPU_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_CPU_CLK_DIV_DENOMINATOR: u8,
        padding: u3 = 0,
    }),
    /// Reserved
    /// offset: 0x08
    ROOT_CLK_CTRL1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_MEM_CLK_DIV_NUM: u8,
        /// Reserved
        REG_MEM_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_MEM_CLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_SYS_CLK_DIV_NUM: u8,
    }),
    /// Reserved
    /// offset: 0x0c
    ROOT_CLK_CTRL2: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_SYS_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_SYS_CLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_APB_CLK_DIV_NUM: u8,
        /// Reserved
        REG_APB_CLK_DIV_NUMERATOR: u8,
    }),
    /// Reserved
    /// offset: 0x10
    ROOT_CLK_CTRL3: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_APB_CLK_DIV_DENOMINATOR: u8,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x14
    SOC_CLK_CTRL0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_CORE0_CLIC_CLK_EN: u1,
        /// Reserved
        REG_CORE1_CLIC_CLK_EN: u1,
        /// Reserved
        REG_MISC_CPU_CLK_EN: u1,
        /// Reserved
        REG_CORE0_CPU_CLK_EN: u1,
        /// Reserved
        REG_CORE1_CPU_CLK_EN: u1,
        /// Reserved
        REG_TCM_CPU_CLK_EN: u1,
        /// Reserved
        REG_BUSMON_CPU_CLK_EN: u1,
        /// Reserved
        REG_L1CACHE_CPU_CLK_EN: u1,
        /// Reserved
        REG_L1CACHE_D_CPU_CLK_EN: u1,
        /// Reserved
        REG_L1CACHE_I0_CPU_CLK_EN: u1,
        /// Reserved
        REG_L1CACHE_I1_CPU_CLK_EN: u1,
        /// Reserved
        REG_TRACE_CPU_CLK_EN: u1,
        /// Reserved
        REG_ICM_CPU_CLK_EN: u1,
        /// Reserved
        REG_GDMA_CPU_CLK_EN: u1,
        /// Reserved
        REG_VPU_CPU_CLK_EN: u1,
        /// Reserved
        REG_L1CACHE_MEM_CLK_EN: u1,
        /// Reserved
        REG_L1CACHE_D_MEM_CLK_EN: u1,
        /// Reserved
        REG_L1CACHE_I0_MEM_CLK_EN: u1,
        /// Reserved
        REG_L1CACHE_I1_MEM_CLK_EN: u1,
        /// Reserved
        REG_L2CACHE_MEM_CLK_EN: u1,
        /// Reserved
        REG_L2MEM_MEM_CLK_EN: u1,
        /// Reserved
        REG_L2MEMMON_MEM_CLK_EN: u1,
        /// Reserved
        REG_ICM_MEM_CLK_EN: u1,
        /// Reserved
        REG_MISC_SYS_CLK_EN: u1,
        /// Reserved
        REG_TRACE_SYS_CLK_EN: u1,
        /// Reserved
        REG_L2CACHE_SYS_CLK_EN: u1,
        /// Reserved
        REG_L2MEM_SYS_CLK_EN: u1,
        /// Reserved
        REG_L2MEMMON_SYS_CLK_EN: u1,
        /// Reserved
        REG_TCMMON_SYS_CLK_EN: u1,
        /// Reserved
        REG_ICM_SYS_CLK_EN: u1,
        /// Reserved
        REG_FLASH_SYS_CLK_EN: u1,
        /// Reserved
        REG_PSRAM_SYS_CLK_EN: u1,
    }),
    /// Reserved
    /// offset: 0x18
    SOC_CLK_CTRL1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPSPI2_SYS_CLK_EN: u1,
        /// Reserved
        REG_GPSPI3_SYS_CLK_EN: u1,
        /// Reserved
        REG_REGDMA_SYS_CLK_EN: u1,
        /// Reserved
        REG_AHB_PDMA_SYS_CLK_EN: u1,
        /// Reserved
        REG_AXI_PDMA_SYS_CLK_EN: u1,
        /// Reserved
        REG_GDMA_SYS_CLK_EN: u1,
        /// Reserved
        REG_DMA2D_SYS_CLK_EN: u1,
        /// Reserved
        REG_VPU_SYS_CLK_EN: u1,
        /// Reserved
        REG_JPEG_SYS_CLK_EN: u1,
        /// Reserved
        REG_PPA_SYS_CLK_EN: u1,
        /// Reserved
        REG_CSI_BRG_SYS_CLK_EN: u1,
        /// Reserved
        REG_CSI_HOST_SYS_CLK_EN: u1,
        /// Reserved
        REG_DSI_SYS_CLK_EN: u1,
        /// Reserved
        REG_EMAC_SYS_CLK_EN: u1,
        /// Reserved
        REG_SDMMC_SYS_CLK_EN: u1,
        /// Reserved
        REG_USB_OTG11_SYS_CLK_EN: u1,
        /// Reserved
        REG_USB_OTG20_SYS_CLK_EN: u1,
        /// Reserved
        REG_UHCI_SYS_CLK_EN: u1,
        /// Reserved
        REG_UART0_SYS_CLK_EN: u1,
        /// Reserved
        REG_UART1_SYS_CLK_EN: u1,
        /// Reserved
        REG_UART2_SYS_CLK_EN: u1,
        /// Reserved
        REG_UART3_SYS_CLK_EN: u1,
        /// Reserved
        REG_UART4_SYS_CLK_EN: u1,
        /// Reserved
        REG_PARLIO_SYS_CLK_EN: u1,
        /// Reserved
        REG_ETM_SYS_CLK_EN: u1,
        /// Reserved
        REG_PVT_SYS_CLK_EN: u1,
        /// Reserved
        REG_CRYPTO_SYS_CLK_EN: u1,
        /// Reserved
        REG_KEY_MANAGER_SYS_CLK_EN: u1,
        /// Reserved
        REG_BITSRAMBLER_SYS_CLK_EN: u1,
        /// Reserved
        REG_BITSRAMBLER_RX_SYS_CLK_EN: u1,
        /// Reserved
        REG_BITSRAMBLER_TX_SYS_CLK_EN: u1,
        /// Reserved
        REG_H264_SYS_CLK_EN: u1,
    }),
    /// Reserved
    /// offset: 0x1c
    SOC_CLK_CTRL2: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_RMT_SYS_CLK_EN: u1,
        /// Reserved
        REG_HP_CLKRST_APB_CLK_EN: u1,
        /// Reserved
        REG_SYSREG_APB_CLK_EN: u1,
        /// Reserved
        REG_ICM_APB_CLK_EN: u1,
        /// Reserved
        REG_INTRMTX_APB_CLK_EN: u1,
        /// Reserved
        REG_ADC_APB_CLK_EN: u1,
        /// Reserved
        REG_UHCI_APB_CLK_EN: u1,
        /// Reserved
        REG_UART0_APB_CLK_EN: u1,
        /// Reserved
        REG_UART1_APB_CLK_EN: u1,
        /// Reserved
        REG_UART2_APB_CLK_EN: u1,
        /// Reserved
        REG_UART3_APB_CLK_EN: u1,
        /// Reserved
        REG_UART4_APB_CLK_EN: u1,
        /// Reserved
        REG_I2C0_APB_CLK_EN: u1,
        /// Reserved
        REG_I2C1_APB_CLK_EN: u1,
        /// Reserved
        REG_I2S0_APB_CLK_EN: u1,
        /// Reserved
        REG_I2S1_APB_CLK_EN: u1,
        /// Reserved
        REG_I2S2_APB_CLK_EN: u1,
        /// Reserved
        REG_I3C_MST_APB_CLK_EN: u1,
        /// Reserved
        REG_I3C_SLV_APB_CLK_EN: u1,
        /// Reserved
        REG_GPSPI2_APB_CLK_EN: u1,
        /// Reserved
        REG_GPSPI3_APB_CLK_EN: u1,
        /// Reserved
        REG_TIMERGRP0_APB_CLK_EN: u1,
        /// Reserved
        REG_TIMERGRP1_APB_CLK_EN: u1,
        /// Reserved
        REG_SYSTIMER_APB_CLK_EN: u1,
        /// Reserved
        REG_TWAI0_APB_CLK_EN: u1,
        /// Reserved
        REG_TWAI1_APB_CLK_EN: u1,
        /// Reserved
        REG_TWAI2_APB_CLK_EN: u1,
        /// Reserved
        REG_MCPWM0_APB_CLK_EN: u1,
        /// Reserved
        REG_MCPWM1_APB_CLK_EN: u1,
        /// Reserved
        REG_USB_DEVICE_APB_CLK_EN: u1,
        /// Reserved
        REG_PCNT_APB_CLK_EN: u1,
        /// Reserved
        REG_PARLIO_APB_CLK_EN: u1,
    }),
    /// Reserved
    /// offset: 0x20
    SOC_CLK_CTRL3: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_LEDC_APB_CLK_EN: u1,
        /// Reserved
        REG_LCDCAM_APB_CLK_EN: u1,
        /// Reserved
        REG_ETM_APB_CLK_EN: u1,
        /// Reserved
        REG_IOMUX_APB_CLK_EN: u1,
        padding: u28 = 0,
    }),
    /// Reserved
    /// offset: 0x24
    REF_CLK_CTRL0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_REF_50M_CLK_DIV_NUM: u8,
        /// Reserved
        REG_REF_25M_CLK_DIV_NUM: u8,
        /// Reserved
        REG_REF_240M_CLK_DIV_NUM: u8,
        /// Reserved
        REG_REF_160M_CLK_DIV_NUM: u8,
    }),
    /// Reserved
    /// offset: 0x28
    REF_CLK_CTRL1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_REF_120M_CLK_DIV_NUM: u8,
        /// Reserved
        REG_REF_80M_CLK_DIV_NUM: u8,
        /// Reserved
        REG_REF_20M_CLK_DIV_NUM: u8,
        /// Reserved
        REG_TM_400M_CLK_EN: u1,
        /// Reserved
        REG_TM_200M_CLK_EN: u1,
        /// Reserved
        REG_TM_100M_CLK_EN: u1,
        /// Reserved
        REG_REF_50M_CLK_EN: u1,
        /// Reserved
        REG_REF_25M_CLK_EN: u1,
        /// Reserved
        REG_TM_480M_CLK_EN: u1,
        /// Reserved
        REG_REF_240M_CLK_EN: u1,
        /// Reserved
        REG_TM_240M_CLK_EN: u1,
    }),
    /// Reserved
    /// offset: 0x2c
    REF_CLK_CTRL2: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_REF_160M_CLK_EN: u1,
        /// Reserved
        REG_TM_160M_CLK_EN: u1,
        /// Reserved
        REG_REF_120M_CLK_EN: u1,
        /// Reserved
        REG_TM_120M_CLK_EN: u1,
        /// Reserved
        REG_REF_80M_CLK_EN: u1,
        /// Reserved
        REG_TM_80M_CLK_EN: u1,
        /// Reserved
        REG_TM_60M_CLK_EN: u1,
        /// Reserved
        REG_TM_48M_CLK_EN: u1,
        /// Reserved
        REG_REF_20M_CLK_EN: u1,
        /// Reserved
        REG_TM_20M_CLK_EN: u1,
        padding: u22 = 0,
    }),
    /// Reserved
    /// offset: 0x30
    PERI_CLK_CTRL00: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_FLASH_CLK_SRC_SEL: u2,
        /// Reserved
        REG_FLASH_PLL_CLK_EN: u1,
        /// Reserved
        REG_FLASH_CORE_CLK_EN: u1,
        /// Reserved
        REG_FLASH_CORE_CLK_DIV_NUM: u8,
        /// Reserved
        REG_PSRAM_CLK_SRC_SEL: u2,
        /// Reserved
        REG_PSRAM_PLL_CLK_EN: u1,
        /// Reserved
        REG_PSRAM_CORE_CLK_EN: u1,
        /// Reserved
        REG_PSRAM_CORE_CLK_DIV_NUM: u8,
        /// Reserved
        REG_PAD_EMAC_REF_CLK_EN: u1,
        /// Reserved
        REG_EMAC_RMII_CLK_SRC_SEL: u2,
        /// Reserved
        REG_EMAC_RMII_CLK_EN: u1,
        /// Reserved
        REG_EMAC_RX_CLK_SRC_SEL: u1,
        /// Reserved
        REG_EMAC_RX_CLK_EN: u1,
        padding: u2 = 0,
    }),
    /// Reserved
    /// offset: 0x34
    PERI_CLK_CTRL01: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_EMAC_RX_CLK_DIV_NUM: u8,
        /// Reserved
        REG_EMAC_TX_CLK_SRC_SEL: u1,
        /// Reserved
        REG_EMAC_TX_CLK_EN: u1,
        /// Reserved
        REG_EMAC_TX_CLK_DIV_NUM: u8,
        /// Reserved
        REG_EMAC_PTP_REF_CLK_SRC_SEL: u1,
        /// Reserved
        REG_EMAC_PTP_REF_CLK_EN: u1,
        /// Reserved
        REG_EMAC_UNUSED0_CLK_EN: u1,
        /// Reserved
        REG_EMAC_UNUSED1_CLK_EN: u1,
        /// Reserved
        REG_SDIO_HS_MODE: u1,
        /// Reserved
        REG_SDIO_LS_CLK_SRC_SEL: u1,
        /// Reserved
        REG_SDIO_LS_CLK_EN: u1,
        padding: u7 = 0,
    }),
    /// Reserved
    /// offset: 0x38
    PERI_CLK_CTRL02: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_SDIO_LS_CLK_DIV_NUM: u8,
        /// Reserved
        REG_SDIO_LS_CLK_EDGE_CFG_UPDATE: u1,
        /// Reserved
        REG_SDIO_LS_CLK_EDGE_L: u4,
        /// Reserved
        REG_SDIO_LS_CLK_EDGE_H: u4,
        /// Reserved
        REG_SDIO_LS_CLK_EDGE_N: u4,
        /// Reserved
        REG_SDIO_LS_SLF_CLK_EDGE_SEL: u2,
        /// Reserved
        REG_SDIO_LS_DRV_CLK_EDGE_SEL: u2,
        /// Reserved
        REG_SDIO_LS_SAM_CLK_EDGE_SEL: u2,
        /// Reserved
        REG_SDIO_LS_SLF_CLK_EN: u1,
        /// Reserved
        REG_SDIO_LS_DRV_CLK_EN: u1,
        /// Reserved
        REG_SDIO_LS_SAM_CLK_EN: u1,
        /// Reserved
        REG_MIPI_DSI_DPHY_CLK_SRC_SEL: u2,
    }),
    /// Reserved
    /// offset: 0x3c
    PERI_CLK_CTRL03: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_MIPI_DSI_DPHY_CFG_CLK_EN: u1,
        /// Reserved
        REG_MIPI_DSI_DPHY_PLL_REFCLK_EN: u1,
        /// Reserved
        REG_MIPI_CSI_DPHY_CLK_SRC_SEL: u2,
        /// Reserved
        REG_MIPI_CSI_DPHY_CFG_CLK_EN: u1,
        /// Reserved
        REG_MIPI_DSI_DPICLK_SRC_SEL: u2,
        /// Reserved
        REG_MIPI_DSI_DPICLK_EN: u1,
        /// Reserved
        REG_MIPI_DSI_DPICLK_DIV_NUM: u8,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x40
    PERI_CLK_CTRL10: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_I2C0_CLK_SRC_SEL: u1,
        /// Reserved
        REG_I2C0_CLK_EN: u1,
        /// Reserved
        REG_I2C0_CLK_DIV_NUM: u8,
        /// Reserved
        REG_I2C0_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_I2C0_CLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_I2C1_CLK_SRC_SEL: u1,
        /// Reserved
        REG_I2C1_CLK_EN: u1,
        padding: u4 = 0,
    }),
    /// Reserved
    /// offset: 0x44
    PERI_CLK_CTRL11: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_I2C1_CLK_DIV_NUM: u8,
        /// Reserved
        REG_I2C1_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_I2C1_CLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_I2S0_RX_CLK_EN: u1,
        /// Reserved
        REG_I2S0_RX_CLK_SRC_SEL: u2,
        padding: u5 = 0,
    }),
    /// Reserved
    /// offset: 0x48
    PERI_CLK_CTRL12: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_I2S0_RX_DIV_N: u8,
        /// Reserved
        REG_I2S0_RX_DIV_X: u9,
        /// Reserved
        REG_I2S0_RX_DIV_Y: u9,
        padding: u6 = 0,
    }),
    /// Reserved
    /// offset: 0x4c
    PERI_CLK_CTRL13: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_I2S0_RX_DIV_Z: u9,
        /// Reserved
        REG_I2S0_RX_DIV_YN1: u1,
        /// Reserved
        REG_I2S0_TX_CLK_EN: u1,
        /// Reserved
        REG_I2S0_TX_CLK_SRC_SEL: u2,
        /// Reserved
        REG_I2S0_TX_DIV_N: u8,
        /// Reserved
        REG_I2S0_TX_DIV_X: u9,
        padding: u2 = 0,
    }),
    /// Reserved
    /// offset: 0x50
    PERI_CLK_CTRL14: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_I2S0_TX_DIV_Y: u9,
        /// Reserved
        REG_I2S0_TX_DIV_Z: u9,
        /// Reserved
        REG_I2S0_TX_DIV_YN1: u1,
        /// Reserved
        REG_I2S0_MST_CLK_SEL: u1,
        /// Reserved
        REG_I2S1_RX_CLK_EN: u1,
        /// Reserved
        REG_I2S1_RX_CLK_SRC_SEL: u2,
        /// Reserved
        REG_I2S1_RX_DIV_N: u8,
        padding: u1 = 0,
    }),
    /// Reserved
    /// offset: 0x54
    PERI_CLK_CTRL15: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_I2S1_RX_DIV_X: u9,
        /// Reserved
        REG_I2S1_RX_DIV_Y: u9,
        /// Reserved
        REG_I2S1_RX_DIV_Z: u9,
        /// Reserved
        REG_I2S1_RX_DIV_YN1: u1,
        /// Reserved
        REG_I2S1_TX_CLK_EN: u1,
        /// Reserved
        REG_I2S1_TX_CLK_SRC_SEL: u2,
        padding: u1 = 0,
    }),
    /// Reserved
    /// offset: 0x58
    PERI_CLK_CTRL16: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_I2S1_TX_DIV_N: u8,
        /// Reserved
        REG_I2S1_TX_DIV_X: u9,
        /// Reserved
        REG_I2S1_TX_DIV_Y: u9,
        padding: u6 = 0,
    }),
    /// Reserved
    /// offset: 0x5c
    PERI_CLK_CTRL17: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_I2S1_TX_DIV_Z: u9,
        /// Reserved
        REG_I2S1_TX_DIV_YN1: u1,
        /// Reserved
        REG_I2S1_MST_CLK_SEL: u1,
        /// Reserved
        REG_I2S2_RX_CLK_EN: u1,
        /// Reserved
        REG_I2S2_RX_CLK_SRC_SEL: u2,
        /// Reserved
        REG_I2S2_RX_DIV_N: u8,
        /// Reserved
        REG_I2S2_RX_DIV_X: u9,
        padding: u1 = 0,
    }),
    /// Reserved
    /// offset: 0x60
    PERI_CLK_CTRL18: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_I2S2_RX_DIV_Y: u9,
        /// Reserved
        REG_I2S2_RX_DIV_Z: u9,
        /// Reserved
        REG_I2S2_RX_DIV_YN1: u1,
        /// Reserved
        REG_I2S2_TX_CLK_EN: u1,
        /// Reserved
        REG_I2S2_TX_CLK_SRC_SEL: u2,
        /// Reserved
        REG_I2S2_TX_DIV_N: u8,
        padding: u2 = 0,
    }),
    /// Reserved
    /// offset: 0x64
    PERI_CLK_CTRL19: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_I2S2_TX_DIV_X: u9,
        /// Reserved
        REG_I2S2_TX_DIV_Y: u9,
        /// Reserved
        REG_I2S2_TX_DIV_Z: u9,
        /// Reserved
        REG_I2S2_TX_DIV_YN1: u1,
        /// Reserved
        REG_I2S2_MST_CLK_SEL: u1,
        /// Reserved
        REG_LCD_CLK_SRC_SEL: u2,
        /// Reserved
        REG_LCD_CLK_EN: u1,
    }),
    /// Reserved
    /// offset: 0x68
    PERI_CLK_CTRL110: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_LCD_CLK_DIV_NUM: u8,
        /// Reserved
        REG_LCD_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_LCD_CLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_UART0_CLK_SRC_SEL: u2,
        /// Reserved
        REG_UART0_CLK_EN: u1,
        padding: u5 = 0,
    }),
    /// Reserved
    /// offset: 0x6c
    PERI_CLK_CTRL111: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_UART0_SCLK_DIV_NUM: u8,
        /// Reserved
        REG_UART0_SCLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_UART0_SCLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_UART1_CLK_SRC_SEL: u2,
        /// Reserved
        REG_UART1_CLK_EN: u1,
        padding: u5 = 0,
    }),
    /// Reserved
    /// offset: 0x70
    PERI_CLK_CTRL112: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_UART1_SCLK_DIV_NUM: u8,
        /// Reserved
        REG_UART1_SCLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_UART1_SCLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_UART2_CLK_SRC_SEL: u2,
        /// Reserved
        REG_UART2_CLK_EN: u1,
        padding: u5 = 0,
    }),
    /// Reserved
    /// offset: 0x74
    PERI_CLK_CTRL113: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_UART2_SCLK_DIV_NUM: u8,
        /// Reserved
        REG_UART2_SCLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_UART2_SCLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_UART3_CLK_SRC_SEL: u2,
        /// Reserved
        REG_UART3_CLK_EN: u1,
        padding: u5 = 0,
    }),
    /// Reserved
    /// offset: 0x78
    PERI_CLK_CTRL114: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_UART3_SCLK_DIV_NUM: u8,
        /// Reserved
        REG_UART3_SCLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_UART3_SCLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_UART4_CLK_SRC_SEL: u2,
        /// Reserved
        REG_UART4_CLK_EN: u1,
        padding: u5 = 0,
    }),
    /// Reserved
    /// offset: 0x7c
    PERI_CLK_CTRL115: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_UART4_SCLK_DIV_NUM: u8,
        /// Reserved
        REG_UART4_SCLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_UART4_SCLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_TWAI0_CLK_SRC_SEL: u1,
        /// Reserved
        REG_TWAI0_CLK_EN: u1,
        /// Reserved
        REG_TWAI1_CLK_SRC_SEL: u1,
        /// Reserved
        REG_TWAI1_CLK_EN: u1,
        /// Reserved
        REG_TWAI2_CLK_SRC_SEL: u1,
        /// Reserved
        REG_TWAI2_CLK_EN: u1,
        padding: u2 = 0,
    }),
    /// Reserved
    /// offset: 0x80
    PERI_CLK_CTRL116: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPSPI2_CLK_SRC_SEL: u3,
        /// Reserved
        REG_GPSPI2_HS_CLK_EN: u1,
        /// Reserved
        REG_GPSPI2_HS_CLK_DIV_NUM: u8,
        /// Reserved
        REG_GPSPI2_MST_CLK_DIV_NUM: u8,
        /// Reserved
        REG_GPSPI2_MST_CLK_EN: u1,
        /// Reserved
        REG_GPSPI3_CLK_SRC_SEL: u3,
        /// Reserved
        REG_GPSPI3_HS_CLK_EN: u1,
        padding: u7 = 0,
    }),
    /// Reserved
    /// offset: 0x84
    PERI_CLK_CTRL117: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPSPI3_HS_CLK_DIV_NUM: u8,
        /// Reserved
        REG_GPSPI3_MST_CLK_DIV_NUM: u8,
        /// Reserved
        REG_GPSPI3_MST_CLK_EN: u1,
        /// Reserved
        REG_PARLIO_RX_CLK_SRC_SEL: u2,
        /// Reserved
        REG_PARLIO_RX_CLK_EN: u1,
        /// Reserved
        REG_PARLIO_RX_CLK_DIV_NUM: u8,
        padding: u4 = 0,
    }),
    /// Reserved
    /// offset: 0x88
    PERI_CLK_CTRL118: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PARLIO_RX_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_PARLIO_RX_CLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_PARLIO_TX_CLK_SRC_SEL: u2,
        /// Reserved
        REG_PARLIO_TX_CLK_EN: u1,
        /// Reserved
        REG_PARLIO_TX_CLK_DIV_NUM: u8,
        padding: u5 = 0,
    }),
    /// Reserved
    /// offset: 0x8c
    PERI_CLK_CTRL119: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PARLIO_TX_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_PARLIO_TX_CLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_I3C_MST_CLK_SRC_SEL: u2,
        /// Reserved
        REG_I3C_MST_CLK_EN: u1,
        /// Reserved
        REG_I3C_MST_CLK_DIV_NUM: u8,
        /// Reserved
        REG_CAM_CLK_SRC_SEL: u2,
        /// Reserved
        REG_CAM_CLK_EN: u1,
        padding: u2 = 0,
    }),
    /// Reserved
    /// offset: 0x90
    PERI_CLK_CTRL120: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_CAM_CLK_DIV_NUM: u8,
        /// Reserved
        REG_CAM_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_CAM_CLK_DIV_DENOMINATOR: u8,
        padding: u8 = 0,
    }),
    /// Reserved
    /// offset: 0x94
    PERI_CLK_CTRL20: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_MCPWM0_CLK_SRC_SEL: u2,
        /// Reserved
        REG_MCPWM0_CLK_EN: u1,
        /// Reserved
        REG_MCPWM0_CLK_DIV_NUM: u8,
        /// Reserved
        REG_MCPWM1_CLK_SRC_SEL: u2,
        /// Reserved
        REG_MCPWM1_CLK_EN: u1,
        /// Reserved
        REG_MCPWM1_CLK_DIV_NUM: u8,
        /// Reserved
        REG_TIMERGRP0_T0_SRC_SEL: u2,
        /// Reserved
        REG_TIMERGRP0_T0_CLK_EN: u1,
        /// Reserved
        REG_TIMERGRP0_T1_SRC_SEL: u2,
        /// Reserved
        REG_TIMERGRP0_T1_CLK_EN: u1,
        /// Reserved
        REG_TIMERGRP0_WDT_SRC_SEL: u2,
        /// Reserved
        REG_TIMERGRP0_WDT_CLK_EN: u1,
        /// Reserved
        REG_TIMERGRP0_TGRT_CLK_EN: u1,
    }),
    /// Reserved
    /// offset: 0x98
    PERI_CLK_CTRL21: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_TIMERGRP0_TGRT_CLK_SRC_SEL: u4,
        /// Reserved
        REG_TIMERGRP0_TGRT_CLK_DIV_NUM: u16,
        /// Reserved
        REG_TIMERGRP1_T0_SRC_SEL: u2,
        /// Reserved
        REG_TIMERGRP1_T0_CLK_EN: u1,
        /// Reserved
        REG_TIMERGRP1_T1_SRC_SEL: u2,
        /// Reserved
        REG_TIMERGRP1_T1_CLK_EN: u1,
        /// Reserved
        REG_TIMERGRP1_WDT_SRC_SEL: u2,
        /// Reserved
        REG_TIMERGRP1_WDT_CLK_EN: u1,
        /// Reserved
        REG_SYSTIMER_CLK_SRC_SEL: u1,
        /// Reserved
        REG_SYSTIMER_CLK_EN: u1,
        padding: u1 = 0,
    }),
    /// Reserved
    /// offset: 0x9c
    PERI_CLK_CTRL22: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_LEDC_CLK_SRC_SEL: u2,
        /// Reserved
        REG_LEDC_CLK_EN: u1,
        /// Reserved
        REG_RMT_CLK_SRC_SEL: u2,
        /// Reserved
        REG_RMT_CLK_EN: u1,
        /// Reserved
        REG_RMT_CLK_DIV_NUM: u8,
        /// Reserved
        REG_RMT_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_RMT_CLK_DIV_DENOMINATOR: u8,
        /// Reserved
        REG_ADC_CLK_SRC_SEL: u2,
    }),
    /// Reserved
    /// offset: 0xa0
    PERI_CLK_CTRL23: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_ADC_CLK_EN: u1,
        /// Reserved
        REG_ADC_CLK_DIV_NUM: u8,
        /// Reserved
        REG_ADC_CLK_DIV_NUMERATOR: u8,
        /// Reserved
        REG_ADC_CLK_DIV_DENOMINATOR: u8,
        padding: u7 = 0,
    }),
    /// Reserved
    /// offset: 0xa4
    PERI_CLK_CTRL24: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_ADC_SAR1_CLK_DIV_NUM: u8,
        /// Reserved
        REG_ADC_SAR2_CLK_DIV_NUM: u8,
        /// Reserved
        REG_PVT_CLK_DIV_NUM: u8,
        /// Reserved
        REG_PVT_CLK_EN: u1,
        padding: u7 = 0,
    }),
    /// Reserved
    /// offset: 0xa8
    PERI_CLK_CTRL25: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PVT_PERI_GROUP_CLK_DIV_NUM: u8,
        /// Reserved
        REG_PVT_PERI_GROUP1_CLK_EN: u1,
        /// Reserved
        REG_PVT_PERI_GROUP2_CLK_EN: u1,
        /// Reserved
        REG_PVT_PERI_GROUP3_CLK_EN: u1,
        /// Reserved
        REG_PVT_PERI_GROUP4_CLK_EN: u1,
        /// Reserved
        REG_CRYPTO_CLK_SRC_SEL: u2,
        /// Reserved
        REG_CRYPTO_AES_CLK_EN: u1,
        /// Reserved
        REG_CRYPTO_DS_CLK_EN: u1,
        /// Reserved
        REG_CRYPTO_ECC_CLK_EN: u1,
        /// Reserved
        REG_CRYPTO_HMAC_CLK_EN: u1,
        /// Reserved
        REG_CRYPTO_RSA_CLK_EN: u1,
        /// Reserved
        REG_CRYPTO_SEC_CLK_EN: u1,
        /// Reserved
        REG_CRYPTO_SHA_CLK_EN: u1,
        /// Reserved
        REG_CRYPTO_ECDSA_CLK_EN: u1,
        /// Reserved
        REG_CRYPTO_KM_CLK_EN: u1,
        /// Reserved
        REG_ISP_CLK_SRC_SEL: u2,
        /// Reserved
        REG_ISP_CLK_EN: u1,
        padding: u6 = 0,
    }),
    /// Reserved
    /// offset: 0xac
    PERI_CLK_CTRL26: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_ISP_CLK_DIV_NUM: u8,
        /// Reserved
        REG_IOMUX_CLK_SRC_SEL: u1,
        /// Reserved
        REG_IOMUX_CLK_EN: u1,
        /// Reserved
        REG_IOMUX_CLK_DIV_NUM: u8,
        /// Reserved
        REG_H264_CLK_SRC_SEL: u1,
        /// Reserved
        REG_H264_CLK_EN: u1,
        /// Reserved
        REG_H264_CLK_DIV_NUM: u8,
        /// Reserved
        REG_PADBIST_RX_CLK_SRC_SEL: u1,
        /// Reserved
        REG_PADBIST_RX_CLK_EN: u1,
        padding: u2 = 0,
    }),
    /// Reserved
    /// offset: 0xb0
    PERI_CLK_CTRL27: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PADBIST_RX_CLK_DIV_NUM: u8,
        /// Reserved
        REG_PADBIST_TX_CLK_SRC_SEL: u1,
        /// Reserved
        REG_PADBIST_TX_CLK_EN: u1,
        /// Reserved
        REG_PADBIST_TX_CLK_DIV_NUM: u8,
        padding: u14 = 0,
    }),
    /// Reserved
    /// offset: 0xb4
    CLK_FORCE_ON_CTRL0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_CPUICM_GATED_CLK_FORCE_ON: u1,
        /// Reserved
        REG_TCM_CPU_CLK_FORCE_ON: u1,
        /// Reserved
        REG_BUSMON_CPU_CLK_FORCE_ON: u1,
        /// Reserved
        REG_L1CACHE_CPU_CLK_FORCE_ON: u1,
        /// Reserved
        REG_L1CACHE_D_CPU_CLK_FORCE_ON: u1,
        /// Reserved
        REG_L1CACHE_I0_CPU_CLK_FORCE_ON: u1,
        /// Reserved
        REG_L1CACHE_I1_CPU_CLK_FORCE_ON: u1,
        /// Reserved
        REG_TRACE_CPU_CLK_FORCE_ON: u1,
        /// Reserved
        REG_TRACE_SYS_CLK_FORCE_ON: u1,
        /// Reserved
        REG_L1CACHE_MEM_CLK_FORCE_ON: u1,
        /// Reserved
        REG_L1CACHE_D_MEM_CLK_FORCE_ON: u1,
        /// Reserved
        REG_L1CACHE_I0_MEM_CLK_FORCE_ON: u1,
        /// Reserved
        REG_L1CACHE_I1_MEM_CLK_FORCE_ON: u1,
        /// Reserved
        REG_L2CACHE_MEM_CLK_FORCE_ON: u1,
        /// Reserved
        REG_L2MEM_MEM_CLK_FORCE_ON: u1,
        /// Reserved
        REG_SAR1_CLK_FORCE_ON: u1,
        /// Reserved
        REG_SAR2_CLK_FORCE_ON: u1,
        /// Reserved
        REG_GMAC_TX_CLK_FORCE_ON: u1,
        padding: u14 = 0,
    }),
    /// Reserved
    /// offset: 0xb8
    DPA_CTRL0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_SEC_DPA_LEVEL: u2,
        /// Reserved
        REG_SEC_DPA_CFG_SEL: u1,
        padding: u29 = 0,
    }),
    /// Reserved
    /// offset: 0xbc
    ANA_PLL_CTRL0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_PLLA_CAL_END: u1,
        /// Reserved
        REG_PLLA_CAL_STOP: u1,
        /// Reserved
        REG_CPU_PLL_CAL_END: u1,
        /// Reserved
        REG_CPU_PLL_CAL_STOP: u1,
        /// Reserved
        REG_SDIO_PLL_CAL_END: u1,
        /// Reserved
        REG_SDIO_PLL_CAL_STOP: u1,
        /// Reserved
        REG_SYS_PLL_CAL_END: u1,
        /// Reserved
        REG_SYS_PLL_CAL_STOP: u1,
        /// Reserved
        REG_MSPI_CAL_END: u1,
        /// Reserved
        REG_MSPI_CAL_STOP: u1,
        padding: u22 = 0,
    }),
    /// Reserved
    /// offset: 0xc0
    HP_RST_EN0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_RST_EN_CORECTRL: u1,
        /// Reserved
        REG_RST_EN_PVT_TOP: u1,
        /// Reserved
        REG_RST_EN_PVT_PERI_GROUP1: u1,
        /// Reserved
        REG_RST_EN_PVT_PERI_GROUP2: u1,
        /// Reserved
        REG_RST_EN_PVT_PERI_GROUP3: u1,
        /// Reserved
        REG_RST_EN_PVT_PERI_GROUP4: u1,
        /// Reserved
        REG_RST_EN_REGDMA: u1,
        /// Reserved
        REG_RST_EN_CORE0_GLOBAL: u1,
        /// Reserved
        REG_RST_EN_CORE1_GLOBAL: u1,
        /// Reserved
        REG_RST_EN_CORETRACE0: u1,
        /// Reserved
        REG_RST_EN_CORETRACE1: u1,
        /// Reserved
        REG_RST_EN_HP_TCM: u1,
        /// Reserved
        REG_RST_EN_HP_CACHE: u1,
        /// Reserved
        REG_RST_EN_L1_I0_CACHE: u1,
        /// Reserved
        REG_RST_EN_L1_I1_CACHE: u1,
        /// Reserved
        REG_RST_EN_L1_D_CACHE: u1,
        /// Reserved
        REG_RST_EN_L2_CACHE: u1,
        /// Reserved
        REG_RST_EN_L2_MEM: u1,
        /// Reserved
        REG_RST_EN_L2MEMMON: u1,
        /// Reserved
        REG_RST_EN_TCMMON: u1,
        /// Reserved
        REG_RST_EN_PVT_APB: u1,
        /// Reserved
        REG_RST_EN_GDMA: u1,
        /// Reserved
        REG_RST_EN_MSPI_AXI: u1,
        /// Reserved
        REG_RST_EN_DUAL_MSPI_AXI: u1,
        /// Reserved
        REG_RST_EN_MSPI_APB: u1,
        /// Reserved
        REG_RST_EN_DUAL_MSPI_APB: u1,
        /// Reserved
        REG_RST_EN_DSI_BRG: u1,
        /// Reserved
        REG_RST_EN_CSI_HOST: u1,
        /// Reserved
        REG_RST_EN_CSI_BRG: u1,
        /// Reserved
        REG_RST_EN_ISP: u1,
        /// Reserved
        REG_RST_EN_JPEG: u1,
        /// Reserved
        REG_RST_EN_DMA2D: u1,
    }),
    /// Reserved
    /// offset: 0xc4
    HP_RST_EN1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_RST_EN_PPA: u1,
        /// Reserved
        REG_RST_EN_AHB_PDMA: u1,
        /// Reserved
        REG_RST_EN_AXI_PDMA: u1,
        /// Reserved
        REG_RST_EN_IOMUX: u1,
        /// Reserved
        REG_RST_EN_PADBIST: u1,
        /// Reserved
        REG_RST_EN_STIMER: u1,
        /// Reserved
        REG_RST_EN_TIMERGRP0: u1,
        /// Reserved
        REG_RST_EN_TIMERGRP1: u1,
        /// Reserved
        REG_RST_EN_UART0_CORE: u1,
        /// Reserved
        REG_RST_EN_UART1_CORE: u1,
        /// Reserved
        REG_RST_EN_UART2_CORE: u1,
        /// Reserved
        REG_RST_EN_UART3_CORE: u1,
        /// Reserved
        REG_RST_EN_UART4_CORE: u1,
        /// Reserved
        REG_RST_EN_UART0_APB: u1,
        /// Reserved
        REG_RST_EN_UART1_APB: u1,
        /// Reserved
        REG_RST_EN_UART2_APB: u1,
        /// Reserved
        REG_RST_EN_UART3_APB: u1,
        /// Reserved
        REG_RST_EN_UART4_APB: u1,
        /// Reserved
        REG_RST_EN_UHCI: u1,
        /// Reserved
        REG_RST_EN_I3CMST: u1,
        /// Reserved
        REG_RST_EN_I3CSLV: u1,
        /// Reserved
        REG_RST_EN_I2C1: u1,
        /// Reserved
        REG_RST_EN_I2C0: u1,
        /// Reserved
        REG_RST_EN_RMT: u1,
        /// Reserved
        REG_RST_EN_PWM0: u1,
        /// Reserved
        REG_RST_EN_PWM1: u1,
        /// Reserved
        REG_RST_EN_CAN0: u1,
        /// Reserved
        REG_RST_EN_CAN1: u1,
        /// Reserved
        REG_RST_EN_CAN2: u1,
        /// Reserved
        REG_RST_EN_LEDC: u1,
        /// Reserved
        REG_RST_EN_PCNT: u1,
        /// Reserved
        REG_RST_EN_ETM: u1,
    }),
    /// Reserved
    /// offset: 0xc8
    HP_RST_EN2: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_RST_EN_INTRMTX: u1,
        /// Reserved
        REG_RST_EN_PARLIO: u1,
        /// Reserved
        REG_RST_EN_PARLIO_RX: u1,
        /// Reserved
        REG_RST_EN_PARLIO_TX: u1,
        /// Reserved
        REG_RST_EN_I2S0_APB: u1,
        /// Reserved
        REG_RST_EN_I2S1_APB: u1,
        /// Reserved
        REG_RST_EN_I2S2_APB: u1,
        /// Reserved
        REG_RST_EN_SPI2: u1,
        /// Reserved
        REG_RST_EN_SPI3: u1,
        /// Reserved
        REG_RST_EN_LCDCAM: u1,
        /// Reserved
        REG_RST_EN_ADC: u1,
        /// Reserved
        REG_RST_EN_BITSRAMBLER: u1,
        /// Reserved
        REG_RST_EN_BITSRAMBLER_RX: u1,
        /// Reserved
        REG_RST_EN_BITSRAMBLER_TX: u1,
        /// Reserved
        REG_RST_EN_CRYPTO: u1,
        /// Reserved
        REG_RST_EN_SEC: u1,
        /// Reserved
        REG_RST_EN_AES: u1,
        /// Reserved
        REG_RST_EN_DS: u1,
        /// Reserved
        REG_RST_EN_SHA: u1,
        /// Reserved
        REG_RST_EN_HMAC: u1,
        /// Reserved
        REG_RST_EN_ECDSA: u1,
        /// Reserved
        REG_RST_EN_RSA: u1,
        /// Reserved
        REG_RST_EN_ECC: u1,
        /// Reserved
        REG_RST_EN_KM: u1,
        /// Reserved
        REG_RST_EN_H264: u1,
        padding: u7 = 0,
    }),
    /// Reserved
    /// offset: 0xcc
    HP_FORCE_NORST0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_FORCE_NORST_CORE0: u1,
        /// Reserved
        REG_FORCE_NORST_CORE1: u1,
        /// Reserved
        REG_FORCE_NORST_CORETRACE0: u1,
        /// Reserved
        REG_FORCE_NORST_CORETRACE1: u1,
        /// Reserved
        REG_FORCE_NORST_L2MEMMON: u1,
        /// Reserved
        REG_FORCE_NORST_TCMMON: u1,
        /// Reserved
        REG_FORCE_NORST_GDMA: u1,
        /// Reserved
        REG_FORCE_NORST_MSPI_AXI: u1,
        /// Reserved
        REG_FORCE_NORST_DUAL_MSPI_AXI: u1,
        /// Reserved
        REG_FORCE_NORST_MSPI_APB: u1,
        /// Reserved
        REG_FORCE_NORST_DUAL_MSPI_APB: u1,
        /// Reserved
        REG_FORCE_NORST_DSI_BRG: u1,
        /// Reserved
        REG_FORCE_NORST_CSI_HOST: u1,
        /// Reserved
        REG_FORCE_NORST_CSI_BRG: u1,
        /// Reserved
        REG_FORCE_NORST_ISP: u1,
        /// Reserved
        REG_FORCE_NORST_JPEG: u1,
        /// Reserved
        REG_FORCE_NORST_DMA2D: u1,
        /// Reserved
        REG_FORCE_NORST_PPA: u1,
        /// Reserved
        REG_FORCE_NORST_AHB_PDMA: u1,
        /// Reserved
        REG_FORCE_NORST_AXI_PDMA: u1,
        /// Reserved
        REG_FORCE_NORST_IOMUX: u1,
        /// Reserved
        REG_FORCE_NORST_PADBIST: u1,
        /// Reserved
        REG_FORCE_NORST_STIMER: u1,
        /// Reserved
        REG_FORCE_NORST_TIMERGRP0: u1,
        /// Reserved
        REG_FORCE_NORST_TIMERGRP1: u1,
        /// Reserved
        REG_FORCE_NORST_UART0: u1,
        /// Reserved
        REG_FORCE_NORST_UART1: u1,
        /// Reserved
        REG_FORCE_NORST_UART2: u1,
        /// Reserved
        REG_FORCE_NORST_UART3: u1,
        /// Reserved
        REG_FORCE_NORST_UART4: u1,
        /// Reserved
        REG_FORCE_NORST_UHCI: u1,
        /// Reserved
        REG_FORCE_NORST_I3CMST: u1,
    }),
    /// Reserved
    /// offset: 0xd0
    HP_FORCE_NORST1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_FORCE_NORST_I3CSLV: u1,
        /// Reserved
        REG_FORCE_NORST_I2C1: u1,
        /// Reserved
        REG_FORCE_NORST_I2C0: u1,
        /// Reserved
        REG_FORCE_NORST_RMT: u1,
        /// Reserved
        REG_FORCE_NORST_PWM0: u1,
        /// Reserved
        REG_FORCE_NORST_PWM1: u1,
        /// Reserved
        REG_FORCE_NORST_CAN0: u1,
        /// Reserved
        REG_FORCE_NORST_CAN1: u1,
        /// Reserved
        REG_FORCE_NORST_CAN2: u1,
        /// Reserved
        REG_FORCE_NORST_LEDC: u1,
        /// Reserved
        REG_FORCE_NORST_PCNT: u1,
        /// Reserved
        REG_FORCE_NORST_ETM: u1,
        /// Reserved
        REG_FORCE_NORST_INTRMTX: u1,
        /// Reserved
        REG_FORCE_NORST_PARLIO: u1,
        /// Reserved
        REG_FORCE_NORST_PARLIO_RX: u1,
        /// Reserved
        REG_FORCE_NORST_PARLIO_TX: u1,
        /// Reserved
        REG_FORCE_NORST_I2S0: u1,
        /// Reserved
        REG_FORCE_NORST_I2S1: u1,
        /// Reserved
        REG_FORCE_NORST_I2S2: u1,
        /// Reserved
        REG_FORCE_NORST_SPI2: u1,
        /// Reserved
        REG_FORCE_NORST_SPI3: u1,
        /// Reserved
        REG_FORCE_NORST_LCDCAM: u1,
        /// Reserved
        REG_FORCE_NORST_ADC: u1,
        /// Reserved
        REG_FORCE_NORST_BITSRAMBLER: u1,
        /// Reserved
        REG_FORCE_NORST_BITSRAMBLER_RX: u1,
        /// Reserved
        REG_FORCE_NORST_BITSRAMBLER_TX: u1,
        /// Reserved
        REG_FORCE_NORST_H264: u1,
        padding: u5 = 0,
    }),
    /// Reserved
    /// offset: 0xd4
    HPWDT_CORE0_RST_CTRL0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_HPCORE0_STALL_EN: u1,
        /// Reserved
        REG_HPCORE0_STALL_WAIT_NUM: u8,
        /// Reserved
        REG_WDT_HPCORE0_RST_LEN: u8,
        padding: u15 = 0,
    }),
    /// Reserved
    /// offset: 0xd8
    HPWDT_CORE1_RST_CTRL0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_HPCORE1_STALL_EN: u1,
        /// Reserved
        REG_HPCORE1_STALL_WAIT_NUM: u8,
        /// Reserved
        REG_WDT_HPCORE1_RST_LEN: u8,
        padding: u15 = 0,
    }),
    /// CPU Source Frequency
    /// offset: 0xdc
    CPU_SRC_FREQ0: mmio.Mmio(packed struct(u32) {
        /// cpu source clock frequency, step by 0.25MHz
        REG_CPU_SRC_FREQ: u32,
    }),
    /// CPU Clock Status
    /// offset: 0xe0
    CPU_CLK_STATUS0: mmio.Mmio(packed struct(u32) {
        /// 0: ASIC mode, 1: FPGA mode
        REG_ASIC_OR_FPGA: u1,
        /// 0: Divider bypass, 1: Divider takes effect
        REG_CPU_DIV_EFFECT: u1,
        /// 0: CPU source isn't cpll_400m, 1: CPU Source is cll_400m
        REG_CPU_SRC_IS_CPLL: u1,
        /// cpu current div number
        REG_CPU_DIV_NUM_CUR: u8,
        /// cpu current div numerator
        REG_CPU_DIV_NUMERATOR_CUR: u8,
        /// cpu current div denominator
        REG_CPU_DIV_DENOMINATOR_CUR: u8,
        padding: u5 = 0,
    }),
    /// Reserved
    /// offset: 0xe4
    DBG_CLK_CTRL0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_DBG_CH0_SEL: u8,
        /// Reserved
        REG_DBG_CH1_SEL: u8,
        /// Reserved
        REG_DBG_CH2_SEL: u8,
        /// Reserved
        REG_DBG_CH0_DIV_NUM: u8,
    }),
    /// Reserved
    /// offset: 0xe8
    DBG_CLK_CTRL1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_DBG_CH1_DIV_NUM: u8,
        /// Reserved
        REG_DBG_CH2_DIV_NUM: u8,
        /// Reserved
        REG_DBG_CH0_EN: u1,
        /// Reserved
        REG_DBG_CH1_EN: u1,
        /// Reserved
        REG_DBG_CH2_EN: u1,
        padding: u13 = 0,
    }),
    /// Reserved
    /// offset: 0xec
    HPCORE_WDT_RESET_SOURCE0: mmio.Mmio(packed struct(u32) {
        /// 1'b0: use wdt0 to reset hpcore0, 1'b1: use wdt1 to reset hpcore0
        REG_HPCORE0_WDT_RESET_SOURCE_SEL: u1,
        /// 1'b0: use wdt0 to reset hpcore1, 1'b1: use wdt1 to reset hpcore1
        REG_HPCORE1_WDT_RESET_SOURCE_SEL: u1,
        padding: u30 = 0,
    }),
};
