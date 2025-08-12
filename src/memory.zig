const std = @import("std");
const linker_sections = @import("startup.zig").linker_sections; 

pub const MemoryStack = struct {
    
    inline fn stackTop() usize {
        return @intFromPtr(&linker_sections._stack_top);
    }
    
    inline fn stackBottom() usize {
        return @intFromPtr(&linker_sections._stack_bottom);
    }

    pub fn getApproxStackPointer() usize {
        // return asm volatile ("mv a0, sp" : [ret] "={a0}" (-> usize));
        var sp_approx: u8 = 0; 
        return @intFromPtr(&sp_approx);
    }
};
