const std = @import("std");
const expect = std.testing.expect;
// const esp = @import("bindings.zig");
pub const esp_idf = @import("esp_idf");

pub const util_options = struct {
    log_fmt: std.fmt,
};

// pub const embed_options: std.Options = .{
//     .logFn = @call(
//         .auto,
//         esp_idf.esp_log_write,
//         .{ esp_idf.esp_log_level_get("INFO"), "MAIN", util_options },
//     ),
// };

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
