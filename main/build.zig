const std = @import("std");

// Although this function looks imperative, note that its job is to
// declaratively construct a build graph that will be executed by an external
// runner.
pub fn build(b: *std.Build) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const esp32s3_target = std.Target.Query{
        .cpu_arch = .xtensa,
        .cpu_model = .{ .explicit = &std.Target.xtensa.cpu.esp32s3 },
        .os_tag = .freestanding,
        .abi = .none,
    };

    const target = b.resolveTargetQuery(esp32s3_target);
    const optimize = b.standardOptimizeOption(.{ .preferred_optimize_mode = .ReleaseSafe });

    // Ensure that Zig can find the necessary ESP-IDF header files.
    const esp_idf_path = std.process.getEnvVarOwned(b.allocator, "IDF_PATH") catch "/home/wiiggee1/esp/esp-idf/";
    const include_dirs = std.process.getEnvVarOwned(b.allocator, "INCLUDE_DIRS") catch "";

    std.debug.print("esp_idf_path: {s}\n", .{esp_idf_path});
    std.debug.print("include_dirs: {s}\n", .{include_dirs});

    //const esp_common = std.fmt.allocPrint(b.allocator, "{s}/components/esp_common/include", .{esp_idf_path}) catch @panic("Out of Memory");
    //const esp_log = std.fmt.allocPrint(b.allocator, "{s}/components/log/include", .{esp_idf_path}) catch @panic("Out of Memory");
    //const freertos = std.fmt.allocPrint(b.allocator, "{s}/components/freertos/FreeRTOS-Kernel/include/freertos", .{esp_idf_path}) catch @panic("Out of Memory");

    //Here goes a static library to be linked with c / c++ app.
    const esp_idf_lib = b.addStaticLibrary(.{
        .name = "zig_main",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    var it = std.mem.tokenizeAny(u8, include_dirs, ";");
    while (it.next()) |dir| {
        std.debug.print("esp_idf_path: {s}", .{dir});
        //esp_idf_lib.addIncludePath(.{ .path = dir });
    }

    esp_idf_lib.linkLibC();
    // esp_idf_lib.addIncludePath(.{ .cwd_relative = esp_common });
    // esp_idf_lib.addIncludePath(.{ .cwd_relative = freertos });
    // esp_idf_lib.addIncludePath(.{ .cwd_relative = esp_log });
    //
    b.installArtifact(esp_idf_lib);

    // const exe = b.addExecutable(.{
    //     .name = "esp32s3_edgeai",
    //     .root_source_file = b.path("src/main.zig"),
    //     .target = target,
    //     .optimize = optimize,
    // });

    //exe.addIncludePath(.{ .cwd_relative = esp_component });
    //exe.linkLibC();

    // This would link against the ESP-IDF compiled libraries.

    //exe.linkLibrary(esp_idf_lib);
    //exe.addLibraryPath(.{ .cwd_relative = esp_component });

    esp_idf_lib.setLinkerScript(b.path("linker.ld"));

    const link = b.addSystemCommand(&[_][]const u8{
        "xtensa-esp32-elf-gcc",
        "-T",
        "linker.ld",
        "-o",
        "esp32_s3_app",
        "main.o",
    });

    const flash = b.addSystemCommand(&[_][]const u8{
        "idf.py",
        "",
    });

    // This declares intent for the executable to be installed into the
    // standard location when the user invokes the "install" step (the default
    // step when running `zig build`).
    // b.installArtifact(exe);

    link.step.dependOn(&esp_idf_lib.step);

    const link_step = b.step("link", "Linking the ELF binary from the .o (object) files.");
    link_step.dependOn(&link.step);

    const flash_step = b.step("flash", "Flashing the ESP32 S3 via idf.py command.");
    flash_step.dependOn(&flash.step);

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

    // Creates a step for unit testing. This only builds the test executable
    // but does not run it.
    // const lib_unit_tests = b.addTest(.{
    //     .root_source_file = b.path("src/root.zig"),
    //     .target = target,
    //     .optimize = optimize,
    // });

    //const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const exe_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

    // Similar to creating the run step earlier, this exposes a `test` step to
    // the `zig build --help` menu, providing a way for the user to request
    // running the unit tests.
    const test_step = b.step("test", "Run unit tests");
    //test_step.dependOn(&run_lib_unit_tests.step);
    test_step.dependOn(&run_exe_unit_tests.step);
}
