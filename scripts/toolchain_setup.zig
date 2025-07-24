const std = @import("std");
const builtin = @import("builtin");

const help_flag =
    \\Usage: ./toolchain_setup [options]
    \\
    \\Options:
    \\  --target TARGET_NAME [Alt. --target=<name>]
    \\  --output-file OUTPUT_JSON_FILE
    \\
;

pub const ToolchainConfig = struct {
    target: ?SupportedTargets = null,
    toolchain_version: ?[]u8 = null,
    component_dir: ?[]const []const u8 = null,
    cached_envmap: std.process.EnvMap, 

    pub fn parseEnvChildCommand(self: *ToolchainConfig, stdout: []u8) !void {
        var lines = std.mem.splitAny(u8, stdout, "\n");
        while(lines.next()) |line| {
            if (line.len == 0) continue;
            if (std.mem.indexOfScalar(u8, line, '=')) |eq_index| {
                const key = line[0..eq_index];
                const val = line[eq_index + 1..];
                // std.log.info("Adding to EnvMap: {s}, {s}\n", .{key, val});
                try self.cached_envmap.put(key, val);
            }
            if (std.mem.startsWith(u8, line, "--")){
                const line_no_dd = std.mem.trim(u8, line, "--");
                if (std.mem.indexOfScalar(u8, line_no_dd, ':')) |colon_index| {
                    const name_id = std.mem.trim(u8, line_no_dd[0..colon_index], " ");
                    const val = if(std.ascii.isWhitespace(line_no_dd[colon_index + 1])) 
                        line_no_dd[colon_index + 2..] 
                    else line_no_dd[colon_index + 1..];
                    // std.log.info("line no double dash: {s}:{s} \n", .{name_id, val});
                    // std.log.info("{s}\n", .{line});
                    try self.parseCmakeStdout(name_id, val);
                }
            }
        }
    }

    /// This is for parsing variables from the cmake build for 
    /// fetching the include directories (esp idf components).
    pub fn parseCmakeStdout(self: *ToolchainConfig, name_id: []const u8, line_val: []const u8) !void {
        if (std.mem.startsWith(u8, name_id, "Component") and std.mem.endsWith(u8, name_id, "paths")){
            std.debug.print("Found Components paths:\n", .{});
            std.debug.print("Adding to Cached EnvMap: $COMPONENT_DIR={s}\n", .{line_val});
            try self.cached_envmap.put("COMPONENT_DIR", line_val);
        }
        if (std.mem.containsAtLeast(u8, line_val, 1, "INCLUDE_DIRS")){
            // var iter = std.mem.tokenizeAny(u8, line_val, ";");
            // var includes_arr = try std.BoundedArray([]const u8, 1000).init(line_val.len);
            // while (iter.next()) |include_dir| {
            //     try includes_arr.append(include_dir);
            //     // lib.addIncludePath(.{ .cwd_relative = dir });
            // }
        }
    }

    pub fn getComponentsAsOwnedJsonArray(self: ToolchainConfig, allocator: std.mem.Allocator) ![][]const u8{
        const component_str = self.cached_envmap.get("COMPONENT_DIR") orelse return error.ComponentDirectoryNotSet;
        var arr = std.ArrayList([]const u8).init(allocator);
        var paths = std.mem.splitAny(u8, component_str, " ");
        while(paths.next()) |path| {
            // std.log.info("Found component path: {s}\n", .{path});
            try arr.append(path);
        }
        return try arr.toOwnedSlice();
    }

    pub fn getOwnedCommonComponentReqsPath(self: ToolchainConfig, allocator: std.mem.Allocator, comp_reqs: [][]const u8) ![][]const u8{
        const component_arr = try self.getComponentsAsOwnedJsonArray(allocator);
        var arr = std.ArrayList([]const u8).init(allocator);
        for (component_arr) |component_path| {
            for (comp_reqs) |reqs_str| {
                if (std.mem.endsWith(u8, component_path, reqs_str)){
                    // std.log.info("Found Common Component Requirement Path: {s}\n", .{component_path});
                    try arr.append(component_path);
                }
            }
        }
        return try arr.toOwnedSlice();
    }
};

    // const JsonConfig = struct { 
    //     TOOLCHAIN_VERSION: []const u8,  
    //     SYSROOT_PATH: []const u8,
    //     // COMPONENT_DIR: []const u8, 
    //     COMPONENT_DIR: [][]const u8, 
    //     COMMON_COMPONENT_REQS: [][]const u8,
    //     COMMON_COMPONENT_REQS_PATH: [][]const u8,
    // };


/// Represent an ESP-IDF `Components`. It contains directory path 
/// and associated include dirs, neccessary for including header
/// files. These header files are needed for creating our 
/// `main` component (static library) that acts as our firmware. 
pub const Components = struct {
    COMPONENTS: std.ArrayList(Component), 
    
    pub const Component = struct {
        name: []const u8,
        dir: []const u8,
        include_dirs: [][]const u8, 
    };

    pub fn parseComponentsFromJsonFile(allocator: std.mem.Allocator, file_path: []const u8, target_components: [][]const u8) !Components {
        const cwd_path = try std.fs.cwd().realpathAlloc(allocator, "build/project_description.json");
        var project_description = std.fs.cwd().openFile(cwd_path, .{}) catch |err| {
            std.process.fatal("Unable to open '{s}': {s}", .{ file_path, @errorName(err) });
        };
        defer project_description.close();

        var json_reader = std.json.reader(allocator, project_description.reader());
        const json_file = try std.json.Value.jsonParse(allocator, &json_reader, .{
            .allocate = .alloc_if_needed,
            .max_value_len = 5000,
        });

        var cached_components = Components{
            .COMPONENTS = .init(allocator),
        };

        const build_component_info = json_file.object.get("build_component_info") orelse return error.BuildComponentInfoNotFound;
        const json_copy = try build_component_info.object.clone();
        // var json_iter = json_copy.iterator();

        outer_for: for (target_components) |target_comp| {
            const comp_value = json_copy.get(target_comp) orelse continue :outer_for; 
            const comp_objmap_clone = try comp_value.object.clone();

            const dir_value = comp_objmap_clone.get("dir") orelse return error.DirKeyWasNotFoundInObject;
            const include_dirs_value = comp_objmap_clone.get("include_dirs") orelse return error.IncludeDirsKeyWasNotFoundInObject; 
            const dir = dir_value.string;
            const include_dirs = try include_dirs_value.array.clone();

            var component_include_dir = std.ArrayList([]const u8).init(allocator);
            for(include_dirs.items) |element| {
                try component_include_dir.append(element.string);
            }
            // std.log.debug("Final Array: {s}\n", .{component_include_dir.items});
            try cached_components.COMPONENTS.append(Component{
                .name = target_comp,
                .dir = dir,
                .include_dirs = try component_include_dir.toOwnedSlice()
            });
            continue :outer_for;
        }

        return cached_components; 
    }
};

pub const SupportedTargets = enum {
    riscv32,
    xtensa,
    const Self = @This();

    pub fn getArchTools(self: Self) []const u8{
        return switch (self) {
            .riscv32 => "riscv32-esp-elf",
            .xtensa => "xtensa-esp-elf",
        };
    }

    pub fn parse_str(input: []const u8) ?SupportedTargets{
        if (std.mem.eql(u8, input, "esp32p4")) return SupportedTargets.riscv32;
        if (std.mem.eql(u8, input, "esp32s3")) return SupportedTargets.xtensa;
        return null;  
    }
    
    pub fn getBoardName(self: Self) []const u8{
        return switch (self) {
            .riscv32 => "esp32p4",
            .xtensa => "esp32s3",
        };
    }

    pub fn getToolPath(self: Self) []const u8{
        return switch (self) {
            .riscv32 => "$HOME/.espressif/tools/riscv32-esp-elf/",
            .xtensa => "$HOME/.espressif/tools/xtensa-esp-elf/",
        };
    }

    pub fn getOwnedSysrootPath(self: Self, allocator: std.mem.Allocator, toolchain_version: []u8) ![]u8{
        // @embedFile(comptime path: []const u8)
        const tool_target = switch (self) {
            .riscv32 => |target| target.getToolPath(),
            .xtensa => |target| target.getToolPath(),
        };

        return try std.fs.path.join(allocator, &.{
            tool_target,
            toolchain_version,
            self.getArchTools(),
            self.getArchTools(),
            "include",
        });
    }
};

pub fn main() !void{
    var arena_allocator = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena_allocator.deinit();

    // ############################################### Input Args
    const allocator = arena_allocator.allocator(); 
    const args = try std.process.argsAlloc(allocator);
    // defer if(args.len > 0)allocator.free(args); 
    
    if(args.len == 0) {
        return std.process.fatal("Too few arguments, need to provided the <target_name>\n", .{});
        // return std.process.exit(1);
    }
    // ###############################################
    
    var config = ToolchainConfig{.cached_envmap = .init(allocator)};
    var output_file: ?[]const u8 = null; 

    // ############################################### Parse Args
    var i: usize = 0;
    while(i < args.len - 1) : (i += 1){
        if(std.mem.eql(u8, args[i], "--target")){
            const val = args[i+1];
            const target_val = SupportedTargets.parse_str(val) orelse return error.TargetValueMissmatch;
            config.target = target_val; 
            i += 1; 

        }else if (std.mem.eql(u8, args[i], "--target=")){
            var iter = std.mem.splitScalar(u8, args[i], '=');
            const val = iter.next() orelse "";
            const target_val = SupportedTargets.parse_str(val) orelse return error.TargetValueMissmatch;
            // const target_val = std.meta.stringToEnum(SupportedTargets, val) orelse return error.TargetValueMissmatch;
            config.target = target_val; 
            i += 1; 
        }else if (std.mem.eql(u8, args[i], "--output-file")){
            const val = args[i+1];
            output_file = val;
            i += 1; 
        }

        if (i+1 > args.len) break; 
    }
    // ############################################### 


    // The below creates a child process to execute system commands. 
    // ############################################### Creating a new Child process from posix `fork()`
    const cwd_process = try std.fs.cwd().realpathAlloc(allocator, ".");
    std.log.debug("Process cwd: {s}\n", .{cwd_process});
    if (std.mem.endsWith(u8, cwd_process[0..], "/scripts")){
        try std.process.changeCurDir("../");
    }

    const toolchain_is_setup: bool = blk:{
        const envmap_parent = try std.process.getEnvMap(allocator);
        if (envmap_parent.get("IDF_TOOLS_EXPORT_CMD") == null){
            std.log.warn("Need to run the export.sh script. Doing it Now...\n", .{});
            const cmd = &[_][]const u8{ "sh", "-c", "source $HOME/esp/esp-idf/export.sh && env" };
            const child_run = try std.process.Child.run(.{
                .allocator = allocator, 
                .argv = cmd,
            });
            std.log.info("(cmd): {s}\n", .{child_run.stderr});
            std.log.info("COMPLETED - export.sh \n", .{});
            // std.log.info("(cmd): {s}\n", .{child_run.stdout});
            try config.parseEnvChildCommand(child_run.stdout);
        }else {
            const child_run = try std.process.Child.run(.{
                .allocator = allocator, 
                .argv = &.{"sh", "-c", "env"},
            });
            // std.debug.print("ESP IDF, export.sh has already been run. Fetching Env...\n{s}\n", .{child_run.stdout});
            try config.parseEnvChildCommand(child_run.stdout);
        }

        if (config.cached_envmap.get("IDF_PATH")) |env_value| {
            std.log.info("→ Found env $IDF_PATH: {s}\n", .{env_value});
        }else {
            const idf_path = envmap_parent.get("IDF_PATH") orelse std.process.fatal("Parent Env is missing the $IDF_PATH!", .{});
            try config.cached_envmap.put("IDF_PATH", idf_path);
        }

        if (config.cached_envmap.get("PATH")) |path_env| {
            std.log.info("Cached Env $PATH={s}\n", .{path_env});
        }
        break :blk true;
    };

    if (toolchain_is_setup){
        const gcc_cmd: []const u8 = switch (config.target.?) {
            .riscv32 => "riscv32-esp-elf-gcc",
            .xtensa => "xtensa-esp-elf-gcc" 
        }; 

        const toolchain_cmd_string = try std.fmt.allocPrintZ(
            allocator,
            "{s} --version | head -n 1 | grep -oE 'esp-[0-9]+\\.[0-9]+\\.[0-9]+_[0-9]+'",.{gcc_cmd},
        );

        const toolchain_version_cmd = &[_][]const u8{ "sh", "-c", toolchain_cmd_string };

        const python_idf_path = try std.fmt.allocPrintZ(allocator, "{s}/tools/idf.py", .{
            config.cached_envmap.get("IDF_PATH") orelse @panic("Missing env $IDF_PATH"), 
        });

        //TODO: - Add build args and check if other command such as --flash, --size-components...
        const set_target_cmd = &[_][]const u8{ "python3", python_idf_path, "set-target", config.target.?.getBoardName() };

        const runnable_cmds = [_][]const []const u8{
            toolchain_version_cmd,
            set_target_cmd,
        };

        var cmd_stdout = std.ArrayListUnmanaged(u8).empty;
        var cmd_stderr = std.ArrayListUnmanaged(u8).empty;

        defer {
            cmd_stdout.deinit(allocator);
            cmd_stderr.deinit(allocator);
        }

        for (runnable_cmds) |command_args| {
            const cmd_str = try std.mem.join(allocator, " ", command_args);
            std.log.info("Attempting to run: {s}\n", .{cmd_str});
            // var child = std.process.Child.init(command_args, allocator);
            const child = try std.process.Child.run(.{
                .allocator = allocator,
                .argv = command_args,
                .env_map = &config.cached_envmap, // Use the prior shell's command process's env variable. 
            });

            // Using .Pipe, would instead pass the terminal output as input. 
            // While .Inherit, would inherit the stdout and stderr from its parent process. 
            // Meaning it will get printed to the terminal. 

            // if (std.mem.eql(u8, command_args[2], gcc_cmd)){
            //     child.stdin_behavior = .Inherit;
            //     child.stdout_behavior = .Pipe; // File descriptor: 1
            //     child.stderr_behavior = .Pipe; // File descriptor: 2
            // }else {
            //     child.stdin_behavior = .Inherit;
            //     child.stdout_behavior = .Inherit;
            //     child.stderr_behavior = .Inherit;
            // }

            std.log.info("cmd_stdout: {s}\ncmd_stderr: {s}\n", .{child.stdout, child.stderr});
            try config.parseEnvChildCommand(child.stdout);
            
            if (std.mem.eql(u8, command_args[0], "python3")){
                // try config.parseEnvChildCommand(child.stdout);
            }
            std.log.info("config.tool_version: {s}\n", .{config.toolchain_version orelse ""});
            std.log.info("config.cached_envmap.get('SYSROOT_PATH'): {s}\n", .{config.cached_envmap.get("SYSROOT_PATH") orelse ""});

            if (std.mem.containsAtLeast(u8, cmd_str, 1, gcc_cmd)){
                // try child.collectOutput(allocator, &cmd_stdout, &cmd_stderr, 2*1024);
                // std.log.info("Child Process Output, TOOLCHAIN_VERSION: {s}\n", .{cmd_stdout.items});
                const sysroot_path = try config.target.?.getOwnedSysrootPath(allocator, child.stdout);
                try config.cached_envmap.put("TOOLCHAIN_VERSION", child.stdout);
                config.toolchain_version = try allocator.dupe(u8, std.mem.trim(u8, child.stdout, "\n"));
                try config.cached_envmap.put("SYSROOT_PATH", std.mem.trim(u8, sysroot_path, "\n"));
            } 

            // exit code: 0 → success.
            // exit code: 1 → general error.
            // exit code: 2 → bad syntax in shell.
            // try std.testing.expectEqual(child.term.Exited, 0);
            if (child.term.Exited != 0){
                std.process.fatal("Child Process Exited with code: {d} with message: {s}\n", .{child.term.Exited, child.stderr});
            }
        }

    }else {
        return error.MakeSureYouHaveRunIDFExportScript; 
    }
   
    // Check if the json file `project_description.json` exists if so read / open the file. 
    const cwd_path = try std.fs.cwd().realpathAlloc(allocator, "build/project_description.json");
    var project_description = std.fs.cwd().openFile(cwd_path, .{}) catch |err| {
        std.process.fatal("Unable to open '{s}': {s}", .{ cwd_path, @errorName(err) });
    };
    defer project_description.close();

    var json_reader = std.json.reader(allocator, project_description.reader());
    const json_file = try std.json.Value.jsonParse(allocator, &json_reader, .{
        .allocate = .alloc_if_needed,
        .max_value_len = 5000,
    });

    // var json_obj = try std.json.parseFromValue(std.ArrayList(u8), allocator, json_file, .{
    //     .allocate = .alloc_if_needed,
    //     .max_value_len = 1000,
    // });


    var common_components_arr = std.ArrayList([]const u8).init(allocator);

    const json_copy = try json_file.object.clone();
    var json_iter = json_copy.iterator();
    while(json_iter.next()) |entry| {
        const key = entry.key_ptr.*;
        const val_cpy = try json_file.object.clone();

        if (val_cpy.getKey(key)) |key_str| {
            if (std.mem.eql(u8, key, "common_component_reqs")){
                const value = json_file.object.get(key_str) orelse continue;
                const arr_clone = try value.array.clone();
                for(arr_clone.items) |element| {
                    try common_components_arr.append(element.string);
                }
                // std.log.debug("Final Array: {s}\n", .{common_components_arr.items});
                break; 
            }
        }
    }

    const output_file_path = output_file orelse std.process.fatal("missing --output-file", .{});
    var config_file = std.fs.cwd().createFile(output_file_path, .{}) catch |err| {
        std.process.fatal("Failed to open '{s}': {s}", .{ output_file_path, @errorName(err) });
    };
    defer config_file.close();

    // const stat = try config_file.stat();
    
    const JsonConfig = struct { 
        TOOLCHAIN_VERSION: []const u8,  
        SYSROOT_PATH: []const u8,
        // COMPONENT_DIR: []const u8, 
        COMPONENT_DIR: [][]const u8, 
        COMMON_COMPONENT_REQS: [][]const u8,
        COMMON_COMPONENT_REQS_PATH: [][]const u8,
        COMPONENT_REQS_INCLUDE: []Components.Component,
    };

    const components = try Components.parseComponentsFromJsonFile(allocator, "build/project_description.json", common_components_arr.items);

    const config_struct = JsonConfig{
        .TOOLCHAIN_VERSION = config.cached_envmap.get("TOOLCHAIN_VERSION") orelse return error.ToolChainVersionNotSet,
        .SYSROOT_PATH = config.cached_envmap.get("SYSROOT_PATH") orelse return error.SysrootPathNotSet,
        .COMPONENT_DIR = try config.getComponentsAsOwnedJsonArray(allocator),
        .COMMON_COMPONENT_REQS = common_components_arr.items,
        .COMMON_COMPONENT_REQS_PATH = try config.getOwnedCommonComponentReqsPath(allocator, common_components_arr.items),
        .COMPONENT_REQS_INCLUDE = components.COMPONENTS.items,
    };

    var string = std.ArrayList(u8).init(allocator);
    try std.json.stringify(config_struct, .{.whitespace = .indent_2}, string.writer());

    const parsed = try std.json.parseFromSlice(JsonConfig, allocator, string.items, .{});
    defer parsed.deinit();

    try config_file.writeAll(string.items);
    // std.log.info("Json Output: {s}\n", .{string.items});

    return std.process.cleanExit();
}

