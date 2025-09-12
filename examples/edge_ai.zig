const std = @import("std");
const builtin = @import("builtin");
const core = @import("core");
const startup = core.startup;
const Testing = core.Testing;
const Hardware = core.Hardware;
const hal = core.DriversImpl;
pub const std_options = core.std_options; // Custom logging over usb-jtag.

const Peripheral = Hardware.Peripheral;
const ISR = Hardware.ISR;
const INTERRUPT = Hardware.INTERRUPT;
const TrapVector = Hardware.TrapVector;
const CSR = Hardware.CSR;

extern var _mtvt_table: [48]TrapVector; // extern var _mtvt_table: [48]TrapVector;
extern fn _vector_table() callconv(.naked) noreturn;

comptime {
    startup.getStartupSymbols();
}

const XTAL_CLK_FREQ: u64 = 40_000_000; // 40 MHz.
const FREQ_HZ: u64 = 16_000_000; // Average clock frequency: 16 MHz XTAL clk

/// Shared global context
const Shared = struct {
    const SystemTimerConfig = hal.SystemTimerConfig;
    const SystemTimer = hal.SystemTimer;
    const Clic = Hardware.Clic;
    const DriverApi = Hardware.DriverApi;

    const SysTimeCfg = SystemTimerConfig{
        .clk = .XTAL_CLK, 
        .counter = .UNIT0, 
        .freq = FREQ_HZ,
        .target_mode = .periodic,
        .target_num = .target0,
        .core0_stall_enabled = true,
        // .core0_stall_enabled = false,
    };

    systimer: SystemTimer,
    clic: Clic,
    timergroup: DriverApi(.TIMERG0, hal.TimerGroup),
    usb_jtag: DriverApi(.USB_JTAG, hal.UsbJtag),
};

var shared: Shared = undefined;
var int_counter: u32 = 0; 

/// Below is the override logic of the .weak `isr1_handler` symbol.
pub export fn isr1_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {
    // shared.systimer.enable_interrupt(false);
    
    std.log.warn("Hello from System Timer Target0 ISR!!!\n", .{});
    int_counter +=1;
    // clear interrupt bit. 
    shared.systimer.clear_interrupt();
    // shared.systimer.enable_interrupt(true);
    // shared.systimer.clear_interrupt();
    

    // asm volatile ("mret");
    // core.exit_trap();
}

/// Background idle work for sleeping inbetween interrupt events. 
inline fn idle() void{
    CSR.clear_interrupt(.mstatus);
    asm volatile ("wfi");
    CSR.interrupt_info_enable(); // mnxti, works only for non-vectored setting. 
    asm volatile ("beqz a0, idle");
}

/// This is the main entry point for the embedded firmware to run.
/// Which is jumped to whenever the reset handler `.text.entry`
/// section is finished. It can be summarized as: 
/// -----------------------------------------------------------
/// 1. The entry point of the program is called by the reset handler.
/// 2. The reset handler, would setup the following: 
///     - Initialize and load the stack pointer.
///     - Initialize and load the `.data` section from flash + fill `.bss` with default values. 
///     - Load Interrupt Vector Tables + defines weak linked default ISR handles. 
/// 3. After step(2) is completed it jumps to the main() function (our application code).
/// -----------------------------------------------------------
pub export fn app_main() callconv(.c) void {
    //Run embedded firmware below:
    const Interrupt = Hardware.Interrupt; 
    const TimerCfg = Shared.SysTimeCfg;
    // const GenericSystemTimer = Hardware.DriverApi(.SYSTIMER, hal.SystemTimer);
    // const system_timer = GenericSystemTimer.new(TimerCfg);

    shared = .{
        // .systimer = system_timer.driver,
        .systimer = .init(TimerCfg),
        .clic = .init(&_mtvt_table),
        .timergroup = .new(.{}),
        .usb_jtag = .new(.{}),
    };

    pre_setup(shared, &.{
        Peripheral.TIMERG0,
        // Peripheral.SYSTIMER,
        Peripheral.USB_JTAG,
    });

    // shared.clic.debug_info();


    // Set the alarm period + synchronize the alarm period + sets period mode. 
    // shared.systimer.setup_timer(.{ .time = 500_000 * 4, .unit = .Micro }) catch {};
    // shared.systimer.start_enable_work(); // COMPx starts comparing the count value of SUM(start value + n*δt) (n = 1, 2, 3...)
    // shared.systimer.enable_interrupt();
   
    const systimer_interrupt: Interrupt = Interrupt.init(.{
        .trigger_mode = Hardware.TriggerMode.level,
        .id = @as(u5, 1), // 0..31, id = 1 → _mtvt_table[17]
        .mtvt_index = @as(u6, 0), //TODO: : Change this to optional for initially setting to null.
        .isr = @as(ISR, isr1_handler),
        .priority = @as(?u3, null),
        .level = @as(u3, 1),
        .source = Hardware.PeripheralInterruptSources.SYSTIMER_TARGET0_INTR_SOURCE, 
        .threshold = @as(?u4, null),
    });

    // systimer_interrupt.sourceMappingDebug() catch |err|{
    //     std.log.err("Failed! Got Error: {s}\n", .{@errorName(err)});
    // };

    // const systimer_interrupt_v2: Interrupt = Interrupt.init(Interrupt.Config{
    //     .trigger_mode = .level,
    //     .id = 1,
    //     .mtvt_index = 0,
    //     .isr = isr1_handler,
    //     .priority = Interrupt.DefaultConfig.priority,
    //     .level = 1,
    //     .source = .SYSTIMER_TARGET0_INTR_SOURCE,
    //     .threshold = null, 
    // });

    // const cfg_parsed = hal.SystemTimerConfig.parse_v2(TimerCfg);
    // std.log.warn("usb_jtag: {any}\n", .{shared.usb_jtag});
    // std.log.warn("systimer cfg parsed: {any}\n", .{cfg_parsed});

    shared.systimer.setup_clock(.{.time = @as(u64, 500_000 * 4), .unit = .Micro}) catch |err|{
        std.log.err("Failed setting up clock. Got: {s}\n", .{@errorName(err)});
        startup.panic("Hell noooooo...", null, null);
    };

    const dt_old = shared.systimer.intoDeltaTimeTicks(.{.time = 500_000 * 15, .unit = .Micro});
    const dt_new = shared.systimer.intoDeltaTimeTicksNew(.{.time = 500_000 * 15, .unit = .Micro});
    std.log.warn("intoDeltaTimeTicks: {d} vs intoDeltaTimeTicksNew: {d}\n", .{dt_old, dt_new});

    
    shared.clic.configure_interrupt(systimer_interrupt) catch |err| {
        std.log.err("Got Error: {s}\n", .{@errorName(err)});
    };
    
    shared.clic.enableInterruptAt(&systimer_interrupt); // `clicintie[i]`
    shared.systimer.clear_interrupt();
    shared.systimer.enable_interrupt(true);
    shared.clic.enable_mie(); // Enable/Set MIE - global interrupts.

    std.log.warn("&systimer_target0_isr: {*}\r\n\t mtvt[{d}] = {*}\r\n\t_mtvt_table: {*}\n", .{
        &isr1_handler, 
        systimer_interrupt.config.mtvt_index, 
        &shared.clic.mtvt[systimer_interrupt.config.mtvt_index],
        shared.clic.mtvt.ptr
    });

    const result_vec = core.SIMD.vec_op(u32, 4, .Mul, [_]u32{1, 2, 3, 4}, [_]u32{5, 6, 7, 8});
    std.log.warn("SIMD Multiplication Test: {}\n", .{result_vec});

    // var iteration_num: usize = 0;
    while (true) {
        // shared.systimer.set_delay(.Micro, 500_000);
        // shared.systimer.delay_us(.{.time = 500_000, .unit = .Micro});
        const t1 = shared.systimer.now_v2(.Micro).time;
        // std.log.info("-------------------------------------- Iteration {d}\n", .{@as(u32, iteration_num)});
        std.log.info("SYSTIMER now: {d} µs\n", .{t1});
        // const comp = shared.systimer.readComparator(); // should be zero initially!
        // std.log.warn("Comparator value: {d} \n", .{comp});
        std.log.info("Number of interrupts: {d}\n", .{int_counter});

        // std.log.info("SYSTIMER Counter Ticks: {d}\n", .{shared.systimer.readCounter()});
        // std.log.info("SYSTIMER Comparator: 0b{b}\n", .{shared.systimer.readComparator()});
        // const since_t0 = shared.systimer.duration_v2(.{ .time = t0, .unit = .Micro });
        // std.log.info("SYSTIMER duration since t0: {d} µs\n", .{since_t0});
        // iteration_num += 1; 

        asm volatile ("wfi");
    }

}

fn pre_setup(shared_ctx: Shared, peripheral_list: []const Peripheral) void{
    for(peripheral_list) |periph|{
        switch (periph) {
            .TIMERG0 => shared_ctx.timergroup.driver.wdt_disable(),
            // .SYSTIMER => shared_ctx.systimer.setup_clock(.{.time = 500_000 * 2, .unit = .Micro}) catch |err|{
            //     std.log.err("Failed setting up clock. Got: {s}\n", .{@errorName(err)});
            //     startup.panic("Hell noooooo...", null, null);
            // },
            // .USB_JTAG => shared_ctx.usb_jtag.driver.ready_timeout(500_000, &shared_ctx.systimer) catch continue,
            .USB_JTAG => shared_ctx.usb_jtag.driver.wait_spin(),
            else => return,
        } 
    }
}

fn peripheral_setup(shared_ctx: Shared, periph: Peripheral) void{
    if (periph == .TIMERG0){
        shared_ctx.timergroup.driver.wdt_disable();
    }else if (periph == .USB_JTAG){
        shared_ctx.usb_jtag.driver.ready_timeout(500_000, &shared_ctx.systimer);
    }
}

fn run_benchmarks(shared_ctx: Shared) void {
    const systimer = shared_ctx.systimer orelse return;
    Testing.interrupt_init_test();
    std.log.info("Hello From SYSTIMER now BEFORE LOOP: {d} µs\n", .{systimer.now_v2(.Micro).time});

    const baseline_metrics = core.BenchMark.getBaselineClockCycleCount();
    std.log.info("Benchmark of Baseline Function: {d} cycle count, {d:.3}µs\n", .{baseline_metrics.raw_cc, baseline_metrics.time_us});

    const fn_performance = core.BenchMark.getFunctionClockCycleCount("Interrupt init Test", Testing.interrupt_init_test);
    std.log.info("Benchmark of '{s}': {d} cycle count, {d:.3}µs\n", .{fn_performance.benchmark_name, fn_performance.raw_cc, fn_performance.time_us});
    
    const fn1_performance = core.BenchMark.getFunctionClockCycleCount("Clic Tests",Testing.test_clic);
    std.log.info("Benchmark of '{s}': {d} cycle count, {d:.3}µs\n", .{fn1_performance.benchmark_name, fn1_performance.raw_cc, fn1_performance.time_us});
}

