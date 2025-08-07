const mmio = @import("mmio");
const types = @import("../../types.zig");

/// MIPI Camera Interface Host
pub const MIPI_CSI_HOST = extern struct {
    /// NA
    /// offset: 0x00
    VERSION: mmio.Mmio(packed struct(u32) {
        /// NA
        VERSION: u32,
    }),
    /// NA
    /// offset: 0x04
    N_LANES: mmio.Mmio(packed struct(u32) {
        /// NA
        N_LANES: u3,
        padding: u29 = 0,
    }),
    /// NA
    /// offset: 0x08
    CSI2_RESETN: mmio.Mmio(packed struct(u32) {
        /// NA
        CSI2_RESETN: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x0c
    INT_ST_MAIN: mmio.Mmio(packed struct(u32) {
        /// NA
        ST_STATUS_INT_PHY_FATAL: u1,
        /// NA
        ST_STATUS_INT_PKT_FATAL: u1,
        /// NA
        ST_STATUS_INT_BNDRY_FRAME_FATAL: u1,
        /// NA
        ST_STATUS_INT_SEQ_FRAME_FATAL: u1,
        /// NA
        ST_STATUS_INT_CRC_FRAME_FATAL: u1,
        /// NA
        ST_STATUS_INT_PLD_CRC_FATAL: u1,
        /// NA
        ST_STATUS_INT_DATA_ID: u1,
        /// NA
        ST_STATUS_INT_ECC_CORRECTED: u1,
        reserved16: u8 = 0,
        /// NA
        ST_STATUS_INT_PHY: u1,
        padding: u15 = 0,
    }),
    /// offset: 0x10
    reserved16: [48]u8,
    /// NA
    /// offset: 0x40
    PHY_SHUTDOWNZ: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_SHUTDOWNZ: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x44
    DPHY_RSTZ: mmio.Mmio(packed struct(u32) {
        /// NA
        DPHY_RSTZ: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x48
    PHY_RX: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_RXULPSESC_0: u1,
        /// NA
        PHY_RXULPSESC_1: u1,
        reserved16: u14 = 0,
        /// NA
        PHY_RXULPSCLKNOT: u1,
        /// NA
        PHY_RXCLKACTIVEHS: u1,
        padding: u14 = 0,
    }),
    /// NA
    /// offset: 0x4c
    PHY_STOPSTATE: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_STOPSTATEDATA_0: u1,
        /// NA
        PHY_STOPSTATEDATA_1: u1,
        reserved16: u14 = 0,
        /// NA
        PHY_STOPSTATECLK: u1,
        padding: u15 = 0,
    }),
    /// NA
    /// offset: 0x50
    PHY_TEST_CTRL0: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_TESTCLR: u1,
        /// NA
        PHY_TESTCLK: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0x54
    PHY_TEST_CTRL1: mmio.Mmio(packed struct(u32) {
        /// NA
        PHY_TESTDIN: u8,
        /// NA
        PHY_TESTDOUT: u8,
        /// NA
        PHY_TESTEN: u1,
        padding: u15 = 0,
    }),
    /// offset: 0x58
    reserved88: [112]u8,
    /// NA
    /// offset: 0xc8
    VC_EXTENSION: mmio.Mmio(packed struct(u32) {
        /// NA
        VCX: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0xcc
    PHY_CAL: mmio.Mmio(packed struct(u32) {
        /// NA
        RXSKEWCALHS: u1,
        padding: u31 = 0,
    }),
    /// offset: 0xd0
    reserved208: [16]u8,
    /// NA
    /// offset: 0xe0
    INT_ST_PHY_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        ST_PHY_ERRSOTSYNCHS_0: u1,
        /// NA
        ST_PHY_ERRSOTSYNCHS_1: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0xe4
    INT_MSK_PHY_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_PHY_ERRSOTSYNCHS_0: u1,
        /// NA
        MASK_PHY_ERRSOTSYNCHS_1: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0xe8
    INT_FORCE_PHY_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_PHY_ERRSOTSYNCHS_0: u1,
        /// NA
        FORCE_PHY_ERRSOTSYNCHS_1: u1,
        padding: u30 = 0,
    }),
    /// offset: 0xec
    reserved236: [4]u8,
    /// NA
    /// offset: 0xf0
    INT_ST_PKT_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        ST_ERR_ECC_DOUBLE: u1,
        /// NA
        ST_SHORTER_PAYLOAD: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0xf4
    INT_MSK_PKT_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_ERR_ECC_DOUBLE: u1,
        /// NA
        MASK_SHORTER_PAYLOAD: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0xf8
    INT_FORCE_PKT_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_ERR_ECC_DOUBLE: u1,
        /// NA
        FORCE_SHORTER_PAYLOAD: u1,
        padding: u30 = 0,
    }),
    /// offset: 0xfc
    reserved252: [20]u8,
    /// NA
    /// offset: 0x110
    INT_ST_PHY: mmio.Mmio(packed struct(u32) {
        /// NA
        ST_PHY_ERRSOTHS_0: u1,
        /// NA
        ST_PHY_ERRSOTHS_1: u1,
        reserved16: u14 = 0,
        /// NA
        ST_PHY_ERRESC_0: u1,
        /// NA
        ST_PHY_ERRESC_1: u1,
        padding: u14 = 0,
    }),
    /// NA
    /// offset: 0x114
    INT_MSK_PHY: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_PHY_ERRSOTHS_0: u1,
        /// NA
        MASK_PHY_ERRSOTHS_1: u1,
        reserved16: u14 = 0,
        /// NA
        MASK_PHY_ERRESC_0: u1,
        /// NA
        MASK_PHY_ERRESC_1: u1,
        padding: u14 = 0,
    }),
    /// NA
    /// offset: 0x118
    INT_FORCE_PHY: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_PHY_ERRSOTHS_0: u1,
        /// NA
        FORCE_PHY_ERRSOTHS_1: u1,
        reserved16: u14 = 0,
        /// NA
        FORCE_PHY_ERRESC_0: u1,
        /// NA
        FORCE_PHY_ERRESC_1: u1,
        padding: u14 = 0,
    }),
    /// offset: 0x11c
    reserved284: [356]u8,
    /// NA
    /// offset: 0x280
    INT_ST_BNDRY_FRAME_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC0: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC1: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC2: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC3: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC4: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC5: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC6: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC7: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC8: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC9: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC10: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC11: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC12: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC13: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC14: u1,
        /// NA
        ST_ERR_F_BNDRY_MATCH_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x284
    INT_MSK_BNDRY_FRAME_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC0: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC1: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC2: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC3: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC4: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC5: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC6: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC7: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC8: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC9: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC10: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC11: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC12: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC13: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC14: u1,
        /// NA
        MASK_ERR_F_BNDRY_MATCH_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x288
    INT_FORCE_BNDRY_FRAME_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC0: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC1: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC2: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC3: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC4: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC5: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC6: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC7: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC8: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC9: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC10: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC11: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC12: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC13: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC14: u1,
        /// NA
        FORCE_ERR_F_BNDRY_MATCH_VC15: u1,
        padding: u16 = 0,
    }),
    /// offset: 0x28c
    reserved652: [4]u8,
    /// NA
    /// offset: 0x290
    INT_ST_SEQ_FRAME_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        ST_ERR_F_SEQ_VC0: u1,
        /// NA
        ST_ERR_F_SEQ_VC1: u1,
        /// NA
        ST_ERR_F_SEQ_VC2: u1,
        /// NA
        ST_ERR_F_SEQ_VC3: u1,
        /// NA
        ST_ERR_F_SEQ_VC4: u1,
        /// NA
        ST_ERR_F_SEQ_VC5: u1,
        /// NA
        ST_ERR_F_SEQ_VC6: u1,
        /// NA
        ST_ERR_F_SEQ_VC7: u1,
        /// NA
        ST_ERR_F_SEQ_VC8: u1,
        /// NA
        ST_ERR_F_SEQ_VC9: u1,
        /// NA
        ST_ERR_F_SEQ_VC10: u1,
        /// NA
        ST_ERR_F_SEQ_VC11: u1,
        /// NA
        ST_ERR_F_SEQ_VC12: u1,
        /// NA
        ST_ERR_F_SEQ_VC13: u1,
        /// NA
        ST_ERR_F_SEQ_VC14: u1,
        /// NA
        ST_ERR_F_SEQ_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x294
    INT_MSK_SEQ_FRAME_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_ERR_F_SEQ_VC0: u1,
        /// NA
        MASK_ERR_F_SEQ_VC1: u1,
        /// NA
        MASK_ERR_F_SEQ_VC2: u1,
        /// NA
        MASK_ERR_F_SEQ_VC3: u1,
        /// NA
        MASK_ERR_F_SEQ_VC4: u1,
        /// NA
        MASK_ERR_F_SEQ_VC5: u1,
        /// NA
        MASK_ERR_F_SEQ_VC6: u1,
        /// NA
        MASK_ERR_F_SEQ_VC7: u1,
        /// NA
        MASK_ERR_F_SEQ_VC8: u1,
        /// NA
        MASK_ERR_F_SEQ_VC9: u1,
        /// NA
        MASK_ERR_F_SEQ_VC10: u1,
        /// NA
        MASK_ERR_F_SEQ_VC11: u1,
        /// NA
        MASK_ERR_F_SEQ_VC12: u1,
        /// NA
        MASK_ERR_F_SEQ_VC13: u1,
        /// NA
        MASK_ERR_F_SEQ_VC14: u1,
        /// NA
        MASK_ERR_F_SEQ_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x298
    INT_FORCE_SEQ_FRAME_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_ERR_F_SEQ_VC0: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC1: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC2: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC3: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC4: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC5: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC6: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC7: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC8: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC9: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC10: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC11: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC12: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC13: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC14: u1,
        /// NA
        FORCE_ERR_F_SEQ_VC15: u1,
        padding: u16 = 0,
    }),
    /// offset: 0x29c
    reserved668: [4]u8,
    /// NA
    /// offset: 0x2a0
    INT_ST_CRC_FRAME_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        ST_ERR_FRAME_DATA_VC0: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC1: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC2: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC3: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC4: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC5: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC6: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC7: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC8: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC9: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC10: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC11: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC12: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC13: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC14: u1,
        /// NA
        ST_ERR_FRAME_DATA_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x2a4
    INT_MSK_CRC_FRAME_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_ERR_FRAME_DATA_VC0: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC1: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC2: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC3: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC4: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC5: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC6: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC7: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC8: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC9: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC10: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC11: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC12: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC13: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC14: u1,
        /// NA
        MASK_ERR_FRAME_DATA_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x2a8
    INT_FORCE_CRC_FRAME_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_ERR_FRAME_DATA_VC0: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC1: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC2: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC3: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC4: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC5: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC6: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC7: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC8: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC9: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC10: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC11: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC12: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC13: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC14: u1,
        /// NA
        FORCE_ERR_FRAME_DATA_VC15: u1,
        padding: u16 = 0,
    }),
    /// offset: 0x2ac
    reserved684: [4]u8,
    /// NA
    /// offset: 0x2b0
    INT_ST_PLD_CRC_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        ST_ERR_CRC_VC0: u1,
        /// NA
        ST_ERR_CRC_VC1: u1,
        /// NA
        ST_ERR_CRC_VC2: u1,
        /// NA
        ST_ERR_CRC_VC3: u1,
        /// NA
        ST_ERR_CRC_VC4: u1,
        /// NA
        ST_ERR_CRC_VC5: u1,
        /// NA
        ST_ERR_CRC_VC6: u1,
        /// NA
        ST_ERR_CRC_VC7: u1,
        /// NA
        ST_ERR_CRC_VC8: u1,
        /// NA
        ST_ERR_CRC_VC9: u1,
        /// NA
        ST_ERR_CRC_VC10: u1,
        /// NA
        ST_ERR_CRC_VC11: u1,
        /// NA
        ST_ERR_CRC_VC12: u1,
        /// NA
        ST_ERR_CRC_VC13: u1,
        /// NA
        ST_ERR_CRC_VC14: u1,
        /// NA
        ST_ERR_CRC_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x2b4
    INT_MSK_PLD_CRC_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_ERR_CRC_VC0: u1,
        /// NA
        MASK_ERR_CRC_VC1: u1,
        /// NA
        MASK_ERR_CRC_VC2: u1,
        /// NA
        MASK_ERR_CRC_VC3: u1,
        /// NA
        MASK_ERR_CRC_VC4: u1,
        /// NA
        MASK_ERR_CRC_VC5: u1,
        /// NA
        MASK_ERR_CRC_VC6: u1,
        /// NA
        MASK_ERR_CRC_VC7: u1,
        /// NA
        MASK_ERR_CRC_VC8: u1,
        /// NA
        MASK_ERR_CRC_VC9: u1,
        /// NA
        MASK_ERR_CRC_VC10: u1,
        /// NA
        MASK_ERR_CRC_VC11: u1,
        /// NA
        MASK_ERR_CRC_VC12: u1,
        /// NA
        MASK_ERR_CRC_VC13: u1,
        /// NA
        MASK_ERR_CRC_VC14: u1,
        /// NA
        MASK_ERR_CRC_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x2b8
    INT_FORCE_PLD_CRC_FATAL: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_ERR_CRC_VC0: u1,
        /// NA
        FORCE_ERR_CRC_VC1: u1,
        /// NA
        FORCE_ERR_CRC_VC2: u1,
        /// NA
        FORCE_ERR_CRC_VC3: u1,
        /// NA
        FORCE_ERR_CRC_VC4: u1,
        /// NA
        FORCE_ERR_CRC_VC5: u1,
        /// NA
        FORCE_ERR_CRC_VC6: u1,
        /// NA
        FORCE_ERR_CRC_VC7: u1,
        /// NA
        FORCE_ERR_CRC_VC8: u1,
        /// NA
        FORCE_ERR_CRC_VC9: u1,
        /// NA
        FORCE_ERR_CRC_VC10: u1,
        /// NA
        FORCE_ERR_CRC_VC11: u1,
        /// NA
        FORCE_ERR_CRC_VC12: u1,
        /// NA
        FORCE_ERR_CRC_VC13: u1,
        /// NA
        FORCE_ERR_CRC_VC14: u1,
        /// NA
        FORCE_ERR_CRC_VC15: u1,
        padding: u16 = 0,
    }),
    /// offset: 0x2bc
    reserved700: [4]u8,
    /// NA
    /// offset: 0x2c0
    INT_ST_DATA_ID: mmio.Mmio(packed struct(u32) {
        /// NA
        ST_ERR_ID_VC0: u1,
        /// NA
        ST_ERR_ID_VC1: u1,
        /// NA
        ST_ERR_ID_VC2: u1,
        /// NA
        ST_ERR_ID_VC3: u1,
        /// NA
        ST_ERR_ID_VC4: u1,
        /// NA
        ST_ERR_ID_VC5: u1,
        /// NA
        ST_ERR_ID_VC6: u1,
        /// NA
        ST_ERR_ID_VC7: u1,
        /// NA
        ST_ERR_ID_VC8: u1,
        /// NA
        ST_ERR_ID_VC9: u1,
        /// NA
        ST_ERR_ID_VC10: u1,
        /// NA
        ST_ERR_ID_VC11: u1,
        /// NA
        ST_ERR_ID_VC12: u1,
        /// NA
        ST_ERR_ID_VC13: u1,
        /// NA
        ST_ERR_ID_VC14: u1,
        /// NA
        ST_ERR_ID_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x2c4
    INT_MSK_DATA_ID: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_ERR_ID_VC0: u1,
        /// NA
        MASK_ERR_ID_VC1: u1,
        /// NA
        MASK_ERR_ID_VC2: u1,
        /// NA
        MASK_ERR_ID_VC3: u1,
        /// NA
        MASK_ERR_ID_VC4: u1,
        /// NA
        MASK_ERR_ID_VC5: u1,
        /// NA
        MASK_ERR_ID_VC6: u1,
        /// NA
        MASK_ERR_ID_VC7: u1,
        /// NA
        MASK_ERR_ID_VC8: u1,
        /// NA
        MASK_ERR_ID_VC9: u1,
        /// NA
        MASK_ERR_ID_VC10: u1,
        /// NA
        MASK_ERR_ID_VC11: u1,
        /// NA
        MASK_ERR_ID_VC12: u1,
        /// NA
        MASK_ERR_ID_VC13: u1,
        /// NA
        MASK_ERR_ID_VC14: u1,
        /// NA
        MASK_ERR_ID_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x2c8
    INT_FORCE_DATA_ID: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_ERR_ID_VC0: u1,
        /// NA
        FORCE_ERR_ID_VC1: u1,
        /// NA
        FORCE_ERR_ID_VC2: u1,
        /// NA
        FORCE_ERR_ID_VC3: u1,
        /// NA
        FORCE_ERR_ID_VC4: u1,
        /// NA
        FORCE_ERR_ID_VC5: u1,
        /// NA
        FORCE_ERR_ID_VC6: u1,
        /// NA
        FORCE_ERR_ID_VC7: u1,
        /// NA
        FORCE_ERR_ID_VC8: u1,
        /// NA
        FORCE_ERR_ID_VC9: u1,
        /// NA
        FORCE_ERR_ID_VC10: u1,
        /// NA
        FORCE_ERR_ID_VC11: u1,
        /// NA
        FORCE_ERR_ID_VC12: u1,
        /// NA
        FORCE_ERR_ID_VC13: u1,
        /// NA
        FORCE_ERR_ID_VC14: u1,
        /// NA
        FORCE_ERR_ID_VC15: u1,
        padding: u16 = 0,
    }),
    /// offset: 0x2cc
    reserved716: [4]u8,
    /// NA
    /// offset: 0x2d0
    INT_ST_ECC_CORRECTED: mmio.Mmio(packed struct(u32) {
        /// NA
        ST_ERR_ECC_CORRECTED_VC0: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC1: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC2: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC3: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC4: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC5: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC6: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC7: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC8: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC9: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC10: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC11: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC12: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC13: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC14: u1,
        /// NA
        ST_ERR_ECC_CORRECTED_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x2d4
    INT_MSK_ECC_CORRECTED: mmio.Mmio(packed struct(u32) {
        /// NA
        MASK_ERR_ECC_CORRECTED_VC0: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC1: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC2: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC3: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC4: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC5: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC6: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC7: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC8: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC9: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC10: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC11: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC12: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC13: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC14: u1,
        /// NA
        MASK_ERR_ECC_CORRECTED_VC15: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x2d8
    INT_FORCE_ECC_CORRECTED: mmio.Mmio(packed struct(u32) {
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC0: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC1: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC2: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC3: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC4: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC5: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC6: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC7: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC8: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC9: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC10: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC11: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC12: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC13: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC14: u1,
        /// NA
        FORCE_ERR_ECC_CORRECTED_VC15: u1,
        padding: u16 = 0,
    }),
    /// offset: 0x2dc
    reserved732: [36]u8,
    /// NA
    /// offset: 0x300
    SCRAMBLING: mmio.Mmio(packed struct(u32) {
        /// NA
        SCRAMBLE_ENABLE: u1,
        padding: u31 = 0,
    }),
    /// NA
    /// offset: 0x304
    SCRAMBLING_SEED1: mmio.Mmio(packed struct(u32) {
        /// NA
        SCRAMBLE_SEED_LANE1: u16,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x308
    SCRAMBLING_SEED2: mmio.Mmio(packed struct(u32) {
        /// NA
        SCRAMBLE_SEED_LANE2: u16,
        padding: u16 = 0,
    }),
};
