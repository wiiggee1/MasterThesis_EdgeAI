const mmio = @import("mmio");
const types = @import("../../types.zig");

/// I3C Controller (Master)
pub const I3C_MST = extern struct {
    /// DEVICE_CTRL register controls the transfer properties and disposition of controllers capabilities.
    /// offset: 0x00
    DEVICE_CTRL: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// This bit is used to include I3C broadcast address(0x7E) for private transfer.(If I3C broadcast address is not include for the private transfer, In-Band Interrupts driven from Slaves may not win address arbitration. Hence IBIs will get delayed)
        REG_BA_INCLUDE: u1,
        /// Transfer Start
        REG_TRANS_START: u1,
        /// NA
        REG_CLK_EN: u1,
        /// NA
        REG_IBI_RSTART_TRANS_EN: u1,
        /// NA
        REG_AUTO_DIS_IBI_EN: u1,
        /// NA
        REG_DMA_RX_EN: u1,
        /// NA
        REG_DMA_TX_EN: u1,
        /// 0: rx high bit first, 1: rx low bit first
        REG_MULTI_SLV_SINGLE_CCC_EN: u1,
        /// 0: rx low byte fist, 1: rx high byte first
        REG_RX_BIT_ORDER: u1,
        /// NA
        REG_RX_BYTE_ORDER: u1,
        /// This bit is used to force scl_pullup_en
        REG_SCL_PULLUP_FORCE_EN: u1,
        /// This bit is used to force scl_oe
        REG_SCL_OE_FORCE_EN: u1,
        /// NA
        REG_SDA_PP_RD_PULLUP_EN: u1,
        /// NA
        REG_SDA_RD_TBIT_HLVL_PULLUP_EN: u1,
        /// NA
        REG_SDA_PP_WR_PULLUP_EN: u1,
        /// 1: read current real-time updated value 0: read latch data byte cnt value
        REG_DATA_BYTE_CNT_UNLATCH: u1,
        /// 1: dev characteristic and address table memory clk date force on . 0 : clock gating by rd/wr.
        REG_MEM_CLK_FORCE_ON: u1,
        padding: u14 = 0,
    }),
    /// offset: 0x04
    reserved4: [24]u8,
    /// In-Band Interrupt Status Threshold Value . Every In Band Interrupt received by I3C controller generates an IBI status. This field controls the number of IBI status entries in the IBI buffer that trigger the IBI_STATUS_THLD_STAT interrupt.
    /// offset: 0x1c
    BUFFER_THLD_CTRL: mmio.Mmio(packed struct(u32) {
        /// Command Buffer Empty Threshold Value is used to control the number of empty locations(or greater) in the Command Buffer that trigger CMD_BUFFER_READY_STAT interrupt.
        REG_CMD_BUF_EMPTY_THLD: u4,
        reserved6: u2 = 0,
        /// Response Buffer Threshold Value is used to control the number of entries in the Response Buffer that trigger the RESP_READY_STAT_INTR.
        REG_RESP_BUF_THLD: u3,
        reserved12: u3 = 0,
        /// In-Band Interrupt Data Threshold Value . Every In Band Interrupt received by I3C controller generates an IBI status. This field controls the number of IBI data entries in the IBI buffer that trigger the IBI_DATA_THLD_STAT interrupt.
        REG_IBI_DATA_BUF_THLD: u3,
        reserved18: u3 = 0,
        /// NA
        REG_IBI_STATUS_BUF_THLD: u3,
        padding: u11 = 0,
    }),
    /// NA
    /// offset: 0x20
    DATA_BUFFER_THLD_CTRL: mmio.Mmio(packed struct(u32) {
        /// Transmit Buffer Threshold Value. This field controls the number of empty locations in the Transmit FIFO that trigger the TX_THLD_STAT interrupt. Supports values: 000:2 001:4 010:8 011:16 100:31, else:31
        REG_TX_DATA_BUF_THLD: u3,
        /// Receive Buffer Threshold Value. This field controls the number of empty locations in the Receive FIFO that trigger the RX_THLD_STAT interrupt. Supports: 000:2 001:4 010:8 011:16 100:31, else:31
        REG_RX_DATA_BUF_THLD: u3,
        padding: u26 = 0,
    }),
    /// NA
    /// offset: 0x24
    IBI_NOTIFY_CTRL: mmio.Mmio(packed struct(u32) {
        reserved2: u2 = 0,
        /// Notify Rejected Slave Interrupt Request Control. This bit is used to suppress reporting to the application about Slave Interrupt Request. 0:Suppress passing the IBI Status to the IBI FIFO(hence not notifying the application) when a SIR request is NACKed and auto-disabled base on the IBI_SIR_REQ_REJECT register. 1: Writes IBI Status to the IBI FIFO(hence notifying the application) when SIR request is NACKed and auto-disabled based on the IBI_SIR_REQ_REJECT registerl.
        REG_NOTIFY_SIR_REJECTED: u1,
        padding: u29 = 0,
    }),
    /// NA
    /// offset: 0x28
    IBI_SIR_REQ_PAYLOAD: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_SIR_REQ_PAYLOAD: u32,
    }),
    /// NA
    /// offset: 0x2c
    IBI_SIR_REQ_REJECT: mmio.Mmio(packed struct(u32) {
        /// The application of controller can decide whether to send ACK or NACK for Slave request received from any I3C device. A device specific response control bit is provided to select the response option, Master will ACK/NACK the Master Request based on programming of control bit, corresponding to the interrupting device. 0:ACK the SIR Request 1:NACK and send direct auto disable CCC
        REG_SIR_REQ_REJECT: u32,
    }),
    /// NA
    /// offset: 0x30
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// NA
        TX_DATA_BUF_THLD_INT_CLR: u1,
        /// NA
        RX_DATA_BUF_THLD_INT_CLR: u1,
        /// NA
        IBI_STATUS_THLD_INT_CLR: u1,
        /// NA
        CMD_BUF_EMPTY_THLD_INT_CLR: u1,
        /// NA
        RESP_READY_INT_CLR: u1,
        /// NA
        NXT_CMD_REQ_ERR_INT_CLR: u1,
        /// NA
        TRANSFER_ERR_INT_CLR: u1,
        /// NA
        TRANSFER_COMPLETE_INT_CLR: u1,
        /// NA
        COMMAND_DONE_INT_CLR: u1,
        /// NA
        DETECT_START_INT_CLR: u1,
        /// NA
        RESP_BUF_OVF_INT_CLR: u1,
        /// NA
        IBI_DATA_BUF_OVF_INT_CLR: u1,
        /// NA
        IBI_STATUS_BUF_OVF_INT_CLR: u1,
        /// NA
        IBI_HANDLE_DONE_INT_CLR: u1,
        /// NA
        IBI_DETECT_INT_CLR: u1,
        /// NA
        CMD_CCC_MISMATCH_INT_CLR: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x34
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// NA
        TX_DATA_BUF_THLD_INT_RAW: u1,
        /// NA
        RX_DATA_BUF_THLD_INT_RAW: u1,
        /// NA
        IBI_STATUS_THLD_INT_RAW: u1,
        /// NA
        CMD_BUF_EMPTY_THLD_INT_RAW: u1,
        /// NA
        RESP_READY_INT_RAW: u1,
        /// NA
        NXT_CMD_REQ_ERR_INT_RAW: u1,
        /// NA
        TRANSFER_ERR_INT_RAW: u1,
        /// NA
        TRANSFER_COMPLETE_INT_RAW: u1,
        /// NA
        COMMAND_DONE_INT_RAW: u1,
        /// NA
        DETECT_START_INT_RAW: u1,
        /// NA
        RESP_BUF_OVF_INT_RAW: u1,
        /// NA
        IBI_DATA_BUF_OVF_INT_RAW: u1,
        /// NA
        IBI_STATUS_BUF_OVF_INT_RAW: u1,
        /// NA
        IBI_HANDLE_DONE_INT_RAW: u1,
        /// NA
        IBI_DETECT_INT_RAW: u1,
        /// NA
        CMD_CCC_MISMATCH_INT_RAW: u1,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x38
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// This interrupt is generated when number of empty locations in transmit buffer is greater than or equal to threshold value specified by TX_EMPTY_BUS_THLD field in DATA_BUFFER_THLD_CTRL register. This interrupt will be cleared automatically when number of empty locations in transmit buffer is less than threshold value.
        TX_DATA_BUF_THLD_INT_ST: u1,
        /// This interrupt is generated when number of entries in receive buffer is greater than or equal to threshold value specified by RX_BUF_THLD field in DATA_BUFFER_THLD_CTRL register. This interrupt will be cleared automatically when number of entries in receive buffer is less than threshold value.
        RX_DATA_BUF_THLD_INT_ST: u1,
        /// Only used in master mode. This interrupt is generated when number of entries in IBI buffer is greater than or equal to threshold value specified by IBI_BUF_THLD field in BUFFER_THLD_CTRL register. This interrupt will be cleared automatically when number of entries in IBI buffer is less than threshold value.
        IBI_STATUS_THLD_INT_ST: u1,
        /// This interrupt is generated when number of empty locations in command buffer is greater than or equal to threshold value specified by CMD_EMPTY_BUF_THLD field in BUFFER_THLD_CTRL register. This interrupt will be cleared automatically when number of empty locations in command buffer is less than threshold value.
        CMD_BUF_EMPTY_THLD_INT_ST: u1,
        /// This interrupt is generated when number of entries in response buffer is greater than or equal to threshold value specified by RESP_BUF_THLD field in BUFFER_THLD_CTRL register. This interrupt will be cleared automatically when number of entries in response buffer is less than threshold value.
        RESP_READY_INT_ST: u1,
        /// This interrupt is generated if toc is 0(master will restart next command), but command buf is empty.
        NXT_CMD_REQ_ERR_INT_ST: u1,
        /// This interrupt is generated if any error occurs during transfer. The error type will be specified in the response packet associated with the command (in ERR_STATUS field of RESPONSE_BUFFER_PORT register). This bit can be cleared by writing 1'h1.
        TRANSFER_ERR_INT_ST: u1,
        /// NA
        TRANSFER_COMPLETE_INT_ST: u1,
        /// NA
        COMMAND_DONE_INT_ST: u1,
        /// NA
        DETECT_START_INT_ST: u1,
        /// NA
        RESP_BUF_OVF_INT_ST: u1,
        /// NA
        IBI_DATA_BUF_OVF_INT_ST: u1,
        /// NA
        IBI_STATUS_BUF_OVF_INT_ST: u1,
        /// NA
        IBI_HANDLE_DONE_INT_ST: u1,
        /// NA
        IBI_DETECT_INT_ST: u1,
        /// NA
        CMD_CCC_MISMATCH_INT_ST: u1,
        padding: u16 = 0,
    }),
    /// The Interrupt status will be updated in INTR_STATUS register if corresponding Status Enable bit set.
    /// offset: 0x3c
    INT_ST_ENA: mmio.Mmio(packed struct(u32) {
        /// Transmit Buffer threshold status enable.
        TX_DATA_BUF_THLD_INT_ENA: u1,
        /// Receive Buffer threshold status enable.
        RX_DATA_BUF_THLD_INT_ENA: u1,
        /// Only used in master mode. IBI Buffer threshold status enable.
        IBI_STATUS_THLD_INT_ENA: u1,
        /// Command buffer ready status enable.
        CMD_BUF_EMPTY_THLD_INT_ENA: u1,
        /// Response buffer ready status enable.
        RESP_READY_INT_ENA: u1,
        /// next command request error status enable
        NXT_CMD_REQ_ERR_INT_ENA: u1,
        /// Transfer error status enable
        TRANSFER_ERR_INT_ENA: u1,
        /// NA
        TRANSFER_COMPLETE_INT_ENA: u1,
        /// NA
        COMMAND_DONE_INT_ENA: u1,
        /// NA
        DETECT_START_INT_ENA: u1,
        /// NA
        RESP_BUF_OVF_INT_ENA: u1,
        /// NA
        IBI_DATA_BUF_OVF_INT_ENA: u1,
        /// NA
        IBI_STATUS_BUF_OVF_INT_ENA: u1,
        /// NA
        IBI_HANDLE_DONE_INT_ENA: u1,
        /// NA
        IBI_DETECT_INT_ENA: u1,
        /// NA
        CMD_CCC_MISMATCH_INT_ENA: u1,
        padding: u16 = 0,
    }),
    /// offset: 0x40
    reserved64: [4]u8,
    /// NA
    /// offset: 0x44
    RESET_CTRL: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_CORE_SOFT_RST: u1,
        /// NA
        REG_CMD_BUF_RST: u1,
        /// NA
        REG_RESP_BUF_RST: u1,
        /// NA
        REG_TX_DATA_BUF_BUF_RST: u1,
        /// NA
        REG_RX_DATA_BUF_RST: u1,
        /// NA
        REG_IBI_DATA_BUF_RST: u1,
        /// NA
        REG_IBI_STATUS_BUF_RST: u1,
        padding: u25 = 0,
    }),
    /// BUFFER_STATUS_LEVEL reflects the status level of Buffers in the controller.
    /// offset: 0x48
    BUFFER_STATUS_LEVEL: mmio.Mmio(packed struct(u32) {
        /// Command Buffer Empty Locations contains the number of empty locations in the command buffer.
        CMD_BUF_EMPTY_CNT: u5,
        reserved8: u3 = 0,
        /// Response Buffer Level Value contains the number of valid data entries in the response buffer.
        RESP_BUF_CNT: u4,
        reserved16: u4 = 0,
        /// IBI Buffer Level Value contains the number of valid entries in the IBI Buffer. This is field is used in master mode.
        IBI_DATA_BUF_CNT: u4,
        reserved24: u4 = 0,
        /// IBI Buffer Status Count contains the number of IBI status entries in the IBI Buffer. This field is used in master mode.
        IBI_STATUS_BUF_CNT: u4,
        padding: u4 = 0,
    }),
    /// DATA_BUFFER_STATUS_LEVEL reflects the status level of the Buffers in the controller.
    /// offset: 0x4c
    DATA_BUFFER_STATUS_LEVEL: mmio.Mmio(packed struct(u32) {
        /// Transmit Buffer Empty Level Value contains the number of empty locations in the transmit Buffer.
        TX_DATA_BUF_EMPTY_CNT: u6,
        reserved16: u10 = 0,
        /// Receive Buffer Level value contains the number of valid data entries in the receive buffer.
        RX_DATA_BUF_CNT: u6,
        padding: u10 = 0,
    }),
    /// NA
    /// offset: 0x50
    PRESENT_STATE0: mmio.Mmio(packed struct(u32) {
        /// This bit is used to check the SCL line level to recover from error and for debugging. This bit reflects the value of synchronized scl_in_a.
        SDA_LVL: u1,
        /// This bit is used to check the SDA line level to recover from error and for debugging. This bit reflects the value of synchronized sda_in_a.
        SCL_LVL: u1,
        /// NA
        BUS_BUSY: u1,
        /// NA
        BUS_FREE: u1,
        reserved9: u5 = 0,
        /// NA
        CMD_TID: u4,
        /// NA
        SCL_GEN_FSM_STATE: u3,
        /// NA
        IBI_EV_HANDLE_FSM_STATE: u3,
        /// NA
        I2C_MODE_FSM_STATE: u3,
        /// NA
        SDR_MODE_FSM_STATE: u4,
        /// Reflects whether the Master Controller is in IDLE or not. This bit will be set when all the buffer(Command, Response, IBI, Transmit, Receive) are empty along with the Master State machine is in idle state. 0X0: not in idle 0x1: in idle
        DAA_MODE_FSM_STATE: u3,
        /// NA
        MAIN_FSM_STATE: u3,
    }),
    /// NA
    /// offset: 0x54
    PRESENT_STATE1: mmio.Mmio(packed struct(u32) {
        /// Present transfer data byte cnt: tx data byte cnt if write rx data byte cnt if read ibi data byte cnt if IBI handle.
        DATA_BYTE_CNT: u16,
        padding: u16 = 0,
    }),
    /// Pointer for Device Address Table
    /// offset: 0x58
    DEVICE_TABLE: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_DCT_DAA_INIT_INDEX: u4,
        /// NA
        REG_DAT_DAA_INIT_INDEX: u4,
        /// NA
        PRESENT_DCT_INDEX: u4,
        /// NA
        PRESENT_DAT_INDEX: u4,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x5c
    TIME_OUT_VALUE: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_RESP_BUF_TO_VALUE: u5,
        /// NA
        REG_RESP_BUF_TO_EN: u1,
        /// NA
        REG_IBI_DATA_BUF_TO_VALUE: u5,
        /// NA
        REG_IBI_DATA_BUF_TO_EN: u1,
        /// NA
        REG_IBI_STATUS_BUF_TO_VALUE: u5,
        /// NA
        REG_IBI_STATUS_BUF_TO_EN: u1,
        /// NA
        REG_RX_DATA_BUF_TO_VALUE: u5,
        /// NA
        REG_RX_DATA_BUF_TO_EN: u1,
        padding: u8 = 0,
    }),
    /// NA
    /// offset: 0x60
    SCL_I3C_MST_OD_TIME: mmio.Mmio(packed struct(u32) {
        /// SCL Open-Drain low count for I3C transfers targeted to I3C devices.
        REG_I3C_MST_OD_LOW_PERIOD: u16,
        /// SCL Open-Drain High count for I3C transfers targeted to I3C devices.
        REG_I3C_MST_OD_HIGH_PERIOD: u16,
    }),
    /// NA
    /// offset: 0x64
    SCL_I3C_MST_PP_TIME: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_I3C_MST_PP_LOW_PERIOD: u8,
        reserved16: u8 = 0,
        /// NA
        REG_I3C_MST_PP_HIGH_PERIOD: u8,
        padding: u8 = 0,
    }),
    /// NA
    /// offset: 0x68
    SCL_I2C_FM_TIME: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_I2C_FM_LOW_PERIOD: u16,
        /// The SCL open-drain low count timing for I2C Fast Mode transfers.
        REG_I2C_FM_HIGH_PERIOD: u16,
    }),
    /// NA
    /// offset: 0x6c
    SCL_I2C_FMP_TIME: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_I2C_FMP_LOW_PERIOD: u16,
        /// NA
        REG_I2C_FMP_HIGH_PERIOD: u8,
        padding: u8 = 0,
    }),
    /// NA
    /// offset: 0x70
    SCL_EXT_LOW_TIME: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_I3C_MST_EXT_LOW_PERIOD1: u8,
        /// NA
        REG_I3C_MST_EXT_LOW_PERIOD2: u8,
        /// NA
        REG_I3C_MST_EXT_LOW_PERIOD3: u8,
        /// NA
        REG_I3C_MST_EXT_LOW_PERIOD4: u8,
    }),
    /// NA
    /// offset: 0x74
    SDA_SAMPLE_TIME: mmio.Mmio(packed struct(u32) {
        /// It is used to adjust sda sample point when scl high under open drain speed
        REG_SDA_OD_SAMPLE_TIME: u9,
        /// It is used to adjust sda sample point when scl high under push pull speed
        REG_SDA_PP_SAMPLE_TIME: u5,
        padding: u18 = 0,
    }),
    /// NA
    /// offset: 0x78
    SDA_HOLD_TIME: mmio.Mmio(packed struct(u32) {
        /// It is used to adjust sda drive point after scl neg under open drain speed
        REG_SDA_OD_TX_HOLD_TIME: u9,
        /// It is used to adjust sda dirve point after scl neg under push pull speed
        REG_SDA_PP_TX_HOLD_TIME: u5,
        padding: u18 = 0,
    }),
    /// NA
    /// offset: 0x7c
    SCL_START_HOLD: mmio.Mmio(packed struct(u32) {
        /// I2C_SCL_START_HOLD_TIME
        REG_SCL_START_HOLD_TIME: u9,
        /// NA
        REG_START_DET_HOLD_TIME: u2,
        padding: u21 = 0,
    }),
    /// NA
    /// offset: 0x80
    SCL_RSTART_SETUP: mmio.Mmio(packed struct(u32) {
        /// I2C_SCL_RSTART_SETUP_TIME
        REG_SCL_RSTART_SETUP_TIME: u9,
        padding: u23 = 0,
    }),
    /// NA
    /// offset: 0x84
    SCL_STOP_HOLD: mmio.Mmio(packed struct(u32) {
        /// I2C_SCL_STOP_HOLD_TIME
        REG_SCL_STOP_HOLD_TIME: u9,
        padding: u23 = 0,
    }),
    /// NA
    /// offset: 0x88
    SCL_STOP_SETUP: mmio.Mmio(packed struct(u32) {
        /// I2C_SCL_STOP_SETUP_TIME
        REG_SCL_STOP_SETUP_TIME: u9,
        padding: u23 = 0,
    }),
    /// offset: 0x8c
    reserved140: [4]u8,
    /// NA
    /// offset: 0x90
    BUS_FREE_TIME: mmio.Mmio(packed struct(u32) {
        /// I3C Bus Free Count Value. This field is used only in Master mode. In pure Bus System, this field represents tCAS. In Mixed Bus System, this field is expected to be programmed to tLOW of I2C Timing.
        REG_BUS_FREE_TIME: u16,
        padding: u16 = 0,
    }),
    /// NA
    /// offset: 0x94
    SCL_TERMN_T_EXT_LOW_TIME: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_I3C_MST_TERMN_T_EXT_LOW_TIME: u8,
        padding: u24 = 0,
    }),
    /// offset: 0x98
    reserved152: [8]u8,
    /// NA
    /// offset: 0xa0
    VER_ID: mmio.Mmio(packed struct(u32) {
        /// This field indicates the controller current release number that is read by an application.
        REG_I3C_MST_VER_ID: u32,
    }),
    /// NA
    /// offset: 0xa4
    VER_TYPE: mmio.Mmio(packed struct(u32) {
        /// This field indicates the controller current release type that is read by an application.
        REG_I3C_MST_VER_TYPE: u32,
    }),
    /// offset: 0xa8
    reserved168: [4]u8,
    /// NA
    /// offset: 0xac
    FPGA_DEBUG_PROBE: mmio.Mmio(packed struct(u32) {
        /// For Debug Probe Test on FPGA
        REG_I3C_MST_FPGA_DEBUG_PROBE: u32,
    }),
    /// NA
    /// offset: 0xb0
    RND_ECO_CS: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_RND_ECO_EN: u1,
        /// NA
        RND_ECO_RESULT: u1,
        padding: u30 = 0,
    }),
    /// NA
    /// offset: 0xb4
    RND_ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_RND_ECO_LOW: u32,
    }),
    /// NA
    /// offset: 0xb8
    RND_ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_RND_ECO_HIGH: u32,
    }),
};
