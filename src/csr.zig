const std = @import("std");

/// CSR related registers. For more information about interrupts, 
/// check: `esp32-p4_technical_reference_manual_en.pdf#section.2.4`.
/// -------------------------------------
/// ```NOTE - Inline Assembly:
/// asm asm-qualifiers ( AssemblerTemplate 
///                 : OutputOperands 
///                 [ : InputOperands
///                 [ : Clobbers ] ])
/// → asm(code : output operand list : input operand list : clobber list);
/// -------------------------------------
pub const CSR = enum(u32) {
    fcsr = 0x003,
    /// IMPORTANT: Write a 1 at bit[3] = MIE, to enable machine global interrupt.
    mstatus = 0x300,
    misa = 0x301,
    /// Write 1 at bit 30 to enable HP interrupt. 
    /// The `mie` CSR register is for enabling a specific
    /// interrupt n. After interrupt source "n" is enabled,
    /// the interrupt should be configured to send an 
    /// interrupt signal to the CPU. 
    mie = 0x304,
    /// Write 0x1 at bit[1:0] for setting machine mode to vectored. 
    /// OBS: When using CLIC we instead write mode field to 3, which 
    /// would treat `mtvt + 4 * interrupt_id` as the service entry 
    /// address for HW vectored interrupts. 
    mtvec = 0x305,
    /// CSR to set the interrupt jump table address. 
    mtvt = 0x307,
    mcountinhibit = 0x320,
    mcycle = 0xB00,
    mcycleh = 0xB80,
    minstret = 0xB02,
    minstreth = 0xB82,
    mscratch = 0x340,
    /// Configures the machine trap/exception program counter. 
    mepc = 0x341,
    /// Bits[4:0] - Exception Code 
    /// 0x2: Illegal instruction, 
    /// 0x3: HW breakpoint or EBREAK, 
    /// 0x6: Missaligned atomic instruction,
    /// Bit[31] - Interrupt Flag.
    mcause = 0x342,
    mtval = 0x343, 
    /// Machine Interrupt Pending, bit[30] → HP_IP
    mip = 0x344,
    /// OBS, the `mintstatus` CSR is located at 0x346 instead of the original 0xFB1!
    mintstatus = 0x346,

    /// Configures the state of the PIE extension.
    /// Bits[1:0]:
    /// 0x0 = OFF,
    /// 0x1 = INITIAL,
    /// 0x2 = CLEAN,
    /// 0x3 = DIRTY,
    /// To enable PIE extension do the following:
    /// 1. set the `mext_pie_status.STATE` bits to the INITIAL(0b01) state.
    /// 2. Use the PIE instruction to initialize the PIE register file 
    /// and accumulator register to zero, which will cause the `mext_pie_status.STATE`
    /// bits to change to DIRTY(0b11) automatically
    /// 3. Set the `mext_pie_status.STATE` bits to CLEAN(0b10)
    /// 4. Execute program! 
    mext_pie_status = 0x7F2,

    mhwloop_state_reg = 0x7F1,
    mhwloop0_start = 0x7C6,
    mhwloop0_end = 0x7C7,
    mhwloop0_count = 0x7C8,

    pub const Toggle = enum(u1){
        On = 0b1,
        Off = 0b0,
    };

    pub inline fn intoU32(self: CSR) u32{
        return @intFromEnum(self);
    }

    pub inline fn intoName(comptime self: CSR) [:0]const u8{
        return comptime switch (self) {
            .fcsr => "fcsr",
            .mstatus => "mstatus",
            .misa => "misa",
            .mie => "mie",
            .mtvec => "mtvec",
            .mtvt => "mtvt",
            .mcountinhibit => "mcountinhibit",
            .mcycle => "mcycle",
            .mcycleh => "mcycleh",
            .minstret => "minstret",
            .minstreth => "minstreth",
            .mscratch => "mscratch",
            .mepc => "mepc",
            .mcause => "mcause",
            .mtval => "mtval",
            .mip => "mip",
            .mintstatus => "mintstatus",
            .mext_pie_status => "mext_pie_status",
            .mhwloop_state_reg => "mhwloop_state_reg",
        };
    }

    pub inline fn write_csrw(self: CSR, value: u32) void {
        const csr = comptime self.intoU32();
        if (self == .mstatus){
            asm volatile ("csrw mstatus, %[value]" :: [value] "r" (value));
        }else{
            const csrw_instruction = std.fmt.comptimePrint("csrw 0x{x}, %[value]", .{csr});
            asm volatile (csrw_instruction :: [value] "r" (value));
        }

    }
    
    pub inline fn setClear(self: CSR, toggle: Toggle, bits: u32) void{
        switch (toggle) {
            .On => self.set_csrs(bits),
            .Off => self.clear_csrc(bits),
        }
    }

    pub inline fn read_csrr(self: CSR) u32 {
        const csr = comptime self.intoU32();
        const csrr_instruction = std.fmt.comptimePrint("csrr %[value], {}", .{csr});
        return asm volatile (csrr_instruction : [value] "=r" (-> u32));
    }

    pub inline fn set_csrs(self: CSR, bits: u32) void {
        const csr = comptime self.intoU32();
        const csrs_instruction = std.fmt.comptimePrint("csrs {}, %[bits]", .{csr});
        asm volatile (csrs_instruction :: [bits] "r" (bits));
    }

    pub inline fn clear_csrc(self: CSR, bits: u32) void {
        const csr = comptime self.intoU32();
        const csrc_instruction = std.fmt.comptimePrint("csrc {}, %[bits]", .{csr});
        asm volatile (csrc_instruction :: [bits] "r" (bits));
    }

    /// Clears the bits specified by the immediate mask in the target CSR.
    /// E.g., `csrci mstatus, 0x08` would clear the bit at bit position 3, 
    /// which would clear the `MIE` bit and disable global interrupts. 
    /// ```NOTE:
    /// When using `csrci` it need to fit in u5 (5 bits).
    pub inline fn clear_intermediate(self: CSR, imm_mask: u5) void{
        const csr = comptime self.intoU32();
        const csrci_instruction = std.fmt.comptimePrint("csrci {}, %[bits]", .{csr});
        asm volatile (csrci_instruction :: [bits] "r" (imm_mask));
        
    }

    /// Invokes the CSR `csrrci` for disabling interrupts  
    /// by clearing the MIE-bit at bit-position 3.
    pub inline fn clear_interrupt(self: CSR) void {
        if (self == .mstatus){
            const mie: u32 = self.read_csrr() | @as(u32, 1) << 3;
            asm volatile ("csrrci x0, mstatus, %[mie]" :: [mie] "r" (mie));
            
        }else{
            const mie: u32 = CSR.mstatus.read_csrr() | @as(u32, 1) << 3;
            asm volatile ("csrrci x0, mstatus, %[mie]" :: [mie] "r" (mie));
        }
    }

    /// This instruction invokes the CSR `csrrsi`, that will 
    /// gather interrupt details, and enable interrupts. 
    pub inline fn interrupt_info_enable(_: CSR) void {
        const mie: u32 = CSR.mstatus.read_csrr() | @as(u32, 1) << 3;
        asm volatile ("csrrsi a0, mnxti, %[mie]" :: [mie] "r" (mie));
        
    }

    pub fn initPIE() void{
        CSR.mext_pie_status.write_csrw(0x1); // INITIAL
        
        // Execute at least one valid pie instruction - DIRTY
        asm volatile ("esp.vclr q0");

        // Set the mext_pie_status.STATE to CLEAN(0b10)
        CSR.mext_pie_status.write_csrw(0x2);
    }

    /// STATE bits: 0=OFF, 1=INITIAL, 2=CLEAN, 3=DIRTY.
    pub fn initHwLoop() void{
        CSR.mhwloop_state_reg.write_csrw(0x2); // CLEAN
    }

};

