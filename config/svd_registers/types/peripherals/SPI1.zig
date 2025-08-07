const mmio = @import("mmio");
const types = @import("../../types.zig");

/// SPI (Serial Peripheral Interface) Controller 1
pub const SPI1 = extern struct {
    /// SPI1 memory command register
    /// offset: 0x00
    SPI_MEM_CMD: mmio.Mmio(packed struct(u32) {
        /// The current status of SPI1 master FSM.
        SPI_MEM_MST_ST: u4,
        /// The current status of SPI1 slave FSM: mspi_st. 0: idle state, 1: preparation state, 2: send command state, 3: send address state, 4: wait state, 5: read data state, 6:write data state, 7: done state, 8: read data end state.
        SPI_MEM_SLV_ST: u4,
        reserved17: u9 = 0,
        /// In user mode, it is set to indicate that program/erase operation will be triggered. The bit is combined with spi_mem_usr bit. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_PE: u1,
        /// User define command enable. An operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_USR: u1,
        /// Drive Flash into high performance mode. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_HPM: u1,
        /// This bit combined with reg_resandres bit releases Flash from the power-down state or high performance mode and obtains the devices ID. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_RES: u1,
        /// Drive Flash into power down. An operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_DP: u1,
        /// Chip erase enable. Chip erase operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_CE: u1,
        /// Block erase enable(32KB) . Block erase operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_BE: u1,
        /// Sector erase enable(4KB). Sector erase operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_SE: u1,
        /// Page program enable(1 byte ~256 bytes data to be programmed). Page program operation will be triggered when the bit is set. The bit will be cleared once the operation done .1: enable 0: disable.
        SPI_MEM_FLASH_PP: u1,
        /// Write status register enable. Write status operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_WRSR: u1,
        /// Read status register-1. Read status operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_RDSR: u1,
        /// Read JEDEC ID . Read ID command will be sent when the bit is set. The bit will be cleared once the operation done. 1: enable 0: disable.
        SPI_MEM_FLASH_RDID: u1,
        /// Write flash disable. Write disable command will be sent when the bit is set. The bit will be cleared once the operation done. 1: enable 0: disable.
        SPI_MEM_FLASH_WRDI: u1,
        /// Write flash enable. Write enable command will be sent when the bit is set. The bit will be cleared once the operation done. 1: enable 0: disable.
        SPI_MEM_FLASH_WREN: u1,
        /// Read flash enable. Read flash operation will be triggered when the bit is set. The bit will be cleared once the operation done. 1: enable 0: disable.
        SPI_MEM_FLASH_READ: u1,
    }),
    /// SPI1 address register
    /// offset: 0x04
    SPI_MEM_ADDR: mmio.Mmio(packed struct(u32) {
        /// In user mode, it is the memory address. other then the bit0-bit23 is the memory address, the bit24-bit31 are the byte length of a transfer.
        SPI_MEM_USR_ADDR_VALUE: u32,
    }),
    /// SPI1 control register.
    /// offset: 0x08
    SPI_MEM_CTRL: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// In the dummy phase of a MSPI read data transfer when accesses to flash, the signal level of SPI bus is output by the MSPI controller.
        SPI_MEM_FDUMMY_RIN: u1,
        /// In the dummy phase of a MSPI write data transfer when accesses to flash, the signal level of SPI bus is output by the MSPI controller.
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
        /// For SPI1, initialize crc32 module before writing encrypted data to flash. Active low.
        SPI_MEM_FCS_CRC_EN: u1,
        /// For SPI1, enable crc32 when writing encrypted data to flash. 1: enable 0:disable
        SPI_MEM_TX_CRC_EN: u1,
        reserved13: u1 = 0,
        /// This bit enable the bits: spi_mem_fread_qio, spi_mem_fread_dio, spi_mem_fread_qout and spi_mem_fread_dout. 1: enable 0: disable.
        SPI_MEM_FASTRD_MODE: u1,
        /// In the read operations, read-data phase apply 2 signals. 1: enable 0: disable.
        SPI_MEM_FREAD_DUAL: u1,
        /// The Device ID is read out to SPI_MEM_RD_STATUS register, this bit combine with spi_mem_flash_res bit. 1: enable 0: disable.
        SPI_MEM_RESANDRES: u1,
        reserved18: u2 = 0,
        /// The bit is used to set MISO line polarity, 1: high 0, low
        SPI_MEM_Q_POL: u1,
        /// The bit is used to set MOSI line polarity, 1: high 0, low
        SPI_MEM_D_POL: u1,
        /// In the read operations read-data phase apply 4 signals. 1: enable 0: disable.
        SPI_MEM_FREAD_QUAD: u1,
        /// Write protect signal output when SPI is idle. 1: output high, 0: output low.
        SPI_MEM_WP: u1,
        /// two bytes data will be written to status register when it is set. 1: enable 0: disable.
        SPI_MEM_WRSR_2B: u1,
        /// In the read operations address phase and read-data phase apply 2 signals. 1: enable 0: disable.
        SPI_MEM_FREAD_DIO: u1,
        /// In the read operations address phase and read-data phase apply 4 signals. 1: enable 0: disable.
        SPI_MEM_FREAD_QIO: u1,
        padding: u7 = 0,
    }),
    /// SPI1 control1 register.
    /// offset: 0x0c
    SPI_MEM_CTRL1: mmio.Mmio(packed struct(u32) {
        /// SPI clock mode bits. 0: SPI clock is off when CS inactive 1: SPI clock is delayed one cycle after CS inactive 2: SPI clock is delayed two cycles after CS inactive 3: SPI clock is alwasy on.
        SPI_MEM_CLK_MODE: u2,
        /// After RES/DP/HPM command is sent, SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 512) SPI_CLK cycles.
        SPI_MEM_CS_HOLD_DLY_RES: u10,
        padding: u20 = 0,
    }),
    /// SPI1 control2 register.
    /// offset: 0x10
    SPI_MEM_CTRL2: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// The FSM will be reset.
        SPI_MEM_SYNC_RESET: u1,
    }),
    /// SPI1 clock division control register.
    /// offset: 0x14
    SPI_MEM_CLOCK: mmio.Mmio(packed struct(u32) {
        /// In the master mode it must be equal to spi_mem_clkcnt_N.
        SPI_MEM_CLKCNT_L: u8,
        /// In the master mode it must be floor((spi_mem_clkcnt_N+1)/2-1).
        SPI_MEM_CLKCNT_H: u8,
        /// In the master mode it is the divider of spi_mem_clk. So spi_mem_clk frequency is system/(spi_mem_clkcnt_N+1)
        SPI_MEM_CLKCNT_N: u8,
        reserved31: u7 = 0,
        /// reserved
        SPI_MEM_CLK_EQU_SYSCLK: u1,
    }),
    /// SPI1 user register.
    /// offset: 0x18
    SPI_MEM_USER: mmio.Mmio(packed struct(u32) {
        reserved9: u9 = 0,
        /// the bit combined with spi_mem_mosi_delay_mode bits to set mosi signal delay mode.
        SPI_MEM_CK_OUT_EDGE: u1,
        reserved12: u2 = 0,
        /// In the write operations read-data phase apply 2 signals
        SPI_MEM_FWRITE_DUAL: u1,
        /// In the write operations read-data phase apply 4 signals
        SPI_MEM_FWRITE_QUAD: u1,
        /// In the write operations address phase and read-data phase apply 2 signals.
        SPI_MEM_FWRITE_DIO: u1,
        /// In the write operations address phase and read-data phase apply 4 signals.
        SPI_MEM_FWRITE_QIO: u1,
        reserved24: u8 = 0,
        /// read-data phase only access to high-part of the buffer spi_mem_w8~spi_mem_w15. 1: enable 0: disable.
        SPI_MEM_USR_MISO_HIGHPART: u1,
        /// write-data phase only access to high-part of the buffer spi_mem_w8~spi_mem_w15. 1: enable 0: disable.
        SPI_MEM_USR_MOSI_HIGHPART: u1,
        /// SPI clock is disable in dummy phase when the bit is enable.
        SPI_MEM_USR_DUMMY_IDLE: u1,
        /// This bit enable the write-data phase of an operation.
        SPI_MEM_USR_MOSI: u1,
        /// This bit enable the read-data phase of an operation.
        SPI_MEM_USR_MISO: u1,
        /// This bit enable the dummy phase of an operation.
        SPI_MEM_USR_DUMMY: u1,
        /// This bit enable the address phase of an operation.
        SPI_MEM_USR_ADDR: u1,
        /// This bit enable the command phase of an operation.
        SPI_MEM_USR_COMMAND: u1,
    }),
    /// SPI1 user1 register.
    /// offset: 0x1c
    SPI_MEM_USER1: mmio.Mmio(packed struct(u32) {
        /// The length in spi_mem_clk cycles of dummy phase. The register value shall be (cycle_num-1).
        SPI_MEM_USR_DUMMY_CYCLELEN: u6,
        reserved26: u20 = 0,
        /// The length in bits of address phase. The register value shall be (bit_num-1).
        SPI_MEM_USR_ADDR_BITLEN: u6,
    }),
    /// SPI1 user2 register.
    /// offset: 0x20
    SPI_MEM_USER2: mmio.Mmio(packed struct(u32) {
        /// The value of command.
        SPI_MEM_USR_COMMAND_VALUE: u16,
        reserved28: u12 = 0,
        /// The length in bits of command phase. The register value shall be (bit_num-1)
        SPI_MEM_USR_COMMAND_BITLEN: u4,
    }),
    /// SPI1 send data bit length control register.
    /// offset: 0x24
    SPI_MEM_MOSI_DLEN: mmio.Mmio(packed struct(u32) {
        /// The length in bits of write-data. The register value shall be (bit_num-1).
        SPI_MEM_USR_MOSI_DBITLEN: u10,
        padding: u22 = 0,
    }),
    /// SPI1 receive data bit length control register.
    /// offset: 0x28
    SPI_MEM_MISO_DLEN: mmio.Mmio(packed struct(u32) {
        /// The length in bits of read-data. The register value shall be (bit_num-1).
        SPI_MEM_USR_MISO_DBITLEN: u10,
        padding: u22 = 0,
    }),
    /// SPI1 status register.
    /// offset: 0x2c
    SPI_MEM_RD_STATUS: mmio.Mmio(packed struct(u32) {
        /// The value is stored when set spi_mem_flash_rdsr bit and spi_mem_flash_res bit.
        SPI_MEM_STATUS: u16,
        /// Mode bits in the flash fast read mode it is combined with spi_mem_fastrd_mode bit.
        SPI_MEM_WB_MODE: u8,
        padding: u8 = 0,
    }),
    /// offset: 0x30
    reserved48: [4]u8,
    /// SPI1 misc register
    /// offset: 0x34
    SPI_MEM_MISC: mmio.Mmio(packed struct(u32) {
        /// SPI_CS0 pin enable, 1: disable SPI_CS0, 0: SPI_CS0 pin is active to select SPI device, such as flash, external RAM and so on.
        SPI_MEM_CS0_DIS: u1,
        /// SPI_CS1 pin enable, 1: disable SPI_CS1, 0: SPI_CS1 pin is active to select SPI device, such as flash, external RAM and so on.
        SPI_MEM_CS1_DIS: u1,
        reserved9: u7 = 0,
        /// 1: spi clk line is high when idle 0: spi clk line is low when idle
        SPI_MEM_CK_IDLE_EDGE: u1,
        /// spi cs line keep low when the bit is set.
        SPI_MEM_CS_KEEP_ACTIVE: u1,
        padding: u21 = 0,
    }),
    /// SPI1 TX CRC data register.
    /// offset: 0x38
    SPI_MEM_TX_CRC: mmio.Mmio(packed struct(u32) {
        /// For SPI1, the value of crc32.
        DATA: u32,
    }),
    /// SPI1 bit mode control register.
    /// offset: 0x3c
    SPI_MEM_CACHE_FCTRL: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// For SPI1, cache read flash with 4 bytes address, 1: enable, 0:disable.
        SPI_MEM_CACHE_USR_ADDR_4BYTE: u1,
        reserved3: u1 = 0,
        /// For SPI1, din phase apply 2 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_dio.
        SPI_MEM_FDIN_DUAL: u1,
        /// For SPI1, dout phase apply 2 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_dio.
        SPI_MEM_FDOUT_DUAL: u1,
        /// For SPI1, address phase apply 2 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_dio.
        SPI_MEM_FADDR_DUAL: u1,
        /// For SPI1, din phase apply 4 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_qio.
        SPI_MEM_FDIN_QUAD: u1,
        /// For SPI1, dout phase apply 4 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_qio.
        SPI_MEM_FDOUT_QUAD: u1,
        /// For SPI1, address phase apply 4 signals. 1: enable 0: disable. The bit is the same with spi_mem_fread_qio.
        SPI_MEM_FADDR_QUAD: u1,
        padding: u23 = 0,
    }),
    /// offset: 0x40
    reserved64: [24]u8,
    /// SPI1 memory data buffer0
    /// offset: 0x58
    SPI_MEM_W0: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF0: u32,
    }),
    /// SPI1 memory data buffer1
    /// offset: 0x5c
    SPI_MEM_W1: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF1: u32,
    }),
    /// SPI1 memory data buffer2
    /// offset: 0x60
    SPI_MEM_W2: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF2: u32,
    }),
    /// SPI1 memory data buffer3
    /// offset: 0x64
    SPI_MEM_W3: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF3: u32,
    }),
    /// SPI1 memory data buffer4
    /// offset: 0x68
    SPI_MEM_W4: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF4: u32,
    }),
    /// SPI1 memory data buffer5
    /// offset: 0x6c
    SPI_MEM_W5: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF5: u32,
    }),
    /// SPI1 memory data buffer6
    /// offset: 0x70
    SPI_MEM_W6: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF6: u32,
    }),
    /// SPI1 memory data buffer7
    /// offset: 0x74
    SPI_MEM_W7: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF7: u32,
    }),
    /// SPI1 memory data buffer8
    /// offset: 0x78
    SPI_MEM_W8: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF8: u32,
    }),
    /// SPI1 memory data buffer9
    /// offset: 0x7c
    SPI_MEM_W9: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF9: u32,
    }),
    /// SPI1 memory data buffer10
    /// offset: 0x80
    SPI_MEM_W10: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF10: u32,
    }),
    /// SPI1 memory data buffer11
    /// offset: 0x84
    SPI_MEM_W11: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF11: u32,
    }),
    /// SPI1 memory data buffer12
    /// offset: 0x88
    SPI_MEM_W12: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF12: u32,
    }),
    /// SPI1 memory data buffer13
    /// offset: 0x8c
    SPI_MEM_W13: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF13: u32,
    }),
    /// SPI1 memory data buffer14
    /// offset: 0x90
    SPI_MEM_W14: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF14: u32,
    }),
    /// SPI1 memory data buffer15
    /// offset: 0x94
    SPI_MEM_W15: mmio.Mmio(packed struct(u32) {
        /// data buffer
        SPI_MEM_BUF15: u32,
    }),
    /// SPI1 wait idle control register
    /// offset: 0x98
    SPI_MEM_FLASH_WAITI_CTRL: mmio.Mmio(packed struct(u32) {
        /// 1: The hardware will wait idle after SE/PP/WRSR automatically, and hardware auto Suspend/Resume can be enabled. 0: The functions of hardware wait idle and auto Suspend/Resume are not supported.
        SPI_MEM_WAITI_EN: u1,
        /// The dummy phase enable when wait flash idle (RDSR)
        SPI_MEM_WAITI_DUMMY: u1,
        /// 1: Output address 0 in RDSR or read SUS command transfer. 0: Do not send out address in RDSR or read SUS command transfer.
        SPI_MEM_WAITI_ADDR_EN: u1,
        /// When SPI_MEM_WAITI_ADDR_EN is set, the cycle length of sent out address is (SPI_MEM_WAITI_ADDR_CYCLELEN[1:0] + 1) SPI bus clock cycles. It is not active when SPI_MEM_WAITI_ADDR_EN is cleared.
        SPI_MEM_WAITI_ADDR_CYCLELEN: u2,
        reserved9: u4 = 0,
        /// 1:The wait idle command bit length is 16. 0: The wait idle command bit length is 8.
        SPI_MEM_WAITI_CMD_2B: u1,
        /// The dummy cycle length when wait flash idle(RDSR).
        SPI_MEM_WAITI_DUMMY_CYCLELEN: u6,
        /// The command value to wait flash idle(RDSR).
        SPI_MEM_WAITI_CMD: u16,
    }),
    /// SPI1 flash suspend control register
    /// offset: 0x9c
    SPI_MEM_FLASH_SUS_CTRL: mmio.Mmio(packed struct(u32) {
        /// program erase resume bit, program erase suspend operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_PER: u1,
        /// program erase suspend bit, program erase suspend operation will be triggered when the bit is set. The bit will be cleared once the operation done.1: enable 0: disable.
        SPI_MEM_FLASH_PES: u1,
        /// 1: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 4 or *128) SPI_CLK cycles after program erase resume command is sent. 0: SPI1 does not wait after program erase resume command is sent.
        SPI_MEM_FLASH_PER_WAIT_EN: u1,
        /// 1: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 4 or *128) SPI_CLK cycles after program erase suspend command is sent. 0: SPI1 does not wait after program erase suspend command is sent.
        SPI_MEM_FLASH_PES_WAIT_EN: u1,
        /// Set this bit to enable PES end triggers PER transfer option. If this bit is 0, application should send PER after PES is done.
        SPI_MEM_PES_PER_EN: u1,
        /// Set this bit to enable Auto-suspending function.
        SPI_MEM_FLASH_PES_EN: u1,
        /// The mask value when check SUS/SUS1/SUS2 status bit. If the read status value is status_in[15:0](only status_in[7:0] is valid when only one byte of data is read out, status_in[15:0] is valid when two bytes of data are read out), SUS/SUS1/SUS2 = status_in[15:0]^ SPI_MEM_PESR_END_MSK[15:0].
        SPI_MEM_PESR_END_MSK: u16,
        /// 1: Read two bytes when check flash SUS/SUS1/SUS2 status bit. 0: Read one byte when check flash SUS/SUS1/SUS2 status bit
        SPI_FMEM_RD_SUS_2B: u1,
        /// 1: Both WIP and SUS/SUS1/SUS2 bits should be checked to insure the resume status of flash. 0: Only need to check WIP is 0.
        SPI_MEM_PER_END_EN: u1,
        /// 1: Both WIP and SUS/SUS1/SUS2 bits should be checked to insure the suspend status of flash. 0: Only need to check WIP is 0.
        SPI_MEM_PES_END_EN: u1,
        /// When SPI1 checks SUS/SUS1/SUS2 bits fail for SPI_MEM_SUS_TIMEOUT_CNT[6:0] times, it will be treated as check pass.
        SPI_MEM_SUS_TIMEOUT_CNT: u7,
    }),
    /// SPI1 flash suspend command register
    /// offset: 0xa0
    SPI_MEM_FLASH_SUS_CMD: mmio.Mmio(packed struct(u32) {
        /// Program/Erase suspend command.
        SPI_MEM_FLASH_PES_COMMAND: u16,
        /// Flash SUS/SUS1/SUS2 status bit read command. The command should be sent when SUS/SUS1/SUS2 bit should be checked to insure the suspend or resume status of flash.
        SPI_MEM_WAIT_PESR_COMMAND: u16,
    }),
    /// SPI1 flash suspend status register
    /// offset: 0xa4
    SPI_MEM_SUS_STATUS: mmio.Mmio(packed struct(u32) {
        /// The status of flash suspend, only used in SPI1.
        SPI_MEM_FLASH_SUS: u1,
        /// 1: SPI1 sends out SPI_MEM_WAIT_PESR_COMMAND[15:0] to check SUS/SUS1/SUS2 bit. 0: SPI1 sends out SPI_MEM_WAIT_PESR_COMMAND[7:0] to check SUS/SUS1/SUS2 bit.
        SPI_MEM_WAIT_PESR_CMD_2B: u1,
        /// 1: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 128) SPI_CLK cycles after HPM command is sent. 0: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 4) SPI_CLK cycles after HPM command is sent.
        SPI_MEM_FLASH_HPM_DLY_128: u1,
        /// 1: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 128) SPI_CLK cycles after RES command is sent. 0: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 4) SPI_CLK cycles after RES command is sent.
        SPI_MEM_FLASH_RES_DLY_128: u1,
        /// 1: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 128) SPI_CLK cycles after DP command is sent. 0: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 4) SPI_CLK cycles after DP command is sent.
        SPI_MEM_FLASH_DP_DLY_128: u1,
        /// Valid when SPI_MEM_FLASH_PER_WAIT_EN is 1. 1: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 128) SPI_CLK cycles after PER command is sent. 0: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 4) SPI_CLK cycles after PER command is sent.
        SPI_MEM_FLASH_PER_DLY_128: u1,
        /// Valid when SPI_MEM_FLASH_PES_WAIT_EN is 1. 1: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 128) SPI_CLK cycles after PES command is sent. 0: SPI1 waits (SPI_MEM_CS_HOLD_DELAY_RES[9:0] * 4) SPI_CLK cycles after PES command is sent.
        SPI_MEM_FLASH_PES_DLY_128: u1,
        /// 1: Enable SPI0 lock SPI0/1 arbiter option. 0: Disable it.
        SPI_MEM_SPI0_LOCK_EN: u1,
        reserved15: u7 = 0,
        /// 1: The bit length of Program/Erase Suspend/Resume command is 16. 0: The bit length of Program/Erase Suspend/Resume command is 8.
        SPI_MEM_FLASH_PESR_CMD_2B: u1,
        /// Program/Erase resume command.
        SPI_MEM_FLASH_PER_COMMAND: u16,
    }),
    /// offset: 0xa8
    reserved168: [24]u8,
    /// SPI1 interrupt enable register
    /// offset: 0xc0
    SPI_MEM_INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The enable bit for SPI_MEM_PER_END_INT interrupt.
        SPI_MEM_PER_END_INT_ENA: u1,
        /// The enable bit for SPI_MEM_PES_END_INT interrupt.
        SPI_MEM_PES_END_INT_ENA: u1,
        /// The enable bit for SPI_MEM_WPE_END_INT interrupt.
        SPI_MEM_WPE_END_INT_ENA: u1,
        /// The enable bit for SPI_MEM_SLV_ST_END_INT interrupt.
        SPI_MEM_SLV_ST_END_INT_ENA: u1,
        /// The enable bit for SPI_MEM_MST_ST_END_INT interrupt.
        SPI_MEM_MST_ST_END_INT_ENA: u1,
        reserved10: u5 = 0,
        /// The enable bit for SPI_MEM_BROWN_OUT_INT interrupt.
        SPI_MEM_BROWN_OUT_INT_ENA: u1,
        padding: u21 = 0,
    }),
    /// SPI1 interrupt clear register
    /// offset: 0xc4
    SPI_MEM_INT_CLR: mmio.Mmio(packed struct(u32) {
        /// The clear bit for SPI_MEM_PER_END_INT interrupt.
        SPI_MEM_PER_END_INT_CLR: u1,
        /// The clear bit for SPI_MEM_PES_END_INT interrupt.
        SPI_MEM_PES_END_INT_CLR: u1,
        /// The clear bit for SPI_MEM_WPE_END_INT interrupt.
        SPI_MEM_WPE_END_INT_CLR: u1,
        /// The clear bit for SPI_MEM_SLV_ST_END_INT interrupt.
        SPI_MEM_SLV_ST_END_INT_CLR: u1,
        /// The clear bit for SPI_MEM_MST_ST_END_INT interrupt.
        SPI_MEM_MST_ST_END_INT_CLR: u1,
        reserved10: u5 = 0,
        /// The status bit for SPI_MEM_BROWN_OUT_INT interrupt.
        SPI_MEM_BROWN_OUT_INT_CLR: u1,
        padding: u21 = 0,
    }),
    /// SPI1 interrupt raw register
    /// offset: 0xc8
    SPI_MEM_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw bit for SPI_MEM_PER_END_INT interrupt. 1: Triggered when Auto Resume command (0x7A) is sent and flash is resumed successfully. 0: Others.
        SPI_MEM_PER_END_INT_RAW: u1,
        /// The raw bit for SPI_MEM_PES_END_INT interrupt.1: Triggered when Auto Suspend command (0x75) is sent and flash is suspended successfully. 0: Others.
        SPI_MEM_PES_END_INT_RAW: u1,
        /// The raw bit for SPI_MEM_WPE_END_INT interrupt. 1: Triggered when WRSR/PP/SE/BE/CE is sent and flash is already idle. 0: Others.
        SPI_MEM_WPE_END_INT_RAW: u1,
        /// The raw bit for SPI_MEM_SLV_ST_END_INT interrupt. 1: Triggered when spi1_slv_st is changed from non idle state to idle state. It means that SPI_CS raises high. 0: Others
        SPI_MEM_SLV_ST_END_INT_RAW: u1,
        /// The raw bit for SPI_MEM_MST_ST_END_INT interrupt. 1: Triggered when spi1_mst_st is changed from non idle state to idle state. 0: Others.
        SPI_MEM_MST_ST_END_INT_RAW: u1,
        reserved10: u5 = 0,
        /// The raw bit for SPI_MEM_BROWN_OUT_INT interrupt. 1: Triggered condition is that chip is loosing power and RTC module sends out brown out close flash request to SPI1. After SPI1 sends out suspend command to flash, this interrupt is triggered and MSPI returns to idle state. 0: Others.
        SPI_MEM_BROWN_OUT_INT_RAW: u1,
        padding: u21 = 0,
    }),
    /// SPI1 interrupt status register
    /// offset: 0xcc
    SPI_MEM_INT_ST: mmio.Mmio(packed struct(u32) {
        /// The status bit for SPI_MEM_PER_END_INT interrupt.
        SPI_MEM_PER_END_INT_ST: u1,
        /// The status bit for SPI_MEM_PES_END_INT interrupt.
        SPI_MEM_PES_END_INT_ST: u1,
        /// The status bit for SPI_MEM_WPE_END_INT interrupt.
        SPI_MEM_WPE_END_INT_ST: u1,
        /// The status bit for SPI_MEM_SLV_ST_END_INT interrupt.
        SPI_MEM_SLV_ST_END_INT_ST: u1,
        /// The status bit for SPI_MEM_MST_ST_END_INT interrupt.
        SPI_MEM_MST_ST_END_INT_ST: u1,
        reserved10: u5 = 0,
        /// The status bit for SPI_MEM_BROWN_OUT_INT interrupt.
        SPI_MEM_BROWN_OUT_INT_ST: u1,
        padding: u21 = 0,
    }),
    /// offset: 0xd0
    reserved208: [4]u8,
    /// SPI1 DDR control register
    /// offset: 0xd4
    SPI_MEM_DDR: mmio.Mmio(packed struct(u32) {
        /// 1: in ddr mode, 0 in sdr mode
        SPI_FMEM_DDR_EN: u1,
        /// Set the bit to enable variable dummy cycle in spi ddr mode.
        SPI_FMEM_VAR_DUMMY: u1,
        /// Set the bit to reorder rx data of the word in spi ddr mode.
        SPI_FMEM_DDR_RDAT_SWP: u1,
        /// Set the bit to reorder tx data of the word in spi ddr mode.
        SPI_FMEM_DDR_WDAT_SWP: u1,
        /// the bit is used to disable dual edge in command phase when ddr mode.
        SPI_FMEM_DDR_CMD_DIS: u1,
        /// It is the minimum output data length in the panda device.
        SPI_FMEM_OUTMINBYTELEN: u7,
        reserved14: u2 = 0,
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
    /// offset: 0xd8
    reserved216: [168]u8,
    /// SPI1 timing control register
    /// offset: 0x180
    SPI_MEM_TIMING_CALI: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// The bit is used to enable timing auto-calibration for all reading operations.
        SPI_MEM_TIMING_CALI: u1,
        /// add extra dummy spi clock cycle length for spi clock calibration.
        SPI_MEM_EXTRA_DUMMY_CYCLELEN: u3,
        padding: u27 = 0,
    }),
    /// offset: 0x184
    reserved388: [124]u8,
    /// SPI1 clk_gate register
    /// offset: 0x200
    SPI_MEM_CLOCK_GATE: mmio.Mmio(packed struct(u32) {
        /// Register clock gate enable signal. 1: Enable. 0: Disable.
        SPI_MEM_CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x204
    reserved516: [504]u8,
    /// Version control register
    /// offset: 0x3fc
    SPI_MEM_DATE: mmio.Mmio(packed struct(u32) {
        /// Version control register
        SPI_MEM_DATE: u28,
        padding: u4 = 0,
    }),
};
