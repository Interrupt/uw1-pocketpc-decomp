#ifndef UW_TEST_THROW_FIXTURE_H
#define UW_TEST_THROW_FIXTURE_H
#include "unity.h"
#include "../throw_test_globals.h"
short fine(ushort *object, int offset);
void *alloc_object_slot(int mobile);
void free_object_slot(void *object);
int encode_object_slot_index(void *object);
void *tilemap_lookup(int x, int y);
void *resolve_object_link(ushort *head);
void *get_object_record_by_slot_index(int slot);
void get_mouse_position(short *x, short *y);
long ce_rand(void);
void angle_to_screen_delta(uint heading, short *x, short *y);
void collision_build_height_field(int step);
void collision_height_envelope(void);
void resolve_wall_slide_corner(void);
undefined4 check_object_drop_height(void);
undefined4 object_ptr_in_arena(void);
undefined4 play_sound_effect_at_object(void);
undefined4 play_sound_effect_with_pan(void);
undefined4 apply_typed_damage_to_object(void);
undefined4 roll_object_destroy_chance(void);
undefined4 spawn_scheduled_effect_object(void);
void print_scroll_message_by_id(void);
void set_pending_update_flags(void);
void spawn_effect_debris_burst(void);
void scheduler_relink_entry(void);
void set_ambient_bias_without_light(void);
undefined4 activate_area_hazard_object(void);
ushort *discard_misplaced_object(void *list, ushort *object, int destroy);
ushort *settle_dropped_object(ushort *object, int x, int y, int mode);
ushort *reallocate_object_to_arena(void);
void project_position_by_heading(int heading, short distance, short *x, short *y);
undefined4 check_object_placement_clearance(void);
int compute_floor_height_at_position(void);
undefined4 resolve_collision_candidate_interaction(int contact, int slot);
void randomize_settled_snapshot_position(void);
void object_list_append_tail(void);
undefined4 play_positional_sound_effect(void);
bool apply_swim_wade_pose(void);
void throw_fixture_reset(void);
void throw_fixture_dispose(void);
void launch(void);
void tick(void);
#endif
