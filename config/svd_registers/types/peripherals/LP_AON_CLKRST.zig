const mmio = @import("mmio");
const types = @import("../../types.zig");

/// LP_AON_CLKRST Peripheral
pub const LP_AON_CLKRST = extern struct {
    /// need_des
    /// offset: 0x00
    LP_AONCLKRST_LP_CLK_CONF: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_AONCLKRST_SLOW_CLK_SEL: u2,
        /// need_des
        LP_AONCLKRST_FAST_CLK_SEL: u2,
        /// need_des
        LP_AONCLKRST_LP_PERI_DIV_NUM: u6,
        /// need_des
        LP_AONCLKRST_ANA_SEL_REF_PLL8M: u1,
        padding: u21 = 0,
    }),
    /// need_des
    /// offset: 0x04
    LP_AONCLKRST_LP_CLK_PO_EN: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_AONCLKRST_CLK_CORE_EFUSE_OEN: u1,
        /// need_des
        LP_AONCLKRST_CLK_LP_BUS_OEN: u1,
        /// need_des
        LP_AONCLKRST_CLK_AON_SLOW_OEN: u1,
        /// need_des
        LP_AONCLKRST_CLK_AON_FAST_OEN: u1,
        /// need_des
        LP_AONCLKRST_CLK_SLOW_OEN: u1,
        /// need_des
        LP_AONCLKRST_CLK_FAST_OEN: u1,
        /// need_des
        LP_AONCLKRST_CLK_FOSC_OEN: u1,
        /// need_des
        LP_AONCLKRST_CLK_RC32K_OEN: u1,
        /// need_des
        LP_AONCLKRST_CLK_SXTAL_OEN: u1,
        /// 1'b1: probe sosc clk on 1'b0: probe sosc clk off
        LP_AONCLKRST_CLK_SOSC_OEN: u1,
        padding: u22 = 0,
    }),
    /// need_des
    /// offset: 0x08
    LP_AONCLKRST_LP_CLK_EN: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        LP_AONCLKRST_LP_RTC_XTAL_FORCE_ON: u1,
        /// need_des
        LP_AONCLKRST_CK_EN_LP_RAM: u1,
        /// need_des
        LP_AONCLKRST_ETM_EVENT_TICK_EN: u1,
        /// need_des
        LP_AONCLKRST_PLL8M_CLK_FORCE_ON: u1,
        /// need_des
        LP_AONCLKRST_XTAL_CLK_FORCE_ON: u1,
        /// need_des
        LP_AONCLKRST_FOSC_CLK_FORCE_ON: u1,
    }),
    /// need_des
    /// offset: 0x0c
    LP_AONCLKRST_LP_RST_EN: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// need_des
        LP_AONCLKRST_RST_EN_LP_HUK: u1,
        /// need_des
        LP_AONCLKRST_RST_EN_LP_ANAPERI: u1,
        /// need_des
        LP_AONCLKRST_RST_EN_LP_WDT: u1,
        /// need_des
        LP_AONCLKRST_RST_EN_LP_TIMER: u1,
        /// need_des
        LP_AONCLKRST_RST_EN_LP_RTC: u1,
        /// need_des
        LP_AONCLKRST_RST_EN_LP_MAILBOX: u1,
        /// need_des
        LP_AONCLKRST_RST_EN_LP_AONEFUSEREG: u1,
        /// need_des
        LP_AONCLKRST_RST_EN_LP_RAM: u1,
    }),
    /// need_des
    /// offset: 0x10
    LP_AONCLKRST_RESET_CAUSE: mmio.Mmio(packed struct(u32) {
        /// 6'h1: POR reset 6'h9: PMU LP PERI power down reset 6'ha: PMU LP CPU reset 6'hf: brown out reset 6'h10: LP watchdog chip reset 6'h12: super watch dog reset 6'h13: glitch reset 6'h14: software reset
        LP_AONCLKRST_LPCORE_RESET_CAUSE: u6,
        /// need_des
        LP_AONCLKRST_LPCORE_RESET_FLAG: u1,
        /// 6'h1: POR reset 6'h3: digital system software reset 6'h5: PMU HP system power down reset 6'h7: HP system reset from HP watchdog 6'h9: HP system reset from LP watchdog 6'hb: HP core reset from HP watchdog 6'hc: HP core software reset 6'hd: HP core reset from LP watchdog 6'hf: brown out reset 6'h10: LP watchdog chip reset 6'h12: super watch dog reset 6'h13: glitch reset 6'h14: efuse crc error reset 6'h16: HP usb jtag chip reset 6'h17: HP usb uart chip reset 6'h18: HP jtag reset 6'h1a: HP core lockup
        LP_AONCLKRST_HPCORE0_RESET_CAUSE: u6,
        /// need_des
        LP_AONCLKRST_HPCORE0_RESET_FLAG: u1,
        /// 6'h1: POR reset 6'h3: digital system software reset 6'h5: PMU HP system power down reset 6'h7: HP system reset from HP watchdog 6'h9: HP system reset from LP watchdog 6'hb: HP core reset from HP watchdog 6'hc: HP core software reset 6'hd: HP core reset from LP watchdog 6'hf: brown out reset 6'h10: LP watchdog chip reset 6'h12: super watch dog reset 6'h13: glitch reset 6'h14: efuse crc error reset 6'h16: HP usb jtag chip reset 6'h17: HP usb uart chip reset 6'h18: HP jtag reset 6'h1a: HP core lockup
        LP_AONCLKRST_HPCORE1_RESET_CAUSE: u6,
        /// need_des
        LP_AONCLKRST_HPCORE1_RESET_FLAG: u1,
        reserved25: u4 = 0,
        /// 1'b0: enable lpcore pmu_lp_cpu_reset reset_cause, 1'b1: disable lpcore pmu_lp_cpu_reset reset_cause
        LP_AONCLKRST_LPCORE_RESET_CAUSE_PMU_LP_CPU_MASK: u1,
        /// need_des
        LP_AONCLKRST_LPCORE_RESET_CAUSE_CLR: u1,
        /// need_des
        LP_AONCLKRST_LPCORE_RESET_FLAG_CLR: u1,
        /// need_des
        LP_AONCLKRST_HPCORE0_RESET_CAUSE_CLR: u1,
        /// need_des
        LP_AONCLKRST_HPCORE0_RESET_FLAG_CLR: u1,
        /// need_des
        LP_AONCLKRST_HPCORE1_RESET_CAUSE_CLR: u1,
        /// need_des
        LP_AONCLKRST_HPCORE1_RESET_FLAG_CLR: u1,
    }),
    /// need_des
    /// offset: 0x14
    LP_AONCLKRST_HPCPU_RESET_CTRL0: mmio.Mmio(packed struct(u32) {
        /// write 1 to enable hpcore0 lockup reset feature, write 0 to disable hpcore0 lockup reset feature
        LP_AONCLKRST_HPCORE0_LOCKUP_RESET_EN: u1,
        /// need_des
        LP_AONCLKRST_LP_WDT_HPCORE0_RESET_LENGTH: u3,
        /// write 1 to enable lp_wdt reset hpcore0 feature, write 0 to disable lp_wdt reset hpcore0 feature
        LP_AONCLKRST_LP_WDT_HPCORE0_RESET_EN: u1,
        /// need_des
        LP_AONCLKRST_HPCORE0_STALL_WAIT: u7,
        /// need_des
        LP_AONCLKRST_HPCORE0_STALL_EN: u1,
        /// need_des
        LP_AONCLKRST_HPCORE0_SW_RESET: u1,
        /// need_des
        LP_AONCLKRST_HPCORE0_OCD_HALT_ON_RESET: u1,
        /// 1'b1: boot from HP TCM ROM: 0x4FC00000 1'b0: boot from LP TCM RAM: 0x50108000
        LP_AONCLKRST_HPCORE0_STAT_VECTOR_SEL: u1,
        /// write 1 to enable hpcore1 lockup reset feature, write 0 to disable hpcore1 lockup reset feature
        LP_AONCLKRST_HPCORE1_LOCKUP_RESET_EN: u1,
        /// need_des
        LP_AONCLKRST_LP_WDT_HPCORE1_RESET_LENGTH: u3,
        /// write 1 to enable lp_wdt reset hpcore1 feature, write 0 to disable lp_wdt reset hpcore1 feature
        LP_AONCLKRST_LP_WDT_HPCORE1_RESET_EN: u1,
        /// need_des
        LP_AONCLKRST_HPCORE1_STALL_WAIT: u7,
        /// need_des
        LP_AONCLKRST_HPCORE1_STALL_EN: u1,
        /// need_des
        LP_AONCLKRST_HPCORE1_SW_RESET: u1,
        /// need_des
        LP_AONCLKRST_HPCORE1_OCD_HALT_ON_RESET: u1,
        /// 1'b1: boot from HP TCM ROM: 0x4FC00000 1'b0: boot from LP TCM RAM: 0x50108000
        LP_AONCLKRST_HPCORE1_STAT_VECTOR_SEL: u1,
    }),
    /// need_des
    /// offset: 0x18
    LP_AONCLKRST_HPCPU_RESET_CTRL1: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// HP core0 software stall when set to 8'h86
        LP_AONCLKRST_HPCORE0_SW_STALL_CODE: u8,
        /// HP core1 software stall when set to 8'h86
        LP_AONCLKRST_HPCORE1_SW_STALL_CODE: u8,
    }),
    /// need_des
    /// offset: 0x1c
    LP_AONCLKRST_FOSC_CNTL: mmio.Mmio(packed struct(u32) {
        reserved22: u22 = 0,
        /// need_des
        LP_AONCLKRST_FOSC_DFREQ: u10,
    }),
    /// need_des
    /// offset: 0x20
    LP_AONCLKRST_RC32K_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_AONCLKRST_RC32K_DFREQ: u32,
    }),
    /// need_des
    /// offset: 0x24
    LP_AONCLKRST_SOSC_CNTL: mmio.Mmio(packed struct(u32) {
        reserved22: u22 = 0,
        /// need_des
        LP_AONCLKRST_SOSC_DFREQ: u10,
    }),
    /// need_des
    /// offset: 0x28
    LP_AONCLKRST_CLK_TO_HP: mmio.Mmio(packed struct(u32) {
        reserved28: u28 = 0,
        /// reserved
        LP_AONCLKRST_ICG_HP_XTAL32K: u1,
        /// reserved
        LP_AONCLKRST_ICG_HP_SOSC: u1,
        /// reserved
        LP_AONCLKRST_ICG_HP_OSC32K: u1,
        /// reserved
        LP_AONCLKRST_ICG_HP_FOSC: u1,
    }),
    /// need_des
    /// offset: 0x2c
    LP_AONCLKRST_LPMEM_FORCE: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// reserved
        LP_AONCLKRST_LPMEM_CLK_FORCE_ON: u1,
    }),
    /// need_des
    /// offset: 0x30
    LP_AONCLKRST_XTAL32K: mmio.Mmio(packed struct(u32) {
        reserved22: u22 = 0,
        /// need_des
        LP_AONCLKRST_DRES_XTAL32K: u3,
        /// need_des
        LP_AONCLKRST_DGM_XTAL32K: u3,
        /// need_des
        LP_AONCLKRST_DBUF_XTAL32K: u1,
        /// need_des
        LP_AONCLKRST_DAC_XTAL32K: u3,
    }),
    /// need_des
    /// offset: 0x34
    LP_AONCLKRST_MUX_HPSYS_RESET_BYPASS: mmio.Mmio(packed struct(u32) {
        /// reserved
        LP_AONCLKRST_MUX_HPSYS_RESET_BYPASS: u32,
    }),
    /// need_des
    /// offset: 0x38
    LP_AONCLKRST_HPSYS_0_RESET_BYPASS: mmio.Mmio(packed struct(u32) {
        /// reserved
        LP_AONCLKRST_HPSYS_0_RESET_BYPASS: u32,
    }),
    /// need_des
    /// offset: 0x3c
    LP_AONCLKRST_HPSYS_APM_RESET_BYPASS: mmio.Mmio(packed struct(u32) {
        /// reserved
        LP_AONCLKRST_HPSYS_APM_RESET_BYPASS: u32,
    }),
    /// HP Clock Control Register.
    /// offset: 0x40
    LP_AONCLKRST_HP_CLK_CTRL: mmio.Mmio(packed struct(u32) {
        /// HP SoC Root Clock Source Select. 2'd0: xtal_40m, 2'd1: cpll_400m, 2'd2: fosc_20m.
        LP_AONCLKRST_HP_ROOT_CLK_SRC_SEL: u2,
        /// HP SoC Root Clock Enable.
        LP_AONCLKRST_HP_ROOT_CLK_EN: u1,
        /// PARLIO TX Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_PARLIO_TX_CLK_EN: u1,
        /// PARLIO RX Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_PARLIO_RX_CLK_EN: u1,
        /// UART4 SLP Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_UART4_SLP_CLK_EN: u1,
        /// UART3 SLP Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_UART3_SLP_CLK_EN: u1,
        /// UART2 SLP Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_UART2_SLP_CLK_EN: u1,
        /// UART1 SLP Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_UART1_SLP_CLK_EN: u1,
        /// UART0 SLP Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_UART0_SLP_CLK_EN: u1,
        /// I2S2 MCLK Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_I2S2_MCLK_EN: u1,
        /// I2S1 MCLK Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_I2S1_MCLK_EN: u1,
        /// I2S0 MCLK Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_I2S0_MCLK_EN: u1,
        /// EMAC RX Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_EMAC_TX_CLK_EN: u1,
        /// EMAC TX Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_EMAC_RX_CLK_EN: u1,
        /// EMAC TXRX Clock From Pad Enable.
        LP_AONCLKRST_HP_PAD_EMAC_TXRX_CLK_EN: u1,
        /// XTAL 32K Clock Enable.
        LP_AONCLKRST_HP_XTAL_32K_CLK_EN: u1,
        /// RC 32K Clock Enable.
        LP_AONCLKRST_HP_RC_32K_CLK_EN: u1,
        /// SOSC 150K Clock Enable.
        LP_AONCLKRST_HP_SOSC_150K_CLK_EN: u1,
        /// PLL 8M Clock Enable.
        LP_AONCLKRST_HP_PLL_8M_CLK_EN: u1,
        /// AUDIO PLL Clock Enable.
        LP_AONCLKRST_HP_AUDIO_PLL_CLK_EN: u1,
        /// SDIO PLL2 Clock Enable.
        LP_AONCLKRST_HP_SDIO_PLL2_CLK_EN: u1,
        /// SDIO PLL1 Clock Enable.
        LP_AONCLKRST_HP_SDIO_PLL1_CLK_EN: u1,
        /// SDIO PLL0 Clock Enable.
        LP_AONCLKRST_HP_SDIO_PLL0_CLK_EN: u1,
        /// FOSC 20M Clock Enable.
        LP_AONCLKRST_HP_FOSC_20M_CLK_EN: u1,
        /// XTAL 40M Clock Enalbe.
        LP_AONCLKRST_HP_XTAL_40M_CLK_EN: u1,
        /// CPLL 400M Clock Enable.
        LP_AONCLKRST_HP_CPLL_400M_CLK_EN: u1,
        /// SPLL 480M Clock Enable.
        LP_AONCLKRST_HP_SPLL_480M_CLK_EN: u1,
        /// MPLL 500M Clock Enable.
        LP_AONCLKRST_HP_MPLL_500M_CLK_EN: u1,
        padding: u3 = 0,
    }),
    /// HP USB Clock Reset Control Register.
    /// offset: 0x44
    LP_AONCLKRST_HP_USB_CLKRST_CTRL0: mmio.Mmio(packed struct(u32) {
        /// unused.
        LP_AONCLKRST_USB_OTG20_SLEEP_MODE: u1,
        /// unused.
        LP_AONCLKRST_USB_OTG20_BK_SYS_CLK_EN: u1,
        /// unused.
        LP_AONCLKRST_USB_OTG11_SLEEP_MODE: u1,
        /// unused.
        LP_AONCLKRST_USB_OTG11_BK_SYS_CLK_EN: u1,
        /// usb otg11 fs phy clock enable.
        LP_AONCLKRST_USB_OTG11_48M_CLK_EN: u1,
        /// usb device fs phy clock enable.
        LP_AONCLKRST_USB_DEVICE_48M_CLK_EN: u1,
        /// usb 480m to 25m divide number.
        LP_AONCLKRST_USB_48M_DIV_NUM: u8,
        /// usb 500m to 25m divide number.
        LP_AONCLKRST_USB_25M_DIV_NUM: u8,
        /// usb 480m to 12m divide number.
        LP_AONCLKRST_USB_12M_DIV_NUM: u8,
        padding: u2 = 0,
    }),
    /// HP USB Clock Reset Control Register.
    /// offset: 0x48
    LP_AONCLKRST_HP_USB_CLKRST_CTRL1: mmio.Mmio(packed struct(u32) {
        /// usb otg20 adp reset en
        LP_AONCLKRST_RST_EN_USB_OTG20_ADP: u1,
        /// usb otg20 phy reset en
        LP_AONCLKRST_RST_EN_USB_OTG20_PHY: u1,
        /// usb otg20 reset en
        LP_AONCLKRST_RST_EN_USB_OTG20: u1,
        /// usb org11 reset en
        LP_AONCLKRST_RST_EN_USB_OTG11: u1,
        /// usb device reset en
        LP_AONCLKRST_RST_EN_USB_DEVICE: u1,
        reserved28: u23 = 0,
        /// usb otg20 hs phy src sel. 2'd0: 12m, 2'd1: 25m, 2'd2: pad_hsphy_refclk.
        LP_AONCLKRST_USB_OTG20_PHYREF_CLK_SRC_SEL: u2,
        /// usb otg20 hs phy refclk enable.
        LP_AONCLKRST_USB_OTG20_PHYREF_CLK_EN: u1,
        /// usb otg20 ulpi clock enable.
        LP_AONCLKRST_USB_OTG20_ULPI_CLK_EN: u1,
    }),
    /// need_des
    /// offset: 0x4c
    LP_AONCLKRST_HP_SDMMC_EMAC_RST_CTRL: mmio.Mmio(packed struct(u32) {
        reserved28: u28 = 0,
        /// hp sdmmc reset en
        LP_AONCLKRST_RST_EN_SDMMC: u1,
        /// hp sdmmc force norst
        LP_AONCLKRST_FORCE_NORST_SDMMC: u1,
        /// hp emac reset en
        LP_AONCLKRST_RST_EN_EMAC: u1,
        /// hp emac force norst
        LP_AONCLKRST_FORCE_NORST_EMAC: u1,
    }),
    /// offset: 0x50
    reserved80: [940]u8,
    /// need_des
    /// offset: 0x3fc
    LP_AONCLKRST_DATE: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_AONCLKRST_CLK_EN: u1,
    }),
};
