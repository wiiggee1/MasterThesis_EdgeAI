const std = @import("std");
const builtin = @import("builtin");
const Peripheral = @import("peripherals.zig").Peripheral;

extern fn ets_delay_us(us: u32) callconv(.c) void;

pub const DEFAULT_FREQ_HZ: u64 = 16_000_000; 

/// Container type, for handling and setup of systimer related
/// stuff. 
/// Some terminology: 
/// - UNIT0/UNIT1 => refer to the two 52-bit timer counters (16 MHz).
/// - XTAL_CLK / DIV → 16 Mhz (CNT_CLK).
/// - Modes: `period mode` (t1 + δt) and `target mode` (t2 <= t). 

pub const ClockSource = enum {
    XTAL_CLK,
    RC_FAST_CLK,
};

pub const CounterKind = enum {
    UNIT0,
    UNIT1,
};

pub const TargetMode = enum {
    /// Same as "One-Shot" mode, invokes its callback only once. 
    target,
    periodic,
};

pub const Targets = enum {
    target0,
    target1,
    target2,
};

pub const SystemTimerConfig = struct{
    clk: ClockSource = .XTAL_CLK, 
    counter: CounterKind = .UNIT0,
    freq: u64 = DEFAULT_FREQ_HZ, 
    target_mode: TargetMode = .periodic,
    target_num: Targets = .target0, 
    core0_stall_enabled: bool = false,


    pub fn parse_v2(config: anytype) SystemTimerConfig{
        // if (@TypeOf(config) == SystemTimerConfig) return @as(SystemTimerConfig, config);
        var systimer_config: SystemTimerConfig = .{};

        const config_info = @typeInfo(@TypeOf(config)).@"struct";
        // const valid_cfg_fields = @typeInfo(SystemTimerConfig).@"struct".fields;

        inline for(config_info.fields, 0..) |field, i|{
            if (@hasField(SystemTimerConfig, field.name)) {
                const cfg_val = @field(config, field.name);
                const DestinationType = @TypeOf(@field(systimer_config, field.name));
                const CfgFieldType = @TypeOf(cfg_val);
                std.log.info("Arg({d}), name: {s}, value: {any}\n", .{i, field.name, @field(config, field.name)});

                if(CfgFieldType == DestinationType){
                    @field(systimer_config, field.name) = cfg_val;
                }else if (@typeInfo(DestinationType) == .optional and CfgFieldType == @typeInfo(DestinationType).optional.child) {
                    @field(systimer_config, field.name) = cfg_val;
                } else if (@typeInfo(CfgFieldType) == .optional and DestinationType == @typeInfo(CfgFieldType).optional.child) {
                    @field(systimer_config, field.name) = (cfg_val orelse @field(systimer_config, field.name));
                } else if (@typeInfo(DestinationType) == .@"enum" and @typeInfo(CfgFieldType) == .int) {
                    @field(systimer_config, field.name) = @as(DestinationType, @enumFromInt(cfg_val));
                }
            }
        }
        std.log.info("Parsed SystemTimerConfig (v2): {any}\n", .{systimer_config});
        return systimer_config;
    }

};


/// The `SystemTimer` can be describes by the following (ESP32-P4):
/// - Counter (UNIT0 or UNIT1): 0 ... --- time ---→ increasing 52-bit number.
/// - Comparator (Alarm(t) or Periodic): Alarm = 52-bit absolute time, Periodic = 26-bit. 
/// ```NOTE 
/// The comparator compares the absolute 52-bit (t) against the 52-bit counter.
/// While the Alarm Period (δt) is the auto-incremented amount for the next (t) 
/// during periodic mode. 
pub const SystemTimer = struct{
    // pub fn SystemTimer(comptime Config: SystemTimerConfig) type{
    const Self = @This();
    
    const SysTimerRegister = @import("registers.zig").SysTimerRegister;
    const ResetClockRegister = @import("registers.zig").ResetClockRegister;
    const Register = @import("registers.zig").AnyRegister(.SYSTIMER, SysTimerRegister);

    const PERIOD_BITS: u6 = 26;
    const PERIOD_MAX: u32 = (@as(u32, 1) << PERIOD_BITS) - 1;

    const COUNTER_BITS: u6 = 52;
    const Shift = std.math.Log2Int(u64);

    const COUNTER_MASK: u64 = if (COUNTER_BITS == @bitSizeOf(u64))
        ~@as(u64, 0)
    else
        ((@as(u64, 1) << @as(Shift, COUNTER_BITS)) - 1);

    const HALF_RANGE: u64 = @as(u64, 1) << (COUNTER_BITS - 1);

    pub const DEFAULT_FREQ_XTAL = DEFAULT_FREQ_HZ;
    pub const DefaultConfig = SystemTimerConfig{
        .clk = .XTAL_CLK,
        .counter = .UNIT0,
        .freq = DEFAULT_FREQ_HZ,
        .target_mode = .periodic,
        .target_num = .target0,
    };

    register: SysTimerRegister,
    clkrst_register: ResetClockRegister,
    clk_source: ClockSource,
    counter_kind: CounterKind,
    clk_freq: u64,
    target_mode: TargetMode,
    target_num: Targets,
    core0_stall_enabled: bool, 
    timer: ?Timer = null,

    pub const Timer = struct {
        alarm: u64,
        period: u64 = 56,
    };
    
    /// This init, is for overriding with custom non-default config 
    /// settings. If you want default config, set args to null.
    /// "A peripheral can select a high-speed clock source without division for higher
    /// processing speed. In low-power mode, the peripheral can select a low-speed clock source or divide it by a
    /// large divisor to lower power consumption".
    pub fn init(settings: anytype) Self {
        const config: SystemTimerConfig = if(@TypeOf(settings) == SystemTimerConfig) @as(SystemTimerConfig, settings)
            else SystemTimerConfig.parse_v2(settings);

        var self = Self{
            .register = SysTimerRegister{},
            .clkrst_register = ResetClockRegister{},
            .clk_source = config.clk,
            .counter_kind = config.counter,
            .clk_freq = config.freq,
            .target_mode = config.target_mode,
            .target_num = config.target_num,
            .core0_stall_enabled = config.core0_stall_enabled,
            .timer = null,
        };

        self.reset_systimer();

        self.enableAPBClock();

        //1. Select clk source - XTAL_CLK or RC_FAST_CLK.
        self.set_source();
        
        return self;
    }

    pub const TimeInstant = struct{time: u64, unit: TimeUnit};

    pub const TimeUnit = enum {
        Ticks,
        Mili,
        Micro,
        Sec,

        pub fn delay(self: TimeUnit, amount: u32) void {
            const micros = self.asMicroSecond(amount);
            ets_delay_us(micros);
        }

        fn asMicroSecond(self: TimeUnit, amount: u32) u32 {
            return switch (self) {
                .Ticks => amount / 16, // ticks → µs,
                .Micro => amount,
                .Mili => 1000 * amount, // ms → µs
                .Sec => 1_000_000 * amount, // s → µs
            };
        }

    };

    /// Performs: TimeDelta = TimeNow – TimeStart: 
    /// by calling `future_delta()` → return (t - counter_now) & COUNTER_MASK;
    /// Then: while(future_delta(curr_now, start) < DelayTime);
    pub fn delay_us(self: Self, duration_us: TimeInstant) void {
        if (duration_us.time == 0) return;

        const duration_ticks = self.intoDeltaTimeTicks(duration_us);
        if (duration_ticks == 0) return; // nothing to wait (extremely low freq or tiny us)

        // const dt = future_delta(self.now_v2(.Ticks), ticks_start); // → return (t - counter_now) & COUNTER_MASK;
        const ticks_start = self.now_v2(.Ticks).time & COUNTER_MASK;
        while (future_delta(self.now_ticks(), ticks_start) < duration_ticks) {
            asm volatile ("nop");
        }
    }

    fn ceilDiv128(n: u128, d: u128) u64 {
        const q: u128 = (n + d - 1) / d;            // ceil(n/d) for positive ints
        return if (q > std.math.maxInt(u64))        // saturate to u64
            std.math.maxInt(u64)
        else
            @intCast(q);
    }


    pub fn set_delay(_: Self, unit: TimeUnit, amount: u32) void{
        unit.delay(amount);
    }

    /// The HP System Clock have the inputs: 
    /// - `XTAL_CLK` (40 MHz): SRC_SEL = 0,
    /// - `CPLL_CLK` (360 MHz): SRC_SEL = 1,
    /// - `RC_FAST_CLK` (20 MHz): SRC_SEL = 2. 
    /// Into the multiplexter that yields our active `ROOT_CLK`.
    /// The *ROOT_CLK* itself is divided by a series of dividers:
    /// • `CPU_CLK` → dirives HP CPUs and their logic.
    /// • `MEM_CLK` → dirives the internal memories (L2 Cache, L2MEM, ROM) and its logic. 
    /// • `SYS_CLK` → related to the HP high speed bus clock that dirives AXI and AHB bus logic.
    /// • `APB_CLK` → HP low-speed bus block that dirives APB bus logic.
    /// ```CONSTRAINTS:
    /// Maximum frequency: 
    /// • `CPU_CLK`: 360 MHz.
    /// • `MEM_CLK`: 200 MHz.
    /// • `SYS_CLK`: 200 MHz.
    /// • `APB_CLK`: 100 MHz.
    /// ```SETUP:
    /// ...
    /// ```OBS: 
    /// P_SYS_CLKRST_ROOT_CLK_CTRL0/1/2/3_REG will take effect only after
    /// HP_SYS_CLKRST_SOC_CLK_DIV_UPDATE is set.
    pub fn setup_clock(self: Self, timeout_period: TimeInstant) !void{
        self.enable_interrupt(false);

        // self.enable_work(false);
        // enabling of bus block of HP CPU0 CLIC at offset: 0x0014 at CLKRST_SOC_CLK_CTRL0_REG
        
        // 1. Setup the period and synchronize the alarm period to COMPx.
        try self.setup_period(timeout_period);

        // 2. Setup TargetX:
        // - Mode: Target or Period,
        // - Unit selection: UNIT0 or UNIT1.
        self.setupTargetConfig();
        
        self.synchronize_comparator(); // Sets the SYSTIMER_TIMER_COMPx_LOAD bit[0] = 1.

        // 3. Sets the bit-mask settings for the CONF at offset 0x0000 register. 
        // This will also enable the target work by enabling the corresponding COMP. 
        self.setupConfigRegister();
    }

    /// Configure the clock divisior for SYS_CLK:
    pub fn setup_clk_divisor(self: Self) void{

        // 1.1 For e.g., configuring the integer part of the SYS_CLK divisor at bits[31:24].
        // At: self.clkrst_register.HP_SYS_CLKRST_ROOT_CLK_CTRL1.

        // 1.2. Configures e.g., the numerator and denominator for the divisor fraction. 
        // At: self.clkrst_register.HP_SYS_CLKRST_ROOT_CLK_CTRL2

        // 2. When Done, we update the divisor for SYS_CLK 
        // at self.clkrst_register.HP_SYS_CLKRST_ROOT_CLK_CTRL0
        Peripheral.RSTCLK.setBit(self.clkrst_register.HP_SYS_CLKRST_ROOT_CLK_CTRL0);
    }

    pub fn wfi_setup(self: Self) void{
        // const delay_as_clock_cycles
        const delay_mask: u4 = 0b0000; 
        // 0b0000_1111
        Peripheral.RSTCLK.setMask(self.clkrst_register.HP_SYS_CLKRST_ROOT_CLK_CTRL0, @as(u32, delay_mask));

    }

    pub fn reset_systimer(self: Self) void{
        std.log.warn("Resetting the system timer!\n", .{});
        const HP_SYS_CLKRST_RST_EN_STIMER: u6 = @as(u6, 5);
        Peripheral.RSTCLK.setBit(self.clkrst_register.CLKRST_HP_RST_EN1_REG, HP_SYS_CLKRST_RST_EN_STIMER);
        asm volatile ("nop");
        asm volatile ("nop");
        // toggle back to zero!
        Peripheral.RSTCLK.clearBit(self.clkrst_register.CLKRST_HP_RST_EN1_REG, HP_SYS_CLKRST_RST_EN_STIMER);

    }

    /// Select the clk source (XTAL_CLK or RC_FAST_CLK) at: 
    /// Register offset: HP_SYS_CLKRST_PERI_CLK_CTRL21_R
    /// Option bit name: HP_SYS_CLKRST_REG_SYSTIMER_CLK_SRC_SE
    fn set_source(self: Self) void{
        if(Peripheral.RSTCLK.isBitSet(self.clkrst_register.CTRL21_REG, 30) == false){
            Peripheral.RSTCLK.setBit(self.clkrst_register.CTRL21_REG, 30);
        }
        switch (self.clk_source) {
            .XTAL_CLK => {
                Peripheral.RSTCLK.clearBit(self.clkrst_register.CTRL21_REG, 29);
            },
            .RC_FAST_CLK => {
                Peripheral.RSTCLK.setBit(self.clkrst_register.CTRL21_REG, 29);
            },
        }
    }

    fn enableAPBClock(self: Self) void{
        if(Peripheral.RSTCLK.isBitSet(self.clkrst_register.CLKRST_SOC_CLK_CTRL2_REG, 23) == false){
            Peripheral.RSTCLK.setBit(self.clkrst_register.CLKRST_SOC_CLK_CTRL2_REG, 23);
        }
    }

    /// Sets the bit of SYSTIMER_TARGET0_WORK_EN at self.register.CONF.
    /// To start comparing the count value.
    /// target0: bit[24], target1: bit[23], target2: bit[22].
    /// ```NOTE
    /// This will start the comparing directly!
    pub fn enable_work(self: Self, enable: bool) void{
        const bit_index: u6 = switch (self.target_num) {
            .target0 => 24,
            .target1 => 23,
            .target2 => 22,
        };

        if(enable){
            switch (self.counter_kind) {
                .UNIT0 =>{
                    Peripheral.SYSTIMER.setBit(self.register.CONF, 31);
                    Peripheral.SYSTIMER.setBit(self.register.CONF, 30);
                },
                .UNIT1 =>{
                    Peripheral.SYSTIMER.setBit(self.register.CONF, 31);
                    Peripheral.SYSTIMER.setBit(self.register.CONF, 29);
                }
            }
            Peripheral.SYSTIMER.setBit(self.register.CONF, bit_index);
            std.log.info("Succeeded setting bit[{d}] for {s} - Work Enabled!\n", .{bit_index, @tagName(self.target_num)});

        }else{
            switch (self.counter_kind) {
                .UNIT0 =>{
                    Peripheral.SYSTIMER.clearBit(self.register.CONF, 31);
                    // Peripheral.SYSTIMER.clearBit(self.register.CONF, 30); // FIX: Should I clear this during setup_clock or only for COMP?
                },
                .UNIT1 =>{
                    Peripheral.SYSTIMER.clearBit(self.register.CONF, 31);
                    // Peripheral.SYSTIMER.clearBit(self.register.CONF, 29);
                }
            }
            Peripheral.SYSTIMER.clearBit(self.register.CONF, bit_index);
        }
    }

    /// Get the offset for: 
    /// - target0: 0x0034
    /// - target1: 0x0038
    /// - target2: 0x003C
    fn getTargetConfigureOffset(self: Self) u32{
        const offset: u32 = switch (self.target_num) {
            .target0 => self.register.TARGET0_COMP_CONF,
            .target1 => self.register.TARGET1_COMP_CONF,
            .target2 => self.register.TARGET2_COMP_CONF,
        };
        return offset;
    }

    inline fn wrapAdd52Bit(a: u64, b: u64) u64{
        return (a + b) & COUNTER_MASK;
    }

    inline fn future_delta(counter_now: u64, t: u64) u64{
        return (t - counter_now) & COUNTER_MASK;
    }

    inline fn isTimeDueNowOrFuture(now_time: u64, t: u64) bool{
        const delta = future_delta(now_time, t);
        return delta < HALF_RANGE; 
    }

    pub fn setup_period(self: Self, timeout: TimeInstant) !void{
        Peripheral.SYSTIMER.write_register(self.register.TARGET0_COMP_CONF, 0x00);
        switch(self.target_num){
            .target0 => Peripheral.SYSTIMER.write_register(self.register.TARGET0_COMP_CONF, 0x00),
            .target1 => Peripheral.SYSTIMER.write_register(self.register.TARGET1_COMP_CONF, 0x00),
            .target2 => Peripheral.SYSTIMER.write_register(self.register.TARGET2_COMP_CONF, 0x00),
        }
        self.synchronize_comparator();
        // Convert the deadline or future time to ticks (δt)
        const dt = self.intoDeltaTimeTicks(timeout);
        if (dt == 0) return error.BadPeriod;

        const period_full: u64 = if (dt > std.math.maxInt(u64))
            std.math.maxInt(u64)
        else
            @intCast(dt);

        if (period_full == 0 or period_full > PERIOD_MAX)
            return error.PeriodOutOfRange;

        const period_ticks: u32 = @intCast(period_full);
        const future_alarm = self.now_v2(.Ticks).time + @as(u64, period_ticks);

        std.log.warn("(setup_period) timeout: {d} µs into period(δt): {d} ticks, next alarm triggers at approx: ~{d} ticks\n", .{
            timeout.time, 
            period_ticks,
            future_alarm,
        });
            
        self.writePeriod(period_ticks);
        
    }
    
    /// Setup of the timer, will either setup the timer in One-Shot or Periodic mode. 
    /// - 52-bit alarm values (t) and 26-bit alarm periods (δt). 
    /// Alarm triggers at (t1 + δt), assuming t1 = now (52-bit value), and alarm as 26-bit value. 
    /// Next alarm will therfore be at `(t1 + 2 * δt)`.
    /// ```NOTE 
    /// - current count value: t𞁞  
    /// - alarm value: tₜ
    /// When t𞁞 - tₜ >= 2⁵¹ - 1 → Overflow occur, and counter starts over counting up from 0.
    /// Other cases when alarm is triggered: 
    /// (0): t𞁞 - tₜ <= 0 → t𞁞 = tₜ (when same).
    /// (1): 0 <= t𞁞 - tₜ < 2⁵¹ - 1 
    /// (2): t𞁞 < 2⁵¹ and tₜ < 2⁵¹ 
    /// (3): t𞁞 >= 2⁵¹ and tₜ >= 2⁵¹ 
    pub fn setup_timer(self: *Self, timeout: TimeInstant) !void{
        if (self.target_mode == .periodic){
            const counter_now: u64 = self.readCounter() & COUNTER_MASK; // 52-bit now.
            const per_unit: u64 = self.intoTicksFromUnit(timeout.unit);

            // const period_wrapped: u64 = (timeout.time * per_unit) & COUNTER_MASK;
            // const target_time = wrapAdd52Bit(counter_now, timeout.time * per_unit); // absolute 52-bit alarm target.
        
            const dt = self.intoDeltaTimeTicks(timeout);

            const period_ticks: u32 = if (dt > PERIOD_MAX) 
                PERIOD_MAX else @intCast(dt);
            

            std.log.warn("(TimeInstant) timeout: {d} µs vs timeout: {d} ticks\n", .{timeout.time, self.intoTicksFromTimeInstant(timeout)});

            self.writePeriod(period_ticks);
            
            if(builtin.mode == .Debug){
                // const MAX_VALUE_U51: u64 = @as(u64, std.math.maxInt(u51) - 1); 
                // const MAX_VALUE_U52: u64 = @as(u64, std.math.maxInt(u52) - 1); 

                // const MAX_VALUE_U51: u64 = @as(u64, std.math.maxInt(u51)); 
                // const MAX_VALUE_U52: u64 = @as(u64, std.math.maxInt(u52)); 
                // std.log.info("COUNTER_MASK = 0x{x}, MAX_VALUE_U52: 0x{x}, MAX_VALUE_U51: 0x{x}\n", .{COUNTER_MASK, MAX_VALUE_U52, MAX_VALUE_U51});
                
                // JUST FOR DEBUGGING --------------------------
                const ticks_as_us = TimeUnit.Ticks.asMicroSecond(period_ticks);
                const given_timeout = wrapAdd52Bit(@as(u64, 0), timeout.time * per_unit); // JUST FOR DEBUGGING SANITY CHECK!
                const now_wrapped = wrapAdd52Bit(@as(u64, 0), counter_now); // JUST FOR DEBUGGING SANITY CHECK!
                
                const timeout_ticks: u32 = if ((given_timeout) > PERIOD_MAX) 
                    PERIOD_MAX else @intCast(given_timeout);
                
                const now_u32: u32 = if ((now_wrapped) > PERIOD_MAX) 
                    PERIOD_MAX else @intCast(now_wrapped);

                const given_timeout_us = TimeUnit.Ticks.asMicroSecond(timeout_ticks);
                const now_u32_us = TimeUnit.Ticks.asMicroSecond(now_u32);
                const delta_time: u32 = ticks_as_us - now_u32_us;
                // ------------------------------------ JUST FOR DEBUGGING

                std.log.info("(SANITY CHECK):\r\n\t•Timeout: {d} ticks → {d}µs\r\n\t•Period time: {d} ticks → {d}µs Δₜ: {d})\r\n\t•Now: {d} ticks → {d}µs\n", .{
                    @as(u64, given_timeout),
                    @as(u32, given_timeout_us),
                    @as(u64, period_ticks),
                    @as(u32, ticks_as_us),
                    @as(u32, delta_time),
                    @as(u64, now_wrapped),
                    @as(u32, now_u32_us),
                });
            }
            
            // self.updatePeriodTimer(period_ticks);
            // self.updatePeriodTimer(period_wrapped, period_ticks);

            //NOTE: - Should I only write to the period register field. 
            // Or should I also write to the comparators using writeToTargetComparator????????
            
            self.synchronize_comparator(); // Sets the SYSTIMER_TIMER_COMPx_LOAD bit[0] = 1.

        }else{
            // One-Shot Mode 
            const per_unit: u64 = self.intoTicksFromUnit(timeout.unit);

            //TODO: - What value should I write here? 

            const MAX_VALUE_U52: u64 = @as(u64, std.math.maxInt(u51) - 1); 
            const timeout_ticks = if(timeout.time * per_unit > MAX_VALUE_U52)
                MAX_VALUE_U52 else (timeout.time * per_unit);

            //NOTE: - Should One-shot mode synchronize the comparator as well - YES!!! 
            // They are the same for both modes (target and period)

            self.set_target_value(timeout_ticks);
        }
    }

    fn set_target_value(self: Self, timeout_ticks: u64) void{
        // 1. Calculate the new target value to load. 
        // E.g., current_ticks + new_value
        const MAX_VALUE: u64 = @as(u64, std.math.maxInt(u51) - 1); 
        const timeout_clamp = if(self.now_v2(.Ticks).time + timeout_ticks > MAX_VALUE)
            MAX_VALUE else (self.now_v2(.Ticks).time + timeout_ticks);

        const now_time: u64 = self.readCounter() & COUNTER_MASK;
        const delta_ticks = wrapAdd52Bit(now_time, timeout_ticks);
        _ = timeout_clamp;

        // std.log.warn("Comparing: timeout_clamp: {d} vs delta_ticks: {d}\n", .{
        //     timeout_clamp,
        //     delta_ticks,
        // });
        
        // 2. Write the new calculate value here from step(1).
        // self.writeToTargetComparator(timeout_clamp);
        self.writeToTargetComparator(delta_ticks);
    }

    /// In period mode, COMPx compares it with the alarm period (t1 + n*δt).
    fn updatePeriodTimer(self: *Self, period_u64: u64, period_future: u32) void{
        // const time_now: u64 = self.readCounter() & COUNTER_MASK;
        if (self.timer) |*timer|{
            // Now in ticks, is the same as reading the timer's 52-bit directly. 
            timer.alarm = @as(u64, period_future); // when in the future the alarm will occur.
            timer.period = period_u64;
        }else {
            self.timer = Timer{.alarm = (period_future), .period = period_u64};
        }

        // The alarm period is done by setting the bits[25:0].
        self.writePeriod(period_future);

        // Synchronize here, indicating we are done writing. 
    }

    /// The period sequence would alarm at: T0, T0+δt, T0+2δt, ...
    /// Meaning `COMPx starts comparing the count value with the sum of (start value + n*δt)`
    pub fn writePeriod(self: Self, period_ticks: u32) void{
        // The alarm period is done by setting the bits[25:0].
        const offset = self.getTargetConfigureOffset();
        const conf_reg = Peripheral.SYSTIMER.read_register(offset);
        
        const mask: u32 = (@as(u32, 1) << 26) - 1; // bits[25:0], -1 turns all lower bits into 1
        const updated_bits: u32 = (conf_reg & ~mask) | (period_ticks & mask); // keep upper bits.
        // std.log.warn("At (setup_period): setting period bits[25:0] to: 0b{b} = {d}, from: {d}\n", .{
        //     @as(u32, updated_bits), 
        //     @as(u32, updated_bits), 
        //     @as(u32, period_ticks),
        // });

        Peripheral.SYSTIMER.write_register(offset, updated_bits);
    }

    /// Configures whether to reload the value of UNITx. 
    /// E.g., reloading the values of UNITx_VALUE_HI and UNITx_VALUE_LO
    /// ```NOTE
    /// UNITx - represent the counter 
    inline fn synchronize_unit_counter(self: Self) void{
        switch(self.counter_kind){
            .UNIT0 => Peripheral.SYSTIMER.setBit(self.register.UNIT0_LOAD_REG, 0),
            .UNIT1 => Peripheral.SYSTIMER.setBit(self.register.UNIT1_LOAD_REG, 0), 
        }
    }

    /// Loads or synchronize (reloads) the alarm value/period to COMPx.
    /// ```NOTE
    /// COMPx - represent the comparator.
    /// Where target0 is associated with COMP0, target1 to COMP1, and target2 to COMP2.
    pub fn synchronize_comparator(self: Self) void{
        switch (self.target_num) {
            .target0 => Peripheral.SYSTIMER.setBit(self.register.COMP0_LOAD_REG, 0),
            .target1 => Peripheral.SYSTIMER.setBit(self.register.COMP1_LOAD_REG, 0),
            .target2 => Peripheral.SYSTIMER.setBit(self.register.COMP2_LOAD_REG, 0),
        }
    }

    /// This will set the SYSTIMER_TARGET_PERIOD_MODE: 
    /// - 0: Target mode,
    /// - 1: Period mode,
    /// The SYSTIMER_TARGET_UNIT_SEL:
    /// - 0: Use the count value from UNIT0.
    /// - 1: Use the count value from UNIT1.
    /// ```NOTE
    /// - UNITx - represent the counter.
    /// - COMPx - represent the comparator.
    pub fn setupTargetConfig(self: Self) void{
        const offset = self.getTargetConfigureOffset();
        if (self.target_mode == .target){
            Peripheral.SYSTIMER.clearBit(offset, 30);
        }else if (self.target_mode == .periodic){
            Peripheral.SYSTIMER.clearBit(offset, 30);
            Peripheral.SYSTIMER.setBit(offset, 30);
        }

        switch (self.counter_kind) {
            .UNIT0 => {
                Peripheral.SYSTIMER.clearBit(offset, 31);
            },
            .UNIT1 => {
                Peripheral.SYSTIMER.setBit(offset, 31);
            },
        }
    }

    /// Sets up the `SYSTIMER_CONF_REG` at 0x0000. Here we enable
    /// which comparator (COMP0, COMP1, COMP2) to enable.
    /// Also if CoreX should be stalled or not (stops counter UNITn when CPUx is stalled):
    /// - 0: Core0 stalled disabled for UNITx.
    /// - 1: Core0 stalled enabled for UNITx.
    /// Aswell as enabling TargetX work. 
    /// -------------------- 
    /// Bits:
    /// - Bit[31] = `SYSTIMER_CLK_EN`
    /// - Bit[30] = `SYSTIMER_TIMER_UNIT0_WORK_EN`
    /// - Bit[29] = `SYSTIMER_TIMER_UNIT1_WORK_EN`
    /// - Bit[28] = `SYSTIMER_TIMER_UNIT0_CORE0_STALL_EN`
    /// - Bit[24] = `SYSTIMER_TARGET0_WORK_EN`
    /// - Bit[23] = `SYSTIMER_TARGET1_WORK_EN`
    /// - Bit[22] = `SYSTIMER_TARGET2_WORK_EN`
    pub fn setupConfigRegister(self: Self) void{
        var mask: u32 = switch (self.counter_kind) {
            .UNIT0 => @as(u32, (1 << 31) | (1 << 30)),
            .UNIT1 => @as(u32, (1 << 31) | (1 << 29)),
        };

        switch (self.counter_kind) {
            .UNIT0 => {
                if(self.core0_stall_enabled){
                    mask |= @as(u32, (1 << 28));
                }else{
                    Peripheral.SYSTIMER.clearBit(self.register.CONF, 28);
                }
            },
            .UNIT1 => {
                if(self.core0_stall_enabled){
                    mask |= @as(u32, (1 << 26));
                }else{
                    Peripheral.SYSTIMER.clearBit(self.register.CONF, 26);
                }

            },
        }

        // Sets the SYSTIMER_TARGETX_WORK_EN by setting the corresponding bit.
        switch(self.target_num){
            .target0 => mask |= @as(u32, (1 << 24)), // TARGET0_WORK_EN
            .target1 => mask |= @as(u32, (1 << 23)), // TARGET1_WORK_EN
            .target2 => mask |= @as(u32, (1 << 22)), // TARGET2_WORK_EN
        }
        
        // Read-Write-Set: 
        Peripheral.SYSTIMER.setMask(self.register.CONF, mask);
        // const conf_reg = Peripheral.SYSTIMER.read_register(self.register.CONF);
        // std.log.warn("SYSTIMER_CONF_REG After setup: 0b{b}\n", .{conf_reg});
    }

    /// Poll and waits by continously reading and checking if the 
    /// 29:th bit is 1. Whenever, it is equal to 1, we can proceed,
    /// and the user can read the count values.
    /// The count values are read from: UNITn_VALUE_HI and UNIT_n_VALUE_LO. 
    inline fn wait_synchronized(self: Self) void {
        if (self.counter_kind == .UNIT0){
        // Is UNIT0 synchronized? 
        while(!Peripheral.SYSTIMER.isBitSet(self.register.UNIT0_OP, 29)){}

        }else if(self.counter_kind == .UNIT1){
            // Is UNIT1 synchronized? 
            while(!Peripheral.SYSTIMER.isBitSet(self.register.UNIT1_OP, 29)){}

        }
    }

    pub fn readComparator(self: Self) u64{
        const load: struct{higher_bits: u32, lower_bits: u32} = load_values:{
            switch (self.target_num) {
                .target0 => {
                    break :load_values .{
                        .higher_bits = Peripheral.SYSTIMER.read_register(self.register.TARGET0_COMP_HI),
                        .lower_bits = Peripheral.SYSTIMER.read_register(self.register.TARGET0_COMP_LO),
                    };
                },
                .target1 => {
                    break :load_values .{
                        .higher_bits = Peripheral.SYSTIMER.read_register(self.register.TARGET1_COMP_HI),
                        .lower_bits = Peripheral.SYSTIMER.read_register(self.register.TARGET1_COMP_LO),
                    };
                },
                .target2 => {
                    break :load_values .{
                        .higher_bits = Peripheral.SYSTIMER.read_register(self.register.TARGET2_COMP_HI),
                        .lower_bits = Peripheral.SYSTIMER.read_register(self.register.TARGET2_COMP_LO),
                    };
                },
            }
        };
        const upper_bits = @as(u64, load.higher_bits & 0xFFFFF) << 32; // Shift the 20-bits by left shift 32. 
        return upper_bits | @as(u64, load.lower_bits);
    }

    pub fn readCounter(self: Self) u64 {
        //1. Set UNITn_UPDATE to fill the current value of COMPx into
        // UNITn_VALUE_HI and UNIT_n_VALUE_LO.
        Peripheral.SYSTIMER.setBit(self.register.UNIT0_OP, 30);

        //2. Poll the reading of: UNITn_VALUE_VALID until it is 1. 
        self.wait_synchronized(); // returns whenever, UNITn is synchronized. 

        //3. Read the lower 32 bits and higher 20 bits: 
        const load: struct{higher_bits: u32, lower_bits: u32} = load_values:{
            switch(self.counter_kind){
                .UNIT0 => {
                    break :load_values .{
                        .higher_bits = Peripheral.SYSTIMER.read_register(self.register.UNIT0_VALUE_HI),
                        .lower_bits = Peripheral.SYSTIMER.read_register(self.register.UNIT0_VALUE_LO),
                    };
                },
                .UNIT1 => {
                    break :load_values .{
                        .higher_bits = Peripheral.SYSTIMER.read_register(self.register.UNIT1_VALUE_HI),
                        .lower_bits = Peripheral.SYSTIMER.read_register(self.register.UNIT1_VALUE_LO),
                    };
                }
            }
        };

        const upper_bits = @as(u64, load.higher_bits & 0xFFFFF) << 32; // Shift the 20-bits by left shift 32. 
        return upper_bits | @as(u64, load.lower_bits);
    }

    /// Whenever we are in target mode. We write to their high and low registers. 
    pub fn writeToTargetComparator(self: Self, value: u64) void{
        const value_u52 = value & 0x000F_FFFF_FFFF_FFFF; // 52-bit mask
        const load: struct{higher_bits: u32, lower_bits: u32} = reg_raw:{
            // const lower_load = @as(u32, value & 0xFFFF_FFFF);
            // const upper_load = @as(u32, value >> 32);
            const lower_load: u32 = @truncate(value_u52);
            const upper_load: u32 = @intCast((value_u52 >> 32) & 0x000F_FFFF);
            break :reg_raw .{.higher_bits = upper_load, .lower_bits = lower_load}; 
        };

        switch (self.target_num) {
            .target0 =>{
                if (self.target_mode == .target){
                    Peripheral.SYSTIMER.write_register(self.register.TARGET0_COMP_LO, load.lower_bits);
                    Peripheral.SYSTIMER.write_register(self.register.TARGET0_COMP_HI, load.higher_bits);
                }
            },
            .target1 =>{
                if (self.target_mode == .target){
                    Peripheral.SYSTIMER.write_register(self.register.TARGET1_COMP_LO, load.lower_bits);
                    Peripheral.SYSTIMER.write_register(self.register.TARGET1_COMP_HI, load.higher_bits);
                }
            },
            .target2 =>{
                if (self.target_mode == .target){
                    Peripheral.SYSTIMER.write_register(self.register.TARGET2_COMP_LO, load.lower_bits);
                    Peripheral.SYSTIMER.write_register(self.register.TARGET2_COMP_HI, load.higher_bits);
                }
            }
        }
        self.synchronize_comparator(); // After write we reload the COMPx values with the new.

    }

    pub fn writeTo(self: Self, value: u64) void {
        const load: struct{higher_bits: u32, lower_bits: u32} = reg_raw:{
            const lower_load = @as(u32, value & 0xFFFF_FFFF);
            const upper_load = @as(u32, value >> 32);
            break :reg_raw .{.higher_bits = upper_load, .lower_bits = lower_load}; 
        };

        switch (self.counter_kind) {
            .UNIT0 => {
                Peripheral.SYSTIMER.write_register(self.register.UNIT0_LOAD_LO, load.lower_bits);
                Peripheral.SYSTIMER.write_register(self.register.UNIT0_LOAD_HI, load.higher_bits);
            },
            .UNIT1 => {
                Peripheral.SYSTIMER.write_register(self.register.UNIT1_LOAD_LO, load.lower_bits);
                Peripheral.SYSTIMER.write_register(self.register.UNIT1_LOAD_HI, load.higher_bits);
            },
        }
        self.synchronize_unit_counter(); // After writing we synchronize and load the new values. 
    }

    pub fn enable_interrupt(self: Self, enable: bool) void {
        if (enable){
            switch (self.target_num) {
                .target0 => Peripheral.SYSTIMER.setBit(self.register.INT_ENA, 0),
                .target1 => Peripheral.SYSTIMER.setBit(self.register.INT_ENA, 1),
                .target2 => Peripheral.SYSTIMER.setBit(self.register.INT_ENA, 2),
            }

        }else{
            switch (self.target_num) {
                .target0 => Peripheral.SYSTIMER.clearBit(self.register.INT_ENA, 0),
                .target1 => Peripheral.SYSTIMER.clearBit(self.register.INT_ENA, 1),
                .target2 => Peripheral.SYSTIMER.clearBit(self.register.INT_ENA, 2),
            }
        }
            
    }
    
    pub fn clear_interrupt(self: Self) void {
        switch (self.target_num) {
            .target0 => Peripheral.SYSTIMER.setBit(self.register.INT_CLR, 0),
            .target1 => Peripheral.SYSTIMER.setBit(self.register.INT_CLR, 1),
            .target2 => Peripheral.SYSTIMER.setBit(self.register.INT_CLR, 2),
        }
    }

    fn intoTicksFromUnit(self: Self, unit: TimeUnit) u64{
        return switch (unit) {
            .Ticks => 1,
            .Micro => self.clk_freq / 1_000_000, // ticks or cycles per µs
            .Mili => self.clk_freq / 1_000, // ticks or cycles ms
            .Sec => self.clk_freq, // ticks or cycles sec
        };
    }


    pub fn intoDeltaTimeTicksNew(self: Self, instant: TimeInstant) u64{
        const freq: u128 = @as(u128, self.clk_freq);
        const time: u128 = @as(u128, instant.time);
        const numerator: u128 = freq * time;
        // const freq: u64 = @as(u64, self.clk_freq);
        // const time: u64 = @as(u64, instant.time);
        
        // std.math.divCeil(u64, numerator: T, denominator: T)
        
        const denominator: u128 = switch(instant.unit){
            // .Ticks => @min(@as(u64, @intCast(time)), std.math.maxInt(u64)),
            // .Micro => std.math.divCeil(u64, freq * time, 1_000_000) catch std.math.maxInt(u64), // ticks or cycles per µs
            // .Mili => std.math.divCeil(u64, freq * time, 1_000) catch std.math.maxInt(u64), // ticks or cycles ms
            // .Sec => std.math.divCeil(u64, freq * time, 1) catch std.math.maxInt(u64), // ticks or cycles sec
            .Ticks => return @min(@as(u64, @intCast(time)), std.math.maxInt(u64)),
            .Micro => 1_000_000, // ticks or cycles per µs
            .Mili => 1_000, // ticks or cycles ms
            .Sec => 1, // ticks or cycles sec
        };

        const time_ticks = std.math.divCeil(u128, numerator, denominator) 
            catch std.math.maxInt(u64);

        const ticks: u64 = if (time_ticks > std.math.maxInt(u64)) 
            std.math.maxInt(u64) 
        else 
            @intCast(time_ticks);
        std.log.warn("after intcast of time_ceil(num/denom): {d}\n", .{ticks});
        
        return ticks;
    }

    pub fn intoDeltaTimeTicks(self: Self, instant: TimeInstant) u64{
        const freq: u128 = @as(u128, self.clk_freq);
        const time: u128 = @as(u128, instant.time);

        const dt: u128 = switch(instant.unit){
            // .Ticks => @as(u128, instant.time),
            .Ticks => @min(@as(u64, @intCast(time)), std.math.maxInt(u64)),
            .Micro => @as(u128, freq * time) / 1_000_000, // ticks or cycles per µs
            .Mili => @as(u128, freq * time) / 1_000, // ticks or cycles ms
            .Sec => @as(u128, freq * time), // ticks or cycles sec
        };
        
        const period: u64 = if (dt > std.math.maxInt(u64))
            std.math.maxInt(u64)
        else
            @intCast(dt);
        
        return period;
    }

    /// If we have a clock frequency of 16 Mhz = 16,000,000 ticks. So
    /// to convert from e.g., unit µs (Micro) into ticks, we would take: 
    /// ticks per micro second multiplied with the instant time. 
    pub fn intoTicksFromTimeInstant(self: Self, instant: TimeInstant) u64{
        return switch(instant.unit){
            .Ticks => instant.time,
            .Micro => (self.clk_freq / 1_000_000) * instant.time, // ticks or cycles per µs
            .Mili => (self.clk_freq / 1_000) * instant.time, // ticks or cycles ms
            .Sec => (self.clk_freq) * instant.time, // ticks or cycles sec
        };
    }

    fn durationIntoTicks(self: Self, duration_value: u64, unit: TimeUnit) u64{
        const per_unit: u64 = self.intoTicksFromUnit(unit);

        // const mul_op = @mulWithOverflow(duration_value, per_unit);
        const wrapped_duration = std.math.mul(u64, duration_value, per_unit) catch @as(u64, std.math.maxInt(u64));
        const clamp_duration: u64 = std.math.clamp(duration_value * per_unit, 0, std.math.maxInt(u64));
        if(builtin.mode == .Debug){
            _ = clamp_duration; 
            // std.log.warn("Inside 'DurationIntoTicks', wrapped_duration: {d}, clamped: {d}, maxInt(64): {d}\n", .{
            //     wrapped_duration,
            //     clamp_duration,
            //     @as(u64, std.math.maxInt(u64)),
            // });

        }

        // @intCast(@min(num, @as(u128, std.math.maxInt(u64))));
        return wrapped_duration; 
    }
    
    /// ticks as 52-bit counter value as u64.
    pub inline fn now_ticks(self: Self) u64{
        return self.readCounter() & COUNTER_MASK;
    }
    
    pub inline fn elapsedAsTicks(self: Self, start: u64) u64{
        return (self.now_ticks() - start) & COUNTER_MASK;
    }

    /// Ticks per micro sec is 16. 
    /// Clock Frequency: 16 MHz = 16000000 cycle/second [ticks].
    /// ... → Microseconds (µs): 10⁻⁶. 
    /// Time Period (T): 1 / f
    /// Frequency (f): 1 / T, T = Time Period. 
    /// (DEPRICATED use `now_v2` instead!)
    pub fn now(self: Self, unit: TimeUnit) u64 {
        // const unit_ticks: u64 = switch (unit) {
        //     .Ticks => 1,
        //     .Micro => 16, // ticks or cycles per µs
        //     .Mili => 16_000, // ticks or cycles ms
        //     .Sec => 16_000_000, // ticks or cycles sec
        //
        // };
        const unit_ticks: u64 = switch (unit) {
            .Ticks => 1,
            .Micro => self.clk_freq / 1_000_000, // ticks or cycles per µs
            .Mili => self.clk_freq / 1_000, // ticks or cycles ms
            .Sec => self.clk_freq, // ticks or cycles sec
        };

        return self.readCounter() / unit_ticks;
    }

    /// Ticks per micro sec is 16: 16 MHz → 16 ticks/µs. 
    /// Clock Frequency: 16 MHz = 16000000 cycle/second [ticks].
    /// ... → Microseconds (µs): 10⁻⁶. 
    /// Time Period (T): 1 / f
    /// Frequency (f): 1 / T, T = Time Period. 
    pub fn now_v2(self: Self, unit: TimeUnit) TimeInstant{
        if(unit == .Ticks) return TimeInstant{.time = self.now_ticks(), .unit = .Ticks};

        const unit_ticks: u64 = switch (unit) {
            .Ticks => 1,
            .Micro => self.clk_freq / 1_000_000, // ticks or cycles per µs
            .Mili => self.clk_freq / 1_000, // ticks or cycles ms
            .Sec => self.clk_freq, // ticks or cycles sec
        };

        // return TimeInstant{.time = (self.readCounter() / unit_ticks), .unit = unit};
        return TimeInstant{.time = (self.now_ticks() / unit_ticks), .unit = unit};
    }

    pub inline fn intoTime(self: Self, ticks_dt: u64, unit: TimeUnit) f64{
        const ticks = @as(f64, @floatFromInt(ticks_dt));
        const clk_freq = @as(f64, @floatFromInt(self.clk_freq)); // ticks per second

        return switch (unit) {
            .Ticks => ticks,
            .Sec => ticks / clk_freq,
            .Mili  => (ticks * 1e3) / clk_freq,
            .Micro => (ticks * 1e6) / clk_freq,
        };

    }

    pub inline fn elapsed_v2(self: Self, start: u64, comptime unit: TimeUnit) switch (unit) {
        .Ticks => u64,
        .Micro => u64, 
        .Mili => u64,
        .Sec => f64,
    } {
        const delta_ticks = self.elapsedAsTicks(start);

        return switch(unit){
            .Ticks => delta_ticks,
            .Micro => us_ticks:{
                const num: u128 = @as(u128, delta_ticks) * 1_000_000 + (@as(u128, self.clk_freq) / 2);
                const ticks_us: u64 = @intCast(num / @as(u128, self.clk_freq)); 
                break :us_ticks ticks_us;
            }, 
            .Mili => ms_ticks:{
                const num: u128 = @as(u128, delta_ticks) * 1_000 + (@as(u128, self.clk_freq) / 2);
                const ticks_ms: u64 = @intCast(num / @as(u128, self.clk_freq)); 
                break :ms_ticks ticks_ms;
            },
            .Sec => @as(f64, @floatFromInt(delta_ticks)) / @as(f64, @floatFromInt(self.clk_freq)),
        };
    }

    /// DEPRICATED use `duration_v2`
    pub fn duration(self: Self, t1: u64, unit: TimeUnit) u64 {
        const t2 = self.now(unit);
        return t2 - t1; 
    }
    
    pub fn duration_v2(self: Self, t1: TimeInstant) u64 {
        // t2.time: self.readCounter() / unit_ticks

        const t2 = self.now_v2(t1.unit);
        return t2.time - t1.time; 
    }
};

