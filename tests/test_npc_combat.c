#include "combat_fixture.h"
#include "game_fixture.h"

void setUp(void) { combat_fixture_reset(); }
void tearDown(void) { combat_fixture_dispose(); }

extern FILE *monster_data;
extern uw_melee_type_props_t g_melee_type_props[16];
extern uw_ranged_type_props_t g_ranged_type_props[16];
extern uw_armor_type_props_t g_armor_type_props[32];
void load_armor_variant_tables(int file_handle);

static void test_weapon_loader_preserves_all_uw1_disk_rows(void)
{
    byte expected[128 + 48 + 128];
    FILE *file = uw_test_open_data("DATA/OBJECTS.DAT");
    TEST_ASSERT_NOT_NULL(file);
    TEST_ASSERT_EQUAL_INT(0, fseek(file, 2, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(sizeof expected, fread(expected, 1, sizeof expected, file));
    fclose(file);
    monster_data = uw_test_open_data("DATA/OBJECTS.DAT");
    TEST_ASSERT_EQUAL_INT(0, fseek(monster_data, 2, SEEK_SET));
    memset(g_melee_type_props, 0xa5, sizeof g_melee_type_props);
    memset(g_ranged_type_props, 0xa5, sizeof g_ranged_type_props);
    memset(g_armor_type_props, 0xa5, sizeof g_armor_type_props);
    load_armor_variant_tables(1);
    TEST_ASSERT_EQUAL_INT(0x132, ftell(monster_data));
    fclose(monster_data);
    monster_data = NULL;
    TEST_ASSERT_EQUAL_UINT(128, sizeof g_melee_type_props);
    TEST_ASSERT_EQUAL_UINT(48, sizeof g_ranged_type_props);
    TEST_ASSERT_EQUAL_UINT(128, sizeof g_armor_type_props);
    TEST_ASSERT_EQUAL_MEMORY(expected, g_melee_type_props, 128);
    TEST_ASSERT_EQUAL_MEMORY(expected + 128, g_ranged_type_props, 48);
    TEST_ASSERT_EQUAL_MEMORY(expected + 176, g_armor_type_props, 128);
}

extern uw_container_type_props_t g_container_type_props[16];
extern uw_light_type_props_t g_light_type_props[16];
extern uw_animation_type_props_t g_animation_type_props[16];
void load_light_food_effect_tables(int file_handle);
void load_class7_variant_effect_table(int file_handle);

static void test_container_light_animation_loaders_preserve_disk_rows(void)
{
    byte expected[48 + 32], animation[64];
    FILE *file = uw_test_open_data("DATA/OBJECTS.DAT");
    TEST_ASSERT_EQUAL_INT(0, fseek(file, 0xd32, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(sizeof expected, fread(expected, 1, sizeof expected, file));
    TEST_ASSERT_EQUAL_INT(0, fseek(file, 0xda2, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(sizeof animation, fread(animation, 1, sizeof animation, file));
    fclose(file);
    monster_data = uw_test_open_data("DATA/OBJECTS.DAT");
    TEST_ASSERT_EQUAL_INT(0, fseek(monster_data, 0xd32, SEEK_SET));
    memset(g_container_type_props, 0xa5, sizeof g_container_type_props);
    memset(g_light_type_props, 0xa5, sizeof g_light_type_props);
    memset(g_animation_type_props, 0xa5, sizeof g_animation_type_props);
    load_light_food_effect_tables(1);
    /* ARM class 2 also reads 16 bytes for food; class 6 reads the next 16. */
    TEST_ASSERT_EQUAL_INT(0xd92, ftell(monster_data));
    TEST_ASSERT_EQUAL_INT(0, fseek(monster_data, 16, SEEK_CUR));
    load_class7_variant_effect_table(1);
    TEST_ASSERT_EQUAL_INT(0xde2, ftell(monster_data));
    fclose(monster_data);
    monster_data = NULL;
    TEST_ASSERT_EQUAL_UINT(48, sizeof g_container_type_props);
    TEST_ASSERT_EQUAL_UINT(32, sizeof g_light_type_props);
    TEST_ASSERT_EQUAL_UINT(64, sizeof g_animation_type_props);
    TEST_ASSERT_EQUAL_MEMORY(expected, g_container_type_props, 48);
    TEST_ASSERT_EQUAL_MEMORY(expected + 48, g_light_type_props, 32);
    TEST_ASSERT_EQUAL_MEMORY(animation, g_animation_type_props, 64);
    for (unsigned row = 0; row < 16; ++row) {
        TEST_ASSERT_EQUAL_UINT16(expected[row * 3 + 1] | expected[row * 3 + 2] << 8,
                                  g_container_type_props[row].acceptance_mask);
        TEST_ASSERT_EQUAL_UINT8(expected[48 + row * 2], g_light_type_props[row].decay_interval);
        TEST_ASSERT_EQUAL_UINT8(expected[49 + row * 2], g_light_type_props[row].brightness);
        TEST_ASSERT_EQUAL_UINT16(animation[row * 4] | animation[row * 4 + 1] << 8,
                                  g_animation_type_props[row].flags);
    }
}

static void test_monster_loader_preserves_all_uw1_disk_rows(void)
{
    unsigned char expected[64 * 48];
    FILE *file = uw_test_open_data("DATA/OBJECTS.DAT");
    TEST_ASSERT_NOT_NULL(file);
    TEST_ASSERT_EQUAL_INT(0, fseek(file, 0x132, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(sizeof expected, fread(expected, 1, sizeof expected, file));
    fclose(file);
    load_real_monster_data();
    TEST_ASSERT_EQUAL_UINT(sizeof expected, sizeof g_monster_type_props);
    TEST_ASSERT_EQUAL_MEMORY(expected, g_monster_type_props, sizeof expected);
}

/* Bragit is the human (0x5a), identity 19, in the shipped level-one map.
   Collision candidates are controlled; attack, skill rolls, dice, resistance
   and HP changes use the original game functions. */
static void prepare_bragit(void)
{
    byte level[UW_TEST_LEVEL_SIZE];
    combat_create_character();
    load_real_monster_data();
    uw_test_load_object_properties(((byte *)g_object_type_props), sizeof g_object_type_props);
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
    memcpy(((byte *)g_monster_type_props) + 63 * 48, DAT_0023be74, 48);
    DAT_0023be74 = (char *)((byte *)g_monster_type_props) + 63 * 48;
    DAT_0023b82c = (char *)g_player_object;
    DAT_00101404 = &g_monster_type_props[(26 * 48) / 0x30];
    expected_effect_target = g_player_object;
    /* Face the attacker: the original facing bonus is zero head-on. */
    unsigned heading = ((object_at(2)[1] >> 7) + 4) & 7;
    ((ushort *)g_player_object)[1] = (((ushort *)g_player_object)[1] & ~0x380) | (heading << 7);
    candidate(0, 1, 0);
}

static void reset_swing(void)
{
    lookup_count = effects = 0;
    ((ushort *)g_player_object)[4] = 100;
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
    TEST_ASSERT_EQUAL_UINT8(45, (byte)*(char *)&DAT_00101404->max_hp);
    TEST_ASSERT_EQUAL_UINT8(12,
                            (byte)*(char *)&DAT_00101404->equipment_damage);
    TEST_ASSERT_EQUAL_HEX8(4, ((byte *)object_at(2))[0xe] & 4); /* enhanced NPC */
    const int attack[3] = {9, 6, 10}, damage[3] = {8, 10, 6};
    for (int style = 0; style < 3; style++) {
        TEST_ASSERT_EQUAL_UINT8(attack[style],
                                (byte)((char *)DAT_00101404)[0x13 + style * 3]);
        TEST_ASSERT_EQUAL_UINT8(damage[style],
                                (byte)((char *)DAT_00101404)[0x14 + style * 3]);
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
    TEST_ASSERT_EQUAL_UINT8(95, (byte)((ushort *)g_player_object)[4]);
    TEST_ASSERT_EQUAL_UINT8(2, (byte)((ushort *)g_player_object)[9]);
}

static void test_npc_attack_strength_scales_damage_instead_of_always_one(void)
{
    prepare_bragit();
    TEST_ASSERT_EQUAL_INT(1, swing(0, 50, 5));
    TEST_ASSERT_EQUAL_UINT8(95, (byte)((ushort *)g_player_object)[4]);
    TEST_ASSERT_EQUAL_INT(1, swing(0, 255, 5));
    TEST_ASSERT_EQUAL_UINT8(75, (byte)((ushort *)g_player_object)[4]);
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
    TEST_ASSERT_EQUAL_UINT8(90, (byte)((ushort *)g_player_object)[4]);
}

static void test_npc_critical_hit_and_miss_use_original_skill_buckets(void)
{
    prepare_bragit();
    DAT_0023be74[0x12] = 20;
    TEST_ASSERT_EQUAL_INT(0, swing(0, 128, 0));
    TEST_ASSERT_EQUAL_UINT8(100, (byte)((ushort *)g_player_object)[4]);
    TEST_ASSERT_EQUAL_INT(1, swing(0, 128, 30));
    TEST_ASSERT_EQUAL_UINT32(1, DAT_001005d8);
    /* Enhanced pool 18 doubles to 36: 6d6, RNG 30 rolls six ones. */
    TEST_ASSERT_EQUAL_INT(6, DAT_0010061c);
    TEST_ASSERT_EQUAL_UINT8(94, (byte)((ushort *)g_player_object)[4]);
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
        TEST_ASSERT_EQUAL_UINT8(100 - damage[style],
                                (byte)((ushort *)g_player_object)[4]);
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
    RUN_TEST(test_monster_loader_preserves_all_uw1_disk_rows);
    RUN_TEST(test_weapon_loader_preserves_all_uw1_disk_rows);
    RUN_TEST(test_container_light_animation_loaders_preserve_disk_rows);
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
