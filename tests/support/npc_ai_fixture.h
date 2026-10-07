#ifndef UW_TEST_NPC_AI_FIXTURE_H
#define UW_TEST_NPC_AI_FIXTURE_H
#include "unity.h"
#include "../npc_ai_test_globals.h"
undefined4 read_file_handle(int handle, void *buffer, int count);
long ce_rand(void);
int encode_object_slot_index(void *object);
void *get_object_record_by_slot_index(int slot);
void *tilemap_lookup(int x, int y);
undefined4 check_fine_line_of_sight(void);
undefined4 walk_using_cached_path(void);
undefined4 advance_cached_path_step(void);
void save_walk_path_to_cache_slot(void);
undefined4 creature_find_path_to_tile(void);
void set_npc_altitude_state(void);
void npc_arrival_interaction(void);
undefined4 tile_pair_los_blocked(int x0, int y0, int x1, int y1, int x2, int y2,
    int flags0, int flags1, int height, byte *height_out, byte *scratch);
void npc_idle_behavior_tick(void);
void npc_wander_return_home_tick(void);
void npc_wander_return_home_exact_tick(void);
void npc_combat_approach_tick(void);
void npc_combat_position_tick(void);
void npc_combat_disengage_tick(void);
void npc_clear_special_goal(void);
undefined4 check_npc_morale_flee(void);
undefined4 check_npc_target_alignment(void);
byte tile_is_no_magic(void);
undefined4 try_npc_special_ability_alt(void);
undefined4 try_npc_special_ability_no_los(void);
undefined4 try_npc_special_ability_ranged(void);
void build_object_placement_snapshot(void);
int build_collision_height_field_for_object(void);
undefined4 apply_placement_collision_sweep(void);
undefined4 sync_object_tile_position(void);
undefined4 resolve_unique_npc_special_behavior(void);
void object_list_unlink(void);
void spawn_creature_death_loot(void);
void drop_monster_loot(void);
void drop_creature_inventory_on_death(void);
void free_object_slot(void);
int compute_vertical_aim_offset(void);
void spawn_npc_thrown_weapon(void);
void dispatch_tile_special_action(uint action, uintptr_t actor, intptr_t context);
byte get_current_music_track(void);
void set_pending_music_track(void);
uint read_realtime_clock_units(void);
undefined4 play_positional_sound_effect(void);
int resolve_npc_melee_attack(ushort *actor, int swing, int direction, int style, int skill);
void set_position(ushort *object, int x, int y);
byte *npc_bytes(void);
void npc_ai_fixture_reset(void);
void npc_ai_fixture_dispose(void);
#endif
