const mmio = @import("mmio");
const types = @import("../../types.zig");

/// ECC (ECC Hardware Accelerator)
pub const ECC = extern struct {
    /// offset: 0x00
    reserved0: [12]u8,
    /// ECC interrupt raw register, valid in level.
    /// offset: 0x0c
    MULT_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the ecc_calc_done_int interrupt
        CALC_DONE_INT_RAW: u1,
        padding: u31 = 0,
    }),
    /// ECC interrupt status register.
    /// offset: 0x10
    MULT_INT_ST: mmio.Mmio(packed struct(u32) {
        /// The masked interrupt status bit for the ecc_calc_done_int interrupt
        CALC_DONE_INT_ST: u1,
        padding: u31 = 0,
    }),
    /// ECC interrupt enable register.
    /// offset: 0x14
    MULT_INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the ecc_calc_done_int interrupt
        CALC_DONE_INT_ENA: u1,
        padding: u31 = 0,
    }),
    /// ECC interrupt clear register.
    /// offset: 0x18
    MULT_INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the ecc_calc_done_int interrupt
        CALC_DONE_INT_CLR: u1,
        padding: u31 = 0,
    }),
    /// ECC configure register
    /// offset: 0x1c
    MULT_CONF: mmio.Mmio(packed struct(u32) {
        /// Write 1 to start caculation of ECC Accelerator. This bit will be self-cleared after the caculatrion is done.
        START: u1,
        /// Write 1 to reset ECC Accelerator.
        RESET: u1,
        /// The key length mode bit of ECC Accelerator. 0: P-192. 1: P-256.
        KEY_LENGTH: u1,
        /// The mod base of mod operation, only valid in work_mode 8-11. 0: n(order of curve). 1: p(mod base of curve)
        MOD_BASE: u1,
        /// The work mode bits of ECC Accelerator. 0: Point Mult Mode. 1: Reserved. 2: Point verification mode. 3: Point Verif+mult mode. 4: Jacobian Point Mult Mode. 5: Point Add Mode. 6: Jacobian Point Verification Mode. 7: Point Verif + Jacobian Mult Mode. 8: mod addition. 9. mod substraction. 10: mod multiplication. 11: mod division.
        WORK_MODE: u4,
        /// Reserved
        SECURITY_MODE: u1,
        reserved29: u20 = 0,
        /// The verification result bit of ECC Accelerator, only valid when calculation is done.
        VERIFICATION_RESULT: u1,
        /// Write 1 to force on register clock gate.
        CLK_EN: u1,
        /// ECC memory clock gate force on register
        MEM_CLOCK_GATE_FORCE_ON: u1,
    }),
    /// offset: 0x20
    reserved32: [220]u8,
    /// Version control register
    /// offset: 0xfc
    MULT_DATE: mmio.Mmio(packed struct(u32) {
        /// ECC mult version control register
        DATE: u28,
        padding: u4 = 0,
    }),
    /// The memory that stores k.
    /// offset: 0x100
    K_MEM: [8]u32,
    /// The memory that stores Px.
    /// offset: 0x120
    PX_MEM: [8]u32,
    /// The memory that stores Py.
    /// offset: 0x140
    PY_MEM: [8]u32,
};
