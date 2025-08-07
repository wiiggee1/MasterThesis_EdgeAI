const mmio = @import("mmio");
const types = @import("../../types.zig");

/// MIPI Camera Interface Bridge
pub const MIPI_DSI_BRIDGE = extern struct {
    /// dsi bridge clk control register
    /// offset: 0x00
    CLK_EN: mmio.Mmio(packed struct(u32) {
        /// this bit configures force_on of dsi_bridge register clock gate
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// dsi bridge en register
    /// offset: 0x04
    EN: mmio.Mmio(packed struct(u32) {
        /// this bit configures module enable of dsi_bridge. 0: disable, 1: enable
        DSI_EN: u1,
        padding: u31 = 0,
    }),
    /// dsi bridge dma burst len register
    /// offset: 0x08
    DMA_REQ_CFG: mmio.Mmio(packed struct(u32) {
        /// this field configures the num of 64-bit in one dma burst transfer, valid only when dsi_bridge as flow controller
        DMA_BURST_LEN: u12,
        padding: u20 = 0,
    }),
    /// dsi bridge raw number control register
    /// offset: 0x0c
    RAW_NUM_CFG: mmio.Mmio(packed struct(u32) {
        /// this field configures number of total pix bits/64
        RAW_NUM_TOTAL: u22,
        /// this field configures whether the total pix bits is a multiple of 64bits. 0: align to 64-bit, 1: unalign to 64-bit
        UNALIGN_64BIT_EN: u1,
        reserved31: u8 = 0,
        /// this bit configures enable of reload reg_raw_num_total to internal cnt. 0: disable, 1: enable. valid only when dsi_bridge as flow controller
        RAW_NUM_TOTAL_SET: u1,
    }),
    /// dsi bridge credit register
    /// offset: 0x10
    RAW_BUF_CREDIT_CTL: mmio.Mmio(packed struct(u32) {
        /// this field configures the threshold whether dsi_bridge fifo can receive one more 64-bit, valid only when dsi_bridge as flow controller
        CREDIT_THRD: u15,
        reserved16: u1 = 0,
        /// this field configures the threshold whether dsi_bridge fifo can receive one more dma burst, valid only when dsi_bridge as flow controller
        CREDIT_BURST_THRD: u15,
        /// this bit configures internal credit cnt clear, 0: non, 1: reset. valid only when dsi_bridge as flow controller
        CREDIT_RESET: u1,
    }),
    /// dsi bridge raw buffer depth register
    /// offset: 0x14
    FIFO_FLOW_STATUS: mmio.Mmio(packed struct(u32) {
        /// this field configures the depth of dsi_bridge fifo depth
        RAW_BUF_DEPTH: u14,
        padding: u18 = 0,
    }),
    /// dsi bridge dpi type control register
    /// offset: 0x18
    PIXEL_TYPE: mmio.Mmio(packed struct(u32) {
        /// this field configures the pixel type. 0: rgb888, 1:rgb666, 2:rgb565
        RAW_TYPE: u4,
        /// this field configures the pixel arrange type of dpi interface
        DPI_CONFIG: u2,
        /// input data type, 0: rgb, 1: yuv
        DATA_IN_TYPE: u1,
        padding: u25 = 0,
    }),
    /// dsi bridge dma block interval control register
    /// offset: 0x1c
    DMA_BLOCK_INTERVAL: mmio.Mmio(packed struct(u32) {
        /// this field configures the max block_slot_cnt
        DMA_BLOCK_SLOT: u10,
        /// this field configures the max block_interval_cnt, block_interval_cnt increased by 1 when block_slot_cnt if full
        DMA_BLOCK_INTERVAL: u18,
        /// this bit configures enable of auto reload reg_raw_num_total, 0: disable, 1: enable
        RAW_NUM_TOTAL_AUTO_RELOAD: u1,
        /// this bit configures enable of interval between dma block transfer, 0: disable, 1: enable
        EN: u1,
        padding: u2 = 0,
    }),
    /// dsi bridge dma req interval control register
    /// offset: 0x20
    DMA_REQ_INTERVAL: mmio.Mmio(packed struct(u32) {
        /// this field configures the interval between dma req events
        DMA_REQ_INTERVAL: u16,
        padding: u16 = 0,
    }),
    /// dsi bridge dpi signal control register
    /// offset: 0x24
    DPI_LCD_CTL: mmio.Mmio(packed struct(u32) {
        /// this bit configures dpishutdn signal in dpi interface
        DPISHUTDN: u1,
        /// this bit configures dpicolorm signal in dpi interface
        DPICOLORM: u1,
        /// this bit configures dpiupdatecfg signal in dpi interface
        DPIUPDATECFG: u1,
        padding: u29 = 0,
    }),
    /// dsi bridge dpi reserved data register
    /// offset: 0x28
    DPI_RSV_DPI_DATA: mmio.Mmio(packed struct(u32) {
        /// this field controls the pixel data sent to dsi_host when dsi_bridge fifo underflow
        DPI_RSV_DATA: u30,
        padding: u2 = 0,
    }),
    /// offset: 0x2c
    reserved44: [4]u8,
    /// dsi bridge dpi v config register 0
    /// offset: 0x30
    DPI_V_CFG0: mmio.Mmio(packed struct(u32) {
        /// this field configures the total length of one frame (by line) for dpi output, must meet: reg_vtotal > reg_vdisp+reg_vsync+reg_vbank
        VTOTAL: u12,
        reserved16: u4 = 0,
        /// this field configures the length of valid line (by line) for dpi output
        VDISP: u12,
        padding: u4 = 0,
    }),
    /// dsi bridge dpi v config register 1
    /// offset: 0x34
    DPI_V_CFG1: mmio.Mmio(packed struct(u32) {
        /// this field configures the length between vsync and valid line (by line) for dpi output
        VBANK: u12,
        reserved16: u4 = 0,
        /// this field configures the length of vsync (by line) for dpi output
        VSYNC: u12,
        padding: u4 = 0,
    }),
    /// dsi bridge dpi h config register 0
    /// offset: 0x38
    DPI_H_CFG0: mmio.Mmio(packed struct(u32) {
        /// this field configures the total length of one line (by pixel num) for dpi output, must meet: reg_htotal > reg_hdisp+reg_hsync+reg_hbank
        HTOTAL: u12,
        reserved16: u4 = 0,
        /// this field configures the length of valid pixel data (by pixel num) for dpi output
        HDISP: u12,
        padding: u4 = 0,
    }),
    /// dsi bridge dpi h config register 1
    /// offset: 0x3c
    DPI_H_CFG1: mmio.Mmio(packed struct(u32) {
        /// this field configures the length between hsync and pixel data valid (by pixel num) for dpi output
        HBANK: u12,
        reserved16: u4 = 0,
        /// this field configures the length of hsync (by pixel num) for dpi output
        HSYNC: u12,
        padding: u4 = 0,
    }),
    /// dsi_bridge dpi misc config register
    /// offset: 0x40
    DPI_MISC_CONFIG: mmio.Mmio(packed struct(u32) {
        /// this bit configures enable of dpi output, 0: disable, 1: enable
        DPI_EN: u1,
        reserved4: u3 = 0,
        /// this field configures the underrun interrupt musk, when underrun occurs and line cnt is less then this field
        FIFO_UNDERRUN_DISCARD_VCNT: u12,
        padding: u16 = 0,
    }),
    /// dsi_bridge dpi config update register
    /// offset: 0x44
    DPI_CONFIG_UPDATE: mmio.Mmio(packed struct(u32) {
        /// write 1 to this bit to update dpi config register MIPI_DSI_BRG_DPI_*
        DPI_CONFIG_UPDATE: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x48
    reserved72: [8]u8,
    /// dsi_bridge interrupt enable register
    /// offset: 0x50
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// write 1 to enables dpi_underrun_int_st field of MIPI_DSI_BRG_INT_ST_REG controlled by dpi_underrun interrupt signal
        UNDERRUN_INT_ENA: u1,
        padding: u31 = 0,
    }),
    /// dsi_bridge interrupt clear register
    /// offset: 0x54
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// write 1 to this bit to clear dpi_underrun_int_raw field of MIPI_DSI_BRG_INT_RAW_REG
        UNDERRUN_INT_CLR: u1,
        padding: u31 = 0,
    }),
    /// dsi_bridge raw interrupt register
    /// offset: 0x58
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// the raw interrupt status of dpi_underrun
        UNDERRUN_INT_RAW: u1,
        padding: u31 = 0,
    }),
    /// dsi_bridge masked interrupt register
    /// offset: 0x5c
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// the masked interrupt status of dpi_underrun
        UNDERRUN_INT_ST: u1,
        padding: u31 = 0,
    }),
    /// dsi_bridge host bist control register
    /// offset: 0x60
    HOST_BIST_CTL: mmio.Mmio(packed struct(u32) {
        /// bistok
        BISTOK: u1,
        /// biston
        BISTON: u1,
        padding: u30 = 0,
    }),
    /// dsi_bridge host trigger reverse control register
    /// offset: 0x64
    HOST_TRIGGER_REV: mmio.Mmio(packed struct(u32) {
        /// tx_trigger reverse. 0: disable, 1: enable
        TX_TRIGGER_REV_EN: u1,
        /// rx_trigger reverse. 0: disable, 1: enable
        RX_TRIGGER_REV_EN: u1,
        padding: u30 = 0,
    }),
    /// dsi_bridge block raw number control register
    /// offset: 0x68
    BLK_RAW_NUM_CFG: mmio.Mmio(packed struct(u32) {
        /// this field configures number of total block pix bits/64
        BLK_RAW_NUM_TOTAL: u22,
        reserved31: u9 = 0,
        /// write 1 to reload reg_blk_raw_num_total to internal cnt
        BLK_RAW_NUM_TOTAL_SET: u1,
    }),
    /// dsi_bridge dam frame interval control register
    /// offset: 0x6c
    DMA_FRAME_INTERVAL: mmio.Mmio(packed struct(u32) {
        /// this field configures the max frame_slot_cnt
        DMA_FRAME_SLOT: u10,
        /// this field configures the max frame_interval_cnt, frame_interval_cnt increased by 1 when frame_slot_cnt if full
        DMA_FRAME_INTERVAL: u18,
        /// this bit configures enable multi-blk transfer, 0: disable, 1: enable
        DMA_MULTIBLK_EN: u1,
        /// this bit configures enable interval between frame transfer, 0: disable, 1: enable
        EN: u1,
        padding: u2 = 0,
    }),
    /// dsi_bridge mem aux control register
    /// offset: 0x70
    MEM_AUX_CTRL: mmio.Mmio(packed struct(u32) {
        /// this field configures dsi_bridge fifo memory aux ctrl
        DSI_MEM_AUX_CTRL: u14,
        padding: u18 = 0,
    }),
    /// dsi_bridge rdn eco cs register
    /// offset: 0x74
    RDN_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// rdn_eco_en
        RDN_ECO_EN: u1,
        /// rdn_eco_result
        RDN_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
    /// dsi_bridge rdn eco all low register
    /// offset: 0x78
    RDN_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// rdn_eco_low
        RDN_ECO_LOW: u32,
    }),
    /// dsi_bridge rdn eco all high register
    /// offset: 0x7c
    RDN_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// rdn_eco_high
        RDN_ECO_HIGH: u32,
    }),
    /// dsi_bridge host control register
    /// offset: 0x80
    HOST_CTRL: mmio.Mmio(packed struct(u32) {
        /// this bit configures the clk enable refclk and cfg_clk of dsi_host. 0: disable, 1: enable
        DSI_CFG_REF_CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// dsi_bridge mem force on control register
    /// offset: 0x84
    MEM_CLK_CTRL: mmio.Mmio(packed struct(u32) {
        /// this bit configures the clock force on of dsi_bridge fifo memory. 0: disable, 1: force on
        DSI_BRIDGE_MEM_CLK_FORCE_ON: u1,
        /// this bit configures the clock force on of dpi fifo memory. 0: disable, 1: force on
        DSI_MEM_CLK_FORCE_ON: u1,
        padding: u30 = 0,
    }),
    /// dsi_bridge dma flow controller register
    /// offset: 0x88
    DMA_FLOW_CTRL: mmio.Mmio(packed struct(u32) {
        /// this bit configures the flow controller, 0: dmac as flow controller, 1:dsi_bridge as flow controller
        DSI_DMA_FLOW_CONTROLLER: u1,
        reserved4: u3 = 0,
        /// this field configures the num of blocks when multi-blk is enable and dmac as flow controller
        DMA_FLOW_MULTIBLK_NUM: u4,
        padding: u24 = 0,
    }),
    /// dsi_bridge buffer empty threshold register
    /// offset: 0x8c
    RAW_BUF_ALMOST_EMPTY_THRD: mmio.Mmio(packed struct(u32) {
        /// this field configures the fifo almost empty threshold, is valid only when dmac as flow controller
        DSI_RAW_BUF_ALMOST_EMPTY_THRD: u11,
        padding: u21 = 0,
    }),
    /// dsi_bridge yuv format config register
    /// offset: 0x90
    YUV_CFG: mmio.Mmio(packed struct(u32) {
        /// this bit configures yuv protoocl, 0: bt.601, 1: bt.709
        PROTOCAL: u1,
        /// this bit configures yuv pixel endian, 0: y0u0y1v1y2u2y3v3, 1: y3u3y2v2y1u1y0v0
        YUV_PIX_ENDIAN: u1,
        /// this field configures yuv422 store format, 0: yuyv, 1: yvyu, 2: uyvy, 3: vyuy
        YUV422_FORMAT: u2,
        padding: u28 = 0,
    }),
    /// dsi phy lp_loopback test ctrl
    /// offset: 0x94
    PHY_LP_LOOPBACK_CTRL: mmio.Mmio(packed struct(u32) {
        /// txdataesc_1 ctrl when enable dsi phy lp_loopback_test
        PHY_LP_TXDATAESC_1: u8,
        /// txrequestesc_1 ctrl when enable dsi phy lp_loopback_test
        PHY_LP_TXREQUESTESC_1: u1,
        /// txvalidesc_1 ctrl when enable dsi phy lp_loopback_test
        PHY_LP_TXVALIDESC_1: u1,
        /// txlpdtesc_1 ctrl when enable dsi phy lp_loopback_test
        PHY_LP_TXLPDTESC_1: u1,
        /// basedir_1 ctrl when enable dsi phy lp_loopback_test
        PHY_LP_BASEDIR_1: u1,
        reserved16: u4 = 0,
        /// txdataesc_0 ctrl when enable dsi phy lp_loopback_test
        PHY_LP_TXDATAESC_0: u8,
        /// txrequestesc_0 ctrl when enable dsi phy lp_loopback_test
        PHY_LP_TXREQUESTESC_0: u1,
        /// txvalidesc_0 ctrl when enable dsi phy lp_loopback_test
        PHY_LP_TXVALIDESC_0: u1,
        /// txlpdtesc_0 ctrl when enable dsi phy lp_loopback_test
        PHY_LP_TXLPDTESC_0: u1,
        /// basedir_0 ctrl when enable dsi phy lp_loopback_test
        PHY_LP_BASEDIR_0: u1,
        /// dsi phy lp_loopback test start check
        PHY_LP_LOOPBACK_CHECK: u1,
        /// dsi phy lp_loopback test check done
        PHY_LP_LOOPBACK_CHECK_DONE: u1,
        /// dsi phy lp_loopback ctrl en
        PHY_LP_LOOPBACK_EN: u1,
        /// result of dsi phy lp_loopback test
        PHY_LP_LOOPBACK_OK: u1,
    }),
    /// dsi phy hp_loopback test ctrl
    /// offset: 0x98
    PHY_HS_LOOPBACK_CTRL: mmio.Mmio(packed struct(u32) {
        /// txdatahs_1 ctrl when enable dsi phy hs_loopback_test
        PHY_HS_TXDATAHS_1: u8,
        /// txrequestdatahs_1 ctrl when enable dsi phy hs_loopback_test
        PHY_HS_TXREQUESTDATAHS_1: u1,
        /// basedir_1 ctrl when enable dsi phy hs_loopback_test
        PHY_HS_BASEDIR_1: u1,
        reserved16: u6 = 0,
        /// txdatahs_0 ctrl when enable dsi phy hs_loopback_test
        PHY_HS_TXDATAHS_0: u8,
        /// txrequestdatahs_0 ctrl when enable dsi phy hs_loopback_test
        PHY_HS_TXREQUESTDATAHS_0: u1,
        /// basedir_0 ctrl when enable dsi phy hs_loopback_test
        PHY_HS_BASEDIR_0: u1,
        reserved27: u1 = 0,
        /// txrequesthsclk when enable dsi phy hs_loopback_test
        PHY_HS_TXREQUESTHSCLK: u1,
        /// dsi phy hs_loopback test start check
        PHY_HS_LOOPBACK_CHECK: u1,
        /// dsi phy hs_loopback test check done
        PHY_HS_LOOPBACK_CHECK_DONE: u1,
        /// dsi phy hs_loopback ctrl en
        PHY_HS_LOOPBACK_EN: u1,
        /// result of dsi phy hs_loopback test
        PHY_HS_LOOPBACK_OK: u1,
    }),
    /// loopback test cnt
    /// offset: 0x9c
    PHY_LOOPBACK_CNT: mmio.Mmio(packed struct(u32) {
        /// hs_loopback test check cnt
        PHY_HS_CHECK_CNT_TH: u8,
        reserved16: u8 = 0,
        /// lp_loopback test check cnt
        PHY_LP_CHECK_CNT_TH: u8,
        padding: u8 = 0,
    }),
};
