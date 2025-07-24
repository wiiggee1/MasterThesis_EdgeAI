const std = @import("std");
const buliltin = @import("builtin");

/// Should track what settings have been applied by the user, 
/// and what has been run based on the `std.Build.Step.State`.
/// The default `BuildConfig` is set to null and false. 
pub const BuildConfig = struct {
    example_name: ?[]const u8 = null, 
    /// Same as the --target <value>
    target_name: ?[]const u8 = null,
    target: ?std.Build.ResolvedTarget = null, 
    profile: ?std.builtin.OptimizeMode = null,
    compile_kind: ?std.Build.Step.Compile.Kind = null, 
    toolchain: ?Toolchain = null, 


    pub fn parseArgs(build_args: anytype) !BuildConfig{
        var self = BuildConfig{};
        std.debug.assert(@TypeOf(build_args) == []const []const u8);
        const args = @as([]const []const u8, build_args);

        var i: usize = 0; 
        while(i < args.len - 1) : (i += 1) {
            const arg = args[i];
            std.debug.print("({d}) arg: {s}, arg value: {s}\n", .{i, arg, args[i+1]}); 

            if (std.mem.eql(u8, arg, "--example")){
                const src_name = args[i+1];
                // Check if executable file exist in the "examples" directory.
                var dir = try std.fs.cwd().openDir("main/examples/", .{.iterate = true});
                var iter = dir.iterate();
                while (try iter.next()) |entry| {
                    if (entry.kind != .file) continue; 
                    if (std.mem.startsWith(u8, entry.name, src_name)) self.example_name = src_name; 

                }
                i += 1; 
            }else if (std.mem.eql(u8, arg, "--target")){
                const target_type = args[i+1];
                self.target_name = target_type; 
                i += 1; 
            }
            
            if (i+1 > args.len) break; 
        }

        return self; 

    }
    pub fn print(self: *const BuildConfig) !void {
        const buildconfig_format = 
            \\BuildConfig[
            \\          example_name: {s},
            \\          target_name: {s},
            \\          target: {s},
            \\          profile: {s},
            \\          compile_kind: {s},
            \\
        ;

        const target_name = self.target_name orelse "null";
        const example_name = self.example_name orelse "null";
        const target = if(self.target != null) @tagName(self.target.?.result.cpu.arch) else "null";
        const profile = if(self.profile) |profile| @tagName(profile) else "null";
        const compile_kind = if(self.compile_kind != null) @tagName(self.compile_kind.?) else "null";

        if(self.toolchain) |toolchain| {
            const toolchain_format = 
                \\          ToolChain[
                \\              include_path: {s},
                \\              sysroot_path: {s},
                \\              board_target: {s},
                \\              code_wrapper.step.state: {s},
                \\      ],
                \\];
            ;
            const include_path: []const u8 = toolchain.include_path orelse  "''";
            const sysroot_path: []const u8 = toolchain.sysroot_path orelse "''";
            const board_target = toolchain.board_target orelse "null";
            const code_wrapper: []const u8 = @tagName(toolchain.code_wrapper.step.state);
            
            const config_fmt = comptime buildconfig_format++toolchain_format;
            std.debug.print(config_fmt, .{
                example_name,
                target_name,
                target,
                profile,
                compile_kind,
                // ToolChain fmt:
                include_path,
                sysroot_path,
                board_target,
                code_wrapper,
            });


        }else {
            const toolchain_null =
            \\              ToolChain: null,
            \\];
            ;

            const format: []const u8 = buildconfig_format++toolchain_null;
            std.debug.print(format, .{
                example_name,
                target_name,
                target,
                profile,
                compile_kind,
                
            }); 
        }

    }
};

/// Creates a new executable kind. Invoking the `installArtifact` command 
/// would generate the `zig-out` directory when running `zig build`. It 
/// generates: 
/// ├── .zig-cache
/// └── zig-out
///    └── bin → <std.Build.Step.Compile.Kind>
///        └── <exe_name>
///    └── lib → <Static Library>
///        └── <lib_components_name>.a
/// --------------------------------------------
pub const Firmware = struct {
    /// The target to build (compile)
    executable: *std.Build.Step.Compile,
    pub const CompileKind = std.Build.Step.Compile.Kind; 
    
    /// Creates a new executable that should be compiled.
    /// The target to build can be either: 
    /// - An example zig executable containing a `main` fn entry point. 
    /// - Static library (e.g., by utilizing the ESP IDF toolchain framework). 
    // pub fn new(b: *std.Build, kind: std.Build.Step.Compile.Kind, name: []const u8, toolchain: ?Toolchain) Firmware{
    pub fn new(b: *std.Build, build_settings: *BuildConfig, modules: []const std.Build.Module.Import) !Firmware{
        const name = build_settings.target_name orelse "firmware_mod";
        try build_settings.print();
        
        // This module should act as the root module of the 
        // firmware executable. 
        const firmware_module: *std.Build.Module = root_mod: {
            const src_path = if(build_settings.example_name) |src_file| 
                b.path(b.fmt("main/examples/{s}", .{src_file}))
            else b.path("main/src/main.zig");
            
            break :root_mod b.addModule(name, .{
                .target = build_settings.target,
                .optimize = build_settings.profile,
                .root_source_file = src_path,
                .link_libc = true,
            });
        };

        const firmware_name = lib_name:{
            if (build_settings.example_name == null){
                const mod_target = firmware_module.resolved_target 
                    orelse b.standardTargetOptions(.{}); 

                const example_name = b.option([]const u8, "example", "Name of target to Build")
                    orelse switch(mod_target.result.cpu.arch) {
                            .riscv32 => "firmware_esp32p4_app",
                            .xtensa => "firmware_esp32s3_app",
                            else => "",
                };
                if (std.mem.eql(u8, example_name, "")) return error.NotAValidTargetKindFound;
                break :lib_name example_name;
            }else {
                break :lib_name build_settings.example_name.?;
            }
        };

        // Create a static library - main component
        const firmware_target = b.addLibrary(.{
            .linkage = .static,
            .name = firmware_name, 
            .root_module = firmware_module,
        }); 
        firmware_target.linkLibC(); 

        switch (firmware_target.rootModuleTarget().cpu.arch) {
            inline else => |arch| {
                if (arch.isRISCV()){
                    try riscv_setup(b, null, build_settings);
                }
                if (arch == .xtensa){
                    try esp32s3_setup(b, null, build_settings);
                } 
            }
        }
        
        // firmware_target.addIncludePath(b.path("src"));
        // install the header
        // firmware_target.installHeader(b.path("src/em-lib/em-lib.h"), "em-lib/emlib.h");

        // const include_directory = b.pathJoin(&.{ comp, b.dupe(entry.path) });
        // lib.addIncludePath(.{ .cwd_relative = include_directory });
        
        // firmware_target.addLibraryPath(b.path("main/model/"));
        // firmware_target.addIncludePath(b.path("include/"));
        // firmware_target.root_module.addIncludePath(b.path("build/config/"));
        // firmware_target.root_module.addIncludePath(b.path("."));
        

        for (modules) |module| {
            firmware_target.root_module.addImport(module.name, module.module);
        }

        //TODO: 
        // for(includes) |include_path| {}
        //const include_path = dependency.include_dir orelse continue;
        // firmware_target.root_module.addIncludePath(b.path(include_path));
        // firmware_target.addLibraryPath(b.path(""));
        // firmware_target.root_module.linkLibrary(library: *Step.Compile)



        //NOTE: move to app_setup??????????

        return Firmware{
           .executable = firmware_target,  
        };

    }

    fn addIncludeRequirments(b: *std.Build, firmware: ?*std.Build.Step.Compile, toolchain: ?*Toolchain) !void {
        const toolchain_ptr = toolchain orelse return error.ToolChainIsNotInitializedFoundNull;
        const config_file = toolchain_ptr.config_file orelse return error.ToolChainConfigFileIsNull;
        const firmware_ptr = firmware orelse return error.FirmwareInstanceWasNull; 
        
        const ToolchainInstallStep = struct {
            step: std.Build.Step,
            config_file: *const std.Build.Step.InstallFile,
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
                        const install_path = step.owner.getInstallPath(parent.config_file.dir, parent.config_file.dest_rel_path);
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
                        parent.firmware_ref.root_module.addIncludePath(step.owner.path("."));
                        // ../build/config

                        for (parsed_config.value.COMPONENT_REQS_INCLUDE) |required_comp| {
                            std.log.debug("Adding the Component '{s}' to the IncludePath [ToolChain & Firmware]:\n", .{required_comp.name});
                            
                            for (required_comp.include_dirs) |sub_dir| {
                                const include_path = step.owner.fmt("{s}/{s}", .{required_comp.dir, sub_dir});
                                std.log.info("Added the sub-directory include path: {s}\n", .{include_path});
                                parent.toolchain_ref.code_wrapper.addIncludePath(.{ .cwd_relative =  include_path});
                                parent.firmware_ref.addIncludePath(.{ .cwd_relative =  include_path});
                            }
                            
                        }
                        try searched_idf_libs(step.owner, parent.firmware_ref);

                    }
                }.make,
            }),
            .config_file = config_file,
            .firmware_ref = firmware_ptr,
            .toolchain_ref = toolchain_ptr,
        };
        
        // config_step.step.dependOn(b.getInstallStep());
        config_step.step.dependOn(&config_file.step);
        b.getInstallStep().dependOn(&config_step.step);
        
        
        // Step dependency order: 
        
        // b.getInstallStep().dependOn(&config_file.step);
        // toolchain_ptr.code_wrapper.step.dependOn(&config_file.step);
        // firmware_ptr.step.dependOn(&config_file.step);
        //
        // const install_path = b.getInstallPath(config_file.dir, config_file.dest_rel_path);
        //
        // const input_file = std.fs.cwd().readFileAlloc(b.allocator, install_path, 7*1024) catch |err| {
        //     std.process.fatal("Failed reading '{s}': {s}", .{ install_path, @errorName(err) });
        // };
        //
        // var parsed_config = try std.json.parseFromSlice(Toolchain.JsonConfig, b.allocator, input_file, .{.allocate = .alloc_always});
        // defer b.allocator.free(input_file);
        // defer parsed_config.deinit();
        //
        // const sys_path = b.fmt("{s}/sys", .{parsed_config.value.SYSROOT_PATH});
        // toolchain_ptr.code_wrapper.addIncludePath(.{ .cwd_relative =  parsed_config.value.SYSROOT_PATH});
        // toolchain_ptr.code_wrapper.addSystemIncludePath(.{ .cwd_relative =  sys_path});
        // toolchain_ptr.code_wrapper.addIncludePath(.{ .cwd_relative = "build/config" });
        // toolchain_ptr.code_wrapper.addIncludePath(.{ .cwd_relative = "." });
        //
        // firmware_ptr.root_module.addIncludePath(.{ .cwd_relative =  parsed_config.value.SYSROOT_PATH});
        // firmware_ptr.root_module.addSystemIncludePath(.{ .cwd_relative =  sys_path});
        // firmware_ptr.root_module.addIncludePath(b.path("build/config"));
        // firmware_ptr.root_module.addIncludePath(b.path("."));
        //
        // for (parsed_config.value.COMMON_COMPONENT_REQS_PATH) |required_include| {
        //     std.log.debug("Adding the IncludePath to ToolChain & Firmware: {s}\n", .{required_include});
        //     toolchain_ptr.code_wrapper.addIncludePath(.{ .cwd_relative =  required_include});
        //
        //     try searched_idf_include(b, toolchain_ptr.code_wrapper, required_include);
        //
        //     firmware_ptr.addIncludePath(.{ .cwd_relative =  required_include});
        // }
        //
        // try searched_idf_libs(b, firmware_ptr);
        // toolchain_ptr.code_wrapper.addIncludePath
            
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
            .bin => b.addObjCopy(self.executable.getEmittedBin(), .{.format = .bin}),
            .elf => b.addObjCopy(self.executable.getEmittedBin(), .{.format = .elf }),
            .hex => {},
        }
    }

    /// Given: `zig build `
    pub fn objdump(self: *Firmware, b: *std.Build) void {
        _ = self; 
        const objdump_cmd = b.addSystemCommand(&.{
            "riscv32-esp-elf-objdump -D minimal_app.elf | grep -A 50 '<app_main>'",
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
    include_path: ?[]u8 = null, 
    /// Path to the board specific API header files for the 
    /// specific espressif board (e.g., esp32, esp32-s3, esp32p4).
    sysroot_path: ?[]u8 = null,
    /// File to the generated config file.
    config_file: ?*std.Build.Step.InstallFile = null,

    board_target: ?[]const u8,
   
    /// This would generate bindings declaration for the ESP-IDF library. 
    /// Defined in the `bindings.h` header file. `TranslateC` would 
    /// translate C code into Zig code. 
    code_wrapper: *std.Build.Step.TranslateC,

    pub const JsonConfig = struct { 
        TOOLCHAIN_VERSION: []const u8,  
        SYSROOT_PATH: []const u8,
        COMPONENT_DIR: [][]const u8, 
        COMMON_COMPONENT_REQS: [][]const u8,
        COMMON_COMPONENT_REQS_PATH: [][]const u8,
        COMPONENT_REQS_INCLUDE: []Component,
            
        pub const COMPONENTS = std.ArrayList(Component);
    
        pub const Component = struct {
            name: []const u8,
            dir: []const u8,
            include_dirs: [][]const u8, 
        };

    };

    pub fn deinit(self: *Toolchain, b: *std.Build) void {
        b.allocator.free(self.path);
    }

    pub fn new(b: *std.Build, build_settings: *BuildConfig) !Toolchain{
        const board_target = b.option([]const u8, "board-target", 
            "Defines the ESP board target, e.g., esp32p4 or esp32s3") 
        orelse build_settings.target_name orelse "esp32p4";

        const esp_idf = b.createModule(.{
            .root_source_file = b.path("src/bindings.zig"),
        });
        esp_idf.addIncludePath(b.path("include/")); 
        
        // ######################################## Pre-Setup Toolchain
        const toolchain_setup = b.addExecutable(.{
            .name = "ToolChain-Pre-Setup",
            .target = b.graph.host,
            .root_source_file = b.path("scripts/toolchain_setup.zig"),
        });

        const toolchain_run = b.addRunArtifact(toolchain_setup);
        toolchain_run.setName("config-setup");
        // toolchain_run.captureStdOut()

        if (b.args) |args| {
            toolchain_run.addArgs(args); // e.g., --target or --example 
        }
        b.getInstallStep().dependOn(&toolchain_run.step);
        // b.getInstallStep().dependOn(&toolchain_run.step); // REMOVE??? 

        // By providing and using `addOutputFileArg`, we can define in 
        // advance what and where a future generated file will be located. 
        toolchain_run.addArg("--output-file");
        const output = toolchain_run.addOutputFileArg("toolchain_config.json"); 
        const config_install = b.addInstallFileWithDir(output, .prefix, "toolchain_config.json");
        config_install.step.name = "config-install";

        // const config_install_path = b.getInstallPath(.prefix, config_install.dest_rel_path);
        // try b.addUserInputOption("config-file", config_install.source);
        // const gop = try b.user_input_options.getOrPut(name);

        b.getInstallStep().dependOn(&config_install.step);


        // ######################################## Pre-Setup End...

        const binding_options: std.Build.Step.TranslateC.Options = .{
            .link_libc = true, 
            .optimize = build_settings.profile orelse b.standardOptimizeOption(.{}),
            .target = build_settings.target orelse b.standardTargetOptions(.{}),
            .root_source_file = b.path("include/bindings.h"),
        };
        
        var toolchain = Toolchain{
            .include_path = std.process.getEnvVarOwned(b.allocator, "IDF_PATH") catch "",
            // .sysroot_path = std.process.getEnvVarOwned(b.allocator, "SYSROOT_PATH") catch "",
            .config_file = config_install,
            .board_target = board_target,
            .code_wrapper = b.addTranslateC(binding_options), 
        };

        // b.getInstallStep().dependOn(&toolchain.code_wrapper.step);
        toolchain.code_wrapper.step.dependOn(&toolchain_run.step);

        return toolchain; 
    }

    /// Convert C headers into Zig bindings/declarations
    pub fn getZigBindingsInstallFile(self: Toolchain) *std.Build.Step.InstallFile{
        self.code_wrapper.output_file;
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
            std.log.err("Zig version {s} has no Xtensa support need LLVM fork!\nMore details here: {s}\n", .{buliltin.zig_version_string, details}); 
            break :xtensa null;
        }
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

    const optimization_profile = b.option(std.builtin.OptimizeMode, "profile", 
        \\ Supported Optimization Profiles:
        \\                                  Debug
        \\                                  ReleaseSafe
        \\                                  ReleaseFast
        \\                                  ReleaseSmall
        \\
    ) orelse std.builtin.OptimizeMode.Debug;

    const optimize = b.standardOptimizeOption(.{});
    if (b.getInstallStep().state == .success){
        std.debug.print("target features: {any}\n", .{target.result.cpu.features});
    }
    // =====================================

    // Ensure that Zig can find the necessary ESP-IDF header files.
    const home_directory = std.process.getEnvVarOwned(b.allocator, "HOME") catch "";
    const esp_idf_path = std.process.getEnvVarOwned(b.allocator, "IDF_PATH") catch "";
    _ = home_directory; 
    _ = esp_idf_path; 

    // generate bindings for the ESP-IDF library
    // const bindings = b.addTranslateC(.{
    //     .link_libc = true,
    //     .optimize = optimize,
    //     .target = target,
    //     .root_source_file = b.path("include/bindings.h"),
    // });
    //
    // bindings.defineCMacro("__xtensa", "");
    // bindings.defineCMacro("__COUNTER__", "0");
    // bindings.defineCMacro("CONFIG_IDF_TARGET_ESP32S3", "1");
    // bindings.defineCMacro("XCHAL_NUM_AREGS", "64");
    // bindings.defineCMacro("XCHAL_HAVE_s32c1I", "1");
    // bindings.defineCMacro("LOG_LOCAL_LEVEL", "ESP_LOG_VERBOSE");

    //Here goes a static library to be linked with c / c++ app.
    const esp_idf_lib = b.addStaticLibrary(.{
        .link_libc = true,
        .name = "firmware_app",
        .root_source_file = b.path("main/src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Located at absolute path: $HOME/esp/esp-idf/components
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
    _ = esp_idf_lib; 
    _ = include_paths; 

    // if (!std.mem.eql(u8, esp_idf_path, "")) {
    //     const archtools = b.fmt("{s}-esp-elf", .{
    //         @tagName(esp_idf_lib.rootModuleTarget().cpu.arch),
    //     });
    //
    //     bindings.addIncludePath(.{ .cwd_relative = b.pathJoin(&.{
    //         home_directory,
    //         ".espressif",
    //         "tools",
    //         archtools,
    //         "esp-14.2.0_20241119",
    //         archtools,
    //         archtools,
    //         "include",
    //     }) });
    //
    //     for (include_paths) |path| {
    //         const esp_components = std.fmt.allocPrint(b.allocator, "{s}/{s}", .{ esp_idf_path, path }) catch @panic("Out of Memory");
    //         bindings.addIncludePath(.{ .cwd_relative = esp_components });
    //     }
    //
    //     // bindings.addIncludePath(b.path("build/config/sdkconfig.h"));
    //     bindings.addIncludePath(.{ .cwd_relative = "build/config/" });
    //     bindings.addIncludePath(.{ .cwd_relative = "." });
    //     try searched_idf_libs(b, esp_idf_lib);
    //     // try add_c_includes(b, esp_idf_lib);
    //     // try searched_idf_include(b, lib: *std.Build.Step.TranslateC, idf_path: []const u8)
    // }else {
    //     @panic("Missing env to .espressif toolchain!");
    // }
    // const installed_bindings = b.addInstallFile(bindings.getOutput(), "main/src/bindings.zig");
    // b.getInstallStep().dependOn(&installed_bindings.step);

    const esp_idf = b.createModule(.{
        .root_source_file = b.path("main/src/bindings.zig"),
    });

    const utils_mod = b.addModule("esp32s3_utils", .{
        .root_source_file = b.path("main/src/esp32s3_utils.zig"),
    });

    const gpio_mod = b.addModule("gpio", .{
        .root_source_file = b.path("main/src/gpio.zig"),
    });

    const nn_lib = b.addLibrary(.{
        .linkage = .static,
        .name = "nn_model",
        .root_module = b.createModule(.{
            .target = target,
            .optimize = optimize,
            .root_source_file = b.path("main/model/root.zig"),
            .link_libc = true,
        }),
    });

    // Driver modules, that need access to the esp idf API components.
    // Created by the generated bindings.zig (InstallFile)
    // ---------------------- 

    utils_mod.addImport("esp_idf", esp_idf);
    gpio_mod.addImport("esp_idf", esp_idf);

    // -------------------------- Imports that should be added to the Main Firmware.
    // esp_idf_lib.root_module.addImport("esp_idf_utils", utils_mod);
    // esp_idf_lib.root_module.addImport("gpio", gpio_mod);
    //
    // esp_idf_lib.root_module.linkLibrary(nn_lib);
    // esp_idf_lib.addLibraryPath(b.path("main/model/"));
    // esp_idf_lib.root_module.addImport("nn_model", nn_lib.root_module);
    // esp_idf_lib.step.dependOn(bindings.output_file.step);
    // b.installArtifact(esp_idf_lib);
    // b.installArtifact(nn_lib);

    // -------------------------- Imports that should be added to the Main Firmware.
    

        
    var build_config: BuildConfig = conf:{
        if (b.args) |args| {
            break :conf try BuildConfig.parseArgs(args);
        }else {
            break :conf BuildConfig{}; 
        }
    };

    // zig build run -- --example <str> --target <str>
    // This allows the user to pass arguments to the application in the build
    // command itself, like this: `zig build run -- arg1 arg2 etc`.

    try target_setup(b, supported_targets, optimization_profile, &build_config);
    try app_setup(b, &build_config, &.{
        std.Build.Module.Import{.name = "esp_idf_utils", .module = utils_mod},
        std.Build.Module.Import{.name = "gpio", .module = gpio_mod},
        std.Build.Module.Import{.name = "nn_model", .module = nn_lib.root_module},
    });

    
    // const exe_check = b.addExecutable(.{
    //     .name = "model",
    //     .root_module = ai_mod,
    //     .target = target,
    // });
    //
    // const check = b.step("check", "Check if AI model code compiles");
    // check.dependOn(&exe_check.step);



    // Create a run step for the example
    // const run_cmd = b.addRunArtifact(host_exe);
    // run_cmd.step.dependOn(b.getInstallStep());
    
    // Add the example to the examples step
    // example_step.dependOn(&host_exe.step);

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

fn target_setup(b: *std.Build, targets: []const std.Target.Query, optimization: std.builtin.OptimizeMode, build_settings: *BuildConfig) !void {
    // if (optimization.len != targets.len) return error.OptimizationAndTargetsDifferentLength; 
    for (targets) |query_target| {
        const target = b.resolveTargetQuery(query_target);
        build_settings.target = target;
        build_settings.profile = optimization; 
        if(build_settings.toolchain == null){
            build_settings.toolchain = try Toolchain.new(b, build_settings);
        }  
    
        // switch(esp_idf_lib.rootModuleTarget().cpu.arch) {
        //         .riscv32 => break :board "esp32p4",
        //         .xtensa => break :board "esp32s3",
        //         else => break :board "",
        // }


        // if (sysroot_components.len != 0){
        //     var iter = std.mem.tokenizeAny(u8, sysroot_components, " ");
        //     while(iter.next()) |comp_include|{
        //         build_settings.toolchain.?.code_wrapper.addIncludePath(.{ .cwd_relative = comp_include});
        //
        //     }
        // }
        // ################################ Target Specific Setup
        switch (target.result.cpu.arch) {
            inline else => |arch| {
                // std.debug.print("Target ({s}) Features: {any}\n", .{arch.genericName(), target.result.cpu.features});
                if (arch.isRISCV()){
                    try riscv_setup(b, null, build_settings);
                }
                if (arch == .xtensa){
                    try esp32s3_setup(b, null, build_settings);
                } 
            }
        }
        // ################################
    }
}

/// The app setup, should take in the parsed `BuildConfig` and the `Firmware`
/// representing the target to build as *Compile.
pub fn app_setup(b: *std.Build, build_settings: *BuildConfig, modules: []const std.Build.Module.Import) !void {
    var toolchain = build_settings.toolchain orelse return error.FailedObtainingToolChainStruct;

    const firmware = try Firmware.new(b, build_settings, modules);
    try Firmware.addIncludeRequirments(b, firmware.executable, &toolchain);
    
    if (toolchain.code_wrapper.include_dirs.items.len == 0) {
        std.log.err("Target Board: {?s}\n", .{toolchain.board_target});
        std.log.err("ToolChain (CTranslate) bindings, error.{s}\n", .{@errorName(error.ToolChainMissingNeccessaryIncludes)});
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
            std.debug.print("Target ({s}) Features: {any}\n", .{arch.genericName(), target.result.cpu.features});
        }
    }

    //WARN: - The two lines below, cause it to fail building. 
    // According to forum, you need to provide the cFlag -lc
    // for cTranslate to proper finding the include headers. 

    // const installed_bindings = b.addInstallFile(toolchain.code_wrapper.getOutput(), "main/src/bindings.zig"); 
    // b.getInstallStep().dependOn(&installed_bindings.step);
    
    b.installArtifact(firmware.executable);

    // ######################## Flash Run step 
    const flash_cmd = b.addSystemCommand(&.{"source ./scripts/flash_target.sh"}); 
    flash_cmd.step.dependOn(b.getInstallStep());
    const flash_step = b.step("flash", "Flashing the provided <target board>");
    flash_step.dependOn(&flash_cmd.step);

    // Add step for dissasembly the code: 
    // target_lib.root_module.addAssemblyFile(source: LazyPath)
            
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

pub fn searched_idf_include(b: *std.Build, lib: *std.Build.Step.TranslateC, comp_path: []const u8) !void {
    // var includes = std.ArrayList([]const u8).init(b.allocator);
    // const comp = b.pathJoin(&.{ idf_path, "components" });
    var dir = try std.fs.cwd().openDir(comp_path, .{
        .iterate = true,
    });
    defer dir.close();
    var walker = try dir.walk(b.allocator);
    defer walker.deinit();

    const exclude = [_][]const u8{
        "esp32c1",
        "esp32c2",
        "esp32c3",
        "esp32c4",
        "esp32c5",
        "esp32c6",
        "esp32h1",
        "esp32h2",
        "esp32h3",
        "esp32h4",
        "esp32p4",
        "esp32s1",
        "esp32s2",
        "esp32s3",
        "esp32",
    };


    while (try walker.next()) |entry| {
        const target_dir = b.pathJoin(&.{ comp_path, b.dupe(entry.path) });

        if (entry.kind == .directory and exclude_dir(target_dir, &exclude)) {
            // std.debug.print("Skipping: {s}\n", .{target_dir});
            continue;
        }
        if (entry.kind == .directory and std.mem.endsWith(u8, entry.path, "/include")) {
            const include_directory = b.pathJoin(&.{ comp_path, b.dupe(entry.path) });
            // if (std.mem.containsAtLeast())
            std.debug.print("Adding include path: {s}\n", .{include_directory});
            // lib.addSystemIncludePath(.{ .cwd_relative = include_directory });
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
            if (std.mem.eql(u8, ext, e)) break true;
        } else false;

        if (lib_ext) {
            const src_path = std.fs.path.dirname(@src().file) orelse b.pathResolve(&.{".."});
            const cwd_path = b.pathJoin(&.{ src_path, "build", b.dupe(entry.path) });
            std.log.debug("(searched_idf_libs): cwd_path: {s}\n", .{cwd_path});
            const lib_file: std.Build.LazyPath = .{ .cwd_relative = cwd_path };
            lib.addObjectFile(lib_file);
        }
    }
}
