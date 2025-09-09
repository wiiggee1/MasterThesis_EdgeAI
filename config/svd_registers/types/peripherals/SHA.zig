const mmio = @import("mmio");
const types = @import("../../types.zig");

/// SHA (Secure Hash Algorithm) Accelerator
pub const SHA = extern struct {
    /// Initial configuration register.
    /// offset: 0x00
    MODE: mmio.Mmio(packed struct(u32) {
        /// Sha mode.
        MODE: u3,
        padding: u29 = 0,
    }),
    /// SHA 512/t configuration register 0.
    /// offset: 0x04
    T_STRING: mmio.Mmio(packed struct(u32) {
        /// Sha t_string (used if and only if mode == SHA_512/t).
        T_STRING: u32,
    }),
    /// SHA 512/t configuration register 1.
    /// offset: 0x08
    T_LENGTH: mmio.Mmio(packed struct(u32) {
        /// Sha t_length (used if and only if mode == SHA_512/t).
        T_LENGTH: u6,
        padding: u26 = 0,
    }),
    /// DMA configuration register 0.
    /// offset: 0x0c
    DMA_BLOCK_NUM: mmio.Mmio(packed struct(u32) {
        /// Dma-sha block number.
        DMA_BLOCK_NUM: u6,
        padding: u26 = 0,
    }),
    /// Typical SHA configuration register 0.
    /// offset: 0x10
    START: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Reserved.
        START: u31,
    }),
    /// Typical SHA configuration register 1.
    /// offset: 0x14
    CONTINUE: mmio.Mmio(packed struct(u32) {
        reserved1: u1 = 0,
        /// Reserved.
        CONTINUE: u31,
    }),
    /// Busy register.
    /// offset: 0x18
    BUSY: mmio.Mmio(packed struct(u32) {
        /// Sha busy state. 1'b0: idle. 1'b1: busy.
        STATE: u1,
        padding: u31 = 0,
    }),
    /// DMA configuration register 1.
    /// offset: 0x1c
    DMA_START: mmio.Mmio(packed struct(u32) {
        /// Start dma-sha.
        DMA_START: u1,
        padding: u31 = 0,
    }),
    /// DMA configuration register 2.
    /// offset: 0x20
    DMA_CONTINUE: mmio.Mmio(packed struct(u32) {
        /// Continue dma-sha.
        DMA_CONTINUE: u1,
        padding: u31 = 0,
    }),
    /// Interrupt clear register.
    /// offset: 0x24
    CLEAR_IRQ: mmio.Mmio(packed struct(u32) {
        /// Clear sha interrupt.
        CLEAR_INTERRUPT: u1,
        padding: u31 = 0,
    }),
    /// Interrupt enable register.
    /// offset: 0x28
    IRQ_ENA: mmio.Mmio(packed struct(u32) {
        /// Sha interrupt enable register. 1'b0: disable(default). 1'b1: enable.
        INTERRUPT_ENA: u1,
        padding: u31 = 0,
    }),
    /// Date register.
    /// offset: 0x2c
    DATE: mmio.Mmio(packed struct(u32) {
        /// Sha date information/ sha version information.
        DATE: u30,
        padding: u2 = 0,
    }),
    /// offset: 0x30
    reserved48: [16]u8,
    /// Sha H memory which contains intermediate hash or finial hash.
    /// offset: 0x40
    H_MEM: [64]u8,
    /// Sha M memory which contains message.
    /// offset: 0x80
    M_MEM: [64]u8,
};
