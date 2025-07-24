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


### ESP IDF components using Zig's build-system: 

When interacting with ESP IDF using Zig, and for creating `Components`. 
It requires to define a `Components` as a `static library`. For it to 
work with other languages such as Zig and Rust, we need to define an 
empty `placeholder.c` file as the source. The following json config 
generated during the esp-idf configuration phase. Have the following
`"main"` entry: 

```json
    "main": {
        "alias": "idf::main",
        "target": "___idf_main",
        "prefix": "idf",
        "dir": "/home/wiiggee1/Desktop/Master_Thesis/MasterThesis_EdgeAI/main",
        "type": "LIBRARY",
        "lib": "__idf_main",
        "reqs": [],
        "priv_reqs": [],
        "managed_reqs": [],
        "managed_priv_reqs": [],
        "file": "/home/wiiggee1/Desktop/Master_Thesis/MasterThesis_EdgeAI/build/esp-idf/main/libmain.a",
        "sources": [ "/home/wiiggee1/Desktop/Master_Thesis/MasterThesis_EdgeAI/main/linker_placeholder.c" ],
        "include_dirs": [ "." ]
    },
```


In CMake the `REQUIRES` and `PRIV_REQUIRES` are wrappers around 
the CMake functions `target_link_libraries(... PUBLIC ...)` and 
`target_link_libraries(... PRIVATE ...)`. 


- The `INCLUDE_DIRS` belonging to all other components listed in the `REQUIRES` and `PRIV_REQUIRES` parameters (ie all the current component's public and private dependencies).

- Recursively, all of the `INCLUDE_DIRS` of those components `REQUIRES` lists (ie all public dependencies of this component's dependencies, recursively expanded).

##### Common Component Requirments
The component named main is special because it automatically requires all other
components in the build. So it's not necessary to pass REQUIRES or
PRIV_REQUIRES to this component

To avoid duplication, every component automatically requires some "common" IDF
components even if they are not mentioned explicitly. Headers from these
components can always be included.

The list of common components is: cxx, newlib, freertos, esp_hw_support, heap,
log, soc, hal, esp_rom, esp_common, esp_system, xtensa/riscv

The MINIMAL_BUILD build property can be set to ON, which acts as a shortcut to
configure the COMPONENTS variable to include only the main component. This
means that the build will include only the common components, the main
component, and all dependencies associated with it, both direct and indirect












