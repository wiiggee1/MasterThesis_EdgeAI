const std = @import("std");
const buliltin = @import("builtin");
const build_types = @import("config/build_config.zig");

const BuildConfig = build_types.BuildConfig;
const Toolchain = build_types.Toolchain; 
const Firmware = build_types.Firmware; 

//     {
//   "dimensions": {
//     "input_features": 1,
//     "timesteps": 10,
//     "hidden_encoder": 16,
//     "latent": 8,
//     "hidden_decoder": 16
//   },
//   "batch_size": 128,
//   "convention": "ColumnFeatureOrdering",
//   "alpha": 0.1,
//   "learning_rate": 0.0001,
//   "epochs": 750,
//   "optimizer": "AdamW",
//   "loss_fn": "MSELoss",
//   "scheduler": "ReduceLROnPlateau",
//   "dtype": "f32",
//   "threshold_quantile": 0.98,
//   "threshold": 2.7395969937060727e-06,
//   "persistence": 3,
//   "split_ratio": 0.2
// }
const ModelRuntimeConfig = struct {
    dimensions: struct {
        input_features: usize,
        timesteps: usize,
        hidden_encoder: usize,
        latent: usize,
        hidden_decoder: usize,
    },
    batch_size: usize,
    convention: []const u8,
    alpha: f32,
    learning_rate: f32,
    epochs: u8,
    optimizer: []const u8,
    loss_fn: []const u8,
    scheduler: []const u8,
    dtype: []const u8,
    threshold_quantile: f32,
    threshold: f32,
    persistence: u8,
    split_ratio: f32,
};

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) !void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    
    const xtensa_target: ?std.Target.Query = xtensa:{
        if (std.mem.containsAtLeast(u8, buliltin.zig_version_string, 1, "xtensa")){
            const esp32s3_target = std.Target.Query{
                .cpu_arch = .xtensa,
                .cpu_model = .{
                    .explicit = &std.Target.xtensa.cpu.generic
                    // .explicit = &std.Target.xtensa.cpu.esp32s3
                },
                .os_tag = .freestanding,
                .abi = .none,
            };
            break :xtensa esp32s3_target;

        }else {
            // The esp32s3 target require Zig toolchain with LLVM backend support. 
            const details: []const u8 = "https://deepwiki.com/kassane/zig-esp-idf-sample/3.2-target-platform-support";
            std.log.warn("Zig version {s} has no Xtensa support need LLVM fork!\nMore details here: {s}\n", .{buliltin.zig_version_string, details}); 
            break :xtensa null;
        }
    };

    const riscv_target = std.Target.Query{
        .cpu_arch = .riscv32,
        .cpu_model = .{ .explicit = &std.Target.riscv.cpu.generic_rv32 },
        // .cpu_model = .{ .explicit = &std.Target.riscv.cpu.esp32p4 },
        .os_tag = .freestanding,
        // .abi = .eabi,
        .abi = .none,
        // .abi = .ilp32,
        // .abi = .eabihf,
        .cpu_features_sub = std.Target.riscv.featureSet(&.{ .zca, .zcb, .zcmt, .zcmp, .d,}),
        // Testing without F extension. 
        // .cpu_features_sub = std.Target.riscv.featureSet(&.{ .zca, .zcb, .zcmt, .zcmp, .f }),
        .cpu_features_add = std.Target.riscv.featureSet(&.{
            .i, .a, .m, .c, .f,
            .zicsr, .zifencei, .zmmul, .zaamo, .zalrsc, 
            // .xcvsimd,
            // .zve64d, .zvl128b,
        }),
        // .cpu_features_add = std.Target.riscv.featureSet(&.{
        //     .i, .a, .f, .m, .c, 
        //     .zicsr, .zifencei, .zmmul, .zaamo, .zalrsc,
        // }),
    };

    // ===================================== Supported Targets.
    const supported_targets: []const std.Target.Query = supported:{
        if (xtensa_target) |xtensa| {
            const support: []const std.Target.Query = &.{
                xtensa,
                riscv_target,
            };
            break :supported support;
        }
        const support: []const std.Target.Query = &.{ riscv_target, };
        break :supported support; 
    };

    const target = b.standardTargetOptions(.{ 
        .default_target = riscv_target,
        .whitelist = supported_targets,
    });


    if (b.getInstallStep().state == .success){
        std.debug.print("target features: {any}\n", .{target.result.cpu.features});
    }
    // =====================================

    // Ensure that Zig can find the necessary ESP-IDF header files.
    const home_directory = std.process.getEnvVarOwned(b.allocator, "HOME") catch "";
    const esp_idf_path = std.process.getEnvVarOwned(b.allocator, "IDF_PATH") catch "";
    _ = home_directory; 
    _ = esp_idf_path; 

    b.verbose = true; 
    // b.verbose_link = true;

    var build_config: BuildConfig = conf:{
        if (b.args) |args| {
            break :conf try BuildConfig.parseBuildArgs(args);
        }else {
            break :conf BuildConfig{}; 
        }
    };
    
    const default_profile = build_config.profile orelse b.standardOptimizeOption(.{});
    const optimization_profile = b.option(std.builtin.OptimizeMode, "profile", "") orelse default_profile;

    std.log.debug("Profile After parseBuildArgs: {?}\n", .{build_config.profile});


    // zig build run -- --example <str> --target <str>
    // This allows the user to pass arguments to the application in the build
    // command itself, like this: `zig build run -- arg1 arg2 etc`.

    try target_setup(b, supported_targets, &build_config);
    
    // const core_mod = b.createModule(.{
    const core_mod = b.addModule("core", .{
        // .root_source_file = .{.cwd_relative = "src/root.zig"},
        .root_source_file = b.path("src/root.zig"),
        .link_libc = false,
        .target = build_config.target,
        .optimize = optimization_profile,
    });

    // const cfg_file = std.fs.cwd().readFileAlloc(b.allocator, "config/model_runtime_config.json", 10*1024) catch |err| {
    //     std.process.fatal("Failed reading '{s}': {s}", .{ "config/model_runtime_config.json", @errorName(err) });
    // };
    //
    // var parsed_config = try std.json.parseFromSlice(ModelRuntimeConfig, b.allocator, cfg_file, .{.allocate = .alloc_always});
    // defer b.allocator.free(cfg_file);
    // defer parsed_config.deinit();
    //
    // const model_config = b.addOptions();
    // model_config.addOption(ModelRuntimeConfig, "runtime_config", parsed_config);
    
    const gpio_mod = b.createModule(.{
        .root_source_file = b.path("src/gpio.zig"),
    });

    const nn_mod = b.createModule(.{
        .target = target,
        .optimize = optimization_profile,
        .root_source_file = b.path("src/model/model.zig"),
    });
    

    const nn_lib = b.addLibrary(.{
        .linkage = .static,
        .name = "model",
        .root_module = nn_mod,
    });



    // nn_lib.root_module.addObjectFile
    // nn_lib.root_module.addEmbedPath(lazy_path:

    const imports = [_]std.Build.Module.Import{
        .{.name = "startup", .module = b.createModule(.{
            .root_source_file = b.path("src/startup.zig"),
            .target = build_config.target,
            .optimize = build_config.profile, 
        })},
        .{.name = "interrupts", .module = b.createModule(.{
            .root_source_file = b.path("src/interrupts.zig"),
            .target = build_config.target,
            .optimize = build_config.profile, 
        })},
        .{.name = "logging", .module = b.createModule(.{
            .root_source_file = b.path("src/logging.zig"),
            .target = build_config.target,
            .optimize = build_config.profile, 
        })},
        .{.name = "gpio", .module = gpio_mod},
        .{.name = "model", .module = nn_lib.root_module},
    };
    _ = imports; 

    const example_name = build_config.example_name orelse "edge_ai";

    const firmware_mod = b.addModule(b.fmt("{s}.{s}", .{example_name, "elf"}), .{
        .target = build_config.target,
        .optimize = optimization_profile,
        .root_source_file = b.path(b.fmt("examples/{s}.zig", .{example_name})),
        // .imports = &.{
        //     .{.name = "core", .module = core_mod},
        // }
    });

    // firmware_mod.addImport("core", core_mod);

    const firmware = b.addExecutable(.{
        .name = b.fmt("{s}.{s}", .{example_name, "elf"}),
        .root_module = firmware_mod,
    });
    
    firmware.root_module.addImport("core", core_mod); // This is working!
    firmware.setLinkerScript(b.path("config/linker.ld"));
    // firmware.setVerboseLink(true); // Remove this for not getting these nasty error messages. 
    
    // firmware.root_module.error_tracing = true; 
    firmware.entry = .{.symbol_name = "_start"};
    // firmware.link_gc_sections = true;
    // firmware.lto = .none;
    firmware.link_gc_sections = false;   // keep unreferenced sections
    firmware.link_data_sections = true;
    firmware.link_function_sections = true;
    firmware.linker_allow_shlib_undefined = false;

    // firmware.root_module.addAnonymousImport("assets/model", .{
    //     .root_source_file = b.path("src/assets/model.bin"),
    // });

    b.installArtifact(firmware); // Installs the .elf file [WORKING CODE LINE]

    // Finally we add the "check" step which will be detected
    // by ZLS and automatically enable Build-On-Save.
    // If you copy this into your `build.zig`, make sure to rename 'foo'
    const exe_check = b.addExecutable(.{
        .name = b.fmt("{s}-check", .{example_name}),
        // .name = b.fmt("{s}.{s}", .{example_name, "elf"}),
        // .root_module = firmware.root_module,
        .root_module = firmware_mod,
    });

    // exe_check.root_module.addImport("core", core_mod); // This is working!

    const desc = b.fmt("Check if '{s}' compiles", .{example_name});
    const check = b.step("check", desc);
    
    check.dependOn(&exe_check.step);   // WORKING CODE LINE 

    if (build_config.requireToolchainSetup()){
        try app_setup(b, &build_config, &.{
            std.Build.Module.Import{.name = "gpio", .module = gpio_mod},
            std.Build.Module.Import{.name = "model", .module = nn_lib.root_module},
        });
    }

    if (build_config.isBaremetal()) {
        var iter = firmware.root_module.import_table.iterator();
        while (iter.next()) |import| {
            std.log.debug("firmare.executable.root_module import: {s}\n", .{import.key_ptr.*});
        }
        
    }
    
    const FirmwareInfo = struct {
        step: std.Build.Step,
        firmware_ref: *std.Build.Step.Compile,
        build_settings: BuildConfig,
    };

    const info_step = b.allocator.create(FirmwareInfo) catch @panic("OOM");
    info_step.* = .{
       .step = .init(.{
            .owner = b,
            .name = "Show Baremetal Target Info",
            .id = std.Build.Step.Id.custom,
            .makeFn = struct {
                fn make(step: *std.Build.Step, _: std.Build.Step.MakeOptions) !void {
                    const parent: *FirmwareInfo = @fieldParentPtr("step", step);

                    const build_settings = parent.build_settings;  
                    const target_kind = build_settings.target orelse step.owner.standardTargetOptions(.{});
                    const target_result = target_kind.result; 
                    const target_features = target_result.cpu.model.features.asBytes().*;

                    const target_info = step.owner.fmt("Target Info:\n\t\tABI: {s}\n\t\tObject kind: {s}\n\t\tCPU Arch: {s}\n\t\tFeatures: {s}", .{
                        @tagName(target_result.abi),
                        @tagName(target_result.ofmt),
                        @tagName(target_result.cpu.arch),
                        target_features,  
                    });

                    const profile = build_settings.profile orelse step.owner.standardOptimizeOption(.{});
                    std.log.debug("Profile in makeFn: {?}\n", .{build_settings.profile});
                    std.log.debug("Compiled Firmware Info:\n\tName: {s}\n\tTarget: {s}\n\tOptimization Profile: {s}\n", .{
                        parent.firmware_ref.name, 
                        target_info,
                        @tagName(profile),
                    });


                }
            }.make,
        }),
        .firmware_ref = firmware,
        .build_settings = build_config,
    };
    info_step.step.dependOn(&firmware.step);
    // info_step.step.dependOn(b.getInstallStep());
    b.getInstallStep().dependOn(&info_step.step);

    const input_file = b.fmt("zig-out/bin/{s}", .{firmware.name});
    const bin_file = b.fmt("zig-out/bin/{s}.{s}", .{example_name, "bin"});

    const runnable_mod = b.addModule("RunnableCommands", .{
        .root_source_file = b.path("scripts/run_commands.zig"),
        .target = b.graph.host,
        .optimize = .Debug,
    });

    const runnable_cmd = b.addExecutable(.{
        .name = "RunnableCommands",
        .root_module = runnable_mod,
    });

    const bin_obj = b.addRunArtifact(runnable_cmd);
    bin_obj.addArgs(&.{
        "--command", "riscv32-elf-objcopy",
        "--input_file", input_file,
        "--output_file", b.fmt("zig-out/bin/{s}.{s}", .{example_name, "bin"})
    });

    bin_obj.step.dependOn(&firmware.step);
    b.getInstallStep().dependOn(&bin_obj.step);

    const fetch_images = b.addSystemCommand(&[_][]const u8{
        "./scripts/images.sh",
        "--example",
        example_name,
    });

    fetch_images.step.dependOn(&bin_obj.step);
    b.getInstallStep().dependOn(&fetch_images.step);
    

    const grep_filter = try std.fmt.allocPrint(
        b.allocator,
        "\"{s}\"", .{"Name|.text|.rodata|.srodata.cst4|.mtvt|.data|.bss|.heap|.stack"},
    );


    const binary_size_run = b.addRunArtifact(runnable_cmd);
    binary_size_run.addArgs(&.{
        "--command", "cmd_str",
        "--cmd", "riscv32-elf-size", 
        "--options", "-Ax",
        "--input_file", bin_file,
    });
    binary_size_run.step.dependOn(&bin_obj.step);
    b.getInstallStep().dependOn(&binary_size_run.step);

    const readelf_run_artifact = b.addRunArtifact(runnable_cmd);
    readelf_run_artifact.addArgs(&.{
        "--command", "cmd_str",
        "--cmd", "llvm-readelf", 
        "--options", "-S",
        "--input_file", input_file,
        "--filter", "| grep -E", grep_filter,
    });

    // readelf_run_artifact.step.dependOn(&bin_obj.step);
    // b.getInstallStep().dependOn(&readelf_run_artifact.step);

    readelf_run_artifact.step.dependOn(b.getInstallStep());
    const show_readelf = b.step("readelf", "Execute: llvm-readelf");
    show_readelf.dependOn(&readelf_run_artifact.step);
    
    const run_flash_cmd = b.addSystemCommand(&[_][]const u8{
        "./scripts/flash_target.sh",
        "--example",
        example_name,
    });

    run_flash_cmd.step.dependOn(b.getInstallStep());
    const run_flash = b.step("flash", "Flashing Target: <example_name>");
    run_flash.dependOn(&run_flash_cmd.step);

    const run_debugging_cmd = b.addSystemCommand(&[_][]const u8{
        "riscv32-elf-gdb", 
        "-q -x openocd.gdb",
    });

    run_debugging_cmd.step.dependOn(b.getInstallStep());
    const run_debugger = b.step("debug", "Debugging the Flashed program using riscv32-elf-gdb");
    run_debugger.dependOn(&run_debugging_cmd.step);

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

fn target_setup(b: *std.Build, targets: []const std.Target.Query, build_settings: *BuildConfig) !void {
    for (targets) |query_target| {
        const target = b.resolveTargetQuery(query_target);
        build_settings.target = target;
        // build_settings.profile = build_settings.profile orelse b.standardOptimizeOption(.{}); 

        if (build_settings.requireToolchainSetup()){
            if(build_settings.toolchain == null){
                build_settings.toolchain = try Toolchain.new(b, build_settings);
            }  
            // ################################ Target Specific Setup
            switch (target.result.cpu.arch) {
                inline else => |arch| {
                    if (arch.isRISCV()){
                        try riscv_setup(b, null, build_settings);
                    }
                    if (arch == .xtensa){
                        try esp32s3_setup(b, null, build_settings);
                    } 
                }
            }
        }
    
    }
}

fn addIncludeRequirments(b: *std.Build, firmware: ?*std.Build.Step.Compile, toolchain: ?*Toolchain, modules: []const std.Build.Module.Import) !void {
    const toolchain_ptr = toolchain orelse return error.ToolChainIsNotInitializedFoundNull;
    const config_file_ptr = toolchain_ptr.config_file orelse return error.ToolChainConfigFileIsNull;
    const firmware_ptr = firmware orelse return error.FirmwareInstanceWasNull; 
    _ = modules;
    
    const ToolchainInstallStep = struct {
        step: std.Build.Step,
        // config_file: *const std.Build.Step.InstallFile,
        firmware_ref: *std.Build.Step.Compile,
        toolchain_ref: *Toolchain,
    };

    const config_step = b.allocator.create(ToolchainInstallStep) catch @panic("OOM");
    config_step.* = .{
       .step = .init(.{
            .owner = b,
            .name = "Loading-Json-Config",
            .id = std.Build.Step.Id.custom,
            .makeFn = struct {
                fn make(step: *std.Build.Step, _: std.Build.Step.MakeOptions) !void {
                    const parent: *ToolchainInstallStep = @fieldParentPtr("step", step);
                    // TODO: - replace "config_file" in ToolchainInstallStep and use parent.toolchain_ref.config_file instead
                    const config_file = parent.toolchain_ref.config_file orelse return error.ToolChainConfigFileIsNull; 
                    
                    // const install_path = step.owner.getInstallPath(parent.config_file.dir, parent.config_file.dest_rel_path);
                    const install_path = step.owner.getInstallPath(config_file.dir, config_file.dest_rel_path);
                    const input_file = std.fs.cwd().readFileAlloc(step.owner.allocator, install_path, 10*1024) catch |err| {
                        std.process.fatal("Failed reading '{s}': {s}", .{ install_path, @errorName(err) });
                    };
                
                    var parsed_config = try std.json.parseFromSlice(Toolchain.JsonConfig, step.owner.allocator, input_file, .{.allocate = .alloc_always});
                    defer step.owner.allocator.free(input_file);
                    defer parsed_config.deinit();

                    
                    const sys_path = step.owner.fmt("{s}/sys", .{parsed_config.value.SYSROOT_PATH});
                    parent.toolchain_ref.code_wrapper.addIncludePath(.{ .cwd_relative =  parsed_config.value.SYSROOT_PATH});
                    parent.toolchain_ref.code_wrapper.addSystemIncludePath(.{ .cwd_relative =  sys_path});
                    // parent.toolchain_ref.code_wrapper.addIncludePath(step.owner.path("build/config"));
                    parent.toolchain_ref.code_wrapper.addIncludePath(.{ .cwd_relative = "build/config/sdkconfig.h" });
                    parent.toolchain_ref.code_wrapper.addIncludePath(.{ .cwd_relative = "." });

                    parent.firmware_ref.root_module.addIncludePath(.{ .cwd_relative =  parsed_config.value.SYSROOT_PATH});
                    parent.firmware_ref.root_module.addSystemIncludePath(.{ .cwd_relative =  sys_path});
                    parent.firmware_ref.root_module.addIncludePath(step.owner.path("build/config"));
                    const header_install_path = step.owner.getInstallPath(.prefix, "include/");
                    // parent.firmware_ref.addIncludePath(step.owner.path(header_install_path));
                    parent.firmware_ref.addIncludePath(.{ .cwd_relative = header_install_path });
                    parent.firmware_ref.addSystemIncludePath(.{ .cwd_relative = header_install_path });

                    parent.firmware_ref.root_module.addIncludePath(step.owner.path("."));
                    parent.firmware_ref.root_module.addIncludePath(.{.cwd_relative = "include"});


                    for (parsed_config.value.COMPONENT_REQS_INCLUDE) |required_comp| {
                        // std.log.debug("Adding the Component '{s}' to the IncludePath [ToolChain & Firmware]:\n", .{required_comp.name});
                        
                        for (required_comp.include_dirs) |sub_dir| {
                            const include_path = step.owner.fmt("{s}/{s}", .{required_comp.dir, sub_dir});
                            // std.log.info("Added the sub-directory include path: {s}\n", .{include_path});
                            parent.toolchain_ref.code_wrapper.addIncludePath(.{ .cwd_relative =  include_path});
                            parent.firmware_ref.root_module.addIncludePath(.{ .cwd_relative =  include_path});
                            parent.firmware_ref.addIncludePath(.{ .cwd_relative =  include_path});

                            // parent.firmware_ref.installHeadersDirectory
                            // parent.firmware_ref.installHeader(.{.cwd_relative = include_path}, required_comp.name);
                            try searched_idf_include(step.owner, parent.firmware_ref, include_path, required_comp.name);
                        }
                        
                    }
                    try searched_idf_libs(step.owner, parent.firmware_ref);
                    parent.toolchain_ref.sysroot_path = try step.owner.allocator.dupe(u8, parsed_config.value.SYSROOT_PATH);


                    // const installed_headers = try parent.firmware_ref.installed_headers.clone();
                    const headers = try std.ArrayList(std.Build.Step.Compile.HeaderInstallation)
                        .initCapacity(step.owner.allocator, parent.firmware_ref.installed_headers.items.len);

                    try parent.toolchain_ref.generateBindingModule(
                        step.owner, 
                        parent.toolchain_ref.code_wrapper, 
                        headers
                    );
                    
                    // for(installed_headers.items) |header|{
                    //     // parent.firmware_ref.addHeaderInstallationToIncludeTree(header);
                    //     // parent.firmware_ref.installHeader(header.getSource(), dest_rel_path: []const u8)
                    //     std.log.info("Firmware Installed header item: {s}\n", .{header.getSource().cwd_relative});
                    // }

                }
            }.make,
        }),
        // .config_file = config_file,
        .firmware_ref = firmware_ptr,
        .toolchain_ref = toolchain_ptr,
    };
    
    // config_step.step.dependOn(&config_file.step);
    config_step.step.dependOn(&config_file_ptr.step);
    b.getInstallStep().dependOn(&config_step.step);
}


/// The app setup, should take in the parsed `BuildConfig` and the `Firmware`
/// representing the target to build as *Compile.
pub fn app_setup(b: *std.Build, build_settings: *BuildConfig, modules: []const std.Build.Module.Import) !void {
    var toolchain = build_settings.toolchain orelse return error.FailedObtainingToolChainStruct;
    const firmware = try Firmware.new(b, build_settings, modules);

    if (toolchain.code_wrapper.include_dirs.items.len == 0) {
        // std.log.err("Target Board: {?s}\n", .{toolchain.board_target});
        // std.log.err("ToolChain (CTranslate) bindings, error.{s}\n", .{@errorName(error.ToolChainMissingNeccessaryIncludes)});
    }else {
        std.debug.print("ToolChain Dependencies:\n", .{});
        for (toolchain.code_wrapper.include_dirs.items) |dirs| {
            const include_path = dirs.path.cwd_relative;
            std.debug.print("Include dir: {s}\n", .{include_path});
        }
    }

    const target = build_settings.target orelse return error.TargetIsNotDefined;
    switch (target.result.cpu.arch) {
        inline else => |arch| {
            std.debug.print("Target ({s}) Features: {any}\n", .{
                @tagName(arch), 
                target.result.cpu.features
            });
        }
    }
    
    try addIncludeRequirments(b, firmware.executable, &toolchain, modules);
    b.installArtifact(firmware.executable);

    const post_setup_mod = b.addModule("BuildingFlashingIdfComponents", .{ 
        .root_source_file = b.path("scripts/run_commands.zig"),
        .target = b.graph.host, 
        .optimize = .Debug, 
    });
    
    const post_setup_commands = b.addExecutable(.{
        .name = "BuildingFlashingIdfComponents",
        .root_module = post_setup_mod,
    });

    const post_build_run = b.addRunArtifact(post_setup_commands);
    post_build_run.addArgs(&.{"--command", "build"});

    b.getInstallStep().dependOn(&post_build_run.step);
 
    const exe_check = b.addExecutable(.{
        .name = build_settings.target_name orelse "firmware_mod",
        .root_module = firmware.executable.root_module,
    });

    // Finally we add the "check" step which will be detected
    // by ZLS and automatically enable Build-On-Save.
    // If you copy this into your `build.zig`, make sure to rename 'foo'
    const check = b.step("check", "Check if firmware compiles");
    check.dependOn(&exe_check.step);   

    // if (b.args) |args| {
    //     post_run_cmd.addArgs(args); // e.g., --target or --example 
    // }

    // ######################## Flash Run step 
    const flash_cmd = b.addSystemCommand(&.{"source ./scripts/flash_target.sh"}); 
    flash_cmd.step.dependOn(b.getInstallStep());
    const flash_step = b.step("flash", "Flashing the provided <target board>");
    flash_step.dependOn(&flash_cmd.step);
            
    // Add step for diff files: 

    // Add test runner step: 

     
}
fn riscv_setup(b: *std.Build, imports: ?[]const std.Build.Module.Import, build_settings: *BuildConfig) !void {
    // var toolchain = build_settings.toolchain orelse return error.FailedObtainingToolChainStruct; 
    var toolchain = build_settings.toolchain orelse
        std.debug.panic("Failed With Error: {s}", .{@errorName(error.FailedObtainingToolChainStruct)});

    const sysroot_path = toolchain.sysroot_path; 
    _ = sysroot_path; 
    // -------------------------------- Target Specific Setup
    toolchain.code_wrapper.defineCMacro("LOG_LOCAL_LEVEL", "ESP_LOG_VERBOSE");
    // toolchain.code_wrapper.addIncludePath(.{});
    // -------------------------------- Target Specific Setup

    // -------------------------------- Obtain TranslateC zig bindings
    // const installed_bindings = b.addInstallFile(toolchain.code_wrapper.getOutput(), "main/src/bindings.zig");

    // b.getInstallStep().dependOn(&installed_bindings.step);
    // -------------------------------- Obtain TranslateC zig bindings
    // const headers = target_lib.installed_headers.items;
    _ = imports; 
    _ = b; 

}

fn esp32s3_setup(b: *std.Build, imports: ?[]const std.Build.Module.Import, build_settings: *BuildConfig) !void {
    var toolchain = build_settings.toolchain orelse
        std.debug.panic("Failed With Error: {s}", .{@errorName(error.FailedObtainingToolChainStruct)});

    _ = b; 
    _ = imports; 

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
        const esp_comp = std.fmt.allocPrint(b.allocator, "{s}/{s}/include/", .{ esp_components, comp_name }) catch @panic("Out of Memory");

        if (comp.kind != .directory) {
            continue;
        }
        lib.addIncludePath(.{ .cwd_relative = esp_comp });
    } else |err| {
        std.debug.print("Got error: {s}", .{@errorName(err)});
        return;
    }
    comp_dir.close();
}

// pub fn searched_idf_include(b: *std.Build, lib: *std.Build.Step.TranslateC, comp_path: []const u8) !void {
pub fn searched_idf_include(b: *std.Build, lib: *std.Build.Step.Compile, comp_path: []const u8, comp_name: []const u8) !void {
    // var includes = std.ArrayList([]const u8).init(b.allocator);
    // const comp = b.pathJoin(&.{ idf_path, "components" });
    var dir = try std.fs.cwd().openDir(comp_path, .{
        .iterate = true,
    });
    defer dir.close();
    var walker = try dir.walk(b.allocator);
    defer walker.deinit();

    // const exclude = [_][]const u8{
    //     "esp32c1",
    //     "esp32c2",
    //     "esp32c3",
    //     "esp32c4",
    //     "esp32c5",
    //     "esp32c6",
    //     "esp32h1",
    //     "esp32h2",
    //     "esp32h3",
    //     "esp32h4",
    //     "esp32p4",
    //     "esp32s1",
    //     "esp32s2",
    //     "esp32s3",
    //     "esp32",
    // };


    while (try walker.next()) |entry| {
        // const target_dir = b.pathJoin(&.{ comp_path, b.dupe(entry.path) });
        const extension = std.fs.path.extension(entry.basename);
        if (entry.kind == .directory and std.mem.endsWith(u8, entry.path, "/include")) {
            const include_directory = b.pathJoin(&.{ comp_path, b.dupe(entry.path) });
            std.debug.print("Adding include path: {s}\n", .{include_directory});
            // lib.addSystemIncludePath(.{ .cwd_relative = include_directory });
            // lib.addIncludePath(.{ .cwd_relative = include_directory });
        } else if(entry.kind == .file and std.mem.eql(u8, extension, ".h")){
            const include_directory = b.pathJoin(&.{ comp_path, b.dupe(entry.path) });
            const basename_start_index = std.mem.indexOf(u8, include_directory, entry.basename) orelse 0;
            // std.debug.print("Found Path To Header: {s}\n", .{include_directory});
            // std.debug.print("Found Header Dir Path: {s}\n", .{include_directory[0..basename_start_index]});

            lib.addIncludePath(.{.cwd_relative = include_directory[0..basename_start_index]});
            lib.root_module.addIncludePath(.{.cwd_relative = include_directory[0..basename_start_index]});
            const install_dest = b.fmt("{s}/{s}", .{comp_name, entry.basename});
            // lib.installHeader(.{.cwd_relative = include_directory}, entry.basename);
            // lib.installHeader(.{.cwd_relative = include_directory}, install_dest);
            lib.installHeadersDirectory(.{ .cwd_relative = include_directory }, install_dest, .{});
        }else {
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
            if (std.mem.eql(u8, ext, e)) break true;
        } else false;

        if (lib_ext) {
            const src_path = std.fs.path.dirname(@src().file) orelse b.pathResolve(&.{".."});
            const cwd_path = b.pathJoin(&.{ src_path, "build", b.dupe(entry.path) });
            // std.log.debug("(searched_idf_libs): cwd_path: {s}\n", .{cwd_path});
            const lib_file: std.Build.LazyPath = .{ .cwd_relative = cwd_path };
            lib.addObjectFile(lib_file);
        }
    }
}
