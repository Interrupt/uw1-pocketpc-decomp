#ifndef UW_TEST_CREATURES_FIXTURE_H
#define UW_TEST_CREATURES_FIXTURE_H
#include "unity.h"
#include "src/headers/debug.h"
#include "../creatures_test_globals.h"
void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...);
void read_data(const char *name, long offset, void *buffer, size_t count);
long ce_rand(void);
int roll_dice_sum(int count, short sides);
byte *uw_load_critter_page_cached(int page, int tier);
undefined4 decode_critter_sprite_page(int page, int tier, int direction, int palette, int frame);
void *alloc_object_slot(int mobile);
void *tilemap_lookup(int x, int y);
void *resolve_object_link(ushort *link);
undefined4 object_ptr_in_arena(void);
void record_placement(ushort *object);
ushort *settle_dropped_object(ushort *object, int x, int y, int mode);
undefined4 drop_object_near_target(void *target, ushort *object, int distance, int mode);
undefined4 place_object_in_world(int x, int y, int z, ushort *object, int distance, int mode);
void free_object_slot(void *object);
undefined4 check_object_drop_height(void *object, void *source);
int encode_object_slot_index(void);
undefined4 play_sound_effect_at_object(int sound, void *object, int mode);
undefined4 spawn_scheduled_effect_object(void);
undefined4 roll_object_destroy_chance(void);
void print_scroll_message_by_id(void);
void set_pending_update_flags(void);
void spawn_effect_debris_burst(void);
void scheduler_relink_entry(void);
void set_ambient_bias_without_light(void);
undefined4 activate_area_hazard_object(void);
ushort *discard_misplaced_object(void *list, void *object, int release);
void creatures_fixture_reset(void);
void creatures_fixture_dispose(void);
#endif
