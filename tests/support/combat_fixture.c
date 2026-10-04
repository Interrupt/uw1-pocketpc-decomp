#include "game_fixture.h"
#include "combat_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
int encode_object_slot_index(ushort *object);
void refresh_experience_display(void);
void set_pending_music_track(uint track);
uint read_realtime_clock_units(void);
void grant_experience_points(int amount);
void attempt_talk_interaction(char *object);
void cancel_weapon_swing(void);
void trigger_quest_milestone_cleanup_event(void);
void other_panel_tick(int index);
void flush_sprite_list_compositor(void);
undefined4 sprite_list_set_frame_id(int slot, uint frame);
int resolve_weapon_hit_skill_check(int attacker, int target);
int roll_dice_sum(int count, int sides);
undefined4 play_sound_effect_with_pan(void);
undefined4 play_positional_sound_effect(int sound, int x, int y, int volume);
void set_movement_animation_timer(void);
undefined4 play_weapon_impact_sound(int result);
long ce_rand(void);
void project_position_by_heading(int heading, int distance, short *x, short *y);
void collision_height_envelope(int mode, int collision);
void collision_build_height_field(int mode);
void sort_collision_candidates(void);
void *get_object_record_by_slot_index(int slot);
undefined4 object_ptr_in_arena(ushort *object);
void *spawn_new_object(int type, int mobile);
uint scheduler_add_entry(uint slot, int delay, int frame, int x, int y);
void *tilemap_lookup(int x, int y);
void object_list_append_tail(void *head, void *object);
void free_object_slot(ushort *object);
undefined4 read_file_handle(int handle, void *destination, int count);

byte mobile_objects[256 * 27];
undefined1 DAT_002027d0_backing[256];
byte DAT_002046d8, DAT_002046dc;
int DAT_002046e8;
undefined1 DAT_002046e0, DAT_002046e4;


char *DAT_002046b8 = (char *)mobile_objects;

byte *DAT_00202c6c;

undefined1 DAT_00202c90_backing[8192];

undefined1 DAT_00202c38_backing[8192];

short DAT_001005f4, DAT_001005f8, DAT_0023beb4;

char DAT_001005dc;

ushort DAT_00100610, DAT_00100620, DAT_00100604;

undefined2 DAT_00100600, DAT_00100624;

int candidate_count, lookup_count;

ushort lookup_slots[32];

int wall_collision;

int wall_in_front;

ushort wall_effect[4];

byte wall_tile[4];

byte DAT_00100628, DAT_001005fc;

short DAT_0010061c;

undefined4 DAT_001005d8;

char DAT_00084f18_backing[5] = {5, 3, 1, 7, 0};

undefined1 DAT_001007d0_backing[3072];

undefined1 DAT_001007d4_backing[8192];

byte player_stats[256];

char *DAT_00086df8 = (char *)player_stats;

char *DAT_0023b82c;

int skill_result, skill_checks, effects, impact_sounds;

int effect_types[2], effect_heights[2];

int experience, experience_awards, talks, death_sounds, positional_impacts;

ushort *expected_effect_target;

ushort *g_player_object;

char *DAT_0023be74, *DAT_00101404;

undefined DAT_001007d9_backing[8192];

char DAT_000853d0, DAT_0010194c;

byte DAT_0010192c, DAT_00101930;

undefined1 DAT_00101934;

int DAT_00101940;

undefined4 DAT_00101944;

ushort DAT_00101910, DAT_0010141c;

uint music_track;

int encode_object_slot_index(ushort *object)
{
    if (object == wall_effect) return 0x100;
    for (int slot = 1; slot < 256; slot++)
        if ((byte *)object == mobile_objects + slot * 27) return slot;
    TEST_FAIL_MESSAGE("Expected an actual mobile object pointer");
    return 0;
}

void refresh_experience_display(void) {}

void set_pending_music_track(uint track) { music_track = track; }

uint clock_units;

uint read_realtime_clock_units(void) { return clock_units; }

void grant_experience_points(int amount) { experience += amount; experience_awards++; }

void attempt_talk_interaction(char *object)
{ TEST_ASSERT_EQUAL_PTR(mobile_objects + 2 * 27, object); talks++; }

void cancel_weapon_swing(void) {}

void trigger_quest_milestone_cleanup_event(void) { TEST_FAIL_MESSAGE("Unexpected quest cleanup"); }

undefined1 DAT_0023c118_arr[9], DAT_0023c128_arr[9];

unsigned char DAT_0023c11c_arr[2], DAT_0023c12c_arr[2];

ushort DAT_0023c1d8, DAT_0023c1dc, DAT_0023c1e0;

byte DAT_0023c150, DAT_0023c12a, DAT_0023c25c;

int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;

undefined1 DAT_0023c11c_arr[2], DAT_0023c12c_arr[2];

undefined1 DAT_0023c1f0_backing[64], DAT_0023c1f8_backing[64];

undefined1 DAT_0023c11a;

undefined1 g_active_hud_panel;

undefined1 DAT_0023c11b;

char DAT_000870d8, DAT_000870dc;

short DAT_0023c21c;

undefined2 DAT_0023c220;

undefined1 DAT_0023c1f0_backing[64], DAT_0023c1f8_backing[64];

int hud_flushes, wipe_frames;

uint frames[32];

void other_panel_tick(int index)
{ DAT_0023c1d8 &= ~(1 << index); }

void (*const g_hud_panel_handlers_table[13])(void) = {
    0, 0, 0, 0,
    (void (*)(void))other_panel_tick, (void (*)(void))other_panel_tick,
    (void (*)(void))other_panel_tick, (void (*)(void))other_panel_tick,
    (void (*)(void))other_panel_tick, (void (*)(void))other_panel_tick,
    (void (*)(void))other_panel_tick, hud_panel_wipe_transition_tick,
    (void (*)(void))other_panel_tick
};

void flush_sprite_list_compositor(void) { hud_flushes++; }

undefined4 sprite_list_set_frame_id(int slot, uint frame)
{
    TEST_ASSERT_EQUAL_INT(7, slot);
    TEST_ASSERT_LESS_THAN_INT(32, wipe_frames);
    frames[wipe_frames++] = frame;
    return 0;
}

int resolve_weapon_hit_skill_check(int attacker, int target)
{
    TEST_ASSERT_EQUAL_UINT16(DAT_00100610, attacker);
    TEST_ASSERT_EQUAL_UINT16(DAT_00100620, target);
    skill_checks++;
    return skill_result;
}

int roll_dice_sum(int count, int sides) { return count * sides; }
undefined4 roll_skill_check(void)
{ TEST_FAIL_MESSAGE("Magic Arrow does not use the ranged weapon skill check"); return 0; }

undefined4 play_sound_effect_with_pan(void) { return 0; }

undefined4 play_positional_sound_effect(int sound, int x, int y, int volume)
{ (void)x; (void)y; (void)volume; if (sound == 6) death_sounds++; if (sound == 4) positional_impacts++; return 0; }

void set_movement_animation_timer(void) { TEST_FAIL_MESSAGE("Unexpected player hit animation"); }

undefined4 spawn_scheduled_effect_object(ushort *target, int type, int mode, int intensity,
                                        int height, int x, int y)
{
    TEST_ASSERT_EQUAL_PTR(expected_effect_target, target);
    TEST_ASSERT_LESS_THAN_INT(2, effects);
    effect_types[effects] = type;
    effect_heights[effects] = height;
    (void)mode; (void)intensity; (void)x; (void)y;
    effects++;
    return 0;
}

undefined4 play_weapon_impact_sound(int result) { impact_sounds++; return result; }

int door_triggers, door_scheduled, discarded_links;
undefined2 DAT_002020a0, DAT_002020a4;
char *DAT_002046c4;
void trigger_object_trap_or_use_action(ushort *actor, ushort *target, int action, int x, int y)
{
    TEST_ASSERT_EQUAL_PTR(g_player_object, actor);
    TEST_ASSERT_EQUAL_PTR(wall_effect, target);
    TEST_ASSERT_EQUAL_INT(door_triggers == 0 ? 4 : 7, action);
    TEST_ASSERT_EQUAL_INT(10, x);
    TEST_ASSERT_EQUAL_INT(10, y);
    door_triggers++;
}
undefined4 play_sound_effect_at_object(int sound, ushort *object, int mode)
{
    TEST_ASSERT_EQUAL_INT(4, sound);
    TEST_ASSERT_EQUAL_PTR(wall_effect, object);
    TEST_ASSERT_EQUAL_INT(0, mode);
    impact_sounds++;
    return 0;
}

/* Other destruction branches must not run for a door. */
void try_combine_or_stow_object(void) { TEST_FAIL_MESSAGE("Unexpected container combination"); }
undefined4 rand_below(void) { TEST_FAIL_MESSAGE("Unexpected random destruction"); return 0; }
void try_empty_container(void) { TEST_FAIL_MESSAGE("Unexpected container emptying"); }
undefined4 roll_object_destroy_chance(void) { TEST_FAIL_MESSAGE("Unexpected destroy chance"); return 0; }
undefined4 reset_burnt_out_item_state(void) { TEST_FAIL_MESSAGE("Unexpected burnt item"); return 0; }
void free_linked_object_recursive(void) { TEST_FAIL_MESSAGE("Unexpected recursive cleanup"); }
ushort *settle_dropped_object(void) { TEST_FAIL_MESSAGE("Unexpected settling"); return 0; }
void adjust_door_close_animation_delay(void) { TEST_FAIL_MESSAGE("Unexpected closing door"); }
ushort *find_object_in_chain(ushort **head, int recurse, int category, int family, int subtype)
{
    TEST_ASSERT_EQUAL_PTR(wall_effect+3, *head);
    TEST_ASSERT_EQUAL_INT(1, recurse);
    TEST_ASSERT_EQUAL_INT(4, category);
    TEST_ASSERT_EQUAL_INT(0, family);
    TEST_ASSERT_EQUAL_INT(15, subtype);
    return (**head & 0xffc0) ? object_at(4) : NULL;
}
void object_list_unlink(ushort *head, ushort *object)
{
    TEST_ASSERT_EQUAL_PTR(wall_effect+3, head);
    TEST_ASSERT_EQUAL_PTR(object_at(4), object);
    *head &= 0x3f;
}

long ce_rand(void) { return 1; }

void project_position_by_heading(int heading, int distance, short *x, short *y)
{ (void)heading; (void)distance; (void)x; (void)y; }

void collision_height_envelope(int mode, int collision)
{
    TEST_ASSERT_EQUAL_INT(0, mode);
    TEST_ASSERT_EQUAL_INT(1, collision);
    DAT_00202c6c[0x14] = candidate_count;
}

void collision_build_height_field(int mode)
{
    TEST_ASSERT_EQUAL_INT(0, mode);
    if (wall_in_front) {
        ushort flags = 0x100;
        memcpy(DAT_00202c6c + 0xc, &flags, sizeof flags);
    }
}

void sort_collision_candidates(void)
{
    DAT_00202c6c[0x15] = candidate_count;
    DAT_00202c6c[0x16] = 0;
}

void *get_object_record_by_slot_index(int slot)
{
    if (slot == 0x100) return wall_effect;
    TEST_ASSERT_GREATER_THAN_INT(0, slot);
    TEST_ASSERT_LESS_THAN_INT(256, slot);
    TEST_ASSERT_LESS_THAN_INT(32, lookup_count);
    lookup_slots[lookup_count++] = slot;
    return mobile_objects + slot * 27;
}

undefined4 object_ptr_in_arena(ushort *object)
{ TEST_ASSERT_NOT_NULL(object); return object != wall_effect; }

void *spawn_new_object(int type, int mobile)
{
    TEST_ASSERT_EQUAL_HEX16(0x1cb, type);
    TEST_ASSERT_EQUAL_INT(0, mobile);
    wall_effect[0] = type;
    return wall_effect;
}

uint scheduler_add_entry(uint slot, int delay, int frame, int x, int y)
{
    TEST_ASSERT_EQUAL_UINT(0x100, slot);
    if ((wall_effect[0] & 0x1ff) == 0x1cf) {
        TEST_ASSERT_EQUAL_INT(5, delay);
        door_scheduled++;
    } else TEST_ASSERT_EQUAL_INT(2, delay);
    TEST_ASSERT_EQUAL_INT(0, frame);
    TEST_ASSERT_EQUAL_INT(10, x);
    TEST_ASSERT_EQUAL_INT(10, y);
    return 1;
}

void *tilemap_lookup(int x, int y)
{
    TEST_ASSERT_EQUAL_INT(10, x);
    TEST_ASSERT_EQUAL_INT(10, y);
    return wall_tile;
}

void object_list_append_tail(void *head, void *object)
{
    TEST_ASSERT_EQUAL_PTR(wall_tile + 2, head);
    TEST_ASSERT_EQUAL_PTR(wall_effect, object);
    wall_collision++;
}

void free_object_slot(ushort *object)
{ TEST_ASSERT_EQUAL_PTR(object_at(4), object); discarded_links++; }

FILE *monster_data;

undefined4 read_file_handle(int handle, void *destination, int count)
{
    TEST_ASSERT_EQUAL_INT(1, handle);
    TEST_ASSERT_NOT_NULL(monster_data);
    size_t bytes = fread(destination, 1, count, monster_data);
    TEST_ASSERT_EQUAL_UINT(count, bytes);
    return bytes;
}

void load_real_monster_data(void)
{
    monster_data = uw_test_open_data("DATA/OBJECTS.DAT");
    TEST_ASSERT_NOT_NULL(monster_data);
    TEST_ASSERT_EQUAL_INT(0, fseek(monster_data, 2 + 0x80 + 0x30 + 0x80, SEEK_SET));
    load_monster_combat_stats(1);
    fclose(monster_data);
    monster_data = NULL;
}

ushort *object_at(unsigned slot)
{ return (ushort *)(mobile_objects + slot * 27); }

void candidate(unsigned index, unsigned slot, short displacement)
{
    byte *record = DAT_00202c38_backing + index * 6;
    record[0] = 0;
    record[1] = 100;
    ushort link = slot << 6;
    memcpy(record + 2, &link, 2);
    memcpy(record + 4, &displacement, 2);
    candidate_count = index + 1;
}

void combat_fixture_reset(void)
{
    memset(mobile_objects, 0, sizeof(mobile_objects));
    memset(DAT_002027d0_backing, 0, sizeof DAT_002027d0_backing);
    DAT_002046d8=DAT_002046dc=DAT_002046e0=DAT_002046e4=0;
    DAT_002046e8=0;
    door_triggers=door_scheduled=discarded_links=0;
    DAT_002020a0=DAT_002020a4=0;
    DAT_002046c4=(char *)wall_effect;
    memset(DAT_00202c90_backing, 0, sizeof(DAT_00202c90_backing));
    memset(DAT_00202c38_backing, 0, sizeof(DAT_00202c38_backing));
    DAT_00100610 = 1;
    DAT_00100620 = 0;
    DAT_00100624 = 0xffff;
    DAT_00100600 = DAT_00100604 = 0;
    DAT_001005f4 = DAT_001005f8 = DAT_0023beb4 = 0;
    DAT_001005dc = DAT_00084f1c = 0;
    candidate_count = lookup_count = wall_collision = wall_in_front = 0;
    memset(wall_effect, 0, sizeof wall_effect);
    memset(wall_tile, 0, sizeof wall_tile);
    DAT_00100628 = DAT_001005fc = DAT_001005d8 = 0;
    DAT_0010061c = 6;
    skill_result = skill_checks = effects = impact_sounds = 0;
    experience = experience_awards = talks = death_sounds = positional_impacts = 0;
    music_track = 0;
    clock_units = 0;
    hud_flushes = wipe_frames = 0;
    memset(DAT_0023c118_arr, 0, sizeof(DAT_0023c118_arr));
    memset(DAT_0023c128_arr, 0, sizeof(DAT_0023c128_arr));
    memset(DAT_0023c11c_arr, 0, sizeof(DAT_0023c11c_arr));
    memset(DAT_0023c12c_arr, 0, sizeof(DAT_0023c12c_arr));
    memset(DAT_0023c1f0_backing, 0, sizeof(DAT_0023c1f0_backing));
    memset(DAT_0023c1f8_backing, 0, sizeof(DAT_0023c1f8_backing));
    DAT_0023c1d8 = DAT_0023c1dc = DAT_0023c1e0 = 0;
    DAT_0023c150 = DAT_0023c220 = DAT_0023c25c = 0;
    DAT_0023c21c = 7;
    g_player_object = object_at(1);
    DAT_0023be74 = (char *)object_at(1);
    DAT_00101404 = (char *)DAT_001007d4_backing;
    memset(DAT_001007d0_backing, 0, sizeof(DAT_001007d0_backing));
    memset(DAT_001007d4_backing, 0, sizeof(DAT_001007d4_backing));
    memset(DAT_001007d9_backing, 0, sizeof(DAT_001007d9_backing));
    expected_effect_target = object_at(2);
    DAT_0023b82c = (char *)mobile_objects;
    object_at(1)[0] = 0x40;
    object_at(1)[1] = 40;
    object_at(1)[0xb] = (10 << 10) | (10 << 4);
    object_at(2)[0] = 0x45; /* critter */
    object_at(3)[0] = 0x46; /* another critter */
    object_at(1)[4] = object_at(2)[4] = object_at(3)[4] = 100;
}

void combat_fixture_dispose(void) {}

ushort wall_spark_height(short pitch)
{
    DAT_0023beb4 = pitch;
    wall_in_front = 1;
    TEST_ASSERT_EQUAL_UINT(0, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_INT(1, wall_collision);
    TEST_ASSERT_EQUAL_HEX16(0x1cb, wall_effect[0]);
    return wall_effect[1] & 0x7f;
}
