const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Camera/LCD Controller
pub const LCD_CAM = extern struct {
    /// LCD clock config register.
    /// offset: 0x00
    LCD_CLOCK: mmio.Mmio(packed struct(u32) {
        /// f_LCD_PCLK = f_LCD_CLK / (reg_clkcnt_N + 1) when reg_clk_equ_sysclk is 0.
        LCD_CLKCNT_N: u6,
        /// 1: f_LCD_PCLK = f_LCD_CLK. 0: f_LCD_PCLK = f_LCD_CLK / (reg_clkcnt_N + 1).
        LCD_CLK_EQU_SYSCLK: u1,
        /// 1: LCD_PCLK line is high when idle 0: LCD_PCLK line is low when idle.
        LCD_CK_IDLE_EDGE: u1,
        /// 1: LCD_PCLK line is high in the first half data cycle. 0: LCD_PCLK line is low in the second half data cycle.
        LCD_CK_OUT_EDGE: u1,
        /// Integral LCD clock divider value
        LCD_CLKM_DIV_NUM: u8,
        /// Fractional clock divider numerator value
        LCD_CLKM_DIV_B: u6,
        /// Fractional clock divider denominator value
        LCD_CLKM_DIV_A: u6,
        /// Select LCD module source clock. 0: no clock. 1: APLL. 2: CLK160. 3: no clock.
        LCD_CLK_SEL: u2,
        /// Set this bit to enable clk gate
        CLK_EN: u1,
    }),
    /// CAM config register.
    /// offset: 0x04
    CAM_CTRL: mmio.Mmio(packed struct(u32) {
        /// Camera stop enable signal, 1: camera stops when DMA Rx FIFO is full. 0: Not stop.
        CAM_STOP_EN: u1,
        /// Filter threshold value for CAM_VSYNC signal.
        CAM_VSYNC_FILTER_THRES: u3,
        /// 1: Update Camera registers, will be cleared by hardware. 0 : Not care.
        CAM_UPDATE: u1,
        /// 1: Change data bit order, change CAM_DATA_in[7:0] to CAM_DATA_in[0:7] in one byte mode, and bits[15:0] to bits[0:15] in two byte mode. 0: Not change.
        CAM_BYTE_ORDER: u1,
        /// 1: invert data byte order, only valid in 2 byte mode. 0: Not change.
        CAM_BIT_ORDER: u1,
        /// 1: Enable to generate CAM_HS_INT. 0: Disable.
        CAM_LINE_INT_EN: u1,
        /// 1: CAM_VSYNC to generate in_suc_eof. 0: in_suc_eof is controlled by reg_cam_rec_data_cyclelen.
        CAM_VS_EOF_EN: u1,
        /// Integral Camera clock divider value
        CAM_CLKM_DIV_NUM: u8,
        /// Fractional clock divider numerator value
        CAM_CLKM_DIV_B: u6,
        /// Fractional clock divider denominator value
        CAM_CLKM_DIV_A: u6,
        /// Select Camera module source clock. 0: no clock. 1: APLL. 2: CLK160. 3: no clock.
        CAM_CLK_SEL: u2,
        padding: u1 = 0,
    }),
    /// CAM config register.
    /// offset: 0x08
    CAM_CTRL1: mmio.Mmio(packed struct(u32) {
        /// Camera receive data byte length minus 1 to set DMA in_suc_eof_int.
        CAM_REC_DATA_BYTELEN: u16,
        /// The line number minus 1 to generate cam_hs_int.
        CAM_LINE_INT_NUM: u6,
        /// 1: Invert the input signal CAM_PCLK. 0: Not invert.
        CAM_CLK_INV: u1,
        /// 1: Enable CAM_VSYNC filter function. 0: bypass.
        CAM_VSYNC_FILTER_EN: u1,
        /// 1: The bit number of input data is 9~16. 0: The bit number of input data is 0~8.
        CAM_2BYTE_EN: u1,
        /// CAM_DE invert enable signal, valid in high level.
        CAM_DE_INV: u1,
        /// CAM_HSYNC invert enable signal, valid in high level.
        CAM_HSYNC_INV: u1,
        /// CAM_VSYNC invert enable signal, valid in high level.
        CAM_VSYNC_INV: u1,
        /// 1: Input control signals are CAM_DE CAM_HSYNC and CAM_VSYNC. 0: Input control signals are CAM_DE and CAM_VSYNC.
        CAM_VH_DE_MODE_EN: u1,
        /// Camera module start signal.
        CAM_START: u1,
        /// Camera module reset signal.
        CAM_RESET: u1,
        /// Camera AFIFO reset signal.
        CAM_AFIFO_RESET: u1,
    }),
    /// CAM YUV/RGB converter configuration register.
    /// offset: 0x0c
    CAM_RGB_YUV: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// 1:invert every two 8bits input data. 2. disabled.
        CAM_CONV_8BITS_DATA_INV: u1,
        /// 0: to yuv422. 1: to yuv420. 2: to yuv411. 3: disabled. To enable yuv2yuv mode, trans_mode must be set to 1.
        CAM_CONV_YUV2YUV_MODE: u2,
        /// 0: yuv422. 1: yuv420. 2: yuv411. When in yuv2yuv mode, yuv_mode decides the yuv mode of Data_in
        CAM_CONV_YUV_MODE: u2,
        /// 0:BT601. 1:BT709.
        CAM_CONV_PROTOCOL_MODE: u1,
        /// LIMIT or FULL mode of Data out. 0: limit. 1: full
        CAM_CONV_DATA_OUT_MODE: u1,
        /// LIMIT or FULL mode of Data in. 0: limit. 1: full
        CAM_CONV_DATA_IN_MODE: u1,
        /// 0: 16bits mode. 1: 8bits mode.
        CAM_CONV_MODE_8BITS_ON: u1,
        /// 0: YUV to RGB. 1: RGB to YUV.
        CAM_CONV_TRANS_MODE: u1,
        /// 0: Bypass converter. 1: Enable converter.
        CAM_CONV_ENABLE: u1,
    }),
    /// LCD YUV/RGB converter configuration register.
    /// offset: 0x10
    LCD_RGB_YUV: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// 1:invert every two 8bits input data. 2. disabled.
        LCD_CONV_8BITS_DATA_INV: u1,
        /// 0: txtorx mode off. 1: txtorx mode on.
        LCD_CONV_TXTORX: u1,
        /// 0: to yuv422. 1: to yuv420. 2: to yuv411. 3: disabled. To enable yuv2yuv mode, trans_mode must be set to 1.
        LCD_CONV_YUV2YUV_MODE: u2,
        /// 0: yuv422. 1: yuv420. 2: yuv411. When in yuv2yuv mode, yuv_mode decides the yuv mode of Data_in
        LCD_CONV_YUV_MODE: u2,
        /// 0:BT601. 1:BT709.
        LCD_CONV_PROTOCOL_MODE: u1,
        /// LIMIT or FULL mode of Data out. 0: limit. 1: full
        LCD_CONV_DATA_OUT_MODE: u1,
        /// LIMIT or FULL mode of Data in. 0: limit. 1: full
        LCD_CONV_DATA_IN_MODE: u1,
        /// 0: 16bits mode. 1: 8bits mode.
        LCD_CONV_MODE_8BITS_ON: u1,
        /// 0: YUV to RGB. 1: RGB to YUV.
        LCD_CONV_TRANS_MODE: u1,
        /// 0: Bypass converter. 1: Enable converter.
        LCD_CONV_ENABLE: u1,
    }),
    /// LCD config register.
    /// offset: 0x14
    LCD_USER: mmio.Mmio(packed struct(u32) {
        /// The output data cycles minus 1 of LCD module.
        LCD_DOUT_CYCLELEN: u13,
        /// LCD always output when LCD is in LCD_DOUT state, unless reg_lcd_start is cleared or reg_lcd_reset is set.
        LCD_ALWAYS_OUT_EN: u1,
        /// 0: ABAB->BABA. 1: ABC->ACB. 2: ABC->BAC. 3: ABC->BCA. 4:ABC->CAB. 5:ABC->CBA
        LCD_DOUT_BYTE_SWIZZLE_MODE: u3,
        /// 1: enable byte swizzle 0: disable
        LCD_DOUT_BYTE_SWIZZLE_ENABLE: u1,
        /// 1: change bit order in every byte. 0: Not change.
        LCD_DOUT_BIT_ORDER: u1,
        /// 2: 24bit mode. 1: 16bit mode. 0: 8bit mode
        LCD_BYTE_MODE: u2,
        /// 1: Update LCD registers, will be cleared by hardware. 0 : Not care.
        LCD_UPDATE: u1,
        /// 1: Change data bit order, change LCD_DATA_out[7:0] to LCD_DATA_out[0:7] in one byte mode, and bits[15:0] to bits[0:15] in two byte mode. 0: Not change.
        LCD_BIT_ORDER: u1,
        /// 1: invert data byte order, only valid in 2 byte mode. 0: Not change.
        LCD_BYTE_ORDER: u1,
        /// 1: Be able to send data out in LCD sequence when LCD starts. 0: Disable.
        LCD_DOUT: u1,
        /// 1: Enable DUMMY phase in LCD sequence when LCD starts. 0: Disable.
        LCD_DUMMY: u1,
        /// 1: Be able to send command in LCD sequence when LCD starts. 0: Disable.
        LCD_CMD: u1,
        /// LCD start sending data enable signal, valid in high level.
        LCD_START: u1,
        /// The value of command.
        LCD_RESET: u1,
        /// The dummy cycle length minus 1.
        LCD_DUMMY_CYCLELEN: u2,
        /// The cycle length of command phase. 1: 2 cycles. 0: 1 cycle.
        LCD_CMD_2_CYCLE_EN: u1,
    }),
    /// LCD config register.
    /// offset: 0x18
    LCD_MISC: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// The wire width of LCD output. 0: 8bit. 1: 16bit 2: 24bit
        LCD_WIRE_MODE: u2,
        /// The setup cycle length minus 1 in LCD non-RGB mode.
        LCD_VFK_CYCLELEN: u6,
        /// The vertical back blank region cycle length minus 1 in LCD RGB mode, or the hold time cycle length in LCD non-RGB mode.
        LCD_VBK_CYCLELEN: u13,
        /// 1: Send the next frame data when the current frame is sent out. 0: LCD stops when the current frame is sent out.
        LCD_NEXT_FRAME_EN: u1,
        /// 1: Enable blank region when LCD sends data out. 0: No blank region.
        LCD_BK_EN: u1,
        /// LCD AFIFO reset signal.
        LCD_AFIFO_RESET: u1,
        /// 1: LCD_CD = !reg_cd_idle_edge when lcd_st[2:0] is in LCD_DOUT state. 0: LCD_CD = reg_cd_idle_edge.
        LCD_CD_DATA_SET: u1,
        /// 1: LCD_CD = !reg_cd_idle_edge when lcd_st[2:0] is in LCD_DUMMY state. 0: LCD_CD = reg_cd_idle_edge.
        LCD_CD_DUMMY_SET: u1,
        /// 1: LCD_CD = !reg_cd_idle_edge when lcd_st[2:0] is in LCD_CMD state. 0: LCD_CD = reg_cd_idle_edge.
        LCD_CD_CMD_SET: u1,
        /// The default value of LCD_CD.
        LCD_CD_IDLE_EDGE: u1,
    }),
    /// LCD config register.
    /// offset: 0x1c
    LCD_CTRL: mmio.Mmio(packed struct(u32) {
        /// It is the horizontal blank front porch of a frame.
        LCD_HB_FRONT: u11,
        /// It is the vertical active height of a frame.
        LCD_VA_HEIGHT: u10,
        /// It is the vertical total height of a frame.
        LCD_VT_HEIGHT: u10,
        /// 1: Enable LCD RGB mode. 0: Disable LCD RGB mode.
        LCD_RGB_MODE_EN: u1,
    }),
    /// LCD config register.
    /// offset: 0x20
    LCD_CTRL1: mmio.Mmio(packed struct(u32) {
        /// It is the vertical blank front porch of a frame.
        LCD_VB_FRONT: u8,
        /// It is the horizontal active width of a frame.
        LCD_HA_WIDTH: u12,
        /// It is the horizontal total width of a frame.
        LCD_HT_WIDTH: u12,
    }),
    /// LCD config register.
    /// offset: 0x24
    LCD_CTRL2: mmio.Mmio(packed struct(u32) {
        /// It is the position of LCD_VSYNC active pulse in a line.
        LCD_VSYNC_WIDTH: u7,
        /// It is the idle value of LCD_VSYNC.
        LCD_VSYNC_IDLE_POL: u1,
        /// It is the idle value of LCD_DE.
        LCD_DE_IDLE_POL: u1,
        /// 1: The pulse of LCD_HSYNC is out in vertical blanking lines RGB mode. 0: LCD_HSYNC pulse is valid only in active region lines in RGB mode.
        LCD_HS_BLANK_EN: u1,
        reserved16: u6 = 0,
        /// It is the position of LCD_HSYNC active pulse in a line.
        LCD_HSYNC_WIDTH: u7,
        /// It is the idle value of LCD_HSYNC.
        LCD_HSYNC_IDLE_POL: u1,
        /// It is the position of LCD_HSYNC active pulse in a line.
        LCD_HSYNC_POSITION: u8,
    }),
    /// LCD config register.
    /// offset: 0x28
    LCD_FIRST_CMD_VAL: mmio.Mmio(packed struct(u32) {
        /// The LCD write command value of first cmd cycle.
        LCD_FIRST_CMD_VALUE: u32,
    }),
    /// LCD config register.
    /// offset: 0x2c
    LCD_LATTER_CMD_VAL: mmio.Mmio(packed struct(u32) {
        /// The LCD write command value of latter cmd cycle.
        LCD_LATTER_CMD_VALUE: u32,
    }),
    /// LCD config register.
    /// offset: 0x30
    LCD_DLY_MODE_CFG1: mmio.Mmio(packed struct(u32) {
        /// The output data bit 0 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT16_MODE: u2,
        /// The output data bit 2 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT17_MODE: u2,
        /// The output data bit 4 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT18_MODE: u2,
        /// The output data bit 6 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT19_MODE: u2,
        /// The output data bit 8 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT20_MODE: u2,
        /// The output data bit 10 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT21_MODE: u2,
        /// The output data bit 12 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT22_MODE: u2,
        /// The output data bit 14 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT23_MODE: u2,
        /// The output LCD_CD is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        LCD_CD_MODE: u2,
        /// The output LCD_DE is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        LCD_DE_MODE: u2,
        /// The output LCD_HSYNC is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        LCD_HSYNC_MODE: u2,
        /// The output LCD_VSYNC is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        LCD_VSYNC_MODE: u2,
        padding: u8 = 0,
    }),
    /// offset: 0x34
    reserved52: [4]u8,
    /// LCD config register.
    /// offset: 0x38
    LCD_DLY_MODE_CFG2: mmio.Mmio(packed struct(u32) {
        /// The output data bit 0 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT0_MODE: u2,
        /// The output data bit 2 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT1_MODE: u2,
        /// The output data bit 4 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT2_MODE: u2,
        /// The output data bit 6 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT3_MODE: u2,
        /// The output data bit 8 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT4_MODE: u2,
        /// The output data bit 10 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT5_MODE: u2,
        /// The output data bit 12 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT6_MODE: u2,
        /// The output data bit 14 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT7_MODE: u2,
        /// The output data bit 16 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT8_MODE: u2,
        /// The output data bit 18 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT9_MODE: u2,
        /// The output data bit 20 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT10_MODE: u2,
        /// The output data bit 22 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT11_MODE: u2,
        /// The output data bit 24 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT12_MODE: u2,
        /// The output data bit 26 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT13_MODE: u2,
        /// The output data bit 28 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT14_MODE: u2,
        /// The output data bit 30 is delayed by module clock LCD_CLK. 0: output without delayed. 1: delay by the positive edge of LCD_CLK. 2: delay by the negative edge of LCD_CLK.
        DOUT15_MODE: u2,
    }),
    /// offset: 0x3c
    reserved60: [40]u8,
    /// LCDCAM interrupt enable register.
    /// offset: 0x64
    LC_DMA_INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The enable bit for LCD frame end interrupt.
        LCD_VSYNC_INT_ENA: u1,
        /// The enable bit for lcd transfer end interrupt.
        LCD_TRANS_DONE_INT_ENA: u1,
        /// The enable bit for Camera frame end interrupt.
        CAM_VSYNC_INT_ENA: u1,
        /// The enable bit for Camera line interrupt.
        CAM_HS_INT_ENA: u1,
        padding: u28 = 0,
    }),
    /// LCDCAM interrupt raw register, valid in level.
    /// offset: 0x68
    LC_DMA_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw bit for LCD frame end interrupt.
        LCD_VSYNC_INT_RAW: u1,
        /// The raw bit for lcd transfer end interrupt.
        LCD_TRANS_DONE_INT_RAW: u1,
        /// The raw bit for Camera frame end interrupt.
        CAM_VSYNC_INT_RAW: u1,
        /// The raw bit for Camera line interrupt.
        CAM_HS_INT_RAW: u1,
        padding: u28 = 0,
    }),
    /// LCDCAM interrupt status register.
    /// offset: 0x6c
    LC_DMA_INT_ST: mmio.Mmio(packed struct(u32) {
        /// The status bit for LCD frame end interrupt.
        LCD_VSYNC_INT_ST: u1,
        /// The status bit for lcd transfer end interrupt.
        LCD_TRANS_DONE_INT_ST: u1,
        /// The status bit for Camera frame end interrupt.
        CAM_VSYNC_INT_ST: u1,
        /// The status bit for Camera transfer end interrupt.
        CAM_HS_INT_ST: u1,
        padding: u28 = 0,
    }),
    /// LCDCAM interrupt clear register.
    /// offset: 0x70
    LC_DMA_INT_CLR: mmio.Mmio(packed struct(u32) {
        /// The clear bit for LCD frame end interrupt.
        LCD_VSYNC_INT_CLR: u1,
        /// The clear bit for lcd transfer end interrupt.
        LCD_TRANS_DONE_INT_CLR: u1,
        /// The clear bit for Camera frame end interrupt.
        CAM_VSYNC_INT_CLR: u1,
        /// The clear bit for Camera line interrupt.
        CAM_HS_INT_CLR: u1,
        padding: u28 = 0,
    }),
    /// offset: 0x74
    reserved116: [136]u8,
    /// Version register
    /// offset: 0xfc
    LC_REG_DATE: mmio.Mmio(packed struct(u32) {
        /// LCD_CAM version control register
        LC_DATE: u28,
        padding: u4 = 0,
    }),
};
