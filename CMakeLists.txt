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

# uw.c/uw.h stay at the repo root until the code-cleanup pass finishes
# splitting them apart (see struct-recovery-plan.md and the cleanup
# goal); everything already split out lives under src/, with its
# headers under src/headers/.
set(UW_SOURCES
  uw.c
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
  src/main.c
  src/gx_stub.c
  src/ordinal_stubs.c
  src/file_io.c
  src/demomode.c
  src/democapture.c
  src/debug.c
  src/debug_ui.c
)

add_executable(uw_dbg ${UW_SOURCES})

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

# ASan-instrumented twin of uw_dbg, for run-regressions.sh (which uses this
# by default -- see its own comment) so the regression suite actually
# catches memory-safety bugs (confirmed real ones this way: a heap-buffer-
# overflow in blit_sprite_row_remapped) instead of silently reading/writing
# adjacent heap memory. Kept as a separate target rather than folding into
# uw_dbg itself so day-to-day interactive playtesting isn't slowed down by
# ASan's overhead.
add_executable(uw_asan ${UW_SOURCES})

target_include_directories(uw_asan PRIVATE ${SDL2_INCLUDE_DIRS})
target_link_directories(uw_asan PRIVATE ${SDL2_LIBRARY_DIRS})
target_link_libraries(uw_asan PRIVATE ${SDL2_LIBRARIES})
target_compile_options(uw_asan PRIVATE
  ${SDL2_CFLAGS_OTHER}
  -Wno-implicit-function-declaration
  -Wno-int-conversion
  -Wno-int-to-pointer-cast
  -Wno-pointer-to-int-cast
  -Wno-incompatible-function-pointer-types
  -Wno-deprecated-non-prototype
  -fsanitize=address
  -fno-omit-frame-pointer
)
target_link_options(uw_asan PRIVATE -fsanitize=address)

set_target_properties(uw_asan PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
)

include(CTest)
if(BUILD_TESTING)
  add_custom_target(unit_tests)
  add_library(unity STATIC third_party/unity/src/unity.c)
  target_include_directories(unity PUBLIC third_party/unity/src)

  add_executable(test_math tests/test_math.c tests/math_stubs.c src/math.c)
  target_include_directories(test_math PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
  target_compile_options(test_math PRIVATE -Wno-deprecated-non-prototype)
  target_link_libraries(test_math PRIVATE unity)
  add_test(NAME math COMMAND test_math)
  add_dependencies(unit_tests test_math)

  # Generate isolated test units from the original function bodies. Game
  # functions stay in their existing files, and tests never keep code copies.
  find_package(Python3 REQUIRED COMPONENTS Interpreter)
  function(add_game_unit_test name)
    set(test_source "${CMAKE_CURRENT_BINARY_DIR}/tests/${name}_functions.c")
    set(dependencies)
    foreach(entry IN LISTS ARGN)
      string(REGEX REPLACE ":.*$" "" source_file "${entry}")
      list(APPEND dependencies "${CMAKE_CURRENT_SOURCE_DIR}/${source_file}")
    endforeach()
    add_custom_command(OUTPUT "${test_source}"
      COMMAND "${Python3_EXECUTABLE}"
        "${CMAKE_CURRENT_SOURCE_DIR}/tests/tools/extract_functions.py"
        --root "${CMAKE_CURRENT_SOURCE_DIR}" --output "${test_source}" ${ARGN}
      DEPENDS tests/tools/extract_functions.py ${dependencies}
      VERBATIM)
    add_executable(test_${name} tests/test_${name}.c "${test_source}")
    add_dependencies(unit_tests test_${name})
    target_include_directories(test_${name} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
    target_compile_options(test_${name} PRIVATE -Wno-deprecated-non-prototype
      -Wno-int-conversion -Wno-pointer-to-int-cast)
    target_link_libraries(test_${name} PRIVATE unity)
    add_test(NAME ${name} COMMAND test_${name})
  endfunction()

  add_game_unit_test(chargen
    src/chargen.c:init_new_character_record
    src/chargen.c:advance_skill_tree_node
    src/chargen.c:apply_confirmed_skill_picks
    src/chargen.c:reroll_attributes_for_class_race)
  add_game_unit_test(new_game
    src/game.c:prepare_new_game src/game.c:begin_gameplay
    src/level.c:load_level_object_table src/level.c:load_level
    uw.c:set_game_mode
    src/ordinal_stubs.c:Ordinal_61 src/ordinal_stubs.c:Ordinal_164
    src/ordinal_stubs.c:Ordinal_196 src/ordinal_stubs.c:Ordinal_1047
    src/ordinal_stubs.c:Ordinal_1063
    src/saveload.c:read_archive_entry)
  foreach(name chargen new_game)
    target_compile_definitions(test_${name} PRIVATE
      UW_TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data")
  endforeach()
  target_sources(test_new_game PRIVATE src/file_io.c src/debug.c)
  add_game_unit_test(teleport
    src/level.c:transition_to_level src/level.c:teleport_object_to_level_tile
    uw.c:dungeon_view_anim_tick src/movement.c:movement_tick)
  add_game_unit_test(movement
    src/movement.c:sweep_kill_velocity src/movement.c:sweep_deflect_heading
    src/movement.c:sweep_slide_along_wall src/movement.c:sweep_apply_collision
    uw.c:collision_flags_to_locomotion_code uw.c:sweep_collision_flags
    src/collision.c:collision_corner_flags
    src/movement.c:reticle_object_pick src/movement.c:movement_sweep_setup
    src/movement.c:sweep_step_vertical src/movement.c:sweep_integrate_substep
    uw.c:FUN_00051658 uw.c:FUN_00051cf8 uw.c:FUN_00051dd0 uw.c:FUN_000546c4
    uw.c:FUN_0005448c uw.c:build_object_placement_snapshot
    src/player.c:commit_player_move src/movement.c:sweep_init_position
    src/objects.c:resolve_object_link uw.c:FUN_0005aea0 uw.c:FUN_0005b010)
  target_sources(test_movement PRIVATE src/debug.c)
  add_game_unit_test(combat
    src/combat.c:find_nearest_hit_target src/combat.c:resolve_combat_hit_zone
    src/combat.c:compute_attack_relative_facing
    src/combat.c:process_melee_attack_swing src/combat.c:apply_melee_damage
    src/combat.c:apply_typed_damage_to_object src/combat.c:resolve_damage_type_resistance
    src/combat.c:apply_damage_to_object src/combat.c:award_monster_kill_experience
    src/ai.c:handle_monster_death src/ai.c:initiate_npc_death
    src/ai.c:resolve_unique_npc_special_behavior
    src/hud.c:set_hud_status_value src/hud.c:hud_panel_redraw_dispatch
    src/hud.c:hud_panel_wipe_transition_tick
    src/combat.c:resolve_melee_swing_hit)
  add_game_unit_test(traps src/traps.c:dispatch_trap_type_effect)
  target_compile_definitions(test_traps PRIVATE
    UW_TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data")
  add_game_unit_test(inventory
    uw.c:FUN_00053644 uw.c:find_or_assign_object_widget
    uw.c:FUN_000495d0 uw.c:FUN_000493cc
    src/item_use.c:arm_use_item_on_player_prompt
    src/item_use.c:prompt_use_item_on_target
    src/item_use.c:complete_use_item_on_player
    src/game.c:handle_game_view_click)
  target_compile_definitions(test_inventory PRIVATE
    UW_TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data")
  target_compile_definitions(test_movement PRIVATE
    UW_TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data")
  target_compile_options(test_movement PRIVATE
    -include "${CMAKE_CURRENT_SOURCE_DIR}/tests/movement_test_globals.h")
endif()
