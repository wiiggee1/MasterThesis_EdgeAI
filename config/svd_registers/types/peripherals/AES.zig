const mmio = @import("mmio");
const types = @import("../../types.zig");

/// AES (Advanced Encryption Standard) Accelerator
pub const AES = extern struct {
    /// Key material key_0 configure register
    /// offset: 0x00
    KEY_0: mmio.Mmio(packed struct(u32) {
        /// This bits stores key_0 that is a part of key material.
        KEY_0: u32,
    }),
    /// Key material key_1 configure register
    /// offset: 0x04
    KEY_1: mmio.Mmio(packed struct(u32) {
        /// This bits stores key_1 that is a part of key material.
        KEY_1: u32,
    }),
    /// Key material key_2 configure register
    /// offset: 0x08
    KEY_2: mmio.Mmio(packed struct(u32) {
        /// This bits stores key_2 that is a part of key material.
        KEY_2: u32,
    }),
    /// Key material key_3 configure register
    /// offset: 0x0c
    KEY_3: mmio.Mmio(packed struct(u32) {
        /// This bits stores key_3 that is a part of key material.
        KEY_3: u32,
    }),
    /// Key material key_4 configure register
    /// offset: 0x10
    KEY_4: mmio.Mmio(packed struct(u32) {
        /// This bits stores key_4 that is a part of key material.
        KEY_4: u32,
    }),
    /// Key material key_5 configure register
    /// offset: 0x14
    KEY_5: mmio.Mmio(packed struct(u32) {
        /// This bits stores key_5 that is a part of key material.
        KEY_5: u32,
    }),
    /// Key material key_6 configure register
    /// offset: 0x18
    KEY_6: mmio.Mmio(packed struct(u32) {
        /// This bits stores key_6 that is a part of key material.
        KEY_6: u32,
    }),
    /// Key material key_7 configure register
    /// offset: 0x1c
    KEY_7: mmio.Mmio(packed struct(u32) {
        /// This bits stores key_7 that is a part of key material.
        KEY_7: u32,
    }),
    /// source text material text_in_0 configure register
    /// offset: 0x20
    TEXT_IN_0: mmio.Mmio(packed struct(u32) {
        /// This bits stores text_in_0 that is a part of source text material.
        TEXT_IN_0: u32,
    }),
    /// source text material text_in_1 configure register
    /// offset: 0x24
    TEXT_IN_1: mmio.Mmio(packed struct(u32) {
        /// This bits stores text_in_1 that is a part of source text material.
        TEXT_IN_1: u32,
    }),
    /// source text material text_in_2 configure register
    /// offset: 0x28
    TEXT_IN_2: mmio.Mmio(packed struct(u32) {
        /// This bits stores text_in_2 that is a part of source text material.
        TEXT_IN_2: u32,
    }),
    /// source text material text_in_3 configure register
    /// offset: 0x2c
    TEXT_IN_3: mmio.Mmio(packed struct(u32) {
        /// This bits stores text_in_3 that is a part of source text material.
        TEXT_IN_3: u32,
    }),
    /// result text material text_out_0 configure register
    /// offset: 0x30
    TEXT_OUT_0: mmio.Mmio(packed struct(u32) {
        /// This bits stores text_out_0 that is a part of result text material.
        TEXT_OUT_0: u32,
    }),
    /// result text material text_out_1 configure register
    /// offset: 0x34
    TEXT_OUT_1: mmio.Mmio(packed struct(u32) {
        /// This bits stores text_out_1 that is a part of result text material.
        TEXT_OUT_1: u32,
    }),
    /// result text material text_out_2 configure register
    /// offset: 0x38
    TEXT_OUT_2: mmio.Mmio(packed struct(u32) {
        /// This bits stores text_out_2 that is a part of result text material.
        TEXT_OUT_2: u32,
    }),
    /// result text material text_out_3 configure register
    /// offset: 0x3c
    TEXT_OUT_3: mmio.Mmio(packed struct(u32) {
        /// This bits stores text_out_3 that is a part of result text material.
        TEXT_OUT_3: u32,
    }),
    /// AES Mode register
    /// offset: 0x40
    MODE: mmio.Mmio(packed struct(u32) {
        /// This bits decides which one operation mode will be used. 3'd0: AES-EN-128, 3'd1: AES-EN-192, 3'd2: AES-EN-256, 3'd4: AES-DE-128, 3'd5: AES-DE-192, 3'd6: AES-DE-256.
        MODE: u3,
        padding: u29 = 0,
    }),
    /// AES Endian configure register
    /// offset: 0x44
    ENDIAN: mmio.Mmio(packed struct(u32) {
        /// endian. [1:0] key endian, [3:2] text_in endian or in_stream endian, [5:4] text_out endian or out_stream endian
        ENDIAN: u6,
        padding: u26 = 0,
    }),
    /// AES trigger register
    /// offset: 0x48
    TRIGGER: mmio.Mmio(packed struct(u32) {
        /// Set this bit to start AES calculation.
        TRIGGER: u1,
        padding: u31 = 0,
    }),
    /// AES state register
    /// offset: 0x4c
    STATE: mmio.Mmio(packed struct(u32) {
        /// Those bits shows AES status. For typical AES, 0: idle, 1: busy. For DMA-AES, 0: idle, 1: busy, 2: calculation_done.
        STATE: u2,
        padding: u30 = 0,
    }),
    /// The memory that stores initialization vector
    /// offset: 0x50
    IV_MEM: [4]u32,
    /// The memory that stores GCM hash subkey
    /// offset: 0x60
    H_MEM: [4]u32,
    /// The memory that stores J0
    /// offset: 0x70
    J0_MEM: [4]u32,
    /// The memory that stores T0
    /// offset: 0x80
    T0_MEM: [4]u32,
    /// DMA-AES working mode register
    /// offset: 0x90
    DMA_ENABLE: mmio.Mmio(packed struct(u32) {
        /// 1'b0: typical AES working mode, 1'b1: DMA-AES working mode.
        DMA_ENABLE: u1,
        padding: u31 = 0,
    }),
    /// AES cipher block mode register
    /// offset: 0x94
    BLOCK_MODE: mmio.Mmio(packed struct(u32) {
        /// Those bits decides which block mode will be used. 0x0: ECB, 0x1: CBC, 0x2: OFB, 0x3: CTR, 0x4: CFB-8, 0x5: CFB-128, 0x6: GCM, 0x7: reserved.
        BLOCK_MODE: u3,
        padding: u29 = 0,
    }),
    /// AES block number register
    /// offset: 0x98
    BLOCK_NUM: mmio.Mmio(packed struct(u32) {
        /// Those bits stores the number of Plaintext/ciphertext block.
        BLOCK_NUM: u32,
    }),
    /// Standard incrementing function configure register
    /// offset: 0x9c
    INC_SEL: mmio.Mmio(packed struct(u32) {
        /// This bit decides the standard incrementing function. 0: INC32. 1: INC128.
        INC_SEL: u1,
        padding: u31 = 0,
    }),
    /// Additional Authential Data block number register
    /// offset: 0xa0
    AAD_BLOCK_NUM: mmio.Mmio(packed struct(u32) {
        /// Those bits stores the number of AAD block.
        AAD_BLOCK_NUM: u32,
    }),
    /// AES remainder bit number register
    /// offset: 0xa4
    REMAINDER_BIT_NUM: mmio.Mmio(packed struct(u32) {
        /// Those bits stores the number of remainder bit.
        REMAINDER_BIT_NUM: u7,
        padding: u25 = 0,
    }),
    /// AES continue register
    /// offset: 0xa8
    CONTINUE: mmio.Mmio(packed struct(u32) {
        /// Set this bit to continue GCM operation.
        CONTINUE: u1,
        padding: u31 = 0,
    }),
    /// AES Interrupt clear register
    /// offset: 0xac
    INT_CLEAR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the AES interrupt.
        INT_CLEAR: u1,
        padding: u31 = 0,
    }),
    /// AES Interrupt enable register
    /// offset: 0xb0
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// Set this bit to enable interrupt that occurs when DMA-AES calculation is done.
        INT_ENA: u1,
        padding: u31 = 0,
    }),
    /// AES version control register
    /// offset: 0xb4
    DATE: mmio.Mmio(packed struct(u32) {
        /// This bits stores the version information of AES.
        DATE: u30,
        padding: u2 = 0,
    }),
    /// AES-DMA exit config
    /// offset: 0xb8
    DMA_EXIT: mmio.Mmio(packed struct(u32) {
        /// Set this register to leave calculation done stage. Recommend to use it after software finishes reading DMA's output buffer.
        DMA_EXIT: u1,
        padding: u31 = 0,
    }),
};
