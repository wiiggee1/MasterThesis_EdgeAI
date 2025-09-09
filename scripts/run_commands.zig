const std = @import("std");

const help_flag =
    \\Usage: ./run_commands [options]
    \\
    \\Options:
    \\  build 
    \\  flash 
    \\  monitor
    \\  cmd_str --cmd <cmd> --cmd_options [cmd_options] --input_file <input_file> --filter [filter_opt]"
    \\  benchmark <example_name>
    \\  readelf
    \\  objdump --args [<arg1>, <arg2>, ..., <argN>]
    \\  objcopy [option(s)] in-file [out-file]
;

pub const RunnableCommand = struct {
    pub const Action = enum {
        build,
        flash,
        monitor,
        cmd_str,
        readelf,
        benchmark,
        objdump,
        objcopy,

        pub fn parseArg(arg: []const u8) ?Action{

            if (std.meta.stringToEnum(Action, arg)) |action| {
                return action;
            }
            if (std.mem.eql(u8, arg, "riscv32-elf-objcopy") or
                std.mem.eql(u8, arg, "riscv32-esp-elf-objcopy") or
                std.mem.eql(u8, arg, "llvm-objcopy")) return Action.objcopy;

            return null;
        }

        pub fn toString(self: Action) []const u8{
            return switch (self) {
                .build => "build",
                .flash => "flash",
                .monitor => "monitor",
                .cmd_str => "cmd_str",
                .readelf => "readelf",
                .benchmark => "benchmark",
                .objdump => "objdump",
                .objcopy => "objcopy",
            };
        }
        pub fn getCommandString(kind: Action) []const u8 {
            const action_str = kind.toString();
            _ = action_str; 
            const command_string = switch (kind) {
                .build => "build",
                .flash => "-p /dev/ttyACM0 flash",
                .monitor => "-p /dev/ttyACM0 flash monitor",
                .cmd_str => "<cmd> [options] <input_file>",
                .readelf => "riscv32-elf-readelf",
                .benchmark => "benchmark",
                .objdump => "riscv32-elf-objdump",
                .objcopy => "riscv32-elf-objcopy"
            };
            return command_string;
        }
    };

    pub fn parseEnvChildCommand(envmap: *std.process.EnvMap, stdout: []u8) !void {
        var lines = std.mem.splitAny(u8, stdout, "\n");
        while(lines.next()) |line| {
            if (line.len == 0) continue;
            if (std.mem.indexOfScalar(u8, line, '=')) |eq_index| {
                const key = line[0..eq_index];
                const val = line[eq_index + 1..];
                try envmap.put(key, val);
            }
            if (std.mem.startsWith(u8, line, "--")){
                const line_no_dd = std.mem.trim(u8, line, "--");
                if (std.mem.indexOfScalar(u8, line_no_dd, ':')) |colon_index| {
                    const name_id = std.mem.trim(u8, line_no_dd[0..colon_index], " ");
                    const val = if(std.ascii.isWhitespace(line_no_dd[colon_index + 1])) 
                        line_no_dd[colon_index + 2..] 
                    else line_no_dd[colon_index + 1..];
                    _ = name_id; 
                    _ = val; 
                }
            }
        }
    }


    pub fn runCommand(allocator: std.mem.Allocator, action: Action) !void{
        var cached_envmap = try std.process.getEnvMap(allocator);

        if (cached_envmap.get("IDF_TOOLS_EXPORT_CMD") == null){
            // ######################## Creating a new Child process from posix `fork()`
            const cmd = &[_][]const u8{ "sh", "-c", "source $HOME/esp/esp-idf/export.sh && env" };
            const child_run = try std.process.Child.run(.{
                .allocator = allocator, 
                .argv = cmd,
                .env_map = &cached_envmap,  
            });
            // std.log.info("(cmd): {s}\n", .{child_run.stdout});
            if (child_run.stderr.len != 0){
                std.log.err("(stderr): {s}\n", .{child_run.stderr});
            }
        }else {
            const child_run = try std.process.Child.run(.{
                .allocator = allocator, 
                .argv = &.{"sh", "-c", "env"},
            });
            try parseEnvChildCommand(&cached_envmap, child_run.stdout);
        }
        if (cached_envmap.get("IDF_PATH")) |env_value| {
            std.log.info("→ Found env $IDF_PATH: {s}\n", .{env_value});
        }else {
            std.process.fatal("Parent Env is missing the $IDF_PATH!", .{});
        }

        const python_idf_path = try std.fmt.allocPrint(allocator, "{s}/tools/idf.py", .{
            cached_envmap.get("IDF_PATH") orelse @panic("Missing env $IDF_PATH"), 
        });

        const fullclean_cmd = &[_][]const u8{ "python", python_idf_path, "fullclean" };
        const build_cmd = &[_][]const u8{ "python", python_idf_path, action.getCommandString() };
        const command_sequence = [_][]const []const u8{
            fullclean_cmd,
            build_cmd,
        };

        inline for(command_sequence) |cmd| {
        const cmd_str = try std.mem.join(allocator, " ", cmd);
        std.log.info("Attempting to run: {s}\n", .{cmd_str});
            const child = try std.process.Child.run(.{
                .allocator = allocator,
                .argv = cmd,
                .env_map = &cached_envmap, 
                .max_output_bytes = 200*1024,
            });
            
            if(child.stdout.len != 0 and child.stdout.len < 100*1024){
                std.log.info("Stdout: {s}\n", .{child.stdout});
            }
            if (child.stderr.len != 0){
                std.log.err("Stderr: {s}\n", .{child.stderr});
            }
        }
    }

    fn checkIfExampleExist(allocator: std.mem.Allocator, action_flags: ?[][:0]u8) !void{
        if (action_flags) |flags|{
            for(flags, 0..) |flag, i| {
                if (std.mem.eql(u8, flag, "--example")){
                    const example_name = flags[i+1];
                    const example_file = try std.fmt.allocPrint(allocator, "/zig-out/bin/{s}.elf", .{example_name});

                    _ = std.fs.cwd().access(example_file, .{}) catch |err| {
                        return err; 
                    };
                }
            }
        }
    }


    /// This invokes and runs a shell script for flashing and monitoring the binary image. 
    pub fn flash(allocator: std.mem.Allocator, command_name: [:0]u8, cmd_args: ?[][:0] u8) !void {
        var cached_envmap = try std.process.getEnvMap(allocator);
        var input_file_path: ?[]const u8 = null; 
        if (cmd_args) |args| {
            var i: usize = 0;
            while(i < args.len - 1) : (i += 1){
                const flag = args[i];
                const val = args[i+1];
                if (std.mem.eql(u8, flag, "--input_file") or 
                    std.mem.eql(u8, flag, "--input") or
                    std.mem.eql(u8, flag, "--example"))
                {
                    input_file_path = val; 
                    
                }
            }
        }

        const input_image = input_file_path orelse 
            std.process.fatal("Missing either: --input_file, --input or --example\n", .{});

        const start_index = std.mem.lastIndexOf(u8, input_image, "/");
        const example_name = if(start_index) |start| input_image[start+1..] else input_image; 
        const image_name = std.mem.trim(u8, example_name, ".bin");
        const flash_command = try std.fmt.allocPrint(allocator, "./flash_target.sh --example {s}", .{image_name});

        // ./scripts/flash_target.sh --example edge_ai
        // ./flash_target.sh --example edge_ai

        const child = try std.process.Child.run(.{
            .allocator = allocator, 
            .argv = &.{"sh", "-c", flash_command},
            .env_map = &cached_envmap,
        });

        std.log.info("Attempting to Flash via: {s}\n", .{flash_command});
        const stdout_buffer = try allocator.alloc(u8, 
            if(child.stdout.len != 0) child.stdout.len
            else if(child.stderr.len != 0) child.stderr.len
            else @as(usize, 1024)); 

        var stdout_writer = std.fs.File.stdout().writer(stdout_buffer);
        const stdout = &stdout_writer.interface;


        if (child.stdout.len != 0){
            try stdout.print("{s}\n", .{child.stdout});
            try stdout.flush();
        }else if (child.stderr.len != 0){
            std.process.fatal("stderr: {s}\n", .{child.stderr});
        }
        
        try stdout.print("Successfully Flashed the Binary Image: '{s}.bin'", .{image_name});
        try stdout.flush();

        _ = command_name; 
    }

    /// `addObjCopy` creates a new build step using `objcopy`
    /// to convert the output of a compilation step into another 
    /// format. Usally: ELF → .bin, ELF → .hex.
    /// The resulting file is placed at `zig-out/bin/`. 
    pub fn objcopy(allocator: std.mem.Allocator, command_name: [:0]u8, cmd_args: ?[][:0] u8) !void {

        if (!std.mem.eql(u8, command_name, "riscv32-elf-objcopy") and
            !std.mem.eql(u8, command_name, "riscv32-esp-elf-objcopy") and
            !std.mem.eql(u8, command_name, "llvm-objcopy")) 
                std.process.fatal("Command \"{s}\" is Not supported as objcopy command!\n", .{command_name});
        
        var cached_envmap = try std.process.getEnvMap(allocator);
        var input_file_path: ?[]const u8 = null; 
        var output_file_path: ?[]const u8 = null; 
        var cmd_options: ?[]const u8 = null; 

        if (cmd_args) |args| {
            var i: usize = 0;
            while(i < args.len - 1) : (i += 1){
                const flag = args[i];
                const val = args[i+1];
                if (std.mem.eql(u8, flag, "--input_file") or std.mem.eql(u8, flag, "--input")){
                    input_file_path = val; 
                }else if (std.mem.eql(u8, flag, "--output_file")){
                    output_file_path = val; 
                }else if (std.mem.eql(u8, flag, "--options")){
                    cmd_options = val; 
                }
            }
        }

        const input_file = input_file_path orelse std.process.fatal("Missing --input_file", .{});
        const output_file = output_file_path orelse std.process.fatal("Missing --output_file", .{});

        const objcopy_cmd_str: []const []const u8 = blk:{
            if (cmd_options) |options| {
                const objcopy_cmd = &[_][]const u8{ "riscv32-elf-objcopy", input_file, options, output_file};
                break :blk objcopy_cmd;
            }else {
                const objcopy_cmd = &[_][]const u8{ "riscv32-elf-objcopy", input_file, output_file };
                break :blk objcopy_cmd; 
            }
        };

        const child = try std.process.Child.run(.{
            .allocator = allocator,
            .argv = objcopy_cmd_str,
            .env_map = &cached_envmap, 
        });

        const cmd_str = try std.mem.join(allocator, " ", objcopy_cmd_str);
        const child_out_len = 
            if(child.stdout.len != 0) child.stdout.len 
            else if(child.stderr.len != 0) child.stderr.len 
            else @as(usize, 100);

        const stdout_buffer = try allocator.alloc(u8, cmd_str.len + child_out_len);
        var stdout_writer = std.fs.File.stdout().writer(stdout_buffer);
        const stdout = &stdout_writer.interface;

        try stdout.print("\nAttempting to run: {s}\n", .{cmd_str});
        try stdout.flush();

        if (child.stdout.len != 0){
            try stdout.print("{s}\n", .{child.stdout});
            try stdout.flush();
        }else if (child.stderr.len != 0){
            std.log.err("{s}\n", .{child.stderr});
        }

        try stdout.print("Objcopy Successfully Generated The File '{s}'\n", .{output_file});
        try stdout.flush();
    }

    
    /// E.g., "--command readelf" |→ "<cmd_name> <cmd_options> <input obj files>".
    /// Where the tags "<tag_name>" represent replacement values to substitute 
    /// various command options.
    /// "--command cmd_str" "--cmd_name <cmd> --cmd_options [cmd_options] --input_file <input file> --filter <filter_opt>"
    pub fn tryRunningPlaceholderCmd(allocator: std.mem.Allocator, action: Action, action_flags: ?[][:0]u8) !void{
        try checkIfExampleExist(allocator, action_flags);
        if (action_flags) |flags|{
            var cached_envmap = try std.process.getEnvMap(allocator);
            // const action_str = action.toString();

            // zig build -freference-trace=9 -- --example edge_ai
            const command_string = switch (action) {
                .cmd_str => placeholder_cmd: {
                    var cmd_arr = try std.ArrayList([]const u8).initCapacity(allocator, flags.len);
                    var i: usize = 0;

                    while(i < flags.len - 1) : (i += 1){
                        if (std.mem.eql(u8, flags[i], action.toString())) continue;
                        const flag = flags[i];
                        const val = flags[i+1];
                        if (std.mem.eql(u8, flag, "--cmd") or std.mem.eql(u8, flag, "--cmd_name")){
                            try cmd_arr.append(allocator, val);

                        }else if (std.mem.eql(u8, flag, "--options") or std.mem.eql(u8, flag, "--cmd_options")){
                            // std.mem.replace(u8, output_cmd, "[options]", val, output_cmd[0..]);
                            try cmd_arr.append(allocator, val);

                        }else if (std.mem.eql(u8, flag, "--input") or std.mem.eql(u8, flag, "--input_file")){
                            try cmd_arr.append(allocator, val);
                        }else if (std.mem.eql(u8, flag, "--filter") or std.mem.eql(u8, flag, "--pipe")){
                            const filter_options = flags[i+1..];
                            const filter = try std.mem.join(allocator, " ", filter_options);
                            try cmd_arr.append(allocator, filter);
                        }
                    }
                    const out = try cmd_arr.toOwnedSlice(allocator);
                    break :placeholder_cmd out; 
                },
                else => &[_][]const u8{""}, 
            };

            const child = try std.process.Child.run(.{
                .allocator = allocator,
                .argv = command_string,
                .env_map = &cached_envmap, 
                .max_output_bytes = 100*1024,
            });
            const cmd_str = try std.mem.join(allocator, " ", command_string);
            std.log.info("Attempting to run: {s}\n", .{cmd_str});
                
            const buffer = try allocator.alloc(u8, 
                if(child.stdout.len != 0) child.stdout.len
                else if(child.stderr.len != 0) child.stderr.len
                else 1024
            );

            if (child.stdout.len != 0){
                var stdout_writer = std.fs.File.stdout().writer(buffer);
                const stdout = &stdout_writer.interface;
                try stdout.print("{s}\n", .{child.stdout});
                try stdout.flush();
            }else if (child.stderr.len != 0){
                var stderr_writer = std.fs.File.stderr().writer(buffer);
                const stderr = &stderr_writer.interface;
                try stderr.print("{s}\n", .{child.stderr});
                try stderr.flush();
            }
        }
    }
};

pub fn main() !void {
    var arena_allocator = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena_allocator.deinit();
    const allocator = arena_allocator.allocator(); 
    
    const cwd_process = try std.fs.cwd().realpathAlloc(allocator, ".");
    // std.log.debug("Process cwd: {s}\n", .{cwd_process});
    if (std.mem.endsWith(u8, cwd_process[0..], "/scripts")){
        try std.process.changeCurDir("../");
    }

    // ############################################### Input Args
    const args = try std.process.argsAlloc(allocator);
    
    if(args.len == 0) {
        return std.process.fatal("Too few arguments, available options are:\n{s}", .{help_flag});
    }

    // ############################################### Parse Args
    // E.g., --command <cmd> --example <example_name>
    var i: usize = 0;
    while(i < args.len - 1) : (i += 1){
        if(std.mem.eql(u8, args[i], "--command")){
            // std.log.info("Received Arg: {s} with Value: {s}\n", .{args[i], args[i+1]});
            if(!std.mem.eql(u8, args[i+1], "build") and
                !std.mem.eql(u8, args[i+1], "flash") and
                !std.mem.eql(u8, args[i+1], "readelf") and
                !std.mem.eql(u8, args[i+1], "objdump") and
                !std.mem.eql(u8, args[i+1], "objcopy") and
                !std.mem.eql(u8, args[i+1], "riscv32-elf-objcopy") and
                !std.mem.eql(u8, args[i+1], "riscv32-esp-elf-objcopy") and
                !std.mem.eql(u8, args[i+1], "llvm-objcopy") and
                !std.mem.eql(u8, args[i+1], "cmd_str") and
                !std.mem.eql(u8, args[i+1], "benchmark") and
                !std.mem.eql(u8, args[i+1], "monitor")) continue;

            const action_args: ?[][:0]u8 = suboptions:{
                if (args.len > 2){
                    break :suboptions args[3..];
                }else break :suboptions null; 
            };
            const val = args[i+1];
            const action = RunnableCommand.Action.parseArg(val) orelse return error.ParsingArgIntoActionFailed;
            if (action == .cmd_str){
                try RunnableCommand.tryRunningPlaceholderCmd(allocator, action, action_args);
            }else if (action == .objcopy){
                const command_name = val; 
                try RunnableCommand.objcopy(allocator, command_name, action_args);
            }else if (action == .flash){
                try RunnableCommand.flash(allocator, val, action_args); 
            }else {
                try RunnableCommand.runCommand(allocator, action);
            }
            
            i += 1; 
            if (i+1 > args.len) break; 
        }else if (std.mem.eql(u8, "--help",args[i])){
            // try std.io.getStdOut().writeAll(help_flag);
            const help_buffer = try allocator.alloc(u8, help_flag.len + 10);
            var stdout_writer = std.fs.File.stdout().writer(help_buffer);
            const stdout = &stdout_writer.interface;
            try stdout.writeAll(help_flag);
            try stdout.flush();
            return std.process.cleanExit();
        }
    }
    // ############################################### 

    std.process.cleanExit();
}
