const std = @import("std");
const builtin = @import("builtin");
const root = @import("root");
const CSR = @import("csr.zig").CSR;
const InterruptCSRs = @import("interrupts.zig").InterruptCSRs;
const Clic = @import("interrupts.zig").Clic;
const MemoryStack = @import("memory.zig").MemoryStack;

const Interrupt_callconv = std.builtin.CallingConvention.Interrupt.riscv32_interrupt;
pub const INTERRUPT: std.builtin.CallingConvention = if (builtin.cpu.arch == .riscv32) .{.riscv32_interrupt = .{.mode = .machine}} else .c;

pub const number_of_interrupts = 48; 
pub const ISR = *const fn () callconv(INTERRUPT) void;
pub const PanicHandler = *const fn () callconv(INTERRUPT) noreturn;

/// The `extern` keyword creates a reference to an external symbol 
/// in the output object file. It can be used to link against a 
/// variable or function that is exported from another object. 
/// While the `export` keyword can be used to make a variable 
/// available to other objects at link time. The `export` would 
/// define a new global symbol visable to the linker. 
extern fn app_main() callconv(.c) void; 
// extern fn app_main() void; 

fn default_handler() linksection(".iram0.isr_handler") void {
    asm volatile ("nop");
}

fn show_stacktrace(writer: std.Io.Writer, stack_trace: ?*std.builtin.StackTrace) noreturn{
    _ = writer;
    if(stack_trace) |trace|{
        _ = trace;
    }
    
}

fn default_panic() linksection(".iram0.isr_handler") noreturn {
    @branchHint(.cold);
    // asm volatile ("csrc mstatus, %[m]" :: [m] "r" (@as(u32, 1) << 3));
    // dump useful stuff like mcause/mepc stack-trace etc...

    // @trap();
    while (true) {}
}

pub fn panic(msg: []const u8, trace: ?*std.builtin.StackTrace, ret_addr: ?usize) noreturn {
    // Optional: mark cold so it doesn't bloat hot paths
    @branchHint(.cold);
    _ = trace;
    _  = ret_addr;

    // Make the system safe to print/log
    asm volatile ("csrci mstatus, 8"); // MIE=0

    // Send/Write the panic message...
    std.log.err("mcause: 0x{x}, mepc: 0x{x}, mtval: 0x{x}, Error Code: {s}", .{
        CSR.mcause.read_csrr(),
        CSR.mepc.read_csrr(),
        CSR.mtval.read_csrr(),
        msg,
    });

    @trap();
    // while (true) asm volatile ("wfi");
    // @compileError(msg);
}

// Weak linkage means a symbol can be overridden by another 
// symbol of the same name with strong linkage. Often used 
// in default handlers that can be replaced by the user.
comptime{
    @export(&default_interrupt_handler, .{ .name = "_interrupt_handler", .linkage = .weak, });
    @export(&default_panic_handler, .{.name = "_panic_handler", .linkage = .weak, });
    
    var count: usize = 0; 

    const system_handler_info = @typeInfo(WeakHandlers.System).@"struct";
    for (system_handler_info.decls) |sys_handler|{
        // const system_int_handler: PanicHandler = &default_panic_handler;
        // const system_intrpt_name = std.fmt.comptimePrint("system_interrupt{d}", .{idx});
        const handler_fn = @field(WeakHandlers.System, sys_handler.name);
        // @export(system_int_handler, .{ .name = sys_handler.name, .linkage = .weak });
        @export(&handler_fn, .{ .name = sys_handler.name, .linkage = .weak });
        count += 1;
    }
    const isrs_info = @typeInfo(WeakHandlers.ISRs).@"struct";
    for (isrs_info.decls) |weakFn|{
        const handler_fn = @field(WeakHandlers.ISRs, weakFn.name);
        // @compileLog("Exporting the weak ISR handler: ", handler_fn);
        if(!@hasDecl(root, weakFn.name)){
            @export(&handler_fn, .{ .name = weakFn.name, .linkage = .weak });
        }
        // @export(&default_interrupt_handler, .{ .name = weakFn.name, .linkage = .weak });
        // @export(&handler_fn, .{ .name = weakFn.name, .linkage = .weak });
        count += 1;
    }
    const panics_info = @typeInfo(WeakHandlers.Panics).@"struct";
    for (panics_info.decls) |weakPanicFn|{
        const panic_fn = @field(WeakHandlers.Panics, weakPanicFn.name);
        // @compileLog("Exporting the weak Panic handler: ", panic_fn);
        // @export(&default_panic_handler, .{ .name = weakPanicFn.name, .linkage = .weak });
        @export(&panic_fn, .{ .name = weakPanicFn.name, .linkage = .weak });
        count += 1;
    }
    // @compileLog("Exported amount of handlers: ", count);
}

pub const WeakHandlers = struct {
    pub const System = struct {
        pub fn system_interrupt0() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt1() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt2() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt3() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt4() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt5() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt6() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt7() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt8() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt9() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt10() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt11() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt12() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt13() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt14() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn system_interrupt15() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
    };

    pub const Panics = struct {
        pub fn panic0_exception_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn panic1_exception_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn memprot_isr() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn assist_debug_isr() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
        pub fn ipc_isr() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn {default_panic();}
    };

    pub const ISRs = struct {
        pub fn isr0_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr1_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr2_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr3_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr4_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr5_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr6_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr7_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr8_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr9_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr10_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr11_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr12_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr13_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr14_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr15_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr16_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr17_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr18_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr19_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr20_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr21_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr22_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr23_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr24_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr25_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
        pub fn isr26_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {default_handler();}
    };
};

pub const ExternalHandlerSymbols = struct {
    pub const System = struct {
        pub extern fn system_interrupt0() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt1() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt2() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt3() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt4() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt5() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt6() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt7() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt8() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt9() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt10() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt11() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt12() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt13() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt14() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn system_interrupt15() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
    };

    pub const Panics = struct {
        pub extern fn panic0_exception_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn panic1_exception_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn memprot_isr() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn assist_debug_isr() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
        pub extern fn ipc_isr() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn;
    };

    pub const ISRs = struct {
        // pub const isr0_handler = @extern(&isr0_handler, .{ .name = "isr0_handler", .linkage = .weak});
        pub extern fn isr0_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr1_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr2_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr3_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr4_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr5_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr6_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr7_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr8_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr9_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr10_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr11_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr12_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr13_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr14_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr15_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr16_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr17_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr18_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr19_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr20_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr21_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr22_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr23_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr24_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr25_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
        pub extern fn isr26_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void;
    };
    
};



/// Interrupt Calling Convention uses a special interrupt-safe ABI, 
/// that would preserves state automatically. 
/// ----------------------------------------------------------
/// To help with efficiency of save and restore context, 
/// interrupt attributes can be applied to functions used for 
/// interrupt handling...
///     Applying attribute will save and restore additional registers 
/// that are used within the handler, and add an mret instruction 
/// at the end of the handler
pub fn default_interrupt_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void{
    default_handler();
}

pub fn default_panic_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) noreturn{
    default_panic();
    // early_trap();
}


/// Represent a custom bootloader or startup code function, 
/// that reference the .text.entry section. It defines 
/// a function _startup that go into the segment of .text.boot.
/// The entry point of the program is called by the reset handler, 
/// and after RAM has been initialized. It should be a never ending 
/// function that ends with an infinite loop.
/// The `.naked` calling convention makes a function not have any 
/// function prologue or epilogue. This can be useful when integrating 
/// with assembly. 
///     start()
///    /   |   \
///   /    |    \
/// copy  zero  init
/// .data  .bss  IRQ
///       |
///  pub fn main()
export fn _start() linksection(".iram0.entry") callconv(.naked) noreturn {
    // The stack pointer (sp) points to the top of the stack as the lowest numerical address. 
    // While the _stack_end or bottom of the stack is at a fixed higher numerical address. 
    // Recall how stack goes from HIGH → LOW addresses (grow towards lower addresses).
    // - Frame Pointer (fp) - points to a fixed location within a frame. 

    // The start-up code must initialize the stack before the compiler generated code is executed. 
    // 1. This would set the stack pointer to the start of the stack. 
    // The `jal` instruction - "Jump And Link" : jump to a function and setting PC to the function to execute. 
    // asm volatile (
    //                 \\.option push;
    //                 \\.option norelax;
    //                 \\la gp, __global_pointer$;
    //                 \\.option pop;
    //                 \\la sp, _stack_top;
    //                 \\add s0, sp, zero;
    //                 \\jal zero, startup_init; 
    //             ); 

    //TODO: - Make the watermark fill directly in the naked handler.
    asm volatile (
                    \\.option push;
                    \\.option norelax;
                    \\la gp, __global_pointer$;
                    \\.option pop;

                    \\la t0, _stack_bottom;
                    \\la t1, _stack_top;
                    \\li t2, 0xA5;
                    
                    \\1:
                    \\sb t2, 0(t0);
                    \\addi t0, t0, 1;
                    \\blt t0, t1, 1b;

                    \\la sp, _stack_top;
                    \\add s0, sp, zero;
                    \\jal zero, startup_init; 
                ); 


    // Setting the frame pointer (optional) where s0 = fp:
    // - Variant 1: la fp, _stack_top;
    // - Variant 2: add s0, sp, zero;
    // - Variant 3: mv   fp, sp

    // .option push          # save current assembler options
    // .option norvc         # force 32-bit instructions
    // .option norelax       # prevent relaxation in this block
    // # ... critical code (trap entry, mtvt stubs, reset) ...
    // .option pop           # restore previous option

}

// pub export fn startup_init() linksection(".iram0.startup") callconv(.c) noreturn {
pub fn startup_init() linksection(".iram0.startup") callconv(.c) noreturn {
    // 1. init memory initialisation code:
    mem_setup();
    // InterruptCSRs.set_mie(.Off);

    enable_fpu();

    // 2. Setup Clic + `mtvec` + `mtvt`.
    // irq_setup();
    Clic.initial_setup(
        @intFromPtr(&_vector_table),
        @intFromPtr(&_mtvt_table)
    );

    // 3. Call/Jump to main code
    app_main();
    
    // 4. Trap Loop: Infinite loop
    _exit_trap();
}

pub fn enable_fpu() void{
    if(builtin.abi.float() == .hard){
        const FS_SHIFT = 13;
        const FS_MASK: u32 = 0b11 << FS_SHIFT;
        const FS_INIT: u32 = 0b01 << FS_SHIFT;
        const FS_CLEAN: u32 = 0b10 << FS_SHIFT;

        var fs_mask = CSR.mstatus.read_csrr();
        
        // std.log.info("Step 1: ~FS_MASK: 0b{b}\n", .{~FS_MASK});
        // const step2_log = fs_mask & ~FS_MASK;
        // std.log.info("Step 2: mstatus & ~FS_MASK: 0b{b}\n", .{step2_log});
        fs_mask = (fs_mask & ~FS_MASK) | FS_INIT;
        // std.log.info("Step 3: (mstatus & ~FS_MASK) | FS_INIT: 0b{b}\n", .{fs_mask});
        CSR.mstatus.write_csrw(fs_mask);
        // CSR.fcsr.write_csrw(0); // Writing to `fcsr` makes FS dirty.
        CSR.fcsr.write_csrw(1); // Writing to `fcsr` makes FS dirty.
       
        fs_mask = CSR.mstatus.read_csrr();
        // std.log.info("mstatus (dirty): 0b{b}\n", .{fs_mask});
        fs_mask = (fs_mask & ~FS_MASK) | FS_CLEAN;
        CSR.mstatus.write_csrw(fs_mask);
    }

}

pub export fn early_trap() linksection(".iram0.isr_handler") noreturn {
    @branchHint(.cold);
    asm volatile (
        \\ csrr t0, mcause;
        \\ csrr t1, mepc;
        \\ csrr t2, mtval;
        \\ ebreak;              
        \\ mret;
    );
    while(true){}
}


/// References to the linker and its sections. Such as 
/// to the .bss, .data, .text, etc...
/// `extern` keyword : Declare a symbol defined elsewhere (linker/asm).
/// -----------------------------------------------
/// – 128 KB HP ROM (0x4FC0_0000 ~ 0x4FC1_FFFF) 
/// – 768 KB HP L2MEM (0x4FF0_0000 ~ 0x4FFB_FFFF) 
/// – 64 MB external flash (0x4000_0000 ~ 0x43FF_FFFF) 
/// – 64 MB external RAM (0x4800_0000 ~ 0x4BFF_FFFF) 
/// -----------------------------------------------
pub const linker_sections = struct {
    pub extern var _stack_top: u8; // Top/End of the stack (Lowest Numerical Address)
    pub extern var _stack_size: u8; 
    pub extern var _stack_bottom: u8; // Bottom/Start of the stack (Higher Numerical Address)

    pub extern var _text_start: u8; 

    pub extern var _iram_start: u8; 
    pub extern var _iram_size: u8; 
    pub extern var _iram_end: u8; 

    pub extern var _drom_start: u8; 

    pub extern var _data_start: u8;

    pub extern var _dram0_start: u8; 
    pub extern var _dram0_end: u8; 

    pub extern var _bss_start: u8;
    pub extern var _bss_size: u8;
    pub extern var _bss_end: u8;
};


pub fn getMemorySymbols() void {
    @export(&startup_init, .{.linkage = .strong, .name = "_startup_init"});
}

// Example of saving context for trap vector:
// _example_trap:
//     addi sp, sp, -16*4
//     sw ra, 0(sp)
//     la ra, interrupt1
//     j _my_custom_isr

/// Here we define extern function pointer types, 
/// as our handlers in the `mtvt` table. It's 
/// important to make it ABI-compatible by using 
/// types that of the same size. 
pub const TrapVector = extern union{
    /// A reserved field, act as a filler for entries 
    /// that shouldn't be used. 
    RESERVERD: usize,
    ISR_HANDLER: ISR,
    PANIC_HANDLER: PanicHandler,
};
comptime {
    if(@sizeOf(ISR) != @sizeOf(usize)) @compileError("ISR type doesnt match the size of a function ptr (usize)");
    if(@sizeOf(PanicHandler) != @sizeOf(usize)) @compileError("ISR type doesnt match the size of a function ptr (usize)");
    if(@sizeOf(TrapVector) != @sizeOf(usize)) @compileError("TrapVector Union doesnt match the size of a function ptr (usize)");
    if(@alignOf(TrapVector) != @alignOf(usize)) @compileError("TrapVector Alignment doesnt match the alignment of a function ptr (usize)");
}

/// Machine Trap Vector Base Address. This should not be a table of ISRs. 
/// Instead, acts as an entry point + mode for all the traps. 
pub export fn _vector_table() linksection(".iram0.vectors") callconv(.naked) noreturn{
    // Equivalent to:  j _panic_handler
    asm volatile (
        \\  .option push
        \\  .option norvc
        \\  .option norelax
        \\  la   t0, _panic_handler
        \\  jalr x0, 0(t0)  
        \\  .option pop
    );
    // unreachable;
}

// pub export var _mtvt_table: [48]TrapVector
//     align(64) linksection(".iram0.mtvt") = [_]TrapVector{
// }; 

fn initialize_mtvt(comptime Vector: type) [48]Vector{
    if(Vector != TrapVector) @compileError("Vector type must be the type TrapVector!");
    var mtvt: [48]TrapVector = undefined;
    comptime var i: usize = 0; 
    const system_handlers = @typeInfo(ExternalHandlerSymbols.System).@"struct";
    for(system_handlers.decls) |handler|{
        mtvt[i] = TrapVector{.PANIC_HANDLER = @field(ExternalHandlerSymbols.System, handler.name)};
        i += 1;
    }
    
    // batch 1: 0..24 includes from index 0 to 23 (end-exclusive).
    const isr_batch = @typeInfo(ExternalHandlerSymbols.ISRs).@"struct";
    const batch2 = isr_batch.decls[24..];
    for(0..24) |batch1_index|{
        const isr_handler = isr_batch.decls[batch1_index];
        mtvt[i] = TrapVector{.ISR_HANDLER = @field(ExternalHandlerSymbols.ISRs, isr_handler.name)};
        i += 1;
    }
    const panics = @typeInfo(ExternalHandlerSymbols.Panics).@"struct";
    for(panics.decls) |handler|{
        mtvt[i] = TrapVector{.PANIC_HANDLER = @field(ExternalHandlerSymbols.Panics, handler.name)};
        i += 1;
    }
    for(batch2) |isr_handler|{
        mtvt[i] = TrapVector{.ISR_HANDLER = @field(ExternalHandlerSymbols.ISRs, isr_handler.name)};
        i += 1;
    }

    if(i != 48) @compileError("Failed filling all 48 entries to the _mtvt_table!");
    // @compileLog("mtvt contains: \n");
    // for(mtvt) |handler_entry|{
    //     @compileLog(handler_entry);
    // }
    return mtvt;

}


/// The ESP32-P4 has 126 peripheral interrupt sources. To map them to 32 HP CPU0 
/// or 32 HP CPU1 interrupts a matrix is needed. One peripheral interrupt source 
/// can be mapped to multiple HP CPU0 interrupts. 
/// The register `CORE0_SOURCE_Y_MAP` maps the interrupt signal of source Y to 
/// one of CPU0's external interrupt. It can be configured as 16~47. 
/// Writing is done in the bits [5:0] LSB's. Writing a 0 will disable the interrupt 
/// source.
/// ------------------------
/// Overriding the default_interrupt_handler, we need to export the 
/// ISR function (non-weak) symbol with the same name. 
pub export var _mtvt_table: [48]TrapVector
    align(64) linksection(".iram0.mtvt") = initialize_mtvt(TrapVector); 


// align(64) linksection(".iram0.mtvt") = [_]u32{0} ** 48; 


pub const VectorHandler = enum {
    RESERVERD, 
    PANIC_HANDLER,
    ISR_HANDLER,

    pub const Kind = union(VectorHandler){
        RESERVERD: usize,
        ISR_HANDLER: ISR,
        PANIC_HANDLER: PanicHandler,

        pub fn get(comptime self: Kind) switch (self) {
            .RESERVERD => usize,
            .ISR_HANDLER => ISR,
            .PANIC_HANDLER => PanicHandler,
        }{
            return switch (self) {
                .RESERVERD => |reserved| reserved,
                .ISR_HANDLER => |isr| isr,
                .PANIC_HANDLER => |panic_handler| panic_handler,
            };
        }
    };

    pub fn Handler(comptime self: VectorHandler, comptime handler_name: []const u8) type{
        return switch (self){
            .RESERVERD => GenericHandlers(self, handler_name),
            .PANIC_HANDLER => GenericHandlers(self, handler_name),
            .ISR_HANDLER => GenericHandlers(self, handler_name),
        };
    }
};


pub fn GenericHandlers(comptime Handler: VectorHandler, comptime handler_name: []const u8) type{
    const HandlerType = switch (Handler) {
        .RESERVERD => usize,
        .PANIC_HANDLER => PanicHandler,
        .ISR_HANDLER => ISR,
    };

    return struct {
        const Self = @This();
        name: []const u8 = handler_name,
        handler: HandlerType,

        pub fn new(handler: HandlerType) Self{
            return Self{
                .name = handler_name,
                .handler = handler,
            };
        }
    };
}


// pub fn getWeakGenericHandlerSymbols() align(64) [48]GenericHandlers {
// pub fn getWeakGenericHandlerSymbols() [48]type {
//     return [48]GenericHandlers{

// pub fn getWeakGenericHandlerSymbols() type {
//     var handler_field: [48]std.builtin.Type.StructField = undefined;
//     // var handlers: [48]GenericHandlers = undefined;
//     comptime var num: usize = 0;
//
//     inline for (handler_field[0..], 0..) |*field, idx|{
//         if (idx < 16){
//             const Type = GenericHandlers(.PANIC_HANDLER, std.fmt.comptimePrint("system_interrupt{d}", .{idx}));
//             field.* = .{
//                 .name = std.fmt.comptimePrint("system_interrupt{d}", .{idx}),
//                 .type = Type,
//                 .default_value_ptr = null,
//                 .is_comptime = false,
//                 .alignment = @alignOf(Type),
//             };
//         }else if ((idx >= 16 and idx <= 40) or idx > 45){
//             num += 1;
//             const Type = GenericHandlers(.ISR_HANDLER, std.fmt.comptimePrint("isr{d}", .{num - 1}));
//             field.* = .{
//                 .name = std.fmt.comptimePrint("isr{d}", .{num - 1}),
//                 .type = Type,
//                 .default_value_ptr = null,
//                 .is_comptime = false,
//                 .alignment = @alignOf(Type),
//             };
//         }else{
//             const Type = if (idx == 41) GenericHandlers(.PANIC_HANDLER, "soc_panic0") 
//                         else if(idx == 42) GenericHandlers(.PANIC_HANDLER, "soc_panic1")
//                         else if(idx == 43) GenericHandlers(.PANIC_HANDLER, "memprot_isr")
//                         else if (idx == 44) GenericHandlers(.PANIC_HANDLER, "assist_debug_isr")
//                         else if(idx == 45) GenericHandlers(.PANIC_HANDLER, "ipc_isr");
//
//             const panic_name = if(idx == 41) "soc_panic0"
//                         else if(idx == 42) "soc_panic1"
//                         else if(idx == 43) "memprot_isr"
//                         else if (idx == 44) "assist_debug_isr"
//                         else if(idx == 45) "ipc_isr";
//             field.* = .{
//                 .name = panic_name,
//                 .type = Type,
//                 .default_value_ptr = null,
//                 .is_comptime = false,
//                 .alignment = @alignOf(Type),
//             };
//         }
//     }
//
//     return @Type(.{
//         .@"struct" = .{
//             .layout = .auto,
//             .fields = &handler_field,
//             .decls = &.{},
//             .is_tuple = false,
//         }
//     });
//
//
// }

// pub var _weak_handlers: [48]DefaultHandlers align(64) = [48]DefaultHandlers{};


pub fn getStartupSymbols() void {
    // @export(&_mtvt_table, .{.linkage = .strong, .name = "_mtvt_table", .section = ".iram0.mtvt"});
    @export(&startup_init, .{.linkage = .strong, .name = "startup_init", .section = ".iram0.startup"});
    // @export(&startup_init, .{.linkage = .strong, .name = "_startup_init"});
}


/// Uses pointer casting and volatile for Memory-Mapped-IO (MMIO).
/// Initialize statics from ROM (FLASH) to RAM & default initialized static RAM.
inline fn mem_setup() void {
    // @setRuntimeSafety(false);

    // Zero the .bss section. by casting to meny-item pointer. 
    const mem_region_start: [*]u8 = @ptrCast(&linker_sections._bss_start);
    const mem_region_end: [*]u8 = @ptrCast(&linker_sections._bss_end);
    @memset(mem_region_start[0..@intFromPtr(mem_region_end) - @intFromPtr(mem_region_start)], 0);

    // Copy the .data values from ROM to RAM
    const dram_start: [*]u8 = @ptrCast(&linker_sections._dram0_start);
    const dram_end: [*]u8 = @ptrCast(&linker_sections._dram0_end);
    
    const drom: [*]const u8 = @ptrCast(&linker_sections._data_start);
    @memcpy(dram_start[0..@intFromPtr(dram_end) - @intFromPtr(dram_start)], drom[0..@intFromPtr(dram_end) - @intFromPtr(dram_start)]);
    
    // @setRuntimeSafety(true);
}

///If an interrupt occurs and is configured as (hardware) vectored, 
///the CPU will jump to MTVT[31:0] + 4 * interrupt_id → callback (ISR) function.
/// ---------------------------------------------------
/// `mtvec` → "Machine Trap-Vector Base-Address Register" → selects interrupt mode, IRQ handler.
/// `mcause` → "Machine Cause Register".
/// `mepc` → Machine Trap/Exception Program Counter.
/// `mret` → Returns and restores stack context.
/// `mtval` → Configures Machine Trap Value. 
pub inline fn irq_setup() void {
    
    // Gets the external `_vector_table` provided from the linker script as the address.  
    // Then it writes a CSR reg for setting the machine mode interrupt vector
    // base address from the given external `_vector_table` symbol from the linker. 

    // InterruptCSRs.set_mtvec_csrw(@intFromPtr(&_vector_table), .clic); // In ESP32P4 mode has to be 3. 
    InterruptCSRs.setup_mtvec(@intFromPtr(&_vector_table), .clic);
    // Sets address to our jump interrupt vector table - `MTVT`.
    InterruptCSRs.set_mtvt(@intFromPtr(&_mtvt_table)); 
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
