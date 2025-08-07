const std = @import("std");
const expect = std.testing.expect;
// const esp = @import("bindings.zig");
pub const esp_idf = @import("esp_idf");

pub const logging_options = struct {
    pub fn logFn(comptime message_level: std.log.Level, comptime scope: @TypeOf(.EnumLiteral), comptime format: []const u8, args: anytype) void {
        const log_color = switch (message_level) {
            .err => "\x1b[31m", // red
            .warn => "\x1b[33m", // yellow
            .info => "\x1b[32m", // green
            .debug => "",
        };

        const log_level: c_int = switch (message_level) {
            .err => esp_idf.ESP_LOG_ERROR,
            .warn => esp_idf.ESP_LOG_WARN,
            .info => esp_idf.ESP_LOG_INFO,
            .debug => esp_idf.ESP_LOG_DEBUG,
        };

        const log_tag = switch (message_level) {
            .err => "ERROR",
            .warn => "WARN",
            .info => "INFO",
            .debug => "DEBUG",
        };
        // const log_tag_text = comptime std.log.Level.asText(message_level);

        //#define LOG_FORMAT(letter, format)  LOG_COLOR_ ## letter #letter " (%" PRIu32 ") %s: " format LOG_RESET_COLOR "\n"
        const log_format = std.fmt.comptimePrint(log_color ++ "[" ++ log_tag ++ "]" ++ " (%u): {s}\x1b[0m\n", .{format});
        const time = esp_idf.esp_log_timestamp();

        // pub extern "c" fn printf(format: [*:0]const u8, ...) c_int;
        esp_idf.esp_log_write(log_level, @tagName(scope), log_format, time, args);
    }
};

/// Measure the time performance it takes to execute a function.
/// Varadic arguments (`...`) take variable number of arguments, which are passed as a tuple.
/// args is treated as a tuple `.{}` syntax.
/// `func: anytype` - allow any function.
/// `args: anytype` - makes it generic over any argument type.
pub fn time_measure(func: anytype, args: anytype) void {
    // esp_timer_get_time would return number of microseconds since the init of ESP Timer.
    const start = esp_idf.esp_timer_get_time();
    func(args);
    const end = esp_idf.esp_timer_get_time();

    const diff: i64 = end - start;
    std.log.info("Function took: {d} time units\n", .{diff});
}

/// Generic type for executing delay actions.
pub fn Delay(comptime T: type) type {
    return struct {
        duration: T,
        // Related methods below:

        pub fn init(val: T) @This() {
            return .{ .duration = val };
        }

        pub fn ms(self: *const Delay(T)) !void {
            const time_duration = ms_to_tick(self.duration);
            esp_idf.vTaskDelay(time_duration);
        }
    };
}

pub inline fn ms_to_tick(xTimeInMs: anytype) esp_idf.TickType_t {
    const conf_tickrate_hz = esp_idf.configTICK_RATE_HZ;
    const num = @as(esp_idf.TickType_t, xTimeInMs) * conf_tickrate_hz;
    const denom = @as(esp_idf.TickType_t, xTimeInMs);
    return @divExact(num, denom);
}
//
// test "checking pdMS_TO_TICKS " {
//     const conf_tickrate_hz = esp.configTICK_RATE_HZ;
//     const test_numerator = @as(esp.TickType_t, 500) * conf_tickrate_hz;
//     const test_denominator = @as(esp.TickType_t, 1000);
//     const div_exact = @divExact(test_numerator, test_denominator);
//     // const div = std.zig.c_translation.MacroArithmetic.div(test_numerator, test_denominator);
//     const pdms_to_tick = esp.pdMS_TO_TICKS(@as(c_uint, 500));
//     std.debug.print("div_exact: {any}, pdMS_TO_TICKS: {any}", .{ div_exact, pdms_to_tick });
// }
