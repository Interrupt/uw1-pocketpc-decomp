#ifndef HEADERS_TRAPS_H
#define HEADERS_TRAPS_H

/* Declarations for traps.c: tile trap/link "type" effect dispatch.
 * Pulls in uw.h itself so this header is self-contained for any
 * caller. */
#include "uw.h"

undefined4 apply_area_terrain_effect(short tile_x, int tile_y, short wall_texture, short height_value, short height_adjust, short floor_texture, short width, short height_extent, short mode);
undefined4 apply_poison_or_damage_trap_effect(int object_slot, uint damage_delta, undefined4 unused_a, undefined4 unused_b);
undefined4 dispatch_trap_special_or_tile_action(undefined1 context_x, undefined1 context_y, int tile_x, int tile_y, ushort action_id, undefined1 argument);
void handle_level4_maze_puzzle_button(short button, int tile_x, int tile_y);
void try_combine_shrine_markers(undefined4 unused, int tile_x, int tile_y);
void emit_player_noise_alert(undefined1 noise_type);
void apply_quest_event_numeric_effect(int context_type, char *record, int tile_x, int tile_y);
void trigger_exploding_book_trap(void);
void trigger_exploding_book_trap_at_tile(undefined4 unused, int tile_x, int tile_y);
void trigger_scripted_npc_conversation(void);
void advance_scheduler_and_show_page3(void);
undefined4 unlink_object_from_tile_callback(char *object);
void trigger_quest_milestone_cleanup_event(void);
int resolve_lock_difficulty_rating(ushort *lock);
uint attempt_pick_lock(ushort *lock, int skill, undefined2 *out_difficulty);
void spawn_trap_hazard_object(int trap_record, undefined2 tile_x, undefined2 tile_y);
int dispatch_trap_type_effect(ushort *trap_record, int tile_x, int tile_y);
undefined4 reset_object_ui_state_callback(char *object);
undefined4 dispatch_quest_event_code(char *trap_record, int tile_x, int tile_y);
undefined4 create_scripted_trap_pair_at_tile(int tile_x, int tile_y, uint code);
void remove_trap_chain_marker(char *link_field, char *trap_object);
void free_trap_class_object(char *link_field, byte *trap_object);
undefined4 check_object_area_for_spawn_block(ushort *object);
undefined4 is_out_of_player_range(int target_present, short tile_x, short tile_y);
void process_nearby_background_traps(int target_present);
void tick_ambient_doors_and_scheduler(int target_present);

#endif
