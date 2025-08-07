const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Low-power UART (Universal Asynchronous Receiver-Transmitter) Controller
pub const LP_UART = extern struct {
    /// FIFO data register
    /// offset: 0x00
    FIFO: mmio.Mmio(packed struct(u32) {
        /// UART 0 accesses FIFO via this register.
        RXFIFO_RD_BYTE: u8,
        padding: u24 = 0,
    }),
    /// Raw interrupt status
    /// offset: 0x04
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// This interrupt raw bit turns to high level when receiver receives more data than what rxfifo_full_thrhd specifies.
        RXFIFO_FULL_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when the amount of data in Tx-FIFO is less than what txfifo_empty_thrhd specifies .
        TXFIFO_EMPTY_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when receiver detects a parity error in the data.
        PARITY_ERR_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when receiver detects a data frame error .
        FRM_ERR_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when receiver receives more data than the FIFO can store.
        RXFIFO_OVF_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when receiver detects the edge change of DSRn signal.
        DSR_CHG_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when receiver detects the edge change of CTSn signal.
        CTS_CHG_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when receiver detects a 0 after the stop bit.
        BRK_DET_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when receiver takes more time than rx_tout_thrhd to receive a byte.
        RXFIFO_TOUT_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when receiver recevies Xon char when uart_sw_flow_con_en is set to 1.
        SW_XON_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when receiver receives Xoff char when uart_sw_flow_con_en is set to 1.
        SW_XOFF_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when receiver detects a glitch in the middle of a start bit.
        GLITCH_DET_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when transmitter completes sending NULL characters after all data in Tx-FIFO are sent.
        TX_BRK_DONE_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when transmitter has kept the shortest duration after sending the last data.
        TX_BRK_IDLE_DONE_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when transmitter has send out all data in FIFO.
        TX_DONE_INT_RAW: u1,
        reserved18: u3 = 0,
        /// This interrupt raw bit turns to high level when receiver detects the configured at_cmd char.
        AT_CMD_CHAR_DET_INT_RAW: u1,
        /// This interrupt raw bit turns to high level when input rxd edge changes more times than what reg_active_threshold specifies in light sleeping mode.
        WAKEUP_INT_RAW: u1,
        padding: u12 = 0,
    }),
    /// Masked interrupt status
    /// offset: 0x08
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// This is the status bit for rxfifo_full_int_raw when rxfifo_full_int_ena is set to 1.
        RXFIFO_FULL_INT_ST: u1,
        /// This is the status bit for txfifo_empty_int_raw when txfifo_empty_int_ena is set to 1.
        TXFIFO_EMPTY_INT_ST: u1,
        /// This is the status bit for parity_err_int_raw when parity_err_int_ena is set to 1.
        PARITY_ERR_INT_ST: u1,
        /// This is the status bit for frm_err_int_raw when frm_err_int_ena is set to 1.
        FRM_ERR_INT_ST: u1,
        /// This is the status bit for rxfifo_ovf_int_raw when rxfifo_ovf_int_ena is set to 1.
        RXFIFO_OVF_INT_ST: u1,
        /// This is the status bit for dsr_chg_int_raw when dsr_chg_int_ena is set to 1.
        DSR_CHG_INT_ST: u1,
        /// This is the status bit for cts_chg_int_raw when cts_chg_int_ena is set to 1.
        CTS_CHG_INT_ST: u1,
        /// This is the status bit for brk_det_int_raw when brk_det_int_ena is set to 1.
        BRK_DET_INT_ST: u1,
        /// This is the status bit for rxfifo_tout_int_raw when rxfifo_tout_int_ena is set to 1.
        RXFIFO_TOUT_INT_ST: u1,
        /// This is the status bit for sw_xon_int_raw when sw_xon_int_ena is set to 1.
        SW_XON_INT_ST: u1,
        /// This is the status bit for sw_xoff_int_raw when sw_xoff_int_ena is set to 1.
        SW_XOFF_INT_ST: u1,
        /// This is the status bit for glitch_det_int_raw when glitch_det_int_ena is set to 1.
        GLITCH_DET_INT_ST: u1,
        /// This is the status bit for tx_brk_done_int_raw when tx_brk_done_int_ena is set to 1.
        TX_BRK_DONE_INT_ST: u1,
        /// This is the stauts bit for tx_brk_idle_done_int_raw when tx_brk_idle_done_int_ena is set to 1.
        TX_BRK_IDLE_DONE_INT_ST: u1,
        /// This is the status bit for tx_done_int_raw when tx_done_int_ena is set to 1.
        TX_DONE_INT_ST: u1,
        reserved18: u3 = 0,
        /// This is the status bit for at_cmd_det_int_raw when at_cmd_char_det_int_ena is set to 1.
        AT_CMD_CHAR_DET_INT_ST: u1,
        /// This is the status bit for uart_wakeup_int_raw when uart_wakeup_int_ena is set to 1.
        WAKEUP_INT_ST: u1,
        padding: u12 = 0,
    }),
    /// Interrupt enable bits
    /// offset: 0x0c
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// This is the enable bit for rxfifo_full_int_st register.
        RXFIFO_FULL_INT_ENA: u1,
        /// This is the enable bit for txfifo_empty_int_st register.
        TXFIFO_EMPTY_INT_ENA: u1,
        /// This is the enable bit for parity_err_int_st register.
        PARITY_ERR_INT_ENA: u1,
        /// This is the enable bit for frm_err_int_st register.
        FRM_ERR_INT_ENA: u1,
        /// This is the enable bit for rxfifo_ovf_int_st register.
        RXFIFO_OVF_INT_ENA: u1,
        /// This is the enable bit for dsr_chg_int_st register.
        DSR_CHG_INT_ENA: u1,
        /// This is the enable bit for cts_chg_int_st register.
        CTS_CHG_INT_ENA: u1,
        /// This is the enable bit for brk_det_int_st register.
        BRK_DET_INT_ENA: u1,
        /// This is the enable bit for rxfifo_tout_int_st register.
        RXFIFO_TOUT_INT_ENA: u1,
        /// This is the enable bit for sw_xon_int_st register.
        SW_XON_INT_ENA: u1,
        /// This is the enable bit for sw_xoff_int_st register.
        SW_XOFF_INT_ENA: u1,
        /// This is the enable bit for glitch_det_int_st register.
        GLITCH_DET_INT_ENA: u1,
        /// This is the enable bit for tx_brk_done_int_st register.
        TX_BRK_DONE_INT_ENA: u1,
        /// This is the enable bit for tx_brk_idle_done_int_st register.
        TX_BRK_IDLE_DONE_INT_ENA: u1,
        /// This is the enable bit for tx_done_int_st register.
        TX_DONE_INT_ENA: u1,
        reserved18: u3 = 0,
        /// This is the enable bit for at_cmd_char_det_int_st register.
        AT_CMD_CHAR_DET_INT_ENA: u1,
        /// This is the enable bit for uart_wakeup_int_st register.
        WAKEUP_INT_ENA: u1,
        padding: u12 = 0,
    }),
    /// Interrupt clear bits
    /// offset: 0x10
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the rxfifo_full_int_raw interrupt.
        RXFIFO_FULL_INT_CLR: u1,
        /// Set this bit to clear txfifo_empty_int_raw interrupt.
        TXFIFO_EMPTY_INT_CLR: u1,
        /// Set this bit to clear parity_err_int_raw interrupt.
        PARITY_ERR_INT_CLR: u1,
        /// Set this bit to clear frm_err_int_raw interrupt.
        FRM_ERR_INT_CLR: u1,
        /// Set this bit to clear rxfifo_ovf_int_raw interrupt.
        RXFIFO_OVF_INT_CLR: u1,
        /// Set this bit to clear the dsr_chg_int_raw interrupt.
        DSR_CHG_INT_CLR: u1,
        /// Set this bit to clear the cts_chg_int_raw interrupt.
        CTS_CHG_INT_CLR: u1,
        /// Set this bit to clear the brk_det_int_raw interrupt.
        BRK_DET_INT_CLR: u1,
        /// Set this bit to clear the rxfifo_tout_int_raw interrupt.
        RXFIFO_TOUT_INT_CLR: u1,
        /// Set this bit to clear the sw_xon_int_raw interrupt.
        SW_XON_INT_CLR: u1,
        /// Set this bit to clear the sw_xoff_int_raw interrupt.
        SW_XOFF_INT_CLR: u1,
        /// Set this bit to clear the glitch_det_int_raw interrupt.
        GLITCH_DET_INT_CLR: u1,
        /// Set this bit to clear the tx_brk_done_int_raw interrupt..
        TX_BRK_DONE_INT_CLR: u1,
        /// Set this bit to clear the tx_brk_idle_done_int_raw interrupt.
        TX_BRK_IDLE_DONE_INT_CLR: u1,
        /// Set this bit to clear the tx_done_int_raw interrupt.
        TX_DONE_INT_CLR: u1,
        reserved18: u3 = 0,
        /// Set this bit to clear the at_cmd_char_det_int_raw interrupt.
        AT_CMD_CHAR_DET_INT_CLR: u1,
        /// Set this bit to clear the uart_wakeup_int_raw interrupt.
        WAKEUP_INT_CLR: u1,
        padding: u12 = 0,
    }),
    /// Clock divider configuration
    /// offset: 0x14
    CLKDIV_SYNC: mmio.Mmio(packed struct(u32) {
        /// The integral part of the frequency divider factor.
        CLKDIV: u12,
        reserved20: u8 = 0,
        /// The decimal part of the frequency divider factor.
        CLKDIV_FRAG: u4,
        padding: u8 = 0,
    }),
    /// Rx Filter configuration
    /// offset: 0x18
    RX_FILT: mmio.Mmio(packed struct(u32) {
        /// when input pulse width is lower than this value the pulse is ignored.
        GLITCH_FILT: u8,
        /// Set this bit to enable Rx signal filter.
        GLITCH_FILT_EN: u1,
        padding: u23 = 0,
    }),
    /// UART status register
    /// offset: 0x1c
    STATUS: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// Stores the byte number of valid data in Rx-FIFO.
        RXFIFO_CNT: u5,
        reserved13: u5 = 0,
        /// The register represent the level value of the internal uart dsr signal.
        DSRN: u1,
        /// This register represent the level value of the internal uart cts signal.
        CTSN: u1,
        /// This register represent the level value of the internal uart rxd signal.
        RXD: u1,
        reserved19: u3 = 0,
        /// Stores the byte number of data in Tx-FIFO.
        TXFIFO_CNT: u5,
        reserved29: u5 = 0,
        /// This bit represents the level of the internal uart dtr signal.
        DTRN: u1,
        /// This bit represents the level of the internal uart rts signal.
        RTSN: u1,
        /// This bit represents the level of the internal uart txd signal.
        TXD: u1,
    }),
    /// Configuration register 0
    /// offset: 0x20
    CONF0_SYNC: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the parity check mode.
        PARITY: u1,
        /// Set this bit to enable uart parity check.
        PARITY_EN: u1,
        /// This register is used to set the length of data.
        BIT_NUM: u2,
        /// This register is used to set the length of stop bit.
        STOP_BIT_NUM: u2,
        /// Set this bit to enbale transmitter to send NULL when the process of sending data is done.
        TXD_BRK: u1,
        reserved12: u5 = 0,
        /// Set this bit to enable uart loopback test mode.
        LOOPBACK: u1,
        /// Set this bit to enable flow control function for transmitter.
        TX_FLOW_EN: u1,
        reserved15: u1 = 0,
        /// Set this bit to inverse the level value of uart rxd signal.
        RXD_INV: u1,
        /// Set this bit to inverse the level value of uart txd signal.
        TXD_INV: u1,
        /// Disable UART Rx data overflow detect.
        DIS_RX_DAT_OVF: u1,
        /// 1'h1: Receiver stops storing data into FIFO when data is wrong. 1'h0: Receiver stores the data even if the received data is wrong.
        ERR_WR_MASK: u1,
        reserved20: u1 = 0,
        /// UART memory clock gate enable signal.
        MEM_CLK_EN: u1,
        /// This register is used to configure the software rts signal which is used in software flow control.
        SW_RTS: u1,
        /// Set this bit to reset the uart receive-FIFO.
        RXFIFO_RST: u1,
        /// Set this bit to reset the uart transmit-FIFO.
        TXFIFO_RST: u1,
        padding: u8 = 0,
    }),
    /// Configuration register 1
    /// offset: 0x24
    CONF1: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// It will produce rxfifo_full_int interrupt when receiver receives more data than this register value.
        RXFIFO_FULL_THRHD: u5,
        reserved11: u3 = 0,
        /// It will produce txfifo_empty_int interrupt when the data amount in Tx-FIFO is less than this register value.
        TXFIFO_EMPTY_THRHD: u5,
        /// Set this bit to inverse the level value of uart cts signal.
        CTS_INV: u1,
        /// Set this bit to inverse the level value of uart dsr signal.
        DSR_INV: u1,
        /// Set this bit to inverse the level value of uart rts signal.
        RTS_INV: u1,
        /// Set this bit to inverse the level value of uart dtr signal.
        DTR_INV: u1,
        /// This register is used to configure the software dtr signal which is used in software flow control.
        SW_DTR: u1,
        /// 1'h1: Force clock on for register. 1'h0: Support clock only when application writes registers.
        CLK_EN: u1,
        padding: u10 = 0,
    }),
    /// offset: 0x28
    reserved40: [4]u8,
    /// Hardware flow-control configuration
    /// offset: 0x2c
    HWFC_CONF_SYNC: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// This register is used to configure the maximum amount of data that can be received when hardware flow control works.
        RX_FLOW_THRHD: u5,
        /// This is the flow enable bit for UART receiver.
        RX_FLOW_EN: u1,
        padding: u23 = 0,
    }),
    /// UART sleep configure register 0
    /// offset: 0x30
    SLEEP_CONF0: mmio.Mmio(packed struct(u32) {
        /// This register restores the specified wake up char1 to wake up
        WK_CHAR1: u8,
        /// This register restores the specified wake up char2 to wake up
        WK_CHAR2: u8,
        /// This register restores the specified wake up char3 to wake up
        WK_CHAR3: u8,
        /// This register restores the specified wake up char4 to wake up
        WK_CHAR4: u8,
    }),
    /// UART sleep configure register 1
    /// offset: 0x34
    SLEEP_CONF1: mmio.Mmio(packed struct(u32) {
        /// This register restores the specified char0 to wake up
        WK_CHAR0: u8,
        padding: u24 = 0,
    }),
    /// UART sleep configure register 2
    /// offset: 0x38
    SLEEP_CONF2: mmio.Mmio(packed struct(u32) {
        /// The uart is activated from light sleeping mode when the input rxd edge changes more times than this register value.
        ACTIVE_THRESHOLD: u10,
        reserved13: u3 = 0,
        /// In wake up mode 1 this field is used to set the received data number threshold to wake up chip.
        RX_WAKE_UP_THRHD: u5,
        /// This register is used to select number of wake up char.
        WK_CHAR_NUM: u3,
        /// This register is used to mask wake up char.
        WK_CHAR_MASK: u5,
        /// This register is used to select wake up mode. 0: RXD toggling to wake up. 1: received data number larger than
        WK_MODE_SEL: u2,
        padding: u4 = 0,
    }),
    /// Software flow-control character configuration
    /// offset: 0x3c
    SWFC_CONF0_SYNC: mmio.Mmio(packed struct(u32) {
        /// This register stores the Xon flow control char.
        XON_CHAR: u8,
        /// This register stores the Xoff flow control char.
        XOFF_CHAR: u8,
        /// In software flow control mode, UART Tx is disabled once UART Rx receives XOFF. In this status, UART Tx can not transmit XOFF even the received data number is larger than UART_XOFF_THRESHOLD. Set this bit to enable UART Tx can transmit XON/XOFF when UART Tx is disabled.
        XON_XOFF_STILL_SEND: u1,
        /// Set this bit to enable software flow control. It is used with register sw_xon or sw_xoff.
        SW_FLOW_CON_EN: u1,
        /// Set this bit to remove flow control char from the received data.
        XONOFF_DEL: u1,
        /// Set this bit to enable the transmitter to go on sending data.
        FORCE_XON: u1,
        /// Set this bit to stop the transmitter from sending data.
        FORCE_XOFF: u1,
        /// Set this bit to send Xon char. It is cleared by hardware automatically.
        SEND_XON: u1,
        /// Set this bit to send Xoff char. It is cleared by hardware automatically.
        SEND_XOFF: u1,
        padding: u9 = 0,
    }),
    /// Software flow-control character configuration
    /// offset: 0x40
    SWFC_CONF1: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// When the data amount in Rx-FIFO is less than this register value with uart_sw_flow_con_en set to 1 it will send a Xon char.
        XON_THRESHOLD: u5,
        reserved11: u3 = 0,
        /// When the data amount in Rx-FIFO is more than this register value with uart_sw_flow_con_en set to 1 it will send a Xoff char.
        XOFF_THRESHOLD: u5,
        padding: u16 = 0,
    }),
    /// Tx Break character configuration
    /// offset: 0x44
    TXBRK_CONF_SYNC: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the number of 0 to be sent after the process of sending data is done. It is active when txd_brk is set to 1.
        TX_BRK_NUM: u8,
        padding: u24 = 0,
    }),
    /// Frame-end idle configuration
    /// offset: 0x48
    IDLE_CONF_SYNC: mmio.Mmio(packed struct(u32) {
        /// It will produce frame end signal when receiver takes more time to receive one byte data than this register value.
        RX_IDLE_THRHD: u10,
        /// This register is used to configure the duration time between transfers.
        TX_IDLE_NUM: u10,
        padding: u12 = 0,
    }),
    /// RS485 mode configuration
    /// offset: 0x4c
    RS485_CONF_SYNC: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Set this bit to delay the stop bit by 1 bit.
        DL0_EN: u1,
        /// Set this bit to delay the stop bit by 1 bit.
        DL1_EN: u1,
        padding: u29 = 0,
    }),
    /// Pre-sequence timing configuration
    /// offset: 0x50
    AT_CMD_PRECNT_SYNC: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the idle duration time before the first at_cmd is received by receiver.
        PRE_IDLE_NUM: u16,
        padding: u16 = 0,
    }),
    /// Post-sequence timing configuration
    /// offset: 0x54
    AT_CMD_POSTCNT_SYNC: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the duration time between the last at_cmd and the next data.
        POST_IDLE_NUM: u16,
        padding: u16 = 0,
    }),
    /// Timeout configuration
    /// offset: 0x58
    AT_CMD_GAPTOUT_SYNC: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the duration time between the at_cmd chars.
        RX_GAP_TOUT: u16,
        padding: u16 = 0,
    }),
    /// AT escape sequence detection configuration
    /// offset: 0x5c
    AT_CMD_CHAR_SYNC: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the content of at_cmd char.
        AT_CMD_CHAR: u8,
        /// This register is used to configure the num of continuous at_cmd chars received by receiver.
        CHAR_NUM: u8,
        padding: u16 = 0,
    }),
    /// UART memory power configuration
    /// offset: 0x60
    MEM_CONF: mmio.Mmio(packed struct(u32) {
        reserved25: u25 = 0,
        /// Set this bit to force power down UART memory.
        MEM_FORCE_PD: u1,
        /// Set this bit to force power up UART memory.
        MEM_FORCE_PU: u1,
        padding: u5 = 0,
    }),
    /// UART threshold and allocation configuration
    /// offset: 0x64
    TOUT_CONF_SYNC: mmio.Mmio(packed struct(u32) {
        /// This is the enble bit for uart receiver's timeout function.
        RX_TOUT_EN: u1,
        /// Set this bit to stop accumulating idle_cnt when hardware flow control works.
        RX_TOUT_FLOW_DIS: u1,
        /// This register is used to configure the threshold time that receiver takes to receive one byte. The rxfifo_tout_int interrupt will be trigger when the receiver takes more time to receive one byte with rx_tout_en set to 1.
        RX_TOUT_THRHD: u10,
        padding: u20 = 0,
    }),
    /// Tx-SRAM write and read offset address.
    /// offset: 0x68
    MEM_TX_STATUS: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// This register stores the offset write address in Tx-SRAM.
        TX_SRAM_WADDR: u5,
        reserved12: u4 = 0,
        /// This register stores the offset read address in Tx-SRAM.
        TX_SRAM_RADDR: u5,
        padding: u15 = 0,
    }),
    /// Rx-SRAM write and read offset address.
    /// offset: 0x6c
    MEM_RX_STATUS: mmio.Mmio(packed struct(u32) {
        reserved3: u3 = 0,
        /// This register stores the offset read address in RX-SRAM.
        RX_SRAM_RADDR: u5,
        reserved12: u4 = 0,
        /// This register stores the offset write address in Rx-SRAM.
        RX_SRAM_WADDR: u5,
        padding: u15 = 0,
    }),
    /// UART transmit and receive status.
    /// offset: 0x70
    FSM_STATUS: mmio.Mmio(packed struct(u32) {
        /// This is the status register of receiver.
        ST_URX_OUT: u4,
        /// This is the status register of transmitter.
        ST_UTX_OUT: u4,
        padding: u24 = 0,
    }),
    /// offset: 0x74
    reserved116: [20]u8,
    /// UART core clock configuration
    /// offset: 0x88
    CLK_CONF: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// Set this bit to enable UART Tx clock.
        TX_SCLK_EN: u1,
        /// Set this bit to enable UART Rx clock.
        RX_SCLK_EN: u1,
        /// Write 1 then write 0 to this bit to reset UART Tx.
        TX_RST_CORE: u1,
        /// Write 1 then write 0 to this bit to reset UART Rx.
        RX_RST_CORE: u1,
        padding: u4 = 0,
    }),
    /// UART Version register
    /// offset: 0x8c
    DATE: mmio.Mmio(packed struct(u32) {
        /// This is the version register.
        DATE: u32,
    }),
    /// UART AFIFO Status
    /// offset: 0x90
    AFIFO_STATUS: mmio.Mmio(packed struct(u32) {
        /// Full signal of APB TX AFIFO.
        TX_AFIFO_FULL: u1,
        /// Empty signal of APB TX AFIFO.
        TX_AFIFO_EMPTY: u1,
        /// Full signal of APB RX AFIFO.
        RX_AFIFO_FULL: u1,
        /// Empty signal of APB RX AFIFO.
        RX_AFIFO_EMPTY: u1,
        padding: u28 = 0,
    }),
    /// offset: 0x94
    reserved148: [4]u8,
    /// UART Registers Configuration Update register
    /// offset: 0x98
    REG_UPDATE: mmio.Mmio(packed struct(u32) {
        /// Software write 1 would synchronize registers into UART Core clock domain and would be cleared by hardware after synchronization is done.
        REG_UPDATE: u1,
        padding: u31 = 0,
    }),
    /// UART ID register
    /// offset: 0x9c
    ID: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the uart_id.
        ID: u32,
    }),
};
