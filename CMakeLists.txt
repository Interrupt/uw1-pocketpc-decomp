cmake_minimum_required(VERSION 3.16)
project(uw1_decomp C)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()
set(CMAKE_C_FLAGS_DEBUG "-g -O0")

find_package(PkgConfig REQUIRED)
pkg_check_modules(SDL2 REQUIRED sdl2)

add_executable(uw_dbg
  uw.c
  graphics.c
  game.c
  chargen.c
  main.c
  gx_stub.c
  ordinal_stubs.c
  file_io.c
  demomode.c
  democapture.c
  debug.c
)

target_include_directories(uw_dbg PRIVATE ${SDL2_INCLUDE_DIRS})
target_link_directories(uw_dbg PRIVATE ${SDL2_LIBRARY_DIRS})
target_link_libraries(uw_dbg PRIVATE ${SDL2_LIBRARIES})
target_compile_options(uw_dbg PRIVATE
  ${SDL2_CFLAGS_OTHER}
  -Wno-implicit-function-declaration
  -Wno-int-conversion
  -Wno-int-to-pointer-cast
  -Wno-pointer-to-int-cast
  -Wno-incompatible-function-pointer-types
  -Wno-deprecated-non-prototype
)

set_target_properties(uw_dbg PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
)
