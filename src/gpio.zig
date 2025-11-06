const std = @import("std");
const Peripheral = @import("peripherals.zig").Peripheral;

pub const Gpio = struct {
    const Self = @This();
    const GpioRegister = @import("registers.zig").GpioRegister;

    register: GpioRegister,

    /// Should setup depending on the Pin(type).
    pub fn init(self: Self) void {
        switch (self.base_addr) {}
    }

    pub fn setIO(self: Self, pin: PinNumber, mode: Mode, level: Level) void{
        const offset = self.register.ioMuxRegOffset(pin.into());
        // var reg = Peripheral.GPIO.read_register(offset);
        _ = offset;
        _ = level;
        switch (mode) {
            .input =>{
                // Peripheral.GPIO.setBit(offset, )
            },
            .output =>{

            },
        } 
    }
};

/// Represent the Pin Mode for the given GPIO peripheral.
pub const Mode = enum {
    input,
    output,
};

pub const Level = enum(u1){
    low = 0,
    high = 1,
};

pub const PinNumber = enum(u8){
    pin0 = 0,
    pin1 = 1,
    pin2 = 2,

    pub fn into(self: PinNumber) u8{
        return @intFromEnum(self);
    }
};

pub const Event = enum(u3) {
    RisingEdge = 1,
    FallingEdge = 2,
    Any = 3,
    LevelLow = 4,
    LevelHigh = 5,
};


