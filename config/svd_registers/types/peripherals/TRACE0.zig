const mmio = @import("mmio");
const types = @import("../../types.zig");

/// TRACE0 Peripheral
pub const TRACE0 = extern struct {
    /// mem start addr
    /// offset: 0x00
    MEM_START_ADDR: mmio.Mmio(packed struct(u32) {
        /// The start address of trace memory
        MEM_START_ADDR: u32,
    }),
    /// mem end addr
    /// offset: 0x04
    MEM_END_ADDR: mmio.Mmio(packed struct(u32) {
        /// The end address of trace memory
        MEM_END_ADDR: u32,
    }),
    /// mem current addr
    /// offset: 0x08
    MEM_CURRENT_ADDR: mmio.Mmio(packed struct(u32) {
        /// current_mem_addr,indicate that next writing addr
        MEM_CURRENT_ADDR: u32,
    }),
    /// mem addr update
    /// offset: 0x0c
    MEM_ADDR_UPDATE: mmio.Mmio(packed struct(u32) {
        /// when set, the will \hyperref[fielddesc:TRACEMEMCURRENTADDR]{TRACE_MEM_CURRENT_ADDR} update to \hyperref[fielddesc:TRACEMEMSTARTADDR]{TRACE_MEM_START_ADDR}.
        MEM_CURRENT_ADDR_UPDATE: u1,
        padding: u31 = 0,
    }),
    /// fifo status register
    /// offset: 0x10
    FIFO_STATUS: mmio.Mmio(packed struct(u32) {
        /// Represent whether the fifo is empty. \\1: empty \\0: not empty
        FIFO_EMPTY: u1,
        /// Represent trace work status: \\0: idle state \\1: working state\\ 2: wait state due to hart halted or havereset \\3: lost state
        WORK_STATUS: u2,
        padding: u29 = 0,
    }),
    /// interrupt enable register
    /// offset: 0x14
    INTR_ENA: mmio.Mmio(packed struct(u32) {
        /// Set 1 enable fifo_overflow interrupt
        FIFO_OVERFLOW_INTR_ENA: u1,
        /// Set 1 enable mem_full interrupt
        MEM_FULL_INTR_ENA: u1,
        padding: u30 = 0,
    }),
    /// interrupt status register
    /// offset: 0x18
    INTR_RAW: mmio.Mmio(packed struct(u32) {
        /// fifo_overflow interrupt status
        FIFO_OVERFLOW_INTR_RAW: u1,
        /// mem_full interrupt status
        MEM_FULL_INTR_RAW: u1,
        padding: u30 = 0,
    }),
    /// interrupt clear register
    /// offset: 0x1c
    INTR_CLR: mmio.Mmio(packed struct(u32) {
        /// Set 1 clear fifo overflow interrupt
        FIFO_OVERFLOW_INTR_CLR: u1,
        /// Set 1 clear mem full interrupt
        MEM_FULL_INTR_CLR: u1,
        padding: u30 = 0,
    }),
    /// trigger register
    /// offset: 0x20
    TRIGGER: mmio.Mmio(packed struct(u32) {
        /// Configure whether or not start trace.\\1: start trace \\0: invalid\\
        ON: u1,
        /// Configure whether or not stop trace.\\1: stop trace \\0: invalid\\
        OFF: u1,
        /// Configure memory loop mode. \\1: trace will loop wrtie trace_mem. \\0: when mem_current_addr at mem_end_addr, it will stop at the mem_end_addr\\
        MEM_LOOP: u1,
        /// Configure whether or not enable auto-restart.\\1: enable\\0: disable\\
        RESTART_ENA: u1,
        padding: u28 = 0,
    }),
    /// trace configuration register
    /// offset: 0x24
    CONFIG: mmio.Mmio(packed struct(u32) {
        /// Configure whether or not enable cpu trigger action.\\1: enable\\0:disable\\
        DM_TRIGGER_ENA: u1,
        /// Configure whether or not enable trace cpu haverest, when enabeld, if cpu have reset, the encoder will output a packet to report the address of the last instruction, and upon reset deassertion, the encoder start again.\\1: enabeld\\0: disabled\\
        RESET_ENA: u1,
        /// Configure whether or not enable trace cpu is halted, when enabeld, if the cpu halted, the encoder will output a packet to report the address of the last instruction, and upon halted deassertion, the encoder start again.When disabled, encoder will not report the last address before halted and first address after halted, cpu halted information will not be tracked. \\1: enabeld\\0: disabled\\
        HALT_ENA: u1,
        /// Configure whether or not enable stall cpu. When enabled, when the fifo almost full, the cpu will be stalled until the packets is able to write to fifo.\\1: enabled.\\0: disabled\\
        STALL_ENA: u1,
        /// Configure whether or not enable full-address mode.\\1: full address mode.\\0: delta address mode\\
        FULL_ADDRESS: u1,
        /// Configure whether or not enabel implicit exception mode. When enabled,, do not sent exception address, only exception cause in exception packets.\\1: enabled\\0: disabled\\
        IMPLICIT_EXCEPT: u1,
        padding: u26 = 0,
    }),
    /// filter control register
    /// offset: 0x28
    FILTER_CONTROL: mmio.Mmio(packed struct(u32) {
        /// Configure whether or not enable filter unit. \\1: enable filter.\\ 0: always match
        FILTER_EN: u1,
        /// when set, the comparator must be high in order for the filter to match
        MATCH_COMP: u1,
        /// when set, match privilege levels specified by \hyperref[fielddesc:TRACEMATCHCHOICEPRIVILEGE]{TRACE_MATCH_CHOICE_PRIVILEGE}.
        MATCH_PRIVILEGE: u1,
        /// when set, start matching from exception cause codes specified by \hyperref[fielddesc:TRACEMATCHCHOICEECAUSE]{TRACE_MATCH_CHOICE_ECAUSE}, and stop matching upon return from the 1st matching exception.
        MATCH_ECAUSE: u1,
        /// when set, start matching from a trap with the interrupt level codes specified by \hyperref[fielddesc:TRACEMATCHVALUEINTERRUPT]{TRACE_MATCH_VALUE_INTERRUPT}, and stop matching upon return from the 1st matching trap.
        MATCH_INTERRUPT: u1,
        padding: u27 = 0,
    }),
    /// filter match control register
    /// offset: 0x2c
    FILTER_MATCH_CONTROL: mmio.Mmio(packed struct(u32) {
        /// Select match which privilege level when \hyperref[fielddesc:TRACEMATCHPRIVILEGE]{TRACE_MATCH_PRIVILEGE} is set. \\1: machine mode. \\0: user mode
        MATCH_CHOICE_PRIVILEGE: u1,
        /// Select which match which itype when \hyperref[fielddesc:TRACEMATCHINTERRUPT]{TRACE_MATCH_INTERRUP} is set. \\1: match itype of 2. \\0: match itype or 1.
        MATCH_VALUE_INTERRUPT: u1,
        /// specified which ecause matched.
        MATCH_CHOICE_ECAUSE: u6,
        padding: u24 = 0,
    }),
    /// filter comparator match control register
    /// offset: 0x30
    FILTER_COMPARATOR_CONTROL: mmio.Mmio(packed struct(u32) {
        /// Determines which input to compare against the primary comparator, \\0: iaddr, \\1: tval.
        P_INPUT: u1,
        reserved2: u1 = 0,
        /// Select the primary comparator function. \\0: equal, \\1: not equal, \\2: less than, \\3: less than or equal, \\4: greater than, \\5: greater than or equal, \\other: always match
        P_FUNCTION: u3,
        /// Generate a trace packet explicitly reporting the address that cause the primary match
        P_NOTIFY: u1,
        reserved8: u2 = 0,
        /// Determines which input to compare against the secondary comparator, \\0: iaddr, \\1: tval.
        S_INPUT: u1,
        reserved10: u1 = 0,
        /// Select the secondary comparator function. \\0: equal, \\1: not equal, \\2: less than, \\3: less than or equal, \\4: greater than, \\5: greater than or equal, \\other: always match
        S_FUNCTION: u3,
        /// Generate a trace packet explicitly reporting the address that cause the secondary match
        S_NOTIFY: u1,
        reserved16: u2 = 0,
        /// 0: only primary matches, \\1: primary and secondary comparator both matches(P\&\&S),\\ 2:either primary or secondary comparator matches !(P\&\&S), \\3: set when primary matches and continue to match until after secondary comparator matches
        MATCH_MODE: u2,
        padding: u14 = 0,
    }),
    /// primary comparator match value
    /// offset: 0x34
    FILTER_P_COMPARATOR_MATCH: mmio.Mmio(packed struct(u32) {
        /// primary comparator match value
        P_MATCH: u32,
    }),
    /// secondary comparator match value
    /// offset: 0x38
    FILTER_S_COMPARATOR_MATCH: mmio.Mmio(packed struct(u32) {
        /// secondary comparator match value
        S_MATCH: u32,
    }),
    /// resync configuration register
    /// offset: 0x3c
    RESYNC_PROLONGED: mmio.Mmio(packed struct(u32) {
        /// count number, when count to this value, send a sync package
        RESYNC_PROLONGED: u24,
        /// resyc mode sel: \\0: off, \\2: cycle count \\3: package num count
        RESYNC_MODE: u2,
        padding: u6 = 0,
    }),
    /// AHB config register
    /// offset: 0x40
    AHB_CONFIG: mmio.Mmio(packed struct(u32) {
        /// set hburst
        HBURST: u3,
        /// set max continuous access for incr mode
        MAX_INCR: u3,
        padding: u26 = 0,
    }),
    /// Clock gate control register
    /// offset: 0x44
    CLOCK_GATE: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable clock gate when access all registers in this module.
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x48
    reserved72: [948]u8,
    /// Version control register
    /// offset: 0x3fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// version control register. Note that this default value stored is the latest date when the hardware logic was updated.
        DATE: u28,
        padding: u4 = 0,
    }),
};
