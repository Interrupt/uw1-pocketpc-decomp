#ifndef UW_TEST_NPC_AI_FIXTURE_H
#define UW_TEST_NPC_AI_FIXTURE_H
#include "unity.h"
#include "../npc_ai_test_globals.h"
int read_file_handle(int handle, void *buffer, uint count);
long ce_rand(void);
int encode_object_slot_index(char *object);
void *get_object_record_by_slot_index(short slot);
void *tilemap_lookup(short x, short y);
int check_fine_line_of_sight(uint from_x, uint from_y, uint from_z, short to_x, short to_y, short to_z);
int walk_using_cached_path(byte *cache_record);
int advance_cached_path_step(char *record);
void save_walk_path_to_cache_slot(byte *record);
int creature_find_path_to_tile(int start_x, char start_y, byte size_class, char goal_x, char goal_y, char goal_sub_x, byte goal_sub_y);
void set_npc_altitude_state(byte tile_x, byte tile_y);
void npc_arrival_interaction(ushort *npc);
undefined4 tile_pair_los_blocked(int x0, int y0, int x1, int y1, int x2, int y2,
    int flags0, int flags1, int height, byte *height_out, byte *scratch);
void npc_idle_behavior_tick(void);
void npc_wander_return_home_tick(void);
void npc_wander_return_home_exact_tick(void);
void npc_combat_approach_tick(void);
void npc_combat_position_tick(void);
void npc_combat_disengage_tick(void);
void npc_clear_special_goal(void);
int check_npc_morale_flee(uint morale_stat, uint current_hp, uint hp_margin, uint flee_threshold);
int check_npc_target_alignment(int mode);
byte tile_is_no_magic(int tile_x, int tile_y);
int try_npc_special_ability_alt(void);
int try_npc_special_ability_no_los(void);
int try_npc_special_ability_ranged(void);
void build_object_placement_snapshot(void);
int build_collision_height_field_for_object(ushort *object);
int apply_placement_collision_sweep(intptr_t snapshot, intptr_t sweep_flags);
int sync_object_tile_position(ushort *object, ushort *position);
int resolve_unique_npc_special_behavior(char *npc, int event_mode);
void object_list_unlink(byte *link_field, byte *object);
void spawn_creature_death_loot(ushort *creature);
void drop_monster_loot(byte *monster, ushort gold_nibble, ushort item_nibble);
void drop_creature_inventory_on_death(byte *creature);
void free_object_slot(char *object);
int compute_vertical_aim_offset(short has_target, int target);
void spawn_npc_thrown_weapon(char *attacker, short launch_offset, short launch_flags);
void dispatch_tile_special_action(uint tile_type, uintptr_t actor, intptr_t target);
byte get_current_music_track(void);
void set_pending_music_track(byte track);
uint read_realtime_clock_units(void);
int play_positional_sound_effect(uint sound_id, short world_x, short world_y, uint volume_bias);
int resolve_npc_melee_attack(byte *actor, short swing, byte direction, short style, short skill);
void set_position(ushort *object, int x, int y);
byte *npc_bytes(void);
void npc_ai_fixture_reset(void);
void npc_ai_fixture_dispose(void);
#endif
