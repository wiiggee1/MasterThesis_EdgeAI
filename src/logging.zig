const std = @import("std");

pub fn EmbeddedWriter(comptime BUFSIZE: usize) type {
    return struct {
        buf: [BUFSIZE]u8, 
        rx: []u8,
        tx: []u8,
        const Self = @This();

        pub const Writer = std.io.GenericWriter(void, EmbeddedWriterError, writefn);
        const writer: Writer = .{ .context = {} };

        pub const EmbeddedWriterError = error{
            Timeout, 
            BufferFull,
            ReceiveError,
            TransmitError,
        } || std.io.AnyWriter.Error;

        /// Here goes the logic for the embedded io `writefn`. 
        /// It can either use UART or JTAG logging. 
        fn writefn(_: void, bytes: []const u8) EmbeddedWriterError!usize{
            _ = bytes;
        }

    };
}

pub const custom_scope_options = [_]std.log.ScopeLevel{
    .{.scope = .multiple_lines, .level = .debug},
    .{.scope = .inner_scope, .level = .debug},
    .{.scope = .inner, .level = .debug},
    .{.scope = .str_part, .level = .debug},
};

/// This is a custom logging function that overrides the std.Options. 
/// Since it is meant for baremetal targets, it has to communicate 
/// over a valid peripheral such as UART or JTAG (via openocd). 
/// For interacting with C, we need to map it into a C string. 
/// E.g., by providing the pointer to the underlying array of bytes.
/// Example: 
///         ```zig
///             const path: []const u8 = "foo.txt"; // Zig explicit string data type.
///             const c_path: [*c]const u8 = @ptrCast(path); // casting to c-compatible string type.
///             const file = c.fopen(c_path, "rb"); // passing and calling c functions. 
///         ```
pub fn loggerFn(comptime level: std.log.Level, comptime scope: @TypeOf(.EnumLiteral), comptime format: []const u8, args: anytype) void{
    // std.heap.FixedBufferAllocator
    const stdout = EmbeddedWriter(1024).writer;
    // const stderr = std.io.getStdErr().writer();

    // const level_text = comptime level.asText();
    const level_string = comptime switch (level) {
        .debug => "\x1b[1;34m[debug]\x1b[0m : ",
        .warn => "\x1b[1;33m[warn]\x1b[0m : ",
        .info => "\x1b[1;37m[info]\x1b[0m : ",
        .err => "\x1b[1;31m[err]\x1b[0m : ",
    };
    const is_inner: bool = switch(scope){
        .multiple_lines, .inner_scope, .inner, .str_part, .itr_start, .itr_end => true,
        else => false, 
    };


    // const log_format = std.fmt.comptimePrint(log_color ++ "[" ++ log_tag ++ "]" ++ " (%u): {s}\x1b[0m\n", .{format});
    // const time = esp_idf.esp_log_timestamp();

    if (is_inner){
        stdout.print(format, args) catch {};
    }else {
        const scope_prefix = if (scope == .default) " " else " (" ++ @tagName(scope) ++ "): ";
        stdout.print(level_string ++ format ++ scope_prefix, args) catch {};
    }
}

