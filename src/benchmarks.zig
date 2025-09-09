const std = @import("std");
const CSR = @import("csr.zig").CSR;
const inference_benchmark = @import("benchmarks/inference_benchmark.zig");
const memory_benchmark = @import("benchmarks/memory_benchmark.zig");

/// Benchmark utilities.
pub const BenchMark = struct {
    const FREQ_HZ: u64 = 16_000_000; // 16 MHz XTAL clk

    pub const Metric = struct{
        benchmark_name: []const u8,
        raw_cc: u64,
        time_sec: f64, 
        time_us: f64, 
    };

    /// Should save benchmark attempts into a csv-like buffer.
    /// CSV header/columns: 
    /// - benchmark_name: []const u8, 
    /// - raw_cycle_count: u64,
    /// - time_sec: f64,
    /// - time_us: f64, 
    /// - memory_footprint: u32, 
    pub const BenchMarkRun = struct {
        // buf: [BUF_SIZE]

        pub fn intoCSV(benchmark_record: Metric, save_buf: []u8) void {
            _ = benchmark_record;
            _ = save_buf;
        }
    };
        
    pub fn dumpBenchmark() void{}

    fn baseline_fn() void{}
    
   
    //TODO: - Fix this for getting ISR handler baseline performance.
    pub fn getBaselineISR() Metric{
        CSR.mcountinhibit.clear_csrc(0x1);
        CSR.mcycle.write_csrw(0x0); // set the mcycle to zero.
        baseline_fn();
        const mcycle_raw: u32 = CSR.mcycle.read_csrr();
        const mcycle_f64: f64 = @floatFromInt(mcycle_raw);

        const time_sec: f64 = mcycle_f64 / @as(f64, FREQ_HZ);
        const time_us: f64 = time_sec * 1_000_000.0;
        return Metric{.benchmark_name = "isr_baseline", .raw_cc = mcycle_raw, .time_sec = time_sec, .time_us = time_us};
    }

    pub fn getBaselineClockCycleCount() Metric{
        CSR.mcountinhibit.clear_csrc(0x1);
        CSR.mcycle.write_csrw(0x0); // set the mcycle to zero.
        baseline_fn();
        const mcycle_raw: u32 = CSR.mcycle.read_csrr();
        const mcycle_f64: f64 = @floatFromInt(mcycle_raw);

        const time_sec: f64 = mcycle_f64 / @as(f64, FREQ_HZ);
        const time_us: f64 = time_sec * 1_000_000.0;
        return Metric{.benchmark_name = "empty_fn_baseline", .raw_cc = mcycle_raw, .time_sec = time_sec, .time_us = time_us};
    }

    pub fn getCtxFunctionClockCycleCount(comptime fn_name: []const u8, comptime ContextType: type, ctx: *ContextType, callback: fn (*ContextType) void) Metric{
        CSR.mcountinhibit.clear_csrc(0x1);
        CSR.mcycle.write_csrw(0x0); // set the mcycle to zero.
        callback(ctx);
        const mcycle_raw: u32 = CSR.mcycle.read_csrr();
        const mcycle_f64: f64 = @floatFromInt(mcycle_raw);
        
        const time_sec: f64 = mcycle_f64 / @as(f64, FREQ_HZ);
        const time_us: f64 = time_sec * 1_000_000.0;
        return Metric{.benchmark_name = fn_name, .raw_cc = mcycle_raw, .time_sec = time_sec, .time_us = time_us};
    }

    pub fn getFunctionClockCycleCount(comptime fn_name: []const u8, callback: fn () void) Metric{
        CSR.mcountinhibit.clear_csrc(0x1);
        CSR.mcycle.write_csrw(0x0); // set the mcycle to zero.
        callback();
        const mcycle_raw: u32 = CSR.mcycle.read_csrr();
        const mcycle_f64: f64 = @floatFromInt(mcycle_raw);

        const time_sec: f64 = mcycle_f64 / @as(f64, FREQ_HZ);
        const time_us: f64 = time_sec * 1_000_000.0;
        return Metric{.benchmark_name = fn_name, .raw_cc = mcycle_raw, .time_sec = time_sec, .time_us = time_us};
    }
};
