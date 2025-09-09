//! 32-bit RISC-V MCU
const mmio = @import("mmio");
pub const types = @import("types.zig");

pub const Interrupt = struct {
    name: [:0]const u8,
    index: i16,
    description: ?[:0]const u8,
};

pub const properties = struct {
    pub const @"cpu.endian" = "little";
    pub const @"cpu.fpuPresent" = "true";
    pub const @"cpu.mpuPresent" = "false";
    pub const @"cpu.name" = "RV32IMAFC";
    pub const @"cpu.nvicPrioBits" = "0";
    pub const @"cpu.revision" = "r0p0";
    pub const @"cpu.vendorSystickConfig" = "false";
    pub const license =
        \\Copyright 2025 Espressif Systems (Shanghai) PTE LTD
        \\
        \\    Licensed under the Apache License, Version 2.0 (the "License");
        \\    you may not use this file except in compliance with the License.
        \\    You may obtain a copy of the License at
        \\
        \\        http://www.apache.org/licenses/LICENSE-2.0
        \\
        \\    Unless required by applicable law or agreed to in writing, software
        \\    distributed under the License is distributed on an "AS IS" BASIS,
        \\    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        \\    See the License for the specific language governing permissions and
        \\    limitations under the License.
    ;
};

pub const interrupts: []const Interrupt = &.{
    .{ .name = "LP_WDT", .index = 1, .description = null },
    .{ .name = "LP_TIMER0", .index = 2, .description = null },
    .{ .name = "LP_TIMER1", .index = 3, .description = null },
    .{ .name = "PMU0", .index = 6, .description = null },
    .{ .name = "PMU1", .index = 7, .description = null },
    .{ .name = "LP_ANA", .index = 8, .description = null },
    .{ .name = "LP_ADC", .index = 9, .description = null },
    .{ .name = "LP_GPIO", .index = 10, .description = null },
    .{ .name = "LP_I2C0", .index = 11, .description = null },
    .{ .name = "LP_I2S0", .index = 12, .description = null },
    .{ .name = "LP_TOUCH", .index = 14, .description = null },
    .{ .name = "LP_TSENS", .index = 15, .description = null },
    .{ .name = "LP_UART", .index = 16, .description = null },
    .{ .name = "LP_SYS", .index = 19, .description = null },
    .{ .name = "LP_HUK", .index = 20, .description = null },
    .{ .name = "USB_DEVICE", .index = 22, .description = null },
    .{ .name = "DMA", .index = 24, .description = null },
    .{ .name = "SPI2", .index = 25, .description = null },
    .{ .name = "SPI3", .index = 26, .description = null },
    .{ .name = "I2S0", .index = 27, .description = null },
    .{ .name = "I2S1", .index = 28, .description = null },
    .{ .name = "I2S2", .index = 29, .description = null },
    .{ .name = "UHCI0", .index = 30, .description = null },
    .{ .name = "UART0", .index = 31, .description = null },
    .{ .name = "UART1", .index = 32, .description = null },
    .{ .name = "UART2", .index = 33, .description = null },
    .{ .name = "UART3", .index = 34, .description = null },
    .{ .name = "UART4", .index = 35, .description = null },
    .{ .name = "PWM0", .index = 38, .description = null },
    .{ .name = "PWM1", .index = 39, .description = null },
    .{ .name = "TWAI0", .index = 40, .description = null },
    .{ .name = "TWAI1", .index = 41, .description = null },
    .{ .name = "TWAI2", .index = 42, .description = null },
    .{ .name = "RMT", .index = 43, .description = null },
    .{ .name = "I2C0", .index = 44, .description = null },
    .{ .name = "I2C1", .index = 45, .description = null },
    .{ .name = "TG0_T0", .index = 46, .description = null },
    .{ .name = "TG0_T1", .index = 47, .description = null },
    .{ .name = "TG0_WDT", .index = 48, .description = null },
    .{ .name = "TG1_T0", .index = 49, .description = null },
    .{ .name = "TG1_T1", .index = 50, .description = null },
    .{ .name = "TG1_WDT", .index = 51, .description = null },
    .{ .name = "LEDC", .index = 52, .description = null },
    .{ .name = "SYSTIMER_TARGET0", .index = 53, .description = null },
    .{ .name = "SYSTIMER_TARGET1", .index = 54, .description = null },
    .{ .name = "SYSTIMER_TARGET2", .index = 55, .description = null },
    .{ .name = "AHB_PDMA_IN_CH0", .index = 56, .description = null },
    .{ .name = "AHB_PDMA_IN_CH1", .index = 57, .description = null },
    .{ .name = "AHB_PDMA_IN_CH2", .index = 58, .description = null },
    .{ .name = "AHB_PDMA_OUT_CH0", .index = 59, .description = null },
    .{ .name = "AHB_PDMA_OUT_CH1", .index = 60, .description = null },
    .{ .name = "AHB_PDMA_OUT_CH2", .index = 61, .description = null },
    .{ .name = "AXI_PDMA_IN_CH0", .index = 62, .description = null },
    .{ .name = "AXI_PDMA_IN_CH1", .index = 63, .description = null },
    .{ .name = "AXI_PDMA_IN_CH2", .index = 64, .description = null },
    .{ .name = "AXI_PDMA_OUT_CH0", .index = 65, .description = null },
    .{ .name = "AXI_PDMA_OUT_CH1", .index = 66, .description = null },
    .{ .name = "AXI_PDMA_OUT_CH2", .index = 67, .description = null },
    .{ .name = "RSA", .index = 68, .description = null },
    .{ .name = "AES", .index = 69, .description = null },
    .{ .name = "SHA", .index = 70, .description = null },
    .{ .name = "ECC", .index = 71, .description = null },
    .{ .name = "GPIO_INT0", .index = 74, .description = null },
    .{ .name = "GPIO_INT1", .index = 75, .description = null },
    .{ .name = "GPIO_INT2", .index = 76, .description = null },
    .{ .name = "GPIO_INT3", .index = 77, .description = null },
    .{ .name = "GPIO_PAD_COMP", .index = 78, .description = null },
    .{ .name = "CACHE", .index = 83, .description = null },
    .{ .name = "CSI_BRIDGE", .index = 85, .description = null },
    .{ .name = "DSI_BRIDGE", .index = 86, .description = null },
    .{ .name = "CSI", .index = 87, .description = null },
    .{ .name = "DSI", .index = 88, .description = null },
    .{ .name = "JPEG", .index = 95, .description = null },
    .{ .name = "PPA", .index = 96, .description = null },
    .{ .name = "ISP", .index = 100, .description = null },
    .{ .name = "I3C", .index = 101, .description = null },
    .{ .name = "I3C_SLV", .index = 102, .description = null },
    .{ .name = "HP_SYS", .index = 110, .description = null },
    .{ .name = "PCNT", .index = 111, .description = null },
    .{ .name = "PAU", .index = 112, .description = null },
    .{ .name = "PARLIO_RX", .index = 113, .description = null },
    .{ .name = "PARLIO_TX", .index = 114, .description = null },
    .{ .name = "H264_DMA2D_OUT_CH0", .index = 115, .description = null },
    .{ .name = "H264_DMA2D_OUT_CH1", .index = 116, .description = null },
    .{ .name = "H264_DMA2D_OUT_CH2", .index = 117, .description = null },
    .{ .name = "H264_DMA2D_OUT_CH3", .index = 118, .description = null },
    .{ .name = "H264_DMA2D_OUT_CH4", .index = 119, .description = null },
    .{ .name = "H264_DMA2D_IN_CH0", .index = 120, .description = null },
    .{ .name = "H264_DMA2D_IN_CH1", .index = 121, .description = null },
    .{ .name = "H264_DMA2D_IN_CH2", .index = 122, .description = null },
    .{ .name = "H264_DMA2D_IN_CH3", .index = 123, .description = null },
    .{ .name = "H264_DMA2D_IN_CH4", .index = 124, .description = null },
    .{ .name = "H264_DMA2D_IN_CH5", .index = 125, .description = null },
    .{ .name = "H264_REG", .index = 126, .description = null },
    .{ .name = "ASSIST_DEBUG", .index = 127, .description = null },
};
pub const peripherals = struct {
    /// TRACE0 Peripheral
    pub const TRACE0: *volatile types.peripherals.TRACE0 = @ptrFromInt(0x3ff04000);
    /// TRACE1 Peripheral
    pub const TRACE1: *volatile types.peripherals.TRACE0 = @ptrFromInt(0x3ff05000);
    /// Debug Assist
    pub const ASSIST_DEBUG: *volatile types.peripherals.ASSIST_DEBUG = @ptrFromInt(0x3ff06000);
    /// CACHE Peripheral
    pub const CACHE: *volatile types.peripherals.CACHE = @ptrFromInt(0x3ff10000);
    /// USB_WRAP Peripheral
    pub const USB_WRAP: *volatile types.peripherals.USB_WRAP = @ptrFromInt(0x50080000);
    /// DMA (Direct Memory Access) Controller
    pub const DMA: *volatile types.peripherals.DMA = @ptrFromInt(0x50081000);
    /// SD/MMC Host Controller
    pub const SDHOST: *volatile types.peripherals.SDHOST = @ptrFromInt(0x50083000);
    /// H264 Encoder (Core)
    pub const H264: *volatile types.peripherals.H264 = @ptrFromInt(0x50084000);
    /// AHB_DMA Peripheral
    pub const AHB_DMA: *volatile types.peripherals.AHB_DMA = @ptrFromInt(0x50085000);
    /// JPEG Codec
    pub const JPEG: *volatile types.peripherals.JPEG = @ptrFromInt(0x50086000);
    /// PPA Peripheral
    pub const PPA: *volatile types.peripherals.PPA = @ptrFromInt(0x50087000);
    /// AXI_DMA Peripheral
    pub const AXI_DMA: *volatile types.peripherals.AXI_DMA = @ptrFromInt(0x5008a000);
    /// SPI (Serial Peripheral Interface) Controller 0
    pub const SPI0: *volatile types.peripherals.SPI0 = @ptrFromInt(0x5008c000);
    /// SPI (Serial Peripheral Interface) Controller 1
    pub const SPI1: *volatile types.peripherals.SPI1 = @ptrFromInt(0x5008d000);
    /// AES (Advanced Encryption Standard) Accelerator
    pub const AES: *volatile types.peripherals.AES = @ptrFromInt(0x50090000);
    /// SHA (Secure Hash Algorithm) Accelerator
    pub const SHA: *volatile types.peripherals.SHA = @ptrFromInt(0x50091000);
    /// RSA (Rivest Shamir Adleman) Accelerator
    pub const RSA: *volatile types.peripherals.RSA = @ptrFromInt(0x50092000);
    /// ECC (ECC Hardware Accelerator)
    pub const ECC: *volatile types.peripherals.ECC = @ptrFromInt(0x50093000);
    /// Digital Signature
    pub const DS: *volatile types.peripherals.DS = @ptrFromInt(0x50094000);
    /// HMAC (Hash-based Message Authentication Code) Accelerator
    pub const HMAC: *volatile types.peripherals.HMAC = @ptrFromInt(0x50095000);
    /// ECDSA (Elliptic Curve Digital Signature Algorithm) Accelerator
    pub const ECDSA: *volatile types.peripherals.ECDSA = @ptrFromInt(0x50096000);
    /// PVT Peripheral
    pub const PVT: *volatile types.peripherals.PVT = @ptrFromInt(0x5009e000);
    /// MIPI Camera Interface Host
    pub const MIPI_CSI_HOST: *volatile types.peripherals.MIPI_CSI_HOST = @ptrFromInt(0x5009f000);
    /// MIPI Camera Interface Bridge
    pub const MIPI_CSI_BRIDGE: *volatile types.peripherals.MIPI_CSI_BRIDGE = @ptrFromInt(0x5009f800);
    /// MIPI Display Interface Host
    pub const MIPI_DSI_HOST: *volatile types.peripherals.MIPI_DSI_HOST = @ptrFromInt(0x500a0000);
    /// MIPI Camera Interface Bridge
    pub const MIPI_DSI_BRIDGE: *volatile types.peripherals.MIPI_DSI_BRIDGE = @ptrFromInt(0x500a0800);
    /// ISP Peripheral
    pub const ISP: *volatile types.peripherals.ISP = @ptrFromInt(0x500a1000);
    /// BITSCRAMBLER Peripheral
    pub const BITSCRAMBLER: *volatile types.peripherals.BITSCRAMBLER = @ptrFromInt(0x500a3000);
    /// AXI_ICM Peripheral
    pub const AXI_ICM: *volatile types.peripherals.AXI_ICM = @ptrFromInt(0x500a4000);
    /// H264 Encoder (DMA)
    pub const H264_DMA: *volatile types.peripherals.H264_DMA = @ptrFromInt(0x500a7000);
    /// Motor Control Pulse-Width Modulation 0
    pub const MCPWM0: *volatile types.peripherals.MCPWM0 = @ptrFromInt(0x500c0000);
    /// Motor Control Pulse-Width Modulation 1
    pub const MCPWM1: *volatile types.peripherals.MCPWM0 = @ptrFromInt(0x500c1000);
    /// Timer Group 0
    pub const TIMG0: *volatile types.peripherals.TIMG0 = @ptrFromInt(0x500c2000);
    /// Timer Group 1
    pub const TIMG1: *volatile types.peripherals.TIMG0 = @ptrFromInt(0x500c3000);
    /// I2C (Inter-Integrated Circuit) Controller 0
    pub const I2C0: *volatile types.peripherals.I2C0 = @ptrFromInt(0x500c4000);
    /// I2C (Inter-Integrated Circuit) Controller 1
    pub const I2C1: *volatile types.peripherals.I2C0 = @ptrFromInt(0x500c5000);
    /// I2S (Inter-IC Sound) Controller 0
    pub const I2S0: *volatile types.peripherals.I2S0 = @ptrFromInt(0x500c6000);
    /// I2S (Inter-IC Sound) Controller 1
    pub const I2S1: *volatile types.peripherals.I2S0 = @ptrFromInt(0x500c7000);
    /// I2S (Inter-IC Sound) Controller 2
    pub const I2S2: *volatile types.peripherals.I2S0 = @ptrFromInt(0x500c8000);
    /// Pulse Count Controller
    pub const PCNT: *volatile types.peripherals.PCNT = @ptrFromInt(0x500c9000);
    /// UART (Universal Asynchronous Receiver-Transmitter) Controller 0
    pub const UART0: *volatile types.peripherals.UART0 = @ptrFromInt(0x500ca000);
    /// UART (Universal Asynchronous Receiver-Transmitter) Controller 1
    pub const UART1: *volatile types.peripherals.UART0 = @ptrFromInt(0x500cb000);
    /// UART (Universal Asynchronous Receiver-Transmitter) Controller 2
    pub const UART2: *volatile types.peripherals.UART0 = @ptrFromInt(0x500cc000);
    /// UART (Universal Asynchronous Receiver-Transmitter) Controller 3
    pub const UART3: *volatile types.peripherals.UART0 = @ptrFromInt(0x500cd000);
    /// UART (Universal Asynchronous Receiver-Transmitter) Controller 4
    pub const UART4: *volatile types.peripherals.UART0 = @ptrFromInt(0x500ce000);
    /// Parallel IO Controller
    pub const PARL_IO: *volatile types.peripherals.PARL_IO = @ptrFromInt(0x500cf000);
    /// SPI (Serial Peripheral Interface) Controller 2
    pub const SPI2: *volatile types.peripherals.SPI2 = @ptrFromInt(0x500d0000);
    /// SPI (Serial Peripheral Interface) Controller 3
    pub const SPI3: *volatile types.peripherals.SPI3 = @ptrFromInt(0x500d1000);
    /// Full-speed USB Serial/JTAG Controller
    pub const USB_DEVICE: *volatile types.peripherals.USB_DEVICE = @ptrFromInt(0x500d2000);
    /// LED Control PWM (Pulse Width Modulation)
    pub const LEDC: *volatile types.peripherals.LEDC = @ptrFromInt(0x500d3000);
    /// Remote Control
    pub const RMT: *volatile types.peripherals.RMT = @ptrFromInt(0x500d4000);
    /// Event Task Matrix
    pub const SOC_ETM: *volatile types.peripherals.SOC_ETM = @ptrFromInt(0x500d5000);
    /// Interrupt Controller (Core 0)
    pub const INTERRUPT_CORE0: *volatile types.peripherals.INTERRUPT_CORE0 = @ptrFromInt(0x500d6000);
    /// Interrupt Controller (Core 1)
    pub const INTERRUPT_CORE1: *volatile types.peripherals.INTERRUPT_CORE1 = @ptrFromInt(0x500d6800);
    /// Two-Wire Automotive Interface
    pub const TWAI0: *volatile types.peripherals.TWAI0 = @ptrFromInt(0x500d7000);
    /// Two-Wire Automotive Interface
    pub const TWAI1: *volatile types.peripherals.TWAI0 = @ptrFromInt(0x500d8000);
    /// Two-Wire Automotive Interface
    pub const TWAI2: *volatile types.peripherals.TWAI0 = @ptrFromInt(0x500d9000);
    /// I3C Controller (Master)
    pub const I3C_MST: *volatile types.peripherals.I3C_MST = @ptrFromInt(0x500da000);
    /// I3C_MST_MEM Peripheral
    pub const I3C_MST_MEM: *volatile types.peripherals.I3C_MST_MEM = @ptrFromInt(0x500da000);
    /// I3C Controller (Slave)
    pub const I3C_SLV: *volatile types.peripherals.I3C_SLV = @ptrFromInt(0x500db000);
    /// Camera/LCD Controller
    pub const LCD_CAM: *volatile types.peripherals.LCD_CAM = @ptrFromInt(0x500dc000);
    /// ADC (Analog to Digital Converter)
    pub const ADC: *volatile types.peripherals.ADC = @ptrFromInt(0x500de000);
    /// Universal Host Controller Interface 0
    pub const UHCI0: *volatile types.peripherals.UHCI0 = @ptrFromInt(0x500df000);
    /// General Purpose Input/Output
    pub const GPIO: *volatile types.peripherals.GPIO = @ptrFromInt(0x500e0000);
    /// Sigma-Delta Modulation
    pub const GPIO_SD: *volatile types.peripherals.GPIO_SD = @ptrFromInt(0x500e0f00);
    /// Input/Output Multiplexer
    pub const IO_MUX: *volatile types.peripherals.IO_MUX = @ptrFromInt(0x500e1000);
    /// System Timer
    pub const SYSTIMER: *volatile types.peripherals.SYSTIMER = @ptrFromInt(0x500e2000);
    /// High-Power System
    pub const HP_SYS: *volatile types.peripherals.HP_SYS = @ptrFromInt(0x500e5000);
    /// HP_SYS_CLKRST Peripheral
    pub const HP_SYS_CLKRST: *volatile types.peripherals.HP_SYS_CLKRST = @ptrFromInt(0x500e6000);
    /// LP_SYS Peripheral
    pub const LP_SYS: *volatile types.peripherals.LP_SYS = @ptrFromInt(0x50110000);
    /// LP_AON_CLKRST Peripheral
    pub const LP_AON_CLKRST: *volatile types.peripherals.LP_AON_CLKRST = @ptrFromInt(0x50111000);
    /// Low-power Timer
    pub const LP_TIMER: *volatile types.peripherals.LP_TIMER = @ptrFromInt(0x50112000);
    /// LP_ANA_PERI Peripheral
    pub const LP_ANA_PERI: *volatile types.peripherals.LP_ANA_PERI = @ptrFromInt(0x50113000);
    /// LP_HUK Peripheral
    pub const LP_HUK: *volatile types.peripherals.LP_HUK = @ptrFromInt(0x50114000);
    /// PMU Peripheral
    pub const PMU: *volatile types.peripherals.PMU = @ptrFromInt(0x50115000);
    /// Low-power Watchdog Timer
    pub const LP_WDT: *volatile types.peripherals.LP_WDT = @ptrFromInt(0x50116000);
    /// LP_PERI Peripheral
    pub const LP_PERI: *volatile types.peripherals.LP_PERI = @ptrFromInt(0x50120000);
    /// Low-power UART (Universal Asynchronous Receiver-Transmitter) Controller
    pub const LP_UART: *volatile types.peripherals.LP_UART = @ptrFromInt(0x50121000);
    /// Low-power I2C (Inter-Integrated Circuit) Controller 0
    pub const LP_I2C0: *volatile types.peripherals.LP_I2C0 = @ptrFromInt(0x50122000);
    /// LP_I2C_ANA_MST Peripheral
    pub const LP_I2C_ANA_MST: *volatile types.peripherals.LP_I2C_ANA_MST = @ptrFromInt(0x50124000);
    /// Low-power I2S (Inter-IC Sound) Controller 0
    pub const LP_I2S0: *volatile types.peripherals.LP_I2S0 = @ptrFromInt(0x50125000);
    /// Low-power Analog to Digital Converter
    pub const LP_ADC: *volatile types.peripherals.LP_ADC = @ptrFromInt(0x50127000);
    /// LP_TOUCH Peripheral
    pub const LP_TOUCH: *volatile types.peripherals.LP_TOUCH = @ptrFromInt(0x50128000);
    /// Low-power General Purpose Input/Output
    pub const LP_GPIO: *volatile types.peripherals.LP_GPIO = @ptrFromInt(0x5012a000);
    /// Low-power Input/Output Multiplexer
    pub const LP_IO_MUX: *volatile types.peripherals.LP_IO_MUX = @ptrFromInt(0x5012b000);
    /// Low-power Interrupt Controller
    pub const LP_INTR: *volatile types.peripherals.LP_INTR = @ptrFromInt(0x5012c000);
    /// eFuse Controller
    pub const EFUSE: *volatile types.peripherals.EFUSE = @ptrFromInt(0x5012d000);
    /// Low-power Temperature Sensor
    pub const LP_TSENS: *volatile types.peripherals.LP_TSENS = @ptrFromInt(0x5012f000);
    /// PAU Peripheral
    pub const PAU: *volatile types.peripherals.PAU = @ptrFromInt(0x60093000);
};
