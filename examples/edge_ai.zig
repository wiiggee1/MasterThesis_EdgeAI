const std = @import("std");
const builtin = @import("builtin");
const core = @import("core");
const startup = core.startup;
const Testing = core.Testing;
const Hardware = core.Hardware;
const hal = core.DriversImpl;
const Model = core.Model;
const MemoryStack = core.MemoryStack;
const runtime_config = @import("runtime_config");

pub const std_options = core.std_options; // Custom logging over usb-jtag.

const Peripheral = Hardware.Peripheral;
const ISR = Hardware.ISR;
const INTERRUPT = Hardware.INTERRUPT;
const TrapVector = Hardware.TrapVector;
const CSR = Hardware.CSR;

const Scheduler = core.Scheduler;

extern var _mtvt_table: [48]TrapVector; // extern var _mtvt_table: [48]TrapVector;
extern fn _vector_table() callconv(.naked) noreturn;

comptime {
    startup.getStartupSymbols();
}

// ======================RUN-CONFIG
const XTAL_CLK_FREQ: u64 = 40_000_000; // 40 MHz.
const FREQ_HZ: u64 = 16_000_000; // Average clock frequency: 16 MHz XTAL clk

// const INFERENCE_RATE_US: u64 = 1_450; 
// const RUNTIME: u64 = 5_000;
// const WARMUP_N = 5;
// const NUM_ITER: usize = 10;
// const AVERAGE_BENCHMARK: bool = true;
// const MISSRATE_BENCHMARK: bool = true;

const RuntimeConfig = struct {
    const INFERENCE_RATE_US: u64 = runtime_config.@"inference-rate-us"; 
    const RUNTIME: u64 = runtime_config.@"runtime-duration";
    const WARMUP_N = runtime_config.@"num-warmups";
    const NUM_ITER: usize = runtime_config.@"num-iterations";
    const AVERAGE_BENCHMARK: bool = runtime_config.@"average-benchmark";
    const MISSRATE_BENCHMARK: bool = runtime_config.@"missrate-benchmark";
    const MATMUL_MODE: core.Model.MatmulFn = .base;
};

// const INFERENCE_RATE_US: u64 = runtime_config.@"inference-rate-us"; 
// const RUNTIME: u64 = runtime_config.@"runtime-duration";
// const WARMUP_N = runtime_config.@"num-warmups";
// const NUM_ITER: usize = runtime_config.@"num-iterations";
// const AVERAGE_BENCHMARK: bool = runtime_config.@"average-benchmark";
// const MISSRATE_BENCHMARK: bool = runtime_config.@"missrate-benchmark";
// const MATMUL_MODE: core.Model.MatmulFn = .base;

const BATCH: usize = 1;
const TIMEWINDOW: usize = 25; 
const INPUT_FEATURES: usize = 1;
const NUM_LAYERS: usize = 4;
// ======================

// ======================DATA-BUFFERS
const OwnedMatrix = Model.Matrix(f32, TIMEWINDOW, INPUT_FEATURES, .owned);
const BufferedMatrix = Model.Matrix(f32, TIMEWINDOW, INPUT_FEATURES, .view);

var input_buf: [TIMEWINDOW][INPUT_FEATURES]f32 
    align(64) linksection(".ram.inference") = undefined;
// ======================


const InferenceContext = struct {
    x: *const BufferedMatrix, // Model.Matrix(f32, TIMEWINDOW, INPUT_FEATURES, .view)
};

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
        // .path = "assets/model.bin",
        .path = runtime_config.@"model-size",
    }),
};

var shared: Shared = undefined;
var int_counter: u32 = 0; 
var scheduler: Scheduler = .init();

/// Below is the override logic of the .weak `isr1_handler` symbol.
pub export fn isr1_handler() linksection(".iram0.isr_handler") callconv(INTERRUPT) void {
    // int_counter +=1;

    shared.systimer.clear_interrupt();
    _ = Scheduler.tick_pending.swap(1, .seq_cst);
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

    // const data_rowmajor = [TIMEWINDOW][INPUT_FEATURES]f32{
    input_buf = [TIMEWINDOW][INPUT_FEATURES]f32{
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

    // input_buf = data_rowmajor;

    const X = BufferedMatrix.fromBuffer(&input_buf); // OwnedMatrix.create(input_buf);
    // const model_size = @sizeOf(@TypeOf(shared.nn.model));

    // Alt. pass `Interrupt.Config` directly as argument to .init
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

    shared.systimer.setup_clock(.{.time = @as(u64, RuntimeConfig.INFERENCE_RATE_US), .unit = .Micro}) catch |err|{
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

    std.log.warn("Main stack frame Address: 0x{x}\n", .{main_frame});
    show_runtime_config();
    
    for (0..RuntimeConfig.WARMUP_N) |_|{
        core.BenchMark.Tests.inference_warmup(@TypeOf(shared.nn.model), &X, &shared.nn.model);
    }

    if (RuntimeConfig.AVERAGE_BENCHMARK){
        average_benchmark(&X, &shared);

    }

    var inference_ctx = InferenceContext{.x = &X};
    const now_initial = shared.systimer.now_v2(.Micro).time;

    // Starts the next tick, repeated every 2 ms.
    const task_inference = scheduler.add_task(inference_task, @ptrCast(&inference_ctx), now_initial + RuntimeConfig.INFERENCE_RATE_US, RuntimeConfig.INFERENCE_RATE_US);

    const run_start = shared.systimer.now_v2(.Micro).time;
    while (true) {
        asm volatile ("wfi");

        // Toggles a wake-up flag by the timer ISR 
        if (core.Scheduler.tick_pending.swap(0, .seq_cst) == 1){
            const now_us = shared.systimer.now_v2(.Micro).time;
            scheduler.dispatch(now_us);

            // Stop after running for RUNTIME (µs)
            const elapsed_us = now_us - run_start;
            // if (elapsed_us >= RUNTIME * 1_000) break;
            if (elapsed_us >= RuntimeConfig.RUNTIME) break;
        }
    }

    shared.systimer.enable_interrupt(false);

    if (RuntimeConfig.MISSRATE_BENCHMARK){
        if (scheduler.tasks[task_inference.?]) |t| {
            const run_end_us = shared.systimer.now_v2(.Micro).time;
            const elapsed_us = run_end_us - run_start;
            const expected_releases: u64 = if (t.period_us == 0) 0 else elapsed_us / t.period_us;

            // “miss rate” convenient for result section:
            const miss_rate: f32 = if (expected_releases == 0) 0
                else @as(f32, @floatFromInt(t.missed_deadlines)) /
                     @as(f32, @floatFromInt(expected_releases));

            std.log.info(
                "---Scheduler Missrate Benchmark--- \r\n\t\tperiod = {d}µs\r\n\t\telapsed = {d}µs \r\n\t\texpected releases = {d}\r\n\t\tmissed deadlines = {d}\r\n\t\tmiss-rate = {d:.6}%\n", .{ 
                    t.period_us, 
                    elapsed_us, 
                    expected_releases, 
                    t.missed_deadlines,
                    miss_rate * 100.0,
            });

        }
    }

    // core.BenchMark.Tests.hwlp_add_f32_test();

}

fn pre_setup(shared_ctx: Shared, peripheral_list: []const Peripheral) void{
    for(peripheral_list) |periph|{
        switch (periph) {
            .TIMERG0 => shared_ctx.timergroup.driver.wdt_disable(),
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


fn inference_task(ctx_ptr: *anyopaque) void{
    const ctx: *InferenceContext = @ptrCast(@alignCast(ctx_ptr));
    const result = core.BenchMark.Tests.run_inference(
        @TypeOf(shared.nn.model), 
        ctx.x, &shared.nn.model, 
        1, 
        &shared.systimer,
        RuntimeConfig.MATMUL_MODE,
    );
    _ = result;
    // std.log.info("Inference delta time: {d:.3}\n", .{result.cpu.time_conversion(&shared.systimer, .Micro)});
}

fn show_runtime_config() void{

    const model_size = @sizeOf(@TypeOf(shared.nn.model));
    const model_kb: f32 = @as(f32, @floatFromInt(model_size)) / @as(f32, 1024);
    const optimizer_mode = builtin.mode;
    const cpu_model_name = builtin.cpu.model.name;
    const cpu_arch = builtin.cpu.arch;
    const model_size_config = runtime_config.@"model-size";

    std.log.warn("---Applied Runtime Config--- \r\n\t\tInference Rate: {d:.3}µs\r\n\t\tRuntime Duration: {d:.0}µs\r\n\t\tNumber of Warmups: {}\r\n\t\tNumber of Iterations: {}\r\n\t\tAverage Benchmark: {}\r\n\t\tScheduler Missrate Benchmark: {}\r\n\t\tLoaded Model Size: {d:.6} KiB\r\n\t\tModel Size Demo: {s}\r\n\t\tOptimization Mode: {}\r\n\t\tCPU Model: {s}\r\n\t\tCPU Arch: {s}\n", .{
        runtime_config.@"inference-rate-us",
        runtime_config.@"runtime-duration",
        runtime_config.@"num-warmups",
        runtime_config.@"num-iterations",
        runtime_config.@"average-benchmark",
        runtime_config.@"missrate-benchmark",
        model_kb,
        model_size_config,
        optimizer_mode,
        cpu_model_name,
        @tagName(cpu_arch),
    });
}


fn print_general_info(shared_ctx: *Shared, interrupt: *core.Hardware.Interrupt) void{
    std.log.warn("&systimer_target0_isr: {*}\r\n\t mtvt[{d}] = {*}\r\n\t_mtvt_table: {*}\n", .{
        &isr1_handler, 
        interrupt.config.mtvt_index, 
        shared_ctx.clic.mtvt[interrupt.config.mtvt_index],
        shared_ctx.clic.mtvt,
    });
    
    // std.log.warn("Loaded Model addresses:\r\n\tModel Graph Address: 0x{x} → (L2MEM - RAM)\r\n\tModel Blob Address: 0x{x} → (FLASH Memory)\n", .{
    //     model_graph_addr,
    //     model_blob_addr,
    // });

}

fn average_benchmark(X_INPUT: *const BufferedMatrix, shared_ctx: *Shared) void{
    const inference_result = core.BenchMark.Tests.run_inference(
        @TypeOf(shared_ctx.nn.model), 
        X_INPUT, // &X
        &shared_ctx.nn.model, 
        RuntimeConfig.NUM_ITER, 
        &shared_ctx.systimer,
        RuntimeConfig.MATMUL_MODE,
    );
    
    // std.log.warn("---Inference Benchmark Performance (iter = {d})---\n", .{RuntimeConfig.NUM_ITER});

    if(inference_result.performance) |inference_performance| {
        std.log.info("---Average Inference Benchmark--- \r\n\t\tΔTime = {d:.3}µs\r\n\t\tΔmcyle = {d:.0}\r\n\t\tΔminstret = {d:.0}\r\n\t\tIPC (Δminstret / Δmcyle) = {d:.3}\r\n\t\tPPS = {d:.3} predicts/sec\n", .{
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

    // std.log.info("\tInference - Prediction (Window) Output: {any}\n", .{inference_result.y.mat});
    const preds = BufferedMatrix.fromBuffer(&inference_result.y.mat);
    shared.nn.model.eval_summary(X_INPUT, &preds);
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

