const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Full-speed USB Serial/JTAG Controller
pub const USB_DEVICE = extern struct {
    /// FIFO access for the CDC-ACM data IN and OUT endpoints.
    /// offset: 0x00
    EP1: mmio.Mmio(packed struct(u32) {
        /// Write and read byte data to/from UART Tx/Rx FIFO through this field. When USB_DEVICE_SERIAL_IN_EMPTY_INT is set, then user can write data (up to 64 bytes) into UART Tx FIFO. When USB_DEVICE_SERIAL_OUT_RECV_PKT_INT is set, user can check USB_DEVICE_OUT_EP1_WR_ADDR USB_DEVICE_OUT_EP0_RD_ADDR to know how many data is received, then read data from UART Rx FIFO.
        USB_SERIAL_JTAG_RDWR_BYTE: u8,
        padding: u24 = 0,
    }),
    /// Configuration and control registers for the CDC-ACM FIFOs.
    /// offset: 0x04
    EP1_CONF: mmio.Mmio(packed struct(u32) {
        /// Set this bit to indicate writing byte data to UART Tx FIFO is done.
        USB_SERIAL_JTAG_WR_DONE: u1,
        /// 1'b1: Indicate UART Tx FIFO is not full and can write data into in. After writing USB_DEVICE_WR_DONE, this bit would be 0 until data in UART Tx FIFO is read by USB Host.
        USB_SERIAL_JTAG_SERIAL_IN_EP_DATA_FREE: u1,
        /// 1'b1: Indicate there is data in UART Rx FIFO.
        USB_SERIAL_JTAG_SERIAL_OUT_EP_DATA_AVAIL: u1,
        padding: u29 = 0,
    }),
    /// Interrupt raw status register.
    /// offset: 0x08
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when flush cmd is received for IN endpoint 2 of JTAG.
        USB_SERIAL_JTAG_JTAG_IN_FLUSH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when SOF frame is received.
        USB_SERIAL_JTAG_SOF_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when Serial Port OUT Endpoint received one packet.
        USB_SERIAL_JTAG_SERIAL_OUT_RECV_PKT_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when Serial Port IN Endpoint is empty.
        USB_SERIAL_JTAG_SERIAL_IN_EMPTY_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when pid error is detected.
        USB_SERIAL_JTAG_PID_ERR_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when CRC5 error is detected.
        USB_SERIAL_JTAG_CRC5_ERR_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when CRC16 error is detected.
        USB_SERIAL_JTAG_CRC16_ERR_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when stuff error is detected.
        USB_SERIAL_JTAG_STUFF_ERR_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when IN token for IN endpoint 1 is received.
        USB_SERIAL_JTAG_IN_TOKEN_REC_IN_EP1_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when usb bus reset is detected.
        USB_SERIAL_JTAG_USB_BUS_RESET_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when OUT endpoint 1 received packet with zero palyload.
        USB_SERIAL_JTAG_OUT_EP1_ZERO_PAYLOAD_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when OUT endpoint 2 received packet with zero palyload.
        USB_SERIAL_JTAG_OUT_EP2_ZERO_PAYLOAD_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when level of RTS from usb serial channel is changed.
        USB_SERIAL_JTAG_RTS_CHG_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when level of DTR from usb serial channel is changed.
        USB_SERIAL_JTAG_DTR_CHG_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when level of GET LINE CODING request is received.
        USB_SERIAL_JTAG_GET_LINE_CODE_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when level of SET LINE CODING request is received.
        USB_SERIAL_JTAG_SET_LINE_CODE_INT_RAW: u1,
        padding: u16 = 0,
    }),
    /// Interrupt status register.
    /// offset: 0x0c
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the USB_DEVICE_JTAG_IN_FLUSH_INT interrupt.
        USB_SERIAL_JTAG_JTAG_IN_FLUSH_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_SOF_INT interrupt.
        USB_SERIAL_JTAG_SOF_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_SERIAL_OUT_RECV_PKT_INT interrupt.
        USB_SERIAL_JTAG_SERIAL_OUT_RECV_PKT_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_SERIAL_IN_EMPTY_INT interrupt.
        USB_SERIAL_JTAG_SERIAL_IN_EMPTY_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_PID_ERR_INT interrupt.
        USB_SERIAL_JTAG_PID_ERR_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_CRC5_ERR_INT interrupt.
        USB_SERIAL_JTAG_CRC5_ERR_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_CRC16_ERR_INT interrupt.
        USB_SERIAL_JTAG_CRC16_ERR_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_STUFF_ERR_INT interrupt.
        USB_SERIAL_JTAG_STUFF_ERR_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_IN_TOKEN_REC_IN_EP1_INT interrupt.
        USB_SERIAL_JTAG_IN_TOKEN_REC_IN_EP1_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_USB_BUS_RESET_INT interrupt.
        USB_SERIAL_JTAG_USB_BUS_RESET_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_OUT_EP1_ZERO_PAYLOAD_INT interrupt.
        USB_SERIAL_JTAG_OUT_EP1_ZERO_PAYLOAD_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_OUT_EP2_ZERO_PAYLOAD_INT interrupt.
        USB_SERIAL_JTAG_OUT_EP2_ZERO_PAYLOAD_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_RTS_CHG_INT interrupt.
        USB_SERIAL_JTAG_RTS_CHG_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_DTR_CHG_INT interrupt.
        USB_SERIAL_JTAG_DTR_CHG_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_GET_LINE_CODE_INT interrupt.
        USB_SERIAL_JTAG_GET_LINE_CODE_INT_ST: u1,
        /// The raw interrupt status bit for the USB_DEVICE_SET_LINE_CODE_INT interrupt.
        USB_SERIAL_JTAG_SET_LINE_CODE_INT_ST: u1,
        padding: u16 = 0,
    }),
    /// Interrupt enable status register.
    /// offset: 0x10
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the USB_DEVICE_JTAG_IN_FLUSH_INT interrupt.
        USB_SERIAL_JTAG_JTAG_IN_FLUSH_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_SOF_INT interrupt.
        USB_SERIAL_JTAG_SOF_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_SERIAL_OUT_RECV_PKT_INT interrupt.
        USB_SERIAL_JTAG_SERIAL_OUT_RECV_PKT_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_SERIAL_IN_EMPTY_INT interrupt.
        USB_SERIAL_JTAG_SERIAL_IN_EMPTY_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_PID_ERR_INT interrupt.
        USB_SERIAL_JTAG_PID_ERR_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_CRC5_ERR_INT interrupt.
        USB_SERIAL_JTAG_CRC5_ERR_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_CRC16_ERR_INT interrupt.
        USB_SERIAL_JTAG_CRC16_ERR_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_STUFF_ERR_INT interrupt.
        USB_SERIAL_JTAG_STUFF_ERR_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_IN_TOKEN_REC_IN_EP1_INT interrupt.
        USB_SERIAL_JTAG_IN_TOKEN_REC_IN_EP1_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_USB_BUS_RESET_INT interrupt.
        USB_SERIAL_JTAG_USB_BUS_RESET_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_OUT_EP1_ZERO_PAYLOAD_INT interrupt.
        USB_SERIAL_JTAG_OUT_EP1_ZERO_PAYLOAD_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_OUT_EP2_ZERO_PAYLOAD_INT interrupt.
        USB_SERIAL_JTAG_OUT_EP2_ZERO_PAYLOAD_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_RTS_CHG_INT interrupt.
        USB_SERIAL_JTAG_RTS_CHG_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_DTR_CHG_INT interrupt.
        USB_SERIAL_JTAG_DTR_CHG_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_GET_LINE_CODE_INT interrupt.
        USB_SERIAL_JTAG_GET_LINE_CODE_INT_ENA: u1,
        /// The interrupt enable bit for the USB_DEVICE_SET_LINE_CODE_INT interrupt.
        USB_SERIAL_JTAG_SET_LINE_CODE_INT_ENA: u1,
        padding: u16 = 0,
    }),
    /// Interrupt clear status register.
    /// offset: 0x14
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the USB_DEVICE_JTAG_IN_FLUSH_INT interrupt.
        USB_SERIAL_JTAG_JTAG_IN_FLUSH_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_JTAG_SOF_INT interrupt.
        USB_SERIAL_JTAG_SOF_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_SERIAL_OUT_RECV_PKT_INT interrupt.
        USB_SERIAL_JTAG_SERIAL_OUT_RECV_PKT_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_SERIAL_IN_EMPTY_INT interrupt.
        USB_SERIAL_JTAG_SERIAL_IN_EMPTY_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_PID_ERR_INT interrupt.
        USB_SERIAL_JTAG_PID_ERR_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_CRC5_ERR_INT interrupt.
        USB_SERIAL_JTAG_CRC5_ERR_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_CRC16_ERR_INT interrupt.
        USB_SERIAL_JTAG_CRC16_ERR_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_STUFF_ERR_INT interrupt.
        USB_SERIAL_JTAG_STUFF_ERR_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_IN_TOKEN_IN_EP1_INT interrupt.
        USB_SERIAL_JTAG_IN_TOKEN_REC_IN_EP1_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_USB_BUS_RESET_INT interrupt.
        USB_SERIAL_JTAG_USB_BUS_RESET_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_OUT_EP1_ZERO_PAYLOAD_INT interrupt.
        USB_SERIAL_JTAG_OUT_EP1_ZERO_PAYLOAD_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_OUT_EP2_ZERO_PAYLOAD_INT interrupt.
        USB_SERIAL_JTAG_OUT_EP2_ZERO_PAYLOAD_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_RTS_CHG_INT interrupt.
        USB_SERIAL_JTAG_RTS_CHG_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_DTR_CHG_INT interrupt.
        USB_SERIAL_JTAG_DTR_CHG_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_GET_LINE_CODE_INT interrupt.
        USB_SERIAL_JTAG_GET_LINE_CODE_INT_CLR: u1,
        /// Set this bit to clear the USB_DEVICE_SET_LINE_CODE_INT interrupt.
        USB_SERIAL_JTAG_SET_LINE_CODE_INT_CLR: u1,
        padding: u16 = 0,
    }),
    /// PHY hardware configuration.
    /// offset: 0x18
    CONF0: mmio.Mmio(packed struct(u32) {
        /// Select internal/external PHY
        USB_SERIAL_JTAG_PHY_SEL: u1,
        /// Enable software control USB D+ D- exchange
        USB_SERIAL_JTAG_EXCHG_PINS_OVERRIDE: u1,
        /// USB D+ D- exchange
        USB_SERIAL_JTAG_EXCHG_PINS: u1,
        /// Control single-end input high threshold,1.76V to 2V, step 80mV
        USB_SERIAL_JTAG_VREFH: u2,
        /// Control single-end input low threshold,0.8V to 1.04V, step 80mV
        USB_SERIAL_JTAG_VREFL: u2,
        /// Enable software control input threshold
        USB_SERIAL_JTAG_VREF_OVERRIDE: u1,
        /// Enable software control USB D+ D- pullup pulldown
        USB_SERIAL_JTAG_PAD_PULL_OVERRIDE: u1,
        /// Control USB D+ pull up.
        USB_SERIAL_JTAG_DP_PULLUP: u1,
        /// Control USB D+ pull down.
        USB_SERIAL_JTAG_DP_PULLDOWN: u1,
        /// Control USB D- pull up.
        USB_SERIAL_JTAG_DM_PULLUP: u1,
        /// Control USB D- pull down.
        USB_SERIAL_JTAG_DM_PULLDOWN: u1,
        /// Control pull up value.
        USB_SERIAL_JTAG_PULLUP_VALUE: u1,
        /// Enable USB pad function.
        USB_SERIAL_JTAG_USB_PAD_ENABLE: u1,
        /// Set this bit usb_jtag, the connection between usb_jtag and internal JTAG is disconnected, and MTMS, MTDI, MTCK are output through GPIO Matrix, MTDO is input through GPIO Matrix.
        USB_SERIAL_JTAG_USB_JTAG_BRIDGE_EN: u1,
        padding: u16 = 0,
    }),
    /// Registers used for debugging the PHY.
    /// offset: 0x1c
    TEST: mmio.Mmio(packed struct(u32) {
        /// Enable test of the USB pad
        USB_SERIAL_JTAG_TEST_ENABLE: u1,
        /// USB pad oen in test
        USB_SERIAL_JTAG_TEST_USB_OE: u1,
        /// USB D+ tx value in test
        USB_SERIAL_JTAG_TEST_TX_DP: u1,
        /// USB D- tx value in test
        USB_SERIAL_JTAG_TEST_TX_DM: u1,
        /// USB RCV value in test
        USB_SERIAL_JTAG_TEST_RX_RCV: u1,
        /// USB D+ rx value in test
        USB_SERIAL_JTAG_TEST_RX_DP: u1,
        /// USB D- rx value in test
        USB_SERIAL_JTAG_TEST_RX_DM: u1,
        padding: u25 = 0,
    }),
    /// JTAG FIFO status and control registers.
    /// offset: 0x20
    JFIFO_ST: mmio.Mmio(packed struct(u32) {
        /// JTAT in fifo counter.
        USB_SERIAL_JTAG_IN_FIFO_CNT: u2,
        /// 1: JTAG in fifo is empty.
        USB_SERIAL_JTAG_IN_FIFO_EMPTY: u1,
        /// 1: JTAG in fifo is full.
        USB_SERIAL_JTAG_IN_FIFO_FULL: u1,
        /// JTAT out fifo counter.
        USB_SERIAL_JTAG_OUT_FIFO_CNT: u2,
        /// 1: JTAG out fifo is empty.
        USB_SERIAL_JTAG_OUT_FIFO_EMPTY: u1,
        /// 1: JTAG out fifo is full.
        USB_SERIAL_JTAG_OUT_FIFO_FULL: u1,
        /// Write 1 to reset JTAG in fifo.
        USB_SERIAL_JTAG_IN_FIFO_RESET: u1,
        /// Write 1 to reset JTAG out fifo.
        USB_SERIAL_JTAG_OUT_FIFO_RESET: u1,
        padding: u22 = 0,
    }),
    /// Last received SOF frame index register.
    /// offset: 0x24
    FRAM_NUM: mmio.Mmio(packed struct(u32) {
        /// Frame index of received SOF frame.
        USB_SERIAL_JTAG_SOF_FRAME_INDEX: u11,
        padding: u21 = 0,
    }),
    /// Control IN endpoint status information.
    /// offset: 0x28
    IN_EP0_ST: mmio.Mmio(packed struct(u32) {
        /// State of IN Endpoint 0.
        USB_SERIAL_JTAG_IN_EP0_STATE: u2,
        /// Write data address of IN endpoint 0.
        USB_SERIAL_JTAG_IN_EP0_WR_ADDR: u7,
        /// Read data address of IN endpoint 0.
        USB_SERIAL_JTAG_IN_EP0_RD_ADDR: u7,
        padding: u16 = 0,
    }),
    /// CDC-ACM IN endpoint status information.
    /// offset: 0x2c
    IN_EP1_ST: mmio.Mmio(packed struct(u32) {
        /// State of IN Endpoint 1.
        USB_SERIAL_JTAG_IN_EP1_STATE: u2,
        /// Write data address of IN endpoint 1.
        USB_SERIAL_JTAG_IN_EP1_WR_ADDR: u7,
        /// Read data address of IN endpoint 1.
        USB_SERIAL_JTAG_IN_EP1_RD_ADDR: u7,
        padding: u16 = 0,
    }),
    /// CDC-ACM interrupt IN endpoint status information.
    /// offset: 0x30
    IN_EP2_ST: mmio.Mmio(packed struct(u32) {
        /// State of IN Endpoint 2.
        USB_SERIAL_JTAG_IN_EP2_STATE: u2,
        /// Write data address of IN endpoint 2.
        USB_SERIAL_JTAG_IN_EP2_WR_ADDR: u7,
        /// Read data address of IN endpoint 2.
        USB_SERIAL_JTAG_IN_EP2_RD_ADDR: u7,
        padding: u16 = 0,
    }),
    /// JTAG IN endpoint status information.
    /// offset: 0x34
    IN_EP3_ST: mmio.Mmio(packed struct(u32) {
        /// State of IN Endpoint 3.
        USB_SERIAL_JTAG_IN_EP3_STATE: u2,
        /// Write data address of IN endpoint 3.
        USB_SERIAL_JTAG_IN_EP3_WR_ADDR: u7,
        /// Read data address of IN endpoint 3.
        USB_SERIAL_JTAG_IN_EP3_RD_ADDR: u7,
        padding: u16 = 0,
    }),
    /// Control OUT endpoint status information.
    /// offset: 0x38
    OUT_EP0_ST: mmio.Mmio(packed struct(u32) {
        /// State of OUT Endpoint 0.
        USB_SERIAL_JTAG_OUT_EP0_STATE: u2,
        /// Write data address of OUT endpoint 0. When USB_DEVICE_SERIAL_OUT_RECV_PKT_INT is detected, there are USB_DEVICE_OUT_EP0_WR_ADDR-2 bytes data in OUT EP0.
        USB_SERIAL_JTAG_OUT_EP0_WR_ADDR: u7,
        /// Read data address of OUT endpoint 0.
        USB_SERIAL_JTAG_OUT_EP0_RD_ADDR: u7,
        padding: u16 = 0,
    }),
    /// CDC-ACM OUT endpoint status information.
    /// offset: 0x3c
    OUT_EP1_ST: mmio.Mmio(packed struct(u32) {
        /// State of OUT Endpoint 1.
        USB_SERIAL_JTAG_OUT_EP1_STATE: u2,
        /// Write data address of OUT endpoint 1. When USB_DEVICE_SERIAL_OUT_RECV_PKT_INT is detected, there are USB_DEVICE_OUT_EP1_WR_ADDR-2 bytes data in OUT EP1.
        USB_SERIAL_JTAG_OUT_EP1_WR_ADDR: u7,
        /// Read data address of OUT endpoint 1.
        USB_SERIAL_JTAG_OUT_EP1_RD_ADDR: u7,
        /// Data count in OUT endpoint 1 when one packet is received.
        USB_SERIAL_JTAG_OUT_EP1_REC_DATA_CNT: u7,
        padding: u9 = 0,
    }),
    /// JTAG OUT endpoint status information.
    /// offset: 0x40
    OUT_EP2_ST: mmio.Mmio(packed struct(u32) {
        /// State of OUT Endpoint 2.
        USB_SERIAL_JTAG_OUT_EP2_STATE: u2,
        /// Write data address of OUT endpoint 2. When USB_DEVICE_SERIAL_OUT_RECV_PKT_INT is detected, there are USB_DEVICE_OUT_EP2_WR_ADDR-2 bytes data in OUT EP2.
        USB_SERIAL_JTAG_OUT_EP2_WR_ADDR: u7,
        /// Read data address of OUT endpoint 2.
        USB_SERIAL_JTAG_OUT_EP2_RD_ADDR: u7,
        padding: u16 = 0,
    }),
    /// Clock enable control
    /// offset: 0x44
    MISC_CONF: mmio.Mmio(packed struct(u32) {
        /// 1'h1: Force clock on for register. 1'h0: Support clock only when application writes registers.
        USB_SERIAL_JTAG_CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// Memory power control
    /// offset: 0x48
    MEM_CONF: mmio.Mmio(packed struct(u32) {
        /// 1: power down usb memory.
        USB_SERIAL_JTAG_USB_MEM_PD: u1,
        /// 1: Force clock on for usb memory.
        USB_SERIAL_JTAG_USB_MEM_CLK_EN: u1,
        padding: u30 = 0,
    }),
    /// CDC-ACM chip reset control.
    /// offset: 0x4c
    CHIP_RST: mmio.Mmio(packed struct(u32) {
        /// 1: Chip reset is detected from usb serial channel. Software write 1 to clear it.
        USB_SERIAL_JTAG_RTS: u1,
        /// 1: Chip reset is detected from usb jtag channel. Software write 1 to clear it.
        USB_SERIAL_JTAG_DTR: u1,
        /// Set this bit to disable chip reset from usb serial channel to reset chip.
        USB_SERIAL_JTAG_USB_UART_CHIP_RST_DIS: u1,
        padding: u29 = 0,
    }),
    /// W0 of SET_LINE_CODING command.
    /// offset: 0x50
    SET_LINE_CODE_W0: mmio.Mmio(packed struct(u32) {
        /// The value of dwDTERate set by host through SET_LINE_CODING command.
        USB_SERIAL_JTAG_DW_DTE_RATE: u32,
    }),
    /// W1 of SET_LINE_CODING command.
    /// offset: 0x54
    SET_LINE_CODE_W1: mmio.Mmio(packed struct(u32) {
        /// The value of bCharFormat set by host through SET_LINE_CODING command.
        USB_SERIAL_JTAG_BCHAR_FORMAT: u8,
        /// The value of bParityTpye set by host through SET_LINE_CODING command.
        USB_SERIAL_JTAG_BPARITY_TYPE: u8,
        /// The value of bDataBits set by host through SET_LINE_CODING command.
        USB_SERIAL_JTAG_BDATA_BITS: u8,
        padding: u8 = 0,
    }),
    /// W0 of GET_LINE_CODING command.
    /// offset: 0x58
    GET_LINE_CODE_W0: mmio.Mmio(packed struct(u32) {
        /// The value of dwDTERate set by software which is requested by GET_LINE_CODING command.
        USB_SERIAL_JTAG_GET_DW_DTE_RATE: u32,
    }),
    /// W1 of GET_LINE_CODING command.
    /// offset: 0x5c
    GET_LINE_CODE_W1: mmio.Mmio(packed struct(u32) {
        /// The value of bCharFormat set by software which is requested by GET_LINE_CODING command.
        USB_SERIAL_JTAG_GET_BDATA_BITS: u8,
        /// The value of bParityTpye set by software which is requested by GET_LINE_CODING command.
        USB_SERIAL_JTAG_GET_BPARITY_TYPE: u8,
        /// The value of bDataBits set by software which is requested by GET_LINE_CODING command.
        USB_SERIAL_JTAG_GET_BCHAR_FORMAT: u8,
        padding: u8 = 0,
    }),
    /// Configuration registers' value update
    /// offset: 0x60
    CONFIG_UPDATE: mmio.Mmio(packed struct(u32) {
        /// Write 1 to this register would update the value of configure registers from APB clock domain to 48MHz clock domain.
        USB_SERIAL_JTAG_CONFIG_UPDATE: u1,
        padding: u31 = 0,
    }),
    /// Serial AFIFO configure register
    /// offset: 0x64
    SER_AFIFO_CONFIG: mmio.Mmio(packed struct(u32) {
        /// Write 1 to reset CDC_ACM IN async FIFO write clock domain.
        USB_SERIAL_JTAG_SERIAL_IN_AFIFO_RESET_WR: u1,
        /// Write 1 to reset CDC_ACM IN async FIFO read clock domain.
        USB_SERIAL_JTAG_SERIAL_IN_AFIFO_RESET_RD: u1,
        /// Write 1 to reset CDC_ACM OUT async FIFO write clock domain.
        USB_SERIAL_JTAG_SERIAL_OUT_AFIFO_RESET_WR: u1,
        /// Write 1 to reset CDC_ACM OUT async FIFO read clock domain.
        USB_SERIAL_JTAG_SERIAL_OUT_AFIFO_RESET_RD: u1,
        /// CDC_ACM OUTOUT async FIFO empty signal in read clock domain.
        USB_SERIAL_JTAG_SERIAL_OUT_AFIFO_REMPTY: u1,
        /// CDC_ACM OUT IN async FIFO empty signal in write clock domain.
        USB_SERIAL_JTAG_SERIAL_IN_AFIFO_WFULL: u1,
        padding: u26 = 0,
    }),
    /// USB Bus reset status register
    /// offset: 0x68
    BUS_RESET_ST: mmio.Mmio(packed struct(u32) {
        /// USB bus reset status. 0: USB-Serial-JTAG is in usb bus reset status. 1: USB bus reset is released.
        USB_SERIAL_JTAG_USB_BUS_RESET_ST: u1,
        padding: u31 = 0,
    }),
    /// Reserved.
    /// offset: 0x6c
    ECO_LOW_48: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        USB_SERIAL_JTAG_RND_ECO_LOW_48: u32,
    }),
    /// Reserved.
    /// offset: 0x70
    ECO_HIGH_48: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        USB_SERIAL_JTAG_RND_ECO_HIGH_48: u32,
    }),
    /// Reserved.
    /// offset: 0x74
    ECO_CELL_CTRL_48: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        USB_SERIAL_JTAG_RDN_RESULT_48: u1,
        /// Reserved.
        USB_SERIAL_JTAG_RDN_ENA_48: u1,
        padding: u30 = 0,
    }),
    /// Reserved.
    /// offset: 0x78
    ECO_LOW_APB: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        USB_SERIAL_JTAG_RND_ECO_LOW_APB: u32,
    }),
    /// Reserved.
    /// offset: 0x7c
    ECO_HIGH_APB: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        USB_SERIAL_JTAG_RND_ECO_HIGH_APB: u32,
    }),
    /// Reserved.
    /// offset: 0x80
    ECO_CELL_CTRL_APB: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        USB_SERIAL_JTAG_RDN_RESULT_APB: u1,
        /// Reserved.
        USB_SERIAL_JTAG_RDN_ENA_APB: u1,
        padding: u30 = 0,
    }),
    /// PPA SRAM Control Register
    /// offset: 0x84
    SRAM_CTRL: mmio.Mmio(packed struct(u32) {
        /// Control signals
        USB_SERIAL_JTAG_MEM_AUX_CTRL: u14,
        padding: u18 = 0,
    }),
    /// Date register
    /// offset: 0x88
    DATE: mmio.Mmio(packed struct(u32) {
        /// register version.
        USB_SERIAL_JTAG_DATE: u32,
    }),
};
