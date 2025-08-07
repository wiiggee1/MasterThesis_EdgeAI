const mmio = @import("mmio");
const types = @import("../../types.zig");

/// AXI_DMA Peripheral
pub const AXI_DMA = extern struct {
    /// Raw status interrupt of channel 0
    /// offset: 0x00
    IN_INT_RAW_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0.
        IN_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0. For UHCI0 the raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 0.
        IN_SUC_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data error is detected only in the case that the peripheral is UHCI0 for Rx channel 0. For other peripherals this raw interrupt is reserved.
        IN_ERR_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error including owner error and the second and third word error of inlink descriptor for Rx channel 0.
        IN_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when Rx buffer pointed by inlink is full and receiving data is not completed but there is no more inlink for Rx channel 0.
        IN_DSCR_EMPTY_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_L1_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_L1_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_L2_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_L2_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_L3_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_L3_UDF_CH_INT_RAW: u1,
        padding: u21 = 0,
    }),
    /// Masked interrupt of channel 0
    /// offset: 0x04
    IN_INT_ST_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_L1_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_L1_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L3_CH_INT interrupt.
        INFIFO_L3_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L3_CH_INT interrupt.
        INFIFO_L3_UDF_CH_INT_ST: u1,
        padding: u21 = 0,
    }),
    /// Interrupt enable bits of channel 0
    /// offset: 0x08
    IN_INT_ENA_CH0: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_L1_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_L1_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_L2_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_L2_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L3_CH_INT interrupt.
        INFIFO_L3_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L3_CH_INT interrupt.
        INFIFO_L3_UDF_CH_INT_ENA: u1,
        padding: u21 = 0,
    }),
    /// Interrupt clear bits of channel 0
    /// offset: 0x0c
    IN_INT_CLR_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_L1_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_L1_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_L2_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_L2_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L3_CH_INT interrupt.
        INFIFO_L3_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L3_CH_INT interrupt.
        INFIFO_L3_UDF_CH_INT_CLR: u1,
        padding: u21 = 0,
    }),
    /// Configure 0 register of Rx channel 0
    /// offset: 0x10
    IN_CONF0_CH0: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AXI_DMA channel 0 Rx FSM and Rx FIFO pointer.
        IN_RST_CH: u1,
        /// reserved
        IN_LOOP_TEST_CH: u1,
        /// Set this bit 1 to enable automatic transmitting data from memory to memory via AXI_DMA.
        MEM_TRANS_EN_CH: u1,
        /// Set this bit to 1 to enable etm control mode, dma Rx channel 0 is triggered by etm task.
        IN_ETM_EN_CH: u1,
        /// 3'b000-3'b100:burst length 8byte~128byte
        IN_BURST_SIZE_SEL_CH: u3,
        /// 1:mean disable cmd of this ch0
        IN_CMD_DISABLE_CH: u1,
        /// 1: mean access ecc or aes domain,0: mean not
        IN_ECC_AEC_EN_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Rx channel 0 reading link descriptor when accessing internal SRAM.
        INDSCR_BURST_EN_CH: u1,
        padding: u22 = 0,
    }),
    /// Configure 1 register of Rx channel 0
    /// offset: 0x14
    IN_CONF1_CH0: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Receive FIFO status of Rx channel 0
    /// offset: 0x18
    INFIFO_STATUS_CH0: mmio.Mmio(packed struct(u32) {
        /// L3 Rx FIFO full signal for Rx channel 0.
        INFIFO_L3_FULL_CH: u1,
        /// L3 Rx FIFO empty signal for Rx channel 0.
        INFIFO_L3_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L3 Rx FIFO for Rx channel 0.
        INFIFO_L3_CNT_CH: u6,
        /// L3 Rx FIFO under flow signal for Rx channel 0.
        INFIFO_L3_UDF_CH: u1,
        /// L3 Rx FIFO over flow signal for Rx channel 0.
        INFIFO_L3_OVF_CH: u1,
        /// L1 Rx FIFO full signal for Rx channel 0.
        INFIFO_L1_FULL_CH: u1,
        /// L1 Rx FIFO empty signal for Rx channel 0.
        INFIFO_L1_EMPTY_CH: u1,
        /// L1 Rx FIFO under flow signal for Rx channel 0.
        INFIFO_L1_UDF_CH: u1,
        /// L1 Rx FIFO over flow signal for Rx channel 0.
        INFIFO_L1_OVF_CH: u1,
        /// L2 Rx RAM full signal for Rx channel 0.
        INFIFO_L2_FULL_CH: u1,
        /// L2 Rx RAM empty signal for Rx channel 0.
        INFIFO_L2_EMPTY_CH: u1,
        /// L2 Rx FIFO under flow signal for Rx channel 0.
        INFIFO_L2_UDF_CH: u1,
        /// L2 Rx FIFO over flow signal for Rx channel 0.
        INFIFO_L2_OVF_CH: u1,
        reserved23: u5 = 0,
        /// reserved
        IN_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_4B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_5B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_6B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_7B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_8B_CH: u1,
        /// reserved
        IN_BUF_HUNGRY_CH: u1,
    }),
    /// Pop control register of Rx channel 0
    /// offset: 0x1c
    IN_POP_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from AXI_DMA FIFO.
        INFIFO_RDATA_CH: u12,
        /// Set this bit to pop data from AXI_DMA FIFO.
        INFIFO_POP_CH: u1,
        padding: u19 = 0,
    }),
    /// Link descriptor configure and control register of Rx channel 0
    /// offset: 0x20
    IN_LINK1_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to return to current inlink descriptor's address when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH: u1,
        padding: u27 = 0,
    }),
    /// Link descriptor configure and control register of Rx channel 0
    /// offset: 0x24
    IN_LINK2_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the 20 least significant bits of the first inlink descriptor's address.
        INLINK_ADDR_CH: u32,
    }),
    /// Receive status of Rx channel 0
    /// offset: 0x28
    IN_STATE_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH: u18,
        /// reserved
        IN_DSCR_STATE_CH: u2,
        /// reserved
        IN_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Inlink descriptor address when EOF occurs of Rx channel 0
    /// offset: 0x2c
    IN_SUC_EOF_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH: u32,
    }),
    /// Inlink descriptor address when errors occur of Rx channel 0
    /// offset: 0x30
    IN_ERR_EOF_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data. Only used when peripheral is UHCI0.
        IN_ERR_EOF_DES_ADDR_CH: u32,
    }),
    /// Current inlink descriptor address of Rx channel 0
    /// offset: 0x34
    IN_DSCR_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the current inlink descriptor x.
        INLINK_DSCR_CH: u32,
    }),
    /// The last inlink descriptor address of Rx channel 0
    /// offset: 0x38
    IN_DSCR_BF0_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor x-1.
        INLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last inlink descriptor address of Rx channel 0
    /// offset: 0x3c
    IN_DSCR_BF1_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor x-2.
        INLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Rx channel 0
    /// offset: 0x40
    IN_PRI_CH0: mmio.Mmio(packed struct(u32) {
        /// The priority of Rx channel 0. The larger of the value the higher of the priority.
        RX_PRI_CH: u4,
        /// The weight of Rx channel 0
        RX_CH_ARB_WEIGH_CH: u4,
        /// 0: mean not optimazation weight function ,1: mean optimazation
        RX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u23 = 0,
    }),
    /// Peripheral selection of Rx channel 0
    /// offset: 0x44
    IN_PERI_SEL_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Rx channel 0. 0:lcdcam. 1: gpspi_2. 2: gpspi_3. 3: parl_io. 4: aes. 5: sha. 6~15: Dummy
        PERI_IN_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x48
    IN_CRC_INIT_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of rx crc initial value
        IN_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig rx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x4c
    RX_CRC_WIDTH_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_WIDTH_CH: u2,
        /// reserved
        RX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x50
    IN_CRC_CLEAR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of rx crc result
        IN_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x54
    IN_CRC_FINAL_RESULT_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of rx
        IN_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x58
    RX_CRC_EN_WR_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable rx ch0 crc 32bit on/off
        RX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x5c
    RX_CRC_EN_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x60
    RX_CRC_DATA_EN_WR_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_WR_DATA_CH: u16,
        padding: u16 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x64
    RX_CRC_DATA_EN_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// Raw status interrupt of channel 0
    /// offset: 0x68
    IN_INT_RAW_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0.
        IN_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0. For UHCI0 the raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 0.
        IN_SUC_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data error is detected only in the case that the peripheral is UHCI0 for Rx channel 0. For other peripherals this raw interrupt is reserved.
        IN_ERR_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error including owner error and the second and third word error of inlink descriptor for Rx channel 0.
        IN_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when Rx buffer pointed by inlink is full and receiving data is not completed but there is no more inlink for Rx channel 0.
        IN_DSCR_EMPTY_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_L1_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_L1_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_L2_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_L2_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_L3_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_L3_UDF_CH_INT_RAW: u1,
        padding: u21 = 0,
    }),
    /// Masked interrupt of channel 0
    /// offset: 0x6c
    IN_INT_ST_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_L1_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_L1_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L3_CH_INT interrupt.
        INFIFO_L3_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L3_CH_INT interrupt.
        INFIFO_L3_UDF_CH_INT_ST: u1,
        padding: u21 = 0,
    }),
    /// Interrupt enable bits of channel 0
    /// offset: 0x70
    IN_INT_ENA_CH1: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_L1_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_L1_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_L2_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_L2_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L3_CH_INT interrupt.
        INFIFO_L3_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L3_CH_INT interrupt.
        INFIFO_L3_UDF_CH_INT_ENA: u1,
        padding: u21 = 0,
    }),
    /// Interrupt clear bits of channel 0
    /// offset: 0x74
    IN_INT_CLR_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_L1_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_L1_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_L2_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_L2_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L3_CH_INT interrupt.
        INFIFO_L3_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L3_CH_INT interrupt.
        INFIFO_L3_UDF_CH_INT_CLR: u1,
        padding: u21 = 0,
    }),
    /// Configure 0 register of Rx channel 0
    /// offset: 0x78
    IN_CONF0_CH1: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AXI_DMA channel 0 Rx FSM and Rx FIFO pointer.
        IN_RST_CH: u1,
        /// reserved
        IN_LOOP_TEST_CH: u1,
        /// Set this bit 1 to enable automatic transmitting data from memory to memory via AXI_DMA.
        MEM_TRANS_EN_CH: u1,
        /// Set this bit to 1 to enable etm control mode, dma Rx channel 0 is triggered by etm task.
        IN_ETM_EN_CH: u1,
        /// 3'b000-3'b100:burst length 8byte~128byte
        IN_BURST_SIZE_SEL_CH: u3,
        /// 1:mean disable cmd of this ch0
        IN_CMD_DISABLE_CH: u1,
        /// 1: mean access ecc or aes domain,0: mean not
        IN_ECC_AEC_EN_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Rx channel 0 reading link descriptor when accessing internal SRAM.
        INDSCR_BURST_EN_CH: u1,
        padding: u22 = 0,
    }),
    /// Configure 1 register of Rx channel 0
    /// offset: 0x7c
    IN_CONF1_CH1: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Receive FIFO status of Rx channel 0
    /// offset: 0x80
    INFIFO_STATUS_CH1: mmio.Mmio(packed struct(u32) {
        /// L3 Rx FIFO full signal for Rx channel 0.
        INFIFO_L3_FULL_CH: u1,
        /// L3 Rx FIFO empty signal for Rx channel 0.
        INFIFO_L3_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L3 Rx FIFO for Rx channel 0.
        INFIFO_L3_CNT_CH: u6,
        /// L3 Rx FIFO under flow signal for Rx channel 0.
        INFIFO_L3_UDF_CH: u1,
        /// L3 Rx FIFO over flow signal for Rx channel 0.
        INFIFO_L3_OVF_CH: u1,
        /// L1 Rx FIFO full signal for Rx channel 0.
        INFIFO_L1_FULL_CH: u1,
        /// L1 Rx FIFO empty signal for Rx channel 0.
        INFIFO_L1_EMPTY_CH: u1,
        /// L1 Rx FIFO under flow signal for Rx channel 0.
        INFIFO_L1_UDF_CH: u1,
        /// L1 Rx FIFO over flow signal for Rx channel 0.
        INFIFO_L1_OVF_CH: u1,
        /// L2 Rx RAM full signal for Rx channel 0.
        INFIFO_L2_FULL_CH: u1,
        /// L2 Rx RAM empty signal for Rx channel 0.
        INFIFO_L2_EMPTY_CH: u1,
        /// L2 Rx FIFO under flow signal for Rx channel 0.
        INFIFO_L2_UDF_CH: u1,
        /// L2 Rx FIFO over flow signal for Rx channel 0.
        INFIFO_L2_OVF_CH: u1,
        reserved23: u5 = 0,
        /// reserved
        IN_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_4B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_5B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_6B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_7B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_8B_CH: u1,
        /// reserved
        IN_BUF_HUNGRY_CH: u1,
    }),
    /// Pop control register of Rx channel 0
    /// offset: 0x84
    IN_POP_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from AXI_DMA FIFO.
        INFIFO_RDATA_CH: u12,
        /// Set this bit to pop data from AXI_DMA FIFO.
        INFIFO_POP_CH: u1,
        padding: u19 = 0,
    }),
    /// Link descriptor configure and control register of Rx channel 0
    /// offset: 0x88
    IN_LINK1_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to return to current inlink descriptor's address when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH: u1,
        padding: u27 = 0,
    }),
    /// Link descriptor configure and control register of Rx channel 0
    /// offset: 0x8c
    IN_LINK2_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the 20 least significant bits of the first inlink descriptor's address.
        INLINK_ADDR_CH: u32,
    }),
    /// Receive status of Rx channel 0
    /// offset: 0x90
    IN_STATE_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH: u18,
        /// reserved
        IN_DSCR_STATE_CH: u2,
        /// reserved
        IN_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Inlink descriptor address when EOF occurs of Rx channel 0
    /// offset: 0x94
    IN_SUC_EOF_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH: u32,
    }),
    /// Inlink descriptor address when errors occur of Rx channel 0
    /// offset: 0x98
    IN_ERR_EOF_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data. Only used when peripheral is UHCI0.
        IN_ERR_EOF_DES_ADDR_CH: u32,
    }),
    /// Current inlink descriptor address of Rx channel 0
    /// offset: 0x9c
    IN_DSCR_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the current inlink descriptor x.
        INLINK_DSCR_CH: u32,
    }),
    /// The last inlink descriptor address of Rx channel 0
    /// offset: 0xa0
    IN_DSCR_BF0_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor x-1.
        INLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last inlink descriptor address of Rx channel 0
    /// offset: 0xa4
    IN_DSCR_BF1_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor x-2.
        INLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Rx channel 0
    /// offset: 0xa8
    IN_PRI_CH1: mmio.Mmio(packed struct(u32) {
        /// The priority of Rx channel 0. The larger of the value the higher of the priority.
        RX_PRI_CH: u4,
        /// The weight of Rx channel 0
        RX_CH_ARB_WEIGH_CH: u4,
        /// 0: mean not optimazation weight function ,1: mean optimazation
        RX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u23 = 0,
    }),
    /// Peripheral selection of Rx channel 0
    /// offset: 0xac
    IN_PERI_SEL_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Rx channel 0. 0:lcdcam. 1: gpspi_2. 2: gpspi_3. 3: parl_io. 4: aes. 5: sha. 6~15: Dummy
        PERI_IN_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0xb0
    IN_CRC_INIT_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of rx crc initial value
        IN_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig rx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0xb4
    RX_CRC_WIDTH_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_WIDTH_CH: u2,
        /// reserved
        RX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0xb8
    IN_CRC_CLEAR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of rx crc result
        IN_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0xbc
    IN_CRC_FINAL_RESULT_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of rx
        IN_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0xc0
    RX_CRC_EN_WR_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable rx ch0 crc 32bit on/off
        RX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0xc4
    RX_CRC_EN_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0xc8
    RX_CRC_DATA_EN_WR_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_WR_DATA_CH: u16,
        padding: u16 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0xcc
    RX_CRC_DATA_EN_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// Raw status interrupt of channel 0
    /// offset: 0xd0
    IN_INT_RAW_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0.
        IN_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0. For UHCI0 the raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 0.
        IN_SUC_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data error is detected only in the case that the peripheral is UHCI0 for Rx channel 0. For other peripherals this raw interrupt is reserved.
        IN_ERR_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error including owner error and the second and third word error of inlink descriptor for Rx channel 0.
        IN_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when Rx buffer pointed by inlink is full and receiving data is not completed but there is no more inlink for Rx channel 0.
        IN_DSCR_EMPTY_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_L1_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_L1_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_L2_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_L2_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_L3_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_L3_UDF_CH_INT_RAW: u1,
        padding: u21 = 0,
    }),
    /// Masked interrupt of channel 0
    /// offset: 0xd4
    IN_INT_ST_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_L1_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_L1_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L3_CH_INT interrupt.
        INFIFO_L3_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L3_CH_INT interrupt.
        INFIFO_L3_UDF_CH_INT_ST: u1,
        padding: u21 = 0,
    }),
    /// Interrupt enable bits of channel 0
    /// offset: 0xd8
    IN_INT_ENA_CH2: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_L1_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_L1_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_L2_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_L2_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L3_CH_INT interrupt.
        INFIFO_L3_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L3_CH_INT interrupt.
        INFIFO_L3_UDF_CH_INT_ENA: u1,
        padding: u21 = 0,
    }),
    /// Interrupt clear bits of channel 0
    /// offset: 0xdc
    IN_INT_CLR_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_L1_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_L1_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L2_CH_INT interrupt.
        INFIFO_L2_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L2_CH_INT interrupt.
        INFIFO_L2_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L3_CH_INT interrupt.
        INFIFO_L3_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L3_CH_INT interrupt.
        INFIFO_L3_UDF_CH_INT_CLR: u1,
        padding: u21 = 0,
    }),
    /// Configure 0 register of Rx channel 0
    /// offset: 0xe0
    IN_CONF0_CH2: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AXI_DMA channel 0 Rx FSM and Rx FIFO pointer.
        IN_RST_CH: u1,
        /// reserved
        IN_LOOP_TEST_CH: u1,
        /// Set this bit 1 to enable automatic transmitting data from memory to memory via AXI_DMA.
        MEM_TRANS_EN_CH: u1,
        /// Set this bit to 1 to enable etm control mode, dma Rx channel 0 is triggered by etm task.
        IN_ETM_EN_CH: u1,
        /// 3'b000-3'b100:burst length 8byte~128byte
        IN_BURST_SIZE_SEL_CH: u3,
        /// 1:mean disable cmd of this ch0
        IN_CMD_DISABLE_CH: u1,
        /// 1: mean access ecc or aes domain,0: mean not
        IN_ECC_AEC_EN_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Rx channel 0 reading link descriptor when accessing internal SRAM.
        INDSCR_BURST_EN_CH: u1,
        padding: u22 = 0,
    }),
    /// Configure 1 register of Rx channel 0
    /// offset: 0xe4
    IN_CONF1_CH2: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Receive FIFO status of Rx channel 0
    /// offset: 0xe8
    INFIFO_STATUS_CH2: mmio.Mmio(packed struct(u32) {
        /// L3 Rx FIFO full signal for Rx channel 0.
        INFIFO_L3_FULL_CH: u1,
        /// L3 Rx FIFO empty signal for Rx channel 0.
        INFIFO_L3_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L3 Rx FIFO for Rx channel 0.
        INFIFO_L3_CNT_CH: u6,
        /// L3 Rx FIFO under flow signal for Rx channel 0.
        INFIFO_L3_UDF_CH: u1,
        /// L3 Rx FIFO over flow signal for Rx channel 0.
        INFIFO_L3_OVF_CH: u1,
        /// L1 Rx FIFO full signal for Rx channel 0.
        INFIFO_L1_FULL_CH: u1,
        /// L1 Rx FIFO empty signal for Rx channel 0.
        INFIFO_L1_EMPTY_CH: u1,
        /// L1 Rx FIFO under flow signal for Rx channel 0.
        INFIFO_L1_UDF_CH: u1,
        /// L1 Rx FIFO over flow signal for Rx channel 0.
        INFIFO_L1_OVF_CH: u1,
        /// L2 Rx RAM full signal for Rx channel 0.
        INFIFO_L2_FULL_CH: u1,
        /// L2 Rx RAM empty signal for Rx channel 0.
        INFIFO_L2_EMPTY_CH: u1,
        /// L2 Rx FIFO under flow signal for Rx channel 0.
        INFIFO_L2_UDF_CH: u1,
        /// L2 Rx FIFO over flow signal for Rx channel 0.
        INFIFO_L2_OVF_CH: u1,
        reserved23: u5 = 0,
        /// reserved
        IN_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_4B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_5B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_6B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_7B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_8B_CH: u1,
        /// reserved
        IN_BUF_HUNGRY_CH: u1,
    }),
    /// Pop control register of Rx channel 0
    /// offset: 0xec
    IN_POP_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from AXI_DMA FIFO.
        INFIFO_RDATA_CH: u12,
        /// Set this bit to pop data from AXI_DMA FIFO.
        INFIFO_POP_CH: u1,
        padding: u19 = 0,
    }),
    /// Link descriptor configure and control register of Rx channel 0
    /// offset: 0xf0
    IN_LINK1_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to return to current inlink descriptor's address when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH: u1,
        padding: u27 = 0,
    }),
    /// Link descriptor configure and control register of Rx channel 0
    /// offset: 0xf4
    IN_LINK2_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the 20 least significant bits of the first inlink descriptor's address.
        INLINK_ADDR_CH: u32,
    }),
    /// Receive status of Rx channel 0
    /// offset: 0xf8
    IN_STATE_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH: u18,
        /// reserved
        IN_DSCR_STATE_CH: u2,
        /// reserved
        IN_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Inlink descriptor address when EOF occurs of Rx channel 0
    /// offset: 0xfc
    IN_SUC_EOF_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH: u32,
    }),
    /// Inlink descriptor address when errors occur of Rx channel 0
    /// offset: 0x100
    IN_ERR_EOF_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data. Only used when peripheral is UHCI0.
        IN_ERR_EOF_DES_ADDR_CH: u32,
    }),
    /// Current inlink descriptor address of Rx channel 0
    /// offset: 0x104
    IN_DSCR_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the current inlink descriptor x.
        INLINK_DSCR_CH: u32,
    }),
    /// The last inlink descriptor address of Rx channel 0
    /// offset: 0x108
    IN_DSCR_BF0_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor x-1.
        INLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last inlink descriptor address of Rx channel 0
    /// offset: 0x10c
    IN_DSCR_BF1_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor x-2.
        INLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Rx channel 0
    /// offset: 0x110
    IN_PRI_CH2: mmio.Mmio(packed struct(u32) {
        /// The priority of Rx channel 0. The larger of the value the higher of the priority.
        RX_PRI_CH: u4,
        /// The weight of Rx channel 0
        RX_CH_ARB_WEIGH_CH: u4,
        /// 0: mean not optimazation weight function ,1: mean optimazation
        RX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u23 = 0,
    }),
    /// Peripheral selection of Rx channel 0
    /// offset: 0x114
    IN_PERI_SEL_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Rx channel 0. 0:lcdcam. 1: gpspi_2. 2: gpspi_3. 3: parl_io. 4: aes. 5: sha. 6~15: Dummy
        PERI_IN_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x118
    IN_CRC_INIT_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of rx crc initial value
        IN_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig rx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x11c
    RX_CRC_WIDTH_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_WIDTH_CH: u2,
        /// reserved
        RX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x120
    IN_CRC_CLEAR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of rx crc result
        IN_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x124
    IN_CRC_FINAL_RESULT_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of rx
        IN_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x128
    RX_CRC_EN_WR_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable rx ch0 crc 32bit on/off
        RX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x12c
    RX_CRC_EN_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x130
    RX_CRC_DATA_EN_WR_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_WR_DATA_CH: u16,
        padding: u16 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x134
    RX_CRC_DATA_EN_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// Raw status interrupt of channel0
    /// offset: 0x138
    OUT_INT_RAW_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel0.
        OUT_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel0.
        OUT_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error including owner error and the second and third word error of outlink descriptor for Tx channel0.
        OUT_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel0.
        OUT_TOTAL_EOF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is overflow.
        OUTFIFO_L1_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is underflow.
        OUTFIFO_L1_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is overflow.
        OUTFIFO_L2_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is underflow.
        OUTFIFO_L2_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is overflow.
        OUTFIFO_L3_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is underflow.
        OUTFIFO_L3_UDF_CH_INT_RAW: u1,
        padding: u22 = 0,
    }),
    /// Masked interrupt of channel0
    /// offset: 0x13c
    OUT_INT_ST_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_L1_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_L1_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L3_CH_INT interrupt.
        OUTFIFO_L3_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L3_CH_INT interrupt.
        OUTFIFO_L3_UDF_CH_INT_ST: u1,
        padding: u22 = 0,
    }),
    /// Interrupt enable bits of channel0
    /// offset: 0x140
    OUT_INT_ENA_CH0: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_L1_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_L1_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_L2_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_L2_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L3_CH_INT interrupt.
        OUTFIFO_L3_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L3_CH_INT interrupt.
        OUTFIFO_L3_UDF_CH_INT_ENA: u1,
        padding: u22 = 0,
    }),
    /// Interrupt clear bits of channel0
    /// offset: 0x144
    OUT_INT_CLR_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_L1_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_L1_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_L2_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_L2_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L3_CH_INT interrupt.
        OUTFIFO_L3_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L3_CH_INT interrupt.
        OUTFIFO_L3_UDF_CH_INT_CLR: u1,
        padding: u22 = 0,
    }),
    /// Configure 0 register of Tx channel0
    /// offset: 0x148
    OUT_CONF0_CH0: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AXI_DMA channel0 Tx FSM and Tx FIFO pointer.
        OUT_RST_CH0: u1,
        /// reserved
        OUT_LOOP_TEST_CH0: u1,
        /// Set this bit to enable automatic outlink-writeback when all the data in tx buffer has been transmitted.
        OUT_AUTO_WRBACK_CH0: u1,
        /// EOF flag generation mode when transmitting data. 1: EOF flag for Tx channel0 is generated when data need to transmit has been popped from FIFO in AXI_DMA
        OUT_EOF_MODE_CH0: u1,
        /// Set this bit to 1 to enable etm control mode, dma Tx channel0 is triggered by etm task.
        OUT_ETM_EN_CH0: u1,
        /// 3'b000-3'b100:burst length 8byte~128byte
        OUT_BURST_SIZE_SEL_CH0: u3,
        /// 1:mean disable cmd of this ch0
        OUT_CMD_DISABLE_CH0: u1,
        /// 1: mean access ecc or aes domain,0: mean not
        OUT_ECC_AEC_EN_CH0: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel0 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH0: u1,
        padding: u21 = 0,
    }),
    /// Configure 1 register of Tx channel0
    /// offset: 0x14c
    OUT_CONF1_CH0: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Transmit FIFO status of Tx channel0
    /// offset: 0x150
    OUTFIFO_STATUS_CH0: mmio.Mmio(packed struct(u32) {
        /// L3 Tx FIFO full signal for Tx channel0.
        OUTFIFO_L3_FULL_CH: u1,
        /// L3 Tx FIFO empty signal for Tx channel0.
        OUTFIFO_L3_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L3 Tx FIFO for Tx channel0.
        OUTFIFO_L3_CNT_CH: u6,
        /// L3 Tx FIFO under flow signal for Tx channel0.
        OUTFIFO_L3_UDF_CH: u1,
        /// L3 Tx FIFO over flow signal for Tx channel0.
        OUTFIFO_L3_OVF_CH: u1,
        /// L1 Tx FIFO full signal for Tx channel0.
        OUTFIFO_L1_FULL_CH: u1,
        /// L1 Tx FIFO empty signal for Tx channel0.
        OUTFIFO_L1_EMPTY_CH: u1,
        /// L1 Tx FIFO under flow signal for Tx channel0.
        OUTFIFO_L1_UDF_CH: u1,
        /// L1 Tx FIFO over flow signal for Tx channel0.
        OUTFIFO_L1_OVF_CH: u1,
        /// L2 Tx RAM full signal for Tx channel0.
        OUTFIFO_L2_FULL_CH: u1,
        /// L2 Tx RAM empty signal for Tx channel0.
        OUTFIFO_L2_EMPTY_CH: u1,
        /// L2 Tx FIFO under flow signal for Tx channel0.
        OUTFIFO_L2_UDF_CH: u1,
        /// L2 Tx FIFO over flow signal for Tx channel0.
        OUTFIFO_L2_OVF_CH: u1,
        reserved23: u5 = 0,
        /// reserved
        OUT_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_4B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_5B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_6B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_7B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_8B_CH: u1,
        padding: u1 = 0,
    }),
    /// Push control register of Tx channel0
    /// offset: 0x154
    OUT_PUSH_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into AXI_DMA FIFO.
        OUTFIFO_WDATA_CH: u9,
        /// Set this bit to push data into AXI_DMA FIFO.
        OUTFIFO_PUSH_CH: u1,
        padding: u22 = 0,
    }),
    /// Link descriptor configure and control register of Tx channel0
    /// offset: 0x158
    OUT_LINK1_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH: u1,
        padding: u28 = 0,
    }),
    /// Link descriptor configure and control register of Tx channel0
    /// offset: 0x15c
    OUT_LINK2_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the 32 least significant bits of the first outlink descriptor's address.
        OUTLINK_ADDR_CH: u32,
    }),
    /// Transmit status of Tx channel0
    /// offset: 0x160
    OUT_STATE_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH: u18,
        /// reserved
        OUT_DSCR_STATE_CH: u2,
        /// reserved
        OUT_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Outlink descriptor address when EOF occurs of Tx channel0
    /// offset: 0x164
    OUT_EOF_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH: u32,
    }),
    /// The last outlink descriptor address when EOF occurs of Tx channel0
    /// offset: 0x168
    OUT_EOF_BFR_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor before the last outlink descriptor.
        OUT_EOF_BFR_DES_ADDR_CH: u32,
    }),
    /// Current outlink descriptor address of Tx channel0
    /// offset: 0x16c
    OUT_DSCR_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the current outlink descriptor y.
        OUTLINK_DSCR_CH: u32,
    }),
    /// The last outlink descriptor address of Tx channel0
    /// offset: 0x170
    OUT_DSCR_BF0_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor y-1.
        OUTLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last outlink descriptor address of Tx channel0
    /// offset: 0x174
    OUT_DSCR_BF1_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last outlink descriptor x-2.
        OUTLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Tx channel0.
    /// offset: 0x178
    OUT_PRI_CH0: mmio.Mmio(packed struct(u32) {
        /// The priority of Tx channel0. The larger of the value the higher of the priority.
        TX_PRI_CH: u4,
        /// The weight of Tx channel0
        TX_CH_ARB_WEIGH_CH: u4,
        /// 0: mean not optimazation weight function ,1: mean optimazation
        TX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u23 = 0,
    }),
    /// Peripheral selection of Tx channel0
    /// offset: 0x17c
    OUT_PERI_SEL_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Tx channel0. 0:lcdcam. 1: gpspi_2. 2: gpspi_3. 3: parl_io. 4: aes. 5: sha. 6~15: Dummy
        PERI_OUT_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x180
    OUT_CRC_INIT_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of tx crc initial value
        OUT_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig tx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x184
    TX_CRC_WIDTH_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_WIDTH_CH: u2,
        /// reserved
        TX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x188
    OUT_CRC_CLEAR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of tx crc result
        OUT_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x18c
    OUT_CRC_FINAL_RESULT_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of tx
        OUT_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x190
    TX_CRC_EN_WR_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable tx ch0 crc 32bit on/off
        TX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x194
    TX_CRC_EN_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x198
    TX_CRC_DATA_EN_WR_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_WR_DATA_CH: u16,
        padding: u16 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x19c
    TX_CRC_DATA_EN_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// Raw status interrupt of channel0
    /// offset: 0x1a0
    OUT_INT_RAW_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel0.
        OUT_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel0.
        OUT_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error including owner error and the second and third word error of outlink descriptor for Tx channel0.
        OUT_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel0.
        OUT_TOTAL_EOF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is overflow.
        OUTFIFO_L1_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is underflow.
        OUTFIFO_L1_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is overflow.
        OUTFIFO_L2_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is underflow.
        OUTFIFO_L2_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is overflow.
        OUTFIFO_L3_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is underflow.
        OUTFIFO_L3_UDF_CH_INT_RAW: u1,
        padding: u22 = 0,
    }),
    /// Masked interrupt of channel0
    /// offset: 0x1a4
    OUT_INT_ST_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_L1_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_L1_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L3_CH_INT interrupt.
        OUTFIFO_L3_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L3_CH_INT interrupt.
        OUTFIFO_L3_UDF_CH_INT_ST: u1,
        padding: u22 = 0,
    }),
    /// Interrupt enable bits of channel0
    /// offset: 0x1a8
    OUT_INT_ENA_CH1: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_L1_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_L1_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_L2_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_L2_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L3_CH_INT interrupt.
        OUTFIFO_L3_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L3_CH_INT interrupt.
        OUTFIFO_L3_UDF_CH_INT_ENA: u1,
        padding: u22 = 0,
    }),
    /// Interrupt clear bits of channel0
    /// offset: 0x1ac
    OUT_INT_CLR_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_L1_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_L1_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_L2_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_L2_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L3_CH_INT interrupt.
        OUTFIFO_L3_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L3_CH_INT interrupt.
        OUTFIFO_L3_UDF_CH_INT_CLR: u1,
        padding: u22 = 0,
    }),
    /// Configure 0 register of Tx channel1
    /// offset: 0x1b0
    OUT_CONF0_CH1: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AXI_DMA channel1 Tx FSM and Tx FIFO pointer.
        OUT_RST_CH1: u1,
        /// reserved
        OUT_LOOP_TEST_CH1: u1,
        /// Set this bit to enable automatic outlink-writeback when all the data in tx buffer has been transmitted.
        OUT_AUTO_WRBACK_CH1: u1,
        /// EOF flag generation mode when transmitting data. 1: EOF flag for Tx channel1 is generated when data need to transmit has been popped from FIFO in AXI_DMA
        OUT_EOF_MODE_CH1: u1,
        /// Set this bit to 1 to enable etm control mode, dma Tx channel1 is triggered by etm task.
        OUT_ETM_EN_CH1: u1,
        /// 3'b000-3'b100:burst length 8byte~128byte
        OUT_BURST_SIZE_SEL_CH1: u3,
        /// 1:mean disable cmd of this ch1
        OUT_CMD_DISABLE_CH1: u1,
        /// 1: mean access ecc or aes domain,0: mean not
        OUT_ECC_AEC_EN_CH1: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel1 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH1: u1,
        padding: u21 = 0,
    }),
    /// Configure 1 register of Tx channel0
    /// offset: 0x1b4
    OUT_CONF1_CH1: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Transmit FIFO status of Tx channel0
    /// offset: 0x1b8
    OUTFIFO_STATUS_CH1: mmio.Mmio(packed struct(u32) {
        /// L3 Tx FIFO full signal for Tx channel0.
        OUTFIFO_L3_FULL_CH: u1,
        /// L3 Tx FIFO empty signal for Tx channel0.
        OUTFIFO_L3_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L3 Tx FIFO for Tx channel0.
        OUTFIFO_L3_CNT_CH: u6,
        /// L3 Tx FIFO under flow signal for Tx channel0.
        OUTFIFO_L3_UDF_CH: u1,
        /// L3 Tx FIFO over flow signal for Tx channel0.
        OUTFIFO_L3_OVF_CH: u1,
        /// L1 Tx FIFO full signal for Tx channel0.
        OUTFIFO_L1_FULL_CH: u1,
        /// L1 Tx FIFO empty signal for Tx channel0.
        OUTFIFO_L1_EMPTY_CH: u1,
        /// L1 Tx FIFO under flow signal for Tx channel0.
        OUTFIFO_L1_UDF_CH: u1,
        /// L1 Tx FIFO over flow signal for Tx channel0.
        OUTFIFO_L1_OVF_CH: u1,
        /// L2 Tx RAM full signal for Tx channel0.
        OUTFIFO_L2_FULL_CH: u1,
        /// L2 Tx RAM empty signal for Tx channel0.
        OUTFIFO_L2_EMPTY_CH: u1,
        /// L2 Tx FIFO under flow signal for Tx channel0.
        OUTFIFO_L2_UDF_CH: u1,
        /// L2 Tx FIFO over flow signal for Tx channel0.
        OUTFIFO_L2_OVF_CH: u1,
        reserved23: u5 = 0,
        /// reserved
        OUT_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_4B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_5B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_6B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_7B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_8B_CH: u1,
        padding: u1 = 0,
    }),
    /// Push control register of Tx channel0
    /// offset: 0x1bc
    OUT_PUSH_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into AXI_DMA FIFO.
        OUTFIFO_WDATA_CH: u9,
        /// Set this bit to push data into AXI_DMA FIFO.
        OUTFIFO_PUSH_CH: u1,
        padding: u22 = 0,
    }),
    /// Link descriptor configure and control register of Tx channel0
    /// offset: 0x1c0
    OUT_LINK1_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH: u1,
        padding: u28 = 0,
    }),
    /// Link descriptor configure and control register of Tx channel0
    /// offset: 0x1c4
    OUT_LINK2_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the 32 least significant bits of the first outlink descriptor's address.
        OUTLINK_ADDR_CH: u32,
    }),
    /// Transmit status of Tx channel0
    /// offset: 0x1c8
    OUT_STATE_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH: u18,
        /// reserved
        OUT_DSCR_STATE_CH: u2,
        /// reserved
        OUT_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Outlink descriptor address when EOF occurs of Tx channel0
    /// offset: 0x1cc
    OUT_EOF_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH: u32,
    }),
    /// The last outlink descriptor address when EOF occurs of Tx channel0
    /// offset: 0x1d0
    OUT_EOF_BFR_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor before the last outlink descriptor.
        OUT_EOF_BFR_DES_ADDR_CH: u32,
    }),
    /// Current outlink descriptor address of Tx channel0
    /// offset: 0x1d4
    OUT_DSCR_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the current outlink descriptor y.
        OUTLINK_DSCR_CH: u32,
    }),
    /// The last outlink descriptor address of Tx channel0
    /// offset: 0x1d8
    OUT_DSCR_BF0_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor y-1.
        OUTLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last outlink descriptor address of Tx channel0
    /// offset: 0x1dc
    OUT_DSCR_BF1_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last outlink descriptor x-2.
        OUTLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Tx channel0.
    /// offset: 0x1e0
    OUT_PRI_CH1: mmio.Mmio(packed struct(u32) {
        /// The priority of Tx channel0. The larger of the value the higher of the priority.
        TX_PRI_CH: u4,
        /// The weight of Tx channel0
        TX_CH_ARB_WEIGH_CH: u4,
        /// 0: mean not optimazation weight function ,1: mean optimazation
        TX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u23 = 0,
    }),
    /// Peripheral selection of Tx channel0
    /// offset: 0x1e4
    OUT_PERI_SEL_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Tx channel0. 0:lcdcam. 1: gpspi_2. 2: gpspi_3. 3: parl_io. 4: aes. 5: sha. 6~15: Dummy
        PERI_OUT_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x1e8
    OUT_CRC_INIT_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of tx crc initial value
        OUT_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig tx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x1ec
    TX_CRC_WIDTH_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_WIDTH_CH: u2,
        /// reserved
        TX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x1f0
    OUT_CRC_CLEAR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of tx crc result
        OUT_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x1f4
    OUT_CRC_FINAL_RESULT_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of tx
        OUT_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x1f8
    TX_CRC_EN_WR_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable tx ch0 crc 32bit on/off
        TX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x1fc
    TX_CRC_EN_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x200
    TX_CRC_DATA_EN_WR_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_WR_DATA_CH: u16,
        padding: u16 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x204
    TX_CRC_DATA_EN_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// Raw status interrupt of channel0
    /// offset: 0x208
    OUT_INT_RAW_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel0.
        OUT_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel0.
        OUT_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error including owner error and the second and third word error of outlink descriptor for Tx channel0.
        OUT_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel0.
        OUT_TOTAL_EOF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is overflow.
        OUTFIFO_L1_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is underflow.
        OUTFIFO_L1_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is overflow.
        OUTFIFO_L2_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is underflow.
        OUTFIFO_L2_UDF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is overflow.
        OUTFIFO_L3_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel0 is underflow.
        OUTFIFO_L3_UDF_CH_INT_RAW: u1,
        padding: u22 = 0,
    }),
    /// Masked interrupt of channel0
    /// offset: 0x20c
    OUT_INT_ST_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_L1_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_L1_UDF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L3_CH_INT interrupt.
        OUTFIFO_L3_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L3_CH_INT interrupt.
        OUTFIFO_L3_UDF_CH_INT_ST: u1,
        padding: u22 = 0,
    }),
    /// Interrupt enable bits of channel0
    /// offset: 0x210
    OUT_INT_ENA_CH2: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_L1_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_L1_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_L2_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_L2_UDF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L3_CH_INT interrupt.
        OUTFIFO_L3_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L3_CH_INT interrupt.
        OUTFIFO_L3_UDF_CH_INT_ENA: u1,
        padding: u22 = 0,
    }),
    /// Interrupt clear bits of channel0
    /// offset: 0x214
    OUT_INT_CLR_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_L1_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_L1_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L2_CH_INT interrupt.
        OUTFIFO_L2_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L2_CH_INT interrupt.
        OUTFIFO_L2_UDF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L3_CH_INT interrupt.
        OUTFIFO_L3_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L3_CH_INT interrupt.
        OUTFIFO_L3_UDF_CH_INT_CLR: u1,
        padding: u22 = 0,
    }),
    /// Configure 0 register of Tx channel2
    /// offset: 0x218
    OUT_CONF0_CH2: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AXI_DMA channel2 Tx FSM and Tx FIFO pointer.
        OUT_RST_CH2: u1,
        /// reserved
        OUT_LOOP_TEST_CH2: u1,
        /// Set this bit to enable automatic outlink-writeback when all the data in tx buffer has been transmitted.
        OUT_AUTO_WRBACK_CH2: u1,
        /// EOF flag generation mode when transmitting data. 1: EOF flag for Tx channel2 is generated when data need to transmit has been popped from FIFO in AXI_DMA
        OUT_EOF_MODE_CH2: u1,
        /// Set this bit to 1 to enable etm control mode, dma Tx channel2 is triggered by etm task.
        OUT_ETM_EN_CH2: u1,
        /// 3'b000-3'b100:burst length 8byte~128byte
        OUT_BURST_SIZE_SEL_CH2: u3,
        /// 1:mean disable cmd of this ch2
        OUT_CMD_DISABLE_CH2: u1,
        /// 1: mean access ecc or aes domain,0: mean not
        OUT_ECC_AEC_EN_CH2: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel2 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH2: u1,
        padding: u21 = 0,
    }),
    /// Configure 1 register of Tx channel0
    /// offset: 0x21c
    OUT_CONF1_CH2: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Transmit FIFO status of Tx channel0
    /// offset: 0x220
    OUTFIFO_STATUS_CH2: mmio.Mmio(packed struct(u32) {
        /// L3 Tx FIFO full signal for Tx channel0.
        OUTFIFO_L3_FULL_CH: u1,
        /// L3 Tx FIFO empty signal for Tx channel0.
        OUTFIFO_L3_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L3 Tx FIFO for Tx channel0.
        OUTFIFO_L3_CNT_CH: u6,
        /// L3 Tx FIFO under flow signal for Tx channel0.
        OUTFIFO_L3_UDF_CH: u1,
        /// L3 Tx FIFO over flow signal for Tx channel0.
        OUTFIFO_L3_OVF_CH: u1,
        /// L1 Tx FIFO full signal for Tx channel0.
        OUTFIFO_L1_FULL_CH: u1,
        /// L1 Tx FIFO empty signal for Tx channel0.
        OUTFIFO_L1_EMPTY_CH: u1,
        /// L1 Tx FIFO under flow signal for Tx channel0.
        OUTFIFO_L1_UDF_CH: u1,
        /// L1 Tx FIFO over flow signal for Tx channel0.
        OUTFIFO_L1_OVF_CH: u1,
        /// L2 Tx RAM full signal for Tx channel0.
        OUTFIFO_L2_FULL_CH: u1,
        /// L2 Tx RAM empty signal for Tx channel0.
        OUTFIFO_L2_EMPTY_CH: u1,
        /// L2 Tx FIFO under flow signal for Tx channel0.
        OUTFIFO_L2_UDF_CH: u1,
        /// L2 Tx FIFO over flow signal for Tx channel0.
        OUTFIFO_L2_OVF_CH: u1,
        reserved23: u5 = 0,
        /// reserved
        OUT_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_4B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_5B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_6B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_7B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_8B_CH: u1,
        padding: u1 = 0,
    }),
    /// Push control register of Tx channel0
    /// offset: 0x224
    OUT_PUSH_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into AXI_DMA FIFO.
        OUTFIFO_WDATA_CH: u9,
        /// Set this bit to push data into AXI_DMA FIFO.
        OUTFIFO_PUSH_CH: u1,
        padding: u22 = 0,
    }),
    /// Link descriptor configure and control register of Tx channel0
    /// offset: 0x228
    OUT_LINK1_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH: u1,
        padding: u28 = 0,
    }),
    /// Link descriptor configure and control register of Tx channel0
    /// offset: 0x22c
    OUT_LINK2_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the 32 least significant bits of the first outlink descriptor's address.
        OUTLINK_ADDR_CH: u32,
    }),
    /// Transmit status of Tx channel0
    /// offset: 0x230
    OUT_STATE_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH: u18,
        /// reserved
        OUT_DSCR_STATE_CH: u2,
        /// reserved
        OUT_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Outlink descriptor address when EOF occurs of Tx channel0
    /// offset: 0x234
    OUT_EOF_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH: u32,
    }),
    /// The last outlink descriptor address when EOF occurs of Tx channel0
    /// offset: 0x238
    OUT_EOF_BFR_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor before the last outlink descriptor.
        OUT_EOF_BFR_DES_ADDR_CH: u32,
    }),
    /// Current outlink descriptor address of Tx channel0
    /// offset: 0x23c
    OUT_DSCR_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the current outlink descriptor y.
        OUTLINK_DSCR_CH: u32,
    }),
    /// The last outlink descriptor address of Tx channel0
    /// offset: 0x240
    OUT_DSCR_BF0_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor y-1.
        OUTLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last outlink descriptor address of Tx channel0
    /// offset: 0x244
    OUT_DSCR_BF1_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last outlink descriptor x-2.
        OUTLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Tx channel0.
    /// offset: 0x248
    OUT_PRI_CH2: mmio.Mmio(packed struct(u32) {
        /// The priority of Tx channel0. The larger of the value the higher of the priority.
        TX_PRI_CH: u4,
        /// The weight of Tx channel0
        TX_CH_ARB_WEIGH_CH: u4,
        /// 0: mean not optimazation weight function ,1: mean optimazation
        TX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u23 = 0,
    }),
    /// Peripheral selection of Tx channel0
    /// offset: 0x24c
    OUT_PERI_SEL_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Tx channel0. 0:lcdcam. 1: gpspi_2. 2: gpspi_3. 3: parl_io. 4: aes. 5: sha. 6~15: Dummy
        PERI_OUT_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x250
    OUT_CRC_INIT_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of tx crc initial value
        OUT_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig tx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x254
    TX_CRC_WIDTH_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_WIDTH_CH: u2,
        /// reserved
        TX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x258
    OUT_CRC_CLEAR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of tx crc result
        OUT_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x25c
    OUT_CRC_FINAL_RESULT_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of tx
        OUT_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x260
    TX_CRC_EN_WR_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable tx ch0 crc 32bit on/off
        TX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x264
    TX_CRC_EN_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x268
    TX_CRC_DATA_EN_WR_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_WR_DATA_CH: u16,
        padding: u16 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x26c
    TX_CRC_DATA_EN_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// This retister is used to config arbiter time slice
    /// offset: 0x270
    ARB_TIMEOUT: mmio.Mmio(packed struct(u32) {
        /// This register is used to config tx arbiter time out value
        TX: u16,
        /// This register is used to config rx arbiter time out value
        RX: u16,
    }),
    /// This register is used to config arbiter weight function to on or off
    /// offset: 0x274
    WEIGHT_EN: mmio.Mmio(packed struct(u32) {
        /// This register is used to config tx arbiter weight function off/on
        TX: u1,
        /// This register is used to config rx arbiter weight function off/on
        RX: u1,
        padding: u30 = 0,
    }),
    /// Mem power configure register of Rx channel
    /// offset: 0x278
    IN_MEM_CONF: mmio.Mmio(packed struct(u32) {
        /// 1: Force to open the clock and bypass the gate-clock when accessing the RAM in AXI_DMA. 0: A gate-clock will be used when accessing the RAM in AXI_DMA.
        IN_MEM_CLK_FORCE_EN: u1,
        /// Force power up ram
        IN_MEM_FORCE_PU: u1,
        /// Force power down ram
        IN_MEM_FORCE_PD: u1,
        /// 1: Force to open the clock and bypass the gate-clock when accessing the RAM in AXI_DMA. 0: A gate-clock will be used when accessing the RAM in AXI_DMA.
        OUT_MEM_CLK_FORCE_EN: u1,
        /// Force power up ram
        OUT_MEM_FORCE_PU: u1,
        /// Force power down ram
        OUT_MEM_FORCE_PD: u1,
        padding: u26 = 0,
    }),
    /// The start address of accessible address space.
    /// offset: 0x27c
    INTR_MEM_START_ADDR: mmio.Mmio(packed struct(u32) {
        /// The start address of accessible address space.
        ACCESS_INTR_MEM_START_ADDR: u32,
    }),
    /// The end address of accessible address space. The access address beyond this range would lead to descriptor error.
    /// offset: 0x280
    INTR_MEM_END_ADDR: mmio.Mmio(packed struct(u32) {
        /// The end address of accessible address space. The access address beyond this range would lead to descriptor error.
        ACCESS_INTR_MEM_END_ADDR: u32,
    }),
    /// The start address of accessible address space.
    /// offset: 0x284
    EXTR_MEM_START_ADDR: mmio.Mmio(packed struct(u32) {
        /// The start address of accessible address space.
        ACCESS_EXTR_MEM_START_ADDR: u32,
    }),
    /// The end address of accessible address space. The access address beyond this range would lead to descriptor error.
    /// offset: 0x288
    EXTR_MEM_END_ADDR: mmio.Mmio(packed struct(u32) {
        /// The end address of accessible address space. The access address beyond this range would lead to descriptor error.
        ACCESS_EXTR_MEM_END_ADDR: u32,
    }),
    /// The rx channel 0 reset valid_flag register.
    /// offset: 0x28c
    IN_RESET_AVAIL_CH0: mmio.Mmio(packed struct(u32) {
        /// rx chan0 reset valid reg.
        IN_RESET_AVAIL_CH: u1,
        padding: u31 = 0,
    }),
    /// The rx channel 0 reset valid_flag register.
    /// offset: 0x290
    IN_RESET_AVAIL_CH1: mmio.Mmio(packed struct(u32) {
        /// rx chan0 reset valid reg.
        IN_RESET_AVAIL_CH: u1,
        padding: u31 = 0,
    }),
    /// The rx channel 0 reset valid_flag register.
    /// offset: 0x294
    IN_RESET_AVAIL_CH2: mmio.Mmio(packed struct(u32) {
        /// rx chan0 reset valid reg.
        IN_RESET_AVAIL_CH: u1,
        padding: u31 = 0,
    }),
    /// The tx channel 0 reset valid_flag register.
    /// offset: 0x298
    OUT_RESET_AVAIL_CH0: mmio.Mmio(packed struct(u32) {
        /// tx chan0 reset valid reg.
        OUT_RESET_AVAIL_CH: u1,
        padding: u31 = 0,
    }),
    /// The tx channel 0 reset valid_flag register.
    /// offset: 0x29c
    OUT_RESET_AVAIL_CH1: mmio.Mmio(packed struct(u32) {
        /// tx chan0 reset valid reg.
        OUT_RESET_AVAIL_CH: u1,
        padding: u31 = 0,
    }),
    /// The tx channel 0 reset valid_flag register.
    /// offset: 0x2a0
    OUT_RESET_AVAIL_CH2: mmio.Mmio(packed struct(u32) {
        /// tx chan0 reset valid reg.
        OUT_RESET_AVAIL_CH: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x2a4
    reserved676: [4]u8,
    /// MISC register
    /// offset: 0x2a8
    MISC_CONF: mmio.Mmio(packed struct(u32) {
        /// Set this bit then clear this bit to reset the internal axi_wr FSM.
        AXIM_RST_WR_INTER: u1,
        /// Set this bit then clear this bit to reset the internal axi_rd FSM.
        AXIM_RST_RD_INTER: u1,
        reserved3: u1 = 0,
        /// Set this bit to disable priority arbitration function.
        ARB_PRI_DIS: u1,
        /// 1'h1: Force clock on for register. 1'h0: Support clock only when application writes registers.
        CLK_EN: u1,
        padding: u27 = 0,
    }),
    /// reserved
    /// offset: 0x2ac
    RDN_RESULT: mmio.Mmio(packed struct(u32) {
        /// reserved
        RDN_ENA: u1,
        /// reserved
        RDN_RESULT: u1,
        padding: u30 = 0,
    }),
    /// reserved
    /// offset: 0x2b0
    RDN_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// The start address of accessible address space.
        RDN_ECO_HIGH: u32,
    }),
    /// reserved
    /// offset: 0x2b4
    RDN_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// The start address of accessible address space.
        RDN_ECO_LOW: u32,
    }),
    /// AXI wr responce cnt register.
    /// offset: 0x2b8
    WRESP_CNT: mmio.Mmio(packed struct(u32) {
        /// axi wr responce cnt reg.
        WRESP_CNT: u4,
        padding: u28 = 0,
    }),
    /// AXI wr responce cnt register.
    /// offset: 0x2bc
    RRESP_CNT: mmio.Mmio(packed struct(u32) {
        /// axi rd responce cnt reg.
        RRESP_CNT: u4,
        padding: u28 = 0,
    }),
    /// Receive FIFO status of Rx channel 0
    /// offset: 0x2c0
    INFIFO_STATUS1_CH0: mmio.Mmio(packed struct(u32) {
        /// The register stores the byte number of the data in L1 Rx FIFO for Rx channel 0.
        L1INFIFO_CNT_CH: u6,
        /// The register stores the byte number of the data in L2 Rx FIFO for Rx channel 0.
        L2INFIFO_CNT_CH: u4,
        padding: u22 = 0,
    }),
    /// Receive FIFO status of Rx channel 0
    /// offset: 0x2c4
    INFIFO_STATUS1_CH1: mmio.Mmio(packed struct(u32) {
        /// The register stores the byte number of the data in L1 Rx FIFO for Rx channel 0.
        L1INFIFO_CNT_CH: u6,
        /// The register stores the byte number of the data in L2 Rx FIFO for Rx channel 0.
        L2INFIFO_CNT_CH: u4,
        padding: u22 = 0,
    }),
    /// Receive FIFO status of Rx channel 0
    /// offset: 0x2c8
    INFIFO_STATUS1_CH2: mmio.Mmio(packed struct(u32) {
        /// The register stores the byte number of the data in L1 Rx FIFO for Rx channel 0.
        L1INFIFO_CNT_CH: u6,
        /// The register stores the byte number of the data in L2 Rx FIFO for Rx channel 0.
        L2INFIFO_CNT_CH: u4,
        padding: u22 = 0,
    }),
    /// Receive FIFO status of Tx channel 0
    /// offset: 0x2cc
    OUTFIFO_STATUS1_CH0: mmio.Mmio(packed struct(u32) {
        /// The register stores the byte number of the data in L1 Tx FIFO for Tx channel 0.
        L1OUTFIFO_CNT_CH: u6,
        /// The register stores the byte number of the data in L2 Tx FIFO for Tx channel 0.
        L2OUTFIFO_CNT_CH: u4,
        padding: u22 = 0,
    }),
    /// Receive FIFO status of Tx channel 0
    /// offset: 0x2d0
    OUTFIFO_STATUS1_CH1: mmio.Mmio(packed struct(u32) {
        /// The register stores the byte number of the data in L1 Tx FIFO for Tx channel 0.
        L1OUTFIFO_CNT_CH: u6,
        /// The register stores the byte number of the data in L2 Tx FIFO for Tx channel 0.
        L2OUTFIFO_CNT_CH: u4,
        padding: u22 = 0,
    }),
    /// Receive FIFO status of Tx channel 0
    /// offset: 0x2d4
    OUTFIFO_STATUS1_CH2: mmio.Mmio(packed struct(u32) {
        /// The register stores the byte number of the data in L1 Tx FIFO for Tx channel 0.
        L1OUTFIFO_CNT_CH: u6,
        /// The register stores the byte number of the data in L2 Tx FIFO for Tx channel 0.
        L2OUTFIFO_CNT_CH: u4,
        padding: u22 = 0,
    }),
    /// Version control register
    /// offset: 0x2d8
    DATE: mmio.Mmio(packed struct(u32) {
        /// register version.
        DATE: u32,
    }),
};
