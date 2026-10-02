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
    src/game.c:set_game_mode
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
    src/player.c:dungeon_view_anim_tick src/movement.c:movement_tick)
  add_game_unit_test(movement
    src/movement.c:sweep_kill_velocity src/movement.c:sweep_deflect_heading
    src/movement.c:sweep_slide_along_wall src/movement.c:sweep_apply_collision
    uw.c:collision_flags_to_locomotion_code uw.c:sweep_collision_flags
    src/collision.c:collision_corner_flags
    src/movement.c:reticle_object_pick src/movement.c:movement_sweep_setup
    src/movement.c:sweep_step_vertical src/movement.c:sweep_integrate_substep
    src/collision.c:collision_add_candidate_object
    src/collision.c:swap_collision_candidates src/collision.c:sort_collision_candidates
    src/combat.c:resolve_collision_candidate_interaction
    src/combat.c:apply_object_collision_scatter uw.c:build_object_placement_snapshot
    src/player.c:commit_player_move src/movement.c:sweep_init_position
    src/objects.c:resolve_object_link src/movement.c:find_nearby_door_in_candidates
    src/movement.c:get_first_nearby_candidate_object)
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
    src/combat.c:resolve_melee_swing_hit src/combat.c:spawn_blood_splat_object
    src/combat.c:load_monster_combat_stats)
  target_compile_definitions(test_combat PRIVATE
    UW_TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data")
  add_game_unit_test(traps src/traps.c:dispatch_trap_type_effect)
  add_game_unit_test(illustrations
    src/object_actions.c:look_at_inscribed_object
    src/interact.c:trigger_terrain_discovery_illustration
    src/interact.c:trigger_inscription_illustration
    src/babl.c:record_illustration_discovery_and_display)
  target_compile_definitions(test_illustrations PRIVATE
    UW_TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data")
  target_sources(test_illustrations PRIVATE src/debug.c)
  add_game_unit_test(illustration_render
    src/babl.c:render_babl_dialog_window src/babl.c:display_book_or_scroll_page
    src/babl.c:bubble_sort_indices_by_key_table src/babl.c:babl_render_tick
    src/babl.c:FUN_000362e8 src/babl.c:FUN_00036300
    src/babl.c:FUN_00036308 src/babl.c:FUN_00036394
    src/babl.c:FUN_000363f0 src/babl.c:FUN_00036404
    src/babl.c:FUN_00036418 src/babl.c:FUN_000365bc
    src/babl.c:FUN_000365fc src/babl.c:FUN_0003663c
    src/babl.c:FUN_00036698 src/babl.c:FUN_00036344
    src/babl.c:babl_render_op_show_code
    src/babl.c:decompress_rle_stream src/babl.c:pack_byte_into_word
    src/babl.c:read_rle_op_code src/babl.c:rle_op_handle_short_run
    src/babl.c:rle_op_copy_pairs_even src/babl.c:rle_op_copy_pairs_odd
    src/babl.c:rle_op_fill_doubled_byte_even src/babl.c:rle_op_fill_doubled_byte_odd
    src/babl.c:rle_op_finalize_length src/babl.c:rle_op_mark_stream_done
    src/audio.c:load_voice_sample_page src/audio.c:read_voice_sample_page_chunk
    src/ordinal_stubs.c:ordfloat_bits_to_float
    src/ordinal_stubs.c:ordfloat_float_to_bits
    src/ordinal_stubs.c:Ordinal_2032 src/ordinal_stubs.c:Ordinal_2026
    src/ordinal_stubs.c:Ordinal_2020 src/ordinal_stubs.c:Ordinal_2018
    src/graphics.c:expand_pals_bytes
    src/graphics.c:convert_palette_bgrx_to_rgb
    src/graphics.c:build_rgb565_palette
    src/graphics.c:bitmap_blit_to_framebuffer
    src/hud.c:flush_dirty_rect_to_display src/hud.c:dirty_rect_union
    src/hud.c:main_loop_hud_flush src/graphics.c:flush_dungeon_frame
    src/game.c:set_pending_update_flags
    uw.c:@DAT_00085668_real_table
    src/gx_stub.c:@uw_present_state src/gx_stub.c:@g_present_state
    src/gx_stub.c:uw_begin_present_batch src/gx_stub.c:uw_end_present_batch
    src/gx_stub.c:uw_begin_modal_present src/gx_stub.c:uw_end_modal_present
    src/gx_stub.c:uw_defer_present
    src/ordinal_stubs.c:Ordinal_172
    src/input.c:wait_for_click_release src/input.c:next_input_event
    src/input.c:peek_input_event src/input.c:poll_input_event uw.c:poll_mouse_event
    src/hud.c:poll_mouse_button_flags src/input.c:process_pending_keyboard_scan_code
    src/input.c:get_alternate_keyboard_scan_code)
  target_sources(test_illustration_render PRIVATE src/debug.c src/file_io.c)
  target_compile_definitions(test_illustration_render PRIVATE
    UW_TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data")
  add_game_unit_test(scheduler
    src/scheduler.c:scheduler_tick src/scheduler.c:scheduler_step_entry
    src/scheduler.c:scheduler_finish_entry src/scheduler.c:scheduler_despawn_entry
    src/scheduler.c:scheduler_add_entry src/scheduler.c:scheduler_remove_entry
    src/objects.c:object_list_unlink
    src/ai.c:npc_ai_tick src/ai.c:initiate_npc_death src/ai.c:drop_monster_loot)
  target_compile_definitions(test_scheduler PRIVATE
    UW_TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data")
  target_compile_definitions(test_traps PRIVATE
    UW_TEST_DATA_DIR="${CMAKE_CURRENT_SOURCE_DIR}/data")
  add_game_unit_test(inventory
    src/objects.c:find_object_by_encoded_slot_in_chain src/item_use.c:find_or_assign_object_widget
    src/object_actions.c:describe_special_object_property src/object_actions.c:print_object_flavor_text
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
