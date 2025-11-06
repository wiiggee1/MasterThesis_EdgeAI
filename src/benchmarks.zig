const std = @import("std");
const CSR = @import("csr.zig").CSR;
const model = @import("model/model.zig");
const MemoryStack = @import("memory.zig").MemoryStack;
const SystemTimer = @import("system_timer.zig").SystemTimer;
const Optimized = @import("optimized_utils.zig").Optimized;
const MatmulFn = model.MatmulFn;

/// Benchmark utilities.
pub const BenchMark = struct {
    const FREQ_HZ: u64 = 16_000_000; // 16 MHz XTAL clk

    pub const Tests = struct {
        pub const inference_test = @import("benchmarks/inference_benchmark.zig");
        pub const memory_test = @import("benchmarks/memory_benchmark.zig");

        pub fn matmul_test() void{
            // @setFloatMode(.optimized);
            const Matrix = model.Matrix;
            const matrix_d = [2][3]f16{
                .{ 5, 1, 2 },
                .{ 2, 2, 1 },
            };

            const matrix_c = [3][2]f16{
                .{ 1, 4 },
                .{ 2, 3 },
                .{ 3, 2 },
            };

            const TestMatrixC = Matrix(f16, 3, 2, .owned).create(matrix_c);
            const TestMatrixD = Matrix(f16, 2, 3, .owned).create(matrix_d);
            // "[info] :"
            std.log.info("Test Matrix C: {any}\r\n\t  Test Matrix D: {any}\n", .{ TestMatrixC.mat, TestMatrixD.mat });
            
            
            const start_mcycle = Cpu.read_mcycle();
            const start_minstret = Cpu.read_minstret();

            // @call(.auto, callback, .{});
            // callback();
            const dot_cd = TestMatrixC.matmul(TestMatrixD);

            const mcycle_delta: u64 = Cpu.read_mcycle() - start_mcycle;
            const minstret_delta: u64 = Cpu.read_minstret() - start_minstret;

            std.log.info("MatMul Result: {any}\n", .{ dot_cd.mat });

            const result = Cpu{
                .delta_mcycle = mcycle_delta,
                .delta_minstret = minstret_delta,
            };
            result.log_result("MatMul");
        }

        pub fn transpose_test() void{
            const Matrix = model.Matrix;
            const matrix_d = [2][3]f16{
                .{ 5, 1, 2 },
                .{ 2, 2, 1 },
            };

            var TestMatrixD = Matrix(f16, 2, 3, .owned).create(matrix_d);
            
            const start_mcycle = Cpu.read_mcycle();
            const start_minstret = Cpu.read_minstret();

            // **Transpose of Matrix test case**
            const transpose_d = TestMatrixD.transpose();

            const mcycle_delta: u64 = Cpu.read_mcycle() - start_mcycle;
            const minstret_delta: u64 = Cpu.read_minstret() - start_minstret;

            std.log.info("Transposing the matrix: {any}\r\n\t  Yields: {any}\n", .{TestMatrixD.mat, transpose_d.mat });
            
            const result = Cpu{
                .delta_mcycle = mcycle_delta,
                .delta_minstret = minstret_delta,
            };
            result.log_result("Transpose Matrix");
        }

        pub fn hwlp_add_f32_test() void{

            const N: usize = 400; // adjust to your cache/I-mem
            var x: [N]f32 = undefined;
            var y: [N]f32 = undefined;
            var z: [N]f32 = undefined;

            for (0..N) |i| {
                x[i] = @floatFromInt(i);
                y[i] = 1.0;
            }

            // Scalar time
            const start_mcycle = Cpu.read_mcycle();
            const start_minstret = Cpu.read_minstret();
            Optimized.add_f32_scalar(&x, &y, &z); // no hwlp
            const mcycle_delta: u64 = Cpu.read_mcycle() - start_mcycle;
            const minstret_delta: u64 = Cpu.read_minstret() - start_minstret;
            
            // HWLP time
            const start_mcycle_hwlp = Cpu.read_mcycle();
            const start_minstret_hwlp = Cpu.read_minstret();
            Optimized.add_f32_hwlp(&x, &y, &z, N);
            const mcycle_delta_hwlp: u64 = Cpu.read_mcycle() - start_mcycle_hwlp;
            const minstret_delta_hwlp: u64 = Cpu.read_minstret() - start_minstret_hwlp;

            std.log.info("Scalar time: Δmcyle: {d}, Δminstret: {d}\n", .{mcycle_delta, minstret_delta});
            std.log.info("HWLP time: Δmcyle: {d}, Δminstret: {d}\n", .{mcycle_delta_hwlp, minstret_delta_hwlp});
        }


        pub const InputMatrix = model.Matrix(f32, 25, 1, .owned);
        pub const InputMatrixView = model.Matrix(f32, 25, 1, .view);
        pub const OutputMatrix = model.Matrix(f32, 25, 1, .owned);

        pub const AveragePerformance = struct{
            avg_cpu: struct{
                mcycle: f32, 
                minstret: f32,
                delta_time: f64,
                pps: f32, 
                ipc: f32,
            },
            avg_mem: struct{
                used: f32,
                free: f32,
                utilization: f32,
            },
        };


        /// During run inference benchmark, we want to limit the amount of scope allocated
        /// stuff to obtain a more accurent benchmark for the memory utilization report. 
        pub fn run_inference(
            comptime Context: type,
            x: *const InputMatrixView, 
            parsed_model: *Context,
            comptime num_iter: usize, 
            systimer: *SystemTimer,
            comptime matmul_mode: MatmulFn,
        ) struct{
            cpu: Cpu, 
            stack: MemoryStack.UtilizationResult, 
            performance: ?AveragePerformance,
            y: OutputMatrix,
        }
        {
            // const start_utilization = MemoryStack.getStackUtilization();

            //WARN: - Don’t divide the raw counter before differencing, measure elapsed ticks first 
            // after that convert into delta. 

            if (matmul_mode == .hwlp and (CSR.mhwloop_state_reg.read_csrr() & 0x3 == 0)) CSR.initHwLoop();

            if (num_iter == 0 or num_iter == 1){
                const start_mcycle = Cpu.read_mcycle();
                const start_minstret = Cpu.read_minstret();
                const t0 = systimer.now_v2(.Ticks);

                // shared.nn.model.predict(&X, .On)
                const Y = parsed_model.predict(x, .On, matmul_mode);
                const dt: u64 = systimer.elapsed_v2(t0.time, .Ticks);

                const mcycle_delta: u64 = Cpu.read_mcycle() - start_mcycle;
                const minstret_delta: u64 = Cpu.read_minstret() - start_minstret;

                const stack_utilization = MemoryStack.getStackUtilization();
                
                const cpu_result = Cpu{
                    .delta_mcycle = mcycle_delta,
                    .delta_minstret = minstret_delta,
                    .delta_time = dt,
                };

                return .{
                    .cpu = cpu_result,
                    .stack = stack_utilization,
                    .performance = null,
                    .y = Y,
                };

            }else{
                var y_predicts: OutputMatrix = undefined;

                var cpu_copy = Cpu{
                    .delta_mcycle = 0,
                    .delta_minstret = 0,
                    .delta_time = 0,
                };

                var stack_util_copy = MemoryStack.UtilizationResult{
                    .used = 0,
                    .free = 0,
                    .len = MemoryStack.stack_length(),
                };

                var cpu_acc = Cpu{
                    .delta_mcycle = 0,
                    .delta_minstret = 0,
                    .delta_time = 0,
                };
                
                var mem_acc = MemoryStack.UtilizationResult{
                    .used = 0,
                    .free = 0,
                    .len = MemoryStack.stack_length(),
                }; 

                for(0..num_iter) |_|{
                    // MemoryStack.resetWatermark(0);

                    const start_mcycle = Cpu.read_mcycle();
                    const start_minstret = Cpu.read_minstret();

                    const t0 = systimer.now_v2(.Ticks);
                    const Y = parsed_model.predict(x, .On, matmul_mode);
                    const stack_utilization = MemoryStack.getStackUtilization();
                    const dt: u64 = systimer.elapsed_v2(t0.time, .Ticks);

                    const mcycle_delta: u64 = Cpu.read_mcycle() - start_mcycle;
                    const minstret_delta: u64 = Cpu.read_minstret() - start_minstret;

                    // const stack_utilization = MemoryStack.getStackUtilization();
                    
                    const cpu_result = Cpu{
                        .delta_mcycle = mcycle_delta,
                        .delta_minstret = minstret_delta,
                        .delta_time = dt,
                    };

                    y_predicts = Y; 
                    stack_util_copy = stack_utilization;
                    cpu_copy = cpu_result;
                    
                    cpu_acc.delta_mcycle += cpu_result.delta_mcycle;
                    cpu_acc.delta_minstret += cpu_result.delta_minstret;
                    cpu_acc.delta_time += dt; // cpu_acc.delta_time → total_ticks += dt

                    mem_acc.used += stack_utilization.used;
                    mem_acc.free += stack_utilization.free;
                }

                const avg_mcycle = @as(f32, @floatFromInt(cpu_acc.delta_mcycle)) / @as(f32, @floatFromInt(num_iter));
                const avg_minstret = @as(f32, @floatFromInt(cpu_acc.delta_minstret)) / @as(f32, @floatFromInt(num_iter));

                const avg_used = @as(f32, @floatFromInt(mem_acc.used)) / @as(f32, @floatFromInt(num_iter));
                const avg_free = @as(f32, @floatFromInt(mem_acc.free)) / @as(f32, @floatFromInt(num_iter));
                const stack_size: f32 = @as(f32, @floatFromInt(MemoryStack.stack_length()));

                // const average_time_us: f32 = time_cpu_acc / @as(f32, @floatFromInt(num_iter));
                const avg_ticks = cpu_acc.delta_time / @as(u64, @intCast(num_iter)); // where total_ticks = cpu_acc.delta_time → accumulated delta time.
                const avg_pps: f32 = @as(f32, @floatFromInt(num_iter)) * cpu_acc.pps(systimer); // num_iter * (1 / T)
                const avg_ipc: f32 = @as(f32, @floatFromInt(cpu_acc.delta_minstret)) / @as(f32, @floatFromInt(cpu_acc.delta_mcycle));
                
                return .{
                    .cpu = cpu_copy,
                    .stack = stack_util_copy,
                    .y = y_predicts,
                    .performance = .{
                        .avg_cpu = .{
                            .mcycle = avg_mcycle, 
                            .minstret = avg_minstret,
                            // .delta_time = average_time_us,
                            .delta_time = systimer.intoTime(avg_ticks, .Micro),
                            .pps = avg_pps,
                            .ipc = avg_ipc,
                        },
                        .avg_mem = .{
                            .used = avg_used,
                            .free = avg_free,
                            .utilization = avg_used / stack_size,
                        },
                    },
                };
            }
        }

        pub fn inference_warmup(comptime Context: type, x: *const InputMatrixView, parsed_model: *Context) void{
            const Y = parsed_model.predict(x, .On, MatmulFn.base);
            _ = Y;
        }
    };

    pub const Metric = struct{
        benchmark_name: []const u8,
        raw_cc: u64,
        time_sec: f64, 
        time_us: f64, 
    };

    /// Represent CPU related measurements and associated
    /// key-metrics for these. 
    pub const Cpu = struct {
        /// Δmcyle - time passed.
        delta_mcycle: u64,
        /// Δminstret (delta of retired instructions) - work done.
        delta_minstret: u64,
        /// ΔT (fixed wall-clock time elapsed) as ticks.
        delta_time: u64,

        // pub inline fn into_time(self: Cpu, cpu_hz: u64) f32{
        //     // Δmcyle - time passed.
        //     const mcycle_float: f32 = @floatFromInt(self.delta_mcycle);
        //     // const time_us: f32 = mcycle_float * 1_000_000.0 / @as(f32, @floatFromInt(cpu_hz));
        //     const time_us: f32 = mcycle_float * 1_000_000.0 / @as(f32, @floatFromInt(cpu_hz));
        //     return time_us;
        // }

        /// Returns the Δt - time passed [unit].
        pub inline fn time_conversion(self: Cpu, systimer: *SystemTimer, unit: SystemTimer.TimeUnit) f64{
            return systimer.intoTime(self.delta_time, unit);
        }


        /// Return the `Predictions per seconds` (PPS). 
        pub inline fn pps(self: Cpu, systimer: *SystemTimer) f32 {
            // const T: f32 = self.delta_time / 1e6;
            const T: f64 = systimer.intoTime(self.delta_time, .Sec);
            const PPS: f32 = @as(f32, @floatCast(1.0 / T));
            return PPS;
        }

        pub fn log_result(self: Cpu, comptime test_name: []const u8) void{
            const metrics_fmt = 
                "   Δmcyle = {d}\r\n\t   Δminstret = {d}\r\n\t   IPC (Δminstret / Δmcyle) = {d:.3}\r\n\t   ΔTime = {d:.3}µs\n";

            const result_fmt: []const u8 = "---"++test_name++"---\r\n\t"++metrics_fmt;
        
            // const mcycle_float: f32 = @floatFromInt(self.delta_mcycle);
            // const time_us: f32 = mcycle_float * 1_000_000.0 / @as(f32, FREQ_HZ);
            // const time_us: f32 = time_sec * 1_000_000.0;

            std.log.warn(result_fmt, .{
                self.delta_mcycle,
                self.delta_minstret,
                self.ipc_f32(),
                self.into_time(),
            });
        }

        /// Floating point representation of IPC (Instructions Per Cycle) = Δminstret / Δmcyle.
        pub fn ipc_f32(self: Cpu) f32{
            if(self.delta_mcycle == 0) return 0.0;

            const minstret_float: f32 = @floatFromInt(self.delta_minstret);
            const mcycle_float: f32 = @floatFromInt(self.delta_mcycle);
            return minstret_float / mcycle_float;
            
            // const avg_ipc: f32 = @as(f32, @floatFromInt(cpu_acc.delta_minstret)) / @as(f32, @floatFromInt(cpu_acc.delta_mcycle));
        }

        /// IPC (Instructions Per Cycle) = Δminstret / Δmcyle.
        pub fn ipc_scaled(self: Cpu) u64{
            // const mcycle_f32: f32 = @floatFromInt(self.delta_mcycle);
            // const minstret_f32: f32 = @floatFromInt(self.delta_minstret);
            // return minstret_f32 / mcycle_f32; 
            const scaled: u64 = (self.delta_minstret << 16) / self.delta_mcycle;
            // const scaled: u64 = self.delta_minstret / self.delta_mcycle;
            // const ipc_no_float: u32 = @intCast(@min(scaled, @as(u64, std.math.maxInt(u32))));
            const ipc_no_float: u64 = @intCast(@min(scaled, @as(u64, std.math.maxInt(u64))));
            return ipc_no_float;
        }

        pub inline fn read_mcycle() u64 {
            // const mcycle_raw: u64 = @as(u64, CSR.mcycleh.read_csrr()) << 32 | @as(u32, CSR.mcycle.read_csrr());

            // By making sure the two higher bit match, we 
            // get consistent value. In case of the lower 
            // bit wrapps between reads. The `mcycle` and 
            // `minstret` read is via two 32-bit CSRs.
            while(true){
                const mcycleh = CSR.mcycleh.read_csrr();
                const mcycle = CSR.mcycle.read_csrr();
                const mcyclehigh = CSR.mcycleh.read_csrr();
                if(mcycleh == mcyclehigh) return (@as(u64, mcyclehigh) << 32) | mcycle;
            }
            // return mcycle_raw; 
        }
        
        pub inline fn read_minstret() u64 {
            // const minstret_raw: u64 = @as(u64, CSR.minstreth.read_csrr()) << 32 | @as(u32, CSR.minstret.read_csrr());

            while(true){
                const minstreth = CSR.minstreth.read_csrr();
                const minstret = CSR.minstret.read_csrr();
                const minstreth2 = CSR.minstreth.read_csrr();
                if(minstreth == minstreth2) return (@as(u64, minstreth2) << 32) | minstret;
            }
            // return minstret_raw; 
        }

        pub fn calculate_delta(callback: fn () void) Cpu{
            const start_mcycle = read_mcycle();
            const start_minstret = read_minstret();

            // std.meta.ArgsTuple(comptime Function: type)
            // @call(.auto, callback, .{});
            callback();

            const mcycle_delta: u64 = read_mcycle() - start_mcycle;
            const minstret_delta: u64 = read_minstret() - start_minstret;
            return Cpu{
                .delta_mcycle = mcycle_delta,
                .delta_minstret = minstret_delta,
            };
        }

        pub fn idle_time(self: Cpu) f32{
            _ = self; 
            return 0.0; 
        }
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

    //FIX: - Remove any f64 (double precision floats)! 
    
   
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
