#ifndef HEADERS_ITEM_USE_H
#define HEADERS_ITEM_USE_H

/* Declarations for item_use.c: weapon ready/unready, drop/pickup,
 * light sources, food, combine/stow. Pulls in uw.h itself so this
 * header is self-contained for any caller. */
#include "uw.h"

extern undefined DAT_00085ce0_backing[32];
#define DAT_00085ce0 DAT_00085ce0_backing[0]
extern char s_You_read_the_00085ce8[];
/* Globals defined in uw.c but also used by functions that now live in
   item_use.c (item use) -- extern'd here so both translation units
   see the same storage. */
extern undefined1 DAT_00202a28_backing[256];
#define g_food_effect_table DAT_00202a28_backing[0]
extern undefined4 g_weapon_overlay_enabled;
extern char s_UNNAMED_00084f24[];
extern char *DAT_00202098;


int objects_are_combinable();
undefined4 spawn_combined_object();
bool is_object_consumed_in_combination();
undefined4 check_offering_container_puzzle();
undefined4 try_climb_wall();
void use_lockpick_on_object();
void ready_weapon();
void unready_weapon();
void handle_object_drop_target();
bool place_object_in_equipment_slot();
void redraw_backpack_slot_widget();
undefined4 place_object_in_backpack_slot();
int find_or_assign_object_widget();
ushort *find_equipped_item_by_category();
char *find_object_in_link_chain();
ushort *resolve_clicked_inventory_item();
ushort *get_equipped_item_at_widget_slot();
void deplete_object_count();
void decrement_object_count();
undefined4 reduce_object_count();
ushort *extract_clicked_backpack_item();
ushort *extract_ammo_and_refresh();
ushort *extract_and_refresh_slot_item();
ushort *extract_matching_object_from_slot();
void attach_picked_up_object_to_cursor();
undefined4 load_armor_overlay_frame();
void redraw_armor_overlay_widgets();
void swap_cursor_and_slot_item();
undefined1 *prompt_split_object_stack();
uint check_object_fits_in_slot();
void handle_backpack_slot_click();
undefined4 place_held_item_in_empty_slot();
undefined4 objects_can_stack();
undefined4 handle_backpack_slot_interact();
bool compute_drop_aim_from_cursor();
undefined4 drop_held_object_near_player();
undefined4 drop_object_near_target();
ushort *use_object_on_target();
bool finish_object_use();
short *begin_holding_object_on_cursor();
void complete_use_reagent_on_player();
void complete_use_item_on_player(ushort *param_1, int param_2);
void arm_use_item_on_player_prompt();
void prompt_use_item_on_target(ushort *param_1, code *param_2);
void complete_use_item_on_special_target();
void arm_use_item_on_special_target_prompt();
void complete_use_item_on_quest_target();
void complete_use_item_on_container();
void complete_use_item_skill_check();
void arm_use_item_on_target_prompt();
undefined4 apply_random_roll_to_matched_object();
void complete_use_item_special_quest_event();
void complete_use_item_on_flagged_tile();
void dispatch_use_held_item_by_type();
void use_light_source();
void refuel_light_source_item();
undefined4 use_food_item();
void complete_use_item_scatter_spawn();
void complete_use_item_fill_flask();
void dispatch_use_special_item_by_type();
void use_readable_item();
void dispatch_world_object_interaction_by_family();
undefined4 trigger_object_use_babl_script();
void trigger_object_trap_or_use_action();
void try_combine_or_stow_object();

#endif
