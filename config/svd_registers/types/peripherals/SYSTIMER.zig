const mmio = @import("mmio");
const types = @import("../../types.zig");

/// System Timer
pub const SYSTIMER = extern struct {
    /// Configure system timer clock
    /// offset: 0x00
    CONF: mmio.Mmio(packed struct(u32) {
        /// systimer clock force on
        SYSTIMER_CLK_FO: u1,
        /// enable systimer's etm task and event
        ETM_EN: u1,
        reserved22: u20 = 0,
        /// target2 work enable
        TARGET2_WORK_EN: u1,
        /// target1 work enable
        TARGET1_WORK_EN: u1,
        /// target0 work enable
        TARGET0_WORK_EN: u1,
        /// If timer unit1 is stalled when core1 stalled
        TIMER_UNIT1_CORE1_STALL_EN: u1,
        /// If timer unit1 is stalled when core0 stalled
        TIMER_UNIT1_CORE0_STALL_EN: u1,
        /// If timer unit0 is stalled when core1 stalled
        TIMER_UNIT0_CORE1_STALL_EN: u1,
        /// If timer unit0 is stalled when core0 stalled
        TIMER_UNIT0_CORE0_STALL_EN: u1,
        /// timer unit1 work enable
        TIMER_UNIT1_WORK_EN: u1,
        /// timer unit0 work enable
        TIMER_UNIT0_WORK_EN: u1,
        /// register file clk gating
        CLK_EN: u1,
    }),
    /// system timer unit0 value update register
    /// offset: 0x04
    UNIT0_OP: mmio.Mmio(packed struct(u32) {
        reserved29: u29 = 0,
        /// timer value is sync and valid
        TIMER_UNIT0_VALUE_VALID: u1,
        /// update timer_unit0
        TIMER_UNIT0_UPDATE: u1,
        padding: u1 = 0,
    }),
    /// system timer unit1 value update register
    /// offset: 0x08
    UNIT1_OP: mmio.Mmio(packed struct(u32) {
        reserved29: u29 = 0,
        /// timer value is sync and valid
        TIMER_UNIT1_VALUE_VALID: u1,
        /// update timer unit1
        TIMER_UNIT1_UPDATE: u1,
        padding: u1 = 0,
    }),
    /// system timer unit0 value high load register
    /// offset: 0x0c
    UNIT0_LOAD_HI: mmio.Mmio(packed struct(u32) {
        /// timer unit0 load high 20 bits
        TIMER_UNIT0_LOAD_HI: u20,
        padding: u12 = 0,
    }),
    /// system timer unit0 value low load register
    /// offset: 0x10
    UNIT0_LOAD_LO: mmio.Mmio(packed struct(u32) {
        /// timer unit0 load low 32 bits
        TIMER_UNIT0_LOAD_LO: u32,
    }),
    /// system timer unit1 value high load register
    /// offset: 0x14
    UNIT1_LOAD_HI: mmio.Mmio(packed struct(u32) {
        /// timer unit1 load high 20 bits
        TIMER_UNIT1_LOAD_HI: u20,
        padding: u12 = 0,
    }),
    /// system timer unit1 value low load register
    /// offset: 0x18
    UNIT1_LOAD_LO: mmio.Mmio(packed struct(u32) {
        /// timer unit1 load low 32 bits
        TIMER_UNIT1_LOAD_LO: u32,
    }),
    /// system timer comp0 value high register
    /// offset: 0x1c
    TARGET0_HI: mmio.Mmio(packed struct(u32) {
        /// timer taget0 high 20 bits
        TIMER_TARGET0_HI: u20,
        padding: u12 = 0,
    }),
    /// system timer comp0 value low register
    /// offset: 0x20
    TARGET0_LO: mmio.Mmio(packed struct(u32) {
        /// timer taget0 low 32 bits
        TIMER_TARGET0_LO: u32,
    }),
    /// system timer comp1 value high register
    /// offset: 0x24
    TARGET1_HI: mmio.Mmio(packed struct(u32) {
        /// timer taget1 high 20 bits
        TIMER_TARGET1_HI: u20,
        padding: u12 = 0,
    }),
    /// system timer comp1 value low register
    /// offset: 0x28
    TARGET1_LO: mmio.Mmio(packed struct(u32) {
        /// timer taget1 low 32 bits
        TIMER_TARGET1_LO: u32,
    }),
    /// system timer comp2 value high register
    /// offset: 0x2c
    TARGET2_HI: mmio.Mmio(packed struct(u32) {
        /// timer taget2 high 20 bits
        TIMER_TARGET2_HI: u20,
        padding: u12 = 0,
    }),
    /// system timer comp2 value low register
    /// offset: 0x30
    TARGET2_LO: mmio.Mmio(packed struct(u32) {
        /// timer taget2 low 32 bits
        TIMER_TARGET2_LO: u32,
    }),
    /// system timer comp0 target mode register
    /// offset: 0x34
    TARGET0_CONF: mmio.Mmio(packed struct(u32) {
        /// target0 period
        TARGET0_PERIOD: u26,
        reserved30: u4 = 0,
        /// Set target0 to period mode
        TARGET0_PERIOD_MODE: u1,
        /// select which unit to compare
        TARGET0_TIMER_UNIT_SEL: u1,
    }),
    /// system timer comp1 target mode register
    /// offset: 0x38
    TARGET1_CONF: mmio.Mmio(packed struct(u32) {
        /// target1 period
        TARGET1_PERIOD: u26,
        reserved30: u4 = 0,
        /// Set target1 to period mode
        TARGET1_PERIOD_MODE: u1,
        /// select which unit to compare
        TARGET1_TIMER_UNIT_SEL: u1,
    }),
    /// system timer comp2 target mode register
    /// offset: 0x3c
    TARGET2_CONF: mmio.Mmio(packed struct(u32) {
        /// target2 period
        TARGET2_PERIOD: u26,
        reserved30: u4 = 0,
        /// Set target2 to period mode
        TARGET2_PERIOD_MODE: u1,
        /// select which unit to compare
        TARGET2_TIMER_UNIT_SEL: u1,
    }),
    /// system timer unit0 value high register
    /// offset: 0x40
    UNIT0_VALUE_HI: mmio.Mmio(packed struct(u32) {
        /// timer read value high 20bits
        TIMER_UNIT0_VALUE_HI: u20,
        padding: u12 = 0,
    }),
    /// system timer unit0 value low register
    /// offset: 0x44
    UNIT0_VALUE_LO: mmio.Mmio(packed struct(u32) {
        /// timer read value low 32bits
        TIMER_UNIT0_VALUE_LO: u32,
    }),
    /// system timer unit1 value high register
    /// offset: 0x48
    UNIT1_VALUE_HI: mmio.Mmio(packed struct(u32) {
        /// timer read value high 20bits
        TIMER_UNIT1_VALUE_HI: u20,
        padding: u12 = 0,
    }),
    /// system timer unit1 value low register
    /// offset: 0x4c
    UNIT1_VALUE_LO: mmio.Mmio(packed struct(u32) {
        /// timer read value low 32bits
        TIMER_UNIT1_VALUE_LO: u32,
    }),
    /// system timer comp0 conf sync register
    /// offset: 0x50
    COMP0_LOAD: mmio.Mmio(packed struct(u32) {
        /// timer comp0 sync enable signal
        TIMER_COMP0_LOAD: u1,
        padding: u31 = 0,
    }),
    /// system timer comp1 conf sync register
    /// offset: 0x54
    COMP1_LOAD: mmio.Mmio(packed struct(u32) {
        /// timer comp1 sync enable signal
        TIMER_COMP1_LOAD: u1,
        padding: u31 = 0,
    }),
    /// system timer comp2 conf sync register
    /// offset: 0x58
    COMP2_LOAD: mmio.Mmio(packed struct(u32) {
        /// timer comp2 sync enable signal
        TIMER_COMP2_LOAD: u1,
        padding: u31 = 0,
    }),
    /// system timer unit0 conf sync register
    /// offset: 0x5c
    UNIT0_LOAD: mmio.Mmio(packed struct(u32) {
        /// timer unit0 sync enable signal
        TIMER_UNIT0_LOAD: u1,
        padding: u31 = 0,
    }),
    /// system timer unit1 conf sync register
    /// offset: 0x60
    UNIT1_LOAD: mmio.Mmio(packed struct(u32) {
        /// timer unit1 sync enable signal
        TIMER_UNIT1_LOAD: u1,
        padding: u31 = 0,
    }),
    /// systimer interrupt enable register
    /// offset: 0x64
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// interupt0 enable
        TARGET0_INT_ENA: u1,
        /// interupt1 enable
        TARGET1_INT_ENA: u1,
        /// interupt2 enable
        TARGET2_INT_ENA: u1,
        padding: u29 = 0,
    }),
    /// systimer interrupt raw register
    /// offset: 0x68
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// interupt0 raw
        TARGET0_INT_RAW: u1,
        /// interupt1 raw
        TARGET1_INT_RAW: u1,
        /// interupt2 raw
        TARGET2_INT_RAW: u1,
        padding: u29 = 0,
    }),
    /// systimer interrupt clear register
    /// offset: 0x6c
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// interupt0 clear
        TARGET0_INT_CLR: u1,
        /// interupt1 clear
        TARGET1_INT_CLR: u1,
        /// interupt2 clear
        TARGET2_INT_CLR: u1,
        padding: u29 = 0,
    }),
    /// systimer interrupt status register
    /// offset: 0x70
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// interupt0 status
        TARGET0_INT_ST: u1,
        /// interupt1 status
        TARGET1_INT_ST: u1,
        /// interupt2 status
        TARGET2_INT_ST: u1,
        padding: u29 = 0,
    }),
    /// system timer comp0 actual target value low register
    /// offset: 0x74
    REAL_TARGET0_LO: mmio.Mmio(packed struct(u32) {
        /// actual target value value low 32bits
        TARGET0_LO_RO: u32,
    }),
    /// system timer comp0 actual target value high register
    /// offset: 0x78
    REAL_TARGET0_HI: mmio.Mmio(packed struct(u32) {
        /// actual target value value high 20bits
        TARGET0_HI_RO: u20,
        padding: u12 = 0,
    }),
    /// system timer comp1 actual target value low register
    /// offset: 0x7c
    REAL_TARGET1_LO: mmio.Mmio(packed struct(u32) {
        /// actual target value value low 32bits
        TARGET1_LO_RO: u32,
    }),
    /// system timer comp1 actual target value high register
    /// offset: 0x80
    REAL_TARGET1_HI: mmio.Mmio(packed struct(u32) {
        /// actual target value value high 20bits
        TARGET1_HI_RO: u20,
        padding: u12 = 0,
    }),
    /// system timer comp2 actual target value low register
    /// offset: 0x84
    REAL_TARGET2_LO: mmio.Mmio(packed struct(u32) {
        /// actual target value value low 32bits
        TARGET2_LO_RO: u32,
    }),
    /// system timer comp2 actual target value high register
    /// offset: 0x88
    REAL_TARGET2_HI: mmio.Mmio(packed struct(u32) {
        /// actual target value value high 20bits
        TARGET2_HI_RO: u20,
        padding: u12 = 0,
    }),
    /// offset: 0x8c
    reserved140: [112]u8,
    /// system timer version control register
    /// offset: 0xfc
    DATE: mmio.Mmio(packed struct(u32) {
        /// systimer register version
        DATE: u32,
    }),
};
