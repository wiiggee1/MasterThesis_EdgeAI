idf_component_register(
    SRCS "linker_placeholder.c"
    INCLUDE_DIRS "."
)

# Add zig_app.a to the build process

# add_prebuilt_library(prebuilt "libprebuilt.a"
#              PRIV_REQUIRES spi_flash app_update log)

#add_dependencies(zig zig_build)

message(STATUS "CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}" ...)
add_prebuilt_library(zig-firmware ${CMAKE_CURRENT_BINARY_DIR}/zig-out/lib/libzig_main.a)

# main calls these functions that is defined from the static library, so link to main. 
#target_link_libraries(${COMPONENT_LIB} PUBLIC zig-firmware)

message(STATUS "Component lib env: ${COMPONENT_LIB}" ...)
message(STATUS "INCLUDE_DIRS env: ${INCLUDE_DIRS}" ...)


