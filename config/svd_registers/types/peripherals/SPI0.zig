const mmio = @import("mmio");
const types = @import("../../types.zig");

/// SPI (Serial Peripheral Interface) Controller 0
pub const SPI0 = extern struct {
    /// SPI0 FSM status register
    /// offset: 0x00
    SPI_MEM_CMD: mmio.Mmio(packed struct(u32) {
        /// The current status of SPI0 master FSM: spi0_mst_st. 0: idle state, 1:SPI0_GRANT , 2: program/erase suspend state, 3: SPI0 read data state, 4: wait cache/EDMA sent data is stored in SPI0 TX FIFO, 5: SPI0 write data state.
        SPI_MEM_MST_ST: u4,
        /// The current status of SPI0 slave FSM: mspi_st. 0: idle state, 1: preparation state, 2: send command state, 3: send address state, 4: wait state, 5: read data state, 6:write data state, 7: done state, 8: read data end state.
        SPI_MEM_SLV_ST: u4,
        reserved18: u10 = 0,
        /// SPI0 USR_CMD start bit, only used when SPI_MEM_AXI_REQ_EN is cleared. An operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_USR: u1,
        padding: u13 = 0,
    }),
    /// offset: 0x04
    reserved4: [4]u8,
    /// SPI0 control register.
    /// offset: 0x08
    SPI_MEM_CTRL: mmio.Mmio(packed struct(u32) {
        /// In the dummy phase of an MSPI write data transfer when accesses to flash, the level of SPI_DQS is output by the MSPI controller.
        SPI_MEM_WDUMMY_DQS_ALWAYS_OUT: u1,
        /// In the dummy phase of an MSPI write data transfer when accesses to flash, the level of SPI_IO[7:0] is output by the MSPI controller.
        SPI_MEM_WDUMMY_ALWAYS_OUT: u1,
        /// In an MSPI read data transfer when accesses to flash, the level of SPI_IO[7:0] is output by the MSPI controller in the first half part of dummy phase. It is used to mask invalid SPI_DQS in the half part of dummy phase.
        SPI_MEM_FDUMMY_RIN: u1,
        /// In an MSPI write data transfer when accesses to flash, the level of SPI_IO[7:0] is output by the MSPI controller in the second half part of dummy phase. It is used to pre-drive flash.
        SPI_MEM_FDUMMY_WOUT: u1,
        /// Apply 8 signals during write-data phase 1:enable 0: disable
        SPI_MEM_FDOUT_OCT: u1,
        /// Apply 8 signals during read-data phase 1:enable 0: disable
        SPI_MEM_FDIN_OCT: u1,
        /// Apply 8 signals during address phase 1:enable 0: disable
        SPI_MEM_FADDR_OCT: u1,
        reserved8: u1 = 0,
        /// Apply 4 signals during command phase 1:enable 0: disable
        SPI_MEM_FCMD_QUAD: u1,
        /// Apply 8 signals during command phase 1:enable 0: disable
        SPI_MEM_FCMD_OCT: u1,
        reserved13: u3 = 0,
        /// This bit enable the bits: SPI_MEM_FREAD_QIO, SPI_MEM_FREAD_DIO, SPI_MEM_FREAD_QOUT and SPI_MEM_FREAD_DOUT. 1: enable 0: disable.
        SPI_MEM_FASTRD_MODE: u1,
        /// In the read operations, read-data phase apply 2 signals. 1: enable 0: disable.
        SPI_MEM_FREAD_DUAL: u1,
        reserved18: u3 = 0,
        /// The bit is used to set MISO line polarity, 1: high 0, low
        SPI_MEM_Q_POL: u1,
        /// The bit is used to set MOSI line polarity, 1: high 0, low
        SPI_MEM_D_POL: u1,
        /// In the read operations read-data phase apply 4 signals. 1: enable 0: disable.
        SPI_MEM_FREAD_QUAD: u1,
        /// Write protect signal output when SPI is idle. 1: output high, 0: output low.
        SPI_MEM_WP: u1,
        reserved23: u1 = 0,
        /// In the read operations address phase and read-data phase apply 2 signals. 1: enable 0: disable.
        SPI_MEM_FREAD_DIO: u1,
        /// In the read operations address phase and read-data phase apply 4 signals. 1: enable 0: disable.
        SPI_MEM_FREAD_QIO: u1,
        reserved30: u5 = 0,
        /// When accesses to flash, 1: the IE signals of pads connected to SPI_DQS are always 1. 0: Others.
        SPI_MEM_DQS_IE_ALWAYS_ON: u1,
        /// When accesses to flash, 1: the IE signals of pads connected to SPI_IO[7:0] are always 1. 0: Others.
        SPI_MEM_DATA_IE_ALWAYS_ON: u1,
    }),
    /// SPI0 control1 register.
    /// offset: 0x0c
    SPI_MEM_CTRL1: mmio.Mmio(packed struct(u32) {
        /// SPI clock mode bits. 0: SPI clock is off when CS inactive 1: SPI clock is delayed one cycle after CS inactive 2: SPI clock is delayed two cycles after CS inactive 3: SPI clock is alwasy on.
        SPI_MEM_CLK_MODE: u2,
        reserved21: u19 = 0,
        /// 1: MSPI supports ARSIZE 0~3. When ARSIZE =0~2, MSPI read address is 4*n and reply the real AXI read data back. 0: When ARSIZE 0~1, MSPI reply SLV_ERR.
        SPI_AR_SIZE0_1_SUPPORT_EN: u1,
        /// 1: MSPI supports AWSIZE 0~3. 0: When AWSIZE 0~1, MSPI reply SLV_ERR.
        SPI_AW_SIZE0_1_SUPPORT_EN: u1,
        /// 1: Reply AXI read data to AXI bus when one AXI read beat data is available. 0: Reply AXI read data to AXI bus when all the read data is available.
        SPI_AXI_RDATA_BACK_FAST: u1,
        /// 1: RRESP is SLV_ERR when there is a ECC error in AXI read data. 0: RRESP is OKAY when there is a ECC error in AXI read data. The ECC error information is recorded in SPI_MEM_ECC_ERR_ADDR_REG.
        SPI_MEM_RRESP_ECC_ERR_EN: u1,
        /// Set this bit to enable AXI Read Splice-transfer.
        SPI_MEM_AR_SPLICE_EN: u1,
        /// Set this bit to enable AXI Write Splice-transfer.
        SPI_MEM_AW_SPLICE_EN: u1,
        /// When SPI_MEM_DUAL_RAM_EN is 0 and SPI_MEM_RAM0_EN is 1, only EXT_RAM0 will be accessed. When SPI_MEM_DUAL_RAM_EN is 0 and SPI_MEM_RAM0_EN is 0, only EXT_RAM1 will be accessed. When SPI_MEM_DUAL_RAM_EN is 1, EXT_RAM0 and EXT_RAM1 will be accessed at the same time.
        SPI_MEM_RAM0_EN: u1,
        /// Set this bit to enable DUAL-RAM mode, EXT_RAM0 and EXT_RAM1 will be accessed at the same time.
        SPI_MEM_DUAL_RAM_EN: u1,
        /// Set this bit to write data faster, do not wait write data has been stored in tx_bus_fifo_l2. It will wait 4*T_clk_ctrl to insure the write data has been stored in tx_bus_fifo_l2.
        SPI_MEM_FAST_WRITE_EN: u1,
        /// The synchronous reset signal for SPI0 RX AFIFO and all the AES_MSPI SYNC FIFO to receive signals from AXI. Set this bit to reset these FIFO.
        SPI_MEM_RXFIFO_RST: u1,
        /// The synchronous reset signal for SPI0 TX AFIFO and all the AES_MSPI SYNC FIFO to send signals to AXI. Set this bit to reset these FIFO.
        SPI_MEM_TXFIFO_RST: u1,
    }),
    /// SPI0 control2 register.
    /// offset: 0x10
    SPI_MEM_CTRL2: mmio.Mmio(packed struct(u32) {
        /// (cycles-1) of prepare phase by SPI Bus clock, this bits are combined with SPI_MEM_CS_SETUP bit.
        SPI_MEM_CS_SETUP_TIME: u5,
        /// SPI CS signal is delayed to inactive by SPI bus clock, this bits are combined with SPI_MEM_CS_HOLD bit.
        SPI_MEM_CS_HOLD_TIME: u5,
        /// SPI_MEM_CS_HOLD_TIME + SPI_MEM_ECC_CS_HOLD_TIME is the SPI0 CS hold cycle in ECC mode when accessed flash.
        SPI_MEM_ECC_CS_HOLD_TIME: u3,
        /// 1: SPI0 and SPI1 skip page corner when accesses flash. 0: Not skip page corner when accesses flash.
        SPI_MEM_ECC_SKIP_PAGE_CORNER: u1,
        /// Set this bit to enable SPI0 and SPI1 ECC 16 bytes data with 2 ECC bytes mode when accesses flash.
        SPI_MEM_ECC_16TO18_BYTE_EN: u1,
        reserved24: u9 = 0,
        /// Set this bit to enable SPI0 split one AXI read flash transfer into two SPI transfers when one transfer will cross flash or EXT_RAM page corner, valid no matter whether there is an ECC region or not.
        SPI_MEM_SPLIT_TRANS_EN: u1,
        /// These bits are used to set the minimum CS high time tSHSL between SPI burst transfer when accesses to flash. tSHSL is (SPI_MEM_CS_HOLD_DELAY[5:0] + 1) MSPI core clock cycles.
        SPI_MEM_CS_HOLD_DELAY: u6,
        /// The spi0_mst_st and spi0_slv_st will be reset.
        SPI_MEM_SYNC_RESET: u1,
    }),
    /// SPI clock division control register.
    /// offset: 0x14
    SPI_MEM_CLOCK: mmio.Mmio(packed struct(u32) {
        /// In the master mode it must be equal to spi_mem_clkcnt_N.
        SPI_MEM_CLKCNT_L: u8,
        /// In the master mode it must be floor((spi_mem_clkcnt_N+1)/2-1).
        SPI_MEM_CLKCNT_H: u8,
        /// In the master mode it is the divider of spi_mem_clk. So spi_mem_clk frequency is system/(spi_mem_clkcnt_N+1)
        SPI_MEM_CLKCNT_N: u8,
        reserved31: u7 = 0,
        /// 1: 1-division mode, the frequency of SPI bus clock equals to that of MSPI module clock.
        SPI_MEM_CLK_EQU_SYSCLK: u1,
    }),
    /// SPI0 user register.
    /// offset: 0x18
    SPI_MEM_USER: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// spi cs keep low when spi is in done phase. 1: enable 0: disable.
        SPI_MEM_CS_HOLD: u1,
        /// spi cs is enable when spi is in prepare phase. 1: enable 0: disable.
        SPI_MEM_CS_SETUP: u1,
        reserved9: u1 = 0,
        /// The bit combined with SPI_MEM_CK_IDLE_EDGE bit to control SPI clock mode 0~3.
        SPI_MEM_CK_OUT_EDGE: u1,
        reserved26: u16 = 0,
        /// spi clock is disable in dummy phase when the bit is enable.
        SPI_MEM_USR_DUMMY_IDLE: u1,
        reserved29: u2 = 0,
        /// This bit enable the dummy phase of an operation.
        SPI_MEM_USR_DUMMY: u1,
        padding: u2 = 0,
    }),
    /// SPI0 user1 register.
    /// offset: 0x1c
    SPI_MEM_USER1: mmio.Mmio(packed struct(u32) {
        /// The length in spi_mem_clk cycles of dummy phase. The register value shall be (cycle_num-1).
        SPI_MEM_USR_DUMMY_CYCLELEN: u6,
        /// SPI0 USR_CMD read or write data byte length -1
        SPI_MEM_USR_DBYTELEN: u3,
        reserved26: u17 = 0,
        /// The length in bits of address phase. The register value shall be (bit_num-1).
        SPI_MEM_USR_ADDR_BITLEN: u6,
    }),
    /// SPI0 user2 register.
    /// offset: 0x20
    SPI_MEM_USER2: mmio.Mmio(packed struct(u32) {
        /// The value of command.
        SPI_MEM_USR_COMMAND_VALUE: u16,
        reserved28: u12 = 0,
        /// The length in bits of command phase. The register value shall be (bit_num-1)
        SPI_MEM_USR_COMMAND_BITLEN: u4,
    }),
    /// offset: 0x24
    reserved36: [8]u8,
    /// SPI0 read control register.
    /// offset: 0x2c
    SPI_MEM_RD_STATUS: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// Mode bits in the flash fast read mode it is combined with spi_mem_fastrd_mode bit.
        SPI_MEM_WB_MODE: u8,
        padding: u8 = 0,
    }),
    /// offset: 0x30
    reserved48: [4]u8,
    /// SPI0 misc register
    /// offset: 0x34
    SPI_MEM_MISC: mmio.Mmio(packed struct(u32) {
        reserved7: u7 = 0,
        /// For SPI0, flash is connected to SUBPINs.
        SPI_MEM_FSUB_PIN: u1,
        /// For SPI0, sram is connected to SUBPINs.
        SPI_MEM_SSUB_PIN: u1,
        /// 1: SPI_CLK line is high when idle 0: spi clk line is low when idle
        SPI_MEM_CK_IDLE_EDGE: u1,
        /// SPI_CS line keep low when the bit is set.
        SPI_MEM_CS_KEEP_ACTIVE: u1,
        padding: u21 = 0,
    }),
    /// offset: 0x38
    reserved56: [4]u8,
    /// SPI0 bit mode control register.
    /// offset: 0x3c
    SPI_MEM_CACHE_FCTRL: mmio.Mmio(packed struct(u32) {
        /// For SPI0, AXI master access enable, 1: enable, 0:disable.
        SPI_MEM_AXI_REQ_EN: u1,
        /// For SPI0, cache read flash with 4 bytes address, 1: enable, 0:disable.
        SPI_MEM_CACHE_USR_ADDR_4BYTE: u1,
        /// For SPI0, cache read flash for user define command, 1: enable, 0:disable.
        SPI_MEM_CACHE_FLASH_USR_CMD: u1,
        /// For SPI0 flash, din phase apply 2 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_dio.
        SPI_MEM_FDIN_DUAL: u1,
        /// For SPI0 flash, dout phase apply 2 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_dio.
        SPI_MEM_FDOUT_DUAL: u1,
        /// For SPI0 flash, address phase apply 2 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_dio.
        SPI_MEM_FADDR_DUAL: u1,
        /// For SPI0 flash, din phase apply 4 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_qio.
        SPI_MEM_FDIN_QUAD: u1,
        /// For SPI0 flash, dout phase apply 4 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_qio.
        SPI_MEM_FDOUT_QUAD: u1,
        /// For SPI0 flash, address phase apply 4 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_qio.
        SPI_MEM_FADDR_QUAD: u1,
        reserved30: u21 = 0,
        /// Set this bit to check AXI read/write the same address region.
        SPI_SAME_AW_AR_ADDR_CHK_EN: u1,
        /// Set this bit to close AXI read/write transfer to MSPI, which means that only SLV_ERR will be replied to BRESP/RRESP.
        SPI_CLOSE_AXI_INF_EN: u1,
    }),
    /// SPI0 external RAM control register
    /// offset: 0x40
    SPI_MEM_CACHE_SCTRL: mmio.Mmio(packed struct(u32) {
        /// For SPI0, In the external RAM mode, cache read flash with 4 bytes command, 1: enable, 0:disable.
        SPI_MEM_CACHE_USR_SADDR_4BYTE: u1,
        /// For SPI0, In the external RAM mode, spi dual I/O mode enable, 1: enable, 0:disable
        SPI_MEM_USR_SRAM_DIO: u1,
        /// For SPI0, In the external RAM mode, spi quad I/O mode enable, 1: enable, 0:disable
        SPI_MEM_USR_SRAM_QIO: u1,
        /// For SPI0, In the external RAM mode, it is the enable bit of dummy phase for write operations.
        SPI_MEM_USR_WR_SRAM_DUMMY: u1,
        /// For SPI0, In the external RAM mode, it is the enable bit of dummy phase for read operations.
        SPI_MEM_USR_RD_SRAM_DUMMY: u1,
        /// For SPI0, In the external RAM mode cache read external RAM for user define command.
        SPI_MEM_CACHE_SRAM_USR_RCMD: u1,
        /// For SPI0, In the external RAM mode, it is the length in bits of read dummy phase. The register value shall be (bit_num-1).
        SPI_MEM_SRAM_RDUMMY_CYCLELEN: u6,
        reserved14: u2 = 0,
        /// For SPI0, In the external RAM mode, it is the length in bits of address phase. The register value shall be (bit_num-1).
        SPI_MEM_SRAM_ADDR_BITLEN: u6,
        /// For SPI0, In the external RAM mode cache write sram for user define command
        SPI_MEM_CACHE_SRAM_USR_WCMD: u1,
        /// reserved
        SPI_MEM_SRAM_OCT: u1,
        /// For SPI0, In the external RAM mode, it is the length in bits of write dummy phase. The register value shall be (bit_num-1).
        SPI_MEM_SRAM_WDUMMY_CYCLELEN: u6,
        padding: u4 = 0,
    }),
    /// SPI0 external RAM mode control register
    /// offset: 0x44
    SPI_MEM_SRAM_CMD: mmio.Mmio(packed struct(u32) {
        /// SPI clock mode bits. 0: SPI clock is off when CS inactive 1: SPI clock is delayed one cycle after CS inactive 2: SPI clock is delayed two cycles after CS inactive 3: SPI clock is always on.
        SPI_MEM_SCLK_MODE: u2,
        /// Mode bits in the external RAM fast read mode it is combined with spi_mem_fastrd_mode bit.
        SPI_MEM_SWB_MODE: u8,
        /// For SPI0 external RAM , din phase apply 2 signals. 1: enable 0: disable. The bit is the same with spi_mem_usr_sram_dio.
        SPI_MEM_SDIN_DUAL: u1,
        /// For SPI0 external RAM , dout phase apply 2 signals. 1: enable 0: disable. The bit is the same with spi_mem_usr_sram_dio.
        SPI_MEM_SDOUT_DUAL: u1,
        /// For SPI0 external RAM , address phase apply 2 signals. 1: enable 0: disable. The bit is the same with spi_mem_usr_sram_dio.
        SPI_MEM_SADDR_DUAL: u1,
        reserved14: u1 = 0,
        /// For SPI0 external RAM , din phase apply 4 signals. 1: enable 0: disable. The bit is the same with spi_mem_usr_sram_qio.
        SPI_MEM_SDIN_QUAD: u1,
        /// For SPI0 external RAM , dout phase apply 4 signals. 1: enable 0: disable. The bit is the same with spi_mem_usr_sram_qio.
        SPI_MEM_SDOUT_QUAD: u1,
        /// For SPI0 external RAM , address phase apply 4 signals. 1: enable 0: disable. The bit is the same with spi_mem_usr_sram_qio.
        SPI_MEM_SADDR_QUAD: u1,
        /// For SPI0 external RAM , cmd phase apply 4 signals. 1: enable 0: disable. The bit is the same with spi_mem_usr_sram_qio.
        SPI_MEM_SCMD_QUAD: u1,
        /// For SPI0 external RAM , din phase apply 8 signals. 1: enable 0: disable.
        SPI_MEM_SDIN_OCT: u1,
        /// For SPI0 external RAM , dout phase apply 8 signals. 1: enable 0: disable.
        SPI_MEM_SDOUT_OCT: u1,
        /// For SPI0 external RAM , address phase apply 4 signals. 1: enable 0: disable.
        SPI_MEM_SADDR_OCT: u1,
        /// For SPI0 external RAM , cmd phase apply 8 signals. 1: enable 0: disable.
        SPI_MEM_SCMD_OCT: u1,
        /// In the dummy phase of a MSPI read data transfer when accesses to external RAM, the signal level of SPI bus is output by the MSPI controller.
        SPI_MEM_SDUMMY_RIN: u1,
        /// In the dummy phase of a MSPI write data transfer when accesses to external RAM, the signal level of SPI bus is output by the MSPI controller.
        SPI_MEM_SDUMMY_WOUT: u1,
        /// In the dummy phase of an MSPI write data transfer when accesses to external RAM, the level of SPI_DQS is output by the MSPI controller.
        SPI_SMEM_WDUMMY_DQS_ALWAYS_OUT: u1,
        /// In the dummy phase of an MSPI write data transfer when accesses to external RAM, the level of SPI_IO[7:0] is output by the MSPI controller.
        SPI_SMEM_WDUMMY_ALWAYS_OUT: u1,
        /// For SPI0 external RAM , din phase apply 16 signals. 1: enable 0: disable.
        SPI_MEM_SDIN_HEX: u1,
        /// For SPI0 external RAM , dout phase apply 16 signals. 1: enable 0: disable.
        SPI_MEM_SDOUT_HEX: u1,
        reserved30: u2 = 0,
        /// When accesses to external RAM, 1: the IE signals of pads connected to SPI_DQS are always 1. 0: Others.
        SPI_SMEM_DQS_IE_ALWAYS_ON: u1,
        /// When accesses to external RAM, 1: the IE signals of pads connected to SPI_IO[7:0] are always 1. 0: Others.
        SPI_SMEM_DATA_IE_ALWAYS_ON: u1,
    }),
    /// SPI0 external RAM DDR read command control register
    /// offset: 0x48
    SPI_MEM_SRAM_DRD_CMD: mmio.Mmio(packed struct(u32) {
        /// For SPI0,When cache mode is enable it is the read command value of command phase for sram.
        SPI_MEM_CACHE_SRAM_USR_RD_CMD_VALUE: u16,
        reserved28: u12 = 0,
        /// For SPI0,When cache mode is enable it is the length in bits of command phase for sram. The register value shall be (bit_num-1).
        SPI_MEM_CACHE_SRAM_USR_RD_CMD_BITLEN: u4,
    }),
    /// SPI0 external RAM DDR write command control register
    /// offset: 0x4c
    SPI_MEM_SRAM_DWR_CMD: mmio.Mmio(packed struct(u32) {
        /// For SPI0,When cache mode is enable it is the write command value of command phase for sram.
        SPI_MEM_CACHE_SRAM_USR_WR_CMD_VALUE: u16,
        reserved28: u12 = 0,
        /// For SPI0,When cache mode is enable it is the in bits of command phase for sram. The register value shall be (bit_num-1).
        SPI_MEM_CACHE_SRAM_USR_WR_CMD_BITLEN: u4,
    }),
    /// SPI0 external RAM clock control register
    /// offset: 0x50
    SPI_MEM_SRAM_CLK: mmio.Mmio(packed struct(u32) {
        /// For SPI0 external RAM interface, it must be equal to spi_mem_clkcnt_N.
        SPI_MEM_SCLKCNT_L: u8,
        /// For SPI0 external RAM interface, it must be floor((spi_mem_clkcnt_N+1)/2-1).
        SPI_MEM_SCLKCNT_H: u8,
        /// For SPI0 external RAM interface, it is the divider of spi_mem_clk. So spi_mem_clk frequency is system/(spi_mem_clkcnt_N+1)
        SPI_MEM_SCLKCNT_N: u8,
        reserved31: u7 = 0,
        /// For SPI0 external RAM interface, 1: spi_mem_clk is eqaul to system 0: spi_mem_clk is divided from system clock.
        SPI_MEM_SCLK_EQU_SYSCLK: u1,
    }),
    /// SPI0 FSM status register
    /// offset: 0x54
    SPI_MEM_FSM: mmio.Mmio(packed struct(u32) {
        reserved7: u7 = 0,
        /// The lock delay time of SPI0/1 arbiter by spi0_slv_st, after PER is sent by SPI1.
        SPI_MEM_LOCK_DELAY_TIME: u5,
        padding: u20 = 0,
    }),
    /// offset: 0x58
    reserved88: [104]u8,
    /// SPI0 interrupt enable register
    /// offset: 0xc0
    SPI_MEM_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// The enable bit for SPI_MEM_SLV_ST_END_INT interrupt.
        SPI_MEM_SLV_ST_END_INT_ENA: u1,
        /// The enable bit for SPI_MEM_MST_ST_END_INT interrupt.
        SPI_MEM_MST_ST_END_INT_ENA: u1,
        /// The enable bit for SPI_MEM_ECC_ERR_INT interrupt.
        SPI_MEM_ECC_ERR_INT_ENA: u1,
        /// The enable bit for SPI_MEM_PMS_REJECT_INT interrupt.
        SPI_MEM_PMS_REJECT_INT_ENA: u1,
        /// The enable bit for SPI_MEM_AXI_RADDR_ERR_INT interrupt.
        SPI_MEM_AXI_RADDR_ERR_INT_ENA: u1,
        /// The enable bit for SPI_MEM_AXI_WR_FALSH_ERR_INT interrupt.
        SPI_MEM_AXI_WR_FLASH_ERR_INT_ENA: u1,
        /// The enable bit for SPI_MEM_AXI_WADDR_ERR_INT interrupt.
        SPI_MEM_AXI_WADDR_ERR_INT__ENA: u1,
        reserved28: u18 = 0,
        /// The enable bit for SPI_MEM_DQS0_AFIFO_OVF_INT interrupt.
        SPI_MEM_DQS0_AFIFO_OVF_INT_ENA: u1,
        /// The enable bit for SPI_MEM_DQS1_AFIFO_OVF_INT interrupt.
        SPI_MEM_DQS1_AFIFO_OVF_INT_ENA: u1,
        /// The enable bit for SPI_MEM_BUS_FIFO1_UDF_INT interrupt.
        SPI_MEM_BUS_FIFO1_UDF_INT_ENA: u1,
        /// The enable bit for SPI_MEM_BUS_FIFO0_UDF_INT interrupt.
        SPI_MEM_BUS_FIFO0_UDF_INT_ENA: u1,
    }),
    /// SPI0 interrupt clear register
    /// offset: 0xc4
    SPI_MEM_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// The clear bit for SPI_MEM_SLV_ST_END_INT interrupt.
        SPI_MEM_SLV_ST_END_INT_CLR: u1,
        /// The clear bit for SPI_MEM_MST_ST_END_INT interrupt.
        SPI_MEM_MST_ST_END_INT_CLR: u1,
        /// The clear bit for SPI_MEM_ECC_ERR_INT interrupt.
        SPI_MEM_ECC_ERR_INT_CLR: u1,
        /// The clear bit for SPI_MEM_PMS_REJECT_INT interrupt.
        SPI_MEM_PMS_REJECT_INT_CLR: u1,
        /// The clear bit for SPI_MEM_AXI_RADDR_ERR_INT interrupt.
        SPI_MEM_AXI_RADDR_ERR_INT_CLR: u1,
        /// The clear bit for SPI_MEM_AXI_WR_FALSH_ERR_INT interrupt.
        SPI_MEM_AXI_WR_FLASH_ERR_INT_CLR: u1,
        /// The clear bit for SPI_MEM_AXI_WADDR_ERR_INT interrupt.
        SPI_MEM_AXI_WADDR_ERR_INT_CLR: u1,
        reserved28: u18 = 0,
        /// The clear bit for SPI_MEM_DQS0_AFIFO_OVF_INT interrupt.
        SPI_MEM_DQS0_AFIFO_OVF_INT_CLR: u1,
        /// The clear bit for SPI_MEM_DQS1_AFIFO_OVF_INT interrupt.
        SPI_MEM_DQS1_AFIFO_OVF_INT_CLR: u1,
        /// The clear bit for SPI_MEM_BUS_FIFO1_UDF_INT interrupt.
        SPI_MEM_BUS_FIFO1_UDF_INT_CLR: u1,
        /// The clear bit for SPI_MEM_BUS_FIFO0_UDF_INT interrupt.
        SPI_MEM_BUS_FIFO0_UDF_INT_CLR: u1,
    }),
    /// SPI0 interrupt raw register
    /// offset: 0xc8
    SPI_MEM_INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// The raw bit for SPI_MEM_SLV_ST_END_INT interrupt. 1: Triggered when spi0_slv_st is changed from non idle state to idle state. It means that SPI_CS raises high. 0: Others
        SPI_MEM_SLV_ST_END_INT_RAW: u1,
        /// The raw bit for SPI_MEM_MST_ST_END_INT interrupt. 1: Triggered when spi0_mst_st is changed from non idle state to idle state. 0: Others.
        SPI_MEM_MST_ST_END_INT_RAW: u1,
        /// The raw bit for SPI_MEM_ECC_ERR_INT interrupt. When SPI_FMEM_ECC_ERR_INT_EN is set and SPI_SMEM_ECC_ERR_INT_EN is cleared, this bit is triggered when the error times of SPI0/1 ECC read flash are equal or bigger than SPI_MEM_ECC_ERR_INT_NUM. When SPI_FMEM_ECC_ERR_INT_EN is cleared and SPI_SMEM_ECC_ERR_INT_EN is set, this bit is triggered when the error times of SPI0/1 ECC read external RAM are equal or bigger than SPI_MEM_ECC_ERR_INT_NUM. When SPI_FMEM_ECC_ERR_INT_EN and SPI_SMEM_ECC_ERR_INT_EN are set, this bit is triggered when the total error times of SPI0/1 ECC read external RAM and flash are equal or bigger than SPI_MEM_ECC_ERR_INT_NUM. When SPI_FMEM_ECC_ERR_INT_EN and SPI_SMEM_ECC_ERR_INT_EN are cleared, this bit will not be triggered.
        SPI_MEM_ECC_ERR_INT_RAW: u1,
        /// The raw bit for SPI_MEM_PMS_REJECT_INT interrupt. 1: Triggered when SPI1 access is rejected. 0: Others.
        SPI_MEM_PMS_REJECT_INT_RAW: u1,
        /// The raw bit for SPI_MEM_AXI_RADDR_ERR_INT interrupt. 1: Triggered when AXI read address is invalid by compared to MMU configuration. 0: Others.
        SPI_MEM_AXI_RADDR_ERR_INT_RAW: u1,
        /// The raw bit for SPI_MEM_AXI_WR_FALSH_ERR_INT interrupt. 1: Triggered when AXI write flash request is received. 0: Others.
        SPI_MEM_AXI_WR_FLASH_ERR_INT_RAW: u1,
        /// The raw bit for SPI_MEM_AXI_WADDR_ERR_INT interrupt. 1: Triggered when AXI write address is invalid by compared to MMU configuration. 0: Others.
        SPI_MEM_AXI_WADDR_ERR_INT_RAW: u1,
        reserved28: u18 = 0,
        /// The raw bit for SPI_MEM_DQS0_AFIFO_OVF_INT interrupt. 1: Triggered when the AFIFO connected to SPI_DQS1 is overflow.
        SPI_MEM_DQS0_AFIFO_OVF_INT_RAW: u1,
        /// The raw bit for SPI_MEM_DQS1_AFIFO_OVF_INT interrupt. 1: Triggered when the AFIFO connected to SPI_DQS is overflow.
        SPI_MEM_DQS1_AFIFO_OVF_INT_RAW: u1,
        /// The raw bit for SPI_MEM_BUS_FIFO1_UDF_INT interrupt. 1: Triggered when BUS1 FIFO is underflow.
        SPI_MEM_BUS_FIFO1_UDF_INT_RAW: u1,
        /// The raw bit for SPI_MEM_BUS_FIFO0_UDF_INT interrupt. 1: Triggered when BUS0 FIFO is underflow.
        SPI_MEM_BUS_FIFO0_UDF_INT_RAW: u1,
    }),
    /// SPI0 interrupt status register
    /// offset: 0xcc
    SPI_MEM_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// The status bit for SPI_MEM_SLV_ST_END_INT interrupt.
        SPI_MEM_SLV_ST_END_INT_ST: u1,
        /// The status bit for SPI_MEM_MST_ST_END_INT interrupt.
        SPI_MEM_MST_ST_END_INT_ST: u1,
        /// The status bit for SPI_MEM_ECC_ERR_INT interrupt.
        SPI_MEM_ECC_ERR_INT_ST: u1,
        /// The status bit for SPI_MEM_PMS_REJECT_INT interrupt.
        SPI_MEM_PMS_REJECT_INT_ST: u1,
        /// The enable bit for SPI_MEM_AXI_RADDR_ERR_INT interrupt.
        SPI_MEM_AXI_RADDR_ERR_INT_ST: u1,
        /// The enable bit for SPI_MEM_AXI_WR_FALSH_ERR_INT interrupt.
        SPI_MEM_AXI_WR_FLASH_ERR_INT_ST: u1,
        /// The enable bit for SPI_MEM_AXI_WADDR_ERR_INT interrupt.
        SPI_MEM_AXI_WADDR_ERR_INT_ST: u1,
        reserved28: u18 = 0,
        /// The status bit for SPI_MEM_DQS0_AFIFO_OVF_INT interrupt.
        SPI_MEM_DQS0_AFIFO_OVF_INT_ST: u1,
        /// The status bit for SPI_MEM_DQS1_AFIFO_OVF_INT interrupt.
        SPI_MEM_DQS1_AFIFO_OVF_INT_ST: u1,
        /// The status bit for SPI_MEM_BUS_FIFO1_UDF_INT interrupt.
        SPI_MEM_BUS_FIFO1_UDF_INT_ST: u1,
        /// The status bit for SPI_MEM_BUS_FIFO0_UDF_INT interrupt.
        SPI_MEM_BUS_FIFO0_UDF_INT_ST: u1,
    }),
    /// offset: 0xd0
    reserved208: [4]u8,
    /// SPI0 flash DDR mode control register
    /// offset: 0xd4
    SPI_MEM_DDR: mmio.Mmio(packed struct(u32) {
        /// 1: in DDR mode, 0 in SDR mode
        SPI_FMEM_DDR_EN: u1,
        /// Set the bit to enable variable dummy cycle in spi DDR mode.
        SPI_FMEM_VAR_DUMMY: u1,
        /// Set the bit to reorder rx data of the word in spi DDR mode.
        SPI_FMEM_DDR_RDAT_SWP: u1,
        /// Set the bit to reorder tx data of the word in spi DDR mode.
        SPI_FMEM_DDR_WDAT_SWP: u1,
        /// the bit is used to disable dual edge in command phase when DDR mode.
        SPI_FMEM_DDR_CMD_DIS: u1,
        /// It is the minimum output data length in the panda device.
        SPI_FMEM_OUTMINBYTELEN: u7,
        /// Set this bit to mask the first or the last byte in SPI0 ECC DDR write mode, when accesses to flash.
        SPI_FMEM_TX_DDR_MSK_EN: u1,
        /// Set this bit to mask the first or the last byte in SPI0 ECC DDR read mode, when accesses to flash.
        SPI_FMEM_RX_DDR_MSK_EN: u1,
        /// The delay number of data strobe which from memory based on SPI clock.
        SPI_FMEM_USR_DDR_DQS_THD: u7,
        /// 1: Do not need the input of SPI_DQS signal, SPI0 starts to receive data when spi0_slv_st is in SPI_MEM_DIN state. It is used when there is no SPI_DQS signal or SPI_DQS signal is not stable. 0: SPI0 starts to store data at the positive and negative edge of SPI_DQS.
        SPI_FMEM_DDR_DQS_LOOP: u1,
        reserved24: u2 = 0,
        /// Set this bit to enable the differential SPI_CLK#.
        SPI_FMEM_CLK_DIFF_EN: u1,
        reserved26: u1 = 0,
        /// Set this bit to enable the input of SPI_DQS signal in SPI phases of CMD and ADDR.
        SPI_FMEM_DQS_CA_IN: u1,
        /// Set this bit to enable the vary dummy function in SPI HyperBus mode, when SPI0 accesses flash or SPI1 accesses flash or sram.
        SPI_FMEM_HYPERBUS_DUMMY_2X: u1,
        /// Set this bit to invert SPI_DIFF when accesses to flash. .
        SPI_FMEM_CLK_DIFF_INV: u1,
        /// Set this bit to enable octa_ram address out when accesses to flash, which means ADDR_OUT[31:0] = {spi_usr_addr_value[25:4], 6'd0, spi_usr_addr_value[3:1], 1'b0}.
        SPI_FMEM_OCTA_RAM_ADDR: u1,
        /// Set this bit to enable HyperRAM address out when accesses to flash, which means ADDR_OUT[31:0] = {spi_usr_addr_value[19:4], 13'd0, spi_usr_addr_value[3:1]}.
        SPI_FMEM_HYPERBUS_CA: u1,
        padding: u1 = 0,
    }),
    /// SPI0 external RAM DDR mode control register
    /// offset: 0xd8
    SPI_SMEM_DDR: mmio.Mmio(packed struct(u32) {
        /// 1: in DDR mode, 0 in SDR mode
        EN: u1,
        /// Set the bit to enable variable dummy cycle in spi DDR mode.
        SPI_SMEM_VAR_DUMMY: u1,
        /// Set the bit to reorder rx data of the word in spi DDR mode.
        RDAT_SWP: u1,
        /// Set the bit to reorder tx data of the word in spi DDR mode.
        WDAT_SWP: u1,
        /// the bit is used to disable dual edge in command phase when DDR mode.
        CMD_DIS: u1,
        /// It is the minimum output data length in the DDR psram.
        SPI_SMEM_OUTMINBYTELEN: u7,
        /// Set this bit to mask the first or the last byte in SPI0 ECC DDR write mode, when accesses to external RAM.
        SPI_SMEM_TX_DDR_MSK_EN: u1,
        /// Set this bit to mask the first or the last byte in SPI0 ECC DDR read mode, when accesses to external RAM.
        SPI_SMEM_RX_DDR_MSK_EN: u1,
        /// The delay number of data strobe which from memory based on SPI clock.
        SPI_SMEM_USR_DDR_DQS_THD: u7,
        /// 1: Do not need the input of SPI_DQS signal, SPI0 starts to receive data when spi0_slv_st is in SPI_MEM_DIN state. It is used when there is no SPI_DQS signal or SPI_DQS signal is not stable. 0: SPI0 starts to store data at the positive and negative edge of SPI_DQS.
        DQS_LOOP: u1,
        reserved24: u2 = 0,
        /// Set this bit to enable the differential SPI_CLK#.
        SPI_SMEM_CLK_DIFF_EN: u1,
        reserved26: u1 = 0,
        /// Set this bit to enable the input of SPI_DQS signal in SPI phases of CMD and ADDR.
        SPI_SMEM_DQS_CA_IN: u1,
        /// Set this bit to enable the vary dummy function in SPI HyperBus mode, when SPI0 accesses flash or SPI1 accesses flash or sram.
        SPI_SMEM_HYPERBUS_DUMMY_2X: u1,
        /// Set this bit to invert SPI_DIFF when accesses to external RAM. .
        SPI_SMEM_CLK_DIFF_INV: u1,
        /// Set this bit to enable octa_ram address out when accesses to external RAM, which means ADDR_OUT[31:0] = {spi_usr_addr_value[25:4], 6'd0, spi_usr_addr_value[3:1], 1'b0}.
        SPI_SMEM_OCTA_RAM_ADDR: u1,
        /// Set this bit to enable HyperRAM address out when accesses to external RAM, which means ADDR_OUT[31:0] = {spi_usr_addr_value[19:4], 13'd0, spi_usr_addr_value[3:1]}.
        SPI_SMEM_HYPERBUS_CA: u1,
        padding: u1 = 0,
    }),
    /// offset: 0xdc
    reserved220: [36]u8,
    /// MSPI flash PMS section %s attribute register
    /// offset: 0x100
    SPI_FMEM_PMS0_ATTR: mmio.Mmio(packed struct(u32) {
        /// 1: SPI1 flash PMS section %s read accessible. 0: Not allowed.
        SPI_FMEM_PMS_RD_ATTR: u1,
        /// 1: SPI1 flash PMS section %s write accessible. 0: Not allowed.
        SPI_FMEM_PMS_WR_ATTR: u1,
        /// SPI1 flash PMS section %s ECC mode, 1: enable ECC mode. 0: Disable it. The flash PMS section %s is configured by registers SPI_FMEM_PMS%s_ADDR_REG and SPI_FMEM_PMS%s_SIZE_REG.
        SPI_FMEM_PMS_ECC: u1,
        padding: u29 = 0,
    }),
    /// MSPI flash PMS section %s attribute register
    /// offset: 0x104
    SPI_FMEM_PMS1_ATTR: mmio.Mmio(packed struct(u32) {
        /// 1: SPI1 flash PMS section %s read accessible. 0: Not allowed.
        SPI_FMEM_PMS_RD_ATTR: u1,
        /// 1: SPI1 flash PMS section %s write accessible. 0: Not allowed.
        SPI_FMEM_PMS_WR_ATTR: u1,
        /// SPI1 flash PMS section %s ECC mode, 1: enable ECC mode. 0: Disable it. The flash PMS section %s is configured by registers SPI_FMEM_PMS%s_ADDR_REG and SPI_FMEM_PMS%s_SIZE_REG.
        SPI_FMEM_PMS_ECC: u1,
        padding: u29 = 0,
    }),
    /// MSPI flash PMS section %s attribute register
    /// offset: 0x108
    SPI_FMEM_PMS2_ATTR: mmio.Mmio(packed struct(u32) {
        /// 1: SPI1 flash PMS section %s read accessible. 0: Not allowed.
        SPI_FMEM_PMS_RD_ATTR: u1,
        /// 1: SPI1 flash PMS section %s write accessible. 0: Not allowed.
        SPI_FMEM_PMS_WR_ATTR: u1,
        /// SPI1 flash PMS section %s ECC mode, 1: enable ECC mode. 0: Disable it. The flash PMS section %s is configured by registers SPI_FMEM_PMS%s_ADDR_REG and SPI_FMEM_PMS%s_SIZE_REG.
        SPI_FMEM_PMS_ECC: u1,
        padding: u29 = 0,
    }),
    /// MSPI flash PMS section %s attribute register
    /// offset: 0x10c
    SPI_FMEM_PMS3_ATTR: mmio.Mmio(packed struct(u32) {
        /// 1: SPI1 flash PMS section %s read accessible. 0: Not allowed.
        SPI_FMEM_PMS_RD_ATTR: u1,
        /// 1: SPI1 flash PMS section %s write accessible. 0: Not allowed.
        SPI_FMEM_PMS_WR_ATTR: u1,
        /// SPI1 flash PMS section %s ECC mode, 1: enable ECC mode. 0: Disable it. The flash PMS section %s is configured by registers SPI_FMEM_PMS%s_ADDR_REG and SPI_FMEM_PMS%s_SIZE_REG.
        SPI_FMEM_PMS_ECC: u1,
        padding: u29 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x110
    SPI_FMEM_PMS0_ADDR: mmio.Mmio(packed struct(u32) {
        /// SPI1 flash PMS section %s start address value
        S: u27,
        padding: u5 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x114
    SPI_FMEM_PMS1_ADDR: mmio.Mmio(packed struct(u32) {
        /// SPI1 flash PMS section %s start address value
        S: u27,
        padding: u5 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x118
    SPI_FMEM_PMS2_ADDR: mmio.Mmio(packed struct(u32) {
        /// SPI1 flash PMS section %s start address value
        S: u27,
        padding: u5 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x11c
    SPI_FMEM_PMS3_ADDR: mmio.Mmio(packed struct(u32) {
        /// SPI1 flash PMS section %s start address value
        S: u27,
        padding: u5 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x120
    SPI_FMEM_PMS0_SIZE: mmio.Mmio(packed struct(u32) {
        /// SPI1 flash PMS section %s address region is (SPI_FMEM_PMS%s_ADDR_S, SPI_FMEM_PMS%s_ADDR_S + SPI_FMEM_PMS%s_SIZE)
        SPI_FMEM_PMS_SIZE: u15,
        padding: u17 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x124
    SPI_FMEM_PMS1_SIZE: mmio.Mmio(packed struct(u32) {
        /// SPI1 flash PMS section %s address region is (SPI_FMEM_PMS%s_ADDR_S, SPI_FMEM_PMS%s_ADDR_S + SPI_FMEM_PMS%s_SIZE)
        SPI_FMEM_PMS_SIZE: u15,
        padding: u17 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x128
    SPI_FMEM_PMS2_SIZE: mmio.Mmio(packed struct(u32) {
        /// SPI1 flash PMS section %s address region is (SPI_FMEM_PMS%s_ADDR_S, SPI_FMEM_PMS%s_ADDR_S + SPI_FMEM_PMS%s_SIZE)
        SPI_FMEM_PMS_SIZE: u15,
        padding: u17 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x12c
    SPI_FMEM_PMS3_SIZE: mmio.Mmio(packed struct(u32) {
        /// SPI1 flash PMS section %s address region is (SPI_FMEM_PMS%s_ADDR_S, SPI_FMEM_PMS%s_ADDR_S + SPI_FMEM_PMS%s_SIZE)
        SPI_FMEM_PMS_SIZE: u15,
        padding: u17 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x130
    SPI_SMEM_PMS0_ATTR: mmio.Mmio(packed struct(u32) {
        /// 1: SPI1 external RAM PMS section %s read accessible. 0: Not allowed.
        SPI_SMEM_PMS_RD_ATTR: u1,
        /// 1: SPI1 external RAM PMS section %s write accessible. 0: Not allowed.
        SPI_SMEM_PMS_WR_ATTR: u1,
        /// SPI1 external RAM PMS section %s ECC mode, 1: enable ECC mode. 0: Disable it. The external RAM PMS section %s is configured by registers SPI_SMEM_PMS%s_ADDR_REG and SPI_SMEM_PMS%s_SIZE_REG.
        SPI_SMEM_PMS_ECC: u1,
        padding: u29 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x134
    SPI_SMEM_PMS1_ATTR: mmio.Mmio(packed struct(u32) {
        /// 1: SPI1 external RAM PMS section %s read accessible. 0: Not allowed.
        SPI_SMEM_PMS_RD_ATTR: u1,
        /// 1: SPI1 external RAM PMS section %s write accessible. 0: Not allowed.
        SPI_SMEM_PMS_WR_ATTR: u1,
        /// SPI1 external RAM PMS section %s ECC mode, 1: enable ECC mode. 0: Disable it. The external RAM PMS section %s is configured by registers SPI_SMEM_PMS%s_ADDR_REG and SPI_SMEM_PMS%s_SIZE_REG.
        SPI_SMEM_PMS_ECC: u1,
        padding: u29 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x138
    SPI_SMEM_PMS2_ATTR: mmio.Mmio(packed struct(u32) {
        /// 1: SPI1 external RAM PMS section %s read accessible. 0: Not allowed.
        SPI_SMEM_PMS_RD_ATTR: u1,
        /// 1: SPI1 external RAM PMS section %s write accessible. 0: Not allowed.
        SPI_SMEM_PMS_WR_ATTR: u1,
        /// SPI1 external RAM PMS section %s ECC mode, 1: enable ECC mode. 0: Disable it. The external RAM PMS section %s is configured by registers SPI_SMEM_PMS%s_ADDR_REG and SPI_SMEM_PMS%s_SIZE_REG.
        SPI_SMEM_PMS_ECC: u1,
        padding: u29 = 0,
    }),
    /// SPI1 flash PMS section %s start address register
    /// offset: 0x13c
    SPI_SMEM_PMS3_ATTR: mmio.Mmio(packed struct(u32) {
        /// 1: SPI1 external RAM PMS section %s read accessible. 0: Not allowed.
        SPI_SMEM_PMS_RD_ATTR: u1,
        /// 1: SPI1 external RAM PMS section %s write accessible. 0: Not allowed.
        SPI_SMEM_PMS_WR_ATTR: u1,
        /// SPI1 external RAM PMS section %s ECC mode, 1: enable ECC mode. 0: Disable it. The external RAM PMS section %s is configured by registers SPI_SMEM_PMS%s_ADDR_REG and SPI_SMEM_PMS%s_SIZE_REG.
        SPI_SMEM_PMS_ECC: u1,
        padding: u29 = 0,
    }),
    /// SPI1 external RAM PMS section %s start address register
    /// offset: 0x140
    SPI_SMEM_PMS0_ADDR: mmio.Mmio(packed struct(u32) {
        /// SPI1 external RAM PMS section %s start address value
        S: u27,
        padding: u5 = 0,
    }),
    /// SPI1 external RAM PMS section %s start address register
    /// offset: 0x144
    SPI_SMEM_PMS1_ADDR: mmio.Mmio(packed struct(u32) {
        /// SPI1 external RAM PMS section %s start address value
        S: u27,
        padding: u5 = 0,
    }),
    /// SPI1 external RAM PMS section %s start address register
    /// offset: 0x148
    SPI_SMEM_PMS2_ADDR: mmio.Mmio(packed struct(u32) {
        /// SPI1 external RAM PMS section %s start address value
        S: u27,
        padding: u5 = 0,
    }),
    /// SPI1 external RAM PMS section %s start address register
    /// offset: 0x14c
    SPI_SMEM_PMS3_ADDR: mmio.Mmio(packed struct(u32) {
        /// SPI1 external RAM PMS section %s start address value
        S: u27,
        padding: u5 = 0,
    }),
    /// SPI1 external RAM PMS section %s start address register
    /// offset: 0x150
    SPI_SMEM_PMS0_SIZE: mmio.Mmio(packed struct(u32) {
        /// SPI1 external RAM PMS section %s address region is (SPI_SMEM_PMS%s_ADDR_S, SPI_SMEM_PMS%s_ADDR_S + SPI_SMEM_PMS%s_SIZE)
        SPI_SMEM_PMS_SIZE: u15,
        padding: u17 = 0,
    }),
    /// SPI1 external RAM PMS section %s start address register
    /// offset: 0x154
    SPI_SMEM_PMS1_SIZE: mmio.Mmio(packed struct(u32) {
        /// SPI1 external RAM PMS section %s address region is (SPI_SMEM_PMS%s_ADDR_S, SPI_SMEM_PMS%s_ADDR_S + SPI_SMEM_PMS%s_SIZE)
        SPI_SMEM_PMS_SIZE: u15,
        padding: u17 = 0,
    }),
    /// SPI1 external RAM PMS section %s start address register
    /// offset: 0x158
    SPI_SMEM_PMS2_SIZE: mmio.Mmio(packed struct(u32) {
        /// SPI1 external RAM PMS section %s address region is (SPI_SMEM_PMS%s_ADDR_S, SPI_SMEM_PMS%s_ADDR_S + SPI_SMEM_PMS%s_SIZE)
        SPI_SMEM_PMS_SIZE: u15,
        padding: u17 = 0,
    }),
    /// SPI1 external RAM PMS section %s start address register
    /// offset: 0x15c
    SPI_SMEM_PMS3_SIZE: mmio.Mmio(packed struct(u32) {
        /// SPI1 external RAM PMS section %s address region is (SPI_SMEM_PMS%s_ADDR_S, SPI_SMEM_PMS%s_ADDR_S + SPI_SMEM_PMS%s_SIZE)
        SPI_SMEM_PMS_SIZE: u15,
        padding: u17 = 0,
    }),
    /// offset: 0x160
    reserved352: [4]u8,
    /// SPI1 access reject register
    /// offset: 0x164
    SPI_MEM_PMS_REJECT: mmio.Mmio(packed struct(u32) {
        /// This bits show the first SPI1 access error address. It is cleared by when SPI_MEM_PMS_REJECT_INT_CLR bit is set.
        SPI_MEM_REJECT_ADDR: u27,
        /// Set this bit to enable SPI0/1 transfer permission control function.
        SPI_MEM_PM_EN: u1,
        /// 1: SPI1 write access error. 0: No write access error. It is cleared by when SPI_MEM_PMS_REJECT_INT_CLR bit is set.
        SPI_MEM_PMS_LD: u1,
        /// 1: SPI1 read access error. 0: No read access error. It is cleared by when SPI_MEM_PMS_REJECT_INT_CLR bit is set.
        SPI_MEM_PMS_ST: u1,
        /// 1: SPI1 access is rejected because of address miss. 0: No address miss error. It is cleared by when SPI_MEM_PMS_REJECT_INT_CLR bit is set.
        SPI_MEM_PMS_MULTI_HIT: u1,
        /// 1: SPI1 access is rejected because of address multi-hit. 0: No address multi-hit error. It is cleared by when SPI_MEM_PMS_REJECT_INT_CLR bit is set.
        SPI_MEM_PMS_IVD: u1,
    }),
    /// MSPI ECC control register
    /// offset: 0x168
    SPI_MEM_ECC_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// This bits show the error times of MSPI ECC read. It is cleared by when SPI_MEM_ECC_ERR_INT_CLR bit is set.
        SPI_MEM_ECC_ERR_CNT: u6,
        /// Set the error times of MSPI ECC read to generate MSPI SPI_MEM_ECC_ERR_INT interrupt.
        SPI_FMEM_ECC_ERR_INT_NUM: u6,
        /// Set this bit to calculate the error times of MSPI ECC read when accesses to flash.
        SPI_FMEM_ECC_ERR_INT_EN: u1,
        /// Set the page size of the flash accessed by MSPI. 0: 256 bytes. 1: 512 bytes. 2: 1024 bytes. 3: 2048 bytes.
        SPI_FMEM_PAGE_SIZE: u2,
        /// Set this bit to enable MSPI ECC address conversion, no matter MSPI accesses to the ECC region or non-ECC region of flash. If there is no ECC region in flash, this bit should be 0. Otherwise, this bit should be 1.
        SPI_FMEM_ECC_ADDR_EN: u1,
        /// Set this bit to enable ECC address convert in SPI0/1 USR_CMD transfer.
        SPI_MEM_USR_ECC_ADDR_EN: u1,
        reserved24: u2 = 0,
        /// 1: The error information in SPI_MEM_ECC_ERR_BITS and SPI_MEM_ECC_ERR_ADDR is updated when there is an ECC error. 0: SPI_MEM_ECC_ERR_BITS and SPI_MEM_ECC_ERR_ADDR record the first ECC error information.
        SPI_MEM_ECC_CONTINUE_RECORD_ERR_EN: u1,
        /// Records the first ECC error bit number in the 16 bytes(From 0~127, corresponding to byte 0 bit 0 to byte 15 bit 7)
        SPI_MEM_ECC_ERR_BITS: u7,
    }),
    /// MSPI ECC error address register
    /// offset: 0x16c
    SPI_MEM_ECC_ERR_ADDR: mmio.Mmio(packed struct(u32) {
        /// This bits show the first MSPI ECC error address. It is cleared by when SPI_MEM_ECC_ERR_INT_CLR bit is set.
        SPI_MEM_ECC_ERR_ADDR: u27,
        padding: u5 = 0,
    }),
    /// SPI0 AXI request error address.
    /// offset: 0x170
    SPI_MEM_AXI_ERR_ADDR: mmio.Mmio(packed struct(u32) {
        /// This bits show the first AXI write/read invalid error or AXI write flash error address. It is cleared by when SPI_MEM_AXI_WADDR_ERR_INT_CLR, SPI_MEM_AXI_WR_FLASH_ERR_IN_CLR or SPI_MEM_AXI_RADDR_ERR_IN_CLR bit is set.
        SPI_MEM_AXI_ERR_ADDR: u27,
        padding: u5 = 0,
    }),
    /// MSPI ECC control register
    /// offset: 0x174
    SPI_SMEM_ECC_CTRL: mmio.Mmio(packed struct(u32) {
        reserved17: u17 = 0,
        /// Set this bit to calculate the error times of MSPI ECC read when accesses to external RAM.
        SPI_SMEM_ECC_ERR_INT_EN: u1,
        /// Set the page size of the external RAM accessed by MSPI. 0: 256 bytes. 1: 512 bytes. 2: 1024 bytes. 3: 2048 bytes.
        SPI_SMEM_PAGE_SIZE: u2,
        /// Set this bit to enable MSPI ECC address conversion, no matter MSPI accesses to the ECC region or non-ECC region of external RAM. If there is no ECC region in external RAM, this bit should be 0. Otherwise, this bit should be 1.
        SPI_SMEM_ECC_ADDR_EN: u1,
        padding: u11 = 0,
    }),
    /// SPI0 AXI address control register
    /// offset: 0x178
    SPI_SMEM_AXI_ADDR_CTRL: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// The empty status of all AFIFO and SYNC_FIFO in MSPI module. 1: All AXI transfers and SPI0 transfers are done. 0: Others.
        SPI_MEM_ALL_FIFO_EMPTY: u1,
        /// 1: RDATA_AFIFO is empty. 0: At least one AXI read transfer is pending.
        SPI_RDATA_AFIFO_REMPTY: u1,
        /// 1: AXI_RADDR_CTL_AFIFO is empty. 0: At least one AXI read transfer is pending.
        SPI_RADDR_AFIFO_REMPTY: u1,
        /// 1: WDATA_AFIFO is empty. 0: At least one AXI write transfer is pending.
        SPI_WDATA_AFIFO_REMPTY: u1,
        /// 1: WBLEN_AFIFO is empty. 0: At least one AXI write transfer is pending.
        SPI_WBLEN_AFIFO_REMPTY: u1,
        /// This bit is set when WADDR_AFIFO, WBLEN_AFIFO, WDATA_AFIFO, AXI_RADDR_CTL_AFIFO and RDATA_AFIFO are empty and spi0_mst_st is IDLE.
        SPI_ALL_AXI_TRANS_AFIFO_EMPTY: u1,
    }),
    /// SPI0 AXI error response enable register
    /// offset: 0x17c
    SPI_MEM_AXI_ERR_RESP_EN: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable AXI response function for mmu valid err in axi write trans.
        SPI_MEM_AW_RESP_EN_MMU_VLD: u1,
        /// Set this bit to enable AXI response function for mmu gid err in axi write trans.
        SPI_MEM_AW_RESP_EN_MMU_GID: u1,
        /// Set this bit to enable AXI response function for axi size err in axi write trans.
        SPI_MEM_AW_RESP_EN_AXI_SIZE: u1,
        /// Set this bit to enable AXI response function for axi flash err in axi write trans.
        SPI_MEM_AW_RESP_EN_AXI_FLASH: u1,
        /// Set this bit to enable AXI response function for mmu ecc err in axi write trans.
        SPI_MEM_AW_RESP_EN_MMU_ECC: u1,
        /// Set this bit to enable AXI response function for mmu sens in err axi write trans.
        SPI_MEM_AW_RESP_EN_MMU_SENS: u1,
        /// Set this bit to enable AXI response function for axi wstrb err in axi write trans.
        SPI_MEM_AW_RESP_EN_AXI_WSTRB: u1,
        /// Set this bit to enable AXI response function for mmu valid err in axi read trans.
        SPI_MEM_AR_RESP_EN_MMU_VLD: u1,
        /// Set this bit to enable AXI response function for mmu gid err in axi read trans.
        SPI_MEM_AR_RESP_EN_MMU_GID: u1,
        /// Set this bit to enable AXI response function for mmu ecc err in axi read trans.
        SPI_MEM_AR_RESP_EN_MMU_ECC: u1,
        /// Set this bit to enable AXI response function for mmu sensitive err in axi read trans.
        SPI_MEM_AR_RESP_EN_MMU_SENS: u1,
        /// Set this bit to enable AXI response function for axi size err in axi read trans.
        SPI_MEM_AR_RESP_EN_AXI_SIZE: u1,
        padding: u20 = 0,
    }),
    /// SPI0 flash timing calibration register
    /// offset: 0x180
    SPI_MEM_TIMING_CALI: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable timing adjust clock for all reading operations.
        SPI_MEM_TIMING_CLK_ENA: u1,
        /// The bit is used to enable timing auto-calibration for all reading operations.
        SPI_MEM_TIMING_CALI: u1,
        /// add extra dummy spi clock cycle length for spi clock calibration.
        SPI_MEM_EXTRA_DUMMY_CYCLELEN: u3,
        /// Set this bit to enable DLL for timing calibration in DDR mode when accessed to flash.
        SPI_MEM_DLL_TIMING_CALI: u1,
        /// Set this bit to update delay mode, delay num and extra dummy in MSPI.
        UPDATE: u1,
        padding: u25 = 0,
    }),
    /// MSPI flash input timing delay mode control register
    /// offset: 0x184
    SPI_MEM_DIN_MODE: mmio.Mmio(packed struct(u32) {
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_MEM_DIN0_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_MEM_DIN1_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_MEM_DIN2_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_MEM_DIN3_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk
        SPI_MEM_DIN4_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk
        SPI_MEM_DIN5_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk
        SPI_MEM_DIN6_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk
        SPI_MEM_DIN7_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the spi_clk
        SPI_MEM_DINS_MODE: u3,
        padding: u5 = 0,
    }),
    /// MSPI flash input timing delay number control register
    /// offset: 0x188
    SPI_MEM_DIN_NUM: mmio.Mmio(packed struct(u32) {
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_MEM_DIN0_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_MEM_DIN1_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_MEM_DIN2_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_MEM_DIN3_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_MEM_DIN4_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_MEM_DIN5_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_MEM_DIN6_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_MEM_DIN7_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_MEM_DINS_NUM: u2,
        padding: u14 = 0,
    }),
    /// MSPI flash output timing adjustment control register
    /// offset: 0x18c
    SPI_MEM_DOUT_MODE: mmio.Mmio(packed struct(u32) {
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_MEM_DOUT0_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_MEM_DOUT1_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_MEM_DOUT2_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_MEM_DOUT3_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the spi_clk
        SPI_MEM_DOUT4_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the spi_clk
        SPI_MEM_DOUT5_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the spi_clk
        SPI_MEM_DOUT6_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the spi_clk
        SPI_MEM_DOUT7_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the spi_clk
        SPI_MEM_DOUTS_MODE: u1,
        padding: u23 = 0,
    }),
    /// MSPI external RAM timing calibration register
    /// offset: 0x190
    SPI_SMEM_TIMING_CALI: mmio.Mmio(packed struct(u32) {
        /// For sram, the bit is used to enable timing adjust clock for all reading operations.
        SPI_SMEM_TIMING_CLK_ENA: u1,
        /// For sram, the bit is used to enable timing auto-calibration for all reading operations.
        SPI_SMEM_TIMING_CALI: u1,
        /// For sram, add extra dummy spi clock cycle length for spi clock calibration.
        SPI_SMEM_EXTRA_DUMMY_CYCLELEN: u3,
        /// Set this bit to enable DLL for timing calibration in DDR mode when accessed to EXT_RAM.
        SPI_SMEM_DLL_TIMING_CALI: u1,
        padding: u26 = 0,
    }),
    /// MSPI external RAM input timing delay mode control register
    /// offset: 0x194
    SPI_SMEM_DIN_MODE: mmio.Mmio(packed struct(u32) {
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN0_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN1_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN2_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN3_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN4_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN5_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN6_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN7_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DINS_MODE: u3,
        padding: u5 = 0,
    }),
    /// MSPI external RAM input timing delay number control register
    /// offset: 0x198
    SPI_SMEM_DIN_NUM: mmio.Mmio(packed struct(u32) {
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN0_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN1_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN2_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN3_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN4_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN5_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN6_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN7_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DINS_NUM: u2,
        padding: u14 = 0,
    }),
    /// MSPI external RAM output timing adjustment control register
    /// offset: 0x19c
    SPI_SMEM_DOUT_MODE: mmio.Mmio(packed struct(u32) {
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT0_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT1_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT2_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT3_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT4_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT5_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT6_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT7_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUTS_MODE: u1,
        padding: u23 = 0,
    }),
    /// MSPI external RAM ECC and SPI CS timing control register
    /// offset: 0x1a0
    SPI_SMEM_AC: mmio.Mmio(packed struct(u32) {
        /// For SPI0 and SPI1, spi cs is enable when spi is in prepare phase. 1: enable 0: disable.
        SPI_SMEM_CS_SETUP: u1,
        /// For SPI0 and SPI1, spi cs keep low when spi is in done phase. 1: enable 0: disable.
        SPI_SMEM_CS_HOLD: u1,
        /// For spi0, (cycles-1) of prepare phase by spi clock this bits are combined with spi_mem_cs_setup bit.
        SPI_SMEM_CS_SETUP_TIME: u5,
        /// For SPI0 and SPI1, spi cs signal is delayed to inactive by spi clock this bits are combined with spi_mem_cs_hold bit.
        SPI_SMEM_CS_HOLD_TIME: u5,
        /// SPI_SMEM_CS_HOLD_TIME + SPI_SMEM_ECC_CS_HOLD_TIME is the SPI0 and SPI1 CS hold cycles in ECC mode when accessed external RAM.
        SPI_SMEM_ECC_CS_HOLD_TIME: u3,
        /// 1: SPI0 skips page corner when accesses external RAM. 0: Not skip page corner when accesses external RAM.
        SPI_SMEM_ECC_SKIP_PAGE_CORNER: u1,
        /// Set this bit to enable SPI0 and SPI1 ECC 16 bytes data with 2 ECC bytes mode when accesses external RAM.
        SPI_SMEM_ECC_16TO18_BYTE_EN: u1,
        reserved25: u8 = 0,
        /// These bits are used to set the minimum CS high time tSHSL between SPI burst transfer when accesses to external RAM. tSHSL is (SPI_SMEM_CS_HOLD_DELAY[5:0] + 1) MSPI core clock cycles.
        SPI_SMEM_CS_HOLD_DELAY: u6,
        /// Set this bit to enable SPI0 split one AXI accesses EXT_RAM transfer into two SPI transfers when one transfer will cross flash/EXT_RAM page corner, valid no matter whether there is an ECC region or not.
        SPI_SMEM_SPLIT_TRANS_EN: u1,
    }),
    /// MSPI 16x external RAM input timing delay mode control register
    /// offset: 0x1a4
    SPI_SMEM_DIN_HEX_MODE: mmio.Mmio(packed struct(u32) {
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN08_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN09_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN10_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN11_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN12_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN13_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN14_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DIN15_MODE: u3,
        /// the input signals are delayed by system clock cycles, 0: input without delayed, 1: input with the posedge of clk_apb,2 input with the negedge of clk_apb, 3: input with the posedge of clk_160, 4 input with the negedge of clk_160, 5: input with the spi_clk high edge, 6: input with the spi_clk low edge
        SPI_SMEM_DINS_HEX_MODE: u3,
        padding: u5 = 0,
    }),
    /// MSPI 16x external RAM input timing delay number control register
    /// offset: 0x1a8
    SPI_SMEM_DIN_HEX_NUM: mmio.Mmio(packed struct(u32) {
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN08_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN09_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN10_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN11_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN12_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN13_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN14_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DIN15_NUM: u2,
        /// the input signals are delayed by system clock cycles, 0: delayed by 1 cycle, 1: delayed by 2 cycles,...
        SPI_SMEM_DINS_HEX_NUM: u2,
        padding: u14 = 0,
    }),
    /// MSPI 16x external RAM output timing adjustment control register
    /// offset: 0x1ac
    SPI_SMEM_DOUT_HEX_MODE: mmio.Mmio(packed struct(u32) {
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT08_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT09_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT10_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT11_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT12_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT13_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT14_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUT15_MODE: u1,
        /// the output signals are delayed by system clock cycles, 0: output without delayed, 1: output with the posedge of clk_apb,2 output with the negedge of clk_apb, 3: output with the posedge of clk_160,4 output with the negedge of clk_160,5: output with the spi_clk high edge ,6: output with the spi_clk low edge
        SPI_SMEM_DOUTS_HEX_MODE: u1,
        padding: u23 = 0,
    }),
    /// offset: 0x1b0
    reserved432: [80]u8,
    /// SPI0 clock gate register
    /// offset: 0x200
    SPI_MEM_CLOCK_GATE: mmio.Mmio(packed struct(u32) {
        /// Register clock gate enable signal. 1: Enable. 0: Disable.
        SPI_CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x204
    reserved516: [252]u8,
    /// The base address of the memory that stores plaintext in Manual Encryption
    /// offset: 0x300
    SPI_MEM_XTS_PLAIN_BASE: mmio.Mmio(packed struct(u32) {
        /// This field is only used to generate include file in c case. This field is useless. Please do not use this field.
        SPI_XTS_PLAIN: u32,
    }),
    /// offset: 0x304
    reserved772: [60]u8,
    /// Manual Encryption Line-Size register
    /// offset: 0x340
    SPI_MEM_XTS_LINESIZE: mmio.Mmio(packed struct(u32) {
        /// This bits stores the line-size parameter which will be used in manual encryption calculation. It decides how many bytes will be encrypted one time. 0: 16-bytes, 1: 32-bytes, 2: 64-bytes, 3:reserved.
        SPI_XTS_LINESIZE: u2,
        padding: u30 = 0,
    }),
    /// Manual Encryption destination register
    /// offset: 0x344
    SPI_MEM_XTS_DESTINATION: mmio.Mmio(packed struct(u32) {
        /// This bit stores the destination parameter which will be used in manual encryption calculation. 0: flash(default), 1: psram(reserved). Only default value can be used.
        SPI_XTS_DESTINATION: u1,
        padding: u31 = 0,
    }),
    /// Manual Encryption physical address register
    /// offset: 0x348
    SPI_MEM_XTS_PHYSICAL_ADDRESS: mmio.Mmio(packed struct(u32) {
        /// This bits stores the physical-address parameter which will be used in manual encryption calculation. This value should aligned with byte number decided by line-size parameter.
        SPI_XTS_PHYSICAL_ADDRESS: u26,
        padding: u6 = 0,
    }),
    /// Manual Encryption physical address register
    /// offset: 0x34c
    SPI_MEM_XTS_TRIGGER: mmio.Mmio(packed struct(u32) {
        /// Set this bit to trigger the process of manual encryption calculation. This action should only be asserted when manual encryption status is 0. After this action, manual encryption status becomes 1. After calculation is done, manual encryption status becomes 2.
        SPI_XTS_TRIGGER: u1,
        padding: u31 = 0,
    }),
    /// Manual Encryption physical address register
    /// offset: 0x350
    SPI_MEM_XTS_RELEASE: mmio.Mmio(packed struct(u32) {
        /// Set this bit to release encrypted result to mspi. This action should only be asserted when manual encryption status is 2. After this action, manual encryption status will become 3.
        SPI_XTS_RELEASE: u1,
        padding: u31 = 0,
    }),
    /// Manual Encryption physical address register
    /// offset: 0x354
    SPI_MEM_XTS_DESTROY: mmio.Mmio(packed struct(u32) {
        /// Set this bit to destroy encrypted result. This action should be asserted only when manual encryption status is 3. After this action, manual encryption status will become 0.
        SPI_XTS_DESTROY: u1,
        padding: u31 = 0,
    }),
    /// Manual Encryption physical address register
    /// offset: 0x358
    SPI_MEM_XTS_STATE: mmio.Mmio(packed struct(u32) {
        /// This bits stores the status of manual encryption. 0: idle, 1: busy of encryption calculation, 2: encryption calculation is done but the encrypted result is invisible to mspi, 3: the encrypted result is visible to mspi.
        SPI_XTS_STATE: u2,
        padding: u30 = 0,
    }),
    /// Manual Encryption version register
    /// offset: 0x35c
    SPI_MEM_XTS_DATE: mmio.Mmio(packed struct(u32) {
        /// This bits stores the last modified-time of manual encryption feature.
        SPI_XTS_DATE: u30,
        padding: u2 = 0,
    }),
    /// offset: 0x360
    reserved864: [28]u8,
    /// MSPI-MMU item content register
    /// offset: 0x37c
    SPI_MEM_MMU_ITEM_CONTENT: mmio.Mmio(packed struct(u32) {
        /// MSPI-MMU item content
        SPI_MMU_ITEM_CONTENT: u32,
    }),
    /// MSPI-MMU item index register
    /// offset: 0x380
    SPI_MEM_MMU_ITEM_INDEX: mmio.Mmio(packed struct(u32) {
        /// MSPI-MMU item index
        SPI_MMU_ITEM_INDEX: u32,
    }),
    /// MSPI MMU power control register
    /// offset: 0x384
    SPI_MEM_MMU_POWER_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable mmu-memory clock force on
        SPI_MMU_MEM_FORCE_ON: u1,
        /// Set this bit to force mmu-memory powerdown
        SPI_MMU_MEM_FORCE_PD: u1,
        /// Set this bit to force mmu-memory powerup, in this case, the power should also be controlled by rtc.
        SPI_MMU_MEM_FORCE_PU: u1,
        reserved16: u13 = 0,
        /// MMU PSRAM aux control register
        SPI_MEM_AUX_CTRL: u14,
        /// ECO register enable bit
        SPI_MEM_RDN_ENA: u1,
        /// MSPI module clock domain and AXI clock domain ECO register result register
        SPI_MEM_RDN_RESULT: u1,
    }),
    /// SPI memory cryption DPA register
    /// offset: 0x388
    SPI_MEM_DPA_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set the security level of spi mem cryption. 0: Shut off cryption DPA funtion. 1-7: The bigger the number is, the more secure the cryption is. (Note that the performance of cryption will decrease together with this number increasing)
        SPI_CRYPT_SECURITY_LEVEL: u3,
        /// Only available when SPI_CRYPT_SECURITY_LEVEL is not 0. 1: Enable DPA in the calculation that using key 1 or key 2. 0: Enable DPA only in the calculation that using key 1.
        SPI_CRYPT_CALC_D_DPA_EN: u1,
        /// 1: MSPI XTS DPA clock gate is controlled by SPI_CRYPT_CALC_D_DPA_EN and SPI_CRYPT_SECURITY_LEVEL. 0: Controlled by efuse bits.
        SPI_CRYPT_DPA_SELECT_REGISTER: u1,
        padding: u27 = 0,
    }),
    /// offset: 0x38c
    reserved908: [100]u8,
    /// MSPI ECO high register
    /// offset: 0x3f0
    SPI_MEM_REGISTERRND_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// ECO high register
        SPI_MEM_REGISTERRND_ECO_HIGH: u32,
    }),
    /// MSPI ECO low register
    /// offset: 0x3f4
    SPI_MEM_REGISTERRND_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// ECO low register
        SPI_MEM_REGISTERRND_ECO_LOW: u32,
    }),
    /// offset: 0x3f8
    reserved1016: [4]u8,
    /// SPI0 version control register
    /// offset: 0x3fc
    SPI_MEM_DATE: mmio.Mmio(packed struct(u32) {
        /// SPI0 register version.
        SPI_MEM_DATE: u28,
        padding: u4 = 0,
    }),
};
