const mmio = @import("mmio");
const types = @import("../../types.zig");

/// eFuse Controller
pub const EFUSE = extern struct {
    /// Register 0 that stores data to be programmed.
    /// offset: 0x00
    PGM_DATA0: mmio.Mmio(packed struct(u32) {
        /// Configures the 0th 32-bit data to be programmed.
        PGM_DATA_0: u32,
    }),
    /// Register 1 that stores data to be programmed.
    /// offset: 0x04
    PGM_DATA1: mmio.Mmio(packed struct(u32) {
        /// Configures the 1st 32-bit data to be programmed.
        PGM_DATA_1: u32,
    }),
    /// Register 2 that stores data to be programmed.
    /// offset: 0x08
    PGM_DATA2: mmio.Mmio(packed struct(u32) {
        /// Configures the 2nd 32-bit data to be programmed.
        PGM_DATA_2: u32,
    }),
    /// Register 3 that stores data to be programmed.
    /// offset: 0x0c
    PGM_DATA3: mmio.Mmio(packed struct(u32) {
        /// Configures the 3rd 32-bit data to be programmed.
        PGM_DATA_3: u32,
    }),
    /// Register 4 that stores data to be programmed.
    /// offset: 0x10
    PGM_DATA4: mmio.Mmio(packed struct(u32) {
        /// Configures the 4th 32-bit data to be programmed.
        PGM_DATA_4: u32,
    }),
    /// Register 5 that stores data to be programmed.
    /// offset: 0x14
    PGM_DATA5: mmio.Mmio(packed struct(u32) {
        /// Configures the 5th 32-bit data to be programmed.
        PGM_DATA_5: u32,
    }),
    /// Register 6 that stores data to be programmed.
    /// offset: 0x18
    PGM_DATA6: mmio.Mmio(packed struct(u32) {
        /// Configures the 6th 32-bit data to be programmed.
        PGM_DATA_6: u32,
    }),
    /// Register 7 that stores data to be programmed.
    /// offset: 0x1c
    PGM_DATA7: mmio.Mmio(packed struct(u32) {
        /// Configures the 7th 32-bit data to be programmed.
        PGM_DATA_7: u32,
    }),
    /// Register 0 that stores the RS code to be programmed.
    /// offset: 0x20
    PGM_CHECK_VALUE0: mmio.Mmio(packed struct(u32) {
        /// Configures the 0th 32-bit RS code to be programmed.
        PGM_RS_DATA_0: u32,
    }),
    /// Register 1 that stores the RS code to be programmed.
    /// offset: 0x24
    PGM_CHECK_VALUE1: mmio.Mmio(packed struct(u32) {
        /// Configures the 1st 32-bit RS code to be programmed.
        PGM_RS_DATA_1: u32,
    }),
    /// Register 2 that stores the RS code to be programmed.
    /// offset: 0x28
    PGM_CHECK_VALUE2: mmio.Mmio(packed struct(u32) {
        /// Configures the 2nd 32-bit RS code to be programmed.
        PGM_RS_DATA_2: u32,
    }),
    /// BLOCK0 data register 0.
    /// offset: 0x2c
    RD_WR_DIS: mmio.Mmio(packed struct(u32) {
        /// Represents whether programming of individual eFuse memory bit is disabled or enabled. 1: Disabled. 0 Enabled.
        WR_DIS: u32,
    }),
    /// BLOCK0 data register 1.
    /// offset: 0x30
    RD_REPEAT_DATA0: mmio.Mmio(packed struct(u32) {
        /// Represents whether reading of individual eFuse block(block4~block10) is disabled or enabled. 1: disabled. 0: enabled.
        RD_DIS: u7,
        /// Enable usb device exchange pins of D+ and D-.
        USB_DEVICE_EXCHG_PINS: u1,
        /// Enable usb otg11 exchange pins of D+ and D-.
        USB_OTG11_EXCHG_PINS: u1,
        /// Represents whether the function of usb switch to jtag is disabled or enabled. 1: disabled. 0: enabled.
        DIS_USB_JTAG: u1,
        /// Represents whether power glitch function is enabled. 1: enabled. 0: disabled.
        POWERGLITCH_EN: u1,
        /// Represents whether USB-Serial-JTAG is disabled or enabled. 1: disabled. 0: enabled.
        DIS_USB_SERIAL_JTAG: u1,
        /// Represents whether the function that forces chip into download mode is disabled or enabled. 1: disabled. 0: enabled.
        DIS_FORCE_DOWNLOAD: u1,
        /// Set this bit to disable accessing MSPI flash/MSPI ram by SYS AXI matrix during boot_mode_download.
        SPI_DOWNLOAD_MSPI_DIS: u1,
        /// Represents whether TWAI function is disabled or enabled. 1: disabled. 0: enabled.
        DIS_TWAI: u1,
        /// Represents whether the selection between usb_to_jtag and pad_to_jtag through strapping gpio15 when both EFUSE_DIS_PAD_JTAG and EFUSE_DIS_USB_JTAG are equal to 0 is enabled or disabled. 1: enabled. 0: disabled.
        JTAG_SEL_ENABLE: u1,
        /// Represents whether JTAG is disabled in soft way. Odd number: disabled. Even number: enabled.
        SOFT_DIS_JTAG: u3,
        /// Represents whether JTAG is disabled in the hard way(permanently). 1: disabled. 0: enabled.
        DIS_PAD_JTAG: u1,
        /// Represents whether flash encrypt function is disabled or enabled(except in SPI boot mode). 1: disabled. 0: enabled.
        DIS_DOWNLOAD_MANUAL_ENCRYPT: u1,
        /// USB intphy of usb device signle-end input high threshold, 1.76V to 2V. Step by 80mV
        USB_DEVICE_DREFH: u2,
        /// USB intphy of usb otg11 signle-end input high threshold, 1.76V to 2V. Step by 80mV
        USB_OTG11_DREFH: u2,
        /// TBD
        USB_PHY_SEL: u1,
        /// Set this bit to control validation of HUK generate mode. Odd of 1 is invalid, even of 1 is valid.
        KM_HUK_GEN_STATE_LOW: u6,
    }),
    /// BLOCK0 data register 2.
    /// offset: 0x34
    RD_REPEAT_DATA1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to control validation of HUK generate mode. Odd of 1 is invalid, even of 1 is valid.
        KM_HUK_GEN_STATE_HIGH: u3,
        /// Set bits to control key manager random number switch cycle. 0: control by register. 1: 8 km clk cycles. 2: 16 km cycles. 3: 32 km cycles.
        KM_RND_SWITCH_CYCLE: u2,
        /// Set each bit to control whether corresponding key can only be deployed once. 1 is true, 0 is false. Bit0: ecdsa. Bit1: xts. Bit2: hmac. Bit3: ds.
        KM_DEPLOY_ONLY_ONCE: u4,
        /// Set each bit to control whether corresponding key must come from key manager.. 1 is true, 0 is false. Bit0: ecdsa. Bit1: xts. Bit2: hmac. Bit3: ds.
        FORCE_USE_KEY_MANAGER_KEY: u4,
        /// Set this bit to disable software written init key, and force use efuse_init_key.
        FORCE_DISABLE_SW_INIT_KEY: u1,
        /// Set this bit to configure flash encryption use xts-128 key, else use xts-256 key.
        XTS_KEY_LENGTH_256: u1,
        reserved16: u1 = 0,
        /// Represents whether RTC watchdog timeout threshold is selected at startup. 1: selected. 0: not selected.
        WDT_DELAY_SEL: u2,
        /// Represents whether SPI boot encrypt/decrypt is disabled or enabled. Odd number of 1: enabled. Even number of 1: disabled.
        SPI_BOOT_CRYPT_CNT: u3,
        /// Represents whether revoking first secure boot key is enabled or disabled. 1: enabled. 0: disabled.
        SECURE_BOOT_KEY_REVOKE0: u1,
        /// Represents whether revoking second secure boot key is enabled or disabled. 1: enabled. 0: disabled.
        SECURE_BOOT_KEY_REVOKE1: u1,
        /// Represents whether revoking third secure boot key is enabled or disabled. 1: enabled. 0: disabled.
        SECURE_BOOT_KEY_REVOKE2: u1,
        /// Represents the purpose of Key0.
        KEY_PURPOSE_0: u4,
        /// Represents the purpose of Key1.
        KEY_PURPOSE_1: u4,
    }),
    /// BLOCK0 data register 3.
    /// offset: 0x38
    RD_REPEAT_DATA2: mmio.Mmio(packed struct(u32) {
        /// Represents the purpose of Key2.
        KEY_PURPOSE_2: u4,
        /// Represents the purpose of Key3.
        KEY_PURPOSE_3: u4,
        /// Represents the purpose of Key4.
        KEY_PURPOSE_4: u4,
        /// Represents the purpose of Key5.
        KEY_PURPOSE_5: u4,
        /// Represents the spa secure level by configuring the clock random divide mode.
        SEC_DPA_LEVEL: u2,
        /// Represents whether hardware random number k is forced used in ESDCA. 1: force used. 0: not force used.
        ECDSA_ENABLE_SOFT_K: u1,
        /// Represents whether anti-dpa attack is enabled. 1:enabled. 0: disabled.
        CRYPT_DPA_ENABLE: u1,
        /// Represents whether secure boot is enabled or disabled. 1: enabled. 0: disabled.
        SECURE_BOOT_EN: u1,
        /// Represents whether revoking aggressive secure boot is enabled or disabled. 1: enabled. 0: disabled.
        SECURE_BOOT_AGGRESSIVE_REVOKE: u1,
        reserved23: u1 = 0,
        /// The type of interfaced flash. 0: four data lines, 1: eight data lines.
        FLASH_TYPE: u1,
        /// Set flash page size.
        FLASH_PAGE_SIZE: u2,
        /// Set this bit to enable ecc for flash boot.
        FLASH_ECC_EN: u1,
        /// Set this bit to disable download via USB-OTG.
        DIS_USB_OTG_DOWNLOAD_MODE: u1,
        /// Represents the flash waiting time after power-up, in unit of ms. When the value less than 15, the waiting time is the programmed value. Otherwise, the waiting time is 2 times the programmed value.
        FLASH_TPUW: u4,
    }),
    /// BLOCK0 data register 4.
    /// offset: 0x3c
    RD_REPEAT_DATA3: mmio.Mmio(packed struct(u32) {
        /// Represents whether Download mode is disabled or enabled. 1: disabled. 0: enabled.
        DIS_DOWNLOAD_MODE: u1,
        /// Represents whether direct boot mode is disabled or enabled. 1: disabled. 0: enabled.
        DIS_DIRECT_BOOT: u1,
        /// Represents whether print from USB-Serial-JTAG is disabled or enabled. 1: disabled. 0: enabled.
        DIS_USB_SERIAL_JTAG_ROM_PRINT: u1,
        /// TBD
        LOCK_KM_KEY: u1,
        /// Represents whether the USB-Serial-JTAG download function is disabled or enabled. 1: disabled. 0: enabled.
        DIS_USB_SERIAL_JTAG_DOWNLOAD_MODE: u1,
        /// Represents whether security download is enabled or disabled. 1: enabled. 0: disabled.
        ENABLE_SECURITY_DOWNLOAD: u1,
        /// Represents the type of UART printing. 00: force enable printing. 01: enable printing when GPIO8 is reset at low level. 10: enable printing when GPIO8 is reset at high level. 11: force disable printing.
        UART_PRINT_CONTROL: u2,
        /// Represents whether ROM code is forced to send a resume command during SPI boot. 1: forced. 0:not forced.
        FORCE_SEND_RESUME: u1,
        /// Represents the version used by ESP-IDF anti-rollback feature.
        SECURE_VERSION: u16,
        /// Represents whether FAST VERIFY ON WAKE is disabled or enabled when Secure Boot is enabled. 1: disabled. 0: enabled.
        SECURE_BOOT_DISABLE_FAST_WAKE: u1,
        /// Represents whether the hysteresis function of corresponding PAD is enabled. 1: enabled. 0:disabled.
        HYS_EN_PAD: u1,
        /// Set the dcdc voltage default.
        DCDC_VSET: u5,
    }),
    /// BLOCK0 data register 5.
    /// offset: 0x40
    RD_REPEAT_DATA4: mmio.Mmio(packed struct(u32) {
        /// TBD
        _0PXA_TIEH_SEL_0: u2,
        /// TBD.
        _0PXA_TIEH_SEL_1: u2,
        /// TBD.
        _0PXA_TIEH_SEL_2: u2,
        /// TBD.
        _0PXA_TIEH_SEL_3: u2,
        /// TBD.
        KM_DISABLE_DEPLOY_MODE: u4,
        /// Represents the usb device single-end input low threhold, 0.8 V to 1.04 V with step of 80 mV.
        USB_DEVICE_DREFL: u2,
        /// Represents the usb otg11 single-end input low threhold, 0.8 V to 1.04 V with step of 80 mV.
        USB_OTG11_DREFL: u2,
        reserved18: u2 = 0,
        /// HP system power source select. 0:LDO. 1: DCDC.
        HP_PWR_SRC_SEL: u1,
        /// Select dcdc vset use efuse_dcdc_vset.
        DCDC_VSET_EN: u1,
        /// Set this bit to disable watch dog.
        DIS_WDT: u1,
        /// Set this bit to disable super-watchdog.
        DIS_SWD: u1,
        padding: u10 = 0,
    }),
    /// BLOCK1 data register $n.
    /// offset: 0x44
    RD_MAC_SYS_0: mmio.Mmio(packed struct(u32) {
        /// Stores the low 32 bits of MAC address.
        MAC_0: u32,
    }),
    /// BLOCK1 data register $n.
    /// offset: 0x48
    RD_MAC_SYS_1: mmio.Mmio(packed struct(u32) {
        /// Stores the high 16 bits of MAC address.
        MAC_1: u16,
        /// Stores the extended bits of MAC address.
        MAC_EXT: u16,
    }),
    /// BLOCK1 data register $n.
    /// offset: 0x4c
    RD_MAC_SYS_2: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        MAC_RESERVED_1: u14,
        /// Reserved.
        MAC_RESERVED_0: u18,
    }),
    /// BLOCK1 data register $n.
    /// offset: 0x50
    RD_MAC_SYS_3: mmio.Mmio(packed struct(u32) {
        /// Reserved.
        MAC_RESERVED_2: u18,
        /// Stores the first 14 bits of the zeroth part of system data.
        SYS_DATA_PART0_0: u14,
    }),
    /// BLOCK1 data register $n.
    /// offset: 0x54
    RD_MAC_SYS_4: mmio.Mmio(packed struct(u32) {
        /// Stores the first 32 bits of the zeroth part of system data.
        SYS_DATA_PART0_1: u32,
    }),
    /// BLOCK1 data register $n.
    /// offset: 0x58
    RD_MAC_SYS_5: mmio.Mmio(packed struct(u32) {
        /// Stores the second 32 bits of the zeroth part of system data.
        SYS_DATA_PART0_2: u32,
    }),
    /// Register $n of BLOCK2 (system).
    /// offset: 0x5c
    RD_SYS_PART1_DATA0: mmio.Mmio(packed struct(u32) {
        /// Stores the zeroth 32 bits of the first part of system data.
        SYS_DATA_PART1_0: u32,
    }),
    /// Register $n of BLOCK2 (system).
    /// offset: 0x60
    RD_SYS_PART1_DATA1: mmio.Mmio(packed struct(u32) {
        /// Stores the first 32 bits of the first part of system data.
        SYS_DATA_PART1_1: u32,
    }),
    /// Register $n of BLOCK2 (system).
    /// offset: 0x64
    RD_SYS_PART1_DATA2: mmio.Mmio(packed struct(u32) {
        /// Stores the second 32 bits of the first part of system data.
        SYS_DATA_PART1_2: u32,
    }),
    /// Register $n of BLOCK2 (system).
    /// offset: 0x68
    RD_SYS_PART1_DATA3: mmio.Mmio(packed struct(u32) {
        /// Stores the third 32 bits of the first part of system data.
        SYS_DATA_PART1_3: u32,
    }),
    /// Register $n of BLOCK2 (system).
    /// offset: 0x6c
    RD_SYS_PART1_DATA4: mmio.Mmio(packed struct(u32) {
        /// Stores the fourth 32 bits of the first part of system data.
        SYS_DATA_PART1_4: u32,
    }),
    /// Register $n of BLOCK2 (system).
    /// offset: 0x70
    RD_SYS_PART1_DATA5: mmio.Mmio(packed struct(u32) {
        /// Stores the fifth 32 bits of the first part of system data.
        SYS_DATA_PART1_5: u32,
    }),
    /// Register $n of BLOCK2 (system).
    /// offset: 0x74
    RD_SYS_PART1_DATA6: mmio.Mmio(packed struct(u32) {
        /// Stores the sixth 32 bits of the first part of system data.
        SYS_DATA_PART1_6: u32,
    }),
    /// Register $n of BLOCK2 (system).
    /// offset: 0x78
    RD_SYS_PART1_DATA7: mmio.Mmio(packed struct(u32) {
        /// Stores the seventh 32 bits of the first part of system data.
        SYS_DATA_PART1_7: u32,
    }),
    /// Register $n of BLOCK3 (user).
    /// offset: 0x7c
    RD_USR_DATA0: mmio.Mmio(packed struct(u32) {
        /// Stores the zeroth 32 bits of BLOCK3 (user).
        USR_DATA0: u32,
    }),
    /// Register $n of BLOCK3 (user).
    /// offset: 0x80
    RD_USR_DATA1: mmio.Mmio(packed struct(u32) {
        /// Stores the first 32 bits of BLOCK3 (user).
        USR_DATA1: u32,
    }),
    /// Register $n of BLOCK3 (user).
    /// offset: 0x84
    RD_USR_DATA2: mmio.Mmio(packed struct(u32) {
        /// Stores the second 32 bits of BLOCK3 (user).
        USR_DATA2: u32,
    }),
    /// Register $n of BLOCK3 (user).
    /// offset: 0x88
    RD_USR_DATA3: mmio.Mmio(packed struct(u32) {
        /// Stores the third 32 bits of BLOCK3 (user).
        USR_DATA3: u32,
    }),
    /// Register $n of BLOCK3 (user).
    /// offset: 0x8c
    RD_USR_DATA4: mmio.Mmio(packed struct(u32) {
        /// Stores the fourth 32 bits of BLOCK3 (user).
        USR_DATA4: u32,
    }),
    /// Register $n of BLOCK3 (user).
    /// offset: 0x90
    RD_USR_DATA5: mmio.Mmio(packed struct(u32) {
        /// Stores the fifth 32 bits of BLOCK3 (user).
        USR_DATA5: u32,
    }),
    /// Register $n of BLOCK3 (user).
    /// offset: 0x94
    RD_USR_DATA6: mmio.Mmio(packed struct(u32) {
        /// Stores the sixth 32 bits of BLOCK3 (user).
        USR_DATA6: u32,
    }),
    /// Register $n of BLOCK3 (user).
    /// offset: 0x98
    RD_USR_DATA7: mmio.Mmio(packed struct(u32) {
        /// Stores the seventh 32 bits of BLOCK3 (user).
        USR_DATA7: u32,
    }),
    /// Register $n of BLOCK4 (KEY0).
    /// offset: 0x9c
    RD_KEY0_DATA0: mmio.Mmio(packed struct(u32) {
        /// Stores the zeroth 32 bits of KEY0.
        KEY0_DATA0: u32,
    }),
    /// Register $n of BLOCK4 (KEY0).
    /// offset: 0xa0
    RD_KEY0_DATA1: mmio.Mmio(packed struct(u32) {
        /// Stores the first 32 bits of KEY0.
        KEY0_DATA1: u32,
    }),
    /// Register $n of BLOCK4 (KEY0).
    /// offset: 0xa4
    RD_KEY0_DATA2: mmio.Mmio(packed struct(u32) {
        /// Stores the second 32 bits of KEY0.
        KEY0_DATA2: u32,
    }),
    /// Register $n of BLOCK4 (KEY0).
    /// offset: 0xa8
    RD_KEY0_DATA3: mmio.Mmio(packed struct(u32) {
        /// Stores the third 32 bits of KEY0.
        KEY0_DATA3: u32,
    }),
    /// Register $n of BLOCK4 (KEY0).
    /// offset: 0xac
    RD_KEY0_DATA4: mmio.Mmio(packed struct(u32) {
        /// Stores the fourth 32 bits of KEY0.
        KEY0_DATA4: u32,
    }),
    /// Register $n of BLOCK4 (KEY0).
    /// offset: 0xb0
    RD_KEY0_DATA5: mmio.Mmio(packed struct(u32) {
        /// Stores the fifth 32 bits of KEY0.
        KEY0_DATA5: u32,
    }),
    /// Register $n of BLOCK4 (KEY0).
    /// offset: 0xb4
    RD_KEY0_DATA6: mmio.Mmio(packed struct(u32) {
        /// Stores the sixth 32 bits of KEY0.
        KEY0_DATA6: u32,
    }),
    /// Register $n of BLOCK4 (KEY0).
    /// offset: 0xb8
    RD_KEY0_DATA7: mmio.Mmio(packed struct(u32) {
        /// Stores the seventh 32 bits of KEY0.
        KEY0_DATA7: u32,
    }),
    /// Register $n of BLOCK5 (KEY1).
    /// offset: 0xbc
    RD_KEY1_DATA0: mmio.Mmio(packed struct(u32) {
        /// Stores the zeroth 32 bits of KEY1.
        KEY1_DATA0: u32,
    }),
    /// Register $n of BLOCK5 (KEY1).
    /// offset: 0xc0
    RD_KEY1_DATA1: mmio.Mmio(packed struct(u32) {
        /// Stores the first 32 bits of KEY1.
        KEY1_DATA1: u32,
    }),
    /// Register $n of BLOCK5 (KEY1).
    /// offset: 0xc4
    RD_KEY1_DATA2: mmio.Mmio(packed struct(u32) {
        /// Stores the second 32 bits of KEY1.
        KEY1_DATA2: u32,
    }),
    /// Register $n of BLOCK5 (KEY1).
    /// offset: 0xc8
    RD_KEY1_DATA3: mmio.Mmio(packed struct(u32) {
        /// Stores the third 32 bits of KEY1.
        KEY1_DATA3: u32,
    }),
    /// Register $n of BLOCK5 (KEY1).
    /// offset: 0xcc
    RD_KEY1_DATA4: mmio.Mmio(packed struct(u32) {
        /// Stores the fourth 32 bits of KEY1.
        KEY1_DATA4: u32,
    }),
    /// Register $n of BLOCK5 (KEY1).
    /// offset: 0xd0
    RD_KEY1_DATA5: mmio.Mmio(packed struct(u32) {
        /// Stores the fifth 32 bits of KEY1.
        KEY1_DATA5: u32,
    }),
    /// Register $n of BLOCK5 (KEY1).
    /// offset: 0xd4
    RD_KEY1_DATA6: mmio.Mmio(packed struct(u32) {
        /// Stores the sixth 32 bits of KEY1.
        KEY1_DATA6: u32,
    }),
    /// Register $n of BLOCK5 (KEY1).
    /// offset: 0xd8
    RD_KEY1_DATA7: mmio.Mmio(packed struct(u32) {
        /// Stores the seventh 32 bits of KEY1.
        KEY1_DATA7: u32,
    }),
    /// Register $n of BLOCK6 (KEY2).
    /// offset: 0xdc
    RD_KEY2_DATA0: mmio.Mmio(packed struct(u32) {
        /// Stores the zeroth 32 bits of KEY2.
        KEY2_DATA0: u32,
    }),
    /// Register $n of BLOCK6 (KEY2).
    /// offset: 0xe0
    RD_KEY2_DATA1: mmio.Mmio(packed struct(u32) {
        /// Stores the first 32 bits of KEY2.
        KEY2_DATA1: u32,
    }),
    /// Register $n of BLOCK6 (KEY2).
    /// offset: 0xe4
    RD_KEY2_DATA2: mmio.Mmio(packed struct(u32) {
        /// Stores the second 32 bits of KEY2.
        KEY2_DATA2: u32,
    }),
    /// Register $n of BLOCK6 (KEY2).
    /// offset: 0xe8
    RD_KEY2_DATA3: mmio.Mmio(packed struct(u32) {
        /// Stores the third 32 bits of KEY2.
        KEY2_DATA3: u32,
    }),
    /// Register $n of BLOCK6 (KEY2).
    /// offset: 0xec
    RD_KEY2_DATA4: mmio.Mmio(packed struct(u32) {
        /// Stores the fourth 32 bits of KEY2.
        KEY2_DATA4: u32,
    }),
    /// Register $n of BLOCK6 (KEY2).
    /// offset: 0xf0
    RD_KEY2_DATA5: mmio.Mmio(packed struct(u32) {
        /// Stores the fifth 32 bits of KEY2.
        KEY2_DATA5: u32,
    }),
    /// Register $n of BLOCK6 (KEY2).
    /// offset: 0xf4
    RD_KEY2_DATA6: mmio.Mmio(packed struct(u32) {
        /// Stores the sixth 32 bits of KEY2.
        KEY2_DATA6: u32,
    }),
    /// Register $n of BLOCK6 (KEY2).
    /// offset: 0xf8
    RD_KEY2_DATA7: mmio.Mmio(packed struct(u32) {
        /// Stores the seventh 32 bits of KEY2.
        KEY2_DATA7: u32,
    }),
    /// Register $n of BLOCK7 (KEY3).
    /// offset: 0xfc
    RD_KEY3_DATA0: mmio.Mmio(packed struct(u32) {
        /// Stores the zeroth 32 bits of KEY3.
        KEY3_DATA0: u32,
    }),
    /// Register $n of BLOCK7 (KEY3).
    /// offset: 0x100
    RD_KEY3_DATA1: mmio.Mmio(packed struct(u32) {
        /// Stores the first 32 bits of KEY3.
        KEY3_DATA1: u32,
    }),
    /// Register $n of BLOCK7 (KEY3).
    /// offset: 0x104
    RD_KEY3_DATA2: mmio.Mmio(packed struct(u32) {
        /// Stores the second 32 bits of KEY3.
        KEY3_DATA2: u32,
    }),
    /// Register $n of BLOCK7 (KEY3).
    /// offset: 0x108
    RD_KEY3_DATA3: mmio.Mmio(packed struct(u32) {
        /// Stores the third 32 bits of KEY3.
        KEY3_DATA3: u32,
    }),
    /// Register $n of BLOCK7 (KEY3).
    /// offset: 0x10c
    RD_KEY3_DATA4: mmio.Mmio(packed struct(u32) {
        /// Stores the fourth 32 bits of KEY3.
        KEY3_DATA4: u32,
    }),
    /// Register $n of BLOCK7 (KEY3).
    /// offset: 0x110
    RD_KEY3_DATA5: mmio.Mmio(packed struct(u32) {
        /// Stores the fifth 32 bits of KEY3.
        KEY3_DATA5: u32,
    }),
    /// Register $n of BLOCK7 (KEY3).
    /// offset: 0x114
    RD_KEY3_DATA6: mmio.Mmio(packed struct(u32) {
        /// Stores the sixth 32 bits of KEY3.
        KEY3_DATA6: u32,
    }),
    /// Register $n of BLOCK7 (KEY3).
    /// offset: 0x118
    RD_KEY3_DATA7: mmio.Mmio(packed struct(u32) {
        /// Stores the seventh 32 bits of KEY3.
        KEY3_DATA7: u32,
    }),
    /// Register $n of BLOCK8 (KEY4).
    /// offset: 0x11c
    RD_KEY4_DATA0: mmio.Mmio(packed struct(u32) {
        /// Stores the zeroth 32 bits of KEY4.
        KEY4_DATA0: u32,
    }),
    /// Register $n of BLOCK8 (KEY4).
    /// offset: 0x120
    RD_KEY4_DATA1: mmio.Mmio(packed struct(u32) {
        /// Stores the first 32 bits of KEY4.
        KEY4_DATA1: u32,
    }),
    /// Register $n of BLOCK8 (KEY4).
    /// offset: 0x124
    RD_KEY4_DATA2: mmio.Mmio(packed struct(u32) {
        /// Stores the second 32 bits of KEY4.
        KEY4_DATA2: u32,
    }),
    /// Register $n of BLOCK8 (KEY4).
    /// offset: 0x128
    RD_KEY4_DATA3: mmio.Mmio(packed struct(u32) {
        /// Stores the third 32 bits of KEY4.
        KEY4_DATA3: u32,
    }),
    /// Register $n of BLOCK8 (KEY4).
    /// offset: 0x12c
    RD_KEY4_DATA4: mmio.Mmio(packed struct(u32) {
        /// Stores the fourth 32 bits of KEY4.
        KEY4_DATA4: u32,
    }),
    /// Register $n of BLOCK8 (KEY4).
    /// offset: 0x130
    RD_KEY4_DATA5: mmio.Mmio(packed struct(u32) {
        /// Stores the fifth 32 bits of KEY4.
        KEY4_DATA5: u32,
    }),
    /// Register $n of BLOCK8 (KEY4).
    /// offset: 0x134
    RD_KEY4_DATA6: mmio.Mmio(packed struct(u32) {
        /// Stores the sixth 32 bits of KEY4.
        KEY4_DATA6: u32,
    }),
    /// Register $n of BLOCK8 (KEY4).
    /// offset: 0x138
    RD_KEY4_DATA7: mmio.Mmio(packed struct(u32) {
        /// Stores the seventh 32 bits of KEY4.
        KEY4_DATA7: u32,
    }),
    /// Register $n of BLOCK9 (KEY5).
    /// offset: 0x13c
    RD_KEY5_DATA0: mmio.Mmio(packed struct(u32) {
        /// Stores the zeroth 32 bits of KEY5.
        KEY5_DATA0: u32,
    }),
    /// Register $n of BLOCK9 (KEY5).
    /// offset: 0x140
    RD_KEY5_DATA1: mmio.Mmio(packed struct(u32) {
        /// Stores the first 32 bits of KEY5.
        KEY5_DATA1: u32,
    }),
    /// Register $n of BLOCK9 (KEY5).
    /// offset: 0x144
    RD_KEY5_DATA2: mmio.Mmio(packed struct(u32) {
        /// Stores the second 32 bits of KEY5.
        KEY5_DATA2: u32,
    }),
    /// Register $n of BLOCK9 (KEY5).
    /// offset: 0x148
    RD_KEY5_DATA3: mmio.Mmio(packed struct(u32) {
        /// Stores the third 32 bits of KEY5.
        KEY5_DATA3: u32,
    }),
    /// Register $n of BLOCK9 (KEY5).
    /// offset: 0x14c
    RD_KEY5_DATA4: mmio.Mmio(packed struct(u32) {
        /// Stores the fourth 32 bits of KEY5.
        KEY5_DATA4: u32,
    }),
    /// Register $n of BLOCK9 (KEY5).
    /// offset: 0x150
    RD_KEY5_DATA5: mmio.Mmio(packed struct(u32) {
        /// Stores the fifth 32 bits of KEY5.
        KEY5_DATA5: u32,
    }),
    /// Register $n of BLOCK9 (KEY5).
    /// offset: 0x154
    RD_KEY5_DATA6: mmio.Mmio(packed struct(u32) {
        /// Stores the sixth 32 bits of KEY5.
        KEY5_DATA6: u32,
    }),
    /// Register $n of BLOCK9 (KEY5).
    /// offset: 0x158
    RD_KEY5_DATA7: mmio.Mmio(packed struct(u32) {
        /// Stores the seventh 32 bits of KEY5.
        KEY5_DATA7: u32,
    }),
    /// Register $n of BLOCK10 (system).
    /// offset: 0x15c
    RD_SYS_PART2_DATA0: mmio.Mmio(packed struct(u32) {
        /// Stores the 0th 32 bits of the 2nd part of system data.
        SYS_DATA_PART2_0: u32,
    }),
    /// Register $n of BLOCK9 (KEY5).
    /// offset: 0x160
    RD_SYS_PART2_DATA1: mmio.Mmio(packed struct(u32) {
        /// Stores the 0th 32 bits of the 2nd part of system data.
        SYS_DATA_PART2_1: u32,
    }),
    /// Register $n of BLOCK10 (system).
    /// offset: 0x164
    RD_SYS_PART2_DATA2: mmio.Mmio(packed struct(u32) {
        /// Stores the 0th 32 bits of the 2nd part of system data.
        SYS_DATA_PART2_2: u32,
    }),
    /// Register $n of BLOCK10 (system).
    /// offset: 0x168
    RD_SYS_PART2_DATA3: mmio.Mmio(packed struct(u32) {
        /// Stores the 0th 32 bits of the 2nd part of system data.
        SYS_DATA_PART2_3: u32,
    }),
    /// Register $n of BLOCK10 (system).
    /// offset: 0x16c
    RD_SYS_PART2_DATA4: mmio.Mmio(packed struct(u32) {
        /// Stores the 0th 32 bits of the 2nd part of system data.
        SYS_DATA_PART2_4: u32,
    }),
    /// Register $n of BLOCK10 (system).
    /// offset: 0x170
    RD_SYS_PART2_DATA5: mmio.Mmio(packed struct(u32) {
        /// Stores the 0th 32 bits of the 2nd part of system data.
        SYS_DATA_PART2_5: u32,
    }),
    /// Register $n of BLOCK10 (system).
    /// offset: 0x174
    RD_SYS_PART2_DATA6: mmio.Mmio(packed struct(u32) {
        /// Stores the 0th 32 bits of the 2nd part of system data.
        SYS_DATA_PART2_6: u32,
    }),
    /// Register $n of BLOCK10 (system).
    /// offset: 0x178
    RD_SYS_PART2_DATA7: mmio.Mmio(packed struct(u32) {
        /// Stores the 0th 32 bits of the 2nd part of system data.
        SYS_DATA_PART2_7: u32,
    }),
    /// Programming error record register 0 of BLOCK0.
    /// offset: 0x17c
    RD_REPEAT_ERR0: mmio.Mmio(packed struct(u32) {
        /// Indicates a programming error of RD_DIS.
        RD_DIS_ERR: u7,
        /// Indicates a programming error of DIS_USB_DEVICE_EXCHG_PINS.
        DIS_USB_DEVICE_EXCHG_PINS_ERR: u1,
        /// Indicates a programming error of DIS_USB_OTG11_EXCHG_PINS.
        DIS_USB_OTG11_EXCHG_PINS_ERR: u1,
        /// Indicates a programming error of DIS_USB_JTAG.
        DIS_USB_JTAG_ERR: u1,
        /// Indicates a programming error of POWERGLITCH_EN.
        POWERGLITCH_EN_ERR: u1,
        /// Indicates a programming error of DIS_USB_SERIAL_JTAG.
        DIS_USB_SERIAL_JTAG_ERR: u1,
        /// Indicates a programming error of DIS_FORCE_DOWNLOAD.
        DIS_FORCE_DOWNLOAD_ERR: u1,
        /// Indicates a programming error of SPI_DOWNLOAD_MSPI_DIS.
        SPI_DOWNLOAD_MSPI_DIS_ERR: u1,
        /// Indicates a programming error of DIS_TWAI.
        DIS_TWAI_ERR: u1,
        /// Indicates a programming error of JTAG_SEL_ENABLE.
        JTAG_SEL_ENABLE_ERR: u1,
        /// Indicates a programming error of SOFT_DIS_JTAG.
        SOFT_DIS_JTAG_ERR: u3,
        /// Indicates a programming error of DIS_PAD_JTAG.
        DIS_PAD_JTAG_ERR: u1,
        /// Indicates a programming error of DIS_DOWNLOAD_MANUAL_ENCRYPT.
        DIS_DOWNLOAD_MANUAL_ENCRYPT_ERR: u1,
        /// Indicates a programming error of USB_DEVICE_DREFH.
        USB_DEVICE_DREFH_ERR: u2,
        /// Indicates a programming error of USB_OTG11_DREFH.
        USB_OTG11_DREFH_ERR: u2,
        /// Indicates a programming error of USB_PHY_SEL.
        USB_PHY_SEL_ERR: u1,
        /// Indicates a programming error of HUK_GEN_STATE_LOW.
        HUK_GEN_STATE_LOW_ERR: u6,
    }),
    /// Programming error record register 1 of BLOCK0.
    /// offset: 0x180
    RD_REPEAT_ERR1: mmio.Mmio(packed struct(u32) {
        /// Indicates a programming error of HUK_GEN_STATE_HIGH.
        KM_HUK_GEN_STATE_HIGH_ERR: u3,
        /// Indicates a programming error of KM_RND_SWITCH_CYCLE.
        KM_RND_SWITCH_CYCLE_ERR: u2,
        /// Indicates a programming error of KM_DEPLOY_ONLY_ONCE.
        KM_DEPLOY_ONLY_ONCE_ERR: u4,
        /// Indicates a programming error of FORCE_USE_KEY_MANAGER_KEY.
        FORCE_USE_KEY_MANAGER_KEY_ERR: u4,
        /// Indicates a programming error of FORCE_DISABLE_SW_INIT_KEY.
        FORCE_DISABLE_SW_INIT_KEY_ERR: u1,
        /// Indicates a programming error of XTS_KEY_LENGTH_256.
        XTS_KEY_LENGTH_256_ERR: u1,
        reserved16: u1 = 0,
        /// Indicates a programming error of WDT_DELAY_SEL.
        WDT_DELAY_SEL_ERR: u2,
        /// Indicates a programming error of SPI_BOOT_CRYPT_CNT.
        SPI_BOOT_CRYPT_CNT_ERR: u3,
        /// Indicates a programming error of SECURE_BOOT_KEY_REVOKE0.
        SECURE_BOOT_KEY_REVOKE0_ERR: u1,
        /// Indicates a programming error of SECURE_BOOT_KEY_REVOKE1.
        SECURE_BOOT_KEY_REVOKE1_ERR: u1,
        /// Indicates a programming error of SECURE_BOOT_KEY_REVOKE2.
        SECURE_BOOT_KEY_REVOKE2_ERR: u1,
        /// Indicates a programming error of KEY_PURPOSE_0.
        KEY_PURPOSE_0_ERR: u4,
        /// Indicates a programming error of KEY_PURPOSE_1.
        KEY_PURPOSE_1_ERR: u4,
    }),
    /// Programming error record register 2 of BLOCK0.
    /// offset: 0x184
    RD_REPEAT_ERR2: mmio.Mmio(packed struct(u32) {
        /// Indicates a programming error of KEY_PURPOSE_2.
        KEY_PURPOSE_2_ERR: u4,
        /// Indicates a programming error of KEY_PURPOSE_3.
        KEY_PURPOSE_3_ERR: u4,
        /// Indicates a programming error of KEY_PURPOSE_4.
        KEY_PURPOSE_4_ERR: u4,
        /// Indicates a programming error of KEY_PURPOSE_5.
        KEY_PURPOSE_5_ERR: u4,
        /// Indicates a programming error of SEC_DPA_LEVEL.
        SEC_DPA_LEVEL_ERR: u2,
        /// Indicates a programming error of ECDSA_FORCE_USE_HARDWARE_K.
        ECDSA_ENABLE_SOFT_K_ERR: u1,
        /// Indicates a programming error of CRYPT_DPA_ENABLE.
        CRYPT_DPA_ENABLE_ERR: u1,
        /// Indicates a programming error of SECURE_BOOT_EN.
        SECURE_BOOT_EN_ERR: u1,
        /// Indicates a programming error of SECURE_BOOT_AGGRESSIVE_REVOKE.
        SECURE_BOOT_AGGRESSIVE_REVOKE_ERR: u1,
        reserved23: u1 = 0,
        /// Indicates a programming error of FLASH_TYPE.
        FLASH_TYPE_ERR: u1,
        /// Indicates a programming error of FLASH_PAGE_SIZE.
        FLASH_PAGE_SIZE_ERR: u2,
        /// Indicates a programming error of FLASH_ECC_EN.
        FLASH_ECC_EN_ERR: u1,
        /// Indicates a programming error of DIS_USB_OTG_DOWNLOAD_MODE.
        DIS_USB_OTG_DOWNLOAD_MODE_ERR: u1,
        /// Indicates a programming error of FLASH_TPUW.
        FLASH_TPUW_ERR: u4,
    }),
    /// Programming error record register 3 of BLOCK0.
    /// offset: 0x188
    RD_REPEAT_ERR3: mmio.Mmio(packed struct(u32) {
        /// Indicates a programming error of DIS_DOWNLOAD_MODE.
        DIS_DOWNLOAD_MODE_ERR: u1,
        /// Indicates a programming error of DIS_DIRECT_BOOT.
        DIS_DIRECT_BOOT_ERR: u1,
        /// Indicates a programming error of DIS_USB_SERIAL_JTAG_ROM_PRINT_ERR.
        DIS_USB_SERIAL_JTAG_ROM_PRINT_ERR: u1,
        /// TBD
        LOCK_KM_KEY_ERR: u1,
        /// Indicates a programming error of DIS_USB_SERIAL_JTAG_DOWNLOAD_MODE.
        DIS_USB_SERIAL_JTAG_DOWNLOAD_MODE_ERR: u1,
        /// Indicates a programming error of ENABLE_SECURITY_DOWNLOAD.
        ENABLE_SECURITY_DOWNLOAD_ERR: u1,
        /// Indicates a programming error of UART_PRINT_CONTROL.
        UART_PRINT_CONTROL_ERR: u2,
        /// Indicates a programming error of FORCE_SEND_RESUME.
        FORCE_SEND_RESUME_ERR: u1,
        /// Indicates a programming error of SECURE VERSION.
        SECURE_VERSION_ERR: u16,
        /// Indicates a programming error of SECURE_BOOT_DISABLE_FAST_WAKE.
        SECURE_BOOT_DISABLE_FAST_WAKE_ERR: u1,
        /// Indicates a programming error of HYS_EN_PAD.
        HYS_EN_PAD_ERR: u1,
        /// Indicates a programming error of DCDC_VSET.
        DCDC_VSET_ERR: u5,
    }),
    /// Programming error record register 4 of BLOCK0.
    /// offset: 0x18c
    RD_REPEAT_ERR4: mmio.Mmio(packed struct(u32) {
        /// Indicates a programming error of 0PXA_TIEH_SEL_0.
        _0PXA_TIEH_SEL_0_ERR: u2,
        /// Indicates a programming error of 0PXA_TIEH_SEL_1.
        _0PXA_TIEH_SEL_1_ERR: u2,
        /// Indicates a programming error of 0PXA_TIEH_SEL_2.
        _0PXA_TIEH_SEL_2_ERR: u2,
        /// Indicates a programming error of 0PXA_TIEH_SEL_3.
        _0PXA_TIEH_SEL_3_ERR: u2,
        /// TBD.
        KM_DISABLE_DEPLOY_MODE_ERR: u4,
        /// Indicates a programming error of USB_DEVICE_DREFL.
        USB_DEVICE_DREFL_ERR: u2,
        /// Indicates a programming error of USB_OTG11_DREFL.
        USB_OTG11_DREFL_ERR: u2,
        reserved18: u2 = 0,
        /// Indicates a programming error of HP_PWR_SRC_SEL.
        HP_PWR_SRC_SEL_ERR: u1,
        /// Indicates a programming error of DCDC_VSET_EN.
        DCDC_VSET_EN_ERR: u1,
        /// Indicates a programming error of DIS_WDT.
        DIS_WDT_ERR: u1,
        /// Indicates a programming error of DIS_SWD.
        DIS_SWD_ERR: u1,
        padding: u10 = 0,
    }),
    /// offset: 0x190
    reserved400: [48]u8,
    /// Programming error record register 0 of BLOCK1-10.
    /// offset: 0x1c0
    RD_RS_ERR0: mmio.Mmio(packed struct(u32) {
        /// The value of this signal means the number of error bytes.
        MAC_SYS_ERR_NUM: u3,
        /// 0: Means no failure and that the data of MAC_SPI_8M is reliable 1: Means that programming user data failed and the number of error bytes is over 6.
        MAC_SYS_FAIL: u1,
        /// The value of this signal means the number of error bytes.
        SYS_PART1_ERR_NUM: u3,
        /// 0: Means no failure and that the data of system part1 is reliable 1: Means that programming user data failed and the number of error bytes is over 6.
        SYS_PART1_FAIL: u1,
        /// The value of this signal means the number of error bytes.
        USR_DATA_ERR_NUM: u3,
        /// 0: Means no failure and that the user data is reliable 1: Means that programming user data failed and the number of error bytes is over 6.
        USR_DATA_FAIL: u1,
        /// The value of this signal means the number of error bytes.
        KEY0_ERR_NUM: u3,
        /// 0: Means no failure and that the data of key0 is reliable 1: Means that programming key0 failed and the number of error bytes is over 6.
        KEY0_FAIL: u1,
        /// The value of this signal means the number of error bytes.
        KEY1_ERR_NUM: u3,
        /// 0: Means no failure and that the data of key1 is reliable 1: Means that programming key1 failed and the number of error bytes is over 6.
        KEY1_FAIL: u1,
        /// The value of this signal means the number of error bytes.
        KEY2_ERR_NUM: u3,
        /// 0: Means no failure and that the data of key2 is reliable 1: Means that programming key2 failed and the number of error bytes is over 6.
        KEY2_FAIL: u1,
        /// The value of this signal means the number of error bytes.
        KEY3_ERR_NUM: u3,
        /// 0: Means no failure and that the data of key3 is reliable 1: Means that programming key3 failed and the number of error bytes is over 6.
        KEY3_FAIL: u1,
        /// The value of this signal means the number of error bytes.
        KEY4_ERR_NUM: u3,
        /// 0: Means no failure and that the data of key4 is reliable 1: Means that programming key4 failed and the number of error bytes is over 6.
        KEY4_FAIL: u1,
    }),
    /// Programming error record register 1 of BLOCK1-10.
    /// offset: 0x1c4
    RD_RS_ERR1: mmio.Mmio(packed struct(u32) {
        /// The value of this signal means the number of error bytes.
        KEY5_ERR_NUM: u3,
        /// 0: Means no failure and that the data of key5 is reliable 1: Means that programming key5 failed and the number of error bytes is over 6.
        KEY5_FAIL: u1,
        /// The value of this signal means the number of error bytes.
        SYS_PART2_ERR_NUM: u3,
        /// 0: Means no failure and that the data of system part2 is reliable 1: Means that programming user data failed and the number of error bytes is over 6.
        SYS_PART2_FAIL: u1,
        padding: u24 = 0,
    }),
    /// eFuse clcok configuration register.
    /// offset: 0x1c8
    CLK: mmio.Mmio(packed struct(u32) {
        /// Set this bit to force eFuse SRAM into power-saving mode.
        MEM_FORCE_PD: u1,
        /// Set this bit and force to activate clock signal of eFuse SRAM.
        MEM_CLK_FORCE_ON: u1,
        /// Set this bit to force eFuse SRAM into working mode.
        MEM_FORCE_PU: u1,
        reserved16: u13 = 0,
        /// Set this bit to force enable eFuse register configuration clock signal.
        EN: u1,
        padding: u15 = 0,
    }),
    /// eFuse operation mode configuraiton register
    /// offset: 0x1cc
    CONF: mmio.Mmio(packed struct(u32) {
        /// 0x5A5A: programming operation command 0x5AA5: read operation command.
        OP_CODE: u16,
        /// Configures which block to use for ECDSA key output.
        CFG_ECDSA_BLK: u4,
        padding: u12 = 0,
    }),
    /// eFuse status register.
    /// offset: 0x1d0
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Indicates the state of the eFuse state machine.
        STATE: u4,
        /// The value of OTP_LOAD_SW.
        OTP_LOAD_SW: u1,
        /// The value of OTP_VDDQ_C_SYNC2.
        OTP_VDDQ_C_SYNC2: u1,
        /// The value of OTP_STROBE_SW.
        OTP_STROBE_SW: u1,
        /// The value of OTP_CSB_SW.
        OTP_CSB_SW: u1,
        /// The value of OTP_PGENB_SW.
        OTP_PGENB_SW: u1,
        /// The value of OTP_VDDQ_IS_SW.
        OTP_VDDQ_IS_SW: u1,
        /// Indicates the number of block valid bit.
        BLK0_VALID_BIT_CNT: u10,
        /// Indicates which block is used for ECDSA key output.
        CUR_ECDSA_BLK: u4,
        padding: u8 = 0,
    }),
    /// eFuse command register.
    /// offset: 0x1d4
    CMD: mmio.Mmio(packed struct(u32) {
        /// Set this bit to send read command.
        READ_CMD: u1,
        /// Set this bit to send programming command.
        PGM_CMD: u1,
        /// The serial number of the block to be programmed. Value 0-10 corresponds to block number 0-10, respectively.
        BLK_NUM: u4,
        padding: u26 = 0,
    }),
    /// eFuse raw interrupt register.
    /// offset: 0x1d8
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw bit signal for read_done interrupt.
        READ_DONE_INT_RAW: u1,
        /// The raw bit signal for pgm_done interrupt.
        PGM_DONE_INT_RAW: u1,
        padding: u30 = 0,
    }),
    /// eFuse interrupt status register.
    /// offset: 0x1dc
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// The status signal for read_done interrupt.
        READ_DONE_INT_ST: u1,
        /// The status signal for pgm_done interrupt.
        PGM_DONE_INT_ST: u1,
        padding: u30 = 0,
    }),
    /// eFuse interrupt enable register.
    /// offset: 0x1e0
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The enable signal for read_done interrupt.
        READ_DONE_INT_ENA: u1,
        /// The enable signal for pgm_done interrupt.
        PGM_DONE_INT_ENA: u1,
        padding: u30 = 0,
    }),
    /// eFuse interrupt clear register.
    /// offset: 0x1e4
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// The clear signal for read_done interrupt.
        READ_DONE_INT_CLR: u1,
        /// The clear signal for pgm_done interrupt.
        PGM_DONE_INT_CLR: u1,
        padding: u30 = 0,
    }),
    /// Controls the eFuse programming voltage.
    /// offset: 0x1e8
    DAC_CONF: mmio.Mmio(packed struct(u32) {
        /// Controls the division factor of the rising clock of the programming voltage.
        DAC_CLK_DIV: u8,
        /// Don't care.
        DAC_CLK_PAD_SEL: u1,
        /// Controls the rising period of the programming voltage.
        DAC_NUM: u8,
        /// Reduces the power supply of the programming voltage.
        OE_CLR: u1,
        padding: u14 = 0,
    }),
    /// Configures read timing parameters.
    /// offset: 0x1ec
    RD_TIM_CONF: mmio.Mmio(packed struct(u32) {
        /// Configures the read hold time.
        THR_A: u8,
        /// Configures the read time.
        TRD: u8,
        /// Configures the read setup time.
        TSUR_A: u8,
        /// Configures the waiting time of reading eFuse memory.
        READ_INIT_NUM: u8,
    }),
    /// Configurarion register 1 of eFuse programming timing parameters.
    /// offset: 0x1f0
    WR_TIM_CONF1: mmio.Mmio(packed struct(u32) {
        /// Configures the programming setup time.
        TSUP_A: u8,
        /// Configures the power up time for VDDQ.
        PWR_ON_NUM: u16,
        /// Configures the programming hold time.
        THP_A: u8,
    }),
    /// Configurarion register 2 of eFuse programming timing parameters.
    /// offset: 0x1f4
    WR_TIM_CONF2: mmio.Mmio(packed struct(u32) {
        /// Configures the power outage time for VDDQ.
        PWR_OFF_NUM: u16,
        /// Configures the active programming time.
        TPGM: u16,
    }),
    /// Configurarion register0 of eFuse programming time parameters and rs bypass operation.
    /// offset: 0x1f8
    WR_TIM_CONF0_RS_BYPASS: mmio.Mmio(packed struct(u32) {
        /// Set this bit to bypass reed solomon correction step.
        BYPASS_RS_CORRECTION: u1,
        /// Configures block number of programming twice operation.
        BYPASS_RS_BLK_NUM: u11,
        /// Set this bit to update multi-bit register signals.
        UPDATE: u1,
        /// Configures the inactive programming time.
        TPGM_INACTIVE: u8,
        padding: u11 = 0,
    }),
    /// eFuse version register.
    /// offset: 0x1fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// Stores eFuse version.
        DATE: u28,
        padding: u4 = 0,
    }),
    /// offset: 0x200
    reserved512: [1536]u8,
    /// eFuse apb2otp block0 data register1.
    /// offset: 0x800
    APB2OTP_WR_DIS: mmio.Mmio(packed struct(u32) {
        /// Otp block0 write disable data.
        APB2OTP_BLOCK0_WR_DIS: u32,
    }),
    /// eFuse apb2otp block0 data register2.
    /// offset: 0x804
    APB2OTP_BLK0_BACKUP1_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup1 word1 data.
        APB2OTP_BLOCK0_BACKUP1_W1: u32,
    }),
    /// eFuse apb2otp block0 data register3.
    /// offset: 0x808
    APB2OTP_BLK0_BACKUP1_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup1 word2 data.
        APB2OTP_BLOCK0_BACKUP1_W2: u32,
    }),
    /// eFuse apb2otp block0 data register4.
    /// offset: 0x80c
    APB2OTP_BLK0_BACKUP1_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup1 word3 data.
        APB2OTP_BLOCK0_BACKUP1_W3: u32,
    }),
    /// eFuse apb2otp block0 data register5.
    /// offset: 0x810
    APB2OTP_BLK0_BACKUP1_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup1 word4 data.
        APB2OTP_BLOCK0_BACKUP1_W4: u32,
    }),
    /// eFuse apb2otp block0 data register6.
    /// offset: 0x814
    APB2OTP_BLK0_BACKUP1_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup1 word5 data.
        APB2OTP_BLOCK0_BACKUP1_W5: u32,
    }),
    /// eFuse apb2otp block0 data register7.
    /// offset: 0x818
    APB2OTP_BLK0_BACKUP2_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup2 word1 data.
        APB2OTP_BLOCK0_BACKUP2_W1: u32,
    }),
    /// eFuse apb2otp block0 data register8.
    /// offset: 0x81c
    APB2OTP_BLK0_BACKUP2_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup2 word2 data.
        APB2OTP_BLOCK0_BACKUP2_W2: u32,
    }),
    /// eFuse apb2otp block0 data register9.
    /// offset: 0x820
    APB2OTP_BLK0_BACKUP2_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup2 word3 data.
        APB2OTP_BLOCK0_BACKUP2_W3: u32,
    }),
    /// eFuse apb2otp block0 data register10.
    /// offset: 0x824
    APB2OTP_BLK0_BACKUP2_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup2 word4 data.
        APB2OTP_BLOCK0_BACKUP2_W4: u32,
    }),
    /// eFuse apb2otp block0 data register11.
    /// offset: 0x828
    APB2OTP_BLK0_BACKUP2_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup2 word5 data.
        APB2OTP_BLOCK0_BACKUP2_W5: u32,
    }),
    /// eFuse apb2otp block0 data register12.
    /// offset: 0x82c
    APB2OTP_BLK0_BACKUP3_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup3 word1 data.
        APB2OTP_BLOCK0_BACKUP3_W1: u32,
    }),
    /// eFuse apb2otp block0 data register13.
    /// offset: 0x830
    APB2OTP_BLK0_BACKUP3_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup3 word2 data.
        APB2OTP_BLOCK0_BACKUP3_W2: u32,
    }),
    /// eFuse apb2otp block0 data register14.
    /// offset: 0x834
    APB2OTP_BLK0_BACKUP3_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup3 word3 data.
        APB2OTP_BLOCK0_BACKUP3_W3: u32,
    }),
    /// eFuse apb2otp block0 data register15.
    /// offset: 0x838
    APB2OTP_BLK0_BACKUP3_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup3 word4 data.
        APB2OTP_BLOCK0_BACKUP3_W4: u32,
    }),
    /// eFuse apb2otp block0 data register16.
    /// offset: 0x83c
    APB2OTP_BLK0_BACKUP3_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup3 word5 data.
        APB2OTP_BLOCK0_BACKUP3_W5: u32,
    }),
    /// eFuse apb2otp block0 data register17.
    /// offset: 0x840
    APB2OTP_BLK0_BACKUP4_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup4 word1 data.
        APB2OTP_BLOCK0_BACKUP4_W1: u32,
    }),
    /// eFuse apb2otp block0 data register18.
    /// offset: 0x844
    APB2OTP_BLK0_BACKUP4_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup4 word2 data.
        APB2OTP_BLOCK0_BACKUP4_W2: u32,
    }),
    /// eFuse apb2otp block0 data register19.
    /// offset: 0x848
    APB2OTP_BLK0_BACKUP4_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup4 word3 data.
        APB2OTP_BLOCK0_BACKUP4_W3: u32,
    }),
    /// eFuse apb2otp block0 data register20.
    /// offset: 0x84c
    APB2OTP_BLK0_BACKUP4_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup4 word4 data.
        APB2OTP_BLOCK0_BACKUP4_W4: u32,
    }),
    /// eFuse apb2otp block0 data register21.
    /// offset: 0x850
    APB2OTP_BLK0_BACKUP4_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block0 backup4 word5 data.
        APB2OTP_BLOCK0_BACKUP4_W5: u32,
    }),
    /// eFuse apb2otp block1 data register1.
    /// offset: 0x854
    APB2OTP_BLK1_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block1 word1 data.
        APB2OTP_BLOCK1_W1: u32,
    }),
    /// eFuse apb2otp block1 data register2.
    /// offset: 0x858
    APB2OTP_BLK1_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block1 word2 data.
        APB2OTP_BLOCK1_W2: u32,
    }),
    /// eFuse apb2otp block1 data register3.
    /// offset: 0x85c
    APB2OTP_BLK1_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block1 word3 data.
        APB2OTP_BLOCK1_W3: u32,
    }),
    /// eFuse apb2otp block1 data register4.
    /// offset: 0x860
    APB2OTP_BLK1_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block1 word4 data.
        APB2OTP_BLOCK1_W4: u32,
    }),
    /// eFuse apb2otp block1 data register5.
    /// offset: 0x864
    APB2OTP_BLK1_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block1 word5 data.
        APB2OTP_BLOCK1_W5: u32,
    }),
    /// eFuse apb2otp block1 data register6.
    /// offset: 0x868
    APB2OTP_BLK1_W6: mmio.Mmio(packed struct(u32) {
        /// Otp block1 word6 data.
        APB2OTP_BLOCK1_W6: u32,
    }),
    /// eFuse apb2otp block1 data register7.
    /// offset: 0x86c
    APB2OTP_BLK1_W7: mmio.Mmio(packed struct(u32) {
        /// Otp block1 word7 data.
        APB2OTP_BLOCK1_W7: u32,
    }),
    /// eFuse apb2otp block1 data register8.
    /// offset: 0x870
    APB2OTP_BLK1_W8: mmio.Mmio(packed struct(u32) {
        /// Otp block1 word8 data.
        APB2OTP_BLOCK1_W8: u32,
    }),
    /// eFuse apb2otp block1 data register9.
    /// offset: 0x874
    APB2OTP_BLK1_W9: mmio.Mmio(packed struct(u32) {
        /// Otp block1 word9 data.
        APB2OTP_BLOCK1_W9: u32,
    }),
    /// eFuse apb2otp block2 data register1.
    /// offset: 0x878
    APB2OTP_BLK2_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word1 data.
        APB2OTP_BLOCK2_W1: u32,
    }),
    /// eFuse apb2otp block2 data register2.
    /// offset: 0x87c
    APB2OTP_BLK2_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word2 data.
        APB2OTP_BLOCK2_W2: u32,
    }),
    /// eFuse apb2otp block2 data register3.
    /// offset: 0x880
    APB2OTP_BLK2_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word3 data.
        APB2OTP_BLOCK2_W3: u32,
    }),
    /// eFuse apb2otp block2 data register4.
    /// offset: 0x884
    APB2OTP_BLK2_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word4 data.
        APB2OTP_BLOCK2_W4: u32,
    }),
    /// eFuse apb2otp block2 data register5.
    /// offset: 0x888
    APB2OTP_BLK2_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word5 data.
        APB2OTP_BLOCK2_W5: u32,
    }),
    /// eFuse apb2otp block2 data register6.
    /// offset: 0x88c
    APB2OTP_BLK2_W6: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word6 data.
        APB2OTP_BLOCK2_W6: u32,
    }),
    /// eFuse apb2otp block2 data register7.
    /// offset: 0x890
    APB2OTP_BLK2_W7: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word7 data.
        APB2OTP_BLOCK2_W7: u32,
    }),
    /// eFuse apb2otp block2 data register8.
    /// offset: 0x894
    APB2OTP_BLK2_W8: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word8 data.
        APB2OTP_BLOCK2_W8: u32,
    }),
    /// eFuse apb2otp block2 data register9.
    /// offset: 0x898
    APB2OTP_BLK2_W9: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word9 data.
        APB2OTP_BLOCK2_W9: u32,
    }),
    /// eFuse apb2otp block2 data register10.
    /// offset: 0x89c
    APB2OTP_BLK2_W10: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word10 data.
        APB2OTP_BLOCK2_W10: u32,
    }),
    /// eFuse apb2otp block2 data register11.
    /// offset: 0x8a0
    APB2OTP_BLK2_W11: mmio.Mmio(packed struct(u32) {
        /// Otp block2 word11 data.
        APB2OTP_BLOCK2_W11: u32,
    }),
    /// eFuse apb2otp block3 data register1.
    /// offset: 0x8a4
    APB2OTP_BLK3_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word1 data.
        APB2OTP_BLOCK3_W1: u32,
    }),
    /// eFuse apb2otp block3 data register2.
    /// offset: 0x8a8
    APB2OTP_BLK3_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word2 data.
        APB2OTP_BLOCK3_W2: u32,
    }),
    /// eFuse apb2otp block3 data register3.
    /// offset: 0x8ac
    APB2OTP_BLK3_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word3 data.
        APB2OTP_BLOCK3_W3: u32,
    }),
    /// eFuse apb2otp block3 data register4.
    /// offset: 0x8b0
    APB2OTP_BLK3_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word4 data.
        APB2OTP_BLOCK3_W4: u32,
    }),
    /// eFuse apb2otp block3 data register5.
    /// offset: 0x8b4
    APB2OTP_BLK3_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word5 data.
        APB2OTP_BLOCK3_W5: u32,
    }),
    /// eFuse apb2otp block3 data register6.
    /// offset: 0x8b8
    APB2OTP_BLK3_W6: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word6 data.
        APB2OTP_BLOCK3_W6: u32,
    }),
    /// eFuse apb2otp block3 data register7.
    /// offset: 0x8bc
    APB2OTP_BLK3_W7: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word7 data.
        APB2OTP_BLOCK3_W7: u32,
    }),
    /// eFuse apb2otp block3 data register8.
    /// offset: 0x8c0
    APB2OTP_BLK3_W8: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word8 data.
        APB2OTP_BLOCK3_W8: u32,
    }),
    /// eFuse apb2otp block3 data register9.
    /// offset: 0x8c4
    APB2OTP_BLK3_W9: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word9 data.
        APB2OTP_BLOCK3_W9: u32,
    }),
    /// eFuse apb2otp block3 data register10.
    /// offset: 0x8c8
    APB2OTP_BLK3_W10: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word10 data.
        APB2OTP_BLOCK3_W10: u32,
    }),
    /// eFuse apb2otp block3 data register11.
    /// offset: 0x8cc
    APB2OTP_BLK3_W11: mmio.Mmio(packed struct(u32) {
        /// Otp block3 word11 data.
        APB2OTP_BLOCK3_W11: u32,
    }),
    /// eFuse apb2otp block4 data register1.
    /// offset: 0x8d0
    APB2OTP_BLK4_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word1 data.
        APB2OTP_BLOCK4_W1: u32,
    }),
    /// eFuse apb2otp block4 data register2.
    /// offset: 0x8d4
    APB2OTP_BLK4_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word2 data.
        APB2OTP_BLOCK4_W2: u32,
    }),
    /// eFuse apb2otp block4 data register3.
    /// offset: 0x8d8
    APB2OTP_BLK4_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word3 data.
        APB2OTP_BLOCK4_W3: u32,
    }),
    /// eFuse apb2otp block4 data register4.
    /// offset: 0x8dc
    APB2OTP_BLK4_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word4 data.
        APB2OTP_BLOCK4_W4: u32,
    }),
    /// eFuse apb2otp block4 data register5.
    /// offset: 0x8e0
    APB2OTP_BLK4_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word5 data.
        APB2OTP_BLOCK4_W5: u32,
    }),
    /// eFuse apb2otp block4 data register6.
    /// offset: 0x8e4
    APB2OTP_BLK4_W6: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word6 data.
        APB2OTP_BLOCK4_W6: u32,
    }),
    /// eFuse apb2otp block4 data register7.
    /// offset: 0x8e8
    APB2OTP_BLK4_W7: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word7 data.
        APB2OTP_BLOCK4_W7: u32,
    }),
    /// eFuse apb2otp block4 data register8.
    /// offset: 0x8ec
    APB2OTP_BLK4_W8: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word8 data.
        APB2OTP_BLOCK4_W8: u32,
    }),
    /// eFuse apb2otp block4 data register9.
    /// offset: 0x8f0
    APB2OTP_BLK4_W9: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word9 data.
        APB2OTP_BLOCK4_W9: u32,
    }),
    /// eFuse apb2otp block4 data registe10.
    /// offset: 0x8f4
    APB2OTP_BLK4_W10: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word10 data.
        APB2OTP_BLOCK4_W10: u32,
    }),
    /// eFuse apb2otp block4 data register11.
    /// offset: 0x8f8
    APB2OTP_BLK4_W11: mmio.Mmio(packed struct(u32) {
        /// Otp block4 word11 data.
        APB2OTP_BLOCK4_W11: u32,
    }),
    /// eFuse apb2otp block5 data register1.
    /// offset: 0x8fc
    APB2OTP_BLK5_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word1 data.
        APB2OTP_BLOCK5_W1: u32,
    }),
    /// eFuse apb2otp block5 data register2.
    /// offset: 0x900
    APB2OTP_BLK5_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word2 data.
        APB2OTP_BLOCK5_W2: u32,
    }),
    /// eFuse apb2otp block5 data register3.
    /// offset: 0x904
    APB2OTP_BLK5_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word3 data.
        APB2OTP_BLOCK5_W3: u32,
    }),
    /// eFuse apb2otp block5 data register4.
    /// offset: 0x908
    APB2OTP_BLK5_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word4 data.
        APB2OTP_BLOCK5_W4: u32,
    }),
    /// eFuse apb2otp block5 data register5.
    /// offset: 0x90c
    APB2OTP_BLK5_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word5 data.
        APB2OTP_BLOCK5_W5: u32,
    }),
    /// eFuse apb2otp block5 data register6.
    /// offset: 0x910
    APB2OTP_BLK5_W6: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word6 data.
        APB2OTP_BLOCK5_W6: u32,
    }),
    /// eFuse apb2otp block5 data register7.
    /// offset: 0x914
    APB2OTP_BLK5_W7: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word7 data.
        APB2OTP_BLOCK5_W7: u32,
    }),
    /// eFuse apb2otp block5 data register8.
    /// offset: 0x918
    APB2OTP_BLK5_W8: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word8 data.
        APB2OTP_BLOCK5_W8: u32,
    }),
    /// eFuse apb2otp block5 data register9.
    /// offset: 0x91c
    APB2OTP_BLK5_W9: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word9 data.
        APB2OTP_BLOCK5_W9: u32,
    }),
    /// eFuse apb2otp block5 data register10.
    /// offset: 0x920
    APB2OTP_BLK5_W10: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word10 data.
        APB2OTP_BLOCK5_W10: u32,
    }),
    /// eFuse apb2otp block5 data register11.
    /// offset: 0x924
    APB2OTP_BLK5_W11: mmio.Mmio(packed struct(u32) {
        /// Otp block5 word11 data.
        APB2OTP_BLOCK5_W11: u32,
    }),
    /// eFuse apb2otp block6 data register1.
    /// offset: 0x928
    APB2OTP_BLK6_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word1 data.
        APB2OTP_BLOCK6_W1: u32,
    }),
    /// eFuse apb2otp block6 data register2.
    /// offset: 0x92c
    APB2OTP_BLK6_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word2 data.
        APB2OTP_BLOCK6_W2: u32,
    }),
    /// eFuse apb2otp block6 data register3.
    /// offset: 0x930
    APB2OTP_BLK6_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word3 data.
        APB2OTP_BLOCK6_W3: u32,
    }),
    /// eFuse apb2otp block6 data register4.
    /// offset: 0x934
    APB2OTP_BLK6_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word4 data.
        APB2OTP_BLOCK6_W4: u32,
    }),
    /// eFuse apb2otp block6 data register5.
    /// offset: 0x938
    APB2OTP_BLK6_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word5 data.
        APB2OTP_BLOCK6_W5: u32,
    }),
    /// eFuse apb2otp block6 data register6.
    /// offset: 0x93c
    APB2OTP_BLK6_W6: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word6 data.
        APB2OTP_BLOCK6_W6: u32,
    }),
    /// eFuse apb2otp block6 data register7.
    /// offset: 0x940
    APB2OTP_BLK6_W7: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word7 data.
        APB2OTP_BLOCK6_W7: u32,
    }),
    /// eFuse apb2otp block6 data register8.
    /// offset: 0x944
    APB2OTP_BLK6_W8: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word8 data.
        APB2OTP_BLOCK6_W8: u32,
    }),
    /// eFuse apb2otp block6 data register9.
    /// offset: 0x948
    APB2OTP_BLK6_W9: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word9 data.
        APB2OTP_BLOCK6_W9: u32,
    }),
    /// eFuse apb2otp block6 data register10.
    /// offset: 0x94c
    APB2OTP_BLK6_W10: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word10 data.
        APB2OTP_BLOCK6_W10: u32,
    }),
    /// eFuse apb2otp block6 data register11.
    /// offset: 0x950
    APB2OTP_BLK6_W11: mmio.Mmio(packed struct(u32) {
        /// Otp block6 word11 data.
        APB2OTP_BLOCK6_W11: u32,
    }),
    /// eFuse apb2otp block7 data register1.
    /// offset: 0x954
    APB2OTP_BLK7_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word1 data.
        APB2OTP_BLOCK7_W1: u32,
    }),
    /// eFuse apb2otp block7 data register2.
    /// offset: 0x958
    APB2OTP_BLK7_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word2 data.
        APB2OTP_BLOCK7_W2: u32,
    }),
    /// eFuse apb2otp block7 data register3.
    /// offset: 0x95c
    APB2OTP_BLK7_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word3 data.
        APB2OTP_BLOCK7_W3: u32,
    }),
    /// eFuse apb2otp block7 data register4.
    /// offset: 0x960
    APB2OTP_BLK7_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word4 data.
        APB2OTP_BLOCK7_W4: u32,
    }),
    /// eFuse apb2otp block7 data register5.
    /// offset: 0x964
    APB2OTP_BLK7_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word5 data.
        APB2OTP_BLOCK7_W5: u32,
    }),
    /// eFuse apb2otp block7 data register6.
    /// offset: 0x968
    APB2OTP_BLK7_W6: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word6 data.
        APB2OTP_BLOCK7_W6: u32,
    }),
    /// eFuse apb2otp block7 data register7.
    /// offset: 0x96c
    APB2OTP_BLK7_W7: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word7 data.
        APB2OTP_BLOCK7_W7: u32,
    }),
    /// eFuse apb2otp block7 data register8.
    /// offset: 0x970
    APB2OTP_BLK7_W8: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word8 data.
        APB2OTP_BLOCK7_W8: u32,
    }),
    /// eFuse apb2otp block7 data register9.
    /// offset: 0x974
    APB2OTP_BLK7_W9: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word9 data.
        APB2OTP_BLOCK7_W9: u32,
    }),
    /// eFuse apb2otp block7 data register10.
    /// offset: 0x978
    APB2OTP_BLK7_W10: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word10 data.
        APB2OTP_BLOCK7_W10: u32,
    }),
    /// eFuse apb2otp block7 data register11.
    /// offset: 0x97c
    APB2OTP_BLK7_W11: mmio.Mmio(packed struct(u32) {
        /// Otp block7 word11 data.
        APB2OTP_BLOCK7_W11: u32,
    }),
    /// eFuse apb2otp block8 data register1.
    /// offset: 0x980
    APB2OTP_BLK8_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word1 data.
        APB2OTP_BLOCK8_W1: u32,
    }),
    /// eFuse apb2otp block8 data register2.
    /// offset: 0x984
    APB2OTP_BLK8_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word2 data.
        APB2OTP_BLOCK8_W2: u32,
    }),
    /// eFuse apb2otp block8 data register3.
    /// offset: 0x988
    APB2OTP_BLK8_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word3 data.
        APB2OTP_BLOCK8_W3: u32,
    }),
    /// eFuse apb2otp block8 data register4.
    /// offset: 0x98c
    APB2OTP_BLK8_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word4 data.
        APB2OTP_BLOCK8_W4: u32,
    }),
    /// eFuse apb2otp block8 data register5.
    /// offset: 0x990
    APB2OTP_BLK8_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word5 data.
        APB2OTP_BLOCK8_W5: u32,
    }),
    /// eFuse apb2otp block8 data register6.
    /// offset: 0x994
    APB2OTP_BLK8_W6: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word6 data.
        APB2OTP_BLOCK8_W6: u32,
    }),
    /// eFuse apb2otp block8 data register7.
    /// offset: 0x998
    APB2OTP_BLK8_W7: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word7 data.
        APB2OTP_BLOCK8_W7: u32,
    }),
    /// eFuse apb2otp block8 data register8.
    /// offset: 0x99c
    APB2OTP_BLK8_W8: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word8 data.
        APB2OTP_BLOCK8_W8: u32,
    }),
    /// eFuse apb2otp block8 data register9.
    /// offset: 0x9a0
    APB2OTP_BLK8_W9: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word9 data.
        APB2OTP_BLOCK8_W9: u32,
    }),
    /// eFuse apb2otp block8 data register10.
    /// offset: 0x9a4
    APB2OTP_BLK8_W10: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word10 data.
        APB2OTP_BLOCK8_W10: u32,
    }),
    /// eFuse apb2otp block8 data register11.
    /// offset: 0x9a8
    APB2OTP_BLK8_W11: mmio.Mmio(packed struct(u32) {
        /// Otp block8 word11 data.
        APB2OTP_BLOCK8_W11: u32,
    }),
    /// eFuse apb2otp block9 data register1.
    /// offset: 0x9ac
    APB2OTP_BLK9_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word1 data.
        APB2OTP_BLOCK9_W1: u32,
    }),
    /// eFuse apb2otp block9 data register2.
    /// offset: 0x9b0
    APB2OTP_BLK9_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word2 data.
        APB2OTP_BLOCK9_W2: u32,
    }),
    /// eFuse apb2otp block9 data register3.
    /// offset: 0x9b4
    APB2OTP_BLK9_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word3 data.
        APB2OTP_BLOCK9_W3: u32,
    }),
    /// eFuse apb2otp block9 data register4.
    /// offset: 0x9b8
    APB2OTP_BLK9_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word4 data.
        APB2OTP_BLOCK9_W4: u32,
    }),
    /// eFuse apb2otp block9 data register5.
    /// offset: 0x9bc
    APB2OTP_BLK9_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word5 data.
        APB2OTP_BLOCK9_W5: u32,
    }),
    /// eFuse apb2otp block9 data register6.
    /// offset: 0x9c0
    APB2OTP_BLK9_W6: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word6 data.
        APB2OTP_BLOCK9_W6: u32,
    }),
    /// eFuse apb2otp block9 data register7.
    /// offset: 0x9c4
    APB2OTP_BLK9_W7: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word7 data.
        APB2OTP_BLOCK9_W7: u32,
    }),
    /// eFuse apb2otp block9 data register8.
    /// offset: 0x9c8
    APB2OTP_BLK9_W8: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word8 data.
        APB2OTP_BLOCK9_W8: u32,
    }),
    /// eFuse apb2otp block9 data register9.
    /// offset: 0x9cc
    APB2OTP_BLK9_W9: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word9 data.
        APB2OTP_BLOCK9_W9: u32,
    }),
    /// eFuse apb2otp block9 data register10.
    /// offset: 0x9d0
    APB2OTP_BLK9_W10: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word10 data.
        APB2OTP_BLOCK9_W10: u32,
    }),
    /// eFuse apb2otp block9 data register11.
    /// offset: 0x9d4
    APB2OTP_BLK9_W11: mmio.Mmio(packed struct(u32) {
        /// Otp block9 word11 data.
        APB2OTP_BLOCK9_W11: u32,
    }),
    /// eFuse apb2otp block10 data register1.
    /// offset: 0x9d8
    APB2OTP_BLK10_W1: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word1 data.
        APB2OTP_BLOCK10_W1: u32,
    }),
    /// eFuse apb2otp block10 data register2.
    /// offset: 0x9dc
    APB2OTP_BLK10_W2: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word2 data.
        APB2OTP_BLOCK10_W2: u32,
    }),
    /// eFuse apb2otp block10 data register3.
    /// offset: 0x9e0
    APB2OTP_BLK10_W3: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word3 data.
        APB2OTP_BLOCK10_W3: u32,
    }),
    /// eFuse apb2otp block10 data register4.
    /// offset: 0x9e4
    APB2OTP_BLK10_W4: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word4 data.
        APB2OTP_BLOCK10_W4: u32,
    }),
    /// eFuse apb2otp block10 data register5.
    /// offset: 0x9e8
    APB2OTP_BLK10_W5: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word5 data.
        APB2OTP_BLOCK10_W5: u32,
    }),
    /// eFuse apb2otp block10 data register6.
    /// offset: 0x9ec
    APB2OTP_BLK10_W6: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word6 data.
        APB2OTP_BLOCK10_W6: u32,
    }),
    /// eFuse apb2otp block10 data register7.
    /// offset: 0x9f0
    APB2OTP_BLK10_W7: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word7 data.
        APB2OTP_BLOCK10_W7: u32,
    }),
    /// eFuse apb2otp block10 data register8.
    /// offset: 0x9f4
    APB2OTP_BLK10_W8: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word8 data.
        APB2OTP_BLOCK10_W8: u32,
    }),
    /// eFuse apb2otp block10 data register9.
    /// offset: 0x9f8
    APB2OTP_BLK10_W9: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word9 data.
        APB2OTP_BLOCK10_W9: u32,
    }),
    /// eFuse apb2otp block10 data register10.
    /// offset: 0x9fc
    APB2OTP_BLK10_W10: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word10 data.
        APB2OTP_BLOCK19_W10: u32,
    }),
    /// eFuse apb2otp block10 data register11.
    /// offset: 0xa00
    APB2OTP_BLK10_W11: mmio.Mmio(packed struct(u32) {
        /// Otp block10 word11 data.
        APB2OTP_BLOCK10_W11: u32,
    }),
    /// offset: 0xa04
    reserved2564: [4]u8,
    /// eFuse apb2otp enable configuration register.
    /// offset: 0xa08
    APB2OTP_EN: mmio.Mmio(packed struct(u32) {
        /// Apb2otp mode enable signal.
        APB2OTP_APB2OTP_EN: u1,
        padding: u31 = 0,
    }),
};
