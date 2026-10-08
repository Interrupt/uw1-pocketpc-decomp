cmake_minimum_required(VERSION 3.16)
# CXX is enabled only because third_party/libadlmidi (the optional DOS-audio
# OPL3/XMI backend) is C++. No src/*.c file is ever compiled as C++; the
# library stays behind a C header -- see src/headers/platform_dosmidi.h.
project(uw1_decomp C CXX)

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug)
endif()
set(CMAKE_C_FLAGS_DEBUG "-g -O0")

find_package(PkgConfig REQUIRED)
pkg_check_modules(SDL2 REQUIRED sdl2)

# uw.c no longer exists: every function and global variable it held has
# been split out into matching src/*.c files (see struct-recovery-plan.md
# and the cleanup goal). Function declarations and the extern globals
# they own both live in the matching src/headers/*.h for the .c file
# that defines them; uw.h remains only for shared types/macros and the
# handful of globals with no single owning file.
set(UW_SOURCES
  src/graphics.c
  src/game.c
  src/chargen.c
  src/babl.c
  src/automap.c
  src/inventory.c
  src/combat.c
  src/bitmap.c
  src/3d.c
  src/player.c
  src/tmap.c
  src/objects.c
  src/hud.c
  src/ai.c
  src/containers.c
  src/interact.c
  src/traps.c
  src/scheduler.c
  src/resources.c
  src/item_use.c
  src/movement.c
  src/visibility.c
  src/saveload.c
  src/text.c
  src/collision.c
  src/input.c
  src/object_actions.c
  src/weapon_swing.c
  src/level.c
  src/doors.c
  src/winfile_wrappers.c
  src/models.c
  src/math.c
  src/registration.c
  src/audio.c
  src/platform_music.c
  src/platform_sfx.c
  src/platform_voice.c
  src/main.c
  src/gx_stub.c
  src/ordinal_stubs.c
  src/file_io.c
  src/demomode.c
  src/democapture.c
  src/debug.c
  src/debug_ui.c
  third_party/hxcmod/hxcmod.c
  src/debug_shim.c
)

# Optional DOS-audio backend (UW_AUDIO_MODE=dos): libADLMIDI supplies both the
# XMI -> MIDI converter and the OPL3 synthesis the DOS Sound Blaster Pro path
# needs. Options are forced here rather than left to the vendored defaults:
#  - DosBox/MAME/LLE emulators are GPL-2; Nuked OPL3 is LGPL-2.1 and the most
#    accurate, so it is the only emulator built.
#  - banks.ini is deliberately NOT vendored, which makes the library's own
#    CMake select inst_db_no_grey.cpp -- the bank database without the
#    unclear-licensing "grey zone" banks. The AIL Underworld bank we want is
#    present in that set, so nothing is lost.
#  - Everything that builds tools, plugins, examples or tests is off.
set(libADLMIDI_STATIC     ON  CACHE BOOL "" FORCE)
set(libADLMIDI_SHARED     OFF CACHE BOOL "" FORCE)
set(WITH_MIDI_SEQUENCER   ON  CACHE BOOL "" FORCE)
set(WITH_XMI_SUPPORT      ON  CACHE BOOL "" FORCE)
set(WITH_EMBEDDED_BANKS   ON  CACHE BOOL "" FORCE)
set(BUILD_NO_GREY_BANKS   ON  CACHE BOOL "" FORCE)
set(USE_NUKED_EMULATOR    ON  CACHE BOOL "" FORCE)
set(USE_DOSBOX_EMULATOR   OFF CACHE BOOL "" FORCE)
set(USE_OPAL_EMULATOR     OFF CACHE BOOL "" FORCE)
set(USE_JAVA_EMULATOR     OFF CACHE BOOL "" FORCE)
set(USE_ESFMU_EMULATOR    OFF CACHE BOOL "" FORCE)
set(USE_MAME_EMULATOR     OFF CACHE BOOL "" FORCE)
set(USE_YMFM_EMULATOR     OFF CACHE BOOL "" FORCE)
set(USE_NUKED_OPL2_LLE_EMULATOR OFF CACHE BOOL "" FORCE)
set(USE_NUKED_OPL3_LLE_EMULATOR OFF CACHE BOOL "" FORCE)
set(USE_HW_SERIAL         OFF CACHE BOOL "" FORCE)
set(WITH_HQ_RESAMPLER     OFF CACHE BOOL "" FORCE)
set(WITH_MIDIPLAY         OFF CACHE BOOL "" FORCE)
set(WITH_ADLMIDI2         OFF CACHE BOOL "" FORCE)
set(WITH_VLC_PLUGIN       OFF CACHE BOOL "" FORCE)
set(WITH_OLD_UTILS        OFF CACHE BOOL "" FORCE)
set(WITH_XMI2MID          OFF CACHE BOOL "" FORCE)
set(WITH_MUS2MID          OFF CACHE BOOL "" FORCE)
set(WITH_MIDIDUMP         OFF CACHE BOOL "" FORCE)
set(EXAMPLE_SDL2_AUDIO    OFF CACHE BOOL "" FORCE)
set(WITH_UNIT_TESTS       OFF CACHE BOOL "" FORCE)
set(WITH_GENADLDATA       OFF CACHE BOOL "" FORCE)
add_subdirectory(third_party/libadlmidi EXCLUDE_FROM_ALL)

add_executable(uw_dbg ${UW_SOURCES})

target_include_directories(uw_dbg PRIVATE ${SDL2_INCLUDE_DIRS} third_party/hxcmod)
target_link_directories(uw_dbg PRIVATE ${SDL2_LIBRARY_DIRS})
target_link_libraries(uw_dbg PRIVATE ${SDL2_LIBRARIES} ADLMIDI_static)
target_compile_options(uw_dbg PRIVATE
  ${SDL2_CFLAGS_OTHER}
  -Wno-pointer-sign
  -fno-common
)

set_target_properties(uw_dbg PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
)

# ASan-instrumented twin of uw_dbg, for run-regressions.sh (which uses this
# by default -- see its own comment) so the regression suite actually
# catches memory-safety bugs (confirmed real ones this way: a heap-buffer-
# overflow in blit_sprite_row_remapped) instead of silently reading/writing
# adjacent heap memory. Kept as a separate target rather than folding into
# uw_dbg itself so day-to-day interactive playtesting isn't slowed down by
# ASan's overhead.
add_executable(uw_asan ${UW_SOURCES})

target_include_directories(uw_asan PRIVATE ${SDL2_INCLUDE_DIRS} third_party/hxcmod)
target_link_directories(uw_asan PRIVATE ${SDL2_LIBRARY_DIRS})
target_link_libraries(uw_asan PRIVATE ${SDL2_LIBRARIES} ADLMIDI_static)
target_compile_options(uw_asan PRIVATE
  ${SDL2_CFLAGS_OTHER}
  -Wno-pointer-sign
  -fno-common
  -fsanitize=address
  -fno-omit-frame-pointer
)
target_link_options(uw_asan PRIVATE -fsanitize=address)

set_target_properties(uw_asan PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
)

include(CTest)
if(BUILD_TESTING)
  add_subdirectory(tests)
endif()
