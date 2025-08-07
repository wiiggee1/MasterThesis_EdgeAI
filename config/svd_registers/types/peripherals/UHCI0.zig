const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Universal Host Controller Interface 0
pub const UHCI0 = extern struct {
    /// UHCI Configuration Register0
    /// offset: 0x00
    CONF0: mmio.Mmio(packed struct(u32) {
        /// Write 1 then write 0 to this bit to reset decode state machine.
        TX_RST: u1,
        /// Write 1 then write 0 to this bit to reset encode state machine.
        RX_RST: u1,
        /// Select which uart to connect with GDMA.
        UART_SEL: u3,
        /// Set this bit to separate the data frame using a special char.
        SEPER_EN: u1,
        /// Set this bit to encode the data packet with a formatting header.
        HEAD_EN: u1,
        /// Set this bit to enable UHCI to receive the 16 bit CRC.
        CRC_REC_EN: u1,
        /// If this bit is set to 1 UHCI will end the payload receiving process when UART has been in idle state.
        UART_IDLE_EOF_EN: u1,
        /// If this bit is set to 1 UHCI decoder receiving payload data is end when the receiving byte count has reached the specified value. The value is payload length indicated by UHCI packet header when UHCI_HEAD_EN is 1 or the value is configuration value when UHCI_HEAD_EN is 0. If this bit is set to 0 UHCI decoder receiving payload data is end when 0xc0 is received.
        LEN_EOF_EN: u1,
        /// Set this bit to enable data integrity checking by appending a 16 bit CCITT-CRC to end of the payload.
        ENCODE_CRC_EN: u1,
        /// 1'b1: Force clock on for register. 1'b0: Support clock only when application writes registers.
        CLK_EN: u1,
        /// If this bit is set to 1 UHCI will end payload receive process when NULL frame is received by UART.
        UART_RX_BRK_EOF_EN: u1,
        padding: u19 = 0,
    }),
    /// UHCI Interrupt Raw Register
    /// offset: 0x04
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// Indicates the raw interrupt of UHCI_RX_START_INT. Interrupt will be triggered when delimiter is sent successfully.
        RX_START_INT_RAW: u1,
        /// Indicates the raw interrupt of UHCI_TX_START_INT. Interrupt will be triggered when DMA detects delimiter.
        TX_START_INT_RAW: u1,
        /// Indicates the raw interrupt of UHCI_RX_HUNG_INT. Interrupt will be triggered when the required time of DMA receiving data exceeds the configuration value.
        RX_HUNG_INT_RAW: u1,
        /// Indicates the raw interrupt of UHCI_TX_HUNG_INT. Interrupt will be triggered when the required time of DMA reading RAM data exceeds the configuration value.
        TX_HUNG_INT_RAW: u1,
        /// Indicates the raw interrupt of UHCI_SEND_S_REG_Q_INT. Interrupt will be triggered when UHCI sends short packet successfully with single_send mode.
        SEND_S_REG_Q_INT_RAW: u1,
        /// Indicates the raw interrupt of UHCI_SEND_A_REG_Q_INT. Interrupt will be triggered when UHCI sends short packet successfully with always_send mode.
        SEND_A_REG_Q_INT_RAW: u1,
        /// Indicates the raw interrupt of UHCI_OUT_EOF_INT. Interrupt will be triggered when there are errors in EOF.
        OUT_EOF_INT_RAW: u1,
        /// Indicates the raw interrupt of UHCI_APP_CTRL0_INT. Interrupt will be triggered when UHCI_APP_CTRL0_IN_SET is set to 1.
        APP_CTRL0_INT_RAW: u1,
        /// Indicates the raw interrupt of UHCI_APP_CTRL1_INT. Interrupt will be triggered when UHCI_APP_CTRL1_IN_SET is set to 1.
        APP_CTRL1_INT_RAW: u1,
        padding: u23 = 0,
    }),
    /// UHCI Interrupt Status Register
    /// offset: 0x08
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// Indicates the interrupt status of UHCI_RX_START_INT.
        RX_START_INT_ST: u1,
        /// Indicates the interrupt status of UHCI_TX_START_INT.
        TX_START_INT_ST: u1,
        /// Indicates the interrupt status of UHCI_RX_HUNG_INT.
        RX_HUNG_INT_ST: u1,
        /// Indicates the interrupt status of UHCI_TX_HUNG_INT.
        TX_HUNG_INT_ST: u1,
        /// Indicates the interrupt status of UHCI_SEND_S_REG_Q_INT.
        SEND_S_REG_Q_INT_ST: u1,
        /// Indicates the interrupt status of UHCI_SEND_A_REG_Q_INT.
        SEND_A_REG_Q_INT_ST: u1,
        /// Indicates the interrupt status of UHCI_OUT_EOF_INT.
        OUTLINK_EOF_ERR_INT_ST: u1,
        /// Indicates the interrupt status of UHCI_APP_CTRL0_INT.
        APP_CTRL0_INT_ST: u1,
        /// Indicates the interrupt status of UHCI_APP_CTRL1_INT.
        APP_CTRL1_INT_ST: u1,
        padding: u23 = 0,
    }),
    /// UHCI Interrupt Enable Register
    /// offset: 0x0c
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable the interrupt of UHCI_RX_START_INT.
        RX_START_INT_ENA: u1,
        /// Set this bit to enable the interrupt of UHCI_TX_START_INT.
        TX_START_INT_ENA: u1,
        /// Set this bit to enable the interrupt of UHCI_RX_HUNG_INT.
        RX_HUNG_INT_ENA: u1,
        /// Set this bit to enable the interrupt of UHCI_TX_HUNG_INT.
        TX_HUNG_INT_ENA: u1,
        /// Set this bit to enable the interrupt of UHCI_SEND_S_REG_Q_INT.
        SEND_S_REG_Q_INT_ENA: u1,
        /// Set this bit to enable the interrupt of UHCI_SEND_A_REG_Q_INT.
        SEND_A_REG_Q_INT_ENA: u1,
        /// Set this bit to enable the interrupt of UHCI_OUT_EOF_INT.
        OUTLINK_EOF_ERR_INT_ENA: u1,
        /// Set this bit to enable the interrupt of UHCI_APP_CTRL0_INT.
        APP_CTRL0_INT_ENA: u1,
        /// Set this bit to enable the interrupt of UHCI_APP_CTRL1_INT.
        APP_CTRL1_INT_ENA: u1,
        padding: u23 = 0,
    }),
    /// UHCI Interrupt Clear Register
    /// offset: 0x10
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the raw interrupt of UHCI_RX_START_INT.
        RX_START_INT_CLR: u1,
        /// Set this bit to clear the raw interrupt of UHCI_TX_START_INT.
        TX_START_INT_CLR: u1,
        /// Set this bit to clear the raw interrupt of UHCI_RX_HUNG_INT.
        RX_HUNG_INT_CLR: u1,
        /// Set this bit to clear the raw interrupt of UHCI_TX_HUNG_INT.
        TX_HUNG_INT_CLR: u1,
        /// Set this bit to clear the raw interrupt of UHCI_SEND_S_REG_Q_INT.
        SEND_S_REG_Q_INT_CLR: u1,
        /// Set this bit to clear the raw interrupt of UHCI_SEND_A_REG_Q_INT.
        SEND_A_REG_Q_INT_CLR: u1,
        /// Set this bit to clear the raw interrupt of UHCI_OUT_EOF_INT.
        OUTLINK_EOF_ERR_INT_CLR: u1,
        /// Set this bit to clear the raw interrupt of UHCI_APP_CTRL0_INT.
        APP_CTRL0_INT_CLR: u1,
        /// Set this bit to clear the raw interrupt of UHCI_APP_CTRL1_INT.
        APP_CTRL1_INT_CLR: u1,
        padding: u23 = 0,
    }),
    /// UHCI Configuration Register1
    /// offset: 0x14
    CONF1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable head checksum check when receiving.
        CHECK_SUM_EN: u1,
        /// Set this bit to enable sequence number check when receiving.
        CHECK_SEQ_EN: u1,
        /// Set this bit to support CRC calculation, and data integrity check bit should 1.
        CRC_DISABLE: u1,
        /// Set this bit to save data packet head when UHCI receive data.
        SAVE_HEAD: u1,
        /// Set this bit to encode data packet with checksum.
        TX_CHECK_SUM_RE: u1,
        /// Set this bit to encode data packet with ACK when reliable data packet is ready.
        TX_ACK_NUM_RE: u1,
        reserved7: u1 = 0,
        /// Set this bit to enable UHCI encoder transfer to ST_SW_WAIT status.
        WAIT_SW_START: u1,
        /// Set this bit to transmit data packet if UCHI_ENCODE_STATE is ST_SW_WAIT.
        SW_START: u1,
        padding: u23 = 0,
    }),
    /// UHCI Receive Status Register
    /// offset: 0x18
    STATE0: mmio.Mmio(packed struct(u32) {
        /// Indicates the error types when DMA receives the error frame. 3'b001: UHCI packet checksum error. 3'b010: UHCI packet sequence number error. 3'b011: UHCI packet CRC bit error. 3'b100: find 0xC0, but received packet is uncompleted. 3'b101: 0xC0 is not found, but received packet is completed. 3'b110: CRC check error.
        RX_ERR_CAUSE: u3,
        /// Indicates UHCI decoder status.
        DECODE_STATE: u3,
        padding: u26 = 0,
    }),
    /// UHCI Transmit Status Register
    /// offset: 0x1c
    STATE1: mmio.Mmio(packed struct(u32) {
        /// Indicates UHCI encoder status.
        ENCODE_STATE: u3,
        padding: u29 = 0,
    }),
    /// UHCI Escapes Configuration Register0
    /// offset: 0x20
    ESCAPE_CONF: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable resolve char 0xC0 when DMA receiving data.
        TX_C0_ESC_EN: u1,
        /// Set this bit to enable resolve char 0xDB when DMA receiving data.
        TX_DB_ESC_EN: u1,
        /// Set this bit to enable resolve flow control char 0x11 when DMA receiving data.
        TX_11_ESC_EN: u1,
        /// Set this bit to enable resolve flow control char 0x13 when DMA receiving data.
        TX_13_ESC_EN: u1,
        /// Set this bit to enable replacing 0xC0 with special char when DMA receiving data.
        RX_C0_ESC_EN: u1,
        /// Set this bit to enable replacing 0xDB with special char when DMA receiving data.
        RX_DB_ESC_EN: u1,
        /// Set this bit to enable replacing 0x11 with special char when DMA receiving data.
        RX_11_ESC_EN: u1,
        /// Set this bit to enable replacing 0x13 with special char when DMA receiving data.
        RX_13_ESC_EN: u1,
        padding: u24 = 0,
    }),
    /// UHCI Hung Configuration Register0
    /// offset: 0x24
    HUNG_CONF: mmio.Mmio(packed struct(u32) {
        /// Stores the timeout value. DMA generates UHCI_TX_HUNG_INT for timeout when receiving data.
        TXFIFO_TIMEOUT: u8,
        /// Configures the maximum counter value.
        TXFIFO_TIMEOUT_SHIFT: u3,
        /// Set this bit to enable TX FIFO timeout when receiving.
        TXFIFO_TIMEOUT_ENA: u1,
        /// Stores the timeout value. DMA generates UHCI_TX_HUNG_INT for timeout when reading RAM data.
        RXFIFO_TIMEOUT: u8,
        /// Configures the maximum counter value.
        RXFIFO_TIMEOUT_SHIFT: u3,
        /// Set this bit to enable TX FIFO timeout when DMA sending data.
        RXFIFO_TIMEOUT_ENA: u1,
        padding: u8 = 0,
    }),
    /// UHCI Ack Value Configuration Register0
    /// offset: 0x28
    ACK_NUM: mmio.Mmio(packed struct(u32) {
        /// Indicates the ACK number during software flow control.
        ACK_NUM: u3,
        /// Set this bit to load the ACK value of UHCI_ACK_NUM.
        LOAD: u1,
        padding: u28 = 0,
    }),
    /// UHCI Head Register
    /// offset: 0x2c
    RX_HEAD: mmio.Mmio(packed struct(u32) {
        /// Stores the head of received packet.
        RX_HEAD: u32,
    }),
    /// UCHI Quick send Register
    /// offset: 0x30
    QUICK_SENT: mmio.Mmio(packed struct(u32) {
        /// Configures single_send mode.
        SINGLE_SEND_NUM: u3,
        /// Set this bit to enable sending short packet with single_send mode.
        SINGLE_SEND_EN: u1,
        /// Configures always_send mode.
        ALWAYS_SEND_NUM: u3,
        /// Set this bit to enable sending short packet with always_send mode.
        ALWAYS_SEND_EN: u1,
        padding: u24 = 0,
    }),
    /// UHCI Q0_WORD0 Quick Send Register
    /// offset: 0x34
    REG_Q0_WORD0: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q0_WORD0: u32,
    }),
    /// UHCI Q0_WORD1 Quick Send Register
    /// offset: 0x38
    REG_Q0_WORD1: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q0_WORD1: u32,
    }),
    /// UHCI Q1_WORD0 Quick Send Register
    /// offset: 0x3c
    REG_Q1_WORD0: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q1_WORD0: u32,
    }),
    /// UHCI Q1_WORD1 Quick Send Register
    /// offset: 0x40
    REG_Q1_WORD1: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q1_WORD1: u32,
    }),
    /// UHCI Q2_WORD0 Quick Send Register
    /// offset: 0x44
    REG_Q2_WORD0: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q2_WORD0: u32,
    }),
    /// UHCI Q2_WORD1 Quick Send Register
    /// offset: 0x48
    REG_Q2_WORD1: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q2_WORD1: u32,
    }),
    /// UHCI Q3_WORD0 Quick Send Register
    /// offset: 0x4c
    REG_Q3_WORD0: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q3_WORD0: u32,
    }),
    /// UHCI Q3_WORD1 Quick Send Register
    /// offset: 0x50
    REG_Q3_WORD1: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q3_WORD1: u32,
    }),
    /// UHCI Q4_WORD0 Quick Send Register
    /// offset: 0x54
    REG_Q4_WORD0: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q4_WORD0: u32,
    }),
    /// UHCI Q4_WORD1 Quick Send Register
    /// offset: 0x58
    REG_Q4_WORD1: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q4_WORD1: u32,
    }),
    /// UHCI Q5_WORD0 Quick Send Register
    /// offset: 0x5c
    REG_Q5_WORD0: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q5_WORD0: u32,
    }),
    /// UHCI Q5_WORD1 Quick Send Register
    /// offset: 0x60
    REG_Q5_WORD1: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q5_WORD1: u32,
    }),
    /// UHCI Q6_WORD0 Quick Send Register
    /// offset: 0x64
    REG_Q6_WORD0: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q6_WORD0: u32,
    }),
    /// UHCI Q6_WORD1 Quick Send Register
    /// offset: 0x68
    REG_Q6_WORD1: mmio.Mmio(packed struct(u32) {
        /// Serves as quick sending register in specified mode in UHCI_ALWAYS_SEND_NUM or UHCI_SINGLE_SEND_NUM.
        SEND_Q6_WORD1: u32,
    }),
    /// UHCI Escapes Sequence Configuration Register0
    /// offset: 0x6c
    ESC_CONF0: mmio.Mmio(packed struct(u32) {
        /// Configures the delimiter for encoding, default value is 0xC0.
        SEPER_CHAR: u8,
        /// Configures the first char of SLIP escape character, default value is 0xDB.
        SEPER_ESC_CHAR0: u8,
        /// Configures the second char of SLIP escape character, default value is 0xDC.
        SEPER_ESC_CHAR1: u8,
        padding: u8 = 0,
    }),
    /// UHCI Escapes Sequence Configuration Register1
    /// offset: 0x70
    ESC_CONF1: mmio.Mmio(packed struct(u32) {
        /// Configures the char needing encoding, which is 0xDB as flow control char by default.
        ESC_SEQ0: u8,
        /// Configures the first char of SLIP escape character, default value is 0xDB.
        ESC_SEQ0_CHAR0: u8,
        /// Configures the second char of SLIP escape character, default value is 0xDD.
        ESC_SEQ0_CHAR1: u8,
        padding: u8 = 0,
    }),
    /// UHCI Escapes Sequence Configuration Register2
    /// offset: 0x74
    ESC_CONF2: mmio.Mmio(packed struct(u32) {
        /// Configures the char needing encoding, which is 0x11 as flow control char by default.
        ESC_SEQ1: u8,
        /// Configures the first char of SLIP escape character, default value is 0xDB.
        ESC_SEQ1_CHAR0: u8,
        /// Configures the second char of SLIP escape character, default value is 0xDE.
        ESC_SEQ1_CHAR1: u8,
        padding: u8 = 0,
    }),
    /// UHCI Escapes Sequence Configuration Register3
    /// offset: 0x78
    ESC_CONF3: mmio.Mmio(packed struct(u32) {
        /// Configures the char needing encoding, which is 0x13 as flow control char by default.
        ESC_SEQ2: u8,
        /// Configures the first char of SLIP escape character, default value is 0xDB.
        ESC_SEQ2_CHAR0: u8,
        /// Configures the second char of SLIP escape character, default value is 0xDF.
        ESC_SEQ2_CHAR1: u8,
        padding: u8 = 0,
    }),
    /// UCHI Packet Length Configuration Register
    /// offset: 0x7c
    PKT_THRES: mmio.Mmio(packed struct(u32) {
        /// Configures the data packet's maximum length when UHCI_HEAD_EN is 0.
        PKT_THRS: u13,
        padding: u19 = 0,
    }),
    /// UHCI Version Register
    /// offset: 0x80
    DATE: mmio.Mmio(packed struct(u32) {
        /// Configures version.
        DATE: u32,
    }),
};
