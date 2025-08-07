const mmio = @import("mmio");
const types = @import("../../types.zig");

/// PAU Peripheral
pub const PAU = extern struct {
    /// Peri backup control register
    /// offset: 0x00
    REGDMA_CONF: mmio.Mmio(packed struct(u32) {
        /// backup error type
        FLOW_ERR: u3,
        /// backup start signal
        START: u1,
        /// backup direction(reg to mem / mem to reg)
        TO_MEM: u1,
        /// Link select
        LINK_SEL: u2,
        /// mac sw backup start signal
        START_MAC: u1,
        /// mac sw backup direction(reg to mem / mem to reg)
        TO_MEM_MAC: u1,
        /// mac hw/sw select
        SEL_MAC: u1,
        padding: u22 = 0,
    }),
    /// Clock control register
    /// offset: 0x04
    REGDMA_CLK_CONF: mmio.Mmio(packed struct(u32) {
        /// clock enable
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// ETM start ctrl reg
    /// offset: 0x08
    REGDMA_ETM_CTRL: mmio.Mmio(packed struct(u32) {
        /// etm_start_0 reg
        ETM_START_0: u1,
        /// etm_start_1 reg
        ETM_START_1: u1,
        /// etm_start_2 reg
        ETM_START_2: u1,
        /// etm_start_3 reg
        ETM_START_3: u1,
        padding: u28 = 0,
    }),
    /// link_0_addr
    /// offset: 0x0c
    REGDMA_LINK_0_ADDR: mmio.Mmio(packed struct(u32) {
        /// link_0_addr reg
        LINK_ADDR_0: u32,
    }),
    /// Link_1_addr
    /// offset: 0x10
    REGDMA_LINK_1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Link_1_addr reg
        LINK_ADDR_1: u32,
    }),
    /// Link_2_addr
    /// offset: 0x14
    REGDMA_LINK_2_ADDR: mmio.Mmio(packed struct(u32) {
        /// Link_2_addr reg
        LINK_ADDR_2: u32,
    }),
    /// Link_3_addr
    /// offset: 0x18
    REGDMA_LINK_3_ADDR: mmio.Mmio(packed struct(u32) {
        /// Link_3_addr reg
        LINK_ADDR_3: u32,
    }),
    /// Link_mac_addr
    /// offset: 0x1c
    REGDMA_LINK_MAC_ADDR: mmio.Mmio(packed struct(u32) {
        /// Link_mac_addr reg
        LINK_ADDR_MAC: u32,
    }),
    /// current link addr
    /// offset: 0x20
    REGDMA_CURRENT_LINK_ADDR: mmio.Mmio(packed struct(u32) {
        /// current link addr reg
        CURRENT_LINK_ADDR: u32,
    }),
    /// Backup addr
    /// offset: 0x24
    REGDMA_BACKUP_ADDR: mmio.Mmio(packed struct(u32) {
        /// backup addr reg
        BACKUP_ADDR: u32,
    }),
    /// mem addr
    /// offset: 0x28
    REGDMA_MEM_ADDR: mmio.Mmio(packed struct(u32) {
        /// mem addr reg
        MEM_ADDR: u32,
    }),
    /// backup config
    /// offset: 0x2c
    REGDMA_BKP_CONF: mmio.Mmio(packed struct(u32) {
        /// Link read_interval
        READ_INTERVAL: u7,
        /// link wait timeout threshold
        LINK_TOUT_THRES: u10,
        /// burst limit
        BURST_LIMIT: u5,
        /// Backup timeout threshold
        BACKUP_TOUT_THRES: u10,
    }),
    /// Read only register for error and done
    /// offset: 0x30
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// backup done flag
        DONE_INT_ENA: u1,
        /// error flag
        ERROR_INT_ENA: u1,
        padding: u30 = 0,
    }),
    /// Read only register for error and done
    /// offset: 0x34
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// backup done flag
        DONE_INT_RAW: u1,
        /// error flag
        ERROR_INT_RAW: u1,
        padding: u30 = 0,
    }),
    /// Read only register for error and done
    /// offset: 0x38
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// backup done flag
        DONE_INT_CLR: u1,
        /// error flag
        ERROR_INT_CLR: u1,
        padding: u30 = 0,
    }),
    /// Read only register for error and done
    /// offset: 0x3c
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// backup done flag
        DONE_INT_ST: u1,
        /// error flag
        ERROR_INT_ST: u1,
        padding: u30 = 0,
    }),
    /// offset: 0x40
    reserved64: [956]u8,
    /// Date register.
    /// offset: 0x3fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// REGDMA date information/ REGDMA version information.
        DATE: u28,
        padding: u4 = 0,
    }),
};
