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

    pub const Toggle = enum(u1){
        On = 0b1,
        Off = 0b0,
    };

    pub inline fn intoU32(self: CSR) u32{
        return @intFromEnum(self);
    }

    pub inline fn intoName(comptime self: CSR) [:0]const u8{
        return comptime switch (self) {
            .mstatus => "mstatus",
            .misa => "misa",
            .mie => "mie",
            .mtvec => "mtvec",
            .mtvt => "mtvt",
            .mcountinhibit => "mcountinhibit",
            .mcycle => "mcycle",
            .mscratch => "mscratch",
            .mepc => "mepc",
            .mcause => "mcause",
            .mtval => "mtval",
            .mip => "mip",
            .mintstatus => "mintstatus",
        };
    }

    pub inline fn write_csrw(self: CSR, value: u32) void {
        const csr = comptime self.intoU32();
        const csr_name = comptime self.intoName();
        if (self == .mstatus){
            // const csrw_instruction = std.fmt.comptimePrint("csrw {s}, %[value] ... %[value] = 0b{b}", .{csr_name, value});
            // std.log.warn("csrw {s}, %[value] ... %[value] = 0b{b}\n", .{csr_name, value});
            asm volatile ("csrw mstatus, %[value]" :: [value] "r" (value));
            
            const after = self.read_csrr();
            std.log.warn("After write to {s}: 0b{b}\n", .{csr_name, after});
        }else{
            const csrw_instruction = std.fmt.comptimePrint("csrw 0x{x}, %[value]", .{csr});
            // std.log.warn("Attempting the csrw instruction: {s}\n", .{csrw_instruction});
            asm volatile (csrw_instruction :: [value] "r" (value));
        }

    }
    
    pub inline fn setClear(self: CSR, toggle: Toggle, bits: u32) void{
        switch (toggle) {
            .On => self.set_csrs(bits),
            .Off => self.clear_csrc(bits),
            // .Off => self.clear_intermediate(@as(u5, bits)),
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
        // asm volatile ("csrci mstatus, %[bits]" :: [bits] "r" (imm_mask));
        asm volatile (csrci_instruction :: [bits] "r" (imm_mask));
        
    }

    /// Invokes the CSR `csrrci` for disabling interrupts  
    /// by clearing the MIE-bit at bit-position 3.
    pub inline fn clear_interrupt(self: CSR) void {
        if (self == .mstatus){
            const mie: u32 = self.read_csrr() | @as(u32, 1) << 3;
            asm volatile ("csrrci x0, mstatus, %[mie]" :: [mie] "r" (mie));
            // csrci mstatus, 0x08
            
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

};

