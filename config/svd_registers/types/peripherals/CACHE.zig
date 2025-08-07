const mmio = @import("mmio");
const types = @import("../../types.zig");

/// CACHE Peripheral
pub const CACHE = extern struct {
    /// L1 instruction Cache(L1-ICache) control register
    /// offset: 0x00
    L1_ICACHE_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to disable core0 ibus access L1-ICache, 0: enable, 1: disable
        L1_ICACHE_SHUT_IBUS0: u1,
        /// The bit is used to disable core1 ibus access L1-ICache, 0: enable, 1: disable
        L1_ICACHE_SHUT_IBUS1: u1,
        /// Reserved
        L1_ICACHE_SHUT_IBUS2: u1,
        /// Reserved
        L1_ICACHE_SHUT_IBUS3: u1,
        reserved8: u4 = 0,
        /// Reserved
        L1_ICACHE_UNDEF_OP: u8,
        padding: u16 = 0,
    }),
    /// L1 data Cache(L1-DCache) control register
    /// offset: 0x04
    L1_DCACHE_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to disable core0 dbus access L1-DCache, 0: enable, 1: disable
        L1_DCACHE_SHUT_DBUS0: u1,
        /// The bit is used to disable core1 dbus access L1-DCache, 0: enable, 1: disable
        L1_DCACHE_SHUT_DBUS1: u1,
        /// Reserved
        L1_DCACHE_SHUT_DBUS2: u1,
        /// Reserved
        L1_DCACHE_SHUT_DBUS3: u1,
        /// The bit is used to disable DMA access L1-DCache, 0: enable, 1: disable
        L1_DCACHE_SHUT_DMA: u1,
        reserved8: u3 = 0,
        /// Reserved
        L1_DCACHE_UNDEF_OP: u8,
        padding: u16 = 0,
    }),
    /// Bypass Cache configure register
    /// offset: 0x08
    L1_BYPASS_CACHE_CONF: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable bypass L1-ICache0. 0: disable bypass, 1: enable bypass.
        BYPASS_L1_ICACHE0_EN: u1,
        /// The bit is used to enable bypass L1-ICache1. 0: disable bypass, 1: enable bypass.
        BYPASS_L1_ICACHE1_EN: u1,
        /// Reserved
        BYPASS_L1_ICACHE2_EN: u1,
        /// Reserved
        BYPASS_L1_ICACHE3_EN: u1,
        /// The bit is used to enable bypass L1-DCache. 0: disable bypass, 1: enable bypass.
        BYPASS_L1_DCACHE_EN: u1,
        padding: u27 = 0,
    }),
    /// L1 Cache atomic feature configure register
    /// offset: 0x0c
    L1_CACHE_ATOMIC_CONF: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable atomic feature on L1-DCache when multiple cores access L1-DCache. 1: disable, 1: enable.
        L1_DCACHE_ATOMIC_EN: u1,
        padding: u31 = 0,
    }),
    /// L1 instruction Cache CacheSize mode configure register
    /// offset: 0x10
    L1_ICACHE_CACHESIZE_CONF: mmio.Mmio(packed struct(u32) {
        /// The field is used to configure cachesize of L1-ICache as 256 bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_256: u1,
        /// The field is used to configure cachesize of L1-ICache as 512 bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_512: u1,
        /// The field is used to configure cachesize of L1-ICache as 1k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_1K: u1,
        /// The field is used to configure cachesize of L1-ICache as 2k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_2K: u1,
        /// The field is used to configure cachesize of L1-ICache as 4k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_4K: u1,
        /// The field is used to configure cachesize of L1-ICache as 8k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_8K: u1,
        /// The field is used to configure cachesize of L1-ICache as 16k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_16K: u1,
        /// The field is used to configure cachesize of L1-ICache as 32k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_32K: u1,
        /// The field is used to configure cachesize of L1-ICache as 64k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_64K: u1,
        /// The field is used to configure cachesize of L1-ICache as 128k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_128K: u1,
        /// The field is used to configure cachesize of L1-ICache as 256k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_256K: u1,
        /// The field is used to configure cachesize of L1-ICache as 512k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_512K: u1,
        /// The field is used to configure cachesize of L1-ICache as 1024k bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_CACHESIZE_1024K: u1,
        padding: u19 = 0,
    }),
    /// L1 instruction Cache BlockSize mode configure register
    /// offset: 0x14
    L1_ICACHE_BLOCKSIZE_CONF: mmio.Mmio(packed struct(u32) {
        /// The field is used to configureblocksize of L1-ICache as 8 bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_BLOCKSIZE_8: u1,
        /// The field is used to configureblocksize of L1-ICache as 16 bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_BLOCKSIZE_16: u1,
        /// The field is used to configureblocksize of L1-ICache as 32 bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_BLOCKSIZE_32: u1,
        /// The field is used to configureblocksize of L1-ICache as 64 bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_BLOCKSIZE_64: u1,
        /// The field is used to configureblocksize of L1-ICache as 128 bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_BLOCKSIZE_128: u1,
        /// The field is used to configureblocksize of L1-ICache as 256 bytes. This field and all other fields within this register is onehot.
        L1_ICACHE_BLOCKSIZE_256: u1,
        padding: u26 = 0,
    }),
    /// L1 data Cache CacheSize mode configure register
    /// offset: 0x18
    L1_DCACHE_CACHESIZE_CONF: mmio.Mmio(packed struct(u32) {
        /// The field is used to configure cachesize of L1-DCache as 256 bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_256: u1,
        /// The field is used to configure cachesize of L1-DCache as 512 bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_512: u1,
        /// The field is used to configure cachesize of L1-DCache as 1k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_1K: u1,
        /// The field is used to configure cachesize of L1-DCache as 2k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_2K: u1,
        /// The field is used to configure cachesize of L1-DCache as 4k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_4K: u1,
        /// The field is used to configure cachesize of L1-DCache as 8k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_8K: u1,
        /// The field is used to configure cachesize of L1-DCache as 16k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_16K: u1,
        /// The field is used to configure cachesize of L1-DCache as 32k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_32K: u1,
        /// The field is used to configure cachesize of L1-DCache as 64k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_64K: u1,
        /// The field is used to configure cachesize of L1-DCache as 128k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_128K: u1,
        /// The field is used to configure cachesize of L1-DCache as 256k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_256K: u1,
        /// The field is used to configure cachesize of L1-DCache as 512k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_512K: u1,
        /// The field is used to configure cachesize of L1-DCache as 1024k bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_CACHESIZE_1024K: u1,
        padding: u19 = 0,
    }),
    /// L1 data Cache BlockSize mode configure register
    /// offset: 0x1c
    L1_DCACHE_BLOCKSIZE_CONF: mmio.Mmio(packed struct(u32) {
        /// The field is used to configureblocksize of L1-DCache as 8 bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_BLOCKSIZE_8: u1,
        /// The field is used to configureblocksize of L1-DCache as 16 bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_BLOCKSIZE_16: u1,
        /// The field is used to configureblocksize of L1-DCache as 32 bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_BLOCKSIZE_32: u1,
        /// The field is used to configureblocksize of L1-DCache as 64 bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_BLOCKSIZE_64: u1,
        /// The field is used to configureblocksize of L1-DCache as 128 bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_BLOCKSIZE_128: u1,
        /// The field is used to configureblocksize of L1-DCache as 256 bytes. This field and all other fields within this register is onehot.
        L1_DCACHE_BLOCKSIZE_256: u1,
        padding: u26 = 0,
    }),
    /// Cache wrap around control register
    /// offset: 0x20
    L1_CACHE_WRAP_AROUND_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set this bit as 1 to enable L1-ICache0 wrap around mode.
        L1_ICACHE0_WRAP: u1,
        /// Set this bit as 1 to enable L1-ICache1 wrap around mode.
        L1_ICACHE1_WRAP: u1,
        /// Reserved
        L1_ICACHE2_WRAP: u1,
        /// Reserved
        L1_ICACHE3_WRAP: u1,
        /// Set this bit as 1 to enable L1-DCache wrap around mode.
        L1_DCACHE_WRAP: u1,
        padding: u27 = 0,
    }),
    /// Cache tag memory power control register
    /// offset: 0x24
    L1_CACHE_TAG_MEM_POWER_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to close clock gating of L1-ICache0 tag memory. 1: close gating, 0: open clock gating.
        L1_ICACHE0_TAG_MEM_FORCE_ON: u1,
        /// The bit is used to power L1-ICache0 tag memory down. 0: follow rtc_lslp, 1: power down
        L1_ICACHE0_TAG_MEM_FORCE_PD: u1,
        /// The bit is used to power L1-ICache0 tag memory up. 0: follow rtc_lslp, 1: power up
        L1_ICACHE0_TAG_MEM_FORCE_PU: u1,
        reserved4: u1 = 0,
        /// The bit is used to close clock gating of L1-ICache1 tag memory. 1: close gating, 0: open clock gating.
        L1_ICACHE1_TAG_MEM_FORCE_ON: u1,
        /// The bit is used to power L1-ICache1 tag memory down. 0: follow rtc_lslp, 1: power down
        L1_ICACHE1_TAG_MEM_FORCE_PD: u1,
        /// The bit is used to power L1-ICache1 tag memory up. 0: follow rtc_lslp, 1: power up
        L1_ICACHE1_TAG_MEM_FORCE_PU: u1,
        reserved8: u1 = 0,
        /// Reserved
        L1_ICACHE2_TAG_MEM_FORCE_ON: u1,
        /// Reserved
        L1_ICACHE2_TAG_MEM_FORCE_PD: u1,
        /// Reserved
        L1_ICACHE2_TAG_MEM_FORCE_PU: u1,
        reserved12: u1 = 0,
        /// Reserved
        L1_ICACHE3_TAG_MEM_FORCE_ON: u1,
        /// Reserved
        L1_ICACHE3_TAG_MEM_FORCE_PD: u1,
        /// Reserved
        L1_ICACHE3_TAG_MEM_FORCE_PU: u1,
        reserved16: u1 = 0,
        /// The bit is used to close clock gating of L1-DCache tag memory. 1: close gating, 0: open clock gating.
        L1_DCACHE_TAG_MEM_FORCE_ON: u1,
        /// The bit is used to power L1-DCache tag memory down. 0: follow rtc_lslp, 1: power down
        L1_DCACHE_TAG_MEM_FORCE_PD: u1,
        /// The bit is used to power L1-DCache tag memory up. 0: follow rtc_lslp, 1: power up
        L1_DCACHE_TAG_MEM_FORCE_PU: u1,
        padding: u13 = 0,
    }),
    /// Cache data memory power control register
    /// offset: 0x28
    L1_CACHE_DATA_MEM_POWER_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to close clock gating of L1-ICache0 data memory. 1: close gating, 0: open clock gating.
        L1_ICACHE0_DATA_MEM_FORCE_ON: u1,
        /// The bit is used to power L1-ICache0 data memory down. 0: follow rtc_lslp, 1: power down
        L1_ICACHE0_DATA_MEM_FORCE_PD: u1,
        /// The bit is used to power L1-ICache0 data memory up. 0: follow rtc_lslp, 1: power up
        L1_ICACHE0_DATA_MEM_FORCE_PU: u1,
        reserved4: u1 = 0,
        /// The bit is used to close clock gating of L1-ICache1 data memory. 1: close gating, 0: open clock gating.
        L1_ICACHE1_DATA_MEM_FORCE_ON: u1,
        /// The bit is used to power L1-ICache1 data memory down. 0: follow rtc_lslp, 1: power down
        L1_ICACHE1_DATA_MEM_FORCE_PD: u1,
        /// The bit is used to power L1-ICache1 data memory up. 0: follow rtc_lslp, 1: power up
        L1_ICACHE1_DATA_MEM_FORCE_PU: u1,
        reserved8: u1 = 0,
        /// Reserved
        L1_ICACHE2_DATA_MEM_FORCE_ON: u1,
        /// Reserved
        L1_ICACHE2_DATA_MEM_FORCE_PD: u1,
        /// Reserved
        L1_ICACHE2_DATA_MEM_FORCE_PU: u1,
        reserved12: u1 = 0,
        /// Reserved
        L1_ICACHE3_DATA_MEM_FORCE_ON: u1,
        /// Reserved
        L1_ICACHE3_DATA_MEM_FORCE_PD: u1,
        /// Reserved
        L1_ICACHE3_DATA_MEM_FORCE_PU: u1,
        reserved16: u1 = 0,
        /// The bit is used to close clock gating of L1-DCache data memory. 1: close gating, 0: open clock gating.
        L1_DCACHE_DATA_MEM_FORCE_ON: u1,
        /// The bit is used to power L1-DCache data memory down. 0: follow rtc_lslp, 1: power down
        L1_DCACHE_DATA_MEM_FORCE_PD: u1,
        /// The bit is used to power L1-DCache data memory up. 0: follow rtc_lslp, 1: power up
        L1_DCACHE_DATA_MEM_FORCE_PU: u1,
        padding: u13 = 0,
    }),
    /// Cache Freeze control register
    /// offset: 0x2c
    L1_CACHE_FREEZE_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable freeze operation on L1-ICache0. It can be cleared by software.
        L1_ICACHE0_FREEZE_EN: u1,
        /// The bit is used to configure mode of freeze operation L1-ICache0. 0: a miss-access will not stuck. 1: a miss-access will stuck.
        L1_ICACHE0_FREEZE_MODE: u1,
        /// The bit is used to indicate whether freeze operation on L1-ICache0 is finished or not. 0: not finished. 1: finished.
        L1_ICACHE0_FREEZE_DONE: u1,
        reserved4: u1 = 0,
        /// The bit is used to enable freeze operation on L1-ICache1. It can be cleared by software.
        L1_ICACHE1_FREEZE_EN: u1,
        /// The bit is used to configure mode of freeze operation L1-ICache1. 0: a miss-access will not stuck. 1: a miss-access will stuck.
        L1_ICACHE1_FREEZE_MODE: u1,
        /// The bit is used to indicate whether freeze operation on L1-ICache1 is finished or not. 0: not finished. 1: finished.
        L1_ICACHE1_FREEZE_DONE: u1,
        reserved8: u1 = 0,
        /// Reserved
        L1_ICACHE2_FREEZE_EN: u1,
        /// Reserved
        L1_ICACHE2_FREEZE_MODE: u1,
        /// Reserved
        L1_ICACHE2_FREEZE_DONE: u1,
        reserved12: u1 = 0,
        /// Reserved
        L1_ICACHE3_FREEZE_EN: u1,
        /// Reserved
        L1_ICACHE3_FREEZE_MODE: u1,
        /// Reserved
        L1_ICACHE3_FREEZE_DONE: u1,
        reserved16: u1 = 0,
        /// The bit is used to enable freeze operation on L1-DCache. It can be cleared by software.
        L1_DCACHE_FREEZE_EN: u1,
        /// The bit is used to configure mode of freeze operation L1-DCache. 0: a miss-access will not stuck. 1: a miss-access will stuck.
        L1_DCACHE_FREEZE_MODE: u1,
        /// The bit is used to indicate whether freeze operation on L1-DCache is finished or not. 0: not finished. 1: finished.
        L1_DCACHE_FREEZE_DONE: u1,
        padding: u13 = 0,
    }),
    /// Cache data memory access configure register
    /// offset: 0x30
    L1_CACHE_DATA_MEM_ACS_CONF: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable config-bus read L1-ICache0 data memoryory. 0: disable, 1: enable.
        L1_ICACHE0_DATA_MEM_RD_EN: u1,
        /// The bit is used to enable config-bus write L1-ICache0 data memoryory. 0: disable, 1: enable.
        L1_ICACHE0_DATA_MEM_WR_EN: u1,
        reserved4: u2 = 0,
        /// The bit is used to enable config-bus read L1-ICache1 data memoryory. 0: disable, 1: enable.
        L1_ICACHE1_DATA_MEM_RD_EN: u1,
        /// The bit is used to enable config-bus write L1-ICache1 data memoryory. 0: disable, 1: enable.
        L1_ICACHE1_DATA_MEM_WR_EN: u1,
        reserved8: u2 = 0,
        /// Reserved
        L1_ICACHE2_DATA_MEM_RD_EN: u1,
        /// Reserved
        L1_ICACHE2_DATA_MEM_WR_EN: u1,
        reserved12: u2 = 0,
        /// Reserved
        L1_ICACHE3_DATA_MEM_RD_EN: u1,
        /// Reserved
        L1_ICACHE3_DATA_MEM_WR_EN: u1,
        reserved16: u2 = 0,
        /// The bit is used to enable config-bus read L1-DCache data memoryory. 0: disable, 1: enable.
        L1_DCACHE_DATA_MEM_RD_EN: u1,
        /// The bit is used to enable config-bus write L1-DCache data memoryory. 0: disable, 1: enable.
        L1_DCACHE_DATA_MEM_WR_EN: u1,
        padding: u14 = 0,
    }),
    /// Cache tag memory access configure register
    /// offset: 0x34
    L1_CACHE_TAG_MEM_ACS_CONF: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable config-bus read L1-ICache0 tag memoryory. 0: disable, 1: enable.
        L1_ICACHE0_TAG_MEM_RD_EN: u1,
        /// The bit is used to enable config-bus write L1-ICache0 tag memoryory. 0: disable, 1: enable.
        L1_ICACHE0_TAG_MEM_WR_EN: u1,
        reserved4: u2 = 0,
        /// The bit is used to enable config-bus read L1-ICache1 tag memoryory. 0: disable, 1: enable.
        L1_ICACHE1_TAG_MEM_RD_EN: u1,
        /// The bit is used to enable config-bus write L1-ICache1 tag memoryory. 0: disable, 1: enable.
        L1_ICACHE1_TAG_MEM_WR_EN: u1,
        reserved8: u2 = 0,
        /// Reserved
        L1_ICACHE2_TAG_MEM_RD_EN: u1,
        /// Reserved
        L1_ICACHE2_TAG_MEM_WR_EN: u1,
        reserved12: u2 = 0,
        /// Reserved
        L1_ICACHE3_TAG_MEM_RD_EN: u1,
        /// Reserved
        L1_ICACHE3_TAG_MEM_WR_EN: u1,
        reserved16: u2 = 0,
        /// The bit is used to enable config-bus read L1-DCache tag memoryory. 0: disable, 1: enable.
        L1_DCACHE_TAG_MEM_RD_EN: u1,
        /// The bit is used to enable config-bus write L1-DCache tag memoryory. 0: disable, 1: enable.
        L1_DCACHE_TAG_MEM_WR_EN: u1,
        padding: u14 = 0,
    }),
    /// L1 instruction Cache 0 prelock configure register
    /// offset: 0x38
    L1_ICACHE0_PRELOCK_CONF: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable the first section of prelock function on L1-ICache0.
        L1_ICACHE0_PRELOCK_SCT0_EN: u1,
        /// The bit is used to enable the second section of prelock function on L1-ICache0.
        L1_ICACHE0_PRELOCK_SCT1_EN: u1,
        /// The bit is used to set the gid of l1 icache0 prelock.
        L1_ICACHE0_PRELOCK_RGID: u4,
        padding: u26 = 0,
    }),
    /// L1 instruction Cache 0 prelock section0 address configure register
    /// offset: 0x3c
    L1_ICACHE0_PRELOCK_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section of prelock on L1-ICache0, which should be used together with L1_ICACHE0_PRELOCK_SCT0_SIZE_REG
        L1_ICACHE0_PRELOCK_SCT0_ADDR: u32,
    }),
    /// L1 instruction Cache 0 prelock section1 address configure register
    /// offset: 0x40
    L1_ICACHE0_PRELOCK_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section of prelock on L1-ICache0, which should be used together with L1_ICACHE0_PRELOCK_SCT1_SIZE_REG
        L1_ICACHE0_PRELOCK_SCT1_ADDR: u32,
    }),
    /// L1 instruction Cache 0 prelock section size configure register
    /// offset: 0x44
    L1_ICACHE0_PRELOCK_SCT_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L1-ICache0, which should be used together with L1_ICACHE0_PRELOCK_SCT0_ADDR_REG
        L1_ICACHE0_PRELOCK_SCT0_SIZE: u14,
        reserved16: u2 = 0,
        /// Those bits are used to configure the size of the second section of prelock on L1-ICache0, which should be used together with L1_ICACHE0_PRELOCK_SCT1_ADDR_REG
        L1_ICACHE0_PRELOCK_SCT1_SIZE: u14,
        padding: u2 = 0,
    }),
    /// L1 instruction Cache 1 prelock configure register
    /// offset: 0x48
    L1_ICACHE1_PRELOCK_CONF: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable the first section of prelock function on L1-ICache1.
        L1_ICACHE1_PRELOCK_SCT0_EN: u1,
        /// The bit is used to enable the second section of prelock function on L1-ICache1.
        L1_ICACHE1_PRELOCK_SCT1_EN: u1,
        /// The bit is used to set the gid of l1 icache1 prelock.
        L1_ICACHE1_PRELOCK_RGID: u4,
        padding: u26 = 0,
    }),
    /// L1 instruction Cache 1 prelock section0 address configure register
    /// offset: 0x4c
    L1_ICACHE1_PRELOCK_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section of prelock on L1-ICache1, which should be used together with L1_ICACHE1_PRELOCK_SCT0_SIZE_REG
        L1_ICACHE1_PRELOCK_SCT0_ADDR: u32,
    }),
    /// L1 instruction Cache 1 prelock section1 address configure register
    /// offset: 0x50
    L1_ICACHE1_PRELOCK_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section of prelock on L1-ICache1, which should be used together with L1_ICACHE1_PRELOCK_SCT1_SIZE_REG
        L1_ICACHE1_PRELOCK_SCT1_ADDR: u32,
    }),
    /// L1 instruction Cache 1 prelock section size configure register
    /// offset: 0x54
    L1_ICACHE1_PRELOCK_SCT_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L1-ICache1, which should be used together with L1_ICACHE1_PRELOCK_SCT0_ADDR_REG
        L1_ICACHE1_PRELOCK_SCT0_SIZE: u14,
        reserved16: u2 = 0,
        /// Those bits are used to configure the size of the second section of prelock on L1-ICache1, which should be used together with L1_ICACHE1_PRELOCK_SCT1_ADDR_REG
        L1_ICACHE1_PRELOCK_SCT1_SIZE: u14,
        padding: u2 = 0,
    }),
    /// L1 instruction Cache 2 prelock configure register
    /// offset: 0x58
    L1_ICACHE2_PRELOCK_CONF: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable the first section of prelock function on L1-ICache2.
        L1_ICACHE2_PRELOCK_SCT0_EN: u1,
        /// The bit is used to enable the second section of prelock function on L1-ICache2.
        L1_ICACHE2_PRELOCK_SCT1_EN: u1,
        /// The bit is used to set the gid of l1 icache2 prelock.
        L1_ICACHE2_PRELOCK_RGID: u4,
        padding: u26 = 0,
    }),
    /// L1 instruction Cache 2 prelock section0 address configure register
    /// offset: 0x5c
    L1_ICACHE2_PRELOCK_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section of prelock on L1-ICache2, which should be used together with L1_ICACHE2_PRELOCK_SCT0_SIZE_REG
        L1_ICACHE2_PRELOCK_SCT0_ADDR: u32,
    }),
    /// L1 instruction Cache 2 prelock section1 address configure register
    /// offset: 0x60
    L1_ICACHE2_PRELOCK_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section of prelock on L1-ICache2, which should be used together with L1_ICACHE2_PRELOCK_SCT1_SIZE_REG
        L1_ICACHE2_PRELOCK_SCT1_ADDR: u32,
    }),
    /// L1 instruction Cache 2 prelock section size configure register
    /// offset: 0x64
    L1_ICACHE2_PRELOCK_SCT_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L1-ICache2, which should be used together with L1_ICACHE2_PRELOCK_SCT0_ADDR_REG
        L1_ICACHE2_PRELOCK_SCT0_SIZE: u14,
        reserved16: u2 = 0,
        /// Those bits are used to configure the size of the second section of prelock on L1-ICache2, which should be used together with L1_ICACHE2_PRELOCK_SCT1_ADDR_REG
        L1_ICACHE2_PRELOCK_SCT1_SIZE: u14,
        padding: u2 = 0,
    }),
    /// L1 instruction Cache 3 prelock configure register
    /// offset: 0x68
    L1_ICACHE3_PRELOCK_CONF: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable the first section of prelock function on L1-ICache3.
        L1_ICACHE3_PRELOCK_SCT0_EN: u1,
        /// The bit is used to enable the second section of prelock function on L1-ICache3.
        L1_ICACHE3_PRELOCK_SCT1_EN: u1,
        /// The bit is used to set the gid of l1 icache3 prelock.
        L1_ICACHE3_PRELOCK_RGID: u4,
        padding: u26 = 0,
    }),
    /// L1 instruction Cache 3 prelock section0 address configure register
    /// offset: 0x6c
    L1_ICACHE3_PRELOCK_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section of prelock on L1-ICache3, which should be used together with L1_ICACHE3_PRELOCK_SCT0_SIZE_REG
        L1_ICACHE3_PRELOCK_SCT0_ADDR: u32,
    }),
    /// L1 instruction Cache 3 prelock section1 address configure register
    /// offset: 0x70
    L1_ICACHE3_PRELOCK_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section of prelock on L1-ICache3, which should be used together with L1_ICACHE3_PRELOCK_SCT1_SIZE_REG
        L1_ICACHE3_PRELOCK_SCT1_ADDR: u32,
    }),
    /// L1 instruction Cache 3 prelock section size configure register
    /// offset: 0x74
    L1_ICACHE3_PRELOCK_SCT_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L1-ICache3, which should be used together with L1_ICACHE3_PRELOCK_SCT0_ADDR_REG
        L1_ICACHE3_PRELOCK_SCT0_SIZE: u14,
        reserved16: u2 = 0,
        /// Those bits are used to configure the size of the second section of prelock on L1-ICache3, which should be used together with L1_ICACHE3_PRELOCK_SCT1_ADDR_REG
        L1_ICACHE3_PRELOCK_SCT1_SIZE: u14,
        padding: u2 = 0,
    }),
    /// L1 data Cache prelock configure register
    /// offset: 0x78
    L1_DCACHE_PRELOCK_CONF: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable the first section of prelock function on L1-DCache.
        L1_DCACHE_PRELOCK_SCT0_EN: u1,
        /// The bit is used to enable the second section of prelock function on L1-DCache.
        L1_DCACHE_PRELOCK_SCT1_EN: u1,
        /// The bit is used to set the gid of l1 dcache prelock.
        L1_DCACHE_PRELOCK_RGID: u4,
        padding: u26 = 0,
    }),
    /// L1 data Cache prelock section0 address configure register
    /// offset: 0x7c
    L1_DCACHE_PRELOCK_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section of prelock on L1-DCache, which should be used together with L1_DCACHE_PRELOCK_SCT0_SIZE_REG
        L1_DCACHE_PRELOCK_SCT0_ADDR: u32,
    }),
    /// L1 data Cache prelock section1 address configure register
    /// offset: 0x80
    L1_DCACHE_PRELOCK_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section of prelock on L1-DCache, which should be used together with L1_DCACHE_PRELOCK_SCT1_SIZE_REG
        L1_DCACHE_PRELOCK_SCT1_ADDR: u32,
    }),
    /// L1 data Cache prelock section size configure register
    /// offset: 0x84
    L1_DCACHE_PRELOCK_SCT_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L1-DCache, which should be used together with L1_DCACHE_PRELOCK_SCT0_ADDR_REG
        L1_DCACHE_PRELOCK_SCT0_SIZE: u14,
        reserved16: u2 = 0,
        /// Those bits are used to configure the size of the second section of prelock on L1-DCache, which should be used together with L1_DCACHE_PRELOCK_SCT1_ADDR_REG
        L1_DCACHE_PRELOCK_SCT1_SIZE: u14,
        padding: u2 = 0,
    }),
    /// Lock-class (manual lock) operation control register
    /// offset: 0x88
    LOCK_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable lock operation. It will be cleared by hardware after lock operation done. Note that (1) this bit and unlock_ena bit are mutually exclusive, that is, those bits can not be set to 1 at the same time. (2) lock operation can be applied on LL1-ICache, L1-DCache and L2-Cache.
        LOCK_ENA: u1,
        /// The bit is used to enable unlock operation. It will be cleared by hardware after unlock operation done. Note that (1) this bit and lock_ena bit are mutually exclusive, that is, those bits can not be set to 1 at the same time. (2) unlock operation can be applied on L1-ICache, L1-DCache and L2-Cache.
        UNLOCK_ENA: u1,
        /// The bit is used to indicate whether unlock/lock operation is finished or not. 0: not finished. 1: finished.
        LOCK_DONE: u1,
        /// The bit is used to set the gid of cache lock/unlock.
        LOCK_RGID: u4,
        padding: u25 = 0,
    }),
    /// Lock (manual lock) map configure register
    /// offset: 0x8c
    LOCK_MAP: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to indicate which caches in the two-level cache structure will apply this lock/unlock operation. [0]: L1-ICache0, [1]: L1-ICache1, [2]: L1-ICache2, [3]: L1-ICache3, [4]: L1-DCache, [5]: L2-Cache.
        LOCK_MAP: u6,
        padding: u26 = 0,
    }),
    /// Lock (manual lock) address configure register
    /// offset: 0x90
    LOCK_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the lock/unlock operation, which should be used together with CACHE_LOCK_SIZE_REG
        LOCK_ADDR: u32,
    }),
    /// Lock (manual lock) size configure register
    /// offset: 0x94
    LOCK_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the lock/unlock operation, which should be used together with CACHE_LOCK_ADDR_REG
        LOCK_SIZE: u16,
        padding: u16 = 0,
    }),
    /// Sync-class operation control register
    /// offset: 0x98
    SYNC_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable invalidate operation. It will be cleared by hardware after invalidate operation done. Note that this bit and the other sync-bits (clean_ena, writeback_ena, writeback_invalidate_ena) are mutually exclusive, that is, those bits can not be set to 1 at the same time.
        INVALIDATE_ENA: u1,
        /// The bit is used to enable clean operation. It will be cleared by hardware after clean operation done. Note that this bit and the other sync-bits (invalidate_ena, writeback_ena, writeback_invalidate_ena) are mutually exclusive, that is, those bits can not be set to 1 at the same time.
        CLEAN_ENA: u1,
        /// The bit is used to enable writeback operation. It will be cleared by hardware after writeback operation done. Note that this bit and the other sync-bits (invalidate_ena, clean_ena, writeback_invalidate_ena) are mutually exclusive, that is, those bits can not be set to 1 at the same time.
        WRITEBACK_ENA: u1,
        /// The bit is used to enable writeback-invalidate operation. It will be cleared by hardware after writeback-invalidate operation done. Note that this bit and the other sync-bits (invalidate_ena, clean_ena, writeback_ena) are mutually exclusive, that is, those bits can not be set to 1 at the same time.
        WRITEBACK_INVALIDATE_ENA: u1,
        /// The bit is used to indicate whether sync operation (invalidate, clean, writeback, writeback_invalidate) is finished or not. 0: not finished. 1: finished.
        SYNC_DONE: u1,
        /// The bit is used to set the gid of cache sync operation (invalidate, clean, writeback, writeback_invalidate)
        SYNC_RGID: u4,
        padding: u23 = 0,
    }),
    /// Sync map configure register
    /// offset: 0x9c
    SYNC_MAP: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to indicate which caches in the two-level cache structure will apply the sync operation. [0]: L1-ICache0, [1]: L1-ICache1, [2]: L1-ICache2, [3]: L1-ICache3, [4]: L1-DCache, [5]: L2-Cache.
        SYNC_MAP: u6,
        padding: u26 = 0,
    }),
    /// Sync address configure register
    /// offset: 0xa0
    SYNC_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the sync operation, which should be used together with CACHE_SYNC_SIZE_REG
        SYNC_ADDR: u32,
    }),
    /// Sync size configure register
    /// offset: 0xa4
    SYNC_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the sync operation, which should be used together with CACHE_SYNC_ADDR_REG
        SYNC_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 instruction Cache 0 preload-operation control register
    /// offset: 0xa8
    L1_ICACHE0_PRELOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable preload operation on L1-ICache0. It will be cleared by hardware automatically after preload operation is done.
        L1_ICACHE0_PRELOAD_ENA: u1,
        /// The bit is used to indicate whether preload operation is finished or not. 0: not finished. 1: finished.
        L1_ICACHE0_PRELOAD_DONE: u1,
        /// The bit is used to configure the direction of preload operation. 0: ascending, 1: descending.
        L1_ICACHE0_PRELOAD_ORDER: u1,
        /// The bit is used to set the gid of l1 icache0 preload.
        L1_ICACHE0_PRELOAD_RGID: u4,
        padding: u25 = 0,
    }),
    /// L1 instruction Cache 0 preload address configure register
    /// offset: 0xac
    L1_ICACHE0_PRELOAD_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of preload on L1-ICache0, which should be used together with L1_ICACHE0_PRELOAD_SIZE_REG
        L1_ICACHE0_PRELOAD_ADDR: u32,
    }),
    /// L1 instruction Cache 0 preload size configure register
    /// offset: 0xb0
    L1_ICACHE0_PRELOAD_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L1-ICache0, which should be used together with L1_ICACHE0_PRELOAD_ADDR_REG
        L1_ICACHE0_PRELOAD_SIZE: u14,
        padding: u18 = 0,
    }),
    /// L1 instruction Cache 1 preload-operation control register
    /// offset: 0xb4
    L1_ICACHE1_PRELOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable preload operation on L1-ICache1. It will be cleared by hardware automatically after preload operation is done.
        L1_ICACHE1_PRELOAD_ENA: u1,
        /// The bit is used to indicate whether preload operation is finished or not. 0: not finished. 1: finished.
        L1_ICACHE1_PRELOAD_DONE: u1,
        /// The bit is used to configure the direction of preload operation. 0: ascending, 1: descending.
        L1_ICACHE1_PRELOAD_ORDER: u1,
        /// The bit is used to set the gid of l1 icache1 preload.
        L1_ICACHE1_PRELOAD_RGID: u4,
        padding: u25 = 0,
    }),
    /// L1 instruction Cache 1 preload address configure register
    /// offset: 0xb8
    L1_ICACHE1_PRELOAD_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of preload on L1-ICache1, which should be used together with L1_ICACHE1_PRELOAD_SIZE_REG
        L1_ICACHE1_PRELOAD_ADDR: u32,
    }),
    /// L1 instruction Cache 1 preload size configure register
    /// offset: 0xbc
    L1_ICACHE1_PRELOAD_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L1-ICache1, which should be used together with L1_ICACHE1_PRELOAD_ADDR_REG
        L1_ICACHE1_PRELOAD_SIZE: u14,
        padding: u18 = 0,
    }),
    /// L1 instruction Cache 2 preload-operation control register
    /// offset: 0xc0
    L1_ICACHE2_PRELOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable preload operation on L1-ICache2. It will be cleared by hardware automatically after preload operation is done.
        L1_ICACHE2_PRELOAD_ENA: u1,
        /// The bit is used to indicate whether preload operation is finished or not. 0: not finished. 1: finished.
        L1_ICACHE2_PRELOAD_DONE: u1,
        /// The bit is used to configure the direction of preload operation. 0: ascending, 1: descending.
        L1_ICACHE2_PRELOAD_ORDER: u1,
        /// The bit is used to set the gid of l1 icache2 preload.
        L1_ICACHE2_PRELOAD_RGID: u4,
        padding: u25 = 0,
    }),
    /// L1 instruction Cache 2 preload address configure register
    /// offset: 0xc4
    L1_ICACHE2_PRELOAD_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of preload on L1-ICache2, which should be used together with L1_ICACHE2_PRELOAD_SIZE_REG
        L1_ICACHE2_PRELOAD_ADDR: u32,
    }),
    /// L1 instruction Cache 2 preload size configure register
    /// offset: 0xc8
    L1_ICACHE2_PRELOAD_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L1-ICache2, which should be used together with L1_ICACHE2_PRELOAD_ADDR_REG
        L1_ICACHE2_PRELOAD_SIZE: u14,
        padding: u18 = 0,
    }),
    /// L1 instruction Cache 3 preload-operation control register
    /// offset: 0xcc
    L1_ICACHE3_PRELOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable preload operation on L1-ICache3. It will be cleared by hardware automatically after preload operation is done.
        L1_ICACHE3_PRELOAD_ENA: u1,
        /// The bit is used to indicate whether preload operation is finished or not. 0: not finished. 1: finished.
        L1_ICACHE3_PRELOAD_DONE: u1,
        /// The bit is used to configure the direction of preload operation. 0: ascending, 1: descending.
        L1_ICACHE3_PRELOAD_ORDER: u1,
        /// The bit is used to set the gid of l1 icache3 preload.
        L1_ICACHE3_PRELOAD_RGID: u4,
        padding: u25 = 0,
    }),
    /// L1 instruction Cache 3 preload address configure register
    /// offset: 0xd0
    L1_ICACHE3_PRELOAD_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of preload on L1-ICache3, which should be used together with L1_ICACHE3_PRELOAD_SIZE_REG
        L1_ICACHE3_PRELOAD_ADDR: u32,
    }),
    /// L1 instruction Cache 3 preload size configure register
    /// offset: 0xd4
    L1_ICACHE3_PRELOAD_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L1-ICache3, which should be used together with L1_ICACHE3_PRELOAD_ADDR_REG
        L1_ICACHE3_PRELOAD_SIZE: u14,
        padding: u18 = 0,
    }),
    /// L1 data Cache preload-operation control register
    /// offset: 0xd8
    L1_DCACHE_PRELOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable preload operation on L1-DCache. It will be cleared by hardware automatically after preload operation is done.
        L1_DCACHE_PRELOAD_ENA: u1,
        /// The bit is used to indicate whether preload operation is finished or not. 0: not finished. 1: finished.
        L1_DCACHE_PRELOAD_DONE: u1,
        /// The bit is used to configure the direction of preload operation. 0: ascending, 1: descending.
        L1_DCACHE_PRELOAD_ORDER: u1,
        /// The bit is used to set the gid of l1 dcache preload.
        L1_DCACHE_PRELOAD_RGID: u4,
        padding: u25 = 0,
    }),
    /// L1 data Cache preload address configure register
    /// offset: 0xdc
    L1_DCACHE_PRELOAD_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of preload on L1-DCache, which should be used together with L1_DCACHE_PRELOAD_SIZE_REG
        L1_DCACHE_PRELOAD_ADDR: u32,
    }),
    /// L1 data Cache preload size configure register
    /// offset: 0xe0
    L1_DCACHE_PRELOAD_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L1-DCache, which should be used together with L1_DCACHE_PRELOAD_ADDR_REG
        L1_DCACHE_PRELOAD_SIZE: u14,
        padding: u18 = 0,
    }),
    /// L1 instruction Cache 0 autoload-operation control register
    /// offset: 0xe4
    L1_ICACHE0_AUTOLOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable and disable autoload operation on L1-ICache0. 1: enable, 0: disable.
        L1_ICACHE0_AUTOLOAD_ENA: u1,
        /// The bit is used to indicate whether autoload operation on L1-ICache0 is finished or not. 0: not finished. 1: finished.
        L1_ICACHE0_AUTOLOAD_DONE: u1,
        /// The bit is used to configure the direction of autoload operation on L1-ICache0. 0: ascending. 1: descending.
        L1_ICACHE0_AUTOLOAD_ORDER: u1,
        /// The field is used to configure trigger mode of autoload operation on L1-ICache0. 0/3: miss-trigger, 1: hit-trigger, 2: miss-hit-trigger.
        L1_ICACHE0_AUTOLOAD_TRIGGER_MODE: u2,
        reserved8: u3 = 0,
        /// The bit is used to enable the first section for autoload operation on L1-ICache0.
        L1_ICACHE0_AUTOLOAD_SCT0_ENA: u1,
        /// The bit is used to enable the second section for autoload operation on L1-ICache0.
        L1_ICACHE0_AUTOLOAD_SCT1_ENA: u1,
        /// The bit is used to set the gid of l1 icache0 autoload.
        L1_ICACHE0_AUTOLOAD_RGID: u4,
        padding: u18 = 0,
    }),
    /// L1 instruction Cache 0 autoload section 0 address configure register
    /// offset: 0xe8
    L1_ICACHE0_AUTOLOAD_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section for autoload operation on L1-ICache0. Note that it should be used together with L1_ICACHE0_AUTOLOAD_SCT0_SIZE and L1_ICACHE_AUTOLOAD_SCT0_ENA.
        L1_ICACHE0_AUTOLOAD_SCT0_ADDR: u32,
    }),
    /// L1 instruction Cache 0 autoload section 0 size configure register
    /// offset: 0xec
    L1_ICACHE0_AUTOLOAD_SCT0_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section for autoload operation on L1-ICache0. Note that it should be used together with L1_ICACHE0_AUTOLOAD_SCT0_ADDR and L1_ICACHE_AUTOLOAD_SCT0_ENA.
        L1_ICACHE0_AUTOLOAD_SCT0_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 instruction Cache 0 autoload section 1 address configure register
    /// offset: 0xf0
    L1_ICACHE0_AUTOLOAD_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section for autoload operation on L1-ICache0. Note that it should be used together with L1_ICACHE0_AUTOLOAD_SCT1_SIZE and L1_ICACHE_AUTOLOAD_SCT1_ENA.
        L1_ICACHE0_AUTOLOAD_SCT1_ADDR: u32,
    }),
    /// L1 instruction Cache 0 autoload section 1 size configure register
    /// offset: 0xf4
    L1_ICACHE0_AUTOLOAD_SCT1_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the second section for autoload operation on L1-ICache0. Note that it should be used together with L1_ICACHE0_AUTOLOAD_SCT1_ADDR and L1_ICACHE_AUTOLOAD_SCT1_ENA.
        L1_ICACHE0_AUTOLOAD_SCT1_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 instruction Cache 1 autoload-operation control register
    /// offset: 0xf8
    L1_ICACHE1_AUTOLOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable and disable autoload operation on L1-ICache1. 1: enable, 0: disable.
        L1_ICACHE1_AUTOLOAD_ENA: u1,
        /// The bit is used to indicate whether autoload operation on L1-ICache1 is finished or not. 0: not finished. 1: finished.
        L1_ICACHE1_AUTOLOAD_DONE: u1,
        /// The bit is used to configure the direction of autoload operation on L1-ICache1. 0: ascending. 1: descending.
        L1_ICACHE1_AUTOLOAD_ORDER: u1,
        /// The field is used to configure trigger mode of autoload operation on L1-ICache1. 0/3: miss-trigger, 1: hit-trigger, 2: miss-hit-trigger.
        L1_ICACHE1_AUTOLOAD_TRIGGER_MODE: u2,
        reserved8: u3 = 0,
        /// The bit is used to enable the first section for autoload operation on L1-ICache1.
        L1_ICACHE1_AUTOLOAD_SCT0_ENA: u1,
        /// The bit is used to enable the second section for autoload operation on L1-ICache1.
        L1_ICACHE1_AUTOLOAD_SCT1_ENA: u1,
        /// The bit is used to set the gid of l1 icache1 autoload.
        L1_ICACHE1_AUTOLOAD_RGID: u4,
        padding: u18 = 0,
    }),
    /// L1 instruction Cache 1 autoload section 0 address configure register
    /// offset: 0xfc
    L1_ICACHE1_AUTOLOAD_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section for autoload operation on L1-ICache1. Note that it should be used together with L1_ICACHE1_AUTOLOAD_SCT0_SIZE and L1_ICACHE_AUTOLOAD_SCT0_ENA.
        L1_ICACHE1_AUTOLOAD_SCT0_ADDR: u32,
    }),
    /// L1 instruction Cache 1 autoload section 0 size configure register
    /// offset: 0x100
    L1_ICACHE1_AUTOLOAD_SCT0_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section for autoload operation on L1-ICache1. Note that it should be used together with L1_ICACHE1_AUTOLOAD_SCT0_ADDR and L1_ICACHE_AUTOLOAD_SCT0_ENA.
        L1_ICACHE1_AUTOLOAD_SCT0_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 instruction Cache 1 autoload section 1 address configure register
    /// offset: 0x104
    L1_ICACHE1_AUTOLOAD_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section for autoload operation on L1-ICache1. Note that it should be used together with L1_ICACHE1_AUTOLOAD_SCT1_SIZE and L1_ICACHE_AUTOLOAD_SCT1_ENA.
        L1_ICACHE1_AUTOLOAD_SCT1_ADDR: u32,
    }),
    /// L1 instruction Cache 1 autoload section 1 size configure register
    /// offset: 0x108
    L1_ICACHE1_AUTOLOAD_SCT1_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the second section for autoload operation on L1-ICache1. Note that it should be used together with L1_ICACHE1_AUTOLOAD_SCT1_ADDR and L1_ICACHE_AUTOLOAD_SCT1_ENA.
        L1_ICACHE1_AUTOLOAD_SCT1_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 instruction Cache 2 autoload-operation control register
    /// offset: 0x10c
    L1_ICACHE2_AUTOLOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable and disable autoload operation on L1-ICache2. 1: enable, 0: disable.
        L1_ICACHE2_AUTOLOAD_ENA: u1,
        /// The bit is used to indicate whether autoload operation on L1-ICache2 is finished or not. 0: not finished. 1: finished.
        L1_ICACHE2_AUTOLOAD_DONE: u1,
        /// The bit is used to configure the direction of autoload operation on L1-ICache2. 0: ascending. 1: descending.
        L1_ICACHE2_AUTOLOAD_ORDER: u1,
        /// The field is used to configure trigger mode of autoload operation on L1-ICache2. 0/3: miss-trigger, 1: hit-trigger, 2: miss-hit-trigger.
        L1_ICACHE2_AUTOLOAD_TRIGGER_MODE: u2,
        reserved8: u3 = 0,
        /// The bit is used to enable the first section for autoload operation on L1-ICache2.
        L1_ICACHE2_AUTOLOAD_SCT0_ENA: u1,
        /// The bit is used to enable the second section for autoload operation on L1-ICache2.
        L1_ICACHE2_AUTOLOAD_SCT1_ENA: u1,
        /// The bit is used to set the gid of l1 icache2 autoload.
        L1_ICACHE2_AUTOLOAD_RGID: u4,
        padding: u18 = 0,
    }),
    /// L1 instruction Cache 2 autoload section 0 address configure register
    /// offset: 0x110
    L1_ICACHE2_AUTOLOAD_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section for autoload operation on L1-ICache2. Note that it should be used together with L1_ICACHE2_AUTOLOAD_SCT0_SIZE and L1_ICACHE_AUTOLOAD_SCT0_ENA.
        L1_ICACHE2_AUTOLOAD_SCT0_ADDR: u32,
    }),
    /// L1 instruction Cache 2 autoload section 0 size configure register
    /// offset: 0x114
    L1_ICACHE2_AUTOLOAD_SCT0_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section for autoload operation on L1-ICache2. Note that it should be used together with L1_ICACHE2_AUTOLOAD_SCT0_ADDR and L1_ICACHE_AUTOLOAD_SCT0_ENA.
        L1_ICACHE2_AUTOLOAD_SCT0_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 instruction Cache 2 autoload section 1 address configure register
    /// offset: 0x118
    L1_ICACHE2_AUTOLOAD_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section for autoload operation on L1-ICache2. Note that it should be used together with L1_ICACHE2_AUTOLOAD_SCT1_SIZE and L1_ICACHE_AUTOLOAD_SCT1_ENA.
        L1_ICACHE2_AUTOLOAD_SCT1_ADDR: u32,
    }),
    /// L1 instruction Cache 2 autoload section 1 size configure register
    /// offset: 0x11c
    L1_ICACHE2_AUTOLOAD_SCT1_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the second section for autoload operation on L1-ICache2. Note that it should be used together with L1_ICACHE2_AUTOLOAD_SCT1_ADDR and L1_ICACHE_AUTOLOAD_SCT1_ENA.
        L1_ICACHE2_AUTOLOAD_SCT1_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 instruction Cache 3 autoload-operation control register
    /// offset: 0x120
    L1_ICACHE3_AUTOLOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable and disable autoload operation on L1-ICache3. 1: enable, 0: disable.
        L1_ICACHE3_AUTOLOAD_ENA: u1,
        /// The bit is used to indicate whether autoload operation on L1-ICache3 is finished or not. 0: not finished. 1: finished.
        L1_ICACHE3_AUTOLOAD_DONE: u1,
        /// The bit is used to configure the direction of autoload operation on L1-ICache3. 0: ascending. 1: descending.
        L1_ICACHE3_AUTOLOAD_ORDER: u1,
        /// The field is used to configure trigger mode of autoload operation on L1-ICache3. 0/3: miss-trigger, 1: hit-trigger, 2: miss-hit-trigger.
        L1_ICACHE3_AUTOLOAD_TRIGGER_MODE: u2,
        reserved8: u3 = 0,
        /// The bit is used to enable the first section for autoload operation on L1-ICache3.
        L1_ICACHE3_AUTOLOAD_SCT0_ENA: u1,
        /// The bit is used to enable the second section for autoload operation on L1-ICache3.
        L1_ICACHE3_AUTOLOAD_SCT1_ENA: u1,
        /// The bit is used to set the gid of l1 icache3 autoload.
        L1_ICACHE3_AUTOLOAD_RGID: u4,
        padding: u18 = 0,
    }),
    /// L1 instruction Cache 3 autoload section 0 address configure register
    /// offset: 0x124
    L1_ICACHE3_AUTOLOAD_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section for autoload operation on L1-ICache3. Note that it should be used together with L1_ICACHE3_AUTOLOAD_SCT0_SIZE and L1_ICACHE_AUTOLOAD_SCT0_ENA.
        L1_ICACHE3_AUTOLOAD_SCT0_ADDR: u32,
    }),
    /// L1 instruction Cache 3 autoload section 0 size configure register
    /// offset: 0x128
    L1_ICACHE3_AUTOLOAD_SCT0_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section for autoload operation on L1-ICache3. Note that it should be used together with L1_ICACHE3_AUTOLOAD_SCT0_ADDR and L1_ICACHE_AUTOLOAD_SCT0_ENA.
        L1_ICACHE3_AUTOLOAD_SCT0_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 instruction Cache 3 autoload section 1 address configure register
    /// offset: 0x12c
    L1_ICACHE3_AUTOLOAD_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section for autoload operation on L1-ICache3. Note that it should be used together with L1_ICACHE3_AUTOLOAD_SCT1_SIZE and L1_ICACHE_AUTOLOAD_SCT1_ENA.
        L1_ICACHE3_AUTOLOAD_SCT1_ADDR: u32,
    }),
    /// L1 instruction Cache 3 autoload section 1 size configure register
    /// offset: 0x130
    L1_ICACHE3_AUTOLOAD_SCT1_SIZE: mmio.Mmio(packed struct(u32) {
        /// Reserved
        L1_ICACHE3_AUTOLOAD_SCT1_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 data Cache autoload-operation control register
    /// offset: 0x134
    L1_DCACHE_AUTOLOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable and disable autoload operation on L1-DCache. 1: enable, 0: disable.
        L1_DCACHE_AUTOLOAD_ENA: u1,
        /// The bit is used to indicate whether autoload operation on L1-DCache is finished or not. 0: not finished. 1: finished.
        L1_DCACHE_AUTOLOAD_DONE: u1,
        /// The bit is used to configure the direction of autoload operation on L1-DCache. 0: ascending. 1: descending.
        L1_DCACHE_AUTOLOAD_ORDER: u1,
        /// The field is used to configure trigger mode of autoload operation on L1-DCache. 0/3: miss-trigger, 1: hit-trigger, 2: miss-hit-trigger.
        L1_DCACHE_AUTOLOAD_TRIGGER_MODE: u2,
        reserved8: u3 = 0,
        /// The bit is used to enable the first section for autoload operation on L1-DCache.
        L1_DCACHE_AUTOLOAD_SCT0_ENA: u1,
        /// The bit is used to enable the second section for autoload operation on L1-DCache.
        L1_DCACHE_AUTOLOAD_SCT1_ENA: u1,
        /// The bit is used to enable the third section for autoload operation on L1-DCache.
        L1_DCACHE_AUTOLOAD_SCT2_ENA: u1,
        /// The bit is used to enable the fourth section for autoload operation on L1-DCache.
        L1_DCACHE_AUTOLOAD_SCT3_ENA: u1,
        /// The bit is used to set the gid of l1 dcache autoload.
        L1_DCACHE_AUTOLOAD_RGID: u4,
        padding: u16 = 0,
    }),
    /// L1 data Cache autoload section 0 address configure register
    /// offset: 0x138
    L1_DCACHE_AUTOLOAD_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section for autoload operation on L1-DCache. Note that it should be used together with L1_DCACHE_AUTOLOAD_SCT0_SIZE and L1_DCACHE_AUTOLOAD_SCT0_ENA.
        L1_DCACHE_AUTOLOAD_SCT0_ADDR: u32,
    }),
    /// L1 data Cache autoload section 0 size configure register
    /// offset: 0x13c
    L1_DCACHE_AUTOLOAD_SCT0_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section for autoload operation on L1-DCache. Note that it should be used together with L1_DCACHE_AUTOLOAD_SCT0_ADDR and L1_DCACHE_AUTOLOAD_SCT0_ENA.
        L1_DCACHE_AUTOLOAD_SCT0_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 data Cache autoload section 1 address configure register
    /// offset: 0x140
    L1_DCACHE_AUTOLOAD_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section for autoload operation on L1-DCache. Note that it should be used together with L1_DCACHE_AUTOLOAD_SCT1_SIZE and L1_DCACHE_AUTOLOAD_SCT1_ENA.
        L1_DCACHE_AUTOLOAD_SCT1_ADDR: u32,
    }),
    /// L1 data Cache autoload section 1 size configure register
    /// offset: 0x144
    L1_DCACHE_AUTOLOAD_SCT1_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the second section for autoload operation on L1-DCache. Note that it should be used together with L1_DCACHE_AUTOLOAD_SCT1_ADDR and L1_DCACHE_AUTOLOAD_SCT1_ENA.
        L1_DCACHE_AUTOLOAD_SCT1_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 data Cache autoload section 2 address configure register
    /// offset: 0x148
    L1_DCACHE_AUTOLOAD_SCT2_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the third section for autoload operation on L1-DCache. Note that it should be used together with L1_DCACHE_AUTOLOAD_SCT2_SIZE and L1_DCACHE_AUTOLOAD_SCT2_ENA.
        L1_DCACHE_AUTOLOAD_SCT2_ADDR: u32,
    }),
    /// L1 data Cache autoload section 2 size configure register
    /// offset: 0x14c
    L1_DCACHE_AUTOLOAD_SCT2_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the third section for autoload operation on L1-DCache. Note that it should be used together with L1_DCACHE_AUTOLOAD_SCT2_ADDR and L1_DCACHE_AUTOLOAD_SCT2_ENA.
        L1_DCACHE_AUTOLOAD_SCT2_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L1 data Cache autoload section 1 address configure register
    /// offset: 0x150
    L1_DCACHE_AUTOLOAD_SCT3_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the fourth section for autoload operation on L1-DCache. Note that it should be used together with L1_DCACHE_AUTOLOAD_SCT3_SIZE and L1_DCACHE_AUTOLOAD_SCT3_ENA.
        L1_DCACHE_AUTOLOAD_SCT3_ADDR: u32,
    }),
    /// L1 data Cache autoload section 1 size configure register
    /// offset: 0x154
    L1_DCACHE_AUTOLOAD_SCT3_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the fourth section for autoload operation on L1-DCache. Note that it should be used together with L1_DCACHE_AUTOLOAD_SCT3_ADDR and L1_DCACHE_AUTOLOAD_SCT3_ENA.
        L1_DCACHE_AUTOLOAD_SCT3_SIZE: u28,
        padding: u4 = 0,
    }),
    /// Cache Access Counter Interrupt enable register
    /// offset: 0x158
    L1_CACHE_ACS_CNT_INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable interrupt of one of counters overflow that occurs in L1-ICache0 due to bus0 accesses L1-ICache0.
        L1_IBUS0_OVF_INT_ENA: u1,
        /// The bit is used to enable interrupt of one of counters overflow that occurs in L1-ICache1 due to bus1 accesses L1-ICache1.
        L1_IBUS1_OVF_INT_ENA: u1,
        /// Reserved
        L1_IBUS2_OVF_INT_ENA: u1,
        /// Reserved
        L1_IBUS3_OVF_INT_ENA: u1,
        /// The bit is used to enable interrupt of one of counters overflow that occurs in L1-DCache due to bus0 accesses L1-DCache.
        L1_DBUS0_OVF_INT_ENA: u1,
        /// The bit is used to enable interrupt of one of counters overflow that occurs in L1-DCache due to bus1 accesses L1-DCache.
        L1_DBUS1_OVF_INT_ENA: u1,
        /// Reserved
        L1_DBUS2_OVF_INT_ENA: u1,
        /// Reserved
        L1_DBUS3_OVF_INT_ENA: u1,
        padding: u24 = 0,
    }),
    /// Cache Access Counter Interrupt clear register
    /// offset: 0x15c
    L1_CACHE_ACS_CNT_INT_CLR: mmio.Mmio(packed struct(u32) {
        /// The bit is used to clear counters overflow interrupt and counters in L1-ICache0 due to bus0 accesses L1-ICache0.
        L1_IBUS0_OVF_INT_CLR: u1,
        /// The bit is used to clear counters overflow interrupt and counters in L1-ICache1 due to bus1 accesses L1-ICache1.
        L1_IBUS1_OVF_INT_CLR: u1,
        /// Reserved
        L1_IBUS2_OVF_INT_CLR: u1,
        /// Reserved
        L1_IBUS3_OVF_INT_CLR: u1,
        /// The bit is used to clear counters overflow interrupt and counters in L1-DCache due to bus0 accesses L1-DCache.
        L1_DBUS0_OVF_INT_CLR: u1,
        /// The bit is used to clear counters overflow interrupt and counters in L1-DCache due to bus1 accesses L1-DCache.
        L1_DBUS1_OVF_INT_CLR: u1,
        /// Reserved
        L1_DBUS2_OVF_INT_CLR: u1,
        /// Reserved
        L1_DBUS3_OVF_INT_CLR: u1,
        padding: u24 = 0,
    }),
    /// Cache Access Counter Interrupt raw register
    /// offset: 0x160
    L1_CACHE_ACS_CNT_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw bit of the interrupt of one of counters overflow that occurs in L1-ICache0 due to bus0 accesses L1-ICache0.
        L1_IBUS0_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L1-ICache1 due to bus1 accesses L1-ICache1.
        L1_IBUS1_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L1-ICache2 due to bus2 accesses L1-ICache2.
        L1_IBUS2_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L1-ICache3 due to bus3 accesses L1-ICache3.
        L1_IBUS3_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L1-DCache due to bus0 accesses L1-DCache.
        L1_DBUS0_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L1-DCache due to bus1 accesses L1-DCache.
        L1_DBUS1_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L1-DCache due to bus2 accesses L1-DCache.
        L1_DBUS2_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L1-DCache due to bus3 accesses L1-DCache.
        L1_DBUS3_OVF_INT_RAW: u1,
        padding: u24 = 0,
    }),
    /// Cache Access Counter Interrupt status register
    /// offset: 0x164
    L1_CACHE_ACS_CNT_INT_ST: mmio.Mmio(packed struct(u32) {
        /// The bit indicates the interrupt status of one of counters overflow that occurs in L1-ICache0 due to bus0 accesses L1-ICache0.
        L1_IBUS0_OVF_INT_ST: u1,
        /// The bit indicates the interrupt status of one of counters overflow that occurs in L1-ICache1 due to bus1 accesses L1-ICache1.
        L1_IBUS1_OVF_INT_ST: u1,
        /// Reserved
        L1_IBUS2_OVF_INT_ST: u1,
        /// Reserved
        L1_IBUS3_OVF_INT_ST: u1,
        /// The bit indicates the interrupt status of one of counters overflow that occurs in L1-DCache due to bus0 accesses L1-DCache.
        L1_DBUS0_OVF_INT_ST: u1,
        /// The bit indicates the interrupt status of one of counters overflow that occurs in L1-DCache due to bus1 accesses L1-DCache.
        L1_DBUS1_OVF_INT_ST: u1,
        /// Reserved
        L1_DBUS2_OVF_INT_ST: u1,
        /// Reserved
        L1_DBUS3_OVF_INT_ST: u1,
        padding: u24 = 0,
    }),
    /// Cache Access Fail Configuration register
    /// offset: 0x168
    L1_CACHE_ACS_FAIL_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to configure l1 icache0 access fail check mode. 0: the access fail is not propagated to the request, 1: the access fail is propagated to the request
        L1_ICACHE0_ACS_FAIL_CHECK_MODE: u1,
        /// The bit is used to configure l1 icache1 access fail check mode. 0: the access fail is not propagated to the request, 1: the access fail is propagated to the request
        L1_ICACHE1_ACS_FAIL_CHECK_MODE: u1,
        /// The bit is used to configure l1 icache2 access fail check mode. 0: the access fail is not propagated to the request, 1: the access fail is propagated to the request
        L1_ICACHE2_ACS_FAIL_CHECK_MODE: u1,
        /// The bit is used to configure l1 icache3 access fail check mode. 0: the access fail is not propagated to the request, 1: the access fail is propagated to the request
        L1_ICACHE3_ACS_FAIL_CHECK_MODE: u1,
        /// The bit is used to configure l1 dcache access fail check mode. 0: the access fail is not propagated to the request, 1: the access fail is propagated to the request
        L1_DCACHE_ACS_FAIL_CHECK_MODE: u1,
        padding: u27 = 0,
    }),
    /// Cache Access Fail Interrupt enable register
    /// offset: 0x16c
    L1_CACHE_ACS_FAIL_INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable interrupt of access fail that occurs in L1-ICache0 due to cpu accesses L1-ICache0.
        L1_ICACHE0_FAIL_INT_ENA: u1,
        /// The bit is used to enable interrupt of access fail that occurs in L1-ICache1 due to cpu accesses L1-ICache1.
        L1_ICACHE1_FAIL_INT_ENA: u1,
        /// Reserved
        L1_ICACHE2_FAIL_INT_ENA: u1,
        /// Reserved
        L1_ICACHE3_FAIL_INT_ENA: u1,
        /// The bit is used to enable interrupt of access fail that occurs in L1-DCache due to cpu accesses L1-DCache.
        L1_DCACHE_FAIL_INT_ENA: u1,
        padding: u27 = 0,
    }),
    /// L1-Cache Access Fail Interrupt clear register
    /// offset: 0x170
    L1_CACHE_ACS_FAIL_INT_CLR: mmio.Mmio(packed struct(u32) {
        /// The bit is used to clear interrupt of access fail that occurs in L1-ICache0 due to cpu accesses L1-ICache0.
        L1_ICACHE0_FAIL_INT_CLR: u1,
        /// The bit is used to clear interrupt of access fail that occurs in L1-ICache1 due to cpu accesses L1-ICache1.
        L1_ICACHE1_FAIL_INT_CLR: u1,
        /// Reserved
        L1_ICACHE2_FAIL_INT_CLR: u1,
        /// Reserved
        L1_ICACHE3_FAIL_INT_CLR: u1,
        /// The bit is used to clear interrupt of access fail that occurs in L1-DCache due to cpu accesses L1-DCache.
        L1_DCACHE_FAIL_INT_CLR: u1,
        padding: u27 = 0,
    }),
    /// Cache Access Fail Interrupt raw register
    /// offset: 0x174
    L1_CACHE_ACS_FAIL_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw bit of the interrupt of access fail that occurs in L1-ICache0.
        L1_ICACHE0_FAIL_INT_RAW: u1,
        /// The raw bit of the interrupt of access fail that occurs in L1-ICache1.
        L1_ICACHE1_FAIL_INT_RAW: u1,
        /// The raw bit of the interrupt of access fail that occurs in L1-ICache2.
        L1_ICACHE2_FAIL_INT_RAW: u1,
        /// The raw bit of the interrupt of access fail that occurs in L1-ICache3.
        L1_ICACHE3_FAIL_INT_RAW: u1,
        /// The raw bit of the interrupt of access fail that occurs in L1-DCache.
        L1_DCACHE_FAIL_INT_RAW: u1,
        padding: u27 = 0,
    }),
    /// Cache Access Fail Interrupt status register
    /// offset: 0x178
    L1_CACHE_ACS_FAIL_INT_ST: mmio.Mmio(packed struct(u32) {
        /// The bit indicates the interrupt status of access fail that occurs in L1-ICache0 due to cpu accesses L1-ICache.
        L1_ICACHE0_FAIL_INT_ST: u1,
        /// The bit indicates the interrupt status of access fail that occurs in L1-ICache1 due to cpu accesses L1-ICache.
        L1_ICACHE1_FAIL_INT_ST: u1,
        /// Reserved
        L1_ICACHE2_FAIL_INT_ST: u1,
        /// Reserved
        L1_ICACHE3_FAIL_INT_ST: u1,
        /// The bit indicates the interrupt status of access fail that occurs in L1-DCache due to cpu accesses L1-DCache.
        L1_DCACHE_FAIL_INT_ST: u1,
        padding: u27 = 0,
    }),
    /// Cache Access Counter enable and clear register
    /// offset: 0x17c
    L1_CACHE_ACS_CNT_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable ibus0 counter in L1-ICache0.
        L1_IBUS0_CNT_ENA: u1,
        /// The bit is used to enable ibus1 counter in L1-ICache1.
        L1_IBUS1_CNT_ENA: u1,
        /// Reserved
        L1_IBUS2_CNT_ENA: u1,
        /// Reserved
        L1_IBUS3_CNT_ENA: u1,
        /// The bit is used to enable dbus0 counter in L1-DCache.
        L1_DBUS0_CNT_ENA: u1,
        /// The bit is used to enable dbus1 counter in L1-DCache.
        L1_DBUS1_CNT_ENA: u1,
        /// Reserved
        L1_DBUS2_CNT_ENA: u1,
        /// Reserved
        L1_DBUS3_CNT_ENA: u1,
        reserved16: u8 = 0,
        /// The bit is used to clear ibus0 counter in L1-ICache0.
        L1_IBUS0_CNT_CLR: u1,
        /// The bit is used to clear ibus1 counter in L1-ICache1.
        L1_IBUS1_CNT_CLR: u1,
        /// Reserved
        L1_IBUS2_CNT_CLR: u1,
        /// Reserved
        L1_IBUS3_CNT_CLR: u1,
        /// The bit is used to clear dbus0 counter in L1-DCache.
        L1_DBUS0_CNT_CLR: u1,
        /// The bit is used to clear dbus1 counter in L1-DCache.
        L1_DBUS1_CNT_CLR: u1,
        /// Reserved
        L1_DBUS2_CNT_CLR: u1,
        /// Reserved
        L1_DBUS3_CNT_CLR: u1,
        padding: u8 = 0,
    }),
    /// L1-ICache bus0 Hit-Access Counter register
    /// offset: 0x180
    L1_IBUS0_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when bus0 accesses L1-ICache0.
        L1_IBUS0_HIT_CNT: u32,
    }),
    /// L1-ICache bus0 Miss-Access Counter register
    /// offset: 0x184
    L1_IBUS0_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when bus0 accesses L1-ICache0.
        L1_IBUS0_MISS_CNT: u32,
    }),
    /// L1-ICache bus0 Conflict-Access Counter register
    /// offset: 0x188
    L1_IBUS0_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when bus0 accesses L1-ICache0.
        L1_IBUS0_CONFLICT_CNT: u32,
    }),
    /// L1-ICache bus0 Next-Level-Access Counter register
    /// offset: 0x18c
    L1_IBUS0_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L1-ICache accesses L2-Cache due to bus0 accessing L1-ICache0.
        L1_IBUS0_NXTLVL_RD_CNT: u32,
    }),
    /// L1-ICache bus1 Hit-Access Counter register
    /// offset: 0x190
    L1_IBUS1_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when bus1 accesses L1-ICache1.
        L1_IBUS1_HIT_CNT: u32,
    }),
    /// L1-ICache bus1 Miss-Access Counter register
    /// offset: 0x194
    L1_IBUS1_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when bus1 accesses L1-ICache1.
        L1_IBUS1_MISS_CNT: u32,
    }),
    /// L1-ICache bus1 Conflict-Access Counter register
    /// offset: 0x198
    L1_IBUS1_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when bus1 accesses L1-ICache1.
        L1_IBUS1_CONFLICT_CNT: u32,
    }),
    /// L1-ICache bus1 Next-Level-Access Counter register
    /// offset: 0x19c
    L1_IBUS1_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L1-ICache accesses L2-Cache due to bus1 accessing L1-ICache1.
        L1_IBUS1_NXTLVL_RD_CNT: u32,
    }),
    /// L1-ICache bus2 Hit-Access Counter register
    /// offset: 0x1a0
    L1_IBUS2_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when bus2 accesses L1-ICache2.
        L1_IBUS2_HIT_CNT: u32,
    }),
    /// L1-ICache bus2 Miss-Access Counter register
    /// offset: 0x1a4
    L1_IBUS2_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when bus2 accesses L1-ICache2.
        L1_IBUS2_MISS_CNT: u32,
    }),
    /// L1-ICache bus2 Conflict-Access Counter register
    /// offset: 0x1a8
    L1_IBUS2_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when bus2 accesses L1-ICache2.
        L1_IBUS2_CONFLICT_CNT: u32,
    }),
    /// L1-ICache bus2 Next-Level-Access Counter register
    /// offset: 0x1ac
    L1_IBUS2_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L1-ICache accesses L2-Cache due to bus2 accessing L1-ICache2.
        L1_IBUS2_NXTLVL_RD_CNT: u32,
    }),
    /// L1-ICache bus3 Hit-Access Counter register
    /// offset: 0x1b0
    L1_IBUS3_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when bus3 accesses L1-ICache3.
        L1_IBUS3_HIT_CNT: u32,
    }),
    /// L1-ICache bus3 Miss-Access Counter register
    /// offset: 0x1b4
    L1_IBUS3_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when bus3 accesses L1-ICache3.
        L1_IBUS3_MISS_CNT: u32,
    }),
    /// L1-ICache bus3 Conflict-Access Counter register
    /// offset: 0x1b8
    L1_IBUS3_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when bus3 accesses L1-ICache3.
        L1_IBUS3_CONFLICT_CNT: u32,
    }),
    /// L1-ICache bus3 Next-Level-Access Counter register
    /// offset: 0x1bc
    L1_IBUS3_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L1-ICache accesses L2-Cache due to bus3 accessing L1-ICache3.
        L1_IBUS3_NXTLVL_RD_CNT: u32,
    }),
    /// L1-DCache bus0 Hit-Access Counter register
    /// offset: 0x1c0
    L1_DBUS0_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when bus0 accesses L1-DCache.
        L1_DBUS0_HIT_CNT: u32,
    }),
    /// L1-DCache bus0 Miss-Access Counter register
    /// offset: 0x1c4
    L1_DBUS0_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when bus0 accesses L1-DCache.
        L1_DBUS0_MISS_CNT: u32,
    }),
    /// L1-DCache bus0 Conflict-Access Counter register
    /// offset: 0x1c8
    L1_DBUS0_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when bus0 accesses L1-DCache.
        L1_DBUS0_CONFLICT_CNT: u32,
    }),
    /// L1-DCache bus0 Next-Level-Access Counter register
    /// offset: 0x1cc
    L1_DBUS0_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L1-DCache accesses L2-Cache due to bus0 accessing L1-DCache.
        L1_DBUS0_NXTLVL_RD_CNT: u32,
    }),
    /// L1-DCache bus0 WB-Access Counter register
    /// offset: 0x1d0
    L1_DBUS0_ACS_NXTLVL_WR_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of write back when bus0 accesses L1-DCache.
        L1_DBUS0_NXTLVL_WR_CNT: u32,
    }),
    /// L1-DCache bus1 Hit-Access Counter register
    /// offset: 0x1d4
    L1_DBUS1_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when bus1 accesses L1-DCache.
        L1_DBUS1_HIT_CNT: u32,
    }),
    /// L1-DCache bus1 Miss-Access Counter register
    /// offset: 0x1d8
    L1_DBUS1_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when bus1 accesses L1-DCache.
        L1_DBUS1_MISS_CNT: u32,
    }),
    /// L1-DCache bus1 Conflict-Access Counter register
    /// offset: 0x1dc
    L1_DBUS1_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when bus1 accesses L1-DCache.
        L1_DBUS1_CONFLICT_CNT: u32,
    }),
    /// L1-DCache bus1 Next-Level-Access Counter register
    /// offset: 0x1e0
    L1_DBUS1_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L1-DCache accesses L2-Cache due to bus1 accessing L1-DCache.
        L1_DBUS1_NXTLVL_RD_CNT: u32,
    }),
    /// L1-DCache bus1 WB-Access Counter register
    /// offset: 0x1e4
    L1_DBUS1_ACS_NXTLVL_WR_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of write back when bus1 accesses L1-DCache.
        L1_DBUS1_NXTLVL_WR_CNT: u32,
    }),
    /// L1-DCache bus2 Hit-Access Counter register
    /// offset: 0x1e8
    L1_DBUS2_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when bus2 accesses L1-DCache.
        L1_DBUS2_HIT_CNT: u32,
    }),
    /// L1-DCache bus2 Miss-Access Counter register
    /// offset: 0x1ec
    L1_DBUS2_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when bus2 accesses L1-DCache.
        L1_DBUS2_MISS_CNT: u32,
    }),
    /// L1-DCache bus2 Conflict-Access Counter register
    /// offset: 0x1f0
    L1_DBUS2_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when bus2 accesses L1-DCache.
        L1_DBUS2_CONFLICT_CNT: u32,
    }),
    /// L1-DCache bus2 Next-Level-Access Counter register
    /// offset: 0x1f4
    L1_DBUS2_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L1-DCache accesses L2-Cache due to bus2 accessing L1-DCache.
        L1_DBUS2_NXTLVL_RD_CNT: u32,
    }),
    /// L1-DCache bus2 WB-Access Counter register
    /// offset: 0x1f8
    L1_DBUS2_ACS_NXTLVL_WR_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of write back when bus2 accesses L1-DCache.
        L1_DBUS2_NXTLVL_WR_CNT: u32,
    }),
    /// L1-DCache bus3 Hit-Access Counter register
    /// offset: 0x1fc
    L1_DBUS3_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when bus3 accesses L1-DCache.
        L1_DBUS3_HIT_CNT: u32,
    }),
    /// L1-DCache bus3 Miss-Access Counter register
    /// offset: 0x200
    L1_DBUS3_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when bus3 accesses L1-DCache.
        L1_DBUS3_MISS_CNT: u32,
    }),
    /// L1-DCache bus3 Conflict-Access Counter register
    /// offset: 0x204
    L1_DBUS3_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when bus3 accesses L1-DCache.
        L1_DBUS3_CONFLICT_CNT: u32,
    }),
    /// L1-DCache bus3 Next-Level-Access Counter register
    /// offset: 0x208
    L1_DBUS3_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L1-DCache accesses L2-Cache due to bus3 accessing L1-DCache.
        L1_DBUS3_NXTLVL_RD_CNT: u32,
    }),
    /// L1-DCache bus3 WB-Access Counter register
    /// offset: 0x20c
    L1_DBUS3_ACS_NXTLVL_WR_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of write back when bus0 accesses L1-DCache.
        L1_DBUS3_NXTLVL_WR_CNT: u32,
    }),
    /// L1-ICache0 Access Fail ID/attribution information register
    /// offset: 0x210
    L1_ICACHE0_ACS_FAIL_ID_ATTR: mmio.Mmio(packed struct(u32) {
        /// The register records the ID of fail-access when cache0 accesses L1-ICache.
        L1_ICACHE0_FAIL_ID: u16,
        /// The register records the attribution of fail-access when cache0 accesses L1-ICache.
        L1_ICACHE0_FAIL_ATTR: u16,
    }),
    /// L1-ICache0 Access Fail Address information register
    /// offset: 0x214
    L1_ICACHE0_ACS_FAIL_ADDR: mmio.Mmio(packed struct(u32) {
        /// The register records the address of fail-access when cache0 accesses L1-ICache.
        L1_ICACHE0_FAIL_ADDR: u32,
    }),
    /// L1-ICache0 Access Fail ID/attribution information register
    /// offset: 0x218
    L1_ICACHE1_ACS_FAIL_ID_ATTR: mmio.Mmio(packed struct(u32) {
        /// The register records the ID of fail-access when cache1 accesses L1-ICache.
        L1_ICACHE1_FAIL_ID: u16,
        /// The register records the attribution of fail-access when cache1 accesses L1-ICache.
        L1_ICACHE1_FAIL_ATTR: u16,
    }),
    /// L1-ICache0 Access Fail Address information register
    /// offset: 0x21c
    L1_ICACHE1_ACS_FAIL_ADDR: mmio.Mmio(packed struct(u32) {
        /// The register records the address of fail-access when cache1 accesses L1-ICache.
        L1_ICACHE1_FAIL_ADDR: u32,
    }),
    /// L1-ICache0 Access Fail ID/attribution information register
    /// offset: 0x220
    L1_ICACHE2_ACS_FAIL_ID_ATTR: mmio.Mmio(packed struct(u32) {
        /// The register records the ID of fail-access when cache2 accesses L1-ICache.
        L1_ICACHE2_FAIL_ID: u16,
        /// The register records the attribution of fail-access when cache2 accesses L1-ICache.
        L1_ICACHE2_FAIL_ATTR: u16,
    }),
    /// L1-ICache0 Access Fail Address information register
    /// offset: 0x224
    L1_ICACHE2_ACS_FAIL_ADDR: mmio.Mmio(packed struct(u32) {
        /// The register records the address of fail-access when cache2 accesses L1-ICache.
        L1_ICACHE2_FAIL_ADDR: u32,
    }),
    /// L1-ICache0 Access Fail ID/attribution information register
    /// offset: 0x228
    L1_ICACHE3_ACS_FAIL_ID_ATTR: mmio.Mmio(packed struct(u32) {
        /// The register records the ID of fail-access when cache3 accesses L1-ICache.
        L1_ICACHE3_FAIL_ID: u16,
        /// The register records the attribution of fail-access when cache3 accesses L1-ICache.
        L1_ICACHE3_FAIL_ATTR: u16,
    }),
    /// L1-ICache0 Access Fail Address information register
    /// offset: 0x22c
    L1_ICACHE3_ACS_FAIL_ADDR: mmio.Mmio(packed struct(u32) {
        /// The register records the address of fail-access when cache3 accesses L1-ICache.
        L1_ICACHE3_FAIL_ADDR: u32,
    }),
    /// L1-DCache Access Fail ID/attribution information register
    /// offset: 0x230
    L1_DCACHE_ACS_FAIL_ID_ATTR: mmio.Mmio(packed struct(u32) {
        /// The register records the ID of fail-access when cache accesses L1-DCache.
        L1_DCACHE_FAIL_ID: u16,
        /// The register records the attribution of fail-access when cache accesses L1-DCache.
        L1_DCACHE_FAIL_ATTR: u16,
    }),
    /// L1-DCache Access Fail Address information register
    /// offset: 0x234
    L1_DCACHE_ACS_FAIL_ADDR: mmio.Mmio(packed struct(u32) {
        /// The register records the address of fail-access when cache accesses L1-DCache.
        L1_DCACHE_FAIL_ADDR: u32,
    }),
    /// L1-Cache Access Fail Interrupt enable register
    /// offset: 0x238
    SYNC_L1_CACHE_PRELOAD_INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable interrupt of L1-ICache0 preload-operation. If preload operation is done, interrupt occurs.
        L1_ICACHE0_PLD_DONE_INT_ENA: u1,
        /// The bit is used to enable interrupt of L1-ICache1 preload-operation. If preload operation is done, interrupt occurs.
        L1_ICACHE1_PLD_DONE_INT_ENA: u1,
        /// Reserved
        L1_ICACHE2_PLD_DONE_INT_ENA: u1,
        /// Reserved
        L1_ICACHE3_PLD_DONE_INT_ENA: u1,
        /// The bit is used to enable interrupt of L1-DCache preload-operation. If preload operation is done, interrupt occurs.
        L1_DCACHE_PLD_DONE_INT_ENA: u1,
        reserved6: u1 = 0,
        /// The bit is used to enable interrupt of Cache sync-operation done.
        SYNC_DONE_INT_ENA: u1,
        /// The bit is used to enable interrupt of L1-ICache0 preload-operation error.
        L1_ICACHE0_PLD_ERR_INT_ENA: u1,
        /// The bit is used to enable interrupt of L1-ICache1 preload-operation error.
        L1_ICACHE1_PLD_ERR_INT_ENA: u1,
        /// Reserved
        L1_ICACHE2_PLD_ERR_INT_ENA: u1,
        /// Reserved
        L1_ICACHE3_PLD_ERR_INT_ENA: u1,
        /// The bit is used to enable interrupt of L1-DCache preload-operation error.
        L1_DCACHE_PLD_ERR_INT_ENA: u1,
        reserved13: u1 = 0,
        /// The bit is used to enable interrupt of Cache sync-operation error.
        SYNC_ERR_INT_ENA: u1,
        padding: u18 = 0,
    }),
    /// Sync Preload operation Interrupt clear register
    /// offset: 0x23c
    SYNC_L1_CACHE_PRELOAD_INT_CLR: mmio.Mmio(packed struct(u32) {
        /// The bit is used to clear interrupt that occurs only when L1-ICache0 preload-operation is done.
        L1_ICACHE0_PLD_DONE_INT_CLR: u1,
        /// The bit is used to clear interrupt that occurs only when L1-ICache1 preload-operation is done.
        L1_ICACHE1_PLD_DONE_INT_CLR: u1,
        /// Reserved
        L1_ICACHE2_PLD_DONE_INT_CLR: u1,
        /// Reserved
        L1_ICACHE3_PLD_DONE_INT_CLR: u1,
        /// The bit is used to clear interrupt that occurs only when L1-DCache preload-operation is done.
        L1_DCACHE_PLD_DONE_INT_CLR: u1,
        reserved6: u1 = 0,
        /// The bit is used to clear interrupt that occurs only when Cache sync-operation is done.
        SYNC_DONE_INT_CLR: u1,
        /// The bit is used to clear interrupt of L1-ICache0 preload-operation error.
        L1_ICACHE0_PLD_ERR_INT_CLR: u1,
        /// The bit is used to clear interrupt of L1-ICache1 preload-operation error.
        L1_ICACHE1_PLD_ERR_INT_CLR: u1,
        /// Reserved
        L1_ICACHE2_PLD_ERR_INT_CLR: u1,
        /// Reserved
        L1_ICACHE3_PLD_ERR_INT_CLR: u1,
        /// The bit is used to clear interrupt of L1-DCache preload-operation error.
        L1_DCACHE_PLD_ERR_INT_CLR: u1,
        reserved13: u1 = 0,
        /// The bit is used to clear interrupt of Cache sync-operation error.
        SYNC_ERR_INT_CLR: u1,
        padding: u18 = 0,
    }),
    /// Sync Preload operation Interrupt raw register
    /// offset: 0x240
    SYNC_L1_CACHE_PRELOAD_INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw bit of the interrupt that occurs only when L1-ICache0 preload-operation is done.
        L1_ICACHE0_PLD_DONE_INT_RAW: u1,
        /// The raw bit of the interrupt that occurs only when L1-ICache1 preload-operation is done.
        L1_ICACHE1_PLD_DONE_INT_RAW: u1,
        /// Reserved
        L1_ICACHE2_PLD_DONE_INT_RAW: u1,
        /// Reserved
        L1_ICACHE3_PLD_DONE_INT_RAW: u1,
        /// The raw bit of the interrupt that occurs only when L1-DCache preload-operation is done.
        L1_DCACHE_PLD_DONE_INT_RAW: u1,
        reserved6: u1 = 0,
        /// The raw bit of the interrupt that occurs only when Cache sync-operation is done.
        SYNC_DONE_INT_RAW: u1,
        /// The raw bit of the interrupt that occurs only when L1-ICache0 preload-operation error occurs.
        L1_ICACHE0_PLD_ERR_INT_RAW: u1,
        /// The raw bit of the interrupt that occurs only when L1-ICache1 preload-operation error occurs.
        L1_ICACHE1_PLD_ERR_INT_RAW: u1,
        /// Reserved
        L1_ICACHE2_PLD_ERR_INT_RAW: u1,
        /// Reserved
        L1_ICACHE3_PLD_ERR_INT_RAW: u1,
        /// The raw bit of the interrupt that occurs only when L1-DCache preload-operation error occurs.
        L1_DCACHE_PLD_ERR_INT_RAW: u1,
        reserved13: u1 = 0,
        /// The raw bit of the interrupt that occurs only when Cache sync-operation error occurs.
        SYNC_ERR_INT_RAW: u1,
        padding: u18 = 0,
    }),
    /// L1-Cache Access Fail Interrupt status register
    /// offset: 0x244
    SYNC_L1_CACHE_PRELOAD_INT_ST: mmio.Mmio(packed struct(u32) {
        /// The bit indicates the status of the interrupt that occurs only when L1-ICache0 preload-operation is done.
        L1_ICACHE0_PLD_DONE_INT_ST: u1,
        /// The bit indicates the status of the interrupt that occurs only when L1-ICache1 preload-operation is done.
        L1_ICACHE1_PLD_DONE_INT_ST: u1,
        /// Reserved
        L1_ICACHE2_PLD_DONE_INT_ST: u1,
        /// Reserved
        L1_ICACHE3_PLD_DONE_INT_ST: u1,
        /// The bit indicates the status of the interrupt that occurs only when L1-DCache preload-operation is done.
        L1_DCACHE_PLD_DONE_INT_ST: u1,
        reserved6: u1 = 0,
        /// The bit indicates the status of the interrupt that occurs only when Cache sync-operation is done.
        SYNC_DONE_INT_ST: u1,
        /// The bit indicates the status of the interrupt of L1-ICache0 preload-operation error.
        L1_ICACHE0_PLD_ERR_INT_ST: u1,
        /// The bit indicates the status of the interrupt of L1-ICache1 preload-operation error.
        L1_ICACHE1_PLD_ERR_INT_ST: u1,
        /// Reserved
        L1_ICACHE2_PLD_ERR_INT_ST: u1,
        /// Reserved
        L1_ICACHE3_PLD_ERR_INT_ST: u1,
        /// The bit indicates the status of the interrupt of L1-DCache preload-operation error.
        L1_DCACHE_PLD_ERR_INT_ST: u1,
        reserved13: u1 = 0,
        /// The bit indicates the status of the interrupt of Cache sync-operation error.
        SYNC_ERR_INT_ST: u1,
        padding: u18 = 0,
    }),
    /// Cache Sync/Preload Operation exception register
    /// offset: 0x248
    SYNC_L1_CACHE_PRELOAD_EXCEPTION: mmio.Mmio(packed struct(u32) {
        /// The value 2 is Only available which means preload size is error in L1-ICache0.
        L1_ICACHE0_PLD_ERR_CODE: u2,
        /// The value 2 is Only available which means preload size is error in L1-ICache1.
        L1_ICACHE1_PLD_ERR_CODE: u2,
        /// Reserved
        L1_ICACHE2_PLD_ERR_CODE: u2,
        /// Reserved
        L1_ICACHE3_PLD_ERR_CODE: u2,
        /// The value 2 is Only available which means preload size is error in L1-DCache.
        L1_DCACHE_PLD_ERR_CODE: u2,
        reserved12: u2 = 0,
        /// The values 0-2 are available which means sync map, command conflict and size are error in Cache System.
        SYNC_ERR_CODE: u2,
        padding: u18 = 0,
    }),
    /// Cache Sync Reset control register
    /// offset: 0x24c
    L1_CACHE_SYNC_RST_CTRL: mmio.Mmio(packed struct(u32) {
        /// set this bit to reset sync-logic inside L1-ICache0. Recommend that this should only be used to initialize sync-logic when some fatal error of sync-logic occurs.
        L1_ICACHE0_SYNC_RST: u1,
        /// set this bit to reset sync-logic inside L1-ICache1. Recommend that this should only be used to initialize sync-logic when some fatal error of sync-logic occurs.
        L1_ICACHE1_SYNC_RST: u1,
        /// Reserved
        L1_ICACHE2_SYNC_RST: u1,
        /// Reserved
        L1_ICACHE3_SYNC_RST: u1,
        /// set this bit to reset sync-logic inside L1-DCache. Recommend that this should only be used to initialize sync-logic when some fatal error of sync-logic occurs.
        L1_DCACHE_SYNC_RST: u1,
        padding: u27 = 0,
    }),
    /// Cache Preload Reset control register
    /// offset: 0x250
    L1_CACHE_PRELOAD_RST_CTRL: mmio.Mmio(packed struct(u32) {
        /// set this bit to reset preload-logic inside L1-ICache0. Recommend that this should only be used to initialize preload-logic when some fatal error of preload-logic occurs.
        L1_ICACHE0_PLD_RST: u1,
        /// set this bit to reset preload-logic inside L1-ICache1. Recommend that this should only be used to initialize preload-logic when some fatal error of preload-logic occurs.
        L1_ICACHE1_PLD_RST: u1,
        /// Reserved
        L1_ICACHE2_PLD_RST: u1,
        /// Reserved
        L1_ICACHE3_PLD_RST: u1,
        /// set this bit to reset preload-logic inside L1-DCache. Recommend that this should only be used to initialize preload-logic when some fatal error of preload-logic occurs.
        L1_DCACHE_PLD_RST: u1,
        padding: u27 = 0,
    }),
    /// Cache Autoload buffer clear control register
    /// offset: 0x254
    L1_CACHE_AUTOLOAD_BUF_CLR_CTRL: mmio.Mmio(packed struct(u32) {
        /// set this bit to clear autoload-buffer inside L1-ICache0. If this bit is active, autoload will not work in L1-ICache0. This bit should not be active when autoload works in L1-ICache0.
        L1_ICACHE0_ALD_BUF_CLR: u1,
        /// set this bit to clear autoload-buffer inside L1-ICache1. If this bit is active, autoload will not work in L1-ICache1. This bit should not be active when autoload works in L1-ICache1.
        L1_ICACHE1_ALD_BUF_CLR: u1,
        /// Reserved
        L1_ICACHE2_ALD_BUF_CLR: u1,
        /// Reserved
        L1_ICACHE3_ALD_BUF_CLR: u1,
        /// set this bit to clear autoload-buffer inside L1-DCache. If this bit is active, autoload will not work in L1-DCache. This bit should not be active when autoload works in L1-DCache.
        L1_DCACHE_ALD_BUF_CLR: u1,
        padding: u27 = 0,
    }),
    /// Unallocate request buffer clear registers
    /// offset: 0x258
    L1_UNALLOCATE_BUFFER_CLEAR: mmio.Mmio(packed struct(u32) {
        /// The bit is used to clear the unallocate request buffer of l1 icache0 where the unallocate request is responsed but not completed.
        L1_ICACHE0_UNALLOC_CLR: u1,
        /// The bit is used to clear the unallocate request buffer of l1 icache1 where the unallocate request is responsed but not completed.
        L1_ICACHE1_UNALLOC_CLR: u1,
        /// Reserved
        L1_ICACHE2_UNALLOC_CLR: u1,
        /// Reserved
        L1_ICACHE3_UNALLOC_CLR: u1,
        /// The bit is used to clear the unallocate request buffer of l1 dcache where the unallocate request is responsed but not completed.
        L1_DCACHE_UNALLOC_CLR: u1,
        padding: u27 = 0,
    }),
    /// Cache Tag and Data memory Object control register
    /// offset: 0x25c
    L1_CACHE_OBJECT_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set this bit to set L1-ICache0 tag memory as object. This bit should be onehot with the others fields inside this register.
        L1_ICACHE0_TAG_OBJECT: u1,
        /// Set this bit to set L1-ICache1 tag memory as object. This bit should be onehot with the others fields inside this register.
        L1_ICACHE1_TAG_OBJECT: u1,
        /// Reserved
        L1_ICACHE2_TAG_OBJECT: u1,
        /// Reserved
        L1_ICACHE3_TAG_OBJECT: u1,
        /// Set this bit to set L1-DCache tag memory as object. This bit should be onehot with the others fields inside this register.
        L1_DCACHE_TAG_OBJECT: u1,
        reserved6: u1 = 0,
        /// Set this bit to set L1-ICache0 data memory as object. This bit should be onehot with the others fields inside this register.
        L1_ICACHE0_MEM_OBJECT: u1,
        /// Set this bit to set L1-ICache1 data memory as object. This bit should be onehot with the others fields inside this register.
        L1_ICACHE1_MEM_OBJECT: u1,
        /// Reserved
        L1_ICACHE2_MEM_OBJECT: u1,
        /// Reserved
        L1_ICACHE3_MEM_OBJECT: u1,
        /// Set this bit to set L1-DCache data memory as object. This bit should be onehot with the others fields inside this register.
        L1_DCACHE_MEM_OBJECT: u1,
        padding: u21 = 0,
    }),
    /// Cache Tag and Data memory way register
    /// offset: 0x260
    L1_CACHE_WAY_OBJECT: mmio.Mmio(packed struct(u32) {
        /// Set this bits to select which way of the tag-object will be accessed. 0: way0, 1: way1, 2: way2, 3: way3, ?, 7: way7.
        L1_CACHE_WAY_OBJECT: u3,
        padding: u29 = 0,
    }),
    /// Cache Vaddr register
    /// offset: 0x264
    L1_CACHE_VADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits stores the virtual address which will decide where inside the specified tag memory object will be accessed.
        L1_CACHE_VADDR: u32,
    }),
    /// Cache Tag/data memory content register
    /// offset: 0x268
    L1_CACHE_DEBUG_BUS: mmio.Mmio(packed struct(u32) {
        /// This is a constant place where we can write data to or read data from the tag/data memory on the specified cache.
        L1_CACHE_DEBUG_BUS: u32,
    }),
    /// USED TO SPLIT L1 CACHE AND L2 CACHE
    /// offset: 0x26c
    LEVEL_SPLIT0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        LEVEL_SPLIT0: u32,
    }),
    /// L2 Cache(L2-Cache) control register
    /// offset: 0x270
    L2_CACHE_CTRL: mmio.Mmio(packed struct(u32) {
        reserved4: u4 = 0,
        /// The bit is used to disable DMA access L2-Cache, 0: enable, 1: disable
        L2_CACHE_SHUT_DMA: u1,
        reserved8: u3 = 0,
        /// Reserved
        L2_CACHE_UNDEF_OP: u8,
        padding: u16 = 0,
    }),
    /// Bypass Cache configure register
    /// offset: 0x274
    L2_BYPASS_CACHE_CONF: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// The bit is used to enable bypass L2-Cache. 0: disable bypass, 1: enable bypass.
        BYPASS_L2_CACHE_EN: u1,
        padding: u26 = 0,
    }),
    /// L2 Cache CacheSize mode configure register
    /// offset: 0x278
    L2_CACHE_CACHESIZE_CONF: mmio.Mmio(packed struct(u32) {
        /// The field is used to configure cachesize of L2-Cache as 256 bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_256: u1,
        /// The field is used to configure cachesize of L2-Cache as 512 bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_512: u1,
        /// The field is used to configure cachesize of L2-Cache as 1k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_1K: u1,
        /// The field is used to configure cachesize of L2-Cache as 2k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_2K: u1,
        /// The field is used to configure cachesize of L2-Cache as 4k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_4K: u1,
        /// The field is used to configure cachesize of L2-Cache as 8k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_8K: u1,
        /// The field is used to configure cachesize of L2-Cache as 16k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_16K: u1,
        /// The field is used to configure cachesize of L2-Cache as 32k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_32K: u1,
        /// The field is used to configure cachesize of L2-Cache as 64k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_64K: u1,
        /// The field is used to configure cachesize of L2-Cache as 128k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_128K: u1,
        /// The field is used to configure cachesize of L2-Cache as 256k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_256K: u1,
        /// The field is used to configure cachesize of L2-Cache as 512k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_512K: u1,
        /// The field is used to configure cachesize of L2-Cache as 1024k bytes. This field and all other fields within this register is onehot.
        L2_CACHE_CACHESIZE_1024K: u1,
        padding: u19 = 0,
    }),
    /// L2 Cache BlockSize mode configure register
    /// offset: 0x27c
    L2_CACHE_BLOCKSIZE_CONF: mmio.Mmio(packed struct(u32) {
        /// The field is used to configureblocksize of L2-Cache as 8 bytes. This field and all other fields within this register is onehot.
        L2_CACHE_BLOCKSIZE_8: u1,
        /// The field is used to configureblocksize of L2-Cache as 16 bytes. This field and all other fields within this register is onehot.
        L2_CACHE_BLOCKSIZE_16: u1,
        /// The field is used to configureblocksize of L2-Cache as 32 bytes. This field and all other fields within this register is onehot.
        L2_CACHE_BLOCKSIZE_32: u1,
        /// The field is used to configureblocksize of L2-Cache as 64 bytes. This field and all other fields within this register is onehot.
        L2_CACHE_BLOCKSIZE_64: u1,
        /// The field is used to configureblocksize of L2-Cache as 128 bytes. This field and all other fields within this register is onehot.
        L2_CACHE_BLOCKSIZE_128: u1,
        /// The field is used to configureblocksize of L2-Cache as 256 bytes. This field and all other fields within this register is onehot.
        L2_CACHE_BLOCKSIZE_256: u1,
        padding: u26 = 0,
    }),
    /// Cache wrap around control register
    /// offset: 0x280
    L2_CACHE_WRAP_AROUND_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// Set this bit as 1 to enable L2-Cache wrap around mode.
        L2_CACHE_WRAP: u1,
        padding: u26 = 0,
    }),
    /// Cache tag memory power control register
    /// offset: 0x284
    L2_CACHE_TAG_MEM_POWER_CTRL: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// The bit is used to close clock gating of L2-Cache tag memory. 1: close gating, 0: open clock gating.
        L2_CACHE_TAG_MEM_FORCE_ON: u1,
        /// The bit is used to power L2-Cache tag memory down. 0: follow rtc_lslp, 1: power down
        L2_CACHE_TAG_MEM_FORCE_PD: u1,
        /// The bit is used to power L2-Cache tag memory up. 0: follow rtc_lslp, 1: power up
        L2_CACHE_TAG_MEM_FORCE_PU: u1,
        padding: u9 = 0,
    }),
    /// Cache data memory power control register
    /// offset: 0x288
    L2_CACHE_DATA_MEM_POWER_CTRL: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// The bit is used to close clock gating of L2-Cache data memory. 1: close gating, 0: open clock gating.
        L2_CACHE_DATA_MEM_FORCE_ON: u1,
        /// The bit is used to power L2-Cache data memory down. 0: follow rtc_lslp, 1: power down
        L2_CACHE_DATA_MEM_FORCE_PD: u1,
        /// The bit is used to power L2-Cache data memory up. 0: follow rtc_lslp, 1: power up
        L2_CACHE_DATA_MEM_FORCE_PU: u1,
        padding: u9 = 0,
    }),
    /// Cache Freeze control register
    /// offset: 0x28c
    L2_CACHE_FREEZE_CTRL: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// The bit is used to enable freeze operation on L2-Cache. It can be cleared by software.
        L2_CACHE_FREEZE_EN: u1,
        /// The bit is used to configure mode of freeze operation L2-Cache. 0: a miss-access will not stuck. 1: a miss-access will stuck.
        L2_CACHE_FREEZE_MODE: u1,
        /// The bit is used to indicate whether freeze operation on L2-Cache is finished or not. 0: not finished. 1: finished.
        L2_CACHE_FREEZE_DONE: u1,
        padding: u9 = 0,
    }),
    /// Cache data memory access configure register
    /// offset: 0x290
    L2_CACHE_DATA_MEM_ACS_CONF: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// The bit is used to enable config-bus read L2-Cache data memoryory. 0: disable, 1: enable.
        L2_CACHE_DATA_MEM_RD_EN: u1,
        /// The bit is used to enable config-bus write L2-Cache data memoryory. 0: disable, 1: enable.
        L2_CACHE_DATA_MEM_WR_EN: u1,
        padding: u10 = 0,
    }),
    /// Cache tag memory access configure register
    /// offset: 0x294
    L2_CACHE_TAG_MEM_ACS_CONF: mmio.Mmio(packed struct(u32) {
        reserved20: u20 = 0,
        /// The bit is used to enable config-bus read L2-Cache tag memoryory. 0: disable, 1: enable.
        L2_CACHE_TAG_MEM_RD_EN: u1,
        /// The bit is used to enable config-bus write L2-Cache tag memoryory. 0: disable, 1: enable.
        L2_CACHE_TAG_MEM_WR_EN: u1,
        padding: u10 = 0,
    }),
    /// L2 Cache prelock configure register
    /// offset: 0x298
    L2_CACHE_PRELOCK_CONF: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable the first section of prelock function on L2-Cache.
        L2_CACHE_PRELOCK_SCT0_EN: u1,
        /// The bit is used to enable the second section of prelock function on L2-Cache.
        L2_CACHE_PRELOCK_SCT1_EN: u1,
        /// The bit is used to set the gid of l2 cache prelock.
        L2_CACHE_PRELOCK_RGID: u4,
        padding: u26 = 0,
    }),
    /// L2 Cache prelock section0 address configure register
    /// offset: 0x29c
    L2_CACHE_PRELOCK_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section of prelock on L2-Cache, which should be used together with L2_CACHE_PRELOCK_SCT0_SIZE_REG
        L2_CACHE_PRELOCK_SCT0_ADDR: u32,
    }),
    /// L2 Cache prelock section1 address configure register
    /// offset: 0x2a0
    L2_CACHE_PRELOCK_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section of prelock on L2-Cache, which should be used together with L2_CACHE_PRELOCK_SCT1_SIZE_REG
        L2_CACHE_PRELOCK_SCT1_ADDR: u32,
    }),
    /// L2 Cache prelock section size configure register
    /// offset: 0x2a4
    L2_CACHE_PRELOCK_SCT_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L2-Cache, which should be used together with L2_CACHE_PRELOCK_SCT0_ADDR_REG
        L2_CACHE_PRELOCK_SCT0_SIZE: u16,
        /// Those bits are used to configure the size of the second section of prelock on L2-Cache, which should be used together with L2_CACHE_PRELOCK_SCT1_ADDR_REG
        L2_CACHE_PRELOCK_SCT1_SIZE: u16,
    }),
    /// L2 Cache preload-operation control register
    /// offset: 0x2a8
    L2_CACHE_PRELOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable preload operation on L2-Cache. It will be cleared by hardware automatically after preload operation is done.
        L2_CACHE_PRELOAD_ENA: u1,
        /// The bit is used to indicate whether preload operation is finished or not. 0: not finished. 1: finished.
        L2_CACHE_PRELOAD_DONE: u1,
        /// The bit is used to configure the direction of preload operation. 0: ascending, 1: descending.
        L2_CACHE_PRELOAD_ORDER: u1,
        /// The bit is used to set the gid of l2 cache preload.
        L2_CACHE_PRELOAD_RGID: u4,
        padding: u25 = 0,
    }),
    /// L2 Cache preload address configure register
    /// offset: 0x2ac
    L2_CACHE_PRELOAD_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of preload on L2-Cache, which should be used together with L2_CACHE_PRELOAD_SIZE_REG
        L2_CACHE_PRELOAD_ADDR: u32,
    }),
    /// L2 Cache preload size configure register
    /// offset: 0x2b0
    L2_CACHE_PRELOAD_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section of prelock on L2-Cache, which should be used together with L2_CACHE_PRELOAD_ADDR_REG
        L2_CACHE_PRELOAD_SIZE: u16,
        padding: u16 = 0,
    }),
    /// L2 Cache autoload-operation control register
    /// offset: 0x2b4
    L2_CACHE_AUTOLOAD_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable and disable autoload operation on L2-Cache. 1: enable, 0: disable.
        L2_CACHE_AUTOLOAD_ENA: u1,
        /// The bit is used to indicate whether autoload operation on L2-Cache is finished or not. 0: not finished. 1: finished.
        L2_CACHE_AUTOLOAD_DONE: u1,
        /// The bit is used to configure the direction of autoload operation on L2-Cache. 0: ascending. 1: descending.
        L2_CACHE_AUTOLOAD_ORDER: u1,
        /// The field is used to configure trigger mode of autoload operation on L2-Cache. 0/3: miss-trigger, 1: hit-trigger, 2: miss-hit-trigger.
        L2_CACHE_AUTOLOAD_TRIGGER_MODE: u2,
        reserved8: u3 = 0,
        /// The bit is used to enable the first section for autoload operation on L2-Cache.
        L2_CACHE_AUTOLOAD_SCT0_ENA: u1,
        /// The bit is used to enable the second section for autoload operation on L2-Cache.
        L2_CACHE_AUTOLOAD_SCT1_ENA: u1,
        /// The bit is used to enable the third section for autoload operation on L2-Cache.
        L2_CACHE_AUTOLOAD_SCT2_ENA: u1,
        /// The bit is used to enable the fourth section for autoload operation on L2-Cache.
        L2_CACHE_AUTOLOAD_SCT3_ENA: u1,
        /// The bit is used to set the gid of l2 cache autoload.
        L2_CACHE_AUTOLOAD_RGID: u4,
        padding: u16 = 0,
    }),
    /// L2 Cache autoload section 0 address configure register
    /// offset: 0x2b8
    L2_CACHE_AUTOLOAD_SCT0_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the first section for autoload operation on L2-Cache. Note that it should be used together with L2_CACHE_AUTOLOAD_SCT0_SIZE and L2_CACHE_AUTOLOAD_SCT0_ENA.
        L2_CACHE_AUTOLOAD_SCT0_ADDR: u32,
    }),
    /// L2 Cache autoload section 0 size configure register
    /// offset: 0x2bc
    L2_CACHE_AUTOLOAD_SCT0_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the first section for autoload operation on L2-Cache. Note that it should be used together with L2_CACHE_AUTOLOAD_SCT0_ADDR and L2_CACHE_AUTOLOAD_SCT0_ENA.
        L2_CACHE_AUTOLOAD_SCT0_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L2 Cache autoload section 1 address configure register
    /// offset: 0x2c0
    L2_CACHE_AUTOLOAD_SCT1_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the second section for autoload operation on L2-Cache. Note that it should be used together with L2_CACHE_AUTOLOAD_SCT1_SIZE and L2_CACHE_AUTOLOAD_SCT1_ENA.
        L2_CACHE_AUTOLOAD_SCT1_ADDR: u32,
    }),
    /// L2 Cache autoload section 1 size configure register
    /// offset: 0x2c4
    L2_CACHE_AUTOLOAD_SCT1_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the second section for autoload operation on L2-Cache. Note that it should be used together with L2_CACHE_AUTOLOAD_SCT1_ADDR and L2_CACHE_AUTOLOAD_SCT1_ENA.
        L2_CACHE_AUTOLOAD_SCT1_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L2 Cache autoload section 2 address configure register
    /// offset: 0x2c8
    L2_CACHE_AUTOLOAD_SCT2_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the third section for autoload operation on L2-Cache. Note that it should be used together with L2_CACHE_AUTOLOAD_SCT2_SIZE and L2_CACHE_AUTOLOAD_SCT2_ENA.
        L2_CACHE_AUTOLOAD_SCT2_ADDR: u32,
    }),
    /// L2 Cache autoload section 2 size configure register
    /// offset: 0x2cc
    L2_CACHE_AUTOLOAD_SCT2_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the third section for autoload operation on L2-Cache. Note that it should be used together with L2_CACHE_AUTOLOAD_SCT2_ADDR and L2_CACHE_AUTOLOAD_SCT2_ENA.
        L2_CACHE_AUTOLOAD_SCT2_SIZE: u28,
        padding: u4 = 0,
    }),
    /// L2 Cache autoload section 3 address configure register
    /// offset: 0x2d0
    L2_CACHE_AUTOLOAD_SCT3_ADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the start virtual address of the fourth section for autoload operation on L2-Cache. Note that it should be used together with L2_CACHE_AUTOLOAD_SCT3_SIZE and L2_CACHE_AUTOLOAD_SCT3_ENA.
        L2_CACHE_AUTOLOAD_SCT3_ADDR: u32,
    }),
    /// L2 Cache autoload section 3 size configure register
    /// offset: 0x2d4
    L2_CACHE_AUTOLOAD_SCT3_SIZE: mmio.Mmio(packed struct(u32) {
        /// Those bits are used to configure the size of the fourth section for autoload operation on L2-Cache. Note that it should be used together with L2_CACHE_AUTOLOAD_SCT3_ADDR and L2_CACHE_AUTOLOAD_SCT3_ENA.
        L2_CACHE_AUTOLOAD_SCT3_SIZE: u28,
        padding: u4 = 0,
    }),
    /// Cache Access Counter Interrupt enable register
    /// offset: 0x2d8
    L2_CACHE_ACS_CNT_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// The bit is used to enable interrupt of one of counters overflow that occurs in L2-Cache due to bus0 accesses L2-Cache.
        L2_IBUS0_OVF_INT_ENA: u1,
        /// The bit is used to enable interrupt of one of counters overflow that occurs in L2-Cache due to bus1 accesses L2-Cache.
        L2_IBUS1_OVF_INT_ENA: u1,
        /// Reserved
        L2_IBUS2_OVF_INT_ENA: u1,
        /// Reserved
        L2_IBUS3_OVF_INT_ENA: u1,
        /// The bit is used to enable interrupt of one of counters overflow that occurs in L2-Cache due to bus0 accesses L2-Cache.
        L2_DBUS0_OVF_INT_ENA: u1,
        /// The bit is used to enable interrupt of one of counters overflow that occurs in L2-Cache due to bus1 accesses L2-Cache.
        L2_DBUS1_OVF_INT_ENA: u1,
        /// Reserved
        L2_DBUS2_OVF_INT_ENA: u1,
        /// Reserved
        L2_DBUS3_OVF_INT_ENA: u1,
        padding: u16 = 0,
    }),
    /// Cache Access Counter Interrupt clear register
    /// offset: 0x2dc
    L2_CACHE_ACS_CNT_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// The bit is used to clear counters overflow interrupt and counters in L2-Cache due to bus0 accesses L2-Cache.
        L2_IBUS0_OVF_INT_CLR: u1,
        /// The bit is used to clear counters overflow interrupt and counters in L2-Cache due to bus1 accesses L2-Cache.
        L2_IBUS1_OVF_INT_CLR: u1,
        /// Reserved
        L2_IBUS2_OVF_INT_CLR: u1,
        /// Reserved
        L2_IBUS3_OVF_INT_CLR: u1,
        /// The bit is used to clear counters overflow interrupt and counters in L2-Cache due to bus0 accesses L2-Cache.
        L2_DBUS0_OVF_INT_CLR: u1,
        /// The bit is used to clear counters overflow interrupt and counters in L2-Cache due to bus1 accesses L2-Cache.
        L2_DBUS1_OVF_INT_CLR: u1,
        /// Reserved
        L2_DBUS2_OVF_INT_CLR: u1,
        /// Reserved
        L2_DBUS3_OVF_INT_CLR: u1,
        padding: u16 = 0,
    }),
    /// Cache Access Counter Interrupt raw register
    /// offset: 0x2e0
    L2_CACHE_ACS_CNT_INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L2-Cache due to bus0 accesses L2-ICache0.
        L2_IBUS0_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L2-Cache due to bus1 accesses L2-ICache1.
        L2_IBUS1_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L2-Cache due to bus2 accesses L2-ICache2.
        L2_IBUS2_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L2-Cache due to bus3 accesses L2-ICache3.
        L2_IBUS3_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L2-Cache due to bus0 accesses L2-DCache.
        L2_DBUS0_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L2-Cache due to bus1 accesses L2-DCache.
        L2_DBUS1_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L2-Cache due to bus2 accesses L2-DCache.
        L2_DBUS2_OVF_INT_RAW: u1,
        /// The raw bit of the interrupt of one of counters overflow that occurs in L2-Cache due to bus3 accesses L2-DCache.
        L2_DBUS3_OVF_INT_RAW: u1,
        padding: u16 = 0,
    }),
    /// Cache Access Counter Interrupt status register
    /// offset: 0x2e4
    L2_CACHE_ACS_CNT_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// The bit indicates the interrupt status of one of counters overflow that occurs in L2-Cache due to bus0 accesses L2-Cache.
        L2_IBUS0_OVF_INT_ST: u1,
        /// The bit indicates the interrupt status of one of counters overflow that occurs in L2-Cache due to bus1 accesses L2-Cache.
        L2_IBUS1_OVF_INT_ST: u1,
        /// Reserved
        L2_IBUS2_OVF_INT_ST: u1,
        /// Reserved
        L2_IBUS3_OVF_INT_ST: u1,
        /// The bit indicates the interrupt status of one of counters overflow that occurs in L2-Cache due to bus0 accesses L2-Cache.
        L2_DBUS0_OVF_INT_ST: u1,
        /// The bit indicates the interrupt status of one of counters overflow that occurs in L2-Cache due to bus1 accesses L2-Cache.
        L2_DBUS1_OVF_INT_ST: u1,
        /// Reserved
        L2_DBUS2_OVF_INT_ST: u1,
        /// Reserved
        L2_DBUS3_OVF_INT_ST: u1,
        padding: u16 = 0,
    }),
    /// Cache Access Fail Configuration register
    /// offset: 0x2e8
    L2_CACHE_ACS_FAIL_CTRL: mmio.Mmio(packed struct(u32) {
        /// The bit is used to configure l2 cache access fail check mode. 0: the access fail is not propagated to the request, 1: the access fail is propagated to the request
        L2_CACHE_ACS_FAIL_CHECK_MODE: u1,
        padding: u31 = 0,
    }),
    /// Cache Access Fail Interrupt enable register
    /// offset: 0x2ec
    L2_CACHE_ACS_FAIL_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// The bit is used to enable interrupt of access fail that occurs in L2-Cache due to l1 cache accesses L2-Cache.
        L2_CACHE_FAIL_INT_ENA: u1,
        padding: u26 = 0,
    }),
    /// L1-Cache Access Fail Interrupt clear register
    /// offset: 0x2f0
    L2_CACHE_ACS_FAIL_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// The bit is used to clear interrupt of access fail that occurs in L2-Cache due to l1 cache accesses L2-Cache.
        L2_CACHE_FAIL_INT_CLR: u1,
        padding: u26 = 0,
    }),
    /// Cache Access Fail Interrupt raw register
    /// offset: 0x2f4
    L2_CACHE_ACS_FAIL_INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// The raw bit of the interrupt of access fail that occurs in L2-Cache.
        L2_CACHE_FAIL_INT_RAW: u1,
        padding: u26 = 0,
    }),
    /// Cache Access Fail Interrupt status register
    /// offset: 0x2f8
    L2_CACHE_ACS_FAIL_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// The bit indicates the interrupt status of access fail that occurs in L2-Cache due to l1 cache accesses L2-Cache.
        L2_CACHE_FAIL_INT_ST: u1,
        padding: u26 = 0,
    }),
    /// Cache Access Counter enable and clear register
    /// offset: 0x2fc
    L2_CACHE_ACS_CNT_CTRL: mmio.Mmio(packed struct(u32) {
        reserved8: u8 = 0,
        /// The bit is used to enable ibus0 counter in L2-Cache.
        L2_IBUS0_CNT_ENA: u1,
        /// The bit is used to enable ibus1 counter in L2-Cache.
        L2_IBUS1_CNT_ENA: u1,
        /// Reserved
        L2_IBUS2_CNT_ENA: u1,
        /// Reserved
        L2_IBUS3_CNT_ENA: u1,
        /// The bit is used to enable dbus0 counter in L2-Cache.
        L2_DBUS0_CNT_ENA: u1,
        /// The bit is used to enable dbus1 counter in L2-Cache.
        L2_DBUS1_CNT_ENA: u1,
        /// Reserved
        L2_DBUS2_CNT_ENA: u1,
        /// Reserved
        L2_DBUS3_CNT_ENA: u1,
        reserved24: u8 = 0,
        /// The bit is used to clear ibus0 counter in L2-Cache.
        L2_IBUS0_CNT_CLR: u1,
        /// The bit is used to clear ibus1 counter in L2-Cache.
        L2_IBUS1_CNT_CLR: u1,
        /// Reserved
        L2_IBUS2_CNT_CLR: u1,
        /// Reserved
        L2_IBUS3_CNT_CLR: u1,
        /// The bit is used to clear dbus0 counter in L2-Cache.
        L2_DBUS0_CNT_CLR: u1,
        /// The bit is used to clear dbus1 counter in L2-Cache.
        L2_DBUS1_CNT_CLR: u1,
        /// Reserved
        L2_DBUS2_CNT_CLR: u1,
        /// Reserved
        L2_DBUS3_CNT_CLR: u1,
    }),
    /// L2-Cache bus0 Hit-Access Counter register
    /// offset: 0x300
    L2_IBUS0_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when L1-ICache0 accesses L2-Cache due to bus0 accessing L1-ICache0.
        L2_IBUS0_HIT_CNT: u32,
    }),
    /// L2-Cache bus0 Miss-Access Counter register
    /// offset: 0x304
    L2_IBUS0_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when L1-ICache0 accesses L2-Cache due to bus0 accessing L1-ICache0.
        L2_IBUS0_MISS_CNT: u32,
    }),
    /// L2-Cache bus0 Conflict-Access Counter register
    /// offset: 0x308
    L2_IBUS0_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when L1-ICache0 accesses L2-Cache due to bus0 accessing L1-ICache0.
        L2_IBUS0_CONFLICT_CNT: u32,
    }),
    /// L2-Cache bus0 Next-Level-Access Counter register
    /// offset: 0x30c
    L2_IBUS0_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L2-Cache accesses external memory due to L1-ICache0 accessing L2-Cache due to bus0 accessing L1-ICache0.
        L2_IBUS0_NXTLVL_RD_CNT: u32,
    }),
    /// L2-Cache bus1 Hit-Access Counter register
    /// offset: 0x310
    L2_IBUS1_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when L1-ICache1 accesses L2-Cache due to bus1 accessing L1-ICache1.
        L2_IBUS1_HIT_CNT: u32,
    }),
    /// L2-Cache bus1 Miss-Access Counter register
    /// offset: 0x314
    L2_IBUS1_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when L1-ICache1 accesses L2-Cache due to bus1 accessing L1-ICache1.
        L2_IBUS1_MISS_CNT: u32,
    }),
    /// L2-Cache bus1 Conflict-Access Counter register
    /// offset: 0x318
    L2_IBUS1_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when L1-ICache1 accesses L2-Cache due to bus1 accessing L1-ICache1.
        L2_IBUS1_CONFLICT_CNT: u32,
    }),
    /// L2-Cache bus1 Next-Level-Access Counter register
    /// offset: 0x31c
    L2_IBUS1_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L2-Cache accesses external memory due to L1-ICache1 accessing L2-Cache due to bus1 accessing L1-ICache1.
        L2_IBUS1_NXTLVL_RD_CNT: u32,
    }),
    /// L2-Cache bus2 Hit-Access Counter register
    /// offset: 0x320
    L2_IBUS2_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when L1-ICache2 accesses L2-Cache due to bus2 accessing L1-ICache2.
        L2_IBUS2_HIT_CNT: u32,
    }),
    /// L2-Cache bus2 Miss-Access Counter register
    /// offset: 0x324
    L2_IBUS2_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when L1-ICache2 accesses L2-Cache due to bus2 accessing L1-ICache2.
        L2_IBUS2_MISS_CNT: u32,
    }),
    /// L2-Cache bus2 Conflict-Access Counter register
    /// offset: 0x328
    L2_IBUS2_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when L1-ICache2 accesses L2-Cache due to bus2 accessing L1-ICache2.
        L2_IBUS2_CONFLICT_CNT: u32,
    }),
    /// L2-Cache bus2 Next-Level-Access Counter register
    /// offset: 0x32c
    L2_IBUS2_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L2-Cache accesses external memory due to L1-ICache2 accessing L2-Cache due to bus2 accessing L1-ICache2.
        L2_IBUS2_NXTLVL_RD_CNT: u32,
    }),
    /// L2-Cache bus3 Hit-Access Counter register
    /// offset: 0x330
    L2_IBUS3_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when L1-ICache3 accesses L2-Cache due to bus3 accessing L1-ICache3.
        L2_IBUS3_HIT_CNT: u32,
    }),
    /// L2-Cache bus3 Miss-Access Counter register
    /// offset: 0x334
    L2_IBUS3_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when L1-ICache3 accesses L2-Cache due to bus3 accessing L1-ICache3.
        L2_IBUS3_MISS_CNT: u32,
    }),
    /// L2-Cache bus3 Conflict-Access Counter register
    /// offset: 0x338
    L2_IBUS3_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when L1-ICache3 accesses L2-Cache due to bus3 accessing L1-ICache3.
        L2_IBUS3_CONFLICT_CNT: u32,
    }),
    /// L2-Cache bus3 Next-Level-Access Counter register
    /// offset: 0x33c
    L2_IBUS3_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L2-Cache accesses external memory due to L1-ICache3 accessing L2-Cache due to bus3 accessing L1-ICache3.
        L2_IBUS3_NXTLVL_RD_CNT: u32,
    }),
    /// L2-Cache bus0 Hit-Access Counter register
    /// offset: 0x340
    L2_DBUS0_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when L1-DCache accesses L2-Cache due to bus0 accessing L1-DCache.
        L2_DBUS0_HIT_CNT: u32,
    }),
    /// L2-Cache bus0 Miss-Access Counter register
    /// offset: 0x344
    L2_DBUS0_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when L1-DCache accesses L2-Cache due to bus0 accessing L1-DCache.
        L2_DBUS0_MISS_CNT: u32,
    }),
    /// L2-Cache bus0 Conflict-Access Counter register
    /// offset: 0x348
    L2_DBUS0_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when L1-DCache accesses L2-Cache due to bus0 accessing L1-DCache.
        L2_DBUS0_CONFLICT_CNT: u32,
    }),
    /// L2-Cache bus0 Next-Level-Access Counter register
    /// offset: 0x34c
    L2_DBUS0_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L2-Cache accesses external memory due to L1-DCache accessing L2-Cache due to bus0 accessing L1-DCache.
        L2_DBUS0_NXTLVL_RD_CNT: u32,
    }),
    /// L2-Cache bus0 WB-Access Counter register
    /// offset: 0x350
    L2_DBUS0_ACS_NXTLVL_WR_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of write back when L1-DCache accesses L2-Cache due to bus0 accessing L1-DCache.
        L2_DBUS0_NXTLVL_WR_CNT: u32,
    }),
    /// L2-Cache bus1 Hit-Access Counter register
    /// offset: 0x354
    L2_DBUS1_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when L1-DCache accesses L2-Cache due to bus1 accessing L1-DCache.
        L2_DBUS1_HIT_CNT: u32,
    }),
    /// L2-Cache bus1 Miss-Access Counter register
    /// offset: 0x358
    L2_DBUS1_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when L1-DCache accesses L2-Cache due to bus1 accessing L1-DCache.
        L2_DBUS1_MISS_CNT: u32,
    }),
    /// L2-Cache bus1 Conflict-Access Counter register
    /// offset: 0x35c
    L2_DBUS1_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when L1-DCache accesses L2-Cache due to bus1 accessing L1-DCache.
        L2_DBUS1_CONFLICT_CNT: u32,
    }),
    /// L2-Cache bus1 Next-Level-Access Counter register
    /// offset: 0x360
    L2_DBUS1_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L2-Cache accesses external memory due to L1-DCache accessing L2-Cache due to bus1 accessing L1-DCache.
        L2_DBUS1_NXTLVL_RD_CNT: u32,
    }),
    /// L2-Cache bus1 WB-Access Counter register
    /// offset: 0x364
    L2_DBUS1_ACS_NXTLVL_WR_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of write back when L1-DCache accesses L2-Cache due to bus1 accessing L1-DCache.
        L2_DBUS1_NXTLVL_WR_CNT: u32,
    }),
    /// L2-Cache bus2 Hit-Access Counter register
    /// offset: 0x368
    L2_DBUS2_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when L1-DCache accesses L2-Cache due to bus2 accessing L1-DCache.
        L2_DBUS2_HIT_CNT: u32,
    }),
    /// L2-Cache bus2 Miss-Access Counter register
    /// offset: 0x36c
    L2_DBUS2_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when L1-DCache accesses L2-Cache due to bus2 accessing L1-DCache.
        L2_DBUS2_MISS_CNT: u32,
    }),
    /// L2-Cache bus2 Conflict-Access Counter register
    /// offset: 0x370
    L2_DBUS2_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when L1-DCache accesses L2-Cache due to bus2 accessing L1-DCache.
        L2_DBUS2_CONFLICT_CNT: u32,
    }),
    /// L2-Cache bus2 Next-Level-Access Counter register
    /// offset: 0x374
    L2_DBUS2_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L2-Cache accesses external memory due to L1-DCache accessing L2-Cache due to bus2 accessing L1-DCache.
        L2_DBUS2_NXTLVL_RD_CNT: u32,
    }),
    /// L2-Cache bus2 WB-Access Counter register
    /// offset: 0x378
    L2_DBUS2_ACS_NXTLVL_WR_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of write back when L1-DCache accesses L2-Cache due to bus2 accessing L1-DCache.
        L2_DBUS2_NXTLVL_WR_CNT: u32,
    }),
    /// L2-Cache bus3 Hit-Access Counter register
    /// offset: 0x37c
    L2_DBUS3_ACS_HIT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of hits when L1-DCache accesses L2-Cache due to bus3 accessing L1-DCache.
        L2_DBUS3_HIT_CNT: u32,
    }),
    /// L2-Cache bus3 Miss-Access Counter register
    /// offset: 0x380
    L2_DBUS3_ACS_MISS_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of missing when L1-DCache accesses L2-Cache due to bus3 accessing L1-DCache.
        L2_DBUS3_MISS_CNT: u32,
    }),
    /// L2-Cache bus3 Conflict-Access Counter register
    /// offset: 0x384
    L2_DBUS3_ACS_CONFLICT_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of access-conflicts when L1-DCache accesses L2-Cache due to bus3 accessing L1-DCache.
        L2_DBUS3_CONFLICT_CNT: u32,
    }),
    /// L2-Cache bus3 Next-Level-Access Counter register
    /// offset: 0x388
    L2_DBUS3_ACS_NXTLVL_RD_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of times that L2-Cache accesses external memory due to L1-DCache accessing L2-Cache due to bus3 accessing L1-DCache.
        L2_DBUS3_NXTLVL_RD_CNT: u32,
    }),
    /// L2-Cache bus3 WB-Access Counter register
    /// offset: 0x38c
    L2_DBUS3_ACS_NXTLVL_WR_CNT: mmio.Mmio(packed struct(u32) {
        /// The register records the number of write back when L1-DCache accesses L2-Cache due to bus3 accessing L1-DCache.
        L2_DBUS3_NXTLVL_WR_CNT: u32,
    }),
    /// L2-Cache Access Fail ID/attribution information register
    /// offset: 0x390
    L2_CACHE_ACS_FAIL_ID_ATTR: mmio.Mmio(packed struct(u32) {
        /// The register records the ID of fail-access when L1-Cache accesses L2-Cache.
        L2_CACHE_FAIL_ID: u16,
        /// The register records the attribution of fail-access when L1-Cache accesses L2-Cache due to cache accessing L1-Cache.
        L2_CACHE_FAIL_ATTR: u16,
    }),
    /// L2-Cache Access Fail Address information register
    /// offset: 0x394
    L2_CACHE_ACS_FAIL_ADDR: mmio.Mmio(packed struct(u32) {
        /// The register records the address of fail-access when L1-Cache accesses L2-Cache.
        L2_CACHE_FAIL_ADDR: u32,
    }),
    /// L1-Cache Access Fail Interrupt enable register
    /// offset: 0x398
    L2_CACHE_SYNC_PRELOAD_INT_ENA: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// The bit is used to enable interrupt of L2-Cache preload-operation done.
        L2_CACHE_PLD_DONE_INT_ENA: u1,
        reserved12: u6 = 0,
        /// The bit is used to enable interrupt of L2-Cache preload-operation error.
        L2_CACHE_PLD_ERR_INT_ENA: u1,
        padding: u19 = 0,
    }),
    /// Sync Preload operation Interrupt clear register
    /// offset: 0x39c
    L2_CACHE_SYNC_PRELOAD_INT_CLR: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// The bit is used to clear interrupt that occurs only when L2-Cache preload-operation is done.
        L2_CACHE_PLD_DONE_INT_CLR: u1,
        reserved12: u6 = 0,
        /// The bit is used to clear interrupt of L2-Cache preload-operation error.
        L2_CACHE_PLD_ERR_INT_CLR: u1,
        padding: u19 = 0,
    }),
    /// Sync Preload operation Interrupt raw register
    /// offset: 0x3a0
    L2_CACHE_SYNC_PRELOAD_INT_RAW: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// The raw bit of the interrupt that occurs only when L2-Cache preload-operation is done.
        L2_CACHE_PLD_DONE_INT_RAW: u1,
        reserved12: u6 = 0,
        /// The raw bit of the interrupt that occurs only when L2-Cache preload-operation error occurs.
        L2_CACHE_PLD_ERR_INT_RAW: u1,
        padding: u19 = 0,
    }),
    /// L1-Cache Access Fail Interrupt status register
    /// offset: 0x3a4
    L2_CACHE_SYNC_PRELOAD_INT_ST: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// The bit indicates the status of the interrupt that occurs only when L2-Cache preload-operation is done.
        L2_CACHE_PLD_DONE_INT_ST: u1,
        reserved12: u6 = 0,
        /// The bit indicates the status of the interrupt of L2-Cache preload-operation error.
        L2_CACHE_PLD_ERR_INT_ST: u1,
        padding: u19 = 0,
    }),
    /// Cache Sync/Preload Operation exception register
    /// offset: 0x3a8
    L2_CACHE_SYNC_PRELOAD_EXCEPTION: mmio.Mmio(packed struct(u32) {
        reserved10: u10 = 0,
        /// The value 2 is Only available which means preload size is error in L2-Cache.
        L2_CACHE_PLD_ERR_CODE: u2,
        padding: u20 = 0,
    }),
    /// Cache Sync Reset control register
    /// offset: 0x3ac
    L2_CACHE_SYNC_RST_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// set this bit to reset sync-logic inside L2-Cache. Recommend that this should only be used to initialize sync-logic when some fatal error of sync-logic occurs.
        L2_CACHE_SYNC_RST: u1,
        padding: u26 = 0,
    }),
    /// Cache Preload Reset control register
    /// offset: 0x3b0
    L2_CACHE_PRELOAD_RST_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// set this bit to reset preload-logic inside L2-Cache. Recommend that this should only be used to initialize preload-logic when some fatal error of preload-logic occurs.
        L2_CACHE_PLD_RST: u1,
        padding: u26 = 0,
    }),
    /// Cache Autoload buffer clear control register
    /// offset: 0x3b4
    L2_CACHE_AUTOLOAD_BUF_CLR_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// set this bit to clear autoload-buffer inside L2-Cache. If this bit is active, autoload will not work in L2-Cache. This bit should not be active when autoload works in L2-Cache.
        L2_CACHE_ALD_BUF_CLR: u1,
        padding: u26 = 0,
    }),
    /// Unallocate request buffer clear registers
    /// offset: 0x3b8
    L2_UNALLOCATE_BUFFER_CLEAR: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// The bit is used to clear the unallocate request buffer of l2 icache where the unallocate request is responsed but not completed.
        L2_CACHE_UNALLOC_CLR: u1,
        padding: u26 = 0,
    }),
    /// L2 cache access attribute control register
    /// offset: 0x3bc
    L2_CACHE_ACCESS_ATTR_CTRL: mmio.Mmio(packed struct(u32) {
        /// Set this bit to force the request to l2 cache with cacheable attribute, otherwise, the attribute is propagated from L1 cache or CPU, it could be one of cacheable and non-cacheable.
        L2_CACHE_ACCESS_FORCE_CC: u1,
        /// Set this bit to force the request to l2 cache with write-back attribute, otherwise, the attribute is propagated from L1 cache or CPU, it could be one of write-back and write-through.
        L2_CACHE_ACCESS_FORCE_WB: u1,
        /// Set this bit to force the request to l2 cache with write-miss-allocate attribute, otherwise, the attribute is propagated from L1 cache or CPU, it could be one of write-miss-allocate and write-miss-no-allocate.
        L2_CACHE_ACCESS_FORCE_WMA: u1,
        /// Set this bit to force the request to l2 cache with read-miss-allocate attribute, otherwise, the attribute is propagated from L1 cache or CPU, it could be one of read-miss-allocate and read-miss-no-allocate.
        L2_CACHE_ACCESS_FORCE_RMA: u1,
        padding: u28 = 0,
    }),
    /// Cache Tag and Data memory Object control register
    /// offset: 0x3c0
    L2_CACHE_OBJECT_CTRL: mmio.Mmio(packed struct(u32) {
        reserved5: u5 = 0,
        /// Set this bit to set L2-Cache tag memory as object. This bit should be onehot with the others fields inside this register.
        L2_CACHE_TAG_OBJECT: u1,
        reserved11: u5 = 0,
        /// Set this bit to set L2-Cache data memory as object. This bit should be onehot with the others fields inside this register.
        L2_CACHE_MEM_OBJECT: u1,
        padding: u20 = 0,
    }),
    /// Cache Tag and Data memory way register
    /// offset: 0x3c4
    L2_CACHE_WAY_OBJECT: mmio.Mmio(packed struct(u32) {
        /// Set this bits to select which way of the tag-object will be accessed. 0: way0, 1: way1, 2: way2, 3: way3, ?, 7: way7.
        L2_CACHE_WAY_OBJECT: u3,
        padding: u29 = 0,
    }),
    /// Cache Vaddr register
    /// offset: 0x3c8
    L2_CACHE_VADDR: mmio.Mmio(packed struct(u32) {
        /// Those bits stores the virtual address which will decide where inside the specified tag memory object will be accessed.
        L2_CACHE_VADDR: u32,
    }),
    /// Cache Tag/data memory content register
    /// offset: 0x3cc
    L2_CACHE_DEBUG_BUS: mmio.Mmio(packed struct(u32) {
        /// This is a constant place where we can write data to or read data from the tag/data memory on the specified cache.
        L2_CACHE_DEBUG_BUS: u32,
    }),
    /// USED TO SPLIT L1 CACHE AND L2 CACHE
    /// offset: 0x3d0
    LEVEL_SPLIT1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        LEVEL_SPLIT1: u32,
    }),
    /// Clock gate control register
    /// offset: 0x3d4
    CLOCK_GATE: mmio.Mmio(packed struct(u32) {
        /// The bit is used to enable clock gate when access all registers in this module.
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// Cache redundancy signal 0 register
    /// offset: 0x3d8
    REDUNDANCY_SIG0: mmio.Mmio(packed struct(u32) {
        /// Those bits are prepared for ECO.
        REDCY_SIG0: u32,
    }),
    /// Cache redundancy signal 1 register
    /// offset: 0x3dc
    REDUNDANCY_SIG1: mmio.Mmio(packed struct(u32) {
        /// Those bits are prepared for ECO.
        REDCY_SIG1: u32,
    }),
    /// Cache redundancy signal 2 register
    /// offset: 0x3e0
    REDUNDANCY_SIG2: mmio.Mmio(packed struct(u32) {
        /// Those bits are prepared for ECO.
        REDCY_SIG2: u32,
    }),
    /// Cache redundancy signal 3 register
    /// offset: 0x3e4
    REDUNDANCY_SIG3: mmio.Mmio(packed struct(u32) {
        /// Those bits are prepared for ECO.
        REDCY_SIG3: u32,
    }),
    /// Cache redundancy signal 0 register
    /// offset: 0x3e8
    REDUNDANCY_SIG4: mmio.Mmio(packed struct(u32) {
        /// Those bits are prepared for ECO.
        REDCY_SIG4: u4,
        padding: u28 = 0,
    }),
    /// offset: 0x3ec
    reserved1004: [16]u8,
    /// Version control register
    /// offset: 0x3fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// version control register. Note that this default value stored is the latest date when the hardware logic was updated.
        DATE: u28,
        padding: u4 = 0,
    }),
};
