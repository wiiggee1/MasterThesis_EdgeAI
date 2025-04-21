idf_component_register(
    SRCS "linker_placeholder.c"
    # INCLUDE_DIRS "." 
    WHOLE_ARCHIVE
    # REQUIRES ${REQ_DEPENDENCIES}
    #PRIV_REQUIRES freertos log 
)

set(include_dirs $<TARGET_PROPERTY:${COMPONENT_LIB},INCLUDE_DIRECTORIES> ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# Create a custom target that generates an expor

message(STATUS "CMAKE_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}")
message(STATUS "CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")

add_prebuilt_library(zig_main ${CMAKE_CURRENT_SOURCE_DIR}/zig-out/lib/libzig_main.a)
add_library( zig_nn STATIC IMPORTED)
set_target_properties(zig_nn PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/zig-out/lib/libnn_model.a)

# add_dependencies(zig_main zig_build)

# main calls these functions that is defined from the static library, so link to main. 

# target_link_libraries(${COMPONENT_LIB} PUBLIC  $<TARGET_OBJECTS:zig_main>)
target_link_libraries(${COMPONENT_LIB} PRIVATE zig_main)
# target_link_libraries(${COMPONENT_LIB} PRIVATE -Wl,--whole-archive zig_nn -Wl,--no-whole-archive)
target_link_libraries(${COMPONENT_LIB} PRIVATE zig_nn)
#include_directories(AFTER ${EXTRA_COMPONENT_DIRS})

#target_link_libraries(${COMPONENT_LIB} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/zig-out/lib/libzig_main.a)
# target_link_libraries(${COMPONENT_LIB} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/zig-out/lib/libzig_nn_model.a)

# set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
get_target_property(loc zig_nn IMPORTED_LOCATION)
message(STATUS "libnn_model.a path: ${loc}")

message(STATUS "Component lib: ${COMPONENT_LIB}")
message(STATUS "INCLUDE_DIRS: ${include_dirs}")
message(STATUS "CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES: ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES}")
message(STATUS "Component dir: ${EXTRA_COMPONENT_DIRS}")

idf_component_get_property(dir freertos COMPONENT_DIR)
message(STATUS "The 'freertos' component directory is: ${dir}")


