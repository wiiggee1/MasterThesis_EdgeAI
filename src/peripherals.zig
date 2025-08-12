const std = @import("std");

pub const UART0_BASE: *volatile u32 = @ptrFromInt(0x500ca000);
pub const USB_JTAG_BASE: *volatile u32 = @ptrFromInt(0x500d2000);
pub const INTERRUPT_CORE0: *volatile u32 = @ptrFromInt(0x500d6000);
pub const SYSTIMER: *volatile u32 = @ptrFromInt(0x500e2000);
pub const GPIO: *volatile u32 = @ptrFromInt(0x500e0000);
pub const TRACE0: *volatile u32 = @ptrFromInt(0x3ff04000);
pub const TRACE1: *volatile u32 = @ptrFromInt(0x3ff05000);
pub const ASSIST_DEBUG: *volatile u32 = @ptrFromInt(0x3ff06000);
pub const CACHE: *volatile u32 = @ptrFromInt(0x3ff10000);

pub fn MakeRegisterBlock(comptime REGBLOCK: anytype) type {
    // const info = @typeInfo(REGBLOCK).@"struct";
    // Here we initialize an empty array of struct fields, as fields  
    // representing our Register Block fields. 
    const block_len = REGBLOCK.len;
    var block_fields: [block_len]std.builtin.Type.StructField = undefined;

    for (&block_fields, REGBLOCK) |*block_field, reg_field|{
        const register_name: []const u8 = reg_field[0][0..];
        const RegisterDataType: type = reg_field[1];
        if (std.mem.eql(u8, register_name, "PADDING")){
            // Handle padding case;
        }

        block_field.* = .{
            .name = register_name,
            // .type = Register, 
            .type = RegisterDataType, 
            .default_value_ptr = null,
            .alignment = @alignOf(RegisterDataType),
            .is_comptime = false,
        };
    }

    return @Type(.{
        .@"struct" = .{
            .layout = .@"extern",
            // .layout = .auto,
            .fields = &block_fields,
            .decls = &.{},
            .is_tuple = false,
        }
    });
}


test "register-block" {
    // registers
    const EP1_DATA = 0x0000; 
    const EP1_CONF_REG_OFFSET = 0x0004;
    _ = EP1_DATA; 
    _ = EP1_CONF_REG_OFFSET; 

    // .cpu_features_sub = std.Target.riscv.featureSet(&.{ .zca, .zcb, .zcmt, .zcmp, }),
    // const RegBlock = MakeRegisterBlock(.{
    //     .{"EP1_DATA", u32}, // Offset: 0x0000
    //     .{"EP1_CONF", u32}, // Offset: 0x0004
    // });
    
     
    const register_map = comptime [_]type{
        .{"EP1_DATA", u32}, // Offset: 0x0000
        .{"EP1_CONF", u32}, // Offset: 0x0004
    };
    
    _ = register_map; 

    // const block: *volatile RegBlock = @ptrFromInt(0x500d2000);

    // const usb_jtag = AnyPeripheral(.USB_JTAG, RegBlock);
    

    // const usb_jtag = AnyPeripheral(.USB_JTAG, .{
    //     .{"EP1_DATA", u32}, // Offset: 0x0000
    //     .{"EP1_CONF", u32}, // Offset: 0x0004
    // });

    // const block: *volatile usb_jtag.asRegisterBlock() = @ptrFromInt(0x500d2000);
    
    // const block = usb_jtag.intoRawRegisterBlock();
    
}

pub fn AnyPeripheral(comptime PeripheralKind: Peripheral, comptime Registers: anytype) type{
    const RawRegisterBlock = MakeRegisterBlock(RegBlock);
    _ = Registers; 
    return extern struct {
        pub const peripheral = PeripheralKind; 
        const PeripheralBaseAddres = PeripheralKind.baseAddress();
        const RegBlockType = @TypeOf(RegBlock);
        pub usingnamespace RawRegisterBlock;

        const Self = @This();
        // pub const GPIO: *volatile types.peripherals.GPIO = @ptrFromInt(0x500e0000);

        pub fn intoRawRegisterBlock() *volatile RegBlock{
            const reg_ptr: *volatile RegBlock = @ptrFromInt(PeripheralBaseAddres);
            // const reg_ptr: *volatile u32 = @ptrFromInt(PeripheralBaseAddres);
            return reg_ptr;
        }

        pub fn registerFromOffset(offset: usize) *volatile u32 {
            return @ptrFromInt(PeripheralBaseAddres + offset);
        }
    };

}

// pub const Register = enum

pub const RegisterBlock = extern struct {
    REG_0: u32,     // Offset: 0x0000
    PADDING: u32,   // 0x0004: Padding to satisfy the alignment
    REG_2: u32,     // 0x0008

    pub fn register(base_addr: usize) *volatile RegisterBlock{
        const reg_ptr: *volatile RegisterBlock = @ptrFromInt(base_addr);
        return reg_ptr;
    }

};

const RegBlock = MakeRegisterBlock(.{
    .{"EP1_DATA", u32}, // Offset: 0x0000
    .{"EP1_CONF", u32}, // Offset: 0x0004
});

const usb_jtag = AnyPeripheral(.USB_JTAG, RegBlock);


/// The `Register` union type contain the underlying
/// peripheral and some user defined registers. 
/// =================================================
/// C-ABI compatible struct memory-layout, representing 
/// a `RegisterBlock`. C Memory Layout means: 
/// - Field appear in order when they are defined,
/// - Each field is aligned according to C, 
/// - The compiler may insert padding to satisfy alignment,
/// - Size of the struct, is rounded up to a multiple of its strongest field alignment. 
/// =================================================
/// On ESP32-P4, little-endian, 4-byte alignment for u32 is used. 
/// Little-endian: Stores the LSB at the smallest address. 
/// E.g., 0x0A0B0C0D: 
///     → Index N:   0D (LSB)
///     → Index N+1: 0C   |
///     → Index N+2: 0B   |
///     → Index N+3: 0A (MSB)
/// =================================================
pub const Register = union(Peripheral) {
    USB_JTAG: extern struct{
        EP1_DATA: u32 = 0x0000, // Offset: 0x0000
        EP1_CONF: u32 = 0x0004, // Offset: 0x0004
        EP1_JFIFO_ST: u32 = 0x0020, // 
        EP1_ST: u32 = 0x002C, // Endpoint 1 status register.
    },
    UART0: extern struct{
        reg0: u32, // 0x0000 
        padding: u32, // Padding to satisfy the alignment of 4 bytes.
        reg2: u32 // 0x0008
    },
    GPIO: extern struct{
        PADDING: u32 = 0x0000,
        OUT: u32 = 0x0004,
        W1TS_REG: u32 = 0x0008, 
        W1TC_REG: u32 = 0x000C,
        ENABLE: u32 = 0x0020,
        IN: u32 = 0x3C,
    },
    SYSTIMER: extern struct{
        CONF: u32 = 0x0000,
        UNIT0_OP: u32 = 0x0004,
        UNIT0_LOAD_HI: u32 = 0x000C,
        UNIT0_LOAD_LO: u32 = 0x0010,
        UNIT0_VALUE_HI: u32 = 0x0040,
        UNIT0_VALUE_LO: u32 = 0x0044,
        UNIT0_LOAD_REG: u32 = 0x005C,

        TARGET0_COMP_HI: u32 = 0x001C,
        TARGET0_COMP_LO: u32 = 0x0020,
        TARGET0_COMP_CONF: u32 = 0x0034,
        TARGET0_COMP_LOAD_REG: u32 = 0x0050,

        INT_ENA: u32 = 0x0064,
        INT_RAW: u32 = 0x0068,
        INT_CLR: u32 = 0x006C,
        INT_ST: u32 = 0x0070,

        /// Actual target value of COMP0, low 32 bits
        REAL_TARGET0_LO: u32 = 0x0074,
        /// Actual target value of COMP0, high 20 bits
        REAL_TARGET0_HI: u32 = 0x0078,
    },

    pub fn getRegisterBlock(self: Register) void {
        switch(self){
            .SYSTIMER => |timer| {
                return timer;
            },
        }
    }

    pub fn enable_systimer(self: Register, options: anytype) void {
        const ConfigOptions = struct{clk_src: []const u8, prescaler: u8, freq: u8};
        const config = @as(ConfigOptions, options);
        _ = config; 

        const systimer = @as(Peripheral, self);
        switch (self) {
            .SYSTIMER => |timer| {
                const reg_addr: usize = systimer.baseAddress() + @as(usize, @intCast(timer.CONF));
                // Bit 31 - register clock is always enabled for read and write operations.
                // Bit 30 - Enable UNIT0.
                const mask_conf: u32 = (1 << 31) | (1 << 30); 
                const register_conf: *volatile u32 = @ptrFromInt(reg_addr);
                register_conf.* |= mask_conf; 
                // ===============================

            },
            else => {},
        }
    }

    fn read_ticks(self: Register) u64 {
        switch (self) {
            .SYSTIMER => |timer| {
                const UNIT0_OP: usize = @intCast(timer.UNIT0_OP);
                const UNIT0_VALUE_LO: usize = @intCast(timer.UNIT0_VALUE_LO);
                const UNIT0_VALUE_HI: usize = @intCast(timer.UNIT0_VALUE_HI);

                const register_unit0_op: *volatile u32 = @ptrFromInt(Peripheral.SYSTIMER.baseAddress() + UNIT0_OP);
                const mask_op: u32 = (1 << 30);
                register_unit0_op.* |= mask_op; // Set the SYSTIMER_TIMER_UNIT0_UPDATE bit 30 to 1 → Update timer UNIT0.
                
                while(!Peripheral.SYSTIMER.isBitSet(UNIT0_OP, 29)){} // Wait for UNIT0 value to be synchronized = valid. 

                const lower: *volatile u32 = @ptrFromInt(Peripheral.SYSTIMER.baseAddress() + UNIT0_VALUE_LO); // dummy value atm! 
                const higher: *volatile u32 = @ptrFromInt(Peripheral.SYSTIMER.baseAddress() + UNIT0_VALUE_HI); // dummy value atm! 

                return (@as(u64, higher.*) << 32) | lower.*;
            },
            else => {},
        }
    }

    pub fn write_unit0(self: Register, value: u64) void {
        switch(self){
            .SYSTIMER => |timer| {
                const LOAD_HI: usize = @intCast(timer.UNIT0_LOAD_HI); // bit [19:0]
                const LOAD_LO: usize = @intCast(timer.UNIT0_LOAD_LO); // bit [31:0] 
                const LOAD_REG: usize = @intCast(timer.UNIT0_LOAD_REG); // Only for reloading value of UNIT0.
                const LSB = 0; 

                Peripheral.SYSTIMER.write_register(LOAD_LO, value & 0xFFFF_FFFF);
                Peripheral.SYSTIMER.write_register(LOAD_HI, value >> 32);
                Peripheral.SYSTIMER.set_register(LOAD_REG, LSB);
            },
            else => {},
        }
    }
        
};

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

    pub fn intoRegister(self: Peripheral) Register{
        switch (self) {
            inline else => |arch| {
                return @as(Register, arch); 
            }
        }
    }

    pub fn register_ptr(self: Self, offset: usize) *volatile u32 {
        const base_address = @intFromEnum(self);
        const base: usize = @intCast(base_address);
        return @as(*volatile u32, @ptrFromInt(base + offset));
    }

    pub inline fn baseAddress(self: Self) usize{
        const addr_u32 = @intFromEnum(self);
        const base: usize = @intCast(addr_u32);
        return base; 
    }

    pub fn isBitSet(self: Self, offset: usize, bit_index: u8) bool {
        const mask: u32 = 1 << bit_index; 
        const register_value = self.read_u32_reg(offset);
        return (register_value & mask) != 0; 
    }

    pub inline fn read_u32_reg(self: Self, offset: usize) u32 {
        return self.register_ptr(offset).*;
    }

    /// Modify a single bit (true=set, false=clear) in a 32-bit register at base+offset.
    pub inline fn modify(self: Self, offset: usize, bit_index: u8, set: bool) void {
        // const addr = self.getBaseAddress() + offset;
        if (set) {
            // self.set_bits(@as(u32, 1) << bit_index);
            self.set_register(offset, bit_index);
        } else {
            clear_register(self.baseAddress(), offset, bit_index);
        }
    }

    pub inline fn setAt(self: Self, offset: usize, mask: u32) void {
        // const reg = self.baseAddress() + offset;
        // const WR_DONE: u32 = 1 << 0; // WT: write 1 to signal a TX byte is ready
        // 0b0000_..._0001
        self.write_register(offset, mask);
        // self.write_bits(addr, read_bits(addr) & ~mask);
    }

    // Peripheral.USB_JTAG → contains the base address of the peripheral. 
    // To access a register within the peripheral you need to pass that 
    // as an offset to the function.
    // Peripheral.USB_JTAG.setAt()
    
    pub inline fn read_bits(self: Self) u32 {
        const register: *volatile u32 = @ptrFromInt(self.baseAddress());
        return register.*; 
    }

    // pub inline toggle_bit ^= mask

    // ===============================================================
    // Below are APIs for setting a specific register (BASE + OFFSET):
    // ==============================================================
    
    pub inline fn read_register(self: Self, offset: usize) u32 {
        const register: *volatile u32 = @ptrFromInt(self.baseAddress() + offset);
        return register.*;  
    }

    /// The offset is the same as the target register within a peripheral's 
    /// base address.
    pub inline fn write_register(self: Self, offset: usize, value: u32) void {
        const register: *volatile u32 = @ptrFromInt(self.baseAddress() + offset);
        register.* = value;
    }

    pub inline fn set_register(self: Self, offset: usize, N: u8) void {
        const register: *volatile u32 = @ptrFromInt(self.baseAddress() + offset);
        register.* |= (1 << N); // Set bit N.
    }

    pub inline fn clear_register(base_addr: usize, offset: usize, N: u8) void {
        const register: *volatile u32 = @ptrFromInt(base_addr + offset);
        // If N = 2 then this is: register = register AND 0x1111_1101
        register.* &= ~(1 << N); // Clear bit N
    }

};
