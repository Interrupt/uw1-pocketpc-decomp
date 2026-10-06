# Pointer parameter and prototype audit

Audit on 2026-10-05, using the native 64-bit Clang compile commands for `uw_dbg`.
This is a list of review candidates, not a list of confirmed crashes. No bulk
signature changes have been made.

Run from the repository root:

```sh
cmake -S . -B build -DBUILD_TESTING=ON -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
python3 tools/audit_pointer_parameters.py
```

The complete machine-readable findings are written to
`build/pointer-parameter-audit.json`, including explicit pointer narrowing casts,
integer parameters used to form addresses, and compiler prototype diagnostics.
The script compares direct call arguments against definitions across translation
units, so non-prototype declarations do not hide these mismatches.

Current results: 43 translation units, 1565 definitions,
90 pointer argument / narrow parameter mismatches,
300 explicit pointer narrowing casts,
and 106 distinct integer parameters used to form addresses
(553 expression findings).
There are 1783 distinct `-Wstrict-prototypes` diagnostics and
7202 distinct `-Wdeprecated-non-prototype` diagnostics; repeated identical
header diagnostics across translation units are removed.

Strict prototype warnings can be enabled for auditing now. Enforcing them as
errors, or replacing all `f()` declarations with `f(void)`, would break the
current build. Each header needs the verified argument list. K&R definitions
can be converted without moving functions, but their default argument
promotions and callback conventions must also be preserved (notably `short`
and `char` arguments). A typed prototype does not make an incorrect `int`
object parameter safe.

Known limitations: this does not fully trace integer forwarding, address
arithmetic narrowed before calls, indirect calls, or mismatched return types.
Some pointer-typed values in decompiled code actually represent numeric IDs or
handles. Consult ARM/Ghidra and add regression coverage before changing them.

The fountain/bedroll regressions verified actor/target address forwarding at
ARM 0x39d24/0x39d48 and 0x7b99c, scan callback invocation at 0x749e4,
and the scanned object address at 0x352d4. These signatures now preserve native
addresses. The bedroll mode gate also now reads byte offset 8, matching
0x7b7b8..0x7b7c0. Seven `special_use` cases cover actual level 1 item records,
healing limits, tile healing dispatch, safe rest and hostile detection. Rest
UI and time advancement remain fixture boundaries.

Direct call candidates remaining after those fixes:

| Call site | Function | Parameter | Definition type | Pointer source type |
| --- | --- | --- | --- | --- |
| src/game.c:230 | `spawn_message_dispatch_thread` | param_2 | `unsigned int` | `unsigned short *` |
| src/chargen.c:381 | `read_file_handle` | param_1 | `int` | `char *` |
| src/chargen.c:383 | `CloseHandle` | handle | `int` | `char *` |
| src/chargen.c:397 | `read_file_handle` | param_1 | `int` | `char *` |
| src/chargen.c:398 | `CloseHandle` | handle | `int` | `char *` |
| src/babl.c:2591 | `collect_included_player_barter_items` | param_1 | `int` | `short *` |
| src/babl.c:2591 | `collect_included_player_barter_items` | param_2 | `int` | `short *` |
| src/babl.c:2627 | `collect_included_player_barter_items` | param_1 | `int` | `short *` |
| src/babl.c:2627 | `collect_included_player_barter_items` | param_2 | `int` | `short *` |
| src/babl.c:2677 | `collect_included_player_barter_items` | param_1 | `int` | `short *` |
| src/babl.c:2677 | `collect_included_player_barter_items` | param_2 | `int` | `short *` |
| src/babl.c:2725 | `collect_included_player_barter_items` | param_1 | `int` | `undefined1 *` |
| src/babl.c:2725 | `collect_included_player_barter_items` | param_2 | `int` | `short *` |
| src/babl.c:2789 | `collect_included_player_barter_items` | param_1 | `int` | `short *` |
| src/babl.c:2789 | `collect_included_player_barter_items` | param_2 | `int` | `short *` |
| src/babl.c:3816 | `handle_barter_slot_click` | param_3 | `int` | `undefined2 *` |
| src/babl.c:3816 | `handle_barter_slot_click` | param_4 | `int` | `undefined4 *` |
| src/babl.c:3892 | `handle_barter_slot_click` | param_3 | `int` | `undefined2 *` |
| src/babl.c:3892 | `handle_barter_slot_click` | param_4 | `int` | `undefined4 *` |
| src/babl.c:3909 | `handle_barter_slot_click` | param_3 | `int` | `undefined2 *` |
| src/babl.c:3909 | `handle_barter_slot_click` | param_4 | `int` | `undefined4 *` |
| src/combat.c:1561 | `play_sound_effect_at_object` | param_2 | `int` | `ushort *` |
| src/player.c:2445 | `ordint_divmod` | dividend | `int` | `char *` |
| src/player.c:2475 | `draw_text_string` | param_3 | `short` | `char *` |
| src/player.c:2476 | `draw_text_string` | param_3 | `short` | `char *` |
| src/player.c:2506 | `draw_text_string` | param_2 | `short` | `char *` |
| src/player.c:2508 | `draw_text_string` | param_2 | `short` | `char *` |
| src/player.c:3533 | `fade_active_palette_to_black` | param_1 | `int` | `undefined1 *` |
| src/objects.c:204 | `play_sound_effect_at_object` | param_2 | `int` | `ushort *` |
| src/objects.c:403 | `free_trap_class_object` | param_1 | `unsigned int` | `char *` |
| src/objects.c:649 | `reset_burnt_out_item_state` | param_1 | `unsigned int` | `char *` |
| src/objects.c:2068 | `scheduler_relink_entry` | param_1 | `unsigned int` | `ushort *` |
| src/objects.c:2068 | `scheduler_relink_entry` | param_2 | `unsigned int` | `ushort *` |
| src/hud.c:2141 | `wait_for_click_to_continue` | param_1 | `short` | `char *` |
| src/ai.c:1142 | `play_sound_effect_at_object` | param_2 | `int` | `ushort *` |
| src/ai.c:1179 | `randomize_settled_snapshot_position` | param_1 | `int` | `ushort *` |
| src/ai.c:1351 | `scheduler_relink_entry` | param_1 | `unsigned int` | `ushort *` |
| src/ai.c:1351 | `scheduler_relink_entry` | param_2 | `unsigned int` | `ushort *` |
| src/ai.c:3680 | `settle_misplaced_mobile_object` | param_1 | `int` | `ushort *` |
| src/ai.c:4195 | `read_file_handle` | param_1 | `int` | `undefined1 *` |
| src/ai.c:4200 | `CloseHandle` | handle | `int` | `undefined1 *` |
| src/interact.c:382 | `refresh_object_link_chain` | param_1 | `unsigned int` | `ushort *` |
| src/interact.c:382 | `refresh_object_link_chain` | param_2 | `int` | `byte *` |
| src/interact.c:499 | `refresh_object_link_chain` | param_1 | `unsigned int` | `char *` |
| src/interact.c:499 | `refresh_object_link_chain` | param_2 | `int` | `char *` |
| src/traps.c:100 | `spawn_trap_hazard_object` | param_1 | `int` | `ushort *` |
| src/traps.c:103 | `dispatch_quest_event_code` | param_1 | `int` | `ushort *` |
| src/traps.c:135 | `check_object_area_for_spawn_block` | param_1 | `unsigned int` | `ushort *` |
| src/traps.c:620 | `refresh_object_link_chain` | param_1 | `unsigned int` | `char *` |
| src/traps.c:620 | `refresh_object_link_chain` | param_2 | `int` | `ushort *` |
| src/traps.c:643 | `refresh_object_link_chain` | param_2 | `int` | `byte *` |
| src/traps.c:646 | `remove_trap_chain_marker` | param_2 | `int` | `byte *` |
| src/scheduler.c:654 | `scheduler_get_delay` | param_1 | `unsigned int` | `ushort *` |
| src/item_use.c:836 | `dispatch_use_held_item_by_type` | param_1 | `unsigned int` | `ushort *` |
| src/item_use.c:1746 | `arm_use_item_on_special_target_prompt` | param_1 | `unsigned int` | `ushort *` |
| src/item_use.c:1956 | `consume_linked_special_object_charge` | param_1 | `int` | `ushort *` |
| src/item_use.c:1987 | `refresh_object_link_chain` | param_1 | `unsigned int` | `ushort *` |
| src/item_use.c:1987 | `refresh_object_link_chain` | param_2 | `int` | `ushort *` |
| src/item_use.c:3630 | `deplete_object_count` | param_1 | `unsigned int` | `ushort *` |
| src/movement.c:1636 | `play_sound_effect_with_pan` | param_2 | `unsigned char` | `char *` |
| src/movement.c:2165 | `ordint_divmod` | dividend | `int` | `char *` |
| src/input.c:1475 | `project_position_by_heading` | param_2 | `short` | `char *` |
| src/object_actions.c:132 | `identify_mushroom_type` | param_2 | `int` | `undefined1 *` |
| src/object_actions.c:470 | `identify_mushroom_type` | param_2 | `int` | `undefined1 *` |
| src/object_actions.c:1600 | `ordint_divmod` | dividend | `int` | `char *` |
| src/doors.c:345 | `scheduler_get_delay` | param_1 | `unsigned int` | `ushort *` |
| src/doors.c:347 | `scheduler_set_delay` | param_1 | `unsigned int` | `ushort *` |
| src/models.c:2280 | `ordfloat_int_to_float2` | x | `int` | `undefined4 ***` |
| src/registration.c:304 | `check_registration_key_dialog` | param_1 | `unsigned int` | `char *` |
| src/audio.c:696 | `check_secret_tune_match` | param_1 | `int` | `char *` |
| src/audio.c:1028 | `load_and_resample_wave_file` | param_3 | `unsigned int` | `char *` |
| src/audio.c:1732 | `resize_mod_channel_state_array` | param_1 | `int` | `undefined1 *` |
| src/audio.c:1740 | `resize_mod_instrument_array` | param_1 | `int` | `undefined1 *` |
| src/audio.c:1752 | `read_mod_word_length_field` | param_1 | `unsigned int` | `undefined1 *` |
| src/audio.c:1752 | `read_mod_word_length_field` | param_2 | `int` | `undefined1 *` |
| src/audio.c:1779 | `read_mod_word_length_field` | param_1 | `unsigned int` | `undefined1 *` |
| src/audio.c:1779 | `read_mod_word_length_field` | param_2 | `int` | `undefined1 *` |
| src/audio.c:1785 | `read_mod_word_length_field` | param_1 | `unsigned int` | `undefined1 *` |
| src/audio.c:1785 | `read_mod_word_length_field` | param_2 | `int` | `undefined1 *` |
| src/audio.c:1817 | `resize_mod_int_array` | param_1 | `int` | `undefined1 *` |
| src/audio.c:1834 | `resize_mod_pattern_array` | param_1 | `int` | `undefined1 *` |
| src/audio.c:2149 | `queue_mod_audio_buffer` | param_1 | `int` | `char *` |
| src/audio.c:2150 | `queue_mod_audio_buffer` | param_1 | `int` | `char *` |
| src/audio.c:2222 | `resize_mod_int_array` | param_1 | `int` | `undefined1 *` |
| src/audio.c:2223 | `resize_mod_int_array` | param_1 | `int` | `undefined1 *` |
| src/audio.c:2924 | `ordfloat_int_to_float2` | x | `int` | `int *` |
| src/audio.c:3449 | `register_default_atexit_handler` | param_1 | `unsigned int` | `void (*)()` |
| src/audio.c:3467 | `init_sound_channel_slot` | param_1 | `int` | `undefined *` |
| src/audio.c:3488 | `release_sound_channel_slot` | param_1 | `int` | `undefined1 *` |
| src/ordinal_stubs.c:584 | `handle_keyboard_message` | param_1 | `unsigned int` | `void *` |
