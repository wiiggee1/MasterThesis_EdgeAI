const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Remote Control
pub const RMT = extern struct {
    /// The read and write data register for CHANNEL%s by apb fifo access.
    /// offset: 0x00
    TX_CH0DATA: mmio.Mmio(packed struct(u32) {
        /// Read and write data for channel %s via APB FIFO.
        CHDATA: u32,
    }),
    /// The read and write data register for CHANNEL%s by apb fifo access.
    /// offset: 0x04
    TX_CH1DATA: mmio.Mmio(packed struct(u32) {
        /// Read and write data for channel %s via APB FIFO.
        CHDATA: u32,
    }),
    /// The read and write data register for CHANNEL%s by apb fifo access.
    /// offset: 0x08
    TX_CH2DATA: mmio.Mmio(packed struct(u32) {
        /// Read and write data for channel %s via APB FIFO.
        CHDATA: u32,
    }),
    /// The read and write data register for CHANNEL%s by apb fifo access.
    /// offset: 0x0c
    TX_CH3DATA: mmio.Mmio(packed struct(u32) {
        /// Read and write data for channel %s via APB FIFO.
        CHDATA: u32,
    }),
    /// The read and write data register for CHANNEL$n by apb fifo access.
    /// offset: 0x10
    RX_CH0DATA: mmio.Mmio(packed struct(u32) {
        /// Read and write data for channel 0 via APB FIFO.
        CHDATA: u32,
    }),
    /// The read and write data register for CHANNEL$n by apb fifo access.
    /// offset: 0x14
    RX_CH1DATA: mmio.Mmio(packed struct(u32) {
        /// Read and write data for channel 0 via APB FIFO.
        CHDATA: u32,
    }),
    /// The read and write data register for CHANNEL$n by apb fifo access.
    /// offset: 0x18
    RX_CH2DATA: mmio.Mmio(packed struct(u32) {
        /// Read and write data for channel 0 via APB FIFO.
        CHDATA: u32,
    }),
    /// The read and write data register for CHANNEL$n by apb fifo access.
    /// offset: 0x1c
    RX_CH3DATA: mmio.Mmio(packed struct(u32) {
        /// Read and write data for channel 0 via APB FIFO.
        CHDATA: u32,
    }),
    /// Channel %s configure register 0
    /// offset: 0x20
    TX_CH0CONF0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to start sending data on CHANNEL%s.
        TX_START_CH0: u1,
        /// Set this bit to reset read ram address for CHANNEL%s by accessing transmitter.
        MEM_RD_RST_CH0: u1,
        /// Set this bit to reset W/R ram address for CHANNEL%s by accessing apb fifo.
        APB_MEM_RST_CH0: u1,
        /// Set this bit to restart transmission from the first data to the last data in CHANNEL%s.
        TX_CONTI_MODE_CH0: u1,
        /// This is the channel %s enable bit for wraparound mode: it will resume sending at the start when the data to be sent is more than its memory size.
        MEM_TX_WRAP_EN_CH0: u1,
        /// This bit configures the level of output signal in CHANNEL%s when the latter is in IDLE state.
        IDLE_OUT_LV_CH0: u1,
        /// This is the output enable-control bit for CHANNEL%s in IDLE state.
        IDLE_OUT_EN_CH0: u1,
        /// Set this bit to stop the transmitter of CHANNEL%s sending data out.
        TX_STOP_CH0: u1,
        /// This register is used to configure the divider for clock of CHANNEL%s.
        DIV_CNT_CH0: u8,
        /// This register is used to configure the maximum size of memory allocated to CHANNEL%s.
        MEM_SIZE_CH0: u4,
        /// 1: Add carrier modulation on the output signal only at the send data state for CHANNEL%s. 0: Add carrier modulation on the output signal at all state for CHANNEL%s. Only valid when RMT_CARRIER_EN_CH%s is 1.
        CARRIER_EFF_EN_CH0: u1,
        /// This is the carrier modulation enable-control bit for CHANNEL%s. 1: Add carrier modulation in the output signal. 0: No carrier modulation in sig_out.
        CARRIER_EN_CH0: u1,
        /// This bit is used to configure the position of carrier wave for CHANNEL%s.1'h0: add carrier wave on low level.1'h1: add carrier wave on high level.
        CARRIER_OUT_LV_CH0: u1,
        /// Reserved
        AFIFO_RST_CH0: u1,
        /// synchronization bit for CHANNEL%s
        CONF_UPDATE_CH0: u1,
        padding: u7 = 0,
    }),
    /// Channel %s configure register 0
    /// offset: 0x24
    TX_CH1CONF0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to start sending data on CHANNEL%s.
        TX_START_CH0: u1,
        /// Set this bit to reset read ram address for CHANNEL%s by accessing transmitter.
        MEM_RD_RST_CH0: u1,
        /// Set this bit to reset W/R ram address for CHANNEL%s by accessing apb fifo.
        APB_MEM_RST_CH0: u1,
        /// Set this bit to restart transmission from the first data to the last data in CHANNEL%s.
        TX_CONTI_MODE_CH0: u1,
        /// This is the channel %s enable bit for wraparound mode: it will resume sending at the start when the data to be sent is more than its memory size.
        MEM_TX_WRAP_EN_CH0: u1,
        /// This bit configures the level of output signal in CHANNEL%s when the latter is in IDLE state.
        IDLE_OUT_LV_CH0: u1,
        /// This is the output enable-control bit for CHANNEL%s in IDLE state.
        IDLE_OUT_EN_CH0: u1,
        /// Set this bit to stop the transmitter of CHANNEL%s sending data out.
        TX_STOP_CH0: u1,
        /// This register is used to configure the divider for clock of CHANNEL%s.
        DIV_CNT_CH0: u8,
        /// This register is used to configure the maximum size of memory allocated to CHANNEL%s.
        MEM_SIZE_CH0: u4,
        /// 1: Add carrier modulation on the output signal only at the send data state for CHANNEL%s. 0: Add carrier modulation on the output signal at all state for CHANNEL%s. Only valid when RMT_CARRIER_EN_CH%s is 1.
        CARRIER_EFF_EN_CH0: u1,
        /// This is the carrier modulation enable-control bit for CHANNEL%s. 1: Add carrier modulation in the output signal. 0: No carrier modulation in sig_out.
        CARRIER_EN_CH0: u1,
        /// This bit is used to configure the position of carrier wave for CHANNEL%s.1'h0: add carrier wave on low level.1'h1: add carrier wave on high level.
        CARRIER_OUT_LV_CH0: u1,
        /// Reserved
        AFIFO_RST_CH0: u1,
        /// synchronization bit for CHANNEL%s
        CONF_UPDATE_CH0: u1,
        padding: u7 = 0,
    }),
    /// Channel %s configure register 0
    /// offset: 0x28
    TX_CH2CONF0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to start sending data on CHANNEL%s.
        TX_START_CH0: u1,
        /// Set this bit to reset read ram address for CHANNEL%s by accessing transmitter.
        MEM_RD_RST_CH0: u1,
        /// Set this bit to reset W/R ram address for CHANNEL%s by accessing apb fifo.
        APB_MEM_RST_CH0: u1,
        /// Set this bit to restart transmission from the first data to the last data in CHANNEL%s.
        TX_CONTI_MODE_CH0: u1,
        /// This is the channel %s enable bit for wraparound mode: it will resume sending at the start when the data to be sent is more than its memory size.
        MEM_TX_WRAP_EN_CH0: u1,
        /// This bit configures the level of output signal in CHANNEL%s when the latter is in IDLE state.
        IDLE_OUT_LV_CH0: u1,
        /// This is the output enable-control bit for CHANNEL%s in IDLE state.
        IDLE_OUT_EN_CH0: u1,
        /// Set this bit to stop the transmitter of CHANNEL%s sending data out.
        TX_STOP_CH0: u1,
        /// This register is used to configure the divider for clock of CHANNEL%s.
        DIV_CNT_CH0: u8,
        /// This register is used to configure the maximum size of memory allocated to CHANNEL%s.
        MEM_SIZE_CH0: u4,
        /// 1: Add carrier modulation on the output signal only at the send data state for CHANNEL%s. 0: Add carrier modulation on the output signal at all state for CHANNEL%s. Only valid when RMT_CARRIER_EN_CH%s is 1.
        CARRIER_EFF_EN_CH0: u1,
        /// This is the carrier modulation enable-control bit for CHANNEL%s. 1: Add carrier modulation in the output signal. 0: No carrier modulation in sig_out.
        CARRIER_EN_CH0: u1,
        /// This bit is used to configure the position of carrier wave for CHANNEL%s.1'h0: add carrier wave on low level.1'h1: add carrier wave on high level.
        CARRIER_OUT_LV_CH0: u1,
        /// Reserved
        AFIFO_RST_CH0: u1,
        /// synchronization bit for CHANNEL%s
        CONF_UPDATE_CH0: u1,
        padding: u7 = 0,
    }),
    /// Channel %s configure register 0
    /// offset: 0x2c
    TX_CH3CONF0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to start sending data on CHANNEL%s.
        TX_START_CH0: u1,
        /// Set this bit to reset read ram address for CHANNEL%s by accessing transmitter.
        MEM_RD_RST_CH0: u1,
        /// Set this bit to reset W/R ram address for CHANNEL%s by accessing apb fifo.
        APB_MEM_RST_CH0: u1,
        /// Set this bit to restart transmission from the first data to the last data in CHANNEL%s.
        TX_CONTI_MODE_CH0: u1,
        /// This is the channel %s enable bit for wraparound mode: it will resume sending at the start when the data to be sent is more than its memory size.
        MEM_TX_WRAP_EN_CH0: u1,
        /// This bit configures the level of output signal in CHANNEL%s when the latter is in IDLE state.
        IDLE_OUT_LV_CH0: u1,
        /// This is the output enable-control bit for CHANNEL%s in IDLE state.
        IDLE_OUT_EN_CH0: u1,
        /// Set this bit to stop the transmitter of CHANNEL%s sending data out.
        TX_STOP_CH0: u1,
        /// This register is used to configure the divider for clock of CHANNEL%s.
        DIV_CNT_CH0: u8,
        /// This register is used to configure the maximum size of memory allocated to CHANNEL%s.
        MEM_SIZE_CH0: u4,
        /// 1: Add carrier modulation on the output signal only at the send data state for CHANNEL%s. 0: Add carrier modulation on the output signal at all state for CHANNEL%s. Only valid when RMT_CARRIER_EN_CH%s is 1.
        CARRIER_EFF_EN_CH0: u1,
        /// This is the carrier modulation enable-control bit for CHANNEL%s. 1: Add carrier modulation in the output signal. 0: No carrier modulation in sig_out.
        CARRIER_EN_CH0: u1,
        /// This bit is used to configure the position of carrier wave for CHANNEL%s.1'h0: add carrier wave on low level.1'h1: add carrier wave on high level.
        CARRIER_OUT_LV_CH0: u1,
        /// Reserved
        AFIFO_RST_CH0: u1,
        /// synchronization bit for CHANNEL%s
        CONF_UPDATE_CH0: u1,
        padding: u7 = 0,
    }),
    /// Channel %s configure register 0
    /// offset: 0x30
    RX_CH0CONF0: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the divider for clock of CHANNEL%s.
        DIV_CNT_CH4: u8,
        /// When no edge is detected on the input signal and continuous clock cycles is longer than this register value, received process is finished.
        IDLE_THRES_CH4: u15,
        reserved24: u1 = 0,
        /// This register is used to configure the maximum size of memory allocated to CHANNEL%s.
        MEM_SIZE_CH4: u4,
        /// This is the carrier modulation enable-control bit for CHANNEL%s. 1: Add carrier modulation in the output signal. 0: No carrier modulation in sig_out.
        CARRIER_EN_CH4: u1,
        /// This bit is used to configure the position of carrier wave for CHANNEL%s.1'h0: add carrier wave on low level.1'h1: add carrier wave on high level.
        CARRIER_OUT_LV_CH4: u1,
        padding: u2 = 0,
    }),
    /// Channel %s configure register 1
    /// offset: 0x34
    RX_CH0CONF1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable receiver to receive data on CHANNEL%s.
        RX_EN_CH4: u1,
        /// Set this bit to reset write ram address for CHANNEL%s by accessing receiver.
        MEM_WR_RST_CH4: u1,
        /// Set this bit to reset W/R ram address for CHANNEL%s by accessing apb fifo.
        APB_MEM_RST_CH4: u1,
        /// This register marks the ownership of CHANNEL%s's ram block.1'h1: Receiver is using the ram. 1'h0: APB bus is using the ram.
        MEM_OWNER_CH4: u1,
        /// This is the receive filter's enable bit for CHANNEL%s.
        RX_FILTER_EN_CH4: u1,
        /// Ignores the input pulse when its width is smaller than this register value in APB clock periods (in receive mode).
        RX_FILTER_THRES_CH4: u8,
        /// This is the channel %s enable bit for wraparound mode: it will resume receiving at the start when the data to be received is more than its memory size.
        MEM_RX_WRAP_EN_CH4: u1,
        /// Reserved
        AFIFO_RST_CH4: u1,
        /// synchronization bit for CHANNEL%s
        CONF_UPDATE_CH4: u1,
        padding: u16 = 0,
    }),
    /// Channel %s configure register 0
    /// offset: 0x38
    RX_CH1CONF0: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the divider for clock of CHANNEL%s.
        DIV_CNT_CH4: u8,
        /// When no edge is detected on the input signal and continuous clock cycles is longer than this register value, received process is finished.
        IDLE_THRES_CH4: u15,
        reserved24: u1 = 0,
        /// This register is used to configure the maximum size of memory allocated to CHANNEL%s.
        MEM_SIZE_CH4: u4,
        /// This is the carrier modulation enable-control bit for CHANNEL%s. 1: Add carrier modulation in the output signal. 0: No carrier modulation in sig_out.
        CARRIER_EN_CH4: u1,
        /// This bit is used to configure the position of carrier wave for CHANNEL%s.1'h0: add carrier wave on low level.1'h1: add carrier wave on high level.
        CARRIER_OUT_LV_CH4: u1,
        padding: u2 = 0,
    }),
    /// Channel %s configure register 1
    /// offset: 0x3c
    RX_CH1CONF1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable receiver to receive data on CHANNEL%s.
        RX_EN_CH4: u1,
        /// Set this bit to reset write ram address for CHANNEL%s by accessing receiver.
        MEM_WR_RST_CH4: u1,
        /// Set this bit to reset W/R ram address for CHANNEL%s by accessing apb fifo.
        APB_MEM_RST_CH4: u1,
        /// This register marks the ownership of CHANNEL%s's ram block.1'h1: Receiver is using the ram. 1'h0: APB bus is using the ram.
        MEM_OWNER_CH4: u1,
        /// This is the receive filter's enable bit for CHANNEL%s.
        RX_FILTER_EN_CH4: u1,
        /// Ignores the input pulse when its width is smaller than this register value in APB clock periods (in receive mode).
        RX_FILTER_THRES_CH4: u8,
        /// This is the channel %s enable bit for wraparound mode: it will resume receiving at the start when the data to be received is more than its memory size.
        MEM_RX_WRAP_EN_CH4: u1,
        /// Reserved
        AFIFO_RST_CH4: u1,
        /// synchronization bit for CHANNEL%s
        CONF_UPDATE_CH4: u1,
        padding: u16 = 0,
    }),
    /// Channel %s configure register 0
    /// offset: 0x40
    RX_CH2CONF0: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the divider for clock of CHANNEL%s.
        DIV_CNT_CH4: u8,
        /// When no edge is detected on the input signal and continuous clock cycles is longer than this register value, received process is finished.
        IDLE_THRES_CH4: u15,
        reserved24: u1 = 0,
        /// This register is used to configure the maximum size of memory allocated to CHANNEL%s.
        MEM_SIZE_CH4: u4,
        /// This is the carrier modulation enable-control bit for CHANNEL%s. 1: Add carrier modulation in the output signal. 0: No carrier modulation in sig_out.
        CARRIER_EN_CH4: u1,
        /// This bit is used to configure the position of carrier wave for CHANNEL%s.1'h0: add carrier wave on low level.1'h1: add carrier wave on high level.
        CARRIER_OUT_LV_CH4: u1,
        padding: u2 = 0,
    }),
    /// Channel %s configure register 1
    /// offset: 0x44
    RX_CH2CONF1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable receiver to receive data on CHANNEL%s.
        RX_EN_CH4: u1,
        /// Set this bit to reset write ram address for CHANNEL%s by accessing receiver.
        MEM_WR_RST_CH4: u1,
        /// Set this bit to reset W/R ram address for CHANNEL%s by accessing apb fifo.
        APB_MEM_RST_CH4: u1,
        /// This register marks the ownership of CHANNEL%s's ram block.1'h1: Receiver is using the ram. 1'h0: APB bus is using the ram.
        MEM_OWNER_CH4: u1,
        /// This is the receive filter's enable bit for CHANNEL%s.
        RX_FILTER_EN_CH4: u1,
        /// Ignores the input pulse when its width is smaller than this register value in APB clock periods (in receive mode).
        RX_FILTER_THRES_CH4: u8,
        /// This is the channel %s enable bit for wraparound mode: it will resume receiving at the start when the data to be received is more than its memory size.
        MEM_RX_WRAP_EN_CH4: u1,
        /// Reserved
        AFIFO_RST_CH4: u1,
        /// synchronization bit for CHANNEL%s
        CONF_UPDATE_CH4: u1,
        padding: u16 = 0,
    }),
    /// Channel %s configure register 0
    /// offset: 0x48
    RX_CH3CONF0: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the divider for clock of CHANNEL%s.
        DIV_CNT_CH4: u8,
        /// When no edge is detected on the input signal and continuous clock cycles is longer than this register value, received process is finished.
        IDLE_THRES_CH4: u15,
        reserved24: u1 = 0,
        /// This register is used to configure the maximum size of memory allocated to CHANNEL%s.
        MEM_SIZE_CH4: u4,
        /// This is the carrier modulation enable-control bit for CHANNEL%s. 1: Add carrier modulation in the output signal. 0: No carrier modulation in sig_out.
        CARRIER_EN_CH4: u1,
        /// This bit is used to configure the position of carrier wave for CHANNEL%s.1'h0: add carrier wave on low level.1'h1: add carrier wave on high level.
        CARRIER_OUT_LV_CH4: u1,
        padding: u2 = 0,
    }),
    /// Channel %s configure register 1
    /// offset: 0x4c
    RX_CH3CONF1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable receiver to receive data on CHANNEL%s.
        RX_EN_CH4: u1,
        /// Set this bit to reset write ram address for CHANNEL%s by accessing receiver.
        MEM_WR_RST_CH4: u1,
        /// Set this bit to reset W/R ram address for CHANNEL%s by accessing apb fifo.
        APB_MEM_RST_CH4: u1,
        /// This register marks the ownership of CHANNEL%s's ram block.1'h1: Receiver is using the ram. 1'h0: APB bus is using the ram.
        MEM_OWNER_CH4: u1,
        /// This is the receive filter's enable bit for CHANNEL%s.
        RX_FILTER_EN_CH4: u1,
        /// Ignores the input pulse when its width is smaller than this register value in APB clock periods (in receive mode).
        RX_FILTER_THRES_CH4: u8,
        /// This is the channel %s enable bit for wraparound mode: it will resume receiving at the start when the data to be received is more than its memory size.
        MEM_RX_WRAP_EN_CH4: u1,
        /// Reserved
        AFIFO_RST_CH4: u1,
        /// synchronization bit for CHANNEL%s
        CONF_UPDATE_CH4: u1,
        padding: u16 = 0,
    }),
    /// Channel %s status register
    /// offset: 0x50
    TX_CH0STATUS: mmio.Mmio(packed struct(u32) {
        /// This register records the memory address offset when transmitter of CHANNEL%s is using the RAM.
        MEM_RADDR_EX_CH0: u10,
        reserved11: u1 = 0,
        /// This register records the memory address offset when writes RAM over APB bus.
        APB_MEM_WADDR_CH0: u10,
        reserved22: u1 = 0,
        /// This register records the FSM status of CHANNEL%s.
        STATE_CH0: u3,
        /// This status bit will be set when the data to be set is more than memory size and the wraparound mode is disabled.
        MEM_EMPTY_CH0: u1,
        /// This status bit will be set if the offset address out of memory size when writes via APB bus.
        APB_MEM_WR_ERR_CH0: u1,
        padding: u5 = 0,
    }),
    /// Channel %s status register
    /// offset: 0x54
    TX_CH1STATUS: mmio.Mmio(packed struct(u32) {
        /// This register records the memory address offset when transmitter of CHANNEL%s is using the RAM.
        MEM_RADDR_EX_CH0: u10,
        reserved11: u1 = 0,
        /// This register records the memory address offset when writes RAM over APB bus.
        APB_MEM_WADDR_CH0: u10,
        reserved22: u1 = 0,
        /// This register records the FSM status of CHANNEL%s.
        STATE_CH0: u3,
        /// This status bit will be set when the data to be set is more than memory size and the wraparound mode is disabled.
        MEM_EMPTY_CH0: u1,
        /// This status bit will be set if the offset address out of memory size when writes via APB bus.
        APB_MEM_WR_ERR_CH0: u1,
        padding: u5 = 0,
    }),
    /// Channel %s status register
    /// offset: 0x58
    TX_CH2STATUS: mmio.Mmio(packed struct(u32) {
        /// This register records the memory address offset when transmitter of CHANNEL%s is using the RAM.
        MEM_RADDR_EX_CH0: u10,
        reserved11: u1 = 0,
        /// This register records the memory address offset when writes RAM over APB bus.
        APB_MEM_WADDR_CH0: u10,
        reserved22: u1 = 0,
        /// This register records the FSM status of CHANNEL%s.
        STATE_CH0: u3,
        /// This status bit will be set when the data to be set is more than memory size and the wraparound mode is disabled.
        MEM_EMPTY_CH0: u1,
        /// This status bit will be set if the offset address out of memory size when writes via APB bus.
        APB_MEM_WR_ERR_CH0: u1,
        padding: u5 = 0,
    }),
    /// Channel %s status register
    /// offset: 0x5c
    TX_CH3STATUS: mmio.Mmio(packed struct(u32) {
        /// This register records the memory address offset when transmitter of CHANNEL%s is using the RAM.
        MEM_RADDR_EX_CH0: u10,
        reserved11: u1 = 0,
        /// This register records the memory address offset when writes RAM over APB bus.
        APB_MEM_WADDR_CH0: u10,
        reserved22: u1 = 0,
        /// This register records the FSM status of CHANNEL%s.
        STATE_CH0: u3,
        /// This status bit will be set when the data to be set is more than memory size and the wraparound mode is disabled.
        MEM_EMPTY_CH0: u1,
        /// This status bit will be set if the offset address out of memory size when writes via APB bus.
        APB_MEM_WR_ERR_CH0: u1,
        padding: u5 = 0,
    }),
    /// Channel %s status register
    /// offset: 0x60
    RX_CH0STATUS: mmio.Mmio(packed struct(u32) {
        /// This register records the memory address offset when receiver of CHANNEL%s is using the RAM.
        MEM_WADDR_EX_CH4: u10,
        reserved11: u1 = 0,
        /// This register records the memory address offset when reads RAM over APB bus.
        APB_MEM_RADDR_CH4: u10,
        reserved22: u1 = 0,
        /// This register records the FSM status of CHANNEL%s.
        STATE_CH4: u3,
        /// This status bit will be set when the ownership of memory block is wrong.
        MEM_OWNER_ERR_CH4: u1,
        /// This status bit will be set if the receiver receives more data than the memory size.
        MEM_FULL_CH4: u1,
        /// This status bit will be set if the offset address out of memory size when reads via APB bus.
        APB_MEM_RD_ERR_CH4: u1,
        padding: u4 = 0,
    }),
    /// Channel %s status register
    /// offset: 0x64
    RX_CH1STATUS: mmio.Mmio(packed struct(u32) {
        /// This register records the memory address offset when receiver of CHANNEL%s is using the RAM.
        MEM_WADDR_EX_CH4: u10,
        reserved11: u1 = 0,
        /// This register records the memory address offset when reads RAM over APB bus.
        APB_MEM_RADDR_CH4: u10,
        reserved22: u1 = 0,
        /// This register records the FSM status of CHANNEL%s.
        STATE_CH4: u3,
        /// This status bit will be set when the ownership of memory block is wrong.
        MEM_OWNER_ERR_CH4: u1,
        /// This status bit will be set if the receiver receives more data than the memory size.
        MEM_FULL_CH4: u1,
        /// This status bit will be set if the offset address out of memory size when reads via APB bus.
        APB_MEM_RD_ERR_CH4: u1,
        padding: u4 = 0,
    }),
    /// Channel %s status register
    /// offset: 0x68
    RX_CH2STATUS: mmio.Mmio(packed struct(u32) {
        /// This register records the memory address offset when receiver of CHANNEL%s is using the RAM.
        MEM_WADDR_EX_CH4: u10,
        reserved11: u1 = 0,
        /// This register records the memory address offset when reads RAM over APB bus.
        APB_MEM_RADDR_CH4: u10,
        reserved22: u1 = 0,
        /// This register records the FSM status of CHANNEL%s.
        STATE_CH4: u3,
        /// This status bit will be set when the ownership of memory block is wrong.
        MEM_OWNER_ERR_CH4: u1,
        /// This status bit will be set if the receiver receives more data than the memory size.
        MEM_FULL_CH4: u1,
        /// This status bit will be set if the offset address out of memory size when reads via APB bus.
        APB_MEM_RD_ERR_CH4: u1,
        padding: u4 = 0,
    }),
    /// Channel %s status register
    /// offset: 0x6c
    RX_CH3STATUS: mmio.Mmio(packed struct(u32) {
        /// This register records the memory address offset when receiver of CHANNEL%s is using the RAM.
        MEM_WADDR_EX_CH4: u10,
        reserved11: u1 = 0,
        /// This register records the memory address offset when reads RAM over APB bus.
        APB_MEM_RADDR_CH4: u10,
        reserved22: u1 = 0,
        /// This register records the FSM status of CHANNEL%s.
        STATE_CH4: u3,
        /// This status bit will be set when the ownership of memory block is wrong.
        MEM_OWNER_ERR_CH4: u1,
        /// This status bit will be set if the receiver receives more data than the memory size.
        MEM_FULL_CH4: u1,
        /// This status bit will be set if the offset address out of memory size when reads via APB bus.
        APB_MEM_RD_ERR_CH4: u1,
        padding: u4 = 0,
    }),
    /// Raw interrupt status
    /// offset: 0x70
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The interrupt raw bit for CHANNEL0. Triggered when transmission done.
        CH0_TX_END_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL1. Triggered when transmission done.
        CH1_TX_END_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL2. Triggered when transmission done.
        CH2_TX_END_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL3. Triggered when transmission done.
        CH3_TX_END_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL0. Triggered when error occurs.
        TX_CH0_ERR_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL1. Triggered when error occurs.
        TX_CH1_ERR_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL2. Triggered when error occurs.
        TX_CH2_ERR_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL3. Triggered when error occurs.
        TX_CH3_ERR_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL0. Triggered when transmitter sent more data than configured value.
        CH0_TX_THR_EVENT_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL1. Triggered when transmitter sent more data than configured value.
        CH1_TX_THR_EVENT_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL2. Triggered when transmitter sent more data than configured value.
        CH2_TX_THR_EVENT_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL3. Triggered when transmitter sent more data than configured value.
        CH3_TX_THR_EVENT_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL0. Triggered when the loop count reaches the configured threshold value.
        CH0_TX_LOOP_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL1. Triggered when the loop count reaches the configured threshold value.
        CH1_TX_LOOP_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL2. Triggered when the loop count reaches the configured threshold value.
        CH2_TX_LOOP_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL3. Triggered when the loop count reaches the configured threshold value.
        CH3_TX_LOOP_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL4. Triggered when reception done.
        CH4_RX_END_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL5. Triggered when reception done.
        CH5_RX_END_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL6. Triggered when reception done.
        CH6_RX_END_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL7. Triggered when reception done.
        CH7_RX_END_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL4. Triggered when error occurs.
        RX_CH4_ERR_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL5. Triggered when error occurs.
        RX_CH5_ERR_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL6. Triggered when error occurs.
        RX_CH6_ERR_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL7. Triggered when error occurs.
        RX_CH7_ERR_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL4. Triggered when receiver receive more data than configured value.
        CH4_RX_THR_EVENT_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL5. Triggered when receiver receive more data than configured value.
        CH5_RX_THR_EVENT_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL6. Triggered when receiver receive more data than configured value.
        CH6_RX_THR_EVENT_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL7. Triggered when receiver receive more data than configured value.
        CH7_RX_THR_EVENT_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL3. Triggered when dma accessing CHANNEL3 fails.
        TX_CH3_DMA_ACCESS_FAIL_INT_RAW: u1,
        /// The interrupt raw bit for CHANNEL7. Triggered when dma accessing CHANNEL7 fails.
        RX_CH7_DMA_ACCESS_FAIL_INT_RAW: u1,
        padding: u2 = 0,
    }),
    /// Masked interrupt status
    /// offset: 0x74
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// The masked interrupt status bit for CH0_TX_END_INT.
        CH0_TX_END_INT_ST: u1,
        /// The masked interrupt status bit for CH1_TX_END_INT.
        CH1_TX_END_INT_ST: u1,
        /// The masked interrupt status bit for CH2_TX_END_INT.
        CH2_TX_END_INT_ST: u1,
        /// The masked interrupt status bit for CH3_TX_END_INT.
        CH3_TX_END_INT_ST: u1,
        /// The masked interrupt status bit for CH0_ERR_INT.
        TX_CH0_ERR_INT_ST: u1,
        /// The masked interrupt status bit for CH1_ERR_INT.
        TX_CH1_ERR_INT_ST: u1,
        /// The masked interrupt status bit for CH2_ERR_INT.
        TX_CH2_ERR_INT_ST: u1,
        /// The masked interrupt status bit for CH3_ERR_INT.
        TX_CH3_ERR_INT_ST: u1,
        /// The masked interrupt status bit for CH0_TX_THR_EVENT_INT.
        CH0_TX_THR_EVENT_INT_ST: u1,
        /// The masked interrupt status bit for CH1_TX_THR_EVENT_INT.
        CH1_TX_THR_EVENT_INT_ST: u1,
        /// The masked interrupt status bit for CH2_TX_THR_EVENT_INT.
        CH2_TX_THR_EVENT_INT_ST: u1,
        /// The masked interrupt status bit for CH3_TX_THR_EVENT_INT.
        CH3_TX_THR_EVENT_INT_ST: u1,
        /// The masked interrupt status bit for CH0_TX_LOOP_INT.
        CH0_TX_LOOP_INT_ST: u1,
        /// The masked interrupt status bit for CH1_TX_LOOP_INT.
        CH1_TX_LOOP_INT_ST: u1,
        /// The masked interrupt status bit for CH2_TX_LOOP_INT.
        CH2_TX_LOOP_INT_ST: u1,
        /// The masked interrupt status bit for CH3_TX_LOOP_INT.
        CH3_TX_LOOP_INT_ST: u1,
        /// The masked interrupt status bit for CH4_RX_END_INT.
        CH4_RX_END_INT_ST: u1,
        /// The masked interrupt status bit for CH5_RX_END_INT.
        CH5_RX_END_INT_ST: u1,
        /// The masked interrupt status bit for CH6_RX_END_INT.
        CH6_RX_END_INT_ST: u1,
        /// The masked interrupt status bit for CH7_RX_END_INT.
        CH7_RX_END_INT_ST: u1,
        /// The masked interrupt status bit for CH4_ERR_INT.
        RX_CH4_ERR_INT_ST: u1,
        /// The masked interrupt status bit for CH5_ERR_INT.
        RX_CH5_ERR_INT_ST: u1,
        /// The masked interrupt status bit for CH6_ERR_INT.
        RX_CH6_ERR_INT_ST: u1,
        /// The masked interrupt status bit for CH7_ERR_INT.
        RX_CH7_ERR_INT_ST: u1,
        /// The masked interrupt status bit for CH4_RX_THR_EVENT_INT.
        CH4_RX_THR_EVENT_INT_ST: u1,
        /// The masked interrupt status bit for CH5_RX_THR_EVENT_INT.
        CH5_RX_THR_EVENT_INT_ST: u1,
        /// The masked interrupt status bit for CH6_RX_THR_EVENT_INT.
        CH6_RX_THR_EVENT_INT_ST: u1,
        /// The masked interrupt status bit for CH7_RX_THR_EVENT_INT.
        CH7_RX_THR_EVENT_INT_ST: u1,
        /// The masked interrupt status bit for CH3_DMA_ACCESS_FAIL_INT.
        TX_CH3_DMA_ACCESS_FAIL_INT_ST: u1,
        /// The masked interrupt status bit for CH7_DMA_ACCESS_FAIL_INT.
        RX_CH7_DMA_ACCESS_FAIL_INT_ST: u1,
        padding: u2 = 0,
    }),
    /// Interrupt enable bits
    /// offset: 0x78
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for CH0_TX_END_INT.
        CH0_TX_END_INT_ENA: u1,
        /// The interrupt enable bit for CH1_TX_END_INT.
        CH1_TX_END_INT_ENA: u1,
        /// The interrupt enable bit for CH2_TX_END_INT.
        CH2_TX_END_INT_ENA: u1,
        /// The interrupt enable bit for CH3_TX_END_INT.
        CH3_TX_END_INT_ENA: u1,
        /// The interrupt enable bit for CH0_ERR_INT.
        TX_CH0_ERR_INT_ENA: u1,
        /// The interrupt enable bit for CH1_ERR_INT.
        TX_CH1_ERR_INT_ENA: u1,
        /// The interrupt enable bit for CH2_ERR_INT.
        TX_CH2_ERR_INT_ENA: u1,
        /// The interrupt enable bit for CH3_ERR_INT.
        TX_CH3_ERR_INT_ENA: u1,
        /// The interrupt enable bit for CH0_TX_THR_EVENT_INT.
        CH0_TX_THR_EVENT_INT_ENA: u1,
        /// The interrupt enable bit for CH1_TX_THR_EVENT_INT.
        CH1_TX_THR_EVENT_INT_ENA: u1,
        /// The interrupt enable bit for CH2_TX_THR_EVENT_INT.
        CH2_TX_THR_EVENT_INT_ENA: u1,
        /// The interrupt enable bit for CH3_TX_THR_EVENT_INT.
        CH3_TX_THR_EVENT_INT_ENA: u1,
        /// The interrupt enable bit for CH0_TX_LOOP_INT.
        CH0_TX_LOOP_INT_ENA: u1,
        /// The interrupt enable bit for CH1_TX_LOOP_INT.
        CH1_TX_LOOP_INT_ENA: u1,
        /// The interrupt enable bit for CH2_TX_LOOP_INT.
        CH2_TX_LOOP_INT_ENA: u1,
        /// The interrupt enable bit for CH3_TX_LOOP_INT.
        CH3_TX_LOOP_INT_ENA: u1,
        /// The interrupt enable bit for CH4_RX_END_INT.
        CH4_RX_END_INT_ENA: u1,
        /// The interrupt enable bit for CH5_RX_END_INT.
        CH5_RX_END_INT_ENA: u1,
        /// The interrupt enable bit for CH6_RX_END_INT.
        CH6_RX_END_INT_ENA: u1,
        /// The interrupt enable bit for CH7_RX_END_INT.
        CH7_RX_END_INT_ENA: u1,
        /// The interrupt enable bit for CH4_ERR_INT.
        CH4_ERR_INT_ENA: u1,
        /// The interrupt enable bit for CH5_ERR_INT.
        CH5_ERR_INT_ENA: u1,
        /// The interrupt enable bit for CH6_ERR_INT.
        CH6_ERR_INT_ENA: u1,
        /// The interrupt enable bit for CH7_ERR_INT.
        CH7_ERR_INT_ENA: u1,
        /// The interrupt enable bit for CH4_RX_THR_EVENT_INT.
        CH4_RX_THR_EVENT_INT_ENA: u1,
        /// The interrupt enable bit for CH5_RX_THR_EVENT_INT.
        CH5_RX_THR_EVENT_INT_ENA: u1,
        /// The interrupt enable bit for CH6_RX_THR_EVENT_INT.
        CH6_RX_THR_EVENT_INT_ENA: u1,
        /// The interrupt enable bit for CH7_RX_THR_EVENT_INT.
        CH7_RX_THR_EVENT_INT_ENA: u1,
        /// The interrupt enable bit for CH3_DMA_ACCESS_FAIL_INT.
        TX_CH3_DMA_ACCESS_FAIL_INT_ENA: u1,
        /// The interrupt enable bit for CH7_DMA_ACCESS_FAIL_INT.
        RX_CH7_DMA_ACCESS_FAIL_INT_ENA: u1,
        padding: u2 = 0,
    }),
    /// Interrupt clear bits
    /// offset: 0x7c
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear theCH0_TX_END_INT interrupt.
        CH0_TX_END_INT_CLR: u1,
        /// Set this bit to clear theCH1_TX_END_INT interrupt.
        CH1_TX_END_INT_CLR: u1,
        /// Set this bit to clear theCH2_TX_END_INT interrupt.
        CH2_TX_END_INT_CLR: u1,
        /// Set this bit to clear theCH3_TX_END_INT interrupt.
        CH3_TX_END_INT_CLR: u1,
        /// Set this bit to clear theCH0_ERR_INT interrupt.
        TX_CH0_ERR_INT_CLR: u1,
        /// Set this bit to clear theCH1_ERR_INT interrupt.
        TX_CH1_ERR_INT_CLR: u1,
        /// Set this bit to clear theCH2_ERR_INT interrupt.
        TX_CH2_ERR_INT_CLR: u1,
        /// Set this bit to clear theCH3_ERR_INT interrupt.
        TX_CH3_ERR_INT_CLR: u1,
        /// Set this bit to clear theCH0_TX_THR_EVENT_INT interrupt.
        CH0_TX_THR_EVENT_INT_CLR: u1,
        /// Set this bit to clear theCH1_TX_THR_EVENT_INT interrupt.
        CH1_TX_THR_EVENT_INT_CLR: u1,
        /// Set this bit to clear theCH2_TX_THR_EVENT_INT interrupt.
        CH2_TX_THR_EVENT_INT_CLR: u1,
        /// Set this bit to clear theCH3_TX_THR_EVENT_INT interrupt.
        CH3_TX_THR_EVENT_INT_CLR: u1,
        /// Set this bit to clear theCH0_TX_LOOP_INT interrupt.
        CH0_TX_LOOP_INT_CLR: u1,
        /// Set this bit to clear theCH1_TX_LOOP_INT interrupt.
        CH1_TX_LOOP_INT_CLR: u1,
        /// Set this bit to clear theCH2_TX_LOOP_INT interrupt.
        CH2_TX_LOOP_INT_CLR: u1,
        /// Set this bit to clear theCH3_TX_LOOP_INT interrupt.
        CH3_TX_LOOP_INT_CLR: u1,
        /// Set this bit to clear theCH4_RX_END_INT interrupt.
        CH4_RX_END_INT_CLR: u1,
        /// Set this bit to clear theCH5_RX_END_INT interrupt.
        CH5_RX_END_INT_CLR: u1,
        /// Set this bit to clear theCH6_RX_END_INT interrupt.
        CH6_RX_END_INT_CLR: u1,
        /// Set this bit to clear theCH7_RX_END_INT interrupt.
        CH7_RX_END_INT_CLR: u1,
        /// Set this bit to clear theCH4_ERR_INT interrupt.
        RX_CH4_ERR_INT_CLR: u1,
        /// Set this bit to clear theCH5_ERR_INT interrupt.
        RX_CH5_ERR_INT_CLR: u1,
        /// Set this bit to clear theCH6_ERR_INT interrupt.
        RX_CH6_ERR_INT_CLR: u1,
        /// Set this bit to clear theCH7_ERR_INT interrupt.
        RX_CH7_ERR_INT_CLR: u1,
        /// Set this bit to clear theCH4_RX_THR_EVENT_INT interrupt.
        CH4_RX_THR_EVENT_INT_CLR: u1,
        /// Set this bit to clear theCH5_RX_THR_EVENT_INT interrupt.
        CH5_RX_THR_EVENT_INT_CLR: u1,
        /// Set this bit to clear theCH6_RX_THR_EVENT_INT interrupt.
        CH6_RX_THR_EVENT_INT_CLR: u1,
        /// Set this bit to clear theCH7_RX_THR_EVENT_INT interrupt.
        CH7_RX_THR_EVENT_INT_CLR: u1,
        /// Set this bit to clear the CH3_DMA_ACCESS_FAIL_INT interrupt.
        TX_CH3_DMA_ACCESS_FAIL_INT_CLR: u1,
        /// Set this bit to clear the CH7_DMA_ACCESS_FAIL_INT interrupt.
        RX_CH7_DMA_ACCESS_FAIL_INT_CLR: u1,
        padding: u2 = 0,
    }),
    /// Channel %s duty cycle configuration register
    /// offset: 0x80
    CH0CARRIER_DUTY: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure carrier wave 's low level clock period for CHANNEL%s.
        CARRIER_LOW_CH: u16,
        /// This register is used to configure carrier wave 's high level clock period for CHANNEL%s.
        CARRIER_HIGH_CH: u16,
    }),
    /// Channel %s duty cycle configuration register
    /// offset: 0x84
    CH1CARRIER_DUTY: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure carrier wave 's low level clock period for CHANNEL%s.
        CARRIER_LOW_CH: u16,
        /// This register is used to configure carrier wave 's high level clock period for CHANNEL%s.
        CARRIER_HIGH_CH: u16,
    }),
    /// Channel %s duty cycle configuration register
    /// offset: 0x88
    CH2CARRIER_DUTY: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure carrier wave 's low level clock period for CHANNEL%s.
        CARRIER_LOW_CH: u16,
        /// This register is used to configure carrier wave 's high level clock period for CHANNEL%s.
        CARRIER_HIGH_CH: u16,
    }),
    /// Channel %s duty cycle configuration register
    /// offset: 0x8c
    CH3CARRIER_DUTY: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure carrier wave 's low level clock period for CHANNEL%s.
        CARRIER_LOW_CH: u16,
        /// This register is used to configure carrier wave 's high level clock period for CHANNEL%s.
        CARRIER_HIGH_CH: u16,
    }),
    /// Channel %s carrier remove register
    /// offset: 0x90
    CH0_RX_CARRIER_RM: mmio.Mmio(packed struct(u32) {
        /// The low level period in a carrier modulation mode is (REG_RMT_REG_CARRIER_LOW_THRES_CH%s + 1) for channel %s.
        CARRIER_LOW_THRES_CH: u16,
        /// The high level period in a carrier modulation mode is (REG_RMT_REG_CARRIER_HIGH_THRES_CH%s + 1) for channel %s.
        CARRIER_HIGH_THRES_CH: u16,
    }),
    /// Channel %s carrier remove register
    /// offset: 0x94
    CH1_RX_CARRIER_RM: mmio.Mmio(packed struct(u32) {
        /// The low level period in a carrier modulation mode is (REG_RMT_REG_CARRIER_LOW_THRES_CH%s + 1) for channel %s.
        CARRIER_LOW_THRES_CH: u16,
        /// The high level period in a carrier modulation mode is (REG_RMT_REG_CARRIER_HIGH_THRES_CH%s + 1) for channel %s.
        CARRIER_HIGH_THRES_CH: u16,
    }),
    /// Channel %s carrier remove register
    /// offset: 0x98
    CH2_RX_CARRIER_RM: mmio.Mmio(packed struct(u32) {
        /// The low level period in a carrier modulation mode is (REG_RMT_REG_CARRIER_LOW_THRES_CH%s + 1) for channel %s.
        CARRIER_LOW_THRES_CH: u16,
        /// The high level period in a carrier modulation mode is (REG_RMT_REG_CARRIER_HIGH_THRES_CH%s + 1) for channel %s.
        CARRIER_HIGH_THRES_CH: u16,
    }),
    /// Channel %s carrier remove register
    /// offset: 0x9c
    CH3_RX_CARRIER_RM: mmio.Mmio(packed struct(u32) {
        /// The low level period in a carrier modulation mode is (REG_RMT_REG_CARRIER_LOW_THRES_CH%s + 1) for channel %s.
        CARRIER_LOW_THRES_CH: u16,
        /// The high level period in a carrier modulation mode is (REG_RMT_REG_CARRIER_HIGH_THRES_CH%s + 1) for channel %s.
        CARRIER_HIGH_THRES_CH: u16,
    }),
    /// Channel %s Tx event configuration register
    /// offset: 0xa0
    CH0_TX_LIM: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the maximum entries that CHANNEL%s can send out.
        TX_LIM_CH: u9,
        /// This register is used to configure the maximum loop count when tx_conti_mode is valid.
        TX_LOOP_NUM_CH: u10,
        /// This register is the enabled bit for loop count.
        TX_LOOP_CNT_EN_CH: u1,
        /// This register is used to reset the loop count when tx_conti_mode is valid.
        LOOP_COUNT_RESET_CH: u1,
        /// This bit is used to enable the loop send stop function after the loop counter counts to loop number for CHANNEL%s.
        LOOP_STOP_EN_CH: u1,
        padding: u10 = 0,
    }),
    /// Channel %s Tx event configuration register
    /// offset: 0xa4
    CH1_TX_LIM: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the maximum entries that CHANNEL%s can send out.
        TX_LIM_CH: u9,
        /// This register is used to configure the maximum loop count when tx_conti_mode is valid.
        TX_LOOP_NUM_CH: u10,
        /// This register is the enabled bit for loop count.
        TX_LOOP_CNT_EN_CH: u1,
        /// This register is used to reset the loop count when tx_conti_mode is valid.
        LOOP_COUNT_RESET_CH: u1,
        /// This bit is used to enable the loop send stop function after the loop counter counts to loop number for CHANNEL%s.
        LOOP_STOP_EN_CH: u1,
        padding: u10 = 0,
    }),
    /// Channel %s Tx event configuration register
    /// offset: 0xa8
    CH2_TX_LIM: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the maximum entries that CHANNEL%s can send out.
        TX_LIM_CH: u9,
        /// This register is used to configure the maximum loop count when tx_conti_mode is valid.
        TX_LOOP_NUM_CH: u10,
        /// This register is the enabled bit for loop count.
        TX_LOOP_CNT_EN_CH: u1,
        /// This register is used to reset the loop count when tx_conti_mode is valid.
        LOOP_COUNT_RESET_CH: u1,
        /// This bit is used to enable the loop send stop function after the loop counter counts to loop number for CHANNEL%s.
        LOOP_STOP_EN_CH: u1,
        padding: u10 = 0,
    }),
    /// Channel %s Tx event configuration register
    /// offset: 0xac
    CH3_TX_LIM: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the maximum entries that CHANNEL%s can send out.
        TX_LIM_CH: u9,
        /// This register is used to configure the maximum loop count when tx_conti_mode is valid.
        TX_LOOP_NUM_CH: u10,
        /// This register is the enabled bit for loop count.
        TX_LOOP_CNT_EN_CH: u1,
        /// This register is used to reset the loop count when tx_conti_mode is valid.
        LOOP_COUNT_RESET_CH: u1,
        /// This bit is used to enable the loop send stop function after the loop counter counts to loop number for CHANNEL%s.
        LOOP_STOP_EN_CH: u1,
        padding: u10 = 0,
    }),
    /// Channel %s Rx event configuration register
    /// offset: 0xb0
    CH0_RX_LIM: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the maximum entries that CHANNEL%s can receive.
        RX_LIM_CH4: u9,
        padding: u23 = 0,
    }),
    /// Channel %s Rx event configuration register
    /// offset: 0xb4
    CH1_RX_LIM: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the maximum entries that CHANNEL%s can receive.
        RX_LIM_CH4: u9,
        padding: u23 = 0,
    }),
    /// Channel %s Rx event configuration register
    /// offset: 0xb8
    CH2_RX_LIM: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the maximum entries that CHANNEL%s can receive.
        RX_LIM_CH4: u9,
        padding: u23 = 0,
    }),
    /// Channel %s Rx event configuration register
    /// offset: 0xbc
    CH3_RX_LIM: mmio.Mmio(packed struct(u32) {
        /// This register is used to configure the maximum entries that CHANNEL%s can receive.
        RX_LIM_CH4: u9,
        padding: u23 = 0,
    }),
    /// RMT apb configuration register
    /// offset: 0xc0
    SYS_CONF: mmio.Mmio(packed struct(u32) {
        /// 1'h1: access memory directly. 1'h0: access memory by FIFO.
        APB_FIFO_MASK: u1,
        /// Set this bit to enable the clock for RMT memory.
        MEM_CLK_FORCE_ON: u1,
        /// Set this bit to power down RMT memory.
        MEM_FORCE_PD: u1,
        /// 1: Disable RMT memory light sleep power down function. 0: Power down RMT memory when RMT is in light sleep mode.
        MEM_FORCE_PU: u1,
        /// the integral part of the fractional divisor
        SCLK_DIV_NUM: u8,
        /// the numerator of the fractional part of the fractional divisor
        SCLK_DIV_A: u6,
        /// the denominator of the fractional part of the fractional divisor
        SCLK_DIV_B: u6,
        /// choose the clock source of rmt_sclk. 1:CLK_80Mhz.2:CLK_8MHz.3:XTAL
        SCLK_SEL: u2,
        /// rmt_sclk switch
        SCLK_ACTIVE: u1,
        reserved31: u4 = 0,
        /// RMT register clock gate enable signal. 1: Power up the drive clock of registers. 0: Power down the drive clock of registers
        CLK_EN: u1,
    }),
    /// RMT TX synchronous register
    /// offset: 0xc4
    TX_SIM: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable CHANNEL0 to start sending data synchronously with other enabled channels.
        CH0: u1,
        /// Set this bit to enable CHANNEL1 to start sending data synchronously with other enabled channels.
        CH1: u1,
        /// Set this bit to enable CHANNEL2 to start sending data synchronously with other enabled channels.
        CH2: u1,
        /// Set this bit to enable CHANNEL3 to start sending data synchronously with other enabled channels.
        CH3: u1,
        /// This register is used to enable multiple of channels to start sending data synchronously.
        EN: u1,
        padding: u27 = 0,
    }),
    /// RMT clock divider reset register
    /// offset: 0xc8
    REF_CNT_RST: mmio.Mmio(packed struct(u32) {
        /// This register is used to reset the clock divider of CHANNEL0.
        TX_REF_CNT_RST_CH0: u1,
        /// This register is used to reset the clock divider of CHANNEL1.
        TX_REF_CNT_RST_CH1: u1,
        /// This register is used to reset the clock divider of CHANNEL2.
        TX_REF_CNT_RST_CH2: u1,
        /// This register is used to reset the clock divider of CHANNEL3.
        TX_REF_CNT_RST_CH3: u1,
        /// This register is used to reset the clock divider of CHANNEL4.
        RX_REF_CNT_RST_CH4: u1,
        /// This register is used to reset the clock divider of CHANNEL5.
        RX_REF_CNT_RST_CH5: u1,
        /// This register is used to reset the clock divider of CHANNEL6.
        RX_REF_CNT_RST_CH6: u1,
        /// This register is used to reset the clock divider of CHANNEL7.
        RX_REF_CNT_RST_CH7: u1,
        padding: u24 = 0,
    }),
    /// RMT version register
    /// offset: 0xcc
    DATE: mmio.Mmio(packed struct(u32) {
        /// This is the version register.
        DATE: u28,
        padding: u4 = 0,
    }),
};
