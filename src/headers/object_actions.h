#ifndef HEADERS_OBJECT_ACTIONS_H
#define HEADERS_OBJECT_ACTIONS_H

/* Declarations for object_actions.c: object action dispatch, critter
 * sprite tier/page resolution, and placement/combination checks.
 * Pulls in uw.h itself so this header is self-contained for any
 * caller. */
#include "uw.h"

/* Globals defined in uw.c but also used by functions that now live in
   object_actions.c (object action dispatch, critter sprite tier/page,
   placement/combination checks) -- extern'd here so both translation
   units see the same storage. */
extern ushort DAT_002022f8;
extern int DAT_002022fc;
extern ushort DAT_00202508;
extern undefined1 DAT_0023ce70_backing[128];
#define DAT_0023ce70 DAT_0023ce70_backing[0]
#define DAT_0023ce71 DAT_0023ce70_backing[1]

extern char s_You_see_000858fc[];
extern undefined1 DAT_0023c3dc;
extern undefined1 DAT_0023c3d8;
extern undefined1 DAT_00087604_backing[256];
#define DAT_00087604 DAT_00087604_backing[0]
extern undefined *PTR_FUN_00087614_backing[64];
#define PTR_FUN_00087614 PTR_FUN_00087614_backing[0]


undefined4 decode_critter_sprite_page();
undefined4 resolve_critter_sprite_tier();
undefined4 init_monster_spawn_defaults();
void dispatch_object_action();
bool check_object_carry_weight();
void dispatch_object_action_dup();
undefined4 append_object_property_tag();
undefined4 append_object_special_name();
void look_at_inscribed_object();
void describe_object_owner();
void print_object_flavor_text();
void describe_special_object_property();
undefined4 identify_mushroom_type();
bool spawn_object_near_actor();
undefined4 check_object_drop_height();
void check_scheduled_object_location_callback();
void dispatch_tile_special_action();
undefined4 dispatch_special_action();
void reduce_item_quality_on_use();
void apply_targeted_spell_effect();
void *spawn_and_prime_spell_effect_object();
undefined4 force_unlock_target_object();
undefined4 cast_single_tile_spell_effect();
undefined4 cast_area_spell_effect();
bool trigger_type_flagged_trap_effect();
undefined4 trigger_tile_damage_trap_effect();
undefined4 morph_tile_object_state();
undefined4 trigger_permanent_object_state_effect();
void apply_tile_morph_variant_2();
void apply_tile_morph_variant_6();
void apply_tile_morph_variant_7();
void scan_area_for_matching_objects();
void scan_area_ahead_of_object();
void for_each_object_of_type();
void cast_cone_damage_spell();
void cast_targeted_search_effect();
void cast_summon_or_spawn_effect();
undefined4 spawn_random_variant_object_at_tile();
void report_detected_creatures_in_direction();
void cast_detect_life_spell();
void complete_pending_player_command_target();
void dispatch_player_command();
void damage_all_objects_at_tile();
undefined4 build_object_display_name();
undefined1 *format_object_display_name();
void print_scroll_message_by_id();
void print_scroll_message_concat();
undefined4 check_object_combination();
void complete_cast_spell_on_target();
undefined4 resolve_object_variant_or_special_link();
void clear_object_pending_special_flag();
void consume_linked_special_object_charge();
char compute_compass_direction();
void print_message_with_proximity_qualifier();
void spawn_effect_debris_burst();

#endif
