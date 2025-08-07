const mmio = @import("mmio");
const types = @import("../../types.zig");

/// High-Power System
pub const HP_SYS = extern struct {
    /// NA
    /// offset: 0x00
    VER_DATE: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_VER_DATE: u32,
    }),
    /// NA
    /// offset: 0x04
    CLK_EN: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x08
    reserved8: [8]u8,
    /// NA
    /// offset: 0x10
    CPU_INTR_FROM_CPU_0: mmio.Mmio(packed struct(u32) {
        /// set 1 will triger a interrupt
        CPU_INTR_FROM_CPU_0: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x14
    CPU_INTR_FROM_CPU_1: mmio.Mmio(packed struct(u32) {
        /// set 1 will triger a interrupt
        CPU_INTR_FROM_CPU_1: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x18
    CPU_INTR_FROM_CPU_2: mmio.Mmio(packed struct(u32) {
        /// set 1 will triger a interrupt
        CPU_INTR_FROM_CPU_2: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x1c
    CPU_INTR_FROM_CPU_3: mmio.Mmio(packed struct(u32) {
        /// set 1 will triger a interrupt
        CPU_INTR_FROM_CPU_3: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x20
    CACHE_CLK_CONFIG: mmio.Mmio(packed struct(u32) {
        /// l2 cahce clk enable
        REG_L2_CACHE_CLK_ON: u1,
        /// l1 dcahce clk enable
        REG_L1_D_CACHE_CLK_ON: u1,
        reserved4: u2 = 0,
        /// l1 icahce1 clk enable
        REG_L1_I1_CACHE_CLK_ON: u1,
        /// l1 icahce0 clk enable
        REG_L1_I0_CACHE_CLK_ON: u1,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x24
    CACHE_RESET_CONFIG: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// set 1 to reset l1 dcahce
        REG_L1_D_CACHE_RESET: u1,
        reserved4: u2 = 0,
        /// set 1 to reset l1 icahce1
        REG_L1_I1_CACHE_RESET: u1,
        /// set 1 to reset l1 icahce0
        REG_L1_I0_CACHE_RESET: u1,
        padding: u26 = 0,
    }),
    /// offset: 0x28
    reserved40: [4]u8,
    /// NA
    /// offset: 0x2c
    DMA_ADDR_CTRL: mmio.Mmio(packed struct(u32) {
        /// 0 means dma access extmem use 8xxx_xxxx else use 4xxx_xxxx
        REG_SYS_DMA_ADDR_SEL: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x30
    reserved48: [4]u8,
    /// NA
    /// offset: 0x34
    TCM_RAM_WRR_CONFIG: mmio.Mmio(packed struct(u32) {
        /// weight value of ibus0
        REG_TCM_RAM_IBUS0_WT: u3,
        /// weight value of ibus1
        REG_TCM_RAM_IBUS1_WT: u3,
        /// weight value of ibus2
        REG_TCM_RAM_IBUS2_WT: u3,
        /// weight value of ibus3
        REG_TCM_RAM_IBUS3_WT: u3,
        /// weight value of dbus0
        REG_TCM_RAM_DBUS0_WT: u3,
        /// weight value of dbus1
        REG_TCM_RAM_DBUS1_WT: u3,
        /// weight value of dbus2
        REG_TCM_RAM_DBUS2_WT: u3,
        /// weight value of dbus3
        REG_TCM_RAM_DBUS3_WT: u3,
        /// weight value of dma
        REG_TCM_RAM_DMA_WT: u3,
        reserved31: u4 = 0,
        /// enable weighted round robin arbitration
        REG_TCM_RAM_WRR_HIGH: u1,
    }),
    /// NA
    /// offset: 0x38
    TCM_SW_PARITY_BWE_MASK: mmio.Mmio(packed struct(u32) {
        /// Set 1 to mask tcm bwe parity code bit
        REG_TCM_SW_PARITY_BWE_MASK_CTRL: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x3c
    TCM_RAM_PWR_CTRL0: mmio.Mmio(packed struct(u32) {
        /// hp_tcm clk gatig force on
        REG_HP_TCM_CLK_FORCE_ON: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x40
    L2_ROM_PWR_CTRL0: mmio.Mmio(packed struct(u32) {
        /// l2_rom clk gating force on
        REG_L2_ROM_CLK_FORCE_ON: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x44
    reserved68: [12]u8,
    /// NA
    /// offset: 0x50
    PROBEA_CTRL: mmio.Mmio(packed struct(u32) {
        /// Tihs field is used to selec probe_group from probe_group0 to probe_group15 for module's probe_out[31:0] in a mode
        REG_PROBE_A_MOD_SEL: u16,
        /// Tihs field is used to selec module's probe_out[31:0] as probe out in a mode
        REG_PROBE_A_TOP_SEL: u8,
        /// Tihs field is used to selec probe_out[31:16]
        REG_PROBE_L_SEL: u2,
        /// Tihs field is used to selec probe_out[31:16]
        REG_PROBE_H_SEL: u2,
        /// Set this bit to enable global debug probe in hp system.
        REG_PROBE_GLOBAL_EN: u1,
        padding: u3 = 0,
    }),
    /// NA
    /// offset: 0x54
    PROBEB_CTRL: mmio.Mmio(packed struct(u32) {
        /// Tihs field is used to selec probe_group from probe_group0 to probe_group15 for module's probe_out[31:0] in b mode.
        REG_PROBE_B_MOD_SEL: u16,
        /// Tihs field is used to select module's probe_out[31:0] as probe_out in b mode
        REG_PROBE_B_TOP_SEL: u8,
        /// Set this bit to enable b mode for debug probe. 1: b mode, 0: a mode.
        REG_PROBE_B_EN: u1,
        padding: u7 = 0,
    }),
    /// offset: 0x58
    reserved88: [4]u8,
    /// NA
    /// offset: 0x5c
    PROBE_OUT: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_PROBE_TOP_OUT: u32,
    }),
    /// NA
    /// offset: 0x60
    L2_MEM_RAM_PWR_CTRL0: mmio.Mmio(packed struct(u32) {
        /// l2ram clk_gating force on
        REG_L2_MEM_CLK_FORCE_ON: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x64
    CPU_CORESTALLED_ST: mmio.Mmio(packed struct(u32) {
        /// hp core0 corestalled status
        REG_CORE0_CORESTALLED_ST: u1,
        /// hp core1 corestalled status
        REG_CORE1_CORESTALLED_ST: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x68
    reserved104: [8]u8,
    /// NA
    /// offset: 0x70
    CRYPTO_CTRL: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_ENABLE_SPI_MANUAL_ENCRYPT: u1,
        /// NA
        REG_ENABLE_DOWNLOAD_DB_ENCRYPT: u1,
        /// NA
        REG_ENABLE_DOWNLOAD_G0CB_DECRYPT: u1,
        /// NA
        REG_ENABLE_DOWNLOAD_MANUAL_ENCRYPT: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x74
    GPIO_O_HOLD_CTRL0: mmio.Mmio(packed struct(u32) {
        /// hold control for gpio47~16
        REG_GPIO_0_HOLD_LOW: u32,
    }),
    /// NA
    /// offset: 0x78
    GPIO_O_HOLD_CTRL1: mmio.Mmio(packed struct(u32) {
        /// hold control for gpio56~48
        REG_GPIO_0_HOLD_HIGH: u9,
        padding: u23 = 0,
    }),
    /// NA
    /// offset: 0x7c
    RDN_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_HP_SYS_RDN_ECO_EN: u1,
        /// NA
        REG_HP_SYS_RDN_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0x80
    CACHE_APB_POSTW_EN: mmio.Mmio(packed struct(u32) {
        /// cache apb register interface post write enable, 1 will speed up write, but will take some time to update value to register
        REG_CACHE_APB_POSTW_EN: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x84
    L2_MEM_SUBSIZE: mmio.Mmio(packed struct(u32) {
        /// l2mem sub block size 00=>32 01=>64 10=>128 11=>256
        REG_L2_MEM_SUB_BLKSIZE: u2,
        padding: u30 = 0,
    }),
    /// offset: 0x88
    reserved136: [20]u8,
    /// NA
    /// offset: 0x9c
    L2_MEM_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// intr triggered when two bit error detected and corrected from ecc
        REG_L2_MEM_ECC_ERR_INT_RAW: u1,
        /// intr triggered when access addr exceeds 0xff9ffff at bypass mode or exceeds 0xff80000 at l2cache 128kb mode or exceeds 0xff60000 at l2cache 256kb mode
        REG_L2_MEM_EXCEED_ADDR_INT_RAW: u1,
        /// intr triggered when err response occurs
        REG_L2_MEM_ERR_RESP_INT_RAW: u1,
        padding: u29 = 0,
    }),
    /// NA
    /// offset: 0xa0
    L2_MEM_INT_ST: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_MEM_ECC_ERR_INT_ST: u1,
        /// NA
        REG_L2_MEM_EXCEED_ADDR_INT_ST: u1,
        /// NA
        REG_L2_MEM_ERR_RESP_INT_ST: u1,
        padding: u29 = 0,
    }),
    /// NA
    /// offset: 0xa4
    L2_MEM_INT_ENA: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_MEM_ECC_ERR_INT_ENA: u1,
        /// NA
        REG_L2_MEM_EXCEED_ADDR_INT_ENA: u1,
        /// NA
        REG_L2_MEM_ERR_RESP_INT_ENA: u1,
        padding: u29 = 0,
    }),
    /// NA
    /// offset: 0xa8
    L2_MEM_INT_CLR: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_MEM_ECC_ERR_INT_CLR: u1,
        /// NA
        REG_L2_MEM_EXCEED_ADDR_INT_CLR: u1,
        /// NA
        REG_L2_MEM_ERR_RESP_INT_CLR: u1,
        padding: u29 = 0,
    }),
    /// NA
    /// offset: 0xac
    L2_MEM_L2_RAM_ECC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_RAM_UNIT0_ECC_EN: u1,
        /// NA
        REG_L2_RAM_UNIT1_ECC_EN: u1,
        /// NA
        REG_L2_RAM_UNIT2_ECC_EN: u1,
        /// NA
        REG_L2_RAM_UNIT3_ECC_EN: u1,
        /// NA
        REG_L2_RAM_UNIT4_ECC_EN: u1,
        /// NA
        REG_L2_RAM_UNIT5_ECC_EN: u1,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0xb0
    L2_MEM_INT_RECORD0: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_MEM_EXCEED_ADDR_INT_ADDR: u21,
        /// NA
        REG_L2_MEM_EXCEED_ADDR_INT_WE: u1,
        /// NA
        REG_L2_MEM_EXCEED_ADDR_INT_MASTER: u3,
        padding: u7 = 0,
    }),
    /// NA
    /// offset: 0xb4
    L2_MEM_INT_RECORD1: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_MEM_ECC_ERR_INT_ADDR: u15,
        /// NA
        REG_L2_MEM_ECC_ONE_BIT_ERR: u1,
        /// NA
        REG_L2_MEM_ECC_TWO_BIT_ERR: u1,
        /// NA
        REG_L2_MEM_ECC_ERR_BIT: u9,
        /// NA
        REG_L2_CACHE_ERR_BANK: u1,
        padding: u5 = 0,
    }),
    /// offset: 0xb8
    reserved184: [12]u8,
    /// NA
    /// offset: 0xc4
    L2_MEM_L2_CACHE_ECC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_CACHE_ECC_EN: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0xc8
    L1CACHE_BUS0_ID: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L1_CACHE_BUS0_ID: u4,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0xcc
    L1CACHE_BUS1_ID: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L1_CACHE_BUS1_ID: u4,
        padding: u28 = 0,
    }),
    /// offset: 0xd0
    reserved208: [8]u8,
    /// NA
    /// offset: 0xd8
    L2_MEM_RDN_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_MEM_RDN_ECO_EN: u1,
        /// NA
        REG_L2_MEM_RDN_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0xdc
    L2_MEM_RDN_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_MEM_RDN_ECO_LOW: u32,
    }),
    /// NA
    /// offset: 0xe0
    L2_MEM_RDN_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_MEM_RDN_ECO_HIGH: u32,
    }),
    /// NA
    /// offset: 0xe4
    TCM_RDN_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_HP_TCM_RDN_ECO_EN: u1,
        /// NA
        REG_HP_TCM_RDN_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0xe8
    TCM_RDN_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_HP_TCM_RDN_ECO_LOW: u32,
    }),
    /// NA
    /// offset: 0xec
    TCM_RDN_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_HP_TCM_RDN_ECO_HIGH: u32,
    }),
    /// NA
    /// offset: 0xf0
    GPIO_DED_HOLD_CTRL: mmio.Mmio(packed struct(u32) {
        /// hold control for gpio63~56
        REG_GPIO_DED_HOLD: u26,
        padding: u6 = 0,
    }),
    /// NA
    /// offset: 0xf4
    L2_MEM_SW_ECC_BWE_MASK: mmio.Mmio(packed struct(u32) {
        /// Set 1 to mask bwe hamming code bit
        REG_L2_MEM_SW_ECC_BWE_MASK_CTRL: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0xf8
    USB20OTG_MEM_CTRL: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_USB20_MEM_CLK_FORCE_ON: u1,
        padding: u31 = 0,
    }),
    /// need_des
    /// offset: 0xfc
    TCM_INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        TCM_PARITY_ERR_INT_RAW: u1,
    }),
    /// need_des
    /// offset: 0x100
    TCM_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        TCM_PARITY_ERR_INT_ST: u1,
    }),
    /// need_des
    /// offset: 0x104
    TCM_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        TCM_PARITY_ERR_INT_ENA: u1,
    }),
    /// need_des
    /// offset: 0x108
    TCM_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        TCM_PARITY_ERR_INT_CLR: u1,
    }),
    /// need_des
    /// offset: 0x10c
    TCM_PARITY_INT_RECORD: mmio.Mmio(packed struct(u32) {
        /// hp tcm_parity_err_addr
        TCM_PARITY_ERR_INT_ADDR: u13,
        padding: u19 = 0,
    }),
    /// NA
    /// offset: 0x110
    L1_CACHE_PWR_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        REG_L1_CACHE_MEM_FO: u6,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x114
    L2_CACHE_PWR_CTRL: mmio.Mmio(packed struct(u32) {
        /// need_des
        REG_L2_CACHE_MEM_FO: u2,
        padding: u30 = 0,
    }),
    /// CPU_WAITI configuration register
    /// offset: 0x118
    CPU_WAITI_CONF: mmio.Mmio(packed struct(u32) {
        /// Set 1 to force cpu_waiti_clk enable.
        CPU_WAIT_MODE_FORCE_ON: u1,
        /// This field used to set delay cycle when cpu enter waiti mode, after delay waiti_clk will close
        CPU_WAITI_DELAY_NUM: u4,
        padding: u27 = 0,
    }),
    /// Core Debug runstall configure register
    /// offset: 0x11c
    CORE_DEBUG_RUNSTALL_CONF: mmio.Mmio(packed struct(u32) {
        /// Set this field to 1 to enable debug runstall feature between HP-core and LP-core.
        CORE_DEBUG_RUNSTALL_ENABLE: u1,
        padding: u31 = 0,
    }),
    /// need_des
    /// offset: 0x120
    CORE_AHB_TIMEOUT: mmio.Mmio(packed struct(u32) {
        /// set this field to 1 to enable hp core0&1 ahb timeout handle
        EN: u1,
        /// This field used to set hp core0&1 ahb bus timeout threshold
        THRES: u16,
        padding: u15 = 0,
    }),
    /// need_des
    /// offset: 0x124
    CORE_IBUS_TIMEOUT: mmio.Mmio(packed struct(u32) {
        /// set this field to 1 to enable hp core0&1 ibus timeout handle
        EN: u1,
        /// This field used to set hp core0&1 ibus timeout threshold
        THRES: u16,
        padding: u15 = 0,
    }),
    /// need_des
    /// offset: 0x128
    CORE_DBUS_TIMEOUT: mmio.Mmio(packed struct(u32) {
        /// set this field to 1 to enable hp core0&1 dbus timeout handle
        EN: u1,
        /// This field used to set hp core0&1 dbus timeout threshold
        THRES: u16,
        padding: u15 = 0,
    }),
    /// offset: 0x12c
    reserved300: [12]u8,
    /// need_des
    /// offset: 0x138
    ICM_CPU_H2X_CFG: mmio.Mmio(packed struct(u32) {
        /// need_des
        CPU_ICM_H2X_POST_WR_EN: u1,
        /// need_des
        CPU_ICM_H2X_CUT_THROUGH_EN: u1,
        /// need_des
        CPU_ICM_H2X_BRIDGE_BUSY: u1,
        padding: u29 = 0,
    }),
    /// NA
    /// offset: 0x13c
    PERI1_APB_POSTW_EN: mmio.Mmio(packed struct(u32) {
        /// hp_peri1 apb register interface post write enable, 1 will speed up write, but will take some time to update value to register
        PERI1_APB_POSTW_EN: u1,
        padding: u31 = 0,
    }),
    /// Bitscrambler Peri Sel
    /// offset: 0x140
    BITSCRAMBLER_PERI_SEL: mmio.Mmio(packed struct(u32) {
        /// Set this field to sel peri with DMA RX interface to connec with bitscrambler: 4'h0 : lcd_cam, 4'h1: gpspi2, 4'h2: gpspi3, 4'h3: parl_io, 4'h4: aes, 4'h5: sha, 4'h6: adc, 4'h7: i2s0, 4'h8: i2s1, 4'h9: i2s2, 4'ha: i3c_mst, 4'hb: uhci0, 4'hc: RMT, else : none
        BITSCRAMBLER_PERI_RX_SEL: u4,
        /// Set this field to sel peri with DMA TX interface to connec with bitscrambler: 4'h0 : lcd_cam, 4'h1: gpspi2, 4'h2: gpspi3, 4'h3: parl_io, 4'h4: aes, 4'h5: sha, 4'h6: adc, 4'h7: i2s0, 4'h8: i2s1, 4'h9: i2s2, 4'ha: i3c_mst, 4'hb: uhci0, 4'hc: RMT, else : none
        BITSCRAMBLER_PERI_TX_SEL: u4,
        padding: u24 = 0,
    }),
    /// N/A
    /// offset: 0x144
    APB_SYNC_POSTW_EN: mmio.Mmio(packed struct(u32) {
        /// N/A
        GMAC_APB_POSTW_EN: u1,
        /// N/A
        DSI_HOST_APB_POSTW_EN: u1,
        /// N/A
        CSI_HOST_APB_SYNC_POSTW_EN: u1,
        /// N/A
        CSI_HOST_APB_ASYNC_POSTW_EN: u1,
        padding: u28 = 0,
    }),
    /// N/A
    /// offset: 0x148
    GDMA_CTRL: mmio.Mmio(packed struct(u32) {
        /// N/A
        DEBUG_CH_NUM: u2,
        padding: u30 = 0,
    }),
    /// N/A
    /// offset: 0x14c
    GMAC_CTRL0: mmio.Mmio(packed struct(u32) {
        /// N/A
        PTP_PPS: u1,
        /// N/A
        SBD_FLOWCTRL: u1,
        /// N/A
        PHY_INTF_SEL: u3,
        /// N/A
        GMAC_MEM_CLK_FORCE_ON: u1,
        /// N/A
        GMAC_RST_CLK_TX_N: u1,
        /// N/A
        GMAC_RST_CLK_RX_N: u1,
        padding: u24 = 0,
    }),
    /// N/A
    /// offset: 0x150
    GMAC_CTRL1: mmio.Mmio(packed struct(u32) {
        /// N/A
        PTP_TIMESTAMP_L: u32,
    }),
    /// N/A
    /// offset: 0x154
    GMAC_CTRL2: mmio.Mmio(packed struct(u32) {
        /// N/A
        PTP_TIMESTAMP_H: u32,
    }),
    /// N/A
    /// offset: 0x158
    VPU_CTRL: mmio.Mmio(packed struct(u32) {
        /// N/A
        PPA_LSLP_MEM_PD: u1,
        /// N/A
        JPEG_SDSLP_MEM_PD: u1,
        /// N/A
        JPEG_LSLP_MEM_PD: u1,
        /// N/A
        JPEG_DSLP_MEM_PD: u1,
        /// N/A
        DMA2D_LSLP_MEM_PD: u1,
        padding: u27 = 0,
    }),
    /// N/A
    /// offset: 0x15c
    USBOTG20_CTRL: mmio.Mmio(packed struct(u32) {
        /// N/A
        OTG_PHY_TEST_DONE: u1,
        /// N/A
        USB_MEM_AUX_CTRL: u14,
        /// N/A
        PHY_SUSPENDM: u1,
        /// N/A
        PHY_SUSPEND_FORCE_EN: u1,
        /// N/A
        PHY_RSTN: u1,
        /// N/A
        PHY_RESET_FORCE_EN: u1,
        /// N/A
        PHY_PLL_FORCE_EN: u1,
        /// N/A
        PHY_PLL_EN: u1,
        /// N/A
        OTG_SUSPENDM: u1,
        /// N/A
        OTG_PHY_TXBITSTUFF_EN: u1,
        /// N/A
        OTG_PHY_REFCLK_MODE: u1,
        /// N/A
        OTG_PHY_BISTEN: u1,
        padding: u7 = 0,
    }),
    /// need_des
    /// offset: 0x160
    TCM_ERR_RESP_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set 1 to turn on tcm error response
        TCM_ERR_RESP_EN: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x164
    L2_MEM_REFRESH: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_L2_MEM_UNIT0_REFERSH_EN: u1,
        /// NA
        REG_L2_MEM_UNIT1_REFERSH_EN: u1,
        /// NA
        REG_L2_MEM_UNIT2_REFERSH_EN: u1,
        /// NA
        REG_L2_MEM_UNIT3_REFERSH_EN: u1,
        /// NA
        REG_L2_MEM_UNIT4_REFERSH_EN: u1,
        /// NA
        REG_L2_MEM_UNIT5_REFERSH_EN: u1,
        /// Set 1 to reset l2mem_refresh_cnt
        REG_L2_MEM_REFERSH_CNT_RESET: u1,
        /// NA
        REG_L2_MEM_UNIT0_REFRESH_DONE: u1,
        /// NA
        REG_L2_MEM_UNIT1_REFRESH_DONE: u1,
        /// NA
        REG_L2_MEM_UNIT2_REFRESH_DONE: u1,
        /// NA
        REG_L2_MEM_UNIT3_REFRESH_DONE: u1,
        /// NA
        REG_L2_MEM_UNIT4_REFRESH_DONE: u1,
        /// NA
        REG_L2_MEM_UNIT5_REFRESH_DONE: u1,
        padding: u19 = 0,
    }),
    /// NA
    /// offset: 0x168
    TCM_INIT: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_TCM_INIT_EN: u1,
        /// Set 1 to reset tcm init cnt
        REG_TCM_INIT_CNT_RESET: u1,
        /// NA
        REG_TCM_INIT_DONE: u1,
        padding: u29 = 0,
    }),
    /// need_des
    /// offset: 0x16c
    TCM_PARITY_CHECK_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set 1 to turn on tcm parity check
        TCM_PARITY_CHECK_EN: u1,
        padding: u31 = 0,
    }),
    /// need_des
    /// offset: 0x170
    DESIGN_FOR_VERIFICATION0: mmio.Mmio(packed struct(u32) {
        /// register for DV
        DFV0: u32,
    }),
    /// need_des
    /// offset: 0x174
    DESIGN_FOR_VERIFICATION1: mmio.Mmio(packed struct(u32) {
        /// register for DV
        DFV1: u32,
    }),
    /// offset: 0x178
    reserved376: [8]u8,
    /// need_des
    /// offset: 0x180
    PSRAM_FLASH_ADDR_INTERCHANGE: mmio.Mmio(packed struct(u32) {
        /// Set 1 to enable addr interchange between psram and flash in axi matrix when hp cpu access through cache
        CPU: u1,
        /// Set 1 to enable addr interchange between psram and flash in axi matrix when dma device access, lp core access and hp core access through ahb
        DMA: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x184
    reserved388: [4]u8,
    /// NA
    /// offset: 0x188
    AHB2AXI_BRESP_ERR_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// the raw interrupt status of bresp error, triggered when if bresp err occurs in post write mode in ahb2axi.
        CPU_ICM_H2X_BRESP_ERR_INT_RAW: u1,
        padding: u31 = 0,
    }),
    /// need_des
    /// offset: 0x18c
    AHB2AXI_BRESP_ERR_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// the masked interrupt status of cpu_icm_h2x_bresp_err
        CPU_ICM_H2X_BRESP_ERR_INT_ST: u1,
    }),
    /// need_des
    /// offset: 0x190
    AHB2AXI_BRESP_ERR_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Write 1 to enable cpu_icm_h2x_bresp_err int
        CPU_ICM_H2X_BRESP_ERR_INT_ENA: u1,
    }),
    /// need_des
    /// offset: 0x194
    AHB2AXI_BRESP_ERR_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Write 1 to clear cpu_icm_h2x_bresp_err int
        CPU_ICM_H2X_BRESP_ERR_INT_CLR: u1,
    }),
    /// need_des
    /// offset: 0x198
    L2_MEM_ERR_RESP_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set 1 to turn on l2mem error response
        L2_MEM_ERR_RESP_EN: u1,
        padding: u31 = 0,
    }),
    /// need_des
    /// offset: 0x19c
    L2_MEM_AHB_BUFFER_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set 1 to turn on l2mem ahb wr buffer
        L2_MEM_AHB_WRBUFFER_EN: u1,
        /// Set 1 to turn on l2mem ahb rd buffer
        L2_MEM_AHB_RDBUFFER_EN: u1,
        padding: u30 = 0,
    }),
    /// need_des
    /// offset: 0x1a0
    CORE_DMACTIVE_LPCORE: mmio.Mmio(packed struct(u32) {
        /// hp core dmactive_lpcore value
        CORE_DMACTIVE_LPCORE: u1,
        padding: u31 = 0,
    }),
    /// need_des
    /// offset: 0x1a4
    CORE_ERR_RESP_DIS: mmio.Mmio(packed struct(u32) {
        /// Set bit0 to disable ibus err resp. Set bit1 to disable dbus err resp. Set bit 2 to disable ahb err resp.
        CORE_ERR_RESP_DIS: u3,
        padding: u29 = 0,
    }),
    /// Hp core bus timeout interrupt raw register
    /// offset: 0x1a8
    CORE_TIMEOUT_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// the raw interrupt status of hp core0 ahb timeout
        CORE0_AHB_TIMEOUT_INT_RAW: u1,
        /// the raw interrupt status of hp core1 ahb timeout
        CORE1_AHB_TIMEOUT_INT_RAW: u1,
        /// the raw interrupt status of hp core0 ibus timeout
        CORE0_IBUS_TIMEOUT_INT_RAW: u1,
        /// the raw interrupt status of hp core1 ibus timeout
        CORE1_IBUS_TIMEOUT_INT_RAW: u1,
        /// the raw interrupt status of hp core0 dbus timeout
        CORE0_DBUS_TIMEOUT_INT_RAW: u1,
        /// the raw interrupt status of hp core1 dbus timeout
        CORE1_DBUS_TIMEOUT_INT_RAW: u1,
        padding: u26 = 0,
    }),
    /// masked interrupt register
    /// offset: 0x1ac
    CORE_TIMEOUT_INT_ST: mmio.Mmio(packed struct(u32) {
        /// the masked interrupt status of hp core0 ahb timeout
        CORE0_AHB_TIMEOUT_INT_ST: u1,
        /// the masked interrupt status of hp core1 ahb timeout
        CORE1_AHB_TIMEOUT_INT_ST: u1,
        /// the masked interrupt status of hp core0 ibus timeout
        CORE0_IBUS_TIMEOUT_INT_ST: u1,
        /// the masked interrupt status of hp core1 ibus timeout
        CORE1_IBUS_TIMEOUT_INT_ST: u1,
        /// the masked interrupt status of hp core0 dbus timeout
        CORE0_DBUS_TIMEOUT_INT_ST: u1,
        /// the masked interrupt status of hp core1 dbus timeout
        CORE1_DBUS_TIMEOUT_INT_ST: u1,
        padding: u26 = 0,
    }),
    /// masked interrupt register
    /// offset: 0x1b0
    CORE_TIMEOUT_INT_ENA: mmio.Mmio(packed struct(u32) {
        /// Write 1 to enable hp_core0_ahb_timeout int
        CORE0_AHB_TIMEOUT_INT_ENA: u1,
        /// Write 1 to enable hp_core1_ahb_timeout int
        CORE1_AHB_TIMEOUT_INT_ENA: u1,
        /// Write 1 to enable hp_core0_ibus_timeout int
        CORE0_IBUS_TIMEOUT_INT_ENA: u1,
        /// Write 1 to enable hp_core1_ibus_timeout int
        CORE1_IBUS_TIMEOUT_INT_ENA: u1,
        /// Write 1 to enable hp_core0_dbus_timeout int
        CORE0_DBUS_TIMEOUT_INT_ENA: u1,
        /// Write 1 to enable hp_core1_dbus_timeout int
        CORE1_DBUS_TIMEOUT_INT_ENA: u1,
        padding: u26 = 0,
    }),
    /// interrupt clear register
    /// offset: 0x1b4
    CORE_TIMEOUT_INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Write 1 to clear hp_core0_ahb_timeout int
        CORE0_AHB_TIMEOUT_INT_CLR: u1,
        /// Write 1 to clear hp_core1_ahb_timeout int
        CORE1_AHB_TIMEOUT_INT_CLR: u1,
        /// Write 1 to clear hp_core0_ibus_timeout int
        CORE0_IBUS_TIMEOUT_INT_CLR: u1,
        /// Write 1 to clear hp_core1_ibus_timeout int
        CORE1_IBUS_TIMEOUT_INT_CLR: u1,
        /// Write 1 to clear hp_core0_dbus_timeout int
        CORE0_DBUS_TIMEOUT_INT_CLR: u1,
        /// Write 1 to clear hp_core1_dbus_timeout int
        CORE1_DBUS_TIMEOUT_INT_CLR: u1,
        padding: u26 = 0,
    }),
    /// offset: 0x1b8
    reserved440: [8]u8,
    /// NA
    /// offset: 0x1c0
    GPIO_O_HYS_CTRL0: mmio.Mmio(packed struct(u32) {
        /// hys control for gpio47~16
        REG_GPIO_0_HYS_LOW: u32,
    }),
    /// NA
    /// offset: 0x1c4
    GPIO_O_HYS_CTRL1: mmio.Mmio(packed struct(u32) {
        /// hys control for gpio56~48
        REG_GPIO_0_HYS_HIGH: u9,
        padding: u23 = 0,
    }),
    /// offset: 0x1c8
    reserved456: [8]u8,
    /// rsa pd ctrl register
    /// offset: 0x1d0
    RSA_PD_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set this bit to power down rsa internal memory.
        RSA_MEM_FORCE_PD: u1,
        /// Set this bit to force power up rsa internal memory
        RSA_MEM_FORCE_PU: u1,
        /// Set this bit to force power down rsa internal memory.
        RSA_MEM_PD: u1,
        padding: u29 = 0,
    }),
    /// ecc pd ctrl register
    /// offset: 0x1d4
    ECC_PD_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set this bit to power down ecc internal memory.
        ECC_MEM_FORCE_PD: u1,
        /// Set this bit to force power up ecc internal memory
        ECC_MEM_FORCE_PU: u1,
        /// Set this bit to force power down ecc internal memory.
        ECC_MEM_PD: u1,
        padding: u29 = 0,
    }),
    /// rng cfg register
    /// offset: 0x1d8
    RNG_CFG: mmio.Mmio(packed struct(u32) {
        /// enable rng sample chain
        RNG_SAMPLE_ENABLE: u1,
        reserved16: u15 = 0,
        /// chain clk div num to pad for debug
        RNG_CHAIN_CLK_DIV_NUM: u8,
        /// debug rng sample cnt
        RNG_SAMPLE_CNT: u8,
    }),
    /// ecc pd ctrl register
    /// offset: 0x1dc
    UART_PD_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set this bit to power down hp uart internal memory.
        UART_MEM_FORCE_PD: u1,
        /// Set this bit to force power up hp uart internal memory
        UART_MEM_FORCE_PU: u1,
        padding: u30 = 0,
    }),
    /// hp peri mem clk force on regpster
    /// offset: 0x1e0
    PERI_MEM_CLK_FORCE_ON: mmio.Mmio(packed struct(u32) {
        /// Set this bit to force on mem clk in rmt
        RMT_MEM_CLK_FORCE_ON: u1,
        /// Set this bit to force on tx mem clk in bitscrambler
        BITSCRAMBLER_TX_MEM_CLK_FORCE_ON: u1,
        /// Set this bit to force on rx mem clk in bitscrambler
        BITSCRAMBLER_RX_MEM_CLK_FORCE_ON: u1,
        /// Set this bit to force on mem clk in gdma
        GDMA_MEM_CLK_FORCE_ON: u1,
        padding: u28 = 0,
    }),
};
