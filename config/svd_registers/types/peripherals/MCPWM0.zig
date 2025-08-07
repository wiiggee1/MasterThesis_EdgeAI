const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Motor Control Pulse-Width Modulation 0
pub const MCPWM0 = extern struct {
    /// PWM clock prescaler register.
    /// offset: 0x00
    CLK_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures the prescaler value of clock, so that the period of PWM_clk = 6.25ns * (PWM_CLK_PRESCALE + 1).
        CLK_PRESCALE: u8,
        padding: u24 = 0,
    }),
    /// PWM timer%s period and update method configuration register.
    /// offset: 0x04
    TIMER0_CFG0: mmio.Mmio(packed struct(u32) {
        /// Configures the prescaler value of timer%s, so that the period of PT0_clk = Period of PWM_clk * (PWM_TIMER%s_PRESCALE + 1)
        TIMER_PRESCALE: u8,
        /// Configures the period shadow of PWM timer%s
        TIMER_PERIOD: u16,
        /// Configures the update method for active register of PWM timer%s period.\\0: Immediate\\1: TEZ\\2: Sync\\3: TEZ or sync\\TEZ here and below means timer equal zero event
        TIMER_PERIOD_UPMETHOD: u2,
        padding: u6 = 0,
    }),
    /// PWM timer%s working mode and start/stop control register.
    /// offset: 0x08
    TIMER0_CFG1: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to start/stop PWM timer%s.\\0: If PWM timer%s starts, then stops at TEZ\\1: If timer%s starts, then stops at TEP\\2: PWM timer%s starts and runs on\\3: Timer%s starts and stops at the next TEZ\\4: Timer0 starts and stops at the next TEP.\\TEP here and below means the event that happens when the timer equals to period
        TIMER_START: u3,
        /// Configures the working mode of PWM timer%s.\\0: Freeze\\1: Increase mode\\2: Decrease mode\\3: Up-down mode
        TIMER_MOD: u2,
        padding: u27 = 0,
    }),
    /// PWM timer%s sync function configuration register.
    /// offset: 0x0c
    TIMER0_SYNC: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable timer%s reloading with phase on sync input event is enabled.\\0: Disable\\1: Enable
        TIMER_SYNCI_EN: u1,
        /// Configures the generation of software sync. Toggling this bit will trigger a software sync.
        SW: u1,
        /// Configures the selection of PWM timer%s sync_out.\\0: Sync_in\\1: TEZ\\2: TEP\\3: Invalid, sync_out selects noting
        TIMER_SYNCO_SEL: u2,
        /// Configures the phase for timer%s reload on sync event.
        TIMER_PHASE: u16,
        /// Configures the PWM timer%s's direction when timer%s mode is up-down mode.\\0: Increase\\1: Decrease
        TIMER_PHASE_DIRECTION: u1,
        padding: u11 = 0,
    }),
    /// PWM timer%s status register.
    /// offset: 0x10
    TIMER0_STATUS: mmio.Mmio(packed struct(u32) {
        /// Represents current PWM timer%s counter value.
        TIMER_VALUE: u16,
        /// Represents current PWM timer%s counter direction.\\0: Increment\\1: Decrement
        TIMER_DIRECTION: u1,
        padding: u15 = 0,
    }),
    /// PWM timer%s period and update method configuration register.
    /// offset: 0x14
    TIMER1_CFG0: mmio.Mmio(packed struct(u32) {
        /// Configures the prescaler value of timer%s, so that the period of PT0_clk = Period of PWM_clk * (PWM_TIMER%s_PRESCALE + 1)
        TIMER_PRESCALE: u8,
        /// Configures the period shadow of PWM timer%s
        TIMER_PERIOD: u16,
        /// Configures the update method for active register of PWM timer%s period.\\0: Immediate\\1: TEZ\\2: Sync\\3: TEZ or sync\\TEZ here and below means timer equal zero event
        TIMER_PERIOD_UPMETHOD: u2,
        padding: u6 = 0,
    }),
    /// PWM timer%s working mode and start/stop control register.
    /// offset: 0x18
    TIMER1_CFG1: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to start/stop PWM timer%s.\\0: If PWM timer%s starts, then stops at TEZ\\1: If timer%s starts, then stops at TEP\\2: PWM timer%s starts and runs on\\3: Timer%s starts and stops at the next TEZ\\4: Timer0 starts and stops at the next TEP.\\TEP here and below means the event that happens when the timer equals to period
        TIMER_START: u3,
        /// Configures the working mode of PWM timer%s.\\0: Freeze\\1: Increase mode\\2: Decrease mode\\3: Up-down mode
        TIMER_MOD: u2,
        padding: u27 = 0,
    }),
    /// PWM timer%s sync function configuration register.
    /// offset: 0x1c
    TIMER1_SYNC: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable timer%s reloading with phase on sync input event is enabled.\\0: Disable\\1: Enable
        TIMER_SYNCI_EN: u1,
        /// Configures the generation of software sync. Toggling this bit will trigger a software sync.
        SW: u1,
        /// Configures the selection of PWM timer%s sync_out.\\0: Sync_in\\1: TEZ\\2: TEP\\3: Invalid, sync_out selects noting
        TIMER_SYNCO_SEL: u2,
        /// Configures the phase for timer%s reload on sync event.
        TIMER_PHASE: u16,
        /// Configures the PWM timer%s's direction when timer%s mode is up-down mode.\\0: Increase\\1: Decrease
        TIMER_PHASE_DIRECTION: u1,
        padding: u11 = 0,
    }),
    /// PWM timer%s status register.
    /// offset: 0x20
    TIMER1_STATUS: mmio.Mmio(packed struct(u32) {
        /// Represents current PWM timer%s counter value.
        TIMER_VALUE: u16,
        /// Represents current PWM timer%s counter direction.\\0: Increment\\1: Decrement
        TIMER_DIRECTION: u1,
        padding: u15 = 0,
    }),
    /// PWM timer%s period and update method configuration register.
    /// offset: 0x24
    TIMER2_CFG0: mmio.Mmio(packed struct(u32) {
        /// Configures the prescaler value of timer%s, so that the period of PT0_clk = Period of PWM_clk * (PWM_TIMER%s_PRESCALE + 1)
        TIMER_PRESCALE: u8,
        /// Configures the period shadow of PWM timer%s
        TIMER_PERIOD: u16,
        /// Configures the update method for active register of PWM timer%s period.\\0: Immediate\\1: TEZ\\2: Sync\\3: TEZ or sync\\TEZ here and below means timer equal zero event
        TIMER_PERIOD_UPMETHOD: u2,
        padding: u6 = 0,
    }),
    /// PWM timer%s working mode and start/stop control register.
    /// offset: 0x28
    TIMER2_CFG1: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to start/stop PWM timer%s.\\0: If PWM timer%s starts, then stops at TEZ\\1: If timer%s starts, then stops at TEP\\2: PWM timer%s starts and runs on\\3: Timer%s starts and stops at the next TEZ\\4: Timer0 starts and stops at the next TEP.\\TEP here and below means the event that happens when the timer equals to period
        TIMER_START: u3,
        /// Configures the working mode of PWM timer%s.\\0: Freeze\\1: Increase mode\\2: Decrease mode\\3: Up-down mode
        TIMER_MOD: u2,
        padding: u27 = 0,
    }),
    /// PWM timer%s sync function configuration register.
    /// offset: 0x2c
    TIMER2_SYNC: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable timer%s reloading with phase on sync input event is enabled.\\0: Disable\\1: Enable
        TIMER_SYNCI_EN: u1,
        /// Configures the generation of software sync. Toggling this bit will trigger a software sync.
        SW: u1,
        /// Configures the selection of PWM timer%s sync_out.\\0: Sync_in\\1: TEZ\\2: TEP\\3: Invalid, sync_out selects noting
        TIMER_SYNCO_SEL: u2,
        /// Configures the phase for timer%s reload on sync event.
        TIMER_PHASE: u16,
        /// Configures the PWM timer%s's direction when timer%s mode is up-down mode.\\0: Increase\\1: Decrease
        TIMER_PHASE_DIRECTION: u1,
        padding: u11 = 0,
    }),
    /// PWM timer%s status register.
    /// offset: 0x30
    TIMER2_STATUS: mmio.Mmio(packed struct(u32) {
        /// Represents current PWM timer%s counter value.
        TIMER_VALUE: u16,
        /// Represents current PWM timer%s counter direction.\\0: Increment\\1: Decrement
        TIMER_DIRECTION: u1,
        padding: u15 = 0,
    }),
    /// Synchronization input selection register for PWM timers.
    /// offset: 0x34
    TIMER_SYNCI_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures the selection of sync input for PWM timer0.\\1: PWM timer0 sync_out\\2: PWM timer1 sync_out\\3: PWM timer2 sync_out\\4: SYNC0 from GPIO matrix\\5: SYNC1 from GPIO matrix\\6: SYNC2 from GPIO matrix\\Other values: No sync input selected
        TIMER0_SYNCISEL: u3,
        /// Configures the selection of sync input for PWM timer1.\\1: PWM timer0 sync_out\\2: PWM timer1 sync_out\\3: PWM timer2 sync_out\\4: SYNC0 from GPIO matrix\\5: SYNC1 from GPIO matrix\\6: SYNC2 from GPIO matrix\\Other values: No sync input selected
        TIMER1_SYNCISEL: u3,
        /// Configures the selection of sync input for PWM timer2.\\1: PWM timer0 sync_out\\2: PWM timer1 sync_out\\3: PWM timer2 sync_out\\4: SYNC0 from GPIO matrix\\5: SYNC1 from GPIO matrix\\6: SYNC2 from GPIO matrix\\Other values: No sync input selected
        TIMER2_SYNCISEL: u3,
        /// Configures whether or not to invert SYNC0 from GPIO matrix.\\0: Not invert\\1: Invert
        EXTERNAL_SYNCI0_INVERT: u1,
        /// Configures whether or not to invert SYNC1 from GPIO matrix.\\0: Not invert\\1: Invert
        EXTERNAL_SYNCI1_INVERT: u1,
        /// Configures whether or not to invert SYNC2 from GPIO matrix.\\0: Not invert\\1: Invert
        EXTERNAL_SYNCI2_INVERT: u1,
        padding: u20 = 0,
    }),
    /// PWM operator's timer select register
    /// offset: 0x38
    OPERATOR_TIMERSEL: mmio.Mmio(packed struct(u32) {
        /// Configures which PWM timer will be the timing reference for PWM operator0.\\0: Timer0\\1: Timer1\\2: Timer2\\3: Invalid, will select timer2
        OPERATOR0_TIMERSEL: u2,
        /// Configures which PWM timer will be the timing reference for PWM operator1.\\0: Timer0\\1: Timer1\\2: Timer2\\3: Invalid, will select timer2
        OPERATOR1_TIMERSEL: u2,
        /// Configures which PWM timer will be the timing reference for PWM operator2.\\0: Timer0\\1: Timer1\\2: Timer2\\3: Invalid, will select timer2
        OPERATOR2_TIMERSEL: u2,
        padding: u26 = 0,
    }),
    /// Generator%s time stamp registers A and B transfer status and update method register
    /// offset: 0x3c
    GEN0_STMP_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures the update method for PWM generator %s time stamp A's active register.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        CMPR_A_UPMETHOD: u4,
        /// Configures the update method for PWM generator %s time stamp B's active register.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        CMPR_B_UPMETHOD: u4,
        /// Represents whether or not generator%s time stamp A's shadow reg is transferred.\\0: A's active reg has been updated with shadow register latest value.\\1: A's shadow reg is filled and waiting to be transferred to A's active reg
        CMPR_A_SHDW_FULL: u1,
        /// Represents whether or not generator%s time stamp B's shadow reg is transferred.\\0: B's active reg has been updated with shadow register latest value.\\1: B's shadow reg is filled and waiting to be transferred to B's active reg
        CMPR_B_SHDW_FULL: u1,
        padding: u22 = 0,
    }),
    /// Generator%s time stamp A's shadow register
    /// offset: 0x40
    GEN0_TSTMP_A: mmio.Mmio(packed struct(u32) {
        /// Configures the value of PWM generator %s time stamp A's shadow register.
        CMPR_A: u16,
        padding: u16 = 0,
    }),
    /// Generator%s time stamp B's shadow register
    /// offset: 0x44
    GEN0_TSTMP_B: mmio.Mmio(packed struct(u32) {
        /// Configures the value of PWM generator %s time stamp B's shadow register.
        CMPR_B: u16,
        padding: u16 = 0,
    }),
    /// Generator%s fault event T0 and T1 configuration register
    /// offset: 0x48
    GEN0_CFG0: mmio.Mmio(packed struct(u32) {
        /// Configures update method for PWM generator %s's active register.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        GEN_CFG_UPMETHOD: u4,
        /// Configures source selection for PWM generator %s event_t0, take effect immediately.\\0: fault_event0\\1: fault_event1\\2: fault_event2\\3: sync_taken\\4: Invalid, Select nothing
        GEN_T0_SEL: u3,
        /// Configures source selection for PWM generator %s event_t1, take effect immediately.\\0: fault_event0\\1: fault_event1\\2: fault_event2\\3: sync_taken\\4: Invalid, Select nothing
        GEN_T1_SEL: u3,
        padding: u22 = 0,
    }),
    /// Generator%s output signal force mode register.
    /// offset: 0x4c
    GEN0_FORCE: mmio.Mmio(packed struct(u32) {
        /// Configures update method for continuous software force of PWM generator%s.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: TEA\\Bit3 is set to 1: TEB\\Bit4 is set to 1: Sync\\Bit5 is set to 1: Disable update. TEA/B here and below means an event generated when the timer's value equals to that of register A/B.
        GEN_CNTUFORCE_UPMETHOD: u6,
        /// Configures continuous software force mode for PWM%s A.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_A_CNTUFORCE_MODE: u2,
        /// Configures continuous software force mode for PWM%s B.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_B_CNTUFORCE_MODE: u2,
        /// Configures the generation of non-continuous immediate software-force event for PWM%s A, a toggle will trigger a force event.
        GEN_A_NCIFORCE: u1,
        /// Configures non-continuous immediate software force mode for PWM%s A.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_A_NCIFORCE_MODE: u2,
        /// Configures the generation of non-continuous immediate software-force event for PWM%s B, a toggle will trigger a force event.
        GEN_B_NCIFORCE: u1,
        /// Configures non-continuous immediate software force mode for PWM%s B.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_B_NCIFORCE_MODE: u2,
        padding: u16 = 0,
    }),
    /// PWM%s output signal A actions configuration register
    /// offset: 0x50
    GEN0_A: mmio.Mmio(packed struct(u32) {
        /// Configures action on PWM%s A triggered by event TEZ when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEZ: u2,
        /// Configures action on PWM%s A triggered by event TEP when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEP: u2,
        /// Configures action on PWM%s A triggered by event TEA when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEA: u2,
        /// Configures action on PWM%s A triggered by event TEB when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEB: u2,
        /// Configures action on PWM%s A triggered by event_t0 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT0: u2,
        /// Configures action on PWM%s A triggered by event_t1 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT1: u2,
        /// Configures action on PWM%s A triggered by event TEZ when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEZ: u2,
        /// Configures action on PWM%s A triggered by event TEP when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEP: u2,
        /// Configures action on PWM%s A triggered by event TEA when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEA: u2,
        /// Configures action on PWM%s A triggered by event TEB when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEB: u2,
        /// Configures action on PWM%s A triggered by event_t0 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT0: u2,
        /// Configures action on PWM%s A triggered by event_t1 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT1: u2,
        padding: u8 = 0,
    }),
    /// PWM%s output signal B actions configuration register
    /// offset: 0x54
    GEN0_B: mmio.Mmio(packed struct(u32) {
        /// Configures action on PWM%s B triggered by event TEZ when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEZ: u2,
        /// Configures action on PWM%s B triggered by event TEP when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEP: u2,
        /// Configures action on PWM%s B triggered by event TEA when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEA: u2,
        /// Configures action on PWM%s B triggered by event TEB when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEB: u2,
        /// Configures action on PWM%s B triggered by event_t0 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT0: u2,
        /// Configures action on PWM%s B triggered by event_t1 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT1: u2,
        /// Configures action on PWM%s B triggered by event TEZ when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEZ: u2,
        /// Configures action on PWM%s B triggered by event TEP when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEP: u2,
        /// Configures action on PWM%s B triggered by event TEA when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEA: u2,
        /// Configures action on PWM%s B triggered by event TEB when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEB: u2,
        /// Configures action on PWM%s B triggered by event_t0 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT0: u2,
        /// Configures action on PWM%s B triggered by event_t1 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT1: u2,
        padding: u8 = 0,
    }),
    /// Dead time configuration register
    /// offset: 0x58
    DT0_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures update method for FED (Falling edge delay) active register.\\0: Immediate\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        DB_FED_UPMETHOD: u4,
        /// Configures update method for RED (rising edge delay) active register.\\0: Immediate\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        DB_RED_UPMETHOD: u4,
        /// Configures S8 in table, dual-edge B mode.\\0: fed/red take effect on different path separately\\1: fed/red take effect on B path, A out is in bypass or dulpB mode
        DB_DEB_MODE: u1,
        /// Configures S6 in table.
        DB_A_OUTSWAP: u1,
        /// Configures S7 in table.
        DB_B_OUTSWAP: u1,
        /// Configures S4 in table.
        DB_RED_INSEL: u1,
        /// Configures S5 in table.
        DB_FED_INSEL: u1,
        /// Configures S2 in table.
        DB_RED_OUTINVERT: u1,
        /// Configures S3 in table.
        DB_FED_OUTINVERT: u1,
        /// Configures S1 in table.
        DB_A_OUTBYPASS: u1,
        /// Configures S0 in table.
        DB_B_OUTBYPASS: u1,
        /// Configures dead time generator %s clock selection.\\0: PWM_clk\\1: PT_clk
        DB_CLK_SEL: u1,
        padding: u14 = 0,
    }),
    /// Falling edge delay (FED) shadow register
    /// offset: 0x5c
    DT0_FED_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures shadow register for FED.
        DB_FED: u16,
        padding: u16 = 0,
    }),
    /// Rising edge delay (RED) shadow register
    /// offset: 0x60
    DT0_RED_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures shadow register for RED.
        DB_RED: u16,
        padding: u16 = 0,
    }),
    /// Carrier%s configuration register
    /// offset: 0x64
    CARRIER0_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable carrier%s.\\0: Bypassed\\1: Enabled
        CHOPPER_EN: u1,
        /// Configures the prescale value of PWM carrier%s clock (PC_clk), so that period of PC_clk = period of PWM_clk * (PWM_CARRIER%s_PRESCALE + 1)
        CHOPPER_PRESCALE: u4,
        /// Configures carrier duty. Duty = PWM_CARRIER%s_DUTY / 8
        CHOPPER_DUTY: u3,
        /// Configures width of the first pulse. Measurement unit: Periods of the carrier.
        CHOPPER_OSHTWTH: u4,
        /// Configures whether or not to invert the output of PWM%s A and PWM%s B for this submodule.\\0: Normal\\1: Invert
        CHOPPER_OUT_INVERT: u1,
        /// Configures whether or not to invert the input of PWM%s A and PWM%s B for this submodule.\\0: Normal\\1: Invert
        CHOPPER_IN_INVERT: u1,
        padding: u18 = 0,
    }),
    /// PWM%s A and PWM%s B trip events actions configuration register
    /// offset: 0x68
    FH0_CFG0: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable software force cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_SW_CBC: u1,
        /// Configures whether or not event_f2 will trigger cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_F2_CBC: u1,
        /// Configures whether or not event_f1 will trigger cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_F1_CBC: u1,
        /// Configures whether or not event_f0 will trigger cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_F0_CBC: u1,
        /// Configures whether or not to enable software force one-shot mode action.\\0: Disable\\1: Enable
        TZ_SW_OST: u1,
        /// Configures whether or not event_f2 will trigger one-shot mode action.\\0: Disable\\1: Enable
        TZ_F2_OST: u1,
        /// Configures whether or not event_f1 will trigger one-shot mode action.\\0: Disable\\1: Enable
        TZ_F1_OST: u1,
        /// Configures whether or not event_f0 will trigger one-shot mode action.\\0: Disable\\1: Enable
        TZ_F0_OST: u1,
        /// Configures cycle-by-cycle mode action on PWM%s A when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_CBC_D: u2,
        /// Configures cycle-by-cycle mode action on PWM%s A when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_CBC_U: u2,
        /// Configures one-shot mode action on PWM%s A when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_OST_D: u2,
        /// Configures one-shot mode action on PWM%s A when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_OST_U: u2,
        /// Configures cycle-by-cycle mode action on PWM%s B when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_CBC_D: u2,
        /// Configures cycle-by-cycle mode action on PWM%s B when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_CBC_U: u2,
        /// Configures one-shot mode action on PWM%s B when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_OST_D: u2,
        /// Configures one-shot mode action on PWM%s B when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_OST_U: u2,
        padding: u8 = 0,
    }),
    /// Software triggers for fault handler actions configuration register
    /// offset: 0x6c
    FH0_CFG1: mmio.Mmio(packed struct(u32) {
        /// Configures the generation of software one-shot mode action clear. A toggle (software negate its value) triggers a clear for on going one-shot mode action.
        TZ_CLR_OST: u1,
        /// Configures the refresh moment selection of cycle-by-cycle mode action.\\0: Select nothing, will not refresh\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP
        TZ_CBCPULSE: u2,
        /// Configures the generation of software cycle-by-cycle mode action. A toggle (software negate its value) triggers a cycle-by-cycle mode action.
        TZ_FORCE_CBC: u1,
        /// Configures the generation of software one-shot mode action. A toggle (software negate its value) triggers a one-shot mode action.
        TZ_FORCE_OST: u1,
        padding: u27 = 0,
    }),
    /// Fault events status register
    /// offset: 0x70
    FH0_STATUS: mmio.Mmio(packed struct(u32) {
        /// Represents whether or not an cycle-by-cycle mode action is on going.\\0:No action\\1: On going
        TZ_CBC_ON: u1,
        /// Represents whether or not an one-shot mode action is on going.\\0:No action\\1: On going
        TZ_OST_ON: u1,
        padding: u30 = 0,
    }),
    /// Generator%s time stamp registers A and B transfer status and update method register
    /// offset: 0x74
    GEN1_STMP_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures the update method for PWM generator %s time stamp A's active register.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        CMPR_A_UPMETHOD: u4,
        /// Configures the update method for PWM generator %s time stamp B's active register.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        CMPR_B_UPMETHOD: u4,
        /// Represents whether or not generator%s time stamp A's shadow reg is transferred.\\0: A's active reg has been updated with shadow register latest value.\\1: A's shadow reg is filled and waiting to be transferred to A's active reg
        CMPR_A_SHDW_FULL: u1,
        /// Represents whether or not generator%s time stamp B's shadow reg is transferred.\\0: B's active reg has been updated with shadow register latest value.\\1: B's shadow reg is filled and waiting to be transferred to B's active reg
        CMPR_B_SHDW_FULL: u1,
        padding: u22 = 0,
    }),
    /// Generator%s time stamp A's shadow register
    /// offset: 0x78
    GEN1_TSTMP_A: mmio.Mmio(packed struct(u32) {
        /// Configures the value of PWM generator %s time stamp A's shadow register.
        CMPR_A: u16,
        padding: u16 = 0,
    }),
    /// Generator%s time stamp B's shadow register
    /// offset: 0x7c
    GEN1_TSTMP_B: mmio.Mmio(packed struct(u32) {
        /// Configures the value of PWM generator %s time stamp B's shadow register.
        CMPR_B: u16,
        padding: u16 = 0,
    }),
    /// Generator%s fault event T0 and T1 configuration register
    /// offset: 0x80
    GEN1_CFG0: mmio.Mmio(packed struct(u32) {
        /// Configures update method for PWM generator %s's active register.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        GEN_CFG_UPMETHOD: u4,
        /// Configures source selection for PWM generator %s event_t0, take effect immediately.\\0: fault_event0\\1: fault_event1\\2: fault_event2\\3: sync_taken\\4: Invalid, Select nothing
        GEN_T0_SEL: u3,
        /// Configures source selection for PWM generator %s event_t1, take effect immediately.\\0: fault_event0\\1: fault_event1\\2: fault_event2\\3: sync_taken\\4: Invalid, Select nothing
        GEN_T1_SEL: u3,
        padding: u22 = 0,
    }),
    /// Generator%s output signal force mode register.
    /// offset: 0x84
    GEN1_FORCE: mmio.Mmio(packed struct(u32) {
        /// Configures update method for continuous software force of PWM generator%s.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: TEA\\Bit3 is set to 1: TEB\\Bit4 is set to 1: Sync\\Bit5 is set to 1: Disable update. TEA/B here and below means an event generated when the timer's value equals to that of register A/B.
        GEN_CNTUFORCE_UPMETHOD: u6,
        /// Configures continuous software force mode for PWM%s A.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_A_CNTUFORCE_MODE: u2,
        /// Configures continuous software force mode for PWM%s B.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_B_CNTUFORCE_MODE: u2,
        /// Configures the generation of non-continuous immediate software-force event for PWM%s A, a toggle will trigger a force event.
        GEN_A_NCIFORCE: u1,
        /// Configures non-continuous immediate software force mode for PWM%s A.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_A_NCIFORCE_MODE: u2,
        /// Configures the generation of non-continuous immediate software-force event for PWM%s B, a toggle will trigger a force event.
        GEN_B_NCIFORCE: u1,
        /// Configures non-continuous immediate software force mode for PWM%s B.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_B_NCIFORCE_MODE: u2,
        padding: u16 = 0,
    }),
    /// PWM%s output signal A actions configuration register
    /// offset: 0x88
    GEN1_A: mmio.Mmio(packed struct(u32) {
        /// Configures action on PWM%s A triggered by event TEZ when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEZ: u2,
        /// Configures action on PWM%s A triggered by event TEP when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEP: u2,
        /// Configures action on PWM%s A triggered by event TEA when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEA: u2,
        /// Configures action on PWM%s A triggered by event TEB when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEB: u2,
        /// Configures action on PWM%s A triggered by event_t0 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT0: u2,
        /// Configures action on PWM%s A triggered by event_t1 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT1: u2,
        /// Configures action on PWM%s A triggered by event TEZ when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEZ: u2,
        /// Configures action on PWM%s A triggered by event TEP when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEP: u2,
        /// Configures action on PWM%s A triggered by event TEA when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEA: u2,
        /// Configures action on PWM%s A triggered by event TEB when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEB: u2,
        /// Configures action on PWM%s A triggered by event_t0 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT0: u2,
        /// Configures action on PWM%s A triggered by event_t1 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT1: u2,
        padding: u8 = 0,
    }),
    /// PWM%s output signal B actions configuration register
    /// offset: 0x8c
    GEN1_B: mmio.Mmio(packed struct(u32) {
        /// Configures action on PWM%s B triggered by event TEZ when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEZ: u2,
        /// Configures action on PWM%s B triggered by event TEP when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEP: u2,
        /// Configures action on PWM%s B triggered by event TEA when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEA: u2,
        /// Configures action on PWM%s B triggered by event TEB when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEB: u2,
        /// Configures action on PWM%s B triggered by event_t0 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT0: u2,
        /// Configures action on PWM%s B triggered by event_t1 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT1: u2,
        /// Configures action on PWM%s B triggered by event TEZ when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEZ: u2,
        /// Configures action on PWM%s B triggered by event TEP when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEP: u2,
        /// Configures action on PWM%s B triggered by event TEA when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEA: u2,
        /// Configures action on PWM%s B triggered by event TEB when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEB: u2,
        /// Configures action on PWM%s B triggered by event_t0 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT0: u2,
        /// Configures action on PWM%s B triggered by event_t1 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT1: u2,
        padding: u8 = 0,
    }),
    /// Dead time configuration register
    /// offset: 0x90
    DT1_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures update method for FED (Falling edge delay) active register.\\0: Immediate\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        DB_FED_UPMETHOD: u4,
        /// Configures update method for RED (rising edge delay) active register.\\0: Immediate\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        DB_RED_UPMETHOD: u4,
        /// Configures S8 in table, dual-edge B mode.\\0: fed/red take effect on different path separately\\1: fed/red take effect on B path, A out is in bypass or dulpB mode
        DB_DEB_MODE: u1,
        /// Configures S6 in table.
        DB_A_OUTSWAP: u1,
        /// Configures S7 in table.
        DB_B_OUTSWAP: u1,
        /// Configures S4 in table.
        DB_RED_INSEL: u1,
        /// Configures S5 in table.
        DB_FED_INSEL: u1,
        /// Configures S2 in table.
        DB_RED_OUTINVERT: u1,
        /// Configures S3 in table.
        DB_FED_OUTINVERT: u1,
        /// Configures S1 in table.
        DB_A_OUTBYPASS: u1,
        /// Configures S0 in table.
        DB_B_OUTBYPASS: u1,
        /// Configures dead time generator %s clock selection.\\0: PWM_clk\\1: PT_clk
        DB_CLK_SEL: u1,
        padding: u14 = 0,
    }),
    /// Falling edge delay (FED) shadow register
    /// offset: 0x94
    DT1_FED_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures shadow register for FED.
        DB_FED: u16,
        padding: u16 = 0,
    }),
    /// Rising edge delay (RED) shadow register
    /// offset: 0x98
    DT1_RED_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures shadow register for RED.
        DB_RED: u16,
        padding: u16 = 0,
    }),
    /// Carrier%s configuration register
    /// offset: 0x9c
    CARRIER1_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable carrier%s.\\0: Bypassed\\1: Enabled
        CHOPPER_EN: u1,
        /// Configures the prescale value of PWM carrier%s clock (PC_clk), so that period of PC_clk = period of PWM_clk * (PWM_CARRIER%s_PRESCALE + 1)
        CHOPPER_PRESCALE: u4,
        /// Configures carrier duty. Duty = PWM_CARRIER%s_DUTY / 8
        CHOPPER_DUTY: u3,
        /// Configures width of the first pulse. Measurement unit: Periods of the carrier.
        CHOPPER_OSHTWTH: u4,
        /// Configures whether or not to invert the output of PWM%s A and PWM%s B for this submodule.\\0: Normal\\1: Invert
        CHOPPER_OUT_INVERT: u1,
        /// Configures whether or not to invert the input of PWM%s A and PWM%s B for this submodule.\\0: Normal\\1: Invert
        CHOPPER_IN_INVERT: u1,
        padding: u18 = 0,
    }),
    /// PWM%s A and PWM%s B trip events actions configuration register
    /// offset: 0xa0
    FH1_CFG0: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable software force cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_SW_CBC: u1,
        /// Configures whether or not event_f2 will trigger cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_F2_CBC: u1,
        /// Configures whether or not event_f1 will trigger cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_F1_CBC: u1,
        /// Configures whether or not event_f0 will trigger cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_F0_CBC: u1,
        /// Configures whether or not to enable software force one-shot mode action.\\0: Disable\\1: Enable
        TZ_SW_OST: u1,
        /// Configures whether or not event_f2 will trigger one-shot mode action.\\0: Disable\\1: Enable
        TZ_F2_OST: u1,
        /// Configures whether or not event_f1 will trigger one-shot mode action.\\0: Disable\\1: Enable
        TZ_F1_OST: u1,
        /// Configures whether or not event_f0 will trigger one-shot mode action.\\0: Disable\\1: Enable
        TZ_F0_OST: u1,
        /// Configures cycle-by-cycle mode action on PWM%s A when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_CBC_D: u2,
        /// Configures cycle-by-cycle mode action on PWM%s A when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_CBC_U: u2,
        /// Configures one-shot mode action on PWM%s A when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_OST_D: u2,
        /// Configures one-shot mode action on PWM%s A when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_OST_U: u2,
        /// Configures cycle-by-cycle mode action on PWM%s B when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_CBC_D: u2,
        /// Configures cycle-by-cycle mode action on PWM%s B when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_CBC_U: u2,
        /// Configures one-shot mode action on PWM%s B when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_OST_D: u2,
        /// Configures one-shot mode action on PWM%s B when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_OST_U: u2,
        padding: u8 = 0,
    }),
    /// Software triggers for fault handler actions configuration register
    /// offset: 0xa4
    FH1_CFG1: mmio.Mmio(packed struct(u32) {
        /// Configures the generation of software one-shot mode action clear. A toggle (software negate its value) triggers a clear for on going one-shot mode action.
        TZ_CLR_OST: u1,
        /// Configures the refresh moment selection of cycle-by-cycle mode action.\\0: Select nothing, will not refresh\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP
        TZ_CBCPULSE: u2,
        /// Configures the generation of software cycle-by-cycle mode action. A toggle (software negate its value) triggers a cycle-by-cycle mode action.
        TZ_FORCE_CBC: u1,
        /// Configures the generation of software one-shot mode action. A toggle (software negate its value) triggers a one-shot mode action.
        TZ_FORCE_OST: u1,
        padding: u27 = 0,
    }),
    /// Fault events status register
    /// offset: 0xa8
    FH1_STATUS: mmio.Mmio(packed struct(u32) {
        /// Represents whether or not an cycle-by-cycle mode action is on going.\\0:No action\\1: On going
        TZ_CBC_ON: u1,
        /// Represents whether or not an one-shot mode action is on going.\\0:No action\\1: On going
        TZ_OST_ON: u1,
        padding: u30 = 0,
    }),
    /// Generator%s time stamp registers A and B transfer status and update method register
    /// offset: 0xac
    GEN2_STMP_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures the update method for PWM generator %s time stamp A's active register.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        CMPR_A_UPMETHOD: u4,
        /// Configures the update method for PWM generator %s time stamp B's active register.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        CMPR_B_UPMETHOD: u4,
        /// Represents whether or not generator%s time stamp A's shadow reg is transferred.\\0: A's active reg has been updated with shadow register latest value.\\1: A's shadow reg is filled and waiting to be transferred to A's active reg
        CMPR_A_SHDW_FULL: u1,
        /// Represents whether or not generator%s time stamp B's shadow reg is transferred.\\0: B's active reg has been updated with shadow register latest value.\\1: B's shadow reg is filled and waiting to be transferred to B's active reg
        CMPR_B_SHDW_FULL: u1,
        padding: u22 = 0,
    }),
    /// Generator%s time stamp A's shadow register
    /// offset: 0xb0
    GEN2_TSTMP_A: mmio.Mmio(packed struct(u32) {
        /// Configures the value of PWM generator %s time stamp A's shadow register.
        CMPR_A: u16,
        padding: u16 = 0,
    }),
    /// Generator%s time stamp B's shadow register
    /// offset: 0xb4
    GEN2_TSTMP_B: mmio.Mmio(packed struct(u32) {
        /// Configures the value of PWM generator %s time stamp B's shadow register.
        CMPR_B: u16,
        padding: u16 = 0,
    }),
    /// Generator%s fault event T0 and T1 configuration register
    /// offset: 0xb8
    GEN2_CFG0: mmio.Mmio(packed struct(u32) {
        /// Configures update method for PWM generator %s's active register.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        GEN_CFG_UPMETHOD: u4,
        /// Configures source selection for PWM generator %s event_t0, take effect immediately.\\0: fault_event0\\1: fault_event1\\2: fault_event2\\3: sync_taken\\4: Invalid, Select nothing
        GEN_T0_SEL: u3,
        /// Configures source selection for PWM generator %s event_t1, take effect immediately.\\0: fault_event0\\1: fault_event1\\2: fault_event2\\3: sync_taken\\4: Invalid, Select nothing
        GEN_T1_SEL: u3,
        padding: u22 = 0,
    }),
    /// Generator%s output signal force mode register.
    /// offset: 0xbc
    GEN2_FORCE: mmio.Mmio(packed struct(u32) {
        /// Configures update method for continuous software force of PWM generator%s.\\0: Immediately\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: TEA\\Bit3 is set to 1: TEB\\Bit4 is set to 1: Sync\\Bit5 is set to 1: Disable update. TEA/B here and below means an event generated when the timer's value equals to that of register A/B.
        GEN_CNTUFORCE_UPMETHOD: u6,
        /// Configures continuous software force mode for PWM%s A.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_A_CNTUFORCE_MODE: u2,
        /// Configures continuous software force mode for PWM%s B.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_B_CNTUFORCE_MODE: u2,
        /// Configures the generation of non-continuous immediate software-force event for PWM%s A, a toggle will trigger a force event.
        GEN_A_NCIFORCE: u1,
        /// Configures non-continuous immediate software force mode for PWM%s A.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_A_NCIFORCE_MODE: u2,
        /// Configures the generation of non-continuous immediate software-force event for PWM%s B, a toggle will trigger a force event.
        GEN_B_NCIFORCE: u1,
        /// Configures non-continuous immediate software force mode for PWM%s B.\\0: Disabled\\1: Low\\2: High\\3: Disabled
        GEN_B_NCIFORCE_MODE: u2,
        padding: u16 = 0,
    }),
    /// PWM%s output signal A actions configuration register
    /// offset: 0xc0
    GEN2_A: mmio.Mmio(packed struct(u32) {
        /// Configures action on PWM%s A triggered by event TEZ when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEZ: u2,
        /// Configures action on PWM%s A triggered by event TEP when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEP: u2,
        /// Configures action on PWM%s A triggered by event TEA when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEA: u2,
        /// Configures action on PWM%s A triggered by event TEB when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEB: u2,
        /// Configures action on PWM%s A triggered by event_t0 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT0: u2,
        /// Configures action on PWM%s A triggered by event_t1 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT1: u2,
        /// Configures action on PWM%s A triggered by event TEZ when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEZ: u2,
        /// Configures action on PWM%s A triggered by event TEP when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEP: u2,
        /// Configures action on PWM%s A triggered by event TEA when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEA: u2,
        /// Configures action on PWM%s A triggered by event TEB when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEB: u2,
        /// Configures action on PWM%s A triggered by event_t0 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT0: u2,
        /// Configures action on PWM%s A triggered by event_t1 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT1: u2,
        padding: u8 = 0,
    }),
    /// PWM%s output signal B actions configuration register
    /// offset: 0xc4
    GEN2_B: mmio.Mmio(packed struct(u32) {
        /// Configures action on PWM%s B triggered by event TEZ when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEZ: u2,
        /// Configures action on PWM%s B triggered by event TEP when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEP: u2,
        /// Configures action on PWM%s B triggered by event TEA when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEA: u2,
        /// Configures action on PWM%s B triggered by event TEB when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UTEB: u2,
        /// Configures action on PWM%s B triggered by event_t0 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT0: u2,
        /// Configures action on PWM%s B triggered by event_t1 when timer increasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        UT1: u2,
        /// Configures action on PWM%s B triggered by event TEZ when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEZ: u2,
        /// Configures action on PWM%s B triggered by event TEP when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEP: u2,
        /// Configures action on PWM%s B triggered by event TEA when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEA: u2,
        /// Configures action on PWM%s B triggered by event TEB when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DTEB: u2,
        /// Configures action on PWM%s B triggered by event_t0 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT0: u2,
        /// Configures action on PWM%s B triggered by event_t1 when timer decreasing.\\0: No change\\1: Low\\2: High\\3: Toggle
        DT1: u2,
        padding: u8 = 0,
    }),
    /// Dead time configuration register
    /// offset: 0xc8
    DT2_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures update method for FED (Falling edge delay) active register.\\0: Immediate\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        DB_FED_UPMETHOD: u4,
        /// Configures update method for RED (rising edge delay) active register.\\0: Immediate\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP\\Bit2 is set to 1: Sync\\Bit3 is set to 1: Disable the update
        DB_RED_UPMETHOD: u4,
        /// Configures S8 in table, dual-edge B mode.\\0: fed/red take effect on different path separately\\1: fed/red take effect on B path, A out is in bypass or dulpB mode
        DB_DEB_MODE: u1,
        /// Configures S6 in table.
        DB_A_OUTSWAP: u1,
        /// Configures S7 in table.
        DB_B_OUTSWAP: u1,
        /// Configures S4 in table.
        DB_RED_INSEL: u1,
        /// Configures S5 in table.
        DB_FED_INSEL: u1,
        /// Configures S2 in table.
        DB_RED_OUTINVERT: u1,
        /// Configures S3 in table.
        DB_FED_OUTINVERT: u1,
        /// Configures S1 in table.
        DB_A_OUTBYPASS: u1,
        /// Configures S0 in table.
        DB_B_OUTBYPASS: u1,
        /// Configures dead time generator %s clock selection.\\0: PWM_clk\\1: PT_clk
        DB_CLK_SEL: u1,
        padding: u14 = 0,
    }),
    /// Falling edge delay (FED) shadow register
    /// offset: 0xcc
    DT2_FED_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures shadow register for FED.
        DB_FED: u16,
        padding: u16 = 0,
    }),
    /// Rising edge delay (RED) shadow register
    /// offset: 0xd0
    DT2_RED_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures shadow register for RED.
        DB_RED: u16,
        padding: u16 = 0,
    }),
    /// Carrier%s configuration register
    /// offset: 0xd4
    CARRIER2_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable carrier%s.\\0: Bypassed\\1: Enabled
        CHOPPER_EN: u1,
        /// Configures the prescale value of PWM carrier%s clock (PC_clk), so that period of PC_clk = period of PWM_clk * (PWM_CARRIER%s_PRESCALE + 1)
        CHOPPER_PRESCALE: u4,
        /// Configures carrier duty. Duty = PWM_CARRIER%s_DUTY / 8
        CHOPPER_DUTY: u3,
        /// Configures width of the first pulse. Measurement unit: Periods of the carrier.
        CHOPPER_OSHTWTH: u4,
        /// Configures whether or not to invert the output of PWM%s A and PWM%s B for this submodule.\\0: Normal\\1: Invert
        CHOPPER_OUT_INVERT: u1,
        /// Configures whether or not to invert the input of PWM%s A and PWM%s B for this submodule.\\0: Normal\\1: Invert
        CHOPPER_IN_INVERT: u1,
        padding: u18 = 0,
    }),
    /// PWM%s A and PWM%s B trip events actions configuration register
    /// offset: 0xd8
    FH2_CFG0: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable software force cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_SW_CBC: u1,
        /// Configures whether or not event_f2 will trigger cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_F2_CBC: u1,
        /// Configures whether or not event_f1 will trigger cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_F1_CBC: u1,
        /// Configures whether or not event_f0 will trigger cycle-by-cycle mode action.\\0: Disable\\1: Enable
        TZ_F0_CBC: u1,
        /// Configures whether or not to enable software force one-shot mode action.\\0: Disable\\1: Enable
        TZ_SW_OST: u1,
        /// Configures whether or not event_f2 will trigger one-shot mode action.\\0: Disable\\1: Enable
        TZ_F2_OST: u1,
        /// Configures whether or not event_f1 will trigger one-shot mode action.\\0: Disable\\1: Enable
        TZ_F1_OST: u1,
        /// Configures whether or not event_f0 will trigger one-shot mode action.\\0: Disable\\1: Enable
        TZ_F0_OST: u1,
        /// Configures cycle-by-cycle mode action on PWM%s A when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_CBC_D: u2,
        /// Configures cycle-by-cycle mode action on PWM%s A when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_CBC_U: u2,
        /// Configures one-shot mode action on PWM%s A when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_OST_D: u2,
        /// Configures one-shot mode action on PWM%s A when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_A_OST_U: u2,
        /// Configures cycle-by-cycle mode action on PWM%s B when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_CBC_D: u2,
        /// Configures cycle-by-cycle mode action on PWM%s B when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_CBC_U: u2,
        /// Configures one-shot mode action on PWM%s B when fault event occurs and timer is decreasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_OST_D: u2,
        /// Configures one-shot mode action on PWM%s B when fault event occurs and timer is increasing.\\0: Do nothing\\1: Force low\\2: Force high\\3: Toggle
        TZ_B_OST_U: u2,
        padding: u8 = 0,
    }),
    /// Software triggers for fault handler actions configuration register
    /// offset: 0xdc
    FH2_CFG1: mmio.Mmio(packed struct(u32) {
        /// Configures the generation of software one-shot mode action clear. A toggle (software negate its value) triggers a clear for on going one-shot mode action.
        TZ_CLR_OST: u1,
        /// Configures the refresh moment selection of cycle-by-cycle mode action.\\0: Select nothing, will not refresh\\Bit0 is set to 1: TEZ\\Bit1 is set to 1: TEP
        TZ_CBCPULSE: u2,
        /// Configures the generation of software cycle-by-cycle mode action. A toggle (software negate its value) triggers a cycle-by-cycle mode action.
        TZ_FORCE_CBC: u1,
        /// Configures the generation of software one-shot mode action. A toggle (software negate its value) triggers a one-shot mode action.
        TZ_FORCE_OST: u1,
        padding: u27 = 0,
    }),
    /// Fault events status register
    /// offset: 0xe0
    FH2_STATUS: mmio.Mmio(packed struct(u32) {
        /// Represents whether or not an cycle-by-cycle mode action is on going.\\0:No action\\1: On going
        TZ_CBC_ON: u1,
        /// Represents whether or not an one-shot mode action is on going.\\0:No action\\1: On going
        TZ_OST_ON: u1,
        padding: u30 = 0,
    }),
    /// Fault detection configuration and status register
    /// offset: 0xe4
    FAULT_DETECT: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable event_f0 generation.\\0: Disable\\1: Enable
        F0_EN: u1,
        /// Configures whether or not to enable event_f1 generation.\\0: Disable\\1: Enable
        F1_EN: u1,
        /// Configures whether or not to enable event_f2 generation.\\0: Disable\\1: Enable
        F2_EN: u1,
        /// Configures event_f0 trigger polarity on FAULT0 source from GPIO matrix.\\0: Level low\\1: Level high
        F0_POLE: u1,
        /// Configures event_f1 trigger polarity on FAULT1 source from GPIO matrix.\\0: Level low\\1: Level high
        F1_POLE: u1,
        /// Configures event_f2 trigger polarity on FAULT2 source from GPIO matrix.\\0: Level low\\1: Level high
        F2_POLE: u1,
        /// Represents whether or not an event_f0 is on going.\\0: No action\\1: On going
        EVENT_F0: u1,
        /// Represents whether or not an event_f1 is on going.\\0: No action\\1: On going
        EVENT_F1: u1,
        /// Represents whether or not an event_f2 is on going.\\0: No action\\1: On going
        EVENT_F2: u1,
        padding: u23 = 0,
    }),
    /// Capture timer configuration register
    /// offset: 0xe8
    CAP_TIMER_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable capture timer increment.\\0: Disable\\1: Enable
        CAP_TIMER_EN: u1,
        /// Configures whether or not to enable capture timer sync.\\0: Disable\\1: Enable
        CAP_SYNCI_EN: u1,
        /// Configures the selection of capture module sync input.\\0: None\\1: Timer0 sync_out\\2: Timer1 sync_out\\3: Timer2 sync_out\\4: SYNC0 from GPIO matrix\\5: SYNC1 from GPIO matrix\\6: SYNC2 from GPIO matrix\\7: None
        CAP_SYNCI_SEL: u3,
        /// Configures the generation of a capture timer sync when reg_cap_synci_en is 1.\\0: Invalid, No effect\\1: Trigger a capture timer sync, capture timer is loaded with value in phase register
        CAP_SYNC_SW: u1,
        padding: u26 = 0,
    }),
    /// Capture timer sync phase register
    /// offset: 0xec
    CAP_TIMER_PHASE: mmio.Mmio(packed struct(u32) {
        /// Configures phase value for capture timer sync operation.
        CAP_PHASE: u32,
    }),
    /// Capture channel %s configuration register
    /// offset: 0xf0
    CAP_CH0_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable capture on channel %s.\\0: Disable\\1: Enable
        CAP_EN: u1,
        /// Configures which edge of capture on channel %s after prescaling is used.\\0: None\\Bit0 is set to 1: Rnable capture on the negative edge\\Bit1 is set to 1: Enable capture on the positive edge
        CAP_MODE: u2,
        /// Configures prescale value on possitive edge of CAP%s. Prescale value = PWM_CAP%s_PRESCALE + 1
        CAP_PRESCALE: u8,
        /// Configures whether or not to invert CAP%s from GPIO matrix before prescale.\\0: Normal\\1: Invert
        CAP_IN_INVERT: u1,
        /// Configures the generation of software capture.\\0: Invalid, No effect\\1: Trigger a software forced capture on channel %s
        CAP_SW: u1,
        padding: u19 = 0,
    }),
    /// Capture channel %s configuration register
    /// offset: 0xf4
    CAP_CH1_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable capture on channel %s.\\0: Disable\\1: Enable
        CAP_EN: u1,
        /// Configures which edge of capture on channel %s after prescaling is used.\\0: None\\Bit0 is set to 1: Rnable capture on the negative edge\\Bit1 is set to 1: Enable capture on the positive edge
        CAP_MODE: u2,
        /// Configures prescale value on possitive edge of CAP%s. Prescale value = PWM_CAP%s_PRESCALE + 1
        CAP_PRESCALE: u8,
        /// Configures whether or not to invert CAP%s from GPIO matrix before prescale.\\0: Normal\\1: Invert
        CAP_IN_INVERT: u1,
        /// Configures the generation of software capture.\\0: Invalid, No effect\\1: Trigger a software forced capture on channel %s
        CAP_SW: u1,
        padding: u19 = 0,
    }),
    /// Capture channel %s configuration register
    /// offset: 0xf8
    CAP_CH2_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable capture on channel %s.\\0: Disable\\1: Enable
        CAP_EN: u1,
        /// Configures which edge of capture on channel %s after prescaling is used.\\0: None\\Bit0 is set to 1: Rnable capture on the negative edge\\Bit1 is set to 1: Enable capture on the positive edge
        CAP_MODE: u2,
        /// Configures prescale value on possitive edge of CAP%s. Prescale value = PWM_CAP%s_PRESCALE + 1
        CAP_PRESCALE: u8,
        /// Configures whether or not to invert CAP%s from GPIO matrix before prescale.\\0: Normal\\1: Invert
        CAP_IN_INVERT: u1,
        /// Configures the generation of software capture.\\0: Invalid, No effect\\1: Trigger a software forced capture on channel %s
        CAP_SW: u1,
        padding: u19 = 0,
    }),
    /// CAP%s capture value register
    /// offset: 0xfc
    CAP_CH0: mmio.Mmio(packed struct(u32) {
        /// Represents value of last capture on CAP%s
        CAP_VALUE: u32,
    }),
    /// CAP%s capture value register
    /// offset: 0x100
    CAP_CH1: mmio.Mmio(packed struct(u32) {
        /// Represents value of last capture on CAP%s
        CAP_VALUE: u32,
    }),
    /// CAP%s capture value register
    /// offset: 0x104
    CAP_CH2: mmio.Mmio(packed struct(u32) {
        /// Represents value of last capture on CAP%s
        CAP_VALUE: u32,
    }),
    /// Last capture trigger edge information register
    /// offset: 0x108
    CAP_STATUS: mmio.Mmio(packed struct(u32) {
        /// Represents edge of last capture trigger on channel0.\\0: Posedge\\1: Negedge
        CAP0_EDGE: u1,
        /// Represents edge of last capture trigger on channel1.\\0: Posedge\\1: Negedge
        CAP1_EDGE: u1,
        /// Represents edge of last capture trigger on channel2.\\0: Posedge\\1: Negedge
        CAP2_EDGE: u1,
        padding: u29 = 0,
    }),
    /// Generator Update configuration register
    /// offset: 0x10c
    UPDATE_CFG: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable global update for all active registers in MCPWM module.\\0: Disable\\1: Enable
        GLOBAL_UP_EN: u1,
        /// Configures the generation of global forced update for all active registers in MCPWM module. A toggle (software invert its value) will trigger a global forced update. Valid only when MCPWM_GLOBAL_UP_EN and MCPWM_OP0/1/2_UP_EN are both set to 1.
        GLOBAL_FORCE_UP: u1,
        /// Configures whether or not to enable update of active registers in PWM operator0. Valid only when PWM_GLOBAL_UP_EN is set to 1.\\0: Disable\\1: Enable
        OP0_UP_EN: u1,
        /// Configures the generation of forced update for active registers in PWM operator0. A toggle (software invert its value) will trigger a forced update. Valid only when MCPWM_GLOBAL_UP_EN and MCPWM_OP0_UP_EN are both set to 1.
        OP0_FORCE_UP: u1,
        /// Configures whether or not to enable update of active registers in PWM operator1. Valid only when PWM_GLOBAL_UP_EN is set to 1.\\0: Disable\\1: Enable
        OP1_UP_EN: u1,
        /// Configures the generation of forced update for active registers in PWM operator1. A toggle (software invert its value) will trigger a forced update. Valid only when MCPWM_GLOBAL_UP_EN and MCPWM_OP1_UP_EN are both set to 1.
        OP1_FORCE_UP: u1,
        /// Configures whether or not to enable update of active registers in PWM operator2. Valid only when PWM_GLOBAL_UP_EN is set to 1.\\0: Disable\\1: Enable
        OP2_UP_EN: u1,
        /// Configures the generation of forced update for active registers in PWM operator2. A toggle (software invert its value) will trigger a forced update. Valid only when MCPWM_GLOBAL_UP_EN and MCPWM_OP2_UP_EN are both set to 1.
        OP2_FORCE_UP: u1,
        padding: u24 = 0,
    }),
    /// Interrupt enable register
    /// offset: 0x110
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// Enable bit: Write 1 to enable the interrupt triggered when the timer 0 stops.
        TIMER0_STOP_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered when the timer 1 stops.
        TIMER1_STOP_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered when the timer 2 stops.
        TIMER2_STOP_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM timer 0 TEZ event.
        TIMER0_TEZ_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM timer 1 TEZ event.
        TIMER1_TEZ_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM timer 2 TEZ event.
        TIMER2_TEZ_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM timer 0 TEP event.
        TIMER0_TEP_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM timer 1 TEP event.
        TIMER1_TEP_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM timer 2 TEP event.
        TIMER2_TEP_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered when event_f0 starts.
        FAULT0_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered when event_f1 starts.
        FAULT1_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered when event_f2 starts.
        FAULT2_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered when event_f0 clears.
        FAULT0_CLR_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered when event_f1 clears.
        FAULT1_CLR_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered when event_f2 clears.
        FAULT2_CLR_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM operator 0 TEA event.
        CMPR0_TEA_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM operator 1 TEA event.
        CMPR1_TEA_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM operator 2 TEA event.
        CMPR2_TEA_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM operator 0 TEB event.
        CMPR0_TEB_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM operator 1 TEB event.
        CMPR1_TEB_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a PWM operator 2 TEB event.
        CMPR2_TEB_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a cycle-by-cycle mode action on PWM0.
        TZ0_CBC_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a cycle-by-cycle mode action on PWM1.
        TZ1_CBC_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a cycle-by-cycle mode action on PWM2.
        TZ2_CBC_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a one-shot mode action on PWM0.
        TZ0_OST_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a one-shot mode action on PWM1.
        TZ1_OST_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by a one-shot mode action on PWM2.
        TZ2_OST_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by capture on CAP0.
        CAP0_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by capture on CAP1.
        CAP1_INT_ENA: u1,
        /// Enable bit: Write 1 to enable the interrupt triggered by capture on CAP2.
        CAP2_INT_ENA: u1,
        padding: u2 = 0,
    }),
    /// Interrupt raw status register
    /// offset: 0x114
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// Raw status bit: The raw interrupt status of the interrupt triggered when the timer 0 stops.
        TIMER0_STOP_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered when the timer 1 stops.
        TIMER1_STOP_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered when the timer 2 stops.
        TIMER2_STOP_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM timer 0 TEZ event.
        TIMER0_TEZ_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM timer 1 TEZ event.
        TIMER1_TEZ_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM timer 2 TEZ event.
        TIMER2_TEZ_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM timer 0 TEP event.
        TIMER0_TEP_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM timer 1 TEP event.
        TIMER1_TEP_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM timer 2 TEP event.
        TIMER2_TEP_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered when event_f0 starts.
        FAULT0_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered when event_f1 starts.
        FAULT1_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered when event_f2 starts.
        FAULT2_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered when event_f0 clears.
        FAULT0_CLR_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered when event_f1 clears.
        FAULT1_CLR_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered when event_f2 clears.
        FAULT2_CLR_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM operator 0 TEA event
        CMPR0_TEA_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM operator 1 TEA event
        CMPR1_TEA_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM operator 2 TEA event
        CMPR2_TEA_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM operator 0 TEB event
        CMPR0_TEB_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM operator 1 TEB event
        CMPR1_TEB_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a PWM operator 2 TEB event
        CMPR2_TEB_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a cycle-by-cycle mode action on PWM0.
        TZ0_CBC_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a cycle-by-cycle mode action on PWM1.
        TZ1_CBC_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a cycle-by-cycle mode action on PWM2.
        TZ2_CBC_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a one-shot mode action on PWM0.
        TZ0_OST_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a one-shot mode action on PWM1.
        TZ1_OST_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by a one-shot mode action on PWM2.
        TZ2_OST_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by capture on CAP0.
        CAP0_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by capture on CAP1.
        CAP1_INT_RAW: u1,
        /// Raw status bit: The raw interrupt status of the interrupt triggered by capture on CAP2.
        CAP2_INT_RAW: u1,
        padding: u2 = 0,
    }),
    /// Interrupt masked status register
    /// offset: 0x118
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// Masked status bit: The masked interrupt status of the interrupt triggered when the timer 0 stops.
        TIMER0_STOP_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered when the timer 1 stops.
        TIMER1_STOP_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered when the timer 2 stops.
        TIMER2_STOP_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM timer 0 TEZ event.
        TIMER0_TEZ_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM timer 1 TEZ event.
        TIMER1_TEZ_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM timer 2 TEZ event.
        TIMER2_TEZ_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM timer 0 TEP event.
        TIMER0_TEP_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM timer 1 TEP event.
        TIMER1_TEP_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM timer 2 TEP event.
        TIMER2_TEP_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered when event_f0 starts.
        FAULT0_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered when event_f1 starts.
        FAULT1_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered when event_f2 starts.
        FAULT2_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered when event_f0 clears.
        FAULT0_CLR_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered when event_f1 clears.
        FAULT1_CLR_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered when event_f2 clears.
        FAULT2_CLR_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM operator 0 TEA event
        CMPR0_TEA_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM operator 1 TEA event
        CMPR1_TEA_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM operator 2 TEA event
        CMPR2_TEA_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM operator 0 TEB event
        CMPR0_TEB_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM operator 1 TEB event
        CMPR1_TEB_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a PWM operator 2 TEB event
        CMPR2_TEB_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a cycle-by-cycle mode action on PWM0.
        TZ0_CBC_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a cycle-by-cycle mode action on PWM1.
        TZ1_CBC_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a cycle-by-cycle mode action on PWM2.
        TZ2_CBC_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a one-shot mode action on PWM0.
        TZ0_OST_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a one-shot mode action on PWM1.
        TZ1_OST_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by a one-shot mode action on PWM2.
        TZ2_OST_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by capture on CAP0.
        CAP0_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by capture on CAP1.
        CAP1_INT_ST: u1,
        /// Masked status bit: The masked interrupt status of the interrupt triggered by capture on CAP2.
        CAP2_INT_ST: u1,
        padding: u2 = 0,
    }),
    /// Interrupt clear register
    /// offset: 0x11c
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Clear bit: Write 1 to clear the interrupt triggered when the timer 0 stops.
        TIMER0_STOP_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered when the timer 1 stops.
        TIMER1_STOP_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered when the timer 2 stops.
        TIMER2_STOP_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM timer 0 TEZ event.
        TIMER0_TEZ_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM timer 1 TEZ event.
        TIMER1_TEZ_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM timer 2 TEZ event.
        TIMER2_TEZ_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM timer 0 TEP event.
        TIMER0_TEP_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM timer 1 TEP event.
        TIMER1_TEP_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM timer 2 TEP event.
        TIMER2_TEP_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered when event_f0 starts.
        FAULT0_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered when event_f1 starts.
        FAULT1_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered when event_f2 starts.
        FAULT2_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered when event_f0 clears.
        FAULT0_CLR_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered when event_f1 clears.
        FAULT1_CLR_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered when event_f2 clears.
        FAULT2_CLR_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM operator 0 TEA event
        CMPR0_TEA_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM operator 1 TEA event
        CMPR1_TEA_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM operator 2 TEA event
        CMPR2_TEA_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM operator 0 TEB event
        CMPR0_TEB_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM operator 1 TEB event
        CMPR1_TEB_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a PWM operator 2 TEB event
        CMPR2_TEB_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a cycle-by-cycle mode action on PWM0.
        TZ0_CBC_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a cycle-by-cycle mode action on PWM1.
        TZ1_CBC_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a cycle-by-cycle mode action on PWM2.
        TZ2_CBC_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a one-shot mode action on PWM0.
        TZ0_OST_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a one-shot mode action on PWM1.
        TZ1_OST_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by a one-shot mode action on PWM2.
        TZ2_OST_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by capture on CAP0.
        CAP0_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by capture on CAP1.
        CAP1_INT_CLR: u1,
        /// Clear bit: Write 1 to clear the interrupt triggered by capture on CAP2.
        CAP2_INT_CLR: u1,
        padding: u2 = 0,
    }),
    /// Event enable register
    /// offset: 0x120
    EVT_EN: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable timer0 stop event generate.\\0: Disable\\1: Enable
        EVT_TIMER0_STOP_EN: u1,
        /// Configures whether or not to enable timer1 stop event generate.\\0: Disable\\1: Enable
        EVT_TIMER1_STOP_EN: u1,
        /// Configures whether or not to enable timer2 stop event generate.\\0: Disable\\1: Enable
        EVT_TIMER2_STOP_EN: u1,
        /// Configures whether or not to enable timer0 equal zero event generate.\\0: Disable\\1: Enable
        EVT_TIMER0_TEZ_EN: u1,
        /// Configures whether or not to enable timer1 equal zero event generate.\\0: Disable\\1: Enable
        EVT_TIMER1_TEZ_EN: u1,
        /// Configures whether or not to enable timer2 equal zero event generate.\\0: Disable\\1: Enable
        EVT_TIMER2_TEZ_EN: u1,
        /// Configures whether or not to enable timer0 equal period event generate.\\0: Disable\\1: Enable
        EVT_TIMER0_TEP_EN: u1,
        /// Configures whether or not to enable timer1 equal period event generate.\\0: Disable\\1: Enable
        EVT_TIMER1_TEP_EN: u1,
        /// Configures whether or not to enable timer2 equal period event generate.\\0: Disable\\1: Enable
        EVT_TIMER2_TEP_EN: u1,
        /// Configures whether or not to enable PWM generator0 timer equal a event generate.\\0: Disable\\1: Enable
        EVT_OP0_TEA_EN: u1,
        /// Configures whether or not to enable PWM generator1 timer equal a event generate.\\0: Disable\\1: Enable
        EVT_OP1_TEA_EN: u1,
        /// Configures whether or not to enable PWM generator2 timer equal a event generate.\\0: Disable\\1: Enable
        EVT_OP2_TEA_EN: u1,
        /// Configures whether or not to enable PWM generator0 timer equal b event generate.\\0: Disable\\1: Enable
        EVT_OP0_TEB_EN: u1,
        /// Configures whether or not to enable PWM generator1 timer equal b event generate.\\0: Disable\\1: Enable
        EVT_OP1_TEB_EN: u1,
        /// Configures whether or not to enable PWM generator2 timer equal b event generate.\\0: Disable\\1: Enable
        EVT_OP2_TEB_EN: u1,
        /// Configures whether or not to enable fault0 event generate.\\0: Disable\\1: Enable
        EVT_F0_EN: u1,
        /// Configures whether or not to enable fault1 event generate.\\0: Disable\\1: Enable
        EVT_F1_EN: u1,
        /// Configures whether or not to enable fault2 event generate.\\0: Disable\\1: Enable
        EVT_F2_EN: u1,
        /// Configures whether or not to enable fault0 clear event generate.\\0: Disable\\1: Enable
        EVT_F0_CLR_EN: u1,
        /// Configures whether or not to enable fault1 clear event generate.\\0: Disable\\1: Enable
        EVT_F1_CLR_EN: u1,
        /// Configures whether or not to enable fault2 clear event generate.\\0: Disable\\1: Enable
        EVT_F2_CLR_EN: u1,
        /// Configures whether or not to enable cycle-by-cycle trip0 event generate.\\0: Disable\\1: Enable
        EVT_TZ0_CBC_EN: u1,
        /// Configures whether or not to enable cycle-by-cycle trip1 event generate.\\0: Disable\\1: Enable
        EVT_TZ1_CBC_EN: u1,
        /// Configures whether or not to enable cycle-by-cycle trip2 event generate.\\0: Disable\\1: Enable
        EVT_TZ2_CBC_EN: u1,
        /// Configures whether or not to enable one-shot trip0 event generate.\\0: Disable\\1: Enable
        EVT_TZ0_OST_EN: u1,
        /// Configures whether or not to enable one-shot trip1 event generate.\\0: Disable\\1: Enable
        EVT_TZ1_OST_EN: u1,
        /// Configures whether or not to enable one-shot trip2 event generate.\\0: Disable\\1: Enable
        EVT_TZ2_OST_EN: u1,
        /// Configures whether or not to enable capture0 event generate.\\0: Disable\\1: Enable
        EVT_CAP0_EN: u1,
        /// Configures whether or not to enable capture1 event generate.\\0: Disable\\1: Enable
        EVT_CAP1_EN: u1,
        /// Configures whether or not to enable capture2 event generate.\\0: Disable\\1: Enable
        EVT_CAP2_EN: u1,
        padding: u2 = 0,
    }),
    /// Task enable register
    /// offset: 0x124
    TASK_EN: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable PWM generator0 timer stamp A's shadow register update task receive.\\0: Disable\\1: Enable
        TASK_CMPR0_A_UP_EN: u1,
        /// Configures whether or not to enable PWM generator1 timer stamp A's shadow register update task receive.\\0: Disable\\1: Enable
        TASK_CMPR1_A_UP_EN: u1,
        /// Configures whether or not to enable PWM generator2 timer stamp A's shadow register update task receive.\\0: Disable\\1: Enable
        TASK_CMPR2_A_UP_EN: u1,
        /// Configures whether or not to enable PWM generator0 timer stamp B's shadow register update task receive.\\0: Disable\\1: Enable
        TASK_CMPR0_B_UP_EN: u1,
        /// Configures whether or not to enable PWM generator1 timer stamp B's shadow register update task receive.\\0: Disable\\1: Enable
        TASK_CMPR1_B_UP_EN: u1,
        /// Configures whether or not to enable PWM generator2 timer stamp B's shadow register update task receive.\\0: Disable\\1: Enable
        TASK_CMPR2_B_UP_EN: u1,
        /// Configures whether or not to enable all PWM generate stop task receive.\\0: Disable\\1: Enable
        TASK_GEN_STOP_EN: u1,
        /// Configures whether or not to enable timer0 sync task receive.\\0: Disable\\1: Enable
        TASK_TIMER0_SYNC_EN: u1,
        /// Configures whether or not to enable timer1 sync task receive.\\0: Disable\\1: Enable
        TASK_TIMER1_SYNC_EN: u1,
        /// Configures whether or not to enable timer2 sync task receive.\\0: Disable\\1: Enable
        TASK_TIMER2_SYNC_EN: u1,
        /// Configures whether or not to enable timer0 period update task receive.\\0: Disable\\1: Enable
        TASK_TIMER0_PERIOD_UP_EN: u1,
        /// Configures whether or not to enable timer1 period update task receive.\\0: Disable\\1: Enable
        TASK_TIMER1_PERIOD_UP_EN: u1,
        /// Configures whether or not to enable timer2 period update task receive.\\0: Disable\\1: Enable
        TASK_TIMER2_PERIOD_UP_EN: u1,
        /// Configures whether or not to enable one shot trip0 task receive.\\0: Disable\\1: Enable
        TASK_TZ0_OST_EN: u1,
        /// Configures whether or not to enable one shot trip1 task receive.\\0: Disable\\1: Enable
        TASK_TZ1_OST_EN: u1,
        /// Configures whether or not to enable one shot trip2 task receive.\\0: Disable\\1: Enable
        TASK_TZ2_OST_EN: u1,
        /// Configures whether or not to enable one shot trip0 clear task receive.\\0: Disable\\1: Enable
        TASK_CLR0_OST_EN: u1,
        /// Configures whether or not to enable one shot trip1 clear task receive.\\0: Disable\\1: Enable
        TASK_CLR1_OST_EN: u1,
        /// Configures whether or not to enable one shot trip2 clear task receive.\\0: Disable\\1: Enable
        TASK_CLR2_OST_EN: u1,
        /// Configures whether or not to enable capture0 task receive.\\0: Disable\\1: Enable
        TASK_CAP0_EN: u1,
        /// Configures whether or not to enable capture1 task receive.\\0: Disable\\1: Enable
        TASK_CAP1_EN: u1,
        /// Configures whether or not to enable capture2 task receive.\\0: Disable\\1: Enable
        TASK_CAP2_EN: u1,
        padding: u10 = 0,
    }),
    /// Event enable register2
    /// offset: 0x128
    EVT_EN2: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to enable PWM generator0 timer equal OP0_TSTMP_E1_REG event generate.\\0: Disable\\1: Enable
        EVT_OP0_TEE1_EN: u1,
        /// Configures whether or not to enable PWM generator1 timer equal OP1_TSTMP_E1_REG event generate.\\0: Disable\\1: Enable
        EVT_OP1_TEE1_EN: u1,
        /// Configures whether or not to enable PWM generator2 timer equal OP2_TSTMP_E1_REG event generate.\\0: Disable\\1: Enable
        EVT_OP2_TEE1_EN: u1,
        /// Configures whether or not to enable PWM generator0 timer equal OP0_TSTMP_E2_REG event generate.\\0: Disable\\1: Enable
        EVT_OP0_TEE2_EN: u1,
        /// Configures whether or not to enable PWM generator1 timer equal OP1_TSTMP_E2_REG event generate.\\0: Disable\\1: Enable
        EVT_OP1_TEE2_EN: u1,
        /// Configures whether or not to enable PWM generator2 timer equal OP2_TSTMP_E2_REG event generate.\\0: Disable\\1: Enable
        EVT_OP2_TEE2_EN: u1,
        padding: u26 = 0,
    }),
    /// Generator%s timer stamp E1 value register
    /// offset: 0x12c
    OP0_TSTMP_E1: mmio.Mmio(packed struct(u32) {
        /// Configures generator%s timer stamp E1 value register
        OP_TSTMP_E1: u16,
        padding: u16 = 0,
    }),
    /// Generator%s timer stamp E2 value register
    /// offset: 0x130
    OP0_TSTMP_E2: mmio.Mmio(packed struct(u32) {
        /// Configures generator%s timer stamp E2 value register
        OP_TSTMP_E2: u16,
        padding: u16 = 0,
    }),
    /// Generator%s timer stamp E1 value register
    /// offset: 0x134
    OP1_TSTMP_E1: mmio.Mmio(packed struct(u32) {
        /// Configures generator%s timer stamp E1 value register
        OP_TSTMP_E1: u16,
        padding: u16 = 0,
    }),
    /// Generator%s timer stamp E2 value register
    /// offset: 0x138
    OP1_TSTMP_E2: mmio.Mmio(packed struct(u32) {
        /// Configures generator%s timer stamp E2 value register
        OP_TSTMP_E2: u16,
        padding: u16 = 0,
    }),
    /// Generator%s timer stamp E1 value register
    /// offset: 0x13c
    OP2_TSTMP_E1: mmio.Mmio(packed struct(u32) {
        /// Configures generator%s timer stamp E1 value register
        OP_TSTMP_E1: u16,
        padding: u16 = 0,
    }),
    /// Generator%s timer stamp E2 value register
    /// offset: 0x140
    OP2_TSTMP_E2: mmio.Mmio(packed struct(u32) {
        /// Configures generator%s timer stamp E2 value register
        OP_TSTMP_E2: u16,
        padding: u16 = 0,
    }),
    /// Global configuration register
    /// offset: 0x144
    CLK: mmio.Mmio(packed struct(u32) {
        /// Configures whether or not to open register clock gate.\\0: Open the clock gate only when application writes registers\\1: Force open the clock gate for register
        EN: u1,
        padding: u31 = 0,
    }),
    /// Version register.
    /// offset: 0x148
    VERSION: mmio.Mmio(packed struct(u32) {
        /// Configures the version.
        DATE: u28,
        padding: u4 = 0,
    }),
};
