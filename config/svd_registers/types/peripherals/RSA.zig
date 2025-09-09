const mmio = @import("mmio");
const types = @import("../../types.zig");

/// RSA (Rivest Shamir Adleman) Accelerator
pub const RSA = extern struct {
    /// Represents M
    /// offset: 0x00
    M_MEM: [16]u8,
    /// offset: 0x10
    reserved16: [496]u8,
    /// Represents Z
    /// offset: 0x200
    Z_MEM: [16]u8,
    /// offset: 0x210
    reserved528: [496]u8,
    /// Represents Y
    /// offset: 0x400
    Y_MEM: [16]u8,
    /// offset: 0x410
    reserved1040: [496]u8,
    /// Represents X
    /// offset: 0x600
    X_MEM: [16]u8,
    /// offset: 0x610
    reserved1552: [496]u8,
    /// Represents M’
    /// offset: 0x800
    M_PRIME: mmio.Mmio(packed struct(u32) {
        /// Represents M’
        M_PRIME: u32,
    }),
    /// Configures RSA length
    /// offset: 0x804
    MODE: mmio.Mmio(packed struct(u32) {
        /// Configures the RSA length.
        MODE: u7,
        padding: u25 = 0,
    }),
    /// RSA clean register
    /// offset: 0x808
    QUERY_CLEAN: mmio.Mmio(packed struct(u32) {
        /// Represents whether or not the RSA memory completes initialization. 0: Not complete 1: Completed
        QUERY_CLEAN: u1,
        padding: u31 = 0,
    }),
    /// Starts modular exponentiation
    /// offset: 0x80c
    SET_START_MODEXP: mmio.Mmio(packed struct(u32) {
        /// Configure whether or not to start the modular exponentiation. 0: No effect 1: Start
        SET_START_MODEXP: u1,
        padding: u31 = 0,
    }),
    /// Starts modular multiplication
    /// offset: 0x810
    SET_START_MODMULT: mmio.Mmio(packed struct(u32) {
        /// Configure whether or not to start the modular multiplication. 0: No effect 1: Start
        SET_START_MODMULT: u1,
        padding: u31 = 0,
    }),
    /// Starts multiplication
    /// offset: 0x814
    SET_START_MULT: mmio.Mmio(packed struct(u32) {
        /// Configure whether or not to start the multiplication. 0: No effect 1: Start
        SET_START_MULT: u1,
        padding: u31 = 0,
    }),
    /// Represents the RSA status
    /// offset: 0x818
    QUERY_IDLE: mmio.Mmio(packed struct(u32) {
        /// Represents the RSA status. 0: Busy 1: Idle
        QUERY_IDLE: u1,
        padding: u31 = 0,
    }),
    /// Clears RSA interrupt
    /// offset: 0x81c
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Write 1 to clear the RSA interrupt.
        CLEAR_INTERRUPT: u1,
        padding: u31 = 0,
    }),
    /// Configures the constant_time option
    /// offset: 0x820
    CONSTANT_TIME: mmio.Mmio(packed struct(u32) {
        /// Configures the constant_time option. 0: Acceleration 1: No acceleration (default)
        CONSTANT_TIME: u1,
        padding: u31 = 0,
    }),
    /// Configures the search option
    /// offset: 0x824
    SEARCH_ENABLE: mmio.Mmio(packed struct(u32) {
        /// Configure the search option. 0: No acceleration (default) 1: Acceleration This option should be used together with RSA_SEARCH_POS.
        SEARCH_ENABLE: u1,
        padding: u31 = 0,
    }),
    /// Configures the search position
    /// offset: 0x828
    SEARCH_POS: mmio.Mmio(packed struct(u32) {
        /// Configures the starting address to start search. This field should be used together with RSA_SEARCH_ENABLE. The field is only valid when RSA_SEARCH_ENABLE is high.
        SEARCH_POS: u12,
        padding: u20 = 0,
    }),
    /// Enables the RSA interrupt
    /// offset: 0x82c
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// Write 1 to enable the RSA interrupt.
        INT_ENA: u1,
        padding: u31 = 0,
    }),
    /// Version control register
    /// offset: 0x830
    DATE: mmio.Mmio(packed struct(u32) {
        /// Version control register.
        DATE: u30,
        padding: u2 = 0,
    }),
};
