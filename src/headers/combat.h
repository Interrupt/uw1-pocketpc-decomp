#ifndef HEADERS_COMBAT_H
#define HEADERS_COMBAT_H

/* Declarations for combat.c: NPC melee combat AI tick states. Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

extern undefined DAT_00202878;
extern unsigned char DAT_00084eff_backing[12];
#define DAT_00084eff DAT_00084eff_backing[0]
/* Globals defined in uw.c but also used by functions that now live in
   combat.c (NPC melee combat AI) -- extern'd here so both translation
   units see the same storage. */
extern byte DAT_001013f8;
extern char * DAT_00101400;
extern char * DAT_00101404;
extern char DAT_00101408;
extern byte DAT_0010140c;
extern char DAT_00101410;
extern undefined1 DAT_00101420;
extern int DAT_00101430;
extern char DAT_0010143c;
extern short DAT_00101444; /* signed fine-coordinate delta; ARM reads 16 bits */
extern short DAT_00101448; /* signed fine-coordinate delta; ARM reads 16 bits */
extern undefined4 DAT_00101734_backing[256];
#define DAT_00101734 DAT_00101734_backing[0]
extern char DAT_0010173c;
extern ushort DAT_00101900;
extern ushort * DAT_0010190c;
extern byte DAT_00101918;
extern undefined4 DAT_00101924;
extern byte DAT_001005fc;
extern undefined2 DAT_00100630_backing[32];
#define DAT_00100630 DAT_00100630_backing[0]
extern ushort DAT_00100610;
extern char *DAT_001005e4;
extern char *DAT_001005e0;


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
