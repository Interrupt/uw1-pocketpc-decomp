#ifndef HEADERS_TRAPS_H
#define HEADERS_TRAPS_H

/* Declarations for traps.c: tile trap/link "type" effect dispatch.
 * Pulls in uw.h itself so this header is self-contained for any
 * caller. */
#include "uw.h"

undefined4 apply_area_terrain_effect();
undefined4 apply_poison_or_damage_trap_effect();
undefined4 dispatch_trap_special_or_tile_action();
void handle_level4_maze_puzzle_button();
void try_combine_shrine_markers();
void emit_player_noise_alert();
void apply_quest_event_numeric_effect();
void trigger_exploding_book_trap();
void trigger_exploding_book_trap_at_tile();
void trigger_scripted_npc_conversation();
void advance_scheduler_and_show_page3();
undefined4 unlink_object_from_tile_callback();
void trigger_quest_milestone_cleanup_event();
int resolve_lock_difficulty_rating();
uint attempt_pick_lock();
void spawn_trap_hazard_object();
int dispatch_trap_type_effect();
undefined4 reset_object_ui_state_callback();
undefined4 dispatch_quest_event_code();
undefined4 create_scripted_trap_pair_at_tile();
void remove_trap_chain_marker();
void free_trap_class_object();
undefined4 check_object_area_for_spawn_block(ushort *object);
undefined4 is_out_of_player_range();
void process_nearby_background_traps();
void tick_ambient_doors_and_scheduler();

#endif
