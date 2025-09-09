const std = @import("std");
const Peripheral = @import("peripherals.zig").Peripheral;
const AnyRegister = @import("registers.zig").AnyRegister;
const GenericPeripheral = @import("peripherals.zig").GenericPeripheral;
const DriverApi = @import("peripherals.zig").DriverApi;

pub fn EmbeddedWriter(comptime TXSIZE: usize, comptime RXSIZE: usize) type {
    return struct {
        const Self = @This();
        pub const tx_size = TXSIZE; 
        pub const rx_size = RXSIZE;
        // pub var log_buffer: [TXSIZE + 100]u8 = undefined;

        const UsbJtag = @import("usb_jtag.zig").UsbJtag;
        
        // pub const Writer = std.io.GenericWriter(void, EmbeddedWriterError, writeTxFn); // depricated!!!
        // pub const writer = std.Io.Writer.Discarding.init(&log_buffer).writer;

        // discarding: std.Io.Writer.Discarding,
        interface: std.Io.Writer,
        // peripheral: DriverApi(.USB_JTAG, UsbJtag),
        peripheral: UsbJtag,

        pub fn new(buf: []u8) Self{
            return Self{
                .interface = .{
                    // .buffer = &.{},
                    .buffer = buf,
                    .vtable = &.{
                        .drain = drain,
                        .sendFile = std.Io.Writer.unimplementedSendFile,
                    }
                },
                .peripheral = .init(),
            };
        }
        
        pub const EmbeddedWriterError = error{
            Timeout, 
            BufferFull,
            ReceiveError,
            TransmitError,
        } || std.Io.Writer.Error || std.Io.Writer.FileAllError;

        fn drain(writer: *std.Io.Writer, data: []const []const u8, splat: usize) std.Io.Writer.Error!usize{
            _ = splat;
            const self: *Self = @alignCast(@fieldParentPtr("interface", writer));
            // var temp_buf: [128]u8 = undefined;
            // const embedded_writer = EmbeddedWriter(32, 32).new(&temp_buf);

            // if (data.len == 0) return 1;
            if (data.len == 0) return 0;
            var total_bytes: usize = 0; 
            for (data) |bytes| {
                // self.peripheral.driver.write_slice(bytes);
                // total_bytes +=  try self.write_tx(bytes);
                total_bytes += try self.write_tx(bytes);
                // total_bytes += try embedded_writer.write_tx(bytes);
            }
            return total_bytes;
            // return self.write_tx(data[0]) catch return std.Io.Writer.Error.WriteFailed;
        }

        /// Here goes the logic for the embedded io writer. 
        /// This function's main purpose is to write to the 
        /// transmit buffer (tx) of the Usb Jtag peripheral. 
        fn write_tx(self: Self, bytes: []const u8) std.Io.Writer.Error!usize{
            // const usb_jtag = self.peripheral; 
            self.peripheral.write_slice(bytes); // Don't forget to flush the tx buffer.
            // usb_jtag.flush_tx(); 
            return bytes.len;
        }

        // pub fn print(self: *Self, comptime fmt: []const u8, args: anytype) EmbeddedWriterError!void{
        pub fn print(self: *std.Io.Writer.fixed, comptime fmt: []const u8, args: anytype) EmbeddedWriterError!void{
            // comptime var literal: []const u8 = "";
            var temp_buf: [128]u8 = undefined;
            const bytes = std.fmt.bufPrint(&temp_buf, fmt, args) catch return;

            var interface = &self.interface.print;
            interface.writeAll(bytes) catch return;
            // interface.print(fmt, args) catch return;
            interface.flush() catch return;
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
    var log_buffer: [1024]u8 = undefined;
    var embedded_writer = EmbeddedWriter(32, 32).new(&log_buffer);
     
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

    if (is_inner){
        // try stdout.writeAll();
        // stdout.print(format, args) catch {};
        // embedded_writer.print(format, args) catch {};
        const bytes = std.fmt.bufPrint(format, args) catch return;
        embedded_writer.peripheral.write_slice(bytes); // Don't forget to flush the tx buffer.
    }else {
        // stdout.print(level_string ++ format ++ scope_prefix++"\r", args) catch {};
        const scope_prefix = if (scope == .default) " " else " (" ++ @tagName(scope) ++ "): ";
        // embedded_writer.print(level_string ++ format ++ scope_prefix++"\r", args) catch {};
        const bytes = std.fmt.bufPrint(&log_buffer, level_string ++ format ++ scope_prefix++"\r", args) catch return;
        embedded_writer.peripheral.write_slice(bytes); // Don't forget to flush the tx buffer.

    }
}

