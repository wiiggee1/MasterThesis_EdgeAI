const mmio = @import("mmio");
const types = @import("../../types.zig");

/// I3C Controller (Slave)
pub const I3C_SLV = extern struct {
    /// offset: 0x00
    reserved0: [4]u8,
    /// NA
    /// offset: 0x04
    CONFIG: mmio.Mmio(packed struct(u32) {
        /// 1: allow the slave to operate on i2c or i3c bus. 0: the slave will ignore the bus. This should be not set until registers such as PARTNO, IDEXT and the like are set 1st -if used- since they impact data to the master
        SLVENA: u1,
        /// 1:the slave will NACK all requests to it except CCC broadcast. This should be used with caution as the Master may determine the slave is missing if overused.
        NACK: u1,
        /// 1: the START and STOP sticky STATUS bits will only be set if MATCHED is set..This allows START and STOP to be used to detect end of a message to /from this slave.
        MATCHSS: u1,
        /// If 1, the Slave will not detect S0 or S1 errors and so not lock up waiting on an Exit Pattern. This should only be used when the bus will not use HDR.
        S0IGNORE: u1,
        /// NA
        DDROK: u1,
        reserved8: u3 = 0,
        /// NA
        IDRAND: u1,
        /// NA
        OFFLINE: u1,
        reserved16: u6 = 0,
        /// Bus Available condition match value for current ???Slow clock???. This provides the count of the slow clock to count out 1us (or more) to allow an IBI to drive SDA Low when the Master is not doing so. The max width , and so max value, is controlled by the block. Only if enabled for events such IBI or MR or HJ, and if enabled to provide this as a register. With is limited to CLK_SLOW_BITS
        BAMATCH: u8,
        reserved25: u1 = 0,
        /// If allowed by the block:sets i2c 7 bits static address,else should be 0. If enabled to use one and to be provided by SW. Block may provide in HW as well.
        SADDR: u7,
    }),
    /// NA
    /// offset: 0x08
    STATUS: mmio.Mmio(packed struct(u32) {
        /// Is 1 if bus is busy(activity) and 0 when in a STOP condition. Other bits may also set when busy. Note that this can also be true from an S0 or S1 error, which waits for an Exit Pattern.
        STNOTSTOP: u1,
        /// Is 1 if this bus Slave is listening to the bus traffic or repsonding, If STNOSTOP=1, then this will be 0 when a non-matching address seen until next respeated START it STOP.
        STMSG: u1,
        /// Is 1 if a CCC message is being handled automatically.
        STCCCH: u1,
        /// 1 if the req in process is an sdr read from this slave or an IBI is being pushed out,
        STREQRD: u1,
        /// NA
        STREQWR: u1,
        /// NA
        STDAA: u1,
        /// NA
        STHDR: u1,
        reserved8: u1 = 0,
        /// NA
        START: u1,
        /// NA
        MATCHED: u1,
        /// NA
        STOP: u1,
        /// Receiving a message from master,which is not being handled by block(not a CCC internally processed). For all but External FIFO, this uses DATACTRL RXTRIG, which defaults to not-empty. If DMA is enabled for RX, DMA will be signaled as well. Will self-clear if data is read(FIFO and non-FIFO)
        RXPEND: u1,
        /// Is 1 when the To-bus buffer/FIFO can accept more data to go out. Defau:1. For all but External FIFO, this uses DATACTRL TXTRIG,which defaults to not-full. If DMA is enabled for TX, it will also be signaled to provide more.
        TXNOTFULL: u1,
        /// The Slv Dynamic Address has been assigned, reassigned, or reset(lost) and is now in that state of being valid or none. Actual DA can be seen in the DYNADDR register. Note that this will also be used when MAP Auto feature is configured. This will be changing one or more MAP items. See DYNADDR and/or MAPCTRLn. DYNAADDR for the main DA(0) will indicate if last change was due to Auto MAP.
        DACHG: u1,
        /// A common -command-code(CCC), not handled by block, has been received. This acts differently between: *Broadcasted ones, which will then also correspond with RXPEND and the 1st byte will be the CCC(command) . *Direct ones, which may never be directed to this device. If it is, then the TXSEND or RXPEND will be triggered with this end the RXPEND will contain the command.
        CCC: u1,
        /// NA
        ERRWARN: u1,
        /// NA
        HDRMATCH: u1,
        padding: u15 = 0,
    }),
    /// NA
    /// offset: 0x0c
    CTRL: mmio.Mmio(packed struct(u32) {
        /// If set to non-0, will request an event. Once requested, STATUS.EVENT and EVDET will show the status as it progresses. Once completed, the field will automatically return to 0. Once non-0, only 0 can be written(to cancel) until done. 0: Normal mode. If set to 0 after was a non-0 value, will cancel if not already in flight. 1: start an IBI. This will try to push through an IBI on the bus. If data associate with the IBI, it will be drawn from the IBIDATA field. Note that if Time control is enabled, this will include anytime control related bytes further, the IBIDATA byte will have bit7 set to 1.
        SLV_EVENT: u2,
        reserved3: u1 = 0,
        /// reserved
        EXTDATA: u1,
        /// Index of Dynamic Address that IBI is for. This is 0 for the main or base Dynamic Address, or can be any valid index.
        MAPIDX: u4,
        /// Data byte to go with an IBI, if enabled for it. If enabled (was in BCR), then it is required.
        IBIDATA: u8,
        /// Should be set to the pending interrupt that GETSTATUS CCC will return. This should be maintained by the application if used and configured, as the Master will read this. If not configured, the GETSTATUS field will return 1 if an IBI is pending, and 0 otherwise.
        PENDINT: u4,
        /// NA
        ACTSTATE: u2,
        reserved24: u2 = 0,
        /// NA
        VENDINFO: u8,
    }),
    /// INSET allows setting enables for interrupts(connecting the corresponding STATUS source to causing an IRQ to the processor)
    /// offset: 0x10
    INTSET: mmio.Mmio(packed struct(u32) {
        reserved10: u10 = 0,
        /// Interrupt on STOP state on the bus. See Start as the preferred interrupt when needed. This interrupt may not trigger for quick STOP/START combination, as it relates to the state of being stopped.
        STOP_ENA: u1,
        /// Interrupt when receiving a message from Master, which is not being handled by the block (excludes CCCs being handled automatically). If FIFO, then RX fullness trigger. If DMA, then message end.
        RXPEND_ENA: u1,
        /// NA
        TXSEND_ENA: u1,
        padding: u19 = 0,
    }),
    /// NA
    /// offset: 0x14
    INTCLR: mmio.Mmio(packed struct(u32) {
        reserved10: u10 = 0,
        /// Interrupt on STOP state on the bus. See Start as the preferred interrupt when needed. This interrupt may not trigger for quick STOP/START combination, as it relates to the state of being stopped.
        STOP_CLR: u1,
        /// Interrupt when receiving a message from Master, which is not being handled by the block (excludes CCCs being handled automatically). If FIFO, then RX fullness trigger. If DMA, then message end.
        RXPEND_CLR: u1,
        /// NA
        TXSEND_CLR: u1,
        padding: u19 = 0,
    }),
    /// NA
    /// offset: 0x18
    INTMASKED: mmio.Mmio(packed struct(u32) {
        reserved10: u10 = 0,
        /// Interrupt on STOP state on the bus. See Start as the preferred interrupt when needed. This interrupt may not trigger for quick STOP/START combination, as it relates to the state of being stopped.
        STOP_MASK: u1,
        /// Interrupt when receiving a message from Master, which is not being handled by the block (excludes CCCs being handled automatically). If FIFO, then RX fullness trigger. If DMA, then message end.
        RXPEND_MASK: u1,
        /// NA
        TXSEND_MASK: u1,
        padding: u19 = 0,
    }),
    /// offset: 0x1c
    reserved28: [16]u8,
    /// NA
    /// offset: 0x2c
    DATACTRL: mmio.Mmio(packed struct(u32) {
        /// Flushes the from-bus buffer/FIFO. Not normally used
        FLUSHTB: u1,
        /// Flushes the to-bus buffer/FIFO. Used when Master terminates a to-bus (read) message prematurely
        FLUSHFB: u1,
        reserved3: u1 = 0,
        /// If this bit is not written 1, the register bits from 7 to 4 are not changed on write.
        UNLOCK: u1,
        /// Trigger level for tx emptiness when FIFOed, Affects interrupt and DMA(if enabled). The defaults is 3
        TXTRIG: u2,
        /// Trigger level for rx fulless when FIFOed, Affects interrupt and DMA(if enabled). The defaults is 3
        RXTRIG: u2,
        reserved16: u8 = 0,
        /// NA
        TXCOUNT: u5,
        reserved24: u3 = 0,
        /// NA
        RXCOUNT: u5,
        reserved30: u1 = 0,
        /// NA
        TXFULL: u1,
        /// NA
        RXEMPTY: u1,
    }),
    /// NA
    /// offset: 0x30
    WDATAB: mmio.Mmio(packed struct(u32) {
        /// NA
        WDATAB: u8,
        /// NA
        WDATA_END: u1,
        padding: u23 = 0,
    }),
    /// NA
    /// offset: 0x34
    WDATABE: mmio.Mmio(packed struct(u32) {
        /// NA
        WDATABE: u8,
        padding: u24 = 0,
    }),
    /// offset: 0x38
    reserved56: [8]u8,
    /// Read Byte Data (from-bus) register
    /// offset: 0x40
    RDARAB: mmio.Mmio(packed struct(u32) {
        /// This register allows reading a byte from the bus unless external FIFO is used. A byte should not be read unless there is data waiting, as indicated by the RXPEND bit being set in the STATUS register
        DATA0: u8,
        padding: u24 = 0,
    }),
    /// offset: 0x44
    reserved68: [4]u8,
    /// Read Half-word Data (from-bus) register
    /// offset: 0x48
    RDATAH: mmio.Mmio(packed struct(u32) {
        /// NA
        DATA_LSB: u8,
        /// This register allows reading a Half-word (byte pair) from the bus unless external FIFO is used. A Half-word should not be read unless there is at least 2 bytes of data waiting, as indicated by the RX FIFO level trigger or RXCOUNT available space in the DATACTRL register
        DATA_MSB: u8,
        padding: u16 = 0,
    }),
    /// offset: 0x4c
    reserved76: [16]u8,
    /// NA
    /// offset: 0x5c
    CAPABILITIES2: mmio.Mmio(packed struct(u32) {
        /// NA
        CAPABLITIES2: u32,
    }),
    /// NA
    /// offset: 0x60
    CAPABILITIES: mmio.Mmio(packed struct(u32) {
        /// NA
        CAPABLITIES: u32,
    }),
    /// offset: 0x64
    reserved100: [8]u8,
    /// NA
    /// offset: 0x6c
    IDPARTNO: mmio.Mmio(packed struct(u32) {
        /// NA
        PARTNO: u32,
    }),
    /// NA
    /// offset: 0x70
    IDEXT: mmio.Mmio(packed struct(u32) {
        /// NA
        IDEXT: u32,
    }),
    /// NA
    /// offset: 0x74
    VENDORID: mmio.Mmio(packed struct(u32) {
        /// NA
        VID: u15,
        padding: u17 = 0,
    }),
};
