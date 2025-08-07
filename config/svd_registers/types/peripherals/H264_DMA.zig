const mmio = @import("mmio");
const types = @import("../../types.zig");

/// H264 Encoder (DMA)
pub const H264_DMA = extern struct {
    /// TX CH0 config0 register
    /// offset: 0x00
    OUT_CONF0_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable automatic outlink-writeback when all the data pointed by outlink descriptor has been received.
        OUT_AUTO_WRBACK_CH0: u1,
        /// EOF flag generation mode when receiving data. 1: EOF flag for Tx channel 0 is generated when data need to read has been popped from FIFO in DMA
        OUT_EOF_MODE_CH0: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 0 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH0: u1,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        OUT_ECC_AES_EN_CH0: u1,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH0: u1,
        reserved6: u1 = 0,
        /// Block size of Tx channel 0. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 bytes
        OUT_MEM_BURST_LENGTH_CH0: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI read data don't cross the address boundary which define by mem_burst_length
        OUT_PAGE_BOUND_EN_CH0: u1,
        reserved16: u3 = 0,
        /// Enable TX channel 0 macro block reorder when set to 1, only channel0 have this selection
        OUT_REORDER_EN_CH0: u1,
        reserved24: u7 = 0,
        /// Write 1 then write 0 to this bit to reset TX channel
        OUT_RST_CH0: u1,
        /// Write 1 before reset and write 0 after reset
        OUT_CMD_DISABLE_CH0: u1,
        /// Set this bit to 1 to disable arbiter optimum weight function.
        OUT_ARB_WEIGHT_OPT_DIS_CH0: u1,
        padding: u5 = 0,
    }),
    /// TX CH0 interrupt raw register
    /// offset: 0x04
    OUT_INT_RAW_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel 0.
        OUT_DONE_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel 0.
        OUT_EOF_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error, including owner error, the second and third word error of outlink descriptor for Tx channel 0.
        OUT_DSCR_ERR_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel 0.
        OUT_TOTAL_EOF_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is overflow.
        OUTFIFO_OVF_L1_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is underflow.
        OUTFIFO_UDF_L1_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is overflow.
        OUTFIFO_OVF_L2_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is underflow.
        OUTFIFO_UDF_L2_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when dscr ready task fifo is overflow.
        OUT_DSCR_TASK_OVF_CH0_INT_RAW: u1,
        padding: u23 = 0,
    }),
    /// TX CH0 interrupt ena register
    /// offset: 0x08
    OUT_INT_ENA_CH0: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH0_INT_ENA: u1,
        padding: u23 = 0,
    }),
    /// TX CH0 interrupt st register
    /// offset: 0x0c
    OUT_INT_ST_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH0_INT_ST: u1,
        padding: u23 = 0,
    }),
    /// TX CH0 interrupt clr register
    /// offset: 0x10
    OUT_INT_CLR_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH0_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH0_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH0_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH0_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH0_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH0_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH0_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH0_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH0_INT_CLR: u1,
        padding: u23 = 0,
    }),
    /// TX CH0 outfifo status register
    /// offset: 0x14
    OUTFIFO_STATUS_CH0: mmio.Mmio(packed struct(u32) {
        /// Tx FIFO full signal for Tx channel 0.
        OUTFIFO_FULL_L2_CH0: u1,
        /// Tx FIFO empty signal for Tx channel 0.
        OUTFIFO_EMPTY_L2_CH0: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 0.
        OUTFIFO_CNT_L2_CH0: u4,
        /// Tx FIFO full signal for Tx channel 0.
        OUTFIFO_FULL_L1_CH0: u1,
        /// Tx FIFO empty signal for Tx channel 0.
        OUTFIFO_EMPTY_L1_CH0: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 0.
        OUTFIFO_CNT_L1_CH0: u5,
        reserved16: u3 = 0,
        /// Tx FIFO full signal for Tx channel 0.
        OUTFIFO_FULL_L3_CH0: u1,
        /// Tx FIFO empty signal for Tx channel 0.
        OUTFIFO_EMPTY_L3_CH0: u1,
        /// The register stores the 8byte number of the data in Tx FIFO for Tx channel 0.
        OUTFIFO_CNT_L3_CH0: u2,
        padding: u12 = 0,
    }),
    /// TX CH0 outfifo push register
    /// offset: 0x18
    OUT_PUSH_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into DMA Tx FIFO.
        OUTFIFO_WDATA_CH0: u10,
        /// Set this bit to push data into DMA Tx FIFO.
        OUTFIFO_PUSH_CH0: u1,
        padding: u21 = 0,
    }),
    /// TX CH0 out_link dscr ctrl register
    /// offset: 0x1c
    OUT_LINK_CONF_CH0: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH0: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH0: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH0: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH0: u1,
        padding: u8 = 0,
    }),
    /// TX CH0 out_link dscr addr register
    /// offset: 0x20
    OUT_LINK_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the first outlink descriptor's address.
        OUTLINK_ADDR_CH0: u32,
    }),
    /// TX CH0 state register
    /// offset: 0x24
    OUT_STATE_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH0: u18,
        /// This register stores the current descriptor state machine state.
        OUT_DSCR_STATE_CH0: u2,
        /// This register stores the current control module state machine state.
        OUT_STATE_CH0: u4,
        /// This register indicate that if the channel reset is safety.
        OUT_RESET_AVAIL_CH0: u1,
        padding: u7 = 0,
    }),
    /// TX CH0 eof des addr register
    /// offset: 0x28
    OUT_EOF_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH0: u32,
    }),
    /// TX CH0 next dscr addr register
    /// offset: 0x2c
    OUT_DSCR_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the next outlink descriptor address y.
        OUTLINK_DSCR_CH0: u32,
    }),
    /// TX CH0 last dscr addr register
    /// offset: 0x30
    OUT_DSCR_BF0_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor's next address y-1.
        OUTLINK_DSCR_BF0_CH0: u32,
    }),
    /// TX CH0 second-to-last dscr addr register
    /// offset: 0x34
    OUT_DSCR_BF1_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last outlink descriptor's next address y-2.
        OUTLINK_DSCR_BF1_CH0: u32,
    }),
    /// offset: 0x38
    reserved56: [4]u8,
    /// TX CH0 arb register
    /// offset: 0x3c
    OUT_ARB_CH0: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        OUT_ARB_TOKEN_NUM_CH0: u4,
        /// Set the priority of channel
        EXTER_OUT_ARB_PRIORITY_CH0: u2,
        padding: u26 = 0,
    }),
    /// TX CH0 reorder status register
    /// offset: 0x40
    OUT_RO_STATUS_CH0: mmio.Mmio(packed struct(u32) {
        /// The register stores the 8byte number of the data in reorder Tx FIFO for channel 0.
        OUTFIFO_RO_CNT_CH0: u2,
        reserved6: u4 = 0,
        /// The register stores the state of read ram of reorder
        OUT_RO_WR_STATE_CH0: u2,
        /// The register stores the state of write ram of reorder
        OUT_RO_RD_STATE_CH0: u2,
        /// the number of bytes contained in a pixel at TX channel 0: 1byte 1: 1.5bytes 2 : 2bytes 3: 2.5bytes 4: 3bytes 5: 4bytes
        OUT_PIXEL_BYTE_CH0: u4,
        /// the number of macro blocks contained in a burst of data at TX channel
        OUT_BURST_BLOCK_NUM_CH0: u4,
        padding: u14 = 0,
    }),
    /// TX CH0 reorder power config register
    /// offset: 0x44
    OUT_RO_PD_CONF_CH0: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// dma reorder ram power down
        OUT_RO_RAM_FORCE_PD_CH0: u1,
        /// dma reorder ram power up
        OUT_RO_RAM_FORCE_PU_CH0: u1,
        /// 1: Force to open the clock and bypass the gate-clock when accessing the RAM in DMA. 0: A gate-clock will be used when accessing the RAM in DMA.
        OUT_RO_RAM_CLK_FO_CH0: u1,
        padding: u25 = 0,
    }),
    /// offset: 0x48
    reserved72: [8]u8,
    /// tx CH0 mode enable register
    /// offset: 0x50
    OUT_MODE_ENABLE_CH0: mmio.Mmio(packed struct(u32) {
        /// tx CH0 test mode enable.0 : H264_DMA work in normal mode.1 : H264_DMA work in test mode
        OUT_TEST_MODE_ENABLE_CH0: u1,
        padding: u31 = 0,
    }),
    /// tx CH0 test mode yuv value register
    /// offset: 0x54
    OUT_MODE_YUV_CH0: mmio.Mmio(packed struct(u32) {
        /// tx CH0 test mode y value
        OUT_TEST_Y_VALUE_CH0: u8,
        /// tx CH0 test mode u value
        OUT_TEST_U_VALUE_CH0: u8,
        /// tx CH0 test mode v value
        OUT_TEST_V_VALUE_CH0: u8,
        padding: u8 = 0,
    }),
    /// offset: 0x58
    reserved88: [16]u8,
    /// TX CH0 ETM config register
    /// offset: 0x68
    OUT_ETM_CONF_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 to enable ETM task function
        OUT_ETM_EN_CH0: u1,
        /// when this bit is 1, dscr can be processed after receiving a task
        OUT_ETM_LOOP_EN_CH0: u1,
        /// ETM dscr_ready maximum cache numbers
        OUT_DSCR_TASK_MAK_CH0: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x6c
    reserved108: [4]u8,
    /// tx CH0 buf len register
    /// offset: 0x70
    OUT_BUF_LEN_CH0: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_BUF_LEN_HB_CH0: u13,
        padding: u19 = 0,
    }),
    /// tx CH0 fifo byte cnt register
    /// offset: 0x74
    OUT_FIFO_BCNT_CH0: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_OUTFIFO_BCNT_CH0: u10,
        padding: u22 = 0,
    }),
    /// tx CH0 push byte cnt register
    /// offset: 0x78
    OUT_PUSH_BYTECNT_CH0: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_PUSH_BYTECNT_CH0: u8,
        padding: u24 = 0,
    }),
    /// tx CH0 xaddr register
    /// offset: 0x7c
    OUT_XADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_XADDR_CH0: u32,
    }),
    /// offset: 0x80
    reserved128: [128]u8,
    /// TX CH1 config0 register
    /// offset: 0x100
    OUT_CONF0_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable automatic outlink-writeback when all the data pointed by outlink descriptor has been received.
        OUT_AUTO_WRBACK_CH1: u1,
        /// EOF flag generation mode when receiving data. 1: EOF flag for Tx channel 0 is generated when data need to read has been popped from FIFO in DMA
        OUT_EOF_MODE_CH1: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 0 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH1: u1,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        OUT_ECC_AES_EN_CH1: u1,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH1: u1,
        reserved6: u1 = 0,
        /// Block size of Tx channel 1. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 64 bytes
        OUT_MEM_BURST_LENGTH_CH1: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI read data don't cross the address boundary which define by mem_burst_length
        OUT_PAGE_BOUND_EN_CH1: u1,
        reserved24: u11 = 0,
        /// Write 1 then write 0 to this bit to reset TX channel
        OUT_RST_CH1: u1,
        /// Write 1 before reset and write 0 after reset
        OUT_CMD_DISABLE_CH1: u1,
        /// Set this bit to 1 to disable arbiter optimum weight function.
        OUT_ARB_WEIGHT_OPT_DIS_CH1: u1,
        padding: u5 = 0,
    }),
    /// TX CH1 interrupt raw register
    /// offset: 0x104
    OUT_INT_RAW_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel 0.
        OUT_DONE_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel 0.
        OUT_EOF_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error, including owner error, the second and third word error of outlink descriptor for Tx channel 0.
        OUT_DSCR_ERR_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel 0.
        OUT_TOTAL_EOF_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is overflow.
        OUTFIFO_OVF_L1_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is underflow.
        OUTFIFO_UDF_L1_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is overflow.
        OUTFIFO_OVF_L2_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is underflow.
        OUTFIFO_UDF_L2_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when dscr ready task fifo is overflow.
        OUT_DSCR_TASK_OVF_CH1_INT_RAW: u1,
        padding: u23 = 0,
    }),
    /// TX CH1 interrupt ena register
    /// offset: 0x108
    OUT_INT_ENA_CH1: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH1_INT_ENA: u1,
        padding: u23 = 0,
    }),
    /// TX CH1 interrupt st register
    /// offset: 0x10c
    OUT_INT_ST_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH1_INT_ST: u1,
        padding: u23 = 0,
    }),
    /// TX CH1 interrupt clr register
    /// offset: 0x110
    OUT_INT_CLR_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH1_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH1_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH1_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH1_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH1_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH1_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH1_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH1_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH1_INT_CLR: u1,
        padding: u23 = 0,
    }),
    /// TX CH1 outfifo status register
    /// offset: 0x114
    OUTFIFO_STATUS_CH1: mmio.Mmio(packed struct(u32) {
        /// Tx FIFO full signal for Tx channel 1.
        OUTFIFO_FULL_L2_CH1: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        OUTFIFO_EMPTY_L2_CH1: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        OUTFIFO_CNT_L2_CH1: u4,
        /// Tx FIFO full signal for Tx channel 1.
        OUTFIFO_FULL_L1_CH1: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        OUTFIFO_EMPTY_L1_CH1: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        OUTFIFO_CNT_L1_CH1: u5,
        reserved16: u3 = 0,
        /// Tx FIFO full signal for Tx channel 1.
        OUTFIFO_FULL_L3_CH1: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        OUTFIFO_EMPTY_L3_CH1: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        OUTFIFO_CNT_L3_CH1: u2,
        padding: u12 = 0,
    }),
    /// TX CH1 outfifo push register
    /// offset: 0x118
    OUT_PUSH_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into DMA Tx FIFO.
        OUTFIFO_WDATA_CH1: u10,
        /// Set this bit to push data into DMA Tx FIFO.
        OUTFIFO_PUSH_CH1: u1,
        padding: u21 = 0,
    }),
    /// TX CH1 out_link dscr ctrl register
    /// offset: 0x11c
    OUT_LINK_CONF_CH1: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH1: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH1: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH1: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH1: u1,
        padding: u8 = 0,
    }),
    /// TX CH1 out_link dscr addr register
    /// offset: 0x120
    OUT_LINK_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the first outlink descriptor's address.
        OUTLINK_ADDR_CH1: u32,
    }),
    /// TX CH1 state register
    /// offset: 0x124
    OUT_STATE_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH1: u18,
        /// This register stores the current descriptor state machine state.
        OUT_DSCR_STATE_CH1: u2,
        /// This register stores the current control module state machine state.
        OUT_STATE_CH1: u4,
        /// This register indicate that if the channel reset is safety.
        OUT_RESET_AVAIL_CH1: u1,
        padding: u7 = 0,
    }),
    /// TX CH1 eof des addr register
    /// offset: 0x128
    OUT_EOF_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH1: u32,
    }),
    /// TX CH1 next dscr addr register
    /// offset: 0x12c
    OUT_DSCR_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the next outlink descriptor address y.
        OUTLINK_DSCR_CH1: u32,
    }),
    /// TX CH1 last dscr addr register
    /// offset: 0x130
    OUT_DSCR_BF0_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor's next address y-1.
        OUTLINK_DSCR_BF0_CH1: u32,
    }),
    /// TX CH1 second-to-last dscr addr register
    /// offset: 0x134
    OUT_DSCR_BF1_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last outlink descriptor's next address y-2.
        OUTLINK_DSCR_BF1_CH1: u32,
    }),
    /// offset: 0x138
    reserved312: [4]u8,
    /// TX CH1 arb register
    /// offset: 0x13c
    OUT_ARB_CH1: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        OUT_ARB_TOKEN_NUM_CH1: u4,
        reserved6: u2 = 0,
        /// Set the priority of channel
        INTER_OUT_ARB_PRIORITY_CH1: u1,
        padding: u25 = 0,
    }),
    /// offset: 0x140
    reserved320: [40]u8,
    /// TX CH1 ETM config register
    /// offset: 0x168
    OUT_ETM_CONF_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 to enable ETM task function
        OUT_ETM_EN_CH1: u1,
        /// when this bit is 1, dscr can be processed after receiving a task
        OUT_ETM_LOOP_EN_CH1: u1,
        /// ETM dscr_ready maximum cache numbers
        OUT_DSCR_TASK_MAK_CH1: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x16c
    reserved364: [4]u8,
    /// tx CH1 buf len register
    /// offset: 0x170
    OUT_BUF_LEN_CH1: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_BUF_LEN_HB_CH1: u13,
        padding: u19 = 0,
    }),
    /// tx CH1 fifo byte cnt register
    /// offset: 0x174
    OUT_FIFO_BCNT_CH1: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_OUTFIFO_BCNT_CH1: u10,
        padding: u22 = 0,
    }),
    /// tx CH1 push byte cnt register
    /// offset: 0x178
    OUT_PUSH_BYTECNT_CH1: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_PUSH_BYTECNT_CH1: u8,
        padding: u24 = 0,
    }),
    /// tx CH1 xaddr register
    /// offset: 0x17c
    OUT_XADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_XADDR_CH1: u32,
    }),
    /// offset: 0x180
    reserved384: [128]u8,
    /// TX CH2 config0 register
    /// offset: 0x200
    OUT_CONF0_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable automatic outlink-writeback when all the data pointed by outlink descriptor has been received.
        OUT_AUTO_WRBACK_CH2: u1,
        /// EOF flag generation mode when receiving data. 1: EOF flag for Tx channel 0 is generated when data need to read has been popped from FIFO in DMA
        OUT_EOF_MODE_CH2: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 0 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH2: u1,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        OUT_ECC_AES_EN_CH2: u1,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH2: u1,
        reserved6: u1 = 0,
        /// Block size of Tx channel 2. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 bytes
        OUT_MEM_BURST_LENGTH_CH2: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI read data don't cross the address boundary which define by mem_burst_length
        OUT_PAGE_BOUND_EN_CH2: u1,
        reserved24: u11 = 0,
        /// Write 1 then write 0 to this bit to reset TX channel
        OUT_RST_CH2: u1,
        /// Write 1 before reset and write 0 after reset
        OUT_CMD_DISABLE_CH2: u1,
        /// Set this bit to 1 to disable arbiter optimum weight function.
        OUT_ARB_WEIGHT_OPT_DIS_CH2: u1,
        padding: u5 = 0,
    }),
    /// TX CH2 interrupt raw register
    /// offset: 0x204
    OUT_INT_RAW_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel 0.
        OUT_DONE_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel 0.
        OUT_EOF_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error, including owner error, the second and third word error of outlink descriptor for Tx channel 0.
        OUT_DSCR_ERR_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel 0.
        OUT_TOTAL_EOF_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is overflow.
        OUTFIFO_OVF_L1_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is underflow.
        OUTFIFO_UDF_L1_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is overflow.
        OUTFIFO_OVF_L2_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is underflow.
        OUTFIFO_UDF_L2_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when dscr ready task fifo is overflow.
        OUT_DSCR_TASK_OVF_CH2_INT_RAW: u1,
        padding: u23 = 0,
    }),
    /// TX CH2 interrupt ena register
    /// offset: 0x208
    OUT_INT_ENA_CH2: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH2_INT_ENA: u1,
        padding: u23 = 0,
    }),
    /// TX CH2 interrupt st register
    /// offset: 0x20c
    OUT_INT_ST_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH2_INT_ST: u1,
        padding: u23 = 0,
    }),
    /// TX CH2 interrupt clr register
    /// offset: 0x210
    OUT_INT_CLR_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH2_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH2_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH2_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH2_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH2_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH2_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH2_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH2_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH2_INT_CLR: u1,
        padding: u23 = 0,
    }),
    /// TX CH2 outfifo status register
    /// offset: 0x214
    OUTFIFO_STATUS_CH2: mmio.Mmio(packed struct(u32) {
        /// Tx FIFO full signal for Tx channel 2.
        OUTFIFO_FULL_L2_CH2: u1,
        /// Tx FIFO empty signal for Tx channel 2.
        OUTFIFO_EMPTY_L2_CH2: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 2.
        OUTFIFO_CNT_L2_CH2: u4,
        /// Tx FIFO full signal for Tx channel 2.
        OUTFIFO_FULL_L1_CH2: u1,
        /// Tx FIFO empty signal for Tx channel 2.
        OUTFIFO_EMPTY_L1_CH2: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 2.
        OUTFIFO_CNT_L1_CH2: u5,
        reserved16: u3 = 0,
        /// Tx FIFO full signal for Tx channel 2.
        OUTFIFO_FULL_L3_CH2: u1,
        /// Tx FIFO empty signal for Tx channel 2.
        OUTFIFO_EMPTY_L3_CH2: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 2.
        OUTFIFO_CNT_L3_CH2: u2,
        padding: u12 = 0,
    }),
    /// TX CH2 outfifo push register
    /// offset: 0x218
    OUT_PUSH_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into DMA Tx FIFO.
        OUTFIFO_WDATA_CH2: u10,
        /// Set this bit to push data into DMA Tx FIFO.
        OUTFIFO_PUSH_CH2: u1,
        padding: u21 = 0,
    }),
    /// TX CH2 out_link dscr ctrl register
    /// offset: 0x21c
    OUT_LINK_CONF_CH2: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH2: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH2: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH2: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH2: u1,
        padding: u8 = 0,
    }),
    /// TX CH2 out_link dscr addr register
    /// offset: 0x220
    OUT_LINK_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the first outlink descriptor's address.
        OUTLINK_ADDR_CH2: u32,
    }),
    /// TX CH2 state register
    /// offset: 0x224
    OUT_STATE_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH2: u18,
        /// This register stores the current descriptor state machine state.
        OUT_DSCR_STATE_CH2: u2,
        /// This register stores the current control module state machine state.
        OUT_STATE_CH2: u4,
        /// This register indicate that if the channel reset is safety.
        OUT_RESET_AVAIL_CH2: u1,
        padding: u7 = 0,
    }),
    /// TX CH2 eof des addr register
    /// offset: 0x228
    OUT_EOF_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH2: u32,
    }),
    /// TX CH2 next dscr addr register
    /// offset: 0x22c
    OUT_DSCR_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the next outlink descriptor address y.
        OUTLINK_DSCR_CH2: u32,
    }),
    /// TX CH2 last dscr addr register
    /// offset: 0x230
    OUT_DSCR_BF0_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor's next address y-1.
        OUTLINK_DSCR_BF0_CH2: u32,
    }),
    /// TX CH2 second-to-last dscr addr register
    /// offset: 0x234
    OUT_DSCR_BF1_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last outlink descriptor's next address y-2.
        OUTLINK_DSCR_BF1_CH2: u32,
    }),
    /// offset: 0x238
    reserved568: [4]u8,
    /// TX CH2 arb register
    /// offset: 0x23c
    OUT_ARB_CH2: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        OUT_ARB_TOKEN_NUM_CH2: u4,
        reserved6: u2 = 0,
        /// Set the priority of channel
        INTER_OUT_ARB_PRIORITY_CH2: u1,
        padding: u25 = 0,
    }),
    /// offset: 0x240
    reserved576: [40]u8,
    /// TX CH2 ETM config register
    /// offset: 0x268
    OUT_ETM_CONF_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 to enable ETM task function
        OUT_ETM_EN_CH2: u1,
        /// when this bit is 1, dscr can be processed after receiving a task
        OUT_ETM_LOOP_EN_CH2: u1,
        /// ETM dscr_ready maximum cache numbers
        OUT_DSCR_TASK_MAK_CH2: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x26c
    reserved620: [4]u8,
    /// tx CH2 buf len register
    /// offset: 0x270
    OUT_BUF_LEN_CH2: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_BUF_LEN_HB_CH2: u13,
        padding: u19 = 0,
    }),
    /// tx CH2 fifo byte cnt register
    /// offset: 0x274
    OUT_FIFO_BCNT_CH2: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_OUTFIFO_BCNT_CH2: u10,
        padding: u22 = 0,
    }),
    /// tx CH2 push byte cnt register
    /// offset: 0x278
    OUT_PUSH_BYTECNT_CH2: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_PUSH_BYTECNT_CH2: u8,
        padding: u24 = 0,
    }),
    /// tx CH2 xaddr register
    /// offset: 0x27c
    OUT_XADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_XADDR_CH2: u32,
    }),
    /// offset: 0x280
    reserved640: [128]u8,
    /// TX CH3 config0 register
    /// offset: 0x300
    OUT_CONF0_CH3: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable automatic outlink-writeback when all the data pointed by outlink descriptor has been received.
        OUT_AUTO_WRBACK_CH3: u1,
        /// EOF flag generation mode when receiving data. 1: EOF flag for Tx channel 0 is generated when data need to read has been popped from FIFO in DMA
        OUT_EOF_MODE_CH3: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 0 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH3: u1,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        OUT_ECC_AES_EN_CH3: u1,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH3: u1,
        reserved6: u1 = 0,
        /// Block size of Tx channel 3. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 bytes
        OUT_MEM_BURST_LENGTH_CH3: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI read data don't cross the address boundary which define by mem_burst_length
        OUT_PAGE_BOUND_EN_CH3: u1,
        reserved26: u13 = 0,
        /// Set this bit to 1 to disable arbiter optimum weight function.
        OUT_ARB_WEIGHT_OPT_DIS_CH3: u1,
        padding: u5 = 0,
    }),
    /// TX CH3 interrupt raw register
    /// offset: 0x304
    OUT_INT_RAW_CH3: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel 0.
        OUT_DONE_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel 0.
        OUT_EOF_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error, including owner error, the second and third word error of outlink descriptor for Tx channel 0.
        OUT_DSCR_ERR_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel 0.
        OUT_TOTAL_EOF_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is overflow.
        OUTFIFO_OVF_L1_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is underflow.
        OUTFIFO_UDF_L1_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is overflow.
        OUTFIFO_OVF_L2_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is underflow.
        OUTFIFO_UDF_L2_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when dscr ready task fifo is overflow.
        OUT_DSCR_TASK_OVF_CH3_INT_RAW: u1,
        padding: u23 = 0,
    }),
    /// TX CH3 interrupt ena register
    /// offset: 0x308
    OUT_INT_ENA_CH3: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH3_INT_ENA: u1,
        padding: u23 = 0,
    }),
    /// TX CH3 interrupt st register
    /// offset: 0x30c
    OUT_INT_ST_CH3: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH3_INT_ST: u1,
        padding: u23 = 0,
    }),
    /// TX CH3 interrupt clr register
    /// offset: 0x310
    OUT_INT_CLR_CH3: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH3_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH3_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH3_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH3_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH3_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH3_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH3_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH3_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH3_INT_CLR: u1,
        padding: u23 = 0,
    }),
    /// TX CH3 outfifo status register
    /// offset: 0x314
    OUTFIFO_STATUS_CH3: mmio.Mmio(packed struct(u32) {
        /// Tx FIFO full signal for Tx channel 2.
        OUTFIFO_FULL_L2_CH3: u1,
        /// Tx FIFO empty signal for Tx channel 2.
        OUTFIFO_EMPTY_L2_CH3: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 2.
        OUTFIFO_CNT_L2_CH3: u4,
        /// Tx FIFO full signal for Tx channel 2.
        OUTFIFO_FULL_L1_CH3: u1,
        /// Tx FIFO empty signal for Tx channel 2.
        OUTFIFO_EMPTY_L1_CH3: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 2.
        OUTFIFO_CNT_L1_CH3: u5,
        reserved16: u3 = 0,
        /// Tx FIFO full signal for Tx channel 2.
        OUTFIFO_FULL_L3_CH3: u1,
        /// Tx FIFO empty signal for Tx channel 2.
        OUTFIFO_EMPTY_L3_CH3: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 2.
        OUTFIFO_CNT_L3_CH3: u2,
        padding: u12 = 0,
    }),
    /// TX CH3 outfifo push register
    /// offset: 0x318
    OUT_PUSH_CH3: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into DMA Tx FIFO.
        OUTFIFO_WDATA_CH3: u10,
        /// Set this bit to push data into DMA Tx FIFO.
        OUTFIFO_PUSH_CH3: u1,
        padding: u21 = 0,
    }),
    /// TX CH3 out_link dscr ctrl register
    /// offset: 0x31c
    OUT_LINK_CONF_CH3: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH3: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH3: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH3: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH3: u1,
        padding: u8 = 0,
    }),
    /// TX CH3 out_link dscr addr register
    /// offset: 0x320
    OUT_LINK_ADDR_CH3: mmio.Mmio(packed struct(u32) {
        /// This register stores the first outlink descriptor's address.
        OUTLINK_ADDR_CH3: u32,
    }),
    /// TX CH3 state register
    /// offset: 0x324
    OUT_STATE_CH3: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH3: u18,
        /// This register stores the current descriptor state machine state.
        OUT_DSCR_STATE_CH3: u2,
        /// This register stores the current control module state machine state.
        OUT_STATE_CH3: u4,
        padding: u8 = 0,
    }),
    /// TX CH3 eof des addr register
    /// offset: 0x328
    OUT_EOF_DES_ADDR_CH3: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH3: u32,
    }),
    /// TX CH3 next dscr addr register
    /// offset: 0x32c
    OUT_DSCR_CH3: mmio.Mmio(packed struct(u32) {
        /// The address of the next outlink descriptor address y.
        OUTLINK_DSCR_CH3: u32,
    }),
    /// TX CH3 last dscr addr register
    /// offset: 0x330
    OUT_DSCR_BF0_CH3: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor's next address y-1.
        OUTLINK_DSCR_BF0_CH3: u32,
    }),
    /// TX CH3 second-to-last dscr addr register
    /// offset: 0x334
    OUT_DSCR_BF1_CH3: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last outlink descriptor's next address y-2.
        OUTLINK_DSCR_BF1_CH3: u32,
    }),
    /// offset: 0x338
    reserved824: [4]u8,
    /// TX CH3 arb register
    /// offset: 0x33c
    OUT_ARB_CH3: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        OUT_ARB_TOKEN_NUM_CH3: u4,
        /// Set the priority of channel
        EXTER_OUT_ARB_PRIORITY_CH3: u2,
        padding: u26 = 0,
    }),
    /// offset: 0x340
    reserved832: [40]u8,
    /// TX CH3 ETM config register
    /// offset: 0x368
    OUT_ETM_CONF_CH3: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 to enable ETM task function
        OUT_ETM_EN_CH3: u1,
        /// when this bit is 1, dscr can be processed after receiving a task
        OUT_ETM_LOOP_EN_CH3: u1,
        /// ETM dscr_ready maximum cache numbers
        OUT_DSCR_TASK_MAK_CH3: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x36c
    reserved876: [4]u8,
    /// tx CH3 buf len register
    /// offset: 0x370
    OUT_BUF_LEN_CH3: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_BUF_LEN_HB_CH3: u13,
        padding: u19 = 0,
    }),
    /// tx CH3 fifo byte cnt register
    /// offset: 0x374
    OUT_FIFO_BCNT_CH3: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_OUTFIFO_BCNT_CH3: u10,
        padding: u22 = 0,
    }),
    /// tx CH3 push byte cnt register
    /// offset: 0x378
    OUT_PUSH_BYTECNT_CH3: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_PUSH_BYTECNT_CH3: u8,
        padding: u24 = 0,
    }),
    /// tx CH3 xaddr register
    /// offset: 0x37c
    OUT_XADDR_CH3: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_XADDR_CH3: u32,
    }),
    /// tx CH3 block buf len register
    /// offset: 0x380
    OUT_BLOCK_BUF_LEN_CH3: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_BLOCK_BUF_LEN_CH3: u28,
        padding: u4 = 0,
    }),
    /// offset: 0x384
    reserved900: [124]u8,
    /// TX CH4 config0 register
    /// offset: 0x400
    OUT_CONF0_CH4: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable automatic outlink-writeback when all the data pointed by outlink descriptor has been received.
        OUT_AUTO_WRBACK_CH4: u1,
        /// EOF flag generation mode when receiving data. 1: EOF flag for Tx channel 0 is generated when data need to read has been popped from FIFO in DMA
        OUT_EOF_MODE_CH4: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 0 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH4: u1,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        OUT_ECC_AES_EN_CH4: u1,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH4: u1,
        reserved6: u1 = 0,
        /// Block size of Tx channel 4. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 bytes
        OUT_MEM_BURST_LENGTH_CH4: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI read data don't cross the address boundary which define by mem_burst_length
        OUT_PAGE_BOUND_EN_CH4: u1,
        reserved26: u13 = 0,
        /// Set this bit to 1 to disable arbiter optimum weight function.
        OUT_ARB_WEIGHT_OPT_DIS_CH4: u1,
        padding: u5 = 0,
    }),
    /// TX CH4 interrupt raw register
    /// offset: 0x404
    OUT_INT_RAW_CH4: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel 0.
        OUT_DONE_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel 0.
        OUT_EOF_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error, including owner error, the second and third word error of outlink descriptor for Tx channel 0.
        OUT_DSCR_ERR_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel 0.
        OUT_TOTAL_EOF_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is overflow.
        OUTFIFO_OVF_L1_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is underflow.
        OUTFIFO_UDF_L1_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is overflow.
        OUTFIFO_OVF_L2_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo is underflow.
        OUTFIFO_UDF_L2_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when dscr ready task fifo is overflow.
        OUT_DSCR_TASK_OVF_CH4_INT_RAW: u1,
        padding: u23 = 0,
    }),
    /// TX CH4 interrupt ena register
    /// offset: 0x408
    OUT_INT_ENA_CH4: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH4_INT_ENA: u1,
        padding: u23 = 0,
    }),
    /// TX CH4 interrupt st register
    /// offset: 0x40c
    OUT_INT_ST_CH4: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH4_INT_ST: u1,
        padding: u23 = 0,
    }),
    /// TX CH4 interrupt clr register
    /// offset: 0x410
    OUT_INT_CLR_CH4: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH4_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH4_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH4_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH4_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_L1_CH4_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_L1_CH4_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_OVF_L2_CH4_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_UDF_L2_CH4_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_TASK_OVF_CH_INT interrupt.
        OUT_DSCR_TASK_OVF_CH4_INT_CLR: u1,
        padding: u23 = 0,
    }),
    /// TX CH4 outfifo status register
    /// offset: 0x414
    OUTFIFO_STATUS_CH4: mmio.Mmio(packed struct(u32) {
        /// Tx FIFO full signal for Tx channel 2.
        OUTFIFO_FULL_L2_CH4: u1,
        /// Tx FIFO empty signal for Tx channel 2.
        OUTFIFO_EMPTY_L2_CH4: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 2.
        OUTFIFO_CNT_L2_CH4: u4,
        /// Tx FIFO full signal for Tx channel 2.
        OUTFIFO_FULL_L1_CH4: u1,
        /// Tx FIFO empty signal for Tx channel 2.
        OUTFIFO_EMPTY_L1_CH4: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 2.
        OUTFIFO_CNT_L1_CH4: u5,
        reserved16: u3 = 0,
        /// Tx FIFO full signal for Tx channel 2.
        OUTFIFO_FULL_L3_CH4: u1,
        /// Tx FIFO empty signal for Tx channel 2.
        OUTFIFO_EMPTY_L3_CH4: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 2.
        OUTFIFO_CNT_L3_CH4: u2,
        padding: u12 = 0,
    }),
    /// TX CH4 outfifo push register
    /// offset: 0x418
    OUT_PUSH_CH4: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into DMA Tx FIFO.
        OUTFIFO_WDATA_CH4: u10,
        /// Set this bit to push data into DMA Tx FIFO.
        OUTFIFO_PUSH_CH4: u1,
        padding: u21 = 0,
    }),
    /// TX CH4 out_link dscr ctrl register
    /// offset: 0x41c
    OUT_LINK_CONF_CH4: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH4: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH4: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH4: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH4: u1,
        padding: u8 = 0,
    }),
    /// TX CH4 out_link dscr addr register
    /// offset: 0x420
    OUT_LINK_ADDR_CH4: mmio.Mmio(packed struct(u32) {
        /// This register stores the first outlink descriptor's address.
        OUTLINK_ADDR_CH4: u32,
    }),
    /// TX CH4 state register
    /// offset: 0x424
    OUT_STATE_CH4: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH4: u18,
        /// This register stores the current descriptor state machine state.
        OUT_DSCR_STATE_CH4: u2,
        /// This register stores the current control module state machine state.
        OUT_STATE_CH4: u4,
        padding: u8 = 0,
    }),
    /// TX CH4 eof des addr register
    /// offset: 0x428
    OUT_EOF_DES_ADDR_CH4: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH4: u32,
    }),
    /// TX CH4 next dscr addr register
    /// offset: 0x42c
    OUT_DSCR_CH4: mmio.Mmio(packed struct(u32) {
        /// The address of the next outlink descriptor address y.
        OUTLINK_DSCR_CH4: u32,
    }),
    /// TX CH4 last dscr addr register
    /// offset: 0x430
    OUT_DSCR_BF0_CH4: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor's next address y-1.
        OUTLINK_DSCR_BF0_CH4: u32,
    }),
    /// TX CH4 second-to-last dscr addr register
    /// offset: 0x434
    OUT_DSCR_BF1_CH4: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last outlink descriptor's next address y-2.
        OUTLINK_DSCR_BF1_CH4: u32,
    }),
    /// offset: 0x438
    reserved1080: [4]u8,
    /// TX CH4 arb register
    /// offset: 0x43c
    OUT_ARB_CH4: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        OUT_ARB_TOKEN_NUM_CH4: u4,
        /// Set the priority of channel
        EXTER_OUT_ARB_PRIORITY_CH4: u2,
        padding: u26 = 0,
    }),
    /// offset: 0x440
    reserved1088: [40]u8,
    /// TX CH4 ETM config register
    /// offset: 0x468
    OUT_ETM_CONF_CH4: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 to enable ETM task function
        OUT_ETM_EN_CH4: u1,
        /// when this bit is 1, dscr can be processed after receiving a task
        OUT_ETM_LOOP_EN_CH4: u1,
        /// ETM dscr_ready maximum cache numbers
        OUT_DSCR_TASK_MAK_CH4: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x46c
    reserved1132: [4]u8,
    /// tx CH4 buf len register
    /// offset: 0x470
    OUT_BUF_LEN_CH4: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_BUF_LEN_HB_CH4: u13,
        padding: u19 = 0,
    }),
    /// tx CH4 fifo byte cnt register
    /// offset: 0x474
    OUT_FIFO_BCNT_CH4: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_OUTFIFO_BCNT_CH4: u10,
        padding: u22 = 0,
    }),
    /// tx CH4 push byte cnt register
    /// offset: 0x478
    OUT_PUSH_BYTECNT_CH4: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_PUSH_BYTECNT_CH4: u8,
        padding: u24 = 0,
    }),
    /// tx CH4 xaddr register
    /// offset: 0x47c
    OUT_XADDR_CH4: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_CMDFIFO_XADDR_CH4: u32,
    }),
    /// tx CH4 block buf len register
    /// offset: 0x480
    OUT_BLOCK_BUF_LEN_CH4: mmio.Mmio(packed struct(u32) {
        /// only for debug
        OUT_BLOCK_BUF_LEN_CH4: u28,
        padding: u4 = 0,
    }),
    /// offset: 0x484
    reserved1156: [124]u8,
    /// RX CH0 config0 register
    /// offset: 0x500
    IN_CONF0_CH0: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Set this bit to 1 to enable INCR burst transfer for Rx transmitting link descriptor when accessing SRAM.
        INDSCR_BURST_EN_CH0: u1,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        IN_ECC_AES_EN_CH0: u1,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH0: u1,
        reserved6: u1 = 0,
        /// Block size of Rx channel 0. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 bytes
        IN_MEM_BURST_LENGTH_CH0: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI write data don't cross the address boundary which define by mem_burst_length
        IN_PAGE_BOUND_EN_CH0: u1,
        reserved24: u11 = 0,
        /// Write 1 then write 0 to this bit to reset Rx channel
        IN_RST_CH0: u1,
        /// Write 1 before reset and write 0 after reset
        IN_CMD_DISABLE_CH0: u1,
        /// Set this bit to 1 to disable arbiter optimum weight function.
        IN_ARB_WEIGHT_OPT_DIS_CH0: u1,
        padding: u5 = 0,
    }),
    /// RX CH0 interrupt raw register
    /// offset: 0x504
    IN_INT_RAW_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been transmitted to peripherals for Rx channel 0.
        IN_DONE_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 0.
        IN_SUC_EOF_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and data error is detected
        IN_ERR_EOF_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error, including owner error, the second and third word error of inlink descriptor for Rx channel 0.
        IN_DSCR_ERR_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L1_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L1_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L2_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L2_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last descriptor is done but fifo also remain data.
        IN_DSCR_EMPTY_CH0_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when dscr ready task fifo is overflow.
        IN_DSCR_TASK_OVF_CH0_INT_RAW: u1,
        padding: u22 = 0,
    }),
    /// RX CH0 interrupt ena register
    /// offset: 0x508
    IN_INT_ENA_CH0: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH0_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH0_INT_ENA: u1,
        padding: u22 = 0,
    }),
    /// RX CH0 interrupt st register
    /// offset: 0x50c
    IN_INT_ST_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH0_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH0_INT_ST: u1,
        padding: u22 = 0,
    }),
    /// RX CH0 interrupt clr register
    /// offset: 0x510
    IN_INT_CLR_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH0_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH0_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH0_INT_CLR: u1,
        /// Set this bit to clear the INDSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH0_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH0_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH0_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH0_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH0_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH0_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH0_INT_CLR: u1,
        padding: u22 = 0,
    }),
    /// RX CH0 INFIFO status register
    /// offset: 0x514
    INFIFO_STATUS_CH0: mmio.Mmio(packed struct(u32) {
        /// Rx FIFO full signal for Rx channel.
        INFIFO_FULL_L2_CH0: u1,
        /// Rx FIFO empty signal for Rx channel.
        INFIFO_EMPTY_L2_CH0: u1,
        /// The register stores the byte number of the data in Rx FIFO for Rx channel.
        INFIFO_CNT_L2_CH0: u4,
        /// Tx FIFO full signal for Tx channel 0.
        INFIFO_FULL_L1_CH0: u1,
        /// Tx FIFO empty signal for Tx channel 0.
        INFIFO_EMPTY_L1_CH0: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 0.
        INFIFO_CNT_L1_CH0: u5,
        reserved16: u3 = 0,
        /// Tx FIFO full signal for Tx channel 0.
        INFIFO_FULL_L3_CH0: u1,
        /// Tx FIFO empty signal for Tx channel 0.
        INFIFO_EMPTY_L3_CH0: u1,
        /// The register stores the 8byte number of the data in Tx FIFO for Tx channel 0.
        INFIFO_CNT_L3_CH0: u2,
        padding: u12 = 0,
    }),
    /// RX CH0 INFIFO pop register
    /// offset: 0x518
    IN_POP_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from DMA Rx FIFO.
        INFIFO_RDATA_CH0: u11,
        /// Set this bit to pop data from DMA Rx FIFO.
        INFIFO_POP_CH0: u1,
        padding: u20 = 0,
    }),
    /// RX CH0 in_link dscr ctrl register
    /// offset: 0x51c
    IN_LINK_CONF_CH0: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Set this bit to return to current inlink descriptor's address, when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH0: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH0: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH0: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH0: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH0: u1,
        padding: u7 = 0,
    }),
    /// RX CH0 in_link dscr addr register
    /// offset: 0x520
    IN_LINK_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the first inlink descriptor's address.
        INLINK_ADDR_CH0: u32,
    }),
    /// RX CH0 state register
    /// offset: 0x524
    IN_STATE_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH0: u18,
        /// This register stores the current descriptor state machine state.
        IN_DSCR_STATE_CH0: u2,
        /// This register stores the current control module state machine state.
        IN_STATE_CH0: u3,
        /// This register indicate that if the channel reset is safety.
        IN_RESET_AVAIL_CH0: u1,
        padding: u8 = 0,
    }),
    /// RX CH0 eof des addr register
    /// offset: 0x528
    IN_SUC_EOF_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH0: u32,
    }),
    /// RX CH0 err eof des addr register
    /// offset: 0x52c
    IN_ERR_EOF_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data.
        IN_ERR_EOF_DES_ADDR_CH0: u32,
    }),
    /// RX CH0 next dscr addr register
    /// offset: 0x530
    IN_DSCR_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the next inlink descriptor address x.
        INLINK_DSCR_CH0: u32,
    }),
    /// RX CH0 last dscr addr register
    /// offset: 0x534
    IN_DSCR_BF0_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor's next address x-1.
        INLINK_DSCR_BF0_CH0: u32,
    }),
    /// RX CH0 second-to-last dscr addr register
    /// offset: 0x538
    IN_DSCR_BF1_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor's next address x-2.
        INLINK_DSCR_BF1_CH0: u32,
    }),
    /// offset: 0x53c
    reserved1340: [4]u8,
    /// RX CH0 arb register
    /// offset: 0x540
    IN_ARB_CH0: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        IN_ARB_TOKEN_NUM_CH0: u4,
        /// Set the priority of channel
        EXTER_IN_ARB_PRIORITY_CH0: u2,
        /// Set the priority of channel
        INTER_IN_ARB_PRIORITY_CH0: u3,
        padding: u23 = 0,
    }),
    /// offset: 0x544
    reserved1348: [4]u8,
    /// RX CH0 reorder power config register
    /// offset: 0x548
    IN_RO_PD_CONF_CH0: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// 1: Force to open the clock and bypass the gate-clock when accessing the RAM in DMA. 0: A gate-clock will be used when accessing the RAM in DMA.
        IN_RO_RAM_CLK_FO_CH0: u1,
        padding: u25 = 0,
    }),
    /// offset: 0x54c
    reserved1356: [32]u8,
    /// RX CH0 ETM config register
    /// offset: 0x56c
    IN_ETM_CONF_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 to enable ETM task function
        IN_ETM_EN_CH0: u1,
        /// when this bit is 1, dscr can be processed after receiving a task
        IN_ETM_LOOP_EN_CH0: u1,
        /// ETM dscr_ready maximum cache numbers
        IN_DSCR_TASK_MAK_CH0: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x570
    reserved1392: [16]u8,
    /// rx CH0 fifo cnt register
    /// offset: 0x580
    IN_FIFO_CNT_CH0: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_INFIFO_CNT_CH0: u10,
        padding: u22 = 0,
    }),
    /// rx CH0 pop data cnt register
    /// offset: 0x584
    IN_POP_DATA_CNT_CH0: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_POP_DATA_CNT_CH0: u8,
        padding: u24 = 0,
    }),
    /// rx CH0 xaddr register
    /// offset: 0x588
    IN_XADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_XADDR_CH0: u32,
    }),
    /// rx CH0 buf len hb rcv register
    /// offset: 0x58c
    IN_BUF_HB_RCV_CH0: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_BUF_HB_RCV_CH0: u29,
        padding: u3 = 0,
    }),
    /// offset: 0x590
    reserved1424: [112]u8,
    /// RX CH1 config0 register
    /// offset: 0x600
    IN_CONF0_CH1: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Set this bit to 1 to enable INCR burst transfer for Rx transmitting link descriptor when accessing SRAM.
        INDSCR_BURST_EN_CH1: u1,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        IN_ECC_AES_EN_CH1: u1,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH1: u1,
        reserved6: u1 = 0,
        /// Block size of Rx channel 1. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 bytes
        IN_MEM_BURST_LENGTH_CH1: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI write data don't cross the address boundary which define by mem_burst_length
        IN_PAGE_BOUND_EN_CH1: u1,
        reserved24: u11 = 0,
        /// Write 1 then write 0 to this bit to reset Rx channel
        IN_RST_CH1: u1,
        /// Write 1 before reset and write 0 after reset
        IN_CMD_DISABLE_CH1: u1,
        /// Set this bit to 1 to disable arbiter optimum weight function.
        IN_ARB_WEIGHT_OPT_DIS_CH1: u1,
        padding: u5 = 0,
    }),
    /// RX CH1 interrupt raw register
    /// offset: 0x604
    IN_INT_RAW_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been transmitted to peripherals for Rx channel 1.
        IN_DONE_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 1.
        IN_SUC_EOF_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and data error is detected
        IN_ERR_EOF_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error, including owner error, the second and third word error of inlink descriptor for Rx channel 1.
        IN_DSCR_ERR_CH1_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L1_CH1_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L1_CH1_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L2_CH1_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L2_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last descriptor is done but fifo also remain data.
        IN_DSCR_EMPTY_CH1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when dscr ready task fifo is overflow.
        IN_DSCR_TASK_OVF_CH1_INT_RAW: u1,
        padding: u22 = 0,
    }),
    /// RX CH1 interrupt ena register
    /// offset: 0x608
    IN_INT_ENA_CH1: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH1_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH1_INT_ENA: u1,
        padding: u22 = 0,
    }),
    /// RX CH1 interrupt st register
    /// offset: 0x60c
    IN_INT_ST_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH1_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH1_INT_ST: u1,
        padding: u22 = 0,
    }),
    /// RX CH1 interrupt clr register
    /// offset: 0x610
    IN_INT_CLR_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH1_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH1_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH1_INT_CLR: u1,
        /// Set this bit to clear the INDSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH1_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH1_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH1_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH1_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH1_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH1_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH1_INT_CLR: u1,
        padding: u22 = 0,
    }),
    /// RX CH1 INFIFO status register
    /// offset: 0x614
    INFIFO_STATUS_CH1: mmio.Mmio(packed struct(u32) {
        /// Rx FIFO full signal for Rx channel.
        INFIFO_FULL_L2_CH1: u1,
        /// Rx FIFO empty signal for Rx channel.
        INFIFO_EMPTY_L2_CH1: u1,
        /// The register stores the byte number of the data in Rx FIFO for Rx channel.
        INFIFO_CNT_L2_CH1: u4,
        /// Tx FIFO full signal for Tx channel 1.
        INFIFO_FULL_L1_CH1: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        INFIFO_EMPTY_L1_CH1: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        INFIFO_CNT_L1_CH1: u5,
        reserved16: u3 = 0,
        /// Tx FIFO full signal for Tx channel 1.
        INFIFO_FULL_L3_CH1: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        INFIFO_EMPTY_L3_CH1: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        INFIFO_CNT_L3_CH1: u2,
        padding: u12 = 0,
    }),
    /// RX CH1 INFIFO pop register
    /// offset: 0x618
    IN_POP_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from DMA Rx FIFO.
        INFIFO_RDATA_CH1: u11,
        /// Set this bit to pop data from DMA Rx FIFO.
        INFIFO_POP_CH1: u1,
        padding: u20 = 0,
    }),
    /// RX CH1 in_link dscr ctrl register
    /// offset: 0x61c
    IN_LINK_CONF_CH1: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Set this bit to return to current inlink descriptor's address, when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH1: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH1: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH1: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH1: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH1: u1,
        padding: u7 = 0,
    }),
    /// RX CH1 in_link dscr addr register
    /// offset: 0x620
    IN_LINK_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the first inlink descriptor's address.
        INLINK_ADDR_CH1: u32,
    }),
    /// RX CH1 state register
    /// offset: 0x624
    IN_STATE_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH1: u18,
        /// This register stores the current descriptor state machine state.
        IN_DSCR_STATE_CH1: u2,
        /// This register stores the current control module state machine state.
        IN_STATE_CH1: u3,
        /// This register indicate that if the channel reset is safety.
        IN_RESET_AVAIL_CH1: u1,
        padding: u8 = 0,
    }),
    /// RX CH1 eof des addr register
    /// offset: 0x628
    IN_SUC_EOF_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH1: u32,
    }),
    /// RX CH1 err eof des addr register
    /// offset: 0x62c
    IN_ERR_EOF_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data.
        IN_ERR_EOF_DES_ADDR_CH1: u32,
    }),
    /// RX CH1 next dscr addr register
    /// offset: 0x630
    IN_DSCR_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the next inlink descriptor address x.
        INLINK_DSCR_CH1: u32,
    }),
    /// RX CH1 last dscr addr register
    /// offset: 0x634
    IN_DSCR_BF0_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor's next address x-1.
        INLINK_DSCR_BF0_CH1: u32,
    }),
    /// RX CH1 second-to-last dscr addr register
    /// offset: 0x638
    IN_DSCR_BF1_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor's next address x-2.
        INLINK_DSCR_BF1_CH1: u32,
    }),
    /// offset: 0x63c
    reserved1596: [4]u8,
    /// RX CH1 arb register
    /// offset: 0x640
    IN_ARB_CH1: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        IN_ARB_TOKEN_NUM_CH1: u4,
        /// Set the priority of channel
        EXTER_IN_ARB_PRIORITY_CH1: u2,
        /// Set the priority of channel
        INTER_IN_ARB_PRIORITY_CH1: u3,
        padding: u23 = 0,
    }),
    /// offset: 0x644
    reserved1604: [4]u8,
    /// RX CH1 ETM config register
    /// offset: 0x648
    IN_ETM_CONF_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 to enable ETM task function
        IN_ETM_EN_CH1: u1,
        /// when this bit is 1, dscr can be processed after receiving a task
        IN_ETM_LOOP_EN_CH1: u1,
        /// ETM dscr_ready maximum cache numbers
        IN_DSCR_TASK_MAK_CH1: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x64c
    reserved1612: [52]u8,
    /// rx CH1 fifo cnt register
    /// offset: 0x680
    IN_FIFO_CNT_CH1: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_INFIFO_CNT_CH1: u10,
        padding: u22 = 0,
    }),
    /// rx CH1 pop data cnt register
    /// offset: 0x684
    IN_POP_DATA_CNT_CH1: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_POP_DATA_CNT_CH1: u8,
        padding: u24 = 0,
    }),
    /// rx CH1 xaddr register
    /// offset: 0x688
    IN_XADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_XADDR_CH1: u32,
    }),
    /// rx CH1 buf len hb rcv register
    /// offset: 0x68c
    IN_BUF_HB_RCV_CH1: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_BUF_HB_RCV_CH1: u29,
        padding: u3 = 0,
    }),
    /// offset: 0x690
    reserved1680: [112]u8,
    /// RX CH2 config0 register
    /// offset: 0x700
    IN_CONF0_CH2: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Set this bit to 1 to enable INCR burst transfer for Rx transmitting link descriptor when accessing SRAM.
        INDSCR_BURST_EN_CH2: u1,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        IN_ECC_AES_EN_CH2: u1,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH2: u1,
        reserved6: u1 = 0,
        /// Block size of Rx channel 2. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 bytes
        IN_MEM_BURST_LENGTH_CH2: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI write data don't cross the address boundary which define by mem_burst_length
        IN_PAGE_BOUND_EN_CH2: u1,
        reserved24: u11 = 0,
        /// Write 1 then write 0 to this bit to reset Rx channel
        IN_RST_CH2: u1,
        /// Write 1 before reset and write 0 after reset
        IN_CMD_DISABLE_CH2: u1,
        /// Set this bit to 1 to disable arbiter optimum weight function.
        IN_ARB_WEIGHT_OPT_DIS_CH2: u1,
        padding: u5 = 0,
    }),
    /// RX CH2 interrupt raw register
    /// offset: 0x704
    IN_INT_RAW_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been transmitted to peripherals for Rx channel 1.
        IN_DONE_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 1.
        IN_SUC_EOF_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and data error is detected
        IN_ERR_EOF_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error, including owner error, the second and third word error of inlink descriptor for Rx channel 1.
        IN_DSCR_ERR_CH2_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L1_CH2_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L1_CH2_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L2_CH2_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L2_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last descriptor is done but fifo also remain data.
        IN_DSCR_EMPTY_CH2_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when dscr ready task fifo is overflow.
        IN_DSCR_TASK_OVF_CH2_INT_RAW: u1,
        padding: u22 = 0,
    }),
    /// RX CH2 interrupt ena register
    /// offset: 0x708
    IN_INT_ENA_CH2: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH2_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH2_INT_ENA: u1,
        padding: u22 = 0,
    }),
    /// RX CH2 interrupt st register
    /// offset: 0x70c
    IN_INT_ST_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH2_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH2_INT_ST: u1,
        padding: u22 = 0,
    }),
    /// RX CH2 interrupt clr register
    /// offset: 0x710
    IN_INT_CLR_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH2_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH2_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH2_INT_CLR: u1,
        /// Set this bit to clear the INDSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH2_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH2_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH2_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH2_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH2_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH2_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH2_INT_CLR: u1,
        padding: u22 = 0,
    }),
    /// RX CH2 INFIFO status register
    /// offset: 0x714
    INFIFO_STATUS_CH2: mmio.Mmio(packed struct(u32) {
        /// Rx FIFO full signal for Rx channel.
        INFIFO_FULL_L2_CH2: u1,
        /// Rx FIFO empty signal for Rx channel.
        INFIFO_EMPTY_L2_CH2: u1,
        /// The register stores the byte number of the data in Rx FIFO for Rx channel.
        INFIFO_CNT_L2_CH2: u4,
        /// Tx FIFO full signal for Tx channel 1.
        INFIFO_FULL_L1_CH2: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        INFIFO_EMPTY_L1_CH2: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        INFIFO_CNT_L1_CH2: u5,
        reserved16: u3 = 0,
        /// Tx FIFO full signal for Tx channel 1.
        INFIFO_FULL_L3_CH2: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        INFIFO_EMPTY_L3_CH2: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        INFIFO_CNT_L3_CH2: u2,
        padding: u12 = 0,
    }),
    /// RX CH2 INFIFO pop register
    /// offset: 0x718
    IN_POP_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from DMA Rx FIFO.
        INFIFO_RDATA_CH2: u11,
        /// Set this bit to pop data from DMA Rx FIFO.
        INFIFO_POP_CH2: u1,
        padding: u20 = 0,
    }),
    /// RX CH2 in_link dscr ctrl register
    /// offset: 0x71c
    IN_LINK_CONF_CH2: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Set this bit to return to current inlink descriptor's address, when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH2: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH2: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH2: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH2: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH2: u1,
        padding: u7 = 0,
    }),
    /// RX CH2 in_link dscr addr register
    /// offset: 0x720
    IN_LINK_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the first inlink descriptor's address.
        INLINK_ADDR_CH2: u32,
    }),
    /// RX CH2 state register
    /// offset: 0x724
    IN_STATE_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH2: u18,
        /// This register stores the current descriptor state machine state.
        IN_DSCR_STATE_CH2: u2,
        /// This register stores the current control module state machine state.
        IN_STATE_CH2: u3,
        /// This register indicate that if the channel reset is safety.
        IN_RESET_AVAIL_CH2: u1,
        padding: u8 = 0,
    }),
    /// RX CH2 eof des addr register
    /// offset: 0x728
    IN_SUC_EOF_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH2: u32,
    }),
    /// RX CH2 err eof des addr register
    /// offset: 0x72c
    IN_ERR_EOF_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data.
        IN_ERR_EOF_DES_ADDR_CH2: u32,
    }),
    /// RX CH2 next dscr addr register
    /// offset: 0x730
    IN_DSCR_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the next inlink descriptor address x.
        INLINK_DSCR_CH2: u32,
    }),
    /// RX CH2 last dscr addr register
    /// offset: 0x734
    IN_DSCR_BF0_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor's next address x-1.
        INLINK_DSCR_BF0_CH2: u32,
    }),
    /// RX CH2 second-to-last dscr addr register
    /// offset: 0x738
    IN_DSCR_BF1_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor's next address x-2.
        INLINK_DSCR_BF1_CH2: u32,
    }),
    /// offset: 0x73c
    reserved1852: [4]u8,
    /// RX CH2 arb register
    /// offset: 0x740
    IN_ARB_CH2: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        IN_ARB_TOKEN_NUM_CH2: u4,
        reserved6: u2 = 0,
        /// Set the priority of channel
        INTER_IN_ARB_PRIORITY_CH2: u3,
        padding: u23 = 0,
    }),
    /// offset: 0x744
    reserved1860: [4]u8,
    /// RX CH2 ETM config register
    /// offset: 0x748
    IN_ETM_CONF_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 to enable ETM task function
        IN_ETM_EN_CH2: u1,
        /// when this bit is 1, dscr can be processed after receiving a task
        IN_ETM_LOOP_EN_CH2: u1,
        /// ETM dscr_ready maximum cache numbers
        IN_DSCR_TASK_MAK_CH2: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x74c
    reserved1868: [52]u8,
    /// rx CH2 fifo cnt register
    /// offset: 0x780
    IN_FIFO_CNT_CH2: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_INFIFO_CNT_CH2: u10,
        padding: u22 = 0,
    }),
    /// rx CH2 pop data cnt register
    /// offset: 0x784
    IN_POP_DATA_CNT_CH2: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_POP_DATA_CNT_CH2: u8,
        padding: u24 = 0,
    }),
    /// rx CH2 xaddr register
    /// offset: 0x788
    IN_XADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_XADDR_CH2: u32,
    }),
    /// rx CH2 buf len hb rcv register
    /// offset: 0x78c
    IN_BUF_HB_RCV_CH2: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_BUF_HB_RCV_CH2: u29,
        padding: u3 = 0,
    }),
    /// offset: 0x790
    reserved1936: [112]u8,
    /// RX CH3 config0 register
    /// offset: 0x800
    IN_CONF0_CH3: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Set this bit to 1 to enable INCR burst transfer for Rx transmitting link descriptor when accessing SRAM.
        INDSCR_BURST_EN_CH3: u1,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        IN_ECC_AES_EN_CH3: u1,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH3: u1,
        reserved6: u1 = 0,
        /// Block size of Rx channel 1. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 bytes
        IN_MEM_BURST_LENGTH_CH3: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI write data don't cross the address boundary which define by mem_burst_length
        IN_PAGE_BOUND_EN_CH3: u1,
        reserved24: u11 = 0,
        /// Write 1 then write 0 to this bit to reset Rx channel
        IN_RST_CH3: u1,
        /// Write 1 before reset and write 0 after reset
        IN_CMD_DISABLE_CH3: u1,
        /// Set this bit to 1 to disable arbiter optimum weight function.
        IN_ARB_WEIGHT_OPT_DIS_CH3: u1,
        padding: u5 = 0,
    }),
    /// RX CH3 interrupt raw register
    /// offset: 0x804
    IN_INT_RAW_CH3: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been transmitted to peripherals for Rx channel 1.
        IN_DONE_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 1.
        IN_SUC_EOF_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and data error is detected
        IN_ERR_EOF_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error, including owner error, the second and third word error of inlink descriptor for Rx channel 1.
        IN_DSCR_ERR_CH3_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L1_CH3_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L1_CH3_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L2_CH3_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L2_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last descriptor is done but fifo also remain data.
        IN_DSCR_EMPTY_CH3_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when dscr ready task fifo is overflow.
        IN_DSCR_TASK_OVF_CH3_INT_RAW: u1,
        padding: u22 = 0,
    }),
    /// RX CH3 interrupt ena register
    /// offset: 0x808
    IN_INT_ENA_CH3: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH3_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH3_INT_ENA: u1,
        padding: u22 = 0,
    }),
    /// RX CH3 interrupt st register
    /// offset: 0x80c
    IN_INT_ST_CH3: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH3_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH3_INT_ST: u1,
        padding: u22 = 0,
    }),
    /// RX CH3 interrupt clr register
    /// offset: 0x810
    IN_INT_CLR_CH3: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH3_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH3_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH3_INT_CLR: u1,
        /// Set this bit to clear the INDSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH3_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH3_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH3_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH3_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH3_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH3_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH3_INT_CLR: u1,
        padding: u22 = 0,
    }),
    /// RX CH3 INFIFO status register
    /// offset: 0x814
    INFIFO_STATUS_CH3: mmio.Mmio(packed struct(u32) {
        /// Rx FIFO full signal for Rx channel.
        INFIFO_FULL_L2_CH3: u1,
        /// Rx FIFO empty signal for Rx channel.
        INFIFO_EMPTY_L2_CH3: u1,
        /// The register stores the byte number of the data in Rx FIFO for Rx channel.
        INFIFO_CNT_L2_CH3: u4,
        /// Tx FIFO full signal for Tx channel 1.
        INFIFO_FULL_L1_CH3: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        INFIFO_EMPTY_L1_CH3: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        INFIFO_CNT_L1_CH3: u5,
        reserved16: u3 = 0,
        /// Tx FIFO full signal for Tx channel 1.
        INFIFO_FULL_L3_CH3: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        INFIFO_EMPTY_L3_CH3: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        INFIFO_CNT_L3_CH3: u2,
        padding: u12 = 0,
    }),
    /// RX CH3 INFIFO pop register
    /// offset: 0x818
    IN_POP_CH3: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from DMA Rx FIFO.
        INFIFO_RDATA_CH3: u11,
        /// Set this bit to pop data from DMA Rx FIFO.
        INFIFO_POP_CH3: u1,
        padding: u20 = 0,
    }),
    /// RX CH3 in_link dscr ctrl register
    /// offset: 0x81c
    IN_LINK_CONF_CH3: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Set this bit to return to current inlink descriptor's address, when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH3: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH3: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH3: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH3: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH3: u1,
        padding: u7 = 0,
    }),
    /// RX CH3 in_link dscr addr register
    /// offset: 0x820
    IN_LINK_ADDR_CH3: mmio.Mmio(packed struct(u32) {
        /// This register stores the first inlink descriptor's address.
        INLINK_ADDR_CH3: u32,
    }),
    /// RX CH3 state register
    /// offset: 0x824
    IN_STATE_CH3: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH3: u18,
        /// This register stores the current descriptor state machine state.
        IN_DSCR_STATE_CH3: u2,
        /// This register stores the current control module state machine state.
        IN_STATE_CH3: u3,
        /// This register indicate that if the channel reset is safety.
        IN_RESET_AVAIL_CH3: u1,
        padding: u8 = 0,
    }),
    /// RX CH3 eof des addr register
    /// offset: 0x828
    IN_SUC_EOF_DES_ADDR_CH3: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH3: u32,
    }),
    /// RX CH3 err eof des addr register
    /// offset: 0x82c
    IN_ERR_EOF_DES_ADDR_CH3: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data.
        IN_ERR_EOF_DES_ADDR_CH3: u32,
    }),
    /// RX CH3 next dscr addr register
    /// offset: 0x830
    IN_DSCR_CH3: mmio.Mmio(packed struct(u32) {
        /// The address of the next inlink descriptor address x.
        INLINK_DSCR_CH3: u32,
    }),
    /// RX CH3 last dscr addr register
    /// offset: 0x834
    IN_DSCR_BF0_CH3: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor's next address x-1.
        INLINK_DSCR_BF0_CH3: u32,
    }),
    /// RX CH3 second-to-last dscr addr register
    /// offset: 0x838
    IN_DSCR_BF1_CH3: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor's next address x-2.
        INLINK_DSCR_BF1_CH3: u32,
    }),
    /// offset: 0x83c
    reserved2108: [4]u8,
    /// RX CH3 arb register
    /// offset: 0x840
    IN_ARB_CH3: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        IN_ARB_TOKEN_NUM_CH3: u4,
        reserved6: u2 = 0,
        /// Set the priority of channel
        INTER_IN_ARB_PRIORITY_CH3: u3,
        padding: u23 = 0,
    }),
    /// offset: 0x844
    reserved2116: [4]u8,
    /// RX CH3 ETM config register
    /// offset: 0x848
    IN_ETM_CONF_CH3: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 to enable ETM task function
        IN_ETM_EN_CH3: u1,
        /// when this bit is 1, dscr can be processed after receiving a task
        IN_ETM_LOOP_EN_CH3: u1,
        /// ETM dscr_ready maximum cache numbers
        IN_DSCR_TASK_MAK_CH3: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x84c
    reserved2124: [52]u8,
    /// rx CH3 fifo cnt register
    /// offset: 0x880
    IN_FIFO_CNT_CH3: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_INFIFO_CNT_CH3: u10,
        padding: u22 = 0,
    }),
    /// rx CH3 pop data cnt register
    /// offset: 0x884
    IN_POP_DATA_CNT_CH3: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_POP_DATA_CNT_CH3: u8,
        padding: u24 = 0,
    }),
    /// rx CH3 xaddr register
    /// offset: 0x888
    IN_XADDR_CH3: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_XADDR_CH3: u32,
    }),
    /// rx CH3 buf len hb rcv register
    /// offset: 0x88c
    IN_BUF_HB_RCV_CH3: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_BUF_HB_RCV_CH3: u29,
        padding: u3 = 0,
    }),
    /// offset: 0x890
    reserved2192: [112]u8,
    /// RX CH4 config0 register
    /// offset: 0x900
    IN_CONF0_CH4: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Set this bit to 1 to enable INCR burst transfer for Rx transmitting link descriptor when accessing SRAM.
        INDSCR_BURST_EN_CH4: u1,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        IN_ECC_AES_EN_CH4: u1,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH4: u1,
        reserved6: u1 = 0,
        /// Block size of Rx channel 1. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 bytes
        IN_MEM_BURST_LENGTH_CH4: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI write data don't cross the address boundary which define by mem_burst_length
        IN_PAGE_BOUND_EN_CH4: u1,
        reserved24: u11 = 0,
        /// Write 1 then write 0 to this bit to reset Rx channel
        IN_RST_CH4: u1,
        /// Write 1 before reset and write 0 after reset
        IN_CMD_DISABLE_CH4: u1,
        /// Set this bit to 1 to disable arbiter optimum weight function.
        IN_ARB_WEIGHT_OPT_DIS_CH4: u1,
        padding: u5 = 0,
    }),
    /// RX CH4 interrupt raw register
    /// offset: 0x904
    IN_INT_RAW_CH4: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been transmitted to peripherals for Rx channel 1.
        IN_DONE_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 1.
        IN_SUC_EOF_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and data error is detected
        IN_ERR_EOF_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error, including owner error, the second and third word error of inlink descriptor for Rx channel 1.
        IN_DSCR_ERR_CH4_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L1_CH4_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L1_CH4_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L2_CH4_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L2_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last descriptor is done but fifo also remain data.
        IN_DSCR_EMPTY_CH4_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when dscr ready task fifo is overflow.
        IN_DSCR_TASK_OVF_CH4_INT_RAW: u1,
        padding: u22 = 0,
    }),
    /// RX CH4 interrupt ena register
    /// offset: 0x908
    IN_INT_ENA_CH4: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH4_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH4_INT_ENA: u1,
        padding: u22 = 0,
    }),
    /// RX CH4 interrupt st register
    /// offset: 0x90c
    IN_INT_ST_CH4: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH4_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH4_INT_ST: u1,
        padding: u22 = 0,
    }),
    /// RX CH4 interrupt clr register
    /// offset: 0x910
    IN_INT_CLR_CH4: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH4_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH4_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH4_INT_CLR: u1,
        /// Set this bit to clear the INDSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH4_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH4_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH4_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_OVF_L2_CH4_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_UDF_L2_CH4_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH4_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_TASK_OVF_CH_INT interrupt.
        IN_DSCR_TASK_OVF_CH4_INT_CLR: u1,
        padding: u22 = 0,
    }),
    /// RX CH4 INFIFO status register
    /// offset: 0x914
    INFIFO_STATUS_CH4: mmio.Mmio(packed struct(u32) {
        /// Rx FIFO full signal for Rx channel.
        INFIFO_FULL_L2_CH4: u1,
        /// Rx FIFO empty signal for Rx channel.
        INFIFO_EMPTY_L2_CH4: u1,
        /// The register stores the byte number of the data in Rx FIFO for Rx channel.
        INFIFO_CNT_L2_CH4: u4,
        /// Tx FIFO full signal for Tx channel 1.
        INFIFO_FULL_L1_CH4: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        INFIFO_EMPTY_L1_CH4: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        INFIFO_CNT_L1_CH4: u5,
        reserved16: u3 = 0,
        /// Tx FIFO full signal for Tx channel 1.
        INFIFO_FULL_L3_CH4: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        INFIFO_EMPTY_L3_CH4: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        INFIFO_CNT_L3_CH4: u2,
        padding: u12 = 0,
    }),
    /// RX CH4 INFIFO pop register
    /// offset: 0x918
    IN_POP_CH4: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from DMA Rx FIFO.
        INFIFO_RDATA_CH4: u11,
        /// Set this bit to pop data from DMA Rx FIFO.
        INFIFO_POP_CH4: u1,
        padding: u20 = 0,
    }),
    /// RX CH4 in_link dscr ctrl register
    /// offset: 0x91c
    IN_LINK_CONF_CH4: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// Set this bit to return to current inlink descriptor's address, when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH4: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH4: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH4: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH4: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH4: u1,
        padding: u7 = 0,
    }),
    /// RX CH4 in_link dscr addr register
    /// offset: 0x920
    IN_LINK_ADDR_CH4: mmio.Mmio(packed struct(u32) {
        /// This register stores the first inlink descriptor's address.
        INLINK_ADDR_CH4: u32,
    }),
    /// RX CH4 state register
    /// offset: 0x924
    IN_STATE_CH4: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH4: u18,
        /// This register stores the current descriptor state machine state.
        IN_DSCR_STATE_CH4: u2,
        /// This register stores the current control module state machine state.
        IN_STATE_CH4: u3,
        /// This register indicate that if the channel reset is safety.
        IN_RESET_AVAIL_CH4: u1,
        padding: u8 = 0,
    }),
    /// RX CH4 eof des addr register
    /// offset: 0x928
    IN_SUC_EOF_DES_ADDR_CH4: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH4: u32,
    }),
    /// RX CH4 err eof des addr register
    /// offset: 0x92c
    IN_ERR_EOF_DES_ADDR_CH4: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data.
        IN_ERR_EOF_DES_ADDR_CH4: u32,
    }),
    /// RX CH4 next dscr addr register
    /// offset: 0x930
    IN_DSCR_CH4: mmio.Mmio(packed struct(u32) {
        /// The address of the next inlink descriptor address x.
        INLINK_DSCR_CH4: u32,
    }),
    /// RX CH4 last dscr addr register
    /// offset: 0x934
    IN_DSCR_BF0_CH4: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor's next address x-1.
        INLINK_DSCR_BF0_CH4: u32,
    }),
    /// RX CH4 second-to-last dscr addr register
    /// offset: 0x938
    IN_DSCR_BF1_CH4: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor's next address x-2.
        INLINK_DSCR_BF1_CH4: u32,
    }),
    /// offset: 0x93c
    reserved2364: [4]u8,
    /// RX CH4 arb register
    /// offset: 0x940
    IN_ARB_CH4: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        IN_ARB_TOKEN_NUM_CH4: u4,
        /// Set the priority of channel
        EXTER_IN_ARB_PRIORITY_CH4: u2,
        /// Set the priority of channel
        INTER_IN_ARB_PRIORITY_CH4: u3,
        padding: u23 = 0,
    }),
    /// offset: 0x944
    reserved2372: [4]u8,
    /// RX CH4 ETM config register
    /// offset: 0x948
    IN_ETM_CONF_CH4: mmio.Mmio(packed struct(u32) {
        /// Set this bit to 1 to enable ETM task function
        IN_ETM_EN_CH4: u1,
        /// when this bit is 1, dscr can be processed after receiving a task
        IN_ETM_LOOP_EN_CH4: u1,
        /// ETM dscr_ready maximum cache numbers
        IN_DSCR_TASK_MAK_CH4: u2,
        padding: u28 = 0,
    }),
    /// offset: 0x94c
    reserved2380: [52]u8,
    /// rx CH4 fifo cnt register
    /// offset: 0x980
    IN_FIFO_CNT_CH4: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_INFIFO_CNT_CH4: u10,
        padding: u22 = 0,
    }),
    /// rx CH4 pop data cnt register
    /// offset: 0x984
    IN_POP_DATA_CNT_CH4: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_POP_DATA_CNT_CH4: u8,
        padding: u24 = 0,
    }),
    /// rx CH4 xaddr register
    /// offset: 0x988
    IN_XADDR_CH4: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_XADDR_CH4: u32,
    }),
    /// rx CH4 buf len hb rcv register
    /// offset: 0x98c
    IN_BUF_HB_RCV_CH4: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_BUF_HB_RCV_CH4: u29,
        padding: u3 = 0,
    }),
    /// offset: 0x990
    reserved2448: [112]u8,
    /// RX CH5 config0 register
    /// offset: 0xa00
    IN_CONF0_CH5: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// When access address space is ecc/aes area, this bit should be set to 1. In this case, the start address of square should be 16-bit aligned. The width of square multiply byte number of one pixel should be 16-bit aligned.
        IN_ECC_AES_EN_CH5: u1,
        reserved6: u2 = 0,
        /// Block size of Rx channel 1. 0: single 1: 16 bytes 2: 32 bytes 3: 64 bytes 4: 128 bytes
        IN_MEM_BURST_LENGTH_CH5: u3,
        reserved12: u3 = 0,
        /// Set this bit to 1 to make sure AXI write data don't cross the address boundary which define by mem_burst_length
        IN_PAGE_BOUND_EN_CH5: u1,
        reserved24: u11 = 0,
        /// Write 1 then write 0 to this bit to reset Rx channel
        IN_RST_CH5: u1,
        /// Write 1 before reset and write 0 after reset
        IN_CMD_DISABLE_CH5: u1,
        padding: u6 = 0,
    }),
    /// RX CH5 config1 register
    /// offset: 0xa04
    IN_CONF1_CH5: mmio.Mmio(packed struct(u32) {
        /// RX Channel 5 destination start address
        BLOCK_START_ADDR_CH5: u32,
    }),
    /// RX CH5 config2 register
    /// offset: 0xa08
    IN_CONF2_CH5: mmio.Mmio(packed struct(u32) {
        /// The number of bytes contained in a row block 12line in RX channel 5
        BLOCK_ROW_LENGTH_12LINE_CH5: u16,
        /// The number of bytes contained in a row block 4line in RX channel 5
        BLOCK_ROW_LENGTH_4LINE_CH5: u16,
    }),
    /// RX CH5 config3 register
    /// offset: 0xa0c
    IN_CONF3_CH5: mmio.Mmio(packed struct(u32) {
        /// The number of bytes contained in a block 12line
        BLOCK_LENGTH_12LINE_CH5: u14,
        /// The number of bytes contained in a block 4line
        BLOCK_LENGTH_4LINE_CH5: u14,
        padding: u4 = 0,
    }),
    /// RX CH5 interrupt raw register
    /// offset: 0xa10
    IN_INT_RAW_CH5: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been transmitted to peripherals for Rx channel 1.
        IN_DONE_CH5_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 1.
        IN_SUC_EOF_CH5_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is overflow.
        INFIFO_OVF_L1_CH5_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        INFIFO_UDF_L1_CH5_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when fifo of Rx channel is underflow.
        FETCH_MB_COL_CNT_OVF_CH5_INT_RAW: u1,
        padding: u27 = 0,
    }),
    /// RX CH5 interrupt ena register
    /// offset: 0xa14
    IN_INT_ENA_CH5: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH5_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH5_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH5_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH5_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        FETCH_MB_COL_CNT_OVF_CH5_INT_ENA: u1,
        padding: u27 = 0,
    }),
    /// RX CH5 interrupt st register
    /// offset: 0xa18
    IN_INT_ST_CH5: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH5_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH5_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH5_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH5_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        FETCH_MB_COL_CNT_OVF_CH5_INT_ST: u1,
        padding: u27 = 0,
    }),
    /// RX CH5 interrupt clr register
    /// offset: 0xa1c
    IN_INT_CLR_CH5: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH5_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH5_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_L1_CH5_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_L1_CH5_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        FETCH_MB_COL_CNT_OVF_CH5_INT_CLR: u1,
        padding: u27 = 0,
    }),
    /// RX CH5 INFIFO status register
    /// offset: 0xa20
    INFIFO_STATUS_CH5: mmio.Mmio(packed struct(u32) {
        /// Tx FIFO full signal for Tx channel 1.
        INFIFO_FULL_L1_CH5: u1,
        /// Tx FIFO empty signal for Tx channel 1.
        INFIFO_EMPTY_L1_CH5: u1,
        /// The register stores the byte number of the data in Tx FIFO for Tx channel 1.
        INFIFO_CNT_L1_CH5: u5,
        padding: u25 = 0,
    }),
    /// RX CH5 INFIFO pop register
    /// offset: 0xa24
    IN_POP_CH5: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from DMA Rx FIFO.
        INFIFO_RDATA_CH5: u11,
        /// Set this bit to pop data from DMA Rx FIFO.
        INFIFO_POP_CH5: u1,
        padding: u20 = 0,
    }),
    /// RX CH5 state register
    /// offset: 0xa28
    IN_STATE_CH5: mmio.Mmio(packed struct(u32) {
        /// This register stores the current control module state machine state.
        IN_STATE_CH5: u3,
        /// This register indicate that if the channel reset is safety.
        IN_RESET_AVAIL_CH5: u1,
        padding: u28 = 0,
    }),
    /// offset: 0xa2c
    reserved2604: [20]u8,
    /// RX CH5 arb register
    /// offset: 0xa40
    IN_ARB_CH5: mmio.Mmio(packed struct(u32) {
        /// Set the max number of token count of arbiter
        IN_ARB_TOKEN_NUM_CH5: u4,
        reserved6: u2 = 0,
        /// Set the priority of channel
        INTER_IN_ARB_PRIORITY_CH5: u3,
        padding: u23 = 0,
    }),
    /// offset: 0xa44
    reserved2628: [60]u8,
    /// rx CH5 fifo cnt register
    /// offset: 0xa80
    IN_FIFO_CNT_CH5: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_INFIFO_CNT_CH5: u10,
        padding: u22 = 0,
    }),
    /// rx CH5 pop data cnt register
    /// offset: 0xa84
    IN_POP_DATA_CNT_CH5: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_POP_DATA_CNT_CH5: u8,
        padding: u24 = 0,
    }),
    /// rx CH5 xaddr register
    /// offset: 0xa88
    IN_XADDR_CH5: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_XADDR_CH5: u32,
    }),
    /// rx CH5 buf len hb rcv register
    /// offset: 0xa8c
    IN_BUF_HB_RCV_CH5: mmio.Mmio(packed struct(u32) {
        /// only for debug
        IN_CMDFIFO_BUF_HB_RCV_CH5: u29,
        padding: u3 = 0,
    }),
    /// offset: 0xa90
    reserved2704: [112]u8,
    /// inter memory axi err register
    /// offset: 0xb00
    INTER_AXI_ERR: mmio.Mmio(packed struct(u32) {
        /// AXI read id err cnt
        INTER_RID_ERR_CNT: u4,
        /// AXI read resp err cnt
        INTER_RRESP_ERR_CNT: u4,
        /// AXI write resp err cnt
        INTER_WRESP_ERR_CNT: u4,
        /// AXI read cmd fifo remain cmd count
        INTER_RD_FIFO_CNT: u3,
        /// AXI read backup cmd fifo remain cmd count
        INTER_RD_BAK_FIFO_CNT: u4,
        /// AXI write cmd fifo remain cmd count
        INTER_WR_FIFO_CNT: u3,
        /// AXI write backup cmd fifo remain cmd count
        INTER_WR_BAK_FIFO_CNT: u4,
        padding: u6 = 0,
    }),
    /// exter memory axi err register
    /// offset: 0xb04
    EXTER_AXI_ERR: mmio.Mmio(packed struct(u32) {
        /// AXI read id err cnt
        EXTER_RID_ERR_CNT: u4,
        /// AXI read resp err cnt
        EXTER_RRESP_ERR_CNT: u4,
        /// AXI write resp err cnt
        EXTER_WRESP_ERR_CNT: u4,
        /// AXI read cmd fifo remain cmd count
        EXTER_RD_FIFO_CNT: u3,
        /// AXI read backup cmd fifo remain cmd count
        EXTER_RD_BAK_FIFO_CNT: u4,
        /// AXI write cmd fifo remain cmd count
        EXTER_WR_FIFO_CNT: u3,
        /// AXI write backup cmd fifo remain cmd count
        EXTER_WR_BAK_FIFO_CNT: u4,
        padding: u6 = 0,
    }),
    /// axi reset config register
    /// offset: 0xb08
    RST_CONF: mmio.Mmio(packed struct(u32) {
        /// Write 1 then write 0 to this bit to reset axi master read data FIFO.
        INTER_AXIM_RD_RST: u1,
        /// Write 1 then write 0 to this bit to reset axi master write data FIFO.
        INTER_AXIM_WR_RST: u1,
        /// Write 1 then write 0 to this bit to reset axi master read data FIFO.
        EXTER_AXIM_RD_RST: u1,
        /// Write 1 then write 0 to this bit to reset axi master write data FIFO.
        EXTER_AXIM_WR_RST: u1,
        /// 1'h1: Force clock on for register. 1'h0: Support clock only when application writes registers.
        CLK_EN: u1,
        padding: u27 = 0,
    }),
    /// Start address of inter memory range0 register
    /// offset: 0xb0c
    INTER_MEM_START_ADDR0: mmio.Mmio(packed struct(u32) {
        /// The start address of accessible address space.
        ACCESS_INTER_MEM_START_ADDR0: u32,
    }),
    /// end address of inter memory range0 register
    /// offset: 0xb10
    INTER_MEM_END_ADDR0: mmio.Mmio(packed struct(u32) {
        /// The end address of accessible address space. The access address beyond this range would lead to descriptor error.
        ACCESS_INTER_MEM_END_ADDR0: u32,
    }),
    /// Start address of inter memory range1 register
    /// offset: 0xb14
    INTER_MEM_START_ADDR1: mmio.Mmio(packed struct(u32) {
        /// The start address of accessible address space.
        ACCESS_INTER_MEM_START_ADDR1: u32,
    }),
    /// end address of inter memory range1 register
    /// offset: 0xb18
    INTER_MEM_END_ADDR1: mmio.Mmio(packed struct(u32) {
        /// The end address of accessible address space. The access address beyond this range would lead to descriptor error.
        ACCESS_INTER_MEM_END_ADDR1: u32,
    }),
    /// offset: 0xb1c
    reserved2844: [4]u8,
    /// Start address of exter memory range0 register
    /// offset: 0xb20
    EXTER_MEM_START_ADDR0: mmio.Mmio(packed struct(u32) {
        /// The start address of accessible address space.
        ACCESS_EXTER_MEM_START_ADDR0: u32,
    }),
    /// end address of exter memory range0 register
    /// offset: 0xb24
    EXTER_MEM_END_ADDR0: mmio.Mmio(packed struct(u32) {
        /// The end address of accessible address space. The access address beyond this range would lead to descriptor error.
        ACCESS_EXTER_MEM_END_ADDR0: u32,
    }),
    /// Start address of exter memory range1 register
    /// offset: 0xb28
    EXTER_MEM_START_ADDR1: mmio.Mmio(packed struct(u32) {
        /// The start address of accessible address space.
        ACCESS_EXTER_MEM_START_ADDR1: u32,
    }),
    /// end address of exter memory range1 register
    /// offset: 0xb2c
    EXTER_MEM_END_ADDR1: mmio.Mmio(packed struct(u32) {
        /// The end address of accessible address space. The access address beyond this range would lead to descriptor error.
        ACCESS_EXTER_MEM_END_ADDR1: u32,
    }),
    /// reserved
    /// offset: 0xb30
    OUT_ARB_CONFIG: mmio.Mmio(packed struct(u32) {
        /// Set the max number of timeout count of arbiter
        OUT_ARB_TIMEOUT_NUM: u16,
        /// reserved
        OUT_WEIGHT_EN: u1,
        padding: u15 = 0,
    }),
    /// reserved
    /// offset: 0xb34
    IN_ARB_CONFIG: mmio.Mmio(packed struct(u32) {
        /// Set the max number of timeout count of arbiter
        IN_ARB_TIMEOUT_NUM: u16,
        /// reserved
        IN_WEIGHT_EN: u1,
        padding: u15 = 0,
    }),
    /// offset: 0xb38
    reserved2872: [4]u8,
    /// reserved
    /// offset: 0xb3c
    DATE: mmio.Mmio(packed struct(u32) {
        /// register version.
        DATE: u32,
    }),
    /// offset: 0xb40
    reserved2880: [16]u8,
    /// counter reset register
    /// offset: 0xb50
    COUNTER_RST: mmio.Mmio(packed struct(u32) {
        /// Write 1 then write 0 to this bit to reset rx ch0 counter.
        RX_CH0_EXTER_COUNTER_RST: u1,
        /// Write 1 then write 0 to this bit to reset rx ch1 counter.
        RX_CH1_EXTER_COUNTER_RST: u1,
        /// Write 1 then write 0 to this bit to reset rx ch2 counter.
        RX_CH2_INTER_COUNTER_RST: u1,
        /// Write 1 then write 0 to this bit to reset rx ch5 counter.
        RX_CH5_INTER_COUNTER_RST: u1,
        padding: u28 = 0,
    }),
    /// rx ch0 counter register
    /// offset: 0xb54
    RX_CH0_COUNTER: mmio.Mmio(packed struct(u32) {
        /// rx ch0 counter register
        RX_CH0_CNT: u23,
        padding: u9 = 0,
    }),
    /// rx ch1 counter register
    /// offset: 0xb58
    RX_CH1_COUNTER: mmio.Mmio(packed struct(u32) {
        /// rx ch1 counter register
        RX_CH1_CNT: u21,
        padding: u11 = 0,
    }),
    /// rx ch2 counter register
    /// offset: 0xb5c
    RX_CH2_COUNTER: mmio.Mmio(packed struct(u32) {
        /// rx ch2 counter register
        RX_CH2_CNT: u11,
        padding: u21 = 0,
    }),
    /// rx ch5 counter register
    /// offset: 0xb60
    RX_CH5_COUNTER: mmio.Mmio(packed struct(u32) {
        /// rx ch5 counter register
        RX_CH5_CNT: u17,
        padding: u15 = 0,
    }),
};
