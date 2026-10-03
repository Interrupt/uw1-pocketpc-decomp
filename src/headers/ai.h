#ifndef HEADERS_AI_H
#define HEADERS_AI_H

/* Declarations for ai.c: NPC AI (per-tick dispatch, pathfinding,
 * movement, tile-position sync, mobile<->immobile settle). Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

extern ushort DAT_0024fa18;
extern short DAT_0010061c;
extern short DAT_00100608;
/* Globals defined in uw.c but also used by functions that now live in
   ai.c (NPC AI) -- extern'd here so both translation units see the
   same storage. */
extern undefined DAT_00084f20_backing[8192];

#define DAT_001007d5 DAT_001007d0_backing[0x5]
#define DAT_001007d9 DAT_001007d0_backing[0x9]
/* OBJECTS.DAT monster records are loaded at DAT_001007d0, stride 0x30.
   These original addresses are fields of that same table: max HP (+4),
   flags (+0xa), defense (+0x12), perception (+0x1d). Separate backing
   arrays left these fields zero even after load_monster_combat_stats. */
#define g_monster_max_stats_table DAT_001007d0_backing[0x4]
#define DAT_001007da DAT_001007d0_backing[0xa]
#define DAT_001007e2 DAT_001007d0_backing[0x12]
#define DAT_001007ed DAT_001007d0_backing[0x1d]
#define DAT_001007ee DAT_001007d0_backing[0x1e] // per-class perception-range byte (>>4), read by alert_npc_to_noise_callback
/* Monster effect flags at offset 8 of each loaded 0x30-byte record. */
#define DAT_001007d8 DAT_001007d0_backing[8]
#define DAT_001007f8 DAT_001007d0_backing[0x28] /* per-class XP, 16 bits; loaded monster table */

#define DAT_00084f20 DAT_00084f20_backing[0]
extern undefined1 DAT_001007d0_backing[6144];
#define DAT_001007d0 DAT_001007d0_backing[0]
extern undefined4 DAT_001013fc;
extern ushort DAT_00101414;
extern ushort DAT_0010141c;
extern char * DAT_00101438;
extern undefined4 DAT_00101560;
extern void * DAT_0010172c;
extern char * DAT_00101904;
extern ushort DAT_00101910;
extern undefined4 DAT_0010191c;
extern char DAT_00101928;
extern short DAT_00101938;
extern short DAT_0010193c;
extern undefined4 DAT_00101944;
extern undefined2 DAT_00101418;
extern undefined2 DAT_00101908;
/* "Last attacker" record, confirmed via check_npc_morale_flee's own use
   (src/ai.c ~3230): a saved snapshot of who last attacked the current
   NPC (tile x/y/heading + slot index + class id), with an expiry
   timestamp so the alert reaction only fires while it's still recent.
   Persisted to/from the save-game block (DAT_00086df8+0xba..0xc1) by
   load_last_attacker_record/save_last_attacker_record. */
extern byte DAT_0010192c; // last attacker's tile x
extern byte DAT_00101930; // last attacker's tile y
extern undefined1 DAT_00101934; // last attacker's heading
extern char DAT_0010194c; // last attacker's object slot index
extern char DAT_000853d0; // last attacker's class id
extern int DAT_00101940; // game-clock timestamp the attack was recorded at
extern undefined1 DAT_0023c460_backing[32768];
#define DAT_0023c460 DAT_0023c460_backing[0]


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
int mobile_object_tick(); // was FUN_0002b47c
undefined4 npc_ai_tick(); // was FUN_00032d38
undefined4 object_tick_is_due(); // was FUN_0003495c
void tick_mobile_objects(); // was FUN_000349bc
void build_object_placement_snapshot(); // was FUN_00054a00
undefined4 sync_object_tile_position(); // was FUN_00054f6c
ushort *settle_mobile_to_immobile(); // was FUN_0005596c

#endif
