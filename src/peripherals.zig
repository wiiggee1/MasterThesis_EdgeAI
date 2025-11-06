const std = @import("std");
const builtin = @import("builtin");
const system_timer = @import("system_timer.zig");
const general_purpose = @import("gpio.zig");
const registers = @import("registers.zig");

// const Interrupt = @import("interrupts.zig").Interrupt;
const ISR = @import("startup.zig").ISR;
const TrapVector = @import("startup.zig").TrapVector;

pub fn DriverApi(comptime P: Peripheral, comptime D: type) type{
    const API = comptime switch (P) {
        .USB_JTAG => Peripheral.Api(.USB_JTAG),
        .UART0 => Peripheral.Api(.UART0),
        .GPIO => Peripheral.Api(.GPIO),
        .SYSTIMER => Peripheral.Api(.SYSTIMER),
        .SYSREG => Peripheral.Api(.SYSREG),
        .INTERRUPT_MATRIX => Peripheral.Api(.INTERRUPT_MATRIX),
        .TIMERG0 => Peripheral.Api(.TIMERG0),
        .CLIC => Peripheral.Api(.CLIC),
        .RSTCLK => Peripheral.Api(.RSTCLK),
    };
    _ = API;

    return struct {
        const Self = @This();
        pub const peripheral = P;
        /// Represent a concrete peripheral driver type. 
        /// For example `SystemTimer` type. 
        driver: D,

        // pub fn into(comptime self: *Self, comptime T: type) *T{
        //     const periph: *T = @alignCast(@fieldParentPtr("self", self.peripheral));
        //     return periph;
        // }
        
        pub fn new(settings: anytype) Self{
            const driver_api = Peripheral.Driver.create(P, settings);
            const driver_init = switch (P) {
                .USB_JTAG => driver_api.USB_JTAG.driver,
                .UART0 => driver_api.UART0.driver,
                .GPIO => driver_api.GPIO.driver,
                .SYSTIMER => driver_api.SYSTIMER.driver,
                .SYSREG => driver_api.SYSREG.driver,
                .INTERRUPT_MATRIX => driver_api.INTERRUPT_MATRIX.driver,
                .TIMERG0 => driver_api.TIMERG0.driver,
                .CLIC => driver_api.CLIC.driver,
                .RSTCLK => driver_api.RSTCLK.driver,
            };

            return Self{
                .driver = driver_init,
            };

        }

    };
}



/// Memory mapped registers, for modifying and accessing.
/// The tagged enum is associated with the base address 
/// of the specific peripheral. To access each register 
/// we take the offset from the base address. 
/// Further, read/write operations require us to dereference
/// a volatile pointer. 
pub const Peripheral = enum(u32) {
    const Self = @This();

    USB_JTAG = 0x500D_2000,
    UART0 = 0x500C_A000,
    GPIO = 0x500E_0000,
    SYSTIMER = 0x500E_2000,
    SYSREG = 0x500E_5000,
    INTERRUPT_MATRIX = 0x500D_6000,
    TIMERG0 = 0x500C_2000,
    CLIC = 0x2080_0000,
    RSTCLK = 0x500E_6000,

    const SystemTimerConfig = @import("system_timer.zig").SystemTimerConfig;
    const InterruptConfig = @import("interrupts.zig").InterruptConfig;
    const UsbJtagRegister = @import("registers.zig").UsbJtagRegister;
    const UartRegister = @import("registers.zig").UartRegister;
    const GpioRegister = @import("registers.zig").GpioRegister;
    const SysRegister = @import("registers.zig").SysRegister;
    const ResetClockRegister = @import("registers.zig").ResetClockRegister;

    pub const Driver = union(Peripheral){
        USB_JTAG:           DriverApi(.USB_JTAG, @import("usb_jtag.zig").UsbJtag),
        UART0:              DriverApi(.UART0, @import("registers.zig").UartRegister),
        GPIO:               DriverApi(.GPIO, @import("registers.zig").GpioRegister) ,
        SYSTIMER:           DriverApi(.SYSTIMER, @import("system_timer.zig").SystemTimer),
        SYSREG:             DriverApi(.SYSREG, @import("registers.zig").SysRegister),
        INTERRUPT_MATRIX:   DriverApi(.INTERRUPT_MATRIX, @import("interrupts.zig").Interrupt),
        TIMERG0:            DriverApi(.TIMERG0, @import("timergroup.zig").TimerGroup),
        CLIC:               DriverApi(.CLIC, @import("interrupts.zig").Clic),
        RSTCLK:             DriverApi(.RSTCLK, @import("registers.zig").ResetClockRegister),

        pub fn create(peripheral: Peripheral, settings: anytype) Driver{
            return switch (peripheral) {
                .USB_JTAG => Driver{
                    .USB_JTAG = .{.driver = .init()}
                },
                .UART0 => Driver{
                    .UART0 = .{.driver = UartRegister{}}
                },
                .GPIO => Driver{
                    .GPIO = .{.driver = GpioRegister{}}
                },
                .SYSTIMER => Driver{
                    // .SYSTIMER = .{.driver = .init(SystemTimerConfig.parse_v2(settings))}
                    .SYSTIMER = .{.driver = .init(settings)}
                },
                .SYSREG => Driver{
                    .SYSREG = .{.driver = SysRegister{}}
                },
                .INTERRUPT_MATRIX => Driver{
                    .INTERRUPT_MATRIX = .{.driver = .init(InterruptConfig.parse_v2(settings)) }
                },
                .TIMERG0 => Driver{
                    .TIMERG0 = .{.driver = .init()}
                },
                .CLIC => Driver{
                    .CLIC = .{.driver = .init(settings)}
                },
                .RSTCLK => Driver{
                    .RSTCLK = .{.driver = ResetClockRegister{}}
                },
            };
        }
    };

    pub fn fromStr(comptime name: []const u8) ?Self{
        return std.meta.stringToEnum(Peripheral, name);
    }

    pub fn intoAddress(comptime self: Self) u32{
        return @intFromEnum(self);
    }

    pub fn fromAddress(comptime addr: u32) Self{
        return @enumFromInt(addr);
    }
    
    pub fn TagName(comptime self: Self) [:0]const u8{
        return comptime switch (self) {
            .USB_JTAG => "USB_JTAG",
            .UART0 => "UART0",
            .GPIO => "GPIO",
            .SYSTIMER => "SYSTIMER",
            .SYSREG => "SYSREG",
            .INTERRUPT_MATRIX => "INTERRUPT_MATRIX",
            .TIMERG0 => "TIMERG0",
            .CLIC => "CLIC",
        };
    }

    pub fn driverAPI(comptime self: Self, comptime api: anytype, settings: anytype) DriverApi(self, @TypeOf(api)){
        if (@TypeOf(api) != Driver) @compileError("Argument of 'api' needs to be of type: "++@typeName(Driver));
        const driver: Driver = Driver.create(self, settings);
         
        const driver_init = switch (driver) {
            .USB_JTAG => |usb_jtag| usb_jtag.new(settings),
            .UART0 => |uart| uart.new(settings),
            .GPIO => |gpio| gpio{},
            .SYSTIMER => |systimer| systimer.new(@as(SystemTimerConfig, settings)),
            .SYSREG => |sysreg| sysreg.new(settings),
            .INTERRUPT_MATRIX => |interrupt| interrupt.new(@as(InterruptConfig, settings)),
            .TIMERG0 => |timergroup| timergroup.new(settings),
            .CLIC => |clic| clic.new(@as(*[48]TrapVector, settings)),
        };
        return driver_init;
    }
    
    pub fn ApiNew(comptime self: Self, settings: anytype) DriverApi(self, Api(self)){
        const driver_api = Driver.create(self, settings);
        const driver_names = comptime std.meta.fieldNames(Driver);
        inline for(driver_names) |name|{
            const driver = @field(driver_api, name);
            
            if(std.mem.eql(u8, @tagName(driver), @tagName(self))){
                // return driver;
                return DriverApi(self, @TypeOf(driver)).new(settings);
            }
        }
        
        switch(driver_api){
            inline else => |api, tag|{
               if (tag == self){
                    return api;
                }
            }
        }
    }
    
    pub fn Api(comptime self: Self) type{
        const api = comptime api_type:{
            switch (self) {
                .USB_JTAG => break :api_type @import("usb_jtag.zig").UsbJtag,
                .UART0 => break :api_type UartRegister,
                .GPIO => break :api_type GpioRegister,
                .SYSTIMER => break :api_type @import("system_timer.zig").SystemTimer,
                .SYSREG => break :api_type SysRegister,
                .INTERRUPT_MATRIX => break :api_type @import("interrupts.zig").Interrupt,
                .TIMERG0 => break :api_type @import("timergroup.zig").TimerGroup,
                .CLIC => break :api_type @import("interrupts.zig").Clic,
                .RSTCLK  => break : api_type @import("registers.zig").ResetClockRegister,
            }
        };

        return api;
    }

    pub fn register_ptr(self: Self, offset: usize) *volatile u32 {
        return @ptrFromInt(self.baseAddress() + @as(usize, offset));
    }

    pub inline fn baseAddress(self: Self) usize{
        const addr_u32 = @intFromEnum(self);
        const base: usize = @intCast(addr_u32);
        return base; 
    }

    /// Return true if `bit_index` is 1. 
    pub inline fn isBitSet(self: Self, offset: u32, bit_index: u6) bool {
        const mask: u32 = @as(u32, 1) << bit_index;
        return (self.read_register(offset) & mask) != 0; 
    }
    
    /// Set one bit
    pub inline fn setBit(self: Self, offset: u32, bit_index: u6) void {
        const bit_pos: std.math.Log2Int(u32) = @intCast(bit_index);
        const mask: u32 = @as(u32, 1) << bit_pos;
        const addr_ptr = self.register_ptr(offset);

        addr_ptr.* = addr_ptr.* | mask;
    }
    
    /// Clear one bit
    pub inline fn clearBit(self: Self, offset: u32, bit_index: u6) void {
        const bit_pos: std.math.Log2Int(u32) = @intCast(bit_index);
        const mask: u32 = @as(u32, 1) << bit_pos;
        const addr_ptr = self.register_ptr(offset);

        addr_ptr.* = addr_ptr.* & ~mask;
    }

    /// Set all 1-bits in `mask`
    pub inline fn setMask(self: Self, offset: u32, mask: u32) void {
        const addr_ptr = self.register_ptr(offset);
        addr_ptr.* = addr_ptr.* | mask;
    }
    
    /// Clear all 1-bits in `mask`
    pub inline fn clearMask(self: Self, offset: u32, mask: u32) void {
        const addr_ptr = self.register_ptr(offset);
        addr_ptr.* = addr_ptr.* & ~mask;
    }

    /// Clears specific bits in a volatile register.
    ///
    /// `base` → base address of peripheral  
    /// `offset` → offset of register from base  
    /// `mask` → bit mask to clear (1's at positions you want to clear)
    pub inline fn clear_bits(base: usize, offset: u32, mask: u32) void {
        const reg: *volatile u32 = @ptrFromInt(base + offset);
        reg.* &= ~mask; // AND with inverted mask to clear bits
    }

    // ===============================================================
    // Below are APIs for setting a specific register (BASE + OFFSET):
    // ==============================================================
    
    pub inline fn read_register(self: Self, offset: u32) u32 {
        const register: *volatile u32 = @ptrFromInt(self.baseAddress() + offset);
        return register.*;  
    }

    /// The offset is the same as the target register within a peripheral's 
    /// base address.
    pub inline fn write_register(self: Self, offset: u32, value: u32) void {
        const register: *volatile u32 = @ptrFromInt(self.baseAddress() + offset);
        register.* = value;
    }

};
