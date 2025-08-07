idf_component_register(
    SRCS "linker_placeholder.c"
    INCLUDE_DIRS "." 
    # WHOLE_ARCHIVE
    #PRIV_REQUIRES freertos log 
)

set(CMAKE_MESSAGE_LOG_LEVEL VERBOSE)

set(include_dirs $<TARGET_PROPERTY:${COMPONENT_LIB},INCLUDE_DIRECTORIES> ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# COMMAND ${CMAKE_COMMAND} -E env "INCLUDE_DIRS=${include_dirs}"
set(ENV{"INCLUDE_DIRS} ${include_dirs}"})

message(STATUS "CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}") # Path to top level of build tree
message(STATUS "CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}")
message(STATUS "CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "CMAKE_SOURCE_DIR: ${CMAKE_SOURCE_DIR}")

# "../zig-out/lib/libfirmware_esp32p4_app.a"
file(GLOB zig_out_lib "${CMAKE_SOURCE_DIR}/zig-out/lib/*")

foreach(lib_path ${zig_out_lib})
    get_filename_component(lib_name "${lib_path}" NAME)
    string(REGEX MATCH "esp32p4" match_p4 "${lib_name}")
    string(REGEX MATCH "esp32s3" match_s3 "${lib_name}")
    if(match_p4)
        message(STATUS "Matched file: ${lib_name}")
        set(BOARD_TARGET esp32p4)
        set(ARCH_NAME riscv32)
        get_filename_component(ZIG_LIB_PATH "${lib_path}" ABSOLUTE BASE_DIR)
        message(STATUS "ZIG_LIB_PATH: ${ZIG_LIB_PATH}")
    elseif(match_s3)
        message(STATUS "Matched file: ${lib_name}")
        set(BOARD_TARGET esp32s3)
        set(ARCH_NAME xtensa)
        get_filename_component(ZIG_LIB_PATH "${lib_path}" ABSOLUTE BASE_DIR "${CMAKE_CURRENT_LIST_DIR}")
        message(STATUS "ZIG_LIB_PATH: ${ZIG_LIB_PATH}")
    endif()
endforeach()

# -- Matched file: libfirmware_esp32p4_app.a
# -- ZIG_LIB_PATH: /home/wiiggee1/Desktop/Master_Thesis/MasterThesis_EdgeAI/zig-out/lib/libfirmware_esp32p4_app.a

# add_prebuilt_library(zig_main ${CMAKE_CURRENT_SOURCE_DIR}/zig-out/lib/libzig_main.a)
add_prebuilt_library(zig_main ${ZIG_LIB_PATH})
add_library(zig_nn STATIC IMPORTED)
set_target_properties(zig_nn PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/zig-out/lib/libnn_model.a)
# set_target_properties(zig_nn PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/zig-out/lib/libnn_model.a)

# main calls these functions that is defined from the static library, so link to main. 

# target_link_libraries(${COMPONENT_LIB} PUBLIC  $<TARGET_OBJECTS:zig_main>)
# target_link_libraries(${COMPONENT_LIB} PRIVATE zig_main)
target_link_libraries(${COMPONENT_LIB} PRIVATE zig_main)
# target_link_libraries(${COMPONENT_LIB} PRIVATE zig_nn)
# set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

message(STATUS "Component lib: ${COMPONENT_LIB}")
message(STATUS "INCLUDE_DIRS: ${include_dirs}")
message(STATUS "CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES: ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES}")
message(STATUS "Component dir: ${EXTRA_COMPONENT_DIRS}")

# "However, in some instances the user might already have an existing CMake
# project or may want to create a custom one. In these cases it is desirable to
# be able to consume IDF components as libraries to be linked to the user's
# targets (libraries/executables)"

# Main Component Requirments: 
#
# `main` requires all other components in the build. So its not neccessary to pass the 
# `REQUIRES` or `PRIV_REQUIRES` to our `main` component (firmware). 
#
# Common components requirement is: 
# cxx, newlib, freertos, esp_hw_support, heap, log, soc, hal, esp_rom,
# esp_common, esp_system, xtensa/riscv.

# add_prebuild_library
#
# Add prebuilt library with support for adding dependencies on ESP-IDF components.
# function(add_prebuilt_library target_name lib_path)
#     cmake_parse_arguments(_ "" "" "REQUIRES;PRIV_REQUIRES" ${ARGN})
#
#     get_filename_component(lib_path "${lib_path}"
#                 ABSOLUTE BASE_DIR "${CMAKE_CURRENT_LIST_DIR}")
#
#     add_library(${target_name} STATIC IMPORTED)
#     set_property(TARGET ${target_name} PROPERTY IMPORTED_LOCATION ${lib_path})
#
#     foreach(req ${__REQUIRES})
#         idf_component_get_property(req_lib "${req}" COMPONENT_LIB)
#         set_property(TARGET ${target_name} APPEND PROPERTY LINK_LIBRARIES "${req_lib}")
#         set_property(TARGET ${target_name} APPEND PROPERTY INTERFACE_LINK_LIBRARIES "${req_lib}")
#     endforeach()
#
#     foreach(req ${__PRIV_REQUIRES})
#         idf_component_get_property(req_lib "${req}" COMPONENT_LIB)
#         set_property(TARGET ${target_name} APPEND PROPERTY LINK_LIBRARIES "${req_lib}")
#         set_property(TARGET ${target_name} APPEND PROPERTY INTERFACE_LINK_LIBRARIES "$<LINK_ONLY:${req_lib}>")
#     endforeach()
# endfunction()

