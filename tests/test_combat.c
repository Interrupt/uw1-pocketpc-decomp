#include "unity.h"
#include "uw.h"
#include "src/headers/ordinal_stubs.h"

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
byte DAT_00100628, DAT_001005fc;
short DAT_0010061c;
undefined4 DAT_001005d8;
char DAT_00084f1c;
undefined DAT_001007d8;
undefined1 DAT_001007d0_backing[6144];
undefined1 DAT_001007d4_backing[8192];
static byte player_stats[256];
char *DAT_00086df8 = (char *)player_stats;
char *DAT_0023b82c;
static int skill_result, skill_checks, effects, impact_sounds;
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
    for (int slot = 1; slot < 256; slot++)
        if ((byte *)object == mobile_objects + slot * 27) return slot;
    TEST_FAIL_MESSAGE("Expected an actual mobile object pointer");
    return 0;
}
void refresh_experience_display(void) {}
void set_pending_music_track(uint track) { music_track = track; }
uint read_realtime_clock_units(void) { return 123; }
void grant_experience_points(int amount) { experience += amount; experience_awards++; }
void attempt_talk_interaction(char *object)
{ TEST_ASSERT_EQUAL_PTR(mobile_objects + 2 * 27, object); talks++; }
void cancel_weapon_swing(void) {}
void trigger_quest_milestone_cleanup_event(void) { TEST_FAIL_MESSAGE("Unexpected quest cleanup"); }

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
void set_hud_status_value(void) { return; }
undefined4 spawn_scheduled_effect_object(ushort *target, int type, int mode, int intensity,
                                        int height, int x, int y)
{
    TEST_ASSERT_EQUAL_PTR(expected_effect_target, target);
    TEST_ASSERT_EQUAL_INT(0xb, type);
    (void)mode; (void)intensity; (void)height; (void)x; (void)y;
    effects++;
    return 0;
}
undefined4 play_weapon_impact_sound(int result) { impact_sounds++; return result; }
bool apply_object_durability_damage(void) { TEST_FAIL_MESSAGE("Unexpected non-critter damage"); return false; }
undefined4 apply_object_destruction_effect(void) { TEST_FAIL_MESSAGE("Unexpected non-critter destruction"); return 0; }


void *Ordinal_1047(void *dest, int value, unsigned int count)
{ return memset(dest, value, count); }
long Ordinal_1053(void) { return 1; }
long Ordinal_2005(int divisor, int dividend) { return dividend / divisor; }
void project_position_by_heading(int heading, int distance, short *x, short *y)
{ (void)heading; (void)distance; (void)x; (void)y; }
void collision_height_envelope(int mode, int collision)
{
    TEST_ASSERT_EQUAL_INT(0, mode);
    TEST_ASSERT_EQUAL_INT(1, collision);
    DAT_00202c6c[0x14] = candidate_count;
}
void collision_build_height_field(int mode)
{ TEST_ASSERT_EQUAL_INT(0, mode); }
void FUN_00051dd0(void)
{
    DAT_00202c6c[0x15] = candidate_count;
    DAT_00202c6c[0x16] = 0;
}
void *FUN_000535fc(int slot)
{
    TEST_ASSERT_GREATER_THAN_INT(0, slot);
    TEST_ASSERT_LESS_THAN_INT(256, slot);
    TEST_ASSERT_LESS_THAN_INT(32, lookup_count);
    lookup_slots[lookup_count++] = slot;
    return mobile_objects + slot * 27;
}
undefined4 object_ptr_in_arena(ushort *object)
{ TEST_ASSERT_NOT_NULL(object); return 1; }
void spawn_blood_splat_object(int heading, int distance, void *position)
{ (void)heading; (void)distance; (void)position; wall_collision++; }

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
    candidate_count = lookup_count = wall_collision = 0;
    DAT_00100628 = DAT_001005fc = DAT_001005d8 = 0;
    DAT_0010061c = 6;
    skill_result = skill_checks = effects = impact_sounds = 0;
    experience = experience_awards = talks = death_sounds = 0;
    music_track = 0;
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
    return UNITY_END();
}
