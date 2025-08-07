const mmio = @import("mmio");
const types = @import("../../types.zig");

/// AHB_DMA Peripheral
pub const AHB_DMA = extern struct {
    /// Raw status interrupt of channel 0
    /// offset: 0x00
    IN_INT_RAW_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0.
        IN_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0. For UHCI0 the raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 0.
        IN_SUC_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data error is detected only in the case that the peripheral is UHCI0 for Rx channel 0. For other peripherals this raw interrupt is reserved.
        IN_ERR_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error including owner error and the second and third word error of inlink descriptor for Rx channel 0.
        IN_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when Rx buffer pointed by inlink is full and receiving data is not completed but there is no more inlink for Rx channel 0.
        IN_DSCR_EMPTY_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_UDF_CH_INT_RAW: u1,
        padding: u25 = 0,
    }),
    /// Masked interrupt of channel 0
    /// offset: 0x04
    IN_INT_ST_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_ST: u1,
        padding: u25 = 0,
    }),
    /// Interrupt enable bits of channel 0
    /// offset: 0x08
    IN_INT_ENA_CH0: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_ENA: u1,
        padding: u25 = 0,
    }),
    /// Interrupt clear bits of channel 0
    /// offset: 0x0c
    IN_INT_CLR_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_CLR: u1,
        padding: u25 = 0,
    }),
    /// Raw status interrupt of channel 0
    /// offset: 0x10
    IN_INT_RAW_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0.
        IN_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0. For UHCI0 the raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 0.
        IN_SUC_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data error is detected only in the case that the peripheral is UHCI0 for Rx channel 0. For other peripherals this raw interrupt is reserved.
        IN_ERR_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error including owner error and the second and third word error of inlink descriptor for Rx channel 0.
        IN_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when Rx buffer pointed by inlink is full and receiving data is not completed but there is no more inlink for Rx channel 0.
        IN_DSCR_EMPTY_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_UDF_CH_INT_RAW: u1,
        padding: u25 = 0,
    }),
    /// Masked interrupt of channel 0
    /// offset: 0x14
    IN_INT_ST_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_ST: u1,
        padding: u25 = 0,
    }),
    /// Interrupt enable bits of channel 0
    /// offset: 0x18
    IN_INT_ENA_CH1: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_ENA: u1,
        padding: u25 = 0,
    }),
    /// Interrupt clear bits of channel 0
    /// offset: 0x1c
    IN_INT_CLR_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_CLR: u1,
        padding: u25 = 0,
    }),
    /// Raw status interrupt of channel 0
    /// offset: 0x20
    IN_INT_RAW_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0.
        IN_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received for Rx channel 0. For UHCI0 the raw interrupt bit turns to high level when the last data pointed by one inlink descriptor has been received and no data error is detected for Rx channel 0.
        IN_SUC_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data error is detected only in the case that the peripheral is UHCI0 for Rx channel 0. For other peripherals this raw interrupt is reserved.
        IN_ERR_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting inlink descriptor error including owner error and the second and third word error of inlink descriptor for Rx channel 0.
        IN_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when Rx buffer pointed by inlink is full and receiving data is not completed but there is no more inlink for Rx channel 0.
        IN_DSCR_EMPTY_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is overflow.
        INFIFO_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Rx channel 0 is underflow.
        INFIFO_UDF_CH_INT_RAW: u1,
        padding: u25 = 0,
    }),
    /// Masked interrupt of channel 0
    /// offset: 0x24
    IN_INT_ST_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_ST: u1,
        padding: u25 = 0,
    }),
    /// Interrupt enable bits of channel 0
    /// offset: 0x28
    IN_INT_ENA_CH2: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_ENA: u1,
        padding: u25 = 0,
    }),
    /// Interrupt clear bits of channel 0
    /// offset: 0x2c
    IN_INT_CLR_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the IN_DONE_CH_INT interrupt.
        IN_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_SUC_EOF_CH_INT interrupt.
        IN_SUC_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_ERR_EOF_CH_INT interrupt.
        IN_ERR_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_ERR_CH_INT interrupt.
        IN_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the IN_DSCR_EMPTY_CH_INT interrupt.
        IN_DSCR_EMPTY_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_OVF_L1_CH_INT interrupt.
        INFIFO_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the INFIFO_UDF_L1_CH_INT interrupt.
        INFIFO_UDF_CH_INT_CLR: u1,
        padding: u25 = 0,
    }),
    /// Raw status interrupt of channel 0
    /// offset: 0x30
    OUT_INT_RAW_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel 0.
        OUT_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel 0.
        OUT_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error including owner error and the second and third word error of outlink descriptor for Tx channel 0.
        OUT_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel 0.
        OUT_TOTAL_EOF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel 0 is overflow.
        OUTFIFO_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel 0 is underflow.
        OUTFIFO_UDF_CH_INT_RAW: u1,
        padding: u26 = 0,
    }),
    /// Masked interrupt of channel 0
    /// offset: 0x34
    OUT_INT_ST_CH0: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_ST: u1,
        padding: u26 = 0,
    }),
    /// Interrupt enable bits of channel 0
    /// offset: 0x38
    OUT_INT_ENA_CH0: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_ENA: u1,
        padding: u26 = 0,
    }),
    /// Interrupt clear bits of channel 0
    /// offset: 0x3c
    OUT_INT_CLR_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_CLR: u1,
        padding: u26 = 0,
    }),
    /// Raw status interrupt of channel 0
    /// offset: 0x40
    OUT_INT_RAW_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel 0.
        OUT_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel 0.
        OUT_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error including owner error and the second and third word error of outlink descriptor for Tx channel 0.
        OUT_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel 0.
        OUT_TOTAL_EOF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel 0 is overflow.
        OUTFIFO_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel 0 is underflow.
        OUTFIFO_UDF_CH_INT_RAW: u1,
        padding: u26 = 0,
    }),
    /// Masked interrupt of channel 0
    /// offset: 0x44
    OUT_INT_ST_CH1: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_ST: u1,
        padding: u26 = 0,
    }),
    /// Interrupt enable bits of channel 0
    /// offset: 0x48
    OUT_INT_ENA_CH1: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_ENA: u1,
        padding: u26 = 0,
    }),
    /// Interrupt clear bits of channel 0
    /// offset: 0x4c
    OUT_INT_CLR_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_CLR: u1,
        padding: u26 = 0,
    }),
    /// Raw status interrupt of channel 0
    /// offset: 0x50
    OUT_INT_RAW_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been transmitted to peripherals for Tx channel 0.
        OUT_DONE_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when the last data pointed by one outlink descriptor has been read from memory for Tx channel 0.
        OUT_EOF_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when detecting outlink descriptor error including owner error and the second and third word error of outlink descriptor for Tx channel 0.
        OUT_DSCR_ERR_CH_INT_RAW: u1,
        /// The raw interrupt bit turns to high level when data corresponding a outlink (includes one link descriptor or few link descriptors) is transmitted out for Tx channel 0.
        OUT_TOTAL_EOF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel 0 is overflow.
        OUTFIFO_OVF_CH_INT_RAW: u1,
        /// This raw interrupt bit turns to high level when level 1 fifo of Tx channel 0 is underflow.
        OUTFIFO_UDF_CH_INT_RAW: u1,
        padding: u26 = 0,
    }),
    /// Masked interrupt of channel 0
    /// offset: 0x54
    OUT_INT_ST_CH2: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_ST: u1,
        /// The raw interrupt status bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_ST: u1,
        padding: u26 = 0,
    }),
    /// Interrupt enable bits of channel 0
    /// offset: 0x58
    OUT_INT_ENA_CH2: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_ENA: u1,
        /// The interrupt enable bit for the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_ENA: u1,
        padding: u26 = 0,
    }),
    /// Interrupt clear bits of channel 0
    /// offset: 0x5c
    OUT_INT_CLR_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the OUT_DONE_CH_INT interrupt.
        OUT_DONE_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_EOF_CH_INT interrupt.
        OUT_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_DSCR_ERR_CH_INT interrupt.
        OUT_DSCR_ERR_CH_INT_CLR: u1,
        /// Set this bit to clear the OUT_TOTAL_EOF_CH_INT interrupt.
        OUT_TOTAL_EOF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_OVF_L1_CH_INT interrupt.
        OUTFIFO_OVF_CH_INT_CLR: u1,
        /// Set this bit to clear the OUTFIFO_UDF_L1_CH_INT interrupt.
        OUTFIFO_UDF_CH_INT_CLR: u1,
        padding: u26 = 0,
    }),
    /// reserved
    /// offset: 0x60
    AHB_TEST: mmio.Mmio(packed struct(u32) {
        /// reserved
        AHB_TESTMODE: u3,
        reserved4: u1 = 0,
        /// reserved
        AHB_TESTADDR: u2,
        padding: u26 = 0,
    }),
    /// MISC register
    /// offset: 0x64
    MISC_CONF: mmio.Mmio(packed struct(u32) {
        /// Set this bit then clear this bit to reset the internal ahb FSM.
        AHBM_RST_INTER: u1,
        reserved2: u1 = 0,
        /// Set this bit to disable priority arbitration function.
        ARB_PRI_DIS: u1,
        /// 1'h1: Force clock on for register. 1'h0: Support clock only when application writes registers.
        CLK_EN: u1,
        padding: u28 = 0,
    }),
    /// Version control register
    /// offset: 0x68
    DATE: mmio.Mmio(packed struct(u32) {
        /// register version.
        DATE: u32,
    }),
    /// offset: 0x6c
    reserved108: [4]u8,
    /// Configure 0 register of Rx channel 0
    /// offset: 0x70
    IN_CONF0_CH0: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AHB_DMA channel 0 Rx FSM and Rx FIFO pointer.
        IN_RST_CH: u1,
        /// reserved
        IN_LOOP_TEST_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Rx channel 0 reading link descriptor when accessing internal SRAM.
        INDSCR_BURST_EN_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Rx channel 0 receiving data when accessing internal SRAM.
        IN_DATA_BURST_EN_CH: u1,
        /// Set this bit 1 to enable automatic transmitting data from memory to memory via AHB_DMA.
        MEM_TRANS_EN_CH: u1,
        /// Set this bit to 1 to enable etm control mode, dma Rx channel 0 is triggered by etm task.
        IN_ETM_EN_CH: u1,
        padding: u26 = 0,
    }),
    /// Configure 1 register of Rx channel 0
    /// offset: 0x74
    IN_CONF1_CH0: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Receive FIFO status of Rx channel 0
    /// offset: 0x78
    INFIFO_STATUS_CH0: mmio.Mmio(packed struct(u32) {
        /// L1 Rx FIFO full signal for Rx channel 0.
        INFIFO_FULL_CH: u1,
        /// L1 Rx FIFO empty signal for Rx channel 0.
        INFIFO_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L1 Rx FIFO for Rx channel 0.
        INFIFO_CNT_CH: u6,
        reserved23: u15 = 0,
        /// reserved
        IN_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_4B_CH: u1,
        /// reserved
        IN_BUF_HUNGRY_CH: u1,
        padding: u4 = 0,
    }),
    /// Pop control register of Rx channel 0
    /// offset: 0x7c
    IN_POP_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from AHB_DMA FIFO.
        INFIFO_RDATA_CH: u12,
        /// Set this bit to pop data from AHB_DMA FIFO.
        INFIFO_POP_CH: u1,
        padding: u19 = 0,
    }),
    /// Link descriptor configure and control register of Rx channel 0
    /// offset: 0x80
    IN_LINK_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to return to current inlink descriptor's address when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH: u1,
        padding: u27 = 0,
    }),
    /// Receive status of Rx channel 0
    /// offset: 0x84
    IN_STATE_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH: u18,
        /// reserved
        IN_DSCR_STATE_CH: u2,
        /// reserved
        IN_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Inlink descriptor address when EOF occurs of Rx channel 0
    /// offset: 0x88
    IN_SUC_EOF_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH: u32,
    }),
    /// Inlink descriptor address when errors occur of Rx channel 0
    /// offset: 0x8c
    IN_ERR_EOF_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data. Only used when peripheral is UHCI0.
        IN_ERR_EOF_DES_ADDR_CH: u32,
    }),
    /// Current inlink descriptor address of Rx channel 0
    /// offset: 0x90
    IN_DSCR_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the current inlink descriptor x.
        INLINK_DSCR_CH: u32,
    }),
    /// The last inlink descriptor address of Rx channel 0
    /// offset: 0x94
    IN_DSCR_BF0_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor x-1.
        INLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last inlink descriptor address of Rx channel 0
    /// offset: 0x98
    IN_DSCR_BF1_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor x-2.
        INLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Rx channel 0
    /// offset: 0x9c
    IN_PRI_CH0: mmio.Mmio(packed struct(u32) {
        /// The priority of Rx channel 0. The larger of the value the higher of the priority.
        RX_PRI_CH: u4,
        padding: u28 = 0,
    }),
    /// Peripheral selection of Rx channel 0
    /// offset: 0xa0
    IN_PERI_SEL_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Rx channel 0. I3C. 1: Dummy. 2: UHCI0. 3: I2S0. 4: I2S1. 5: I2S2. 6: Dummy. 7: Dummy. 8: ADC_DAC. 9: Dummy. 10: RMT,11~15: Dummy
        PERI_IN_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// offset: 0xa4
    reserved164: [44]u8,
    /// Configure 0 register of Tx channel 0
    /// offset: 0xd0
    OUT_CONF0_CH0: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AHB_DMA channel 0 Tx FSM and Tx FIFO pointer.
        OUT_RST_CH0: u1,
        /// reserved
        OUT_LOOP_TEST_CH0: u1,
        /// Set this bit to enable automatic outlink-writeback when all the data in tx buffer has been transmitted.
        OUT_AUTO_WRBACK_CH0: u1,
        /// EOF flag generation mode when transmitting data. 1: EOF flag for Tx channel 0 is generated when data need to transmit has been popped from FIFO in AHB_DMA
        OUT_EOF_MODE_CH0: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 0 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH0: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 0 transmitting data when accessing internal SRAM.
        OUT_DATA_BURST_EN_CH0: u1,
        /// Set this bit to 1 to enable etm control mode, dma Tx channel 0 is triggered by etm task.
        OUT_ETM_EN_CH0: u1,
        padding: u25 = 0,
    }),
    /// Configure 1 register of Tx channel 0
    /// offset: 0xd4
    OUT_CONF1_CH0: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Transmit FIFO status of Tx channel 0
    /// offset: 0xd8
    OUTFIFO_STATUS_CH0: mmio.Mmio(packed struct(u32) {
        /// L1 Tx FIFO full signal for Tx channel 0.
        OUTFIFO_FULL_CH: u1,
        /// L1 Tx FIFO empty signal for Tx channel 0.
        OUTFIFO_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L1 Tx FIFO for Tx channel 0.
        OUTFIFO_CNT_CH: u6,
        reserved23: u15 = 0,
        /// reserved
        OUT_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_4B_CH: u1,
        padding: u5 = 0,
    }),
    /// Push control register of Rx channel 0
    /// offset: 0xdc
    OUT_PUSH_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into AHB_DMA FIFO.
        OUTFIFO_WDATA_CH: u9,
        /// Set this bit to push data into AHB_DMA FIFO.
        OUTFIFO_PUSH_CH: u1,
        padding: u22 = 0,
    }),
    /// Link descriptor configure and control register of Tx channel 0
    /// offset: 0xe0
    OUT_LINK_CH0: mmio.Mmio(packed struct(u32) {
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH: u1,
        padding: u28 = 0,
    }),
    /// Transmit status of Tx channel 0
    /// offset: 0xe4
    OUT_STATE_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH: u18,
        /// reserved
        OUT_DSCR_STATE_CH: u2,
        /// reserved
        OUT_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Outlink descriptor address when EOF occurs of Tx channel 0
    /// offset: 0xe8
    OUT_EOF_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH: u32,
    }),
    /// The last outlink descriptor address when EOF occurs of Tx channel 0
    /// offset: 0xec
    OUT_EOF_BFR_DES_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor before the last outlink descriptor.
        OUT_EOF_BFR_DES_ADDR_CH: u32,
    }),
    /// Current inlink descriptor address of Tx channel 0
    /// offset: 0xf0
    OUT_DSCR_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the current outlink descriptor y.
        OUTLINK_DSCR_CH: u32,
    }),
    /// The last inlink descriptor address of Tx channel 0
    /// offset: 0xf4
    OUT_DSCR_BF0_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor y-1.
        OUTLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last inlink descriptor address of Tx channel 0
    /// offset: 0xf8
    OUT_DSCR_BF1_CH0: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor x-2.
        OUTLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Tx channel 0.
    /// offset: 0xfc
    OUT_PRI_CH0: mmio.Mmio(packed struct(u32) {
        /// The priority of Tx channel 0. The larger of the value the higher of the priority.
        TX_PRI_CH: u4,
        padding: u28 = 0,
    }),
    /// Peripheral selection of Tx channel 0
    /// offset: 0x100
    OUT_PERI_SEL_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Tx channel 0. I3C. 1: Dummy. 2: UHCI0. 3: I2S0. 4: I2S1. 5: I2S2. 6: Dummy. 7: Dummy. 8: ADC_DAC. 9: Dummy. 10: RMT,11~15: Dummy
        PERI_OUT_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// offset: 0x104
    reserved260: [44]u8,
    /// Configure 0 register of Rx channel 0
    /// offset: 0x130
    IN_CONF0_CH1: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AHB_DMA channel 0 Rx FSM and Rx FIFO pointer.
        IN_RST_CH: u1,
        /// reserved
        IN_LOOP_TEST_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Rx channel 0 reading link descriptor when accessing internal SRAM.
        INDSCR_BURST_EN_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Rx channel 0 receiving data when accessing internal SRAM.
        IN_DATA_BURST_EN_CH: u1,
        /// Set this bit 1 to enable automatic transmitting data from memory to memory via AHB_DMA.
        MEM_TRANS_EN_CH: u1,
        /// Set this bit to 1 to enable etm control mode, dma Rx channel 0 is triggered by etm task.
        IN_ETM_EN_CH: u1,
        padding: u26 = 0,
    }),
    /// Configure 1 register of Rx channel 0
    /// offset: 0x134
    IN_CONF1_CH1: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Receive FIFO status of Rx channel 0
    /// offset: 0x138
    INFIFO_STATUS_CH1: mmio.Mmio(packed struct(u32) {
        /// L1 Rx FIFO full signal for Rx channel 0.
        INFIFO_FULL_CH: u1,
        /// L1 Rx FIFO empty signal for Rx channel 0.
        INFIFO_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L1 Rx FIFO for Rx channel 0.
        INFIFO_CNT_CH: u6,
        reserved23: u15 = 0,
        /// reserved
        IN_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_4B_CH: u1,
        /// reserved
        IN_BUF_HUNGRY_CH: u1,
        padding: u4 = 0,
    }),
    /// Pop control register of Rx channel 0
    /// offset: 0x13c
    IN_POP_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from AHB_DMA FIFO.
        INFIFO_RDATA_CH: u12,
        /// Set this bit to pop data from AHB_DMA FIFO.
        INFIFO_POP_CH: u1,
        padding: u19 = 0,
    }),
    /// Link descriptor configure and control register of Rx channel 0
    /// offset: 0x140
    IN_LINK_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to return to current inlink descriptor's address when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH: u1,
        padding: u27 = 0,
    }),
    /// Receive status of Rx channel 0
    /// offset: 0x144
    IN_STATE_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH: u18,
        /// reserved
        IN_DSCR_STATE_CH: u2,
        /// reserved
        IN_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Inlink descriptor address when EOF occurs of Rx channel 0
    /// offset: 0x148
    IN_SUC_EOF_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH: u32,
    }),
    /// Inlink descriptor address when errors occur of Rx channel 0
    /// offset: 0x14c
    IN_ERR_EOF_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data. Only used when peripheral is UHCI0.
        IN_ERR_EOF_DES_ADDR_CH: u32,
    }),
    /// Current inlink descriptor address of Rx channel 0
    /// offset: 0x150
    IN_DSCR_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the current inlink descriptor x.
        INLINK_DSCR_CH: u32,
    }),
    /// The last inlink descriptor address of Rx channel 0
    /// offset: 0x154
    IN_DSCR_BF0_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor x-1.
        INLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last inlink descriptor address of Rx channel 0
    /// offset: 0x158
    IN_DSCR_BF1_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor x-2.
        INLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Rx channel 0
    /// offset: 0x15c
    IN_PRI_CH1: mmio.Mmio(packed struct(u32) {
        /// The priority of Rx channel 0. The larger of the value the higher of the priority.
        RX_PRI_CH: u4,
        padding: u28 = 0,
    }),
    /// Peripheral selection of Rx channel 0
    /// offset: 0x160
    IN_PERI_SEL_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Rx channel 0. I3C. 1: Dummy. 2: UHCI0. 3: I2S0. 4: I2S1. 5: I2S2. 6: Dummy. 7: Dummy. 8: ADC_DAC. 9: Dummy. 10: RMT,11~15: Dummy
        PERI_IN_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// offset: 0x164
    reserved356: [44]u8,
    /// Configure 0 register of Tx channel 1
    /// offset: 0x190
    OUT_CONF0_CH0: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AHB_DMA channel 1 Tx FSM and Tx FIFO pointer.
        OUT_RST_CH: u1,
        /// reserved
        OUT_LOOP_TEST_CH: u1,
        /// Set this bit to enable automatic outlink-writeback when all the data in tx buffer has been transmitted.
        OUT_AUTO_WRBACK_CH: u1,
        /// EOF flag generation mode when transmitting data. 1: EOF flag for Tx channel 1 is generated when data need to transmit has been popped from FIFO in AHB_DMA
        OUT_EOF_MODE_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 1 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 1 transmitting data when accessing internal SRAM.
        OUT_DATA_BURST_EN_CH: u1,
        /// Set this bit to 1 to enable etm control mode, dma Tx channel 1 is triggered by etm task.
        OUT_ETM_EN_CH: u1,
        padding: u25 = 0,
    }),
    /// Configure 1 register of Tx channel 0
    /// offset: 0x194
    OUT_CONF1_CH1: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Transmit FIFO status of Tx channel 0
    /// offset: 0x198
    OUTFIFO_STATUS_CH1: mmio.Mmio(packed struct(u32) {
        /// L1 Tx FIFO full signal for Tx channel 0.
        OUTFIFO_FULL_CH: u1,
        /// L1 Tx FIFO empty signal for Tx channel 0.
        OUTFIFO_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L1 Tx FIFO for Tx channel 0.
        OUTFIFO_CNT_CH: u6,
        reserved23: u15 = 0,
        /// reserved
        OUT_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_4B_CH: u1,
        padding: u5 = 0,
    }),
    /// Push control register of Rx channel 0
    /// offset: 0x19c
    OUT_PUSH_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into AHB_DMA FIFO.
        OUTFIFO_WDATA_CH: u9,
        /// Set this bit to push data into AHB_DMA FIFO.
        OUTFIFO_PUSH_CH: u1,
        padding: u22 = 0,
    }),
    /// Link descriptor configure and control register of Tx channel 0
    /// offset: 0x1a0
    OUT_LINK_CH1: mmio.Mmio(packed struct(u32) {
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH: u1,
        padding: u28 = 0,
    }),
    /// Transmit status of Tx channel 0
    /// offset: 0x1a4
    OUT_STATE_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH: u18,
        /// reserved
        OUT_DSCR_STATE_CH: u2,
        /// reserved
        OUT_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Outlink descriptor address when EOF occurs of Tx channel 0
    /// offset: 0x1a8
    OUT_EOF_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH: u32,
    }),
    /// The last outlink descriptor address when EOF occurs of Tx channel 0
    /// offset: 0x1ac
    OUT_EOF_BFR_DES_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor before the last outlink descriptor.
        OUT_EOF_BFR_DES_ADDR_CH: u32,
    }),
    /// Current inlink descriptor address of Tx channel 0
    /// offset: 0x1b0
    OUT_DSCR_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the current outlink descriptor y.
        OUTLINK_DSCR_CH: u32,
    }),
    /// The last inlink descriptor address of Tx channel 0
    /// offset: 0x1b4
    OUT_DSCR_BF0_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor y-1.
        OUTLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last inlink descriptor address of Tx channel 0
    /// offset: 0x1b8
    OUT_DSCR_BF1_CH1: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor x-2.
        OUTLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Tx channel 0.
    /// offset: 0x1bc
    OUT_PRI_CH1: mmio.Mmio(packed struct(u32) {
        /// The priority of Tx channel 0. The larger of the value the higher of the priority.
        TX_PRI_CH: u4,
        padding: u28 = 0,
    }),
    /// Peripheral selection of Tx channel 0
    /// offset: 0x1c0
    OUT_PERI_SEL_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Tx channel 0. I3C. 1: Dummy. 2: UHCI0. 3: I2S0. 4: I2S1. 5: I2S2. 6: Dummy. 7: Dummy. 8: ADC_DAC. 9: Dummy. 10: RMT,11~15: Dummy
        PERI_OUT_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// offset: 0x1c4
    reserved452: [44]u8,
    /// Configure 0 register of Rx channel 0
    /// offset: 0x1f0
    IN_CONF0_CH2: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AHB_DMA channel 0 Rx FSM and Rx FIFO pointer.
        IN_RST_CH: u1,
        /// reserved
        IN_LOOP_TEST_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Rx channel 0 reading link descriptor when accessing internal SRAM.
        INDSCR_BURST_EN_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Rx channel 0 receiving data when accessing internal SRAM.
        IN_DATA_BURST_EN_CH: u1,
        /// Set this bit 1 to enable automatic transmitting data from memory to memory via AHB_DMA.
        MEM_TRANS_EN_CH: u1,
        /// Set this bit to 1 to enable etm control mode, dma Rx channel 0 is triggered by etm task.
        IN_ETM_EN_CH: u1,
        padding: u26 = 0,
    }),
    /// Configure 1 register of Rx channel 0
    /// offset: 0x1f4
    IN_CONF1_CH2: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        IN_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Receive FIFO status of Rx channel 0
    /// offset: 0x1f8
    INFIFO_STATUS_CH2: mmio.Mmio(packed struct(u32) {
        /// L1 Rx FIFO full signal for Rx channel 0.
        INFIFO_FULL_CH: u1,
        /// L1 Rx FIFO empty signal for Rx channel 0.
        INFIFO_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L1 Rx FIFO for Rx channel 0.
        INFIFO_CNT_CH: u6,
        reserved23: u15 = 0,
        /// reserved
        IN_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        IN_REMAIN_UNDER_4B_CH: u1,
        /// reserved
        IN_BUF_HUNGRY_CH: u1,
        padding: u4 = 0,
    }),
    /// Pop control register of Rx channel 0
    /// offset: 0x1fc
    IN_POP_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the data popping from AHB_DMA FIFO.
        INFIFO_RDATA_CH: u12,
        /// Set this bit to pop data from AHB_DMA FIFO.
        INFIFO_POP_CH: u1,
        padding: u19 = 0,
    }),
    /// Link descriptor configure and control register of Rx channel 0
    /// offset: 0x200
    IN_LINK_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to return to current inlink descriptor's address when there are some errors in current receiving data.
        INLINK_AUTO_RET_CH: u1,
        /// Set this bit to stop dealing with the inlink descriptors.
        INLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the inlink descriptors.
        INLINK_START_CH: u1,
        /// Set this bit to mount a new inlink descriptor.
        INLINK_RESTART_CH: u1,
        /// 1: the inlink descriptor's FSM is in idle state. 0: the inlink descriptor's FSM is working.
        INLINK_PARK_CH: u1,
        padding: u27 = 0,
    }),
    /// Receive status of Rx channel 0
    /// offset: 0x204
    IN_STATE_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the current inlink descriptor's address.
        INLINK_DSCR_ADDR_CH: u18,
        /// reserved
        IN_DSCR_STATE_CH: u2,
        /// reserved
        IN_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Inlink descriptor address when EOF occurs of Rx channel 0
    /// offset: 0x208
    IN_SUC_EOF_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when the EOF bit in this descriptor is 1.
        IN_SUC_EOF_DES_ADDR_CH: u32,
    }),
    /// Inlink descriptor address when errors occur of Rx channel 0
    /// offset: 0x20c
    IN_ERR_EOF_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the inlink descriptor when there are some errors in current receiving data. Only used when peripheral is UHCI0.
        IN_ERR_EOF_DES_ADDR_CH: u32,
    }),
    /// Current inlink descriptor address of Rx channel 0
    /// offset: 0x210
    IN_DSCR_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the current inlink descriptor x.
        INLINK_DSCR_CH: u32,
    }),
    /// The last inlink descriptor address of Rx channel 0
    /// offset: 0x214
    IN_DSCR_BF0_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the last inlink descriptor x-1.
        INLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last inlink descriptor address of Rx channel 0
    /// offset: 0x218
    IN_DSCR_BF1_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor x-2.
        INLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Rx channel 0
    /// offset: 0x21c
    IN_PRI_CH2: mmio.Mmio(packed struct(u32) {
        /// The priority of Rx channel 0. The larger of the value the higher of the priority.
        RX_PRI_CH: u4,
        padding: u28 = 0,
    }),
    /// Peripheral selection of Rx channel 0
    /// offset: 0x220
    IN_PERI_SEL_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Rx channel 0. I3C. 1: Dummy. 2: UHCI0. 3: I2S0. 4: I2S1. 5: I2S2. 6: Dummy. 7: Dummy. 8: ADC_DAC. 9: Dummy. 10: RMT,11~15: Dummy
        PERI_IN_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// offset: 0x224
    reserved548: [44]u8,
    /// Configure 0 register of Tx channel 1
    /// offset: 0x250
    OUT_CONF0_CH1: mmio.Mmio(packed struct(u32) {
        /// This bit is used to reset AHB_DMA channel 1 Tx FSM and Tx FIFO pointer.
        OUT_RST_CH: u1,
        /// reserved
        OUT_LOOP_TEST_CH: u1,
        /// Set this bit to enable automatic outlink-writeback when all the data in tx buffer has been transmitted.
        OUT_AUTO_WRBACK_CH: u1,
        /// EOF flag generation mode when transmitting data. 1: EOF flag for Tx channel 1 is generated when data need to transmit has been popped from FIFO in AHB_DMA
        OUT_EOF_MODE_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 1 reading link descriptor when accessing internal SRAM.
        OUTDSCR_BURST_EN_CH: u1,
        /// Set this bit to 1 to enable INCR burst transfer for Tx channel 1 transmitting data when accessing internal SRAM.
        OUT_DATA_BURST_EN_CH: u1,
        /// Set this bit to 1 to enable etm control mode, dma Tx channel 1 is triggered by etm task.
        OUT_ETM_EN_CH: u1,
        padding: u25 = 0,
    }),
    /// Configure 1 register of Tx channel 0
    /// offset: 0x254
    OUT_CONF1_CH2: mmio.Mmio(packed struct(u32) {
        reserved12: u12 = 0,
        /// Set this bit to enable checking the owner attribute of the link descriptor.
        OUT_CHECK_OWNER_CH: u1,
        padding: u19 = 0,
    }),
    /// Transmit FIFO status of Tx channel 0
    /// offset: 0x258
    OUTFIFO_STATUS_CH2: mmio.Mmio(packed struct(u32) {
        /// L1 Tx FIFO full signal for Tx channel 0.
        OUTFIFO_FULL_CH: u1,
        /// L1 Tx FIFO empty signal for Tx channel 0.
        OUTFIFO_EMPTY_CH: u1,
        /// The register stores the byte number of the data in L1 Tx FIFO for Tx channel 0.
        OUTFIFO_CNT_CH: u6,
        reserved23: u15 = 0,
        /// reserved
        OUT_REMAIN_UNDER_1B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_2B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_3B_CH: u1,
        /// reserved
        OUT_REMAIN_UNDER_4B_CH: u1,
        padding: u5 = 0,
    }),
    /// Push control register of Rx channel 0
    /// offset: 0x25c
    OUT_PUSH_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the data that need to be pushed into AHB_DMA FIFO.
        OUTFIFO_WDATA_CH: u9,
        /// Set this bit to push data into AHB_DMA FIFO.
        OUTFIFO_PUSH_CH: u1,
        padding: u22 = 0,
    }),
    /// Link descriptor configure and control register of Tx channel 0
    /// offset: 0x260
    OUT_LINK_CH2: mmio.Mmio(packed struct(u32) {
        /// Set this bit to stop dealing with the outlink descriptors.
        OUTLINK_STOP_CH: u1,
        /// Set this bit to start dealing with the outlink descriptors.
        OUTLINK_START_CH: u1,
        /// Set this bit to restart a new outlink from the last address.
        OUTLINK_RESTART_CH: u1,
        /// 1: the outlink descriptor's FSM is in idle state. 0: the outlink descriptor's FSM is working.
        OUTLINK_PARK_CH: u1,
        padding: u28 = 0,
    }),
    /// Transmit status of Tx channel 0
    /// offset: 0x264
    OUT_STATE_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the current outlink descriptor's address.
        OUTLINK_DSCR_ADDR_CH: u18,
        /// reserved
        OUT_DSCR_STATE_CH: u2,
        /// reserved
        OUT_STATE_CH: u3,
        padding: u9 = 0,
    }),
    /// Outlink descriptor address when EOF occurs of Tx channel 0
    /// offset: 0x268
    OUT_EOF_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor when the EOF bit in this descriptor is 1.
        OUT_EOF_DES_ADDR_CH: u32,
    }),
    /// The last outlink descriptor address when EOF occurs of Tx channel 0
    /// offset: 0x26c
    OUT_EOF_BFR_DES_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the address of the outlink descriptor before the last outlink descriptor.
        OUT_EOF_BFR_DES_ADDR_CH: u32,
    }),
    /// Current inlink descriptor address of Tx channel 0
    /// offset: 0x270
    OUT_DSCR_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the current outlink descriptor y.
        OUTLINK_DSCR_CH: u32,
    }),
    /// The last inlink descriptor address of Tx channel 0
    /// offset: 0x274
    OUT_DSCR_BF0_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the last outlink descriptor y-1.
        OUTLINK_DSCR_BF0_CH: u32,
    }),
    /// The second-to-last inlink descriptor address of Tx channel 0
    /// offset: 0x278
    OUT_DSCR_BF1_CH2: mmio.Mmio(packed struct(u32) {
        /// The address of the second-to-last inlink descriptor x-2.
        OUTLINK_DSCR_BF1_CH: u32,
    }),
    /// Priority register of Tx channel 0.
    /// offset: 0x27c
    OUT_PRI_CH2: mmio.Mmio(packed struct(u32) {
        /// The priority of Tx channel 0. The larger of the value the higher of the priority.
        TX_PRI_CH: u4,
        padding: u28 = 0,
    }),
    /// Peripheral selection of Tx channel 0
    /// offset: 0x280
    OUT_PERI_SEL_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to select peripheral for Tx channel 0. I3C. 1: Dummy. 2: UHCI0. 3: I2S0. 4: I2S1. 5: I2S2. 6: Dummy. 7: Dummy. 8: ADC_DAC. 9: Dummy. 10: RMT,11~15: Dummy
        PERI_OUT_SEL_CH: u6,
        padding: u26 = 0,
    }),
    /// offset: 0x284
    reserved644: [56]u8,
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x2bc
    OUT_CRC_INIT_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of tx crc initial value
        OUT_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig tx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x2c0
    TX_CRC_WIDTH_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_WIDTH_CH: u2,
        /// reserved
        TX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x2c4
    OUT_CRC_CLEAR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of tx crc result
        OUT_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x2c8
    OUT_CRC_FINAL_RESULT_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of tx
        OUT_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x2cc
    TX_CRC_EN_WR_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable tx ch0 crc 32bit on/off
        TX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x2d0
    TX_CRC_EN_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x2d4
    TX_CRC_DATA_EN_WR_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_WR_DATA_CH: u8,
        padding: u24 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x2d8
    TX_CRC_DATA_EN_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// This register is used to config ch0 arbiter weigh
    /// offset: 0x2dc
    TX_CH_ARB_WEIGH_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CH_ARB_WEIGH_CH: u4,
        padding: u28 = 0,
    }),
    /// This register is used to config off or on weigh optimization
    /// offset: 0x2e0
    TX_ARB_WEIGH_OPT_DIR_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x2e4
    OUT_CRC_INIT_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of tx crc initial value
        OUT_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig tx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x2e8
    TX_CRC_WIDTH_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_WIDTH_CH: u2,
        /// reserved
        TX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x2ec
    OUT_CRC_CLEAR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of tx crc result
        OUT_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x2f0
    OUT_CRC_FINAL_RESULT_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of tx
        OUT_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x2f4
    TX_CRC_EN_WR_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable tx ch0 crc 32bit on/off
        TX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x2f8
    TX_CRC_EN_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x2fc
    TX_CRC_DATA_EN_WR_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_WR_DATA_CH: u8,
        padding: u24 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x300
    TX_CRC_DATA_EN_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// This register is used to config ch0 arbiter weigh
    /// offset: 0x304
    TX_CH_ARB_WEIGH_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CH_ARB_WEIGH_CH: u4,
        padding: u28 = 0,
    }),
    /// This register is used to config off or on weigh optimization
    /// offset: 0x308
    TX_ARB_WEIGH_OPT_DIR_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x30c
    OUT_CRC_INIT_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of tx crc initial value
        OUT_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig tx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x310
    TX_CRC_WIDTH_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_WIDTH_CH: u2,
        /// reserved
        TX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x314
    OUT_CRC_CLEAR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of tx crc result
        OUT_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x318
    OUT_CRC_FINAL_RESULT_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of tx
        OUT_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x31c
    TX_CRC_EN_WR_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable tx ch0 crc 32bit on/off
        TX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x320
    TX_CRC_EN_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x324
    TX_CRC_DATA_EN_WR_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_WR_DATA_CH: u8,
        padding: u24 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x328
    TX_CRC_DATA_EN_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// This register is used to config ch0 arbiter weigh
    /// offset: 0x32c
    TX_CH_ARB_WEIGH_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_CH_ARB_WEIGH_CH: u4,
        padding: u28 = 0,
    }),
    /// This register is used to config off or on weigh optimization
    /// offset: 0x330
    TX_ARB_WEIGH_OPT_DIR_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        TX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x334
    IN_CRC_INIT_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of rx crc initial value
        IN_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig rx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x338
    RX_CRC_WIDTH_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_WIDTH_CH: u2,
        /// reserved
        RX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x33c
    IN_CRC_CLEAR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of rx crc result
        IN_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x340
    IN_CRC_FINAL_RESULT_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of rx
        IN_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x344
    RX_CRC_EN_WR_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable rx ch0 crc 32bit on/off
        RX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x348
    RX_CRC_EN_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x34c
    RX_CRC_DATA_EN_WR_DATA_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_WR_DATA_CH: u8,
        padding: u24 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x350
    RX_CRC_DATA_EN_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// This register is used to config ch0 arbiter weigh
    /// offset: 0x354
    RX_CH_ARB_WEIGH_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CH_ARB_WEIGH_CH: u4,
        padding: u28 = 0,
    }),
    /// This register is used to config off or on weigh optimization
    /// offset: 0x358
    RX_ARB_WEIGH_OPT_DIR_CH0: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x35c
    IN_CRC_INIT_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of rx crc initial value
        IN_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig rx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x360
    RX_CRC_WIDTH_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_WIDTH_CH: u2,
        /// reserved
        RX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x364
    IN_CRC_CLEAR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of rx crc result
        IN_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x368
    IN_CRC_FINAL_RESULT_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of rx
        IN_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x36c
    RX_CRC_EN_WR_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable rx ch0 crc 32bit on/off
        RX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x370
    RX_CRC_EN_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x374
    RX_CRC_DATA_EN_WR_DATA_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_WR_DATA_CH: u8,
        padding: u24 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x378
    RX_CRC_DATA_EN_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// This register is used to config ch0 arbiter weigh
    /// offset: 0x37c
    RX_CH_ARB_WEIGH_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CH_ARB_WEIGH_CH: u4,
        padding: u28 = 0,
    }),
    /// This register is used to config off or on weigh optimization
    /// offset: 0x380
    RX_ARB_WEIGH_OPT_DIR_CH1: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to config ch0 crc initial data(max 32 bit)
    /// offset: 0x384
    IN_CRC_INIT_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to config ch0 of rx crc initial value
        IN_CRC_INIT_DATA_CH: u32,
    }),
    /// This register is used to confiig rx ch0 crc result width,2'b00 mean crc_width <=8bit,2'b01 8<crc_width<=16 ,2'b10 mean 16<crc_width <=24,2'b11 mean 24<crc_width<=32
    /// offset: 0x388
    RX_CRC_WIDTH_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_WIDTH_CH: u2,
        /// reserved
        RX_CRC_LAUTCH_FLGA_CH: u1,
        padding: u29 = 0,
    }),
    /// This register is used to clear ch0 crc result
    /// offset: 0x38c
    IN_CRC_CLEAR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to clear ch0 of rx crc result
        IN_CRC_CLEAR_CH: u1,
        padding: u31 = 0,
    }),
    /// This register is used to store ch0 crc result
    /// offset: 0x390
    IN_CRC_FINAL_RESULT_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to store result ch0 of rx
        IN_CRC_FINAL_RESULT_CH: u32,
    }),
    /// This resister is used to config ch0 crc en for every bit
    /// offset: 0x394
    RX_CRC_EN_WR_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// This register is used to enable rx ch0 crc 32bit on/off
        RX_CRC_EN_WR_DATA_CH: u32,
    }),
    /// This register is used to config ch0 crc en addr
    /// offset: 0x398
    RX_CRC_EN_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_EN_ADDR_CH: u32,
    }),
    /// This register is used to config crc data_8bit en
    /// offset: 0x39c
    RX_CRC_DATA_EN_WR_DATA_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_WR_DATA_CH: u8,
        padding: u24 = 0,
    }),
    /// This register is used to config addr of crc data_8bit en
    /// offset: 0x3a0
    RX_CRC_DATA_EN_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CRC_DATA_EN_ADDR_CH: u32,
    }),
    /// This register is used to config ch0 arbiter weigh
    /// offset: 0x3a4
    RX_CH_ARB_WEIGH_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_CH_ARB_WEIGH_CH: u4,
        padding: u28 = 0,
    }),
    /// This register is used to config off or on weigh optimization
    /// offset: 0x3a8
    RX_ARB_WEIGH_OPT_DIR_CH2: mmio.Mmio(packed struct(u32) {
        /// reserved
        RX_ARB_WEIGH_OPT_DIR_CH: u1,
        padding: u31 = 0,
    }),
    /// Link descriptor configure of Rx channel 0
    /// offset: 0x3ac
    IN_LINK_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the 32 least significant bits of the first inlink descriptor's address.
        INLINK_ADDR_CH: u32,
    }),
    /// Link descriptor configure of Rx channel 0
    /// offset: 0x3b0
    IN_LINK_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the 32 least significant bits of the first inlink descriptor's address.
        INLINK_ADDR_CH: u32,
    }),
    /// Link descriptor configure of Rx channel 0
    /// offset: 0x3b4
    IN_LINK_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the 32 least significant bits of the first inlink descriptor's address.
        INLINK_ADDR_CH: u32,
    }),
    /// Link descriptor configure of Tx channel 0
    /// offset: 0x3b8
    OUT_LINK_ADDR_CH0: mmio.Mmio(packed struct(u32) {
        /// This register stores the 32 least significant bits of the first outlink descriptor's address.
        OUTLINK_ADDR_CH: u32,
    }),
    /// Link descriptor configure of Tx channel 0
    /// offset: 0x3bc
    OUT_LINK_ADDR_CH1: mmio.Mmio(packed struct(u32) {
        /// This register stores the 32 least significant bits of the first outlink descriptor's address.
        OUTLINK_ADDR_CH: u32,
    }),
    /// Link descriptor configure of Tx channel 0
    /// offset: 0x3c0
    OUT_LINK_ADDR_CH2: mmio.Mmio(packed struct(u32) {
        /// This register stores the 32 least significant bits of the first outlink descriptor's address.
        OUTLINK_ADDR_CH: u32,
    }),
    /// The start address of accessible address space.
    /// offset: 0x3c4
    INTR_MEM_START_ADDR: mmio.Mmio(packed struct(u32) {
        /// The start address of accessible address space.
        ACCESS_INTR_MEM_START_ADDR: u32,
    }),
    /// The end address of accessible address space. The access address beyond this range would lead to descriptor error.
    /// offset: 0x3c8
    INTR_MEM_END_ADDR: mmio.Mmio(packed struct(u32) {
        /// The end address of accessible address space. The access address beyond this range would lead to descriptor error.
        ACCESS_INTR_MEM_END_ADDR: u32,
    }),
    /// This retister is used to config arbiter time slice for tx dir
    /// offset: 0x3cc
    ARB_TIMEOUT_TX: mmio.Mmio(packed struct(u32) {
        /// This register is used to config arbiter time out value
        ARB_TIMEOUT_TX: u16,
        padding: u16 = 0,
    }),
    /// This retister is used to config arbiter time slice for rx dir
    /// offset: 0x3d0
    ARB_TIMEOUT_RX: mmio.Mmio(packed struct(u32) {
        /// This register is used to config arbiter time out value
        ARB_TIMEOUT_RX: u16,
        padding: u16 = 0,
    }),
    /// This register is used to config arbiter weigh function to on or off for tx dir
    /// offset: 0x3d4
    WEIGHT_EN_TX: mmio.Mmio(packed struct(u32) {
        /// This register is used to config arbiter weight function off/on
        WEIGHT_EN_TX: u1,
        padding: u31 = 0,
    }),
    /// This register is used to config arbiter weigh function to on or off for rx dir
    /// offset: 0x3d8
    WEIGHT_EN_RX: mmio.Mmio(packed struct(u32) {
        /// This register is used to config arbiter weight function off/on
        WEIGHT_EN_RX: u1,
        padding: u31 = 0,
    }),
};
