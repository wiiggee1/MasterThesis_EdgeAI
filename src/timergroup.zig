const std = @import("std");
const Peripheral = @import("peripherals.zig").Peripheral;
const Register = @import("peripherals.zig").Register;


pub const TimerGroup = struct {
    const Self = @This();
    
    const TimerGroupRegister = @import("registers.zig").TimerGroupRegister;

    register: TimerGroupRegister,

    pub fn init() Self{
        // return Self{.register = AnyRegister(.TIMERG0, register_block)};
        // return Self{.register = register_block};
        // const Reg = AnyRegister(.TIMERG0, TimerGroupRegister);
        return Self{.register = TimerGroupRegister{}};
    }

    pub fn wdt_disable(self: Self) void {
        const WriteKey = 0x50d83aa1;
        Peripheral.TIMERG0.write_register(self.register.WDTWPROTECT, @as(u32, WriteKey));
        Peripheral.clear_bits(Peripheral.TIMERG0.baseAddress(), self.register.WDTCONFIG0, (1 << 31) | (1 << 14));

        const LPWDT_BASE: usize = 0x5011_6000;
        const LPWDT_WPROTECT: *volatile u32 = @ptrFromInt(LPWDT_BASE + 0x0018);
        LPWDT_WPROTECT.* = WriteKey; 

        const lpwdt_mask: u32 = (1 << 31) | (1 << 12);
        Peripheral.clear_bits(LPWDT_BASE, 0x0000, lpwdt_mask);
    }

};


