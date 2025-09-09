const mmio = @import("mmio");
const types = @import("../../types.zig");

/// HMAC (Hash-based Message Authentication Code) Accelerator
pub const HMAC = extern struct {
    /// offset: 0x00
    reserved0: [64]u8,
    /// Process control register 0.
    /// offset: 0x40
    SET_START: mmio.Mmio(packed struct(u32) {
        /// Start hmac operation.
        SET_START: u1,
        padding: u31 = 0,
    }),
    /// Configure purpose.
    /// offset: 0x44
    SET_PARA_PURPOSE: mmio.Mmio(packed struct(u32) {
        /// Set hmac parameter purpose.
        PURPOSE_SET: u4,
        padding: u28 = 0,
    }),
    /// Configure key.
    /// offset: 0x48
    SET_PARA_KEY: mmio.Mmio(packed struct(u32) {
        /// Set hmac parameter key.
        KEY_SET: u3,
        padding: u29 = 0,
    }),
    /// Finish initial configuration.
    /// offset: 0x4c
    SET_PARA_FINISH: mmio.Mmio(packed struct(u32) {
        /// Finish hmac configuration.
        SET_PARA_END: u1,
        padding: u31 = 0,
    }),
    /// Process control register 1.
    /// offset: 0x50
    SET_MESSAGE_ONE: mmio.Mmio(packed struct(u32) {
        /// Call SHA to calculate one message block.
        SET_TEXT_ONE: u1,
        padding: u31 = 0,
    }),
    /// Process control register 2.
    /// offset: 0x54
    SET_MESSAGE_ING: mmio.Mmio(packed struct(u32) {
        /// Continue typical hmac.
        SET_TEXT_ING: u1,
        padding: u31 = 0,
    }),
    /// Process control register 3.
    /// offset: 0x58
    SET_MESSAGE_END: mmio.Mmio(packed struct(u32) {
        /// Start hardware padding.
        SET_TEXT_END: u1,
        padding: u31 = 0,
    }),
    /// Process control register 4.
    /// offset: 0x5c
    SET_RESULT_FINISH: mmio.Mmio(packed struct(u32) {
        /// After read result from upstream, then let hmac back to idle.
        SET_RESULT_END: u1,
        padding: u31 = 0,
    }),
    /// Invalidate register 0.
    /// offset: 0x60
    SET_INVALIDATE_JTAG: mmio.Mmio(packed struct(u32) {
        /// Clear result from hmac downstream JTAG.
        SET_INVALIDATE_JTAG: u1,
        padding: u31 = 0,
    }),
    /// Invalidate register 1.
    /// offset: 0x64
    SET_INVALIDATE_DS: mmio.Mmio(packed struct(u32) {
        /// Clear result from hmac downstream DS.
        SET_INVALIDATE_DS: u1,
        padding: u31 = 0,
    }),
    /// Error register.
    /// offset: 0x68
    QUERY_ERROR: mmio.Mmio(packed struct(u32) {
        /// Hmac configuration state. 0: key are agree with purpose. 1: error
        QUREY_CHECK: u1,
        padding: u31 = 0,
    }),
    /// Busy register.
    /// offset: 0x6c
    QUERY_BUSY: mmio.Mmio(packed struct(u32) {
        /// Hmac state. 1'b0: idle. 1'b1: busy
        BUSY_STATE: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x70
    reserved112: [16]u8,
    /// Message block memory.
    /// offset: 0x80
    WR_MESSAGE_MEM: [64]u8,
    /// Result from upstream.
    /// offset: 0xc0
    RD_RESULT_MEM: [32]u8,
    /// offset: 0xe0
    reserved224: [16]u8,
    /// Process control register 5.
    /// offset: 0xf0
    SET_MESSAGE_PAD: mmio.Mmio(packed struct(u32) {
        /// Start software padding.
        SET_TEXT_PAD: u1,
        padding: u31 = 0,
    }),
    /// Process control register 6.
    /// offset: 0xf4
    ONE_BLOCK: mmio.Mmio(packed struct(u32) {
        /// Don't have to do padding.
        SET_ONE_BLOCK: u1,
        padding: u31 = 0,
    }),
    /// Jtag register 0.
    /// offset: 0xf8
    SOFT_JTAG_CTRL: mmio.Mmio(packed struct(u32) {
        /// Turn on JTAG verification.
        SOFT_JTAG_CTRL: u1,
        padding: u31 = 0,
    }),
    /// Jtag register 1.
    /// offset: 0xfc
    WR_JTAG: mmio.Mmio(packed struct(u32) {
        /// 32-bit of key to be compared.
        WR_JTAG: u32,
    }),
    /// offset: 0x100
    reserved256: [252]u8,
    /// Date register.
    /// offset: 0x1fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// Hmac date information/ hmac version information.
        DATE: u30,
        padding: u2 = 0,
    }),
};
