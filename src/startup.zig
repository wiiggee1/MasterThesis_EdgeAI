const std = @import("std");
const builtin = @import("builtin");
const priv_mode = std.builtin.CallingConvention.RiscvInterruptOptions.PrivilegeMode.machine;
const Interrupt = std.builtin.CallingConvention.Interrupt.riscv32_interrupt;
pub const INTERRUPT: std.builtin.CallingConvention = if (builtin.cpu.arch == .riscv32) .{.riscv32_interrupt = .{.mode = priv_mode}} else .C;

// Weak linkage means a symbol can be overridden by another 
// symbol of the same name with strong linkage. Often used 
// in default handlers that can be replaced by the user.
comptime {
    @export(&default_interrupt_handler, .{ .name = "default_interrupt_handler", .linkage = .weak });
    @export(&default_panic_handler, .{.name = "default_panic_handler", .linkage = .weak });
}

pub const ISRHandlers = struct {
    // pub fn soc_panic_handler() callconv(.C) void {default_panic_handler();}
    // pub fn uart0_isr() callconv(.C) void {default_interrupt_handler();}
    // pub fn ledc_isr() callconv(.C) void {default_interrupt_handler();}
    // pub fn systimer_target0_isr() callconv(.C) void {default_interrupt_handler();}
    // pub fn systimer_target1_isr() callconv(.C) void {default_interrupt_handler();}
    // pub fn gpio0_isr() callconv(.C) void {default_interrupt_handler();}
    // pub fn gpio1_isr() callconv(.C) void {default_interrupt_handler();}
    // pub fn flash_mspi_isr() callconv(.C) void {default_interrupt_handler();}
    // pub fn usb_device_isr() callconv(.C) void {default_interrupt_handler();}
    // pub fn usb_otg_isr() callconv(.C) void {default_interrupt_handler();}
    // pub fn core0_trace_isr() callconv(.C) void {default_interrupt_handler();}
    // pub fn assist_debug_isr() callconv(.C) void {default_interrupt_handler();}

    pub fn soc_panic_handler() callconv(INTERRUPT) noreturn {default_panic();}
    pub fn uart0_isr() callconv(INTERRUPT) noreturn {default_handler();}
    pub fn ledc_isr() callconv(INTERRUPT) noreturn {default_handler();}
    pub fn systimer_target0_isr() callconv(INTERRUPT) noreturn {default_handler();}
    pub fn systimer_target1_isr() callconv(INTERRUPT) noreturn {default_handler();}
    pub fn gpio0_isr() callconv(INTERRUPT) noreturn {default_handler();}
    pub fn gpio1_isr() callconv(INTERRUPT) noreturn {default_handler();}
    pub fn flash_mspi_isr() callconv(INTERRUPT) noreturn {default_handler();}
    pub fn usb_device_isr() callconv(INTERRUPT) noreturn {default_handler();}
    pub fn usb_otg_isr() callconv(INTERRUPT) noreturn {default_handler();}
    pub fn core0_trace_isr() callconv(INTERRUPT) noreturn {default_handler();}
    pub fn assist_debug_isr() callconv(INTERRUPT) noreturn {default_handler();}
};


pub fn getInterruptHandlerSymbols() void {
    @export(&ISRHandlers.soc_panic_handler, .{.name = "soc_panic_handler", .linkage = .weak });
    @export(&ISRHandlers.ledc_isr, .{.name = "ledc_isr", .linkage = .weak });
    @export(&ISRHandlers.systimer_target0_isr, .{.name = "systimer_target0_isr", .linkage = .weak });
    @export(&ISRHandlers.systimer_target1_isr, .{.name = "systimer_target1_isr", .linkage = .weak });
    @export(&ISRHandlers.gpio0_isr, .{.name = "gpio0_isr", .linkage = .weak });
    @export(&ISRHandlers.gpio1_isr, .{.name = "gpio1_isr", .linkage = .weak });
    @export(&ISRHandlers.flash_mspi_isr, .{.name = "flash_mspi_isr", .linkage = .weak });
    @export(&ISRHandlers.usb_device_isr, .{.name = "usb_device_isr", .linkage = .weak });
    @export(&ISRHandlers.usb_otg_isr, .{.name = "usb_otg_isr", .linkage = .weak });
    @export(&ISRHandlers.core0_trace_isr, .{.name = "core0_trace_isr", .linkage = .weak });
    @export(&ISRHandlers.assist_debug_isr, .{.name = "assist_debug_isr", .linkage = .weak });
}

fn default_handler() noreturn {
    // while (true) {}
    asm volatile ("mret");
    if (builtin.mode == .Debug) @breakpoint();
    @trap();
}

fn default_panic() noreturn {
    @branchHint(.cold);

    @breakpoint(); 
    asm volatile ("mret");
    // while (true) {}
    @trap(); 
}

/// Interrupt Calling Convention uses a special interrupt-safe ABI, 
/// that would preserves state automatically. 
/// ----------------------------------------------------------
/// To help with efficiency of save and restore context, 
/// interrupt attributes can be applied to functions used for 
/// interrupt handling...
///     Applying attribute will save and restore additional registers 
/// that are used within the handler, and add an mret instruction 
/// at the end of the handler
fn default_interrupt_handler() callconv(INTERRUPT) noreturn{
    default_handler();
    // asm volatile ("mret");
}
fn default_panic_handler() callconv(INTERRUPT) noreturn{
    default_panic();
    // asm volatile ("mret");
}


/// The `extern` keyword creates a reference to an external symbol 
/// in the output object file. It can be used to link against a 
/// variable or function that is exported from another object. 
/// While the `export` keyword can be used to make a variable 
/// available to other objects at link time. The `export` would 
/// define a new global symbol visable to the linker. 
extern fn app_main() callconv(.C) void; 


/// Represent a custom bootloader or startup code function, 
/// that reference the .text.entry section. It defines 
/// a function _startup that go into the segment of .text.boot.
/// The entry point of the program is called by the reset handler, 
/// and after RAM has been initialized. It should be a never ending 
/// function that ends with an infinite loop.
///     start()
///    /   |   \
///   /    |    \
/// copy  zero  init
/// .data  .bss  IRQ
///       |
///  pub fn main()
/// The `.naked` calling convention makes a function not have any 
/// function prologue or epilogue. This can be useful when integrating 
/// with assembly. 
export fn _start() linksection(".text.entry") callconv(.naked) noreturn {
    // The stack pointer (sp) points to the top of the stack as the lowest numerical address. 
    // While the _stack_end or bottom of the stack is at a fixed higher numerical address. 
    // Recall how stack goes from HIGH → LOW addresses (grow towards lower addresses).
    // - Frame Pointer (fp) - points to a fixed location within a frame. 

    // The start-up code must initialize the stack before the compiler generated code is executed. 
    // 1. This would set the stack pointer to the start of the stack. 
    // The `jal` instruction - "Jump And Link" : jump to a function and setting PC to the function to execute. 
    asm volatile (
                    \\.option push;
                    \\.option norelax;
                    \\la gp, __global_pointer$;
                    \\.option pop;
                    \\la sp, _stack_top;
                    // \\jal zero, mem_setup;
                    \\jal zero, startup_init; 
                ); 
}

pub export fn startup_init() linksection(".text.startup") callconv(.C) noreturn {
    var mstatus: usize = mstatus_reg: {
        break :mstatus_reg asm volatile ("csrr a0, mstatus" : [ret] "={a0}" (-> usize));
    };

    // Disable interrupts before setup.
    // INTERRUPT_CORE0.CPU_INT_ENABLE.raw &= ~(@as(u32, 1) << @intFromEnum(int));
    mstatus &= ~(@as(u32, 1) << @as(u2, 3));
    asm volatile ("csrw mstatus, a0" :: [mstatus] "{a0}" (mstatus));

    // 1. init memory initialisation code:
    mem_setup();

    // 2. Setup Interrupt Vectors
    irq_setup();
    
    // Enable interrupts before main, by setting the third bit to one at mstatus reg. 
    mstatus |= @as(u32, 1) << @as(u2, 3); 
    asm volatile ("csrw mstatus, a0" :: [mstatus] "{a0}" (mstatus));

    // 3. Call/Jump to main code
    // asm volatile ("jal zero, app_main");
    app_main();
    
    // 4. Trap Loop: Infinite loop
    _exit_trap();
}


/// References to the linker and its sections. Such as 
/// to the .bss, .data, .text, etc...
/// -----------------------------------------------
/// – 128 KB HP ROM (0x4FC0_0000 ~ 0x4FC1_FFFF) 
/// – 768 KB HP L2MEM (0x4FF0_0000 ~ 0x4FFB_FFFF) 
/// – 64 MB external flash (0x4000_0000 ~ 0x43FF_FFFF) 
///  – 64 MB external RAM (0x4800_0000 ~ 0x4BFF_FFFF) 
/// -----------------------------------------------
/// → The `extern` specifier is used to declare a function that will be 
/// resolved at link time. ←
/// `extern` : Declare a symbol defined elsewhere (linker/asm).
pub const linker_sections = struct {
    pub extern var _stack_top: u8; // Top/End of the stack (Lowest Numerical Address)
    pub extern var _stack_size: u8; 
    pub extern var _stack_bottom: u8; // Bottom/Start of the stack (Higher Numerical Address)

    pub extern var _text_start: u8; 
    // pub extern var _text_end: u8; 

    pub extern var _interrupt_handler: u8;
    pub extern var _panic_handler: u8; 
    /// Same as `mtvec`.
    pub extern var _vector_table: u8; 

    pub extern var _iram_start: u8; 
    pub extern var _iram_size: u8; 
    pub extern var _iram_end: u8; 

    pub extern var _drom_start: u8; 

    pub extern var _dram0_start: u8; 
    // pub extern var _dram0_size: u8; 
    pub extern var _dram0_end: u8; 

    pub extern var _bss_start: u8;
    pub extern var _bss_size: u8;
    pub extern var _bss_end: u8;

    // pub extern var _trap_start: u8; // Trap handler upon exit, such as infinity loop. 
};

pub const number_of_interrupts = 48; 
// pub const ISR = *const fn () callconv(INTERRUPT) void;
pub const ISR = *const fn () callconv(INTERRUPT) void;

pub const TrapVector = extern union{
    RESERVERD: usize,
    ISR_HANDLER: ISR,
};

/// The ESP32-P4 has 126 peripheral interrupt sources. To map them to 32 HP CPU0 
/// or 32 HP CPU1 interrupts a matrix is needed. One peripheral interrupt source 
/// can be mapped to multiple HP CPU0 interrupts. 
/// The register `CORE0_SOURCE_Y_MAP` maps the interrupt signal of source Y to 
/// one of CPU0's external interrupt. It can be configured as 16~47. 
/// Writing is done in the bits [5:0] LSB's. Writing a 0 will disable the interrupt 
/// source.
/// -------------------------------
/// PROVIDE(_mtvt = .); /* This would set the external var to the start address */ 
/// KEEP(*(.mtvt.text)); /* This is the vector table containing the ISR callback functions. */ 
/// 4ff00430:       30579073                csrw    mtvec,a5
/// 4ff00434:       4ff007b7                lui     a5,0x4ff00
/// 4ff00438:       04078793                addi    a5,a5,64 # 4ff00040 <_mtvt_table>
/// 4ff0043c:       30779073                csrw    0x307,a5 # writes a5 into CSR at 0x307
/// ---------------------------------
/// vector_table: .word 10, 20, 30 would allocate three 4-byte words in memory. 
/// Meaning each entry in the vector_table is 32 bits.

// var vector_table = @as([*]volatile u32, @constCast(@ptrCast(@alignCast(&linker_sections._vector_table))));
// pub export var _mtvt_table : [48] ISR 
//     align(64) linksection(".iram0.mtvt") = [48]ISR{

pub export var _mtvt_table : [48] TrapVector 
    align(64) linksection(".iram0.mtvt") = [48]TrapVector{
    // pub export var _mtvt_table: [48]ISR align(64) linksection(".mtvt") = mtvt: {
    // [0..16] → Exceptions / panic handlers. 
    // [16..40] → 
    // vector_table[id] = callback_isr;
    // var vector_table = @as([*]volatile u32, @constCast(@ptrCast(@alignCast(&linker_sections._vector_table))));
    
    // Overriding the default_interrupt_handler, we need to export the 
    // ISR function (non-weak) symbol with the same name. 
    // @memset(vector_table[0..16], 
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_panic_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &ISRHandlers.soc_panic_handler}, // [40]
    TrapVector{.ISR_HANDLER = &ISRHandlers.soc_panic_handler},
    TrapVector{.ISR_HANDLER = &ISRHandlers.soc_panic_handler}, // [42]
    TrapVector{.ISR_HANDLER = &ISRHandlers.assist_debug_isr},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
    TrapVector{.ISR_HANDLER = &default_interrupt_handler},
};

pub fn getStartupSymbols() void {
    // @export(&_mtvt_table, .{.linkage = .strong, .name = "_mtvt_table", .section = ".iram0.mtvt"});
    @export(&startup_init, .{.linkage = .strong, .name = "_startup_init"});
}

// extern fn _mem_setup() noreturn;

/// Uses pointer casting and volatile for Memory-Mapped-IO (MMIO).
/// Initialize statics from ROM (FLASH) to RAM & default initialized static RAM.
inline fn mem_setup() void {
    @setRuntimeSafety(false);
    // Zero the .bss section. by casting to meny-item pointer. 
    const mem_region_start: [*]u8 = @ptrCast(&linker_sections._bss_start);
    const mem_region_end: [*]u8 = @ptrCast(&linker_sections._bss_end);
    @memset(mem_region_start[0..@intFromPtr(mem_region_end) - @intFromPtr(mem_region_start)], 0);

    // Copy the .data values from ROM to RAM
    const dram_start: [*]u8 = @ptrCast(&linker_sections._dram0_start);
    const dram_end: [*]u8 = @ptrCast(&linker_sections._dram0_end);
    const drom: [*]const u8 = @ptrCast(&linker_sections._drom_start);
    @memcpy(dram_start[0..@intFromPtr(dram_end) - @intFromPtr(dram_start)], drom[0..@intFromPtr(dram_end) - @intFromPtr(dram_start)]);
}

///If an interrupt occurs and is configured as (hardware) vectored, 
///the CPU will jump to MTVT[31:0] + 4 * interrupt_id → callback (ISR) function.
/// ---------------------------------------------------
/// For CLIC the CPU offers 32 external interrupt (peripheral's) lines 
/// and 16 internal (e.g., timer and software interrupts).
/// `CLIC` vectored mode offset: `mtvt + Interrupt ID * 4`
/// ---------------------------------------------------
/// `mtvec` → "Machine Trap-Vector Base-Address Register" → selects interrupt mode, IRQ handler.
/// `mcause` → "Machine Cause Register".
/// `mepc` → Machine Trap/Exception Program Counter.
/// `mret` → Returns and restores stack context.
/// `mtval` → Configures Machine Trap Value. 
/// Weak alias to the "NOP" implementations. To ignore the vector table entry. 
pub inline fn irq_setup() void {
    // #### CLIC Pseudo Code to Setup Interrupt:
    // 1. Write to `mtvt` to configure the interrupt mode and base address for interrupt vector table.
    //
    // 2. Enable interrupts via the memory mapped CLIC register space: `clicintie`
    //
    // 3. Write to `clicintie[i]` to enable the software, timer and external interrupt enables for 
    // each CLIC modes of operation. 
    //
    // 4. Write `mstatus` to enable interrupts globaly for each supported privilege mode. 
    
    // Gets the external `_vector_table` provided from the linker script as the address.  
    // Then it writes a CSR reg for setting the machine mode interrupt vector
    // base address from the given external `_vector_table` symbol from the linker. 

    RiscvRegisters.set_mtvec_csrw(@intFromPtr(&linker_sections._vector_table), 0b11); // In ESP32P4 mode has to be 3. 

    // Sets the mode to Vectored. 
    RiscvRegisters.set_mtvt(@intFromPtr(&_mtvt_table));

}

pub const RiscvRegisters = struct {
    pub const riscv_int_count = 48;  

    pub const Reg = enum {
        /// Machine Trap-Vector, containing  base address (BASE)
        /// and a vector mode (MODE)
        /// - Vectored Mode: Asynchronous interrupts set `pc` to BASE + 4*cause.
        mtvec,
        mstatus,
        mip,
        mie,
        mepc,
        mcause,
        mtval,
        mtime,
        mtimecmp,
    };
    // REG_WRITE(DR_REG_INTERRUPT_CORE0_BASE + 4 * intr_src, intr_num);

    /// This would write the CSR special purpose reg `csrw` for writing 
    /// to the `mtvec` - "Machine Trap Vector" and the mode. 
    /// Essentially it will write the assigned `a0` register to the `mtvec` table. 
    /// - Direct Mode: 0b00, jumps to `mtvec.base`
    /// - Vectored Mode: 0b01, 0b11 on ESP32-P4, jumps to `mtvec.base + (4 * interrupt ID)`
    /// -------------------------------------
    ///  @brief Bitmask to enable the vector mode when writing MTVEC CSR. *
    ///  Setting mode field to 3 treats `MTVT + 4 * interrupt_id` as the
    ///  service entry address for HW vectored interrupts.
    ///             #define MTVEC_MODE_CSR          3
    /// -------------------------------------
    /// asm asm-qualifiers ( AssemblerTemplate 
    ///                 : OutputOperands 
    ///                 [ : InputOperands
    ///                 [ : Clobbers ] ])
    /// → asm(code : output operand list : input operand list : clobber list);
    /// -------------------------------------
    pub inline fn set_mtvec_csrw(target_address: usize, mode: u2) void {
        // Base: bit 31-8, Mode: bit 1-0
        // const MTVEC: *volatile u32 = @ptrFromInt(0x305);
        // const MTVT_BASE: *volatile u32 = @ptrFromInt(0x307); // Sets the interrupt vector table
        // MTVEC.* |= @as(u32, 0x01); // Sets Mode to "Vectored"

        // var MTVEC_BASE_MODE_CSR = target_address; 
        // MTVEC_BASE_MODE_CSR |= @as(u32, mode); // Sets Mode to "Vectored"
        // target_address |= @as(u32, mode); // Sets Mode to "Vectored"
        // const valid_mode: bool = if(mode == 0b00 or mode == 0b11) true else false;
        // std.debug.assert(valid_mode);
        // asm volatile ("csrw mtvec, a0" :: [mtvec] "{a0}" (MTVEC_BASE_MODE_CSR));
        // asm volatile ("csrr a0, mstatus" : [ret] "={a0}" (-> usize));

        asm volatile (
            \\ori a5, %[base], %[mode_val]
            \\csrw mtvec, a5
            :
            : [base] "r"(target_address),
              [mode_val] "i"(mode)
            : "a5"
        );

        // asm volatile ("csrw mtvec, a0" 
        //     :
        //     : [mtvec] "{a0}" (target_address));
    }

    /// Setting the `mtvt` (Machine Trap Vector Table), by passing a pointer 
    /// address to the interrupt ISR jump table. 
    /// This table contain our callback (fn ptr) ISR handlers.
    pub inline fn set_mtvt(mtvt_ptr_address: usize) void {
        // asm volatile ("csrr a0, mtvec" : [ret] "={a0}" (-> usize));
        // CLIC CSR - the interrupt jump table address.

        //WARN: - Check that the mtvt_ptr_address is align(64). 
        //Should end with 0x40. 
        asm volatile ("csrw 0x307, a0" :: [mtvt] "{a0}" (mtvt_ptr_address));
    }

};

// register |= 1 << N; // Set bit N
// register &= ~(1 << N); // Clear bit N

pub fn setISR(int_id: usize, isr: fn () callconv(.C) noreturn) void {
    _ = int_id; 
    _ = isr; 
}

/// Whenever we are finished with processing an interrupt handler (ISR).
/// We exit the trap and enter an infinit loop and waiting for next 
/// interrupt. 
pub export fn _exit_trap() noreturn{
    // Halt here...
    while (true) {
       asm volatile ("wfi");
    }
}
