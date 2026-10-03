#ifndef HEADERS_AI_H
#define HEADERS_AI_H

/* Declarations for ai.c: NPC AI (per-tick dispatch, pathfinding,
 * movement, tile-position sync, mobile<->immobile settle). Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

void drop_monster_loot();
undefined4 tile_pair_los_blocked();
undefined4 creature_find_path_to_tile();
void reconstruct_path_from_bfs();
int try_direct_line_walk();
undefined4 check_fine_line_of_sight();
undefined4 record_line_walk_step();
undefined4 pop_pending_path_cache_slot();
void reset_npc_path_cache();
void save_walk_path_to_cache_slot();
undefined4 advance_cached_path_step();
undefined4 check_path_cache_position_match();
undefined4 walk_using_cached_path();
void handle_blocked_cached_path();
undefined4 compute_movement_heading();
void npc_set_walk_target();
void npc_walk_toward_tile();
void set_npc_altitude_state();
void npc_arrival_interaction();
void npc_idle_behavior_tick();
void npc_wander_return_home_tick();
void npc_notice_and_idle_tick();
void npc_wander_reposition();
void npc_react_to_nearby_player();
void npc_wander_return_home_exact_tick();
undefined4 detect_npc_wander_proximity();
int compute_vertical_aim_offset();
void setup_npc_ai_tick_state();
void npc_ai_default_tick();
undefined4 refresh_npc_target_delta();
undefined4 check_npc_morale_flee();
int compute_pathfind_search_radius();
void npc_set_goal();
void npc_clear_special_goal();
undefined4 initiate_npc_death(char *param_1);
undefined4 handle_monster_death(char *param_1);
void npc_set_goal_for_object();
void randomize_active_npc_flags();
undefined4 resolve_tile_entry_offset();
void npc_movement_tick();
undefined4 settle_misplaced_mobile_object();
void advance_mobile_objects();
undefined4 spawn_rest_interrupt_monster_callback();
undefined4 check_rest_interrupted_by_monster();
void load_last_attacker_record();
void save_last_attacker_record();
void clear_last_attacker_record();
undefined4 alert_npc_to_noise_callback();
void emit_noise_alert();
undefined4 resolve_unique_npc_special_behavior();
undefined4 load_critter_association_tables();
void flush_pending_critter_resource_slots();
void build_creature_look_text();
void spawn_npc_thrown_weapon();
undefined4 roll_object_destroy_chance();
void drop_creature_inventory_on_death();
void spawn_creature_treasure_drop();
void spawn_creature_special_item_drop();
void spawn_creature_equipment_drop();
void spawn_creature_misc_item_drop();
void spawn_creature_death_loot();
undefined4 activate_area_hazard_object();

#endif
