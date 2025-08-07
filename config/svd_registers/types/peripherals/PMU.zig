const mmio = @import("mmio");
const types = @import("../../types.zig");

/// PMU Peripheral
pub const PMU = extern struct {
    /// need_des
    /// offset: 0x00
    HP_ACTIVE_DIG_POWER: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// need_des
        HP_ACTIVE_DCDC_SWITCH_PD_EN: u1,
        /// need_des
        HP_ACTIVE_HP_MEM_DSLP: u1,
        /// need_des
        HP_ACTIVE_PD_HP_MEM_PD_EN: u1,
        reserved30: u6 = 0,
        /// need_des
        HP_ACTIVE_PD_CNNT_PD_EN: u1,
        /// need_des
        HP_ACTIVE_PD_TOP_PD_EN: u1,
    }),
    /// need_des
    /// offset: 0x04
    HP_ACTIVE_ICG_HP_FUNC: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_ACTIVE_DIG_ICG_FUNC_EN: u32,
    }),
    /// need_des
    /// offset: 0x08
    HP_ACTIVE_ICG_HP_APB: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_ACTIVE_DIG_ICG_APB_EN: u32,
    }),
    /// need_des
    /// offset: 0x0c
    HP_ACTIVE_ICG_MODEM: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        HP_ACTIVE_DIG_ICG_MODEM_CODE: u2,
    }),
    /// need_des
    /// offset: 0x10
    HP_ACTIVE_HP_SYS_CNTL: mmio.Mmio(packed struct(u32) {
        reserved23: u23 = 0,
        /// need_des
        HP_ACTIVE_HP_POWER_DET_BYPASS: u1,
        /// need_des
        HP_ACTIVE_UART_WAKEUP_EN: u1,
        /// need_des
        HP_ACTIVE_LP_PAD_HOLD_ALL: u1,
        /// need_des
        HP_ACTIVE_HP_PAD_HOLD_ALL: u1,
        /// need_des
        HP_ACTIVE_DIG_PAD_SLP_SEL: u1,
        /// need_des
        HP_ACTIVE_DIG_PAUSE_WDT: u1,
        /// need_des
        HP_ACTIVE_DIG_CPU_STALL: u1,
        padding: u2 = 0,
    }),
    /// need_des
    /// offset: 0x14
    HP_ACTIVE_HP_CK_POWER: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// need_des
        HP_ACTIVE_I2C_ISO_EN: u1,
        /// need_des
        HP_ACTIVE_I2C_RETENTION: u1,
        /// need_des
        HP_ACTIVE_XPD_PLL_I2C: u4,
        /// need_des
        HP_ACTIVE_XPD_PLL: u4,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x18
    HP_ACTIVE_BIAS: mmio.Mmio(packed struct(u32) {
        reserved18: u18 = 0,
        /// need_des
        HP_ACTIVE_DCM_VSET: u5,
        /// need_des
        HP_ACTIVE_DCM_MODE: u2,
        /// need_des
        HP_ACTIVE_XPD_BIAS: u1,
        /// need_des
        HP_ACTIVE_DBG_ATTEN: u4,
        /// need_des
        HP_ACTIVE_PD_CUR: u1,
        /// need_des
        SLEEP: u1,
    }),
    /// need_des
    /// offset: 0x1c
    HP_ACTIVE_BACKUP: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// need_des
        HP_SLEEP2ACTIVE_BACKUP_MODEM_CLK_CODE: u2,
        /// need_des
        HP_MODEM2ACTIVE_BACKUP_MODEM_CLK_CODE: u2,
        reserved10: u2 = 0,
        /// need_des
        HP_ACTIVE_RETENTION_MODE: u1,
        /// need_des
        HP_SLEEP2ACTIVE_RETENTION_EN: u1,
        /// need_des
        HP_MODEM2ACTIVE_RETENTION_EN: u1,
        reserved14: u1 = 0,
        /// need_des
        HP_SLEEP2ACTIVE_BACKUP_CLK_SEL: u2,
        /// need_des
        HP_MODEM2ACTIVE_BACKUP_CLK_SEL: u2,
        reserved20: u2 = 0,
        /// need_des
        HP_SLEEP2ACTIVE_BACKUP_MODE: u3,
        /// need_des
        HP_MODEM2ACTIVE_BACKUP_MODE: u3,
        reserved29: u3 = 0,
        /// need_des
        HP_SLEEP2ACTIVE_BACKUP_EN: u1,
        /// need_des
        HP_MODEM2ACTIVE_BACKUP_EN: u1,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x20
    HP_ACTIVE_BACKUP_CLK: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_ACTIVE_BACKUP_ICG_FUNC_EN: u32,
    }),
    /// need_des
    /// offset: 0x24
    HP_ACTIVE_SYSCLK: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        HP_ACTIVE_DIG_SYS_CLK_NO_DIV: u1,
        /// need_des
        HP_ACTIVE_ICG_SYS_CLOCK_EN: u1,
        /// need_des
        HP_ACTIVE_SYS_CLK_SLP_SEL: u1,
        /// need_des
        HP_ACTIVE_ICG_SLP_SEL: u1,
        /// need_des
        HP_ACTIVE_DIG_SYS_CLK_SEL: u2,
    }),
    /// need_des
    /// offset: 0x28
    HP_ACTIVE_HP_REGULATOR0: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// need_des
        LP_DBIAS_VOL: u5,
        /// need_des
        HP_DBIAS_VOL: u5,
        /// need_des
        DIG_REGULATOR0_DBIAS_SEL: u1,
        /// need_des
        DIG_DBIAS_INIT: u1,
        /// need_des
        HP_ACTIVE_HP_REGULATOR_SLP_MEM_XPD: u1,
        /// need_des
        HP_ACTIVE_HP_REGULATOR_SLP_LOGIC_XPD: u1,
        /// need_des
        HP_ACTIVE_HP_REGULATOR_XPD: u1,
        /// need_des
        HP_ACTIVE_HP_REGULATOR_SLP_MEM_DBIAS: u4,
        /// need_des
        HP_ACTIVE_HP_REGULATOR_SLP_LOGIC_DBIAS: u4,
        /// need_des
        HP_ACTIVE_HP_REGULATOR_DBIAS: u5,
    }),
    /// need_des
    /// offset: 0x2c
    HP_ACTIVE_HP_REGULATOR1: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        HP_ACTIVE_HP_REGULATOR_DRV_B: u6,
    }),
    /// need_des
    /// offset: 0x30
    HP_ACTIVE_XTAL: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        HP_ACTIVE_XPD_XTAL: u1,
    }),
    /// need_des
    /// offset: 0x34
    HP_MODEM_DIG_POWER: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// need_des
        HP_MODEM_DCDC_SWITCH_PD_EN: u1,
        /// need_des
        HP_MODEM_HP_MEM_DSLP: u1,
        /// need_des
        HP_MODEM_PD_HP_MEM_PD_EN: u4,
        /// need_des
        HP_MODEM_PD_HP_WIFI_PD_EN: u1,
        reserved29: u1 = 0,
        /// need_des
        HP_MODEM_PD_HP_CPU_PD_EN: u1,
        /// need_des
        HP_MODEM_PD_CNNT_PD_EN: u1,
        /// need_des
        HP_MODEM_PD_TOP_PD_EN: u1,
    }),
    /// need_des
    /// offset: 0x38
    HP_MODEM_ICG_HP_FUNC: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_MODEM_DIG_ICG_FUNC_EN: u32,
    }),
    /// need_des
    /// offset: 0x3c
    HP_MODEM_ICG_HP_APB: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_MODEM_DIG_ICG_APB_EN: u32,
    }),
    /// need_des
    /// offset: 0x40
    HP_MODEM_ICG_MODEM: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        HP_MODEM_DIG_ICG_MODEM_CODE: u2,
    }),
    /// need_des
    /// offset: 0x44
    HP_MODEM_HP_SYS_CNTL: mmio.Mmio(packed struct(u32) {
        reserved23: u23 = 0,
        /// need_des
        HP_MODEM_HP_POWER_DET_BYPASS: u1,
        /// need_des
        HP_MODEM_UART_WAKEUP_EN: u1,
        /// need_des
        HP_MODEM_LP_PAD_HOLD_ALL: u1,
        /// need_des
        HP_MODEM_HP_PAD_HOLD_ALL: u1,
        /// need_des
        HP_MODEM_DIG_PAD_SLP_SEL: u1,
        /// need_des
        HP_MODEM_DIG_PAUSE_WDT: u1,
        /// need_des
        HP_MODEM_DIG_CPU_STALL: u1,
        padding: u2 = 0,
    }),
    /// need_des
    /// offset: 0x48
    HP_MODEM_HP_CK_POWER: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// need_des
        HP_MODEM_I2C_ISO_EN: u1,
        /// need_des
        HP_MODEM_I2C_RETENTION: u1,
        /// need_des
        HP_MODEM_XPD_PLL_I2C: u4,
        /// need_des
        HP_MODEM_XPD_PLL: u4,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x4c
    HP_MODEM_BIAS: mmio.Mmio(packed struct(u32) {
        reserved18: u18 = 0,
        /// need_des
        HP_MODEM_DCM_VSET: u5,
        /// need_des
        HP_MODEM_DCM_MODE: u2,
        /// need_des
        HP_MODEM_XPD_BIAS: u1,
        /// need_des
        HP_MODEM_DBG_ATTEN: u4,
        /// need_des
        HP_MODEM_PD_CUR: u1,
        /// need_des
        SLEEP: u1,
    }),
    /// need_des
    /// offset: 0x50
    HP_MODEM_BACKUP: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// need_des
        HP_SLEEP2MODEM_BACKUP_MODEM_CLK_CODE: u2,
        reserved10: u4 = 0,
        /// need_des
        HP_MODEM_RETENTION_MODE: u1,
        /// need_des
        HP_SLEEP2MODEM_RETENTION_EN: u1,
        reserved14: u2 = 0,
        /// need_des
        HP_SLEEP2MODEM_BACKUP_CLK_SEL: u2,
        reserved20: u4 = 0,
        /// need_des
        HP_SLEEP2MODEM_BACKUP_MODE: u3,
        reserved29: u6 = 0,
        /// need_des
        HP_SLEEP2MODEM_BACKUP_EN: u1,
        padding: u2 = 0,
    }),
    /// need_des
    /// offset: 0x54
    HP_MODEM_BACKUP_CLK: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_MODEM_BACKUP_ICG_FUNC_EN: u32,
    }),
    /// need_des
    /// offset: 0x58
    HP_MODEM_SYSCLK: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        HP_MODEM_DIG_SYS_CLK_NO_DIV: u1,
        /// need_des
        HP_MODEM_ICG_SYS_CLOCK_EN: u1,
        /// need_des
        HP_MODEM_SYS_CLK_SLP_SEL: u1,
        /// need_des
        HP_MODEM_ICG_SLP_SEL: u1,
        /// need_des
        HP_MODEM_DIG_SYS_CLK_SEL: u2,
    }),
    /// need_des
    /// offset: 0x5c
    HP_MODEM_HP_REGULATOR0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// need_des
        HP_MODEM_HP_REGULATOR_SLP_MEM_XPD: u1,
        /// need_des
        HP_MODEM_HP_REGULATOR_SLP_LOGIC_XPD: u1,
        /// need_des
        HP_MODEM_HP_REGULATOR_XPD: u1,
        /// need_des
        HP_MODEM_HP_REGULATOR_SLP_MEM_DBIAS: u4,
        /// need_des
        HP_MODEM_HP_REGULATOR_SLP_LOGIC_DBIAS: u4,
        /// need_des
        HP_MODEM_HP_REGULATOR_DBIAS: u5,
    }),
    /// need_des
    /// offset: 0x60
    HP_MODEM_HP_REGULATOR1: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// need_des
        HP_MODEM_HP_REGULATOR_DRV_B: u24,
    }),
    /// need_des
    /// offset: 0x64
    HP_MODEM_XTAL: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        HP_MODEM_XPD_XTAL: u1,
    }),
    /// need_des
    /// offset: 0x68
    HP_SLEEP_DIG_POWER: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// need_des
        HP_SLEEP_DCDC_SWITCH_PD_EN: u1,
        /// need_des
        HP_SLEEP_HP_MEM_DSLP: u1,
        /// need_des
        HP_SLEEP_PD_HP_MEM_PD_EN: u1,
        reserved30: u6 = 0,
        /// need_des
        HP_SLEEP_PD_CNNT_PD_EN: u1,
        /// need_des
        HP_SLEEP_PD_TOP_PD_EN: u1,
    }),
    /// need_des
    /// offset: 0x6c
    HP_SLEEP_ICG_HP_FUNC: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_SLEEP_DIG_ICG_FUNC_EN: u32,
    }),
    /// need_des
    /// offset: 0x70
    HP_SLEEP_ICG_HP_APB: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_SLEEP_DIG_ICG_APB_EN: u32,
    }),
    /// need_des
    /// offset: 0x74
    HP_SLEEP_ICG_MODEM: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        HP_SLEEP_DIG_ICG_MODEM_CODE: u2,
    }),
    /// need_des
    /// offset: 0x78
    HP_SLEEP_HP_SYS_CNTL: mmio.Mmio(packed struct(u32) {
        reserved23: u23 = 0,
        /// need_des
        HP_SLEEP_HP_POWER_DET_BYPASS: u1,
        /// need_des
        HP_SLEEP_UART_WAKEUP_EN: u1,
        /// need_des
        HP_SLEEP_LP_PAD_HOLD_ALL: u1,
        /// need_des
        HP_SLEEP_HP_PAD_HOLD_ALL: u1,
        /// need_des
        HP_SLEEP_DIG_PAD_SLP_SEL: u1,
        /// need_des
        HP_SLEEP_DIG_PAUSE_WDT: u1,
        /// need_des
        HP_SLEEP_DIG_CPU_STALL: u1,
        padding: u2 = 0,
    }),
    /// need_des
    /// offset: 0x7c
    HP_SLEEP_HP_CK_POWER: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// need_des
        HP_SLEEP_I2C_ISO_EN: u1,
        /// need_des
        HP_SLEEP_I2C_RETENTION: u1,
        /// need_des
        HP_SLEEP_XPD_PLL_I2C: u4,
        /// need_des
        HP_SLEEP_XPD_PLL: u4,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x80
    HP_SLEEP_BIAS: mmio.Mmio(packed struct(u32) {
        reserved18: u18 = 0,
        /// need_des
        HP_SLEEP_DCM_VSET: u5,
        /// need_des
        HP_SLEEP_DCM_MODE: u2,
        /// need_des
        HP_SLEEP_XPD_BIAS: u1,
        /// need_des
        HP_SLEEP_DBG_ATTEN: u4,
        /// need_des
        HP_SLEEP_PD_CUR: u1,
        /// need_des
        SLEEP: u1,
    }),
    /// need_des
    /// offset: 0x84
    HP_SLEEP_BACKUP: mmio.Mmio(packed struct(u32) {
        reserved6: u6 = 0,
        /// need_des
        HP_MODEM2SLEEP_BACKUP_MODEM_CLK_CODE: u2,
        /// need_des
        HP_ACTIVE2SLEEP_BACKUP_MODEM_CLK_CODE: u2,
        /// need_des
        HP_SLEEP_RETENTION_MODE: u1,
        reserved12: u1 = 0,
        /// need_des
        HP_MODEM2SLEEP_RETENTION_EN: u1,
        /// need_des
        HP_ACTIVE2SLEEP_RETENTION_EN: u1,
        reserved16: u2 = 0,
        /// need_des
        HP_MODEM2SLEEP_BACKUP_CLK_SEL: u2,
        /// need_des
        HP_ACTIVE2SLEEP_BACKUP_CLK_SEL: u2,
        reserved23: u3 = 0,
        /// need_des
        HP_MODEM2SLEEP_BACKUP_MODE: u3,
        /// need_des
        HP_ACTIVE2SLEEP_BACKUP_MODE: u3,
        reserved30: u1 = 0,
        /// need_des
        HP_MODEM2SLEEP_BACKUP_EN: u1,
        /// need_des
        HP_ACTIVE2SLEEP_BACKUP_EN: u1,
    }),
    /// need_des
    /// offset: 0x88
    HP_SLEEP_BACKUP_CLK: mmio.Mmio(packed struct(u32) {
        /// need_des
        HP_SLEEP_BACKUP_ICG_FUNC_EN: u32,
    }),
    /// need_des
    /// offset: 0x8c
    HP_SLEEP_SYSCLK: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        HP_SLEEP_DIG_SYS_CLK_NO_DIV: u1,
        /// need_des
        HP_SLEEP_ICG_SYS_CLOCK_EN: u1,
        /// need_des
        HP_SLEEP_SYS_CLK_SLP_SEL: u1,
        /// need_des
        HP_SLEEP_ICG_SLP_SEL: u1,
        /// need_des
        HP_SLEEP_DIG_SYS_CLK_SEL: u2,
    }),
    /// need_des
    /// offset: 0x90
    HP_SLEEP_HP_REGULATOR0: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// need_des
        HP_SLEEP_HP_REGULATOR_SLP_MEM_XPD: u1,
        /// need_des
        HP_SLEEP_HP_REGULATOR_SLP_LOGIC_XPD: u1,
        /// need_des
        HP_SLEEP_HP_REGULATOR_XPD: u1,
        /// need_des
        HP_SLEEP_HP_REGULATOR_SLP_MEM_DBIAS: u4,
        /// need_des
        HP_SLEEP_HP_REGULATOR_SLP_LOGIC_DBIAS: u4,
        /// need_des
        HP_SLEEP_HP_REGULATOR_DBIAS: u5,
    }),
    /// need_des
    /// offset: 0x94
    HP_SLEEP_HP_REGULATOR1: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        HP_SLEEP_HP_REGULATOR_DRV_B: u6,
    }),
    /// need_des
    /// offset: 0x98
    HP_SLEEP_XTAL: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        HP_SLEEP_XPD_XTAL: u1,
    }),
    /// need_des
    /// offset: 0x9c
    HP_SLEEP_LP_REGULATOR0: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// need_des
        HP_SLEEP_LP_REGULATOR_SLP_XPD: u1,
        /// need_des
        HP_SLEEP_LP_REGULATOR_XPD: u1,
        /// need_des
        HP_SLEEP_LP_REGULATOR_SLP_DBIAS: u4,
        /// need_des
        HP_SLEEP_LP_REGULATOR_DBIAS: u5,
    }),
    /// need_des
    /// offset: 0xa0
    HP_SLEEP_LP_REGULATOR1: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        HP_SLEEP_LP_REGULATOR_DRV_B: u6,
    }),
    /// need_des
    /// offset: 0xa4
    HP_SLEEP_LP_DCDC_RESERVE: mmio.Mmio(packed struct(u32) {
        /// need_des
        PMU_HP_SLEEP_LP_DCDC_RESERVE: u32,
    }),
    /// need_des
    /// offset: 0xa8
    HP_SLEEP_LP_DIG_POWER: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        HP_SLEEP_LP_PAD_SLP_SEL: u1,
        /// need_des
        HP_SLEEP_BOD_SOURCE_SEL: u1,
        /// need_des
        HP_SLEEP_VDDBAT_MODE: u2,
        /// need_des
        HP_SLEEP_LP_MEM_DSLP: u1,
        /// need_des
        HP_SLEEP_PD_LP_PERI_PD_EN: u1,
    }),
    /// need_des
    /// offset: 0xac
    HP_SLEEP_LP_CK_POWER: mmio.Mmio(packed struct(u32) {
        reserved27: u27 = 0,
        /// need_des
        HP_SLEEP_XPD_LPPLL: u1,
        /// need_des
        HP_SLEEP_XPD_XTAL32K: u1,
        /// need_des
        HP_SLEEP_XPD_RC32K: u1,
        /// need_des
        HP_SLEEP_XPD_FOSC_CLK: u1,
        /// need_des
        HP_SLEEP_PD_OSC_CLK: u1,
    }),
    /// need_des
    /// offset: 0xb0
    LP_SLEEP_LP_BIAS_RESERVE: mmio.Mmio(packed struct(u32) {
        /// need_des
        PMU_LP_SLEEP_LP_BIAS_RESERVE: u32,
    }),
    /// need_des
    /// offset: 0xb4
    LP_SLEEP_LP_REGULATOR0: mmio.Mmio(packed struct(u32) {
        reserved21: u21 = 0,
        /// need_des
        LP_SLEEP_LP_REGULATOR_SLP_XPD: u1,
        /// need_des
        LP_SLEEP_LP_REGULATOR_XPD: u1,
        /// need_des
        LP_SLEEP_LP_REGULATOR_SLP_DBIAS: u4,
        /// need_des
        LP_SLEEP_LP_REGULATOR_DBIAS: u5,
    }),
    /// need_des
    /// offset: 0xb8
    LP_SLEEP_LP_REGULATOR1: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        LP_SLEEP_LP_REGULATOR_DRV_B: u6,
    }),
    /// need_des
    /// offset: 0xbc
    LP_SLEEP_XTAL: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_SLEEP_XPD_XTAL: u1,
    }),
    /// need_des
    /// offset: 0xc0
    LP_SLEEP_LP_DIG_POWER: mmio.Mmio(packed struct(u32) {
        reserved26: u26 = 0,
        /// need_des
        LP_SLEEP_LP_PAD_SLP_SEL: u1,
        /// need_des
        LP_SLEEP_BOD_SOURCE_SEL: u1,
        /// need_des
        LP_SLEEP_VDDBAT_MODE: u2,
        /// need_des
        LP_SLEEP_LP_MEM_DSLP: u1,
        /// need_des
        LP_SLEEP_PD_LP_PERI_PD_EN: u1,
    }),
    /// need_des
    /// offset: 0xc4
    LP_SLEEP_LP_CK_POWER: mmio.Mmio(packed struct(u32) {
        reserved27: u27 = 0,
        /// need_des
        LP_SLEEP_XPD_LPPLL: u1,
        /// need_des
        LP_SLEEP_XPD_XTAL32K: u1,
        /// need_des
        LP_SLEEP_XPD_RC32K: u1,
        /// need_des
        LP_SLEEP_XPD_FOSC_CLK: u1,
        /// need_des
        LP_SLEEP_PD_OSC_CLK: u1,
    }),
    /// need_des
    /// offset: 0xc8
    LP_SLEEP_BIAS: mmio.Mmio(packed struct(u32) {
        reserved25: u25 = 0,
        /// need_des
        LP_SLEEP_XPD_BIAS: u1,
        /// need_des
        LP_SLEEP_DBG_ATTEN: u4,
        /// need_des
        LP_SLEEP_PD_CUR: u1,
        /// need_des
        SLEEP: u1,
    }),
    /// need_des
    /// offset: 0xcc
    IMM_HP_CK_POWER: mmio.Mmio(packed struct(u32) {
        /// need_des
        TIE_LOW_CALI_XTAL_ICG: u1,
        /// need_des
        TIE_LOW_GLOBAL_PLL_ICG: u4,
        /// need_des
        TIE_LOW_GLOBAL_XTAL_ICG: u1,
        /// need_des
        TIE_LOW_I2C_RETENTION: u1,
        /// need_des
        TIE_LOW_XPD_PLL_I2C: u4,
        /// need_des
        TIE_LOW_XPD_PLL: u4,
        /// need_des
        TIE_LOW_XPD_XTAL: u1,
        /// need_des
        TIE_HIGH_CALI_XTAL_ICG: u1,
        /// need_des
        TIE_HIGH_GLOBAL_PLL_ICG: u4,
        /// need_des
        TIE_HIGH_GLOBAL_XTAL_ICG: u1,
        /// need_des
        TIE_HIGH_I2C_RETENTION: u1,
        /// need_des
        TIE_HIGH_XPD_PLL_I2C: u4,
        /// need_des
        TIE_HIGH_XPD_PLL: u4,
        /// need_des
        TIE_HIGH_XPD_XTAL: u1,
    }),
    /// need_des
    /// offset: 0xd0
    IMM_SLEEP_SYSCLK: mmio.Mmio(packed struct(u32) {
        reserved28: u28 = 0,
        /// need_des
        UPDATE_DIG_ICG_SWITCH: u1,
        /// need_des
        TIE_LOW_ICG_SLP_SEL: u1,
        /// need_des
        TIE_HIGH_ICG_SLP_SEL: u1,
        /// need_des
        UPDATE_DIG_SYS_CLK_SEL: u1,
    }),
    /// need_des
    /// offset: 0xd4
    IMM_HP_FUNC_ICG: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        UPDATE_DIG_ICG_FUNC_EN: u1,
    }),
    /// need_des
    /// offset: 0xd8
    IMM_HP_APB_ICG: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        UPDATE_DIG_ICG_APB_EN: u1,
    }),
    /// need_des
    /// offset: 0xdc
    IMM_MODEM_ICG: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        UPDATE_DIG_ICG_MODEM_EN: u1,
    }),
    /// need_des
    /// offset: 0xe0
    IMM_LP_ICG: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        TIE_LOW_LP_ROOTCLK_SEL: u1,
        /// need_des
        TIE_HIGH_LP_ROOTCLK_SEL: u1,
    }),
    /// need_des
    /// offset: 0xe4
    IMM_PAD_HOLD_ALL: mmio.Mmio(packed struct(u32) {
        /// need_des
        PAD_SLP_SEL: u1,
        /// need_des
        LP_PAD_HOLD_ALL: u1,
        /// need_des
        HP_PAD_HOLD_ALL: u1,
        reserved26: u23 = 0,
        /// need_des
        TIE_HIGH_PAD_SLP_SEL: u1,
        /// need_des
        TIE_LOW_PAD_SLP_SEL: u1,
        /// need_des
        TIE_HIGH_LP_PAD_HOLD_ALL: u1,
        /// need_des
        TIE_LOW_LP_PAD_HOLD_ALL: u1,
        /// need_des
        TIE_HIGH_HP_PAD_HOLD_ALL: u1,
        /// need_des
        TIE_LOW_HP_PAD_HOLD_ALL: u1,
    }),
    /// need_des
    /// offset: 0xe8
    IMM_I2C_ISO: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        TIE_HIGH_I2C_ISO_EN: u1,
        /// need_des
        TIE_LOW_I2C_ISO_EN: u1,
    }),
    /// need_des
    /// offset: 0xec
    POWER_WAIT_TIMER0: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// need_des
        DG_HP_POWERDOWN_TIMER: u9,
        /// need_des
        DG_HP_POWERUP_TIMER: u9,
        /// need_des
        DG_HP_WAIT_TIMER: u9,
    }),
    /// need_des
    /// offset: 0xf0
    POWER_WAIT_TIMER1: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// need_des
        DG_LP_POWERDOWN_TIMER: u9,
        /// need_des
        DG_LP_POWERUP_TIMER: u9,
        /// need_des
        DG_LP_WAIT_TIMER: u9,
    }),
    /// need_des
    /// offset: 0xf4
    POWER_PD_TOP_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        FORCE_TOP_RESET: u1,
        /// need_des
        FORCE_TOP_ISO: u1,
        /// need_des
        FORCE_TOP_PU: u1,
        /// need_des
        FORCE_TOP_NO_RESET: u1,
        /// need_des
        FORCE_TOP_NO_ISO: u1,
        /// need_des
        FORCE_TOP_PD: u1,
        padding: u26 = 0,
    }),
    /// need_des
    /// offset: 0xf8
    POWER_PD_CNNT_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        FORCE_CNNT_RESET: u1,
        /// need_des
        FORCE_CNNT_ISO: u1,
        /// need_des
        FORCE_CNNT_PU: u1,
        /// need_des
        FORCE_CNNT_NO_RESET: u1,
        /// need_des
        FORCE_CNNT_NO_ISO: u1,
        /// need_des
        FORCE_CNNT_PD: u1,
        padding: u26 = 0,
    }),
    /// need_des
    /// offset: 0xfc
    POWER_PD_HPMEM_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        FORCE_HP_MEM_RESET: u1,
        /// need_des
        FORCE_HP_MEM_ISO: u1,
        /// need_des
        FORCE_HP_MEM_PU: u1,
        /// need_des
        FORCE_HP_MEM_NO_RESET: u1,
        /// need_des
        FORCE_HP_MEM_NO_ISO: u1,
        /// need_des
        FORCE_HP_MEM_PD: u1,
        padding: u26 = 0,
    }),
    /// need_des
    /// offset: 0x100
    POWER_PD_TOP_MASK: mmio.Mmio(packed struct(u32) {
        /// need_des
        XPD_TOP_MASK: u5,
        reserved27: u22 = 0,
        /// need_des
        PD_TOP_MASK: u5,
    }),
    /// need_des
    /// offset: 0x104
    POWER_PD_CNNT_MASK: mmio.Mmio(packed struct(u32) {
        /// need_des
        XPD_CNNT_MASK: u5,
        reserved27: u22 = 0,
        /// need_des
        PD_CNNT_MASK: u5,
    }),
    /// need_des
    /// offset: 0x108
    POWER_PD_HPMEM_MASK: mmio.Mmio(packed struct(u32) {
        /// need_des
        XPD_HP_MEM_MASK: u6,
        reserved26: u20 = 0,
        /// need_des
        PD_HP_MEM_MASK: u6,
    }),
    /// need_des
    /// offset: 0x10c
    POWER_DCDC_SWITCH: mmio.Mmio(packed struct(u32) {
        /// need_des
        FORCE_DCDC_SWITCH_PU: u1,
        /// need_des
        FORCE_DCDC_SWITCH_PD: u1,
        padding: u30 = 0,
    }),
    /// need_des
    /// offset: 0x110
    POWER_PD_LPPERI_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        FORCE_LP_PERI_RESET: u1,
        /// need_des
        FORCE_LP_PERI_ISO: u1,
        /// need_des
        FORCE_LP_PERI_PU: u1,
        /// need_des
        FORCE_LP_PERI_NO_RESET: u1,
        /// need_des
        FORCE_LP_PERI_NO_ISO: u1,
        /// need_des
        FORCE_LP_PERI_PD: u1,
        padding: u26 = 0,
    }),
    /// need_des
    /// offset: 0x114
    POWER_PD_LPPERI_MASK: mmio.Mmio(packed struct(u32) {
        /// need_des
        XPD_LP_PERI_MASK: u5,
        reserved27: u22 = 0,
        /// need_des
        PD_LP_PERI_MASK: u5,
    }),
    /// need_des
    /// offset: 0x118
    POWER_HP_PAD: mmio.Mmio(packed struct(u32) {
        /// need_des
        FORCE_HP_PAD_NO_ISO_ALL: u1,
        /// need_des
        FORCE_HP_PAD_ISO_ALL: u1,
        padding: u30 = 0,
    }),
    /// need_des
    /// offset: 0x11c
    POWER_CK_WAIT_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        PMU_WAIT_XTL_STABLE: u16,
        /// need_des
        PMU_WAIT_PLL_STABLE: u16,
    }),
    /// need_des
    /// offset: 0x120
    SLP_WAKEUP_CNTL0: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        SLEEP_REQ: u1,
    }),
    /// need_des
    /// offset: 0x124
    SLP_WAKEUP_CNTL1: mmio.Mmio(packed struct(u32) {
        /// need_des
        SLEEP_REJECT_ENA: u31,
        /// need_des
        SLP_REJECT_EN: u1,
    }),
    /// need_des
    /// offset: 0x128
    SLP_WAKEUP_CNTL2: mmio.Mmio(packed struct(u32) {
        /// need_des
        WAKEUP_ENA: u31,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x12c
    SLP_WAKEUP_CNTL3: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_MIN_SLP_VAL: u8,
        /// need_des
        HP_MIN_SLP_VAL: u8,
        /// need_des
        SLEEP_PRT_SEL: u2,
        padding: u14 = 0,
    }),
    /// need_des
    /// offset: 0x130
    SLP_WAKEUP_CNTL4: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        SLP_REJECT_CAUSE_CLR: u1,
    }),
    /// need_des
    /// offset: 0x134
    SLP_WAKEUP_CNTL5: mmio.Mmio(packed struct(u32) {
        /// need_des
        MODEM_WAIT_TARGET: u20,
        reserved24: u4 = 0,
        /// need_des
        LP_ANA_WAIT_TARGET: u8,
    }),
    /// need_des
    /// offset: 0x138
    SLP_WAKEUP_CNTL6: mmio.Mmio(packed struct(u32) {
        /// need_des
        SOC_WAKEUP_WAIT: u20,
        reserved30: u10 = 0,
        /// need_des
        SOC_WAKEUP_WAIT_CFG: u2,
    }),
    /// need_des
    /// offset: 0x13c
    SLP_WAKEUP_CNTL7: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// need_des
        ANA_WAIT_TARGET: u16,
    }),
    /// need_des
    /// offset: 0x140
    SLP_WAKEUP_CNTL8: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_LITE_WAKEUP_ENA: u1,
    }),
    /// need_des
    /// offset: 0x144
    SLP_WAKEUP_STATUS0: mmio.Mmio(packed struct(u32) {
        /// need_des
        WAKEUP_CAUSE: u31,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x148
    SLP_WAKEUP_STATUS1: mmio.Mmio(packed struct(u32) {
        /// need_des
        REJECT_CAUSE: u31,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x14c
    SLP_WAKEUP_STATUS2: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_LITE_WAKEUP_CAUSE: u1,
    }),
    /// need_des
    /// offset: 0x150
    HP_CK_POWERON: mmio.Mmio(packed struct(u32) {
        /// need_des
        I2C_POR_WAIT_TARGET: u8,
        padding: u24 = 0,
    }),
    /// need_des
    /// offset: 0x154
    HP_CK_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        MODIFY_ICG_CNTL_WAIT: u8,
        /// need_des
        SWITCH_ICG_CNTL_WAIT: u8,
        padding: u16 = 0,
    }),
    /// need_des
    /// offset: 0x158
    POR_STATUS: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        POR_DONE: u1,
    }),
    /// need_des
    /// offset: 0x15c
    RF_PWC: mmio.Mmio(packed struct(u32) {
        reserved24: u24 = 0,
        /// need_des
        MSPI_PHY_XPD: u1,
        /// need_des
        SDIO_PLL_XPD: u1,
        /// need_des
        PERIF_I2C_RSTB: u1,
        /// need_des
        XPD_PERIF_I2C: u1,
        /// need_des
        XPD_TXRF_I2C: u1,
        /// need_des
        XPD_RFRX_PBUS: u1,
        /// need_des
        XPD_CKGEN_I2C: u1,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x160
    BACKUP_CFG: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        BACKUP_SYS_CLK_NO_DIV: u1,
    }),
    /// need_des
    /// offset: 0x164
    INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved14: u14 = 0,
        /// reg_0p1a_0_counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_0_HP_INT_RAW: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_0_HP_INT_RAW: u1,
        /// reg_0p1a_0 counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_1_HP_INT_RAW: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_1_HP_INT_RAW: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_0_HP_INT_RAW: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_0_HP_INT_RAW: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_1_HP_INT_RAW: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_1_HP_INT_RAW: u1,
        /// reg_0p3a_0 counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_0_HP_INT_RAW: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_0_HP_INT_RAW: u1,
        /// reg_0p3a_0_counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_1_HP_INT_RAW: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_1_HP_INT_RAW: u1,
        reserved27: u1 = 0,
        /// need_des
        LP_CPU_EXC_INT_RAW: u1,
        /// need_des
        SDIO_IDLE_INT_RAW: u1,
        /// need_des
        SW_INT_RAW: u1,
        /// need_des
        SOC_SLEEP_REJECT_INT_RAW: u1,
        /// need_des
        SOC_WAKEUP_INT_RAW: u1,
    }),
    /// need_des
    /// offset: 0x168
    HP_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved14: u14 = 0,
        /// reg_0p1a_0_counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_0_HP_INT_ST: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_0_HP_INT_ST: u1,
        /// reg_0p1a_0 counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_1_HP_INT_ST: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_1_HP_INT_ST: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_0_HP_INT_ST: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_0_HP_INT_ST: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_1_HP_INT_ST: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_1_HP_INT_ST: u1,
        /// reg_0p3a_0 counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_0_HP_INT_ST: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_0_HP_INT_ST: u1,
        /// reg_0p3a_0_counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_1_HP_INT_ST: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_1_HP_INT_ST: u1,
        reserved27: u1 = 0,
        /// need_des
        LP_CPU_EXC_INT_ST: u1,
        /// need_des
        SDIO_IDLE_INT_ST: u1,
        /// need_des
        SW_INT_ST: u1,
        /// need_des
        SOC_SLEEP_REJECT_INT_ST: u1,
        /// need_des
        SOC_WAKEUP_INT_ST: u1,
    }),
    /// need_des
    /// offset: 0x16c
    HP_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved14: u14 = 0,
        /// reg_0p1a_0_counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_0_HP_INT_ENA: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_0_HP_INT_ENA: u1,
        /// reg_0p1a_0 counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_1_HP_INT_ENA: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_1_HP_INT_ENA: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_0_HP_INT_ENA: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_0_HP_INT_ENA: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_1_HP_INT_ENA: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_1_HP_INT_ENA: u1,
        /// reg_0p3a_0 counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_0_HP_INT_ENA: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_0_HP_INT_ENA: u1,
        /// reg_0p3a_0_counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_1_HP_INT_ENA: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_1_HP_INT_ENA: u1,
        reserved27: u1 = 0,
        /// need_des
        LP_CPU_EXC_INT_ENA: u1,
        /// need_des
        SDIO_IDLE_INT_ENA: u1,
        /// need_des
        SW_INT_ENA: u1,
        /// need_des
        SOC_SLEEP_REJECT_INT_ENA: u1,
        /// need_des
        SOC_WAKEUP_INT_ENA: u1,
    }),
    /// need_des
    /// offset: 0x170
    HP_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved14: u14 = 0,
        /// reg_0p1a_0_counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_0_HP_INT_CLR: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_0_HP_INT_CLR: u1,
        /// reg_0p1a_0 counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_1_HP_INT_CLR: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_1_HP_INT_CLR: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_0_HP_INT_CLR: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_0_HP_INT_CLR: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_1_HP_INT_CLR: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_1_HP_INT_CLR: u1,
        /// reg_0p3a_0 counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_0_HP_INT_CLR: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_0_HP_INT_CLR: u1,
        /// reg_0p3a_0_counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_1_HP_INT_CLR: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_1_HP_INT_CLR: u1,
        reserved27: u1 = 0,
        /// need_des
        LP_CPU_EXC_INT_CLR: u1,
        /// need_des
        SDIO_IDLE_INT_CLR: u1,
        /// need_des
        SW_INT_CLR: u1,
        /// need_des
        SOC_SLEEP_REJECT_INT_CLR: u1,
        /// need_des
        SOC_WAKEUP_INT_CLR: u1,
    }),
    /// need_des
    /// offset: 0x174
    LP_INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved13: u13 = 0,
        /// need_des
        LP_CPU_SLEEP_REJECT_INT_RAW: u1,
        /// reg_0p1a_0_counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_0_LP_INT_RAW: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_0_LP_INT_RAW: u1,
        /// reg_0p1a_0 counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_1_LP_INT_RAW: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_1_LP_INT_RAW: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_0_LP_INT_RAW: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_0_LP_INT_RAW: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_1_LP_INT_RAW: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_1_LP_INT_RAW: u1,
        /// reg_0p3a_0 counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_0_LP_INT_RAW: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_0_LP_INT_RAW: u1,
        /// reg_0p3a_0_counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_1_LP_INT_RAW: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_1_LP_INT_RAW: u1,
        /// need_des
        LP_CPU_WAKEUP_INT_RAW: u1,
        /// need_des
        SLEEP_SWITCH_ACTIVE_END_INT_RAW: u1,
        /// need_des
        ACTIVE_SWITCH_SLEEP_END_INT_RAW: u1,
        /// need_des
        SLEEP_SWITCH_ACTIVE_START_INT_RAW: u1,
        /// need_des
        ACTIVE_SWITCH_SLEEP_START_INT_RAW: u1,
        /// need_des
        HP_SW_TRIGGER_INT_RAW: u1,
    }),
    /// need_des
    /// offset: 0x178
    LP_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved13: u13 = 0,
        /// need_des
        LP_CPU_SLEEP_REJECT_INT_ST: u1,
        /// reg_0p1a_0_counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_0_LP_INT_ST: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_0_LP_INT_ST: u1,
        /// reg_0p1a_0 counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_1_LP_INT_ST: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_1_LP_INT_ST: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_0_LP_INT_ST: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_0_LP_INT_ST: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_1_LP_INT_ST: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_1_LP_INT_ST: u1,
        /// reg_0p3a_0 counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_0_LP_INT_ST: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_0_LP_INT_ST: u1,
        /// reg_0p3a_0_counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_1_LP_INT_ST: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_1_LP_INT_ST: u1,
        /// need_des
        LP_CPU_WAKEUP_INT_ST: u1,
        /// need_des
        SLEEP_SWITCH_ACTIVE_END_INT_ST: u1,
        /// need_des
        ACTIVE_SWITCH_SLEEP_END_INT_ST: u1,
        /// need_des
        SLEEP_SWITCH_ACTIVE_START_INT_ST: u1,
        /// need_des
        ACTIVE_SWITCH_SLEEP_START_INT_ST: u1,
        /// need_des
        HP_SW_TRIGGER_INT_ST: u1,
    }),
    /// need_des
    /// offset: 0x17c
    LP_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved13: u13 = 0,
        /// need_des
        LP_CPU_SLEEP_REJECT_INT_ENA: u1,
        /// reg_0p1a_0_counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_0_LP_INT_ENA: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_0_LP_INT_ENA: u1,
        /// reg_0p1a_0 counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_1_LP_INT_ENA: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_1_LP_INT_ENA: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_0_LP_INT_ENA: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_0_LP_INT_ENA: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_1_LP_INT_ENA: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_1_LP_INT_ENA: u1,
        /// reg_0p3a_0 counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_0_LP_INT_ENA: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_0_LP_INT_ENA: u1,
        /// reg_0p3a_0_counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_1_LP_INT_ENA: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_1_LP_INT_ENA: u1,
        /// need_des
        LP_CPU_WAKEUP_INT_ENA: u1,
        /// need_des
        SLEEP_SWITCH_ACTIVE_END_INT_ENA: u1,
        /// need_des
        ACTIVE_SWITCH_SLEEP_END_INT_ENA: u1,
        /// need_des
        SLEEP_SWITCH_ACTIVE_START_INT_ENA: u1,
        /// need_des
        ACTIVE_SWITCH_SLEEP_START_INT_ENA: u1,
        /// need_des
        HP_SW_TRIGGER_INT_ENA: u1,
    }),
    /// need_des
    /// offset: 0x180
    LP_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved13: u13 = 0,
        /// need_des
        LP_CPU_SLEEP_REJECT_LP_INT_CLR: u1,
        /// reg_0p1a_0_counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_0_LP_INT_CLR: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_0_LP_INT_CLR: u1,
        /// reg_0p1a_0 counter after xpd reach target0
        _0P1A_CNT_TARGET0_REACH_1_LP_INT_CLR: u1,
        /// reg_0p1a_1_counter after xpd reach target1
        _0P1A_CNT_TARGET1_REACH_1_LP_INT_CLR: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_0_LP_INT_CLR: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_0_LP_INT_CLR: u1,
        /// reg_0p2a_0 counter after xpd reach target0
        _0P2A_CNT_TARGET0_REACH_1_LP_INT_CLR: u1,
        /// reg_0p2a_1_counter after xpd reach target1
        _0P2A_CNT_TARGET1_REACH_1_LP_INT_CLR: u1,
        /// reg_0p3a_0 counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_0_LP_INT_CLR: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_0_LP_INT_CLR: u1,
        /// reg_0p3a_0_counter after xpd reach target0
        _0P3A_CNT_TARGET0_REACH_1_LP_INT_CLR: u1,
        /// reg_0p3a_1_counter after xpd reach target1
        _0P3A_CNT_TARGET1_REACH_1_LP_INT_CLR: u1,
        /// need_des
        LP_CPU_WAKEUP_INT_CLR: u1,
        /// need_des
        SLEEP_SWITCH_ACTIVE_END_INT_CLR: u1,
        /// need_des
        ACTIVE_SWITCH_SLEEP_END_INT_CLR: u1,
        /// need_des
        SLEEP_SWITCH_ACTIVE_START_INT_CLR: u1,
        /// need_des
        ACTIVE_SWITCH_SLEEP_START_INT_CLR: u1,
        /// need_des
        HP_SW_TRIGGER_INT_CLR: u1,
    }),
    /// need_des
    /// offset: 0x184
    LP_CPU_PWR0: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_CPU_WAITI_RDY: u1,
        /// need_des
        LP_CPU_STALL_RDY: u1,
        reserved18: u16 = 0,
        /// need_des
        LP_CPU_FORCE_STALL: u1,
        /// need_des
        LP_CPU_SLP_WAITI_FLAG_EN: u1,
        /// need_des
        LP_CPU_SLP_STALL_FLAG_EN: u1,
        /// need_des
        LP_CPU_SLP_STALL_WAIT: u8,
        /// need_des
        LP_CPU_SLP_STALL_EN: u1,
        /// need_des
        LP_CPU_SLP_RESET_EN: u1,
        /// need_des
        LP_CPU_SLP_BYPASS_INTR_EN: u1,
    }),
    /// need_des
    /// offset: 0x188
    LP_CPU_PWR1: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        LP_CPU_SLEEP_REQ: u1,
    }),
    /// need_des
    /// offset: 0x18c
    LP_CPU_PWR2: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_CPU_WAKEUP_EN: u31,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x190
    LP_CPU_PWR3: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_CPU_WAKEUP_CAUSE: u31,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x194
    LP_CPU_PWR4: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_CPU_REJECT_EN: u31,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x198
    LP_CPU_PWR5: mmio.Mmio(packed struct(u32) {
        /// need_des
        LP_CPU_REJECT_CAUSE: u31,
        padding: u1 = 0,
    }),
    /// need_des
    /// offset: 0x19c
    HP_LP_CPU_COMM: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        LP_TRIGGER_HP: u1,
        /// need_des
        HP_TRIGGER_LP: u1,
    }),
    /// need_des
    /// offset: 0x1a0
    HP_REGULATOR_CFG: mmio.Mmio(packed struct(u32) {
        reserved31: u31 = 0,
        /// need_des
        DIG_REGULATOR_EN_CAL: u1,
    }),
    /// need_des
    /// offset: 0x1a4
    MAIN_STATE: mmio.Mmio(packed struct(u32) {
        /// need_des
        ENABLE_CALI_PMU_CNTL: u1,
        reserved11: u10 = 0,
        /// need_des
        PMU_MAIN_LAST_ST_STATE: u7,
        /// need_des
        PMU_MAIN_TAR_ST_STATE: u7,
        /// need_des
        PMU_MAIN_CUR_ST_STATE: u7,
    }),
    /// need_des
    /// offset: 0x1a8
    PWR_STATE: mmio.Mmio(packed struct(u32) {
        reserved13: u13 = 0,
        /// need_des
        PMU_BACKUP_ST_STATE: u5,
        /// need_des
        PMU_LP_PWR_ST_STATE: u5,
        /// need_des
        PMU_HP_PWR_ST_STATE: u9,
    }),
    /// need_des
    /// offset: 0x1ac
    CLK_STATE0: mmio.Mmio(packed struct(u32) {
        /// need_des
        STABLE_XPD_PLL_STATE: u3,
        /// need_des
        STABLE_XPD_XTAL_STATE: u1,
        /// need_des
        PMU_ANA_XPD_PLL_I2C_STATE: u3,
        reserved10: u3 = 0,
        /// need_des
        PMU_SYS_CLK_SLP_SEL_STATE: u1,
        /// need_des
        PMU_SYS_CLK_SEL_STATE: u2,
        /// need_des
        PMU_SYS_CLK_NO_DIV_STATE: u1,
        /// need_des
        PMU_ICG_SYS_CLK_EN_STATE: u1,
        /// need_des
        PMU_ICG_MODEM_SWITCH_STATE: u1,
        /// need_des
        PMU_ICG_MODEM_CODE_STATE: u2,
        /// need_des
        PMU_ICG_SLP_SEL_STATE: u1,
        /// need_des
        PMU_ICG_GLOBAL_XTAL_STATE: u1,
        /// need_des
        PMU_ICG_GLOBAL_PLL_STATE: u4,
        /// need_des
        PMU_ANA_I2C_ISO_EN_STATE: u1,
        /// need_des
        PMU_ANA_I2C_RETENTION_STATE: u1,
        reserved27: u1 = 0,
        /// need_des
        PMU_ANA_XPD_PLL_STATE: u4,
        /// need_des
        PMU_ANA_XPD_XTAL_STATE: u1,
    }),
    /// need_des
    /// offset: 0x1b0
    CLK_STATE1: mmio.Mmio(packed struct(u32) {
        /// need_des
        PMU_ICG_FUNC_EN_STATE: u32,
    }),
    /// need_des
    /// offset: 0x1b4
    CLK_STATE2: mmio.Mmio(packed struct(u32) {
        /// need_des
        PMU_ICG_APB_EN_STATE: u32,
    }),
    /// need_des
    /// offset: 0x1b8
    EXT_LDO_P0_0P1A: mmio.Mmio(packed struct(u32) {
        reserved7: u7 = 0,
        /// need_des
        _0P1A_FORCE_TIEH_SEL_0: u1,
        /// need_des
        _0P1A_XPD_0: u1,
        /// need_des
        _0P1A_TIEH_SEL_0: u3,
        /// need_des
        _0P1A_TIEH_POS_EN_0: u1,
        /// need_des
        _0P1A_TIEH_NEG_EN_0: u1,
        /// need_des
        _0P1A_TIEH_0: u1,
        /// need_des
        _0P1A_TARGET1_0: u8,
        /// need_des
        _0P1A_TARGET0_0: u8,
        /// need_des
        _0P1A_LDO_CNT_PRESCALER_SEL_0: u1,
    }),
    /// need_des
    /// offset: 0x1bc
    EXT_LDO_P0_0P1A_ANA: mmio.Mmio(packed struct(u32) {
        reserved23: u23 = 0,
        /// need_des
        ANA_0P1A_MUL_0: u3,
        /// need_des
        ANA_0P1A_EN_VDET_0: u1,
        /// need_des
        ANA_0P1A_EN_CUR_LIM_0: u1,
        /// need_des
        ANA_0P1A_DREF_0: u4,
    }),
    /// need_des
    /// offset: 0x1c0
    EXT_LDO_P0_0P2A: mmio.Mmio(packed struct(u32) {
        reserved7: u7 = 0,
        /// need_des
        _0P2A_FORCE_TIEH_SEL_0: u1,
        /// need_des
        _0P2A_XPD_0: u1,
        /// need_des
        _0P2A_TIEH_SEL_0: u3,
        /// need_des
        _0P2A_TIEH_POS_EN_0: u1,
        /// need_des
        _0P2A_TIEH_NEG_EN_0: u1,
        /// need_des
        _0P2A_TIEH_0: u1,
        /// need_des
        _0P2A_TARGET1_0: u8,
        /// need_des
        _0P2A_TARGET0_0: u8,
        /// need_des
        _0P2A_LDO_CNT_PRESCALER_SEL_0: u1,
    }),
    /// need_des
    /// offset: 0x1c4
    EXT_LDO_P0_0P2A_ANA: mmio.Mmio(packed struct(u32) {
        reserved23: u23 = 0,
        /// need_des
        ANA_0P2A_MUL_0: u3,
        /// need_des
        ANA_0P2A_EN_VDET_0: u1,
        /// need_des
        ANA_0P2A_EN_CUR_LIM_0: u1,
        /// need_des
        ANA_0P2A_DREF_0: u4,
    }),
    /// need_des
    /// offset: 0x1c8
    EXT_LDO_P0_0P3A: mmio.Mmio(packed struct(u32) {
        reserved7: u7 = 0,
        /// need_des
        _0P3A_FORCE_TIEH_SEL_0: u1,
        /// need_des
        _0P3A_XPD_0: u1,
        /// need_des
        _0P3A_TIEH_SEL_0: u3,
        /// need_des
        _0P3A_TIEH_POS_EN_0: u1,
        /// need_des
        _0P3A_TIEH_NEG_EN_0: u1,
        /// need_des
        _0P3A_TIEH_0: u1,
        /// need_des
        _0P3A_TARGET1_0: u8,
        /// need_des
        _0P3A_TARGET0_0: u8,
        /// need_des
        _0P3A_LDO_CNT_PRESCALER_SEL_0: u1,
    }),
    /// need_des
    /// offset: 0x1cc
    EXT_LDO_P0_0P3A_ANA: mmio.Mmio(packed struct(u32) {
        reserved23: u23 = 0,
        /// need_des
        ANA_0P3A_MUL_0: u3,
        /// need_des
        ANA_0P3A_EN_VDET_0: u1,
        /// need_des
        ANA_0P3A_EN_CUR_LIM_0: u1,
        /// need_des
        ANA_0P3A_DREF_0: u4,
    }),
    /// need_des
    /// offset: 0x1d0
    EXT_LDO_P1_0P1A: mmio.Mmio(packed struct(u32) {
        reserved7: u7 = 0,
        /// need_des
        _0P1A_FORCE_TIEH_SEL_1: u1,
        /// need_des
        _0P1A_XPD_1: u1,
        /// need_des
        _0P1A_TIEH_SEL_1: u3,
        /// need_des
        _0P1A_TIEH_POS_EN_1: u1,
        /// need_des
        _0P1A_TIEH_NEG_EN_1: u1,
        /// need_des
        _0P1A_TIEH_1: u1,
        /// need_des
        _0P1A_TARGET1_1: u8,
        /// need_des
        _0P1A_TARGET0_1: u8,
        /// need_des
        _0P1A_LDO_CNT_PRESCALER_SEL_1: u1,
    }),
    /// need_des
    /// offset: 0x1d4
    EXT_LDO_P1_0P1A_ANA: mmio.Mmio(packed struct(u32) {
        reserved23: u23 = 0,
        /// need_des
        ANA_0P1A_MUL_1: u3,
        /// need_des
        ANA_0P1A_EN_VDET_1: u1,
        /// need_des
        ANA_0P1A_EN_CUR_LIM_1: u1,
        /// need_des
        ANA_0P1A_DREF_1: u4,
    }),
    /// need_des
    /// offset: 0x1d8
    EXT_LDO_P1_0P2A: mmio.Mmio(packed struct(u32) {
        reserved7: u7 = 0,
        /// need_des
        _0P2A_FORCE_TIEH_SEL_1: u1,
        /// need_des
        _0P2A_XPD_1: u1,
        /// need_des
        _0P2A_TIEH_SEL_1: u3,
        /// need_des
        _0P2A_TIEH_POS_EN_1: u1,
        /// need_des
        _0P2A_TIEH_NEG_EN_1: u1,
        /// need_des
        _0P2A_TIEH_1: u1,
        /// need_des
        _0P2A_TARGET1_1: u8,
        /// need_des
        _0P2A_TARGET0_1: u8,
        /// need_des
        _0P2A_LDO_CNT_PRESCALER_SEL_1: u1,
    }),
    /// need_des
    /// offset: 0x1dc
    EXT_LDO_P1_0P2A_ANA: mmio.Mmio(packed struct(u32) {
        reserved23: u23 = 0,
        /// need_des
        ANA_0P2A_MUL_1: u3,
        /// need_des
        ANA_0P2A_EN_VDET_1: u1,
        /// need_des
        ANA_0P2A_EN_CUR_LIM_1: u1,
        /// need_des
        ANA_0P2A_DREF_1: u4,
    }),
    /// need_des
    /// offset: 0x1e0
    EXT_LDO_P1_0P3A: mmio.Mmio(packed struct(u32) {
        reserved7: u7 = 0,
        /// need_des
        _0P3A_FORCE_TIEH_SEL_1: u1,
        /// need_des
        _0P3A_XPD_1: u1,
        /// need_des
        _0P3A_TIEH_SEL_1: u3,
        /// need_des
        _0P3A_TIEH_POS_EN_1: u1,
        /// need_des
        _0P3A_TIEH_NEG_EN_1: u1,
        /// need_des
        _0P3A_TIEH_1: u1,
        /// need_des
        _0P3A_TARGET1_1: u8,
        /// need_des
        _0P3A_TARGET0_1: u8,
        /// need_des
        _0P3A_LDO_CNT_PRESCALER_SEL_1: u1,
    }),
    /// need_des
    /// offset: 0x1e4
    EXT_LDO_P1_0P3A_ANA: mmio.Mmio(packed struct(u32) {
        reserved23: u23 = 0,
        /// need_des
        ANA_0P3A_MUL_1: u3,
        /// need_des
        ANA_0P3A_EN_VDET_1: u1,
        /// need_des
        ANA_0P3A_EN_CUR_LIM_1: u1,
        /// need_des
        ANA_0P3A_DREF_1: u4,
    }),
    /// need_des
    /// offset: 0x1e8
    EXT_WAKEUP_LV: mmio.Mmio(packed struct(u32) {
        /// need_des
        EXT_WAKEUP_LV: u32,
    }),
    /// need_des
    /// offset: 0x1ec
    EXT_WAKEUP_SEL: mmio.Mmio(packed struct(u32) {
        /// need_des
        EXT_WAKEUP_SEL: u32,
    }),
    /// need_des
    /// offset: 0x1f0
    EXT_WAKEUP_ST: mmio.Mmio(packed struct(u32) {
        /// need_des
        EXT_WAKEUP_STATUS: u32,
    }),
    /// need_des
    /// offset: 0x1f4
    EXT_WAKEUP_CNTL: mmio.Mmio(packed struct(u32) {
        reserved30: u30 = 0,
        /// need_des
        EXT_WAKEUP_STATUS_CLR: u1,
        /// need_des
        EXT_WAKEUP_FILTER: u1,
    }),
    /// need_des
    /// offset: 0x1f8
    SDIO_WAKEUP_CNTL: mmio.Mmio(packed struct(u32) {
        /// need_des
        SDIO_ACT_DNUM: u10,
        padding: u22 = 0,
    }),
    /// need_des
    /// offset: 0x1fc
    XTAL_SLP: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// need_des
        CNT_TARGET: u16,
    }),
    /// need_des
    /// offset: 0x200
    CPU_SW_STALL: mmio.Mmio(packed struct(u32) {
        reserved16: u16 = 0,
        /// need_des
        HPCORE1_SW_STALL_CODE: u8,
        /// need_des
        HPCORE0_SW_STALL_CODE: u8,
    }),
    /// need_des
    /// offset: 0x204
    DCM_CTRL: mmio.Mmio(packed struct(u32) {
        /// SW trigger dcdc on
        DCDC_ON_REQ: u1,
        /// SW trigger dcdc off
        DCDC_OFF_REQ: u1,
        /// SW trigger dcdc enter lightsleep
        DCDC_LIGHTSLP_REQ: u1,
        /// SW trigger dcdc enter deepsleep
        DCDC_DEEPSLP_REQ: u1,
        reserved7: u3 = 0,
        /// need_des
        DCDC_DONE_FORCE: u1,
        /// need_des
        DCDC_ON_FORCE_PU: u1,
        /// need_des
        DCDC_ON_FORCE_PD: u1,
        /// need_des
        DCDC_FB_RES_FORCE_PU: u1,
        /// need_des
        DCDC_FB_RES_FORCE_PD: u1,
        /// need_des
        DCDC_LS_FORCE_PU: u1,
        /// need_des
        DCDC_LS_FORCE_PD: u1,
        /// need_des
        DCDC_DS_FORCE_PU: u1,
        /// need_des
        DCDC_DS_FORCE_PD: u1,
        /// need_des
        DCM_CUR_ST: u8,
        reserved29: u5 = 0,
        /// Enable analog mux to pull PAD TEST_DCDC voltage signal
        DCDC_EN_AMUX_TEST: u1,
        padding: u2 = 0,
    }),
    /// need_des
    /// offset: 0x208
    DCM_WAIT_DELAY: mmio.Mmio(packed struct(u32) {
        /// DCDC pre-on/post off delay
        DCDC_PRE_DELAY: u8,
        /// DCDC fb res off delay
        DCDC_RES_OFF_DELAY: u8,
        /// DCDC stable delay
        DCDC_STABLE_DELAY: u10,
        padding: u6 = 0,
    }),
    /// need_des
    /// offset: 0x20c
    VDDBAT_CFG: mmio.Mmio(packed struct(u32) {
        /// need_des
        ANA_VDDBAT_MODE: u2,
        reserved31: u29 = 0,
        /// need_des
        VDDBAT_SW_UPDATE: u1,
    }),
    /// need_des
    /// offset: 0x210
    TOUCH_PWR_CNTL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// need_des
        TOUCH_WAIT_CYCLES: u9,
        /// need_des
        TOUCH_SLEEP_CYCLES: u16,
        /// need_des
        TOUCH_FORCE_DONE: u1,
        /// need_des
        TOUCH_SLEEP_TIMER_EN: u1,
    }),
    /// need_des
    /// offset: 0x214
    RDN_ECO: mmio.Mmio(packed struct(u32) {
        /// need_des
        PMU_RDN_ECO_RESULT: u1,
        reserved31: u30 = 0,
        /// need_des
        PMU_RDN_ECO_EN: u1,
    }),
    /// offset: 0x218
    reserved536: [484]u8,
    /// need_des
    /// offset: 0x3fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// need_des
        PMU_DATE: u31,
        /// need_des
        CLK_EN: u1,
    }),
};
