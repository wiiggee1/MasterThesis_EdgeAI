const mmio = @import("mmio");
const types = @import("../../types.zig");

/// SD/MMC Host Controller
pub const SDHOST = extern struct {
    /// Control register
    /// offset: 0x00
    CTRL: mmio.Mmio(packed struct(u32) {
        /// To reset controller, firmware should set this bit. This bit is auto-cleared after two AHB and two sdhost_cclk_in clock cycles.
        CONTROLLER_RESET: u1,
        /// To reset FIFO, firmware should set bit to 1. This bit is auto-cleared after completion of reset operation. Note: FIFO pointers will be out of reset after 2 cycles of system clocks in addition to synchronization delay (2 cycles of card clock), after the fifo_reset is cleared.
        FIFO_RESET: u1,
        /// To reset DMA interface, firmware should set bit to 1. This bit is auto-cleared after two AHB clocks.
        DMA_RESET: u1,
        reserved4: u1 = 0,
        /// Global interrupt enable/disable bit. 0: Disable; 1: Enable.
        INT_ENABLE: u1,
        reserved6: u1 = 0,
        /// For sending read-wait to SDIO cards.
        READ_WAIT: u1,
        /// Bit automatically clears once response is sent. To wait for MMC card interrupts, host issues CMD40 and waits for interrupt response from MMC card(s). In the meantime, if host wants SD/MMC to exit waiting for interrupt state, it can set this bit, at which time SD/MMC command state-machine sends CMD40 response on bus and returns to idle state.
        SEND_IRQ_RESPONSE: u1,
        /// After a suspend-command is issued during a read-operation, software polls the card to find when the suspend-event occurred. Once the suspend-event has occurred, software sets the bit which will reset the data state machine that is waiting for the next block of data. This bit is automatically cleared once the data state machine is reset to idle.
        ABORT_READ_DATA: u1,
        /// When set, SD/MMC sends CCSD to the CE-ATA device. Software sets this bit only if the current command is expecting CCS (that is, RW_BLK), and if interrupts are enabled for the CE-ATA device. Once the CCSD pattern is sent to the device, SD/MMC automatically clears the SDHOST_SEND_CCSD bit. It also sets the Command Done (CD) bit in the SDHOST_RINTSTS_REG register, and generates an interrupt for the host, in case the Command Done interrupt is not masked. NOTE: Once the SDHOST_SEND_CCSD bit is set, it takes two card clock cycles to drive the CCSD on the CMD line. Due to this, within the boundary conditions the CCSD may be sent to the CE-ATA device, even if the device has signalled CCS.
        SEND_CCSD: u1,
        /// Always Set SDHOST_SEND_AUTO_STOP_CCSD and SDHOST_SEND_CCSD bits together; SDHOST_SEND_AUTO_STOP_CCSD should not be set independently of send_ccsd. When set, SD/MMC automatically sends an internally-generated STOP command (CMD12) to the CE-ATA device. After sending this internally-generated STOP command, the Auto Command Done (ACD) bit in SDHOST_RINTSTS_REG is set and an interrupt is generated for the host, in case the ACD interrupt is not masked. After sending the Command Completion Signal Disable (CCSD), SD/MMC automatically clears the SDHOST_SEND_AUTO_STOP_CCSD bit.
        SEND_AUTO_STOP_CCSD: u1,
        /// Software should appropriately write to this bit after the power-on reset or any other reset to the CE-ATA device. After reset, the CE-ATA device's interrupt is usually disabled (nIEN = 1). If the host enables the CE-ATA device's interrupt, then software should set this bit.
        CEATA_DEVICE_INTERRUPT_STATUS: u1,
        padding: u20 = 0,
    }),
    /// offset: 0x04
    reserved4: [4]u8,
    /// Clock divider configuration register
    /// offset: 0x08
    CLKDIV: mmio.Mmio(packed struct(u32) {
        /// Clock divider0 value. Clock divisor is 2*n, where n = 0 bypasses the divider (divisor of 1). For example, a value of 1 means divided by 2*1 = 2, a value of 0xFF means divided by 2*255 = 510, and so on.
        CLK_DIVIDER0: u8,
        /// Clock divider1 value. Clock divisor is 2*n, where n = 0 bypasses the divider (divisor of 1). For example, a value of 1 means divided by 2*1 = 2, a value of 0xFF means divided by 2*255 = 510, and so on.
        CLK_DIVIDER1: u8,
        /// Clock divider2 value. Clock divisor is 2*n, where n = 0 bypasses the divider (divisor of 1). For example, a value of 1 means divided by 2*1 = 2, a value of 0xFF means divided by 2*255 = 510, and so on.
        CLK_DIVIDER2: u8,
        /// Clock divider3 value. Clock divisor is 2*n, where n = 0 bypasses the divider (divisor of 1). For example, a value of 1 means divided by 2*1 = 2, a value of 0xFF means divided by 2*255 = 510, and so on.
        CLK_DIVIDER3: u8,
    }),
    /// Clock source selection register
    /// offset: 0x0c
    CLKSRC: mmio.Mmio(packed struct(u32) {
        /// Clock divider source for two SD cards is supported. Each card has two bits assigned to it. For example, bit[1:0] are assigned for card 0, bit[3:2] are assigned for card 1. Card 0 maps and internally routes clock divider[0:3] outputs to cclk_out[1:0] pins, depending on bit value. 00 : Clock divider 0; 01 : Clock divider 1; 10 : Clock divider 2; 11 : Clock divider 3.
        CLKSRC: u4,
        padding: u28 = 0,
    }),
    /// Clock enable register
    /// offset: 0x10
    CLKENA: mmio.Mmio(packed struct(u32) {
        /// Clock-enable control for two SD card clocks and one MMC card clock is supported. One bit per card. 0: Clock disabled; 1: Clock enabled.
        CCLK_ENABLE: u2,
        reserved16: u14 = 0,
        /// Disable clock when the card is in IDLE state. One bit per card. 0: clock disabled; 1: clock enabled.
        LP_ENABLE: u2,
        padding: u14 = 0,
    }),
    /// Data and response timeout configuration register
    /// offset: 0x14
    TMOUT: mmio.Mmio(packed struct(u32) {
        /// Response timeout value. Value is specified in terms of number of card output clocks, i.e., sdhost_cclk_out.
        RESPONSE_TIMEOUT: u8,
        /// Value for card data read timeout. This value is also used for data starvation by host timeout. The timeout counter is started only after the card clock is stopped. This value is specified in number of card output clocks, i.e. sdhost_cclk_out of the selected card. NOTE: The software timer should be used if the timeout value is in the order of 100 ms. In this case, read data timeout interrupt needs to be disabled.
        DATA_TIMEOUT: u24,
    }),
    /// Card bus width configuration register
    /// offset: 0x18
    CTYPE: mmio.Mmio(packed struct(u32) {
        /// One bit per card indicates if card is 1-bit or 4-bit mode. 0: 1-bit mode; 1: 4-bit mode. Bit[1:0] correspond to card[1:0] respectively.
        CARD_WIDTH4: u2,
        reserved16: u14 = 0,
        /// One bit per card indicates if card is in 8-bit mode. 0: Non 8-bit mode; 1: 8-bit mode. Bit[17:16] correspond to card[1:0] respectively.
        CARD_WIDTH8: u2,
        padding: u14 = 0,
    }),
    /// Card data block size configuration register
    /// offset: 0x1c
    BLKSIZ: mmio.Mmio(packed struct(u32) {
        /// Block size.
        BLOCK_SIZE: u16,
        padding: u16 = 0,
    }),
    /// Data transfer length configuration register
    /// offset: 0x20
    BYTCNT: mmio.Mmio(packed struct(u32) {
        /// Number of bytes to be transferred, should be an integral multiple of Block Size for block transfers. For data transfers of undefined byte lengths, byte count should be set to 0. When byte count is set to 0, it is the responsibility of host to explicitly send stop/abort command to terminate data transfer.
        BYTE_COUNT: u32,
    }),
    /// SDIO interrupt mask register
    /// offset: 0x24
    INTMASK: mmio.Mmio(packed struct(u32) {
        /// These bits used to mask unwanted interrupts. A value of 0 masks interrupt, and a value of 1 enables the interrupt. Bit 15 (EBE): End-bit error/no CRC error; Bit 14 (ACD): Auto command done; Bit 13 (SBE/BCI): Rx Start Bit Error; Bit 12 (HLE): Hardware locked write error; Bit 11 (FRUN): FIFO underrun/overrun error; Bit 10 (HTO): Data starvation-by-host timeout; Bit 9 (DRTO): Data read timeout; Bit 8 (RTO): Response timeout; Bit 7 (DCRC): Data CRC error; Bit 6 (RCRC): Response CRC error; Bit 5 (RXDR): Receive FIFO data request; Bit 4 (TXDR): Transmit FIFO data request; Bit 3 (DTO): Data transfer over; Bit 2 (CD): Command done; Bit 1 (RE): Response error; Bit 0 (CD): Card detect.
        INT_MASK: u16,
        /// SDIO interrupt mask, one bit for each card. Bit[17:16] correspond to card[15:0] respectively. When masked, SDIO interrupt detection for that card is disabled. 0 masks an interrupt, and 1 enables an interrupt.
        SDIO_INT_MASK: u2,
        padding: u14 = 0,
    }),
    /// Command argument data register
    /// offset: 0x28
    CMDARG: mmio.Mmio(packed struct(u32) {
        /// Value indicates command argument to be passed to the card.
        CMDARG: u32,
    }),
    /// Command and boot configuration register
    /// offset: 0x2c
    CMD: mmio.Mmio(packed struct(u32) {
        /// Command index.
        INDEX: u6,
        /// 0: No response expected from card; 1: Response expected from card.
        RESPONSE_EXPECT: u1,
        /// 0: Short response expected from card; 1: Long response expected from card.
        RESPONSE_LENGTH: u1,
        /// 0: Do not check; 1: Check response CRC. Some of command responses do not return valid CRC bits. Software should disable CRC checks for those commands in order to disable CRC checking by controller.
        CHECK_RESPONSE_CRC: u1,
        /// 0: No data transfer expected; 1: Data transfer expected.
        DATA_EXPECTED: u1,
        /// 0: Read from card; 1: Write to card. Don't care if no data is expected from card.
        READ_WRITE: u1,
        /// 0: Block data transfer command; 1: Stream data transfer command. Don't care if no data expected.
        TRANSFER_MODE: u1,
        /// 0: No stop command is sent at the end of data transfer; 1: Send stop command at the end of data transfer.
        SEND_AUTO_STOP: u1,
        /// 0: Send command at once, even if previous data transfer has not completed; 1: Wait for previous data transfer to complete before sending Command. The SDHOST_WAIT_PRVDATA_COMPLETE] = 0 option is typically used to query status of card during data transfer or to stop current data transfer. SDHOST_CARD_NUMBERr should be same as in previous command.
        WAIT_PRVDATA_COMPLETE: u1,
        /// 0: Neither stop nor abort command can stop current data transfer. If abort is sent to function-number currently selected or not in data-transfer mode, then bit should be set to 0; 1: Stop or abort command intended to stop current data transfer in progress. When open-ended or predefined data transfer is in progress, and host issues stop or abort command to stop data transfer, bit should be set so that command/data state-machines of CIU can return correctly to idle state.
        STOP_ABORT_CMD: u1,
        /// 0: Do not send initialization sequence (80 clocks of 1) before sending this command; 1: Send initialization sequence before sending this command. After powered on, 80 clocks must be sent to card for initialization before sending any commands to card. Bit should be set while sending first command to card so that controller will initialize clocks before sending command to card.
        SEND_INITIALIZATION: u1,
        /// Card number in use. Represents physical slot number of card being accessed. In SD-only mode, up to two cards are supported.
        CARD_NUMBER: u5,
        /// 0: Normal command sequence; 1: Do not send commands, just update clock register value into card clock domain. Following register values are transferred into card clock domain: CLKDIV, CLRSRC, and CLKENA. Changes card clocks (change frequency, truncate off or on, and set low-frequency mode). This is provided in order to change clock frequency or stop clock without having to send command to cards. During normal command sequence, when sdhost_update_clock_registers_only = 0, following control registers are transferred from BIU to CIU: CMD, CMDARG, TMOUT, CTYPE, BLKSIZ, and BYTCNT. CIU uses new register values for new command sequence to card(s). When bit is set, there are no Command Done interrupts because no command is sent to SD_MMC_CEATA cards.
        UPDATE_CLOCK_REGISTERS_ONLY: u1,
        /// Read access flag. 0: Host is not performing read access (RW_REG or RW_BLK)towards CE-ATA device; 1: Host is performing read access (RW_REG or RW_BLK) towards CE-ATA device. Software should set this bit to indicate that CE-ATA device is being accessed for read transfer. This bit is used to disable read data timeout indication while performing CE-ATA read transfers. Maximum value of I/O transmission delay can be no less than 10 seconds. SD/MMC should not indicate read data timeout while waiting for data from CE-ATA device.
        READ_CEATA_DEVICE: u1,
        /// Expected Command Completion Signal (CCS) configuration. 0: Interrupts are not enabled in CE-ATA device (nIEN = 1 in ATA control register), or command does not expect CCS from device; 1: Interrupts are enabled in CE-ATA device (nIEN = 0), and RW_BLK command expects command completion signal from CE-ATA device. If the command expects Command Completion Signal (CCS) from the CE-ATA device, the software should set this control bit. SD/MMC sets Data Transfer Over (DTO) bit in RINTSTS register and generates interrupt to host if Data Transfer Over interrupt is not masked.
        CCS_EXPECTED: u1,
        reserved29: u5 = 0,
        /// Use Hold Register. 0: CMD and DATA sent to card bypassing HOLD Register; 1: CMD and DATA sent to card through the HOLD Register.
        USE_HOLE: u1,
        reserved31: u1 = 0,
        /// Start command. Once command is served by the CIU, this bit is automatically cleared. When this bit is set, host should not attempt to write to any command registers. If a write is attempted, hardware lock error is set in raw interrupt register. Once command is sent and a response is received from SD_MMC_CEATA cards, Command Done bit is set in the raw interrupt Register.
        START_CMD: u1,
    }),
    /// Response data register
    /// offset: 0x30
    RESP0: mmio.Mmio(packed struct(u32) {
        /// Bit[31:0] of response.
        RESPONSE0: u32,
    }),
    /// Long response data register
    /// offset: 0x34
    RESP1: mmio.Mmio(packed struct(u32) {
        /// Bit[63:32] of long response.
        RESPONSE1: u32,
    }),
    /// Long response data register
    /// offset: 0x38
    RESP2: mmio.Mmio(packed struct(u32) {
        /// Bit[95:64] of long response.
        RESPONSE2: u32,
    }),
    /// Long response data register
    /// offset: 0x3c
    RESP3: mmio.Mmio(packed struct(u32) {
        /// Bit[127:96] of long response.
        RESPONSE3: u32,
    }),
    /// Masked interrupt status register
    /// offset: 0x40
    MINTSTS: mmio.Mmio(packed struct(u32) {
        /// Interrupt enabled only if corresponding bit in interrupt mask register is set. Bit 15 (EBE): End-bit error/no CRC error; Bit 14 (ACD): Auto command done; Bit 13 (SBE/BCI): RX Start Bit Error; Bit 12 (HLE): Hardware locked write error; Bit 11 (FRUN): FIFO underrun/overrun error; Bit 10 (HTO): Data starvation by host timeout (HTO); Bit 9 (DTRO): Data read timeout; Bit 8 (RTO): Response timeout; Bit 7 (DCRC): Data CRC error; Bit 6 (RCRC): Response CRC error; Bit 5 (RXDR): Receive FIFO data request; Bit 4 (TXDR): Transmit FIFO data request; Bit 3 (DTO): Data transfer over; Bit 2 (CD): Command done; Bit 1 (RE): Response error; Bit 0 (CD): Card detect.
        INT_STATUS_MSK: u16,
        /// Interrupt from SDIO card, one bit for each card. Bit[17:16] correspond to card1 and card0, respectively. SDIO interrupt for card is enabled only if corresponding sdhost_sdio_int_mask bit is set in Interrupt mask register (Setting mask bit enables interrupt).
        SDIO_INTERRUPT_MSK: u2,
        padding: u14 = 0,
    }),
    /// Raw interrupt status register
    /// offset: 0x44
    RINTSTS: mmio.Mmio(packed struct(u32) {
        /// Setting a bit clears the corresponding interrupt and writing 0 has no effect. Bits are logged regardless of interrupt mask status. Bit 15 (EBE): End-bit error/no CRC error; Bit 14 (ACD): Auto command done; Bit 13 (SBE/BCI): RX Start Bit Error; Bit 12 (HLE): Hardware locked write error; Bit 11 (FRUN): FIFO underrun/overrun error; Bit 10 (HTO): Data starvation by host timeout (HTO); Bit 9 (DTRO): Data read timeout; Bit 8 (RTO): Response timeout; Bit 7 (DCRC): Data CRC error; Bit 6 (RCRC): Response CRC error; Bit 5 (RXDR): Receive FIFO data request; Bit 4 (TXDR): Transmit FIFO data request; Bit 3 (DTO): Data transfer over; Bit 2 (CD): Command done; Bit 1 (RE): Response error; Bit 0 (CD): Card detect.
        INT_STATUS_RAW: u16,
        /// Interrupt from SDIO card, one bit for each card. Bit[17:16] correspond to card1 and card0, respectively. Setting a bit clears the corresponding interrupt bit and writing 0 has no effect. 0: No SDIO interrupt from card; 1: SDIO interrupt from card.
        SDIO_INTERRUPT_RAW: u2,
        padding: u14 = 0,
    }),
    /// SD/MMC status register
    /// offset: 0x48
    STATUS: mmio.Mmio(packed struct(u32) {
        /// FIFO reached Receive watermark level, not qualified with data transfer.
        FIFO_RX_WATERMARK: u1,
        /// FIFO reached Transmit watermark level, not qualified with data transfer.
        FIFO_TX_WATERMARK: u1,
        /// FIFO is empty status.
        FIFO_EMPTY: u1,
        /// FIFO is full status.
        FIFO_FULL: u1,
        /// Command FSM states. 0: Idle; 1: Send init sequence; 2: Send cmd start bit; 3: Send cmd tx bit; 4: Send cmd index + arg; 5: Send cmd crc7; 6: Send cmd end bit; 7: Receive resp start bit; 8: Receive resp IRQ response; 9: Receive resp tx bit; 10: Receive resp cmd idx; 11: Receive resp data; 12: Receive resp crc7; 13: Receive resp end bit; 14: Cmd path wait NCC; 15: Wait, cmd-to-response turnaround.
        COMMAND_FSM_STATES: u4,
        /// Raw selected sdhost_card_data[3], checks whether card is present. 0: card not present; 1: card present.
        DATA_3_STATUS: u1,
        /// Inverted version of raw selected sdhost_card_data[0]. 0: Card data not busy; 1: Card data busy.
        DATA_BUSY: u1,
        /// Data transmit or receive state-machine is busy.
        DATA_STATE_MC_BUSY: u1,
        /// Index of previous response, including any auto-stop sent by core.
        RESPONSE_INDEX: u6,
        /// FIFO count, number of filled locations in FIFO.
        FIFO_COUNT: u13,
        padding: u2 = 0,
    }),
    /// FIFO configuration register
    /// offset: 0x4c
    FIFOTH: mmio.Mmio(packed struct(u32) {
        /// FIFO threshold watermark level when transmitting data to card. When FIFO data count is less than or equal to this number, DMA/FIFO request is raised. If Interrupt is enabled, then interrupt occurs. During end of packet, request or interrupt is generated, regardless of threshold programming.In non-DMA mode, when transmit FIFO threshold (TXDR) interrupt is enabled, then interrupt is generated instead of DMA request. During end of packet, on last interrupt, host is responsible for filling FIFO with only required remaining bytes (not before FIFO is full or after CIU completes data transfers, because FIFO may not be empty). In DMA mode, at end of packet, if last transfer is less than burst size, DMA controller does single cycles until required bytes are transferred.
        TX_WMARK: u12,
        reserved16: u4 = 0,
        /// FIFO threshold watermark level when receiving data to card.When FIFO data count reaches greater than this number , DMA/FIFO request is raised. During end of packet, request is generated regardless of threshold programming in order to complete any remaining data.In non-DMA mode, when receiver FIFO threshold (RXDR) interrupt is enabled, then interrupt is generated instead of DMA request.During end of packet, interrupt is not generated if threshold programming is larger than any remaining data. It is responsibility of host to read remaining bytes on seeing Data Transfer Done interrupt.In DMA mode, at end of packet, even if remaining bytes are less than threshold, DMA request does single transfers to flush out any remaining bytes before Data Transfer Done interrupt is set.
        RX_WMARK: u11,
        reserved28: u1 = 0,
        /// Burst size of multiple transaction, should be programmed same as DMA controller multiple-transaction-size SDHOST_SRC/DEST_MSIZE. 000: 1-byte transfer; 001: 4-byte transfer; 010: 8-byte transfer; 011: 16-byte transfer; 100: 32-byte transfer; 101: 64-byte transfer; 110: 128-byte transfer; 111: 256-byte transfer.
        DMA_MULTIPLE_TRANSACTION_SIZE: u3,
        padding: u1 = 0,
    }),
    /// Card detect register
    /// offset: 0x50
    CDETECT: mmio.Mmio(packed struct(u32) {
        /// Value on sdhost_card_detect_n input ports (1 bit per card), read-only bits. 0 represents presence of card. Only NUM_CARDS number of bits are implemented.
        CARD_DETECT_N: u2,
        padding: u30 = 0,
    }),
    /// Card write protection (WP) status register
    /// offset: 0x54
    WRTPRT: mmio.Mmio(packed struct(u32) {
        /// Value on sdhost_card_write_prt input ports (1 bit per card). 1 represents write protection. Only NUM_CARDS number of bits are implemented.
        WRITE_PROTECT: u2,
        padding: u30 = 0,
    }),
    /// offset: 0x58
    reserved88: [4]u8,
    /// Transferred byte count register
    /// offset: 0x5c
    TCBCNT: mmio.Mmio(packed struct(u32) {
        /// Number of bytes transferred by CIU unit to card.
        TCBCNT: u32,
    }),
    /// Transferred byte count register
    /// offset: 0x60
    TBBCNT: mmio.Mmio(packed struct(u32) {
        /// Number of bytes transferred between Host/DMA memory and BIU FIFO.
        TBBCNT: u32,
    }),
    /// Debounce filter time configuration register
    /// offset: 0x64
    DEBNCE: mmio.Mmio(packed struct(u32) {
        /// Number of host clocks (clk) used by debounce filter logic. The typical debounce time is 5 \verb+~+ 25 ms to prevent the card instability when the card is inserted or removed.
        DEBOUNCE_COUNT: u24,
        padding: u8 = 0,
    }),
    /// User ID (scratchpad) register
    /// offset: 0x68
    USRID: mmio.Mmio(packed struct(u32) {
        /// User identification register, value set by user. Can also be used as a scratchpad register by user.
        USRID: u32,
    }),
    /// Version ID (scratchpad) register
    /// offset: 0x6c
    VERID: mmio.Mmio(packed struct(u32) {
        /// Hardware version register. Can also be read by fireware.
        VERSIONID: u32,
    }),
    /// Hardware feature register
    /// offset: 0x70
    HCON: mmio.Mmio(packed struct(u32) {
        /// Hardware support SDIO and MMC.
        CARD_TYPE: u1,
        /// Support card number is 2.
        CARD_NUM: u5,
        /// Register config is APB bus.
        BUS_TYPE: u1,
        /// Regisger data widht is 32.
        DATA_WIDTH: u3,
        /// Register address width is 32.
        ADDR_WIDTH: u6,
        reserved18: u2 = 0,
        /// DMA data witdth is 32.
        DMA_WIDTH: u3,
        /// Inside RAM in SDMMC module.
        RAM_INDISE: u1,
        /// Have a hold regiser in data path .
        HOLD: u1,
        reserved24: u1 = 0,
        /// Have 4 clk divider in design .
        NUM_CLK_DIV: u2,
        padding: u6 = 0,
    }),
    /// UHS-1 register
    /// offset: 0x74
    UHS: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// DDR mode selecton,1 bit for each card. 0-Non-DDR mdoe. 1-DDR mdoe.
        DDR: u2,
        padding: u14 = 0,
    }),
    /// Card reset register
    /// offset: 0x78
    RST_N: mmio.Mmio(packed struct(u32) {
        /// Hardware reset. 1: Active mode; 0: Reset. These bits cause the cards to enter pre-idle state, which requires them to be re-initialized. SDHOST_RST_CARD_RESET[0] should be set to 1'b0 to reset card0, SDHOST_RST_CARD_RESET[1] should be set to 1'b0 to reset card1.
        CARD_RESET: u2,
        padding: u30 = 0,
    }),
    /// offset: 0x7c
    reserved124: [4]u8,
    /// Burst mode transfer configuration register
    /// offset: 0x80
    BMOD: mmio.Mmio(packed struct(u32) {
        /// Software Reset. When set, the DMA Controller resets all its internal registers. It is automatically cleared after one clock cycle.
        SWR: u1,
        /// Fixed Burst. Controls whether the AHB Master interface performs fixed burst transfers or not. When set, the AHB will use only SINGLE, INCR4, INCR8 or INCR16 during start of normal burst transfers. When reset, the AHB will use SINGLE and INCR burst transfer operations.
        FB: u1,
        reserved7: u5 = 0,
        /// IDMAC Enable. When set, the IDMAC is enabled.
        DE: u1,
        /// Programmable Burst Length. These bits indicate the maximum number of beats to be performed in one IDMAC???Internal DMA Control???transaction. The IDMAC will always attempt to burst as specified in PBL each time it starts a burst transfer on the host bus. The permissible values are 1, 4, 8, 16, 32, 64, 128 and 256. This value is the mirror of MSIZE of FIFOTH register. In order to change this value, write the required value to FIFOTH register. This is an encode value as follows: 000: 1-byte transfer; 001: 4-byte transfer; 010: 8-byte transfer; 011: 16-byte transfer; 100: 32-byte transfer; 101: 64-byte transfer; 110: 128-byte transfer; 111: 256-byte transfer. PBL is a read-only value and is applicable only for data access, it does not apply to descriptor access.
        PBL: u3,
        padding: u21 = 0,
    }),
    /// Poll demand configuration register
    /// offset: 0x84
    PLDMND: mmio.Mmio(packed struct(u32) {
        /// Poll Demand. If the OWNER bit of a descriptor is not set, the FSM goes to the Suspend state. The host needs to write any value into this register for the IDMAC FSM to resume normal descriptor fetch operation. This is a write only .
        PD: u32,
    }),
    /// Descriptor base address register
    /// offset: 0x88
    DBADDR: mmio.Mmio(packed struct(u32) {
        /// Start of Descriptor List. Contains the base address of the First Descriptor. The LSB bits [1:0] are ignored and taken as all-zero by the IDMAC internally. Hence these LSB bits may be treated as read-only.
        DBADDR: u32,
    }),
    /// IDMAC status register
    /// offset: 0x8c
    IDSTS: mmio.Mmio(packed struct(u32) {
        /// Transmit Interrupt. Indicates that data transmission is finished for a descriptor. Writing 1 clears this bit.
        TI: u1,
        /// Receive Interrupt. Indicates the completion of data reception for a descriptor. Writing 1 clears this bit.
        RI: u1,
        /// Fatal Bus Error Interrupt. Indicates that a Bus Error occurred (IDSTS[12:10]) . When this bit is set, the DMA disables all its bus accesses. Writing 1 clears this bit.
        FBE: u1,
        reserved4: u1 = 0,
        /// Descriptor Unavailable Interrupt. This bit is set when the descriptor is unavailable due to OWNER bit = 0 (DES0[31] = 0). Writing 1 clears this bit.
        DU: u1,
        /// Card Error Summary. Indicates the status of the transaction to/from the card, also present in RINTSTS. Indicates the logical OR of the following bits: EBE : End Bit Error; RTO : Response Timeout/Boot Ack Timeout; RCRC : Response CRC; SBE : Start Bit Error; DRTO : Data Read Timeout/BDS timeout; DCRC : Data CRC for Receive; RE : Response Error. Writing 1 clears this bit. The abort condition of the IDMAC depends on the setting of this CES bit. If the CES bit is enabled, then the IDMAC aborts on a response error.
        CES: u1,
        reserved8: u2 = 0,
        /// Normal Interrupt Summary. Logical OR of the following: IDSTS[0] : Transmit Interrupt, IDSTS[1] : Receive Interrupt. Only unmasked bits affect this bit. This is a sticky bit and must be cleared each time a corresponding bit that causes NIS to be set is cleared. Writing 1 clears this bit.
        NIS: u1,
        /// Abnormal Interrupt Summary. Logical OR of the following: IDSTS[2] : Fatal Bus Interrupt, IDSTS[4] : DU bit Interrupt. Only unmasked bits affect this bit. This is a sticky bit and must be cleared each time a corresponding bit that causes AIS to be set is cleared. Writing 1 clears this bit.
        AIS: u1,
        /// Fatal Bus Error Code. Indicates the type of error that caused a Bus Error. Valid only when the Fatal Bus Error bit IDSTS[2] is set. This field does not generate an interrupt. 001: Host Abort received during transmission; 010: Host Abort received during reception; Others: Reserved.
        FBE_CODE: u3,
        /// DMAC FSM present state. 0: DMA_IDLE (idle state); 1: DMA_SUSPEND (suspend state); 2: DESC_RD (descriptor reading state); 3: DESC_CHK (descriptor checking state); 4: DMA_RD_REQ_WAIT (read-data request waiting state); 5: DMA_WR_REQ_WAIT (write-data request waiting state); 6: DMA_RD (data-read state); 7: DMA_WR (data-write state); 8: DESC_CLOSE (descriptor close state).
        FSM: u4,
        padding: u15 = 0,
    }),
    /// IDMAC interrupt enable register
    /// offset: 0x90
    IDINTEN: mmio.Mmio(packed struct(u32) {
        /// Transmit Interrupt Enable. When set with Normal Interrupt Summary Enable, Transmit Interrupt is enabled. When reset, Transmit Interrupt is disabled.
        TI: u1,
        /// Receive Interrupt Enable. When set with Normal Interrupt Summary Enable, Receive Interrupt is enabled. When reset, Receive Interrupt is disabled.
        RI: u1,
        /// Fatal Bus Error Enable. When set with Abnormal Interrupt Summary Enable, the Fatal Bus Error Interrupt is enabled. When reset, Fatal Bus Error Enable Interrupt is disabled.
        FBE: u1,
        reserved4: u1 = 0,
        /// Descriptor Unavailable Interrupt. When set along with Abnormal Interrupt Summary Enable, the DU interrupt is enabled.
        DU: u1,
        /// Card Error summary Interrupt Enable. When set, it enables the Card Interrupt summary.
        CES: u1,
        reserved8: u2 = 0,
        /// Normal Interrupt Summary Enable. When set, a normal interrupt is enabled. When reset, a normal interrupt is disabled. This bit enables the following bits: IDINTEN[0]: Transmit Interrupt; IDINTEN[1]: Receive Interrupt.
        NI: u1,
        /// Abnormal Interrupt Summary Enable. When set, an abnormal interrupt is enabled. This bit enables the following bits: IDINTEN[2]: Fatal Bus Error Interrupt; IDINTEN[4]: DU Interrupt.
        AI: u1,
        padding: u22 = 0,
    }),
    /// Host descriptor address pointer
    /// offset: 0x94
    DSCADDR: mmio.Mmio(packed struct(u32) {
        /// Host Descriptor Address Pointer, updated by IDMAC during operation and cleared on reset. This register points to the start address of the current descriptor read by the IDMAC.
        DSCADDR: u32,
    }),
    /// Host buffer address pointer register
    /// offset: 0x98
    BUFADDR: mmio.Mmio(packed struct(u32) {
        /// Host Buffer Address Pointer, updated by IDMAC during operation and cleared on reset. This register points to the current Data Buffer Address being accessed by the IDMAC.
        BUFADDR: u32,
    }),
    /// offset: 0x9c
    reserved156: [100]u8,
    /// Card Threshold Control register
    /// offset: 0x100
    CARDTHRCTL: mmio.Mmio(packed struct(u32) {
        /// Card read threshold enable. 1'b0-Card read threshold disabled. 1'b1-Card read threshold enabled.
        CARDRDTHREN: u1,
        /// Busy clear interrupt generation: 1'b0-Busy clear interrypt disabled. 1'b1-Busy clear interrypt enabled.
        CARDCLRINTEN: u1,
        /// Applicable when HS400 mode is enabled. 1'b0-Card write Threshold disabled. 1'b1-Card write Threshold enabled.
        CARDWRTHREN: u1,
        reserved16: u13 = 0,
        /// The inside FIFO size is 512,This register is applicable when SDHOST_CARDERTHREN_REG is set to 1 or SDHOST_CARDRDTHREN_REG set to 1.
        CARDTHRESHOLD: u16,
    }),
    /// offset: 0x104
    reserved260: [8]u8,
    /// eMMC DDR register
    /// offset: 0x10c
    EMMCDDR: mmio.Mmio(packed struct(u32) {
        /// Control for start bit detection mechanism duration of start bit.Each bit refers to one slot.Set this bit to 1 for eMMC4.5 and above,set to 0 for SD applications.For eMMC4.5,start bit can be: 1'b0-Full cycle. 1'b1-less than one full cycle.
        HALFSTARTBIT: u2,
        reserved31: u29 = 0,
        /// Set 1 to enable HS400 mode.
        HS400_MODE: u1,
    }),
    /// Enable Phase Shift register
    /// offset: 0x110
    ENSHIFT: mmio.Mmio(packed struct(u32) {
        /// Control for the amount of phase shift provided on the default enables in the design.Two bits assigned for each card. 2'b00-Default phase shift. 2'b01-Enables shifted to next immediate positive edge. 2'b10-Enables shifted to next immediate negative edge. 2'b11-Reserved.
        ENABLE_SHIFT: u4,
        padding: u28 = 0,
    }),
    /// offset: 0x114
    reserved276: [236]u8,
    /// CPU write and read transmit data by FIFO
    /// offset: 0x200
    BUFFIFO: mmio.Mmio(packed struct(u32) {
        /// CPU write and read transmit data by FIFO. This register points to the current Data FIFO .
        BUFFIFO: u32,
    }),
    /// offset: 0x204
    reserved516: [1532]u8,
    /// SDIO control register.
    /// offset: 0x800
    CLK_EDGE_SEL: mmio.Mmio(packed struct(u32) {
        /// It's used to select the clock phase of the output signal from phase 0, phase 90, phase 180, phase 270.
        CCLKIN_EDGE_DRV_SEL: u3,
        /// It's used to select the clock phase of the input signal from phase 0, phase 90, phase 180, phase 270.
        CCLKIN_EDGE_SAM_SEL: u3,
        /// It's used to select the clock phase of the internal signal from phase 0, phase 90, phase 180, phase 270.
        CCLKIN_EDGE_SLF_SEL: u3,
        /// The high level of the divider clock. The value should be smaller than CCLKIN_EDGE_L.
        CCLLKIN_EDGE_H: u4,
        /// The low level of the divider clock. The value should be larger than CCLKIN_EDGE_H.
        CCLLKIN_EDGE_L: u4,
        /// The clock division of cclk_in.
        CCLLKIN_EDGE_N: u4,
        /// Enable esdio mode.
        ESDIO_MODE: u1,
        /// Enable esd mode.
        ESD_MODE: u1,
        /// Sdio clock enable.
        CCLK_EN: u1,
        /// Enable ultra high speed mode, use dll to generate clk.
        ULTRA_HIGH_SPEED_MODE: u1,
        padding: u7 = 0,
    }),
    /// SDIO raw ints register.
    /// offset: 0x804
    RAW_INTS: mmio.Mmio(packed struct(u32) {
        /// It indicates raw ints.
        RAW_INTS: u32,
    }),
    /// SDIO DLL clock control register.
    /// offset: 0x808
    DLL_CLK_CONF: mmio.Mmio(packed struct(u32) {
        /// Clock enable of cclk_in_slf when ULTRA_HIGH_SPEED_MODE==1.
        DLL_CCLK_IN_SLF_EN: u1,
        /// Clock enable of cclk_in_drv when ULTRA_HIGH_SPEED_MODE==1.
        DLL_CCLK_IN_DRV_EN: u1,
        /// Clock enable of cclk_in_sam when ULTRA_HIGH_SPEED_MODE==1.
        DLL_CCLK_IN_SAM_EN: u1,
        /// It's used to control the phase of cclk_in_slf when ULTRA_HIGH_SPEED_MODE==1.
        DLL_CCLK_IN_SLF_PHASE: u6,
        /// It's used to control the phase of cclk_in_drv when ULTRA_HIGH_SPEED_MODE==1.
        DLL_CCLK_IN_DRV_PHASE: u6,
        /// It's used to control the phase of cclk_in_sam when ULTRA_HIGH_SPEED_MODE==1.
        DLL_CCLK_IN_SAM_PHASE: u6,
        padding: u11 = 0,
    }),
    /// SDIO DLL configuration register.
    /// offset: 0x80c
    DLL_CONF: mmio.Mmio(packed struct(u32) {
        /// Set 1 to stop calibration.
        DLL_CAL_STOP: u1,
        /// 1 means calibration finished.
        DLL_CAL_END: u1,
        padding: u30 = 0,
    }),
};
