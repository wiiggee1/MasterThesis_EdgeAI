const std = @import("std");
const builtin = @import("builtin");
const core = @import("core");
const startup = core.startup;
const Testing = core.Testing;
const Hardware = core.Hardware;
const hal = core.DriversImpl;
const Model = core.Model;
const MemoryStack = core.MemoryStack;

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

const BATCH: usize = 1;
const TIMEWINDOW: usize = 25; 
const INPUT_FEATURES: usize = 1;
const NUM_LAYERS: usize = 4;

// const ModelBuilder = Model.Builder(f32, "assets/model.bin", .RowSampleOrdering);
const InputOutputMatrix = Model.Matrix(f32, TIMEWINDOW, INPUT_FEATURES);

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
    };

    systimer: SystemTimer,
    clic: Clic,
    timergroup: DriverApi(.TIMERG0, hal.TimerGroup),
    usb_jtag: DriverApi(.USB_JTAG, hal.UsbJtag),
    nn: Model.LoadedModel(f32, .{
        .batch = BATCH,
        .timewindow = TIMEWINDOW,
        .layer_count = NUM_LAYERS,
        .convention = .RowSampleOrdering,
        .path = "assets/model.bin",
    }),
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
    const main_frame = @frameAddress();

    //Run embedded firmware below:
    const Interrupt = Hardware.Interrupt; 
    const TimerCfg = Shared.SysTimeCfg;

    shared = .{
        // .systimer = system_timer.driver,
        .systimer = .init(TimerCfg),
        .clic = .init(&_mtvt_table),
        .timergroup = .new(.{}),
        .usb_jtag = .new(.{}),
        .nn = .init(),
    };

    pre_setup(shared, &.{
        Peripheral.TIMERG0,
        Peripheral.USB_JTAG,
    });

    const data_rowmajor = [TIMEWINDOW][INPUT_FEATURES]f32{
        [_]f32 {-0.4876859188},
        [_]f32 {-0.3020118475},
        [_]f32 {0.7061636448},
        [_]f32 {0.4359272718},
        [_]f32 {-0.0697299242},
        [_]f32 {-0.5836150646},
        [_]f32 {-0.2674875259},
        [_]f32 {0.2294212580},
        [_]f32 {-0.8611040115},
        [_]f32 {-0.3987681866},
        [_]f32 {0.6154536009},
        [_]f32 {0.9459179640},
        [_]f32 {0.3141608238},
        [_]f32 {-0.7647800446},
        [_]f32 {0.9386945963},
        [_]f32 {0.4245246649},
        [_]f32 {-0.2712689638},
        [_]f32 {0.8509542942},
        [_]f32 {0.2871456146},
        [_]f32 {0.3422226906},
        [_]f32 {0.5088747740},
        [_]f32 {0.8308023214},
        [_]f32 {0.2569303513},
        [_]f32 {0.7799508572},
        [_]f32 {-0.1205641031},
    };

    const X = Model.Matrix(f32, TIMEWINDOW, INPUT_FEATURES).create(data_rowmajor);

    // const ModelBuilder = Model.Builder(
    //     f32, 
    //     "assets/model.bin",
    //     .RowSampleOrdering,
    // );

    // ModelBuilder.LoadedModel(comptime Batches: usize, comptime Timewindow: usize, comptime NumLayers: usize)

    // var model = shared.nn;
    // var model = ModelBuilder.loaded_model;

    // const model_graph_addr = @intFromPtr(&model);
    // const model_blob_addr = @intFromPtr(&model.loader.model_bin);
    const model_size = @sizeOf(@TypeOf(shared.nn.model));
    
    // const inference_result = core.BenchMark.Tests.run_inference(@TypeOf(model), &X, &model);

    // const systimer_interrupt_v2: Interrupt = Interrupt.init(Interrupt.Config{
    const systimer_interrupt: Interrupt = Interrupt.init(.{
        .trigger_mode = Hardware.TriggerMode.level,
        .id = @as(u5, 1), // 0..31, id = 1 → _mtvt_table[17]
        .mtvt_index = @as(u6, 0), 
        .isr = @as(ISR, isr1_handler),
        .priority = @as(?u3, null),
        .level = @as(u3, 1),
        .source = Hardware.PeripheralInterruptSources.SYSTIMER_TARGET0_INTR_SOURCE, 
        .threshold = @as(?u4, null),
    });

    shared.systimer.setup_clock(.{.time = @as(u64, 500_000 * 4), .unit = .Micro}) catch |err|{
        std.log.err("Failed setting up clock. Got: {s}\n", .{@errorName(err)});
        startup.panic("Hell noooooo...", null, null);
    };
    
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
    
    // Non-Quantized(f32) model size:
    // Params: 3.410156 KiB, Buffers: 0.000000 KiB, Total: 3.410156 KiB
    const model_kb: f32 = @as(f32, @floatFromInt(model_size)) / @as(f32, 1024);

    std.log.warn("Main stack frame Address: 0x{x}\n", .{main_frame});
    std.log.warn("Loaded Model Size: {d:.6} KiB\n", .{model_kb});

    // const inference_result = core.BenchMark.Tests.run_inference(@TypeOf(shared.nn.model), &X, &shared.nn.model);
    const NUM_ITER: usize = 10;
    const inference_result = core.BenchMark.Tests.run_inference(@TypeOf(shared.nn.model), &X, &shared.nn.model, NUM_ITER, &shared.systimer);
    
    // IPC (Instructions Per Cycle) = Δminstret / Δmcyle.
    // const cpu_test = core.BenchMark.Cpu.calculate_delta(core.BenchMark.Tests.inference_test.dummy_test);
    // cpu_test.log_result("CPU Dummy Test");

    // core.BenchMark.Tests.matmul_test();
    // core.BenchMark.Tests.transpose_test();
    // core.BenchMark.Tests.inference_performance(&X);


    // std.log.warn("Loaded Model addresses:\r\n\tModel Graph Address: 0x{x} → (L2MEM - RAM)\r\n\tModel Blob Address: 0x{x} → (FLASH Memory)\n", .{
    //     model_graph_addr,
    //     model_blob_addr,
    // });

    
    std.log.warn("---Inference Benchmark Performance (iter = {d})---\n", .{NUM_ITER});

    // if(NUM_ITER > 1){
    if(inference_result.performance) |inference_performance| {
        std.log.info("Average Inference Result - CPU: \r\n\t\tΔTime = {d:.3}µs\r\n\t\tΔmcyle = {d:.0}\r\n\t\tΔminstret = {d:.0}\r\n\t\tIPC (Δminstret / Δmcyle) = {d:.3}\r\n\t\tPPS = {d:.3} predicts/sec\n", .{
            inference_performance.avg_cpu.delta_time,
            inference_performance.avg_cpu.mcycle,
            inference_performance.avg_cpu.minstret,
            inference_performance.avg_cpu.ipc,
            inference_performance.avg_cpu.pps,
        });

        std.log.info("Average Inference - Stack report:\r\n\t\tUsed = {d}\r\n\t\tfree bytes = {d}\r\n\t\tmem utilization = {d:.3} = {d:.3}%\n", .{ 
            inference_performance.avg_mem.used, 
            inference_performance.avg_mem.free, 
            inference_performance.avg_mem.utilization, 
            100 * (inference_performance.avg_mem.utilization), 
        });
    }else{
        std.log.info("Inference - CPU: \r\n\t\tΔTime = {d:.3}µs\r\n\t\tΔmcyle = {d}\r\n\t\tΔminstret = {d}\r\n\t\tIPC (Δminstret / Δmcyle) = {d:.3}  \n", .{
            inference_result.cpu.time_conversion(&shared.systimer, .Micro),
            inference_result.cpu.delta_mcycle,
            inference_result.cpu.delta_minstret,
            inference_result.cpu.ipc_f32(),
        });

        std.log.info("Inference - Stack report: Used = {d} / {d} bytes ({d} free bytes)\n", .{ 
            inference_result.stack.used, 
            inference_result.stack.len, 
            inference_result.stack.free, 
        });
    }

    std.log.info("\tInference - Prediction (Window) Output: {any}\n", .{inference_result.y.mat});
    
    shared.nn.model.eval_summary(&X, &inference_result.y);


    // const Y = model.predict(&X);
    // std.log.warn("Prediction (Window): {any}\n", .{Y.mat});
    // model.eval_summary(&X, &Y);

    // const stack_utilization = MemoryStack.getStackUtilization();
    // std.log.info("Stack report (Inference): Used = {d} / {d} bytes ({d} free bytes)\n", .{ 
    //     stack_utilization.used, 
    //     stack_utilization.len, 
    //     stack_utilization.free, 
    // });


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

// pub fn full_measure(comptime LoadedModel: type, x: *const InputOutputMatrix, parsed_model: *LoadedModel, shared_ctx: Shared) void{
//     _ = Model;
//     const t0_cycles = core.BenchMark.Cpu.read_mcycle(); 
//     const t0_us = shared_ctx.systimer.now_v2(.Micro).time;
//
// }


