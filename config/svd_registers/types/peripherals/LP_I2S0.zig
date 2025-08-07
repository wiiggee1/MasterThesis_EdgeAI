const mmio = @import("mmio");
const types = @import("../../types.zig");

/// Low-power I2S (Inter-IC Sound) Controller 0
pub const LP_I2S0 = extern struct {
    /// I2S VAD Configure register
    /// offset: 0x00
    VAD_CONF: mmio.Mmio(packed struct(u32) {
        /// VAD enable register
        VAD_EN: u1,
        /// VAD reset register
        VAD_RESET: u1,
        /// VAD force start register.
        VAD_FORCE_START: u1,
        padding: u29 = 0,
    }),
    /// I2S VAD Result register
    /// offset: 0x04
    VAD_RESULT: mmio.Mmio(packed struct(u32) {
        /// Reg vad flag observe signal
        VAD_FLAG: u1,
        /// Reg energy enough observe signal
        ENERGY_ENOUGH: u1,
        padding: u30 = 0,
    }),
    /// I2S VAD Observe register
    /// offset: 0x08
    RX_MEM_CONF: mmio.Mmio(packed struct(u32) {
        /// The number of data in the rx mem
        RX_MEM_FIFO_CNT: u9,
        /// I2S rx mem will trigger an interrupt when the data in the mem is over(not including equal) reg_rx_mem_threshold
        RX_MEM_THRESHOLD: u8,
        padding: u15 = 0,
    }),
    /// I2S interrupt raw register, valid in level.
    /// offset: 0x0c
    INT_RAW: mmio.Mmio(packed struct(u32) {
        /// The raw interrupt status bit for the i2s_rx_done_int interrupt
        RX_DONE_INT_RAW: u1,
        /// The raw interrupt status bit for the i2s_rx_hung_int interrupt
        RX_HUNG_INT_RAW: u1,
        /// The raw interrupt status bit for the i2s_rx_fifomem_udf_int interrupt
        RX_FIFOMEM_UDF_INT_RAW: u1,
        /// The raw interrupt status bit for the vad_done_int interrupt
        VAD_DONE_INT_RAW: u1,
        /// The raw interrupt status bit for the vad_reset_done_int interrupt
        VAD_RESET_DONE_INT_RAW: u1,
        /// The raw interrupt status bit for the rx_mem_threshold_int interrupt
        RX_MEM_THRESHOLD_INT_RAW: u1,
        padding: u26 = 0,
    }),
    /// I2S interrupt status register.
    /// offset: 0x10
    INT_ST: mmio.Mmio(packed struct(u32) {
        /// The masked interrupt status bit for the i2s_rx_done_int interrupt
        RX_DONE_INT_ST: u1,
        /// The masked interrupt status bit for the i2s_rx_hung_int interrupt
        RX_HUNG_INT_ST: u1,
        /// The masked interrupt status bit for the i2s_rx_fifomem_udf_int interrupt
        RX_FIFOMEM_UDF_INT_ST: u1,
        /// The masked interrupt status bit for the vad_done_int interrupt
        LP_VAD_DONE_INT_ST: u1,
        /// The masked interrupt status bit for the vad_reset_done_int interrupt
        LP_VAD_RESET_DONE_INT_ST: u1,
        /// The masked interrupt status bit for the rx_mem_threshold_int interrupt
        RX_MEM_THRESHOLD_INT_ST: u1,
        padding: u26 = 0,
    }),
    /// I2S interrupt enable register.
    /// offset: 0x14
    INT_ENA: mmio.Mmio(packed struct(u32) {
        /// The interrupt enable bit for the i2s_rx_done_int interrupt
        RX_DONE_INT_ENA: u1,
        /// The interrupt enable bit for the i2s_rx_hung_int interrupt
        RX_HUNG_INT_ENA: u1,
        /// The interrupt enable bit for the i2s_rx_fifomem_udf_int interrupt
        RX_FIFOMEM_UDF_INT_ENA: u1,
        /// The interrupt enable bit for the vad_done_int interrupt
        LP_VAD_DONE_INT_ENA: u1,
        /// The interrupt enable bit for the vad_reset_done_int interrupt
        LP_VAD_RESET_DONE_INT_ENA: u1,
        /// The interrupt enable bit for the rx_mem_threshold_int interrupt
        RX_MEM_THRESHOLD_INT_ENA: u1,
        padding: u26 = 0,
    }),
    /// I2S interrupt clear register.
    /// offset: 0x18
    INT_CLR: mmio.Mmio(packed struct(u32) {
        /// Set this bit to clear the i2s_rx_done_int interrupt
        RX_DONE_INT_CLR: u1,
        /// Set this bit to clear the i2s_rx_hung_int interrupt
        RX_HUNG_INT_CLR: u1,
        /// Set this bit to clear the i2s_rx_fifomem_udf_int interrupt
        RX_FIFOMEM_UDF_INT_CLR: u1,
        /// Set this bit to clear the vad_done_int interrupt
        LP_VAD_DONE_INT_CLR: u1,
        /// Set this bit to clear the vad_reset_done_int interrupt
        LP_VAD_RESET_DONE_INT_CLR: u1,
        /// Set this bit to clear the rx_mem_threshold_int interrupt
        RX_MEM_THRESHOLD_INT_CLR: u1,
        padding: u26 = 0,
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
        /// Set this bit to reset Rx Syncfifomem
        RX_FIFOMEM_RESET: u1,
        /// Set this bit to enable receiver in mono mode
        RX_MONO: u1,
        reserved7: u1 = 0,
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
        /// 0 : I2S Rx only stop when reg_rx_start is cleared. 1: Stop when reg_rx_start is 0 or in_suc_eof is 1. 2: Stop I2S RX when reg_rx_start is 0 or RX FIFO is full.
        RX_STOP_MODE: u2,
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
        padding: u11 = 0,
    }),
    /// offset: 0x24
    reserved36: [4]u8,
    /// I2S RX configure register 1
    /// offset: 0x28
    RX_CONF1: mmio.Mmio(packed struct(u32) {
        /// The width of rx_ws_out in TDM mode is (I2S_RX_TDM_WS_WIDTH[6:0] +1) * T_bck
        RX_TDM_WS_WIDTH: u7,
        /// Bit clock configuration bits in receiver mode.
        RX_BCK_DIV_NUM: u6,
        /// Set the bits to configure the valid data bit length of I2S receiver channel. 7: all the valid channel data is in 8-bit-mode. 15: all the valid channel data is in 16-bit-mode. 23: all the valid channel data is in 24-bit-mode. 31:all the valid channel data is in 32-bit-mode.
        RX_BITS_MOD: u5,
        /// I2S Rx half sample bits -1.
        RX_HALF_SAMPLE_BITS: u6,
        /// The Rx bit number for each channel minus 1in TDM mode.
        RX_TDM_CHAN_BITS: u5,
        /// Set this bit to enable receiver in Phillips standard mode
        RX_MSB_SHIFT: u1,
        padding: u2 = 0,
    }),
    /// offset: 0x2c
    reserved44: [36]u8,
    /// I2S TX TDM mode control register
    /// offset: 0x50
    RX_TDM_CTRL: mmio.Mmio(packed struct(u32) {
        /// 1: Enable the valid data input of I2S RX TDM or PDM channel 0. 0: Disable, just input 0 in this channel.
        RX_TDM_PDM_CHAN0_EN: u1,
        /// 1: Enable the valid data input of I2S RX TDM or PDM channel 1. 0: Disable, just input 0 in this channel.
        RX_TDM_PDM_CHAN1_EN: u1,
        reserved16: u14 = 0,
        /// The total channel number of I2S TX TDM mode.
        RX_TDM_TOT_CHAN_NUM: u4,
        padding: u12 = 0,
    }),
    /// offset: 0x54
    reserved84: [4]u8,
    /// I2S RX timing control register
    /// offset: 0x58
    RX_TIMING: mmio.Mmio(packed struct(u32) {
        /// The delay mode of I2S Rx SD input signal. 0: bypass. 1: delay by pos edge. 2: delay by neg edge. 3: not used.
        RX_SD_IN_DM: u2,
        reserved16: u14 = 0,
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
    /// offset: 0x5c
    reserved92: [4]u8,
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
    /// offset: 0x6c
    reserved108: [4]u8,
    /// I2S RX configure register
    /// offset: 0x70
    RX_PDM_CONF: mmio.Mmio(packed struct(u32) {
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
    /// I2S ECO register
    /// offset: 0x74
    ECO_LOW: mmio.Mmio(packed struct(u32) {
        /// logic low eco registers
        RDN_ECO_LOW: u32,
    }),
    /// I2S ECO register
    /// offset: 0x78
    ECO_HIGH: mmio.Mmio(packed struct(u32) {
        /// logic high eco registers
        RDN_ECO_HIGH: u32,
    }),
    /// I2S ECO register
    /// offset: 0x7c
    ECO_CONF: mmio.Mmio(packed struct(u32) {
        /// enable rdn counter bit
        RDN_ENA: u1,
        /// rdn result
        RDN_RESULT: u1,
        padding: u30 = 0,
    }),
    /// I2S VAD Parameter register
    /// offset: 0x80
    VAD_PARAM0: mmio.Mmio(packed struct(u32) {
        /// VAD parameter
        PARAM_MIN_ENERGY: u16,
        /// VAD parameter
        PARAM_INIT_FRAME_NUM: u9,
        padding: u7 = 0,
    }),
    /// I2S VAD Parameter register
    /// offset: 0x84
    VAD_PARAM1: mmio.Mmio(packed struct(u32) {
        /// VAD parameter
        PARAM_MIN_SPEECH_COUNT: u4,
        /// VAD parameter
        PARAM_MAX_SPEECH_COUNT: u7,
        /// VAD parameter
        PARAM_HANGOVER_SPEECH: u5,
        /// VAD parameter
        PARAM_HANGOVER_SILENT: u8,
        /// VAD parameter
        PARAM_MAX_OFFSET: u7,
        /// Set 1 to skip band energy check.
        PARAM_SKIP_BAND_ENERGY: u1,
    }),
    /// I2S VAD Parameter register
    /// offset: 0x88
    VAD_PARAM2: mmio.Mmio(packed struct(u32) {
        /// VAD parameter
        PARAM_NOISE_AMP_DOWN: u16,
        /// VAD parameter
        PARAM_NOISE_AMP_UP: u16,
    }),
    /// I2S VAD Parameter register
    /// offset: 0x8c
    VAD_PARAM3: mmio.Mmio(packed struct(u32) {
        /// VAD parameter
        PARAM_NOISE_SPE_UP0: u16,
        /// VAD parameter
        PARAM_NOISE_SPE_UP1: u16,
    }),
    /// I2S VAD Parameter register
    /// offset: 0x90
    VAD_PARAM4: mmio.Mmio(packed struct(u32) {
        /// VAD parameter
        PARAM_NOISE_SPE_DOWN: u16,
        /// VAD parameter
        PARAM_NOISE_MEAN_DOWN: u16,
    }),
    /// I2S VAD Parameter register
    /// offset: 0x94
    VAD_PARAM5: mmio.Mmio(packed struct(u32) {
        /// VAD parameter
        PARAM_NOISE_MEAN_UP0: u16,
        /// VAD parameter
        PARAM_NOISE_MEAN_UP1: u16,
    }),
    /// I2S VAD Parameter register
    /// offset: 0x98
    VAD_PARAM6: mmio.Mmio(packed struct(u32) {
        /// Feature_sum threshold to determine noise_std max value when vad_tag=1, equal to ((noise_std_max)>>11)^2*5
        PARAM_NOISE_STD_FS_THSL: u16,
        /// Feature_sum threshold to determine noise_std max value when vad_tag=0, equal to ((noise_std_max)>>11)^2*5
        PARAM_NOISE_STD_FS_THSH: u16,
    }),
    /// I2S VAD Parameter register
    /// offset: 0x9c
    VAD_PARAM7: mmio.Mmio(packed struct(u32) {
        /// VAD parameter
        PARAM_THRES_UPD_BASE: u16,
        /// VAD parameter
        PARAM_THRES_UPD_VARY: u16,
    }),
    /// I2S VAD Parameter register
    /// offset: 0xa0
    VAD_PARAM8: mmio.Mmio(packed struct(u32) {
        /// Noise_std boundary low when updating threshold.
        PARAM_THRES_UPD_BDL: u8,
        /// Noise_std boundary high when updating threshold.
        PARAM_THRES_UPD_BDH: u8,
        /// VAD parameter
        PARAM_FEATURE_BURST: u16,
    }),
    /// offset: 0xa4
    reserved164: [12]u8,
    /// I2S VAD Observe register
    /// offset: 0xb0
    VAD_OB0: mmio.Mmio(packed struct(u32) {
        /// Reg silent count observe
        SPEECH_COUNT_OB: u8,
        /// Reg speech count observe
        SILENT_COUNT_OB: u8,
        /// Reg max signal0 observe
        MAX_SIGNAL0_OB: u16,
    }),
    /// I2S VAD Observe register
    /// offset: 0xb4
    VAD_OB1: mmio.Mmio(packed struct(u32) {
        /// Reg max signal1 observe
        MAX_SIGNAL1_OB: u16,
        /// Reg max signal2 observe
        MAX_SIGNAL2_OB: u16,
    }),
    /// I2S VAD Observe register
    /// offset: 0xb8
    VAD_OB2: mmio.Mmio(packed struct(u32) {
        /// Reg noise_amp observe signal
        NOISE_AMP_OB: u32,
    }),
    /// I2S VAD Observe register
    /// offset: 0xbc
    VAD_OB3: mmio.Mmio(packed struct(u32) {
        /// Reg noise_mean observe signal
        NOISE_MEAN_OB: u32,
    }),
    /// I2S VAD Observe register
    /// offset: 0xc0
    VAD_OB4: mmio.Mmio(packed struct(u32) {
        /// Reg noise_std observe signal
        NOISE_STD_OB: u32,
    }),
    /// I2S VAD Observe register
    /// offset: 0xc4
    VAD_OB5: mmio.Mmio(packed struct(u32) {
        /// Reg offset observe signal
        OFFSET_OB: u32,
    }),
    /// I2S VAD Observe register
    /// offset: 0xc8
    VAD_OB6: mmio.Mmio(packed struct(u32) {
        /// Reg threshold observe signal
        THRESHOLD_OB: u32,
    }),
    /// I2S VAD Observe register
    /// offset: 0xcc
    VAD_OB7: mmio.Mmio(packed struct(u32) {
        /// Reg energy bit 31~0 observe signal
        ENERGY_LOW_OB: u32,
    }),
    /// I2S VAD Observe register
    /// offset: 0xd0
    VAD_OB8: mmio.Mmio(packed struct(u32) {
        /// Reg energy bit 63~32 observe signal
        ENERGY_HIGH_OB: u32,
    }),
    /// offset: 0xd4
    reserved212: [36]u8,
    /// Clock gate register
    /// offset: 0xf8
    CLK_GATE: mmio.Mmio(packed struct(u32) {
        /// set this bit to enable clock gate
        CLK_EN: u1,
        /// VAD clock gate force on register
        VAD_CG_FORCE_ON: u1,
        /// I2S rx mem clock gate force on register
        RX_MEM_CG_FORCE_ON: u1,
        /// I2S rx reg clock gate force on register
        RX_REG_CG_FORCE_ON: u1,
        padding: u28 = 0,
    }),
    /// Version control register
    /// offset: 0xfc
    DATE: mmio.Mmio(packed struct(u32) {
        /// I2S version control register
        DATE: u28,
        padding: u4 = 0,
    }),
};
