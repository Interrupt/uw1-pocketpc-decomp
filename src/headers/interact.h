#ifndef HEADERS_INTERACT_H
#define HEADERS_INTERACT_H

/* Declarations for interact.c: object interaction dispatch (default
 * click, talk/look/use/attack). Pulls in uw.h itself so this header
 * is self-contained for any caller. */
#include "uw.h"

extern ushort DAT_001007c4;
extern char s__DATA_cnv_ark_00084fc8[];
extern ushort *DAT_0024cff0;
/* Globals defined in uw.c but also used by functions that now live in
   interact.c (object interaction dispatch) -- extern'd here so both
   translation units see the same storage. */
extern short DAT_000858c4;
extern char * DAT_002020b0;
extern short DAT_002020ac;
extern void (*const PTR_FUN_000858c8_table[5])(void);


void attempt_talk_interaction();
undefined4 target_in_range();
uint object_chain_max_barrier();
undefined4 target_line_of_sight();
ushort *pick_object_under_cursor();
void describe_picked_terrain();
int resolve_picked_terrain_texture(short pick, char **out_desc);
void finalize_object_pickup();
void interact_default();
void interact_talk_npc();
void interact_look();
void interact_use();
void interact_attack();
void trigger_terrain_discovery_illustration();
void trigger_inscription_illustration();
undefined4 roll_container_lockpick_check();
undefined4 roll_container_trap_disarm_check();
uint resolve_skill_gated_unlock_or_use();
undefined4 apply_trap_or_link_effect();
void purge_tagged_objects_from_chain();
void refresh_object_link_chain();

#endif
