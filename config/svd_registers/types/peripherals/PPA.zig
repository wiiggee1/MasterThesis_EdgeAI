const mmio = @import("mmio");
const types = @import("../../types.zig");

/// PPA Peripheral
pub const PPA = extern struct {
    /// CLUT sram data read/write register in background plane of blender
    /// offset: 0x00
    BLEND0_CLUT_DATA: mmio.Mmio(packed struct(u32) {
        /// Write and read data to/from CLUT RAM in background plane of blender engine through this field in fifo mode.
        RDWR_WORD_BLEND0_CLUT: u32,
    }),
    /// CLUT sram data read/write register in foreground plane of blender
    /// offset: 0x04
    BLEND1_CLUT_DATA: mmio.Mmio(packed struct(u32) {
        /// Write and read data to/from CLUT RAM in foreground plane of blender engine through this field in fifo mode.
        RDWR_WORD_BLEND1_CLUT: u32,
    }),
    /// offset: 0x08
    reserved8: [4]u8,
    /// CLUT configure register
    /// offset: 0x0c
    CLUT_CONF: mmio.Mmio(packed struct(u32) {
        /// 1'b0: fifo mode to wr/rd clut0/clut1 RAM through register PPA_SR_CLUT_DATA_REG/PPA_BLEND0_CLUT_DATA_REG/PPA_BLEND1_CLUT_DATA_REG. 1'b1: memory mode to wr/rd sr/blend0/blend1 clut RAM. The bit 11 and 10 of the waddr should be 01 to access sr clut and should be 10 to access blend0 clut and should be 11 to access blend 1 clut in memory mode.
        APB_FIFO_MASK: u1,
        /// Write 1 then write 0 to this bit to reset BLEND0 CLUT.
        BLEND0_CLUT_MEM_RST: u1,
        /// Write 1 then write 0 to this bit to reset BLEND1 CLUT.
        BLEND1_CLUT_MEM_RST: u1,
        /// Write 1 then write 0 to reset the read address of BLEND0 CLUT in fifo mode.
        BLEND0_CLUT_MEM_RDADDR_RST: u1,
        /// Write 1 then write 0 to reset the read address of BLEND1 CLUT in fifo mode.
        BLEND1_CLUT_MEM_RDADDR_RST: u1,
        /// 1: force power down BLEND CLUT memory.
        BLEND0_CLUT_MEM_FORCE_PD: u1,
        /// 1: force power up BLEND CLUT memory.
        BLEND0_CLUT_MEM_FORCE_PU: u1,
        /// 1: Force clock on for BLEND CLUT memory.
        BLEND0_CLUT_MEM_CLK_ENA: u1,
        padding: u24 = 0,
    }),
    /// Raw status interrupt
    /// offset: 0x10
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when scaling and rotating engine calculate one frame image.
        SR_EOF_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when blending engine calculate one frame image.
        BLEND_EOF_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the configured scaling and rotating coefficient is wrong. User can check the reasons through register PPA_SR_PARAM_ERR_ST_REG.
        SR_PARAM_CFG_ERR_INT_RAW: u1,
        padding: u29 = 0,
    }),
    /// Masked interrupt
    /// offset: 0x14
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the PPA_SR_EOF_INT interrupt.
        SR_EOF_INT_ST: u1,
        /// The raw interrupt status bit for the PPA_BLEND_EOF_INT interrupt.
        BLEND_EOF_INT_ST: u1,
        /// The raw interrupt status bit for the PPA_SR_RX_YSCAL_ERR_INT interrupt.
        SR_PARAM_CFG_ERR_INT_ST: u1,
        padding: u29 = 0,
    }),
    /// Interrupt enable bits
    /// offset: 0x18
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the PPA_SR_EOF_INT interrupt.
        SR_EOF_INT_ENA: u1,
        /// The interrupt enable bit for the PPA_BLEND_EOF_INT interrupt.
        BLEND_EOF_INT_ENA: u1,
        /// The interrupt enable bit for the PPA_SR_RX_YSCAL_ERR_INT interrupt.
        SR_PARAM_CFG_ERR_INT_ENA: u1,
        padding: u29 = 0,
    }),
    /// Interrupt clear bits
    /// offset: 0x1c
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the PPA_SR_EOF_INT interrupt.
        SR_EOF_INT_CLR: u1,
        /// Set this bit to clear the PPA_BLEND_EOF_INT interrupt.
        BLEND_EOF_INT_CLR: u1,
        /// Set this bit to clear the PPA_SR_RX_YSCAL_ERR_INT interrupt.
        SR_PARAM_CFG_ERR_INT_CLR: u1,
        padding: u29 = 0,
    }),
    /// Scaling and rotating engine color mode register
    /// offset: 0x20
    SR_COLOR_MODE: mmio.Mmio(packed struct(u32) {
        /// The source image color mode for Scaling and Rotating engine Rx. 0: ARGB8888. 1: RGB888. 2: RGB565. 8: YUV420. others: Reserved.
        SR_RX_CM: u4,
        /// The destination image color mode for Scaling and Rotating engine Tx. 0: ARGB8888. 1: RGB888. 2: RGB565. 8: YUV420. others: Reserved.
        SR_TX_CM: u4,
        /// YUV input range when reg_sr_rx_cm is 4'd8. 0: limit range. 1: full range
        YUV_RX_RANGE: u1,
        /// YUV output range when reg_sr_tx_cm is 4'd8. 0: limit range. 1: full range
        YUV_TX_RANGE: u1,
        /// YUV to RGB protocal when reg_sr_rx_cm is 4'd8. 0: BT601. 1: BT709
        YUV2RGB_PROTOCAL: u1,
        /// RGB to YUV protocal when reg_sr_tx_cm is 4'd8. 0: BT601. 1: BT709
        RGB2YUV_PROTOCAL: u1,
        padding: u20 = 0,
    }),
    /// blending engine color mode register
    /// offset: 0x24
    BLEND_COLOR_MODE: mmio.Mmio(packed struct(u32) {
        /// The source image color mode for background plane. 0: ARGB8888. 1: RGB888. 2: RGB565. 3: Reserved. 4: L8. 5: L4.
        BLEND0_RX_CM: u4,
        /// The source image color mode for foreground plane. 0: ARGB8888. 1: RGB888. 2: RGB565. 3: Reserved. 4: L8. 5: L4. 6: A8. 7: A4.
        BLEND1_RX_CM: u4,
        /// The destination image color mode for output of blender. 0: ARGB8888. 1: RGB888. 2: RGB565. 3: Reserved..
        BLEND_TX_CM: u4,
        padding: u20 = 0,
    }),
    /// Scaling and rotating engine byte order register
    /// offset: 0x28
    SR_BYTE_ORDER: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 the data into Rx channel 0 would be swapped in byte. The Byte0 and Byte1 would be swapped while byte 2 and byte 3 would be swappped.
        SR_RX_BYTE_SWAP_EN: u1,
        /// Set this bit to 1 the data into Rx channel 0 would be swapped in rgb. It means rgb would be swap to bgr.
        SR_RX_RGB_SWAP_EN: u1,
        /// Set this bit to 1 to bypass the macro block order function. This function is used to improve efficient accessing external memory.
        SR_MACRO_BK_RO_BYPASS: u1,
        padding: u29 = 0,
    }),
    /// Blending engine byte order register
    /// offset: 0x2c
    BLEND_BYTE_ORDER: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 the data into Rx channel 0 would be swapped in byte. The Byte0 and Byte1 would be swapped while byte 2 and byte 3 would be swappped.
        BLEND0_RX_BYTE_SWAP_EN: u1,
        /// Set this bit to 1 the data into Rx channel 0 would be swapped in byte. The Byte0 and Byte1 would be swapped while byte 2 and byte 3 would be swappped.
        BLEND1_RX_BYTE_SWAP_EN: u1,
        /// Set this bit to 1 the data into Rx channel 0 would be swapped in rgb. It means rgb would be swap to bgr.
        BLEND0_RX_RGB_SWAP_EN: u1,
        /// Set this bit to 1 the data into Rx channel 0 would be swapped in rgb. It means rgb would be swap to bgr.
        BLEND1_RX_RGB_SWAP_EN: u1,
        padding: u28 = 0,
    }),
    /// offset: 0x30
    reserved48: [4]u8,
    /// Blending engine mode configure register
    /// offset: 0x34
    BLEND_TRANS_MODE: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable alpha blending.
        BLEND_EN: u1,
        /// Set this bit to bypass blender. Then background date would be output.
        BLEND_BYPASS: u1,
        /// This bit is used to enable fix pixel filling. When this mode is enable only Tx channel is work and the output pixel is configured by PPA_OUT_FIX_PIXEL.
        BLEND_FIX_PIXEL_FILL_EN: u1,
        /// Set this bit to update the transfer mode. Only the bit is set the transfer mode is valid.
        UPDATE: u1,
        /// write 1 then write 0 to reset blending engine.
        BLEND_RST: u1,
        padding: u27 = 0,
    }),
    /// Scaling and rotating engine alpha override register
    /// offset: 0x38
    SR_FIX_ALPHA: mmio.Mmio(packed struct(u32) {
        /// The value would replace the alpha value in received pixel for Scaling and Rotating engine when PPA_SR_RX_ALPHA_CONF_EN is enabled.
        SR_RX_FIX_ALPHA: u8,
        /// Alpha mode. 0/3: not replace alpha. 1: replace alpha with PPA_SR_FIX_ALPHA. 2: Original alpha multiply with PPA_SR_FIX_ALPHA/256.
        SR_RX_ALPHA_MOD: u2,
        /// Set this bit to invert the original alpha value. When RX color mode is RGB565/RGB88. The original alpha value is 255.
        SR_RX_ALPHA_INV: u1,
        padding: u21 = 0,
    }),
    /// Fix pixel filling mode image size register
    /// offset: 0x3c
    BLEND_TX_SIZE: mmio.Mmio(packed struct(u32) {
        /// The horizontal width of image block that would be filled in fix pixel filling mode. The unit is pixel
        BLEND_HB: u14,
        /// The vertical width of image block that would be filled in fix pixel filling mode. The unit is pixel
        BLEND_VB: u14,
        padding: u4 = 0,
    }),
    /// Blending engine alpha override register
    /// offset: 0x40
    BLEND_FIX_ALPHA: mmio.Mmio(packed struct(u32) {
        /// The value would replace the alpha value in received pixel for background plane of blender when PPA_BLEND0_RX_ALPHA_CONF_EN is enabled.
        BLEND0_RX_FIX_ALPHA: u8,
        /// The value would replace the alpha value in received pixel for foreground plane of blender when PPA_BLEND1_RX_ALPHA_CONF_EN is enabled.
        BLEND1_RX_FIX_ALPHA: u8,
        /// Alpha mode. 0/3: not replace alpha. 1: replace alpha with PPA_SR_FIX_ALPHA. 2: Original alpha multiply with PPA_SR_FIX_ALPHA/256.
        BLEND0_RX_ALPHA_MOD: u2,
        /// Alpha mode. 0/3: not replace alpha. 1: replace alpha with PPA_SR_FIX_ALPHA. 2: Original alpha multiply with PPA_SR_FIX_ALPHA/256.
        BLEND1_RX_ALPHA_MOD: u2,
        /// Set this bit to invert the original alpha value. When RX color mode is RGB565/RGB88. The original alpha value is 255.
        BLEND0_RX_ALPHA_INV: u1,
        /// Set this bit to invert the original alpha value. When RX color mode is RGB565/RGB88. The original alpha value is 255.
        BLEND1_RX_ALPHA_INV: u1,
        padding: u10 = 0,
    }),
    /// offset: 0x44
    reserved68: [4]u8,
    /// RGB color register
    /// offset: 0x48
    BLEND_RGB: mmio.Mmio(packed struct(u32) {
        /// blue color for A4/A8 mode.
        BLEND1_RX_B: u8,
        /// green color for A4/A8 mode.
        BLEND1_RX_G: u8,
        /// red color for A4/A8 mode.
        BLEND1_RX_R: u8,
        padding: u8 = 0,
    }),
    /// Blending engine fix pixel register
    /// offset: 0x4c
    BLEND_FIX_PIXEL: mmio.Mmio(packed struct(u32) {
        /// The configure fix pixel in fix pixel filling mode for blender engine.
        BLEND_TX_FIX_PIXEL: u32,
    }),
    /// foreground color key lower threshold
    /// offset: 0x50
    CK_FG_LOW: mmio.Mmio(packed struct(u32) {
        /// color key lower threshold of foreground b channel
        COLORKEY_FG_B_LOW: u8,
        /// color key lower threshold of foreground g channel
        COLORKEY_FG_G_LOW: u8,
        /// color key lower threshold of foreground r channel
        COLORKEY_FG_R_LOW: u8,
        padding: u8 = 0,
    }),
    /// foreground color key higher threshold
    /// offset: 0x54
    CK_FG_HIGH: mmio.Mmio(packed struct(u32) {
        /// color key higher threshold of foreground b channel
        COLORKEY_FG_B_HIGH: u8,
        /// color key higher threshold of foreground g channel
        COLORKEY_FG_G_HIGH: u8,
        /// color key higher threshold of foreground r channel
        COLORKEY_FG_R_HIGH: u8,
        padding: u8 = 0,
    }),
    /// background color key lower threshold
    /// offset: 0x58
    CK_BG_LOW: mmio.Mmio(packed struct(u32) {
        /// color key lower threshold of background b channel
        COLORKEY_BG_B_LOW: u8,
        /// color key lower threshold of background g channel
        COLORKEY_BG_G_LOW: u8,
        /// color key lower threshold of background r channel
        COLORKEY_BG_R_LOW: u8,
        padding: u8 = 0,
    }),
    /// background color key higher threshold
    /// offset: 0x5c
    CK_BG_HIGH: mmio.Mmio(packed struct(u32) {
        /// color key higher threshold of background b channel
        COLORKEY_BG_B_HIGH: u8,
        /// color key higher threshold of background g channel
        COLORKEY_BG_G_HIGH: u8,
        /// color key higher threshold of background r channel
        COLORKEY_BG_R_HIGH: u8,
        padding: u8 = 0,
    }),
    /// default value when foreground and background both in color key range
    /// offset: 0x60
    CK_DEFAULT: mmio.Mmio(packed struct(u32) {
        /// default B channle value of color key
        COLORKEY_DEFAULT_B: u8,
        /// default G channle value of color key
        COLORKEY_DEFAULT_G: u8,
        /// default R channle value of color key
        COLORKEY_DEFAULT_R: u8,
        /// when pixel in bg ck range but not in fg ck range, 0: the result is bg, 1: the result is fg
        COLORKEY_FG_BG_REVERSE: u1,
        padding: u7 = 0,
    }),
    /// Scaling and rotating coefficient register
    /// offset: 0x64
    SR_SCAL_ROTATE: mmio.Mmio(packed struct(u32) {
        /// The integrated part of scaling coefficient in X direction.
        SR_SCAL_X_INT: u8,
        /// The fragment part of scaling coefficient in X direction.
        SR_SCAL_X_FRAG: u4,
        /// The integrated part of scaling coefficient in Y direction.
        SR_SCAL_Y_INT: u8,
        /// The fragment part of scaling coefficient in Y direction.
        SR_SCAL_Y_FRAG: u4,
        /// The rotate angle. 0: 0 degree. 1: 90 degree. 2: 180 degree. 3: 270 degree.
        SR_ROTATE_ANGLE: u2,
        /// Write 1 then write 0 to this bit to reset scaling and rotating engine.
        SCAL_ROTATE_RST: u1,
        /// Write 1 to enable scaling and rotating engine after parameter is configured.
        SCAL_ROTATE_START: u1,
        /// Image mirror in X direction. 0: disable, 1: enable
        SR_MIRROR_X: u1,
        /// Image mirror in Y direction. 0: disable, 1: enable
        SR_MIRROR_Y: u1,
        padding: u2 = 0,
    }),
    /// SR memory power done register
    /// offset: 0x68
    SR_MEM_PD: mmio.Mmio(packed struct(u32) {
        /// Set this bit to force clock enable of scaling and rotating engine's data memory.
        SR_MEM_CLK_ENA: u1,
        /// Set this bit to force power down scaling and rotating engine's data memory.
        SR_MEM_FORCE_PD: u1,
        /// Set this bit to force power up scaling and rotating engine's data memory.
        SR_MEM_FORCE_PU: u1,
        padding: u29 = 0,
    }),
    /// Register clock enable register
    /// offset: 0x6c
    REG_CONF: mmio.Mmio(packed struct(u32) {
        /// PPA register clock gate enable signal.
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// BLEND CLUT write counter register
    /// offset: 0x70
    CLUT_CNT: mmio.Mmio(packed struct(u32) {
        /// The write data counter of BLEND0 CLUT in fifo mode.
        BLEND0_CLUT_CNT: u9,
        /// The write data counter of BLEND1 CLUT in fifo mode.
        BLEND1_CLUT_CNT: u9,
        padding: u14 = 0,
    }),
    /// Blending engine status register
    /// offset: 0x74
    BLEND_ST: mmio.Mmio(packed struct(u32) {
        /// 1: indicate the size of two image is different.
        BLEND_SIZE_DIFF_ST: u1,
        padding: u31 = 0,
    }),
    /// Scaling and rotating coefficient error register
    /// offset: 0x78
    SR_PARAM_ERR_ST: mmio.Mmio(packed struct(u32) {
        /// The error is that the scaled VB plus the offset of Y coordinate in 2DDMA receive descriptor is larger than VA in 2DDMA receive descriptor.
        TX_DSCR_VB_ERR_ST: u1,
        /// The error is that the scaled HB plus the offset of X coordinate in 2DDMA receive descriptor is larger than HA in 2DDMA receive descriptor.
        TX_DSCR_HB_ERR_ST: u1,
        /// The error is that the PPA_SR_SCAL_Y_INT and PPA_SR_CAL_Y_FRAG both are 0.
        Y_RX_SCAL_EQUAL_0_ERR_ST: u1,
        /// The error is that VB in 2DDMA receive descriptor plus the offset of Y coordinate in 2DDMA transmit descriptor is larger than VA in 2DDMA transmit descriptor
        RX_DSCR_VB_ERR_ST: u1,
        /// The error is that the scaled image width is 0. For example. when source width is 14. scaled value is 1/16. and no rotate operation. then scaled width would be 0 as the result would be floored.
        YDST_LEN_TOO_SAMLL_ERR_ST: u1,
        /// The error is that the scaled width is larger than (2^13 - 1).
        YDST_LEN_TOO_LARGE_ERR_ST: u1,
        /// The error is that the scaled image height is 0.
        X_RX_SCAL_EQUAL_0_ERR_ST: u1,
        /// The error is that the HB in 2DDMA transmit descriptor plus the offset of X coordinate in 2DDMA transmit descriptor is larger than HA in 2DDMA transmit descriptor.
        RX_DSCR_HB_ERR_ST: u1,
        /// The error is that the scaled image height is 0. For example. when source height is 14. scaled value is 1/16. and no rotate operation. then scaled height would be 0 as the result would be floored.
        XDST_LEN_TOO_SAMLL_ERR_ST: u1,
        /// The error is that the scaled image height is larger than (2^13 - 1).
        XDST_LEN_TOO_LARGE_ERR_ST: u1,
        /// The error is that the ha/hb/x param in dma2d descriptor is an odd num when enable yuv420 rx
        X_YUV420_RX_SCALE_ERR_ST: u1,
        /// The error is that the va/vb/y param in dma2d descriptor is an odd num when enable yuv420 rx
        Y_YUV420_RX_SCALE_ERR_ST: u1,
        /// The error is that the ha/hb/x param in dma2d descriptor is an odd num when enable yuv420 tx
        X_YUV420_TX_SCALE_ERR_ST: u1,
        /// The error is that the va/vb/y param in dma2d descriptor is an odd num when enable yuv420 tx
        Y_YUV420_TX_SCALE_ERR_ST: u1,
        padding: u18 = 0,
    }),
    /// SR FSM register
    /// offset: 0x7c
    SR_STATUS: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        SR_RX_DSCR_SAMPLE_STATE: u2,
        /// Reserved.
        SR_RX_SCAN_STATE: u2,
        /// Reserved.
        SR_TX_DSCR_SAMPLE_STATE: u2,
        /// Reserved.
        SR_TX_SCAN_STATE: u3,
        padding: u23 = 0,
    }),
    /// Reserved.
    /// offset: 0x80
    ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        RND_ECO_LOW: u32,
    }),
    /// Reserved.
    /// offset: 0x84
    ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        RND_ECO_HIGH: u32,
    }),
    /// Reserved.
    /// offset: 0x88
    ECO_CELL_CTRL: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        RDN_RESULT: u1,
        /// Reserved.
        RDN_ENA: u1,
        padding: u30 = 0,
    }),
    /// PPA SRAM Control Register
    /// offset: 0x8c
    SRAM_CTRL: mmio.Mmio(packed struct(u32) {
        /// Control signals
        MEM_AUX_CTRL: u14,
        padding: u18 = 0,
    }),
    /// offset: 0x90
    reserved144: [112]u8,
    /// PPA Version register
    /// offset: 0x100
    DATE: mmio.Mmio(packed struct(u32) {
        /// register version.
        DATE: u32,
    }),
};
