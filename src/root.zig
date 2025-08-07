pub const model = @import("model/model.zig");
pub const startup = @import("startup.zig");
pub const interrupts = @import("interrupts.zig");
pub const logging = @import("logging.zig");
pub const gpio = @import("gpio.zig");
pub const loggerFn = logging.loggerFn;

pub fn read_register(base_addr: usize, bit_offset: usize) u32 {
    const register: *volatile u32 = @ptrFromInt(base_addr + bit_offset);
    return register.*;  
}

pub fn write_register(base_addr: usize, offset: usize, value: u8) void {
    const register: *volatile u32 = @ptrFromInt(base_addr + offset);
    register.* = value;
}

pub fn set_register(base_addr: usize, N: u8) void {
    const register: *volatile u32 = @ptrFromInt(base_addr);
    register.* |= (1 << N); // Set bit N.
}

pub fn clear_register(base_addr: usize, N: u8) void {
    const register: *volatile u32 = @ptrFromInt(base_addr);
    // If N = 2 then this is: register = register AND 0x1111_1101
    register.* &= ~(1 << N); // Clear bit N
}

