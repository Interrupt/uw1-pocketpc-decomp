#ifndef HEADERS_COMBAT_H
#define HEADERS_COMBAT_H

/* Declarations for combat.c: NPC melee combat AI tick states. Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

undefined4 resolve_combat_hit_zone();
int find_nearest_hit_target(short *param_1);
void spawn_blood_splat_object();
undefined4 resolve_melee_swing_hit();
int resolve_weapon_hit_skill_check();
void apply_melee_damage();
undefined4 play_weapon_impact_sound();
void compute_attack_relative_facing(void);
undefined4 process_melee_attack_swing();
undefined4 resolve_equipped_weapon_attack();
void compute_player_weapon_attack_stats();
void apply_direct_object_hit();
int resolve_npc_melee_attack();
void award_monster_kill_experience();
void load_combat_data_file();
void load_monster_combat_stats();
void npc_combat_approach_tick();
void npc_combat_engage_close_tick();
undefined4 npc_combat_set_stance();
undefined4 try_npc_special_ability_no_los();
undefined4 try_npc_special_ability_ranged();
undefined4 try_npc_special_ability_alt();
void npc_combat_engage_wide_tick();
void npc_combat_position_tick();
uint adjust_heading_away_from_player();
void npc_combat_disengage_tick();
undefined4 check_npc_target_alignment();
undefined4 check_npc_fine_facing_alignment();
undefined4 apply_damage_to_object();
undefined4 resolve_damage_type_resistance();
undefined4 apply_typed_damage_to_object();
bool apply_object_durability_damage();
undefined4 is_valid_equipment_slot_item();
undefined4 damage_equipped_item_in_slot();
undefined4 add_active_light_source();
undefined4 apply_object_collision_scatter(ushort *param_1, ushort *param_2);
void apply_trap_type_damage_effect();
undefined4 resolve_collision_candidate_interaction();

#endif
