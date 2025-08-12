const std = @import("std");
const builtin = @import("builtin");
const core = @import("core");
const startup = core.startup;
const ISR = startup.ISR; 
const INTERRUPT = startup.INTERRUPT;

comptime {
    startup.getStartupSymbols();
}

pub const std_options = std.Options{
    // .log_level = std.log.Level.info,
    .logFn = core.loggerFn,
};

/// Testing some .rodata 
pub const dummy_str_rodata = "hello_rodata!";
pub const dummy_rodata: [4]u8 linksection(".rodata") = .{ 1, 2, 3, 4 };

extern fn ets_printf(fmt: [*:0]const u8, ...) callconv(.C) void;
extern fn ets_install_uart_printf() callconv(.C) void;
extern fn ets_install_usb_printf() callconv(.C) void;
extern fn ets_delay_us(us: u32) callconv(.C) void;
extern fn rtc_get_reset_reason() callconv(.C) u32;
extern fn Uart_Init() callconv(.C) void;
extern fn software_reset() callconv(.C) noreturn;

extern var _mtvt_table: [48]ISR;

export fn systimer_target0_isr() callconv(INTERRUPT) noreturn {
    // Below is the override logic of the .weak isr symbol.
    // This is our trap handler and should not return. 
    var dummy_state: struct{a: usize, b: usize} = undefined;
    dummy_state.a = 0x1;
    dummy_state.b = 0x2;
    // @breakpoint();
    asm volatile ("mret" ::: "memory");
    while (true) {}
    // @trap();

}
// export fn my_custom_isr_handler() callconv(.C) void {
// }

/// This is the main entry point for the embedded firmware to run.
/// Which is jumped to whenever the reset handler `.text.entry`
/// section is finished. It can be summarized as: 
/// -----------------------------------------------------------
/// 1. The entry point of the program is called by the reset handler.
/// 2. The reset handler, would setup the following: 
///     - Initialize and load the stack pointer.
///     - Initialize and load the `.data` section from flash + fill `.bss` with default values. 
///     - Load Interrupt Vector Tables + defines weak linked default ISR handles. 
/// 3. After step(2) is completed it jumps to the main() function (our application code).
/// -----------------------------------------------------------
export fn app_main() callconv(.C) void {
    //Run embedded firmware below:
    const rodata = dummy_str_rodata;  
    _ = &rodata; 
    const dummy_input_rowmajor = [3][2]f16{
        .{ 1.0, 4.0 },
        .{ 2.0, 5.0 },
        .{ 3.0, 6.0 }, 
    };
    _ = dummy_input_rowmajor; 

    ets_install_usb_printf();
    ets_printf("Hi from ROMMMMMMMMMM\r\n");

    const abc: usize = 0; 
    _ = &abc; 

    while (true) {
        ets_delay_us(500_000);
        ets_printf("...\r\n");
        // asm volatile ("wfi");
    }

}


/// Init function for initializing board specific stuff for baremetal.
/// The startup is split into three dedicated stages:
/// and after RAM has been initialized. It should be a never ending 
/// function that ends with an infinite loop.
export fn app_startup() void {
    // export fn _start() linksection(".text.entry") callconv(.naked) noreturn {

}

fn gpio_setup() void {
    const GPIO_BASE: *volatile u32 = @ptrFromInt(0x123);
    GPIO_BASE.* |= @as(u32, 0x10);
}

fn timer_setup() void {
    // LEDC_APB_CLK_SEL[1:0]
    // Enable SYSTEM_LEDC_CLK_EN in SYSTEM_PERIP_CLK_EN0_REG (0x0018).
    const SYSTEM_PERIP_CLK_ENO_REG: *volatile u32 = @ptrFromInt(0x0018);
    const LEDC_CONF_REG: *volatile u32 = @ptrFromInt(0x00D0);

    LEDC_CONF_REG.* |= @as(u32, 0x01);
    SYSTEM_PERIP_CLK_ENO_REG.* |= @as(u32, (1 << 11));

    // LED PWM Boundary Address (Low address + High address):
    // 0x6001_9000 (LOW Address) and 0x6001_9FFF (HIGH Address)
}

/// LED PWM Controller (LEDC) blinky test.
fn blinky() void {
    // 1. Timer configuration, specifying PWM signal's frequency and duty cycle.
    // 2. Channel configuration, associate with the timer(1) and GPIO to output PWM signal.
    // 3. Change PWM signal that drives the output to change LED's intensity.
    timer_setup();
    // Toggle bit, e.g., `register = register ^ (1 << 3)`.
}
