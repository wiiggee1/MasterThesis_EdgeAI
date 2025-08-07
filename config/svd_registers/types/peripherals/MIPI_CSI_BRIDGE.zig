const mmio = @import("mmio");
const types = @import("../../types.zig");

/// MIPI Camera Interface Bridge
pub const MIPI_CSI_BRIDGE = extern struct {
    /// csi bridge register mapping unit clock gating.
    /// offset: 0x00
    CLK_EN: mmio.Mmio(packed struct(u32) {
        /// 0: enable clock gating. 1: disable clock gating, clock always on.
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// csi bridge enable.
    /// offset: 0x04
    CSI_EN: mmio.Mmio(packed struct(u32) {
        /// 0: disable csi bridge. 1: enable csi bridge.
        CSI_BRIG_EN: u1,
        padding: u31 = 0,
    }),
    /// dma request configuration.
    /// offset: 0x08
    DMA_REQ_CFG: mmio.Mmio(packed struct(u32) {
        /// DMA burst length.
        DMA_BURST_LEN: u12,
        /// 1: reg_dma_burst_len & reg_dma_burst_len will be updated by dma block finish. 0: updated by frame.
        DMA_CFG_UPD_BY_BLK: u1,
        reserved16: u3 = 0,
        /// 1: mask dma request when reading frame info. 0: disable mask.
        DMA_FORCE_RD_STATUS: u1,
        padding: u15 = 0,
    }),
    /// csi bridge buffer control.
    /// offset: 0x0c
    BUF_FLOW_CTL: mmio.Mmio(packed struct(u32) {
        /// buffer almost full threshold.
        CSI_BUF_AFULL_THRD: u14,
        reserved16: u2 = 0,
        /// buffer data count.
        CSI_BUF_DEPTH: u14,
        padding: u2 = 0,
    }),
    /// pixel data type configuration.
    /// offset: 0x10
    DATA_TYPE_CFG: mmio.Mmio(packed struct(u32) {
        /// the min value of data type used for pixel filter.
        DATA_TYPE_MIN: u6,
        reserved8: u2 = 0,
        /// the max value of data type used for pixel filter.
        DATA_TYPE_MAX: u6,
        padding: u18 = 0,
    }),
    /// frame configuration.
    /// offset: 0x14
    FRAME_CFG: mmio.Mmio(packed struct(u32) {
        /// vadr of frame data.
        VADR_NUM: u12,
        /// hadr of frame data.
        HADR_NUM: u12,
        /// 0: frame data doesn't contain hsync. 1: frame data contains hsync.
        HAS_HSYNC_E: u1,
        /// 0: disable vadr check. 1: enable vadr check.
        VADR_NUM_CHECK: u1,
        padding: u6 = 0,
    }),
    /// data endianness order configuration.
    /// offset: 0x18
    ENDIAN_MODE: mmio.Mmio(packed struct(u32) {
        /// endianness order in bytes. 2'h0 is normal mode and 2'h3 is useful to YUV420(Legacy) when isp is bapassed.
        BYTE_ENDIAN_ORDER: u1,
        /// N/A
        BIT_ENDIAN_ORDER: u1,
        padding: u30 = 0,
    }),
    /// csi bridge interrupt raw.
    /// offset: 0x1c
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// reg_vadr_num is greater than real interrupt raw.
        VADR_NUM_GT_INT_RAW: u1,
        /// reg_vadr_num is less than real interrupt raw.
        VADR_NUM_LT_INT_RAW: u1,
        /// an incomplete frame of data was sent interrupt raw.
        DISCARD_INT_RAW: u1,
        /// buffer overrun interrupt raw.
        CSI_BUF_OVERRUN_INT_RAW: u1,
        /// buffer overflow interrupt raw.
        CSI_ASYNC_FIFO_OVF_INT_RAW: u1,
        /// dma configuration update complete interrupt raw.
        DMA_CFG_HAS_UPDATED_INT_RAW: u1,
        padding: u26 = 0,
    }),
    /// csi bridge interrupt clr.
    /// offset: 0x20
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// reg_vadr_num is greater than real interrupt clr.
        VADR_NUM_GT_REAL_INT_CLR: u1,
        /// reg_vadr_num is less than real interrupt clr.
        VADR_NUM_LT_REAL_INT_CLR: u1,
        /// an incomplete frame of data was sent interrupt clr.
        DISCARD_INT_CLR: u1,
        /// buffer overrun interrupt clr.
        CSI_BUF_OVERRUN_INT_CLR: u1,
        /// buffer overflow interrupt clr.
        CSI_ASYNC_FIFO_OVF_INT_CLR: u1,
        /// dma configuration update complete interrupt clr.
        DMA_CFG_HAS_UPDATED_INT_CLR: u1,
        padding: u26 = 0,
    }),
    /// csi bridge interrupt st.
    /// offset: 0x24
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// reg_vadr_num is greater than real interrupt st.
        VADR_NUM_GT_INT_ST: u1,
        /// reg_vadr_num is less than real interrupt st.
        VADR_NUM_LT_INT_ST: u1,
        /// an incomplete frame of data was sent interrupt st.
        DISCARD_INT_ST: u1,
        /// buffer overrun interrupt st.
        CSI_BUF_OVERRUN_INT_ST: u1,
        /// buffer overflow interrupt st.
        CSI_ASYNC_FIFO_OVF_INT_ST: u1,
        /// dma configuration update complete interrupt st.
        DMA_CFG_HAS_UPDATED_INT_ST: u1,
        padding: u26 = 0,
    }),
    /// csi bridge interrupt enable.
    /// offset: 0x28
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// reg_vadr_num is greater than real interrupt enable.
        VADR_NUM_GT_INT_ENA: u1,
        /// reg_vadr_num is less than real interrupt enable.
        VADR_NUM_LT_INT_ENA: u1,
        /// an incomplete frame of data was sent interrupt enable.
        DISCARD_INT_ENA: u1,
        /// buffer overrun interrupt enable.
        CSI_BUF_OVERRUN_INT_ENA: u1,
        /// buffer overflow interrupt enable.
        CSI_ASYNC_FIFO_OVF_INT_ENA: u1,
        /// dma configuration update complete interrupt enable.
        DMA_CFG_HAS_UPDATED_INT_ENA: u1,
        padding: u26 = 0,
    }),
    /// DMA interval configuration.
    /// offset: 0x2c
    DMA_REQ_INTERVAL: mmio.Mmio(packed struct(u32) {
        /// 16'b1: 1 cycle. 16'b11: 2 cycle. ... ... 16'hFFFF: 16 cycle.
        DMA_REQ_INTERVAL: u16,
        padding: u16 = 0,
    }),
    /// DMA block size configuration.
    /// offset: 0x30
    DMABLK_SIZE: mmio.Mmio(packed struct(u32) {
        /// the number of reg_dma_burst_len in a block
        DMABLK_SIZE: u13,
        padding: u19 = 0,
    }),
    /// N/A
    /// offset: 0x34
    RDN_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// N/A
        RDN_ECO_EN: u1,
        /// N/A
        RDN_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
    /// N/A
    /// offset: 0x38
    RDN_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// N/A
        RDN_ECO_LOW: u32,
    }),
    /// N/A
    /// offset: 0x3c
    RDN_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// N/A
        RDN_ECO_HIGH: u32,
    }),
    /// csi host control by csi bridge.
    /// offset: 0x40
    HOST_CTRL: mmio.Mmio(packed struct(u32) {
        /// enable clock lane module of csi phy.
        CSI_ENABLECLK: u1,
        /// enable cfg_clk of csi host module.
        CSI_CFG_CLK_EN: u1,
        /// for phy test by loopback dsi phy to csi phy.
        LOOPBK_TEST_EN: u1,
        padding: u29 = 0,
    }),
    /// csi bridge buffer control.
    /// offset: 0x44
    MEM_CTRL: mmio.Mmio(packed struct(u32) {
        /// csi bridge memory clock gating force on.
        CSI_BRIDGE_MEM_CLK_FORCE_ON: u1,
        /// N/A
        CSI_MEM_AUX_CTRL: u14,
        padding: u17 = 0,
    }),
};
