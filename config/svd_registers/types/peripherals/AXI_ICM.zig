const mmio = @import("mmio");
const types = @import("../../types.zig");

/// AXI_ICM Peripheral
pub const AXI_ICM = extern struct {
    /// NA
    /// offset: 0x00
    VERID_FILEDS: mmio.Mmio(packed struct(u32) {
        /// NA
        ICM_REG_VERID: u32,
    }),
    /// NA
    /// offset: 0x04
    HW_CFG: mmio.Mmio(packed struct(u32) {
        /// NA
        ICM_REG_AXI_HWCFG_QOS_SUPPORT: u1,
        /// NA
        ICM_REG_AXI_HWCFG_APB3_SUPPORT: u1,
        /// NA
        ICM_REG_AXI_HWCFG_AXI4_SUPPORT: u1,
        /// NA
        ICM_REG_AXI_HWCFG_LOCK_EN: u1,
        /// NA
        ICM_REG_AXI_HWCFG_TRUST_ZONE_EN: u1,
        /// NA
        ICM_REG_AXI_HWCFG_DECODER_TYPE: u1,
        /// NA
        ICM_REG_AXI_HWCFG_REMAP_EN: u1,
        /// NA
        ICM_REG_AXI_HWCFG_BI_DIR_CMD_EN: u1,
        /// NA
        ICM_REG_AXI_HWCFG_LOW_POWER_INF_EN: u1,
        reserved12: u3 = 0,
        /// NA
        ICM_REG_AXI_HWCFG_AXI_NUM_MASTERS: u5,
        reserved20: u3 = 0,
        /// NA
        ICM_REG_AXI_HWCFG_AXI_NUM_SLAVES: u5,
        padding: u7 = 0,
    }),
    /// NA
    /// offset: 0x08
    CMD: mmio.Mmio(packed struct(u32) {
        /// NA
        ICM_REG_AXI_CMD: u3,
        reserved7: u4 = 0,
        /// NA
        ICM_REG_RD_WR_CHAN: u1,
        /// NA
        ICM_REG_AXI_MASTER_PORT: u4,
        reserved28: u16 = 0,
        /// NA
        ICM_REG_AXI_ERR_BIT: u1,
        /// NA
        ICM_REG_AXI_SOFT_RESET_BIT: u1,
        /// NA
        ICM_REG_AXI_RD_WR_CMD: u1,
        /// NA
        ICM_REG_AXI_CMD_EN: u1,
    }),
    /// NA
    /// offset: 0x0c
    DATA: mmio.Mmio(packed struct(u32) {
        /// NA
        ICM_REG_DATA: u32,
    }),
};
