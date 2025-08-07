const mmio = @import("mmio");
const types = @import("../../types.zig");

/// ISP Peripheral
pub const ISP = extern struct {
    /// version control register
    /// offset: 0x00
    VER_DATE: mmio.Mmio(packed struct(u32) {
        /// csv version
        VER_DATA: u32,
    }),
    /// isp clk control register
    /// offset: 0x04
    CLK_EN: mmio.Mmio(packed struct(u32) {
        /// this bit configures the clk force on of isp reg. 0: disable, 1: enable
        CLK_EN: u1,
        /// this bit configures the clk force on of blc. 0: disable, 1: enable
        CLK_BLC_FORCE_ON: u1,
        /// this bit configures the clk force on of dpc. 0: disable, 1: enable
        CLK_DPC_FORCE_ON: u1,
        /// this bit configures the clk force on of bf. 0: disable, 1: enable
        CLK_BF_FORCE_ON: u1,
        /// this bit configures the clk force on of lsc. 0: disable, 1: enable
        CLK_LSC_FORCE_ON: u1,
        /// this bit configures the clk force on of demosaic. 0: disable, 1: enable
        CLK_DEMOSAIC_FORCE_ON: u1,
        /// this bit configures the clk force on of median. 0: disable, 1: enable
        CLK_MEDIAN_FORCE_ON: u1,
        /// this bit configures the clk force on of ccm. 0: disable, 1: enable
        CLK_CCM_FORCE_ON: u1,
        /// this bit configures the clk force on of gamma. 0: disable, 1: enable
        CLK_GAMMA_FORCE_ON: u1,
        /// this bit configures the clk force on of rgb2yuv. 0: disable, 1: enable
        CLK_RGB2YUV_FORCE_ON: u1,
        /// this bit configures the clk force on of sharp. 0: disable, 1: enable
        CLK_SHARP_FORCE_ON: u1,
        /// this bit configures the clk force on of color. 0: disable, 1: enable
        CLK_COLOR_FORCE_ON: u1,
        /// this bit configures the clk force on of yuv2rgb. 0: disable, 1: enable
        CLK_YUV2RGB_FORCE_ON: u1,
        /// this bit configures the clk force on of ae. 0: disable, 1: enable
        CLK_AE_FORCE_ON: u1,
        /// this bit configures the clk force on of af. 0: disable, 1: enable
        CLK_AF_FORCE_ON: u1,
        /// this bit configures the clk force on of awb. 0: disable, 1: enable
        CLK_AWB_FORCE_ON: u1,
        /// this bit configures the clk force on of hist. 0: disable, 1: enable
        CLK_HIST_FORCE_ON: u1,
        /// this bit configures the clk force on of mipi idi input. 0: disable, 1: enable
        CLK_MIPI_IDI_FORCE_ON: u1,
        /// this bit configures the clk force on of all isp memory. 0: disable, 1: enable
        ISP_MEM_CLK_FORCE_ON: u1,
        padding: u13 = 0,
    }),
    /// isp module enable control register
    /// offset: 0x08
    CNTL: mmio.Mmio(packed struct(u32) {
        /// this bit configures mipi input data enable. 0: disable, 1: enable
        MIPI_DATA_EN: u1,
        /// this bit configures isp global enable. 0: disable, 1: enable
        ISP_EN: u1,
        /// this bit configures blc enable. 0: disable, 1: enable
        BLC_EN: u1,
        /// this bit configures dpc enable. 0: disable, 1: enable
        DPC_EN: u1,
        /// this bit configures bf enable. 0: disable, 1: enable
        BF_EN: u1,
        /// this bit configures lsc enable. 0: disable, 1: enable
        LSC_EN: u1,
        /// this bit configures demosaic enable. 0: disable, 1: enable
        DEMOSAIC_EN: u1,
        /// this bit configures median enable. 0: disable, 1: enable
        MEDIAN_EN: u1,
        /// this bit configures ccm enable. 0: disable, 1: enable
        CCM_EN: u1,
        /// this bit configures gamma enable. 0: disable, 1: enable
        GAMMA_EN: u1,
        /// this bit configures rgb2yuv enable. 0: disable, 1: enable
        RGB2YUV_EN: u1,
        /// this bit configures sharp enable. 0: disable, 1: enable
        SHARP_EN: u1,
        /// this bit configures color enable. 0: disable, 1: enable
        COLOR_EN: u1,
        /// this bit configures yuv2rgb enable. 0: disable, 1: enable
        YUV2RGB_EN: u1,
        /// this bit configures ae enable. 0: disable, 1: enable
        AE_EN: u1,
        /// this bit configures af enable. 0: disable, 1: enable
        AF_EN: u1,
        /// this bit configures awb enable. 0: disable, 1: enable
        AWB_EN: u1,
        /// this bit configures hist enable. 0: disable, 1: enable
        HIST_EN: u1,
        reserved24: u6 = 0,
        /// select input idi data byte_endian_order when isp is bypass, 0: csi_data[31:0], 1: {[7:0], [15:8], [23:16], [31:24]}
        BYTE_ENDIAN_ORDER: u1,
        /// this field configures input data type, 0:RAW8 1:RAW10 2:RAW12
        ISP_DATA_TYPE: u2,
        /// this field configures input data source, 0:CSI HOST 1:CAM 2:DMA
        ISP_IN_SRC: u2,
        /// this field configures pixel output type, 0: RAW8 1: YUV422 2: RGB888 3: YUV420 4: RGB565
        ISP_OUT_TYPE: u3,
    }),
    /// header hsync interval control register
    /// offset: 0x0c
    HSYNC_CNT: mmio.Mmio(packed struct(u32) {
        /// this field configures the number of clock before hsync and after vsync and line_end when decodes pix data from idi to isp
        HSYNC_CNT: u8,
        padding: u24 = 0,
    }),
    /// frame control parameter register
    /// offset: 0x10
    FRAME_CFG: mmio.Mmio(packed struct(u32) {
        /// this field configures input image size in y-direction, image row number - 1
        VADR_NUM: u12,
        /// this field configures input image size in x-direction, image line number - 1
        HADR_NUM: u12,
        reserved27: u3 = 0,
        /// this field configures the bayer mode of input pixel. 00 : BG/GR 01 : GB/RG 10 : GR/BG 11 : RG/GB
        BAYER_MODE: u2,
        /// this bit configures the line end packet exist or not. 0: not exist, 1: exist
        HSYNC_START_EXIST: u1,
        /// this bit configures the line start packet exist or not. 0: not exist, 1: exist
        HSYNC_END_EXIST: u1,
        padding: u1 = 0,
    }),
    /// ccm coef register 0
    /// offset: 0x14
    CCM_COEF0: mmio.Mmio(packed struct(u32) {
        /// this field configures the color correction matrix coefficient
        CCM_RR: u13,
        /// this field configures the color correction matrix coefficient
        CCM_RG: u13,
        padding: u6 = 0,
    }),
    /// ccm coef register 1
    /// offset: 0x18
    CCM_COEF1: mmio.Mmio(packed struct(u32) {
        /// this field configures the color correction matrix coefficient
        CCM_RB: u13,
        /// this field configures the color correction matrix coefficient
        CCM_GR: u13,
        padding: u6 = 0,
    }),
    /// ccm coef register 3
    /// offset: 0x1c
    CCM_COEF3: mmio.Mmio(packed struct(u32) {
        /// this field configures the color correction matrix coefficient
        CCM_GG: u13,
        /// this field configures the color correction matrix coefficient
        CCM_GB: u13,
        padding: u6 = 0,
    }),
    /// ccm coef register 4
    /// offset: 0x20
    CCM_COEF4: mmio.Mmio(packed struct(u32) {
        /// this field configures the color correction matrix coefficient
        CCM_BR: u13,
        /// this field configures the color correction matrix coefficient
        CCM_BG: u13,
        padding: u6 = 0,
    }),
    /// ccm coef register 5
    /// offset: 0x24
    CCM_COEF5: mmio.Mmio(packed struct(u32) {
        /// this field configures the color correction matrix coefficient
        CCM_BB: u13,
        padding: u19 = 0,
    }),
    /// bf pix2matrix ctrl
    /// offset: 0x28
    BF_MATRIX_CTRL: mmio.Mmio(packed struct(u32) {
        /// matrix tail pixen low level threshold, should not to large to prevent expanding to next frame, only reg_bf_tail_pixen_pulse_th!=0 and reg_bf_tail_pixen_pulse_tl!=0 and reg_bf_tail_pixen_pulse_th < reg_bf_tail_pixen_pulse_tl will enable tail pulse function
        BF_TAIL_PIXEN_PULSE_TL: u8,
        /// matrix tail pixen high level threshold, must < hnum-1, only reg_bf_tail_pixen_pulse_th!=0 and reg_bf_tail_pixen_pulse_tl!=0 and reg_bf_tail_pixen_pulse_th < reg_bf_tail_pixen_pulse_tl will enable tail pulse function
        BF_TAIL_PIXEN_PULSE_TH: u8,
        /// this field configures bf matrix padding data
        BF_PADDING_DATA: u8,
        /// this bit configures the padding mode of bf matrix. 0: use pixel in image to do padding 1: use reg_padding_data to do padding
        BF_PADDING_MODE: u1,
        padding: u7 = 0,
    }),
    /// bf denoising level control register
    /// offset: 0x2c
    BF_SIGMA: mmio.Mmio(packed struct(u32) {
        /// this field configures the bayer denoising level, valid data from 2 to 20
        SIGMA: u6,
        padding: u26 = 0,
    }),
    /// bf gau template register 0
    /// offset: 0x30
    BF_GAU0: mmio.Mmio(packed struct(u32) {
        /// this field configures index 21 of gausian template
        GAU_TEMPLATE21: u4,
        /// this field configures index 20 of gausian template
        GAU_TEMPLATE20: u4,
        /// this field configures index 12 of gausian template
        GAU_TEMPLATE12: u4,
        /// this field configures index 11 of gausian template
        GAU_TEMPLATE11: u4,
        /// this field configures index 10 of gausian template
        GAU_TEMPLATE10: u4,
        /// this field configures index 02 of gausian template
        GAU_TEMPLATE02: u4,
        /// this field configures index 01 of gausian template
        GAU_TEMPLATE01: u4,
        /// this field configures index 00 of gausian template
        GAU_TEMPLATE00: u4,
    }),
    /// bf gau template register 1
    /// offset: 0x34
    BF_GAU1: mmio.Mmio(packed struct(u32) {
        /// this field configures index 22 of gausian template
        GAU_TEMPLATE22: u4,
        padding: u28 = 0,
    }),
    /// DPC mode control register
    /// offset: 0x38
    DPC_CTRL: mmio.Mmio(packed struct(u32) {
        /// this bit configures the check mode enable. 0: disable, 1: enable
        DPC_CHECK_EN: u1,
        /// this bit configures the sta dpc enable. 0: disable, 1: enable
        STA_EN: u1,
        /// this bit configures the dyn dpc enable. 0: disable, 1: enable
        DYN_EN: u1,
        /// this bit configures input image type select when in check mode, 0: white img, 1: black img
        DPC_BLACK_EN: u1,
        /// this bit configures dyn dpc method select. 0: simple method, 1: hard method
        DPC_METHOD_SEL: u1,
        /// this bit configures output pixel data when in check mode or not. 0: no data output, 1: data output
        DPC_CHECK_OD_EN: u1,
        padding: u26 = 0,
    }),
    /// DPC parameter config register
    /// offset: 0x3c
    DPC_CONF: mmio.Mmio(packed struct(u32) {
        /// this bit configures the threshold to detect black img in check mode, or the low threshold(use 8 bit 0~255) in dyn method 0, or the low threshold factor (use 5 bit 10000-> 16/16, 00001->1/16, 0/16~16/16) in dyn method 1
        DPC_THRESHOLD_L: u8,
        /// this bit configures the threshold to detect white img in check mode, or the high threshold(use 8 bit 0~255) in dyn method 0, or the high threshold factor (use 5 bit 10000-> 16/16, 00001->1/16, 0/16~16/16) in dyn method 1
        DPC_THRESHOLD_H: u8,
        /// this field configures the dynamic correction method 1 dark factor
        DPC_FACTOR_DARK: u6,
        /// this field configures the dynamic correction method 1 bright factor
        DPC_FACTOR_BRIG: u6,
        padding: u4 = 0,
    }),
    /// dpc pix2matrix ctrl
    /// offset: 0x40
    DPC_MATRIX_CTRL: mmio.Mmio(packed struct(u32) {
        /// matrix tail pixen low level threshold, should not to large to prevent expanding to next frame, only reg_dpc_tail_pixen_pulse_th!=0 and reg_dpc_tail_pixen_pulse_tl!=0 and reg_dpc_tail_pixen_pulse_th < reg_dpc_tail_pixen_pulse_tl will enable tail pulse function
        DPC_TAIL_PIXEN_PULSE_TL: u8,
        /// matrix tail pixen high level threshold, must < hnum-1, only reg_dpc_tail_pixen_pulse_th!=0 and reg_dpc_tail_pixen_pulse_tl!=0 and reg_dpc_tail_pixen_pulse_th < reg_dpc_tail_pixen_pulse_tl will enable tail pulse function
        DPC_TAIL_PIXEN_PULSE_TH: u8,
        /// this field configures dpc matrix padding data
        DPC_PADDING_DATA: u8,
        /// this bit configures the padding mode of dpc matrix. 0: use pixel in image to do padding 1: use reg_padding_data to do padding
        DPC_PADDING_MODE: u1,
        padding: u7 = 0,
    }),
    /// DPC dead-pix number register
    /// offset: 0x44
    DPC_DEADPIX_CNT: mmio.Mmio(packed struct(u32) {
        /// this field represents the dead pixel count
        DPC_DEADPIX_CNT: u10,
        padding: u22 = 0,
    }),
    /// LUT command register
    /// offset: 0x48
    LUT_CMD: mmio.Mmio(packed struct(u32) {
        /// this field configures the lut access addr, when select lsc lut, [11:10]:00 sel gb_b lut, 01 sel r_gr lut
        LUT_ADDR: u12,
        /// this field configures the lut selection. 0000:LSC LUT 0001:DPC LUT
        LUT_NUM: u4,
        /// this bit configures the access event of lut. 0:rd 1: wr
        LUT_CMD: u1,
        padding: u15 = 0,
    }),
    /// LUT write data register
    /// offset: 0x4c
    LUT_WDATA: mmio.Mmio(packed struct(u32) {
        /// this field configures the write data of lut. please initial ISP_LUT_WDATA before write ISP_LUT_CMD register
        LUT_WDATA: u32,
    }),
    /// LUT read data register
    /// offset: 0x50
    LUT_RDATA: mmio.Mmio(packed struct(u32) {
        /// this field represents the read data of lut. read ISP_LUT_RDATA after write ISP_LUT_CMD register
        LUT_RDATA: u32,
    }),
    /// LSC point in x-direction
    /// offset: 0x54
    LSC_TABLESIZE: mmio.Mmio(packed struct(u32) {
        /// this field configures lsc table size in x-direction
        LSC_XTABLESIZE: u5,
        padding: u27 = 0,
    }),
    /// demosaic pix2matrix ctrl
    /// offset: 0x58
    DEMOSAIC_MATRIX_CTRL: mmio.Mmio(packed struct(u32) {
        /// matrix tail pixen low level threshold, should not to large to prevent expanding to next frame, only reg_demosaic_tail_pixen_pulse_th!=0 and reg_demosaic_tail_pixen_pulse_tl!=0 and reg_demosaic_tail_pixen_pulse_th < reg_demosaic_tail_pixen_pulse_tl will enable tail pulse function
        DEMOSAIC_TAIL_PIXEN_PULSE_TL: u8,
        /// matrix tail pixen high level threshold, must < hnum-1, only reg_demosaic_tail_pixen_pulse_th!=0 and reg_demosaic_tail_pixen_pulse_tl!=0 and reg_demosaic_tail_pixen_pulse_th < reg_demosaic_tail_pixen_pulse_tl will enable tail pulse function
        DEMOSAIC_TAIL_PIXEN_PULSE_TH: u8,
        /// this field configures demosaic matrix padding data
        DEMOSAIC_PADDING_DATA: u8,
        /// this bit configures the padding mode of demosaic matrix. 0: use pixel in image to do padding 1: use reg_padding_data to do padding
        DEMOSAIC_PADDING_MODE: u1,
        padding: u7 = 0,
    }),
    /// demosaic gradient select ratio
    /// offset: 0x5c
    DEMOSAIC_GRAD_RATIO: mmio.Mmio(packed struct(u32) {
        /// this field configures demosaic gradient select ratio
        DEMOSAIC_GRAD_RATIO: u6,
        padding: u26 = 0,
    }),
    /// median pix2matrix ctrl
    /// offset: 0x60
    MEDIAN_MATRIX_CTRL: mmio.Mmio(packed struct(u32) {
        /// this field configures median matrix padding data
        MEDIAN_PADDING_DATA: u8,
        /// this bit configures the padding mode of median matrix. 0: use pixel in image to do padding 1: use reg_padding_data to do padding
        MEDIAN_PADDING_MODE: u1,
        padding: u23 = 0,
    }),
    /// raw interrupt register
    /// offset: 0x64
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// the raw interrupt status of input data type error. isp only support RGB bayer data type, other type will report type_err_int
        ISP_DATA_TYPE_ERR_INT_RAW: u1,
        /// the raw interrupt status of isp input fifo overflow
        ISP_ASYNC_FIFO_OVF_INT_RAW: u1,
        /// the raw interrupt status of isp input buffer full
        ISP_BUF_FULL_INT_RAW: u1,
        /// the raw interrupt status of hnum and vnum setting format error
        ISP_HVNUM_SETTING_ERR_INT_RAW: u1,
        /// the raw interrupt status of setting invalid reg_data_type
        ISP_DATA_TYPE_SETTING_ERR_INT_RAW: u1,
        /// the raw interrupt status of hnum setting unmatch with mipi input
        ISP_MIPI_HNUM_UNMATCH_INT_RAW: u1,
        /// the raw interrupt status of dpc check done
        DPC_CHECK_DONE_INT_RAW: u1,
        /// the raw interrupt status of gamma setting error. it report the sum of the lengths represented by reg_gamma_x00~x0F isn't equal to 256
        GAMMA_XCOORD_ERR_INT_RAW: u1,
        /// the raw interrupt status of ae monitor
        AE_MONITOR_INT_RAW: u1,
        /// the raw interrupt status of ae.
        AE_FRAME_DONE_INT_RAW: u1,
        /// the raw interrupt status of af statistic. when auto_update enable, each frame done will send one int pulse when manual_update, each time when write 1 to reg_manual_update will send a int pulse when next frame done
        AF_FDONE_INT_RAW: u1,
        /// the raw interrupt status of af monitor. send a int pulse when env_det function enabled and environment changes detected
        AF_ENV_INT_RAW: u1,
        /// the raw interrupt status of awb. send a int pulse when statistic of one awb frame done
        AWB_FDONE_INT_RAW: u1,
        /// the raw interrupt status of histogram. send a int pulse when statistic of one frame histogram done
        HIST_FDONE_INT_RAW: u1,
        /// the raw interrupt status of isp frame end
        FRAME_INT_RAW: u1,
        /// the raw interrupt status of blc frame done
        BLC_FRAME_INT_RAW: u1,
        /// the raw interrupt status of lsc frame done
        LSC_FRAME_INT_RAW: u1,
        /// the raw interrupt status of dpc frame done
        DPC_FRAME_INT_RAW: u1,
        /// the raw interrupt status of bf frame done
        BF_FRAME_INT_RAW: u1,
        /// the raw interrupt status of demosaic frame done
        DEMOSAIC_FRAME_INT_RAW: u1,
        /// the raw interrupt status of median frame done
        MEDIAN_FRAME_INT_RAW: u1,
        /// the raw interrupt status of ccm frame done
        CCM_FRAME_INT_RAW: u1,
        /// the raw interrupt status of gamma frame done
        GAMMA_FRAME_INT_RAW: u1,
        /// the raw interrupt status of rgb2yuv frame done
        RGB2YUV_FRAME_INT_RAW: u1,
        /// the raw interrupt status of sharp frame done
        SHARP_FRAME_INT_RAW: u1,
        /// the raw interrupt status of color frame done
        COLOR_FRAME_INT_RAW: u1,
        /// the raw interrupt status of yuv2rgb frame done
        YUV2RGB_FRAME_INT_RAW: u1,
        /// the raw interrupt status of isp_tail idi frame_end
        TAIL_IDI_FRAME_INT_RAW: u1,
        /// the raw interrupt status of real input frame end of isp_input
        HEADER_IDI_FRAME_INT_RAW: u1,
        padding: u3 = 0,
    }),
    /// masked interrupt register
    /// offset: 0x68
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// the masked interrupt status of input data type error
        ISP_DATA_TYPE_ERR_INT_ST: u1,
        /// the masked interrupt status of isp input fifo overflow
        ISP_ASYNC_FIFO_OVF_INT_ST: u1,
        /// the masked interrupt status of isp input buffer full
        ISP_BUF_FULL_INT_ST: u1,
        /// the masked interrupt status of hnum and vnum setting format error
        ISP_HVNUM_SETTING_ERR_INT_ST: u1,
        /// the masked interrupt status of setting invalid reg_data_type
        ISP_DATA_TYPE_SETTING_ERR_INT_ST: u1,
        /// the masked interrupt status of hnum setting unmatch with mipi input
        ISP_MIPI_HNUM_UNMATCH_INT_ST: u1,
        /// the masked interrupt status of dpc check done
        DPC_CHECK_DONE_INT_ST: u1,
        /// the masked interrupt status of gamma setting error
        GAMMA_XCOORD_ERR_INT_ST: u1,
        /// the masked interrupt status of ae monitor
        AE_MONITOR_INT_ST: u1,
        /// the masked interrupt status of ae
        AE_FRAME_DONE_INT_ST: u1,
        /// the masked interrupt status of af statistic
        AF_FDONE_INT_ST: u1,
        /// the masked interrupt status of af monitor
        AF_ENV_INT_ST: u1,
        /// the masked interrupt status of awb
        AWB_FDONE_INT_ST: u1,
        /// the masked interrupt status of histogram
        HIST_FDONE_INT_ST: u1,
        /// the masked interrupt status of isp frame end
        FRAME_INT_ST: u1,
        /// the masked interrupt status of blc frame done
        BLC_FRAME_INT_ST: u1,
        /// the masked interrupt status of lsc frame done
        LSC_FRAME_INT_ST: u1,
        /// the masked interrupt status of dpc frame done
        DPC_FRAME_INT_ST: u1,
        /// the masked interrupt status of bf frame done
        BF_FRAME_INT_ST: u1,
        /// the masked interrupt status of demosaic frame done
        DEMOSAIC_FRAME_INT_ST: u1,
        /// the masked interrupt status of median frame done
        MEDIAN_FRAME_INT_ST: u1,
        /// the masked interrupt status of ccm frame done
        CCM_FRAME_INT_ST: u1,
        /// the masked interrupt status of gamma frame done
        GAMMA_FRAME_INT_ST: u1,
        /// the masked interrupt status of rgb2yuv frame done
        RGB2YUV_FRAME_INT_ST: u1,
        /// the masked interrupt status of sharp frame done
        SHARP_FRAME_INT_ST: u1,
        /// the masked interrupt status of color frame done
        COLOR_FRAME_INT_ST: u1,
        /// the masked interrupt status of yuv2rgb frame done
        YUV2RGB_FRAME_INT_ST: u1,
        /// the masked interrupt status of isp_tail idi frame_end
        TAIL_IDI_FRAME_INT_ST: u1,
        /// the masked interrupt status of real input frame end of isp_input
        HEADER_IDI_FRAME_INT_ST: u1,
        padding: u3 = 0,
    }),
    /// interrupt enable register
    /// offset: 0x6c
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// write 1 to enable input data type error
        ISP_DATA_TYPE_ERR_INT_ENA: u1,
        /// write 1 to enable isp input fifo overflow
        ISP_ASYNC_FIFO_OVF_INT_ENA: u1,
        /// write 1 to enable isp input buffer full
        ISP_BUF_FULL_INT_ENA: u1,
        /// write 1 to enable hnum and vnum setting format error
        ISP_HVNUM_SETTING_ERR_INT_ENA: u1,
        /// write 1 to enable setting invalid reg_data_type
        ISP_DATA_TYPE_SETTING_ERR_INT_ENA: u1,
        /// write 1 to enable hnum setting unmatch with mipi input
        ISP_MIPI_HNUM_UNMATCH_INT_ENA: u1,
        /// write 1 to enable dpc check done
        DPC_CHECK_DONE_INT_ENA: u1,
        /// write 1 to enable gamma setting error
        GAMMA_XCOORD_ERR_INT_ENA: u1,
        /// write 1 to enable ae monitor
        AE_MONITOR_INT_ENA: u1,
        /// write 1 to enable ae
        AE_FRAME_DONE_INT_ENA: u1,
        /// write 1 to enable af statistic
        AF_FDONE_INT_ENA: u1,
        /// write 1 to enable af monitor
        AF_ENV_INT_ENA: u1,
        /// write 1 to enable awb
        AWB_FDONE_INT_ENA: u1,
        /// write 1 to enable histogram
        HIST_FDONE_INT_ENA: u1,
        /// write 1 to enable isp frame end
        FRAME_INT_ENA: u1,
        /// write 1 to enable blc frame done
        BLC_FRAME_INT_ENA: u1,
        /// write 1 to enable lsc frame done
        LSC_FRAME_INT_ENA: u1,
        /// write 1 to enable dpc frame done
        DPC_FRAME_INT_ENA: u1,
        /// write 1 to enable bf frame done
        BF_FRAME_INT_ENA: u1,
        /// write 1 to enable demosaic frame done
        DEMOSAIC_FRAME_INT_ENA: u1,
        /// write 1 to enable median frame done
        MEDIAN_FRAME_INT_ENA: u1,
        /// write 1 to enable ccm frame done
        CCM_FRAME_INT_ENA: u1,
        /// write 1 to enable gamma frame done
        GAMMA_FRAME_INT_ENA: u1,
        /// write 1 to enable rgb2yuv frame done
        RGB2YUV_FRAME_INT_ENA: u1,
        /// write 1 to enable sharp frame done
        SHARP_FRAME_INT_ENA: u1,
        /// write 1 to enable color frame done
        COLOR_FRAME_INT_ENA: u1,
        /// write 1 to enable yuv2rgb frame done
        YUV2RGB_FRAME_INT_ENA: u1,
        /// write 1 to enable isp_tail idi frame_end
        TAIL_IDI_FRAME_INT_ENA: u1,
        /// write 1 to enable real input frame end of isp_input
        HEADER_IDI_FRAME_INT_ENA: u1,
        padding: u3 = 0,
    }),
    /// interrupt clear register
    /// offset: 0x70
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// write 1 to clear input data type error
        ISP_DATA_TYPE_ERR_INT_CLR: u1,
        /// write 1 to clear isp input fifo overflow
        ISP_ASYNC_FIFO_OVF_INT_CLR: u1,
        /// write 1 to clear isp input buffer full
        ISP_BUF_FULL_INT_CLR: u1,
        /// write 1 to clear hnum and vnum setting format error
        ISP_HVNUM_SETTING_ERR_INT_CLR: u1,
        /// write 1 to clear setting invalid reg_data_type
        ISP_DATA_TYPE_SETTING_ERR_INT_CLR: u1,
        /// write 1 to clear hnum setting unmatch with mipi input
        ISP_MIPI_HNUM_UNMATCH_INT_CLR: u1,
        /// write 1 to clear dpc check done
        DPC_CHECK_DONE_INT_CLR: u1,
        /// write 1 to clear gamma setting error
        GAMMA_XCOORD_ERR_INT_CLR: u1,
        /// write 1 to clear ae monitor
        AE_MONITOR_INT_CLR: u1,
        /// write 1 to clear ae
        AE_FRAME_DONE_INT_CLR: u1,
        /// write 1 to clear af statistic
        AF_FDONE_INT_CLR: u1,
        /// write 1 to clear af monitor
        AF_ENV_INT_CLR: u1,
        /// write 1 to clear awb
        AWB_FDONE_INT_CLR: u1,
        /// write 1 to clear histogram
        HIST_FDONE_INT_CLR: u1,
        /// write 1 to clear isp frame end
        FRAME_INT_CLR: u1,
        /// write 1 to clear blc frame done
        BLC_FRAME_INT_CLR: u1,
        /// write 1 to clear lsc frame done
        LSC_FRAME_INT_CLR: u1,
        /// write 1 to clear dpc frame done
        DPC_FRAME_INT_CLR: u1,
        /// write 1 to clear bf frame done
        BF_FRAME_INT_CLR: u1,
        /// write 1 to clear demosaic frame done
        DEMOSAIC_FRAME_INT_CLR: u1,
        /// write 1 to clear median frame done
        MEDIAN_FRAME_INT_CLR: u1,
        /// write 1 to clear ccm frame done
        CCM_FRAME_INT_CLR: u1,
        /// write 1 to clear gamma frame done
        GAMMA_FRAME_INT_CLR: u1,
        /// write 1 to clear rgb2yuv frame done
        RGB2YUV_FRAME_INT_CLR: u1,
        /// write 1 to clear sharp frame done
        SHARP_FRAME_INT_CLR: u1,
        /// write 1 to clear color frame done
        COLOR_FRAME_INT_CLR: u1,
        /// write 1 to clear yuv2rgb frame done
        YUV2RGB_FRAME_INT_CLR: u1,
        /// write 1 to clear isp_tail idi frame_end
        TAIL_IDI_FRAME_INT_CLR: u1,
        /// write 1 to clear real input frame end of isp_input
        HEADER_IDI_FRAME_INT_CLR: u1,
        padding: u3 = 0,
    }),
    /// gamma control register
    /// offset: 0x74
    GAMMA_CTRL: mmio.Mmio(packed struct(u32) {
        /// Indicates that gamma register configuration is complete
        GAMMA_UPDATE: u1,
        /// this bit configures enable of last b segment correcction. 0: disable, 1: enable
        GAMMA_B_LAST_CORRECT: u1,
        /// this bit configures enable of last g segment correcction. 0: disable, 1: enable
        GAMMA_G_LAST_CORRECT: u1,
        /// this bit configures enable of last r segment correcction. 0: disable, 1: enable
        GAMMA_R_LAST_CORRECT: u1,
        padding: u28 = 0,
    }),
    /// point of Y-axis of r channel gamma curve register 1
    /// offset: 0x78
    GAMMA_RY1: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 3 of Y-axis of r channel gamma curve
        GAMMA_R_Y03: u8,
        /// this field configures the point 2 of Y-axis of r channel gamma curve
        GAMMA_R_Y02: u8,
        /// this field configures the point 1 of Y-axis of r channel gamma curve
        GAMMA_R_Y01: u8,
        /// this field configures the point 0 of Y-axis of r channel gamma curve
        GAMMA_R_Y00: u8,
    }),
    /// point of Y-axis of r channel gamma curve register 2
    /// offset: 0x7c
    GAMMA_RY2: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 7 of Y-axis of r channel gamma curve
        GAMMA_R_Y07: u8,
        /// this field configures the point 6 of Y-axis of r channel gamma curve
        GAMMA_R_Y06: u8,
        /// this field configures the point 5 of Y-axis of r channel gamma curve
        GAMMA_R_Y05: u8,
        /// this field configures the point 4 of Y-axis of r channel gamma curve
        GAMMA_R_Y04: u8,
    }),
    /// point of Y-axis of r channel gamma curve register 3
    /// offset: 0x80
    GAMMA_RY3: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 11 of Y-axis of r channel gamma curve
        GAMMA_R_Y0B: u8,
        /// this field configures the point 10 of Y-axis of r channel gamma curve
        GAMMA_R_Y0A: u8,
        /// this field configures the point 9 of Y-axis of r channel gamma curve
        GAMMA_R_Y09: u8,
        /// this field configures the point 8 of Y-axis of r channel gamma curve
        GAMMA_R_Y08: u8,
    }),
    /// point of Y-axis of r channel gamma curve register 4
    /// offset: 0x84
    GAMMA_RY4: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 15 of Y-axis of r channel gamma curve
        GAMMA_R_Y0F: u8,
        /// this field configures the point 14 of Y-axis of r channel gamma curve
        GAMMA_R_Y0E: u8,
        /// this field configures the point 13 of Y-axis of r channel gamma curve
        GAMMA_R_Y0D: u8,
        /// this field configures the point 12 of Y-axis of r channel gamma curve
        GAMMA_R_Y0C: u8,
    }),
    /// point of Y-axis of g channel gamma curve register 1
    /// offset: 0x88
    GAMMA_GY1: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 3 of Y-axis of g channel gamma curve
        GAMMA_G_Y03: u8,
        /// this field configures the point 2 of Y-axis of g channel gamma curve
        GAMMA_G_Y02: u8,
        /// this field configures the point 1 of Y-axis of g channel gamma curve
        GAMMA_G_Y01: u8,
        /// this field configures the point 0 of Y-axis of g channel gamma curve
        GAMMA_G_Y00: u8,
    }),
    /// point of Y-axis of g channel gamma curve register 2
    /// offset: 0x8c
    GAMMA_GY2: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 7 of Y-axis of g channel gamma curve
        GAMMA_G_Y07: u8,
        /// this field configures the point 6 of Y-axis of g channel gamma curve
        GAMMA_G_Y06: u8,
        /// this field configures the point 5 of Y-axis of g channel gamma curve
        GAMMA_G_Y05: u8,
        /// this field configures the point 4 of Y-axis of g channel gamma curve
        GAMMA_G_Y04: u8,
    }),
    /// point of Y-axis of g channel gamma curve register 3
    /// offset: 0x90
    GAMMA_GY3: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 11 of Y-axis of g channel gamma curve
        GAMMA_G_Y0B: u8,
        /// this field configures the point 10 of Y-axis of g channel gamma curve
        GAMMA_G_Y0A: u8,
        /// this field configures the point 9 of Y-axis of g channel gamma curve
        GAMMA_G_Y09: u8,
        /// this field configures the point 8 of Y-axis of g channel gamma curve
        GAMMA_G_Y08: u8,
    }),
    /// point of Y-axis of g channel gamma curve register 4
    /// offset: 0x94
    GAMMA_GY4: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 15 of Y-axis of g channel gamma curve
        GAMMA_G_Y0F: u8,
        /// this field configures the point 14 of Y-axis of g channel gamma curve
        GAMMA_G_Y0E: u8,
        /// this field configures the point 13 of Y-axis of g channel gamma curve
        GAMMA_G_Y0D: u8,
        /// this field configures the point 12 of Y-axis of g channel gamma curve
        GAMMA_G_Y0C: u8,
    }),
    /// point of Y-axis of b channel gamma curve register 1
    /// offset: 0x98
    GAMMA_BY1: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 3 of Y-axis of b channel gamma curve
        GAMMA_B_Y03: u8,
        /// this field configures the point 2 of Y-axis of b channel gamma curve
        GAMMA_B_Y02: u8,
        /// this field configures the point 1 of Y-axis of b channel gamma curve
        GAMMA_B_Y01: u8,
        /// this field configures the point 0 of Y-axis of b channel gamma curve
        GAMMA_B_Y00: u8,
    }),
    /// point of Y-axis of b channel gamma curve register 2
    /// offset: 0x9c
    GAMMA_BY2: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 7 of Y-axis of b channel gamma curve
        GAMMA_B_Y07: u8,
        /// this field configures the point 6 of Y-axis of b channel gamma curve
        GAMMA_B_Y06: u8,
        /// this field configures the point 5 of Y-axis of b channel gamma curve
        GAMMA_B_Y05: u8,
        /// this field configures the point 4 of Y-axis of b channel gamma curve
        GAMMA_B_Y04: u8,
    }),
    /// point of Y-axis of b channel gamma curve register 3
    /// offset: 0xa0
    GAMMA_BY3: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 11 of Y-axis of b channel gamma curve
        GAMMA_B_Y0B: u8,
        /// this field configures the point 10 of Y-axis of b channel gamma curve
        GAMMA_B_Y0A: u8,
        /// this field configures the point 9 of Y-axis of b channel gamma curve
        GAMMA_B_Y09: u8,
        /// this field configures the point 8 of Y-axis of b channel gamma curve
        GAMMA_B_Y08: u8,
    }),
    /// point of Y-axis of b channel gamma curve register 4
    /// offset: 0xa4
    GAMMA_BY4: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 15 of Y-axis of b channel gamma curve
        GAMMA_B_Y0F: u8,
        /// this field configures the point 14 of Y-axis of b channel gamma curve
        GAMMA_B_Y0E: u8,
        /// this field configures the point 13 of Y-axis of b channel gamma curve
        GAMMA_B_Y0D: u8,
        /// this field configures the point 12 of Y-axis of b channel gamma curve
        GAMMA_B_Y0C: u8,
    }),
    /// point of X-axis of r channel gamma curve register 1
    /// offset: 0xa8
    GAMMA_RX1: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 7 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X07: u3,
        /// this field configures the point 6 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X06: u3,
        /// this field configures the point 5 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X05: u3,
        /// this field configures the point 4 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X04: u3,
        /// this field configures the point 3 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X03: u3,
        /// this field configures the point 2 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X02: u3,
        /// this field configures the point 1 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X01: u3,
        /// this field configures the point 0 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X00: u3,
        padding: u8 = 0,
    }),
    /// point of X-axis of r channel gamma curve register 2
    /// offset: 0xac
    GAMMA_RX2: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 15 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X0F: u3,
        /// this field configures the point 14 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X0E: u3,
        /// this field configures the point 13 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X0D: u3,
        /// this field configures the point 12 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X0C: u3,
        /// this field configures the point 11 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X0B: u3,
        /// this field configures the point 10 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X0A: u3,
        /// this field configures the point 9 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X09: u3,
        /// this field configures the point 8 of X-axis of r channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_R_X08: u3,
        padding: u8 = 0,
    }),
    /// point of X-axis of g channel gamma curve register 1
    /// offset: 0xb0
    GAMMA_GX1: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 7 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X07: u3,
        /// this field configures the point 6 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X06: u3,
        /// this field configures the point 5 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X05: u3,
        /// this field configures the point 4 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X04: u3,
        /// this field configures the point 3 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X03: u3,
        /// this field configures the point 2 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X02: u3,
        /// this field configures the point 1 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X01: u3,
        /// this field configures the point 0 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X00: u3,
        padding: u8 = 0,
    }),
    /// point of X-axis of g channel gamma curve register 2
    /// offset: 0xb4
    GAMMA_GX2: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 15 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X0F: u3,
        /// this field configures the point 14 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X0E: u3,
        /// this field configures the point 13 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X0D: u3,
        /// this field configures the point 12 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X0C: u3,
        /// this field configures the point 11 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X0B: u3,
        /// this field configures the point 10 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X0A: u3,
        /// this field configures the point 9 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X09: u3,
        /// this field configures the point 8 of X-axis of g channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_G_X08: u3,
        padding: u8 = 0,
    }),
    /// point of X-axis of b channel gamma curve register 1
    /// offset: 0xb8
    GAMMA_BX1: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 7 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X07: u3,
        /// this field configures the point 6 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X06: u3,
        /// this field configures the point 5 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X05: u3,
        /// this field configures the point 4 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X04: u3,
        /// this field configures the point 3 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X03: u3,
        /// this field configures the point 2 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X02: u3,
        /// this field configures the point 1 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X01: u3,
        /// this field configures the point 0 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X00: u3,
        padding: u8 = 0,
    }),
    /// point of X-axis of b channel gamma curve register 2
    /// offset: 0xbc
    GAMMA_BX2: mmio.Mmio(packed struct(u32) {
        /// this field configures the point 15 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X0F: u3,
        /// this field configures the point 14 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X0E: u3,
        /// this field configures the point 13 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X0D: u3,
        /// this field configures the point 12 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X0C: u3,
        /// this field configures the point 11 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X0B: u3,
        /// this field configures the point 10 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X0A: u3,
        /// this field configures the point 9 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X09: u3,
        /// this field configures the point 8 of X-axis of b channel gamma curve, it represents the power of the distance from the previous point
        GAMMA_B_X08: u3,
        padding: u8 = 0,
    }),
    /// ae control register
    /// offset: 0xc0
    AE_CTRL: mmio.Mmio(packed struct(u32) {
        /// write 1 to this bit triggers one statistic event
        AE_UPDATE: u1,
        /// this field configures ae input data source, 0: data from median, 1: data from gama
        AE_SELECT: u1,
        padding: u30 = 0,
    }),
    /// ae monitor control register
    /// offset: 0xc4
    AE_MONITOR: mmio.Mmio(packed struct(u32) {
        /// this field configures the lower lum threshold of ae monitor
        TL: u8,
        /// this field configures the higher lum threshold of ae monitor
        TH: u8,
        /// this field cnfigures ae monitor frame period
        PERIOD: u6,
        padding: u10 = 0,
    }),
    /// ae window register in x-direction
    /// offset: 0xc8
    AE_BX: mmio.Mmio(packed struct(u32) {
        /// this field configures every block x size
        AE_X_BSIZE: u11,
        /// this field configures first block start x address
        AE_X_START: u11,
        padding: u10 = 0,
    }),
    /// ae window register in y-direction
    /// offset: 0xcc
    AE_BY: mmio.Mmio(packed struct(u32) {
        /// this field configures every block y size
        AE_Y_BSIZE: u11,
        /// this field configures first block start y address
        AE_Y_START: u11,
        padding: u10 = 0,
    }),
    /// ae sub-window pix num register
    /// offset: 0xd0
    AE_WINPIXNUM: mmio.Mmio(packed struct(u32) {
        /// this field configures the pixel number of each sub win
        AE_SUBWIN_PIXNUM: u17,
        padding: u15 = 0,
    }),
    /// reciprocal of ae sub-window pixel number
    /// offset: 0xd4
    AE_WIN_RECIPROCAL: mmio.Mmio(packed struct(u32) {
        /// this field configures the reciprocal of each subwin_pixnum, 20bit fraction
        AE_SUBWIN_RECIP: u20,
        padding: u12 = 0,
    }),
    /// ae statistic result register 0
    /// offset: 0xd8
    AE_BLOCK_MEAN_0: mmio.Mmio(packed struct(u32) {
        /// this field configures block03 Y mean data
        AE_B03_MEAN: u8,
        /// this field configures block02 Y mean data
        AE_B02_MEAN: u8,
        /// this field configures block01 Y mean data
        AE_B01_MEAN: u8,
        /// this field configures block00 Y mean data
        AE_B00_MEAN: u8,
    }),
    /// ae statistic result register 1
    /// offset: 0xdc
    AE_BLOCK_MEAN_1: mmio.Mmio(packed struct(u32) {
        /// this field configures block12 Y mean data
        AE_B12_MEAN: u8,
        /// this field configures block11 Y mean data
        AE_B11_MEAN: u8,
        /// this field configures block10 Y mean data
        AE_B10_MEAN: u8,
        /// this field configures block04 Y mean data
        AE_B04_MEAN: u8,
    }),
    /// ae statistic result register 2
    /// offset: 0xe0
    AE_BLOCK_MEAN_2: mmio.Mmio(packed struct(u32) {
        /// this field configures block21 Y mean data
        AE_B21_MEAN: u8,
        /// this field configures block20 Y mean data
        AE_B20_MEAN: u8,
        /// this field configures block14 Y mean data
        AE_B14_MEAN: u8,
        /// this field configures block13 Y mean data
        AE_B13_MEAN: u8,
    }),
    /// ae statistic result register 3
    /// offset: 0xe4
    AE_BLOCK_MEAN_3: mmio.Mmio(packed struct(u32) {
        /// this field configures block30 Y mean data
        AE_B30_MEAN: u8,
        /// this field configures block24 Y mean data
        AE_B24_MEAN: u8,
        /// this field configures block23 Y mean data
        AE_B23_MEAN: u8,
        /// this field configures block22 Y mean data
        AE_B22_MEAN: u8,
    }),
    /// ae statistic result register 4
    /// offset: 0xe8
    AE_BLOCK_MEAN_4: mmio.Mmio(packed struct(u32) {
        /// this field configures block34 Y mean data
        AE_B34_MEAN: u8,
        /// this field configures block33 Y mean data
        AE_B33_MEAN: u8,
        /// this field configures block32 Y mean data
        AE_B32_MEAN: u8,
        /// this field configures block31 Y mean data
        AE_B31_MEAN: u8,
    }),
    /// ae statistic result register 5
    /// offset: 0xec
    AE_BLOCK_MEAN_5: mmio.Mmio(packed struct(u32) {
        /// this field configures block43 Y mean data
        AE_B43_MEAN: u8,
        /// this field configures block42 Y mean data
        AE_B42_MEAN: u8,
        /// this field configures block41 Y mean data
        AE_B41_MEAN: u8,
        /// this field configures block40 Y mean data
        AE_B40_MEAN: u8,
    }),
    /// ae statistic result register 6
    /// offset: 0xf0
    AE_BLOCK_MEAN_6: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// this field configures block44 Y mean data
        AE_B44_MEAN: u8,
    }),
    /// sharp control register 0
    /// offset: 0xf4
    SHARP_CTRL0: mmio.Mmio(packed struct(u32) {
        /// this field configures sharpen threshold for detail
        SHARP_THRESHOLD_LOW: u8,
        /// this field configures sharpen threshold for edge
        SHARP_THRESHOLD_HIGH: u8,
        /// this field configures sharpen amount for detail
        SHARP_AMOUNT_LOW: u8,
        /// this field configures sharpen amount for edge
        SHARP_AMOUNT_HIGH: u8,
    }),
    /// sharp usm config register 0
    /// offset: 0xf8
    SHARP_FILTER0: mmio.Mmio(packed struct(u32) {
        /// this field configures unsharp masking(usm) filter coefficient
        SHARP_FILTER_COE00: u5,
        /// this field configures usm filter coefficient
        SHARP_FILTER_COE01: u5,
        /// this field configures usm filter coefficient
        SHARP_FILTER_COE02: u5,
        padding: u17 = 0,
    }),
    /// sharp usm config register 1
    /// offset: 0xfc
    SHARP_FILTER1: mmio.Mmio(packed struct(u32) {
        /// this field configures usm filter coefficient
        SHARP_FILTER_COE10: u5,
        /// this field configures usm filter coefficient
        SHARP_FILTER_COE11: u5,
        /// this field configures usm filter coefficient
        SHARP_FILTER_COE12: u5,
        padding: u17 = 0,
    }),
    /// sharp usm config register 2
    /// offset: 0x100
    SHARP_FILTER2: mmio.Mmio(packed struct(u32) {
        /// this field configures usm filter coefficient
        SHARP_FILTER_COE20: u5,
        /// this field configures usm filter coefficient
        SHARP_FILTER_COE21: u5,
        /// this field configures usm filter coefficient
        SHARP_FILTER_COE22: u5,
        padding: u17 = 0,
    }),
    /// sharp pix2matrix ctrl
    /// offset: 0x104
    SHARP_MATRIX_CTRL: mmio.Mmio(packed struct(u32) {
        /// matrix tail pixen low level threshold, should not to large to prevent expanding to next frame, only reg_demosaic_tail_pixen_pulse_th!=0 and reg_demosaic_tail_pixen_pulse_tl!=0 and reg_demosaic_tail_pixen_pulse_th < reg_demosaic_tail_pixen_pulse_tl will enable tail pulse function
        SHARP_TAIL_PIXEN_PULSE_TL: u8,
        /// matrix tail pixen high level threshold, must < hnum-1, only reg_sharp_tail_pixen_pulse_th!=0 and reg_sharp_tail_pixen_pulse_tl!=0 and reg_sharp_tail_pixen_pulse_th < reg_sharp_tail_pixen_pulse_tl will enable tail pulse function
        SHARP_TAIL_PIXEN_PULSE_TH: u8,
        /// this field configures sharp padding data
        SHARP_PADDING_DATA: u8,
        /// this field configures sharp padding mode
        SHARP_PADDING_MODE: u1,
        padding: u7 = 0,
    }),
    /// sharp control register 1
    /// offset: 0x108
    SHARP_CTRL1: mmio.Mmio(packed struct(u32) {
        /// this field configures sharp max gradient, refresh at the end of each frame end
        SHARP_GRADIENT_MAX: u8,
        padding: u24 = 0,
    }),
    /// isp dma source trans control register
    /// offset: 0x10c
    DMA_CNTL: mmio.Mmio(packed struct(u32) {
        /// write 1 to triger dma to get 1 frame
        DMA_EN: u1,
        /// write 1 to update reg_dma_burst_len & reg_dma_data_type
        DMA_UPDATE: u1,
        /// this field configures the idi data type for image data
        DMA_DATA_TYPE: u6,
        /// this field configures dma burst len when data source is dma. set according to dma_msize, it is the number of 64bits in a dma transfer
        DMA_BURST_LEN: u12,
        /// this field configures dma req interval, 12'b1: 1 cycle, 12'b11 2 cycle ...
        DMA_INTERVAL: u12,
    }),
    /// isp dma source total raw number set register
    /// offset: 0x110
    DMA_RAW_DATA: mmio.Mmio(packed struct(u32) {
        /// this field configures the the number of 64bits in a frame
        DMA_RAW_NUM_TOTAL: u22,
        reserved31: u9 = 0,
        /// write 1 to update reg_dma_raw_num_total
        DMA_RAW_NUM_TOTAL_SET: u1,
    }),
    /// isp cam source control register
    /// offset: 0x114
    CAM_CNTL: mmio.Mmio(packed struct(u32) {
        /// write 1 to start recive camera data, write 0 to disable
        CAM_EN: u1,
        /// write 1 to update ISP_CAM_CONF
        CAM_UPDATE: u1,
        /// this bit configures cam clk domain reset, 1: reset cam input logic, 0: release reset
        CAM_RESET: u1,
        /// this bit configures the invertion of cam clk from pad. 0: not invert cam clk, 1: invert cam clk
        CAM_CLK_INV: u1,
        padding: u28 = 0,
    }),
    /// isp cam source config register
    /// offset: 0x118
    CAM_CONF: mmio.Mmio(packed struct(u32) {
        /// this field configures data order of cam port, 0: cam_data_in, 1:{cam_data_in[7:0], cam_data_in[15:8]}
        CAM_DATA_ORDER: u1,
        /// this field configures enable of cam 2 byte mode(input 2 bytes each clock). 0: disable, 1: enable
        CAM_2BYTE_MODE: u1,
        /// this field configures idi data type for image data, 0x2a: RAW8, 0x2b: RAW10, 0x2c: RAW12
        CAM_DATA_TYPE: u6,
        /// this bit configures cam data enable invert. 0: not invert, 1: invert
        CAM_DE_INV: u1,
        /// this bit configures cam hsync invert. 0: not invert, 1: invert
        CAM_HSYNC_INV: u1,
        /// this bit configures cam vsync invert. 0: not invert, 1: invert
        CAM_VSYNC_INV: u1,
        /// this bit configures the number of clock of vsync filter length
        CAM_VSYNC_FILTER_THRES: u3,
        /// this bit configures vsync filter en
        CAM_VSYNC_FILTER_EN: u1,
        padding: u17 = 0,
    }),
    /// af control register 0
    /// offset: 0x11c
    AF_CTRL0: mmio.Mmio(packed struct(u32) {
        /// this bit configures auto_update enable. when set to 1, will update sum and lum each frame
        AF_AUTO_UPDATE: u1,
        reserved4: u3 = 0,
        /// write 1 to this bit will update the sum and lum once
        AF_MANUAL_UPDATE: u1,
        reserved8: u3 = 0,
        /// this field configures env threshold. when both sum and lum changes larger than this value, consider environment changes and need to trigger a new autofocus. 4Bit fractional
        AF_ENV_THRESHOLD: u4,
        reserved16: u4 = 0,
        /// this field configures environment changes detection period (frame). When set to 0, disable this function
        AF_ENV_PERIOD: u8,
        padding: u8 = 0,
    }),
    /// af control register 1
    /// offset: 0x120
    AF_CTRL1: mmio.Mmio(packed struct(u32) {
        /// this field configures pixnum used when calculating the autofocus threshold. Set to 0 to disable threshold calculation
        AF_THPIXNUM: u22,
        padding: u10 = 0,
    }),
    /// af gen threshold control register
    /// offset: 0x124
    AF_GEN_TH_CTRL: mmio.Mmio(packed struct(u32) {
        /// this field configures min threshold when use auto_threshold
        AF_GEN_THRESHOLD_MIN: u16,
        /// this field configures max threshold when use auto_threshold
        AF_GEN_THRESHOLD_MAX: u16,
    }),
    /// af monitor user sum threshold register
    /// offset: 0x128
    AF_ENV_USER_TH_SUM: mmio.Mmio(packed struct(u32) {
        /// this field configures user setup env detect sum threshold
        AF_ENV_USER_THRESHOLD_SUM: u32,
    }),
    /// af monitor user lum threshold register
    /// offset: 0x12c
    AF_ENV_USER_TH_LUM: mmio.Mmio(packed struct(u32) {
        /// this field configures user setup env detect lum threshold
        AF_ENV_USER_THRESHOLD_LUM: u30,
        padding: u2 = 0,
    }),
    /// af threshold register
    /// offset: 0x130
    AF_THRESHOLD: mmio.Mmio(packed struct(u32) {
        /// this field configures user threshold. When set to non-zero, autofocus will use this threshold
        AF_THRESHOLD: u16,
        /// this field represents the last calculated threshold
        AF_GEN_THRESHOLD: u16,
    }),
    /// h-scale of af window a register
    /// offset: 0x134
    AF_HSCALE_A: mmio.Mmio(packed struct(u32) {
        /// this field configures left coordinate of focus window a, must >= 2
        AF_RPOINT_A: u12,
        reserved16: u4 = 0,
        /// this field configures top coordinate of focus window a, must >= 2
        AF_LPOINT_A: u12,
        padding: u4 = 0,
    }),
    /// v-scale of af window a register
    /// offset: 0x138
    AF_VSCALE_A: mmio.Mmio(packed struct(u32) {
        /// this field configures right coordinate of focus window a, must <= hnum-2
        AF_BPOINT_A: u12,
        reserved16: u4 = 0,
        /// this field configures bottom coordinate of focus window a, must <= hnum-2
        AF_TPOINT_A: u12,
        padding: u4 = 0,
    }),
    /// h-scale of af window b register
    /// offset: 0x13c
    AF_HSCALE_B: mmio.Mmio(packed struct(u32) {
        /// this field configures left coordinate of focus window b, must >= 2
        AF_RPOINT_B: u12,
        reserved16: u4 = 0,
        /// this field configures top coordinate of focus window b, must >= 2
        AF_LPOINT_B: u12,
        padding: u4 = 0,
    }),
    /// v-scale of af window b register
    /// offset: 0x140
    AF_VSCALE_B: mmio.Mmio(packed struct(u32) {
        /// this field configures right coordinate of focus window b, must <= hnum-2
        AF_BPOINT_B: u12,
        reserved16: u4 = 0,
        /// this field configures bottom coordinate of focus window b, must <= hnum-2
        AF_TPOINT_B: u12,
        padding: u4 = 0,
    }),
    /// v-scale of af window c register
    /// offset: 0x144
    AF_HSCALE_C: mmio.Mmio(packed struct(u32) {
        /// this field configures left coordinate of focus window c, must >= 2
        AF_RPOINT_C: u12,
        reserved16: u4 = 0,
        /// this field configures top coordinate of focus window c, must >= 2
        AF_LPOINT_C: u12,
        padding: u4 = 0,
    }),
    /// v-scale of af window c register
    /// offset: 0x148
    AF_VSCALE_C: mmio.Mmio(packed struct(u32) {
        /// this field configures right coordinate of focus window c, must <= hnum-2
        AF_BPOINT_C: u12,
        reserved16: u4 = 0,
        /// this field configures bottom coordinate of focus window c, must <= hnum-2
        AF_TPOINT_C: u12,
        padding: u4 = 0,
    }),
    /// result of sum of af window a
    /// offset: 0x14c
    AF_SUM_A: mmio.Mmio(packed struct(u32) {
        /// this field represents the result of accumulation of pix grad of focus window a
        AF_SUMA: u30,
        padding: u2 = 0,
    }),
    /// result of sum of af window b
    /// offset: 0x150
    AF_SUM_B: mmio.Mmio(packed struct(u32) {
        /// this field represents the result of accumulation of pix grad of focus window b
        AF_SUMB: u30,
        padding: u2 = 0,
    }),
    /// result of sum of af window c
    /// offset: 0x154
    AF_SUM_C: mmio.Mmio(packed struct(u32) {
        /// this field represents the result of accumulation of pix grad of focus window c
        AF_SUMC: u30,
        padding: u2 = 0,
    }),
    /// result of lum of af window a
    /// offset: 0x158
    AF_LUM_A: mmio.Mmio(packed struct(u32) {
        /// this field represents the result of accumulation of pix light of focus window a
        AF_LUMA: u28,
        padding: u4 = 0,
    }),
    /// result of lum of af window b
    /// offset: 0x15c
    AF_LUM_B: mmio.Mmio(packed struct(u32) {
        /// this field represents the result of accumulation of pix light of focus window b
        AF_LUMB: u28,
        padding: u4 = 0,
    }),
    /// result of lum of af window c
    /// offset: 0x160
    AF_LUM_C: mmio.Mmio(packed struct(u32) {
        /// this field represents the result of accumulation of pix light of focus window c
        AF_LUMC: u28,
        padding: u4 = 0,
    }),
    /// awb mode control register
    /// offset: 0x164
    AWB_MODE: mmio.Mmio(packed struct(u32) {
        /// this field configures awb algo sel. 00: none sellected. 01: sel algo0. 10: sel algo1. 11: sel both algo0 and algo1
        AWB_MODE: u2,
        reserved4: u2 = 0,
        /// this bit configures awb sample location, 0:before ccm, 1:after ccm
        AWB_SAMPLE: u1,
        padding: u27 = 0,
    }),
    /// h-scale of awb window
    /// offset: 0x168
    AWB_HSCALE: mmio.Mmio(packed struct(u32) {
        /// this field configures awb window right coordinate
        AWB_RPOINT: u12,
        reserved16: u4 = 0,
        /// this field configures awb window left coordinate
        AWB_LPOINT: u12,
        padding: u4 = 0,
    }),
    /// v-scale of awb window
    /// offset: 0x16c
    AWB_VSCALE: mmio.Mmio(packed struct(u32) {
        /// this field configures awb window bottom coordinate
        AWB_BPOINT: u12,
        reserved16: u4 = 0,
        /// this field configures awb window top coordinate
        AWB_TPOINT: u12,
        padding: u4 = 0,
    }),
    /// awb lum threshold register
    /// offset: 0x170
    AWB_TH_LUM: mmio.Mmio(packed struct(u32) {
        /// this field configures lower threshold of r+g+b
        AWB_MIN_LUM: u10,
        reserved16: u6 = 0,
        /// this field configures upper threshold of r+g+b
        AWB_MAX_LUM: u10,
        padding: u6 = 0,
    }),
    /// awb r/g threshold register
    /// offset: 0x174
    AWB_TH_RG: mmio.Mmio(packed struct(u32) {
        /// this field configures lower threshold of r/g, 2bit integer and 8bit fraction
        AWB_MIN_RG: u10,
        reserved16: u6 = 0,
        /// this field configures upper threshold of r/g, 2bit integer and 8bit fraction
        AWB_MAX_RG: u10,
        padding: u6 = 0,
    }),
    /// awb b/g threshold register
    /// offset: 0x178
    AWB_TH_BG: mmio.Mmio(packed struct(u32) {
        /// this field configures lower threshold of b/g, 2bit integer and 8bit fraction
        AWB_MIN_BG: u10,
        reserved16: u6 = 0,
        /// this field configures upper threshold of b/g, 2bit integer and 8bit fraction
        AWB_MAX_BG: u10,
        padding: u6 = 0,
    }),
    /// result of awb white point number
    /// offset: 0x17c
    AWB0_WHITE_CNT: mmio.Mmio(packed struct(u32) {
        /// this field configures number of white point detected of algo0
        AWB0_WHITE_CNT: u24,
        padding: u8 = 0,
    }),
    /// result of accumulate of r channel of all white points
    /// offset: 0x180
    AWB0_ACC_R: mmio.Mmio(packed struct(u32) {
        /// this field represents accumulate of channel r of all white point of algo0
        AWB0_ACC_R: u32,
    }),
    /// result of accumulate of g channel of all white points
    /// offset: 0x184
    AWB0_ACC_G: mmio.Mmio(packed struct(u32) {
        /// this field represents accumulate of channel g of all white point of algo0
        AWB0_ACC_G: u32,
    }),
    /// result of accumulate of b channel of all white points
    /// offset: 0x188
    AWB0_ACC_B: mmio.Mmio(packed struct(u32) {
        /// this field represents accumulate of channel b of all white point of algo0
        AWB0_ACC_B: u32,
    }),
    /// color control register
    /// offset: 0x18c
    COLOR_CTRL: mmio.Mmio(packed struct(u32) {
        /// this field configures the color saturation value
        COLOR_SATURATION: u8,
        /// this field configures the color hue angle
        COLOR_HUE: u8,
        /// this field configures the color contrast value
        COLOR_CONTRAST: u8,
        /// this field configures the color brightness value, signed 2's complement
        COLOR_BRIGHTNESS: u8,
    }),
    /// blc black level register
    /// offset: 0x190
    BLC_VALUE: mmio.Mmio(packed struct(u32) {
        /// this field configures the black level of bottom right channel of bayer img
        BLC_R3_VALUE: u8,
        /// this field configures the black level of bottom left channel of bayer img
        BLC_R2_VALUE: u8,
        /// this field configures the black level of top right channel of bayer img
        BLC_R1_VALUE: u8,
        /// this field configures the black level of top left channel of bayer img
        BLC_R0_VALUE: u8,
    }),
    /// blc stretch control register
    /// offset: 0x194
    BLC_CTRL0: mmio.Mmio(packed struct(u32) {
        /// this bit configures the stretch feature of bottom right channel. 0: stretch disable, 1: stretch enable
        BLC_R3_STRETCH: u1,
        /// this bit configures the stretch feature of bottom left channel. 0: stretch disable, 1: stretch enable
        BLC_R2_STRETCH: u1,
        /// this bit configures the stretch feature of top right channel. 0: stretch disable, 1: stretch enable
        BLC_R1_STRETCH: u1,
        /// this bit configures the stretch feature of top left channel. 0: stretch disable, 1: stretch enable
        BLC_R0_STRETCH: u1,
        padding: u28 = 0,
    }),
    /// blc window control register
    /// offset: 0x198
    BLC_CTRL1: mmio.Mmio(packed struct(u32) {
        /// this field configures blc average calculation window top
        BLC_WINDOW_TOP: u11,
        /// this field configures blc average calculation window left
        BLC_WINDOW_LEFT: u11,
        /// this field configures blc average calculation window vnum
        BLC_WINDOW_VNUM: u4,
        /// this field configures blc average calculation window hnum
        BLC_WINDOW_HNUM: u4,
        /// this bit configures enable blc average input filter. 0: disable, 1: enable
        BLC_FILTER_EN: u1,
        padding: u1 = 0,
    }),
    /// blc black threshold control register
    /// offset: 0x19c
    BLC_CTRL2: mmio.Mmio(packed struct(u32) {
        /// this field configures black threshold when get blc average of bottom right channel
        BLC_R3_TH: u8,
        /// this field configures black threshold when get blc average of bottom left channel
        BLC_R2_TH: u8,
        /// this field configures black threshold when get blc average of top right channel
        BLC_R1_TH: u8,
        /// this field configures black threshold when get blc average of top left channel
        BLC_R0_TH: u8,
    }),
    /// results of the average of black window
    /// offset: 0x1a0
    BLC_MEAN: mmio.Mmio(packed struct(u32) {
        /// this field represents the average black value of bottom right channel
        BLC_R3_MEAN: u8,
        /// this field represents the average black value of bottom left channel
        BLC_R2_MEAN: u8,
        /// this field represents the average black value of top right channel
        BLC_R1_MEAN: u8,
        /// this field represents the average black value of top left channel
        BLC_R0_MEAN: u8,
    }),
    /// histogram mode control register
    /// offset: 0x1a4
    HIST_MODE: mmio.Mmio(packed struct(u32) {
        /// this field configures statistic mode. 0: RAW_B, 1: RAW_GB, 2: RAW_GR 3: RAW_R, 4: RGB, 5:YUV_Y, 6:YUV_U, 7:YUV_V
        HIST_MODE: u3,
        padding: u29 = 0,
    }),
    /// histogram rgb to gray coefficients register
    /// offset: 0x1a8
    HIST_COEFF: mmio.Mmio(packed struct(u32) {
        /// this field configures coefficient of B when set hist_mode to RGB, sum of coeff_r and coeff_g and coeff_b should be 256
        B: u8,
        /// this field configures coefficient of G when set hist_mode to RGB, sum of coeff_r and coeff_g and coeff_b should be 256
        G: u8,
        /// this field configures coefficient of R when set hist_mode to RGB, sum of coeff_r and coeff_g and coeff_b should be 256
        R: u8,
        padding: u8 = 0,
    }),
    /// histogram window offsets register
    /// offset: 0x1ac
    HIST_OFFS: mmio.Mmio(packed struct(u32) {
        /// this field configures y coordinate of first window
        HIST_Y_OFFS: u12,
        reserved16: u4 = 0,
        /// this field configures x coordinate of first window
        HIST_X_OFFS: u12,
        padding: u4 = 0,
    }),
    /// histogram sub-window size register
    /// offset: 0x1b0
    HIST_SIZE: mmio.Mmio(packed struct(u32) {
        /// this field configures y direction size of subwindow
        HIST_Y_SIZE: u9,
        reserved16: u7 = 0,
        /// this field configures x direction size of subwindow
        HIST_X_SIZE: u9,
        padding: u7 = 0,
    }),
    /// histogram bin control register 0
    /// offset: 0x1b4
    HIST_SEG0: mmio.Mmio(packed struct(u32) {
        /// this field configures threshold of histogram bin 3 and bin 4
        HIST_SEG_3_4: u8,
        /// this field configures threshold of histogram bin 2 and bin 3
        HIST_SEG_2_3: u8,
        /// this field configures threshold of histogram bin 1 and bin 2
        HIST_SEG_1_2: u8,
        /// this field configures threshold of histogram bin 0 and bin 1
        HIST_SEG_0_1: u8,
    }),
    /// histogram bin control register 1
    /// offset: 0x1b8
    HIST_SEG1: mmio.Mmio(packed struct(u32) {
        /// this field configures threshold of histogram bin 7 and bin 8
        HIST_SEG_7_8: u8,
        /// this field configures threshold of histogram bin 6 and bin 7
        HIST_SEG_6_7: u8,
        /// this field configures threshold of histogram bin 5 and bin 6
        HIST_SEG_5_6: u8,
        /// this field configures threshold of histogram bin 4 and bin 5
        HIST_SEG_4_5: u8,
    }),
    /// histogram bin control register 2
    /// offset: 0x1bc
    HIST_SEG2: mmio.Mmio(packed struct(u32) {
        /// this field configures threshold of histogram bin 11 and bin 12
        HIST_SEG_11_12: u8,
        /// this field configures threshold of histogram bin 10 and bin 11
        HIST_SEG_10_11: u8,
        /// this field configures threshold of histogram bin 9 and bin 10
        HIST_SEG_9_10: u8,
        /// this field configures threshold of histogram bin 8 and bin 9
        HIST_SEG_8_9: u8,
    }),
    /// histogram bin control register 3
    /// offset: 0x1c0
    HIST_SEG3: mmio.Mmio(packed struct(u32) {
        /// this field configures threshold of histogram bin 14 and bin 15
        HIST_SEG_14_15: u8,
        /// this field configures threshold of histogram bin 13 and bin 14
        HIST_SEG_13_14: u8,
        /// this field configures threshold of histogram bin 12 and bin 13
        HIST_SEG_12_13: u8,
        padding: u8 = 0,
    }),
    /// histogram sub-window weight register 0
    /// offset: 0x1c4
    HIST_WEIGHT0: mmio.Mmio(packed struct(u32) {
        /// this field configures weight of subwindow 03
        HIST_WEIGHT_03: u8,
        /// this field configures weight of subwindow 02
        HIST_WEIGHT_02: u8,
        /// this field configures weight of subwindow 01
        HIST_WEIGHT_01: u8,
        /// this field configures weight of subwindow 00 and sum of all weight should be 256
        HIST_WEIGHT_00: u8,
    }),
    /// histogram sub-window weight register 1
    /// offset: 0x1c8
    HIST_WEIGHT1: mmio.Mmio(packed struct(u32) {
        /// this field configures weight of subwindow 12
        HIST_WEIGHT_12: u8,
        /// this field configures weight of subwindow 11
        HIST_WEIGHT_11: u8,
        /// this field configures weight of subwindow 10
        HIST_WEIGHT_10: u8,
        /// this field configures weight of subwindow 04
        HIST_WEIGHT_04: u8,
    }),
    /// histogram sub-window weight register 2
    /// offset: 0x1cc
    HIST_WEIGHT2: mmio.Mmio(packed struct(u32) {
        /// this field configures weight of subwindow 21
        HIST_WEIGHT_21: u8,
        /// this field configures weight of subwindow 20
        HIST_WEIGHT_20: u8,
        /// this field configures weight of subwindow 04
        HIST_WEIGHT_14: u8,
        /// this field configures weight of subwindow 13
        HIST_WEIGHT_13: u8,
    }),
    /// histogram sub-window weight register 3
    /// offset: 0x1d0
    HIST_WEIGHT3: mmio.Mmio(packed struct(u32) {
        /// this field configures weight of subwindow 30
        HIST_WEIGHT_30: u8,
        /// this field configures weight of subwindow 24
        HIST_WEIGHT_24: u8,
        /// this field configures weight of subwindow 23
        HIST_WEIGHT_23: u8,
        /// this field configures weight of subwindow 22
        HIST_WEIGHT_22: u8,
    }),
    /// histogram sub-window weight register 4
    /// offset: 0x1d4
    HIST_WEIGHT4: mmio.Mmio(packed struct(u32) {
        /// this field configures weight of subwindow 34
        HIST_WEIGHT_34: u8,
        /// this field configures weight of subwindow 33
        HIST_WEIGHT_33: u8,
        /// this field configures weight of subwindow 32
        HIST_WEIGHT_32: u8,
        /// this field configures weight of subwindow 31
        HIST_WEIGHT_31: u8,
    }),
    /// histogram sub-window weight register 5
    /// offset: 0x1d8
    HIST_WEIGHT5: mmio.Mmio(packed struct(u32) {
        /// this field configures weight of subwindow 43
        HIST_WEIGHT_43: u8,
        /// this field configures weight of subwindow 42
        HIST_WEIGHT_42: u8,
        /// this field configures weight of subwindow 41
        HIST_WEIGHT_41: u8,
        /// this field configures weight of subwindow 40
        HIST_WEIGHT_40: u8,
    }),
    /// histogram sub-window weight register 6
    /// offset: 0x1dc
    HIST_WEIGHT6: mmio.Mmio(packed struct(u32) {
        /// this field configures weight of subwindow 44
        HIST_WEIGHT_44: u8,
        padding: u24 = 0,
    }),
    /// result of histogram bin 0
    /// offset: 0x1e0
    HIST_BIN0: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 0
        HIST_BIN_0: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 1
    /// offset: 0x1e4
    HIST_BIN1: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 1
        HIST_BIN_1: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 2
    /// offset: 0x1e8
    HIST_BIN2: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 2
        HIST_BIN_2: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 3
    /// offset: 0x1ec
    HIST_BIN3: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 3
        HIST_BIN_3: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 4
    /// offset: 0x1f0
    HIST_BIN4: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 4
        HIST_BIN_4: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 5
    /// offset: 0x1f4
    HIST_BIN5: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 5
        HIST_BIN_5: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 6
    /// offset: 0x1f8
    HIST_BIN6: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 6
        HIST_BIN_6: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 7
    /// offset: 0x1fc
    HIST_BIN7: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 7
        HIST_BIN_7: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 8
    /// offset: 0x200
    HIST_BIN8: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 8
        HIST_BIN_8: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 9
    /// offset: 0x204
    HIST_BIN9: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 9
        HIST_BIN_9: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 10
    /// offset: 0x208
    HIST_BIN10: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 10
        HIST_BIN_10: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 11
    /// offset: 0x20c
    HIST_BIN11: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 11
        HIST_BIN_11: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 12
    /// offset: 0x210
    HIST_BIN12: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 12
        HIST_BIN_12: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 13
    /// offset: 0x214
    HIST_BIN13: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 13
        HIST_BIN_13: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 14
    /// offset: 0x218
    HIST_BIN14: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 14
        HIST_BIN_14: u17,
        padding: u15 = 0,
    }),
    /// result of histogram bin 15
    /// offset: 0x21c
    HIST_BIN15: mmio.Mmio(packed struct(u32) {
        /// this field represents result of histogram bin 15
        HIST_BIN_15: u17,
        padding: u15 = 0,
    }),
    /// mem aux control register 0
    /// offset: 0x220
    MEM_AUX_CTRL_0: mmio.Mmio(packed struct(u32) {
        /// this field configures the mem_aux of isp input buffer memory
        HEADER_MEM_AUX_CTRL: u14,
        reserved16: u2 = 0,
        /// this field represents this field configures the mem_aux of dpc lut memory
        DPC_LUT_MEM_AUX_CTRL: u14,
        padding: u2 = 0,
    }),
    /// mem aux control register 1
    /// offset: 0x224
    MEM_AUX_CTRL_1: mmio.Mmio(packed struct(u32) {
        /// this field configures the mem_aux of lsc r gr lut memory
        LSC_LUT_R_GR_MEM_AUX_CTRL: u14,
        reserved16: u2 = 0,
        /// this field configures the mem_aux of lsc gb b lut memory
        LSC_LUT_GB_B_MEM_AUX_CTRL: u14,
        padding: u2 = 0,
    }),
    /// mem aux control register 2
    /// offset: 0x228
    MEM_AUX_CTRL_2: mmio.Mmio(packed struct(u32) {
        /// this field configures the mem_aux of bf line buffer memory
        BF_MATRIX_MEM_AUX_CTRL: u14,
        reserved16: u2 = 0,
        /// this field configures the mem_aux of dpc line buffer memory
        DPC_MATRIX_MEM_AUX_CTRL: u14,
        padding: u2 = 0,
    }),
    /// mem aux control register 3
    /// offset: 0x22c
    MEM_AUX_CTRL_3: mmio.Mmio(packed struct(u32) {
        /// this field configures the mem_aux of sharp y line buffer memory
        SHARP_MATRIX_Y_MEM_AUX_CTRL: u14,
        reserved16: u2 = 0,
        /// this field configures the mem_aux of demosaic line buffer memory
        DEMOSAIC_MATRIX_MEM_AUX_CTRL: u14,
        padding: u2 = 0,
    }),
    /// mem aux control register 4
    /// offset: 0x230
    MEM_AUX_CTRL_4: mmio.Mmio(packed struct(u32) {
        /// this field configures the mem_aux of sharp uv line buffer memory
        SHARP_MATRIX_UV_MEM_AUX_CTRL: u14,
        padding: u18 = 0,
    }),
    /// yuv format control register
    /// offset: 0x234
    YUV_FORMAT: mmio.Mmio(packed struct(u32) {
        /// this bit configures the yuv mode. 0: ITU-R BT.601, 1: ITU-R BT.709
        YUV_MODE: u1,
        /// this bit configures the yuv range. 0: full range, 1: limit range
        YUV_RANGE: u1,
        padding: u30 = 0,
    }),
    /// rdn eco cs register
    /// offset: 0x238
    RDN_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// rdn_eco_en
        RDN_ECO_EN: u1,
        /// rdn_eco_result
        RDN_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
    /// rdn eco all low register
    /// offset: 0x23c
    RDN_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// rdn_eco_low
        RDN_ECO_LOW: u32,
    }),
    /// rdn eco all high register
    /// offset: 0x240
    RDN_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// rdn_eco_high
        RDN_ECO_HIGH: u32,
    }),
};
