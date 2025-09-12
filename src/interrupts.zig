const std = @import("std");
const builtin = @import("builtin");
const Peripheral = @import("peripherals.zig").Peripheral;
const Register = @import("peripherals.zig").Register;
const ISR = @import("startup.zig").ISR;
const CSR = @import("csr.zig").CSR;

// const ISRHandlers = @import("startup.zig").ISRHandlers;
const INTERRUPT = @import("startup.zig").INTERRUPT;
const TrapVector = @import("startup.zig").TrapVector;
const WeakHandlers = @import("startup.zig").WeakHandlers;
const ExternalHandlerSymbols = @import("startup.zig").ExternalHandlerSymbols;

extern var _vector_table: noreturn;
extern var _mtvt_table : [48]TrapVector; 
const panic = @import("startup.zig").panic;

/// Container for interrupt related CSR operations. 
pub const InterruptCSRs = struct {

    /// This will set the base address of our ISR interrupt jump table. 
    /// By setting the `MTVT` CSR value. 
    pub inline fn set_mtvt_jump_table_address(mtvt_address: u32) void{
        CSR.mtvt.write_csrw(mtvt_address);
    }

    pub inline fn set_mie(toggle: CSR.Toggle) void{
        CSR.mstatus.setClear(toggle, @as(u5, 0x08));
    }

    /// Setting the bit[3] = 1, will enable the global machine mode interrupt. 
    pub inline fn enable_gloabl_interrupts() void {
        const mask_bits: u32 = CSR.mstatus.read_csrr() | @as(u32, 1) << 3;
        
        // Mask for enabling global interrupts in 'mstatus': 0b1000
        std.log.warn("Mask for enabling global interrupts in 'mstatus': 0b{b}\n", .{mask_bits});
        CSR.mstatus.write_csrw(mask_bits);

        // const mask_mie: u32 = @as(u32, 1) << 3;
        // if((CSR.mstatus.read_csrr() & mask_mie) != 0){
        //     InterruptCSRs.enable_gloabl_interrupts();
        // }
    }

    /// This would write the CSR special purpose reg `csrw` for writing 
    /// to the `mtvec` - "Machine Trap Vector" and the mode. 
    /// - Direct Mode: 0b00, jumps to `mtvec.base`
    /// - Vectored Mode: 0b01, 
    /// - Clic Vectored Mode: 0b11 (0x3) on ESP32-P4.
    /// -------------------------------------
    ///  The bitmask enable the vector mode when writing to the MTVEC CSR.
    ///  Setting mode field to 3 treats `MTVT + 4 * interrupt_id` as the
    ///  service entry address for HW vectored interrupts.
    /// -------------------------------------
    /// `mtvec` arg - address to the _vector_table from the `linksection(".iram0.vectors")`.
    /// `mode` arg - type of Interrupt Controller Mode to set to. 
    pub inline fn setup_mtvec(mtvec: usize, mode: InterruptControllerMode) void {
        // 1. Assign and set the `mtvec` address. 
        asm volatile ("csrw mtvec, a0" :: [mtvec] "{a0}" (mtvec));
        
        // 2. Set the `InterruptControllerMode` to clic mode.
        const mtvec_mask: u32 = CSR.mtvec.read_csrr() & ~@as(u32, mode.integer()); // CSR.mtvec.read_csrr() & ~@as(u32, 0x3);
        const clic_mode: u32 = mtvec_mask | @as(u32, mode.integer());
        CSR.mtvec.write_csrw(clic_mode); // Enable Vectorred Clic mode.
    }

    /// Setting the `mtvt` (Machine Trap Vector Table), by passing a pointer 
    /// address to the interrupt ISR jump table. 
    /// This table later contain our callback (fn ptr) ISR handlers.
    pub inline fn set_mtvt(mtvt_ptr_address: usize) void {
        asm volatile ("csrw 0x307, a0" :: [mtvt] "{a0}" (mtvt_ptr_address));
    }
};

pub const InterruptConfig = struct {
    /// An interrupt can be either `level` triggered or `edge`
    /// triggered. If the interrupt is level-triggerd, the 
    /// interrupt remains asserted until the source and pending 
    /// bit cleared by the software. Meanwhile, edge-triggered 
    /// interrupts treat each interrupt as a pulse. 
    trigger_mode: ?TriggerMode = null,
    /// Represent the interrupt index number associated to a 
    /// specific ISR in the vector table in memory. 
    /// Note ISRs are accessed through their address given by:
    /// `mtvt + (4 * Interrupt ID)`
    id: u5, // 0..31
    /// The `id` field represent the values between 0..31.
    /// While `mtvt_index`: [16:47] = CLIC_EXT_INTR_NUM_OFFSET + `id` = 16 + `id`.
    mtvt_index: u6,
    isr: ?ISR = null,
    /// Priority defaults to 0, and is only relevant, when we have 
    /// multiple interrupts at the same level. 
    priority: ?u3 = null, 
    /// Preemption depends only on level; priority never causes preemption across levels.
    /// Higher level preempt Lower levels.
    level: u3,
    source: PeripheralInterruptSources, 
    threshold: ?u4 = null,

    pub fn parse_v2(config: anytype) InterruptConfig{
        var interrupt_config: InterruptConfig = undefined; 
        const default_conf = Clic.DefaultConfig;
        const config_info = @typeInfo(@TypeOf(config)).@"struct";

        if(@TypeOf(config) == InterruptConfig) return @as(InterruptConfig, config);

        inline for(config_info.fields, 0..) |field, i|{
            if (@hasField(InterruptConfig, field.name)) {
                const cfg_val = @field(config, field.name);
                const DestinationType = @TypeOf(@field(interrupt_config, field.name));
                const CfgFieldType = @TypeOf(cfg_val);

                const valid_info = @typeInfo(DestinationType);
                const field_info = @typeInfo(CfgFieldType);
                
                std.log.info("Arg({d}) with name: {s}, value: {any}\n", .{i, field.name, @field(config, field.name)});
                
                const child_match: bool = (
                    valid_info == .optional and (valid_info.optional.child == field.type or
                    (field_info == .optional and valid_info.optional.child == field_info.optional.child))
                );
                if(child_match){
                    if(field_info == .optional){
                        const config_entry = entry_field:{
                            if(cfg_val) |value|{
                                break value;
                            }else{
                                if(CfgFieldType == ?TriggerMode) break :entry_field default_conf.trigger_mode;
                                if(CfgFieldType == ?ISR) break :entry_field null;
                                if(CfgFieldType == ?u3) break :entry_field default_conf.priority;
                                if(CfgFieldType == ?u4) break :entry_field null;
                            }
                        };
                        @field(interrupt_config, field.name) = config_entry;
                        // std.log.info("Arg({d}) with name: {s}, value: {any}\n", .{i, field.name, @field(config, field.name)});
                    }else{
                        // std.log.info("Arg({d}) with name: {s}, value: {any}\n", .{i, field.name, @field(config, field.name)});
                        @field(interrupt_config, field.name) = cfg_val;
                    }
                }else if(CfgFieldType == DestinationType){
                    // std.log.info("Arg({d}) with name: {s}, value: {any}\n", .{i, field.name, @field(config, field.name)});
                    @field(interrupt_config, field.name) = cfg_val;
                }
            }
        }
        interrupt_config.mtvt_index = Clic.CLIC_EXT_INTR_NUM_OFFSET + interrupt_config.id; // 16..47
        std.log.info("Parsed InterruptConfig (v2): {any}\n", .{interrupt_config});
        return interrupt_config;
    }

};

pub const Interrupt = struct {
    const Self = @This();
    pub const Config = InterruptConfig;
    pub const DefaultConfig = Clic.DefaultConfig;
    const InterruptMatrixRegister = @import("registers.zig").InterruptMatrixRegister;

    config: InterruptConfig, 
    register: InterruptMatrixRegister, 

    pub fn init(config: anytype) Interrupt{
        // if (!@hasField(@TypeOf(config), "source")) return error.MissingSource;
        // if (!@hasField(@TypeOf(config), "id")) return error.MissingId;
        // if (!@hasField(@TypeOf(config), "level")) return error.MissingLevel;

        // const default_conf = Clic.DefaultConfig;
        // const trigger = if (@hasField(@TypeOf(config), "trigger_mode")) config.trigger_mode else default_conf.trigger_mode;
        // const priority_value = if (@hasField(@TypeOf(config), "priority")) config.priority else default_conf.priority; // Defaults to 0.
        // const isr_handler = if (@hasField(@TypeOf(config), "isr")) @as(ISR, config.isr) else null;
        // const threshold_value = if (@hasField(@TypeOf(config), "threshold")) @as(u4, config.threshold) else null;

        const parsed_conf: InterruptConfig = if(@TypeOf(config) == InterruptConfig) @as(InterruptConfig, config) 
            else InterruptConfig.parse_v2(config);
        
        if(parsed_conf.isr == null) panic("Missing ISR!", null, null);

        if(parsed_conf.mtvt_index == 0){
            var self: Interrupt = .{.config = parsed_conf, .register = InterruptMatrixRegister{}};
            self.config.mtvt_index = Clic.CLIC_EXT_INTR_NUM_OFFSET + self.config.id; // 16..47
            return self;
        }else{
            return Interrupt{
                .config = parsed_conf,
                .register = InterruptMatrixRegister{},
            };
        }

        // self.routeInterruptSource() catch {};
        // self.sourceMappingDebug() catch {};
        
        // Register the external interrupt to the associated ISR handler.
        // return self; 
    }

    /// Try to get the address of the ISR handler symbol.
    pub fn tryGetIsrAddress(self: Self) !usize{
        const isr_addr: usize = @intFromPtr(self.isr orelse return error.MissingISR);
        return isr_addr; 
    }
    
    /// Maps from a `PeripheralInterruptSources` type into the corresponding 
    /// mapping register as a raw register pointer. This function calculate
    /// the Interrupt Matrix mapping Register given the source.
    pub fn fromSourceIntoMappingRegister(self: Self) !usize {
        var index: ?usize = null;
        const source_values = std.enums.values(PeripheralInterruptSources);
        for(source_values, 0..) |source_tag, i| {
            if(source_tag == self.config.source){
                std.log.warn("Found Interrupt Source: {s} at index: {d}\n", .{@tagName(source_tag), i});
                index = i; 
                break; 
            }
        } 

        const interrupt_matrix_addr = Peripheral.INTERRUPT_MATRIX.baseAddress();
        const idx: usize = index orelse return error.InterruptSourceFailed;
        const addr: usize = interrupt_matrix_addr + idx * 4;
        return addr;
    }

    /// Should print or fmt: "External Interrupt Source({s}) → Mapping Register: 0x{x}"
    pub fn sourceMappingDebug(self: Self) !void{
        const source_name: []const u8 = @tagName(self.config.source);
        
        var index: ?usize = null;
        const source_values = std.enums.values(PeripheralInterruptSources);
        for(source_values, 0..) |source_tag, i| {
            if(source_tag == self.config.source){
                std.log.warn("Found Interrupt Source: {s} at index: {d}\n", .{@tagName(source_tag), i});
                index = i; 
                break; 
            }
        } 

        const intmat_addr = Peripheral.INTERRUPT_MATRIX.baseAddress();
        const source_index: usize = index orelse return error.InterruptSourceFailed;
        const addr: usize = intmat_addr + source_index * 4;

        std.log.warn("Index: {d} (0x{x}) → Offset (Index * 4): 0x{x} → {s} → Mapping Reg: 0x{x}\n", .{
            @as(u32, source_index),  
            @as(u32, source_index),  
            @as(u32, source_index * 4),  
            source_name,
            @as(u32, addr),
        });
    }
    
    /// This is the routing logic, for associating and assigning 
    /// an external peripheral interrupt source mapping register 
    /// to the interrupt_id. Where the interrupt_id correspond 
    /// to the entry in the `MTVT_TABLE` for accessing the ISR 
    /// at `MTVT_TABLE[interrupt_id]`.
    /// ================================================
    /// - Peripheral Interrupt Source: `COREx_SOURCE_Y_MAP_REG`.
    /// - Base Address of INTERRUPT_MATRIX:  0x500D_6000.
    /// - `COREx_SOURCE_Y_MAP_REG` = 0x500D_6000 + SOURCE_Y_OFFSET
    /// - INTERRUPT_ID → `MTVT_TABLE[INTERRUPT_ID]` = ISR function.
    ///
    /// → Assignment Flow: `COREx_SOURCE_Y_MAP_REG` = INTERRUPT_ID ←
    /// ================================================
    pub fn routeInterruptSource(self: Self) !void{
        // Valid MTVT table index are from 16 - 47 
        const mtvt_id: u6 = self.config.mtvt_index; // 16..47
        // const addr: usize = try self.fromSourceIntoMappingRegister(self.source);
        const addr: usize = try self.fromSourceIntoMappingRegister();
        const addr_ptr: *volatile u32 = @ptrFromInt(addr); 
        // addr_ptr.* = mtvt_id; 
        
        if(builtin.mode == .Debug){
            std.log.warn("COREx_SOURCE_Y_MAP_REG ({s}) at 0x{x} = ID({d})\n", .{@tagName(self.config.source), @as(u32, addr), @as(u32, mtvt_id)});
        }

        addr_ptr.* = @as(u32, mtvt_id); 
    }

    pub fn validNameOfISR(isr_name: []const u8) bool {
        return @hasDecl(WeakHandlers.ISRs, isr_name);
    }

    pub inline fn get_interrupt_level() u32{
        return CSR.mintstatus.read_csrr();
    }
};


/// This is the CLIC interrupt controller, that is used for assigning
/// external peripheral interrupt sources into CPU interrupts invoked by the 
/// MTVT table. Each hart (core) has a separate CLIC accessed by a 
/// separate address region - 0x2080_0000, on esp32p4.
/// This type configures registers in the following CLIC M-mode Memory Map: 
/// ----------------------------------------------------
///     Offset
///     0x0000     : cliccfg (RW)
///     0x0004     : clicinfo (R)
///     0x1000+4*i : clicintip[i] - Interrupt Pending. 
///     0x1001+4*i : clicintie[i] - 1 (for enabling interrupt associated with id).
///     0x1002+4*i : clicintattr[i] - SHV, Trigger mode
///     0x1003+4*i : clicintctl[i] - Level and Priority (preemption).
/// ----------------------------------------------------
/// In addition to the above memory map, we also enable interrupts 
/// globally by setting: `mstatus.MIE` = 1.
pub const Clic = struct {

    // pub const base_peripheral = Peripheral.INTERRUPT_MATRIX;

    // const AnyRegister = @import("registers.zig").AnyRegister;
    const ClicRegister = @import("registers.zig").ClicRegister;

    const Self = @This();

    /// For the desired level/priority split in `clicintctl[i]`.
    /// Level and Priority Split Default: (level 1, prio 0): CTL = (1 << 5) | 0 = 0b0010_0000.
    const NLBITS = 3;
    const CLIC_EXT_INTR_NUM_OFFSET: u6 = 16; 

    /// Represent the Interrupt Matrix register. 
    /// With a base address of: 0x500D6000
    register: ClicRegister,
    // mtvt: []TrapVector,
    mtvt: *[48]TrapVector,

    pub const ClicConfig = struct {
        cliccfg_nlbits: u3,
        /// If "Selective Hardware Vectoring" (SHV) is enabled. 
        SHV: bool,
        trigger_mode: TriggerMode,
        privilege_mode: CTRL_REG.ATTR_BIT.PrivilegeMode,
        priority: u3,
    };

    pub const DefaultConfig: ClicConfig = default: {
            break :default .{
                .cliccfg_nlbits = NLBITS,
                .SHV = true,
                .trigger_mode = .level,
                .privilege_mode = CTRL_REG.ATTR_BIT.PrivilegeMode.machine,
                .priority = 0,
            }; 
    };

    pub fn initial_setup(vector_table: usize, isr_table: usize) void{
        // 1. Mask for initially clearing and setting MIE = 0. 
        // In other words, disable initially.
        var mstatus_mask = CSR.mstatus.read_csrr();
        mstatus_mask &= ~@as(u32, 1 << 3);
        CSR.mstatus.write_csrw(mstatus_mask);
        asm volatile ("csrw  mie, zero");
        
        // 2. Set the location address of the `MTVT` table - ISR jump table.
        InterruptCSRs.set_mtvt(isr_table);
        // InterruptCSRs.set_mtvt(@intFromPtr(&_mtvt_table));

        // 3. Set the address of the `mtvec` CSR + set the mode to clic. 
        InterruptCSRs.setup_mtvec(vector_table, .clic);
        // InterruptCSRs.setup_mtvec(@intFromPtr(&_vector_table), .clic);

    }

    /// Globally setup for the Clic Interrupt Controller. 
    pub fn global_setup(_: Self, vector_table: usize, isr_table: usize) void{
        // 1. Mask for initially clearing and setting MIE = 0. 
        // In other words, disable initially.
        var mstatus_mask = CSR.mstatus.read_csrr();
        mstatus_mask &= ~@as(u32, 1 << 3);
        CSR.mstatus.write_csrw(mstatus_mask);

        // 2. Set the address of the `mtvec` CSR + set the mode to clic. 
        InterruptCSRs.setup_mtvec(vector_table, .clic);
        // InterruptCSRs.setup_mtvec(@intFromPtr(&_vector_table), .clic);

        // 3. Set the location address of the `MTVT` table - ISR jump table.
        InterruptCSRs.set_mtvt(isr_table);
        // InterruptCSRs.set_mtvt(@intFromPtr(&_mtvt_table));

        // std.log.info("Global Setup Finished!\n", .{});
    }

    pub fn enable_mie(_: Self) void{
        InterruptCSRs.enable_gloabl_interrupts();
    }

    pub fn init_default(clic_register: ClicRegister) Self{
        return Self{
            .register = clic_register,
            .mtvt = &_mtvt_table,
        };
    }

    // TODO: - Add arg for setting SHV bool field as enabled or not. 

    pub fn init(mtvt: anytype) Self{
        // var slice = _mtvt_table[0.._mtvt_table.len];
        // var slice = _mtvt_table[0..]; // ptr to array will coerce to a slice []T.
        // var slice_from_arr = &_mtvt_table;

        const mtvt_ptr = ptr:{
            const info = @typeInfo(@TypeOf(mtvt));
            if(info == .optional){
                if(mtvt == null) break :ptr &_mtvt_table;
            }
            if(@TypeOf(mtvt) == [48]TrapVector) break :ptr @as(*[48]TrapVector, mtvt[0..]);
            if(@TypeOf(mtvt) == *[48]TrapVector) break :ptr @as(*[48]TrapVector, mtvt);
            break :ptr _mtvt_table[0..];
        };
        return Self{
            .register = ClicRegister{},
            .mtvt = mtvt_ptr,
        };
    }

    pub fn debug_info(self: Self) void{
        const mtvt_base: usize = @intFromPtr(self.mtvt);
        const mtvt_base_external: usize = @intFromPtr(&_mtvt_table);

        std.log.warn("---CLIC Status--- Found MTVT ptr address: 0x{x} vs external _mtvt_table: 0x{x}, ptr: {*} \n", .{
            mtvt_base,
            mtvt_base_external,
            &_mtvt_table,
        });

    }

    /// Fetch the Clic ctrl register address: 0x2080_1000.
    pub inline fn CTRL_BASE(self: Self) usize{
        return self.register.CTRL_BASE;
    }

    /// Fetch the Clic ctrl register address for a specific interrupt.
    /// Same as: CTRL_BASE + id * 4.
    pub inline fn INT_CTRL_BASE(self: Self, id: u6) usize{
        const id_offset: usize = (@as(usize, id) << 2); // id * 4
        return self.register.CTRL_BASE + id_offset;
    }


    /// Example of saving context for trap vector:
    /// _example_trap:
    ///     addi sp, sp, -16*4
    ///     sw ra, 0(sp)
    ///     la ra, interrupt1
    ///     j _my_custom_isr     or   jal isr_handler_name ::: memory
    pub fn isr_jump_vector() callconv(.naked) void {

        // 1. Push Interrupt state:
        // "addi sp, sp, -{}", .{registers.len * @sizeOf(u32)}));
        // asm volatile (std.fmt.comptimePrint("sw {s}, 4*{}(sp)", .{ reg, i }));

        // 2. Jump to Interrupt ISR:
        // asm volatile ("jal isr_name ::: memory")

        // 3. Pop Interrupt State:
        // asm volatile (std.fmt.comptimePrint("lw {s}, 4*{}(sp)", .{ reg, i }));
        // asm volatile (std.fmt.comptimePrint("addi sp, sp, {}", .{registers.len * @sizeOf(u32)}));

        // 4. Return from Interrupt:
        // asm volatile ("mret" ::: "memory");

        // const intermediate_asm_jump = comptime blk: {
        //     var s: []const u8 = &.{};
        //     for (1..32) |i| {
        //         s = s ++ std.fmt.comptimePrint(
        //             \\.balign 4
        //             \\    j interrupt{}
        //             \\
        //         , .{i});
        //     }
        //     break :blk s;
        // };

    }

    /// RV32I Instructions:
    /// J-type: imm[20|10:1|11|19:12], rd, opcode
    /// - Jump And Link: jal, opcode: 1101111, rd = PC+4; PC += imm
    inline fn encode_jal(rd: u5, immediate_bytes: i32) u32 {

        // Cast to a 32-bit pattern, i32 → u32 perserving two's complement.
        const immediate: u32 = @bitCast(immediate_bytes);
        const rd_bits: u32 = @intCast(rd);
        const opcode: u32 = 0b1101111;

        const b20    = ((immediate >> 20) & 0x1)    << 31;   // imm[20]
        const b10_1  = ((immediate >>  1) & 0x3ff)  << 21;   // imm[10:1]
        const b11    = ((immediate >> 11) & 0x1)    << 20;   // imm[11]
        const b19_12 = ((immediate >> 12) & 0xff)   << 12;   // imm[19:12]

        return b20 | b10_1 | b11 | b19_12 | (rd_bits << 7) | opcode;
    }

    /// Get the MTVT + id * 4 address, as the slot address where the 
    /// jump instruction to the ISR handler lives.
    pub fn getInterruptHandlersOffset(_: Self, interrupt: Interrupt) usize {
        const mtvt_isr_location: usize = @intFromPtr(&_mtvt_table) + @as(usize, @intCast(interrupt.config.mtvt_index));
        return mtvt_isr_location; 
    }

    pub fn mtvt_setup_defaults(self: Self) !void{
        // While `mtvt_index`: [16:47] = CLIC_EXT_INTR_NUM_OFFSET + `id` = 16 + `id`.
        _ = self; 
        const mtvt_base: usize = @intFromPtr(&_mtvt_table);
        _ = mtvt_base;
        for (16..48) |id|{
            _ = id;
        }

    }

    /// When the Interrupt is configures as: CLIC SHV = 1 (hardware-vectored).
    /// The `mtvt[idx]` holds one 32-bit jump to the isr handler. 
    /// To enable Interrupt n, write 1 to the nth bit of mie CSR.
    pub fn configure_interrupt(self: *Self, interrupt: Interrupt) !void{
        // 1. Install the isr: _mtvt_table[idx] = interrupt.isr;
        if(!(interrupt.config.mtvt_index > 15 and interrupt.config.mtvt_index <= 47)){
            std.log.err("Got Error: BadMtvtIndexValue\n", .{});
            return error.BadMtvtIndexValue;
        }
        const mtvt_base: usize = @intFromPtr(&_mtvt_table);
        // const mtvt_isr_location: usize = @intFromPtr(&_mtvt_table) + @as(usize, @intCast(interrupt.config.mtvt_index));
        const mtvt_isr_location: usize = @intFromPtr(&_mtvt_table) + @as(usize, @intCast(interrupt.config.mtvt_index))*4;
        const isr_addr: usize = @intFromPtr(interrupt.config.isr orelse return error.MissingISR);
        const mtvt_offset: i64 = @as(i64, isr_addr) - @as(i64, mtvt_isr_location); // as signed immediate value. 

        // slot 17 @ 0x4ff00084, ptr: startup.TrapVector@4ff00084
        const slot_ptr = &_mtvt_table[interrupt.config.mtvt_index]; // &element, automatically scaled
        const slot_addr = @intFromPtr(slot_ptr);
        const isr_ptr = interrupt.config.isr orelse return error.MissingISR;
        const entry_val = @as(*const usize, @ptrCast(slot_ptr)).*;

        if(builtin.mode == .Debug){
            std.log.warn("mtvt slot {d} @ 0x{x}, target ISR @ 0x{x}, off=0x{x}, mtvt start @ 0x{x}\n", .{ 
                interrupt.config.mtvt_index, 
                mtvt_isr_location, 
                isr_addr, 
                mtvt_offset,
                mtvt_base,
            });
            std.log.warn("slot {d} @ 0x{x}, ptr: {*}, isr ptr: {*}\n", .{ interrupt.config.mtvt_index, slot_addr, slot_ptr, &isr_ptr});
            std.log.warn("&self.mtvt = {*}, &self.mtvt[{d}] = {*}\n", .{
                self.mtvt, 
                interrupt.config.mtvt_index, 
                &self.mtvt[interrupt.config.mtvt_index],
            });
            std.log.warn("mtvt[17] value = 0x{x} (expect 0x{x})\n", .{ entry_val, @intFromPtr(&isr_ptr) });
        }
        
        // if ((mtvt_offset & 1) != 0) return error.Misaligned; // LSB must be 0
        // if (mtvt_offset < -(1<<20) or mtvt_offset >= (1<<20)) return error.OutOfRange; // ±1 MiB

        //FIX: - Do I need to assign it directly to the table like this? 

        // self.mtvt[interrupt.config.mtvt_index] = TrapVector{.ISR_HANDLER = interrupt.config.isr orelse return error.MissingISR};
        self.set_handler(interrupt.config.mtvt_index, isr_ptr);

        // std.log.warn("MTVT ISR Location: 0x{x}\n\r, ISR Symbol Address: 0x{x}\n\r, MTVT Offset: 0x{x}\n\r, JAL Encoding: 0b{b}\n\rMTVT[{d}]: {*}\n", .{
        //     @as(u32, mtvt_isr_location),
        //     @as(u32, isr_addr),
        //     @as(i64, mtvt_offset),
        //     @as(u32, instr),
        //     @as(u6, interrupt.config.mtvt_index),
        //     &self.mtvt[interrupt.config.mtvt_index],
        // });


        // 2. Setup Interrupt:
        self.setup_interrupt_source(&interrupt);
        
        // 3. Map External Interrupt Source to MTVT Index.
        try interrupt.routeInterruptSource();
        if(builtin.mode == .Debug) try interrupt.sourceMappingDebug();

        self.clear_interrupt_pending(DefaultConfig, &interrupt); //clicintip[i]

        // HERE we setup and enable the peripheral interrupt. 
        // Thoughts: add 'enable_fn' argument as a function pointer for calling the 
        // specific peripherals enable_interrupt function in this scope. 

        // interrupt_ctx.mtvt_index represent a value in the bit range: 16..47
        // self.enableInterruptAt(&interrupt); // `clicintie[i]`

        if (builtin.mode == .Debug){
            std.log.warn("After setup of Interrupt CTRL Register 0x{x}: 0b{b}\n", .{
                @as(u32, self.interruptCtrlAddress(interrupt.config.mtvt_index)),
                @as(u32, self.readInterruptCtrl(interrupt.config.mtvt_index)),
            });
        }

    }

    pub fn set_handler(self: *Self, idx: usize, isr: ISR) void {
        // treat entry as a raw word; SHV expects an address there
        const slot_word: *volatile u32 = @ptrCast(&self.mtvt[idx]);
        const isr_jump_address = @intFromPtr(isr);

        slot_word.* = isr_jump_address;
        // asm volatile ("fence rw, rw" ::: "memory"); // ensure the write is visible before enabling

        const slot_word_after: *volatile u32 = @ptrCast(&self.mtvt[idx]);
        std.log.warn("--After-- mtvt[17] value = 0x{x} (expect 0x{x})\n", .{ slot_word_after.*, isr_jump_address });
    }

    /// Related to the `clicintip[i]` - clic interrupt[i] pending bit. 
    pub inline fn clear_interrupt_pending(self: Self, config: Clic.ClicConfig, interrupt: *const Interrupt) void {
        if (config.SHV and config.trigger_mode == .level){
            // When config have SHV enabled + TriggerMode.level we need to
            // clear the interrupt sources (devices) and not the `clicintip[i]` bit.
            // const register_ip: *volatile u8 = self.byteAddresPtr(.IP, id);
            self.byteAddresPtr(.IP, interrupt.config.mtvt_index).* = 0;
        }else {
            // SHV + edge-triggered (falling_edge or rising_edge), the hardware 
            // is designed to help clearing interrupt pending bits. 
        }
    }

    /// E.g., 0x1002+4*i would represent: `clicintattr[i]`.
    pub inline fn byteAddresPtr(self: Self, ctrl_reg: CTRL_REG, interrupt_id: u6) *volatile u8{
        // const id_offset: usize = (@as(usize, interrupt_id) << 2); // id * 4
        const byte_offset: usize = @intFromEnum(ctrl_reg); // 0..3 
        // const addr: usize = self.CTRL_BASE() + id_offset + byte_offset;
        const addr: usize = self.INT_CTRL_BASE(interrupt_id) + byte_offset;
        return @ptrFromInt(addr);
    }

    /// CTRL_BASE + interrupt_id*4 → (0x2080_0000 + 0x0000_1000) + interupt_id * 4
    pub fn interruptCtrlAddress(self: Self, interrupt_id: u6) usize{
        return self.INT_CTRL_BASE(interrupt_id);
    }

    pub fn readInterruptCtrl(self: Self, interrupt_id: u6) u32{
        const ctrl_base = self.INT_CTRL_BASE(interrupt_id);
        const ctrl_ptr: *volatile u32 = @ptrFromInt(ctrl_base);
        return ctrl_ptr.*;
    }

    /// Represent the various bits associated to the `CTRL_BASE` + (i) * 4.
    /// Where (i) = interrupt_id. Each of these registers are 8-bits. 
    pub const CTRL_REG = enum(u8){
        /// Interrupt pending register bit - `clicintip[i]`.
        IP = 0, 
        /// Interrupt enable bit - `clicintie[i]`.
        IE = 1,
        /// This is the "Interrupt Attribute" register for specifying various 
        /// attributes for the target interrupt(i) - `clicintattr[i]`. 
        ATTR = 2,
        /// Represent the register and control bits, that sets 
        /// the interrupt(i) priority and level - `clicintctl[i]`.
        CTL = 3,

        // pub inline fn byteAddresPtr(self: Clic, ctrl_reg: CTRL_REG, interrupt_id: u6) *volatile u8{
        //     const id_offset: usize = (@as(usize, interrupt_id) << 2); // id * 4
        //     const byte_offset: usize = @intFromEnum(ctrl_reg); // 0..3 
        //     const addr: usize = self.CTRL_BASE() + id_offset + byte_offset;
        //     return @ptrFromInt(addr);
        // }
        //
        // /// CTRL_BASE + interrupt_id*4 → (0x2080_0000 + 0x0000_1000) + interupt_id * 4
        // /// E.g., 0x1002+4*i would represent: `clicintattr[i]`.
        // pub fn registerAddress(self: Clic, ctrl_reg: CTRL_REG, interrupt_id: u6) usize{
        //     const id_offset: usize = (@as(usize, interrupt_id) << 2); // id * 4
        //     const byte_offset: usize = @intFromEnum(ctrl_reg); // 0..3 
        //     return self.CTRL_BASE() + id_offset + byte_offset;
        // }

        pub const ATTR_BIT = enum(u8){
            /// The `shv` field is for selecting if the interrupt should be
            /// hardware vectored (bit[0] = 1) or non-vectored (bit[0] = 0).
            SHV = 0,
            /// Bit position [2:1], is for setting the `trigger type` and 
            /// polarity for the interrupt(i) input.
            TRIG = 1,
            /// - bit [7:6]: Mode → 0b11 = machine mode, 0b01 = supervisor mode, 0b00 = user mode.
            MODE = 6,

            /// The bits in the u8 byte, where: 
            /// Bit position bit[0] = SHV, bit[2:1] = TRIG, bit[5:3] = RESERVED, bit[7:6] = MODE.
            pub fn indexOf(self: ATTR_BIT) u8{
                return switch (self) {.SHV => 0, .TRIG => 1, .MODE => 6};
            }

            pub const PrivilegeMode = enum(u2){
                user = 0b00,
                supervisor = 0b01,
                machine = 0b11,
            };
        };

        inline fn levelCTL(level: u3) u8 {
            return @as(u8, level) << 5; 
        }

    };

    /// Generic CTL encoder (works for any nlbits/ctlbits).
    /// Encoding the interrupt preemption priority level, is done 
    /// using the bits[7:6] in `clicintctl[i]`. 
    /// ================================================================
    /// ```NOTE
    /// The default on ESP32-P4,`NLBITS` = 3, means no priority bits. 
    /// Hence, if CTL = 0b1100_0000, (`NLBITS` = 3), preemption is 
    /// decided by the ID (higher means more important).
    /// We can think of the level, as the preemption rank. 
    /// So an interrupt handler can only be preempted by an interrupt 
    /// with a higher level in the same privilege mode. 
    /// ================================================================
    /// ```OBS: 
    /// • *Level* controls the *preemption* and *threshold masking*.
    /// • *Priority* - is only considered within the same preemption level.
    ///                It never overrides levels! The priority bits are the 
    ///                remaining LSBs in `clicintctl`, after setting the 
    ///                level bits. 
    /// ================================================================
    inline fn encodeCtl(level: u8, priority: u8, nlbits: u3, ctlbits: u4) u8 {
        const E: u4 = ctlbits;
        const lvlw:   u4 = @min(@as(u4, nlbits), E);
        const priow:  u4 = if (E > lvlw) (E - lvlw) else 0;

        // Masks
        const lvl_mask:  u8 = if (lvlw  == 0) 0 else (@as(u8, (1 << lvlw)  - 1));
        const prio_mask: u8 = if (priow == 0) 0 else (@as(u8, (1 << priow) - 1));

        // Clip inputs to widths
        const lv = level & lvl_mask;
        const pr = priority & prio_mask;

        // Pack [level | priority] into E bits, then left-justify to MSBs
        const packed_bits: u8 = (lv << @intCast(priow)) | pr;
        const left_justified: u8 = packed_bits << @intCast(8 - E);

        // For E < 8, spec says low bits read as 1s; write them as 1s too.
        const low_ones: u8 = if (E == 8) 0 else (@as(u8, (1 << (8 - E)) - 1));

        return left_justified | low_ones;
    }

    /// Bits [7:5] representing the level in `clicintctl[i].level`
    /// P4 default: nlbits=3, ctlbits=3 -> ctl byte is (level << 5)
    pub fn setLevel(self: Self, interrupt_id: u6, level: u3) void {
        const byte_ptr = self.byteAddresPtr(.CTL, interrupt_id);
        byte_ptr.* = CTRL_REG.CTL.levelCTL(level);
    }

    /// Getting the level, by logical shift the byte 5 places to the right. 
    pub inline fn getLevel(self: Self, interrupt_id: u6) u8{
        const byte_ptr = self.byteAddresPtr(.CTL, interrupt_id);
        // E.g., 0b1100_0000 >> 5 → 0b0000_0110 = 6.
        return (byte_ptr.* >> 5);
    }


    /// For setting up the interrupt[i] and the 8-bit `clicintctl[i]` register.
    /// The default `cliccfg.nlbits` (how many MSBs are "level") is default to 3.
    /// Meaning bits[7:4] of `clicintctl[i]`.
    /// The CTRL register have the following layout: 
    /// - Bits[31:0]: INT_CTRL - CLIC_BASE + CTRL_OFFSET → 0x2080_1000 (reg address of INT_CTRL).
    /// - Bit 0: Interrupt Pending Bit - `clicintip[i]`,
    /// - Bit 8: Interrupt Enable Bit - `clicintie[i]`,
    /// - Bit 16: SHV Attribute - `clicintattr[i].shv`
    /// - Bit [18:17]: Trigger Attribute  - `clicintattr[i].trig`
    /// - Bit [23:22]: Mode Attribute  - `clicintattr[i].mode`
    /// - Bits [31:24]: Control bits (CTL) - `clicintctl[i]`
    /// ------------------------------------------------------
    pub fn setup_interrupt_source(self: Self, interrupt_ctx: *const Interrupt) void {
        std.log.info("Running 'setup_interrupt'...\n", .{});
        self.configure_attr_register(interrupt_ctx); // `clicintattr[i]`

        self.setupCTL(interrupt_ctx);
        
        // clear interrupt pending bit. 
        self.byteAddresPtr(.IP, interrupt_ctx.config.mtvt_index).* = 0;
        // self.clear_interrupt_pending(Clic.DefaultConfig, interrupt_ctx.config.mtvt_index);
        

    }

    /// `clicintctl` are at bitpos: [31:24] or at the Most-Significant Byte (u8).
    fn setupCTL(self: Self, interrupt_ctx: *const Interrupt) void {
        const id = interrupt_ctx.config.mtvt_index; // 16..47
        const priority: u8 = interrupt_ctx.config.priority orelse DefaultConfig.priority;
        const level = interrupt_ctx.config.level;
        const ctlbits: u3 = 3; 

        const ctl = encodeCtl(level, priority, DefaultConfig.cliccfg_nlbits, ctlbits);

        const ctl_reg_before = self.byteAddresPtr(.CTL, id).*;

        self.byteAddresPtr(.CTL, id).* = ctl;

        const ctl_reg_after = self.byteAddresPtr(.CTL, id).*;

        if (builtin.mode == .Debug){
            std.log.info("clicintctl[i] Before → After: 0b{b} → 0b{b}\n", .{ctl_reg_before, ctl_reg_after});
        }
    }

    pub fn enableInterruptAt(self: Self, interrupt: *const Interrupt) void {
        // const address_ie = CTRL_REG.IE.registerAddress(interrupt_id);
        // const register_ie: *volatile u8 = @ptrFromInt(address_ie);
        // const address_ie = self.registerAddress(.IE, interrupt_id);
        // CTRL_REG.IE.byteAddresPtr(interrupt_id).* = 1; 
        // if((register_ie.* >> 8) & 1 != 0){} // interrupt is enabled.
        
        const register_ie: *volatile u8 = self.byteAddresPtr(.IE, interrupt.config.mtvt_index);
        const before = register_ie.*;
        self.byteAddresPtr(.IE, interrupt.config.mtvt_index).* = 1;

        if (builtin.mode == .Debug){
            std.log.info("clicintie[i] Before → After: 0b{b} → 0b{b} \n", .{before, register_ie.*});
        }
    }

    fn configure_attr_register(self: Self, interrupt_ctx: *const Interrupt) void {
        const id = interrupt_ctx.config.mtvt_index; // 16..47
        const trigger_mode = interrupt_ctx.config.trigger_mode orelse DefaultConfig.trigger_mode;

        var register_attr = self.byteAddresPtr(.ATTR, id).*;
        const attr_before = register_attr;
        
        // clicintattr[i].shv = 1

        // SHV bit[0]
        if (DefaultConfig.SHV){
            register_attr |=  1 << 0;
        }else {
            register_attr &= ~(1 << 0);
        }
        // TRIG bits [2:1]
        register_attr &= ~(@as(u8, 0b11) << 1); // clear bits [2:1]: 0bxxxx_x11x → 0bxxxx_x00x

        // level-triggered: 0b00, rising_edge: 0b01, falling_edge: 0b11.
        const trigger_bits = trigger_mode.as_u8();
        const shift_amount: std.math.Log2Int(u8) = @intCast(CTRL_REG.ATTR_BIT.TRIG.indexOf());
        
        // register_attr |= trigger_bits << shift_amount;
        register_attr |= (trigger_bits & 0b11) << shift_amount;

        self.byteAddresPtr(.ATTR, id).* = register_attr; 

        if (builtin.mode == .Debug){
            std.log.warn("Checking post configuration of clicintattr[{d}]\n", .{id});
            std.log.info("clicintattr[i] Before → After: 0b{b} → 0b{b} \n", .{attr_before, register_attr});
        }
    }
};

// Contain 32 HP CPU0/CPU1 Interrupt signals (origin from the peripheral).
// Configuring and assigning interrupt sources to HP CPU0 signal kinds,
// are done in the `HP CPU0 interrupt register` → InterruptMatrixBase + offset.


/// - 0b00 → Level Triggered.
/// - 0b01 → Rising Edge Triggered.
/// - 0b11 → Falling Edge Triggered.
pub const TriggerMode = enum {
    level, 
    rising_edge,
    falling_edge,

    pub fn as_u8(self: TriggerMode) u8{
        return switch(self){
            .level => 0b0000_0000,
            .rising_edge => 0b0000_0001,
            .falling_edge => 0b0000_0011,
        };
    }
};

pub const InterruptControllerMode = enum(u2) {
    direct = 0b00,
    vectored = 0b01,
    clic = 0b11,

    pub fn integer(self: InterruptControllerMode) u2 {
        return switch (self) {
            .direct => 0b00,
            .vectored => 0b01,
            .clic => 0b11,
        };
    }
};

pub const InterruptSignalCPU = enum(u6) {
    ABC, 

    /// Maps/cast `InterruptSignalCPU` into associated index in our 
    /// interrupt vector table in memory. Note that the index of the 
    /// HP CPU interrupts is valid between indices 16~47.
    pub fn intoIndex(self: InterruptSignalCPU) usize {
        _ = self; 
        // 0x004C = 76
        // 0x0054 = 84
    }
};


/// The user can configure HP CPU0 interrupt registers to assign peripheral 
/// interrupt sources to HP CPU0. Respectively to the second core to HP CPU1. 
/// ESP32-P4 currently has 126 peripheral interrupt sources in total. 
pub const PeripheralInterruptSources =  enum{
     LP_RTC_INTR_SOURCE,
     LP_WDT_INTR_SOURCE, 
     LP_TIMER_REG0_INTR_SOURCE, 
     LP_TIMER_REG1_INTR_SOURCE, 
     MB_LP_INTR_SOURCE, 
     MB_HP_INTR_SOURCE, 
     PMU_0_INTR_SOURCE, 
     PMU_1_INTR_SOURCE, 
     LP_ANAPERI_INTR_SOURCE, 
     LP_ADC_INTR_SOURCE, 
     LP_GPIO_INTR_SOURCE, 
     LP_I2C_INTR_SOURCE, 
     LP_I2S_INTR_SOURCE, 
     LP_SPI_INTR_SOURCE, 
     LP_TOUCH_INTR_SOURCE, 
     LP_TSENS_INTR_SOURCE, 
     LP_UART_INTR_SOURCE, 
     LP_EFUSE_INTR_SOURCE, 
     LP_SW_INTR_SOURCE, 
     LP_SYSREG_INTR_SOURCE, 
     RESERVED_20, 
     SYS_ICM_INTR_SOURCE, 
     USB_SERIAL_JTAG_INTR_SOURCE, 
     SDIO_HOST_INTR_SOURCE, 
     DW_GDMA_INTR_SOURCE, 
     SPI2_INTR_SOURCE, 
     SPI3_INTR_SOURCE, 
     I2S0_INTR_SOURCE, 
     I2S1_INTR_SOURCE, 
     I2S2_INTR_SOURCE, 
     UHCI0_INTR_SOURCE, 
     UART0_INTR_SOURCE, 
     UART1_INTR_SOURCE, 
     UART2_INTR_SOURCE, 
     UART3_INTR_SOURCE, 
     UART4_INTR_SOURCE, 
     LCD_CAM_INTR_SOURCE, 
     ADC_INTR_SOURCE, 
     PWM0_INTR_SOURCE, 
     PWM1_INTR_SOURCE, 
     TWAI0_INTR_SOURCE, 
     TWAI1_INTR_SOURCE, 
     TWAI2_INTR_SOURCE, 
     RMT_INTR_SOURCE, 
     I2C0_INTR_SOURCE, 
     I2C1_INTR_SOURCE, 
     TG0_T0_INTR_SOURCE, 
     TG0_T1_INTR_SOURCE, 
     TG0_WDT_LEVEL_INTR_SOURCE, 
     TG1_T0_INTR_SOURCE, 
     TG1_T1_INTR_SOURCE, 
     TG1_WDT_LEVEL_INTR_SOURCE, 
     LEDC_INTR_SOURCE, 
     SYSTIMER_TARGET0_INTR_SOURCE, 
     SYSTIMER_TARGET1_INTR_SOURCE, 
     SYSTIMER_TARGET2_INTR_SOURCE, 
     AHB_PDMA_IN_CH0_INTR_SOURCE, 
     AHB_PDMA_IN_CH1_INTR_SOURCE, 
     AHB_PDMA_IN_CH2_INTR_SOURCE, 
     AHB_PDMA_OUT_CH0_INTR_SOURCE, 
     AHB_PDMA_OUT_CH1_INTR_SOURCE, 
     AHB_PDMA_OUT_CH2_INTR_SOURCE, 
     AXI_PDMA_IN_CH0_INTR_SOURCE, 
     AXI_PDMA_IN_CH1_INTR_SOURCE, 
     AXI_PDMA_IN_CH2_INTR_SOURCE, 
     AXI_PDMA_OUT_CH0_INTR_SOURCE, 
     AXI_PDMA_OUT_CH1_INTR_SOURCE, 
     AXI_PDMA_OUT_CH2_INTR_SOURCE, 
     RSA_INTR_SOURCE, 
     AES_INTR_SOURCE, 
     SHA_INTR_SOURCE, 
     ECC_INTR_SOURCE, 
     ECDSA_INTR_SOURCE, 
     RESERVED_73, 
     GPIO_INTR0_SOURCE, 
     GPIO_INTR1_SOURCE, 
     GPIO_INTR2_SOURCE, 
     GPIO_INTR3_SOURCE, 
     GPIO_PAD_COMP_INTR_SOURCE, 
     FROM_CPU_INTR0_SOURCE, 
     FROM_CPU_INTR1_SOURCE, 
     FROM_CPU_INTR2_SOURCE, 
     FROM_CPU_INTR3_SOURCE, 
     RESERVED_83, 
     MSPI_INTR_SOURCE, 
     CSI_BRIDGE_INTR_SOURCE, 
     DSI_BRIDGE_INTR_SOURCE, 
     CSI_INTR_SOURCE, 
     DSI_INTR_SOURCE, 
     GMII_PHY_INTR_SOURCE, 
     LPI_INTR_SOURCE, 
     PMT_INTR_SOURCE, 
     ETH_MAC_INTR_SOURCE, 
     USB_OTG_INTR_SOURCE, 
     USB_OTG_ENDP_MULTI_PROC_INTR_SOURCE, 
     JPEG_INTR_SOURCE, 
     PPA_INTR_SOURCE, 
     CORE0_TRACE_INTR_SOURCE, 
     CORE1_TRACE_INTR_SOURCE, 
     RESERVED_99, 
     ISP_INTR_SOURCE, 
     I3C_MST_INTR_SOURCE, 
     I3C_SLV_INTR_SOURCE, 
     USB_OTG11_CH0_INTR_SOURCE, 
     DMA2D_IN_CH0_INTR_SOURCE, 
     DMA2D_IN_CH1_INTR_SOURCE, 
     DMA2D_OUT_CH0_INTR_SOURCE, 
     DMA2D_OUT_CH1_INTR_SOURCE, 
     DMA2D_OUT_CH2_INTR_SOURCE, 
     PSRAM_MSPI_INTR_SOURCE, 
     HP_SYSREG_INTR_SOURCE, 
     PCNT_INTR_SOURCE, 
     RESERVED_112, 
     HP_PARLIO_RX_INTR_SOURCE, 
     HP_PARLIO_TX_INTR_SOURCE, 
     H264_DMA2D_OUT_CH0_INTR_SOURCE, 
     H264_DMA2D_OUT_CH1_INTR_SOURCE, 
     H264_DMA2D_OUT_CH2_INTR_SOURCE, 
     H264_DMA2D_OUT_CH3_INTR_SOURCE, 
     H264_DMA2D_OUT_CH4_INTR_SOURCE, 
     H264_DMA2D_IN_CH0_INTR_SOURCE, 
     H264_DMA2D_IN_CH1_INTR_SOURCE, 
     H264_DMA2D_IN_CH2_INTR_SOURCE, 
     H264_DMA2D_IN_CH3_INTR_SOURCE, 
     H264_DMA2D_IN_CH4_INTR_SOURCE, 
     H264_DMA2D_IN_CH5_INTR_SOURCE, 
     H264_REG_INTR_SOURCE, 
     ASSIST_DEBUG_INTR_SOURCE, 
};

