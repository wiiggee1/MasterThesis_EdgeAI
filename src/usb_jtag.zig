const std = @import("std");
const Register = @import("peripherals.zig").Register;
const Peripheral = @import("peripherals.zig").Peripheral;
const SystemTimer = @import("system_timer.zig").SystemTimer;
const SystemTimerConfig = @import("system_timer.zig").SystemTimerConfig;

pub const UsbJtag = struct {
    const Self = @This();
    const UsbJtagRegister = @import("registers.zig").UsbJtagRegister;

    pub const USB_JTAG = Peripheral.USB_JTAG;
    pub const USB_JTAG_BASE = USB_JTAG.baseAddress();
    
    register: UsbJtagRegister,

    pub fn init() Self{
        return Self{.register = UsbJtagRegister{}};
    }
    
    /// Sending data, is first put into the send buffer, and triggering 
    /// a flush to allow host to receive the data in a USB packet. 
    /// Checking space available in the send buffer is by reading the 
    /// register: `USB_REG_SERIAL_IN_EP_DATA_FREE` at: 0x0004, bit index: 1.
    /// Meanwhile, at the same reg and bit index 0 → JTAG_WR_DONE = writing to TX done. 
    /// Filling/writing to the TX buffer is via: `USB_SERIAL_JTAG_EP1_REG`.
    /// After filling you need to flush the buffer for sending the data.
    /// Triggering a flush is done by writing a 1 to `USB_REG_SERIAL_WR_DONE`.
    pub fn usb_jtag_write(self: Self, byte: u8) void {
        // Wait until TX FIFO has space
        self.wait_tx_free();
    
        // A write to this register pushes the written data into the CDC TX FIFO.
        USB_JTAG.write_register(self.register.EP1_DATA, byte);
    }

    fn wait_until_free(self: Self) !void{
        var spins: u32 = 0;
        while (!USB_JTAG.isBitSet(self.register.EP1_CONF, 1)) : (spins += 1) {
            if (spins > 100_000) return error.UsbJtagNotReady;
            asm volatile ("nop");
        }
    }

    fn wait_tx_free(self: Self) void {
        // Wait until TX FIFO has space
        
        // while(USB_JTAG.read_register(self.EP1_CONF) & (1 << 1) == 0){
        while(!USB_JTAG.isBitSet(self.register.EP1_CONF, 1)){
            asm volatile ("nop");
        }
    }

    /// We modify and set the bit index 0, to indicate we are 
    /// done writing to the tx fifo buffer. This is referred
    /// to as flushing the buffer. It is automatically cleared
    /// once the host reads data from the fifo. 
    pub fn flush_tx(self: Self) void {
        const WRITE_DONE_BIT: u32 = 1 << 0;  
        const addr: *volatile u32 = @ptrFromInt(USB_JTAG.baseAddress() + self.register.EP1_CONF);
        addr.* |= WRITE_DONE_BIT; // WR_DONE - Writing byte data to TX FIFO is done.
    }

    /// The send buffer will be unavailable to write into until it has 
    /// been fully read by the host. When the buffer has been fully read,
    /// the `USB_SERIAL_JTAG_SERIAL_IN_INT` interrupt will be triggered. 
    /// Or by keep reading until the `EP_DATA_FREE` register bit equal to 1. 
    /// Meaning TX FIFO is not full and writing can be conducted.
    pub fn write_slice(self: Self, bytes: []const u8) !void {
        var idx: usize = 0; 
        // Wait until TX FIFO has space
        while (idx < bytes.len) : (idx += 1){
            try self.wait_until_free();
            
            // A write to this register pushes the written data into the CDC TX FIFO.
            USB_JTAG.write_register(self.register.EP1_DATA, bytes[idx]);
        }
        self.flush_tx(); // For clarity we will call this as a separate call, whenever, done. 
    }

    pub fn wait_spin(_: Self) void {
        var spins: u32 = 0;
        while (spins < 500_000) : (spins += 1) {
            asm volatile ("nop");
        }
    }

    pub fn ready_timeout(_: Self, timeout_us: u32, systimer: *const SystemTimer) !void {
        const wait_deadline: u64 = systimer.now_v2(.Micro).time + timeout_us;

        while(systimer.now_v2(.Micro).time < wait_deadline){
            // self.wait_tx_free();
            // try self.wait_until_free();
        }

    }

};
