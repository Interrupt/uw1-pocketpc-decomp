#include "unity.h"
#include "../src/headers/uw.h"
#include "src/headers/ordinal_stubs.h"
#include <stdio.h>

/* Exercise real melee hit resolution/selection; world collision is a fixture. */
static byte mobile_objects[256 * 27];
char *DAT_002046b8 = (char *)mobile_objects;
byte *DAT_00202c6c;
undefined1 DAT_00202c90_backing[65536];
undefined1 DAT_00202c38_backing[8192];
short DAT_001005f4, DAT_001005f8, DAT_0023beb4;
char DAT_001005dc;
ushort DAT_00100610, DAT_00100620, DAT_00100604;
undefined2 DAT_00100600, DAT_00100624;
static int candidate_count, lookup_count;
static ushort lookup_slots[32];
static int wall_collision;
static int wall_in_front;
static ushort wall_effect[4];
static byte wall_tile[4];
byte DAT_00100628, DAT_001005fc;
short DAT_0010061c;
undefined4 DAT_001005d8;
char DAT_00084f18_backing[5] = {5, 3, 1, 7, 0};
undefined1 DAT_001007d0_backing[6144];
undefined1 DAT_001007d4_backing[8192];
static byte player_stats[256];
char *DAT_00086df8 = (char *)player_stats;
char *DAT_0023b82c;
static int skill_result, skill_checks, effects, impact_sounds;
static int effect_types[2], effect_heights[2];
static int experience, experience_awards, talks, death_sounds;
static ushort *expected_effect_target;
ushort *g_player_object;
char *DAT_0023be74, *DAT_00101404;
undefined DAT_001007d9_backing[8192];
char DAT_000853d0, DAT_0010194c;
byte DAT_0010192c, DAT_00101930;
undefined1 DAT_00101934;
int DAT_00101940;
undefined4 DAT_00101944;
ushort DAT_00101910, DAT_0010141c;
static uint music_track;
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
static uint clock_units;
uint read_realtime_clock_units(void) { return clock_units; }
void grant_experience_points(int amount) { experience += amount; experience_awards++; }
void attempt_talk_interaction(char *object)
{ TEST_ASSERT_EQUAL_PTR(mobile_objects + 2 * 27, object); talks++; }
void cancel_weapon_swing(void) {}
void trigger_quest_milestone_cleanup_event(void) { TEST_FAIL_MESSAGE("Unexpected quest cleanup"); }

/* Drive the real combat HUD request and wipe ticker; other panels are stubs. */
undefined1 DAT_0023c118_arr[9], DAT_0023c128_arr[9];
unsigned char DAT_0023c11c_arr[2], DAT_0023c12c_arr[2];
ushort DAT_0023c1d8, DAT_0023c1dc, DAT_0023c1e0;
byte DAT_0023c150, DAT_0023c12a, DAT_0023c25c;
int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;
undefined1 DAT_0023c11c_arr[2], DAT_0023c12c_arr[2];
undefined1 DAT_0023c1f0_backing[65536], DAT_0023c1f8_backing[65536];
undefined1 DAT_0023c11a;
undefined1 g_active_hud_panel;
undefined1 DAT_0023c11b;
char DAT_000870d8, DAT_000870dc;
short DAT_0023c21c;
undefined2 DAT_0023c220;
undefined1 DAT_0023c1f0_backing[65536], DAT_0023c1f8_backing[65536];
static int hud_flushes, wipe_frames;
static uint frames[32];
static void other_panel_tick(int index)
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
undefined4 play_sound_effect_with_pan(void) { return 0; }
undefined4 play_positional_sound_effect(int sound, int x, int y, int volume)
{ (void)x; (void)y; (void)volume; if (sound == 6) death_sounds++; return 0; }
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
bool apply_object_durability_damage(void) { TEST_FAIL_MESSAGE("Unexpected non-critter damage"); return false; }
undefined4 apply_object_destruction_effect(void) { TEST_FAIL_MESSAGE("Unexpected non-critter destruction"); return 0; }


void *ce_memset(void *dest, int value, unsigned int count)
{ return memset(dest, value, count); }
long ce_rand(void) { return 1; }
divmod_result ordint_divmod(int divisor, int dividend) { divmod_result r = {dividend / divisor, dividend % divisor}; return r; }
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
    TEST_ASSERT_GREATER_THAN_INT(0, slot);
    TEST_ASSERT_LESS_THAN_INT(256, slot);
    TEST_ASSERT_LESS_THAN_INT(32, lookup_count);
    lookup_slots[lookup_count++] = slot;
    return mobile_objects + slot * 27;
}
undefined4 object_ptr_in_arena(ushort *object)
{ TEST_ASSERT_NOT_NULL(object); return 1; }
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
    TEST_ASSERT_EQUAL_INT(2, delay);
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
void free_object_slot(void) { TEST_FAIL_MESSAGE("Unexpected full effect queue"); }

static FILE *monster_data;
undefined4 read_file_handle(int handle, void *destination, int count)
{
    TEST_ASSERT_EQUAL_INT(1, handle);
    TEST_ASSERT_NOT_NULL(monster_data);
    size_t bytes = fread(destination, 1, count, monster_data);
    TEST_ASSERT_EQUAL_UINT(count, bytes);
    return bytes;
}
static void load_real_monster_data(void)
{
    monster_data = fopen(UW_TEST_DATA_DIR "/DATA/OBJECTS.DAT", "rb");
    TEST_ASSERT_NOT_NULL(monster_data);
    TEST_ASSERT_EQUAL_INT(0, fseek(monster_data, 2 + 0x80 + 0x30 + 0x80, SEEK_SET));
    load_monster_combat_stats(1);
    fclose(monster_data);
    monster_data = NULL;
}

static ushort *object_at(unsigned slot)
{ return (ushort *)(mobile_objects + slot * 27); }
static void candidate(unsigned index, unsigned slot, short displacement)
{
    byte *record = DAT_00202c38_backing + index * 6;
    record[0] = 0;
    record[1] = 100;
    ushort link = slot << 6;
    memcpy(record + 2, &link, 2);
    memcpy(record + 4, &displacement, 2);
    candidate_count = index + 1;
}
void setUp(void)
{
    memset(mobile_objects, 0, sizeof(mobile_objects));
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
    experience = experience_awards = talks = death_sounds = 0;
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
void tearDown(void) {}

static void test_player_melee_swing_selects_critter(void)
{
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_INT(1, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_UINT16(2, DAT_00100620);
    TEST_ASSERT_EQUAL_INT(1, lookup_count);
    TEST_ASSERT_EQUAL_UINT16(2, lookup_slots[0]);
    TEST_ASSERT_EQUAL_UINT16(10, DAT_00100600);
    TEST_ASSERT_EQUAL_UINT16(10, DAT_00100604);
    TEST_ASSERT_LESS_THAN_UINT16(4, DAT_00100624);
    TEST_ASSERT_EQUAL_INT(0, wall_collision);
}
static void test_player_melee_swing_without_candidates_misses(void)
{
    TEST_ASSERT_EQUAL_INT(0, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_INT(0, lookup_count);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_00100620);
    TEST_ASSERT_EQUAL_INT(0, wall_collision);
}
static void test_player_melee_swing_does_not_hit_attacker(void)
{
    candidate(0, 1, 0);
    TEST_ASSERT_EQUAL_INT(0, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_INT(1, lookup_count);
    TEST_ASSERT_EQUAL_UINT16(1, lookup_slots[0]);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_00100620);
}
static void test_player_melee_swing_selects_nearest_critter(void)
{
    candidate(0, 2, 1);
    candidate(1, 3, 0);
    TEST_ASSERT_EQUAL_INT(1, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_INT(2, lookup_count);
    TEST_ASSERT_EQUAL_UINT16(2, lookup_slots[0]);
    TEST_ASSERT_EQUAL_UINT16(3, lookup_slots[1]);
    TEST_ASSERT_EQUAL_UINT16(3, DAT_00100620);
}
static void test_attack_facing_covers_all_heading_pairs(void)
{
    DAT_00100620 = 2;
    for (int attacker = 0; attacker < 8; attacker++) {
        for (int target = 0; target < 8; target++) {
            object_at(1)[1] = attacker << 7;
            object_at(2)[1] = target << 7;
            lookup_count = 0;
            compute_attack_relative_facing();
            int expected = (target - attacker + 12) % 8;
            if (expected > 4) expected = 8 - expected;
            TEST_ASSERT_EQUAL_UINT8(expected, DAT_00100628);
            TEST_ASSERT_EQUAL_UINT16(2, lookup_slots[0]);
            TEST_ASSERT_EQUAL_UINT16(1, lookup_slots[1]);
        }
    }
}
static void test_full_player_swing_applies_damage_to_critter(void)
{
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(1, skill_checks);
    TEST_ASSERT_EQUAL_UINT8(96, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_UINT8(1, (byte)object_at(2)[9]);
    TEST_ASSERT_EQUAL_INT(1, effects);
}
static void test_failed_skill_check_keeps_full_object_pointers(void)
{
    candidate(0, 2, 0);
    skill_result = 1;
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(1, skill_checks);
    TEST_ASSERT_EQUAL_UINT8(100, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_UINT8(1, (byte)object_at(2)[9]);
    TEST_ASSERT_EQUAL_INT(1, impact_sounds);
    TEST_ASSERT_EQUAL_INT(0, effects);
}
static void test_full_swing_without_target_skips_damage(void)
{
    TEST_ASSERT_EQUAL_UINT(0, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(0, skill_checks);
    TEST_ASSERT_EQUAL_UINT8(100, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_INT(1, impact_sounds);
}

static void test_critter_swing_at_same_faction_skips_damage(void)
{
    DAT_00100610 = 3;
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_UINT(0, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(0, skill_checks);
    TEST_ASSERT_EQUAL_UINT8(100, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_INT(0, impact_sounds);
}
static void test_critter_swing_at_opposing_faction_preserves_pointers(void)
{
    DAT_00100610 = 3;
    mobile_objects[3 * 27 + 0x19] = 0x40;
    candidate(0, 2, 0);
    skill_result = 1;
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(1, skill_checks);
    TEST_ASSERT_EQUAL_UINT8(100, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_UINT8(3, (byte)object_at(2)[9]);
}

static void test_lethal_player_swing_marks_critter_dead_and_awards_experience(void)
{
    candidate(0, 2, 0);
    object_at(2)[4] = 4;
    ushort xp = 10;
    memcpy(DAT_001007d0_backing + 5 * 0x30 + 0x28, &xp, sizeof(xp));
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_UINT8(0, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_UINT8(0xc, mobile_objects[2 * 27 + 0x15] & 0x3f);
    TEST_ASSERT_EQUAL_INT(1, experience_awards);
    TEST_ASSERT_EQUAL_INT(60, experience);
    TEST_ASSERT_EQUAL_UINT(9, music_track);
}
static void test_already_dead_critter_does_not_award_experience_again(void)
{
    mobile_objects[2 * 27 + 0x15] = 0xc;
    object_at(2)[4] = 0;
    TEST_ASSERT_EQUAL_UINT(0, apply_damage_to_object(object_at(2), 4, object_at(1)));
    TEST_ASSERT_EQUAL_INT(0, experience_awards);
    TEST_ASSERT_EQUAL_INT(0, death_sounds);
}
static void test_scripted_critter_can_refuse_death(void)
{
    object_at(2)[4] = 4;
    mobile_objects[2 * 27 + 0x1a] = 0xb;
    TEST_ASSERT_EQUAL_UINT(0, apply_damage_to_object(object_at(2), 4, object_at(1)));
    TEST_ASSERT_EQUAL_UINT8(60, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_INT(1, talks);
    TEST_ASSERT_EQUAL_INT(0, experience_awards);
    TEST_ASSERT_NOT_EQUAL_UINT8(0xc, mobile_objects[2 * 27 + 0x15] & 0x3f);
}
static void test_critter_kill_does_not_award_player_experience(void)
{
    object_at(2)[4] = 4;
    TEST_ASSERT_EQUAL_UINT(1, apply_damage_to_object(object_at(2), 4, object_at(3)));
    TEST_ASSERT_EQUAL_UINT8(0, (byte)object_at(2)[4]);
    TEST_ASSERT_EQUAL_UINT8(0xc, mobile_objects[2 * 27 + 0x15] & 0x3f);
    TEST_ASSERT_EQUAL_INT(0, experience_awards);
}

static void test_successful_critter_hit_redraws_hud_wipe(void)
{
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_UINT8(96, (byte)object_at(2)[4]);
    TEST_ASSERT_BITS_HIGH(0x80, DAT_0023c1d8);
    TEST_ASSERT_EQUAL_UINT8(3, DAT_0023c11f);
    clock_units = 0x40;
    hud_panel_redraw_dispatch();
    TEST_ASSERT_EQUAL_INT(1, wipe_frames);
    TEST_ASSERT_EQUAL_HEX16(0x20ad, frames[0]);
    TEST_ASSERT_EQUAL_INT(1, hud_flushes);
}
static void test_combat_hud_wipe_finishes_and_clears_dirty_bit(void)
{
    set_hud_status_value(7, 3);
    for (unsigned tick = 1; tick <= 22; tick++) {
        clock_units = tick * 0x40;
        hud_panel_redraw_dispatch();
    }
    TEST_ASSERT_EQUAL_INT(7, wipe_frames);
    const uint expected[] = {0x20ad, 0x20ae, 0x20af, 0x20ae, 0x20ad, 6, 0x20a6};
    for (unsigned i = 0; i < 7; i++) TEST_ASSERT_EQUAL_HEX16(expected[i], frames[i]);
    TEST_ASSERT_BITS_LOW(0x80, DAT_0023c1d8);
    TEST_ASSERT_EQUAL_UINT8(0, DAT_0023c12f);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_0023c220);
}

static ushort wall_spark_height(short pitch)
{
    DAT_0023beb4 = pitch;
    wall_in_front = 1;
    TEST_ASSERT_EQUAL_UINT(0, resolve_melee_swing_hit());
    TEST_ASSERT_EQUAL_INT(1, wall_collision);
    TEST_ASSERT_EQUAL_HEX16(0x1cb, wall_effect[0]);
    return wall_effect[1] & 0x7f;
}
static void test_looking_up_raises_the_wall_spark(void)
{
    /* SDL look-up uses negative pitch; a level strike lands at z=48. */
    TEST_ASSERT_EQUAL_UINT16(56, wall_spark_height(-0x1000));
}
static void test_looking_down_lowers_the_wall_spark(void)
{
    TEST_ASSERT_EQUAL_UINT16(40, wall_spark_height(0x1000));
}
static void test_level_look_keeps_the_wall_spark_at_strike_height(void)
{
    TEST_ASSERT_EQUAL_UINT16(48, wall_spark_height(0));
}
static void test_vertical_aim_rounds_small_pitch_toward_zero(void)
{
    const short pitches[] = {-511, -512, 511, 512};
    const ushort heights[] = {48, 49, 48, 47};
    for (unsigned i = 0; i < 4; i++) {
        wall_collision = 0;
        TEST_ASSERT_EQUAL_UINT16(heights[i], wall_spark_height(pitches[i]));
    }
}
static void test_blood_producing_monster_uses_loaded_data(void)
{
    load_real_monster_data();
    object_at(2)[0] = 0x40;
    object_at(2)[4] = 5;
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(0, effect_types[0]);
    TEST_ASSERT_LESS_THAN_UINT8(5, (byte)object_at(2)[4]);
}
static void test_bloodless_monster_still_uses_a_spark(void)
{
    load_real_monster_data();
    object_at(2)[0] = 0x4a;
    object_at(2)[4] = 20;
    candidate(0, 2, 0);
    TEST_ASSERT_EQUAL_UINT(1, process_melee_attack_swing());
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(0xb, effect_types[0]);
}
static void test_blood_height_offsets_cover_each_hit_zone(void)
{
    load_real_monster_data();
    object_at(2)[0] = 0x46; /* All four armor slots in this record are valid. */
    DAT_00100620 = 2;
    DAT_00100628 = 12;
    DAT_001005dc = 40;
    const int expected[] = {5, 3, 1, 7}; /* Original UU.exe table at 0x84f18. */
    for (int zone = 0; zone < 4; zone++) {
        object_at(2)[4] = 21;
        DAT_00100624 = zone;
        effects = 0;
        apply_melee_damage(4);
        TEST_ASSERT_EQUAL_INT(1, effects);
        TEST_ASSERT_EQUAL_INT(0, effect_types[0]);
        TEST_ASSERT_EQUAL_INT(expected[zone], effect_heights[0]);
    }
}
static void test_special_blood_hit_spawns_the_second_splat(void)
{
    load_real_monster_data();
    object_at(2)[0] = 0x46;
    object_at(2)[4] = 21;
    DAT_00100620 = 2;
    DAT_00100624 = 2;
    DAT_00100628 = 12;
    DAT_001005d8 = 1;
    apply_melee_damage(4);
    TEST_ASSERT_EQUAL_INT(2, effects);
    TEST_ASSERT_EQUAL_INT(0, effect_types[0]);
    TEST_ASSERT_EQUAL_INT(0, effect_types[1]);
    TEST_ASSERT_EQUAL_INT(1, effect_heights[0]);
    TEST_ASSERT_EQUAL_INT(4, effect_heights[1]);
}
static void test_blood_hit_outside_zones_uses_runtime_height(void)
{
    load_real_monster_data();
    object_at(2)[0] = 0x46;
    object_at(2)[4] = 21;
    DAT_00100620 = 2;
    DAT_00100624 = 4;
    DAT_00100628 = 12;
    DAT_001005dc = 40;
    apply_melee_damage(4);
    TEST_ASSERT_EQUAL_INT(1, effects);
    TEST_ASSERT_EQUAL_INT(0, effect_types[0]);
    TEST_ASSERT_EQUAL_INT(-40, effect_heights[0]);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_player_melee_swing_selects_critter);
    RUN_TEST(test_player_melee_swing_without_candidates_misses);
    RUN_TEST(test_player_melee_swing_does_not_hit_attacker);
    RUN_TEST(test_player_melee_swing_selects_nearest_critter);
    RUN_TEST(test_attack_facing_covers_all_heading_pairs);
    RUN_TEST(test_full_player_swing_applies_damage_to_critter);
    RUN_TEST(test_failed_skill_check_keeps_full_object_pointers);
    RUN_TEST(test_full_swing_without_target_skips_damage);
    RUN_TEST(test_critter_swing_at_same_faction_skips_damage);
    RUN_TEST(test_critter_swing_at_opposing_faction_preserves_pointers);
    RUN_TEST(test_lethal_player_swing_marks_critter_dead_and_awards_experience);
    RUN_TEST(test_already_dead_critter_does_not_award_experience_again);
    RUN_TEST(test_scripted_critter_can_refuse_death);
    RUN_TEST(test_critter_kill_does_not_award_player_experience);
    RUN_TEST(test_successful_critter_hit_redraws_hud_wipe);
    RUN_TEST(test_combat_hud_wipe_finishes_and_clears_dirty_bit);
    RUN_TEST(test_looking_up_raises_the_wall_spark);
    RUN_TEST(test_looking_down_lowers_the_wall_spark);
    RUN_TEST(test_level_look_keeps_the_wall_spark_at_strike_height);
    RUN_TEST(test_vertical_aim_rounds_small_pitch_toward_zero);
    RUN_TEST(test_blood_producing_monster_uses_loaded_data);
    RUN_TEST(test_bloodless_monster_still_uses_a_spark);
    RUN_TEST(test_blood_height_offsets_cover_each_hit_zone);
    RUN_TEST(test_special_blood_hit_spawns_the_second_splat);
    RUN_TEST(test_blood_hit_outside_zones_uses_runtime_height);
    return UNITY_END();
}
