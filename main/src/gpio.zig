const std = @import("std");
const esp_idf = @import("esp_idf");

pub fn Gpio(comptime T: type, comptime address: PeripheralAddress) type {
    return struct {
        base_addr: address,
        /// Sets the generic pin type depending on mode `T`.
        pin: Pin(T),

        const Self = @This();

        /// Should setup depending on the Pin(type).
        pub fn init(self: Self) void {
            //

            switch (self.base_addr) {}
        }
    };
}

/// This represent the address mapping for peripherals.
/// The address mapping is defined by the "Boundary Address",
/// which includes the range between the Low address to High Address.
/// 4KB = 1024 x 4 = 4096 bytes (2^10 = 1024).
pub const PeripheralAddress = enum(u32) {
    spi0 = 0x6000_3000,
    gpio = 0x6000_4000,
    ledc = 0x6001_9000,
};

/// Represent the Pin Mode for the given GPIO peripheral.
pub const Mode = enum {
    input,
    output,
};

pub fn Pin(comptime pin_type: Mode) type {
    return struct {
        mode: pin_type,
    };
}

test "generic gpio and pin test" {
    const gpio_base: u32 = @intFromEnum(PeripheralAddress.gpio);
    _ = gpio_base;
    var gpio = Gpio(Mode.output, PeripheralAddress.gpio);
    _ = gpio.init();
}
