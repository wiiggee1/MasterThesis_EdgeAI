const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Debug Assist
pub const ASSIST_DEBUG = extern struct {
    /// core0 monitor enable configuration register
    /// offset: 0x00
    CORE_0_INTR_ENA: mmio.Mmio(packed struct(u32) {
        /// Core0 dram0 area0 read monitor enable
        CORE_0_AREA_DRAM0_0_RD_ENA: u1,
        /// Core0 dram0 area0 write monitor enable
        CORE_0_AREA_DRAM0_0_WR_ENA: u1,
        /// Core0 dram0 area1 read monitor enable
        CORE_0_AREA_DRAM0_1_RD_ENA: u1,
        /// Core0 dram0 area1 write monitor enable
        CORE_0_AREA_DRAM0_1_WR_ENA: u1,
        /// Core0 PIF area0 read monitor enable
        CORE_0_AREA_PIF_0_RD_ENA: u1,
        /// Core0 PIF area0 write monitor enable
        CORE_0_AREA_PIF_0_WR_ENA: u1,
        /// Core0 PIF area1 read monitor enable
        CORE_0_AREA_PIF_1_RD_ENA: u1,
        /// Core0 PIF area1 write monitor enable
        CORE_0_AREA_PIF_1_WR_ENA: u1,
        /// Core0 stackpoint underflow monitor enable
        CORE_0_SP_SPILL_MIN_ENA: u1,
        /// Core0 stackpoint overflow monitor enable
        CORE_0_SP_SPILL_MAX_ENA: u1,
        /// IBUS busy monitor enable
        CORE_0_IRAM0_EXCEPTION_MONITOR_ENA: u1,
        /// DBUS busy monitor enbale
        CORE_0_DRAM0_EXCEPTION_MONITOR_ENA: u1,
        padding: u20 = 0,
    }),
    /// core0 monitor interrupt status register
    /// offset: 0x04
    CORE_0_INTR_RAW: mmio.Mmio(packed struct(u32) {
        /// Core0 dram0 area0 read monitor interrupt status
        CORE_0_AREA_DRAM0_0_RD_RAW: u1,
        /// Core0 dram0 area0 write monitor interrupt status
        CORE_0_AREA_DRAM0_0_WR_RAW: u1,
        /// Core0 dram0 area1 read monitor interrupt status
        CORE_0_AREA_DRAM0_1_RD_RAW: u1,
        /// Core0 dram0 area1 write monitor interrupt status
        CORE_0_AREA_DRAM0_1_WR_RAW: u1,
        /// Core0 PIF area0 read monitor interrupt status
        CORE_0_AREA_PIF_0_RD_RAW: u1,
        /// Core0 PIF area0 write monitor interrupt status
        CORE_0_AREA_PIF_0_WR_RAW: u1,
        /// Core0 PIF area1 read monitor interrupt status
        CORE_0_AREA_PIF_1_RD_RAW: u1,
        /// Core0 PIF area1 write monitor interrupt status
        CORE_0_AREA_PIF_1_WR_RAW: u1,
        /// Core0 stackpoint underflow monitor interrupt status
        CORE_0_SP_SPILL_MIN_RAW: u1,
        /// Core0 stackpoint overflow monitor interrupt status
        CORE_0_SP_SPILL_MAX_RAW: u1,
        /// IBUS busy monitor interrupt status
        CORE_0_IRAM0_EXCEPTION_MONITOR_RAW: u1,
        /// DBUS busy monitor initerrupt status
        CORE_0_DRAM0_EXCEPTION_MONITOR_RAW: u1,
        padding: u20 = 0,
    }),
    /// core0 monitor interrupt enable register
    /// offset: 0x08
    CORE_0_INTR_RLS: mmio.Mmio(packed struct(u32) {
        /// Core0 dram0 area0 read monitor interrupt enable
        CORE_0_AREA_DRAM0_0_RD_RLS: u1,
        /// Core0 dram0 area0 write monitor interrupt enable
        CORE_0_AREA_DRAM0_0_WR_RLS: u1,
        /// Core0 dram0 area1 read monitor interrupt enable
        CORE_0_AREA_DRAM0_1_RD_RLS: u1,
        /// Core0 dram0 area1 write monitor interrupt enable
        CORE_0_AREA_DRAM0_1_WR_RLS: u1,
        /// Core0 PIF area0 read monitor interrupt enable
        CORE_0_AREA_PIF_0_RD_RLS: u1,
        /// Core0 PIF area0 write monitor interrupt enable
        CORE_0_AREA_PIF_0_WR_RLS: u1,
        /// Core0 PIF area1 read monitor interrupt enable
        CORE_0_AREA_PIF_1_RD_RLS: u1,
        /// Core0 PIF area1 write monitor interrupt enable
        CORE_0_AREA_PIF_1_WR_RLS: u1,
        /// Core0 stackpoint underflow monitor interrupt enable
        CORE_0_SP_SPILL_MIN_RLS: u1,
        /// Core0 stackpoint overflow monitor interrupt enable
        CORE_0_SP_SPILL_MAX_RLS: u1,
        /// IBUS busy monitor interrupt enable
        CORE_0_IRAM0_EXCEPTION_MONITOR_RLS: u1,
        /// DBUS busy monitor interrupt enbale
        CORE_0_DRAM0_EXCEPTION_MONITOR_RLS: u1,
        padding: u20 = 0,
    }),
    /// core0 monitor interrupt clr register
    /// offset: 0x0c
    CORE_0_INTR_CLR: mmio.Mmio(packed struct(u32) {
        /// Core0 dram0 area0 read monitor interrupt clr
        CORE_0_AREA_DRAM0_0_RD_CLR: u1,
        /// Core0 dram0 area0 write monitor interrupt clr
        CORE_0_AREA_DRAM0_0_WR_CLR: u1,
        /// Core0 dram0 area1 read monitor interrupt clr
        CORE_0_AREA_DRAM0_1_RD_CLR: u1,
        /// Core0 dram0 area1 write monitor interrupt clr
        CORE_0_AREA_DRAM0_1_WR_CLR: u1,
        /// Core0 PIF area0 read monitor interrupt clr
        CORE_0_AREA_PIF_0_RD_CLR: u1,
        /// Core0 PIF area0 write monitor interrupt clr
        CORE_0_AREA_PIF_0_WR_CLR: u1,
        /// Core0 PIF area1 read monitor interrupt clr
        CORE_0_AREA_PIF_1_RD_CLR: u1,
        /// Core0 PIF area1 write monitor interrupt clr
        CORE_0_AREA_PIF_1_WR_CLR: u1,
        /// Core0 stackpoint underflow monitor interrupt clr
        CORE_0_SP_SPILL_MIN_CLR: u1,
        /// Core0 stackpoint overflow monitor interrupt clr
        CORE_0_SP_SPILL_MAX_CLR: u1,
        /// IBUS busy monitor interrupt clr
        CORE_0_IRAM0_EXCEPTION_MONITOR_CLR: u1,
        /// DBUS busy monitor interrupt clr
        CORE_0_DRAM0_EXCEPTION_MONITOR_CLR: u1,
        padding: u20 = 0,
    }),
    /// core0 dram0 region0 addr configuration register
    /// offset: 0x10
    CORE_0_AREA_DRAM0_0_MIN: mmio.Mmio(packed struct(u32) {
        /// Core0 dram0 region0 start addr
        CORE_0_AREA_DRAM0_0_MIN: u32,
    }),
    /// core0 dram0 region0 addr configuration register
    /// offset: 0x14
    CORE_0_AREA_DRAM0_0_MAX: mmio.Mmio(packed struct(u32) {
        /// Core0 dram0 region0 end addr
        CORE_0_AREA_DRAM0_0_MAX: u32,
    }),
    /// core0 dram0 region1 addr configuration register
    /// offset: 0x18
    CORE_0_AREA_DRAM0_1_MIN: mmio.Mmio(packed struct(u32) {
        /// Core0 dram0 region1 start addr
        CORE_0_AREA_DRAM0_1_MIN: u32,
    }),
    /// core0 dram0 region1 addr configuration register
    /// offset: 0x1c
    CORE_0_AREA_DRAM0_1_MAX: mmio.Mmio(packed struct(u32) {
        /// Core0 dram0 region1 end addr
        CORE_0_AREA_DRAM0_1_MAX: u32,
    }),
    /// core0 PIF region0 addr configuration register
    /// offset: 0x20
    CORE_0_AREA_PIF_0_MIN: mmio.Mmio(packed struct(u32) {
        /// Core0 PIF region0 start addr
        CORE_0_AREA_PIF_0_MIN: u32,
    }),
    /// core0 PIF region0 addr configuration register
    /// offset: 0x24
    CORE_0_AREA_PIF_0_MAX: mmio.Mmio(packed struct(u32) {
        /// Core0 PIF region0 end addr
        CORE_0_AREA_PIF_0_MAX: u32,
    }),
    /// core0 PIF region1 addr configuration register
    /// offset: 0x28
    CORE_0_AREA_PIF_1_MIN: mmio.Mmio(packed struct(u32) {
        /// Core0 PIF region1 start addr
        CORE_0_AREA_PIF_1_MIN: u32,
    }),
    /// core0 PIF region1 addr configuration register
    /// offset: 0x2c
    CORE_0_AREA_PIF_1_MAX: mmio.Mmio(packed struct(u32) {
        /// Core0 PIF region1 end addr
        CORE_0_AREA_PIF_1_MAX: u32,
    }),
    /// core0 area pc status register
    /// offset: 0x30
    CORE_0_AREA_PC: mmio.Mmio(packed struct(u32) {
        /// the stackpointer when first touch region monitor interrupt
        CORE_0_AREA_PC: u32,
    }),
    /// core0 area sp status register
    /// offset: 0x34
    CORE_0_AREA_SP: mmio.Mmio(packed struct(u32) {
        /// the PC when first touch region monitor interrupt
        CORE_0_AREA_SP: u32,
    }),
    /// stack min value
    /// offset: 0x38
    CORE_0_SP_MIN: mmio.Mmio(packed struct(u32) {
        /// core0 sp region configuration regsiter
        CORE_0_SP_MIN: u32,
    }),
    /// stack max value
    /// offset: 0x3c
    CORE_0_SP_MAX: mmio.Mmio(packed struct(u32) {
        /// core0 sp pc status register
        CORE_0_SP_MAX: u32,
    }),
    /// stack monitor pc status register
    /// offset: 0x40
    CORE_0_SP_PC: mmio.Mmio(packed struct(u32) {
        /// This regsiter stores the PC when trigger stack monitor.
        CORE_0_SP_PC: u32,
    }),
    /// record enable configuration register
    /// offset: 0x44
    CORE_0_RCD_EN: mmio.Mmio(packed struct(u32) {
        /// Set 1 to enable record PC
        CORE_0_RCD_RECORDEN: u1,
        /// Set 1 to enable cpu pdebug function, must set this bit can get cpu PC
        CORE_0_RCD_PDEBUGEN: u1,
        padding: u30 = 0,
    }),
    /// record status regsiter
    /// offset: 0x48
    CORE_0_RCD_PDEBUGPC: mmio.Mmio(packed struct(u32) {
        /// recorded PC
        CORE_0_RCD_PDEBUGPC: u32,
    }),
    /// record status regsiter
    /// offset: 0x4c
    CORE_0_RCD_PDEBUGSP: mmio.Mmio(packed struct(u32) {
        /// recorded sp
        CORE_0_RCD_PDEBUGSP: u32,
    }),
    /// exception monitor status register0
    /// offset: 0x50
    CORE_0_IRAM0_EXCEPTION_MONITOR_0: mmio.Mmio(packed struct(u32) {
        /// reg_core_0_iram0_recording_addr_0
        CORE_0_IRAM0_RECORDING_ADDR_0: u24,
        /// reg_core_0_iram0_recording_wr_0
        CORE_0_IRAM0_RECORDING_WR_0: u1,
        /// reg_core_0_iram0_recording_loadstore_0
        CORE_0_IRAM0_RECORDING_LOADSTORE_0: u1,
        padding: u6 = 0,
    }),
    /// exception monitor status register1
    /// offset: 0x54
    CORE_0_IRAM0_EXCEPTION_MONITOR_1: mmio.Mmio(packed struct(u32) {
        /// reg_core_0_iram0_recording_addr_1
        CORE_0_IRAM0_RECORDING_ADDR_1: u24,
        /// reg_core_0_iram0_recording_wr_1
        CORE_0_IRAM0_RECORDING_WR_1: u1,
        /// reg_core_0_iram0_recording_loadstore_1
        CORE_0_IRAM0_RECORDING_LOADSTORE_1: u1,
        padding: u6 = 0,
    }),
    /// exception monitor status register2
    /// offset: 0x58
    CORE_0_DRAM0_EXCEPTION_MONITOR_0: mmio.Mmio(packed struct(u32) {
        /// reg_core_0_dram0_recording_wr_0
        CORE_0_DRAM0_RECORDING_WR_0: u1,
        /// reg_core_0_dram0_recording_byteen_0
        CORE_0_DRAM0_RECORDING_BYTEEN_0: u16,
        padding: u15 = 0,
    }),
    /// exception monitor status register3
    /// offset: 0x5c
    CORE_0_DRAM0_EXCEPTION_MONITOR_1: mmio.Mmio(packed struct(u32) {
        /// reg_core_0_dram0_recording_addr_0
        CORE_0_DRAM0_RECORDING_ADDR_0: u24,
        padding: u8 = 0,
    }),
    /// exception monitor status register4
    /// offset: 0x60
    CORE_0_DRAM0_EXCEPTION_MONITOR_2: mmio.Mmio(packed struct(u32) {
        /// reg_core_0_dram0_recording_pc_0
        CORE_0_DRAM0_RECORDING_PC_0: u32,
    }),
    /// exception monitor status register5
    /// offset: 0x64
    CORE_0_DRAM0_EXCEPTION_MONITOR_3: mmio.Mmio(packed struct(u32) {
        /// reg_core_0_dram0_recording_wr_1
        CORE_0_DRAM0_RECORDING_WR_1: u1,
        /// reg_core_0_dram0_recording_byteen_1
        CORE_0_DRAM0_RECORDING_BYTEEN_1: u16,
        padding: u15 = 0,
    }),
    /// exception monitor status register6
    /// offset: 0x68
    CORE_0_DRAM0_EXCEPTION_MONITOR_4: mmio.Mmio(packed struct(u32) {
        /// reg_core_0_dram0_recording_addr_1
        CORE_0_DRAM0_RECORDING_ADDR_1: u24,
        padding: u8 = 0,
    }),
    /// exception monitor status register7
    /// offset: 0x6c
    CORE_0_DRAM0_EXCEPTION_MONITOR_5: mmio.Mmio(packed struct(u32) {
        /// reg_core_0_dram0_recording_pc_1
        CORE_0_DRAM0_RECORDING_PC_1: u32,
    }),
    /// cpu status register
    /// offset: 0x70
    CORE_0_LASTPC_BEFORE_EXCEPTION: mmio.Mmio(packed struct(u32) {
        /// cpu's lastpc before exception
        CORE_0_LASTPC_BEFORE_EXC: u32,
    }),
    /// cpu status register
    /// offset: 0x74
    CORE_0_DEBUG_MODE: mmio.Mmio(packed struct(u32) {
        /// cpu debug mode status, 1 means cpu enter debug mode.
        CORE_0_DEBUG_MODE: u1,
        /// cpu debug_module active status
        CORE_0_DEBUG_MODULE_ACTIVE: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x78
    reserved120: [8]u8,
    /// core1 monitor enable configuration register
    /// offset: 0x80
    CORE_1_INTR_ENA: mmio.Mmio(packed struct(u32) {
        /// Core1 dram0 area0 read monitor enable
        CORE_1_AREA_DRAM0_0_RD_ENA: u1,
        /// Core1 dram0 area0 write monitor enable
        CORE_1_AREA_DRAM0_0_WR_ENA: u1,
        /// Core1 dram0 area1 read monitor enable
        CORE_1_AREA_DRAM0_1_RD_ENA: u1,
        /// Core1 dram0 area1 write monitor enable
        CORE_1_AREA_DRAM0_1_WR_ENA: u1,
        /// Core1 PIF area0 read monitor enable
        CORE_1_AREA_PIF_0_RD_ENA: u1,
        /// Core1 PIF area0 write monitor enable
        CORE_1_AREA_PIF_0_WR_ENA: u1,
        /// Core1 PIF area1 read monitor enable
        CORE_1_AREA_PIF_1_RD_ENA: u1,
        /// Core1 PIF area1 write monitor enable
        CORE_1_AREA_PIF_1_WR_ENA: u1,
        /// Core1 stackpoint underflow monitor enable
        CORE_1_SP_SPILL_MIN_ENA: u1,
        /// Core1 stackpoint overflow monitor enable
        CORE_1_SP_SPILL_MAX_ENA: u1,
        /// IBUS busy monitor enable
        CORE_1_IRAM0_EXCEPTION_MONITOR_ENA: u1,
        /// DBUS busy monitor enbale
        CORE_1_DRAM0_EXCEPTION_MONITOR_ENA: u1,
        padding: u20 = 0,
    }),
    /// core1 monitor interrupt status register
    /// offset: 0x84
    CORE_1_INTR_RAW: mmio.Mmio(packed struct(u32) {
        /// Core1 dram0 area0 read monitor interrupt status
        CORE_1_AREA_DRAM0_0_RD_RAW: u1,
        /// Core1 dram0 area0 write monitor interrupt status
        CORE_1_AREA_DRAM0_0_WR_RAW: u1,
        /// Core1 dram0 area1 read monitor interrupt status
        CORE_1_AREA_DRAM0_1_RD_RAW: u1,
        /// Core1 dram0 area1 write monitor interrupt status
        CORE_1_AREA_DRAM0_1_WR_RAW: u1,
        /// Core1 PIF area0 read monitor interrupt status
        CORE_1_AREA_PIF_0_RD_RAW: u1,
        /// Core1 PIF area0 write monitor interrupt status
        CORE_1_AREA_PIF_0_WR_RAW: u1,
        /// Core1 PIF area1 read monitor interrupt status
        CORE_1_AREA_PIF_1_RD_RAW: u1,
        /// Core1 PIF area1 write monitor interrupt status
        CORE_1_AREA_PIF_1_WR_RAW: u1,
        /// Core1 stackpoint underflow monitor interrupt status
        CORE_1_SP_SPILL_MIN_RAW: u1,
        /// Core1 stackpoint overflow monitor interrupt status
        CORE_1_SP_SPILL_MAX_RAW: u1,
        /// IBUS busy monitor interrupt status
        CORE_1_IRAM0_EXCEPTION_MONITOR_RAW: u1,
        /// DBUS busy monitor initerrupt status
        CORE_1_DRAM0_EXCEPTION_MONITOR_RAW: u1,
        padding: u20 = 0,
    }),
    /// core1 monitor interrupt enable register
    /// offset: 0x88
    CORE_1_INTR_RLS: mmio.Mmio(packed struct(u32) {
        /// Core1 dram0 area0 read monitor interrupt enable
        CORE_1_AREA_DRAM0_0_RD_RLS: u1,
        /// Core1 dram0 area0 write monitor interrupt enable
        CORE_1_AREA_DRAM0_0_WR_RLS: u1,
        /// Core1 dram0 area1 read monitor interrupt enable
        CORE_1_AREA_DRAM0_1_RD_RLS: u1,
        /// Core1 dram0 area1 write monitor interrupt enable
        CORE_1_AREA_DRAM0_1_WR_RLS: u1,
        /// Core1 PIF area0 read monitor interrupt enable
        CORE_1_AREA_PIF_0_RD_RLS: u1,
        /// Core1 PIF area0 write monitor interrupt enable
        CORE_1_AREA_PIF_0_WR_RLS: u1,
        /// Core1 PIF area1 read monitor interrupt enable
        CORE_1_AREA_PIF_1_RD_RLS: u1,
        /// Core1 PIF area1 write monitor interrupt enable
        CORE_1_AREA_PIF_1_WR_RLS: u1,
        /// Core1 stackpoint underflow monitor interrupt enable
        CORE_1_SP_SPILL_MIN_RLS: u1,
        /// Core1 stackpoint overflow monitor interrupt enable
        CORE_1_SP_SPILL_MAX_RLS: u1,
        /// IBUS busy monitor interrupt enable
        CORE_1_IRAM0_EXCEPTION_MONITOR_RLS: u1,
        /// DBUS busy monitor interrupt enbale
        CORE_1_DRAM0_EXCEPTION_MONITOR_RLS: u1,
        padding: u20 = 0,
    }),
    /// core1 monitor interrupt clr register
    /// offset: 0x8c
    CORE_1_INTR_CLR: mmio.Mmio(packed struct(u32) {
        /// Core1 dram0 area0 read monitor interrupt clr
        CORE_1_AREA_DRAM0_0_RD_CLR: u1,
        /// Core1 dram0 area0 write monitor interrupt clr
        CORE_1_AREA_DRAM0_0_WR_CLR: u1,
        /// Core1 dram0 area1 read monitor interrupt clr
        CORE_1_AREA_DRAM0_1_RD_CLR: u1,
        /// Core1 dram0 area1 write monitor interrupt clr
        CORE_1_AREA_DRAM0_1_WR_CLR: u1,
        /// Core1 PIF area0 read monitor interrupt clr
        CORE_1_AREA_PIF_0_RD_CLR: u1,
        /// Core1 PIF area0 write monitor interrupt clr
        CORE_1_AREA_PIF_0_WR_CLR: u1,
        /// Core1 PIF area1 read monitor interrupt clr
        CORE_1_AREA_PIF_1_RD_CLR: u1,
        /// Core1 PIF area1 write monitor interrupt clr
        CORE_1_AREA_PIF_1_WR_CLR: u1,
        /// Core1 stackpoint underflow monitor interrupt clr
        CORE_1_SP_SPILL_MIN_CLR: u1,
        /// Core1 stackpoint overflow monitor interrupt clr
        CORE_1_SP_SPILL_MAX_CLR: u1,
        /// IBUS busy monitor interrupt clr
        CORE_1_IRAM0_EXCEPTION_MONITOR_CLR: u1,
        /// DBUS busy monitor interrupt clr
        CORE_1_DRAM0_EXCEPTION_MONITOR_CLR: u1,
        padding: u20 = 0,
    }),
    /// core1 dram0 region0 addr configuration register
    /// offset: 0x90
    CORE_1_AREA_DRAM0_0_MIN: mmio.Mmio(packed struct(u32) {
        /// Core1 dram0 region0 start addr
        CORE_1_AREA_DRAM0_0_MIN: u32,
    }),
    /// core1 dram0 region0 addr configuration register
    /// offset: 0x94
    CORE_1_AREA_DRAM0_0_MAX: mmio.Mmio(packed struct(u32) {
        /// Core1 dram0 region0 end addr
        CORE_1_AREA_DRAM0_0_MAX: u32,
    }),
    /// core1 dram0 region1 addr configuration register
    /// offset: 0x98
    CORE_1_AREA_DRAM0_1_MIN: mmio.Mmio(packed struct(u32) {
        /// Core1 dram0 region1 start addr
        CORE_1_AREA_DRAM0_1_MIN: u32,
    }),
    /// core1 dram0 region1 addr configuration register
    /// offset: 0x9c
    CORE_1_AREA_DRAM0_1_MAX: mmio.Mmio(packed struct(u32) {
        /// Core1 dram0 region1 end addr
        CORE_1_AREA_DRAM0_1_MAX: u32,
    }),
    /// core1 PIF region0 addr configuration register
    /// offset: 0xa0
    CORE_1_AREA_PIF_0_MIN: mmio.Mmio(packed struct(u32) {
        /// Core1 PIF region0 start addr
        CORE_1_AREA_PIF_0_MIN: u32,
    }),
    /// core1 PIF region0 addr configuration register
    /// offset: 0xa4
    CORE_1_AREA_PIF_0_MAX: mmio.Mmio(packed struct(u32) {
        /// Core1 PIF region0 end addr
        CORE_1_AREA_PIF_0_MAX: u32,
    }),
    /// core1 PIF region1 addr configuration register
    /// offset: 0xa8
    CORE_1_AREA_PIF_1_MIN: mmio.Mmio(packed struct(u32) {
        /// Core1 PIF region1 start addr
        CORE_1_AREA_PIF_1_MIN: u32,
    }),
    /// core1 PIF region1 addr configuration register
    /// offset: 0xac
    CORE_1_AREA_PIF_1_MAX: mmio.Mmio(packed struct(u32) {
        /// Core1 PIF region1 end addr
        CORE_1_AREA_PIF_1_MAX: u32,
    }),
    /// core1 area pc status register
    /// offset: 0xb0
    CORE_1_AREA_PC: mmio.Mmio(packed struct(u32) {
        /// the stackpointer when first touch region monitor interrupt
        CORE_1_AREA_PC: u32,
    }),
    /// core1 area sp status register
    /// offset: 0xb4
    CORE_1_AREA_SP: mmio.Mmio(packed struct(u32) {
        /// the PC when first touch region monitor interrupt
        CORE_1_AREA_SP: u32,
    }),
    /// stack min value
    /// offset: 0xb8
    CORE_1_SP_MIN: mmio.Mmio(packed struct(u32) {
        /// core1 sp region configuration regsiter
        CORE_1_SP_MIN: u32,
    }),
    /// stack max value
    /// offset: 0xbc
    CORE_1_SP_MAX: mmio.Mmio(packed struct(u32) {
        /// core1 sp pc status register
        CORE_1_SP_MAX: u32,
    }),
    /// stack monitor pc status register
    /// offset: 0xc0
    CORE_1_SP_PC: mmio.Mmio(packed struct(u32) {
        /// This regsiter stores the PC when trigger stack monitor.
        CORE_1_SP_PC: u32,
    }),
    /// record enable configuration register
    /// offset: 0xc4
    CORE_1_RCD_EN: mmio.Mmio(packed struct(u32) {
        /// Set 1 to enable record PC
        CORE_1_RCD_RECORDEN: u1,
        /// Set 1 to enable cpu pdebug function, must set this bit can get cpu PC
        CORE_1_RCD_PDEBUGEN: u1,
        padding: u30 = 0,
    }),
    /// record status regsiter
    /// offset: 0xc8
    CORE_1_RCD_PDEBUGPC: mmio.Mmio(packed struct(u32) {
        /// recorded PC
        CORE_1_RCD_PDEBUGPC: u32,
    }),
    /// record status regsiter
    /// offset: 0xcc
    CORE_1_RCD_PDEBUGSP: mmio.Mmio(packed struct(u32) {
        /// recorded sp
        CORE_1_RCD_PDEBUGSP: u32,
    }),
    /// exception monitor status register0
    /// offset: 0xd0
    CORE_1_IRAM0_EXCEPTION_MONITOR_0: mmio.Mmio(packed struct(u32) {
        /// reg_core_1_iram0_recording_addr_0
        CORE_1_IRAM0_RECORDING_ADDR_0: u24,
        /// reg_core_1_iram0_recording_wr_0
        CORE_1_IRAM0_RECORDING_WR_0: u1,
        /// reg_core_1_iram0_recording_loadstore_0
        CORE_1_IRAM0_RECORDING_LOADSTORE_0: u1,
        padding: u6 = 0,
    }),
    /// exception monitor status register1
    /// offset: 0xd4
    CORE_1_IRAM0_EXCEPTION_MONITOR_1: mmio.Mmio(packed struct(u32) {
        /// reg_core_1_iram0_recording_addr_1
        CORE_1_IRAM0_RECORDING_ADDR_1: u24,
        /// reg_core_1_iram0_recording_wr_1
        CORE_1_IRAM0_RECORDING_WR_1: u1,
        /// reg_core_1_iram0_recording_loadstore_1
        CORE_1_IRAM0_RECORDING_LOADSTORE_1: u1,
        padding: u6 = 0,
    }),
    /// exception monitor status register2
    /// offset: 0xd8
    CORE_1_DRAM0_EXCEPTION_MONITOR_0: mmio.Mmio(packed struct(u32) {
        /// reg_core_1_dram0_recording_wr_0
        CORE_1_DRAM0_RECORDING_WR_0: u1,
        /// reg_core_1_dram0_recording_byteen_0
        CORE_1_DRAM0_RECORDING_BYTEEN_0: u16,
        padding: u15 = 0,
    }),
    /// exception monitor status register3
    /// offset: 0xdc
    CORE_1_DRAM0_EXCEPTION_MONITOR_1: mmio.Mmio(packed struct(u32) {
        /// reg_core_1_dram0_recording_addr_0
        CORE_1_DRAM0_RECORDING_ADDR_0: u24,
        padding: u8 = 0,
    }),
    /// exception monitor status register4
    /// offset: 0xe0
    CORE_1_DRAM0_EXCEPTION_MONITOR_2: mmio.Mmio(packed struct(u32) {
        /// reg_core_1_dram0_recording_pc_0
        CORE_1_DRAM0_RECORDING_PC_0: u32,
    }),
    /// exception monitor status register5
    /// offset: 0xe4
    CORE_1_DRAM0_EXCEPTION_MONITOR_3: mmio.Mmio(packed struct(u32) {
        /// reg_core_1_dram0_recording_wr_1
        CORE_1_DRAM0_RECORDING_WR_1: u1,
        /// reg_core_1_dram0_recording_byteen_1
        CORE_1_DRAM0_RECORDING_BYTEEN_1: u16,
        padding: u15 = 0,
    }),
    /// exception monitor status register6
    /// offset: 0xe8
    CORE_1_DRAM0_EXCEPTION_MONITOR_4: mmio.Mmio(packed struct(u32) {
        /// reg_core_1_dram0_recording_addr_1
        CORE_1_DRAM0_RECORDING_ADDR_1: u24,
        padding: u8 = 0,
    }),
    /// exception monitor status register7
    /// offset: 0xec
    CORE_1_DRAM0_EXCEPTION_MONITOR_5: mmio.Mmio(packed struct(u32) {
        /// reg_core_1_dram0_recording_pc_1
        CORE_1_DRAM0_RECORDING_PC_1: u32,
    }),
    /// cpu status register
    /// offset: 0xf0
    CORE_1_LASTPC_BEFORE_EXCEPTION: mmio.Mmio(packed struct(u32) {
        /// cpu's lastpc before exception
        CORE_1_LASTPC_BEFORE_EXC: u32,
    }),
    /// cpu status register
    /// offset: 0xf4
    CORE_1_DEBUG_MODE: mmio.Mmio(packed struct(u32) {
        /// cpu debug mode status, 1 means cpu enter debug mode.
        CORE_1_DEBUG_MODE: u1,
        /// cpu debug_module active status
        CORE_1_DEBUG_MODULE_ACTIVE: u1,
        padding: u30 = 0,
    }),
    /// offset: 0xf8
    reserved248: [8]u8,
    /// exception monitor status register6
    /// offset: 0x100
    CORE_X_IRAM0_DRAM0_EXCEPTION_MONITOR_0: mmio.Mmio(packed struct(u32) {
        /// reg_core_x_iram0_dram0_limit_cycle_0
        CORE_X_IRAM0_DRAM0_LIMIT_CYCLE_0: u20,
        padding: u12 = 0,
    }),
    /// exception monitor status register7
    /// offset: 0x104
    CORE_X_IRAM0_DRAM0_EXCEPTION_MONITOR_1: mmio.Mmio(packed struct(u32) {
        /// reg_core_x_iram0_dram0_limit_cycle_1
        CORE_X_IRAM0_DRAM0_LIMIT_CYCLE_1: u20,
        padding: u12 = 0,
    }),
    /// clock register
    /// offset: 0x108
    CLOCK_GATE: mmio.Mmio(packed struct(u32) {
        /// Set 1 force on the clock gate
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// offset: 0x10c
    reserved268: [752]u8,
    /// version register
    /// offset: 0x3fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// version register
        ASSIST_DEBUG_DATE: u28,
        padding: u4 = 0,
    }),
};
