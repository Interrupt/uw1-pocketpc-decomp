#include "combat_fixture.h"
#include "game_fixture.h"

void setUp(void) { combat_fixture_reset(); }
void tearDown(void) { combat_fixture_dispose(); }

/* Bragit is the human (0x5a), identity 19, in the shipped level-one map.
   Collision candidates are controlled; attack, skill rolls, dice, resistance
   and HP changes use the original game functions. */
static void prepare_bragit(void)
{
    byte level[UW_TEST_LEVEL_SIZE];
    combat_create_character();
    load_real_monster_data();
    uw_test_load_object_properties(DAT_00202c90_backing, sizeof DAT_00202c90_backing);
    uw_test_load_map(level, sizeof level, 1);
    ushort *bragit = NULL;
    for (unsigned slot = 1; slot < 256; slot++) {
        ushort *object = uw_test_level_object(level, sizeof level, slot);
        if ((*object & 0x1ff) == 0x5a && ((byte *)object)[0x1a] == 19) {
            TEST_ASSERT_NULL_MESSAGE(bragit, "Bragit must be unique");
            bragit = object;
        }
    }
    TEST_ASSERT_NOT_NULL(bragit);
    memcpy(object_at(2), bragit, 27);
    /* Player attributes share monster class 63's record in the actual game. */
    memcpy(DAT_001007d0_backing + 63 * 48, DAT_0023be74, 48);
    DAT_0023be74 = (char *)DAT_001007d0_backing + 63 * 48;
    DAT_0023b82c = (char *)g_player_object;
    DAT_00101404 = (char *)DAT_001007d0_backing + 26 * 48;
    expected_effect_target = g_player_object;
    /* Face the attacker: the original facing bonus is zero head-on. */
    unsigned heading = ((object_at(2)[1] >> 7) + 4) & 7;
    g_player_object[1] = (g_player_object[1] & ~0x380) | (heading << 7);
    candidate(0, 1, 0);
}

static void reset_swing(void)
{
    lookup_count = effects = 0;
    g_player_object[4] = 100;
}

static int swing(int style, int strength, int random)
{
    reset_swing();
    combat_random_roll = random;
    return resolve_npc_melee_attack((byte *)object_at(2), 4, strength, style, 0);
}

static void test_bragit_stats_are_loaded_from_objects_dat(void)
{
    prepare_bragit();
    TEST_ASSERT_EQUAL_HEX16(0x5a, *object_at(2) & 0x1ff);
    TEST_ASSERT_EQUAL_UINT8(50, ((byte *)object_at(2))[8]);
    TEST_ASSERT_EQUAL_UINT8(45, (byte)DAT_00101404[4]);
    TEST_ASSERT_EQUAL_UINT8(12, (byte)DAT_00101404[0x11]);
    TEST_ASSERT_EQUAL_HEX8(4, ((byte *)object_at(2))[0xe] & 4); /* enhanced NPC */
    const int attack[3] = {9, 6, 10}, damage[3] = {8, 10, 6};
    for (int style = 0; style < 3; style++) {
        TEST_ASSERT_EQUAL_UINT8(attack[style], (byte)DAT_00101404[0x13 + style * 3]);
        TEST_ASSERT_EQUAL_UINT8(damage[style], (byte)DAT_00101404[0x14 + style * 3]);
    }
}

static void test_bragit_hit_rates_match_arm_skill_math_for_each_attack(void)
{
    prepare_bragit();
    const int attack[3] = {15, 12, 16}; /* attack byte + half the dexterity byte */
    const int unarmoured_hits[3] = {31, 31, 31};
    const int defended_hits[3] = {20, 16, 20};
    for (int defense = 0; defense <= 20; defense += 20) {
        DAT_0023be74[0x12] = defense;
        for (int style = 0; style < 3; style++) {
            int hits = 0;
            for (int roll = 0; roll < 31; roll++) {
                hits += swing(style, 128, roll) != 0;
                TEST_ASSERT_EQUAL_INT(attack[style] + 7 + roll % 6, DAT_00100608);
            }
            TEST_ASSERT_EQUAL_INT(defense ? defended_hits[style] : unarmoured_hits[style], hits);
        }
    }
}

static void test_bragit_normal_hit_rolls_damage_and_reduces_player_hp(void)
{
    prepare_bragit();
    TEST_ASSERT_EQUAL_INT(1, swing(0, 128, 1));
    /* Enhanced Bragit adds 5 to pool 8: 2d6 + 1d1, RNG 1 rolls 2 + 2 + 1. */
    TEST_ASSERT_EQUAL_INT(5, DAT_0010061c);
    TEST_ASSERT_EQUAL_UINT32(0, DAT_001005d8);
    TEST_ASSERT_EQUAL_UINT8(95, (byte)g_player_object[4]);
    TEST_ASSERT_EQUAL_UINT8(2, (byte)g_player_object[9]);
}

static void test_npc_attack_strength_scales_damage_instead_of_always_one(void)
{
    prepare_bragit();
    TEST_ASSERT_EQUAL_INT(1, swing(0, 50, 5));
    TEST_ASSERT_EQUAL_UINT8(95, (byte)g_player_object[4]);
    TEST_ASSERT_EQUAL_INT(1, swing(0, 255, 5));
    TEST_ASSERT_EQUAL_UINT8(75, (byte)g_player_object[4]);
}

static void test_player_armor_reduces_npc_hit_chance_and_landed_damage(void)
{
    prepare_bragit();
    DAT_0023be74[0x12] = 10;
    memset(DAT_0010060c_backing, 4, 4);
    int hits = 0;
    for (int roll = 0; roll < 31; roll++) hits += swing(0, 128, roll) != 0;
    TEST_ASSERT_EQUAL_INT(26, hits);
    /* Flat armor is separate from the hit-chance penalty. */
    for (int zone = 0; zone < 4; zone++) DAT_0023be74[zone] = 3;
    TEST_ASSERT_EQUAL_INT(1, swing(0, 128, 5));
    TEST_ASSERT_EQUAL_UINT8(90, (byte)g_player_object[4]);
}

static void test_npc_critical_hit_and_miss_use_original_skill_buckets(void)
{
    prepare_bragit();
    DAT_0023be74[0x12] = 20;
    TEST_ASSERT_EQUAL_INT(0, swing(0, 128, 0));
    TEST_ASSERT_EQUAL_UINT8(100, (byte)g_player_object[4]);
    TEST_ASSERT_EQUAL_INT(1, swing(0, 128, 30));
    TEST_ASSERT_EQUAL_UINT32(1, DAT_001005d8);
    /* Enhanced pool 18 doubles to 36: 6d6, RNG 30 rolls six ones. */
    TEST_ASSERT_EQUAL_INT(6, DAT_0010061c);
    TEST_ASSERT_EQUAL_UINT8(94, (byte)g_player_object[4]);
}

static void test_non_enhanced_npc_uses_base_attack_and_damage_stats(void)
{
    prepare_bragit();
    ((byte *)object_at(2))[0xe] &= ~4;
    const int attack[3] = {15, 12, 16};
    /* Pools 8, 10 and 6 are d6+d2, d6+d4 and d6, respectively. */
    const int damage[3] = {8, 8, 6};
    for (int style = 0; style < 3; style++) {
        TEST_ASSERT_EQUAL_INT(1, swing(style, 128, 5));
        TEST_ASSERT_EQUAL_INT(attack[style], DAT_00100608);
        TEST_ASSERT_EQUAL_INT(damage[style], DAT_0010061c);
        TEST_ASSERT_EQUAL_UINT8(100 - damage[style], (byte)g_player_object[4]);
    }
}

static void test_real_damage_dice_cover_minimum_and_maximum(void)
{
    combat_random_roll = 0;
    TEST_ASSERT_EQUAL_INT(2, roll_dice_sum(2, 6));
    combat_random_roll = 5;
    TEST_ASSERT_EQUAL_INT(12, roll_dice_sum(2, 6));
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_bragit_stats_are_loaded_from_objects_dat);
    RUN_TEST(test_bragit_hit_rates_match_arm_skill_math_for_each_attack);
    RUN_TEST(test_bragit_normal_hit_rolls_damage_and_reduces_player_hp);
    RUN_TEST(test_npc_attack_strength_scales_damage_instead_of_always_one);
    RUN_TEST(test_player_armor_reduces_npc_hit_chance_and_landed_damage);
    RUN_TEST(test_npc_critical_hit_and_miss_use_original_skill_buckets);
    RUN_TEST(test_non_enhanced_npc_uses_base_attack_and_damage_stats);
    RUN_TEST(test_real_damage_dice_cover_minimum_and_maximum);
    return UNITY_END();
}
