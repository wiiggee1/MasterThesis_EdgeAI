const mmio = @import("mmio");
const types = @import("../../types.zig");

/// USB_WRAP Peripheral
pub const USB_WRAP = extern struct {
    /// USB wrapper configuration registers.
    /// offset: 0x00
    OTG_CONF: mmio.Mmio(packed struct(u32) {
        /// This bit is used to enable the software over-ride of srp session end signal. 1'b0: the signal is controlled by the chip input, 1'b1: the signal is controlled by the software.
        SRP_SESSEND_OVERRIDE: u1,
        /// Software over-ride value of srp session end signal.
        SRP_SESSEND_VALUE: u1,
        /// Select internal external PHY. 1'b0: Select internal PHY, 1'b1: Select external PHY.
        PHY_SEL: u1,
        /// Force the dfifo to go into low power mode. The data in dfifo will not lost.
        DFIFO_FORCE_PD: u1,
        /// Bypass Debounce filters for avalid,bvalid,vbusvalid,session end, id signals
        DBNCE_FLTR_BYPASS: u1,
        /// Enable software controlle USB D+ D- exchange
        EXCHG_PINS_OVERRIDE: u1,
        /// USB D+ D- exchange. 1'b0: don't change, 1'b1: exchange D+ D-.
        EXCHG_PINS: u1,
        /// Control single-end input high threshold,1.76V to 2V, step 80mV.
        VREFH: u2,
        /// Control single-end input low threshold,0.8V to 1.04V, step 80mV.
        VREFL: u2,
        /// Enable software controlle input threshold.
        VREF_OVERRIDE: u1,
        /// Enable software controlle USB D+ D- pullup pulldown.
        PAD_PULL_OVERRIDE: u1,
        /// Controlle USB D+ pullup.
        DP_PULLUP: u1,
        /// Controlle USB D+ pulldown.
        DP_PULLDOWN: u1,
        /// Controlle USB D+ pullup.
        DM_PULLUP: u1,
        /// Controlle USB D+ pulldown.
        DM_PULLDOWN: u1,
        /// Controlle pullup value. 1'b0: typical value is 2.4K, 1'b1: typical value is 1.2K.
        PULLUP_VALUE: u1,
        /// Enable USB pad function.
        USB_PAD_ENABLE: u1,
        /// Force ahb clock always on.
        AHB_CLK_FORCE_ON: u1,
        /// Force phy clock always on.
        PHY_CLK_FORCE_ON: u1,
        /// Select phy tx signal output clock edge. 1'b0: negedge, 1'b1: posedge.
        PHY_TX_EDGE_SEL: u1,
        /// Disable the dfifo to go into low power mode. The data in dfifo will not lost.
        DFIFO_FORCE_PU: u1,
        reserved31: u8 = 0,
        /// Disable auto clock gating of CSR registers.
        CLK_EN: u1,
    }),
    /// USB wrapper test configuration registers.
    /// offset: 0x04
    TEST_CONF: mmio.Mmio(packed struct(u32) {
        /// Enable test of the USB pad.
        TEST_ENABLE: u1,
        /// USB pad oen in test.
        TEST_USB_OE: u1,
        /// USB D+ tx value in test.
        TEST_TX_DP: u1,
        /// USB D- tx value in test.
        TEST_TX_DM: u1,
        /// USB differential rx value in test.
        TEST_RX_RCV: u1,
        /// USB D+ rx value in test.
        TEST_RX_DP: u1,
        /// USB D- rx value in test.
        TEST_RX_DM: u1,
        padding: u25 = 0,
    }),
    /// offset: 0x08
    reserved8: [1012]u8,
    /// Date register.
    /// offset: 0x3fc
    DATE: mmio.Mmio(packed struct(u32) {
        /// Date register.
        USB_WRAP_DATE: u32,
    }),
};
