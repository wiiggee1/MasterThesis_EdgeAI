const mmio = @import("mmio");
const types = @import("../../types.zig");

/// LP_SYS Peripheral
pub const LP_SYS = extern struct {
    /// need_des
    /// offset: 0x00
    LP_SYS_VER_DATE: mmio.Mmio(packed struct(u32) {
        /// need_des
        VER_DATE: u32,
    }),
    /// need_des
    /// offset: 0x04
    CLK_SEL_CTRL: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// reserved
        ENA_SW_SEL_SYS_CLK: u1,
        /// reserved
        SW_SYS_CLK_SRC_SEL: u1,
        padding: u14 = 0,
    }),
    /// need_des
    /// offset: 0x08
    SYS_CTRL: mmio.Mmio(packed struct(u32) {
        /// lp cpu disable
        LP_CORE_DISABLE: u1,
        /// digital system software reset bit
        SYS_SW_RST: u1,
        /// need_des
        FORCE_DOWNLOAD_BOOT: u1,
        /// need_des
        DIG_FIB: u8,
        /// reset disable bit for LP IOMUX
        IO_MUX_RESET_DISABLE: u1,
        reserved14: u2 = 0,
        /// need_des
        ANA_FIB: u7,
        /// need_des
        LP_FIB_SEL: u8,
        /// need_des
        LP_CORE_ETM_WAKEUP_FLAG_CLR: u1,
        /// need_des
        LP_CORE_ETM_WAKEUP_FLAG: u1,
        /// 0: use systimer_stall signal from hp_core0, 1: use systimer_stall signal from hp_core1
        SYSTIMER_STALL_SEL: u1,
    }),
    /// need_des
    /// offset: 0x0c
    LP_CLK_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        CLK_EN: u1,
        reserved14: u13 = 0,
        /// reserved
        LP_FOSC_HP_CKEN: u1,
        padding: u17 = 0,
    }),
    /// need_des
    /// offset: 0x10
    LP_RST_CTRL: mmio.Mmio(packed struct(u32) {
        /// analog source reset bypass : wdt,brown out,super wdt,glitch
        ANA_RST_BYPASS: u1,
        /// system source reset bypass : software reset,hp wdt,lp wdt,efuse
        SYS_RST_BYPASS: u1,
        /// efuse force no reset control
        EFUSE_FORCE_NORST: u1,
        padding: u29 = 0,
    }),
    /// offset: 0x14
    reserved20: [4]u8,
    /// need_des
    /// offset: 0x18
    LP_CORE_BOOT_ADDR: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_CPU_BOOT_ADDR: u32,
    }),
    /// need_des
    /// offset: 0x1c
    EXT_WAKEUP1: mmio.Mmio(packed struct(u32) {
        /// Bitmap to select RTC pads for ext wakeup1
        SEL: u16,
        /// clear ext wakeup1 status
        STATUS_CLR: u1,
        padding: u15 = 0,
    }),
    /// need_des
    /// offset: 0x20
    EXT_WAKEUP1_STATUS: mmio.Mmio(packed struct(u32) {
        /// ext wakeup1 status
        EXT_WAKEUP1_STATUS: u16,
        padding: u16 = 0,
    }),
    /// need_des
    /// offset: 0x24
    LP_TCM_PWR_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// need_des
        LP_TCM_ROM_CLK_FORCE_ON: u1,
        reserved7: u1 = 0,
        /// need_des
        LP_TCM_RAM_CLK_FORCE_ON: u1,
        padding: u24 = 0,
    }),
    /// need_des
    /// offset: 0x28
    BOOT_ADDR_HP_LP: mmio.Mmio(packed struct(u32) {
        /// need_des
        BOOT_ADDR_HP_LP: u32,
    }),
    /// need_des
    /// offset: 0x2c
    LP_STORE0: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH0: u32,
    }),
    /// need_des
    /// offset: 0x30
    LP_STORE1: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH1: u32,
    }),
    /// need_des
    /// offset: 0x34
    LP_STORE2: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH2: u32,
    }),
    /// need_des
    /// offset: 0x38
    LP_STORE3: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH3: u32,
    }),
    /// need_des
    /// offset: 0x3c
    LP_STORE4: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH4: u32,
    }),
    /// need_des
    /// offset: 0x40
    LP_STORE5: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH5: u32,
    }),
    /// need_des
    /// offset: 0x44
    LP_STORE6: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH6: u32,
    }),
    /// need_des
    /// offset: 0x48
    LP_STORE7: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH7: u32,
    }),
    /// need_des
    /// offset: 0x4c
    LP_STORE8: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH8: u32,
    }),
    /// need_des
    /// offset: 0x50
    LP_STORE9: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH9: u32,
    }),
    /// need_des
    /// offset: 0x54
    LP_STORE10: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH10: u32,
    }),
    /// need_des
    /// offset: 0x58
    LP_STORE11: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH11: u32,
    }),
    /// need_des
    /// offset: 0x5c
    LP_STORE12: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH12: u32,
    }),
    /// need_des
    /// offset: 0x60
    LP_STORE13: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH13: u32,
    }),
    /// need_des
    /// offset: 0x64
    LP_STORE14: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH14: u32,
    }),
    /// need_des
    /// offset: 0x68
    LP_STORE15: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_SCRATCH15: u32,
    }),
    /// need_des
    /// offset: 0x6c
    LP_PROBEA_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        PROBE_A_MOD_SEL: u16,
        /// need_des
        PROBE_A_TOP_SEL: u8,
        /// need_des
        PROBE_L_SEL: u2,
        /// need_des
        PROBE_H_SEL: u2,
        /// need_des
        PROBE_GLOBAL_EN: u1,
        padding: u3 = 0,
    }),
    /// need_des
    /// offset: 0x70
    LP_PROBEB_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        PROBE_B_MOD_SEL: u16,
        /// need_des
        PROBE_B_TOP_SEL: u8,
        /// need_des
        PROBE_B_EN: u1,
        padding: u7 = 0,
    }),
    /// need_des
    /// offset: 0x74
    LP_PROBE_OUT: mmio.Mmio(packed struct(u32) {
        /// need_des
        PROBE_TOP_OUT: u32,
    }),
    /// offset: 0x78
    reserved120: [36]u8,
    /// need_des
    /// offset: 0x9c
    F2S_APB_BRG_CNTL: mmio.Mmio(packed struct(u32) {
        /// reserved
        F2S_APB_POSTW_EN: u1,
        padding: u31 = 0,
    }),
    /// offset: 0xa0
    reserved160: [96]u8,
    /// need_des
    /// offset: 0x100
    USB_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        SW_HW_USB_PHY_SEL: u1,
        /// need_des
        SW_USB_PHY_SEL: u1,
        /// clear usb wakeup to PMU.
        USBOTG20_WAKEUP_CLR: u1,
        /// indicate usb otg2.0 is in suspend state.
        USBOTG20_IN_SUSPEND: u1,
        padding: u28 = 0,
    }),
    /// offset: 0x104
    reserved260: [8]u8,
    /// need_des
    /// offset: 0x10c
    ANA_XPD_PAD_GROUP: mmio.Mmio(packed struct(u32) {
        /// Set 1 to power up pad group
        ANA_REG_XPD_PAD_GROUP: u8,
        padding: u24 = 0,
    }),
    /// need_des
    /// offset: 0x110
    LP_TCM_RAM_RDN_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_TCM_RAM_RDN_ECO_EN: u1,
        /// need_des
        LP_TCM_RAM_RDN_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
    /// need_des
    /// offset: 0x114
    LP_TCM_RAM_RDN_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_TCM_RAM_RDN_ECO_LOW: u32,
    }),
    /// need_des
    /// offset: 0x118
    LP_TCM_RAM_RDN_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_TCM_RAM_RDN_ECO_HIGH: u32,
    }),
    /// need_des
    /// offset: 0x11c
    LP_TCM_ROM_RDN_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_TCM_ROM_RDN_ECO_EN: u1,
        /// need_des
        LP_TCM_ROM_RDN_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
    /// need_des
    /// offset: 0x120
    LP_TCM_ROM_RDN_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_TCM_ROM_RDN_ECO_LOW: u32,
    }),
    /// need_des
    /// offset: 0x124
    LP_TCM_ROM_RDN_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_TCM_ROM_RDN_ECO_HIGH: u32,
    }),
    /// offset: 0x128
    reserved296: [8]u8,
    /// need_des
    /// offset: 0x130
    HP_ROOT_CLK_CTRL: mmio.Mmio(packed struct(u32) {
        /// clock gate enable for hp cpu root 400M clk
        CPU_CLK_EN: u1,
        /// clock gate enable for hp sys root 480M clk
        SYS_CLK_EN: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x134
    reserved308: [4]u8,
    /// need_des
    /// offset: 0x138
    LP_PMU_RDN_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// need_des
        PMU_RDN_ECO_LOW: u32,
    }),
    /// need_des
    /// offset: 0x13c
    LP_PMU_RDN_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// need_des
        PMU_RDN_ECO_HIGH: u32,
    }),
    /// offset: 0x140
    reserved320: [8]u8,
    /// need_des
    /// offset: 0x148
    PAD_COMP0: mmio.Mmio(packed struct(u32) {
        /// pad comp dref
        DREF_COMP0: u3,
        /// pad comp mode
        MODE_COMP0: u1,
        /// pad comp xpd
        XPD_COMP0: u1,
        padding: u27 = 0,
    }),
    /// need_des
    /// offset: 0x14c
    PAD_COMP1: mmio.Mmio(packed struct(u32) {
        /// pad comp dref
        DREF_COMP1: u3,
        /// pad comp mode
        MODE_COMP1: u1,
        /// pad comp xpd
        XPD_COMP1: u1,
        padding: u27 = 0,
    }),
    /// offset: 0x150
    reserved336: [4]u8,
    /// need_des
    /// offset: 0x154
    BACKUP_DMA_CFG0: mmio.Mmio(packed struct(u32) {
        /// need_des
        BURST_LIMIT_AON: u5,
        /// need_des
        READ_INTERVAL_AON: u7,
        /// need_des
        LINK_BACKUP_TOUT_THRES_AON: u10,
        /// need_des
        LINK_TOUT_THRES_AON: u10,
    }),
    /// need_des
    /// offset: 0x158
    BACKUP_DMA_CFG1: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        AON_BYPASS: u1,
    }),
    /// need_des
    /// offset: 0x15c
    BACKUP_DMA_CFG2: mmio.Mmio(packed struct(u32) {
        /// need_des
        LINK_ADDR_AON: u32,
    }),
    /// offset: 0x160
    reserved352: [4]u8,
    /// need_des
    /// offset: 0x164
    BOOT_ADDR_HP_CORE1: mmio.Mmio(packed struct(u32) {
        /// need_des
        BOOT_ADDR_HP_CORE1: u32,
    }),
    /// need_des
    /// offset: 0x168
    LP_ADDRHOLE_ADDR: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ADDRHOLE_ADDR: u32,
    }),
    /// need_des
    /// offset: 0x16c
    LP_ADDRHOLE_INFO: mmio.Mmio(packed struct(u32) {
        /// master id: 5'h0: hp core0, 5'h1:hp core1, 5'h2:lp core, 5'h3:usb otg11, 5'h4: regdma, 5'h5: gmac, 5'h5 sdmmc, 5'h7: usbotg20, 5'h8: trace0, 5'h9: trace1, 5'ha tcm monitor, 5'hb: l2mem monitor. 5'h10~5'h1f: ahb pdma.
        LP_ADDRHOLE_ID: u5,
        /// 1:write trans, 0: read trans.
        LP_ADDRHOLE_WR: u1,
        /// 1: illegal address access, 0: access without permission
        LP_ADDRHOLE_SECURE: u1,
        padding: u25 = 0,
    }),
    /// raw interrupt register
    /// offset: 0x170
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// the raw interrupt status of lp addrhole(for lp peri and lp ram tee apm, and lp matrix default slave)
        LP_ADDRHOLE_INT_RAW: u1,
        /// the raw interrupt status of idbus addrhole(only for lp cpu ibus and dbus)
        IDBUS_ADDRHOLE_INT_RAW: u1,
        /// the raw interrupt status of lp core ahb bus timeout
        LP_CORE_AHB_TIMEOUT_INT_RAW: u1,
        /// the raw interrupt status of lp core ibus timeout
        LP_CORE_IBUS_TIMEOUT_INT_RAW: u1,
        /// the raw interrupt status of lp core dbus timeout
        LP_CORE_DBUS_TIMEOUT_INT_RAW: u1,
        /// the raw interrupt status of etm task ulp
        ETM_TASK_ULP_INT_RAW: u1,
        /// the raw interrupt status of slow_clk_tick
        SLOW_CLK_TICK_INT_RAW: u1,
        padding: u25 = 0,
    }),
    /// masked interrupt register
    /// offset: 0x174
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// the masked interrupt status of lp addrhole (for lp peri and lp ram tee apm, and lp matrix default slave)
        LP_ADDRHOLE_INT_ST: u1,
        /// the masked interrupt status of idbus addrhole(only for lp cpu ibus and dbus)
        IDBUS_ADDRHOLE_INT_ST: u1,
        /// the masked interrupt status of lp core ahb bus timeout
        LP_CORE_AHB_TIMEOUT_INT_ST: u1,
        /// the masked interrupt status of lp core ibus timeout
        LP_CORE_IBUS_TIMEOUT_INT_ST: u1,
        /// the masked interrupt status of lp core dbus timeout
        LP_CORE_DBUS_TIMEOUT_INT_ST: u1,
        /// the masked interrupt status of etm task ulp
        ETM_TASK_ULP_INT_ST: u1,
        /// the masked interrupt status of slow_clk_tick
        SLOW_CLK_TICK_INT_ST: u1,
        padding: u25 = 0,
    }),
    /// masked interrupt register
    /// offset: 0x178
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// Write 1 to enable lp addrhole int
        LP_ADDRHOLE_INT_ENA: u1,
        /// Write 1 to enable idbus addrhole int
        IDBUS_ADDRHOLE_INT_ENA: u1,
        /// Write 1 to enable lp_core_ahb_timeout int
        LP_CORE_AHB_TIMEOUT_INT_ENA: u1,
        /// Write 1 to enable lp_core_ibus_timeout int
        LP_CORE_IBUS_TIMEOUT_INT_ENA: u1,
        /// Write 1 to enable lp_core_dbus_timeout int
        LP_CORE_DBUS_TIMEOUT_INT_ENA: u1,
        /// Write 1 to enable etm task ulp int
        ETM_TASK_ULP_INT_ENA: u1,
        /// Write 1 to enable slow_clk_tick int
        SLOW_CLK_TICK_INT_ENA: u1,
        padding: u25 = 0,
    }),
    /// interrupt clear register
    /// offset: 0x17c
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// write 1 to clear lp addrhole int
        LP_ADDRHOLE_INT_CLR: u1,
        /// write 1 to clear idbus addrhole int
        IDBUS_ADDRHOLE_INT_CLR: u1,
        /// Write 1 to clear lp_core_ahb_timeout int
        LP_CORE_AHB_TIMEOUT_INT_CLR: u1,
        /// Write 1 to clear lp_core_ibus_timeout int
        LP_CORE_IBUS_TIMEOUT_INT_CLR: u1,
        /// Write 1 to clear lp_core_dbus_timeout int
        LP_CORE_DBUS_TIMEOUT_INT_CLR: u1,
        /// Write 1 to clear etm tasl ulp int
        ETM_TASK_ULP_INT_CLR: u1,
        /// Write 1 to clear slow_clk_tick int
        SLOW_CLK_TICK_INT_CLR: u1,
        padding: u25 = 0,
    }),
    /// need_des
    /// offset: 0x180
    HP_MEM_AUX_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_MEM_AUX_CTRL: u32,
    }),
    /// need_des
    /// offset: 0x184
    LP_MEM_AUX_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_MEM_AUX_CTRL: u32,
    }),
    /// need_des
    /// offset: 0x188
    HP_ROM_AUX_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_ROM_AUX_CTRL: u32,
    }),
    /// need_des
    /// offset: 0x18c
    LP_ROM_AUX_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_ROM_AUX_CTRL: u32,
    }),
    /// need_des
    /// offset: 0x190
    LP_CPU_DBG_PC: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_CPU_DBG_PC: u32,
    }),
    /// need_des
    /// offset: 0x194
    LP_CPU_EXC_PC: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_CPU_EXC_PC: u32,
    }),
    /// need_des
    /// offset: 0x198
    IDBUS_ADDRHOLE_ADDR: mmio.Mmio(packed struct(u32) {
        /// need_des
        IDBUS_ADDRHOLE_ADDR: u32,
    }),
    /// need_des
    /// offset: 0x19c
    IDBUS_ADDRHOLE_INFO: mmio.Mmio(packed struct(u32) {
        /// need_des
        IDBUS_ADDRHOLE_ID: u5,
        /// need_des
        IDBUS_ADDRHOLE_WR: u1,
        /// need_des
        IDBUS_ADDRHOLE_SECURE: u1,
        padding: u25 = 0,
    }),
    /// need_des
    /// offset: 0x1a0
    HP_POR_RST_BYPASS_CTRL: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// [15] 1'b1: po_cnnt_rstn bypass sys_sw_rstn [14] 1'b1: po_cnnt_rstn bypass hp_wdt_sys_rstn [13] 1'b1: po_cnnt_rstn bypass hp_cpu_intrusion_rstn [12] 1'b1: po_cnnt_rstn bypass hp_sdio_sys_rstn [11] 1'b1: po_cnnt_rstn bypass usb_jtag_chip_rst [10] 1'b1: po_cnnt_rstn bypass usb_uart_chip_rst [9] 1'b1: po_cnnt_rstn bypass lp_wdt_hp_sys_rstn [8] 1'b1: po_cnnt_rstn bypass efuse_err_rstn
        HP_PO_CNNT_RSTN_BYPASS_CTRL: u8,
        reserved24: u8 = 0,
        /// [31] 1'b1: po_rstn bypass sys_sw_rstn [30] 1'b1: po_rstn bypass hp_wdt_sys_rstn [29] 1'b1: po_rstn bypass hp_cpu_intrusion_rstn [28] 1'b1: po_rstn bypass hp_sdio_sys_rstn [27] 1'b1: po_rstn bypass usb_jtag_chip_rst [26] 1'b1: po_rstn bypass usb_uart_chip_rst [25] 1'b1: po_rstn bypass lp_wdt_hp_sys_rstn [24] 1'b1: po_rstn bypass efuse_err_rstn
        HP_PO_RSTN_BYPASS_CTRL: u8,
    }),
    /// rng data register
    /// offset: 0x1a4
    RNG_DATA: mmio.Mmio(packed struct(u32) {
        /// result of rng output
        RND_DATA: u32,
    }),
    /// offset: 0x1a8
    reserved424: [8]u8,
    /// need_des
    /// offset: 0x1b0
    LP_CORE_AHB_TIMEOUT: mmio.Mmio(packed struct(u32) {
        /// set this field to 1 to enable lp core ahb timeout handle
        EN: u1,
        /// This field used to set lp core ahb bus timeout threshold
        THRES: u16,
        /// set this field to 1 to enable lp2hp ahb timeout handle
        LP2HP_AHB_TIMEOUT_EN: u1,
        /// This field used to set lp2hp ahb bus timeout threshold
        LP2HP_AHB_TIMEOUT_THRES: u5,
        padding: u9 = 0,
    }),
    /// need_des
    /// offset: 0x1b4
    LP_CORE_IBUS_TIMEOUT: mmio.Mmio(packed struct(u32) {
        /// set this field to 1 to enable lp core ibus timeout handle
        EN: u1,
        /// This field used to set lp core ibus timeout threshold
        THRES: u16,
        padding: u15 = 0,
    }),
    /// need_des
    /// offset: 0x1b8
    LP_CORE_DBUS_TIMEOUT: mmio.Mmio(packed struct(u32) {
        /// set this field to 1 to enable lp core dbus timeout handle
        EN: u1,
        /// This field used to set lp core dbus timeout threshold
        THRES: u16,
        padding: u15 = 0,
    }),
    /// need_des
    /// offset: 0x1bc
    LP_CORE_ERR_RESP_DIS: mmio.Mmio(packed struct(u32) {
        /// Set bit0 to disable ibus err resp;Set bit1 to disable dbus err resp; Set bit 2 to disable ahb err resp.
        LP_CORE_ERR_RESP_DIS: u3,
        padding: u29 = 0,
    }),
    /// rng cfg register
    /// offset: 0x1c0
    RNG_CFG: mmio.Mmio(packed struct(u32) {
        /// enable rng timer
        RNG_TIMER_EN: u1,
        /// configure ng timer pscale
        RNG_TIMER_PSCALE: u8,
        /// enable rng_saradc
        RNG_SAR_ENABLE: u1,
        reserved16: u6 = 0,
        /// debug rng sar sample cnt
        RNG_SAR_DATA: u13,
        padding: u3 = 0,
    }),
};
