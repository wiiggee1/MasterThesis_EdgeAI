const mmio = @import("mmio");
const types = @import("../../types.zig");

/// I2C (Inter-Integrated Circuit) Controller 0
pub const I2C0 = extern struct {
    /// Configures the low level width of the SCL Clock.
    /// offset: 0x00
    SCL_LOW_PERIOD: mmio.Mmio(packed struct(u32) {
        /// Configures the low level width of the SCL Clock. Measurement unit: i2c_sclk.
        SCL_LOW_PERIOD: u9,
        padding: u23 = 0,
    }),
    /// Transmission setting
    /// offset: 0x04
    CTR: mmio.Mmio(packed struct(u32) {
        /// Configures the SDA output mode 1: Direct output, 0: Open drain output.
        SDA_FORCE_OUT: u1,
        /// Configures the SCL output mode 1: Direct output, 0: Open drain output.
        SCL_FORCE_OUT: u1,
        /// Configures the sample mode for SDA. 1: Sample SDA data on the SCL low level. 0: Sample SDA data on the SCL high level.
        SAMPLE_SCL_LEVEL: u1,
        /// Configures the ACK value that needs to be sent by master when the rx_fifo_cnt has reached the threshold.
        RX_FULL_ACK_LEVEL: u1,
        /// Configures the module as an I2C Master or Slave. 0: Slave 1: Master
        MS_MODE: u1,
        /// Configures to start sending the data in txfifo for slave. 0: No effect 1: Start
        TRANS_START: u1,
        /// Configures to control the sending order for data needing to be sent. 1: send data from the least significant bit, 0: send data from the most significant bit.
        TX_LSB_FIRST: u1,
        /// Configures to control the storage order for received data. 1: receive data from the least significant bit 0: receive data from the most significant bit.
        RX_LSB_FIRST: u1,
        /// Configures whether to gate clock signal for registers. 0: Force clock on for registers 1: Support clock only when registers are read or written to by software.
        CLK_EN: u1,
        /// Configures to enable I2C bus arbitration detection. 0: No effect 1: Enable
        ARBITRATION_EN: u1,
        /// Configures to reset the SCL_FSM. 0: No effect 1: Reset
        FSM_RST: u1,
        /// Configures this bit for synchronization 0: No effect 1: Synchronize
        CONF_UPGATE: u1,
        /// Configures to enable slave to send data automatically 0: Disable 1: Enable
        SLV_TX_AUTO_START_EN: u1,
        /// Configures to check if the r/w bit of 10bit addressing consists with I2C protocol. 0: Not check 1: Check
        ADDR_10BIT_RW_CHECK_EN: u1,
        /// Configures to support the 7bit general call function. 0: Not support 1: Support
        ADDR_BROADCASTING_EN: u1,
        padding: u17 = 0,
    }),
    /// Describe I2C work status.
    /// offset: 0x08
    SR: mmio.Mmio(packed struct(u32) {
        /// Represents the received ACK value in master mode or slave mode. 0: ACK, 1: NACK.
        RESP_REC: u1,
        /// Represents the transfer direction in slave mode,. 1: Master reads from slave, 0: Master writes to slave.
        SLAVE_RW: u1,
        reserved3: u1 = 0,
        /// Represents whether the I2C controller loses control of SCL line. 0: No arbitration lost 1: Arbitration lost
        ARB_LOST: u1,
        /// Represents the I2C bus state. 1: The I2C bus is busy transferring data, 0: The I2C bus is in idle state.
        BUS_BUSY: u1,
        /// Represents whether the address sent by the master is equal to the address of the slave. Valid only when the module is configured as an I2C Slave. 0: Not equal 1: Equal
        SLAVE_ADDRESSED: u1,
        reserved8: u2 = 0,
        /// Represents the number of data bytes to be sent.
        RXFIFO_CNT: u6,
        /// Represents the cause of SCL clocking stretching in slave mode. 0: Stretching SCL low when the master starts to read data. 1: Stretching SCL low when I2C TX FIFO is empty in slave mode. 2: Stretching SCL low when I2C RX FIFO is full in slave mode.
        STRETCH_CAUSE: u2,
        reserved18: u2 = 0,
        /// Represents the number of data bytes received in RAM.
        TXFIFO_CNT: u6,
        /// Represents the states of the I2C module state machine. 0: Idle, 1: Address shift, 2: ACK address, 3: Rx data, 4: Tx data, 5: Send ACK, 6: Wait ACK
        SCL_MAIN_STATE_LAST: u3,
        reserved28: u1 = 0,
        /// Represents the states of the state machine used to produce SCL. 0: Idle, 1: Start, 2: Negative edge, 3: Low, 4: Positive edge, 5: High, 6: Stop
        SCL_STATE_LAST: u3,
        padding: u1 = 0,
    }),
    /// Setting time out control for receiving data.
    /// offset: 0x0c
    TO: mmio.Mmio(packed struct(u32) {
        /// Configures the timeout threshold period for SCL stucking at high or low level. The actual period is 2^(reg_time_out_value). Measurement unit: i2c_sclk.
        TIME_OUT_VALUE: u5,
        /// Configures to enable time out control. 0: No effect 1: Enable
        TIME_OUT_EN: u1,
        padding: u26 = 0,
    }),
    /// Local slave address setting
    /// offset: 0x10
    SLAVE_ADDR: mmio.Mmio(packed struct(u32) {
        /// Configure the slave address of I2C Slave.
        SLAVE_ADDR: u15,
        reserved31: u16 = 0,
        /// Configures to enable the slave 10-bit addressing mode in master mode. 0: No effect 1: Enable
        ADDR_10BIT_EN: u1,
    }),
    /// FIFO status register.
    /// offset: 0x14
    FIFO_ST: mmio.Mmio(packed struct(u32) {
        /// Represents the offset address of the APB reading from RXFIFO
        RXFIFO_RADDR: u5,
        /// Represents the offset address of i2c module receiving data and writing to RXFIFO.
        RXFIFO_WADDR: u5,
        /// Represents the offset address of i2c module reading from TXFIFO.
        TXFIFO_RADDR: u5,
        /// Represents the offset address of APB bus writing to TXFIFO.
        TXFIFO_WADDR: u5,
        reserved22: u2 = 0,
        /// Represents the offset address in the I2C Slave RAM addressed by I2C Master when in I2C slave mode.
        SLAVE_RW_POINT: u8,
        padding: u2 = 0,
    }),
    /// FIFO configuration register.
    /// offset: 0x18
    FIFO_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the water mark threshold of RXFIFO in nonfifo access mode. When reg_reg_fifo_prt_en is 1 and rx FIFO counter is bigger than reg_rxfifo_wm_thrhd[4:0], reg_rxfifo_wm_int_raw bit will be valid.
        RXFIFO_WM_THRHD: u5,
        /// Configures the water mark threshold of TXFIFO in nonfifo access mode. When reg_reg_fifo_prt_en is 1 and tx FIFO counter is smaller than reg_txfifo_wm_thrhd[4:0], reg_txfifo_wm_int_raw bit will be valid.
        TXFIFO_WM_THRHD: u5,
        /// Configures to enable APB nonfifo access.
        NONFIFO_EN: u1,
        /// Configures to enable double addressing mode. When this mode is enabled, the byte received after the I2C address byte represents the offset address in the I2C Slave RAM. 0: Disable 1: Enable
        FIFO_ADDR_CFG_EN: u1,
        /// Configures to reset RXFIFO. 0: No effect 1: Reset
        RX_FIFO_RST: u1,
        /// Configures to reset TXFIFO. 0: No effect 1: Reset
        TX_FIFO_RST: u1,
        /// Configures to enable FIFO pointer in non-fifo access mode. This bit controls the valid bits and the TX/RX FIFO overflow, underflow, full and empty interrupts. 0: No effect 1: Enable
        FIFO_PRT_EN: u1,
        padding: u17 = 0,
    }),
    /// Rx FIFO read data.
    /// offset: 0x1c
    DATA: mmio.Mmio(packed struct(u32) {
        /// Represents the value of RXFIFO read data.
        FIFO_RDATA: u8,
        padding: u24 = 0,
    }),
    /// Raw interrupt status
    /// offset: 0x20
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status of I2C_RXFIFO_WM_INT interrupt.
        RXFIFO_WM_INT_RAW: u1,
        /// The raw interrupt status of I2C_TXFIFO_WM_INT interrupt.
        TXFIFO_WM_INT_RAW: u1,
        /// The raw interrupt status of I2C_RXFIFO_OVF_INT interrupt.
        RXFIFO_OVF_INT_RAW: u1,
        /// The raw interrupt status of the I2C_END_DETECT_INT interrupt.
        END_DETECT_INT_RAW: u1,
        /// The raw interrupt status of the I2C_END_DETECT_INT interrupt.
        BYTE_TRANS_DONE_INT_RAW: u1,
        /// The raw interrupt status of the I2C_ARBITRATION_LOST_INT interrupt.
        ARBITRATION_LOST_INT_RAW: u1,
        /// The raw interrupt status of I2C_TRANS_COMPLETE_INT interrupt.
        MST_TXFIFO_UDF_INT_RAW: u1,
        /// The raw interrupt status of the I2C_TRANS_COMPLETE_INT interrupt.
        TRANS_COMPLETE_INT_RAW: u1,
        /// The raw interrupt status of the I2C_TIME_OUT_INT interrupt.
        TIME_OUT_INT_RAW: u1,
        /// The raw interrupt status of the I2C_TRANS_START_INT interrupt.
        TRANS_START_INT_RAW: u1,
        /// The raw interrupt status of I2C_SLAVE_STRETCH_INT interrupt.
        NACK_INT_RAW: u1,
        /// The raw interrupt status of I2C_TXFIFO_OVF_INT interrupt.
        TXFIFO_OVF_INT_RAW: u1,
        /// The raw interrupt status of I2C_RXFIFO_UDF_INT interrupt.
        RXFIFO_UDF_INT_RAW: u1,
        /// The raw interrupt status of I2C_SCL_ST_TO_INT interrupt.
        SCL_ST_TO_INT_RAW: u1,
        /// The raw interrupt status of I2C_SCL_MAIN_ST_TO_INT interrupt.
        SCL_MAIN_ST_TO_INT_RAW: u1,
        /// The raw interrupt status of I2C_DET_START_INT interrupt.
        DET_START_INT_RAW: u1,
        /// The raw interrupt status of I2C_SLAVE_STRETCH_INT interrupt.
        SLAVE_STRETCH_INT_RAW: u1,
        /// The raw interrupt status of I2C_GENARAL_CALL_INT interrupt.
        GENERAL_CALL_INT_RAW: u1,
        /// The raw interrupt status of I2C_SLAVE_ADDR_UNMATCH_INT_RAW interrupt.
        SLAVE_ADDR_UNMATCH_INT_RAW: u1,
        padding: u13 = 0,
    }),
    /// Interrupt clear bits
    /// offset: 0x24
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Write 1 to clear I2C_RXFIFO_WM_INT interrupt.
        RXFIFO_WM_INT_CLR: u1,
        /// Write 1 to clear I2C_TXFIFO_WM_INT interrupt.
        TXFIFO_WM_INT_CLR: u1,
        /// Write 1 to clear I2C_RXFIFO_OVF_INT interrupt.
        RXFIFO_OVF_INT_CLR: u1,
        /// Write 1 to clear the I2C_END_DETECT_INT interrupt.
        END_DETECT_INT_CLR: u1,
        /// Write 1 to clear the I2C_END_DETECT_INT interrupt.
        BYTE_TRANS_DONE_INT_CLR: u1,
        /// Write 1 to clear the I2C_ARBITRATION_LOST_INT interrupt.
        ARBITRATION_LOST_INT_CLR: u1,
        /// Write 1 to clear I2C_TRANS_COMPLETE_INT interrupt.
        MST_TXFIFO_UDF_INT_CLR: u1,
        /// Write 1 to clear the I2C_TRANS_COMPLETE_INT interrupt.
        TRANS_COMPLETE_INT_CLR: u1,
        /// Write 1 to clear the I2C_TIME_OUT_INT interrupt.
        TIME_OUT_INT_CLR: u1,
        /// Write 1 to clear the I2C_TRANS_START_INT interrupt.
        TRANS_START_INT_CLR: u1,
        /// Write 1 to clear I2C_SLAVE_STRETCH_INT interrupt.
        NACK_INT_CLR: u1,
        /// Write 1 to clear I2C_TXFIFO_OVF_INT interrupt.
        TXFIFO_OVF_INT_CLR: u1,
        /// Write 1 to clear I2C_RXFIFO_UDF_INT interrupt.
        RXFIFO_UDF_INT_CLR: u1,
        /// Write 1 to clear I2C_SCL_ST_TO_INT interrupt.
        SCL_ST_TO_INT_CLR: u1,
        /// Write 1 to clear I2C_SCL_MAIN_ST_TO_INT interrupt.
        SCL_MAIN_ST_TO_INT_CLR: u1,
        /// Write 1 to clear I2C_DET_START_INT interrupt.
        DET_START_INT_CLR: u1,
        /// Write 1 to clear I2C_SLAVE_STRETCH_INT interrupt.
        SLAVE_STRETCH_INT_CLR: u1,
        /// Write 1 to clear I2C_GENARAL_CALL_INT interrupt.
        GENERAL_CALL_INT_CLR: u1,
        /// Write 1 to clear I2C_SLAVE_ADDR_UNMATCH_INT_RAW interrupt.
        SLAVE_ADDR_UNMATCH_INT_CLR: u1,
        padding: u13 = 0,
    }),
    /// Interrupt enable bits
    /// offset: 0x28
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// Write 1 to enable I2C_RXFIFO_WM_INT interrupt.
        RXFIFO_WM_INT_ENA: u1,
        /// Write 1 to enable I2C_TXFIFO_WM_INT interrupt.
        TXFIFO_WM_INT_ENA: u1,
        /// Write 1 to enable I2C_RXFIFO_OVF_INT interrupt.
        RXFIFO_OVF_INT_ENA: u1,
        /// Write 1 to enable the I2C_END_DETECT_INT interrupt.
        END_DETECT_INT_ENA: u1,
        /// Write 1 to enable the I2C_END_DETECT_INT interrupt.
        BYTE_TRANS_DONE_INT_ENA: u1,
        /// Write 1 to enable the I2C_ARBITRATION_LOST_INT interrupt.
        ARBITRATION_LOST_INT_ENA: u1,
        /// Write 1 to enable I2C_TRANS_COMPLETE_INT interrupt.
        MST_TXFIFO_UDF_INT_ENA: u1,
        /// Write 1 to enable the I2C_TRANS_COMPLETE_INT interrupt.
        TRANS_COMPLETE_INT_ENA: u1,
        /// Write 1 to enable the I2C_TIME_OUT_INT interrupt.
        TIME_OUT_INT_ENA: u1,
        /// Write 1 to enable the I2C_TRANS_START_INT interrupt.
        TRANS_START_INT_ENA: u1,
        /// Write 1 to enable I2C_SLAVE_STRETCH_INT interrupt.
        NACK_INT_ENA: u1,
        /// Write 1 to enable I2C_TXFIFO_OVF_INT interrupt.
        TXFIFO_OVF_INT_ENA: u1,
        /// Write 1 to enable I2C_RXFIFO_UDF_INT interrupt.
        RXFIFO_UDF_INT_ENA: u1,
        /// Write 1 to enable I2C_SCL_ST_TO_INT interrupt.
        SCL_ST_TO_INT_ENA: u1,
        /// Write 1 to enable I2C_SCL_MAIN_ST_TO_INT interrupt.
        SCL_MAIN_ST_TO_INT_ENA: u1,
        /// Write 1 to enable I2C_DET_START_INT interrupt.
        DET_START_INT_ENA: u1,
        /// Write 1 to enable I2C_SLAVE_STRETCH_INT interrupt.
        SLAVE_STRETCH_INT_ENA: u1,
        /// Write 1 to enable I2C_GENARAL_CALL_INT interrupt.
        GENERAL_CALL_INT_ENA: u1,
        /// Write 1 to enable I2C_SLAVE_ADDR_UNMATCH_INT interrupt.
        SLAVE_ADDR_UNMATCH_INT_ENA: u1,
        padding: u13 = 0,
    }),
    /// Status of captured I2C communication events
    /// offset: 0x2c
    INT_STATUS: mmio.Mmio(packed struct(u32) {
        /// The masked interrupt status status of I2C_RXFIFO_WM_INT interrupt.
        RXFIFO_WM_INT_ST: u1,
        /// The masked interrupt status status of I2C_TXFIFO_WM_INT interrupt.
        TXFIFO_WM_INT_ST: u1,
        /// The masked interrupt status status of I2C_RXFIFO_OVF_INT interrupt.
        RXFIFO_OVF_INT_ST: u1,
        /// The masked interrupt status status of the I2C_END_DETECT_INT interrupt.
        END_DETECT_INT_ST: u1,
        /// The masked interrupt status status of the I2C_END_DETECT_INT interrupt.
        BYTE_TRANS_DONE_INT_ST: u1,
        /// The masked interrupt status status of the I2C_ARBITRATION_LOST_INT interrupt.
        ARBITRATION_LOST_INT_ST: u1,
        /// The masked interrupt status status of I2C_TRANS_COMPLETE_INT interrupt.
        MST_TXFIFO_UDF_INT_ST: u1,
        /// The masked interrupt status status of the I2C_TRANS_COMPLETE_INT interrupt.
        TRANS_COMPLETE_INT_ST: u1,
        /// The masked interrupt status status of the I2C_TIME_OUT_INT interrupt.
        TIME_OUT_INT_ST: u1,
        /// The masked interrupt status status of the I2C_TRANS_START_INT interrupt.
        TRANS_START_INT_ST: u1,
        /// The masked interrupt status status of I2C_SLAVE_STRETCH_INT interrupt.
        NACK_INT_ST: u1,
        /// The masked interrupt status status of I2C_TXFIFO_OVF_INT interrupt.
        TXFIFO_OVF_INT_ST: u1,
        /// The masked interrupt status status of I2C_RXFIFO_UDF_INT interrupt.
        RXFIFO_UDF_INT_ST: u1,
        /// The masked interrupt status status of I2C_SCL_ST_TO_INT interrupt.
        SCL_ST_TO_INT_ST: u1,
        /// The masked interrupt status status of I2C_SCL_MAIN_ST_TO_INT interrupt.
        SCL_MAIN_ST_TO_INT_ST: u1,
        /// The masked interrupt status status of I2C_DET_START_INT interrupt.
        DET_START_INT_ST: u1,
        /// The masked interrupt status status of I2C_SLAVE_STRETCH_INT interrupt.
        SLAVE_STRETCH_INT_ST: u1,
        /// The masked interrupt status status of I2C_GENARAL_CALL_INT interrupt.
        GENERAL_CALL_INT_ST: u1,
        /// The masked interrupt status status of I2C_SLAVE_ADDR_UNMATCH_INT interrupt.
        SLAVE_ADDR_UNMATCH_INT_ST: u1,
        padding: u13 = 0,
    }),
    /// Configures the hold time after a negative SCL edge.
    /// offset: 0x30
    SDA_HOLD: mmio.Mmio(packed struct(u32) {
        /// Configures the time to hold the data after the falling edge of SCL. Measurement unit: i2c_sclk
        TIME: u9,
        padding: u23 = 0,
    }),
    /// Configures the sample time after a positive SCL edge.
    /// offset: 0x34
    SDA_SAMPLE: mmio.Mmio(packed struct(u32) {
        /// Configures the sample time after a positive SCL edge. Measurement unit: i2c_sclk
        TIME: u9,
        padding: u23 = 0,
    }),
    /// Configures the high level width of SCL
    /// offset: 0x38
    SCL_HIGH_PERIOD: mmio.Mmio(packed struct(u32) {
        /// Configures for how long SCL remains high in master mode. Measurement unit: i2c_sclk
        SCL_HIGH_PERIOD: u9,
        /// Configures the SCL_FSM's waiting period for SCL high level in master mode. Measurement unit: i2c_sclk
        SCL_WAIT_HIGH_PERIOD: u7,
        padding: u16 = 0,
    }),
    /// offset: 0x3c
    reserved60: [4]u8,
    /// Configures the delay between the SDA and SCL negative edge for a start condition
    /// offset: 0x40
    SCL_START_HOLD: mmio.Mmio(packed struct(u32) {
        /// Configures the time between the falling edge of SDA and the falling edge of SCL for a START condition. Measurement unit: i2c_sclk.
        TIME: u9,
        padding: u23 = 0,
    }),
    /// Configures the delay between the positive edge of SCL and the negative edge of SDA
    /// offset: 0x44
    SCL_RSTART_SETUP: mmio.Mmio(packed struct(u32) {
        /// Configures the time between the positive edge of SCL and the negative edge of SDA for a RESTART condition. Measurement unit: i2c_sclk
        TIME: u9,
        padding: u23 = 0,
    }),
    /// Configures the delay after the SCL clock edge for a stop condition
    /// offset: 0x48
    SCL_STOP_HOLD: mmio.Mmio(packed struct(u32) {
        /// Configures the delay after the STOP condition. Measurement unit: i2c_sclk
        TIME: u9,
        padding: u23 = 0,
    }),
    /// Configures the delay between the SDA and SCL rising edge for a stop condition. Measurement unit: i2c_sclk
    /// offset: 0x4c
    SCL_STOP_SETUP: mmio.Mmio(packed struct(u32) {
        /// Configures the time between the rising edge of SCL and the rising edge of SDA. Measurement unit: i2c_sclk
        TIME: u9,
        padding: u23 = 0,
    }),
    /// SCL and SDA filter configuration register
    /// offset: 0x50
    FILTER_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures the threshold pulse width to be filtered on SCL. When a pulse on the SCL input has smaller width than this register value, the I2C controller will ignore that pulse. Measurement unit: i2c_sclk
        SCL_FILTER_THRES: u4,
        /// Configures the threshold pulse width to be filtered on SDA. When a pulse on the SDA input has smaller width than this register value, the I2C controller will ignore that pulse. Measurement unit: i2c_sclk
        SDA_FILTER_THRES: u4,
        /// Configures to enable the filter function for SCL.
        SCL_FILTER_EN: u1,
        /// Configures to enable the filter function for SDA.
        SDA_FILTER_EN: u1,
        padding: u22 = 0,
    }),
    /// I2C CLK configuration register
    /// offset: 0x54
    CLK_CONF: mmio.Mmio(packed struct(u32) {
        /// the integral part of the fractional divisor for i2c module
        SCLK_DIV_NUM: u8,
        /// the numerator of the fractional part of the fractional divisor for i2c module
        SCLK_DIV_A: u6,
        /// the denominator of the fractional part of the fractional divisor for i2c module
        SCLK_DIV_B: u6,
        /// The clock selection for i2c module:0-XTAL,1-CLK_8MHz.
        SCLK_SEL: u1,
        /// The clock switch for i2c module
        SCLK_ACTIVE: u1,
        padding: u10 = 0,
    }),
    /// I2C command register 0
    /// offset: 0x58
    COMD0: mmio.Mmio(packed struct(u32) {
        /// Configures command 0. It consists of three parts: op_code is the command, 0: RSTART, 1: WRITE, 2: READ, 3: STOP, 4: END. Byte_num represents the number of bytes that need to be sent or received. ack_check_en, ack_exp and ack are used to control the ACK bit. See I2C cmd structure for more information.
        COMMAND0: u14,
        reserved31: u17 = 0,
        /// Represents whether command 0 is done in I2C Master mode. 0: Not done 1: Done
        COMMAND0_DONE: u1,
    }),
    /// I2C command register 1
    /// offset: 0x5c
    COMD1: mmio.Mmio(packed struct(u32) {
        /// Configures command 1. See details in I2C_CMD0_REG[13:0].
        COMMAND1: u14,
        reserved31: u17 = 0,
        /// Represents whether command 1 is done in I2C Master mode. 0: Not done 1: Done
        COMMAND1_DONE: u1,
    }),
    /// I2C command register 2
    /// offset: 0x60
    COMD2: mmio.Mmio(packed struct(u32) {
        /// Configures command 2. See details in I2C_CMD0_REG[13:0].
        COMMAND2: u14,
        reserved31: u17 = 0,
        /// Represents whether command 2 is done in I2C Master mode. 0: Not done 1: Done
        COMMAND2_DONE: u1,
    }),
    /// I2C command register 3
    /// offset: 0x64
    COMD3: mmio.Mmio(packed struct(u32) {
        /// Configures command 3. See details in I2C_CMD0_REG[13:0].
        COMMAND3: u14,
        reserved31: u17 = 0,
        /// Represents whether command 3 is done in I2C Master mode. 0: Not done 1: Done
        COMMAND3_DONE: u1,
    }),
    /// I2C command register 4
    /// offset: 0x68
    COMD4: mmio.Mmio(packed struct(u32) {
        /// Configures command 4. See details in I2C_CMD0_REG[13:0].
        COMMAND4: u14,
        reserved31: u17 = 0,
        /// Represents whether command 4 is done in I2C Master mode. 0: Not done 1: Done
        COMMAND4_DONE: u1,
    }),
    /// I2C command register 5
    /// offset: 0x6c
    COMD5: mmio.Mmio(packed struct(u32) {
        /// Configures command 5. See details in I2C_CMD0_REG[13:0].
        COMMAND5: u14,
        reserved31: u17 = 0,
        /// Represents whether command 5 is done in I2C Master mode. 0: Not done 1: Done
        COMMAND5_DONE: u1,
    }),
    /// I2C command register 6
    /// offset: 0x70
    COMD6: mmio.Mmio(packed struct(u32) {
        /// Configures command 6. See details in I2C_CMD0_REG[13:0].
        COMMAND6: u14,
        reserved31: u17 = 0,
        /// Represents whether command 6 is done in I2C Master mode. 0: Not done 1: Done
        COMMAND6_DONE: u1,
    }),
    /// I2C command register 7
    /// offset: 0x74
    COMD7: mmio.Mmio(packed struct(u32) {
        /// Configures command 7. See details in I2C_CMD0_REG[13:0].
        COMMAND7: u14,
        reserved31: u17 = 0,
        /// Represents whether command 7 is done in I2C Master mode. 0: Not done 1: Done
        COMMAND7_DONE: u1,
    }),
    /// SCL status time out register
    /// offset: 0x78
    SCL_ST_TIME_OUT: mmio.Mmio(packed struct(u32) {
        /// Configures the threshold value of SCL_FSM state unchanged period. It should be no more than 23. Measurement unit: i2c_sclk
        SCL_ST_TO_I2C: u5,
        padding: u27 = 0,
    }),
    /// SCL main status time out register
    /// offset: 0x7c
    SCL_MAIN_ST_TIME_OUT: mmio.Mmio(packed struct(u32) {
        /// Configures the threshold value of SCL_MAIN_FSM state unchanged period.nIt should be no more than 23. Measurement unit: i2c_sclk
        SCL_MAIN_ST_TO_I2C: u5,
        padding: u27 = 0,
    }),
    /// Power configuration register
    /// offset: 0x80
    SCL_SP_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures to send out SCL pulses when I2C master is IDLE. The number of pulses equals to reg_scl_rst_slv_num[4:0].
        SCL_RST_SLV_EN: u1,
        /// Configure the pulses of SCL generated in I2C master mode. Valid when reg_scl_rst_slv_en is 1. Measurement unit: i2c_sclk
        SCL_RST_SLV_NUM: u5,
        /// Configures to power down the I2C output SCL line. 0: Not power down. 1: Power down. Valid only when reg_scl_force_out is 1.
        SCL_PD_EN: u1,
        /// Configures to power down the I2C output SDA line. 0: Not power down. 1: Power down. Valid only when reg_sda_force_out is 1.
        SDA_PD_EN: u1,
        padding: u24 = 0,
    }),
    /// Set SCL stretch of I2C slave
    /// offset: 0x84
    SCL_STRETCH_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the time period to release the SCL line from stretching to avoid timing violation. Usually it should be larger than the SDA setup time. Measurement unit: i2c_sclk
        STRETCH_PROTECT_NUM: u10,
        /// Configures to enable slave SCL stretch function. 0: Disable 1: Enable The SCL output line will be stretched low when reg_slave_scl_stretch_en is 1 and stretch event happens. The stretch cause can be seen in reg_stretch_cause.
        SLAVE_SCL_STRETCH_EN: u1,
        /// Configures to clear the I2C slave SCL stretch function. 0: No effect 1: Clear
        SLAVE_SCL_STRETCH_CLR: u1,
        /// Configures to enable the function for slave to control ACK level. 0: Disable 1: Enable
        SLAVE_BYTE_ACK_CTL_EN: u1,
        /// Set the ACK level when slave controlling ACK level function enables. 0: Low level 1: High level
        SLAVE_BYTE_ACK_LVL: u1,
        padding: u18 = 0,
    }),
    /// offset: 0x88
    reserved136: [112]u8,
    /// Version register
    /// offset: 0xf8
    DATE: mmio.Mmio(packed struct(u32) {
        /// Version control register.
        DATE: u32,
    }),
    /// offset: 0xfc
    reserved252: [4]u8,
    /// I2C TXFIFO base address register
    /// offset: 0x100
    TXFIFO_START_ADDR: mmio.Mmio(packed struct(u32) {
        /// Represents the I2C txfifo first address.
        TXFIFO_START_ADDR: u32,
    }),
    /// offset: 0x104
    reserved260: [124]u8,
    /// I2C RXFIFO base address register
    /// offset: 0x180
    RXFIFO_START_ADDR: mmio.Mmio(packed struct(u32) {
        /// Represents the I2C rxfifo first address.
        RXFIFO_START_ADDR: u32,
    }),
};
