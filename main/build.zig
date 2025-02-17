const std = @import("std");
const buliltin = @import("builtin");

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

    // const target = b.resolveTargetQuery(esp32s3_target);
    const target = b.standardTargetOptions(.{ .default_target = esp32s3_target });
    const optimize = b.standardOptimizeOption(.{});

    std.debug.print("target features: {any}\n", .{target.result.cpu.features});
    // target.query.fromTarget(std.Target.xtensa.Feature.fp);

    // Ensure that Zig can find the necessary ESP-IDF header files.
    const home_directory = std.process.getEnvVarOwned(b.allocator, "HOME") catch "";
    const esp_idf_path = std.process.getEnvVarOwned(b.allocator, "IDF_PATH") catch "";
    // const src_path = std.fs.path.dirname(@src().file) orelse b.pathResolve(&.{"./src/"});

    // generate bindings for the ESP-IDF library
    const bindings = b.addTranslateC(.{
        .link_libc = true,
        .optimize = optimize,
        .target = target,
        .root_source_file = b.path("bindings.h"),
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
        .name = "zig_main",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

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

        bindings.addIncludePath(.{ .cwd_relative = "../build/config/" });
        bindings.addIncludePath(.{ .cwd_relative = "." });
        // try searched_idf_include(b, bindings, esp_idf_path);
        try searched_idf_libs(b, esp_idf_lib);
        //try add_c_includes(b, esp_idf_lib);
    }

    const installed_bindings = b.addInstallFile(bindings.getOutput(), "../src/bindings.zig");

    // const binding_module = bindings.addModule("esp_idf");
    // binding_module.root_source_file = b.path("src/bindings.zig");

    b.getInstallStep().dependOn(&installed_bindings.step);

    const esp_idf = b.createModule(.{
        .root_source_file = b.path("src/bindings.zig"),
    });

    const utils_mod = b.addModule("esp32s3_utils", .{
        .root_source_file = b.path("src/esp32s3_utils.zig"),
    });

    utils_mod.addImport("esp_idf", esp_idf);

    // esp_idf_lib.root_module.addImport("esp_idf", esp_idf);
    esp_idf_lib.root_module.addImport("esp_idf_utils", utils_mod);

    // esp_idf_lib.step.dependOn(&bindings.step);
    esp_idf_lib.step.dependOn(bindings.output_file.step);

    // const binding_output_step = bindings.output_file.step;
    // bindings.output_file.path = b.pathJoin(&.{ src_path, "binding_out.zig" });

    // b.getInstallStep().dependOn(&bindings.step);

    b.installArtifact(esp_idf_lib);

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

    // b.default_step.dependOn(&esp_file.step);

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
    var dir = try std.fs.cwd().openDir("../build", .{
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
