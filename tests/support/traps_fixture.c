#include "game_fixture.h"
#include "traps_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
char *get_message_string(ushort id);
int message_scroll_print_wrapped(char *text);
void debug_print(char *format, ...);
ushort * find_equipped_item_by_category(void);
void set_pending_update_flags(ushort flags);
void spawn_trap_hazard_object(int trap_record, short tile_x, short tile_y);
void *get_object_record_by_slot_index(short slot_index);
ushort *find_object_in_chain(ushort **link_cursor, int recurse, int object_class, int subclass, short quality);
void *alloc_object_slot(int region);
int apply_area_terrain_effect(short tile_x, int tile_y, short wall_texture, short height_value, short height_adjust, short floor_texture, short width, short height_extent, short mode);
int apply_poison_or_damage_trap_effect(int object_slot, uint damage_delta, int unused_a, int unused_b);
int check_object_area_for_spawn_block(ushort *object);
void close_door_object(char *actor, ushort *door);
int dispatch_quest_event_code(char *trap_record, int tile_x, int tile_y);
int dispatch_trap_special_or_tile_action(byte context_x, byte context_y, uintptr_t tile_x, intptr_t tile_y, ushort action_id, byte argument);
int encode_object_slot_index(char *object);
void free_object_slot(char *object);
void object_list_insert_head(byte *link_field, char *object);
void object_list_unlink(byte *link_field, byte *object);
int object_ptr_in_arena(char *object);
void open_door_object(ushort *door);
int place_object_in_world(uint tile_x, uint tile_y, int height, char *object, short radius, int skip_roll);
void print_message_with_proximity_qualifier(void);
uint rand_below(int limit);
void *resolve_object_link(ushort *link_field);
uint resolve_skill_gated_unlock_or_use(ushort *object, ushort *key_item, ushort *lock_link, ushort key_id);
uint scheduler_add_entry(uint object_link, int delay, byte animation_offset, byte tile_x, byte tile_y);
int teleport_object_to_level_tile(char *object, int tile_x, int tile_y, short level_number);
void *tilemap_lookup(short tile_x, short tile_y);
void toggle_door_object(char *actor, byte *door);
void unlink_and_free_object(char *link_field, char *object);
ushort *level_object(unsigned slot);

char *DAT_00086df8, *DAT_0024cff4;

ushort *DAT_0024cff0, *g_player_object;

undefined4 DAT_00202c84;

undefined2 DAT_002020a0, DAT_002020a4;

char s_Look__it_s_a_text_trap_00087918[] = "Look, it's a text trap";

byte level_one[0x7c08];

char message[] = "Orb text trap message";

char *available_message;

uint message_id;

int lookups, prints;

char *get_message_string(ushort id)
{ lookups++; message_id = id; return available_message; }

int message_scroll_print_wrapped(char *text)
{
    /* Check before dereferencing so pointer truncation reports a test failure. */
    TEST_ASSERT_EQUAL_PTR(message, text);
    TEST_ASSERT_EQUAL_STRING(message, text);
    prints++;
    return 1;
}

void debug_print(char *format, ...) { (void)format; }

ushort * find_equipped_item_by_category(void) { TEST_FAIL_MESSAGE("Unexpected find_equipped_item_by_category in text trap"); return 0; }

void set_pending_update_flags(ushort flags) { (void)flags; TEST_FAIL_MESSAGE("Unexpected set_pending_update_flags in text trap"); }

void spawn_trap_hazard_object(int trap_record, short tile_x, short tile_y) { (void)trap_record; (void)tile_x; (void)tile_y; TEST_FAIL_MESSAGE("Unexpected spawn_trap_hazard_object in text trap"); }

void *get_object_record_by_slot_index(short slot_index) { (void)slot_index; TEST_FAIL_MESSAGE("Unexpected get_object_record_by_slot_index in text trap"); return 0; }

ushort *find_object_in_chain(ushort **link_cursor, int recurse, int object_class, int subclass, short quality) { (void)link_cursor; (void)recurse; (void)object_class; (void)subclass; (void)quality; TEST_FAIL_MESSAGE("Unexpected find_object_in_chain in text trap"); return 0; }

void *alloc_object_slot(int region) { (void)region; TEST_FAIL_MESSAGE("Unexpected alloc_object_slot in text trap"); return 0; }

int apply_area_terrain_effect(short tile_x, int tile_y, short wall_texture, short height_value, short height_adjust, short floor_texture, short width, short height_extent, short mode) { (void)tile_x; (void)tile_y; (void)wall_texture; (void)height_value; (void)height_adjust; (void)floor_texture; (void)width; (void)height_extent; (void)mode; TEST_FAIL_MESSAGE("Unexpected apply_area_terrain_effect in text trap"); return 0; }

int apply_poison_or_damage_trap_effect(int object_slot, uint damage_delta, int unused_a, int unused_b) { (void)object_slot; (void)damage_delta; (void)unused_a; (void)unused_b; TEST_FAIL_MESSAGE("Unexpected apply_poison_or_damage_trap_effect in text trap"); return 0; }

int check_object_area_for_spawn_block(ushort *object) { (void)object; TEST_FAIL_MESSAGE("Unexpected check_object_area_for_spawn_block in text trap"); return 0; }

void close_door_object(char *actor, ushort *door) { (void)actor; (void)door; TEST_FAIL_MESSAGE("Unexpected close_door_object in text trap"); }

int dispatch_quest_event_code(char *trap_record, int tile_x, int tile_y) { (void)trap_record; (void)tile_x; (void)tile_y; TEST_FAIL_MESSAGE("Unexpected dispatch_quest_event_code in text trap"); return 0; }

int dispatch_trap_special_or_tile_action(byte context_x, byte context_y, uintptr_t tile_x, intptr_t tile_y, ushort action_id, byte argument) { (void)context_x; (void)context_y; (void)tile_x; (void)tile_y; (void)action_id; (void)argument; TEST_FAIL_MESSAGE("Unexpected dispatch_trap_special_or_tile_action in text trap"); return 0; }

int encode_object_slot_index(char *object) { (void)object; TEST_FAIL_MESSAGE("Unexpected encode_object_slot_index in text trap"); return 0; }

void free_object_slot(char *object) { (void)object; TEST_FAIL_MESSAGE("Unexpected free_object_slot in text trap"); }

void object_list_insert_head(byte *link_field, char *object) { (void)link_field; (void)object; TEST_FAIL_MESSAGE("Unexpected object_list_insert_head in text trap"); }

void object_list_unlink(byte *link_field, byte *object) { (void)link_field; (void)object; TEST_FAIL_MESSAGE("Unexpected object_list_unlink in text trap"); }

int object_ptr_in_arena(char *object) { (void)object; TEST_FAIL_MESSAGE("Unexpected object_ptr_in_arena in text trap"); return 0; }

void open_door_object(ushort *door) { (void)door; TEST_FAIL_MESSAGE("Unexpected open_door_object in text trap"); }

int place_object_in_world(uint tile_x, uint tile_y, int height, char *object, short radius, int skip_roll) { (void)tile_x; (void)tile_y; (void)height; (void)object; (void)radius; (void)skip_roll; TEST_FAIL_MESSAGE("Unexpected place_object_in_world in text trap"); return 0; }

void print_message_with_proximity_qualifier(void) { TEST_FAIL_MESSAGE("Unexpected print_message_with_proximity_qualifier in text trap"); }

uint rand_below(int limit) { (void)limit; TEST_FAIL_MESSAGE("Unexpected rand_below in text trap"); return 0; }

void *resolve_object_link(ushort *link_field) { (void)link_field; TEST_FAIL_MESSAGE("Unexpected resolve_object_link in text trap"); return 0; }

uint resolve_skill_gated_unlock_or_use(ushort *object, ushort *key_item, ushort *lock_link, ushort key_id) { (void)object; (void)key_item; (void)lock_link; (void)key_id; TEST_FAIL_MESSAGE("Unexpected resolve_skill_gated_unlock_or_use in text trap"); return 0; }

uint scheduler_add_entry(uint object_link, int delay, byte animation_offset, byte tile_x, byte tile_y) { (void)object_link; (void)delay; (void)animation_offset; (void)tile_x; (void)tile_y; TEST_FAIL_MESSAGE("Unexpected scheduler_add_entry in text trap"); return 0; }

int teleport_object_to_level_tile(char *object, int tile_x, int tile_y, short level_number) { (void)object; (void)tile_x; (void)tile_y; (void)level_number; TEST_FAIL_MESSAGE("Unexpected teleport_object_to_level_tile in text trap"); return 0; }

void *tilemap_lookup(short tile_x, short tile_y) { (void)tile_x; (void)tile_y; TEST_FAIL_MESSAGE("Unexpected tilemap_lookup in text trap"); return 0; }

void toggle_door_object(char *actor, byte *door) { (void)actor; (void)door; TEST_FAIL_MESSAGE("Unexpected toggle_door_object in text trap"); }

void unlink_and_free_object(char *link_field, char *object) { (void)link_field; (void)object; TEST_FAIL_MESSAGE("Unexpected unlink_and_free_object in text trap"); }

ushort *level_object(unsigned slot)
{
    return uw_test_level_object(level_one, sizeof level_one, slot);
}

ushort *orb_text_trap(void)
{
    uw_test_load_map(level_one, sizeof level_one, 1);
    ushort *tile = (ushort *)(level_one + (58 + 13 * 64) * 4);
    unsigned slot = tile[1] >> 6;
    ushort *orb = NULL;
    for (unsigned count = 0; slot && count < 1024; count++) {
        ushort *object = level_object(slot);
        if ((*object & 0x1ff) == 0x117) { orb = object; break; }
        slot = object[2] >> 6;
    }
    TEST_ASSERT_NOT_NULL_MESSAGE(orb, "Expected orb near (57,13), at (58,13)");
    ushort *trigger = level_object(orb[3] >> 6);
    TEST_ASSERT_EQUAL_HEX16(0x1a3, *trigger & 0x1ff);
    ushort *trap = level_object(trigger[3] >> 6);
    TEST_ASSERT_EQUAL_HEX16(0x190, *trap & 0x1ff);
    return trap;
}

void traps_fixture_reset(void)
{ available_message = message; lookups = prints = 0; message_id = 0; }

void traps_fixture_dispose(void) {}
