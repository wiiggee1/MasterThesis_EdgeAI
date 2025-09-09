const std = @import("std");
// const Toolchain = @import("toolchain.zig").Toolchain; 

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
    firmware_type: ?FirmwareKind = null,

    pub const FirmwareKind = enum {
        exe,
        lib,
        obj, 
        @"test",
        baremetal,
        espidf,
    };

    pub fn isBaremetal(self: BuildConfig) bool {
        const firmware_kind = self.firmware_type orelse return false; 
        if (firmware_kind == .baremetal) return true else return false; 
    }

    pub fn requireToolchainSetup(self: BuildConfig) bool {
        const firmware_kind = self.firmware_type orelse return false; 
        if (firmware_kind == .espidf) return true else return false; 
    }

    fn lookupExample(self: *BuildConfig, example_name: []const u8) !void{
        // Check if executable file exist in the "examples" directory.
        var dir = try std.fs.cwd().openDir("examples/", .{.iterate = true});
        var iter = dir.iterate();
        var example_found: bool = false; 
        while (try iter.next()) |entry| {
            if (entry.kind != .file) continue; 
            if (std.mem.startsWith(u8, entry.name, example_name)) {
                example_found = true; 
                self.example_name = example_name; 
                if (std.mem.eql(u8, example_name, "espidf_app")) self.firmware_type = .espidf; 
                if (std.mem.eql(u8, example_name, "edge_ai")) self.firmware_type = .baremetal; 
            }
        }
        if (example_found == false) return error.ExampleToBuildNotFound; 
    }

    /// This represent the build flags that you can pass during building. 
    /// E.g., zig build -- --example edge_ai
    pub fn parseBuildArgs(build_args: anytype) !BuildConfig{
        var self = BuildConfig{};
        std.debug.assert(@TypeOf(build_args) == []const []const u8);
        const args = @as([]const []const u8, build_args);

        var i: usize = 0; 
        while(i < args.len - 1) : (i += 1) {
            const arg = args[i];
            std.debug.print("({d}) arg: {s}, arg value: {s}\n", .{i, arg, args[i+1]}); 

            if (std.mem.eql(u8, arg, "--example")){
                const src_name = args[i+1];
                try self.lookupExample(src_name);
                i += 1; 
            }else if (std.mem.eql(u8, arg, "--target")){
                const target_type = args[i+1];
                self.target_name = target_type; 
                i += 1; 
            }else if (std.mem.eql(u8, arg, "--profile")){
                const profile_input = args[i+1];
                const profile_kinds = @typeInfo(std.builtin.OptimizeMode).@"enum".fields;
                var profile: ?std.builtin.OptimizeMode = null;
                inline for (profile_kinds) |optimization_profile| {
                    const optimization = optimization_profile.name;
                    if (std.ascii.eqlIgnoreCase(profile_input, optimization)){
                        std.log.debug("Found the Profile: {s}\n", .{optimization});
                        profile = std.meta.stringToEnum(std.builtin.OptimizeMode, optimization_profile.name).?;
                    }
                }
                self.profile = profile;
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
    build_type: ?[]const u8 = null,
   
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

        const translate_c_bindings = b.createModule(.{
            // .root_source_file = b.path("src/bindings_new.zig"),
            .root_source_file = b.path("../espressif/main/src/bindings_new.zig"),
        });
        translate_c_bindings.addIncludePath(b.path("espressif/include")); 


        const toolchain_mod = b.addModule("toolchain_pre", .{ 
            .target = b.graph.host,
            .optimize = .Debug,
            .root_source_file = b.path("scripts/toolchain_setup.zig"),
        });
         
        // ######################################## Pre-Setup Toolchain
        const toolchain_setup = b.addExecutable(.{
            .name = "toolchain_pre",
            .root_module = toolchain_mod,
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

        b.getInstallStep().dependOn(&config_install.step);


        // ######################################## Pre-Setup End...

        const binding_options: std.Build.Step.TranslateC.Options = .{
            .link_libc = true, 
            .optimize = build_settings.profile orelse b.standardOptimizeOption(.{}),
            .target = build_settings.target orelse b.standardTargetOptions(.{}),
            // .root_source_file = b.path("include/bindings.h"),
            .root_source_file = b.path("espressif/include/bindings.h"),
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

    pub fn generateBindingModule(_: *Toolchain, b: *std.Build, translate_c_ref: *std.Build.Step.TranslateC, header_files: std.ArrayList(std.Build.Step.Compile.HeaderInstallation)) !void {
        // std.ArrayList(std.Build.Step.Compile.HeaderInstallation);
        const write_files = b.addWriteFiles();
        // const headers = write_files.add("main/src/esp_bindings.h",
        //     \\#include <raylib.h>
        // );

        // the second arg is the new-line character.
        // Need to be wrapped inside string formatter. 
        const line_format = 
            \\#include "{s}"{s}
        ;
        
        const default_includes = 
            \\#include "sdkconfig.h"
            \\#include "freertos/FreeRTOS.h"
            \\#include "freertos/task.h"
            \\#include "freertos/queue.h"
            \\#include "freertos/semphr.h"
            \\#include "esp_chip_info.h"
            \\#include "esp_flash.h"
            \\#include "esp_system.h"
            \\#include "esp_err.h"
            \\#include "esp_log.h"
            \\#include "esp_app_trace.h"
            \\#include "esp_timer.h"
            \\#include "esp_random.h"
            \\#include "esp_sleep.h"
            \\#include "esp_event.h"
            \\#include "esp_event_base.h"
            \\#include "{s}\n"
        ;
        _ = default_includes; 
        
        var header_string_list = try std.ArrayList([]const u8).initCapacity(b.allocator, header_files.items.len);
        for(header_files.items) |hfile| {
            const header_file_path = hfile.getSource().cwd_relative;
            const basename_start = std.mem.lastIndexOfScalar(u8, header_file_path, '/') orelse return error.HeaderIncludeDirCouldntGetIndexOfLast;
            const header_dir = header_file_path[0..basename_start];
            const include_name = header_file_path[basename_start+1..];
            _ = header_dir;

            try header_string_list.append(b.allocator, b.fmt(line_format, .{include_name, "\n"}));
        }

        var header_file = file:{
            std.fs.cwd().access("esp_bindings.h", .{}) catch |e| switch (e) {
                error.FileNotFound => {
                    break :file std.fs.cwd().createFile("esp_bindings.h", .{}) catch |err| {
                        return err;
                    };
                },
                else => return e,
            };
            break :file std.fs.cwd().openFile("esp_bindings.h", .{}) catch |err| {
                return err;
            };
        };
        defer header_file.close();
        for (header_string_list.items) |include_header_line| {
            try header_file.writeAll(include_header_line);
        }
        
        // std.log.info("Final esp_bindings.h :\n{s}\n", .{header_string_list.items});

        // const headers = write_files.add("main/src/esp_bindings.h",
        //     \\#include "{s}\n"
        // );
        const headers = write_files.add("../espressif/include/esp_bindings.h",
            \\#include "{s}\n"
        );
        _ = headers; 
        _ = translate_c_ref; 

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
    
    /// Creates a new executable that should be compiled.
    /// The target to build can be either: 
    /// - An example zig executable containing a `main` fn entry point. 
    /// - Static library (e.g., by utilizing the ESP IDF toolchain framework). 
    pub fn new(b: *std.Build, build_settings: *BuildConfig, modules: []const std.Build.Module.Import) !Firmware{
        const name = build_settings.target_name orelse "firmware_mod";
        try build_settings.print();
        
        if (build_settings.isBaremetal()){
            // Run baremetal setup below: 
            return try baremetalFirmwareSetup(b, build_settings, modules);
        }
        
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
        firmware_target.addIncludePath(b.path("zig-out/include/"));

        // switch (firmware_target.rootModuleTarget().cpu.arch) {
        //     inline else => |arch| {
        //         if (arch.isRISCV()){
        //             try riscv_setup(b, null, build_settings);
        //         }
        //         if (arch == .xtensa){
        //             try esp32s3_setup(b, null, build_settings);
        //         } 
        //     }
        // }

        for (modules) |module| {
            firmware_target.root_module.addImport(module.name, module.module);
        }


        return Firmware{
           .executable = firmware_target,  
        };

    }

    fn baremetalFirmwareSetup(b: *std.Build, build_settings: *BuildConfig, modules: []const std.Build.Module.Import) !Firmware{
        const example_name = build_settings.example_name orelse "firmware_baremetal";

        const embedded_mod = b.addModule(b.fmt("{s}.{s}", .{example_name, "elf"}), .{
            .target = build_settings.target,    
            .optimize = build_settings.profile orelse b.standardOptimizeOption(.{}),
            .root_source_file = b.path(b.fmt("examples/{s}.zig", .{example_name})),
        });
        
        const embedded_firmware = b.addExecutable(.{
            .name = b.fmt("{s}.{s}", .{example_name, "elf"}),
            .root_module = embedded_mod,
        });

        // Further baremetal options:
        embedded_firmware.setLinkerScript(b.path("config/linker.ld"));
        embedded_firmware.root_module.strip = false;
        embedded_firmware.setVerboseLink(true);
        embedded_firmware.bundle_compiler_rt = true; 
        // embedded_firmware.rc_includes = .gnu;
        // embedded_firmware.export_table = true; 
        embedded_firmware.entry = .{.symbol_name = "_start"};
        // embedded_firmware.link_gc_sections = true; 
        // embedded_firmware.link_data_sections = true;
        // embedded_firmware.link_function_sections = true;
        // embedded_firmware.export_memory = true; 

        // embedded_firmware.root_module

        for (modules) |module| {
            std.log.info("\nAdding to base module: {s}\n", .{module.name});
            module.module.link_libc = false;
            embedded_firmware.root_module.addImport(module.name, module.module);
        }

        return Firmware{.executable = embedded_firmware};
    }

    pub fn getCompilationTarget(self: Firmware) ?std.Build.ResolvedTarget{
        return self.executable.root_module.resolved_target;
    }

    pub fn getOptimizationProfile(self: Firmware) ?std.builtin.OptimizeMode{
        return self.executable.root_module.optimize;
    }

    fn addDependencies(self: *Firmware, modules: []const std.Build.Module.Import) void {
        for(modules) |import| {
            self.executable.root_module.addImport(import.name, import.module);
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

