const mmio = @import("mmio");
const types = @import("../../types.zig");

/// SPI (Serial Peripheral Interface) Controller 2
pub const SPI2 = extern struct {
    /// Command control register
    /// offset: 0x00
    SPI_CMD: mmio.Mmio(packed struct(u32) {
        /// Define the APB cycles of SPI_CONF state. Can be configured in CONF state.
        SPI_CONF_BITLEN: u18,
        reserved23: u5 = 0,
        /// Set this bit to synchronize SPI registers from APB clock domain into SPI module clock domain, which is only used in SPI master mode.
        SPI_UPDATE: u1,
        /// User define command enable. An operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable. Can not be changed by CONF_buf.
        SPI_USR: u1,
        padding: u7 = 0,
    }),
    /// Address value register
    /// offset: 0x04
    SPI_ADDR: mmio.Mmio(packed struct(u32) {
        /// Address to slave. Can be configured in CONF state.
        SPI_USR_ADDR_VALUE: u32,
    }),
    /// SPI control register
    /// offset: 0x08
    SPI_CTRL: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// 0: In the dummy phase, the FSPI bus signals are not output. 1: In the dummy phase, the FSPI bus signals are output. Can be configured in CONF state.
        SPI_DUMMY_OUT: u1,
        reserved5: u1 = 0,
        /// Apply 2 signals during addr phase 1:enable 0: disable. Can be configured in CONF state.
        SPI_FADDR_DUAL: u1,
        /// Apply 4 signals during addr phase 1:enable 0: disable. Can be configured in CONF state.
        SPI_FADDR_QUAD: u1,
        /// Apply 8 signals during addr phase 1:enable 0: disable. Can be configured in CONF state.
        SPI_FADDR_OCT: u1,
        /// Apply 2 signals during command phase 1:enable 0: disable. Can be configured in CONF state.
        SPI_FCMD_DUAL: u1,
        /// Apply 4 signals during command phase 1:enable 0: disable. Can be configured in CONF state.
        SPI_FCMD_QUAD: u1,
        /// Apply 8 signals during command phase 1:enable 0: disable. Can be configured in CONF state.
        SPI_FCMD_OCT: u1,
        reserved14: u3 = 0,
        /// In the read operations, read-data phase apply 2 signals. 1: enable 0: disable. Can be configured in CONF state.
        SPI_FREAD_DUAL: u1,
        /// In the read operations read-data phase apply 4 signals. 1: enable 0: disable. Can be configured in CONF state.
        SPI_FREAD_QUAD: u1,
        /// In the read operations read-data phase apply 8 signals. 1: enable 0: disable. Can be configured in CONF state.
        SPI_FREAD_OCT: u1,
        reserved18: u1 = 0,
        /// The bit is used to set MISO line polarity, 1: high 0, low. Can be configured in CONF state.
        SPI_Q_POL: u1,
        /// The bit is used to set MOSI line polarity, 1: high 0, low. Can be configured in CONF state.
        SPI_D_POL: u1,
        /// SPI_HOLD output value when SPI is idle. 1: output high, 0: output low. Can be configured in CONF state.
        SPI_HOLD_POL: u1,
        /// Write protect signal output when SPI is idle. 1: output high, 0: output low. Can be configured in CONF state.
        SPI_WP_POL: u1,
        reserved23: u1 = 0,
        /// In read-data (MISO) phase 1: LSB first 0: MSB first. Can be configured in CONF state.
        SPI_RD_BIT_ORDER: u2,
        /// In command address write-data (MOSI) phases 1: LSB firs 0: MSB first. Can be configured in CONF state.
        SPI_WR_BIT_ORDER: u2,
        padding: u5 = 0,
    }),
    /// SPI clock control register
    /// offset: 0x0c
    SPI_CLOCK: mmio.Mmio(packed struct(u32) {
        /// In the master mode it must be equal to spi_clkcnt_N. In the slave mode it must be 0. Can be configured in CONF state.
        SPI_CLKCNT_L: u6,
        /// In the master mode it must be floor((spi_clkcnt_N+1)/2-1). In the slave mode it must be 0. Can be configured in CONF state.
        SPI_CLKCNT_H: u6,
        /// In the master mode it is the divider of spi_clk. So spi_clk frequency is system/(spi_clkdiv_pre+1)/(spi_clkcnt_N+1). Can be configured in CONF state.
        SPI_CLKCNT_N: u6,
        /// In the master mode it is pre-divider of spi_clk. Can be configured in CONF state.
        SPI_CLKDIV_PRE: u4,
        reserved31: u9 = 0,
        /// In the master mode 1: spi_clk is eqaul to system 0: spi_clk is divided from system clock. Can be configured in CONF state.
        SPI_CLK_EQU_SYSCLK: u1,
    }),
    /// SPI USER control register
    /// offset: 0x10
    SPI_USER: mmio.Mmio(packed struct(u32) {
        /// Set the bit to enable full duplex communication. 1: enable 0: disable. Can be configured in CONF state.
        SPI_DOUTDIN: u1,
        reserved3: u2 = 0,
        /// Both for master mode and slave mode. 1: spi controller is in QPI mode. 0: others. Can be configured in CONF state.
        SPI_QPI_MODE: u1,
        /// Just for master mode. 1: spi controller is in OPI mode (all in 8-b-m). 0: others. Can be configured in CONF state.
        SPI_OPI_MODE: u1,
        /// In the slave mode, this bit can be used to change the polarity of tsck. 0: tsck = spi_ck_i. 1:tsck = !spi_ck_i.
        SPI_TSCK_I_EDGE: u1,
        /// spi cs keep low when spi is in done phase. 1: enable 0: disable. Can be configured in CONF state.
        SPI_CS_HOLD: u1,
        /// spi cs is enable when spi is in prepare phase. 1: enable 0: disable. Can be configured in CONF state.
        SPI_CS_SETUP: u1,
        /// In the slave mode, this bit can be used to change the polarity of rsck. 0: rsck = !spi_ck_i. 1:rsck = spi_ck_i.
        SPI_RSCK_I_EDGE: u1,
        /// the bit combined with spi_mosi_delay_mode bits to set mosi signal delay mode. Can be configured in CONF state.
        SPI_CK_OUT_EDGE: u1,
        reserved12: u2 = 0,
        /// In the write operations read-data phase apply 2 signals. Can be configured in CONF state.
        SPI_FWRITE_DUAL: u1,
        /// In the write operations read-data phase apply 4 signals. Can be configured in CONF state.
        SPI_FWRITE_QUAD: u1,
        /// In the write operations read-data phase apply 8 signals. Can be configured in CONF state.
        SPI_FWRITE_OCT: u1,
        /// 1: Enable the DMA CONF phase of next seg-trans operation, which means seg-trans will continue. 0: The seg-trans will end after the current SPI seg-trans or this is not seg-trans mode. Can be configured in CONF state.
        SPI_USR_CONF_NXT: u1,
        reserved17: u1 = 0,
        /// Set the bit to enable 3-line half duplex communication mosi and miso signals share the same pin. 1: enable 0: disable. Can be configured in CONF state.
        SPI_SIO: u1,
        reserved24: u6 = 0,
        /// read-data phase only access to high-part of the buffer spi_w8~spi_w15. 1: enable 0: disable. Can be configured in CONF state.
        SPI_USR_MISO_HIGHPART: u1,
        /// write-data phase only access to high-part of the buffer spi_w8~spi_w15. 1: enable 0: disable. Can be configured in CONF state.
        SPI_USR_MOSI_HIGHPART: u1,
        /// spi clock is disable in dummy phase when the bit is enable. Can be configured in CONF state.
        SPI_USR_DUMMY_IDLE: u1,
        /// This bit enable the write-data phase of an operation. Can be configured in CONF state.
        SPI_USR_MOSI: u1,
        /// This bit enable the read-data phase of an operation. Can be configured in CONF state.
        SPI_USR_MISO: u1,
        /// This bit enable the dummy phase of an operation. Can be configured in CONF state.
        SPI_USR_DUMMY: u1,
        /// This bit enable the address phase of an operation. Can be configured in CONF state.
        SPI_USR_ADDR: u1,
        /// This bit enable the command phase of an operation. Can be configured in CONF state.
        SPI_USR_COMMAND: u1,
    }),
    /// SPI USER control register 1
    /// offset: 0x14
    SPI_USER1: mmio.Mmio(packed struct(u32) {
        /// The length in spi_clk cycles of dummy phase. The register value shall be (cycle_num-1). Can be configured in CONF state.
        SPI_USR_DUMMY_CYCLELEN: u8,
        reserved16: u8 = 0,
        /// 1: SPI transfer is ended when SPI RX AFIFO wfull error is valid in GP-SPI master FD/HD-mode. 0: SPI transfer is not ended when SPI RX AFIFO wfull error is valid in GP-SPI master FD/HD-mode.
        SPI_MST_WFULL_ERR_END_EN: u1,
        /// (cycles+1) of prepare phase by spi clock this bits are combined with spi_cs_setup bit. Can be configured in CONF state.
        SPI_CS_SETUP_TIME: u5,
        /// delay cycles of cs pin by spi clock this bits are combined with spi_cs_hold bit. Can be configured in CONF state.
        SPI_CS_HOLD_TIME: u5,
        /// The length in bits of address phase. The register value shall be (bit_num-1). Can be configured in CONF state.
        SPI_USR_ADDR_BITLEN: u5,
    }),
    /// SPI USER control register 2
    /// offset: 0x18
    SPI_USER2: mmio.Mmio(packed struct(u32) {
        /// The value of command. Can be configured in CONF state.
        SPI_USR_COMMAND_VALUE: u16,
        reserved27: u11 = 0,
        /// 1: SPI transfer is ended when SPI TX AFIFO read empty error is valid in GP-SPI master FD/HD-mode. 0: SPI transfer is not ended when SPI TX AFIFO read empty error is valid in GP-SPI master FD/HD-mode.
        SPI_MST_REMPTY_ERR_END_EN: u1,
        /// The length in bits of command phase. The register value shall be (bit_num-1). Can be configured in CONF state.
        SPI_USR_COMMAND_BITLEN: u4,
    }),
    /// SPI data bit length control register
    /// offset: 0x1c
    SPI_MS_DLEN: mmio.Mmio(packed struct(u32) {
        /// The value of these bits is the configured SPI transmission data bit length in master mode DMA controlled transfer or CPU controlled transfer. The value is also the configured bit length in slave mode DMA RX controlled transfer. The register value shall be (bit_num-1). Can be configured in CONF state.
        SPI_MS_DATA_BITLEN: u18,
        padding: u14 = 0,
    }),
    /// SPI misc register
    /// offset: 0x20
    SPI_MISC: mmio.Mmio(packed struct(u32) {
        /// SPI CS0 pin enable, 1: disable CS0, 0: spi_cs0 signal is from/to CS0 pin. Can be configured in CONF state.
        SPI_CS0_DIS: u1,
        /// SPI CS1 pin enable, 1: disable CS1, 0: spi_cs1 signal is from/to CS1 pin. Can be configured in CONF state.
        SPI_CS1_DIS: u1,
        /// SPI CS2 pin enable, 1: disable CS2, 0: spi_cs2 signal is from/to CS2 pin. Can be configured in CONF state.
        SPI_CS2_DIS: u1,
        /// SPI CS3 pin enable, 1: disable CS3, 0: spi_cs3 signal is from/to CS3 pin. Can be configured in CONF state.
        SPI_CS3_DIS: u1,
        /// SPI CS4 pin enable, 1: disable CS4, 0: spi_cs4 signal is from/to CS4 pin. Can be configured in CONF state.
        SPI_CS4_DIS: u1,
        /// SPI CS5 pin enable, 1: disable CS5, 0: spi_cs5 signal is from/to CS5 pin. Can be configured in CONF state.
        SPI_CS5_DIS: u1,
        /// 1: spi clk out disable, 0: spi clk out enable. Can be configured in CONF state.
        SPI_CK_DIS: u1,
        /// In the master mode the bits are the polarity of spi cs line, the value is equivalent to spi_cs ^ spi_master_cs_pol. Can be configured in CONF state.
        SPI_MASTER_CS_POL: u6,
        reserved16: u3 = 0,
        /// 1: SPI master DTR mode is applied to SPI clk, data and spi_dqs. 0: SPI master DTR mode is only applied to spi_dqs. This bit should be used with bit 17/18/19.
        SPI_CLK_DATA_DTR_EN: u1,
        /// 1: SPI clk and data of SPI_DOUT and SPI_DIN state are in DTR mode, including master 1/2/4/8-bm. 0: SPI clk and data of SPI_DOUT and SPI_DIN state are in STR mode. Can be configured in CONF state.
        SPI_DATA_DTR_EN: u1,
        /// 1: SPI clk and data of SPI_SEND_ADDR state are in DTR mode, including master 1/2/4/8-bm. 0: SPI clk and data of SPI_SEND_ADDR state are in STR mode. Can be configured in CONF state.
        SPI_ADDR_DTR_EN: u1,
        /// 1: SPI clk and data of SPI_SEND_CMD state are in DTR mode, including master 1/2/4/8-bm. 0: SPI clk and data of SPI_SEND_CMD state are in STR mode. Can be configured in CONF state.
        SPI_CMD_DTR_EN: u1,
        reserved23: u3 = 0,
        /// spi slave input cs polarity select. 1: inv 0: not change. Can be configured in CONF state.
        SPI_SLAVE_CS_POL: u1,
        /// The default value of spi_dqs. Can be configured in CONF state.
        SPI_DQS_IDLE_EDGE: u1,
        reserved29: u4 = 0,
        /// 1: spi clk line is high when idle 0: spi clk line is low when idle. Can be configured in CONF state.
        SPI_CK_IDLE_EDGE: u1,
        /// spi cs line keep low when the bit is set. Can be configured in CONF state.
        SPI_CS_KEEP_ACTIVE: u1,
        /// 1: SPI quad input swap enable, swap FSPID with FSPIQ, swap FSPIWP with FSPIHD. 0: spi quad input swap disable. Can be configured in CONF state.
        SPI_QUAD_DIN_PIN_SWAP: u1,
    }),
    /// SPI input delay mode configuration
    /// offset: 0x24
    SPI_DIN_MODE: mmio.Mmio(packed struct(u32) {
        /// the input signals are delayed by SPI module clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk. Can be configured in CONF state.
        SPI_DIN0_MODE: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk. Can be configured in CONF state.
        SPI_DIN1_MODE: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk. Can be configured in CONF state.
        SPI_DIN2_MODE: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk. Can be configured in CONF state.
        SPI_DIN3_MODE: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk. Can be configured in CONF state.
        SPI_DIN4_MODE: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk. Can be configured in CONF state.
        SPI_DIN5_MODE: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk. Can be configured in CONF state.
        SPI_DIN6_MODE: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk. Can be configured in CONF state.
        SPI_DIN7_MODE: u2,
        /// 1:enable hclk in SPI input timing module. 0: disable it. Can be configured in CONF state.
        SPI_TIMING_HCLK_ACTIVE: u1,
        padding: u15 = 0,
    }),
    /// SPI input delay number configuration
    /// offset: 0x28
    SPI_DIN_NUM: mmio.Mmio(packed struct(u32) {
        /// the input signals are delayed by SPI module clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,... Can be configured in CONF state.
        SPI_DIN0_NUM: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,... Can be configured in CONF state.
        SPI_DIN1_NUM: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,... Can be configured in CONF state.
        SPI_DIN2_NUM: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,... Can be configured in CONF state.
        SPI_DIN3_NUM: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,... Can be configured in CONF state.
        SPI_DIN4_NUM: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,... Can be configured in CONF state.
        SPI_DIN5_NUM: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,... Can be configured in CONF state.
        SPI_DIN6_NUM: u2,
        /// the input signals are delayed by SPI module clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,... Can be configured in CONF state.
        SPI_DIN7_NUM: u2,
        padding: u16 = 0,
    }),
    /// SPI output delay mode configuration
    /// offset: 0x2c
    SPI_DOUT_MODE: mmio.Mmio(packed struct(u32) {
        /// The output signal 0 is delayed by the SPI module clock, 0: output without delayed, 1: output delay for a SPI module clock cycle at its negative edge. Can be configured in CONF state.
        SPI_DOUT0_MODE: u1,
        /// The output signal 1 is delayed by the SPI module clock, 0: output without delayed, 1: output delay for a SPI module clock cycle at its negative edge. Can be configured in CONF state.
        SPI_DOUT1_MODE: u1,
        /// The output signal 2 is delayed by the SPI module clock, 0: output without delayed, 1: output delay for a SPI module clock cycle at its negative edge. Can be configured in CONF state.
        SPI_DOUT2_MODE: u1,
        /// The output signal 3 is delayed by the SPI module clock, 0: output without delayed, 1: output delay for a SPI module clock cycle at its negative edge. Can be configured in CONF state.
        SPI_DOUT3_MODE: u1,
        /// The output signal 4 is delayed by the SPI module clock, 0: output without delayed, 1: output delay for a SPI module clock cycle at its negative edge. Can be configured in CONF state.
        SPI_DOUT4_MODE: u1,
        /// The output signal 5 is delayed by the SPI module clock, 0: output without delayed, 1: output delay for a SPI module clock cycle at its negative edge. Can be configured in CONF state.
        SPI_DOUT5_MODE: u1,
        /// The output signal 6 is delayed by the SPI module clock, 0: output without delayed, 1: output delay for a SPI module clock cycle at its negative edge. Can be configured in CONF state.
        SPI_DOUT6_MODE: u1,
        /// The output signal 7 is delayed by the SPI module clock, 0: output without delayed, 1: output delay for a SPI module clock cycle at its negative edge. Can be configured in CONF state.
        SPI_DOUT7_MODE: u1,
        /// The output signal SPI_DQS is delayed by the SPI module clock, 0: output without delayed, 1: output delay for a SPI module clock cycle at its negative edge. Can be configured in CONF state.
        SPI_D_DQS_MODE: u1,
        padding: u23 = 0,
    }),
    /// SPI DMA control register
    /// offset: 0x30
    SPI_DMA_CONF: mmio.Mmio(packed struct(u32) {
        /// Records the status of DMA TX FIFO. 1: DMA TX FIFO is not ready for sending data. 0: DMA TX FIFO is ready for sending data.
        SPI_DMA_OUTFIFO_EMPTY: u1,
        /// Records the status of DMA RX FIFO. 1: DMA RX FIFO is not ready for receiving data. 0: DMA RX FIFO is ready for receiving data.
        SPI_DMA_INFIFO_FULL: u1,
        reserved18: u16 = 0,
        /// Enable dma segment transfer in spi dma half slave mode. 1: enable. 0: disable.
        SPI_DMA_SLV_SEG_TRANS_EN: u1,
        /// 1: spi_dma_infifo_full_vld is cleared by spi slave cmd 5. 0: spi_dma_infifo_full_vld is cleared by spi_trans_done.
        SPI_SLV_RX_SEG_TRANS_CLR_EN: u1,
        /// 1: spi_dma_outfifo_empty_vld is cleared by spi slave cmd 6. 0: spi_dma_outfifo_empty_vld is cleared by spi_trans_done.
        SPI_SLV_TX_SEG_TRANS_CLR_EN: u1,
        /// 1: spi_dma_inlink_eof is set when the number of dma pushed data bytes is equal to the value of spi_slv/mst_dma_rd_bytelen[19:0] in spi dma transition. 0: spi_dma_inlink_eof is set by spi_trans_done in non-seg-trans or spi_dma_seg_trans_done in seg-trans.
        SPI_RX_EOF_EN: u1,
        reserved27: u5 = 0,
        /// Set this bit to enable SPI DMA controlled receive data mode.
        SPI_DMA_RX_ENA: u1,
        /// Set this bit to enable SPI DMA controlled send data mode.
        SPI_DMA_TX_ENA: u1,
        /// Set this bit to reset RX AFIFO, which is used to receive data in SPI master and slave mode transfer.
        SPI_RX_AFIFO_RST: u1,
        /// Set this bit to reset BUF TX AFIFO, which is used send data out in SPI slave CPU controlled mode transfer and master mode transfer.
        SPI_BUF_AFIFO_RST: u1,
        /// Set this bit to reset DMA TX AFIFO, which is used to send data out in SPI slave DMA controlled mode transfer.
        SPI_DMA_AFIFO_RST: u1,
    }),
    /// SPI interrupt enable register
    /// offset: 0x34
    SPI_DMA_INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The enable bit for SPI_DMA_INFIFO_FULL_ERR_INT interrupt.
        SPI_DMA_INFIFO_FULL_ERR_INT_ENA: u1,
        /// The enable bit for SPI_DMA_OUTFIFO_EMPTY_ERR_INT interrupt.
        SPI_DMA_OUTFIFO_EMPTY_ERR_INT_ENA: u1,
        /// The enable bit for SPI slave Ex_QPI interrupt.
        SPI_SLV_EX_QPI_INT_ENA: u1,
        /// The enable bit for SPI slave En_QPI interrupt.
        SPI_SLV_EN_QPI_INT_ENA: u1,
        /// The enable bit for SPI slave CMD7 interrupt.
        SPI_SLV_CMD7_INT_ENA: u1,
        /// The enable bit for SPI slave CMD8 interrupt.
        SPI_SLV_CMD8_INT_ENA: u1,
        /// The enable bit for SPI slave CMD9 interrupt.
        SPI_SLV_CMD9_INT_ENA: u1,
        /// The enable bit for SPI slave CMDA interrupt.
        SPI_SLV_CMDA_INT_ENA: u1,
        /// The enable bit for SPI_SLV_RD_DMA_DONE_INT interrupt.
        SPI_SLV_RD_DMA_DONE_INT_ENA: u1,
        /// The enable bit for SPI_SLV_WR_DMA_DONE_INT interrupt.
        SPI_SLV_WR_DMA_DONE_INT_ENA: u1,
        /// The enable bit for SPI_SLV_RD_BUF_DONE_INT interrupt.
        SPI_SLV_RD_BUF_DONE_INT_ENA: u1,
        /// The enable bit for SPI_SLV_WR_BUF_DONE_INT interrupt.
        SPI_SLV_WR_BUF_DONE_INT_ENA: u1,
        /// The enable bit for SPI_TRANS_DONE_INT interrupt.
        SPI_TRANS_DONE_INT_ENA: u1,
        /// The enable bit for SPI_DMA_SEG_TRANS_DONE_INT interrupt.
        SPI_DMA_SEG_TRANS_DONE_INT_ENA: u1,
        /// The enable bit for SPI_SEG_MAGIC_ERR_INT interrupt.
        SPI_SEG_MAGIC_ERR_INT_ENA: u1,
        /// The enable bit for SPI_SLV_BUF_ADDR_ERR_INT interrupt.
        SPI_SLV_BUF_ADDR_ERR_INT_ENA: u1,
        /// The enable bit for SPI_SLV_CMD_ERR_INT interrupt.
        SPI_SLV_CMD_ERR_INT_ENA: u1,
        /// The enable bit for SPI_MST_RX_AFIFO_WFULL_ERR_INT interrupt.
        SPI_MST_RX_AFIFO_WFULL_ERR_INT_ENA: u1,
        /// The enable bit for SPI_MST_TX_AFIFO_REMPTY_ERR_INT interrupt.
        SPI_MST_TX_AFIFO_REMPTY_ERR_INT_ENA: u1,
        /// The enable bit for SPI_APP2_INT interrupt.
        SPI_APP2_INT_ENA: u1,
        /// The enable bit for SPI_APP1_INT interrupt.
        SPI_APP1_INT_ENA: u1,
        padding: u11 = 0,
    }),
    /// SPI interrupt clear register
    /// offset: 0x38
    SPI_DMA_INT_CLR: mmio.Mmio(packed struct(u32) {
        /// The clear bit for SPI_DMA_INFIFO_FULL_ERR_INT interrupt.
        SPI_DMA_INFIFO_FULL_ERR_INT_CLR: u1,
        /// The clear bit for SPI_DMA_OUTFIFO_EMPTY_ERR_INT interrupt.
        SPI_DMA_OUTFIFO_EMPTY_ERR_INT_CLR: u1,
        /// The clear bit for SPI slave Ex_QPI interrupt.
        SPI_SLV_EX_QPI_INT_CLR: u1,
        /// The clear bit for SPI slave En_QPI interrupt.
        SPI_SLV_EN_QPI_INT_CLR: u1,
        /// The clear bit for SPI slave CMD7 interrupt.
        SPI_SLV_CMD7_INT_CLR: u1,
        /// The clear bit for SPI slave CMD8 interrupt.
        SPI_SLV_CMD8_INT_CLR: u1,
        /// The clear bit for SPI slave CMD9 interrupt.
        SPI_SLV_CMD9_INT_CLR: u1,
        /// The clear bit for SPI slave CMDA interrupt.
        SPI_SLV_CMDA_INT_CLR: u1,
        /// The clear bit for SPI_SLV_RD_DMA_DONE_INT interrupt.
        SPI_SLV_RD_DMA_DONE_INT_CLR: u1,
        /// The clear bit for SPI_SLV_WR_DMA_DONE_INT interrupt.
        SPI_SLV_WR_DMA_DONE_INT_CLR: u1,
        /// The clear bit for SPI_SLV_RD_BUF_DONE_INT interrupt.
        SPI_SLV_RD_BUF_DONE_INT_CLR: u1,
        /// The clear bit for SPI_SLV_WR_BUF_DONE_INT interrupt.
        SPI_SLV_WR_BUF_DONE_INT_CLR: u1,
        /// The clear bit for SPI_TRANS_DONE_INT interrupt.
        SPI_TRANS_DONE_INT_CLR: u1,
        /// The clear bit for SPI_DMA_SEG_TRANS_DONE_INT interrupt.
        SPI_DMA_SEG_TRANS_DONE_INT_CLR: u1,
        /// The clear bit for SPI_SEG_MAGIC_ERR_INT interrupt.
        SPI_SEG_MAGIC_ERR_INT_CLR: u1,
        /// The clear bit for SPI_SLV_BUF_ADDR_ERR_INT interrupt.
        SPI_SLV_BUF_ADDR_ERR_INT_CLR: u1,
        /// The clear bit for SPI_SLV_CMD_ERR_INT interrupt.
        SPI_SLV_CMD_ERR_INT_CLR: u1,
        /// The clear bit for SPI_MST_RX_AFIFO_WFULL_ERR_INT interrupt.
        SPI_MST_RX_AFIFO_WFULL_ERR_INT_CLR: u1,
        /// The clear bit for SPI_MST_TX_AFIFO_REMPTY_ERR_INT interrupt.
        SPI_MST_TX_AFIFO_REMPTY_ERR_INT_CLR: u1,
        /// The clear bit for SPI_APP2_INT interrupt.
        SPI_APP2_INT_CLR: u1,
        /// The clear bit for SPI_APP1_INT interrupt.
        SPI_APP1_INT_CLR: u1,
        padding: u11 = 0,
    }),
    /// SPI interrupt raw register
    /// offset: 0x3c
    SPI_DMA_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// 1: The current data rate of DMA Rx is smaller than that of SPI, which will lose the receive data. 0: Others.
        SPI_DMA_INFIFO_FULL_ERR_INT_RAW: u1,
        /// 1: The current data rate of DMA TX is smaller than that of SPI. SPI will stop in master mode and send out all 0 in slave mode. 0: Others.
        SPI_DMA_OUTFIFO_EMPTY_ERR_INT_RAW: u1,
        /// The raw bit for SPI slave Ex_QPI interrupt. 1: SPI slave mode Ex_QPI transmission is ended. 0: Others.
        SPI_SLV_EX_QPI_INT_RAW: u1,
        /// The raw bit for SPI slave En_QPI interrupt. 1: SPI slave mode En_QPI transmission is ended. 0: Others.
        SPI_SLV_EN_QPI_INT_RAW: u1,
        /// The raw bit for SPI slave CMD7 interrupt. 1: SPI slave mode CMD7 transmission is ended. 0: Others.
        SPI_SLV_CMD7_INT_RAW: u1,
        /// The raw bit for SPI slave CMD8 interrupt. 1: SPI slave mode CMD8 transmission is ended. 0: Others.
        SPI_SLV_CMD8_INT_RAW: u1,
        /// The raw bit for SPI slave CMD9 interrupt. 1: SPI slave mode CMD9 transmission is ended. 0: Others.
        SPI_SLV_CMD9_INT_RAW: u1,
        /// The raw bit for SPI slave CMDA interrupt. 1: SPI slave mode CMDA transmission is ended. 0: Others.
        SPI_SLV_CMDA_INT_RAW: u1,
        /// The raw bit for SPI_SLV_RD_DMA_DONE_INT interrupt. 1: SPI slave mode Rd_DMA transmission is ended. 0: Others.
        SPI_SLV_RD_DMA_DONE_INT_RAW: u1,
        /// The raw bit for SPI_SLV_WR_DMA_DONE_INT interrupt. 1: SPI slave mode Wr_DMA transmission is ended. 0: Others.
        SPI_SLV_WR_DMA_DONE_INT_RAW: u1,
        /// The raw bit for SPI_SLV_RD_BUF_DONE_INT interrupt. 1: SPI slave mode Rd_BUF transmission is ended. 0: Others.
        SPI_SLV_RD_BUF_DONE_INT_RAW: u1,
        /// The raw bit for SPI_SLV_WR_BUF_DONE_INT interrupt. 1: SPI slave mode Wr_BUF transmission is ended. 0: Others.
        SPI_SLV_WR_BUF_DONE_INT_RAW: u1,
        /// The raw bit for SPI_TRANS_DONE_INT interrupt. 1: SPI master mode transmission is ended. 0: others.
        SPI_TRANS_DONE_INT_RAW: u1,
        /// The raw bit for SPI_DMA_SEG_TRANS_DONE_INT interrupt. 1: spi master DMA full-duplex/half-duplex seg-conf-trans ends or slave half-duplex seg-trans ends. And data has been pushed to corresponding memory. 0: seg-conf-trans or seg-trans is not ended or not occurred.
        SPI_DMA_SEG_TRANS_DONE_INT_RAW: u1,
        /// The raw bit for SPI_SEG_MAGIC_ERR_INT interrupt. 1: The magic value in CONF buffer is error in the DMA seg-conf-trans. 0: others.
        SPI_SEG_MAGIC_ERR_INT_RAW: u1,
        /// The raw bit for SPI_SLV_BUF_ADDR_ERR_INT interrupt. 1: The accessing data address of the current SPI slave mode CPU controlled FD, Wr_BUF or Rd_BUF transmission is bigger than 63. 0: Others.
        SPI_SLV_BUF_ADDR_ERR_INT_RAW: u1,
        /// The raw bit for SPI_SLV_CMD_ERR_INT interrupt. 1: The slave command value in the current SPI slave HD mode transmission is not supported. 0: Others.
        SPI_SLV_CMD_ERR_INT_RAW: u1,
        /// The raw bit for SPI_MST_RX_AFIFO_WFULL_ERR_INT interrupt. 1: There is a RX AFIFO write-full error when SPI inputs data in master mode. 0: Others.
        SPI_MST_RX_AFIFO_WFULL_ERR_INT_RAW: u1,
        /// The raw bit for SPI_MST_TX_AFIFO_REMPTY_ERR_INT interrupt. 1: There is a TX BUF AFIFO read-empty error when SPI outputs data in master mode. 0: Others.
        SPI_MST_TX_AFIFO_REMPTY_ERR_INT_RAW: u1,
        /// The raw bit for SPI_APP2_INT interrupt. The value is only controlled by software.
        SPI_APP2_INT_RAW: u1,
        /// The raw bit for SPI_APP1_INT interrupt. The value is only controlled by software.
        SPI_APP1_INT_RAW: u1,
        padding: u11 = 0,
    }),
    /// SPI interrupt status register
    /// offset: 0x40
    SPI_DMA_INT_ST: mmio.Mmio(packed struct(u32) {
        /// The status bit for SPI_DMA_INFIFO_FULL_ERR_INT interrupt.
        SPI_DMA_INFIFO_FULL_ERR_INT_ST: u1,
        /// The status bit for SPI_DMA_OUTFIFO_EMPTY_ERR_INT interrupt.
        SPI_DMA_OUTFIFO_EMPTY_ERR_INT_ST: u1,
        /// The status bit for SPI slave Ex_QPI interrupt.
        SPI_SLV_EX_QPI_INT_ST: u1,
        /// The status bit for SPI slave En_QPI interrupt.
        SPI_SLV_EN_QPI_INT_ST: u1,
        /// The status bit for SPI slave CMD7 interrupt.
        SPI_SLV_CMD7_INT_ST: u1,
        /// The status bit for SPI slave CMD8 interrupt.
        SPI_SLV_CMD8_INT_ST: u1,
        /// The status bit for SPI slave CMD9 interrupt.
        SPI_SLV_CMD9_INT_ST: u1,
        /// The status bit for SPI slave CMDA interrupt.
        SPI_SLV_CMDA_INT_ST: u1,
        /// The status bit for SPI_SLV_RD_DMA_DONE_INT interrupt.
        SPI_SLV_RD_DMA_DONE_INT_ST: u1,
        /// The status bit for SPI_SLV_WR_DMA_DONE_INT interrupt.
        SPI_SLV_WR_DMA_DONE_INT_ST: u1,
        /// The status bit for SPI_SLV_RD_BUF_DONE_INT interrupt.
        SPI_SLV_RD_BUF_DONE_INT_ST: u1,
        /// The status bit for SPI_SLV_WR_BUF_DONE_INT interrupt.
        SPI_SLV_WR_BUF_DONE_INT_ST: u1,
        /// The status bit for SPI_TRANS_DONE_INT interrupt.
        SPI_TRANS_DONE_INT_ST: u1,
        /// The status bit for SPI_DMA_SEG_TRANS_DONE_INT interrupt.
        SPI_DMA_SEG_TRANS_DONE_INT_ST: u1,
        /// The status bit for SPI_SEG_MAGIC_ERR_INT interrupt.
        SPI_SEG_MAGIC_ERR_INT_ST: u1,
        /// The status bit for SPI_SLV_BUF_ADDR_ERR_INT interrupt.
        SPI_SLV_BUF_ADDR_ERR_INT_ST: u1,
        /// The status bit for SPI_SLV_CMD_ERR_INT interrupt.
        SPI_SLV_CMD_ERR_INT_ST: u1,
        /// The status bit for SPI_MST_RX_AFIFO_WFULL_ERR_INT interrupt.
        SPI_MST_RX_AFIFO_WFULL_ERR_INT_ST: u1,
        /// The status bit for SPI_MST_TX_AFIFO_REMPTY_ERR_INT interrupt.
        SPI_MST_TX_AFIFO_REMPTY_ERR_INT_ST: u1,
        /// The status bit for SPI_APP2_INT interrupt.
        SPI_APP2_INT_ST: u1,
        /// The status bit for SPI_APP1_INT interrupt.
        SPI_APP1_INT_ST: u1,
        padding: u11 = 0,
    }),
    /// SPI interrupt software set register
    /// offset: 0x44
    SPI_DMA_INT_SET: mmio.Mmio(packed struct(u32) {
        /// The software set bit for SPI_DMA_INFIFO_FULL_ERR_INT interrupt.
        SPI_DMA_INFIFO_FULL_ERR_INT_SET: u1,
        /// The software set bit for SPI_DMA_OUTFIFO_EMPTY_ERR_INT interrupt.
        SPI_DMA_OUTFIFO_EMPTY_ERR_INT_SET: u1,
        /// The software set bit for SPI slave Ex_QPI interrupt.
        SPI_SLV_EX_QPI_INT_SET: u1,
        /// The software set bit for SPI slave En_QPI interrupt.
        SPI_SLV_EN_QPI_INT_SET: u1,
        /// The software set bit for SPI slave CMD7 interrupt.
        SPI_SLV_CMD7_INT_SET: u1,
        /// The software set bit for SPI slave CMD8 interrupt.
        SPI_SLV_CMD8_INT_SET: u1,
        /// The software set bit for SPI slave CMD9 interrupt.
        SPI_SLV_CMD9_INT_SET: u1,
        /// The software set bit for SPI slave CMDA interrupt.
        SPI_SLV_CMDA_INT_SET: u1,
        /// The software set bit for SPI_SLV_RD_DMA_DONE_INT interrupt.
        SPI_SLV_RD_DMA_DONE_INT_SET: u1,
        /// The software set bit for SPI_SLV_WR_DMA_DONE_INT interrupt.
        SPI_SLV_WR_DMA_DONE_INT_SET: u1,
        /// The software set bit for SPI_SLV_RD_BUF_DONE_INT interrupt.
        SPI_SLV_RD_BUF_DONE_INT_SET: u1,
        /// The software set bit for SPI_SLV_WR_BUF_DONE_INT interrupt.
        SPI_SLV_WR_BUF_DONE_INT_SET: u1,
        /// The software set bit for SPI_TRANS_DONE_INT interrupt.
        SPI_TRANS_DONE_INT_SET: u1,
        /// The software set bit for SPI_DMA_SEG_TRANS_DONE_INT interrupt.
        SPI_DMA_SEG_TRANS_DONE_INT_SET: u1,
        /// The software set bit for SPI_SEG_MAGIC_ERR_INT interrupt.
        SPI_SEG_MAGIC_ERR_INT_SET: u1,
        /// The software set bit for SPI_SLV_BUF_ADDR_ERR_INT interrupt.
        SPI_SLV_BUF_ADDR_ERR_INT_SET: u1,
        /// The software set bit for SPI_SLV_CMD_ERR_INT interrupt.
        SPI_SLV_CMD_ERR_INT_SET: u1,
        /// The software set bit for SPI_MST_RX_AFIFO_WFULL_ERR_INT interrupt.
        SPI_MST_RX_AFIFO_WFULL_ERR_INT_SET: u1,
        /// The software set bit for SPI_MST_TX_AFIFO_REMPTY_ERR_INT interrupt.
        SPI_MST_TX_AFIFO_REMPTY_ERR_INT_SET: u1,
        /// The software set bit for SPI_APP2_INT interrupt.
        SPI_APP2_INT_SET: u1,
        /// The software set bit for SPI_APP1_INT interrupt.
        SPI_APP1_INT_SET: u1,
        padding: u11 = 0,
    }),
    /// offset: 0x48
    reserved72: [80]u8,
    /// SPI CPU-controlled buffer0
    /// offset: 0x98
    SPI_W0: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF0: u32,
    }),
    /// SPI CPU-controlled buffer1
    /// offset: 0x9c
    SPI_W1: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF1: u32,
    }),
    /// SPI CPU-controlled buffer2
    /// offset: 0xa0
    SPI_W2: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF2: u32,
    }),
    /// SPI CPU-controlled buffer3
    /// offset: 0xa4
    SPI_W3: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF3: u32,
    }),
    /// SPI CPU-controlled buffer4
    /// offset: 0xa8
    SPI_W4: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF4: u32,
    }),
    /// SPI CPU-controlled buffer5
    /// offset: 0xac
    SPI_W5: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF5: u32,
    }),
    /// SPI CPU-controlled buffer6
    /// offset: 0xb0
    SPI_W6: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF6: u32,
    }),
    /// SPI CPU-controlled buffer7
    /// offset: 0xb4
    SPI_W7: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF7: u32,
    }),
    /// SPI CPU-controlled buffer8
    /// offset: 0xb8
    SPI_W8: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF8: u32,
    }),
    /// SPI CPU-controlled buffer9
    /// offset: 0xbc
    SPI_W9: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF9: u32,
    }),
    /// SPI CPU-controlled buffer10
    /// offset: 0xc0
    SPI_W10: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF10: u32,
    }),
    /// SPI CPU-controlled buffer11
    /// offset: 0xc4
    SPI_W11: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF11: u32,
    }),
    /// SPI CPU-controlled buffer12
    /// offset: 0xc8
    SPI_W12: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF12: u32,
    }),
    /// SPI CPU-controlled buffer13
    /// offset: 0xcc
    SPI_W13: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF13: u32,
    }),
    /// SPI CPU-controlled buffer14
    /// offset: 0xd0
    SPI_W14: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF14: u32,
    }),
    /// SPI CPU-controlled buffer15
    /// offset: 0xd4
    SPI_W15: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_BUF15: u32,
    }),
    /// offset: 0xd8
    reserved216: [8]u8,
    /// SPI slave control register
    /// offset: 0xe0
    SPI_SLAVE: mmio.Mmio(packed struct(u32) {
        /// SPI clock mode bits. 0: SPI clock is off when CS inactive 1: SPI clock is delayed one cycle after CS inactive 2: SPI clock is delayed two cycles after CS inactive 3: SPI clock is alwasy on. Can be configured in CONF state.
        SPI_CLK_MODE: u2,
        /// {CPOL, CPHA},1: support spi clk mode 1 and 3, first edge output data B[0]/B[7]. 0: support spi clk mode 0 and 2, first edge output data B[1]/B[6].
        SPI_CLK_MODE_13: u1,
        /// It saves half a cycle when tsck is the same as rsck. 1: output data at rsck posedge 0: output data at tsck posedge
        SPI_RSCK_DATA_OUT: u1,
        reserved8: u4 = 0,
        /// 1: SPI_SLV_DATA_BITLEN stores data bit length of master-read-slave data length in DMA controlled mode(Rd_DMA). 0: others
        SPI_SLV_RDDMA_BITLEN_EN: u1,
        /// 1: SPI_SLV_DATA_BITLEN stores data bit length of master-write-to-slave data length in DMA controlled mode(Wr_DMA). 0: others
        SPI_SLV_WRDMA_BITLEN_EN: u1,
        /// 1: SPI_SLV_DATA_BITLEN stores data bit length of master-read-slave data length in CPU controlled mode(Rd_BUF). 0: others
        SPI_SLV_RDBUF_BITLEN_EN: u1,
        /// 1: SPI_SLV_DATA_BITLEN stores data bit length of master-write-to-slave data length in CPU controlled mode(Wr_BUF). 0: others
        SPI_SLV_WRBUF_BITLEN_EN: u1,
        /// Represents the effective bit of the last received data byte in SPI slave FD and HD mode.
        SPI_SLV_LAST_BYTE_STRB: u8,
        reserved22: u2 = 0,
        /// The magic value of BM table in master DMA seg-trans.
        SPI_DMA_SEG_MAGIC_VALUE: u4,
        /// Set SPI work mode. 1: slave mode 0: master mode.
        MODE: u1,
        /// Software reset enable, reset the spi clock line cs line and data lines. Can be configured in CONF state.
        SPI_SOFT_RESET: u1,
        /// 1: Enable the DMA CONF phase of current seg-trans operation, which means seg-trans will start. 0: This is not seg-trans mode.
        SPI_USR_CONF: u1,
        /// In master full-duplex mode, 1: GP-SPI will wait DMA TX data is ready before starting SPI transfer. 0: GP-SPI does not wait DMA TX data before starting SPI transfer.
        SPI_MST_FD_WAIT_DMA_TX_DATA: u1,
        padding: u2 = 0,
    }),
    /// SPI slave control register 1
    /// offset: 0xe4
    SPI_SLAVE1: mmio.Mmio(packed struct(u32) {
        /// The transferred data bit length in SPI slave FD and HD mode.
        SPI_SLV_DATA_BITLEN: u18,
        /// In the slave mode it is the value of command.
        SPI_SLV_LAST_COMMAND: u8,
        /// In the slave mode it is the value of address.
        SPI_SLV_LAST_ADDR: u6,
    }),
    /// SPI module clock and register clock control
    /// offset: 0xe8
    SPI_CLK_GATE: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable clk gate
        SPI_CLK_EN: u1,
        /// Set this bit to power on the SPI module clock.
        SPI_MST_CLK_ACTIVE: u1,
        /// This bit is used to select SPI module clock source in master mode. 1: PLL_CLK_80M. 0: XTAL CLK.
        SPI_MST_CLK_SEL: u1,
        padding: u29 = 0,
    }),
    /// offset: 0xec
    reserved236: [4]u8,
    /// Version control
    /// offset: 0xf0
    SPI_DATE: mmio.Mmio(packed struct(u32) {
        /// SPI register version.
        SPI_DATE: u28,
        padding: u4 = 0,
    }),
};
