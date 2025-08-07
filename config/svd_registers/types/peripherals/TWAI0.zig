const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Two-Wire Automotive Interface
pub const TWAI0 = extern struct {
    /// TWAI mode register.
    /// offset: 0x00
    MODE: mmio.Mmio(packed struct(u32) {
        /// 1: reset, detection of a set reset mode bit results in aborting the current transmission/reception of a message and entering the reset mode. 0: normal, on the '1-to-0' transition of the reset mode bit, the TWAI controller returns to the operating mode.
        RESET_MODE: u1,
        /// 1: listen only, in this mode the TWAI controller would give no acknowledge to the TWAI-bus, even if a message is received successfully. The error counters are stopped at the current value. 0: normal.
        LISTEN_ONLY_MODE: u1,
        /// 1: self test, in this mode a full node test is possible without any other active node on the bus using the self reception request command. The TWAI controller will perform a successful transmission, even if there is no acknowledge received. 0: normal, an acknowledge is required for successful transmission.
        SELF_TEST_MODE: u1,
        /// 1:single, the single acceptance filter option is enabled (one filter with the length of 32 bit is active). 0:dual, the dual acceptance filter option is enabled (two filters, each with the length of 16 bit are active).
        ACCEPTANCE_FILTER_MODE: u1,
        padding: u28 = 0,
    }),
    /// TWAI command register.
    /// offset: 0x04
    CMD: mmio.Mmio(packed struct(u32) {
        /// 1: present, a message shall be transmitted. 0: absent
        TX_REQUEST: u1,
        /// 1: present, if not already in progress, a pending transmission request is cancelled. 0: absent
        ABORT_TX: u1,
        /// 1: released, the receive buffer, representing the message memory space in the RXFIFO is released. 0: no action
        RELEASE_BUFFER: u1,
        /// 1: clear, the data overrun status bit is cleared. 0: no action.
        CLEAR_DATA_OVERRUN: u1,
        /// 1: present, a message shall be transmitted and received simultaneously. 0: absent.
        SELF_RX_REQUEST: u1,
        padding: u27 = 0,
    }),
    /// TWAI status register.
    /// offset: 0x08
    STATUS: mmio.Mmio(packed struct(u32) {
        /// 1: full, one or more complete messages are available in the RXFIFO. 0: empty, no message is available
        RECEIVE_BUFFER: u1,
        /// 1: overrun, a message was lost because there was not enough space for that message in the RXFIFO. 0: absent, no data overrun has occurred since the last clear data overrun command was given
        OVERRUN: u1,
        /// 1: released, the CPU may write a message into the transmit buffer. 0: locked, the CPU cannot access the transmit buffer, a message is either waiting for transmission or is in the process of being transmitted
        TRANSMIT_BUFFER: u1,
        /// 1: complete, last requested transmission has been successfully completed. 0: incomplete, previously requested transmission is not yet completed
        TRANSMISSION_COMPLETE: u1,
        /// 1: receive, the TWAI controller is receiving a message. 0: idle
        RECEIVE: u1,
        /// 1: transmit, the TWAI controller is transmitting a message. 0: idle
        TRANSMIT: u1,
        /// 1: error, at least one of the error counters has reached or exceeded the CPU warning limit defined by the Error Warning Limit Register (EWLR). 0: ok, both error counters are below the warning limit
        ERR: u1,
        /// 1: bus-off, the TWAI controller is not involved in bus activities. 0: bus-on, the TWAI controller is involved in bus activities
        NODE_BUS_OFF: u1,
        /// 1: current message is destroyed because of FIFO overflow.
        MISS: u1,
        padding: u23 = 0,
    }),
    /// Interrupt signals' register.
    /// offset: 0x0c
    INTERRUPT: mmio.Mmio(packed struct(u32) {
        /// 1: this bit is set while the receive FIFO is not empty and the RIE bit is set within the interrupt enable register. 0: reset
        RECEIVE_INT_ST: u1,
        /// 1: this bit is set whenever the transmit buffer status changes from '0-to-1' (released) and the TIE bit is set within the interrupt enable register. 0: reset
        TRANSMIT_INT_ST: u1,
        /// 1: this bit is set on every change (set and clear) of either the error status or bus status bits and the EIE bit is set within the interrupt enable register. 0: reset
        ERR_WARNING_INT_ST: u1,
        /// 1: this bit is set on a '0-to-1' transition of the data overrun status bit and the DOIE bit is set within the interrupt enable register. 0: reset
        DATA_OVERRUN_INT_ST: u1,
        /// 1: this bit is set then the timestamp counter reaches the maximum value and overflow.
        TS_COUNTER_OVFL_INT_ST: u1,
        /// 1: this bit is set whenever the TWAI controller has reached the error passive status (at least one error counter exceeds the protocol-defined level of 127) or if the TWAI controller is in the error passive status and enters the error active status again and the EPIE bit is set within the interrupt enable register. 0: reset
        ERR_PASSIVE_INT_ST: u1,
        /// 1: this bit is set when the TWAI controller lost the arbitration and becomes a receiver and the ALIE bit is set within the interrupt enable register. 0: reset
        ARBITRATION_LOST_INT_ST: u1,
        /// 1: this bit is set when the TWAI controller detects an error on the TWAI-bus and the BEIE bit is set within the interrupt enable register. 0: reset
        BUS_ERR_INT_ST: u1,
        /// 1: this bit is set when the TWAI controller detects state of TWAI become IDLE and this interrupt enable bit is set within the interrupt enable register. 0: reset
        IDLE_INT_ST: u1,
        padding: u23 = 0,
    }),
    /// Interrupt enable register.
    /// offset: 0x10
    INTERRUPT_ENABLE: mmio.Mmio(packed struct(u32) {
        /// 1: enabled, when the receive buffer status is 'full' the TWAI controller requests the respective interrupt. 0: disable
        EXT_RECEIVE_INT_ENA: u1,
        /// 1: enabled, when a message has been successfully transmitted or the transmit buffer is accessible again (e.g. after an abort transmission command), the TWAI controller requests the respective interrupt. 0: disable
        EXT_TRANSMIT_INT_ENA: u1,
        /// 1: enabled, if the error or bus status change (see status register. Table 14), the TWAI controllerrequests the respective interrupt. 0: disable
        EXT_ERR_WARNING_INT_ENA: u1,
        /// 1: enabled, if the data overrun status bit is set (see status register. Table 14), the TWAI controllerrequests the respective interrupt. 0: disable
        EXT_DATA_OVERRUN_INT_ENA: u1,
        /// enable the timestamp counter overflow interrupt request.
        TS_COUNTER_OVFL_INT_ENA: u1,
        /// 1: enabled, if the error status of the TWAI controller changes from error active to error passive or vice versa, the respective interrupt is requested. 0: disable
        ERR_PASSIVE_INT_ENA: u1,
        /// 1: enabled, if the TWAI controller has lost arbitration, the respective interrupt is requested. 0: disable
        ARBITRATION_LOST_INT_ENA: u1,
        /// 1: enabled, if an bus error has been detected, the TWAI controller requests the respective interrupt. 0: disable
        BUS_ERR_INT_ENA: u1,
        /// 1: enabled, if state of TWAI become IDLE, the TWAI controller requests the respective interrupt. 0: disable
        IDLE_INT_ENA: u1,
        padding: u23 = 0,
    }),
    /// offset: 0x14
    reserved20: [4]u8,
    /// Bit timing configuration register 0.
    /// offset: 0x18
    BUS_TIMING_0: mmio.Mmio(packed struct(u32) {
        /// The period of the TWAI system clock is programmable and determines the individual bit timing. Software has R/W permission in reset mode and RO permission in operation mode.
        BAUD_PRESC: u14,
        /// The synchronization jump width defines the maximum number of clock cycles a bit period may be shortened or lengthened. Software has R/W permission in reset mode and RO in operation mode.
        SYNC_JUMP_WIDTH: u2,
        padding: u16 = 0,
    }),
    /// Bit timing configuration register 1.
    /// offset: 0x1c
    BUS_TIMING_1: mmio.Mmio(packed struct(u32) {
        /// The number of clock cycles in TSEG1 per bit timing. Software has R/W permission in reset mode and RO in operation mode.
        TIME_SEGMENT1: u4,
        /// The number of clock cycles in TSEG2 per bit timing. Software has R/W permission in reset mode and RO in operation mode.
        TIME_SEGMENT2: u3,
        /// 1: triple, the bus is sampled three times. 0: single, the bus is sampled once. Software has R/W permission in reset mode and RO in operation mode.
        TIME_SAMPLING: u1,
        padding: u24 = 0,
    }),
    /// offset: 0x20
    reserved32: [12]u8,
    /// TWAI arbiter lost capture register.
    /// offset: 0x2c
    ARB_LOST_CAP: mmio.Mmio(packed struct(u32) {
        /// This register contains information about the bit position of losing arbitration.
        ARBITRATION_LOST_CAPTURE: u5,
        padding: u27 = 0,
    }),
    /// TWAI error info capture register.
    /// offset: 0x30
    ERR_CODE_CAP: mmio.Mmio(packed struct(u32) {
        /// This register contains information about the location of errors on the bus.
        ERR_CAPTURE_CODE_SEGMENT: u5,
        /// 1: RX, error occurred during reception. 0: TX, error occurred during transmission.
        ERR_CAPTURE_CODE_DIRECTION: u1,
        /// 00: bit error. 01: form error. 10:stuff error. 11:other type of error.
        ERR_CAPTURE_CODE_TYPE: u2,
        padding: u24 = 0,
    }),
    /// TWAI error threshold configuration register.
    /// offset: 0x34
    ERR_WARNING_LIMIT: mmio.Mmio(packed struct(u32) {
        /// The threshold that trigger error warning interrupt when this interrupt is enabled. Software has R/W permission in reset mode and RO in operation mode.
        ERR_WARNING_LIMIT: u8,
        padding: u24 = 0,
    }),
    /// Rx error counter register.
    /// offset: 0x38
    RX_ERR_CNT: mmio.Mmio(packed struct(u32) {
        /// The RX error counter register reflects the current value of the transmit error counter. Software has R/W permission in reset mode and RO in operation mode.
        RX_ERR_CNT: u8,
        padding: u24 = 0,
    }),
    /// Tx error counter register.
    /// offset: 0x3c
    TX_ERR_CNT: mmio.Mmio(packed struct(u32) {
        /// The TX error counter register reflects the current value of the transmit error counter. Software has R/W permission in reset mode and RO in operation mode.
        TX_ERR_CNT: u8,
        padding: u24 = 0,
    }),
    /// Data register 0.
    /// offset: 0x40
    DATA_0: mmio.Mmio(packed struct(u32) {
        /// In reset mode, it is acceptance code register 0 with R/W Permission. In operation mode, when software initiate write operation, it is tx data register 0 and when software initiate read operation, it is rx data register 0.
        DATA_0: u8,
        padding: u24 = 0,
    }),
    /// Data register 1.
    /// offset: 0x44
    DATA_1: mmio.Mmio(packed struct(u32) {
        /// In reset mode, it is acceptance code register 1 with R/W Permission. In operation mode, when software initiate write operation, it is tx data register 1 and when software initiate read operation, it is rx data register 1.
        DATA_1: u8,
        padding: u24 = 0,
    }),
    /// Data register 2.
    /// offset: 0x48
    DATA_2: mmio.Mmio(packed struct(u32) {
        /// In reset mode, it is acceptance code register 2 with R/W Permission. In operation mode, when software initiate write operation, it is tx data register 2 and when software initiate read operation, it is rx data register 2.
        DATA_2: u8,
        padding: u24 = 0,
    }),
    /// Data register 3.
    /// offset: 0x4c
    DATA_3: mmio.Mmio(packed struct(u32) {
        /// In reset mode, it is acceptance code register 3 with R/W Permission. In operation mode, when software initiate write operation, it is tx data register 3 and when software initiate read operation, it is rx data register 3.
        DATA_3: u8,
        padding: u24 = 0,
    }),
    /// Data register 4.
    /// offset: 0x50
    DATA_4: mmio.Mmio(packed struct(u32) {
        /// In reset mode, it is acceptance mask register 0 with R/W Permission. In operation mode, when software initiate write operation, it is tx data register 4 and when software initiate read operation, it is rx data register 4.
        DATA_4: u8,
        padding: u24 = 0,
    }),
    /// Data register 5.
    /// offset: 0x54
    DATA_5: mmio.Mmio(packed struct(u32) {
        /// In reset mode, it is acceptance mask register 1 with R/W Permission. In operation mode, when software initiate write operation, it is tx data register 5 and when software initiate read operation, it is rx data register 5.
        DATA_5: u8,
        padding: u24 = 0,
    }),
    /// Data register 6.
    /// offset: 0x58
    DATA_6: mmio.Mmio(packed struct(u32) {
        /// In reset mode, it is acceptance mask register 2 with R/W Permission. In operation mode, when software initiate write operation, it is tx data register 6 and when software initiate read operation, it is rx data register 6.
        DATA_6: u8,
        padding: u24 = 0,
    }),
    /// Data register 7.
    /// offset: 0x5c
    DATA_7: mmio.Mmio(packed struct(u32) {
        /// In reset mode, it is acceptance mask register 3 with R/W Permission. In operation mode, when software initiate write operation, it is tx data register 7 and when software initiate read operation, it is rx data register 7.
        DATA_7: u8,
        padding: u24 = 0,
    }),
    /// Data register 8.
    /// offset: 0x60
    DATA_8: mmio.Mmio(packed struct(u32) {
        /// In reset mode, reserved with RO. In operation mode, when software initiate write operation, it is tx data register 8 and when software initiate read operation, it is rx data register 8.
        DATA_8: u8,
        padding: u24 = 0,
    }),
    /// Data register 9.
    /// offset: 0x64
    DATA_9: mmio.Mmio(packed struct(u32) {
        /// In reset mode, reserved with RO. In operation mode, when software initiate write operation, it is tx data register 9 and when software initiate read operation, it is rx data register 9.
        DATA_9: u8,
        padding: u24 = 0,
    }),
    /// Data register 10.
    /// offset: 0x68
    DATA_10: mmio.Mmio(packed struct(u32) {
        /// In reset mode, reserved with RO. In operation mode, when software initiate write operation, it is tx data register 10 and when software initiate read operation, it is rx data register 10.
        DATA_10: u8,
        padding: u24 = 0,
    }),
    /// Data register 11.
    /// offset: 0x6c
    DATA_11: mmio.Mmio(packed struct(u32) {
        /// In reset mode, reserved with RO. In operation mode, when software initiate write operation, it is tx data register 11 and when software initiate read operation, it is rx data register 11.
        DATA_11: u8,
        padding: u24 = 0,
    }),
    /// Data register 12.
    /// offset: 0x70
    DATA_12: mmio.Mmio(packed struct(u32) {
        /// In reset mode, reserved with RO. In operation mode, when software initiate write operation, it is tx data register 12 and when software initiate read operation, it is rx data register 12.
        DATA_12: u8,
        padding: u24 = 0,
    }),
    /// Received message counter register.
    /// offset: 0x74
    RX_MESSAGE_COUNTER: mmio.Mmio(packed struct(u32) {
        /// Reflects the number of messages available within the RXFIFO. The value is incremented with each receive event and decremented by the release receive buffer command.
        RX_MESSAGE_COUNTER: u7,
        padding: u25 = 0,
    }),
    /// offset: 0x78
    reserved120: [4]u8,
    /// Clock divider register.
    /// offset: 0x7c
    CLOCK_DIVIDER: mmio.Mmio(packed struct(u32) {
        /// These bits are used to define the frequency at the external CLKOUT pin.
        CD: u8,
        /// 1: Disable the external CLKOUT pin. 0: Enable the external CLKOUT pin. Software has R/W permission in reset mode and RO in operation mode.
        CLOCK_OFF: u1,
        padding: u23 = 0,
    }),
    /// Software configure standby pin directly.
    /// offset: 0x80
    SW_STANDBY_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable standby pin.
        SW_STANDBY_EN: u1,
        /// Clear standby pin.
        SW_STANDBY_CLR: u1,
        padding: u30 = 0,
    }),
    /// Hardware configure standby pin.
    /// offset: 0x84
    HW_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable function that hardware control standby pin.
        HW_STANDBY_EN: u1,
        padding: u31 = 0,
    }),
    /// Configure standby counter.
    /// offset: 0x88
    HW_STANDBY_CNT: mmio.Mmio(packed struct(u32) {
        /// Configure the number of cycles before standby becomes high when TWAI_HW_STANDBY_EN is enabled.
        STANDBY_WAIT_CNT: u32,
    }),
    /// Configure idle interrupt counter.
    /// offset: 0x8c
    IDLE_INTR_CNT: mmio.Mmio(packed struct(u32) {
        /// Configure the number of cycles before triggering idle interrupt.
        IDLE_INTR_CNT: u32,
    }),
    /// ECO configuration register.
    /// offset: 0x90
    ECO_CFG: mmio.Mmio(packed struct(u32) {
        /// Enable eco module.
        RDN_ENA: u1,
        /// Output of eco module.
        RDN_RESULT: u1,
        padding: u30 = 0,
    }),
    /// Timestamp data register
    /// offset: 0x94
    TIMESTAMP_DATA: mmio.Mmio(packed struct(u32) {
        /// Data of timestamp of a CAN frame.
        TIMESTAMP_DATA: u32,
    }),
    /// Timestamp configuration register
    /// offset: 0x98
    TIMESTAMP_PRESCALER: mmio.Mmio(packed struct(u32) {
        /// Configures the clock division number of timestamp counter.
        TS_DIV_NUM: u16,
        padding: u16 = 0,
    }),
    /// Timestamp configuration register
    /// offset: 0x9c
    TIMESTAMP_CFG: mmio.Mmio(packed struct(u32) {
        /// enable the timestamp collection function.
        TS_ENABLE: u1,
        padding: u31 = 0,
    }),
};
