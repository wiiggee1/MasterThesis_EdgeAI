const mmio = @import("mmio");
const types = @import("../../types.zig");

/// JPEG Codec
pub const JPEG = extern struct {
    /// Control and configuration registers
    /// offset: 0x00
    CONFIG: mmio.Mmio(packed struct(u32) {
        /// fsm reset
        FSM_RST: u1,
        /// start to compress a new pic(in dma reg mode)
        JPEG_START: u1,
        /// 0:8bit qnr,1:12bit qnr(TBD)
        QNR_PRESITION: u1,
        /// enable whether to add "00" after "ff"
        FF_CHECK_EN: u1,
        /// 0:yuv444,1:yuv422, 2:yuv420
        SAMPLE_SEL: u2,
        /// 1:use linklist to configure dma
        DMA_LINKLIST_MODE: u1,
        /// 0:normal mode,1:debug mode for direct output from input
        DEBUG_DIRECT_OUT_EN: u1,
        /// 0:use non-fifo way to access qnr ram,1:use fifo way to access qnr ram
        GRAY_SEL: u1,
        /// choose luminance quntization table id(TBD)
        LQNR_TBL_SEL: u2,
        /// choose chrominance quntization table id (TBD)
        CQNR_TBL_SEL: u2,
        /// configure picture's color space:0-rb888,1-yuv422,2-rgb565, 3-gray
        COLOR_SPACE: u2,
        /// 0:use non-fifo way to write dht len_total/codemin/value table,1:use fifo way to write dht len_total/codemin/value table. Reading dht len_total/codemin/value table only has nonfifo way
        DHT_FIFO_EN: u1,
        /// force memory's clock enabled
        MEM_CLK_FORCE_ON: u1,
        /// decode pause period to trigger decode_timeout int, the timeout periods =2 power (reg_decode_timeout_thres) -1
        JFIF_VER: u6,
        /// 0: software use reset to abort decode process ,1: decoder abort decode process by itself
        DECODE_TIMEOUT_TASK_SEL: u1,
        /// when set to 1, soft reset JPEG module except jpeg_reg module
        SOFT_RST: u1,
        /// fifo reset
        FIFO_RST: u1,
        /// reverse the source color pixel
        PIXEL_REV: u1,
        /// set this bit to add EOI of "0xffd9" at the end of bitstream
        TAILER_EN: u1,
        /// set this bit to pause jpeg encoding
        PAUSE_EN: u1,
        /// 0: no operation,1:force jpeg memory to power down
        MEM_FORCE_PD: u1,
        /// 0: no operation,1:force jpeg memory to power up
        MEM_FORCE_PU: u1,
        /// 0:encoder mode, 1: decoder mode
        MODE: u1,
    }),
    /// Control and configuration registers
    /// offset: 0x04
    DQT_INFO: mmio.Mmio(packed struct(u32) {
        /// Configure dqt table0's quantization coefficient precision in bit[7:4], configure dqt table0's table id in bit[3:0]
        T0_DQT_INFO: u8,
        /// Configure dqt table1's quantization coefficient precision in bit[7:4], configure dqt table1's table id in bit[3:0]
        T1_DQT_INFO: u8,
        /// Configure dqt table2's quantization coefficient precision in bit[7:4], configure dqt table2's table id in bit[3:0]
        T2_DQT_INFO: u8,
        /// Configure dqt table3's quantization coefficient precision in bit[7:4], configure dqt table3's table id in bit[3:0]
        T3_DQT_INFO: u8,
    }),
    /// Control and configuration registers
    /// offset: 0x08
    PIC_SIZE: mmio.Mmio(packed struct(u32) {
        /// configure picture's height. when encode, the max configurable bits is 14, when decode, the max configurable bits is 16
        VA: u16,
        /// configure picture's width. when encode, the max configurable bits is 14, when decode, the max configurable bits is 16
        HA: u16,
    }),
    /// offset: 0x0c
    reserved12: [4]u8,
    /// Control and configuration registers
    /// offset: 0x10
    T0QNR: mmio.Mmio(packed struct(u32) {
        /// write this reg to configure 64 quantization coefficient in t0 table
        T0_QNR_VAL: u32,
    }),
    /// Control and configuration registers
    /// offset: 0x14
    T1QNR: mmio.Mmio(packed struct(u32) {
        /// write this reg to configure 64 quantization coefficient in t1 table
        CHROMINANCE_QNR_VAL: u32,
    }),
    /// Control and configuration registers
    /// offset: 0x18
    T2QNR: mmio.Mmio(packed struct(u32) {
        /// write this reg to configure 64 quantization coefficient in t2 table
        T2_QNR_VAL: u32,
    }),
    /// Control and configuration registers
    /// offset: 0x1c
    T3QNR: mmio.Mmio(packed struct(u32) {
        /// write this reg to configure 64 quantization coefficient in t3 table
        T3_QNR_VAL: u32,
    }),
    /// Control and configuration registers
    /// offset: 0x20
    DECODE_CONF: mmio.Mmio(packed struct(u32) {
        /// configure restart interval in DRI marker when decode
        RESTART_INTERVAL: u16,
        /// configure number of components in frame when decode
        COMPONENT_NUM: u8,
        /// software decode dht table enable
        SW_DHT_EN: u1,
        /// Configure the byte number to check next sos marker in the multi-scan picture after one scan is decoded down. The real check number is reg_sos_check_byte_num+1
        SOS_CHECK_BYTE_NUM: u2,
        /// Configure the byte number to check next rst marker after one rst interval is decoded down. The real check number is reg_rst_check_byte_num+1
        RST_CHECK_BYTE_NUM: u2,
        /// reserved for decoder
        MULTI_SCAN_ERR_CHECK: u1,
        /// reserved for decoder
        DEZIGZAG_READY_CTL: u1,
        padding: u1 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x24
    C0: mmio.Mmio(packed struct(u32) {
        /// choose c0 quntization table id (TBD)
        DQT_TBL_SEL: u8,
        /// vertical sampling factor of c0
        Y_FACTOR: u4,
        /// horizontal sampling factor of c0
        X_FACTOR: u4,
        /// the identifier of c0
        ID: u8,
        padding: u8 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x28
    C1: mmio.Mmio(packed struct(u32) {
        /// choose c1 quntization table id (TBD)
        DQT_TBL_SEL: u8,
        /// vertical sampling factor of c1
        Y_FACTOR: u4,
        /// horizontal sampling factor of c1
        X_FACTOR: u4,
        /// the identifier of c1
        ID: u8,
        padding: u8 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x2c
    C2: mmio.Mmio(packed struct(u32) {
        /// choose c2 quntization table id (TBD)
        DQT_TBL_SEL: u8,
        /// vertical sampling factor of c2
        Y_FACTOR: u4,
        /// horizontal sampling factor of c2
        X_FACTOR: u4,
        /// the identifier of c2
        ID: u8,
        padding: u8 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x30
    C3: mmio.Mmio(packed struct(u32) {
        /// choose c3 quntization table id (TBD)
        DQT_TBL_SEL: u8,
        /// vertical sampling factor of c3
        Y_FACTOR: u4,
        /// horizontal sampling factor of c3
        X_FACTOR: u4,
        /// the identifier of c3
        ID: u8,
        padding: u8 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x34
    DHT_INFO: mmio.Mmio(packed struct(u32) {
        /// configure dht dc table 0 id
        DC0_DHT_ID: u4,
        /// configure dht dc table 1 id
        DC1_DHT_ID: u4,
        /// configure dht ac table 0 id
        AC0_DHT_ID: u4,
        /// configure dht ac table 1 id
        AC1_DHT_ID: u4,
        padding: u16 = 0,
    }),
    /// Interrupt raw registers
    /// offset: 0x38
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// This raw interrupt bit turns to high level when JPEG finishes encoding a picture..
        DONE_INT_RAW: u1,
        /// The raw interrupt bit to sign that rle parallel error when decoding.
        RLE_PARALLEL_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that scan id check with component fails when decoding.
        CID_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that scan component's dc dht id check with dc dht table's id fails when decoding.
        C_DHT_DC_ID_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that scan component's ac dht id check with ac dht table's id fails when decoding.
        C_DHT_AC_ID_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that scan component's dqt id check with dqt table's id fails when decoding.
        C_DQT_ID_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that RST header marker is detected but restart interval is 0 when decoding.
        RST_UXP_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that RST header marker is not detected but restart interval is not 0 when decoding.
        RST_CHECK_NONE_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that RST header marker position mismatches with restart interval when decoding.
        RST_CHECK_POS_ERR_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last pixel of one square has been transmitted for Tx channel.
        OUT_EOF_INT_RAW: u1,
        /// The raw interrupt bit to sign that the selected source color mode is not supported.
        SR_COLOR_MODE_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that one dct calculation is finished.
        DCT_DONE_INT_RAW: u1,
        /// The raw interrupt bit to sign that the coding process for last block is finished.
        BS_LAST_BLOCK_EOF_INT_RAW: u1,
        /// The raw interrupt bit to sign that SOS header marker is not detected but there are still components left to be decoded.
        SCAN_CHECK_NONE_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that SOS header marker position wrong when decoding.
        SCAN_CHECK_POS_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that unsupported header marker is detected when decoding.
        UXP_DET_INT_RAW: u1,
        /// The raw interrupt bit to sign that received pixel blocks are smaller than expected when encoding.
        EN_FRAME_EOF_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that the frame eof sign bit from dma input is missing when encoding. But the number of pixel blocks is enough.
        EN_FRAME_EOF_LACK_INT_RAW: u1,
        /// The raw interrupt bit to sign that decoded blocks are smaller than expected when decoding.
        DE_FRAME_EOF_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that the either frame eof from dma input or eoi marker is missing when encoding. But the number of decoded blocks is enough.
        DE_FRAME_EOF_LACK_INT_RAW: u1,
        /// The raw interrupt bit to sign that the component number of a scan is 0 or does not match the sos marker's length when decoding.
        SOS_UNMATCH_ERR_INT_RAW: u1,
        /// The raw interrupt bit to sign that the first scan has header marker error when decoding.
        MARKER_ERR_FST_SCAN_INT_RAW: u1,
        /// The raw interrupt bit to sign that the following scans but not the first scan have header marker error when decoding.
        MARKER_ERR_OTHER_SCAN_INT_RAW: u1,
        /// The raw interrupt bit to sign that JPEG format is not detected at the eof data of a packet when decoding.
        UNDET_INT_RAW: u1,
        /// The raw interrupt bit to sign that decode pause time is longer than the setting decode timeout time when decoding.
        DECODE_TIMEOUT_INT_RAW: u1,
        padding: u7 = 0,
    }),
    /// Interrupt enable registers
    /// offset: 0x3c
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// This enable interrupt bit turns to high level when JPEG finishes encoding a picture..
        DONE_INT_ENA: u1,
        /// The enable interrupt bit to sign that rle parallel error when decoding.
        RLE_PARALLEL_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that scan id check with component fails when decoding.
        CID_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that scan component's dc dht id check with dc dht table's id fails when decoding.
        C_DHT_DC_ID_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that scan component's ac dht id check with ac dht table's id fails when decoding.
        C_DHT_AC_ID_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that scan component's dqt id check with dqt table's id fails when decoding.
        C_DQT_ID_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that RST header marker is detected but restart interval is 0 when decoding.
        RST_UXP_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that RST header marker is not detected but restart interval is not 0 when decoding.
        RST_CHECK_NONE_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that RST header marker position mismatches with restart interval when decoding.
        RST_CHECK_POS_ERR_INT_ENA: u1,
        /// The enable interrupt bit turns to high level when the last pixel of one square has been transmitted for Tx channel.
        OUT_EOF_INT_ENA: u1,
        /// The enable interrupt bit to sign that the selected source color mode is not supported.
        SR_COLOR_MODE_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that one dct calculation is finished.
        DCT_DONE_INT_ENA: u1,
        /// The enable interrupt bit to sign that the coding process for last block is finished.
        BS_LAST_BLOCK_EOF_INT_ENA: u1,
        /// The enable interrupt bit to sign that SOS header marker is not detected but there are still components left to be decoded.
        SCAN_CHECK_NONE_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that SOS header marker position wrong when decoding.
        SCAN_CHECK_POS_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that unsupported header marker is detected when decoding.
        UXP_DET_INT_ENA: u1,
        /// The enable interrupt bit to sign that received pixel blocks are smaller than expected when encoding.
        EN_FRAME_EOF_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that the frame eof sign bit from dma input is missing when encoding. But the number of pixel blocks is enough.
        EN_FRAME_EOF_LACK_INT_ENA: u1,
        /// The enable interrupt bit to sign that decoded blocks are smaller than expected when decoding.
        DE_FRAME_EOF_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that the either frame eof from dma input or eoi marker is missing when encoding. But the number of decoded blocks is enough.
        DE_FRAME_EOF_LACK_INT_ENA: u1,
        /// The enable interrupt bit to sign that the component number of a scan is 0 or does not match the sos marker's length when decoding.
        SOS_UNMATCH_ERR_INT_ENA: u1,
        /// The enable interrupt bit to sign that the first scan has header marker error when decoding.
        MARKER_ERR_FST_SCAN_INT_ENA: u1,
        /// The enable interrupt bit to sign that the following scans but not the first scan have header marker error when decoding.
        MARKER_ERR_OTHER_SCAN_INT_ENA: u1,
        /// The enable interrupt bit to sign that JPEG format is not detected at the eof data of a packet when decoding.
        UNDET_INT_ENA: u1,
        /// The enable interrupt bit to sign that decode pause time is longer than the setting decode timeout time when decoding.
        DECODE_TIMEOUT_INT_ENA: u1,
        padding: u7 = 0,
    }),
    /// Interrupt status registers
    /// offset: 0x40
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// This status interrupt bit turns to high level when JPEG finishes encoding a picture..
        DONE_INT_ST: u1,
        /// The status interrupt bit to sign that rle parallel error when decoding.
        RLE_PARALLEL_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that scan id check with component fails when decoding.
        CID_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that scan component's dc dht id check with dc dht table's id fails when decoding.
        C_DHT_DC_ID_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that scan component's ac dht id check with ac dht table's id fails when decoding.
        C_DHT_AC_ID_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that scan component's dqt id check with dqt table's id fails when decoding.
        C_DQT_ID_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that RST header marker is detected but restart interval is 0 when decoding.
        RST_UXP_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that RST header marker is not detected but restart interval is not 0 when decoding.
        RST_CHECK_NONE_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that RST header marker position mismatches with restart interval when decoding.
        RST_CHECK_POS_ERR_INT_ST: u1,
        /// The status interrupt bit turns to high level when the last pixel of one square has been transmitted for Tx channel.
        OUT_EOF_INT_ST: u1,
        /// The status interrupt bit to sign that the selected source color mode is not supported.
        SR_COLOR_MODE_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that one dct calculation is finished.
        DCT_DONE_INT_ST: u1,
        /// The status interrupt bit to sign that the coding process for last block is finished.
        BS_LAST_BLOCK_EOF_INT_ST: u1,
        /// The status interrupt bit to sign that SOS header marker is not detected but there are still components left to be decoded.
        SCAN_CHECK_NONE_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that SOS header marker position wrong when decoding.
        SCAN_CHECK_POS_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that unsupported header marker is detected when decoding.
        UXP_DET_INT_ST: u1,
        /// The status interrupt bit to sign that received pixel blocks are smaller than expected when encoding.
        EN_FRAME_EOF_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that the frame eof sign bit from dma input is missing when encoding. But the number of pixel blocks is enough.
        EN_FRAME_EOF_LACK_INT_ST: u1,
        /// The status interrupt bit to sign that decoded blocks are smaller than expected when decoding.
        DE_FRAME_EOF_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that the either frame eof from dma input or eoi marker is missing when encoding. But the number of decoded blocks is enough.
        DE_FRAME_EOF_LACK_INT_ST: u1,
        /// The status interrupt bit to sign that the component number of a scan is 0 or does not match the sos marker's length when decoding.
        SOS_UNMATCH_ERR_INT_ST: u1,
        /// The status interrupt bit to sign that the first scan has header marker error when decoding.
        MARKER_ERR_FST_SCAN_INT_ST: u1,
        /// The status interrupt bit to sign that the following scans but not the first scan have header marker error when decoding.
        MARKER_ERR_OTHER_SCAN_INT_ST: u1,
        /// The status interrupt bit to sign that JPEG format is not detected at the eof data of a packet when decoding.
        UNDET_INT_ST: u1,
        /// The status interrupt bit to sign that decode pause time is longer than the setting decode timeout time when decoding.
        DECODE_TIMEOUT_INT_ST: u1,
        padding: u7 = 0,
    }),
    /// Interrupt clear registers
    /// offset: 0x44
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// This clear interrupt bit turns to high level when JPEG finishes encoding a picture..
        DONE_INT_CLR: u1,
        /// The clear interrupt bit to sign that rle parallel error when decoding.
        RLE_PARALLEL_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that scan id check with component fails when decoding.
        CID_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that scan component's dc dht id check with dc dht table's id fails when decoding.
        C_DHT_DC_ID_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that scan component's ac dht id check with ac dht table's id fails when decoding.
        C_DHT_AC_ID_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that scan component's dqt id check with dqt table's id fails when decoding.
        C_DQT_ID_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that RST header marker is detected but restart interval is 0 when decoding.
        RST_UXP_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that RST header marker is not detected but restart interval is not 0 when decoding.
        RST_CHECK_NONE_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that RST header marker position mismatches with restart interval when decoding.
        RST_CHECK_POS_ERR_INT_CLR: u1,
        /// The clear interrupt bit turns to high level when the last pixel of one square has been transmitted for Tx channel.
        OUT_EOF_INT_CLR: u1,
        /// The clear interrupt bit to sign that the selected source color mode is not supported.
        SR_COLOR_MODE_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that one dct calculation is finished.
        DCT_DONE_INT_CLR: u1,
        /// The clear interrupt bit to sign that the coding process for last block is finished.
        BS_LAST_BLOCK_EOF_INT_CLR: u1,
        /// The clear interrupt bit to sign that SOS header marker is not detected but there are still components left to be decoded.
        SCAN_CHECK_NONE_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that SOS header marker position wrong when decoding.
        SCAN_CHECK_POS_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that unsupported header marker is detected when decoding.
        UXP_DET_INT_CLR: u1,
        /// The clear interrupt bit to sign that received pixel blocks are smaller than expected when encoding.
        EN_FRAME_EOF_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that the frame eof sign bit from dma input is missing when encoding. But the number of pixel blocks is enough.
        EN_FRAME_EOF_LACK_INT_CLR: u1,
        /// The clear interrupt bit to sign that decoded blocks are smaller than expected when decoding.
        DE_FRAME_EOF_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that the either frame eof from dma input or eoi marker is missing when encoding. But the number of decoded blocks is enough.
        DE_FRAME_EOF_LACK_INT_CLR: u1,
        /// The clear interrupt bit to sign that the component number of a scan is 0 or does not match the sos marker's length when decoding.
        SOS_UNMATCH_ERR_INT_CLR: u1,
        /// The clear interrupt bit to sign that the first scan has header marker error when decoding.
        MARKER_ERR_FST_SCAN_INT_CLR: u1,
        /// The clear interrupt bit to sign that the following scans but not the first scan have header marker error when decoding.
        MARKER_ERR_OTHER_SCAN_INT_CLR: u1,
        /// The clear interrupt bit to sign that JPEG format is not detected at the eof data of a packet when decoding.
        UNDET_INT_CLR: u1,
        /// The clear interrupt bit to sign that decode pause time is longer than the setting decode timeout time when decoding.
        DECODE_TIMEOUT_INT_CLR: u1,
        padding: u7 = 0,
    }),
    /// Trace and Debug registers
    /// offset: 0x48
    STATUS0: mmio.Mmio(packed struct(u32) {
        reserved11: u11 = 0,
        /// the valid bit count for last bitstream
        BITSTREAM_EOF_VLD_CNT: u6,
        /// the zig-zag read addr from dctout_ram
        DCTOUT_ZZSCAN_ADDR: u6,
        /// the zig-zag read addr from qnrval_ram
        QNRVAL_ZZSCAN_ADDR: u6,
        /// the state of jpeg fsm
        REG_STATE_YUV: u3,
    }),
    /// Trace and Debug registers
    /// offset: 0x4c
    STATUS2: mmio.Mmio(packed struct(u32) {
        /// source pixels fetched from dma
        SOURCE_PIXEL: u24,
        /// indicate the encoding process for the last mcu of the picture
        LAST_BLOCK: u1,
        /// indicate the encoding process for the last block of the picture
        LAST_MCU: u1,
        /// indicate the encoding process is at the header of the last block of the picture
        LAST_DC: u1,
        /// the jpeg pack_fifo ready signal, high active
        PACKFIFO_READY: u1,
        padding: u4 = 0,
    }),
    /// Trace and Debug registers
    /// offset: 0x50
    STATUS3: mmio.Mmio(packed struct(u32) {
        /// component y transferred from rgb input
        YO: u9,
        /// component y valid signal, high active
        Y_READY: u1,
        /// component cb transferred from rgb input
        CBO: u9,
        /// component cb valid signal, high active
        CB_READY: u1,
        /// component cr transferred from rgb input
        CRO: u9,
        /// component cr valid signal, high active
        CR_READY: u1,
        padding: u2 = 0,
    }),
    /// Trace and Debug registers
    /// offset: 0x54
    STATUS4: mmio.Mmio(packed struct(u32) {
        /// the hufman bitstream during encoding process
        HFM_BITSTREAM: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x58
    DHT_TOTLEN_DC0: mmio.Mmio(packed struct(u32) {
        /// write the numbers of 1~n codeword length sum from 1~16 of dc0 table
        DHT_TOTLEN_DC0: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x5c
    DHT_VAl_DC0: mmio.Mmio(packed struct(u32) {
        /// write codeword corresponding huffman values of dc0 table
        DHT_VAL_DC0: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x60
    DHT_TOTLEN_AC0: mmio.Mmio(packed struct(u32) {
        /// write the numbers of 1~n codeword length sum from 1~16 of ac0 table
        DHT_TOTLEN_AC0: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x64
    DHT_VAl_AC0: mmio.Mmio(packed struct(u32) {
        /// write codeword corresponding huffman values of ac0 table
        DHT_VAL_AC0: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x68
    DHT_TOTLEN_DC1: mmio.Mmio(packed struct(u32) {
        /// write the numbers of 1~n codeword length sum from 1~16 of dc1 table
        DHT_TOTLEN_DC1: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x6c
    DHT_VAl_DC1: mmio.Mmio(packed struct(u32) {
        /// write codeword corresponding huffman values of dc1 table
        DHT_VAL_DC1: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x70
    DHT_TOTLEN_AC1: mmio.Mmio(packed struct(u32) {
        /// write the numbers of 1~n codeword length sum from 1~16 of ac1 table
        DHT_TOTLEN_AC1: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x74
    DHT_VAl_AC1: mmio.Mmio(packed struct(u32) {
        /// write codeword corresponding huffman values of ac1 table
        DHT_VAL_AC1: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x78
    DHT_CODEMIN_DC0: mmio.Mmio(packed struct(u32) {
        /// write the minimum codeword of code length from 1~16 of dc0 table. The codeword is left shifted to the MSB position of a 16bit word
        DHT_CODEMIN_DC0: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x7c
    DHT_CODEMIN_AC0: mmio.Mmio(packed struct(u32) {
        /// write the minimum codeword of code length from 1~16 of ac0 table. The codeword is left shifted to the MSB position of a 16bit word
        DHT_CODEMIN_AC0: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x80
    DHT_CODEMIN_DC1: mmio.Mmio(packed struct(u32) {
        /// write the minimum codeword of code length from 1~16 of dc1 table. The codeword is left shifted to the MSB position of a 16bit word
        DHT_CODEMIN_DC1: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x84
    DHT_CODEMIN_AC1: mmio.Mmio(packed struct(u32) {
        /// write the minimum codeword of code length from 1~16 of ac1 table. The codeword is left shifted to the MSB position of a 16bit word
        DHT_CODEMIN_AC1: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x88
    DECODER_STATUS0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        DECODE_BYTE_CNT: u26,
        /// Reserved
        HEADER_DEC_ST: u4,
        /// Reserved
        DECODE_SAMPLE_SEL: u2,
    }),
    /// Trace and Debug registers
    /// offset: 0x8c
    DECODER_STATUS1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        ENCODE_DATA: u16,
        /// Reserved
        COUNT_Q: u7,
        /// Reserved
        MCU_FSM_READY: u1,
        /// Reserved
        DECODE_DATA: u8,
    }),
    /// Trace and Debug registers
    /// offset: 0x90
    DECODER_STATUS2: mmio.Mmio(packed struct(u32) {
        /// Reserved
        COMP_BLOCK_NUM: u26,
        /// Reserved
        SCAN_NUM: u3,
        /// Reserved
        RST_CHECK_WAIT: u1,
        /// Reserved
        SCAN_CHECK_WAIT: u1,
        /// Reserved
        MCU_IN_PROC: u1,
    }),
    /// Trace and Debug registers
    /// offset: 0x94
    DECODER_STATUS3: mmio.Mmio(packed struct(u32) {
        /// Reserved
        LOOKUP_DATA: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0x98
    DECODER_STATUS4: mmio.Mmio(packed struct(u32) {
        /// Reserved
        BLOCK_EOF_CNT: u26,
        /// Reserved
        DEZIGZAG_READY: u1,
        /// Reserved
        DE_FRAME_EOF_CHECK: u1,
        /// Reserved
        DE_DMA2D_IN_PUSH: u1,
        padding: u3 = 0,
    }),
    /// Trace and Debug registers
    /// offset: 0x9c
    DECODER_STATUS5: mmio.Mmio(packed struct(u32) {
        /// Reserved
        IDCT_HFM_DATA: u16,
        /// Reserved
        NS0: u3,
        /// Reserved
        NS1: u3,
        /// Reserved
        NS2: u3,
        /// Reserved
        NS3: u3,
        /// Reserved
        DATA_LAST_O: u1,
        /// redundant registers for jpeg
        RDN_RESULT: u1,
        /// redundant control registers for jpeg
        RDN_ENA: u1,
        padding: u1 = 0,
    }),
    /// Trace and Debug registers
    /// offset: 0xa0
    STATUS5: mmio.Mmio(packed struct(u32) {
        /// Reserved
        PIC_BLOCK_NUM: u24,
        padding: u8 = 0,
    }),
    /// Trace and Debug registers
    /// offset: 0xa4
    ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// redundant registers for jpeg
        RDN_ECO_LOW: u32,
    }),
    /// Trace and Debug registers
    /// offset: 0xa8
    ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// redundant registers for jpeg
        RDN_ECO_HIGH: u32,
    }),
    /// offset: 0xac
    reserved172: [76]u8,
    /// Trace and Debug registers
    /// offset: 0xf8
    SYS: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// Reserved
        CLK_EN: u1,
    }),
    /// Trace and Debug registers
    /// offset: 0xfc
    VERSION: mmio.Mmio(packed struct(u32) {
        /// Reserved
        JPEG_VER: u28,
        padding: u4 = 0,
    }),
};
