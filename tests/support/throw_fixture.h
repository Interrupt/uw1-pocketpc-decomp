#ifndef UW_TEST_THROW_FIXTURE_H
#define UW_TEST_THROW_FIXTURE_H
#include "unity.h"
#include "../throw_test_globals.h"
short fine(ushort *object, int offset);
void *alloc_object_slot(int mobile);
void free_object_slot(char *object);
int encode_object_slot_index(char *object);
void *tilemap_lookup(short x, short y);
void *resolve_object_link(ushort *head);
void *get_object_record_by_slot_index(short slot);
void get_mouse_position(short *x, short *y);
long ce_rand(void);
void angle_to_screen_delta(uint heading, short *x, short *y);
void collision_build_height_field(uint step_limit);
void collision_height_envelope(int mode, int collision);
void resolve_wall_slide_corner(void);
undefined4 check_object_drop_height(void);
int object_ptr_in_arena(char *object);
undefined4 play_sound_effect_at_object(void);
undefined4 play_sound_effect_with_pan(void);
int apply_typed_damage_to_object(ushort *target, ushort *attacker, int tile_x, short tile_y, byte damage, byte damage_type);
undefined4 roll_object_destroy_chance(void);
int spawn_scheduled_effect_object(ushort *source_object, int effect_group, int delay, byte animation_offset, short heading_adjust, short tile_x, short tile_y);
void print_scroll_message_by_id(void);
void set_pending_update_flags(ushort flags);
void spawn_effect_debris_burst(void);
void scheduler_relink_entry(char *new_object, char *old_object);
void set_ambient_bias_without_light(char light_level);
undefined4 activate_area_hazard_object(void);
ushort *discard_misplaced_object(char *list, ushort *object, int destroy);
ushort *settle_dropped_object(ushort *object, short x, short y, int mode);
ushort *reallocate_object_to_arena(ushort *object);
void project_position_by_heading(int heading, short distance, short *x, short *y);
int check_object_placement_clearance(short catalog_type, short ignore_slot, short position_x, short position_y, short height, int check_mode, byte step_limit);
int compute_floor_height_at_position(ushort x_in_tile, ushort y_in_tile);
int resolve_collision_candidate_interaction(short contact, int slot);
void randomize_settled_snapshot_position(char *snapshot);
void object_list_append_tail(byte *link_field, char *object);
undefined4 play_positional_sound_effect(void);
bool apply_swim_wade_pose(ushort collision_mask);
void throw_fixture_reset(void);
void throw_fixture_dispose(void);
void launch(void);
void tick(void);
#endif
