const std = @import("std");
const buliltin = @import("builtin");

// pub const TargetProfile = struct{
//     target: std.Build.ResolvedTarget, 
//     profile: std.builtin.OptimizeMode,
//     home_dir: []u8,
//     toolchain: ?Toolchain,
        
    /// Used for applying different settings on various step types. 
    pub const OptionKind = enum {
            Includes, 
            CMacros, 
            Steps,
            Scripts,
            Headers,
    };

/// Creates a new executable kind. Invoking the `installArtifact` command 
/// would generate the `zig-out` directory when running `zig build`. It 
/// generates: 
/// ├── .zig-cache
/// └── zig-out
///    └── bin → <std.Build.Step.Compile.Kind>
///        └── <exe_name>
/// --------------------------------------------
/// Run Step => "Provide a way to run one's application directly from the build command". 
/// const run_exe = b.addRunArtifact(exe);
/// const run_step = b.step("run", "Run the application");
/// run_step.dependOn(&run_exe.step);
pub const Firmware = struct {
    /// The target to build (compile)
    executable: *std.Build.Step.Compile,
    toolchain: ?Toolchain = null,
    
    // pub fn new(b: *std.Build, target_kind: ?std.Build.ResolvedTarget, profile: ?std.builtin.OptimizeMode) Toolchain{

    /// Creates a new executable that should be compiled.
    /// The target to build can be either: 
    /// - An example zig executable containing a `main` fn entry point. 
    /// - Static library (e.g., by utilizing the ESP IDF toolchain framework). 
    pub fn new(b: *std.Build, kind: std.Build.Step.Compile.Kind, name: []const u8, toolchain: ?Toolchain) Firmware{

        // This module should act as the root module of the 
        // firmware executable. 
        const firmware_module = b.addModule(name, .{
            .target = config.target,
            .optimize = config.profile,
            .root_source_file = b.path(exe_path),
        });

        if(std.Build.Step.Id == .translate_c){} // create the TranslateC

        const isExecutableExample: bool = is_example: {
            // Check if executable file exist in the "examples" directory.
            var dir = try std.fs.cwd().openDir("main/examples", .{
                .iterate = true, 
            });
            var iter = dir.iterate();
            while(try iter.next()) |entry| {
               if (std.mem.eql(u8, entry.name, name)) break :is_example true;
            }
            break :is_example false; 
        };

        if (isExecutableExample) std.debug.print("Building Compilation Example Target: {s}\n", .{name});

        // const config_option = b.option([]const u8, "option_name", "dummy user-specific option description"); 
        // _ = config_option;
        // const build_options = b.addOptions();

        const firmware_target = switch (kind) {
            .exe => exe_blk: {
                const firmware_exe = b.addExecutable(.{
                    .name = name,
                    .root_module = firmware_module, 
                });
                break :exe_blk firmware_exe; 
            },
            .lib => lib_blk: {
                const firmware_lib = b.addLibrary(.{
                    .linkage = .static,
                    .name = name orelse "app_exe", 
                    .root_module = firmware_module,
                });
                // b.getInstallStep().dependOn(&firmware_lib.step);
                // esp_idf_lib.step.dependOn(bindings.output_file.step);
                firmware_lib.step.dependOn(config.toolchain.?.code_wrapper.output_file.step);
                break :lib_blk firmware_lib;
            },
            .obj => obj_blk: {
                const firmware_obj = b.addObject(.{});
                break :obj_blk firmware_obj; 
            },
            .@"test" => test_blk: {
                const firmware_testing = b.addTest(.{
                    .test_runner = null,
                });
                break :test_blk firmware_testing; 
            },
        };
        
        // const lib = std.Build.Step.Compile.installLibraryHeaders(cs: *Compile, lib: *Compile);
        // const lib = std.Build.Step.Compile.HeaderInstallation;

        return Firmware{
           .executable = firmware_target,  
        };

    }

    pub fn getCompilationTarget(self: Firmware) ?std.Build.ResolvedTarget{
        return self.executable.root_module.resolved_target;
    }

    pub fn getOptimizationProfile(self: Firmware) ?std.builtin.OptimizeMode{
        return self.executable.root_module.optimize;
    }

    fn addDependencies(self: *Firmware, modules: []const std.Build.Module.Import) void {
        for(modules) |import| {
            // firmware_target.root_module.addImport(name: []const u8, module: *Module)
            self.executable.root_module.addImport(import.name, import.module);
        }

    }

    /// `addObjCopy` creates a new build step using `objcopy`
    /// to convert the output of a compilation step into another 
    /// format. Usally: ELF → .bin, ELF → .hex.
    /// The resulting file is placed at `zig-out/bin/`. 
    pub fn objcopy(self: *Firmware, b: *std.Build, output_format: std.Build.Step.ObjCopy.RawFormat) void {
        switch (output_format) {
            .bin => {
                const bin = b.addObjCopy(self.executable.getEmittedBin(), .{
                    .format = .bin,
                });
                _ = bin; 
            },
            .elf => {
                const elf = b.addObjCopy(self.executable.getEmittedBin(), .{
                    .format = .elf,
                });
                _ = elf; 
            },
            .hex => {},
        }
    }

    /// Given: `zig build `
    pub fn objdump(self: *Firmware, b: *std.Build) void {
        _ = self; 
        const objdump_cmd = b.addSystemCommand(&.{
            "riscv32-elf-objdump"
        });
        
        objdump_cmd.addArg("--disassemble-all");
    }
};
    
/// The `Toolchain` contains the TranslateC bindings. The 
/// Toolchain is responsible for interfacing the ESP IDF SDK 
/// and its associated APIs. Thus require linking the C code, 
/// by adding the include paths to the consumed `components`. 
pub const Toolchain = struct {
    /// Path to the toolchain directoy. In this case, the path
    /// to the ESP IDF toolchain and its components.  
    path: []u8, 

    board_target: []const u8,
   
    /// This would generate bindings declaration for the ESP-IDF library. 
    /// Defined in the `bindings.h` header file. `TranslateC` would 
    /// translate C code into Zig code. 
    code_wrapper: *std.Build.Step.TranslateC,

    pub fn deinit(self: *Toolchain, b: *std.Build) void {
        b.allocator.free(self.path);
    }

    pub fn new(b: *std.Build, target_kind: ?std.Build.ResolvedTarget, profile: ?std.builtin.OptimizeMode) Toolchain{
        // const user_option = b.option(comptime T: type, name_raw: []const u8, description_raw: []const u8)
        // const target_options = b.addOptions();

        //TODO: - Define a centralized module for the created bindings.zig file.
        // That was generated by the Steps: TranslateC and InstallFile 

        // const esp_idf = b.createModule(.{
        //     .root_source_file = b.path("src/bindings.zig"),
        // });

        // esp_idf.owner.getInstallStep().dependOn(b.top_level_steps)
        // const wrapper = b.addTranslateC(binding_options);
        // const idf_bindings = b.addInstallFile(wrapper.getOutput(), "src/bindings.zig"); 

        // const option_description = 
        //     \\Usage: source 
        //     \\
        // ; 


        const board_target = b.option([]const u8, "ESP-Target", 
            "Defines the ESP board target, e.g., esp32p4 or esp32s3") 
        orelse @tagName(b.graph.host.result.cpu.arch);
        
        const binding_options: std.Build.Step.TranslateC.Options = .{
            .link_libc = true, 
            .optimize = profile orelse b.standardOptimizeOption(.{}),
            .target = target_kind orelse b.standardTargetOptions(.{}),
            .root_source_file = b.path("include/bindings.h"),
        };

        //TODO: - HEHEHEHEHEHHEHEH
        const pre_setup = b.addSystemCommand(&.{"source ./scripts/pre_setup.sh"});
        pre_setup.addArgs(&.{ "--target ", board_target});
        // pre_setup.addFileArg(lp: std.Build.LazyPath)
        const cmd_output = pre_setup.captureStdOut();
        // pre_setup.captured_stdout.?.generated_file.step;
        _ = cmd_output; 

        // if (pre_setup.captured_stdout) |output| {
        //     const output_path = output.generated_file.getPath();
        //     b.getInstallStep().dependOn(&b.addInstallFile(cmd_output, output_path));
        // }
        b.getInstallStep().dependOn(&pre_setup.step);

        return Toolchain{
            .path = std.process.getEnvVarOwned(b.allocator, "IDF_PATH") catch "",
            .code_wrapper = b.addTranslateC(binding_options), 
        };
    }

    /// Convert C headers into Zig bindings/declarations
    pub fn getZigBindingsInstallFile(self: Toolchain) *std.Build.Step.InstallFile{
        self.code_wrapper.output_file;
    }

    pub fn setup(self: *Toolchain) !void {
        _ = self; 
    }
};


// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) !void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const esp32s3_target = std.Target.Query{
        .cpu_arch = .xtensa,
        .cpu_model = .{
            .explicit = &std.Target.xtensa.cpu.esp32s3,
        },
        .os_tag = .freestanding,
        .abi = .none,
    };
    

    const riscv_target = std.Target.Query{
        .cpu_arch = .riscv32,
        .cpu_model = .{ .explicit = &std.Target.riscv.cpu.generic_rv32 },
        // .cpu_model = .{ .explicit = &std.Target.riscv.cpu.esp32p4 },
        // .cpu_model = .{ .explicit = &std.Target.riscv.cpu.baseline_rv32 },
        .os_tag = .freestanding,
        .abi = .eabihf,
        // RISC-V feature (example):
        // m → Multiply/Divide,
        // a → Atomic,
        // c → Compressed,
        // f → Single-Precision float,
        // d → Double-Precision float,
        // ...
        // `.cpu_features_sub`=> Removes RISC-V extensions!
        .cpu_features_sub = std.Target.riscv.featureSet(&.{ .zca, .zcb, .zcmt, .zcmp }),
    };

    const targets: []const std.Target.Query = &.{
        esp32s3_target,
        riscv_target,
    };

    const target = b.standardTargetOptions(.{ 
        .default_target = esp32s3_target,
        .whitelist = targets,
    });

    const optimize = b.standardOptimizeOption(.{});
    std.debug.print("target features: {any}\n", .{target.result.cpu.features});

    // Ensure that Zig can find the necessary ESP-IDF header files.
    const home_directory = std.process.getEnvVarOwned(b.allocator, "HOME") catch "";
    const esp_idf_path = std.process.getEnvVarOwned(b.allocator, "IDF_PATH") catch "";

    // b.addInstallArtifact(artifact: *Step.Compile, options: Step.InstallArtifact.Options) → *Step.InstallArtifact
    // const installed_bindings = b.addInstallFile(bindings.getOutput(), "../src/bindings.zig");
    // b.getInstallStep().dependOn(&installed_bindings.step);

    // generate bindings for the ESP-IDF library
    const bindings = b.addTranslateC(.{
        .link_libc = true,
        .optimize = optimize,
        .target = target,
        .root_source_file = b.path("include/bindings.h"),
    });
    bindings.defineCMacro("__xtensa", "");
    bindings.defineCMacro("__COUNTER__", "0");
    bindings.defineCMacro("CONFIG_IDF_TARGET_ESP32S3", "1");
    bindings.defineCMacro("XCHAL_NUM_AREGS", "64");
    bindings.defineCMacro("XCHAL_HAVE_s32c1I", "1");
    bindings.defineCMacro("LOG_LOCAL_LEVEL", "ESP_LOG_VERBOSE");

    //Here goes a static library to be linked with c / c++ app.
    const esp_idf_lib = b.addStaticLibrary(.{
        .link_libc = true,
        .name = "firmware_app",
        .root_source_file = b.path("main/src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const include_components = std.process.getEnvVarOwned(b.allocator, "INCLUDE_DIRS") catch "";
    defer b.allocator.free(include_components);

    const include_paths = [_][]const u8{
        "components/freertos/FreeRTOS-Kernel/include",
        "components/freertos/config/include/freertos",
        "components/freertos/config/xtensa/include",
        "components/freertos/FreeRTOS-Kernel-SMP/portable/xtensa/include/freertos",
        "components/esp_hw_support/include",
        "components/soc/esp32s3/include",
        "components/esp_common/include",
        "components/xtensa/include",
        "components/xtensa/include/xtensa",
        "components/xtensa/esp32s3/include",
        "components/xtensa/esp32s3/include/xtensa/config",
        "components/soc/esp32s3/register",
        "components/esp_system/include",
        "components/newlib/include",
        "components/newlib/platform_include/sys",
        "components/newlib/platform_include",
        "components/hal/platform_port/include",
        "components/heap/include",
        "components/esp_rom/include",
        "components/esp_netif/include",
        "components/esp_wifi/include",
        "components/esp_event/include",
        "components/lwip/include",
        "components/lwip/lwip/src/include",
        "components/lwip/port/include",
        "components/freertos/config/include",
        "components/lwip/port/freertos/include",
        "components/lwip/port/esp32xx/include",
        "components/log/include",
        "components/esp_timer/include",
        "components/app_trace/include",
        "components/nvs_flash/include",
        "components/esp_partition/include",
        "components/esp_event/include",
    };

    if (!std.mem.eql(u8, esp_idf_path, "")) {
        const archtools = b.fmt("{s}-esp-elf", .{
            @tagName(esp_idf_lib.rootModuleTarget().cpu.arch),
        });

        // Final include path depend on the target board:
        // "$HOME/.espressif/tools/"++archtools
        // $HOME/.espressif/tools/riscv32-esp-elf/esp-14.2.0_20241119/riscv32-esp-elf/riscv32-esp-elf/

        const espressif_include: []const u8 = espressif: {
            var espressif_path = b.fmt("{s}/.espressif/tools", .{home_directory});
            const target_board = switch(esp_idf_lib.rootModuleTarget().cpu.arch) {
                .riscv32 => "esp32p4",
                .xtensa => "esp32s3",
            };
            var espressif_dir = try std.fs.cwd().openDir(espressif_path, .{.iterate = true});
            defer espressif_dir.close();
            var walker = try espressif_dir.walk(b.allocator);
            defer walker.deinit();

            while (try walker.next()) |entry| {
                const ext = std.fs.path.extension(entry.basename);
                _ = ext; 
                if(entry.kind == .directory){
                    if(std.mem.startsWith(u8, entry.basename, "esp-")) continue; 
                    // if (std.mem.cont)
                    
                }
            }        

        };
        // bindings.addIncludePath(.{ .cwd_relative = b.pathJoin(&.{
        //     espressif_path,
        //     archtools,
        //     "esp-13.2.0_20240530",
        //     archtools,
        //     archtools,
        //     "include",
        // }) });

        bindings.addIncludePath(.{ .cwd_relative = b.pathJoin(&.{
            home_directory,
            ".espressif",
            "tools",
            archtools,
            "esp-13.2.0_20240530",
            archtools,
            archtools,
            "include",
        }) });

        for (include_paths) |path| {
            const esp_components = std.fmt.allocPrint(b.allocator, "{s}/{s}", .{ esp_idf_path, path }) catch @panic("Out of Memory");
            bindings.addIncludePath(.{ .cwd_relative = esp_components });
        }

        // bindings.addIncludePath(.{ .cwd_relative = "../build/config/" });
        bindings.addIncludePath(.{ .cwd_relative = "build/config/" });
        bindings.addIncludePath(.{ .cwd_relative = "." });
        // try searched_idf_include(b, bindings, esp_idf_path);
        try searched_idf_libs(b, esp_idf_lib);
        //try add_c_includes(b, esp_idf_lib);
    }

    const installed_bindings = b.addInstallFile(bindings.getOutput(), "../src/bindings.zig");
    b.getInstallStep().dependOn(&installed_bindings.step);
   
    // b.top_level_steps
    // const step_id = b.getInstallStep().id;
    // step_id.Type().base_id == .install_artifact

    //TODO: - Go here!
    const esp_idf = b.createModule(.{
        .root_source_file = b.path("src/bindings.zig"),
    });

    const utils_mod = b.addModule("esp32s3_utils", .{
        .root_source_file = b.path("src/esp32s3_utils.zig"),
    });

    const gpio_mod = b.addModule("gpio", .{
        .root_source_file = b.path("src/gpio.zig"),
    });

    const ai_mod = b.addModule("ai_model", .{
        .root_source_file = b.path("model/root.zig"),
        .target = target,
    });
    
    const nn_lib = b.addLibrary(.{
        // .linkage = .dynamic,
        .linkage = .static,
        .name = "nn_model",
        .root_module = ai_mod,
    });

    // Driver modules, that need access to the esp idf API components.
    // Created by the generated bindings.zig (InstallFile)
    // ---------------------- 
    utils_mod.addImport("esp_idf", esp_idf);
    gpio_mod.addImport("esp_idf", esp_idf);

    // -------------------------- Imports that should be added to the Main Firmware.
    esp_idf_lib.root_module.addImport("esp_idf_utils", utils_mod);
    esp_idf_lib.root_module.addImport("gpio", gpio_mod);
    esp_idf_lib.root_module.addImport("nn_model", ai_mod);
    esp_idf_lib.step.dependOn(bindings.output_file.step);
    
    // const exe_check = b.addExecutable(.{
    //     .name = "model",
    //     .root_module = ai_mod,
    //     .target = target,
    // });
    //
    // const check = b.step("check", "Check if AI model code compiles");
    // check.dependOn(&exe_check.step);

    b.installArtifact(esp_idf_lib);
    b.installArtifact(nn_lib);
    // b.addInstallArtifact(artifact: *Step.Compile, options: Step.InstallArtifact.Options)

    const example_step = b.step("examples", "Build and run example");
    const AddExample = struct {name: []const u8, src: []const u8, description: []const u8 };
    const host_example = AddExample{
        .name = "host_app",
        .src = "examples/host_app.zig",
        .description = "Running the Neural Network Model on the host computer (native target)",
    }; 

    const host_exe = b.addExecutable(.{
        .target =  b.graph.host, 
        .name = host_example.name,
        .root_source_file = b.path(host_example.src),
        .optimize = optimize, 
    });
    host_exe.root_module.addImport("nn_model", ai_mod); 

    // Install host example executable
    b.installArtifact(host_exe);

    // Create a run step for the example
    const run_cmd = b.addRunArtifact(host_exe);
    run_cmd.step.dependOn(b.getInstallStep());
    
    // Add the example to the examples step
    example_step.dependOn(&host_exe.step);

    // esp_idf_lib.setLinkerScript(b.path("linker.ld"));
    const link = b.addSystemCommand(&[_][]const u8{
        "xtensa-esp32-elf-gcc",
        "-T",
        "linker.ld",
        "-o",
        "esp32_s3_app",
        "main.o",
    });

    link.step.dependOn(&esp_idf_lib.step);

    const link_step = b.step("link", "Linking the ELF binary from the .o (object) files.");
    link_step.dependOn(&link.step);

    // This *creates* a Run step in the build graph, to be executed when another
    // step is evaluated that depends on it. The next line below will establish
    // such a dependency.
    //const run_cmd = b.addRunArtifact(exe);

    // By making the run step depend on the install step, it will be run from the
    // installation directory rather than directly from within the cache directory.
    // This is not necessary, however, if the application depends on other installed
    // files, this ensures they will be present and in the expected location.
    //run_cmd.step.dependOn(b.getInstallStep());

    // This allows the user to pass arguments to the application in the build
    // command itself, like this: `zig build run -- arg1 arg2 etc`
    // if (b.args) |args| {
    //     run_cmd.addArgs(args);
    // }

    // This creates a build step. It will be visible in the `zig build --help` menu,
    // and can be selected like this: `zig build run`
    // This will evaluate the `run` step rather than the default, which is "install".
    // const run_step = b.step("run", "Run the app");
    // run_step.dependOn(&run_cmd.step);
}

fn target_setup(b: *std.Build, targets: []const std.Target.Query, optimization: []const ?std.builtin.OptimizeMode) !void {
    if (optimization.len != targets.len) return error.OptimizationAndTargetsDifferentLength; 

    for (targets, 0..) |query_target, i| {
        const target = b.resolveTargetQuery(query_target);
        const optim_mode = optimization[i];
        const firmware = Firmware.new(b, .lib, "dummy_app", Toolchain.new(b, target, optim_mode));
        // std.Build.Step.Id == .compile;
        // std.Build.Step.Compile.Kind == .lib;

        const compile_options = b.step("dummy", "dummy step...");
        compile_options.init(.{
            .id = .translate_c,
        });

        // std.Build.Step.Run.addArgs(run: *Run, args: []const []const u8)
        const run_cmd = b.addRunArtifact(firmware.executable);
        
        run_cmd.addArgs(&.{
            "--example=", "--arg2=", "--arg3=",
        });
        
        run_cmd.step.dependOn(b.getInstallStep());

        // if (b.addUserInputFlag(name_raw: []const u8))
        if (b.args) |args| {
            _ = args;  
        }
        
        try app_setup(b, target_profile); 
    }
}

pub fn app_setup(b: *std.Build, target: std.Build.ResolvedTarget, profile: std.builtin.OptimizeMode) !void {
    switch (target.result.cpu.arch) {
        inline else => |arch| {
            std.debug.print("Target ({s}) Features: {any}\n", .{arch.genericName(), target.result.cpu.features});

            const library_name: ?[]const u8 = lib_name:{
                if(arch.isRISCV()) break :lib_name "riscv_app"; 
                if(std.mem.eql(u8, arch.genericName(), "xtensa")) break: lib_name "xtensa_app";
                if(std.mem.endsWith(u8, target.result.cpu.model.name, "esp32s3")) break: lib_name "esp32s3_app";
                
                break: lib_name switch (arch) {
                    .xtensa => "xtensa_app",
                    .riscv32 => "riscv32_app",
                    .arm => "arm_app",
                    else => null,
                };
            };

            if (arch.isRISCV()){
                try riscv_setup(b, null, target_lib, info);
            }

            if (arch == .xtensa){
                try esp32s3_setup(b, null, target_lib, info);
            } 
            
            const toolchain = info.toolchain orelse return error.FailedObtainingToolChainStruct;
            toolchain.code_wrapper.getOutput();
            
            target_lib.linkLibC();
            const target_output = b.addInstallArtifact(target_lib, .{}); // *InstallArtifact
            b.getInstallStep().dependOn(&target_output.step); 

            // Add step for dissasembly the code: 
            const assemblyfile_name = b.fmt("{s}_{s}_exe", .{@tagName(info.profile), @tagName(arch)});
            _ = assemblyfile_name; 
            // target_lib.root_module.addAssemblyFile(source: LazyPath)
            
            // Add step for diff files: 

            // Add test runner step: 
        }
    }
     
}
fn riscv_setup(b: *std.Build, imports: ?[]const std.Build.Module.Import,  main_mod: *std.Build.Step.Compile, target: *TargetProfile) !void {
    var toolchain = target.toolchain orelse return error.FailedObtainingToolChainStruct; 
    // -------------------------------- Target Specific Setup
    toolchain.code_wrapper.defineCMacro("LOG_LOCAL_LEVEL", "ESP_LOG_VERBOSE");
    toolchain.code_wrapper.addIncludePath(.{});
    // -------------------------------- Target Specific Setup

    // -------------------------------- Obtain TranslateC zig bindings
    const installed_bindings = b.addInstallFile(toolchain.code_wrapper.getOutput(), "../src/bindings.zig");
    b.getInstallStep().dependOn(&installed_bindings);
    // -------------------------------- Obtain TranslateC zig bindings

    // const headers = target_lib.installed_headers.items;

}

fn esp32s3_setup(b: *std.Build, imports: ?[]const std.Build.Module.Import,  main_mod: *std.Build.Step.Compile, target: *TargetProfile) !void {
    var toolchain = target.toolchain orelse return error.FailedObtainingToolChainStruct; 

    toolchain.code_wrapper.defineCMacro("__xtensa", "");
    toolchain.code_wrapper.defineCMacro("__COUNTER__", "0");
    toolchain.code_wrapper.defineCMacro("CONFIG_IDF_TARGET_ESP32S3", "1");
    toolchain.code_wrapper.defineCMacro("XCHAL_NUM_AREGS", "64");
    toolchain.code_wrapper.defineCMacro("XCHAL_HAVE_s32c1I", "1");
    toolchain.code_wrapper.defineCMacro("LOG_LOCAL_LEVEL", "ESP_LOG_VERBOSE");
}

pub fn add_c_includes(b: *std.Build, lib: *std.Build.Step.TranslateC) !void {
    const esp_idf_path = std.process.getEnvVarOwned(b.allocator, "IDF_PATH") catch "/home/wiiggee1/esp-idf/";
    const esp_components = std.fmt.allocPrint(b.allocator, "{s}/components", .{esp_idf_path}) catch @panic("Out of Memory");

    var comp_dir = std.fs.openDirAbsolute(esp_components, .{ .iterate = true }) catch @panic("Failed to open dir!");
    std.debug.print("component iterator buffer: {s}\n", .{comp_dir.iterate().buf});

    var dir_it = comp_dir.iterate();
    while (dir_it.next()) |dir| {
        const comp = dir orelse break;
        const comp_name: []const u8 = comp.name;
        //const esp_comp_lib = std.fmt.allocPrint(b.allocator, "lib{s}", .{comp_name}) catch @panic("Out of Memory");

        const esp_comp = std.fmt.allocPrint(b.allocator, "{s}/{s}/include/", .{ esp_components, comp_name }) catch @panic("Out of Memory");

        // const esp_comp_src = std.fmt.allocPrint(b.allocator, "{s}/{s}/", .{ esp_components, comp_name }) catch @panic("Out of Memory");

        if (comp.kind != .directory) {
            continue;
        }
        lib.addIncludePath(.{ .cwd_relative = esp_comp });
    } else |err| {
        std.debug.print("Got error: {s}", .{@errorName(err)});
        return;
    }
    comp_dir.close();
    //lib.linkLibC();
}

pub fn searched_idf_include(b: *std.Build, lib: *std.Build.Step.TranslateC, idf_path: []const u8) !void {
    // var includes = std.ArrayList([]const u8).init(b.allocator);
    const comp = b.pathJoin(&.{ idf_path, "components" });
    var dir = try std.fs.cwd().openDir(comp, .{
        .iterate = true,
    });
    defer dir.close();
    var walker = try dir.walk(b.allocator);
    defer walker.deinit();

    const exclude = [_][]const u8{
        "/esp32c1",
        "/esp32c2",
        "/esp32c3",
        "/esp32c4",
        "/esp32c5",
        "/esp32c6",
        "/esp32h1",
        "/esp32h2",
        "/esp32h3",
        "/esp32h4",
        "/esp32p4",
        "/esp32s1",
        "/esp32s2",
        "/esp32/",
    };

    while (try walker.next()) |entry| {
        const target_dir = b.pathJoin(&.{ comp, b.dupe(entry.path) });

        if (entry.kind == .directory and exclude_dir(target_dir, &exclude)) {
            // std.debug.print("Skipping: {s}\n", .{target_dir});
            continue;
        }
        if (entry.kind == .directory and std.mem.endsWith(u8, entry.path, "/include")) {
            //const include_directory = b.pathJoin(&.{ comp, std.fs.path.dirname(b.dupe(entry.path)).? });
            const include_directory = b.pathJoin(&.{ comp, b.dupe(entry.path) });
            // std.debug.print("Adding include path: {s}\n", .{include_directory});
            // lib.addSystemIncludePath(.{ .cwd_relative = include_directory });
            // try includes.append(include_directory);
            lib.addIncludePath(.{ .cwd_relative = include_directory });
        } else {
            // const ext = std.fs.path.extension(entry.basename);
            if (entry.kind == .directory and (entry.kind != .file)) {
                // std.debug.print("Does not end with /include: {s}\n", .{target_dir});
                // lib.addIncludePath(.{ .cwd_relative = b.pathJoin(&.{ comp, b.dupe(entry.path) }) });
            }
        }
    }
}

pub fn exclude_dir(path: []const u8, targets: []const []const u8) bool {
    for (targets) |target| {
        if (std.mem.indexOf(u8, path, target) != null) {
            return true;
        }
    }
    return false;
}

pub fn searched_idf_libs(b: *std.Build, lib: *std.Build.Step.Compile) !void {
    var dir = try std.fs.cwd().openDir("build", .{
        .iterate = true,
    });
    defer dir.close();
    var walker = try dir.walk(b.allocator);
    defer walker.deinit();

    while (try walker.next()) |entry| {
        const ext = std.fs.path.extension(entry.basename);
        const lib_ext = inline for (&.{".obj"}) |e| {
            if (std.mem.eql(u8, ext, e))
                break true;
        } else false;
        if (lib_ext) {
            const src_path = std.fs.path.dirname(@src().file) orelse b.pathResolve(&.{".."});
            const cwd_path = b.pathJoin(&.{ src_path, "build", b.dupe(entry.path) });
            const lib_file: std.Build.LazyPath = .{ .cwd_relative = cwd_path };
            lib.addObjectFile(lib_file);
        }
    }
}
