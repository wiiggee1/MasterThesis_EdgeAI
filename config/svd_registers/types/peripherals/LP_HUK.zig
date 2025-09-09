const mmio = @import("mmio");
const types = @import("../../types.zig");

/// LP_HUK Peripheral
pub const LP_HUK = extern struct {
    /// offset: 0x00
    reserved0: [4]u8,
    /// HUK Generator clock gate control register
    /// offset: 0x04
    CLK: mmio.Mmio(packed struct(u32) {
        /// Write 1 to force on register clock gate.
        EN: u1,
        /// Write 1 to force on memory clock gate.
        MEM_CG_FORCE_ON: u1,
        padding: u30 = 0,
    }),
    /// HUK Generator interrupt raw register, valid in level.
    /// offset: 0x08
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the huk_prep_done_int interrupt
        PREP_DONE_INT_RAW: u1,
        /// The raw interrupt status bit for the huk_proc_done_int interrupt
        PROC_DONE_INT_RAW: u1,
        /// The raw interrupt status bit for the huk_post_done_int interrupt
        POST_DONE_INT_RAW: u1,
        padding: u29 = 0,
    }),
    /// HUK Generator interrupt status register.
    /// offset: 0x0c
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// The masked interrupt status bit for the huk_prep_done_int interrupt
        PREP_DONE_INT_ST: u1,
        /// The masked interrupt status bit for the huk_proc_done_int interrupt
        PROC_DONE_INT_ST: u1,
        /// The masked interrupt status bit for the huk_post_done_int interrupt
        POST_DONE_INT_ST: u1,
        padding: u29 = 0,
    }),
    /// HUK Generator interrupt enable register.
    /// offset: 0x10
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the huk_prep_done_int interrupt
        PREP_DONE_INT_ENA: u1,
        /// The interrupt enable bit for the huk_proc_done_int interrupt
        PROC_DONE_INT_ENA: u1,
        /// The interrupt enable bit for the huk_post_done_int interrupt
        POST_DONE_INT_ENA: u1,
        padding: u29 = 0,
    }),
    /// HUK Generator interrupt clear register.
    /// offset: 0x14
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the huk_prep_done_int interrupt
        PREP_DONE_INT_CLR: u1,
        /// Set this bit to clear the huk_proc_done_int interrupt
        PROC_DONE_INT_CLR: u1,
        /// Set this bit to clear the huk_post_done_int interrupt
        POST_DONE_INT_CLR: u1,
        padding: u29 = 0,
    }),
    /// offset: 0x18
    reserved24: [8]u8,
    /// HUK Generator configuration register
    /// offset: 0x20
    CONF: mmio.Mmio(packed struct(u32) {
        /// Set this field to choose the huk process. 1: process huk generate mode. 0: process huk recovery mode.
        MODE: u1,
        padding: u31 = 0,
    }),
    /// HUK Generator control register
    /// offset: 0x24
    START: mmio.Mmio(packed struct(u32) {
        /// Write 1 to continue HUK Generator operation at LOAD/GAIN state.
        START: u1,
        /// Write 1 to start HUK Generator at IDLE state.
        CONTINUE: u1,
        padding: u30 = 0,
    }),
    /// HUK Generator state register
    /// offset: 0x28
    STATE: mmio.Mmio(packed struct(u32) {
        /// The state of HUK Generator. 0: IDLE. 1: LOAD. 2: GAIN. 3: BUSY.
        STATE: u2,
        padding: u30 = 0,
    }),
    /// offset: 0x2c
    reserved44: [8]u8,
    /// HUK Generator HUK status register
    /// offset: 0x34
    STATUS: mmio.Mmio(packed struct(u32) {
        /// The HUK generation status. 0: HUK is not generated. 1: HUK is generated and valid. 2: HUK is generated but invalid. 3: reserved.
        STATUS: u2,
        /// The risk level of HUK. 0-6: the higher the risk level is, the more error bits there are in the PUF SRAM. 7: Error Level, HUK is invalid.
        RISK_LEVEL: u3,
        padding: u27 = 0,
    }),
    /// offset: 0x38
    reserved56: [196]u8,
    /// Version control register
    /// offset: 0xfc
    DATE: mmio.Mmio(packed struct(u32) {
        /// HUK Generator version control register.
        DATE: u28,
        padding: u4 = 0,
    }),
    /// The memory that stores HUK info.
    /// offset: 0x100
    INFO_MEM: [384]u8,
};
