const mmio = @import("mmio");
const types = @import("../../types.zig");

/// H264 Encoder (Core)
pub const H264 = extern struct {
    /// H264 system level control register.
    /// offset: 0x00
    SYS_CTRL: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to start encoding one frame.\\0: Invalid. No effect\\1: Start encoding one frame
        FRAME_START: u1,
        /// Configures whether or not to start moving reference data from external mem.\\0: Invalid. No effect\\1: H264 start moving two MB lines of reference frame from external mem to internal mem
        DMA_MOVE_START: u1,
        /// Configures H264 running mode. When field H264_DUAL_STREAM_MODE is set to 1, this field must be set to 1 too.\\0: GOP mode. Before every GOP first frame start, need reconfig reference frame DMA\\1: Frame mode. Before every frame start, need reconfig reference frame DMA
        FRAME_MODE: u1,
        /// Configures whether or not to reset H264 ip.\\0: Invalid. No effect\\1: Reset H264 ip
        SYS_RST_PULSE: u1,
        padding: u28 = 0,
    }),
    /// GOP related configuration register.
    /// offset: 0x04
    GOP_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable dual stream mode. When this field is set to 1, H264_FRAME_MODE field must be set to 1 too.\\0: Normal mode\\1: Dual stream mode
        DUAL_STREAM_MODE: u1,
        /// Configures the frame number of one GOP.\\0: The frame number of one GOP is infinite\\Others: Actual frame number of one GOP
        GOP_NUM: u8,
        padding: u23 = 0,
    }),
    /// Video A horizontal and vertical MB resolution register.
    /// offset: 0x08
    A_SYS_MB_RES: mmio.Mmio(packed struct(u32) {
        /// Configures video A vertical MB resolution.
        A_SYS_TOTAL_MB_Y: u7,
        /// Configures video A horizontal MB resolution.
        A_SYS_TOTAL_MB_X: u7,
        padding: u18 = 0,
    }),
    /// Video A system level configuration register.
    /// offset: 0x0c
    A_SYS_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures when to trigger video A H264_DB_TMP_READY_INT. When the (MB number of written db temp+1) is greater than this filed in first MB line, trigger H264_DB_TMP_READY_INT. Min is 3.
        A_DB_TMP_READY_TRIGGER_MB_NUM: u7,
        /// Configures when to trigger video A H264_REC_READY_INT. When the MB line number of generated reconstruct pixel is greater than this filed, trigger H264_REC_READY_INT. Min is 4.
        A_REC_READY_TRIGGER_MB_LINES: u7,
        /// Configures video A intra cost offset when I MB compared with P MB.
        A_INTRA_COST_CMP_OFFSET: u16,
        padding: u2 = 0,
    }),
    /// Video A luma and chroma MB decimate score Register.
    /// offset: 0x10
    A_DECI_SCORE: mmio.Mmio(packed struct(u32) {
        /// Configures video A chroma MB decimate score. When chroma score is smaller than it, chroma decimate will be enable.
        A_C_DECI_SCORE: u10,
        /// Configures video A luma MB decimate score. When luma score is smaller than it, luma decimate will be enable.
        A_L_DECI_SCORE: u10,
        padding: u12 = 0,
    }),
    /// Video A luma and chroma MB decimate score offset Register.
    /// offset: 0x14
    A_DECI_SCORE_OFFSET: mmio.Mmio(packed struct(u32) {
        /// Configures video A i16x16 MB decimate score offset. This offset will be added to i16x16 MB score.
        A_I16X16_DECI_SCORE_OFFSET: u6,
        /// Configures video A I chroma MB decimate score offset. This offset will be added to I chroma MB score.
        A_I_CHROMA_DECI_SCORE_OFFSET: u6,
        /// Configures video A p16x16 MB decimate score offset. This offset will be added to p16x16 MB score.
        A_P16X16_DECI_SCORE_OFFSET: u6,
        /// Configures video A p chroma MB decimate score offset. This offset will be added to p chroma MB score.
        A_P_CHROMA_DECI_SCORE_OFFSET: u6,
        padding: u8 = 0,
    }),
    /// Video A rate control configuration register0.
    /// offset: 0x18
    A_RC_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures video A frame level initial luma QP value.
        A_QP: u6,
        /// Configures video A parameter U value. U = int((float) u << 8).
        A_RATE_CTRL_U: u16,
        /// Configures video A whether or not to open macro block rate ctrl.\\1:Open the macro block rate ctrl\\1:Close the macro block rate ctrl.
        A_MB_RATE_CTRL_EN: u1,
        padding: u9 = 0,
    }),
    /// Video A rate control configuration register1.
    /// offset: 0x1c
    A_RC_CONF1: mmio.Mmio(packed struct(u32) {
        /// Configures video A chroma DC QP offset based on Chroma QP. Chroma DC QP = Chroma QP(after map) + reg_chroma_dc_qp_delta.
        A_CHROMA_DC_QP_DELTA: u3,
        /// Configures video A chroma QP offset based on luma QP. Chroma QP(before map) = Luma QP + reg_chroma_qp_delta.
        A_CHROMA_QP_DELTA: u4,
        /// Configures video A allowed luma QP min value.
        A_QP_MIN: u6,
        /// Configures video A allowed luma QP max value.
        A_QP_MAX: u6,
        /// Configures vdieo A frame level predicted MB MAD value.
        A_MAD_FRAME_PRED: u12,
        padding: u1 = 0,
    }),
    /// Video A Deblocking bypass register
    /// offset: 0x20
    A_DB_BYPASS: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to bypass video A deblcoking filter. \\0: Open the deblock filter\\1: Close the deblock filter
        A_BYPASS_DB_FILTER: u1,
        padding: u31 = 0,
    }),
    /// Video A H264 ROI region0 range configure register.
    /// offset: 0x24
    A_ROI_REGION0: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 0 in Video A.
        X: u7,
        /// Configures the vertical start macroblocks of region 0 in Video A.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 0 in Video A.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 0 in Video A.
        Y_LEN: u7,
        /// Configures whether or not to open Video A ROI of region 0 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video A H264 ROI region1 range configure register.
    /// offset: 0x28
    A_ROI_REGION1: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 1 in Video A.
        X: u7,
        /// Configures the vertical start macroblocks of region 1 in Video A.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 1 in Video A.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 1 in Video A.
        Y_LEN: u7,
        /// Configures whether or not to open Video A ROI of region 1 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video A H264 ROI region2 range configure register.
    /// offset: 0x2c
    A_ROI_REGION2: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 2 in Video A.
        X: u7,
        /// Configures the vertical start macroblocks of region 2 in Video A.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 2 in Video A.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 2 in Video A.
        Y_LEN: u7,
        /// Configures whether or not to open Video A ROI of region 2 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video A H264 ROI region3 range configure register.
    /// offset: 0x30
    A_ROI_REGION3: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 3 in Video A.
        X: u7,
        /// Configures the vertical start macroblocks of region 3 in Video A.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 3 in video A.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 3 in video A.
        Y_LEN: u7,
        /// Configures whether or not to open Video A ROI of region 3 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video A H264 ROI region4 range configure register.
    /// offset: 0x34
    A_ROI_REGION4: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 4 in Video A.
        X: u7,
        /// Configures the vertical start macroblocks of region 4 in Video A.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 4 in video A.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 4 in video A.
        Y_LEN: u7,
        /// Configures whether or not to open Video A ROI of region 4 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video A H264 ROI region5 range configure register.
    /// offset: 0x38
    A_ROI_REGION5: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontial start macroblocks of region 5 video A.
        X: u7,
        /// Configures the vertical start macroblocks of region 5 video A.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 5 video A.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 5 in video A.
        Y_LEN: u7,
        /// Configures whether or not to open Video A ROI of region 5 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video A H264 ROI region6 range configure register.
    /// offset: 0x3c
    A_ROI_REGION6: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontial start macroblocks of region 6 video A.
        X: u7,
        /// Configures the vertical start macroblocks of region 6 in video A.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 6 in video A.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 6 in video A.
        Y_LEN: u7,
        /// Configures whether or not to open Video A ROI of region 6 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video A H264 ROI region7 range configure register.
    /// offset: 0x40
    A_ROI_REGION7: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 7 in video A.
        X: u7,
        /// Configures the vertical start macroblocks of region 7 in video A.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 7 in video A.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 7 in video A.
        Y_LEN: u7,
        /// Configures whether or not to open Video A ROI of region 7 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video A H264 ROI region0, region1,region2,region3 QP register.
    /// offset: 0x44
    A_ROI_REGION0_3_QP: mmio.Mmio(packed struct(u32) {
        /// Configure H264 ROI region0 qp in video A,fixed qp or delta qp.
        A_ROI_REGION0_QP: u7,
        /// Configure H264 ROI region1 qp in video A,fixed qp or delta qp.
        A_ROI_REGION1_QP: u7,
        /// Configure H264 ROI region2 qp in video A,fixed qp or delta qp.
        A_ROI_REGION2_QP: u7,
        /// Configure H264 ROI region3 qp in video A,fixed qp or delta qp.
        A_ROI_REGION3_QP: u7,
        padding: u4 = 0,
    }),
    /// Video A H264 ROI region4, region5,region6,region7 QP register.
    /// offset: 0x48
    A_ROI_REGION4_7_QP: mmio.Mmio(packed struct(u32) {
        /// Configure H264 ROI region4 qp in video A,fixed qp or delta qp.
        A_ROI_REGION4_QP: u7,
        /// Configure H264 ROI region5 qp in video A,fixed qp or delta qp.
        A_ROI_REGION5_QP: u7,
        /// Configure H264 ROI region6 qp in video A,fixed qp or delta qp.
        A_ROI_REGION6_QP: u7,
        /// Configure H264 ROI region7 qp in video A,fixed qp or delta qp.
        A_ROI_REGION7_QP: u7,
        padding: u4 = 0,
    }),
    /// Video A H264 no roi region QP register.
    /// offset: 0x4c
    A_NO_ROI_REGION_QP_OFFSET: mmio.Mmio(packed struct(u32) {
        /// Configure H264 no region qp in video A, delta qp.
        A_NO_ROI_REGION_QP: u7,
        padding: u25 = 0,
    }),
    /// Video A H264 ROI configure register.
    /// offset: 0x50
    A_ROI_CONFIG: mmio.Mmio(packed struct(u32) {
        /// Configure whether or not to enable ROI in video A.\\0:not enable ROI\\1:enable ROI.
        A_ROI_EN: u1,
        /// Configure the mode of ROI in video A.\\0:fixed qp\\1:delta qp.
        A_ROI_MODE: u1,
        padding: u30 = 0,
    }),
    /// Video B horizontal and vertical MB resolution register.
    /// offset: 0x54
    B_SYS_MB_RES: mmio.Mmio(packed struct(u32) {
        /// Configures video B vertical MB resolution.
        B_SYS_TOTAL_MB_Y: u7,
        /// Configures video B horizontal MB resolution.
        B_SYS_TOTAL_MB_X: u7,
        padding: u18 = 0,
    }),
    /// Video B system level configuration register.
    /// offset: 0x58
    B_SYS_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures when to trigger video B H264_DB_TMP_READY_INT. When the (MB number of written db temp+1) is greater than this filed in first MB line, trigger H264_DB_TMP_READY_INT. Min is 3.
        B_DB_TMP_READY_TRIGGER_MB_NUM: u7,
        /// Configures when to trigger video B H264_REC_READY_INT. When the MB line number of generated reconstruct pixel is greater than this filed, trigger H264_REC_READY_INT. Min is 4.
        B_REC_READY_TRIGGER_MB_LINES: u7,
        /// Configures video B intra cost offset when I MB compared with P MB.
        B_INTRA_COST_CMP_OFFSET: u16,
        padding: u2 = 0,
    }),
    /// Video B luma and chroma MB decimate score Register.
    /// offset: 0x5c
    B_DECI_SCORE: mmio.Mmio(packed struct(u32) {
        /// Configures video B chroma MB decimate score. When chroma score is smaller than it, chroma decimate will be enable.
        B_C_DECI_SCORE: u10,
        /// Configures video B luma MB decimate score. When luma score is smaller than it, luma decimate will be enable.
        B_L_DECI_SCORE: u10,
        padding: u12 = 0,
    }),
    /// Video B luma and chroma MB decimate score offset Register.
    /// offset: 0x60
    B_DECI_SCORE_OFFSET: mmio.Mmio(packed struct(u32) {
        /// Configures video B i16x16 MB decimate score offset. This offset will be added to i16x16 MB score.
        B_I16X16_DECI_SCORE_OFFSET: u6,
        /// Configures video B I chroma MB decimate score offset. This offset will be added to I chroma MB score.
        B_I_CHROMA_DECI_SCORE_OFFSET: u6,
        /// Configures video B p16x16 MB decimate score offset. This offset will be added to p16x16 MB score.
        B_P16X16_DECI_SCORE_OFFSET: u6,
        /// Configures video B p chroma MB decimate score offset. This offset will be added to p chroma MB score.
        B_P_CHROMA_DECI_SCORE_OFFSET: u6,
        padding: u8 = 0,
    }),
    /// Video B rate control configuration register0.
    /// offset: 0x64
    B_RC_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures video B frame level initial luma QP value.
        B_QP: u6,
        /// Configures video B parameter U value. U = int((float) u << 8).
        B_RATE_CTRL_U: u16,
        /// Configures video A whether or not to open macro block rate ctrl.\\1:Open the macro block rate ctrl\\1:Close the macro block rate ctrl.
        B_MB_RATE_CTRL_EN: u1,
        padding: u9 = 0,
    }),
    /// Video B rate control configuration register1.
    /// offset: 0x68
    B_RC_CONF1: mmio.Mmio(packed struct(u32) {
        /// Configures video B chroma DC QP offset based on Chroma QP. Chroma DC QP = Chroma QP(after map) + reg_chroma_dc_qp_delta.
        B_CHROMA_DC_QP_DELTA: u3,
        /// Configures video B chroma QP offset based on luma QP. Chroma QP(before map) = Luma QP + reg_chroma_qp_delta.
        B_CHROMA_QP_DELTA: u4,
        /// Configures video B allowed luma QP min value.
        B_QP_MIN: u6,
        /// Configures video B allowed luma QP max value.
        B_QP_MAX: u6,
        /// Configures vdieo B frame level predicted MB MAD value.
        B_MAD_FRAME_PRED: u12,
        padding: u1 = 0,
    }),
    /// Video B Deblocking bypass register
    /// offset: 0x6c
    B_DB_BYPASS: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to bypass video B deblcoking filter. \\0: Open the deblock filter\\1: Close the deblock filter
        B_BYPASS_DB_FILTER: u1,
        padding: u31 = 0,
    }),
    /// Video B H264 ROI region0 range configure register.
    /// offset: 0x70
    B_ROI_REGION0: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 0 in Video B.
        X: u7,
        /// Configures the vertical start macroblocks of region 0 in Video B.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 0 in Video B.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 0 in Video B.
        Y_LEN: u7,
        /// Configures whether or not to open Video B ROI of region 0 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video B H264 ROI region1 range configure register.
    /// offset: 0x74
    B_ROI_REGION1: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 1 in Video B.
        X: u7,
        /// Configures the vertical start macroblocks of region 1 in Video B.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 1 in Video B.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 1 in Video B.
        Y_LEN: u7,
        /// Configures whether or not to open Video B ROI of region 1 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video B H264 ROI region2 range configure register.
    /// offset: 0x78
    B_ROI_REGION2: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 2 in Video B.
        X: u7,
        /// Configures the vertical start macroblocks of region 2 in Video B.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 2 in Video B.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 2 in Video B.
        Y_LEN: u7,
        /// Configures whether or not to open Video B ROI of region 2 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video B H264 ROI region3 range configure register.
    /// offset: 0x7c
    B_ROI_REGION3: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 3 in Video B.
        X: u7,
        /// Configures the vertical start macroblocks of region 3 in Video B.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 3 in video B.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 3 in video B.
        Y_LEN: u7,
        /// Configures whether or not to open Video B ROI of region 3 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video B H264 ROI region4 range configure register.
    /// offset: 0x80
    B_ROI_REGION4: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 4 in Video B.
        X: u7,
        /// Configures the vertical start macroblocks of region 4 in Video B.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 4 in video B.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 4 in video B.
        Y_LEN: u7,
        /// Configures whether or not to open Video B ROI of region 4 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video B H264 ROI region5 range configure register.
    /// offset: 0x84
    B_ROI_REGION5: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontial start macroblocks of region 5 video B.
        X: u7,
        /// Configures the vertical start macroblocks of region 5 video B.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 5 video B.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 5 in video B.
        Y_LEN: u7,
        /// Configures whether or not to open Video B ROI of region 5 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video B H264 ROI region6 range configure register.
    /// offset: 0x88
    B_ROI_REGION6: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontial start macroblocks of region 6 video B.
        X: u7,
        /// Configures the vertical start macroblocks of region 6 in video B.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 6 in video B.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 6 in video B.
        Y_LEN: u7,
        /// Configures whether or not to open Video B ROI of region 6 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video B H264 ROI region7 range configure register.
    /// offset: 0x8c
    B_ROI_REGION7: mmio.Mmio(packed struct(u32) {
        /// Configures the horizontal start macroblocks of region 7 in video B.
        X: u7,
        /// Configures the vertical start macroblocks of region 7 in video B.
        Y: u7,
        /// Configures the number of macroblocks in horizontal direction of the region 7 in video B.
        X_LEN: u7,
        /// Configures the number of macroblocks in vertical direction of the region 7 in video B.
        Y_LEN: u7,
        /// Configures whether or not to open Video B ROI of region 7 .\\0:Close ROI\\1:Open ROI.
        EN: u1,
        padding: u3 = 0,
    }),
    /// Video B H264 ROI region0, region1,region2,region3 QP register.
    /// offset: 0x90
    B_ROI_REGION0_3_QP: mmio.Mmio(packed struct(u32) {
        /// Configure H264 ROI region0 qp in video B,fixed qp or delta qp.
        B_ROI_REGION0_QP: u7,
        /// Configure H264 ROI region1 qp in video B,fixed qp or delta qp.
        B_ROI_REGION1_QP: u7,
        /// Configure H264 ROI region2 qp in video B,fixed qp or delta qp.
        B_ROI_REGION2_QP: u7,
        /// Configure H264 ROI region3 qp in video B,fixed qp or delta qp.
        B_ROI_REGION3_QP: u7,
        padding: u4 = 0,
    }),
    /// Video B H264 ROI region4, region5,region6,region7 QP register.
    /// offset: 0x94
    B_ROI_REGION4_7_QP: mmio.Mmio(packed struct(u32) {
        /// Configure H264 ROI region4 qp in video B,fixed qp or delta qp.
        B_ROI_REGION4_QP: u7,
        /// Configure H264 ROI region5 qp in video B,fixed qp or delta qp.
        B_ROI_REGION5_QP: u7,
        /// Configure H264 ROI region6 qp in video B,fixed qp or delta qp.
        B_ROI_REGION6_QP: u7,
        /// Configure H264 ROI region7 qp in video B,fixed qp or delta qp.
        B_ROI_REGION7_QP: u7,
        padding: u4 = 0,
    }),
    /// Video B H264 no roi region QP register.
    /// offset: 0x98
    B_NO_ROI_REGION_QP_OFFSET: mmio.Mmio(packed struct(u32) {
        /// Configure H264 no region qp in video B, delta qp.
        B_NO_ROI_REGION_QP: u7,
        padding: u25 = 0,
    }),
    /// Video B H264 ROI configure register.
    /// offset: 0x9c
    B_ROI_CONFIG: mmio.Mmio(packed struct(u32) {
        /// Configure whether or not to enable ROI in video B.\\0:not enable ROI\\1:enable ROI.
        B_ROI_EN: u1,
        /// Configure the mode of ROI in video B.\\0:fixed qp\\1:delta qp.
        B_ROI_MODE: u1,
        padding: u30 = 0,
    }),
    /// Rate control status register0.
    /// offset: 0xa0
    RC_STATUS0: mmio.Mmio(packed struct(u32) {
        /// Represents all MB actual MAD sum value of one frame.
        FRAME_MAD_SUM: u21,
        padding: u11 = 0,
    }),
    /// Rate control status register1.
    /// offset: 0xa4
    RC_STATUS1: mmio.Mmio(packed struct(u32) {
        /// Represents all MB actual encoding bits sum value of one frame.
        FRAME_ENC_BITS: u27,
        padding: u5 = 0,
    }),
    /// Rate control status register2.
    /// offset: 0xa8
    RC_STATUS2: mmio.Mmio(packed struct(u32) {
        /// Represents all MB actual luma QP sum value of one frame.
        FRAME_QP_SUM: u19,
        padding: u13 = 0,
    }),
    /// Frame Slice Header remain bit register.
    /// offset: 0xac
    SLICE_HEADER_REMAIN: mmio.Mmio(packed struct(u32) {
        /// Configures Slice Header remain bit number
        SLICE_REMAIN_BITLENGTH: u3,
        /// Configures Slice Header remain bit
        SLICE_REMAIN_BIT: u8,
        padding: u21 = 0,
    }),
    /// Frame Slice Header byte length register.
    /// offset: 0xb0
    SLICE_HEADER_BYTE_LENGTH: mmio.Mmio(packed struct(u32) {
        /// Configures Slice Header byte number
        SLICE_BYTE_LENGTH: u4,
        padding: u28 = 0,
    }),
    /// Bitstream buffer overflow threshold register
    /// offset: 0xb4
    BS_THRESHOLD: mmio.Mmio(packed struct(u32) {
        /// Configures bitstream buffer overflow threshold. This value should be bigger than the encode bytes of one 4x4 submb.
        BS_BUFFER_THRESHOLD: u7,
        padding: u25 = 0,
    }),
    /// Frame Slice Header byte low 32 bit register.
    /// offset: 0xb8
    SLICE_HEADER_BYTE0: mmio.Mmio(packed struct(u32) {
        /// Configures Slice Header low 32 bit
        SLICE_BYTE_LSB: u32,
    }),
    /// Frame Slice Header byte high 32 bit register.
    /// offset: 0xbc
    SLICE_HEADER_BYTE1: mmio.Mmio(packed struct(u32) {
        /// Configures Slice Header high 32 bit
        SLICE_BYTE_MSB: u32,
    }),
    /// Interrupt raw status register
    /// offset: 0xc0
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// Raw status bit: The raw interrupt status of H264_DB_TMP_READY_INT. Triggered when H264 written enough db tmp pixel.
        DB_TMP_READY_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of H264_REC_READY_INT. Triggered when H264 encoding enough reconstruct pixel.
        REC_READY_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of H264_FRAME_DONE_INT. Triggered when H264 encoding one frame done.
        FRAME_DONE_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of H264_DMA_MOVE_2MB_LINE_DONE_INT. Triggered when H264 move two MB lines of reference frame from external mem to internal mem done.
        DMA_MOVE_2MB_LINE_DONE_INT_RAW: u1,
        padding: u28 = 0,
    }),
    /// Interrupt masked status register
    /// offset: 0xc4
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// The masked interrupt status of H264_DB_TMP_READY_INT. Valid only when the H264_DB_TMP_READY_INT_ENA is set to 1.
        DB_TMP_READY_INT_ST: u1,
        /// The masked interrupt status of H264_REC_READY_INT. Valid only when the H264_REC_READY_INT_ENA is set to 1.
        REC_READY_INT_ST: u1,
        /// The masked interrupt status of H264_FRAME_DONE_INT. Valid only when the H264_FRAME_DONE_INT_ENA is set to 1.
        FRAME_DONE_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of H264_DMA_MOVE_2MB_LINE_DONE_INT. Valid only when the H264_DMA_MOVE_2MB_LINE_DONE_INT_ENA is set to 1.
        DMA_MOVE_2MB_LINE_DONE_INT_ST: u1,
        padding: u28 = 0,
    }),
    /// Interrupt enable register
    /// offset: 0xc8
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// Write 1 to enable H264_DB_TMP_READY_INT.
        DB_TMP_READY_INT_ENA: u1,
        /// Write 1 to enable H264_REC_READY_INT.
        REC_READY_INT_ENA: u1,
        /// Write 1 to enable H264_FRAME_DONE_INT.
        FRAME_DONE_INT_ENA: u1,
        /// Enable bit: Write 1 to enable H264_DMA_MOVE_2MB_LINE_DONE_INT.
        DMA_MOVE_2MB_LINE_DONE_INT_ENA: u1,
        padding: u28 = 0,
    }),
    /// Interrupt clear register
    /// offset: 0xcc
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Write 1 to clear H264_DB_TMP_READY_INT.
        DB_TMP_READY_INT_CLR: u1,
        /// Write 1 to clear H264_REC_READY_INT.
        REC_READY_INT_CLR: u1,
        /// Write 1 to clear H264_FRAME_DONE_INT.
        FRAME_DONE_INT_CLR: u1,
        /// Clear bit: Write 1 to clear H264_DMA_MOVE_2MB_LINE_DONE_INT.
        DMA_MOVE_2MB_LINE_DONE_INT_CLR: u1,
        padding: u28 = 0,
    }),
    /// General configuration register.
    /// offset: 0xd0
    CONF: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to open register clock gate.\\0: Open the clock gate only when application writes registers\\1: Force open the clock gate for register
        CLK_EN: u1,
        /// Configures whether or not to open the clock gate for rec ram2.\\0: Open the clock gate only when application writes or reads rec ram2\\1: Force open the clock gate for rec ram2
        REC_RAM_CLK_EN2: u1,
        /// Configures whether or not to open the clock gate for rec ram1.\\0: Open the clock gate only when application writes or reads rec ram1\\1: Force open the clock gate for rec ram1
        REC_RAM_CLK_EN1: u1,
        /// Configures whether or not to open the clock gate for quant ram2.\\0: Open the clock gate only when application writes or reads quant ram2\\1: Force open the clock gate for quant ram2
        QUANT_RAM_CLK_EN2: u1,
        /// Configures whether or not to open the clock gate for quant ram1.\\0: Open the clock gate only when application writes or reads quant ram1\\1: Force open the clock gate for quant ram1
        QUANT_RAM_CLK_EN1: u1,
        /// Configures whether or not to open the clock gate for pre ram.\\0: Open the clock gate only when application writes or reads pre ram\\1: Force open the clock gate for pre ram
        PRE_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for mvd ram.\\0: Open the clock gate only when application writes or reads mvd ram\\1: Force open the clock gate for mvd ram
        MVD_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for mc ram.\\0: Open the clock gate only when application writes or reads mc ram\\1: Force open the clock gate for mc ram
        MC_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for ref ram.\\0: Open the clock gate only when application writes or reads ref ram\\1: Force open the clock gate for ref ram
        REF_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for i4x4_mode ram.\\0: Open the clock gate only when application writes or reads i4x4_mode ram\\1: Force open the clock gate for i4x4_mode ram
        I4X4_REF_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for ime ram.\\0: Open the clock gate only when application writes or reads ime ram\\1: Force open the clock gate for ime ram
        IME_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for fme ram.\\0: Open the clock gate only when application writes or readsfme ram\\1: Force open the clock gate for fme ram
        FME_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for fetch ram.\\0: Open the clock gate only when application writes or reads fetch ram\\1: Force open the clock gate for fetch ram
        FETCH_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for db ram.\\0: Open the clock gate only when application writes or reads db ram\\1: Force open the clock gate for db ram
        DB_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for cur_mb ram.\\0: Open the clock gate only when application writes or reads cur_mb ram\\1: Force open the clock gate for cur_mb ram
        CUR_MB_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for cavlc ram.\\0: Open the clock gate only when application writes or reads cavlc ram\\1: Force open the clock gate for cavlc ram
        CAVLC_RAM_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for ime.\\0: Open the clock gate only when ime work\\1: Force open the clock gate for ime
        IME_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for fme.\\0: Open the clock gate only when fme work\\1: Force open the clock gate for fme
        FME_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for mc.\\0: Open the clock gate only when mc work\\1: Force open the clock gate for mc
        MC_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for interpolator.\\0: Open the clock gate only when interpolator work\\1: Force open the clock gate for interpolator
        INTERPOLATOR_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for deblocking filter.\\0: Open the clock gate only when deblocking filter work\\1: Force open the clock gate for deblocking filter
        DB_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for cavlc.\\0: Open the clock gate only when cavlc work\\1: Force open the clock gate for cavlc
        CLAVLC_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for intra.\\0: Open the clock gate only when intra work\\1: Force open the clock gate for intra
        INTRA_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for decimate.\\0: Open the clock gate only when decimate work\\1: Force open the clock gate for decimate
        DECI_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for bs buffer.\\0: Open the clock gate only when bs buffer work\\1: Force open the clock gate for bs buffer
        BS_CLK_EN: u1,
        /// Configures whether or not to open the clock gate for mv merge.\\0: Open the clock gate only when mv merge work\\1: Force open the clock gate for mv merge
        MV_MERGE_CLK_EN: u1,
        padding: u6 = 0,
    }),
    /// Mv merge configuration register.
    /// offset: 0xd4
    MV_MERGE_CONFIG: mmio.Mmio(packed struct(u32) {
        /// Configure mv merge type.\\0: merge p16x16 mv\\1: merge min mv\\2: merge max mv\\3: not valid.
        MV_MERGE_TYPE: u2,
        /// Configure mv merge output integer part not zero mv or all part not zero mv.\\0: output all part not zero mv\\1: output integer part not zero mv.
        INT_MV_OUT_EN: u1,
        /// Configure whether or not to enable video A mv merge.\\0: disable\\1: enable.
        A_MV_MERGE_EN: u1,
        /// Configure whether or not to enable video B mv merge.\\0: disable\\1: enable.
        B_MV_MERGE_EN: u1,
        /// Represents the valid mb number of mv merge output.
        MB_VALID_NUM: u13,
        padding: u14 = 0,
    }),
    /// Debug H264 DMA select register
    /// offset: 0xd8
    DEBUG_DMA_SEL: mmio.Mmio(packed struct(u32) {
        /// Every bit represents a dma in h264
        DBG_DMA_SEL: u8,
        padding: u24 = 0,
    }),
    /// System status register.
    /// offset: 0xdc
    SYS_STATUS: mmio.Mmio(packed struct(u32) {
        /// Represents current frame number.
        FRAME_NUM: u9,
        /// Represents which register group is used for cur frame.\\0: Register group A is used\\1: Register group B is used.
        DUAL_STREAM_SEL: u1,
        /// Represents the type of current encoding frame.\\0: P frame\\1: I frame.
        INTRA_FLAG: u1,
        padding: u21 = 0,
    }),
    /// Frame code byte length register.
    /// offset: 0xe0
    FRAME_CODE_LENGTH: mmio.Mmio(packed struct(u32) {
        /// Represents current frame code byte length.
        FRAME_CODE_LENGTH: u24,
        padding: u8 = 0,
    }),
    /// Debug information register0.
    /// offset: 0xe4
    DEBUG_INFO0: mmio.Mmio(packed struct(u32) {
        /// Represents top_ctrl_inter module FSM info.
        TOP_CTRL_INTER_DEBUG_STATE: u4,
        /// Represents top_ctrl_intra module FSM info.
        TOP_CTRL_INTRA_DEBUG_STATE: u3,
        /// Represents p_i_cmp module FSM info.
        P_I_CMP_DEBUG_STATE: u3,
        /// Represents mvd module FSM info.
        MVD_DEBUG_STATE: u3,
        /// Represents mc_chroma_ip module FSM info.
        MC_CHROMA_IP_DEBUG_STATE: u1,
        /// Represents intra_16x16_chroma_ctrl module FSM info.
        INTRA_16X16_CHROMA_CTRL_DEBUG_STATE: u4,
        /// Represents intra_4x4_ctrl module FSM info.
        INTRA_4X4_CTRL_DEBUG_STATE: u4,
        /// Represents intra_top_ctrl module FSM info.
        INTRA_TOP_CTRL_DEBUG_STATE: u3,
        /// Represents ime_ctrl module FSM info.
        IME_CTRL_DEBUG_STATE: u3,
        padding: u4 = 0,
    }),
    /// Debug information register1.
    /// offset: 0xe8
    DEBUG_INFO1: mmio.Mmio(packed struct(u32) {
        /// Represents fme_ctrl module FSM info.
        FME_CTRL_DEBUG_STATE: u3,
        /// Represents deci_calc module's FSM info. DEV use only.
        DECI_CALC_DEBUG_STATE: u2,
        /// Represents db module FSM info.
        DB_DEBUG_STATE: u3,
        /// Represents cavlc module enc FSM info.
        CAVLC_ENC_DEBUG_STATE: u4,
        /// Represents cavlc module scan FSM info.
        CAVLC_SCAN_DEBUG_STATE: u4,
        /// Represents cavlc module ctrl FSM info.
        CAVLC_CTRL_DEBUG_STATE: u2,
        /// Represents bs buffer overflow info.
        BS_BUFFER_DEBUG_STATE: u1,
        padding: u13 = 0,
    }),
    /// Debug information register2.
    /// offset: 0xec
    DEBUG_INFO2: mmio.Mmio(packed struct(u32) {
        /// Represents p rate ctrl done status.\\0: not done\\1: done.
        P_RC_DONE_DEBUG_FLAG: u1,
        /// Represents p p_i_cmp done status.\\0: not done\\1: done.
        P_P_I_CMP_DONE_DEBUG_FLAG: u1,
        /// Represents p mv merge done status.\\0: not done\\1: done.
        P_MV_MERGE_DONE_DEBUG_FLAG: u1,
        /// Represents p move origin done status.\\0: not done\\1: done.
        P_MOVE_ORI_DONE_DEBUG_FLAG: u1,
        /// Represents p mc done status.\\0: not done\\1: done.
        P_MC_DONE_DEBUG_FLAG: u1,
        /// Represents p ime done status.\\0: not done\\1: done.
        P_IME_DONE_DEBUG_FLAG: u1,
        /// Represents p get origin done status.\\0: not done\\1: done.
        P_GET_ORI_DONE_DEBUG_FLAG: u1,
        /// Represents p fme done status.\\0: not done\\1: done.
        P_FME_DONE_DEBUG_FLAG: u1,
        /// Represents p fetch done status.\\0: not done\\1: done.
        P_FETCH_DONE_DEBUG_FLAG: u1,
        /// Represents p deblocking done status.\\0: not done\\1: done.
        P_DB_DONE_DEBUG_FLAG: u1,
        /// Represents p bitstream buffer done status.\\0: not done\\1: done.
        P_BS_BUF_DONE_DEBUG_FLAG: u1,
        /// Represents dma move 2 ref mb line done status.\\0: not done\\1: done.
        REF_MOVE_2MB_LINE_DONE_DEBUG_FLAG: u1,
        /// Represents I p_i_cmp done status.\\0: not done\\1: done.
        I_P_I_CMP_DONE_DEBUG_FLAG: u1,
        /// Represents I move origin done status.\\0: not done\\1: done.
        I_MOVE_ORI_DONE_DEBUG_FLAG: u1,
        /// Represents I get origin done status.\\0: not done\\1: done.
        I_GET_ORI_DONE_DEBUG_FLAG: u1,
        /// Represents I encoder done status.\\0: not done\\1: done.
        I_EC_DONE_DEBUG_FLAG: u1,
        /// Represents I deblocking done status.\\0: not done\\1: done.
        I_DB_DONE_DEBUG_FLAG: u1,
        /// Represents I bitstream buffer done status.\\0: not done\\1: done.
        I_BS_BUF_DONE_DEBUG_FLAG: u1,
        padding: u14 = 0,
    }),
    /// Version control register
    /// offset: 0xf0
    DATE: mmio.Mmio(packed struct(u32) {
        /// Configures the version.
        LEDC_DATE: u28,
        padding: u4 = 0,
    }),
};
