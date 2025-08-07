const mmio = @import("mmio");
const types = @import("../../types.zig");

/// BITSCRAMBLER Peripheral
pub const BITSCRAMBLER = extern struct {
    /// Control and configuration registers
    /// offset: 0x00
    TX_INST_CFG0: mmio.Mmio(packed struct(u32) {
        /// write this bits to specify the one of 8 instruction
        TX_INST_IDX: u3,
        /// write this bits to specify the bit position of 257 bit instruction which in units of 32 bits
        TX_INST_POS: u4,
        padding: u25 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x04
    TX_INST_CFG1: mmio.Mmio(packed struct(u32) {
        /// write this bits to update instruction which specified by BITSCRAMBLER_TX_INST_CFG0_REG, Read this bits to get instruction which specified by BITSCRAMBLER_TX_INST_CFG0_REG
        TX_INST: u32,
    }),
    /// Control and configuration registers
    /// offset: 0x08
    RX_INST_CFG0: mmio.Mmio(packed struct(u32) {
        /// write this bits to specify the one of 8 instruction
        RX_INST_IDX: u3,
        /// write this bits to specify the bit position of 257 bit instruction which in units of 32 bits
        RX_INST_POS: u4,
        padding: u25 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x0c
    RX_INST_CFG1: mmio.Mmio(packed struct(u32) {
        /// write this bits to update instruction which specified by BITSCRAMBLER_RX_INST_CFG0_REG, Read this bits to get instruction which specified by BITSCRAMBLER_RX_INST_CFG0_REG
        RX_INST: u32,
    }),
    /// Control and configuration registers
    /// offset: 0x10
    TX_LUT_CFG0: mmio.Mmio(packed struct(u32) {
        /// write this bits to specify the bytes position of LUT RAM based on reg_bitscrambler_tx_lut_mode
        TX_LUT_IDX: u11,
        /// write this bits to specify the bytes mode of LUT RAM, 0: 1 byte,1: 2bytes, 2: 4 bytes
        TX_LUT_MODE: u2,
        padding: u19 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x14
    TX_LUT_CFG1: mmio.Mmio(packed struct(u32) {
        /// write this bits to update LUT which specified by BITSCRAMBLER_TX_LUT_CFG0_REG, Read this bits to get LUT which specified by BITSCRAMBLER_TX_LUT_CFG0_REG
        TX_LUT: u32,
    }),
    /// Control and configuration registers
    /// offset: 0x18
    RX_LUT_CFG0: mmio.Mmio(packed struct(u32) {
        /// write this bits to specify the bytes position of LUT RAM based on reg_bitscrambler_rx_lut_mode
        RX_LUT_IDX: u11,
        /// write this bits to specify the bytes mode of LUT RAM, 0: 1 byte,1: 2bytes, 2: 4 bytes
        RX_LUT_MODE: u2,
        padding: u19 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x1c
    RX_LUT_CFG1: mmio.Mmio(packed struct(u32) {
        /// write this bits to update LUT which specified by BITSCRAMBLER_RX_LUT_CFG0_REG, Read this bits to get LUT which specified by BITSCRAMBLER_RX_LUT_CFG0_REG
        RX_LUT: u32,
    }),
    /// Control and configuration registers
    /// offset: 0x20
    TX_TAILING_BITS: mmio.Mmio(packed struct(u32) {
        /// write this bits to specify the extra data bit length after getting EOF
        TX_TAILING_BITS: u16,
        padding: u16 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x24
    RX_TAILING_BITS: mmio.Mmio(packed struct(u32) {
        /// write this bits to specify the extra data bit length after getting EOF
        RX_TAILING_BITS: u16,
        padding: u16 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x28
    TX_CTRL: mmio.Mmio(packed struct(u32) {
        /// write this bit to enable the bitscrambler tx
        TX_ENA: u1,
        /// write this bit to pause the bitscrambler tx core
        TX_PAUSE: u1,
        /// write this bit to halt the bitscrambler tx core
        TX_HALT: u1,
        /// write this bit to ser the bitscrambler tx core EOF signal generating mode which is combined with reg_bitscrambler_tx_tailing_bits, 0: counter by read dma fifo, 0 counter by write peripheral buffer
        TX_EOF_MODE: u1,
        /// write this bit to specify the LOOP instruction condition mode of bitscrambler tx core, 0: use the little than operator to get the condition, 1: use not equal operator to get the condition
        TX_COND_MODE: u1,
        /// write this bit to set the bitscrambler tx core fetch instruction mode, 0: prefetch by reset, 1: fetch by instrutions
        TX_FETCH_MODE: u1,
        /// write this bit to set the bitscrambler tx core halt mode when tx_halt is set, 0: wait write data back done, , 1: ignore write data back
        TX_HALT_MODE: u1,
        /// write this bit to set the bitscrambler tx core read data mode when EOF received.0: wait read data, 1: ignore read data
        TX_RD_DUMMY: u1,
        /// write this bit to reset the bitscrambler tx fifo
        TX_FIFO_RST: u1,
        padding: u23 = 0,
    }),
    /// Control and configuration registers
    /// offset: 0x2c
    RX_CTRL: mmio.Mmio(packed struct(u32) {
        /// write this bit to enable the bitscrambler rx
        RX_ENA: u1,
        /// write this bit to pause the bitscrambler rx core
        RX_PAUSE: u1,
        /// write this bit to halt the bitscrambler rx core
        RX_HALT: u1,
        /// write this bit to ser the bitscrambler rx core EOF signal generating mode which is combined with reg_bitscrambler_rx_tailing_bits, 0: counter by read peripheral buffer, 0 counter by write dma fifo
        RX_EOF_MODE: u1,
        /// write this bit to specify the LOOP instruction condition mode of bitscrambler rx core, 0: use the little than operator to get the condition, 1: use not equal operator to get the condition
        RX_COND_MODE: u1,
        /// write this bit to set the bitscrambler rx core fetch instruction mode, 0: prefetch by reset, 1: fetch by instrutions
        RX_FETCH_MODE: u1,
        /// write this bit to set the bitscrambler rx core halt mode when rx_halt is set, 0: wait write data back done, , 1: ignore write data back
        RX_HALT_MODE: u1,
        /// write this bit to set the bitscrambler rx core read data mode when EOF received.0: wait read data, 1: ignore read data
        RX_RD_DUMMY: u1,
        /// write this bit to reset the bitscrambler rx fifo
        RX_FIFO_RST: u1,
        padding: u23 = 0,
    }),
    /// Status registers
    /// offset: 0x30
    TX_STATE: mmio.Mmio(packed struct(u32) {
        /// represents the bitscrambler tx core in halt mode
        TX_IN_IDLE: u1,
        /// represents the bitscrambler tx core in run mode
        TX_IN_RUN: u1,
        /// represents the bitscrambler tx core in wait mode to wait write back done
        TX_IN_WAIT: u1,
        /// represents the bitscrambler tx core in pause mode
        TX_IN_PAUSE: u1,
        /// represents the bitscrambler tx fifo in empty state
        TX_FIFO_EMPTY: u1,
        reserved16: u11 = 0,
        /// represents the bytes numbers of bitscrambler tx core when get EOF
        TX_EOF_GET_CNT: u14,
        /// represents the some EOFs will be lost for bitscrambler tx core
        TX_EOF_OVERLOAD: u1,
        /// write this bit to clear reg_bitscrambler_tx_eof_overload and reg_bitscrambler_tx_eof_get_cnt registers
        TX_EOF_TRACE_CLR: u1,
    }),
    /// Status registers
    /// offset: 0x34
    RX_STATE: mmio.Mmio(packed struct(u32) {
        /// represents the bitscrambler rx core in halt mode
        RX_IN_IDLE: u1,
        /// represents the bitscrambler rx core in run mode
        RX_IN_RUN: u1,
        /// represents the bitscrambler rx core in wait mode to wait write back done
        RX_IN_WAIT: u1,
        /// represents the bitscrambler rx core in pause mode
        RX_IN_PAUSE: u1,
        /// represents the bitscrambler rx fifo in full state
        RX_FIFO_FULL: u1,
        reserved16: u11 = 0,
        /// represents the bytes numbers of bitscrambler rx core when get EOF
        RX_EOF_GET_CNT: u14,
        /// represents the some EOFs will be lost for bitscrambler rx core
        RX_EOF_OVERLOAD: u1,
        /// write this bit to clear reg_bitscrambler_rx_eof_overload and reg_bitscrambler_rx_eof_get_cnt registers
        RX_EOF_TRACE_CLR: u1,
    }),
    /// offset: 0x38
    reserved56: [192]u8,
    /// Control and configuration registers
    /// offset: 0xf8
    SYS: mmio.Mmio(packed struct(u32) {
        /// write this bit to set the bitscrambler tx loop back to DMA rx
        LOOP_MODE: u1,
        reserved31: u30 = 0,
        /// Reserved
        CLK_EN: u1,
    }),
    /// Control and configuration registers
    /// offset: 0xfc
    VERSION: mmio.Mmio(packed struct(u32) {
        /// Reserved
        BITSCRAMBLER_VER: u28,
        padding: u4 = 0,
    }),
};
