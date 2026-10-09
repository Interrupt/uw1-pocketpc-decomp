#include "src/headers/ai.h"
#include "src/headers/combat.h"
#include "unity.h"

static uw_mobile_object_t npc;
uw_mobile_object_t *DAT_0010190c = &npc;
uw_mobile_object_t *g_player_object;
undefined4 DAT_00101734_backing[1];
short DAT_00101444, DAT_00101448;
undefined1 DAT_0023bf0c;
static uw_monster_type_props_t monster;
uw_monster_type_props_t *DAT_00101404 = &monster;
char *DAT_00101400;
int DAT_00101430;
ushort DAT_00101900;
undefined4 DAT_00101924;
int try_npc_special_ability_no_los(void)
{ TEST_FAIL_MESSAGE("Unexpected special ability"); return 0; }
uint adjust_heading_away_from_player(uint heading, uint distance)
{ (void)distance; TEST_FAIL_MESSAGE("Unexpected heading adjustment"); return heading; }
static int proximity, random_value;
long ce_rand(void) { return random_value; }
int refresh_npc_target_delta(void) { return 0; }
int detect_npc_wander_proximity(void *near, void *far)
{ (void)near; (void)far; return proximity; }
int compute_movement_heading(int dx, int dy)
{ TEST_ASSERT_EQUAL_INT(10, dx); TEST_ASSERT_EQUAL_INT(10, dy); return 3; }
void reset_cursor_confine_rect(void) { TEST_FAIL_MESSAGE("Unexpected conversation"); }
void attempt_talk_interaction(void *object)
{ (void)object; TEST_FAIL_MESSAGE("Unexpected conversation"); }
void setUp(void) {
    memset(&npc, 0xa5, sizeof npc);
    DAT_0010190c = &npc;
    g_player_object = &npc;
    DAT_00101734_backing[0] = 0;
    DAT_00101444 = DAT_00101448 = 10;
    proximity = random_value = 0;
    memset(&monster, 0, sizeof monster);
    DAT_00101430 = DAT_00101900 = DAT_00101924 = 0;
}
void tearDown(void) {}

static unsigned read_le_word(const unsigned char *bytes, unsigned offset)
{
    return bytes[offset] | (bytes[offset + 1] << 8);
}
static void store_word(unsigned char *bytes, unsigned offset, unsigned value)
{
    bytes[offset] = value;
    bytes[offset + 1] = value >> 8;
}
static void test_goal_update_preserves_frame_and_status_bits(void)
{
    for (unsigned old_goal = 0; old_goal < 16; ++old_goal) {
        for (unsigned goal = 0; goal < 256; ++goal) {
            for (unsigned frame = 0; frame < 16; ++frame) {
                unsigned char expected[27];
                unsigned target = goal * 37 + frame * 13;
                memset(&npc, 0xa5, sizeof npc);
                store_word((unsigned char *)&npc, 11,
                           (frame << 12) | (0x7b << 4) | old_goal);
                memcpy(expected, &npc, sizeof expected);
                /* Original UW1 masks expressed independently of bitfields. */
                if (old_goal == 4)
                    expected[13] = (expected[13] & 0xf0) | old_goal;
                store_word(expected, 11,
                           (frame << 12) | ((target & 255) << 4) | (goal & 15));
                npc_set_goal(goal, target);
                TEST_ASSERT_EQUAL_MEMORY(expected, &npc, sizeof expected);
            }
        }
    }
}
static void test_walk_target_update_preserves_swing_and_status_bits(void)
{
    for (unsigned old_target = 0; old_target <= 65535; ++old_target) {
        unsigned char expected[27];
        unsigned x = (old_target * 37) & 255;
        unsigned y = old_target * 19 + 7;
        unsigned heading = (old_target >> 8) & 255;
        memset(&npc, 0xa5, sizeof npc);
        store_word((unsigned char *)&npc, 15, old_target);
        store_word((unsigned char *)&npc, 13, old_target ^ 0x5a5a);
        ((unsigned char *)&npc)[24] = old_target >> 8;
        memcpy(expected, &npc, sizeof expected);
        if (x != (old_target & 63) || (y & 255) != ((old_target >> 6) & 63) ||
            heading != (expected[13] >> 4)) {
            store_word(expected, 15, (old_target & 0xf000) | (x & 63) | ((y & 63) << 6));
            store_word(expected, 13, (read_le_word(expected, 13) & 0xff0f) | ((heading & 15) << 4));
            expected[24] = (expected[24] | 0x20) & 0xbf;
        }
        npc_set_walk_target(x, y, heading);
        TEST_ASSERT_EQUAL_MEMORY(expected, &npc, sizeof expected);
    }
}
static void test_same_walk_target_keeps_path_flags_unchanged(void)
{
    for (unsigned flags = 0; flags < 256; ++flags) {
        unsigned char expected[27];
        memset(&npc, 0xa5, sizeof npc);
        store_word((unsigned char *)&npc, 15, 0xb000 | 17 | (41 << 6));
        ((unsigned char *)&npc)[13] = 0x73;
        ((unsigned char *)&npc)[24] = flags;
        memcpy(expected, &npc, sizeof expected);
        npc_set_walk_target(17, 41, 7);
        TEST_ASSERT_EQUAL_MEMORY(expected, &npc, sizeof expected);
    }
}
static void test_disengage_uses_arm_byte_offsets_and_preserves_other_storage(void)
{
    byte guarded[16 + 27 + 32], expected[sizeof guarded];
    for (unsigned goal = 0; goal <= 65535; ++goal) {
        for (unsigned mode = 0; mode < 4; ++mode) {
            memset(guarded, 0xa5, sizeof guarded);
            store_word(guarded, 16 + 11, goal);
            memcpy(expected, guarded, sizeof expected);
            DAT_0010190c = (uw_mobile_object_t *)(guarded + 16);
            DAT_00101734_backing[0] = 1;
            proximity = mode >> 1;
            random_value = mode & 1;
            /* ARM 0x31a94: goal +0xb, pitch +0x14, motion +0x13,
             * animation +0x15. Tile/cache word +0x16 is untouched. */
            unsigned result = (goal & 0xf01f) | 0x10;
            if (random_value)
                result = (result & 0xfff) | (((result >> 12) + 1) % 4) << 12;
            store_word(expected, 16 + 11, result);
            expected[16 + 20] = (0xa5 & 0xfe) | 6;
            expected[16 + 19] = 0x80;
            expected[16 + 21] = (0xa5 & 0xe0) | 0x20;
            if (!proximity) {
                expected[16 + 9] = 3 << 5;
                store_word(expected, 16 + 2, (0xa5a5 & 0xfc7f) | 3 << 7);
                expected[16 + 24] = 0xa5 & 0xe0;
            }
            npc_combat_disengage_tick();
            TEST_ASSERT_EQUAL_MEMORY(expected, guarded, sizeof guarded);
        }
    }
}

static void test_combat_position_uses_arm_position_heading_and_animation_offsets(void)
{
    byte guarded[16 + 27 + 32], expected[sizeof guarded], target[27];
    DAT_00101734_backing[0] = 1;
    DAT_00101400 = (char *)target;
    monster.movement_flags = 0x80;
    monster.magic_power = 7;
    for (unsigned z = 0; z < 128; ++z) {
        for (unsigned frame = 0; frame < 16; ++frame) {
            for (random_value = 0; random_value < 2; ++random_value) {
                memset(guarded, 0xa5, sizeof guarded);
                memset(target, 0, sizeof target);
                target[2] = z;
                unsigned position = 0xa600 | z;
                unsigned goal = frame << 12 | ((z * 7 + frame) & 0xfff);
                store_word(guarded, 16 + 2, position);
                store_word(guarded, 16 + 11, goal);
                memcpy(expected, guarded, sizeof expected);
                DAT_0010190c = (uw_mobile_object_t *)(guarded + 16);
                /* ARM 0x31214: flight pitch depends on +2 Z, not +4 quality.
                 * The close-combat branch changes heading and goal-frame bytes,
                 * preserving links, tile/cache state and neighboring objects. */
                expected[16 + 20] = (0xa5 & 7) ^ ((z < 0x6f ? 15 : 13) + random_value) << 3;
                expected[16 + 9] = 7 << 5;
                store_word(expected, 16 + 2, (position & 0xfc7f) | 3 << 7);
                expected[16 + 24] = 0xa5 & 0xe0;
                expected[16 + 21] = (0xa5 & 199) | 7;
                expected[16 + 19] = (0xa5 & 0x80) | 4;
                store_word(expected, 16 + 11, (goal & 0xfff) | ((frame + 1) % 4) << 12);
                npc_combat_position_tick();
                TEST_ASSERT_EQUAL_MEMORY(expected, guarded, sizeof guarded);
            }
        }
    }
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_goal_update_preserves_frame_and_status_bits);
    RUN_TEST(test_walk_target_update_preserves_swing_and_status_bits);
    RUN_TEST(test_same_walk_target_keeps_path_flags_unchanged);
    RUN_TEST(test_disengage_uses_arm_byte_offsets_and_preserves_other_storage);
    RUN_TEST(test_combat_position_uses_arm_position_heading_and_animation_offsets);
    return UNITY_END();
}
