const std = @import("std");
const model = @import("model/model.zig");
pub const startup = @import("startup.zig");
const interrupts = @import("interrupts.zig");
const logging = @import("logging.zig");
const peripheral = @import("peripherals.zig");

const system_timer = @import("system_timer.zig");
const usb_jtag = @import("usb_jtag.zig");
const timergroup = @import("timergroup.zig");
const gpio = @import("gpio.zig");
const csr = @import("csr.zig");

pub const Testing = @import("testing.zig");
pub const BenchMark = @import("benchmarks.zig").BenchMark;

pub const Hardware = struct {
    pub const Clic = interrupts.Clic;
    pub const Interrupt = interrupts.Interrupt;
    pub const InterruptConfig = interrupts.InterruptConfig;
    pub const PeripheralInterruptSources = interrupts.PeripheralInterruptSources;
    pub const TriggerMode = interrupts.TriggerMode;
    pub const InterruptControllerMode = interrupts.InterruptControllerMode;

    pub const ISR = startup.ISR;
    pub const INTERRUPT = startup.INTERRUPT;
    pub const TrapVector = startup.TrapVector;
    pub const CSR = csr.CSR;

    pub const Peripheral = peripheral.Peripheral;
    pub const DriverApi = peripheral.DriverApi;
};

pub const DriversImpl = struct {
    pub const SystemTimerConfig = system_timer.SystemTimerConfig;
    pub const SystemTimer = system_timer.SystemTimer;
    pub const UsbJtag = usb_jtag.UsbJtag;
    pub const TimerGroup = timergroup.TimerGroup;
    pub const GpioCore = struct {
        pub const Gpio = gpio.Gpio;
        pub const Mode = gpio.Mode;
        pub const PeripheralAddress = gpio.PeripheralAddress;
        pub const Pin = gpio.Pin;
    };
};


pub const std_options: std.Options = .{
    .logFn = logging.loggerFn,
};


pub const exit_trap = startup._exit_trap;

pub const Rom = struct {
    pub extern fn ets_printf(fmt: [*:0]const u8, ...) callconv(.C) void;
    pub extern fn ets_install_uart_printf() callconv(.C) void;
    pub extern fn ets_install_usb_printf() callconv(.C) void;
    pub extern fn ets_delay_us(us: u32) callconv(.C) void;
    pub extern fn rtc_get_reset_reason() callconv(.C) u32;
    pub extern fn Uart_Init() callconv(.C) void;
    pub extern fn software_reset() callconv(.C) noreturn;
};

pub fn delay_us(micro_sec: u32) void {
    Rom.ets_delay_us(micro_sec);
}


pub fn wfe() void {
    asm volatile ("csrs 0x810, 0x1");
    asm volatile ("wfi");
    asm volatile ("csrs 0x810, 0x1");
}



