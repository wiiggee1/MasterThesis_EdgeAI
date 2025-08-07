const mmio = @import("mmio");
const types = @import("../../types.zig");

/// I2S (Inter-IC Sound) Controller 0
pub const I2S0 = extern struct {
    /// offset: 0x00
    reserved0: [12]u8,
    /// I2S interrupt raw register, valid in level.
    /// offset: 0x0c
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the i2s_rx_done_int interrupt
        RX_DONE_INT_RAW: u1,
        /// The raw interrupt status bit for the i2s_tx_done_int interrupt
        TX_DONE_INT_RAW: u1,
        /// The raw interrupt status bit for the i2s_rx_hung_int interrupt
        RX_HUNG_INT_RAW: u1,
        /// The raw interrupt status bit for the i2s_tx_hung_int interrupt
        TX_HUNG_INT_RAW: u1,
        padding: u28 = 0,
    }),
    /// I2S interrupt status register.
    /// offset: 0x10
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// The masked interrupt status bit for the i2s_rx_done_int interrupt
        RX_DONE_INT_ST: u1,
        /// The masked interrupt status bit for the i2s_tx_done_int interrupt
        TX_DONE_INT_ST: u1,
        /// The masked interrupt status bit for the i2s_rx_hung_int interrupt
        RX_HUNG_INT_ST: u1,
        /// The masked interrupt status bit for the i2s_tx_hung_int interrupt
        TX_HUNG_INT_ST: u1,
        padding: u28 = 0,
    }),
    /// I2S interrupt enable register.
    /// offset: 0x14
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the i2s_rx_done_int interrupt
        RX_DONE_INT_ENA: u1,
        /// The interrupt enable bit for the i2s_tx_done_int interrupt
        TX_DONE_INT_ENA: u1,
        /// The interrupt enable bit for the i2s_rx_hung_int interrupt
        RX_HUNG_INT_ENA: u1,
        /// The interrupt enable bit for the i2s_tx_hung_int interrupt
        TX_HUNG_INT_ENA: u1,
        padding: u28 = 0,
    }),
    /// I2S interrupt clear register.
    /// offset: 0x18
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the i2s_rx_done_int interrupt
        RX_DONE_INT_CLR: u1,
        /// Set this bit to clear the i2s_tx_done_int interrupt
        TX_DONE_INT_CLR: u1,
        /// Set this bit to clear the i2s_rx_hung_int interrupt
        RX_HUNG_INT_CLR: u1,
        /// Set this bit to clear the i2s_tx_hung_int interrupt
        TX_HUNG_INT_CLR: u1,
        padding: u28 = 0,
    }),
    /// offset: 0x1c
    reserved28: [4]u8,
    /// I2S RX configure register
    /// offset: 0x20
    RX_CONF: mmio.Mmio(packed struct(u32) {
        /// Set this bit to reset receiver
        RX_RESET: u1,
        /// Set this bit to reset Rx AFIFO
        RX_FIFO_RESET: u1,
        /// Set this bit to start receiving data
        RX_START: u1,
        /// Set this bit to enable slave receiver mode
        RX_SLAVE_MOD: u1,
        /// 0 : I2S Rx only stop when reg_rx_start is cleared. 1: Stop when reg_rx_start is 0 or in_suc_eof is 1. 2: Stop I2S RX when reg_rx_start is 0 or RX FIFO is full.
        RX_STOP_MODE: u2,
        /// Set this bit to enable receiver in mono mode
        RX_MONO: u1,
        /// I2S Rx byte endian, 1: low addr value to high addr. 0: low addr with low addr value.
        RX_BIG_ENDIAN: u1,
        /// Set 1 to update I2S RX registers from APB clock domain to I2S RX clock domain. This bit will be cleared by hardware after update register done.
        RX_UPDATE: u1,
        /// 1: The first channel data value is valid in I2S RX mono mode. 0: The second channel data value is valid in I2S RX mono mode.
        RX_MONO_FST_VLD: u1,
        /// I2S RX compress/decompress configuration bit. & 0 (atol): A-Law decompress, 1 (ltoa) : A-Law compress, 2 (utol) : u-Law decompress, 3 (ltou) : u-Law compress. &
        RX_PCM_CONF: u2,
        /// Set this bit to bypass Compress/Decompress module for received data.
        RX_PCM_BYPASS: u1,
        /// Set this bit to enable receiver in Phillips standard mode
        RX_MSB_SHIFT: u1,
        reserved15: u1 = 0,
        /// 1: I2S RX left alignment mode. 0: I2S RX right alignment mode.
        RX_LEFT_ALIGN: u1,
        /// 1: store 24 channel bits to 32 bits. 0:store 24 channel bits to 24 bits.
        RX_24_FILL_EN: u1,
        /// 0: WS should be 0 when receiving left channel data, and WS is 1in right channel. 1: WS should be 1 when receiving left channel data, and WS is 0in right channel.
        RX_WS_IDLE_POL: u1,
        /// I2S Rx bit endian. 1:small endian, the LSB is received first. 0:big endian, the MSB is received first.
        RX_BIT_ORDER: u1,
        /// 1: Enable I2S TDM Rx mode . 0: Disable.
        RX_TDM_EN: u1,
        /// 1: Enable I2S PDM Rx mode . 0: Disable.
        RX_PDM_EN: u1,
        /// Bit clock configuration bits in receiver mode.
        RX_BCK_DIV_NUM: u6,
        padding: u5 = 0,
    }),
    /// I2S TX configure register
    /// offset: 0x24
    TX_CONF: mmio.Mmio(packed struct(u32) {
        /// Set this bit to reset transmitter
        TX_RESET: u1,
        /// Set this bit to reset Tx AFIFO
        TX_FIFO_RESET: u1,
        /// Set this bit to start transmitting data
        TX_START: u1,
        /// Set this bit to enable slave transmitter mode
        TX_SLAVE_MOD: u1,
        /// Set this bit to stop disable output BCK signal and WS signal when tx FIFO is emtpy
        TX_STOP_EN: u1,
        /// 1: The value of Left channel data is equal to the value of right channel data in I2S TX mono mode or TDM channel select mode. 0: The invalid channel data is reg_i2s_single_data in I2S TX mono mode or TDM channel select mode.
        TX_CHAN_EQUAL: u1,
        /// Set this bit to enable transmitter in mono mode
        TX_MONO: u1,
        /// I2S Tx byte endian, 1: low addr value to high addr. 0: low addr with low addr value.
        TX_BIG_ENDIAN: u1,
        /// Set 1 to update I2S TX registers from APB clock domain to I2S TX clock domain. This bit will be cleared by hardware after update register done.
        TX_UPDATE: u1,
        /// 1: The first channel data value is valid in I2S TX mono mode. 0: The second channel data value is valid in I2S TX mono mode.
        TX_MONO_FST_VLD: u1,
        /// I2S TX compress/decompress configuration bit. & 0 (atol): A-Law decompress, 1 (ltoa) : A-Law compress, 2 (utol) : u-Law decompress, 3 (ltou) : u-Law compress. &
        TX_PCM_CONF: u2,
        /// Set this bit to bypass Compress/Decompress module for transmitted data.
        TX_PCM_BYPASS: u1,
        /// Set this bit to enable transmitter in Phillips standard mode
        TX_MSB_SHIFT: u1,
        /// 1: BCK is not delayed to generate pos/neg edge in master mode. 0: BCK is delayed to generate pos/neg edge in master mode.
        TX_BCK_NO_DLY: u1,
        /// 1: I2S TX left alignment mode. 0: I2S TX right alignment mode.
        TX_LEFT_ALIGN: u1,
        /// 1: Sent 32 bits in 24 channel bits mode. 0: Sent 24 bits in 24 channel bits mode
        TX_24_FILL_EN: u1,
        /// 0: WS should be 0 when sending left channel data, and WS is 1in right channel. 1: WS should be 1 when sending left channel data, and WS is 0in right channel.
        TX_WS_IDLE_POL: u1,
        /// I2S Tx bit endian. 1:small endian, the LSB is sent first. 0:big endian, the MSB is sent first.
        TX_BIT_ORDER: u1,
        /// 1: Enable I2S TDM Tx mode . 0: Disable.
        TX_TDM_EN: u1,
        /// 1: Enable I2S PDM Tx mode . 0: Disable.
        TX_PDM_EN: u1,
        /// Bit clock configuration bits in transmitter mode.
        TX_BCK_DIV_NUM: u6,
        /// I2S transmitter channel mode configuration bits.
        TX_CHAN_MOD: u3,
        /// Enable signal loop back mode with transmitter module and receiver module sharing the same WS and BCK signals.
        SIG_LOOPBACK: u1,
        padding: u1 = 0,
    }),
    /// I2S RX configure register 1
    /// offset: 0x28
    RX_CONF1: mmio.Mmio(packed struct(u32) {
        /// The width of rx_ws_out at idle level in TDM mode is (I2S_RX_TDM_WS_WIDTH[8:0] +1) * T_bck
        RX_TDM_WS_WIDTH: u9,
        reserved14: u5 = 0,
        /// Set the bits to configure the valid data bit length of I2S receiver channel. 7: all the valid channel data is in 8-bit-mode. 15: all the valid channel data is in 16-bit-mode. 23: all the valid channel data is in 24-bit-mode. 31:all the valid channel data is in 32-bit-mode.
        RX_BITS_MOD: u5,
        /// I2S Rx half sample bits -1.
        RX_HALF_SAMPLE_BITS: u8,
        /// The Rx bit number for each channel minus 1in TDM mode.
        RX_TDM_CHAN_BITS: u5,
    }),
    /// I2S TX configure register 1
    /// offset: 0x2c
    TX_CONF1: mmio.Mmio(packed struct(u32) {
        /// The width of tx_ws_out at idle level in TDM mode is (I2S_TX_TDM_WS_WIDTH[8:0] +1) * T_bck
        TX_TDM_WS_WIDTH: u9,
        reserved14: u5 = 0,
        /// Set the bits to configure the valid data bit length of I2S transmitter channel. 7: all the valid channel data is in 8-bit-mode. 15: all the valid channel data is in 16-bit-mode. 23: all the valid channel data is in 24-bit-mode. 31:all the valid channel data is in 32-bit-mode.
        TX_BITS_MOD: u5,
        /// I2S Tx half sample bits -1.
        TX_HALF_SAMPLE_BITS: u8,
        /// The Tx bit number for each channel minus 1in TDM mode.
        TX_TDM_CHAN_BITS: u5,
    }),
    /// offset: 0x30
    reserved48: [16]u8,
    /// I2S TX PCM2PDM configuration register
    /// offset: 0x40
    TX_PCM2PDM_CONF: mmio.Mmio(packed struct(u32) {
        /// I2S TX PDM bypass hp filter or not. The option has been removed.
        TX_PDM_HP_BYPASS: u1,
        /// I2S TX PDM OSR2 value
        TX_PDM_SINC_OSR2: u4,
        /// I2S TX PDM prescale for sigmadelta
        TX_PDM_PRESCALE: u8,
        /// I2S TX PDM sigmadelta scale shift number: 0:/2 , 1:x1 , 2:x2 , 3: x4
        TX_PDM_HP_IN_SHIFT: u2,
        /// I2S TX PDM sigmadelta scale shift number: 0:/2 , 1:x1 , 2:x2 , 3: x4
        TX_PDM_LP_IN_SHIFT: u2,
        /// I2S TX PDM sigmadelta scale shift number: 0:/2 , 1:x1 , 2:x2 , 3: x4
        TX_PDM_SINC_IN_SHIFT: u2,
        /// I2S TX PDM sigmadelta scale shift number: 0:/2 , 1:x1 , 2:x2 , 3: x4
        TX_PDM_SIGMADELTA_IN_SHIFT: u2,
        /// I2S TX PDM sigmadelta dither2 value
        TX_PDM_SIGMADELTA_DITHER2: u1,
        /// I2S TX PDM sigmadelta dither value
        TX_PDM_SIGMADELTA_DITHER: u1,
        /// I2S TX PDM dac mode enable
        TX_PDM_DAC_2OUT_EN: u1,
        /// I2S TX PDM dac 2channel enable
        TX_PDM_DAC_MODE_EN: u1,
        /// I2S TX PDM Converter enable
        PCM2PDM_CONV_EN: u1,
        padding: u6 = 0,
    }),
    /// I2S TX PCM2PDM configuration register
    /// offset: 0x44
    TX_PCM2PDM_CONF1: mmio.Mmio(packed struct(u32) {
        /// I2S TX PDM Fp
        TX_PDM_FP: u10,
        /// I2S TX PDM Fs
        TX_PDM_FS: u10,
        /// The fourth parameter of PDM TX IIR_HP filter stage 2 is (504 + I2S_TX_IIR_HP_MULT12_5[2:0])
        TX_IIR_HP_MULT12_5: u3,
        /// The fourth parameter of PDM TX IIR_HP filter stage 1 is (504 + I2S_TX_IIR_HP_MULT12_0[2:0])
        TX_IIR_HP_MULT12_0: u3,
        padding: u6 = 0,
    }),
    /// I2S RX configure register
    /// offset: 0x48
    RX_PDM2PCM_CONF: mmio.Mmio(packed struct(u32) {
        reserved19: u19 = 0,
        /// 1: Enable PDM2PCM RX mode. 0: DIsable.
        RX_PDM2PCM_EN: u1,
        /// Configure the down sampling rate of PDM RX filter group1 module. 1: The down sampling rate is 128. 0: down sampling rate is 64.
        RX_PDM_SINC_DSR_16_EN: u1,
        /// Configure PDM RX amplify number.
        RX_PDM2PCM_AMPLIFY_NUM: u4,
        /// I2S PDM RX bypass hp filter or not.
        RX_PDM_HP_BYPASS: u1,
        /// The fourth parameter of PDM RX IIR_HP filter stage 2 is (504 + LP_I2S_RX_IIR_HP_MULT12_5[2:0])
        RX_IIR_HP_MULT12_5: u3,
        /// The fourth parameter of PDM RX IIR_HP filter stage 1 is (504 + LP_I2S_RX_IIR_HP_MULT12_0[2:0])
        RX_IIR_HP_MULT12_0: u3,
    }),
    /// offset: 0x4c
    reserved76: [4]u8,
    /// I2S TX TDM mode control register
    /// offset: 0x50
    RX_TDM_CTRL: mmio.Mmio(packed struct(u32) {
        /// 1: Enable the valid data input of I2S RX TDM or PDM channel 0. 0: Disable, just input 0 in this channel.
        RX_TDM_PDM_CHAN0_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM or PDM channel 1. 0: Disable, just input 0 in this channel.
        RX_TDM_PDM_CHAN1_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM or PDM channel 2. 0: Disable, just input 0 in this channel.
        RX_TDM_PDM_CHAN2_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM or PDM channel 3. 0: Disable, just input 0 in this channel.
        RX_TDM_PDM_CHAN3_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM or PDM channel 4. 0: Disable, just input 0 in this channel.
        RX_TDM_PDM_CHAN4_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM or PDM channel 5. 0: Disable, just input 0 in this channel.
        RX_TDM_PDM_CHAN5_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM or PDM channel 6. 0: Disable, just input 0 in this channel.
        RX_TDM_PDM_CHAN6_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM or PDM channel 7. 0: Disable, just input 0 in this channel.
        RX_TDM_PDM_CHAN7_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM channel 8. 0: Disable, just input 0 in this channel.
        RX_TDM_CHAN8_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM channel 9. 0: Disable, just input 0 in this channel.
        RX_TDM_CHAN9_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM channel 10. 0: Disable, just input 0 in this channel.
        RX_TDM_CHAN10_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM channel 11. 0: Disable, just input 0 in this channel.
        RX_TDM_CHAN11_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM channel 12. 0: Disable, just input 0 in this channel.
        RX_TDM_CHAN12_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM channel 13. 0: Disable, just input 0 in this channel.
        RX_TDM_CHAN13_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM channel 14. 0: Disable, just input 0 in this channel.
        RX_TDM_CHAN14_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM channel 15. 0: Disable, just input 0 in this channel.
        RX_TDM_CHAN15_EN: u1,
        /// The total channel number of I2S TX TDM mode.
        RX_TDM_TOT_CHAN_NUM: u4,
        padding: u12 = 0,
    }),
    /// I2S TX TDM mode control register
    /// offset: 0x54
    TX_TDM_CTRL: mmio.Mmio(packed struct(u32) {
        /// 1: Enable the valid data output of I2S TX TDM channel 0. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN0_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 1. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN1_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 2. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN2_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 3. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN3_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 4. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN4_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 5. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN5_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 6. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN6_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 7. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN7_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 8. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN8_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 9. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN9_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 10. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN10_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 11. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN11_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 12. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN12_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 13. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN13_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 14. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN14_EN: u1,
        /// 1: Enable the valid data output of I2S TX TDM channel 15. 0: Disable, just output 0 in this channel.
        TX_TDM_CHAN15_EN: u1,
        /// The total channel number of I2S TX TDM mode.
        TX_TDM_TOT_CHAN_NUM: u4,
        /// When DMA TX buffer stores the data of (REG_TX_TDM_TOT_CHAN_NUM + 1) channels, and only the data of the enabled channels is sent, then this bit should be set. Clear it when all the data stored in DMA TX buffer is for enabled channels.
        TX_TDM_SKIP_MSK_EN: u1,
        padding: u11 = 0,
    }),
    /// I2S RX timing control register
    /// offset: 0x58
    RX_TIMING: mmio.Mmio(packed struct(u32) {
        /// The delay mode of I2S Rx SD input signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        RX_SD_IN_DM: u2,
        reserved4: u2 = 0,
        /// The delay mode of I2S Rx SD1 input signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        RX_SD1_IN_DM: u2,
        reserved8: u2 = 0,
        /// The delay mode of I2S Rx SD2 input signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        RX_SD2_IN_DM: u2,
        reserved12: u2 = 0,
        /// The delay mode of I2S Rx SD3 input signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        RX_SD3_IN_DM: u2,
        reserved16: u2 = 0,
        /// The delay mode of I2S Rx WS output signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        RX_WS_OUT_DM: u2,
        reserved20: u2 = 0,
        /// The delay mode of I2S Rx BCK output signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        RX_BCK_OUT_DM: u2,
        reserved24: u2 = 0,
        /// The delay mode of I2S Rx WS input signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        RX_WS_IN_DM: u2,
        reserved28: u2 = 0,
        /// The delay mode of I2S Rx BCK input signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        RX_BCK_IN_DM: u2,
        padding: u2 = 0,
    }),
    /// I2S TX timing control register
    /// offset: 0x5c
    TX_TIMING: mmio.Mmio(packed struct(u32) {
        /// The delay mode of I2S TX SD output signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        TX_SD_OUT_DM: u2,
        reserved4: u2 = 0,
        /// The delay mode of I2S TX SD1 output signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        TX_SD1_OUT_DM: u2,
        reserved16: u10 = 0,
        /// The delay mode of I2S TX WS output signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        TX_WS_OUT_DM: u2,
        reserved20: u2 = 0,
        /// The delay mode of I2S TX BCK output signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        TX_BCK_OUT_DM: u2,
        reserved24: u2 = 0,
        /// The delay mode of I2S TX WS input signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        TX_WS_IN_DM: u2,
        reserved28: u2 = 0,
        /// The delay mode of I2S TX BCK input signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        TX_BCK_IN_DM: u2,
        padding: u2 = 0,
    }),
    /// I2S HUNG configure register.
    /// offset: 0x60
    LC_HUNG_CONF: mmio.Mmio(packed struct(u32) {
        /// the i2s_tx_hung_int interrupt or the i2s_rx_hung_int interrupt will be triggered when fifo hung counter is equal to this value
        LC_FIFO_TIMEOUT: u8,
        /// The bits are used to scale tick counter threshold. The tick counter is reset when counter value >= 88000/2^i2s_lc_fifo_timeout_shift
        LC_FIFO_TIMEOUT_SHIFT: u3,
        /// The enable bit for FIFO timeout
        LC_FIFO_TIMEOUT_ENA: u1,
        padding: u20 = 0,
    }),
    /// I2S RX data number control register.
    /// offset: 0x64
    RXEOF_NUM: mmio.Mmio(packed struct(u32) {
        /// The receive data bit length is (I2S_RX_BITS_MOD[4:0] + 1) * (REG_RX_EOF_NUM[11:0] + 1) . It will trigger in_suc_eof interrupt in the configured DMA RX channel.
        RX_EOF_NUM: u12,
        padding: u20 = 0,
    }),
    /// I2S signal data register
    /// offset: 0x68
    CONF_SIGLE_DATA: mmio.Mmio(packed struct(u32) {
        /// The configured constant channel data to be sent out.
        SINGLE_DATA: u32,
    }),
    /// I2S TX status register
    /// offset: 0x6c
    STATE: mmio.Mmio(packed struct(u32) {
        /// 1: i2s_tx is idle state. 0: i2s_tx is working.
        TX_IDLE: u1,
        padding: u31 = 0,
    }),
    /// I2S ETM configure register
    /// offset: 0x70
    ETM_CONF: mmio.Mmio(packed struct(u32) {
        /// I2S ETM send x words event. When sending word number of reg_etm_tx_send_word_num[9:0], i2s will trigger an etm event.
        ETM_TX_SEND_WORD_NUM: u10,
        /// I2S ETM receive x words event. When receiving word number of reg_etm_rx_receive_word_num[9:0], i2s will trigger an etm event.
        ETM_RX_RECEIVE_WORD_NUM: u10,
        padding: u12 = 0,
    }),
    /// I2S sync counter register
    /// offset: 0x74
    FIFO_CNT: mmio.Mmio(packed struct(u32) {
        /// tx fifo counter value.
        TX_FIFO_CNT: u31,
        /// Set this bit to reset tx fifo counter.
        TX_FIFO_CNT_RST: u1,
    }),
    /// I2S sync counter register
    /// offset: 0x78
    BCK_CNT: mmio.Mmio(packed struct(u32) {
        /// tx bck counter value.
        TX_BCK_CNT: u31,
        /// Set this bit to reset tx bck counter.
        TX_BCK_CNT_RST: u1,
    }),
    /// Clock gate register
    /// offset: 0x7c
    CLK_GATE: mmio.Mmio(packed struct(u32) {
        /// set this bit to enable clock gate
        CLK_EN: u1,
        padding: u31 = 0,
    }),
    /// Version control register
    /// offset: 0x80
    DATE: mmio.Mmio(packed struct(u32) {
        /// I2S version control register
        DATE: u28,
        padding: u4 = 0,
    }),
};
