set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}")

add_custom_target(unit_tests)
add_library(unity STATIC "${PROJECT_SOURCE_DIR}/third_party/unity/src/unity.c")
target_include_directories(unity PUBLIC "${PROJECT_SOURCE_DIR}/third_party/unity/src")

# Generate isolated test units from the original function bodies. Game
# functions stay in their existing files, and tests never keep code copies.
find_package(Python3 REQUIRED COMPONENTS Interpreter)
function(uw_extract_test_functions output)
  set(dependencies)
  foreach(entry IN LISTS ARGN)
    string(REGEX REPLACE ":.*$" "" source_file "${entry}")
    list(APPEND dependencies "${PROJECT_SOURCE_DIR}/${source_file}")
  endforeach()
  add_custom_command(OUTPUT "${output}"
    COMMAND "${Python3_EXECUTABLE}"
      "${CMAKE_CURRENT_SOURCE_DIR}/tools/extract_functions.py"
      --root "${PROJECT_SOURCE_DIR}" --output "${output}" ${ARGN}
    DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/tools/extract_functions.py" ${dependencies}
    VERBATIM)
endfunction()

function(uw_configure_test_target target)
  target_include_directories(${target} PUBLIC "${PROJECT_SOURCE_DIR}")
  target_compile_options(${target} PRIVATE -Wno-deprecated-non-prototype
    -Wno-int-conversion -Wno-pointer-to-int-cast)
  target_link_libraries(${target} PUBLIC unity)
endfunction()

# Compile a reusable group of game functions once, for any number of tests.
function(add_game_test_library name)
  set(source "${CMAKE_CURRENT_BINARY_DIR}/${name}_functions.c")
  uw_extract_test_functions("${source}" ${ARGN})
  add_library(${name} STATIC "${source}")
  uw_configure_test_target(${name})
endfunction()

function(add_fixture_game_unit_test name)
  add_game_test_library(uw_test_${name} ${ARGN})
  target_sources(uw_test_${name} PRIVATE support/${name}_fixture.c)
  target_include_directories(uw_test_${name} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
  target_link_libraries(uw_test_${name} PUBLIC uw_test_support)
  target_compile_definitions(uw_test_${name} PRIVATE
    UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
  target_compile_options(uw_test_${name} PUBLIC
    -include "${CMAKE_CURRENT_SOURCE_DIR}/${name}_test_globals.h")
  add_supported_game_unit_test(${name} uw_test_${name})
endfunction()

# A supported suite needs only its cases and the fixture library it uses.
function(add_supported_game_unit_test name)
  add_executable(test_${name} "${CMAKE_CURRENT_SOURCE_DIR}/test_${name}.c")
  uw_configure_test_target(test_${name})
  target_link_libraries(test_${name} PRIVATE ${ARGN})
  add_dependencies(unit_tests test_${name})
  add_test(NAME ${name} COMMAND test_${name})
endfunction()

# Keep service functions in separate archive members so suite-specific mocks
# override only their own boundary without pulling unrelated definitions.
add_game_test_library(uw_test_memory src/ordinal_stubs.c:ce_memset)
add_game_test_library(uw_test_string_append src/ordinal_stubs.c:ce_strcat)
add_game_test_library(uw_test_string_length src/ordinal_stubs.c:ce_strlen)
add_game_test_library(uw_test_character_rules src/chargen.c:init_new_character_record)
add_game_test_library(uw_test_player_stats src/player.c:recalculate_player_stats)
add_game_test_library(uw_test_archive_rules src/saveload.c:read_archive_entry)
target_compile_options(uw_test_archive_rules PRIVATE
  -include "${CMAKE_CURRENT_SOURCE_DIR}/support/game_fixture.h")
add_library(uw_test_support STATIC support/data_fixture.c)
uw_configure_test_target(uw_test_support)
target_link_libraries(uw_test_support PUBLIC uw_test_character_rules uw_test_player_stats uw_test_archive_rules
  uw_test_memory uw_test_string_append uw_test_string_length)
target_sources(uw_test_support PRIVATE support/game_fixture.c
  support/character_services.c support/character_storage.c
  support/archive_storage.c support/file_services.c support/random.c support/division.c
  "${PROJECT_SOURCE_DIR}/src/file_io.c" "${PROJECT_SOURCE_DIR}/src/debug.c")
target_include_directories(uw_test_support PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
target_compile_definitions(uw_test_support PRIVATE UW_TEST_DATA_DIR="${PROJECT_SOURCE_DIR}/data")
target_compile_options(uw_test_support PRIVATE
  -include "${CMAKE_CURRENT_SOURCE_DIR}/support/game_fixture.h")

add_game_test_library(uw_test_math src/math.c:step_value_toward_limit)
add_supported_game_unit_test(math uw_test_math)

add_supported_game_unit_test(support uw_test_support)

add_fixture_game_unit_test(chargen
  src/player.c:write_player_status_block src/player.c:read_player_status_block
  src/player.c:@DAT_00086da8_backing
  src/player.c:reset_player_derived_state src/player.c:apply_equipped_item_effect
  src/object_actions.c:check_object_carry_weight
  src/player.c:compute_object_weight
  src/chargen.c:advance_skill_tree_node
  src/chargen.c:apply_confirmed_skill_picks
  src/chargen.c:reroll_attributes_for_class_race)
add_fixture_game_unit_test(new_game
  src/game.c:prepare_new_game src/game.c:begin_gameplay
  src/level.c:load_level_object_table src/level.c:load_level
  src/game.c:set_game_mode
  src/ordinal_stubs.c:ce_wcscpy src/ordinal_stubs.c:CopyFileW
  src/ordinal_stubs.c:MultiByteToWideChar)
add_fixture_game_unit_test(teleport
  src/level.c:transition_to_level src/level.c:teleport_object_to_level_tile
  src/player.c:dungeon_view_anim_tick src/movement.c:movement_tick)
add_game_test_library(uw_test_movement
  src/movement.c:sweep_kill_velocity src/movement.c:sweep_deflect_heading
  src/movement.c:sweep_slide_along_wall src/movement.c:sweep_apply_collision
  src/movement.c:collision_flags_to_locomotion_code src/movement.c:sweep_collision_flags
  src/collision.c:collision_corner_flags
  src/movement.c:reticle_object_pick src/movement.c:movement_sweep_setup
  src/movement.c:sweep_step_vertical src/movement.c:sweep_integrate_substep
  src/collision.c:collision_add_candidate_object
  src/collision.c:swap_collision_candidates src/collision.c:sort_collision_candidates
  src/combat.c:resolve_collision_candidate_interaction
  src/combat.c:apply_object_collision_scatter src/ai.c:build_object_placement_snapshot
  src/player.c:commit_player_move src/movement.c:sweep_init_position
  src/objects.c:resolve_object_link src/movement.c:find_nearby_door_in_candidates
  src/movement.c:get_first_nearby_candidate_object)
target_sources(uw_test_movement PRIVATE support/movement_fixture.c)
target_link_libraries(uw_test_movement PUBLIC uw_test_support)
target_compile_options(uw_test_movement PUBLIC
  -include "${CMAKE_CURRENT_SOURCE_DIR}/movement_test_globals.h")
add_supported_game_unit_test(movement uw_test_movement)
add_fixture_game_unit_test(combat
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
  src/combat.c:load_monster_combat_stats
  src/combat.c:apply_trap_type_damage_effect src/combat.c:apply_direct_object_hit
  src/combat.c:apply_object_durability_damage
  src/objects.c:apply_object_destruction_effect
  src/containers.c:discard_container_contents
  src/doors.c:close_door_object src/doors.c:schedule_door_open_animation)
add_fixture_game_unit_test(traps src/traps.c:dispatch_trap_type_effect)
add_fixture_game_unit_test(hotspot_marker src/babl.c:draw_hotspot_crosshair_marker)
add_fixture_game_unit_test(noise
  src/ai.c:alert_npc_to_noise_callback src/ai.c:emit_noise_alert)
add_fixture_game_unit_test(visibility_walk
  src/visibility.c:@DAT_00086af0_arr
  src/visibility.c:@DAT_00086af8_region
  src/math.c:@DAT_00085d48_sine
  src/math.c:@DAT_00085f50_cosine
  src/visibility.c:build_visibility_light_grid
  src/player.c:refresh_player_equipment_effects
  src/math.c:integer_sqrt
  src/visibility.c:seed_visibility_queue
  src/visibility.c:run_visibility_flood
  src/visibility.c:merge_adjacent_visibility_rays
  src/visibility.c:extend_visibility_ray_row
  src/visibility.c:advance_visibility_ray
  src/visibility.c:compute_visibility_ray_offset
  src/visibility.c:visibility_ray_step_forward
  src/visibility.c:visibility_ray_step_backward
  src/tmap.c:tilemap_lookup
  src/math.c:angle_to_screen_delta
  src/math.c:pack_angle_byte)
add_fixture_game_unit_test(illustrations
  src/object_actions.c:look_at_inscribed_object
  src/interact.c:trigger_terrain_discovery_illustration
  src/interact.c:trigger_inscription_illustration
  src/babl.c:record_illustration_discovery_and_display)
add_fixture_game_unit_test(illustration_render
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
  src/ordinal_stubs.c:ordfloat_int_to_float2 src/ordinal_stubs.c:ordfloat_mul
  src/ordinal_stubs.c:ordfloat_uint_to_float src/ordinal_stubs.c:ordfloat_int_to_float
  src/graphics.c:expand_pals_bytes
  src/graphics.c:convert_palette_bgrx_to_rgb
  src/graphics.c:build_rgb565_palette
  src/graphics.c:bitmap_blit_to_framebuffer
  src/graphics.c:fade_in src/graphics.c:fade_out
  src/hud.c:flush_dirty_rect_to_display src/hud.c:dirty_rect_union
  src/hud.c:main_loop_hud_flush src/graphics.c:flush_dungeon_frame
  src/game.c:set_pending_update_flags
  src/game.c:@DAT_00085668_real_table
  src/gx_stub.c:@uw_present_state src/gx_stub.c:@g_present_state
  src/gx_stub.c:uw_begin_present_batch src/gx_stub.c:uw_end_present_batch
  src/gx_stub.c:uw_begin_modal_present src/gx_stub.c:uw_end_modal_present
  src/gx_stub.c:uw_suspend_present_batch src/gx_stub.c:uw_resume_present_batch
  src/gx_stub.c:uw_defer_present
  src/ordinal_stubs.c:GetFileSize
  src/input.c:wait_for_click_release src/input.c:next_input_event
  src/input.c:peek_input_event src/input.c:poll_input_event src/input.c:poll_mouse_event
  src/hud.c:poll_mouse_button_flags src/input.c:process_pending_keyboard_scan_code
  src/input.c:get_alternate_keyboard_scan_code)
add_fixture_game_unit_test(scheduler
  src/scheduler.c:scheduler_tick src/scheduler.c:scheduler_step_entry
  src/scheduler.c:scheduler_finish_entry src/scheduler.c:scheduler_despawn_entry
  src/scheduler.c:scheduler_add_entry src/scheduler.c:scheduler_remove_entry
  src/objects.c:object_list_unlink
  src/ai.c:npc_ai_tick src/ai.c:initiate_npc_death src/ai.c:drop_monster_loot)
add_fixture_game_unit_test(inventory
  src/objects.c:find_object_by_encoded_slot_in_chain src/item_use.c:find_or_assign_object_widget
  src/object_actions.c:describe_special_object_property src/object_actions.c:print_object_flavor_text
  src/item_use.c:arm_use_item_on_player_prompt
  src/item_use.c:prompt_use_item_on_target
  src/item_use.c:complete_use_item_on_player
  src/game.c:handle_game_view_click)

add_fixture_game_unit_test(geometry
  src/3d.c:@DAT_000bc038_backing
  src/3d.c:near_clip_visible_tiles src/tmap.c:render_visible_tile_list
  src/ordinal_stubs.c:ordfloat_bits_to_float src/ordinal_stubs.c:ordfloat_float_to_bits
  src/ordinal_stubs.c:ordfloat_add src/ordinal_stubs.c:ordfloat_sub
  src/ordinal_stubs.c:ordfloat_mul src/ordinal_stubs.c:ordfloat_div
  src/ordinal_stubs.c:ordfloat_ge src/ordinal_stubs.c:ordfloat_uint_to_float
  src/ordinal_stubs.c:ordfloat_int_to_float2)

add_fixture_game_unit_test(spells
  src/hud.c:@DAT_00087530_backing
  src/hud.c:handle_cast_spell_click src/hud.c:cast_spell_from_rune_combo
  src/hud.c:report_spell_cast_failure
  src/object_actions.c:dispatch_special_action
  src/object_actions.c:reduce_item_quality_on_use
  src/combat.c:add_active_light_source src/tmap.c:tile_is_no_magic
  src/object_actions.c:complete_cast_spell_on_target
  src/object_actions.c:apply_targeted_spell_effect
  src/object_actions.c:spawn_object_near_actor
  src/game.c:handle_game_view_click
  src/item_use.c:compute_drop_aim_from_cursor
  src/objects.c:spawn_object_near_player
  src/objects.c:compute_object_placement_fields)

add_fixture_game_unit_test(automap
  src/automap.c:draw_automap_cell_edge src/automap.c:darken_pixel
  src/automap.c:@DAT_000842c0_real_table src/automap.c:draw_automap_cell
  src/automap.c:draw_automap_notes src/automap.c:save_automap_notes_to_archive
  src/automap.c:load_automap_notes_from_archive
  src/automap.c:enter_automap_screen src/automap.c:exit_automap_screen
  src/automap.c:handle_automap_note_click src/automap.c:pick_closer_note_label
  src/automap.c:debug_noop_overflow_hook
  src/saveload.c:open_level_archive src/saveload.c:close_level_archive
  src/saveload.c:write_archive_entry src/saveload.c:read_archive_entry
  src/winfile_wrappers.c:open_existing_file_rw src/winfile_wrappers.c:open_file_for_read
  src/winfile_wrappers.c:write_file_handle src/winfile_wrappers.c:close_file_handle
  src/ordinal_stubs.c:ce_strrchr src/ordinal_stubs.c:ce_memmove
  src/ordinal_stubs.c:ce_malloc src/ordinal_stubs.c:LocalFree
  src/ordinal_stubs.c:CloseHandle src/ordinal_stubs.c:GetFileSize
  src/ordinal_stubs.c:orduint_divmod
  src/ordinal_stubs.c:ce_toupper
  src/hud.c:draw_idle_mouse_cursor src/hud.c:save_cursor_background
  src/hud.c:erase_cursor_icon src/hud.c:decrement_cursor_hide_depth
  src/hud.c:cursor_show_idle_tick
  src/hud.c:warp_mouse_cursor src/hud.c:get_mouse_position
  src/graphics.c:rect_fill_or_save_restore src/graphics.c:set_draw_color)
target_sources(uw_test_automap PRIVATE support/automap_storage_fixture.c)

add_fixture_game_unit_test(weapon_ready
  src/hud.c:@DAT_000870d8 src/hud.c:@DAT_000870dc
  src/weapon_swing.c:@DAT_000870e0 src/weapon_swing.c:@DAT_000870e4
  src/weapon_swing.c:@DAT_000870e8
  src/weapon_swing.c:request_weapon_swing_graphic
  src/item_use.c:attach_picked_up_object_to_cursor
  src/item_use.c:@g_weapon_overlay_enabled
  src/hud.c:cursor_mode_button_click src/hud.c:set_hud_status_value
  src/item_use.c:ready_weapon src/item_use.c:unready_weapon
  src/inventory.c:toggle_weapon_ready
  src/weapon_swing.c:advance_action_animation_frame
  src/weapon_swing.c:weapon_swing_draw_tick)

add_fixture_game_unit_test(head_bob
  src/movement.c:@DAT_00086e38_backing src/movement.c:@DAT_00086e48_backing
  src/player.c:@DAT_00086e58_backing
  src/movement.c:movement_tick src/movement.c:apply_movement_tick
  src/player.c:trigger_view_transition src/player.c:update_current_view_from_subject
  src/3d.c:build_view_matrix src/3d.c:build_trig_tables
  src/3d.c:set_identity_matrix4x4 src/3d.c:multiply_matrix4x4
  src/ordinal_stubs.c:ordfloat_bits_to_float src/ordinal_stubs.c:ordfloat_float_to_bits
  src/ordinal_stubs.c:ordfloat_negate src/ordinal_stubs.c:ordfloat_mul
  src/ordinal_stubs.c:ordfloat_add src/ordinal_stubs.c:ordfloat_int_to_float2
  src/ordinal_stubs.c:ordfloat_float_to_double src/ordinal_stubs.c:ordfloat_double_to_float
  src/ordinal_stubs.c:ordfloat_double_mul2 src/ordinal_stubs.c:ordfloat_cos
  src/ordinal_stubs.c:ordfloat_sin)

# Independent expectations are bytes exported from the original UU.exe,
# including documented host adaptations. Compile the actual declarations.
file(GLOB game_string_sources CONFIGURE_DEPENDS "${PROJECT_SOURCE_DIR}/src/*.c")
set(static_strings_source "${CMAKE_CURRENT_BINARY_DIR}/static_strings_generated.c")
add_custom_command(OUTPUT "${static_strings_source}"
  COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tools/generate_static_strings.py"
    --root "${PROJECT_SOURCE_DIR}"
    --audit "${CMAKE_CURRENT_SOURCE_DIR}/fixtures/static_strings.json"
    --output "${static_strings_source}"
  DEPENDS ${game_string_sources} "${CMAKE_CURRENT_SOURCE_DIR}/tools/generate_static_strings.py"
    "${CMAKE_CURRENT_SOURCE_DIR}/fixtures/static_strings.json"
  VERBATIM)
add_library(uw_test_static_strings STATIC "${static_strings_source}")
uw_configure_test_target(uw_test_static_strings)
target_include_directories(uw_test_static_strings PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/support")
add_supported_game_unit_test(static_strings uw_test_static_strings)

add_fixture_game_unit_test(scroll_messages
  src/hud.c:@s_Not_a_spell_00085a80 src/item_use.c:@DAT_000878ec_backing
  src/item_use.c:@s_on_what__000878e0 src/item_use.c:@s_UNNAMED_00084f24
  src/player.c:@DAT_0008730c_backing
  src/hud.c:message_scroll_print_wrapped src/hud.c:msg_scroll_split_escape_segments
  src/hud.c:msg_scroll_split_newline_segments src/hud.c:msg_scroll_draw_wrapped_span
  src/hud.c:msg_scroll_wrap_split_line src/hud.c:print_not_a_spell_message
  src/item_use.c:prompt_use_item_on_target
  src/player.c:advance_character_level
  src/ordinal_stubs.c:ce_memmove src/ordinal_stubs.c:ce_strchr src/ordinal_stubs.c:ce_strrchr)
target_link_libraries(uw_test_scroll_messages PUBLIC uw_test_static_strings)
