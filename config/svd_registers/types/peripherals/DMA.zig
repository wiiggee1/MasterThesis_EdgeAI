const mmio = @import("mmio");
const types = @import("../../types.zig");

/// DMA (Direct Memory Access) Controller
pub const DMA = extern struct {
    /// NA
    /// offset: 0x00
    ID0: mmio.Mmio(packed struct(u32) {
        /// NA
        DMAC_ID: u32,
    }),
    /// offset: 0x04
    reserved4: [4]u8,
    /// NA
    /// offset: 0x08
    COMPVER0: mmio.Mmio(packed struct(u32) {
        /// NA
        DMAC_COMPVER: u32,
    }),
    /// offset: 0x0c
    reserved12: [4]u8,
    /// NA
    /// offset: 0x10
    CFG0: mmio.Mmio(packed struct(u32) {
        /// NA
        DMAC_EN: u1,
        /// NA
        INT_EN: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x14
    reserved20: [4]u8,
    /// NA
    /// offset: 0x18
    CHEN0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_EN: u1,
        /// NA
        CH2_EN: u1,
        /// NA
        CH3_EN: u1,
        /// NA
        CH4_EN: u1,
        reserved8: u4 = 0,
        /// NA
        CH1_EN_WE: u1,
        /// NA
        CH2_EN_WE: u1,
        /// NA
        CH3_EN_WE: u1,
        /// NA
        CH4_EN_WE: u1,
        reserved16: u4 = 0,
        /// NA
        CH1_SUSP: u1,
        /// NA
        CH2_SUSP: u1,
        /// NA
        CH3_SUSP: u1,
        /// NA
        CH4_SUSP: u1,
        reserved24: u4 = 0,
        /// NA
        CH1_SUSP_WE: u1,
        /// NA
        CH2_SUSP_WE: u1,
        /// NA
        CH3_SUSP_WE: u1,
        /// NA
        CH4_SUSP_WE: u1,
        padding: u4 = 0,
    }),
    /// NA
    /// offset: 0x1c
    CHEN1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_ABORT: u1,
        /// NA
        CH2_ABORT: u1,
        /// NA
        CH3_ABORT: u1,
        /// NA
        CH4_ABORT: u1,
        reserved8: u4 = 0,
        /// NA
        CH1_ABORT_WE: u1,
        /// NA
        CH2_ABORT_WE: u1,
        /// NA
        CH3_ABORT_WE: u1,
        /// NA
        CH4_ABORT_WE: u1,
        padding: u20 = 0,
    }),
    /// offset: 0x20
    reserved32: [16]u8,
    /// NA
    /// offset: 0x30
    INTSTATUS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_INTSTAT: u1,
        /// NA
        CH2_INTSTAT: u1,
        /// NA
        CH3_INTSTAT: u1,
        /// NA
        CH4_INTSTAT: u1,
        reserved16: u12 = 0,
        /// NA
        COMMONREG_INTSTAT: u1,
        padding: u15 = 0,
    }),
    /// offset: 0x34
    reserved52: [4]u8,
    /// NA
    /// offset: 0x38
    COMMONREG_INTCLEAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CLEAR_SLVIF_COMMONREG_DEC_ERR_INTSTAT: u1,
        /// NA
        CLEAR_SLVIF_COMMONREG_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CLEAR_SLVIF_COMMONREG_RD2WO_ERR_INTSTAT: u1,
        /// NA
        CLEAR_SLVIF_COMMONREG_WRONHOLD_ERR_INTSTAT: u1,
        reserved7: u3 = 0,
        /// NA
        CLEAR_SLVIF_COMMONREG_WRPARITY_ERR_INTSTAT: u1,
        /// NA
        CLEAR_SLVIF_UNDEFINEDREG_DEC_ERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF1_RCH0_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF1_RCH0_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF1_RCH1_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF1_RCH1_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF1_BCH_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF1_BCH_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF2_RCH0_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF2_RCH0_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF2_RCH1_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF2_RCH1_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF2_BCH_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        CLEAR_MXIF2_BCH_ECCPROT_UNCORRERR_INTSTAT: u1,
        padding: u11 = 0,
    }),
    /// offset: 0x3c
    reserved60: [4]u8,
    /// NA
    /// offset: 0x40
    COMMONREG_INTSTATUS_ENABLE0: mmio.Mmio(packed struct(u32) {
        /// NA
        ENABLE_SLVIF_COMMONREG_DEC_ERR_INTSTAT: u1,
        /// NA
        ENABLE_SLVIF_COMMONREG_WR2RO_ERR_INTSTAT: u1,
        /// NA
        ENABLE_SLVIF_COMMONREG_RD2WO_ERR_INTSTAT: u1,
        /// NA
        ENABLE_SLVIF_COMMONREG_WRONHOLD_ERR_INTSTAT: u1,
        reserved7: u3 = 0,
        /// NA
        ENABLE_SLVIF_COMMONREG_WRPARITY_ERR_INTSTAT: u1,
        /// NA
        ENABLE_SLVIF_UNDEFINEDREG_DEC_ERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF1_RCH0_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF1_RCH0_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF1_RCH1_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF1_RCH1_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF1_BCH_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF1_BCH_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF2_RCH0_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF2_RCH0_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF2_RCH1_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF2_RCH1_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF2_BCH_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        ENABLE_MXIF2_BCH_ECCPROT_UNCORRERR_INTSTAT: u1,
        padding: u11 = 0,
    }),
    /// offset: 0x44
    reserved68: [4]u8,
    /// NA
    /// offset: 0x48
    COMMONREG_INTSIGNAL_ENABLE0: mmio.Mmio(packed struct(u32) {
        /// NA
        ENABLE_SLVIF_COMMONREG_DEC_ERR_INTSIGNAL: u1,
        /// NA
        ENABLE_SLVIF_COMMONREG_WR2RO_ERR_INTSIGNAL: u1,
        /// NA
        ENABLE_SLVIF_COMMONREG_RD2WO_ERR_INTSIGNAL: u1,
        /// NA
        ENABLE_SLVIF_COMMONREG_WRONHOLD_ERR_INTSIGNAL: u1,
        reserved7: u3 = 0,
        /// NA
        ENABLE_SLVIF_COMMONREG_WRPARITY_ERR_INTSIGNAL: u1,
        /// NA
        ENABLE_SLVIF_UNDEFINEDREG_DEC_ERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF1_RCH0_ECCPROT_CORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF1_RCH0_ECCPROT_UNCORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF1_RCH1_ECCPROT_CORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF1_RCH1_ECCPROT_UNCORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF1_BCH_ECCPROT_CORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF1_BCH_ECCPROT_UNCORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF2_RCH0_ECCPROT_CORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF2_RCH0_ECCPROT_UNCORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF2_RCH1_ECCPROT_CORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF2_RCH1_ECCPROT_UNCORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF2_BCH_ECCPROT_CORRERR_INTSIGNAL: u1,
        /// NA
        ENABLE_MXIF2_BCH_ECCPROT_UNCORRERR_INTSIGNAL: u1,
        padding: u11 = 0,
    }),
    /// offset: 0x4c
    reserved76: [4]u8,
    /// NA
    /// offset: 0x50
    COMMONREG_INTSTATUS0: mmio.Mmio(packed struct(u32) {
        /// NA
        SLVIF_COMMONREG_DEC_ERR_INTSTAT: u1,
        /// NA
        SLVIF_COMMONREG_WR2RO_ERR_INTSTAT: u1,
        /// NA
        SLVIF_COMMONREG_RD2WO_ERR_INTSTAT: u1,
        /// NA
        SLVIF_COMMONREG_WRONHOLD_ERR_INTSTAT: u1,
        reserved7: u3 = 0,
        /// NA
        SLVIF_COMMONREG_WRPARITY_ERR_INTSTAT: u1,
        /// NA
        SLVIF_UNDEFINEDREG_DEC_ERR_INTSTAT: u1,
        /// NA
        MXIF1_RCH0_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        MXIF1_RCH0_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        MXIF1_RCH1_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        MXIF1_RCH1_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        MXIF1_BCH_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        MXIF1_BCH_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        MXIF2_RCH0_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        MXIF2_RCH0_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        MXIF2_RCH1_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        MXIF2_RCH1_ECCPROT_UNCORRERR_INTSTAT: u1,
        /// NA
        MXIF2_BCH_ECCPROT_CORRERR_INTSTAT: u1,
        /// NA
        MXIF2_BCH_ECCPROT_UNCORRERR_INTSTAT: u1,
        padding: u11 = 0,
    }),
    /// offset: 0x54
    reserved84: [4]u8,
    /// NA
    /// offset: 0x58
    RESET0: mmio.Mmio(packed struct(u32) {
        /// NA
        DMAC_RST: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x5c
    reserved92: [4]u8,
    /// NA
    /// offset: 0x60
    LOWPOWER_CFG0: mmio.Mmio(packed struct(u32) {
        /// NA
        GBL_CSLP_EN: u1,
        /// NA
        CHNL_CSLP_EN: u1,
        /// NA
        SBIU_CSLP_EN: u1,
        /// NA
        MXIF_CSLP_EN: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x64
    LOWPOWER_CFG1: mmio.Mmio(packed struct(u32) {
        /// NA
        GLCH_LPDLY: u8,
        /// NA
        SBIU_LPDLY: u8,
        /// NA
        MXIF_LPDLY: u8,
        padding: u8 = 0,
    }),
    /// offset: 0x68
    reserved104: [152]u8,
    /// NA
    /// offset: 0x100
    CH1_SAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_SAR0: u32,
    }),
    /// NA
    /// offset: 0x104
    CH1_SAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_SAR1: u32,
    }),
    /// NA
    /// offset: 0x108
    CH1_DAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_DAR0: u32,
    }),
    /// NA
    /// offset: 0x10c
    CH1_DAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_DAR1: u32,
    }),
    /// NA
    /// offset: 0x110
    CH1_BLOCK_TS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_BLOCK_TS: u22,
        padding: u10 = 0,
    }),
    /// offset: 0x114
    reserved276: [4]u8,
    /// NA
    /// offset: 0x118
    CH1_CTL0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_SMS: u1,
        reserved2: u1 = 0,
        /// NA
        CH1_DMS: u1,
        reserved4: u1 = 0,
        /// NA
        CH1_SINC: u1,
        reserved6: u1 = 0,
        /// NA
        CH1_DINC: u1,
        reserved8: u1 = 0,
        /// NA
        CH1_SRC_TR_WIDTH: u3,
        /// NA
        CH1_DST_TR_WIDTH: u3,
        /// NA
        CH1_SRC_MSIZE: u4,
        /// NA
        CH1_DST_MSIZE: u4,
        /// NA
        CH1_AR_CACHE: u4,
        /// NA
        CH1_AW_CACHE: u4,
        /// NA
        CH1_NONPOSTED_LASTWRITE_EN: u1,
        padding: u1 = 0,
    }),
    /// NA
    /// offset: 0x11c
    CH1_CTL1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_AR_PROT: u3,
        /// NA
        CH1_AW_PROT: u3,
        /// NA
        CH1_ARLEN_EN: u1,
        /// NA
        CH1_ARLEN: u8,
        /// NA
        CH1_AWLEN_EN: u1,
        /// NA
        CH1_AWLEN: u8,
        /// NA
        CH1_SRC_STAT_EN: u1,
        /// NA
        CH1_DST_STAT_EN: u1,
        /// NA
        CH1_IOC_BLKTFR: u1,
        reserved30: u3 = 0,
        /// NA
        CH1_SHADOWREG_OR_LLI_LAST: u1,
        /// NA
        CH1_SHADOWREG_OR_LLI_VALID: u1,
    }),
    /// NA
    /// offset: 0x120
    CH1_CFG0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_SRC_MULTBLK_TYPE: u2,
        /// NA
        CH1_DST_MULTBLK_TYPE: u2,
        reserved18: u14 = 0,
        /// NA
        CH1_RD_UID: u4,
        reserved25: u3 = 0,
        /// NA
        CH1_WR_UID: u4,
        padding: u3 = 0,
    }),
    /// NA
    /// offset: 0x124
    CH1_CFG1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_TT_FC: u3,
        /// NA
        CH1_HS_SEL_SRC: u1,
        /// NA
        CH1_HS_SEL_DST: u1,
        /// NA
        CH1_SRC_HWHS_POL: u1,
        /// NA
        CH1_DST_HWHS_POL: u1,
        /// NA
        CH1_SRC_PER: u2,
        reserved12: u3 = 0,
        /// NA
        CH1_DST_PER: u2,
        reserved17: u3 = 0,
        /// NA
        CH1_CH_PRIOR: u3,
        /// NA
        CH1_LOCK_CH: u1,
        /// NA
        CH1_LOCK_CH_L: u2,
        /// NA
        CH1_SRC_OSR_LMT: u4,
        /// NA
        CH1_DST_OSR_LMT: u4,
        padding: u1 = 0,
    }),
    /// NA
    /// offset: 0x128
    CH1_LLP0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_LMS: u1,
        reserved6: u5 = 0,
        /// NA
        CH1_LOC0: u26,
    }),
    /// NA
    /// offset: 0x12c
    CH1_LLP1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_LOC1: u32,
    }),
    /// NA
    /// offset: 0x130
    CH1_STATUS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_CMPLTD_BLK_TFR_SIZE: u22,
        padding: u10 = 0,
    }),
    /// NA
    /// offset: 0x134
    CH1_STATUS1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_DATA_LEFT_IN_FIFO: u15,
        padding: u17 = 0,
    }),
    /// NA
    /// offset: 0x138
    CH1_SWHSSRC0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_SWHS_REQ_SRC: u1,
        /// NA
        CH1_SWHS_REQ_SRC_WE: u1,
        /// NA
        CH1_SWHS_SGLREQ_SRC: u1,
        /// NA
        CH1_SWHS_SGLREQ_SRC_WE: u1,
        /// NA
        CH1_SWHS_LST_SRC: u1,
        /// NA
        CH1_SWHS_LST_SRC_WE: u1,
        padding: u26 = 0,
    }),
    /// offset: 0x13c
    reserved316: [4]u8,
    /// NA
    /// offset: 0x140
    CH1_SWHSDST0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_SWHS_REQ_DST: u1,
        /// NA
        CH1_SWHS_REQ_DST_WE: u1,
        /// NA
        CH1_SWHS_SGLREQ_DST: u1,
        /// NA
        CH1_SWHS_SGLREQ_DST_WE: u1,
        /// NA
        CH1_SWHS_LST_DST: u1,
        /// NA
        CH1_SWHS_LST_DST_WE: u1,
        padding: u26 = 0,
    }),
    /// offset: 0x144
    reserved324: [4]u8,
    /// NA
    /// offset: 0x148
    CH1_BLK_TFR_RESUMEREQ0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_BLK_TFR_RESUMEREQ: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x14c
    reserved332: [4]u8,
    /// NA
    /// offset: 0x150
    CH1_AXI_ID0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_AXI_READ_ID_SUFFIX: u1,
        reserved16: u15 = 0,
        /// NA
        CH1_AXI_WRITE_ID_SUFFIX: u1,
        padding: u15 = 0,
    }),
    /// offset: 0x154
    reserved340: [4]u8,
    /// NA
    /// offset: 0x158
    CH1_AXI_QOS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_AXI_AWQOS: u4,
        /// NA
        CH1_AXI_ARQOS: u4,
        padding: u24 = 0,
    }),
    /// offset: 0x15c
    reserved348: [4]u8,
    /// NA
    /// offset: 0x160
    CH1_SSTAT0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_SSTAT: u32,
    }),
    /// offset: 0x164
    reserved356: [4]u8,
    /// NA
    /// offset: 0x168
    CH1_DSTAT0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_DSTAT: u32,
    }),
    /// offset: 0x16c
    reserved364: [4]u8,
    /// NA
    /// offset: 0x170
    CH1_SSTATAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_SSTATAR0: u32,
    }),
    /// NA
    /// offset: 0x174
    CH1_SSTATAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_SSTATAR1: u32,
    }),
    /// NA
    /// offset: 0x178
    CH1_DSTATAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_DSTATAR0: u32,
    }),
    /// NA
    /// offset: 0x17c
    CH1_DSTATAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_DSTATAR1: u32,
    }),
    /// NA
    /// offset: 0x180
    CH1_INTSTATUS_ENABLE0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_ENABLE_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH1_ENABLE_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH1_ENABLE_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH1_ENABLE_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH1_ENABLE_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH1_ENABLE_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH1_ENABLE_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH1_ENABLE_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH1_ENABLE_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH1_ENABLE_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH1_ENABLE_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH1_ENABLE_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x184
    CH1_INTSTATUS_ENABLE1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_ENABLE_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH1_ENABLE_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x188
    CH1_INTSTATUS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH1_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH1_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH1_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH1_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH1_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH1_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH1_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH1_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH1_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH1_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH1_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH1_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH1_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH1_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH1_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH1_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x18c
    CH1_INTSTATUS1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH1_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH1_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH1_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x190
    CH1_INTSIGNAL_ENABLE0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_ENABLE_BLOCK_TFR_DONE_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_DMA_TFR_DONE_INTSIGNAL: u1,
        reserved3: u1 = 0,
        /// NA
        CH1_ENABLE_SRC_TRANSCOMP_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_DST_TRANSCOMP_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_SRC_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_DST_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_SRC_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_DST_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_LLI_RD_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_LLI_WR_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_LLI_RD_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_LLI_WR_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_SHADOWREG_OR_LLI_INVALID_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_SLVIF_MULTIBLKTYPE_ERR_INTSIGNAL: u1,
        reserved16: u1 = 0,
        /// NA
        CH1_ENABLE_SLVIF_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_SLVIF_WR2RO_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_SLVIF_RD2RWO_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_SLVIF_WRONCHEN_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_SLVIF_WRONHOLD_ERR_INTSIGNAL: u1,
        reserved25: u3 = 0,
        /// NA
        CH1_ENABLE_SLVIF_WRPARITY_ERR_INTSIGNAL: u1,
        reserved27: u1 = 0,
        /// NA
        CH1_ENABLE_CH_LOCK_CLEARED_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_CH_SRC_SUSPENDED_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_CH_SUSPENDED_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_CH_DISABLED_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_CH_ABORTED_INTSIGNAL: u1,
    }),
    /// NA
    /// offset: 0x194
    CH1_INTSIGNAL_ENABLE1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_ENABLE_ECC_PROT_CHMEM_CORRERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_ECC_PROT_CHMEM_UNCORRERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_ECC_PROT_UIDMEM_CORRERR_INTSIGNAL: u1,
        /// NA
        CH1_ENABLE_ECC_PROT_UIDMEM_UNCORRERR_INTSIGNAL: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x198
    CH1_INTCLEAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_CLEAR_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH1_CLEAR_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH1_CLEAR_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH1_CLEAR_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH1_CLEAR_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH1_CLEAR_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH1_CLEAR_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH1_CLEAR_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH1_CLEAR_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH1_CLEAR_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH1_CLEAR_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH1_CLEAR_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x19c
    CH1_INTCLEAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH1_CLEAR_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH1_CLEAR_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// offset: 0x1a0
    reserved416: [96]u8,
    /// NA
    /// offset: 0x200
    CH2_SAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_SAR0: u32,
    }),
    /// NA
    /// offset: 0x204
    CH2_SAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_SAR1: u32,
    }),
    /// NA
    /// offset: 0x208
    CH2_DAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_DAR0: u32,
    }),
    /// NA
    /// offset: 0x20c
    CH2_DAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_DAR1: u32,
    }),
    /// NA
    /// offset: 0x210
    CH2_BLOCK_TS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_BLOCK_TS: u22,
        padding: u10 = 0,
    }),
    /// offset: 0x214
    reserved532: [4]u8,
    /// NA
    /// offset: 0x218
    CH2_CTL0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_SMS: u1,
        reserved2: u1 = 0,
        /// NA
        CH2_DMS: u1,
        reserved4: u1 = 0,
        /// NA
        CH2_SINC: u1,
        reserved6: u1 = 0,
        /// NA
        CH2_DINC: u1,
        reserved8: u1 = 0,
        /// NA
        CH2_SRC_TR_WIDTH: u3,
        /// NA
        CH2_DST_TR_WIDTH: u3,
        /// NA
        CH2_SRC_MSIZE: u4,
        /// NA
        CH2_DST_MSIZE: u4,
        /// NA
        CH2_AR_CACHE: u4,
        /// NA
        CH2_AW_CACHE: u4,
        /// NA
        CH2_NONPOSTED_LASTWRITE_EN: u1,
        padding: u1 = 0,
    }),
    /// NA
    /// offset: 0x21c
    CH2_CTL1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_AR_PROT: u3,
        /// NA
        CH2_AW_PROT: u3,
        /// NA
        CH2_ARLEN_EN: u1,
        /// NA
        CH2_ARLEN: u8,
        /// NA
        CH2_AWLEN_EN: u1,
        /// NA
        CH2_AWLEN: u8,
        /// NA
        CH2_SRC_STAT_EN: u1,
        /// NA
        CH2_DST_STAT_EN: u1,
        /// NA
        CH2_IOC_BLKTFR: u1,
        reserved30: u3 = 0,
        /// NA
        CH2_SHADOWREG_OR_LLI_LAST: u1,
        /// NA
        CH2_SHADOWREG_OR_LLI_VALID: u1,
    }),
    /// NA
    /// offset: 0x220
    CH2_CFG0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_SRC_MULTBLK_TYPE: u2,
        /// NA
        CH2_DST_MULTBLK_TYPE: u2,
        reserved18: u14 = 0,
        /// NA
        CH2_RD_UID: u4,
        reserved25: u3 = 0,
        /// NA
        CH2_WR_UID: u4,
        padding: u3 = 0,
    }),
    /// NA
    /// offset: 0x224
    CH2_CFG1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_TT_FC: u3,
        /// NA
        CH2_HS_SEL_SRC: u1,
        /// NA
        CH2_HS_SEL_DST: u1,
        /// NA
        CH2_SRC_HWHS_POL: u1,
        /// NA
        CH2_DST_HWHS_POL: u1,
        /// NA
        CH2_SRC_PER: u2,
        reserved12: u3 = 0,
        /// NA
        CH2_DST_PER: u2,
        reserved17: u3 = 0,
        /// NA
        CH2_CH_PRIOR: u3,
        /// NA
        CH2_LOCK_CH: u1,
        /// NA
        CH2_LOCK_CH_L: u2,
        /// NA
        CH2_SRC_OSR_LMT: u4,
        /// NA
        CH2_DST_OSR_LMT: u4,
        padding: u1 = 0,
    }),
    /// NA
    /// offset: 0x228
    CH2_LLP0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_LMS: u1,
        reserved6: u5 = 0,
        /// NA
        CH2_LOC0: u26,
    }),
    /// NA
    /// offset: 0x22c
    CH2_LLP1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_LOC1: u32,
    }),
    /// NA
    /// offset: 0x230
    CH2_STATUS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_CMPLTD_BLK_TFR_SIZE: u22,
        padding: u10 = 0,
    }),
    /// NA
    /// offset: 0x234
    CH2_STATUS1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_DATA_LEFT_IN_FIFO: u15,
        padding: u17 = 0,
    }),
    /// NA
    /// offset: 0x238
    CH2_SWHSSRC0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_SWHS_REQ_SRC: u1,
        /// NA
        CH2_SWHS_REQ_SRC_WE: u1,
        /// NA
        CH2_SWHS_SGLREQ_SRC: u1,
        /// NA
        CH2_SWHS_SGLREQ_SRC_WE: u1,
        /// NA
        CH2_SWHS_LST_SRC: u1,
        /// NA
        CH2_SWHS_LST_SRC_WE: u1,
        padding: u26 = 0,
    }),
    /// offset: 0x23c
    reserved572: [4]u8,
    /// NA
    /// offset: 0x240
    CH2_SWHSDST0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_SWHS_REQ_DST: u1,
        /// NA
        CH2_SWHS_REQ_DST_WE: u1,
        /// NA
        CH2_SWHS_SGLREQ_DST: u1,
        /// NA
        CH2_SWHS_SGLREQ_DST_WE: u1,
        /// NA
        CH2_SWHS_LST_DST: u1,
        /// NA
        CH2_SWHS_LST_DST_WE: u1,
        padding: u26 = 0,
    }),
    /// offset: 0x244
    reserved580: [4]u8,
    /// NA
    /// offset: 0x248
    CH2_BLK_TFR_RESUMEREQ0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_BLK_TFR_RESUMEREQ: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x24c
    reserved588: [4]u8,
    /// NA
    /// offset: 0x250
    CH2_AXI_ID0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_AXI_READ_ID_SUFFIX: u1,
        reserved16: u15 = 0,
        /// NA
        CH2_AXI_WRITE_ID_SUFFIX: u1,
        padding: u15 = 0,
    }),
    /// offset: 0x254
    reserved596: [4]u8,
    /// NA
    /// offset: 0x258
    CH2_AXI_QOS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_AXI_AWQOS: u4,
        /// NA
        CH2_AXI_ARQOS: u4,
        padding: u24 = 0,
    }),
    /// offset: 0x25c
    reserved604: [4]u8,
    /// NA
    /// offset: 0x260
    CH2_SSTAT0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_SSTAT: u32,
    }),
    /// offset: 0x264
    reserved612: [4]u8,
    /// NA
    /// offset: 0x268
    CH2_DSTAT0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_DSTAT: u32,
    }),
    /// offset: 0x26c
    reserved620: [4]u8,
    /// NA
    /// offset: 0x270
    CH2_SSTATAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_SSTATAR0: u32,
    }),
    /// NA
    /// offset: 0x274
    CH2_SSTATAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_SSTATAR1: u32,
    }),
    /// NA
    /// offset: 0x278
    CH2_DSTATAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_DSTATAR0: u32,
    }),
    /// NA
    /// offset: 0x27c
    CH2_DSTATAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_DSTATAR1: u32,
    }),
    /// NA
    /// offset: 0x280
    CH2_INTSTATUS_ENABLE0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_ENABLE_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH2_ENABLE_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH2_ENABLE_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH2_ENABLE_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH2_ENABLE_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH2_ENABLE_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH2_ENABLE_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH2_ENABLE_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH2_ENABLE_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH2_ENABLE_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH2_ENABLE_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH2_ENABLE_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x284
    CH2_INTSTATUS_ENABLE1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_ENABLE_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH2_ENABLE_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x288
    CH2_INTSTATUS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH2_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH2_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH2_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH2_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH2_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH2_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH2_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH2_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH2_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH2_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH2_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH2_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH2_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH2_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH2_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH2_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x28c
    CH2_INTSTATUS1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH2_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH2_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH2_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x290
    CH2_INTSIGNAL_ENABLE0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_ENABLE_BLOCK_TFR_DONE_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_DMA_TFR_DONE_INTSIGNAL: u1,
        reserved3: u1 = 0,
        /// NA
        CH2_ENABLE_SRC_TRANSCOMP_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_DST_TRANSCOMP_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_SRC_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_DST_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_SRC_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_DST_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_LLI_RD_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_LLI_WR_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_LLI_RD_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_LLI_WR_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_SHADOWREG_OR_LLI_INVALID_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_SLVIF_MULTIBLKTYPE_ERR_INTSIGNAL: u1,
        reserved16: u1 = 0,
        /// NA
        CH2_ENABLE_SLVIF_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_SLVIF_WR2RO_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_SLVIF_RD2RWO_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_SLVIF_WRONCHEN_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_SLVIF_WRONHOLD_ERR_INTSIGNAL: u1,
        reserved25: u3 = 0,
        /// NA
        CH2_ENABLE_SLVIF_WRPARITY_ERR_INTSIGNAL: u1,
        reserved27: u1 = 0,
        /// NA
        CH2_ENABLE_CH_LOCK_CLEARED_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_CH_SRC_SUSPENDED_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_CH_SUSPENDED_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_CH_DISABLED_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_CH_ABORTED_INTSIGNAL: u1,
    }),
    /// NA
    /// offset: 0x294
    CH2_INTSIGNAL_ENABLE1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_ENABLE_ECC_PROT_CHMEM_CORRERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_ECC_PROT_CHMEM_UNCORRERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_ECC_PROT_UIDMEM_CORRERR_INTSIGNAL: u1,
        /// NA
        CH2_ENABLE_ECC_PROT_UIDMEM_UNCORRERR_INTSIGNAL: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x298
    CH2_INTCLEAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_CLEAR_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH2_CLEAR_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH2_CLEAR_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH2_CLEAR_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH2_CLEAR_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH2_CLEAR_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH2_CLEAR_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH2_CLEAR_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH2_CLEAR_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH2_CLEAR_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH2_CLEAR_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH2_CLEAR_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x29c
    CH2_INTCLEAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH2_CLEAR_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH2_CLEAR_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// offset: 0x2a0
    reserved672: [96]u8,
    /// NA
    /// offset: 0x300
    CH3_SAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_SAR0: u32,
    }),
    /// NA
    /// offset: 0x304
    CH3_SAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_SAR1: u32,
    }),
    /// NA
    /// offset: 0x308
    CH3_DAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_DAR0: u32,
    }),
    /// NA
    /// offset: 0x30c
    CH3_DAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_DAR1: u32,
    }),
    /// NA
    /// offset: 0x310
    CH3_BLOCK_TS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_BLOCK_TS: u22,
        padding: u10 = 0,
    }),
    /// offset: 0x314
    reserved788: [4]u8,
    /// NA
    /// offset: 0x318
    CH3_CTL0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_SMS: u1,
        reserved2: u1 = 0,
        /// NA
        CH3_DMS: u1,
        reserved4: u1 = 0,
        /// NA
        CH3_SINC: u1,
        reserved6: u1 = 0,
        /// NA
        CH3_DINC: u1,
        reserved8: u1 = 0,
        /// NA
        CH3_SRC_TR_WIDTH: u3,
        /// NA
        CH3_DST_TR_WIDTH: u3,
        /// NA
        CH3_SRC_MSIZE: u4,
        /// NA
        CH3_DST_MSIZE: u4,
        /// NA
        CH3_AR_CACHE: u4,
        /// NA
        CH3_AW_CACHE: u4,
        /// NA
        CH3_NONPOSTED_LASTWRITE_EN: u1,
        padding: u1 = 0,
    }),
    /// NA
    /// offset: 0x31c
    CH3_CTL1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_AR_PROT: u3,
        /// NA
        CH3_AW_PROT: u3,
        /// NA
        CH3_ARLEN_EN: u1,
        /// NA
        CH3_ARLEN: u8,
        /// NA
        CH3_AWLEN_EN: u1,
        /// NA
        CH3_AWLEN: u8,
        /// NA
        CH3_SRC_STAT_EN: u1,
        /// NA
        CH3_DST_STAT_EN: u1,
        /// NA
        CH3_IOC_BLKTFR: u1,
        reserved30: u3 = 0,
        /// NA
        CH3_SHADOWREG_OR_LLI_LAST: u1,
        /// NA
        CH3_SHADOWREG_OR_LLI_VALID: u1,
    }),
    /// NA
    /// offset: 0x320
    CH3_CFG0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_SRC_MULTBLK_TYPE: u2,
        /// NA
        CH3_DST_MULTBLK_TYPE: u2,
        reserved18: u14 = 0,
        /// NA
        CH3_RD_UID: u4,
        reserved25: u3 = 0,
        /// NA
        CH3_WR_UID: u4,
        padding: u3 = 0,
    }),
    /// NA
    /// offset: 0x324
    CH3_CFG1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_TT_FC: u3,
        /// NA
        CH3_HS_SEL_SRC: u1,
        /// NA
        CH3_HS_SEL_DST: u1,
        /// NA
        CH3_SRC_HWHS_POL: u1,
        /// NA
        CH3_DST_HWHS_POL: u1,
        /// NA
        CH3_SRC_PER: u2,
        reserved12: u3 = 0,
        /// NA
        CH3_DST_PER: u2,
        reserved17: u3 = 0,
        /// NA
        CH3_CH_PRIOR: u3,
        /// NA
        CH3_LOCK_CH: u1,
        /// NA
        CH3_LOCK_CH_L: u2,
        /// NA
        CH3_SRC_OSR_LMT: u4,
        /// NA
        CH3_DST_OSR_LMT: u4,
        padding: u1 = 0,
    }),
    /// NA
    /// offset: 0x328
    CH3_LLP0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_LMS: u1,
        reserved6: u5 = 0,
        /// NA
        CH3_LOC0: u26,
    }),
    /// NA
    /// offset: 0x32c
    CH3_LLP1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_LOC1: u32,
    }),
    /// NA
    /// offset: 0x330
    CH3_STATUS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_CMPLTD_BLK_TFR_SIZE: u22,
        padding: u10 = 0,
    }),
    /// NA
    /// offset: 0x334
    CH3_STATUS1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_DATA_LEFT_IN_FIFO: u15,
        padding: u17 = 0,
    }),
    /// NA
    /// offset: 0x338
    CH3_SWHSSRC0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_SWHS_REQ_SRC: u1,
        /// NA
        CH3_SWHS_REQ_SRC_WE: u1,
        /// NA
        CH3_SWHS_SGLREQ_SRC: u1,
        /// NA
        CH3_SWHS_SGLREQ_SRC_WE: u1,
        /// NA
        CH3_SWHS_LST_SRC: u1,
        /// NA
        CH3_SWHS_LST_SRC_WE: u1,
        padding: u26 = 0,
    }),
    /// offset: 0x33c
    reserved828: [4]u8,
    /// NA
    /// offset: 0x340
    CH3_SWHSDST0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_SWHS_REQ_DST: u1,
        /// NA
        CH3_SWHS_REQ_DST_WE: u1,
        /// NA
        CH3_SWHS_SGLREQ_DST: u1,
        /// NA
        CH3_SWHS_SGLREQ_DST_WE: u1,
        /// NA
        CH3_SWHS_LST_DST: u1,
        /// NA
        CH3_SWHS_LST_DST_WE: u1,
        padding: u26 = 0,
    }),
    /// offset: 0x344
    reserved836: [4]u8,
    /// NA
    /// offset: 0x348
    CH3_BLK_TFR_RESUMEREQ0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_BLK_TFR_RESUMEREQ: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x34c
    reserved844: [4]u8,
    /// NA
    /// offset: 0x350
    CH3_AXI_ID0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_AXI_READ_ID_SUFFIX: u1,
        reserved16: u15 = 0,
        /// NA
        CH3_AXI_WRITE_ID_SUFFIX: u1,
        padding: u15 = 0,
    }),
    /// offset: 0x354
    reserved852: [4]u8,
    /// NA
    /// offset: 0x358
    CH3_AXI_QOS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_AXI_AWQOS: u4,
        /// NA
        CH3_AXI_ARQOS: u4,
        padding: u24 = 0,
    }),
    /// offset: 0x35c
    reserved860: [4]u8,
    /// NA
    /// offset: 0x360
    CH3_SSTAT0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_SSTAT: u32,
    }),
    /// offset: 0x364
    reserved868: [4]u8,
    /// NA
    /// offset: 0x368
    CH3_DSTAT0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_DSTAT: u32,
    }),
    /// offset: 0x36c
    reserved876: [4]u8,
    /// NA
    /// offset: 0x370
    CH3_SSTATAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_SSTATAR0: u32,
    }),
    /// NA
    /// offset: 0x374
    CH3_SSTATAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_SSTATAR1: u32,
    }),
    /// NA
    /// offset: 0x378
    CH3_DSTATAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_DSTATAR0: u32,
    }),
    /// NA
    /// offset: 0x37c
    CH3_DSTATAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_DSTATAR1: u32,
    }),
    /// NA
    /// offset: 0x380
    CH3_INTSTATUS_ENABLE0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_ENABLE_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH3_ENABLE_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH3_ENABLE_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH3_ENABLE_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH3_ENABLE_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH3_ENABLE_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH3_ENABLE_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH3_ENABLE_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH3_ENABLE_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH3_ENABLE_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH3_ENABLE_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH3_ENABLE_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x384
    CH3_INTSTATUS_ENABLE1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_ENABLE_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH3_ENABLE_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x388
    CH3_INTSTATUS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH3_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH3_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH3_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH3_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH3_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH3_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH3_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH3_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH3_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH3_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH3_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH3_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH3_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH3_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH3_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH3_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x38c
    CH3_INTSTATUS1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH3_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH3_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH3_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x390
    CH3_INTSIGNAL_ENABLE0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_ENABLE_BLOCK_TFR_DONE_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_DMA_TFR_DONE_INTSIGNAL: u1,
        reserved3: u1 = 0,
        /// NA
        CH3_ENABLE_SRC_TRANSCOMP_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_DST_TRANSCOMP_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_SRC_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_DST_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_SRC_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_DST_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_LLI_RD_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_LLI_WR_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_LLI_RD_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_LLI_WR_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_SHADOWREG_OR_LLI_INVALID_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_SLVIF_MULTIBLKTYPE_ERR_INTSIGNAL: u1,
        reserved16: u1 = 0,
        /// NA
        CH3_ENABLE_SLVIF_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_SLVIF_WR2RO_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_SLVIF_RD2RWO_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_SLVIF_WRONCHEN_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_SLVIF_WRONHOLD_ERR_INTSIGNAL: u1,
        reserved25: u3 = 0,
        /// NA
        CH3_ENABLE_SLVIF_WRPARITY_ERR_INTSIGNAL: u1,
        reserved27: u1 = 0,
        /// NA
        CH3_ENABLE_CH_LOCK_CLEARED_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_CH_SRC_SUSPENDED_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_CH_SUSPENDED_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_CH_DISABLED_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_CH_ABORTED_INTSIGNAL: u1,
    }),
    /// NA
    /// offset: 0x394
    CH3_INTSIGNAL_ENABLE1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_ENABLE_ECC_PROT_CHMEM_CORRERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_ECC_PROT_CHMEM_UNCORRERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_ECC_PROT_UIDMEM_CORRERR_INTSIGNAL: u1,
        /// NA
        CH3_ENABLE_ECC_PROT_UIDMEM_UNCORRERR_INTSIGNAL: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x398
    CH3_INTCLEAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_CLEAR_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH3_CLEAR_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH3_CLEAR_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH3_CLEAR_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH3_CLEAR_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH3_CLEAR_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH3_CLEAR_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH3_CLEAR_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH3_CLEAR_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH3_CLEAR_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH3_CLEAR_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH3_CLEAR_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x39c
    CH3_INTCLEAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH3_CLEAR_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH3_CLEAR_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// offset: 0x3a0
    reserved928: [96]u8,
    /// NA
    /// offset: 0x400
    CH4_SAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_SAR0: u32,
    }),
    /// NA
    /// offset: 0x404
    CH4_SAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_SAR1: u32,
    }),
    /// NA
    /// offset: 0x408
    CH4_DAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_DAR0: u32,
    }),
    /// NA
    /// offset: 0x40c
    CH4_DAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_DAR1: u32,
    }),
    /// NA
    /// offset: 0x410
    CH4_BLOCK_TS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_BLOCK_TS: u22,
        padding: u10 = 0,
    }),
    /// offset: 0x414
    reserved1044: [4]u8,
    /// NA
    /// offset: 0x418
    CH4_CTL0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_SMS: u1,
        reserved2: u1 = 0,
        /// NA
        CH4_DMS: u1,
        reserved4: u1 = 0,
        /// NA
        CH4_SINC: u1,
        reserved6: u1 = 0,
        /// NA
        CH4_DINC: u1,
        reserved8: u1 = 0,
        /// NA
        CH4_SRC_TR_WIDTH: u3,
        /// NA
        CH4_DST_TR_WIDTH: u3,
        /// NA
        CH4_SRC_MSIZE: u4,
        /// NA
        CH4_DST_MSIZE: u4,
        /// NA
        CH4_AR_CACHE: u4,
        /// NA
        CH4_AW_CACHE: u4,
        /// NA
        CH4_NONPOSTED_LASTWRITE_EN: u1,
        padding: u1 = 0,
    }),
    /// NA
    /// offset: 0x41c
    CH4_CTL1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_AR_PROT: u3,
        /// NA
        CH4_AW_PROT: u3,
        /// NA
        CH4_ARLEN_EN: u1,
        /// NA
        CH4_ARLEN: u8,
        /// NA
        CH4_AWLEN_EN: u1,
        /// NA
        CH4_AWLEN: u8,
        /// NA
        CH4_SRC_STAT_EN: u1,
        /// NA
        CH4_DST_STAT_EN: u1,
        /// NA
        CH4_IOC_BLKTFR: u1,
        reserved30: u3 = 0,
        /// NA
        CH4_SHADOWREG_OR_LLI_LAST: u1,
        /// NA
        CH4_SHADOWREG_OR_LLI_VALID: u1,
    }),
    /// NA
    /// offset: 0x420
    CH4_CFG0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_SRC_MULTBLK_TYPE: u2,
        /// NA
        CH4_DST_MULTBLK_TYPE: u2,
        reserved18: u14 = 0,
        /// NA
        CH4_RD_UID: u4,
        reserved25: u3 = 0,
        /// NA
        CH4_WR_UID: u4,
        padding: u3 = 0,
    }),
    /// NA
    /// offset: 0x424
    CH4_CFG1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_TT_FC: u3,
        /// NA
        CH4_HS_SEL_SRC: u1,
        /// NA
        CH4_HS_SEL_DST: u1,
        /// NA
        CH4_SRC_HWHS_POL: u1,
        /// NA
        CH4_DST_HWHS_POL: u1,
        /// NA
        CH4_SRC_PER: u2,
        reserved12: u3 = 0,
        /// NA
        CH4_DST_PER: u2,
        reserved17: u3 = 0,
        /// NA
        CH4_CH_PRIOR: u3,
        /// NA
        CH4_LOCK_CH: u1,
        /// NA
        CH4_LOCK_CH_L: u2,
        /// NA
        CH4_SRC_OSR_LMT: u4,
        /// NA
        CH4_DST_OSR_LMT: u4,
        padding: u1 = 0,
    }),
    /// NA
    /// offset: 0x428
    CH4_LLP0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_LMS: u1,
        reserved6: u5 = 0,
        /// NA
        CH4_LOC0: u26,
    }),
    /// NA
    /// offset: 0x42c
    CH4_LLP1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_LOC1: u32,
    }),
    /// NA
    /// offset: 0x430
    CH4_STATUS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_CMPLTD_BLK_TFR_SIZE: u22,
        padding: u10 = 0,
    }),
    /// NA
    /// offset: 0x434
    CH4_STATUS1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_DATA_LEFT_IN_FIFO: u15,
        padding: u17 = 0,
    }),
    /// NA
    /// offset: 0x438
    CH4_SWHSSRC0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_SWHS_REQ_SRC: u1,
        /// NA
        CH4_SWHS_REQ_SRC_WE: u1,
        /// NA
        CH4_SWHS_SGLREQ_SRC: u1,
        /// NA
        CH4_SWHS_SGLREQ_SRC_WE: u1,
        /// NA
        CH4_SWHS_LST_SRC: u1,
        /// NA
        CH4_SWHS_LST_SRC_WE: u1,
        padding: u26 = 0,
    }),
    /// offset: 0x43c
    reserved1084: [4]u8,
    /// NA
    /// offset: 0x440
    CH4_SWHSDST0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_SWHS_REQ_DST: u1,
        /// NA
        CH4_SWHS_REQ_DST_WE: u1,
        /// NA
        CH4_SWHS_SGLREQ_DST: u1,
        /// NA
        CH4_SWHS_SGLREQ_DST_WE: u1,
        /// NA
        CH4_SWHS_LST_DST: u1,
        /// NA
        CH4_SWHS_LST_DST_WE: u1,
        padding: u26 = 0,
    }),
    /// offset: 0x444
    reserved1092: [4]u8,
    /// NA
    /// offset: 0x448
    CH4_BLK_TFR_RESUMEREQ0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_BLK_TFR_RESUMEREQ: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x44c
    reserved1100: [4]u8,
    /// NA
    /// offset: 0x450
    CH4_AXI_ID0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_AXI_READ_ID_SUFFIX: u1,
        reserved16: u15 = 0,
        /// NA
        CH4_AXI_WRITE_ID_SUFFIX: u1,
        padding: u15 = 0,
    }),
    /// offset: 0x454
    reserved1108: [4]u8,
    /// NA
    /// offset: 0x458
    CH4_AXI_QOS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_AXI_AWQOS: u4,
        /// NA
        CH4_AXI_ARQOS: u4,
        padding: u24 = 0,
    }),
    /// offset: 0x45c
    reserved1116: [4]u8,
    /// NA
    /// offset: 0x460
    CH4_SSTAT0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_SSTAT: u32,
    }),
    /// offset: 0x464
    reserved1124: [4]u8,
    /// NA
    /// offset: 0x468
    CH4_DSTAT0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_DSTAT: u32,
    }),
    /// offset: 0x46c
    reserved1132: [4]u8,
    /// NA
    /// offset: 0x470
    CH4_SSTATAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_SSTATAR0: u32,
    }),
    /// NA
    /// offset: 0x474
    CH4_SSTATAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_SSTATAR1: u32,
    }),
    /// NA
    /// offset: 0x478
    CH4_DSTATAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_DSTATAR0: u32,
    }),
    /// NA
    /// offset: 0x47c
    CH4_DSTATAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_DSTATAR1: u32,
    }),
    /// NA
    /// offset: 0x480
    CH4_INTSTATUS_ENABLE0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_ENABLE_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH4_ENABLE_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH4_ENABLE_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH4_ENABLE_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH4_ENABLE_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH4_ENABLE_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH4_ENABLE_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH4_ENABLE_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH4_ENABLE_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH4_ENABLE_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH4_ENABLE_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH4_ENABLE_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x484
    CH4_INTSTATUS_ENABLE1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_ENABLE_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH4_ENABLE_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x488
    CH4_INTSTATUS0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH4_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH4_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH4_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH4_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH4_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH4_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH4_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH4_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH4_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH4_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH4_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH4_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH4_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH4_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH4_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH4_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x48c
    CH4_INTSTATUS1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH4_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH4_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH4_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x490
    CH4_INTSIGNAL_ENABLE0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_ENABLE_BLOCK_TFR_DONE_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_DMA_TFR_DONE_INTSIGNAL: u1,
        reserved3: u1 = 0,
        /// NA
        CH4_ENABLE_SRC_TRANSCOMP_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_DST_TRANSCOMP_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_SRC_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_DST_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_SRC_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_DST_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_LLI_RD_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_LLI_WR_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_LLI_RD_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_LLI_WR_SLV_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_SHADOWREG_OR_LLI_INVALID_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_SLVIF_MULTIBLKTYPE_ERR_INTSIGNAL: u1,
        reserved16: u1 = 0,
        /// NA
        CH4_ENABLE_SLVIF_DEC_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_SLVIF_WR2RO_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_SLVIF_RD2RWO_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_SLVIF_WRONCHEN_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_SLVIF_WRONHOLD_ERR_INTSIGNAL: u1,
        reserved25: u3 = 0,
        /// NA
        CH4_ENABLE_SLVIF_WRPARITY_ERR_INTSIGNAL: u1,
        reserved27: u1 = 0,
        /// NA
        CH4_ENABLE_CH_LOCK_CLEARED_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_CH_SRC_SUSPENDED_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_CH_SUSPENDED_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_CH_DISABLED_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_CH_ABORTED_INTSIGNAL: u1,
    }),
    /// NA
    /// offset: 0x494
    CH4_INTSIGNAL_ENABLE1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_ENABLE_ECC_PROT_CHMEM_CORRERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_ECC_PROT_CHMEM_UNCORRERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_ECC_PROT_UIDMEM_CORRERR_INTSIGNAL: u1,
        /// NA
        CH4_ENABLE_ECC_PROT_UIDMEM_UNCORRERR_INTSIGNAL: u1,
        padding: u28 = 0,
    }),
    /// NA
    /// offset: 0x498
    CH4_INTCLEAR0: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_CLEAR_BLOCK_TFR_DONE_INTSTAT: u1,
        /// NA
        CH4_CLEAR_DMA_TFR_DONE_INTSTAT: u1,
        reserved3: u1 = 0,
        /// NA
        CH4_CLEAR_SRC_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH4_CLEAR_DST_TRANSCOMP_INTSTAT: u1,
        /// NA
        CH4_CLEAR_SRC_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_DST_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_SRC_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_DST_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_LLI_RD_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_LLI_WR_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_LLI_RD_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_LLI_WR_SLV_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_SHADOWREG_OR_LLI_INVALID_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_SLVIF_MULTIBLKTYPE_ERR_INTSTAT: u1,
        reserved16: u1 = 0,
        /// NA
        CH4_CLEAR_SLVIF_DEC_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_SLVIF_WR2RO_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_SLVIF_RD2RWO_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_SLVIF_WRONCHEN_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_SLVIF_SHADOWREG_WRON_VALID_ERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_SLVIF_WRONHOLD_ERR_INTSTAT: u1,
        reserved25: u3 = 0,
        /// NA
        CH4_CLEAR_SLVIF_WRPARITY_ERR_INTSTAT: u1,
        reserved27: u1 = 0,
        /// NA
        CH4_CLEAR_CH_LOCK_CLEARED_INTSTAT: u1,
        /// NA
        CH4_CLEAR_CH_SRC_SUSPENDED_INTSTAT: u1,
        /// NA
        CH4_CLEAR_CH_SUSPENDED_INTSTAT: u1,
        /// NA
        CH4_CLEAR_CH_DISABLED_INTSTAT: u1,
        /// NA
        CH4_CLEAR_CH_ABORTED_INTSTAT: u1,
    }),
    /// NA
    /// offset: 0x49c
    CH4_INTCLEAR1: mmio.Mmio(packed struct(u32) {
        /// NA
        CH4_CLEAR_ECC_PROT_CHMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_ECC_PROT_CHMEM_UNCORRERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_ECC_PROT_UIDMEM_CORRERR_INTSTAT: u1,
        /// NA
        CH4_CLEAR_ECC_PROT_UIDMEM_UNCORRERR_INTSTAT: u1,
        padding: u28 = 0,
    }),
};
