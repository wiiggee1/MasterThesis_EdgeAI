### Installation Artifacts 

*Generated build files*:
```
zig-out/
└── bin → <std.Build.Step.Compile.Kind>
    └── <exe_name>.<format>
    └── firmware.bin

```

### Compile & Run Step

*Compile Step*
"
The Compile step can be configured the same as any executable, library, or
object file, for example by linking against system libraries, setting target
options, or adding additional compilation units
"


In our Compile Step we need to define the following options: 
- Target to Build, e.g., RISCV or Xtensa targets.
- Optimization Profile, e.g., Debug, Safe, or Fast. 
- Linking against libraries, adding header and source files. 

*Run Step*
"
The Run step can be configured the same as any Run step, for example by
skipping execution when the host is not capable of executing the binary.
"

#### The Applications Step Graph: 

```
b.addInstallArtifact(artifact: *Step.Compile, options: Step.InstallArtifact.Options) → *Step.InstallArtifact

b.getInstallStep() → *Step.InstallArtifact
```

The below shows the step dependency graph, where the child step depends on the prior
parent step. Top step node should run first.

- Compile Step Artifact: 
    > *Step.TranslateC - ESP IDF Bindings   (1).
              ↑
      *Step.InstallFile - add file to install TranslateC.getOutput()    (2).
              ↑
      *Step.Compile - Our firmware, as static library for linking with esp-idf c-code   (3).
              ↑
              ↑
              ↑
- Run Step Artifact: 
    > ...
              ↑
              ↑
              ↑
              ↑

### User-Provided Options

By running `b.option` we get pass user provided options as flag during `zig build`.
Look at the `b.standardTargetOptions(.{});` for example how it works. Creating these 
option would generate a "Project-Specific Options" section. 

### Options for Conditional Compilation

- Use the `b.addOptions`, e.g., 

```zig
const options = b.addOptions();
    options.addOption([]const u8, "version", version);
    options.addOption(bool, "have_libfoo", enable_foo);

    exe.root_module.addOptions("config", options);
```

In other words `addOptions`: 
___
```
/// Create a set of key-value pairs that can be converted into a Zig source
/// file and then inserted into a Zig compilation's module table for importing.
/// In other words, this provides a way to expose build.zig values to Zig
/// source code with `@import`.
/// Related: `Module.addOptions`.
```
___


### Testing
" When using the build script, unit tests are broken into two different steps in
the build graph, the Compile step and the Run step. Without a call to
addRunArtifact, which establishes a dependency edge between these two steps,
the unit tests will not be executed. "


