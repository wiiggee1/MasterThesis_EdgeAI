const mmio = @import("mmio");
const types = @import("../../types.zig");

/// I3C_MST_MEM Peripheral
pub const I3C_MST_MEM = extern struct {
    /// offset: 0x00
    reserved0: [8]u8,
    /// NA
    /// offset: 0x08
    COMMAND_BUF_PORT: mmio.Mmio(packed struct(u32) {
        /// Contains a Command Descriptor structure that depends on the requested transfer type. Command Descriptor structure is used to schedule the transfers to devices on I3C bus.
        REG_COMMAND: u32,
    }),
    /// NA
    /// offset: 0x0c
    RESPONSE_BUF_PORT: mmio.Mmio(packed struct(u32) {
        /// The Response Buffer can be read through this register. The response status for each Command is written into the Response Buffer by the controller if ROC (Response On Completion) bit is set or if transfer error has occurred. The response buffer can be read through this register.
        RESPONSE: u32,
    }),
    /// NA
    /// offset: 0x10
    RX_DATA_PORT: mmio.Mmio(packed struct(u32) {
        /// Receive Data Port. Receive data is mapped to the Rx-data buffer and receive data is always packed in 4-byte aligned data words. If the length of data transfer is not aligned to 4-bytes boundary, then there will be extra(unused) bytes(the additional data bytes have to be ignored) at the end of the transferred data. The valid data must be identified using the DATA_LENGTH filed in the Response Descriptor.
        RX_DATA_PORT: u32,
    }),
    /// NA
    /// offset: 0x14
    TX_DATA_PORT: mmio.Mmio(packed struct(u32) {
        /// Transmit Data Port. Transmit data is mapped to the Tx-data buffer and transmit data is always packed in 4-byte aligned data words. If the length of data transfer is not aligned to 4-bytes boundary, then there will be extra(unused) bytes(the additional data bytes have to be ignored) at the end of the transferred data. The valid data must be identified using the DATA_LENGTH filed in the Response Descriptor.
        REG_TX_DATA_PORT: u32,
    }),
    /// In-Band Interrupt Buffer Status/Data Register. When receiving an IBI, IBI_PORT is used to both: Read the IBI Status Read the IBI Data(which is raw/opaque data)
    /// offset: 0x18
    IBI_STATUS_BUF: mmio.Mmio(packed struct(u32) {
        /// This field represents the length of data received along with IBI, in bytes.
        DATA_LENGTH: u8,
        /// IBI Identifier. The byte received after START which includes the address the R/W bit: Device address and R/W bit in case of Slave Interrupt or Master Request.
        IBI_ID: u8,
        reserved28: u12 = 0,
        /// IBI received data/status. IBI Data register is mapped to the IBI Buffer. The IBI Data is always packed in4-byte aligned and put to the IBI Buffer. This register When read from, reads the data from the IBI buffer. IBI Status register when read from, returns the data from the IBI Buffer and indicates how the controller responded to incoming IBI(SIR, MR and HJ).
        IBI_STS: u1,
        padding: u3 = 0,
    }),
    /// offset: 0x1c
    reserved28: [36]u8,
    /// NA
    /// offset: 0x40
    IBI_DATA_BUF: mmio.Mmio(packed struct(u32) {
        /// NA
        IBI_DATA: u32,
    }),
    /// offset: 0x44
    reserved68: [124]u8,
    /// NA
    /// offset: 0xc0
    DEV_ADDR_TABLE1_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV1_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV1_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV1_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV1_I2C: u1,
    }),
    /// NA
    /// offset: 0xc4
    DEV_ADDR_TABLE2_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV2_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV2_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV2_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV2_I2C: u1,
    }),
    /// NA
    /// offset: 0xc8
    DEV_ADDR_TABLE3_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV3_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV3_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV3_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV3_I2C: u1,
    }),
    /// NA
    /// offset: 0xcc
    DEV_ADDR_TABLE4_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV4_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV4_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV4_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV4_I2C: u1,
    }),
    /// NA
    /// offset: 0xd0
    DEV_ADDR_TABLE5_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV5_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV5_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV5_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV5_I2C: u1,
    }),
    /// NA
    /// offset: 0xd4
    DEV_ADDR_TABLE6_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV6_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV6_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV6_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV6_I2C: u1,
    }),
    /// NA
    /// offset: 0xd8
    DEV_ADDR_TABLE7_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV7_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV7_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV7_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV7_I2C: u1,
    }),
    /// NA
    /// offset: 0xdc
    DEV_ADDR_TABLE8_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV8_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV8_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV8_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV8_I2C: u1,
    }),
    /// NA
    /// offset: 0xe0
    DEV_ADDR_TABLE9_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV9_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV9_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV9_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV9_I2C: u1,
    }),
    /// NA
    /// offset: 0xe4
    DEV_ADDR_TABLE10_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV10_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV10_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV10_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV10_I2C: u1,
    }),
    /// NA
    /// offset: 0xe8
    DEV_ADDR_TABLE11_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV11_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV11_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV11_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV11_I2C: u1,
    }),
    /// NA
    /// offset: 0xec
    DEV_ADDR_TABLE12_LOC: mmio.Mmio(packed struct(u32) {
        /// NA
        REG_DAT_DEV12_STATIC_ADDR: u7,
        reserved16: u9 = 0,
        /// Device Dynamic Address with parity, The MSB,bit[23], should be programmed with parity of dynamic address.
        REG_DAT_DEV12_DYNAMIC_ADDR: u8,
        reserved29: u5 = 0,
        /// This field is used to set the Device NACK Retry count for the particular device. If the Device NACK's for the device address, the controller automatically retries the same device until this count expires. If the Slave does not ACK for the mentioned number of retries, then controller generates an error response and move to the Halt state.
        REG_DAT_DEV12_NACK_RETRY_CNT: u2,
        /// Legacy I2C device or not. This bit should be set to 1 if the device is a legacy I2C device.
        REG_DAT_DEV12_I2C: u1,
    }),
    /// offset: 0xf0
    reserved240: [16]u8,
    /// NA
    /// offset: 0x100
    DEV_CHAR_TABLE1_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV1_LOC1: u32,
    }),
    /// NA
    /// offset: 0x104
    DEV_CHAR_TABLE1_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV1_LOC2: u32,
    }),
    /// NA
    /// offset: 0x108
    DEV_CHAR_TABLE1_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV1_LOC3: u32,
    }),
    /// NA
    /// offset: 0x10c
    DEV_CHAR_TABLE1_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV1_LOC4: u32,
    }),
    /// NA
    /// offset: 0x110
    DEV_CHAR_TABLE2_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV2_LOC1: u32,
    }),
    /// NA
    /// offset: 0x114
    DEV_CHAR_TABLE2_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV2_LOC2: u32,
    }),
    /// NA
    /// offset: 0x118
    DEV_CHAR_TABLE2_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV2_LOC3: u32,
    }),
    /// NA
    /// offset: 0x11c
    DEV_CHAR_TABLE2_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV2_LOC4: u32,
    }),
    /// NA
    /// offset: 0x120
    DEV_CHAR_TABLE3_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV3_LOC1: u32,
    }),
    /// NA
    /// offset: 0x124
    DEV_CHAR_TABLE3_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV3_LOC2: u32,
    }),
    /// NA
    /// offset: 0x128
    DEV_CHAR_TABLE3_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV3_LOC3: u32,
    }),
    /// NA
    /// offset: 0x12c
    DEV_CHAR_TABLE3_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV3_LOC4: u32,
    }),
    /// NA
    /// offset: 0x130
    DEV_CHAR_TABLE4_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV4_LOC1: u32,
    }),
    /// NA
    /// offset: 0x134
    DEV_CHAR_TABLE4_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV4_LOC2: u32,
    }),
    /// NA
    /// offset: 0x138
    DEV_CHAR_TABLE4_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV4_LOC3: u32,
    }),
    /// NA
    /// offset: 0x13c
    DEV_CHAR_TABLE4_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV4_LOC4: u32,
    }),
    /// NA
    /// offset: 0x140
    DEV_CHAR_TABLE5_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV5_LOC1: u32,
    }),
    /// NA
    /// offset: 0x144
    DEV_CHAR_TABLE5_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV5_LOC2: u32,
    }),
    /// NA
    /// offset: 0x148
    DEV_CHAR_TABLE5_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV5_LOC3: u32,
    }),
    /// NA
    /// offset: 0x14c
    DEV_CHAR_TABLE5_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV5_LOC4: u32,
    }),
    /// NA
    /// offset: 0x150
    DEV_CHAR_TABLE6_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV6_LOC1: u32,
    }),
    /// NA
    /// offset: 0x154
    DEV_CHAR_TABLE6_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV6_LOC2: u32,
    }),
    /// NA
    /// offset: 0x158
    DEV_CHAR_TABLE6_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV6_LOC3: u32,
    }),
    /// NA
    /// offset: 0x15c
    DEV_CHAR_TABLE6_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV6_LOC4: u32,
    }),
    /// NA
    /// offset: 0x160
    DEV_CHAR_TABLE7_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV7_LOC1: u32,
    }),
    /// NA
    /// offset: 0x164
    DEV_CHAR_TABLE7_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV7_LOC2: u32,
    }),
    /// NA
    /// offset: 0x168
    DEV_CHAR_TABLE7_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV7_LOC3: u32,
    }),
    /// NA
    /// offset: 0x16c
    DEV_CHAR_TABLE7_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV7_LOC4: u32,
    }),
    /// NA
    /// offset: 0x170
    DEV_CHAR_TABLE8_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV8_LOC1: u32,
    }),
    /// NA
    /// offset: 0x174
    DEV_CHAR_TABLE8_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV8_LOC2: u32,
    }),
    /// NA
    /// offset: 0x178
    DEV_CHAR_TABLE8_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV8_LOC3: u32,
    }),
    /// NA
    /// offset: 0x17c
    DEV_CHAR_TABLE8_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV8_LOC4: u32,
    }),
    /// NA
    /// offset: 0x180
    DEV_CHAR_TABLE9_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV9_LOC1: u32,
    }),
    /// NA
    /// offset: 0x184
    DEV_CHAR_TABLE9_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV9_LOC2: u32,
    }),
    /// NA
    /// offset: 0x188
    DEV_CHAR_TABLE9_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV9_LOC3: u32,
    }),
    /// NA
    /// offset: 0x18c
    DEV_CHAR_TABLE9_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV9_LOC4: u32,
    }),
    /// NA
    /// offset: 0x190
    DEV_CHAR_TABLE10_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV10_LOC1: u32,
    }),
    /// NA
    /// offset: 0x194
    DEV_CHAR_TABLE10_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV10_LOC2: u32,
    }),
    /// NA
    /// offset: 0x198
    DEV_CHAR_TABLE10_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV10_LOC3: u32,
    }),
    /// NA
    /// offset: 0x19c
    DEV_CHAR_TABLE10_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV10_LOC4: u32,
    }),
    /// NA
    /// offset: 0x1a0
    DEV_CHAR_TABLE11_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV11_LOC1: u32,
    }),
    /// NA
    /// offset: 0x1a4
    DEV_CHAR_TABLE11_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV11_LOC2: u32,
    }),
    /// NA
    /// offset: 0x1a8
    DEV_CHAR_TABLE11_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV11_LOC3: u32,
    }),
    /// NA
    /// offset: 0x1ac
    DEV_CHAR_TABLE11_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV11_LOC4: u32,
    }),
    /// NA
    /// offset: 0x1b0
    DEV_CHAR_TABLE12_LOC1: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV12_LOC1: u32,
    }),
    /// NA
    /// offset: 0x1b4
    DEV_CHAR_TABLE12_LOC2: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV12_LOC2: u32,
    }),
    /// NA
    /// offset: 0x1b8
    DEV_CHAR_TABLE12_LOC3: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV12_LOC3: u32,
    }),
    /// NA
    /// offset: 0x1bc
    DEV_CHAR_TABLE12_LOC4: mmio.Mmio(packed struct(u32) {
        /// NA
        DCT_DEV12_LOC4: u32,
    }),
};
