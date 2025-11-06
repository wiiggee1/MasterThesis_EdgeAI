const std = @import("std");
const linker_sections = @import("startup.zig").linker_sections; 

pub const MemoryStack = struct {

    var last_limit: usize = 0;

    inline fn stackAddrs() struct { lo: usize, hi: usize } {
        const a = @intFromPtr(&linker_sections._stack_top);
        const b = @intFromPtr(&linker_sections._stack_bottom);
        return .{ .lo = @min(a, b), .hi = @max(a, b) };
    }

    inline fn stackTop() usize {
        return @intFromPtr(&linker_sections._stack_top);
    }
    
    inline fn stackBottom() usize {
        return @intFromPtr(&linker_sections._stack_bottom);
    }

    pub inline fn stack_length() usize {
        const stack = stackAddrs();
        return stack.hi - stack.lo; // higher addr = stack bottom, lower addr = stack top
    }

    fn stack_region() struct{ptr: [*]volatile u8, len: usize}{
        const stack = stackAddrs();
        return .{
            .ptr = @ptrFromInt(stack.lo),
            .len = stack_length(),
        };
    }

    inline fn read_sp() usize {
        return asm volatile (
        \\ addi %[ret], sp, 0
        : [ret] "=r" (-> usize));
    }

    pub fn watermark_fill() void{
        // @frameAddress();
        const stack = stackAddrs();
        const sp = read_sp();

        if (!(sp > stack.lo and sp <= stack.hi)) return;

        const GUARD: usize = 256; // leave a bit of headroom under SP
        const end = if (sp > GUARD) sp - GUARD else sp;
        if (end <= stack.lo) return;

        var stack_ptr: [*]u8 = @ptrFromInt(stack.lo);
        @memset(@constCast(stack_ptr[0..stack.len]), 0xA5);
    }

    pub fn resetWatermark(guard: usize) void{
        const s  = stackAddrs();
        const sp = read_sp();

        // Sanity: SP must be inside [lo, hi].
        if (!(sp > s.lo and sp <= s.hi)) {
            return;
        }

        // Leave a small red zone under SP to avoid painting the current frame.
        const GUARD: usize = guard; // tune as needed
        const end = if (sp > GUARD) sp - GUARD else sp;

        if (end <= s.lo) {
            // Nothing safe to paint.
            last_limit = s.lo;
            return;
        }

        const len = end - s.lo;
        var p: [*]u8 = @ptrFromInt(s.lo);
        // Paint only the free window [lo, end).
        @memset(p[0..len], 0xA5);

        // Record the window limit for later readback.
        last_limit = end;
    }

    /// Returns the number of bytes used by checking the depth of the watermarked 
    /// filled values. 
    pub fn stackUsage() usize{
        const stack = stackAddrs();
        const stack_ptr: [*]volatile u8 = @ptrFromInt(stack.lo);
        const stack_len = stack.hi - stack.lo;

        // Walk from bottom upwards until the first painted byte (0xA5) reappears.
        var i: usize = 0;
        while (i < stack_len and stack_ptr[i] == 0xA5) : (i += 1) {}
        
        // Used up stack in bytes: used = total - i, where i = number of painted bytes with 0xA5.
        return stack_len - i;
    }

    pub const UtilizationResult = struct {
        used: usize,
        free: usize,
        len: usize,
    };

    pub fn getStackUtilization() UtilizationResult{
        const stack_len = stack_length();
        const bytes_used = stackUsage();
        const free_bytes = stack_len - bytes_used;

        return .{
            .used = bytes_used,
            .free = free_bytes,
            .len = stack_len,
        };
    }

};
