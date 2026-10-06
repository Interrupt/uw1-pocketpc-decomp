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
int decode_critter_sprite_page(int page, int tier, short direction, short palette, short frame);
void *alloc_object_slot(int mobile);
void *tilemap_lookup(short x, short y);
void *resolve_object_link(ushort *link);
int object_ptr_in_arena(char *object);
void record_placement(ushort *object);
ushort *settle_dropped_object(ushort *object, short x, short y, int mode);
int drop_object_near_target(char *target, char *object, short distance, uint mode);
int place_object_in_world(uint x, uint y, int z, char *object, short distance, int mode);
void free_object_slot(char *object);
int check_object_drop_height(ushort *object, ushort *source);
int encode_object_slot_index(char *object);
undefined4 play_sound_effect_at_object(int sound, void *object, int mode);
int spawn_scheduled_effect_object(ushort *source_object, int effect_group, int delay, byte animation_offset, short heading_adjust, short tile_x, short tile_y);
int roll_object_destroy_chance(short base_chance, char *object);
void print_scroll_message_by_id(uint message_id);
void set_pending_update_flags(ushort flags);
void spawn_effect_debris_burst(void);
void scheduler_relink_entry(char *new_object, char *old_object);
void set_ambient_bias_without_light(char light_level);
int activate_area_hazard_object(ushort *hazard, uint tile_x, int tile_y, int damage);
ushort *discard_misplaced_object(char *list, ushort *object, int release);
void creatures_fixture_reset(void);
void creatures_fixture_dispose(void);
#endif
