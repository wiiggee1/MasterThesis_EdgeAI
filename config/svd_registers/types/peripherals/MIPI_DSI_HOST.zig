const mmio = @import("mmio");
const types = @import("../../types.zig");

/// MIPI Display Interface Host
pub const MIPI_DSI_HOST = extern struct {
    /// NA
    /// offset: 0x00
    VERSION: mmio.Mmio(packed struct(u32) {
        /// NA
        VERSION: u32,
    }),
    /// NA
    /// offset: 0x04
    PWR_UP: mmio.Mmio(packed struct(u32) {
        /// NA
        SHUTDOWNZ: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x08
    CLKMGR_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        TX_ESC_CLK_DIVISION: u8,
        /// NA
        TO_CLK_DIVISION: u8,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x0c
    DPI_VCID: mmio.Mmio(packed struct(u32) {
        /// NA
        DPI_VCID: u2,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0x10
    DPI_COLOR_CODING: mmio.Mmio(packed struct(u32) {
        /// NA
        DPI_COLOR_CODING: u4,
        reserved8: u4 = 0,
        /// NA
        LOOSELY18_EN: u1,
        padding: u23 = 0,
    }),
    /// NA
    /// offset: 0x14
    DPI_CFG_POL: mmio.Mmio(packed struct(u32) {
        /// NA
        DATAEN_ACTIVE_LOW: u1,
        /// NA
        VSYNC_ACTIVE_LOW: u1,
        /// NA
        HSYNC_ACTIVE_LOW: u1,
        /// NA
        SHUTD_ACTIVE_LOW: u1,
        /// NA
        COLORM_ACTIVE_LOW: u1,
        padding: u27 = 0,
    }),
    /// NA
    /// offset: 0x18
    DPI_LP_CMD_TIM: mmio.Mmio(packed struct(u32) {
        /// NA
        INVACT_LPCMD_TIME: u8,
        reserved16: u8 = 0,
        /// NA
        OUTVACT_LPCMD_TIME: u8,
        padding: u8 = 0,
    }),
    /// NA
    /// offset: 0x1c
    DBI_VCID: mmio.Mmio(packed struct(u32) {
        /// NA
        DBI_VCID: u2,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0x20
    DBI_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        IN_DBI_CONF: u4,
        reserved8: u4 = 0,
        /// NA
        OUT_DBI_CONF: u4,
        reserved16: u4 = 0,
        /// NA
        LUT_SIZE_CONF: u2,
        padding: u14 = 0,
    }),
    /// NA
    /// offset: 0x24
    DBI_PARTITIONING_EN: mmio.Mmio(packed struct(u32) {
        /// NA
        PARTITIONING_EN: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x28
    DBI_CMDSIZE: mmio.Mmio(packed struct(u32) {
        /// NA
        WR_CMD_SIZE: u16,
        /// NA
        ALLOWED_CMD_SIZE: u16,
    }),
    /// NA
    /// offset: 0x2c
    PCKHDL_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        EOTP_TX_EN: u1,
        /// NA
        EOTP_RX_EN: u1,
        /// NA
        BTA_EN: u1,
        /// NA
        ECC_RX_EN: u1,
        /// NA
        CRC_RX_EN: u1,
        /// NA
        EOTP_TX_LP_EN: u1,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x30
    GEN_VCID: mmio.Mmio(packed struct(u32) {
        /// NA
        RX: u2,
        reserved8: u6 = 0,
        /// NA
        TEAR_AUTO: u2,
        reserved16: u6 = 0,
        /// NA
        TX_AUTO: u2,
        padding: u14 = 0,
    }),
    /// NA
    /// offset: 0x34
    MODE_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        CMD_VIDEO_MODE: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x38
    VID_MODE_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_MODE_TYPE: u2,
        reserved8: u6 = 0,
        /// NA
        LP_VSA_EN: u1,
        /// NA
        LP_VBP_EN: u1,
        /// NA
        LP_VFP_EN: u1,
        /// NA
        LP_VACT_EN: u1,
        /// NA
        LP_HBP_EN: u1,
        /// NA
        LP_HFP_EN: u1,
        /// NA
        FRAME_BTA_ACK_EN: u1,
        /// NA
        LP_CMD_EN: u1,
        /// NA
        VPG_EN: u1,
        reserved20: u3 = 0,
        /// NA
        VPG_MODE: u1,
        reserved24: u3 = 0,
        /// NA
        VPG_ORIENTATION: u1,
        padding: u7 = 0,
    }),
    /// NA
    /// offset: 0x3c
    VID_PKT_SIZE: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_PKT_SIZE: u14,
        padding: u18 = 0,
    }),
    /// NA
    /// offset: 0x40
    VID_NUM_CHUNKS: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_NUM_CHUNKS: u13,
        padding: u19 = 0,
    }),
    /// NA
    /// offset: 0x44
    VID_NULL_SIZE: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_NULL_SIZE: u13,
        padding: u19 = 0,
    }),
    /// NA
    /// offset: 0x48
    VID_HSA_TIME: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_HSA_TIME: u12,
        padding: u20 = 0,
    }),
    /// NA
    /// offset: 0x4c
    VID_HBP_TIME: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_HBP_TIME: u12,
        padding: u20 = 0,
    }),
    /// NA
    /// offset: 0x50
    VID_HLINE_TIME: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_HLINE_TIME: u15,
        padding: u17 = 0,
    }),
    /// NA
    /// offset: 0x54
    VID_VSA_LINES: mmio.Mmio(packed struct(u32) {
        /// NA
        VSA_LINES: u10,
        padding: u22 = 0,
    }),
    /// NA
    /// offset: 0x58
    VID_VBP_LINES: mmio.Mmio(packed struct(u32) {
        /// NA
        VBP_LINES: u10,
        padding: u22 = 0,
    }),
    /// NA
    /// offset: 0x5c
    VID_VFP_LINES: mmio.Mmio(packed struct(u32) {
        /// NA
        VFP_LINES: u10,
        padding: u22 = 0,
    }),
    /// NA
    /// offset: 0x60
    VID_VACTIVE_LINES: mmio.Mmio(packed struct(u32) {
        /// NA
        V_ACTIVE_LINES: u14,
        padding: u18 = 0,
    }),
    /// NA
    /// offset: 0x64
    EDPI_CMD_SIZE: mmio.Mmio(packed struct(u32) {
        /// NA
        EDPI_ALLOWED_CMD_SIZE: u16,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x68
    CMD_MODE_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        TEAR_FX_EN: u1,
        /// NA
        ACK_RQST_EN: u1,
        reserved8: u6 = 0,
        /// NA
        GEN_SW_0P_TX: u1,
        /// NA
        GEN_SW_1P_TX: u1,
        /// NA
        GEN_SW_2P_TX: u1,
        /// NA
        GEN_SR_0P_TX: u1,
        /// NA
        GEN_SR_1P_TX: u1,
        /// NA
        GEN_SR_2P_TX: u1,
        /// NA
        GEN_LW_TX: u1,
        reserved16: u1 = 0,
        /// NA
        DCS_SW_0P_TX: u1,
        /// NA
        DCS_SW_1P_TX: u1,
        /// NA
        DCS_SR_0P_TX: u1,
        /// NA
        DCS_LW_TX: u1,
        reserved24: u4 = 0,
        /// NA
        MAX_RD_PKT_SIZE: u1,
        padding: u7 = 0,
    }),
    /// NA
    /// offset: 0x6c
    GEN_HDR: mmio.Mmio(packed struct(u32) {
        /// NA
        GEN_DT: u6,
        /// NA
        GEN_VC: u2,
        /// NA
        GEN_WC_LSBYTE: u8,
        /// NA
        GEN_WC_MSBYTE: u8,
        padding: u8 = 0,
    }),
    /// NA
    /// offset: 0x70
    GEN_PLD_DATA: mmio.Mmio(packed struct(u32) {
        /// NA
        GEN_PLD_B1: u8,
        /// NA
        GEN_PLD_B2: u8,
        /// NA
        GEN_PLD_B3: u8,
        /// NA
        GEN_PLD_B4: u8,
    }),
    /// NA
    /// offset: 0x74
    CMD_PKT_STATUS: mmio.Mmio(packed struct(u32) {
        /// NA
        GEN_CMD_EMPTY: u1,
        /// NA
        GEN_CMD_FULL: u1,
        /// NA
        GEN_PLD_W_EMPTY: u1,
        /// NA
        GEN_PLD_W_FULL: u1,
        /// NA
        GEN_PLD_R_EMPTY: u1,
        /// NA
        GEN_PLD_R_FULL: u1,
        /// NA
        GEN_RD_CMD_BUSY: u1,
        reserved16: u9 = 0,
        /// NA
        GEN_BUFF_CMD_EMPTY: u1,
        /// NA
        GEN_BUFF_CMD_FULL: u1,
        /// NA
        GEN_BUFF_PLD_EMPTY: u1,
        /// NA
        GEN_BUFF_PLD_FULL: u1,
        padding: u12 = 0,
    }),
    /// NA
    /// offset: 0x78
    TO_CNT_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        LPRX_TO_CNT: u16,
        /// NA
        HSTX_TO_CNT: u16,
    }),
    /// NA
    /// offset: 0x7c
    HS_RD_TO_CNT: mmio.Mmio(packed struct(u32) {
        /// NA
        HS_RD_TO_CNT: u16,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x80
    LP_RD_TO_CNT: mmio.Mmio(packed struct(u32) {
        /// NA
        LP_RD_TO_CNT: u16,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x84
    HS_WR_TO_CNT: mmio.Mmio(packed struct(u32) {
        /// NA
        HS_WR_TO_CNT: u16,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x88
    LP_WR_TO_CNT: mmio.Mmio(packed struct(u32) {
        /// NA
        LP_WR_TO_CNT: u16,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x8c
    BTA_TO_CNT: mmio.Mmio(packed struct(u32) {
        /// NA
        BTA_TO_CNT: u16,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x90
    SDF_3D: mmio.Mmio(packed struct(u32) {
        /// NA
        MODE_3D: u2,
        /// NA
        FORMAT_3D: u2,
        /// NA
        SECOND_VSYNC: u1,
        /// NA
        RIGHT_FIRST: u1,
        reserved16: u10 = 0,
        /// NA
        SEND_3D_CFG: u1,
        padding: u15 = 0,
    }),
    /// NA
    /// offset: 0x94
    LPCLK_CTRL: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_TXREQUESTCLKHS: u1,
        /// NA
        AUTO_CLKLANE_CTRL: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0x98
    PHY_TMR_LPCLK_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_CLKLP2HS_TIME: u10,
        reserved16: u6 = 0,
        /// NA
        PHY_CLKHS2LP_TIME: u10,
        padding: u6 = 0,
    }),
    /// NA
    /// offset: 0x9c
    PHY_TMR_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_LP2HS_TIME: u10,
        reserved16: u6 = 0,
        /// NA
        PHY_HS2LP_TIME: u10,
        padding: u6 = 0,
    }),
    /// NA
    /// offset: 0xa0
    PHY_RSTZ: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_SHUTDOWNZ: u1,
        /// NA
        PHY_RSTZ: u1,
        /// NA
        PHY_ENABLECLK: u1,
        /// NA
        PHY_FORCEPLL: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0xa4
    PHY_IF_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        N_LANES: u2,
        reserved8: u6 = 0,
        /// NA
        PHY_STOP_WAIT_TIME: u8,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0xa8
    PHY_ULPS_CTRL: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_TXREQULPSCLK: u1,
        /// NA
        PHY_TXEXITULPSCLK: u1,
        /// NA
        PHY_TXREQULPSLAN: u1,
        /// NA
        PHY_TXEXITULPSLAN: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0xac
    PHY_TX_TRIGGERS: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_TX_TRIGGERS: u4,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0xb0
    PHY_STATUS: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_LOCK: u1,
        /// NA
        PHY_DIRECTION: u1,
        /// NA
        PHY_STOPSTATECLKLANE: u1,
        /// NA
        PHY_ULPSACTIVENOTCLK: u1,
        /// NA
        PHY_STOPSTATE0LANE: u1,
        /// NA
        PHY_ULPSACTIVENOT0LANE: u1,
        /// NA
        PHY_RXULPSESC0LANE: u1,
        /// NA
        PHY_STOPSTATE1LANE: u1,
        /// NA
        PHY_ULPSACTIVENOT1LANE: u1,
        padding: u23 = 0,
    }),
    /// NA
    /// offset: 0xb4
    PHY_TST_CTRL0: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_TESTCLR: u1,
        /// NA
        PHY_TESTCLK: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0xb8
    PHY_TST_CTRL1: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_TESTDIN: u8,
        /// NA
        PHT_TESTDOUT: u8,
        /// NA
        PHY_TESTEN: u1,
        padding: u15 = 0,
    }),
    /// NA
    /// offset: 0xbc
    INT_ST0: mmio.Mmio(packed struct(u32) {
        /// NA
        ACK_WITH_ERR_0: u1,
        /// NA
        ACK_WITH_ERR_1: u1,
        /// NA
        ACK_WITH_ERR_2: u1,
        /// NA
        ACK_WITH_ERR_3: u1,
        /// NA
        ACK_WITH_ERR_4: u1,
        /// NA
        ACK_WITH_ERR_5: u1,
        /// NA
        ACK_WITH_ERR_6: u1,
        /// NA
        ACK_WITH_ERR_7: u1,
        /// NA
        ACK_WITH_ERR_8: u1,
        /// NA
        ACK_WITH_ERR_9: u1,
        /// NA
        ACK_WITH_ERR_10: u1,
        /// NA
        ACK_WITH_ERR_11: u1,
        /// NA
        ACK_WITH_ERR_12: u1,
        /// NA
        ACK_WITH_ERR_13: u1,
        /// NA
        ACK_WITH_ERR_14: u1,
        /// NA
        ACK_WITH_ERR_15: u1,
        /// NA
        DPHY_ERRORS_0: u1,
        /// NA
        DPHY_ERRORS_1: u1,
        /// NA
        DPHY_ERRORS_2: u1,
        /// NA
        DPHY_ERRORS_3: u1,
        /// NA
        DPHY_ERRORS_4: u1,
        padding: u11 = 0,
    }),
    /// NA
    /// offset: 0xc0
    INT_ST1: mmio.Mmio(packed struct(u32) {
        /// NA
        TO_HS_TX: u1,
        /// NA
        TO_LP_RX: u1,
        /// NA
        ECC_SINGLE_ERR: u1,
        /// NA
        ECC_MILTI_ERR: u1,
        /// NA
        CRC_ERR: u1,
        /// NA
        PKT_SIZE_ERR: u1,
        /// NA
        EOPT_ERR: u1,
        /// NA
        DPI_PLD_WR_ERR: u1,
        /// NA
        GEN_CMD_WR_ERR: u1,
        /// NA
        GEN_PLD_WR_ERR: u1,
        /// NA
        GEN_PLD_SEND_ERR: u1,
        /// NA
        GEN_PLD_RD_ERR: u1,
        /// NA
        GEN_PLD_RECEV_ERR: u1,
        reserved19: u6 = 0,
        /// NA
        DPI_BUFF_PLD_UNDER: u1,
        padding: u12 = 0,
    }),
    /// NA
    /// offset: 0xc4
    INT_MSK0: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_ACK_WITH_ERR_0: u1,
        /// NA
        MASK_ACK_WITH_ERR_1: u1,
        /// NA
        MASK_ACK_WITH_ERR_2: u1,
        /// NA
        MASK_ACK_WITH_ERR_3: u1,
        /// NA
        MASK_ACK_WITH_ERR_4: u1,
        /// NA
        MASK_ACK_WITH_ERR_5: u1,
        /// NA
        MASK_ACK_WITH_ERR_6: u1,
        /// NA
        MASK_ACK_WITH_ERR_7: u1,
        /// NA
        MASK_ACK_WITH_ERR_8: u1,
        /// NA
        MASK_ACK_WITH_ERR_9: u1,
        /// NA
        MASK_ACK_WITH_ERR_10: u1,
        /// NA
        MASK_ACK_WITH_ERR_11: u1,
        /// NA
        MASK_ACK_WITH_ERR_12: u1,
        /// NA
        MASK_ACK_WITH_ERR_13: u1,
        /// NA
        MASK_ACK_WITH_ERR_14: u1,
        /// NA
        MASK_ACK_WITH_ERR_15: u1,
        /// NA
        MASK_DPHY_ERRORS_0: u1,
        /// NA
        MASK_DPHY_ERRORS_1: u1,
        /// NA
        MASK_DPHY_ERRORS_2: u1,
        /// NA
        MASK_DPHY_ERRORS_3: u1,
        /// NA
        MASK_DPHY_ERRORS_4: u1,
        padding: u11 = 0,
    }),
    /// NA
    /// offset: 0xc8
    INT_MSK1: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_TO_HS_TX: u1,
        /// NA
        MASK_TO_LP_RX: u1,
        /// NA
        MASK_ECC_SINGLE_ERR: u1,
        /// NA
        MASK_ECC_MILTI_ERR: u1,
        /// NA
        MASK_CRC_ERR: u1,
        /// NA
        MASK_PKT_SIZE_ERR: u1,
        /// NA
        MASK_EOPT_ERR: u1,
        /// NA
        MASK_DPI_PLD_WR_ERR: u1,
        /// NA
        MASK_GEN_CMD_WR_ERR: u1,
        /// NA
        MASK_GEN_PLD_WR_ERR: u1,
        /// NA
        MASK_GEN_PLD_SEND_ERR: u1,
        /// NA
        MASK_GEN_PLD_RD_ERR: u1,
        /// NA
        MASK_GEN_PLD_RECEV_ERR: u1,
        reserved19: u6 = 0,
        /// NA
        MASK_DPI_BUFF_PLD_UNDER: u1,
        padding: u12 = 0,
    }),
    /// NA
    /// offset: 0xcc
    PHY_CAL: mmio.Mmio(packed struct(u32) {
        /// NA
        TXSKEWCALHS: u1,
        padding: u31 = 0,
    }),
    /// offset: 0xd0
    reserved208: [8]u8,
    /// NA
    /// offset: 0xd8
    INT_FORCE0: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_ACK_WITH_ERR_0: u1,
        /// NA
        FORCE_ACK_WITH_ERR_1: u1,
        /// NA
        FORCE_ACK_WITH_ERR_2: u1,
        /// NA
        FORCE_ACK_WITH_ERR_3: u1,
        /// NA
        FORCE_ACK_WITH_ERR_4: u1,
        /// NA
        FORCE_ACK_WITH_ERR_5: u1,
        /// NA
        FORCE_ACK_WITH_ERR_6: u1,
        /// NA
        FORCE_ACK_WITH_ERR_7: u1,
        /// NA
        FORCE_ACK_WITH_ERR_8: u1,
        /// NA
        FORCE_ACK_WITH_ERR_9: u1,
        /// NA
        FORCE_ACK_WITH_ERR_10: u1,
        /// NA
        FORCE_ACK_WITH_ERR_11: u1,
        /// NA
        FORCE_ACK_WITH_ERR_12: u1,
        /// NA
        FORCE_ACK_WITH_ERR_13: u1,
        /// NA
        FORCE_ACK_WITH_ERR_14: u1,
        /// NA
        FORCE_ACK_WITH_ERR_15: u1,
        /// NA
        FORCE_DPHY_ERRORS_0: u1,
        /// NA
        FORCE_DPHY_ERRORS_1: u1,
        /// NA
        FORCE_DPHY_ERRORS_2: u1,
        /// NA
        FORCE_DPHY_ERRORS_3: u1,
        /// NA
        FORCE_DPHY_ERRORS_4: u1,
        padding: u11 = 0,
    }),
    /// NA
    /// offset: 0xdc
    INT_FORCE1: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_TO_HS_TX: u1,
        /// NA
        FORCE_TO_LP_RX: u1,
        /// NA
        FORCE_ECC_SINGLE_ERR: u1,
        /// NA
        FORCE_ECC_MILTI_ERR: u1,
        /// NA
        FORCE_CRC_ERR: u1,
        /// NA
        FORCE_PKT_SIZE_ERR: u1,
        /// NA
        FORCE_EOPT_ERR: u1,
        /// NA
        FORCE_DPI_PLD_WR_ERR: u1,
        /// NA
        FORCE_GEN_CMD_WR_ERR: u1,
        /// NA
        FORCE_GEN_PLD_WR_ERR: u1,
        /// NA
        FORCE_GEN_PLD_SEND_ERR: u1,
        /// NA
        FORCE_GEN_PLD_RD_ERR: u1,
        /// NA
        FORCE_GEN_PLD_RECEV_ERR: u1,
        reserved19: u6 = 0,
        /// NA
        FORCE_DPI_BUFF_PLD_UNDER: u1,
        padding: u12 = 0,
    }),
    /// offset: 0xe0
    reserved224: [16]u8,
    /// NA
    /// offset: 0xf0
    DSC_PARAMETER: mmio.Mmio(packed struct(u32) {
        /// NA
        COMPRESSION_MODE: u1,
        reserved8: u7 = 0,
        /// NA
        COMPRESS_ALGO: u2,
        reserved16: u6 = 0,
        /// NA
        PPS_SEL: u2,
        padding: u14 = 0,
    }),
    /// NA
    /// offset: 0xf4
    PHY_TMR_RD_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        MAX_RD_TIME: u15,
        padding: u17 = 0,
    }),
    /// offset: 0xf8
    reserved248: [8]u8,
    /// NA
    /// offset: 0x100
    VID_SHADOW_CTRL: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_SHADOW_EN: u1,
        reserved8: u7 = 0,
        /// NA
        VID_SHADOW_REQ: u1,
        reserved16: u7 = 0,
        /// NA
        VID_SHADOW_PIN_REQ: u1,
        padding: u15 = 0,
    }),
    /// offset: 0x104
    reserved260: [8]u8,
    /// NA
    /// offset: 0x10c
    DPI_VCID_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        DPI_VCID_ACT: u2,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0x110
    DPI_COLOR_CODING_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        DPI_COLOR_CODING_ACT: u4,
        reserved8: u4 = 0,
        /// NA
        LOOSELY18_EN_ACT: u1,
        padding: u23 = 0,
    }),
    /// offset: 0x114
    reserved276: [4]u8,
    /// NA
    /// offset: 0x118
    DPI_LP_CMD_TIM_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        INVACT_LPCMD_TIME_ACT: u8,
        reserved16: u8 = 0,
        /// NA
        OUTVACT_LPCMD_TIME_ACT: u8,
        padding: u8 = 0,
    }),
    /// NA
    /// offset: 0x11c
    EDPI_TE_HW_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        HW_TEAR_EFFECT_ON: u1,
        /// NA
        HW_TEAR_EFFECT_GEN: u1,
        reserved4: u2 = 0,
        /// NA
        HW_SET_SCAN_LINE: u1,
        reserved16: u11 = 0,
        /// NA
        SCAN_LINE_PARAMETER: u16,
    }),
    /// offset: 0x120
    reserved288: [24]u8,
    /// NA
    /// offset: 0x138
    VID_MODE_CFG_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_MODE_TYPE_ACT: u2,
        /// NA
        LP_VSA_EN_ACT: u1,
        /// NA
        LP_VBP_EN_ACT: u1,
        /// NA
        LP_VFP_EN_ACT: u1,
        /// NA
        LP_VACT_EN_ACT: u1,
        /// NA
        LP_HBP_EN_ACT: u1,
        /// NA
        LP_HFP_EN_ACT: u1,
        /// NA
        FRAME_BTA_ACK_EN_ACT: u1,
        /// NA
        LP_CMD_EN_ACT: u1,
        padding: u22 = 0,
    }),
    /// NA
    /// offset: 0x13c
    VID_PKT_SIZE_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_PKT_SIZE_ACT: u14,
        padding: u18 = 0,
    }),
    /// NA
    /// offset: 0x140
    VID_NUM_CHUNKS_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_NUM_CHUNKS_ACT: u13,
        padding: u19 = 0,
    }),
    /// NA
    /// offset: 0x144
    VID_NULL_SIZE_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_NULL_SIZE_ACT: u13,
        padding: u19 = 0,
    }),
    /// NA
    /// offset: 0x148
    VID_HSA_TIME_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_HSA_TIME_ACT: u12,
        padding: u20 = 0,
    }),
    /// NA
    /// offset: 0x14c
    VID_HBP_TIME_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_HBP_TIME_ACT: u12,
        padding: u20 = 0,
    }),
    /// NA
    /// offset: 0x150
    VID_HLINE_TIME_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        VID_HLINE_TIME_ACT: u15,
        padding: u17 = 0,
    }),
    /// NA
    /// offset: 0x154
    VID_VSA_LINES_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        VSA_LINES_ACT: u10,
        padding: u22 = 0,
    }),
    /// NA
    /// offset: 0x158
    VID_VBP_LINES_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        VBP_LINES_ACT: u10,
        padding: u22 = 0,
    }),
    /// NA
    /// offset: 0x15c
    VID_VFP_LINES_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        VFP_LINES_ACT: u10,
        padding: u22 = 0,
    }),
    /// NA
    /// offset: 0x160
    VID_VACTIVE_LINES_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        V_ACTIVE_LINES_ACT: u14,
        padding: u18 = 0,
    }),
    /// offset: 0x164
    reserved356: [4]u8,
    /// NA
    /// offset: 0x168
    VID_PKT_STATUS: mmio.Mmio(packed struct(u32) {
        /// NA
        DPI_CMD_W_EMPTY: u1,
        /// NA
        DPI_CMD_W_FULL: u1,
        /// NA
        DPI_PLD_W_EMPTY: u1,
        /// NA
        DPI_PLD_W_FULL: u1,
        reserved16: u12 = 0,
        /// NA
        DPI_BUFF_PLD_EMPTY: u1,
        /// NA
        DPI_BUFF_PLD_FULL: u1,
        padding: u14 = 0,
    }),
    /// offset: 0x16c
    reserved364: [36]u8,
    /// NA
    /// offset: 0x190
    SDF_3D_ACT: mmio.Mmio(packed struct(u32) {
        /// NA
        MODE_3D_ACT: u2,
        /// NA
        FORMAT_3D_ACT: u2,
        /// NA
        SECOND_VSYNC_ACT: u1,
        /// NA
        RIGHT_FIRST_ACT: u1,
        reserved16: u10 = 0,
        /// NA
        SEND_3D_CFG_ACT: u1,
        padding: u15 = 0,
    }),
};
