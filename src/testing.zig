const std = @import("std");
const interrupts = @import("interrupts.zig");
const startup = @import("startup.zig");
const Testing = @This();

const Interrupt = interrupts.Interrupt;
const TriggerMode = interrupts.TriggerMode;
const PeripheralInterruptSources = interrupts.PeripheralInterruptSources;
const Clic = interrupts.Clic; 

const ISRHandlers = startup.ISRHandlers;
const INTERRUPT = startup.INTERRUPT;
const ISR = startup.ISR;

const Handler = struct {name: []const u8, func: ISR};

fn systimer_target0_isr() callconv(INTERRUPT) void {
    // Below is the override logic of the .weak isr symbol.
    // This is our trap handler and should not return. 
    while (true) {}
}


pub fn interrupt_init_test() void {
    const isr_name = "systimer_target0_isr";
    const isr_handler = Handler{.name = isr_name, .func = systimer_target0_isr};
    std.log.info("Hello from 'interrupt_init_test'!\r\n", .{});

    var dummy_interrupt = try Interrupt.init(.{
        .trigger_mode = TriggerMode.level,
        .id = 1, // 0..31
        .level = null,
        .source = PeripheralInterruptSources.SYSTIMER_TARGET0_INTR_SOURCE, 
        .threshold = null,
    });

    if(!(@hasDecl(ISRHandlers, "systimer_target0_isr"))){
        std.log.err("systimer_target0_isr was not found in ISRHandlers!\n", .{});
    }
    if(!(@hasDecl(ISRHandlers, "systimer_target0_faulty"))){
        std.log.err("systimer_target0_faulty was not found in ISRHandlers!\n", .{});
    }
    dummy_interrupt.isr = isr_handler.func;
}

fn test_configure_attr_register(interrupt_ctx: *const Interrupt) u8 {
    const clic = Clic.init_default();
    const DefaultConfig = clic.DefaultConfig;
    const id = interrupt_ctx.mtvt_index; // 16..47
    const trigger_mode = interrupt_ctx.trigger_mode orelse DefaultConfig.trigger_mode;

    // var register_attr = clic.CTRL_REG.ATTR.byteAddresPtr(id).*;
    var register_attr = clic.byteAddresPtr(.ATTR, id);
    std.log.info("Before modifying CTRL_REG.ATTR.byteAddresPtr(id).*: 0b{b}\n", .{register_attr.*});
    
    // SHV bit[0]
    if (DefaultConfig.SHV){
        register_attr |=  1 << 0;
    }else {
        register_attr &= ~(1 << 0);
    }
    // TRIG bits [2:1]
    register_attr &= ~(@as(u8, 0b11) << 1); // clear bits [2:1]: 0bxxxx_x11x → 0bxxxx_x00x
    std.log.info("After TRIG clear of CTRL_REG.ATTR.byteAddresPtr(id).*: 0b{b}\n", .{register_attr});

    // level-triggered: 0b00, rising_edge: 0b01, falling_edge: 0b11.
    const trigger_bits: u8 = switch (trigger_mode) { 
        .level => 0b00, 
        .rising_edge => 0b01, 
        .falling_edge => 0b11 
    };

    register_attr |= trigger_bits << 1;
    return register_attr; 
}

pub fn test_clic() void{
    const clic = Clic.init_default();
    const dummy_interrupt = try Interrupt.init(.{
        .trigger_mode = TriggerMode.level,
        .id = 1, // 0..31
        .isr = systimer_target0_isr,
        .priority = null, 
        .level = 1,
        .source = PeripheralInterruptSources.SYSTIMER_TARGET0_INTR_SOURCE, 
        .threshold = null,
    });

    std.log.info("Hello from 'test_clic'!!!!\n", .{});

    const mtvt_id: u6 = dummy_interrupt.mtvt_index; // 16..47
    if(!(mtvt_id > 15 and mtvt_id <= 47)){
        std.log.err("mtvt_id FAILED with: {d}, should be 15 < mtvt_id < 48\n", .{mtvt_id});
    }else {
        std.log.info("mtvt_id SUCCESS with: {d}, satisfying 15 < mtvt_id < 48\n", .{mtvt_id});
    }
    // clic.assignInterruptSource(dummy_interrupt);
    // const map_reg: *volatile u32 = try clic.fromSourceIntoMappingRegister(.SYSTIMER_TARGET0_INTR_SOURCE).*;
    var is_ok: bool = true;
    const map_reg = dummy_interrupt.fromSourceIntoMappingRegister() catch err_blk:{
        std.log.err("fromSourceIntoMappingRegister FAILED\n", .{});
        is_ok = false;
        break :err_blk @as(usize, 0);
    };
   
    const map_reg_ptr: *volatile u32 = @ptrFromInt(map_reg);
    const map_register_value: u32 = map_reg_ptr.*;
    if (is_ok){
        std.log.info("fromSourceIntoMappingRegister SUCCESS: Fn output: 0x{x} Ptr: {*}, Map Register Value: 0b{b} = 0x{x}\n", .{@as(u32, map_reg), map_reg_ptr, map_register_value, map_register_value});
    }

    // #define BYTE_CLIC_INT_IE_REG(i)          (DR_REG_CLIC_CTRL_BASE + 1 + (i) * 4)
    const ie_addr = clic.CTRL_REG.IE.registerAddress(mtvt_id);
    std.log.warn("AFTER trying execute of CTRL_REG.IE.registerAddress!!!\n", .{});

    // #define BYTE_CLIC_INT_ATTR_REG(i)          (DR_REG_CLIC_CTRL_BASE + 2 + (i) * 4)
    const attr_addr = clic.CTRL_REG.ATTR.registerAddress(mtvt_id);
    std.log.warn("AFTER trying execute of CTRL_REG.ATTR.registerAddress!!!\n", .{});

    // #define BYTE_CLIC_INT_CTL_REG(i)          (DR_REG_CLIC_CTRL_BASE + 3 + (i) * 4)
    const ctl_addr = clic.CTRL_REG.CTL.registerAddress(mtvt_id);
    std.log.warn("AFTER trying execute of CTRL_REG.CTL.registerAddress!!!\n", .{});

    std.log.info("CTRL_REG.IE.registerAddress() got: 0x{x}\n", .{ie_addr});
    std.log.info("CTRL_REG.ATTR.registerAddress() got: 0x{x}\n", .{attr_addr});
    std.log.info("CTRL_REG.CTL.registerAddress() got: 0x{x}\n", .{ctl_addr});

    std.log.warn("Before trying to execute 'test_configure_attr_register!!!\n", .{});
    const config_mask = test_configure_attr_register(&dummy_interrupt);

    // FINAL MASK:      0b11000001 → OK.
    std.log.info("Final Mask of prior writing to clicintattr[i]: 0b{b}\n", .{config_mask});
}

