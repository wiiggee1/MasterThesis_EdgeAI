const std = @import("std");
const builtin = @import("builtin");
const CSR = @import("csr.zig").CSR;

/// Here should optimized functions be declared. 
/// Such as frequently executed code that should 
/// be as fast as possible. E.g., placing 
/// dot product function in the `iram0` memory 
/// section for improved speed.
pub const Optimized = struct{

        /// Performs element-wise addition on f32 elements using HWLP.
        pub fn add_f32_hwlp(x0: []const f32, y0: []const f32, z0: []f32, n: usize) void {
            @setFloatMode(.optimized);
            if (n == 0) return;
            var x_ptr = x0.ptr;
            var y_ptr = y0.ptr;
            var z_ptr = z0.ptr;

            // Handle odd length so the loop works on pairs
            var rem: usize = n;
            if ((rem & 1) != 0) {
            z_ptr[0] = x_ptr[0] + y_ptr[0];
                x_ptr += 1; 
                y_ptr += 1; 
                z_ptr += 1; 
                rem -= 1;
            }
            const iters: usize = rem / 2; // 2 results per iteration

            if (CSR.mhwloop_state_reg.read_csrr() & 0x3 == 0) CSR.initHwLoop();

            // mhwloop0_start_addr ← address of label L0,
            //
            // mhwloop0_end_addr ← address of last loop instruction L0_end_last,
            //
            // mhwloop0_count ← iteration count.

            asm volatile (
                \\ .option push
                \\ .option norvc
                \\  mv t0, %[iters]
                \\  la   t1, L0
                \\  la   t2, L0_end_last
                \\  csrw 0x7C6, t1       // mhwloop0_start address
                \\  csrw 0x7C7, t2       // mhwloop0_end address  (last loop instruction)
                \\  csrw 0x7C8, t0      // mhwloop0_count → loop counter
                \\ j L0
                \\
                \\L0:
                \\  flw ft0, 0(%[x])
                \\  flw ft1, 0(%[y])
                \\  fadd.s ft0, ft0, ft1
                \\  fsw ft0, 0(%[z])
                \\
                \\  flw ft2, 4(%[x])
                \\  flw ft3, 4(%[y])
                \\  fadd.s ft2, ft2, ft3
                \\  fsw ft2, 4(%[z])
                \\
                \\  addi %[x], %[x], 8
                \\  addi %[y], %[y], 8
                \\  addi %[z], %[z], 8
                \\L0_end_last:
                \\  nop
                \\  .option pop
                : 
                : [x] "r"(x_ptr), [y] "r"(y_ptr), [z] "r"(z_ptr), [iters] "r"(iters),
                : .{    
                    .x5 = true, .x6 = true, .x7 = true, 
                    .f0 = true, .f1 = true, .f2 = true, .f3 = true, 
                    .fflags = true, .memory = true 
                }
            );
        }

        /// Dot-product operation using HWLP unrolling.
        pub fn dot_hwlp_old(comptime T: type, x1: [*]const f32, x2: [*]const f32, n: usize) T {
            const iters: usize = n / 4;
            var acc: f32 = 0.0;

            asm volatile (
                \\  .option push
                \\  .option norvc
                \\  mv   t0, %[iters]
                \\  la   t1, L0
                \\  la   t2, L0_end
                \\  csrw 0x7C6, t1
                \\  csrw 0x7C7, t2
                \\  csrw 0x7C8, t0
                \\  j    L0
                \\L0:
                \\  flw  f0, 0(%[x1]);   flw  f1, 0(%[x2]);  fmadd.s %[acc], f0, f1, %[acc]
                \\  flw  f0, 4(%[x1]);   flw  f1, 4(%[x2]);  fmadd.s %[acc], f0, f1, %[acc]
                \\  flw  f0, 8(%[x1]);   flw  f1, 8(%[x2]);  fmadd.s %[acc], f0, f1, %[acc]
                \\  flw  f0, 12(%[x1]);  flw  f1, 12(%[x2]); fmadd.s %[acc], f0, f1, %[acc]
                \\  addi %[x1], %[x1], 16
                \\  addi %[x2], %[x2], 16
                \\L0_end:
                \\  nop
                \\  .option pop
                : [acc] "r"(acc)
                : [x1] "r"(x1), [x2] "r"(x2), [iters] "r"(iters)
                : .{ .x5=true,.x6=true,.x7=true, .f0=true,.f1=true, .fflags=true, .memory=true }
            );

            return acc;
        }

        pub fn add_f32_scalar(x: []const f32, y: []const f32, z: []f32) void{
            for (x, 0..) |xi, i| z[i] = xi + y[i];
        }

};
