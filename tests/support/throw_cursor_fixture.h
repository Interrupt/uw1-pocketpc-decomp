#ifndef UW_TEST_THROW_CURSOR_FIXTURE_H
#define UW_TEST_THROW_CURSOR_FIXTURE_H
#include "unity.h"
#include "../throw_cursor_test_globals.h"
short world_x(ushort *object);
short world_y(ushort *object);
short fine(ushort *object, int offset);
void *alloc_object_slot(int mobile);
void free_object_slot(void *object);
int encode_object_slot_index(void *object);
void *tilemap_lookup(short x, short y);
void *resolve_object_link(ushort *head);
void heading_to_sine_cosine(uint heading, short *sine, short *cosine);
void collision_height_envelope(int unused, int mode);
void collision_build_height_field(uint step_limit);
void sort_collision_candidates(void);
undefined4 play_sound_effect_at_object(void);
undefined4 object_ptr_in_arena(void);
ushort *discard_misplaced_object(void *list, ushort *object, int destroy);
undefined4 play_sound_effect_with_pan(void);
ushort *reallocate_object_to_arena(void);
ushort *settle_dropped_object(void);
int check_object_placement_clearance(short catalog_type, short ignore_slot, short position_x, short position_y, short height, int check_mode, byte step_limit);
void object_list_append_tail(void);
undefined4 play_positional_sound_effect(void);
void print_scroll_message_by_id(void);
void set_ambient_bias_without_light(char light_level);
void throw_cursor_fixture_reset(void);
void throw_cursor_fixture_dispose(void);
void launch(void);
#endif
