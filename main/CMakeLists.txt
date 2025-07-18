idf_component_register(
    SRCS "linker_placeholder.c"
    INCLUDE_DIRS "." 
    # WHOLE_ARCHIVE
    #PRIV_REQUIRES freertos log 
)

include(../cmake/zig-build.cmake)

set(include_dirs $<TARGET_PROPERTY:${COMPONENT_LIB},INCLUDE_DIRECTORIES> ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# COMMAND ${CMAKE_COMMAND} -E env "INCLUDE_DIRS=${include_dirs}"
set(ENV{"INCLUDE_DIRS} ${include_dirs}"})

message(STATUS "CMAKE_BINARY_DIR: ${CMAKE_BINARY_DIR}") # Path to top level of build tree
message(STATUS "CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}")
message(STATUS "CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")

add_prebuilt_library(zig_main ${CMAKE_CURRENT_SOURCE_DIR}/zig-out/lib/libzig_main.a)
add_library( zig_nn STATIC IMPORTED)
set_target_properties(zig_nn PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/zig-out/lib/libnn_model.a)

# main calls these functions that is defined from the static library, so link to main. 

# target_link_libraries(${COMPONENT_LIB} PUBLIC  $<TARGET_OBJECTS:zig_main>)
target_link_libraries(${COMPONENT_LIB} PRIVATE zig_main)
# target_link_libraries(${COMPONENT_LIB} PRIVATE zig_nn)

# set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

message(STATUS "Component lib: ${COMPONENT_LIB}")
message(STATUS "INCLUDE_DIRS: ${include_dirs}")
message(STATUS "CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES: ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES}")
message(STATUS "Component dir: ${EXTRA_COMPONENT_DIRS}")


