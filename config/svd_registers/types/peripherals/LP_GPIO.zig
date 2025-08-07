const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Low-power General Purpose Input/Output
pub const LP_GPIO = extern struct {
    /// Reserved
    /// offset: 0x00
    CLK_EN: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// Reserved
    /// offset: 0x04
    VER_DATE: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_VER_DATE: u28,
        padding: u4 = 0,
    }),
    /// Reserved
    /// offset: 0x08
    OUT: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_OUT_DATA: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x0c
    OUT_W1TS: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_OUT_DATA_W1TS: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x10
    OUT_W1TC: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_OUT_DATA_W1TC: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x14
    ENABLE: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_ENABLE_DATA: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x18
    ENABLE_W1TS: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_ENABLE_DATA_W1TS: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x1c
    ENABLE_W1TC: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_ENABLE_DATA_W1TC: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x20
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_STATUS_DATA: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x24
    STATUS_W1TS: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_STATUS_DATA_W1TS: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x28
    STATUS_W1TC: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_STATUS_DATA_W1TC: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x2c
    STATUS_NEXT: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_STATUS_INTERRUPT_NEXT: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x30
    IN: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_IN_DATA_NEXT: u16,
        padding: u16 = 0,
    }),
    /// Reserved
    /// offset: 0x34
    PIN0: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN0_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN0_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN0_PAD_DRIVER: u1,
        /// need des
        REG_GPIO_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x38
    PIN1: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN1_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN1_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN1_PAD_DRIVER: u1,
        /// need des
        REG_GPI1_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x3c
    PIN2: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN2_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN2_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN2_PAD_DRIVER: u1,
        /// need des
        REG_GPI2_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x40
    PIN3: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN3_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN3_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN3_PAD_DRIVER: u1,
        /// need des
        REG_GPI3_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x44
    PIN4: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN4_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN4_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN4_PAD_DRIVER: u1,
        /// need des
        REG_GPI4_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x48
    PIN5: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN5_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN5_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN5_PAD_DRIVER: u1,
        /// need des
        REG_GPI5_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x4c
    PIN6: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN6_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN6_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN6_PAD_DRIVER: u1,
        /// need des
        REG_GPI6_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x50
    PIN7: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN7_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN7_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN7_PAD_DRIVER: u1,
        /// need des
        REG_GPI7_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x54
    PIN8: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN8_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN8_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN8_PAD_DRIVER: u1,
        /// need des
        REG_GPI8_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x58
    PIN9: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN9_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN9_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN9_PAD_DRIVER: u1,
        /// need des
        REG_GPI9_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x5c
    PIN10: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN10_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN10_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN10_PAD_DRIVER: u1,
        /// need des
        REG_GPI10_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x60
    PIN11: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN11_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN11_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN11_PAD_DRIVER: u1,
        /// need des
        REG_GPI11_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x64
    PIN12: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN12_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN12_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN12_PAD_DRIVER: u1,
        /// need des
        REG_GPI12_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x68
    PIN13: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN13_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN13_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN13_PAD_DRIVER: u1,
        /// need des
        REG_GPI13_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x6c
    PIN14: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN14_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN14_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN14_PAD_DRIVER: u1,
        /// need des
        REG_GPI14_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x70
    PIN15: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_PIN15_WAKEUP_ENABLE: u1,
        /// Reserved
        REG_GPIO_PIN15_INT_TYPE: u3,
        /// Reserved
        REG_GPIO_PIN15_PAD_DRIVER: u1,
        /// need des
        REG_GPI15_PIN0_EDGE_WAKEUP_CLR: u1,
        padding: u26 = 0,
    }),
    /// Reserved
    /// offset: 0x74
    FUNC0_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC0_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG0_IN_SEL: u1,
        /// reg_gpio_func0_in_sel[5:4]==2'b11->constant 1,reg_gpio_func0_in_sel[5:4]==2'b10->constant 0
        REG_GPIO_FUNC0_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x78
    FUNC1_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC1_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG1_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC1_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x7c
    FUNC2_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC2_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG2_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC2_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x80
    FUNC3_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC3_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG3_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC3_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x84
    FUNC4_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC4_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG4_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC4_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x88
    FUNC5_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC5_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG5_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC5_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x8c
    FUNC6_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC6_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG6_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC6_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x90
    FUNC7_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC7_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG7_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC7_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x94
    FUNC8_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC8_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG8_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC8_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x98
    FUNC9_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC9_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG9_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC9_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0x9c
    FUNC10_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC10_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG10_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC10_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0xa0
    FUNC11_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC11_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG11_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC11_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0xa4
    FUNC12_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC12_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG12_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC12_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// Reserved
    /// offset: 0xa8
    FUNC13_IN_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC13_IN_INV_SEL: u1,
        /// Reserved
        REG_GPIO_SIG13_IN_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC13_IN_SEL: u6,
        padding: u24 = 0,
    }),
    /// offset: 0xac
    reserved172: [72]u8,
    /// Reserved
    /// offset: 0xf4
    FUNC0_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC0_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC0_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC0_OUT_INV_SEL: u1,
        /// reg_gpio_func0_out_sel[5:1]==16 -> output gpio register value to pad
        REG_GPIO_FUNC0_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0xf8
    FUNC1_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC1_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC1_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC1_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC1_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0xfc
    FUNC2_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC2_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC2_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC2_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC2_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x100
    FUNC3_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC3_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC3_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC3_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC3_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x104
    FUNC4_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC4_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC4_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC4_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC4_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x108
    FUNC5_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC5_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC5_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC5_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC5_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x10c
    FUNC6_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC6_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC6_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC6_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC6_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x110
    FUNC7_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC7_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC7_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC7_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC7_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x114
    FUNC8_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC8_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC8_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC8_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC8_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x118
    FUNC9_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC9_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC9_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC9_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC9_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x11c
    FUNC10_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC10_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC10_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC10_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC10_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x120
    FUNC11_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC11_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC11_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC11_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC11_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x124
    FUNC12_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC12_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC12_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC12_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC12_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x128
    FUNC13_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC13_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC13_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC13_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC13_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x12c
    FUNC14_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC14_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC14_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC14_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC14_OUT_SEL: u6,
        padding: u23 = 0,
    }),
    /// Reserved
    /// offset: 0x130
    FUNC15_OUT_SEL_CFG: mmio.Mmio(packed struct(u32) {
        /// Reserved
        REG_GPIO_FUNC15_OE_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC15_OE_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC15_OUT_INV_SEL: u1,
        /// Reserved
        REG_GPIO_FUNC15_OUT_SEL: u6,
        padding: u23 = 0,
    }),
};
