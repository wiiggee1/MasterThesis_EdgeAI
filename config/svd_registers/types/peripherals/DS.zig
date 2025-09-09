const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Digital Signature
pub const DS = extern struct {
    /// memory that stores Y
    /// offset: 0x00
    Y_MEM: [512]u8,
    /// memory that stores M
    /// offset: 0x200
    M_MEM: [512]u8,
    /// memory that stores Rb
    /// offset: 0x400
    RB_MEM: [512]u8,
    /// memory that stores BOX
    /// offset: 0x600
    BOX_MEM: [48]u8,
    /// memory that stores IV
    /// offset: 0x630
    IV_MEM: [16]u8,
    /// offset: 0x640
    reserved1600: [448]u8,
    /// memory that stores X
    /// offset: 0x800
    X_MEM: [512]u8,
    /// memory that stores Z
    /// offset: 0xa00
    Z_MEM: [512]u8,
    /// offset: 0xc00
    reserved3072: [512]u8,
    /// DS start control register
    /// offset: 0xe00
    SET_START: mmio.Mmio(packed struct(u32) {
        /// set this bit to start DS operation.
        SET_START: u1,
        padding: u31 = 0,
    }),
    /// DS continue control register
    /// offset: 0xe04
    SET_CONTINUE: mmio.Mmio(packed struct(u32) {
        /// set this bit to continue DS operation.
        SET_CONTINUE: u1,
        padding: u31 = 0,
    }),
    /// DS finish control register
    /// offset: 0xe08
    SET_FINISH: mmio.Mmio(packed struct(u32) {
        /// Set this bit to finish DS process.
        SET_FINISH: u1,
        padding: u31 = 0,
    }),
    /// DS query busy register
    /// offset: 0xe0c
    QUERY_BUSY: mmio.Mmio(packed struct(u32) {
        /// digital signature state. 1'b0: idle, 1'b1: busy
        QUERY_BUSY: u1,
        padding: u31 = 0,
    }),
    /// DS query key-wrong counter register
    /// offset: 0xe10
    QUERY_KEY_WRONG: mmio.Mmio(packed struct(u32) {
        /// digital signature key wrong counter
        QUERY_KEY_WRONG: u4,
        padding: u28 = 0,
    }),
    /// DS query check result register
    /// offset: 0xe14
    QUERY_CHECK: mmio.Mmio(packed struct(u32) {
        /// MD checkout result. 1'b0: MD check pass, 1'b1: MD check fail
        MD_ERROR: u1,
        /// padding checkout result. 1'b0: a good padding, 1'b1: a bad padding
        PADDING_BAD: u1,
        padding: u30 = 0,
    }),
    /// offset: 0xe18
    reserved3608: [8]u8,
    /// DS version control register
    /// offset: 0xe20
    DATE: mmio.Mmio(packed struct(u32) {
        /// ds version information
        DATE: u30,
        padding: u2 = 0,
    }),
};
