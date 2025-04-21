const std = @import("std");
const builtin = @import("builtin");
const utils = @import("esp_idf_utils");
const esp_idf = utils.esp_idf;
const model = @import("nn_model");
const NNModel = model.NNModel;
const Layer = model.Layer; 
const Matrix = model.Matrix; 

pub const std_options = std.Options{
    // .log_level = std.log.Level.info,
    .logFn = utils.logging_options.logFn,
};

/// This is the main entry point for the embedded firmware to run.
export fn app_main() callconv(.C) void {
    //Run embedded firmware below:
    const matrix = Matrix(f16, 10, 10);
    std.log.info("Matrix type: {}", .{@TypeOf(matrix)}); 
    const delay_val = utils.ms_to_tick(500);
    while (true) {
        try utils.Delay(esp_idf.TickType_t).init(delay_val).ms();
        std.log.info("Hi from info log ", .{});
        std.log.warn("Hi from warn log", .{});
        // utils.time_measure(std.log.info, .{ "time measrue test123: {}", 42 });
    }
}

/// Init function for initializing board specific stuff for baremetal.
/// The startup is split into three dedicated stages:
/// 1. Port initialization of hardware and runtime environment.
/// 2. System initialization of software service,
/// 3. Running the main task and calling `app_main`.
export fn app_startup() void {
    // Application entry point - `call_start_cpu0`.
    // - Setup interrupt handlers.
    // - Initialize internal memory (.data & .bss).
    // - Configuring the MMU cache.
    // - Enable PSRAM if configured.
    // - Set the CPU clocks to the frequencies configured for the project.
    // - If app is configured to run on multiple cors, start the other core and wait for it to initialize as well. By calling `call_start_cpu1`.

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
    // const LEDC_CH0_CONFO_REG: *volatile u32 = @ptrFromInt(0x00D0);

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
