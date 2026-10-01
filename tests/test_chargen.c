#include "unity.h"
#include "src/headers/chargen.h"

/* Fixtures replace game-owned storage and services, never the rules under test. */
static char record[256], attributes[16];
static ushort player_object[16];
char *DAT_00086df8 = record;
char *DAT_0023be74 = attributes;
ushort *g_player_object = player_object;
short DAT_00201b68;
undefined1 DAT_000fb860_backing[256];
undefined1 DAT_000fb8f0_backing[1680];

static int random_values[64], random_count, random_index;
static int dice_calls, hazard_calls, equipment_calls, reset_calls;
static int trained[6], trained_count;

long Ordinal_1053(void)
{
    TEST_ASSERT_LESS_THAN_INT(random_count, random_index);
    return random_values[random_index++];
}

void *Ordinal_1047(void *ptr, int value, unsigned int count)
{
    return memset(ptr, value, count);
}

int roll_dice_sum(count, sides)
int count;
short sides;
{
    /* Deterministic roll totals distinguish skills from attributes. */
    if (dice_calls < 20) {
        TEST_ASSERT_EQUAL_INT(3, count);
        TEST_ASSERT_EQUAL_INT(4, sides);
        dice_calls++;
        return 6;
    }
    TEST_ASSERT_EQUAL_INT(2, count);
    TEST_ASSERT_EQUAL_INT(10, sides);
    dice_calls++;
    return 11;
}

void FUN_0005d2b0(void) { reset_calls++; }
void refresh_player_equipment_effects(void) { equipment_calls++; }
undefined4 recompute_level7_hazard_from_character_level(int level)
{
    TEST_ASSERT_EQUAL_INT(1, level);
    hazard_calls++;
    return 0;
}
void advance_skill_training(skill)
short skill;
{
    TEST_ASSERT_LESS_THAN_INT(6, trained_count);
    trained[trained_count++] = skill;
}

void setUp(void)
{
    memset(record, 0xa5, sizeof(record));
    memset(attributes, 0, sizeof(attributes));
    memset(player_object, 0, sizeof(player_object));
    /* Match character_generator_start's SKILLS.DAT load without its UI. */
    FILE *skills = fopen(UW_TEST_DATA_DIR "/DATA/SKILLS.DAT", "rb");
    TEST_ASSERT_NOT_NULL_MESSAGE(skills, "data/DATA/SKILLS.DAT is required");
    memset(DAT_000fb8f0_backing, 0, sizeof(DAT_000fb8f0_backing));
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(0x28,
        fread(DAT_000fb8f0_backing, 1, 0x348, skills));
    TEST_ASSERT_EQUAL_INT(0, fclose(skills));
    memcpy(DAT_000fb860_backing, DAT_000fb8f0_backing, 0x20);
    memset(random_values, 0, sizeof(random_values));
    random_count = random_index = dice_calls = hazard_calls = 0;
    equipment_calls = reset_calls = trained_count = 0;
    DAT_00201b68 = 0;
    attributes[4] = 40;
}

void tearDown(void)
{
    TEST_ASSERT_EQUAL_INT(random_count, random_index);
}

static void prepare_initial_randomness(void)
{
    random_values[0] = 4; /* portrait */
    random_values[1] = 1; /* sex */
    random_values[2] = 5; /* initial object stat adjustment */
    random_count = 3;
}

static void test_reset_creates_blank_stats_and_new_character_defaults(void)
{
    prepare_initial_randomness();
    init_new_character_record(1);
    for (int i = 0; i < 20; i++) TEST_ASSERT_EQUAL_UINT8(0, record[0x21 + i]);
    for (int i = 5; i < 8; i++) TEST_ASSERT_EQUAL_UINT8(0, attributes[i]);
    TEST_ASSERT_EQUAL_INT(0, dice_calls);
    TEST_ASSERT_EQUAL_UINT8(1, record[0x3d]);
    TEST_ASSERT_EQUAL_UINT8(0x40, record[0x3a]);
    TEST_ASSERT_EQUAL_UINT8(0x40, record[0x3b]);
    TEST_ASSERT_EQUAL_UINT8(0x18, record[0x47]);
    TEST_ASSERT_EQUAL_UINT8(0x18, record[0x48]);
    TEST_ASSERT_EQUAL_UINT8(0x18, record[0x49]);
    unsigned int quest_bits;
    memcpy(&quest_bits, record + 0x65, sizeof(quest_bits));
    TEST_ASSERT_EQUAL_HEX32(getenv("UW_DEBUG_FORCE_QUEST_TEST") ? 0x12345678 : 0,
                           quest_bits);
    for (int i = 0x69; i <= 0x6c; i++) TEST_ASSERT_EQUAL_UINT8(0, record[i]);
    for (int i = 0xc2; i < 0xca; i++) TEST_ASSERT_EQUAL_UINT8(0, record[i]);
    TEST_ASSERT_EQUAL_UINT8(0, record[0x70]);
    TEST_ASSERT_EQUAL_UINT8(0x35, record[0x8a]);
    TEST_ASSERT_EQUAL_UINT8(0, record[0xaf]);
    TEST_ASSERT_EQUAL_UINT8(4, ((byte)record[100] >> 2) & 7);
    TEST_ASSERT_EQUAL_UINT8(1, ((byte)record[100] >> 1) & 1);
    TEST_ASSERT_EQUAL_UINT8(5, (byte)record[100] >> 5); /* class preserved */
    TEST_ASSERT_EQUAL_UINT8(29, ((byte *)player_object)[8]);
    TEST_ASSERT_EQUAL_INT(1, DAT_00201b68);
    TEST_ASSERT_EQUAL_INT(1, hazard_calls);
    TEST_ASSERT_EQUAL_INT(1, equipment_calls);
    TEST_ASSERT_EQUAL_INT(1, reset_calls);
}

static void test_finalization_rolls_twenty_skills_and_three_attributes(void)
{
    prepare_initial_randomness();
    init_new_character_record(0);
    TEST_ASSERT_EQUAL_INT(23, dice_calls);
    for (int i = 0; i < 20; i++) TEST_ASSERT_EQUAL_UINT8(6, record[0x21 + i]);
    for (int i = 5; i < 8; i++) TEST_ASSERT_EQUAL_UINT8(21, attributes[i]);
    TEST_ASSERT_EQUAL_UINT8(40, attributes[4]);
}

static void test_each_class_uses_its_own_base_attributes(void)
{
    for (int cls = 0; cls < 8; cls++) {
        const byte *row = DAT_000fb860_backing + cls * 4;
        random_index = 0;
        random_count = row[3] * 2;
        for (int i = 0; i < row[3]; i++) {
            random_values[i * 2] = 0; /* spend one point */
            random_values[i * 2 + 1] = i % 3;
        }
        record[100] = (cls << 5) | 0x1b;
        memset(record + 0x21, 9, 20);
        reroll_attributes_for_class_race();
        for (int stat = 0; stat < 3; stat++)
            TEST_ASSERT_EQUAL_UINT8(row[stat] + row[3] / 3 + (stat < row[3] % 3),
                                   attributes[5 + stat]);
        TEST_ASSERT_EQUAL_INT(random_count, random_index);
        for (int skill = 0; skill < 20; skill++)
            TEST_ASSERT_EQUAL_UINT8(0, record[0x21 + skill]);
        TEST_ASSERT_EQUAL_UINT8((cls << 5) | 0x1b, record[100]);
        TEST_ASSERT_EQUAL_UINT8(40, ((byte *)player_object)[8]);
    }
    TEST_ASSERT_EQUAL_INT(8, hazard_calls);
}

static void test_bonus_pool_caps_attributes_and_spends_remainder(void)
{
    record[100] = 3 << 5;
    const byte class_row[] = {29, 20, 10, 6};
    memcpy(DAT_000fb860_backing + 12, class_row, sizeof(class_row));
    /* Try +4 to stat 0 (only +1 fits), +4 to stat 1, then the last +1. */
    const int rolls[] = {3, 0, 3, 1, 3, 2};
    memcpy(random_values, rolls, sizeof(rolls));
    random_count = 6;
    reroll_attributes_for_class_race();
    TEST_ASSERT_EQUAL_UINT8(30, attributes[5]);
    TEST_ASSERT_EQUAL_UINT8(24, attributes[6]);
    TEST_ASSERT_EQUAL_UINT8(11, attributes[7]);
}

static void test_skill_tree_collects_leaves_and_stops_at_five(void)
{
    const char tree[] = {1, 0, 1, 3, 1, 7, 1, 12, 1, 19};
    char picks[6] = {20, 20, 20, 20, 20, 99}, field[20] = {0};
    byte cursor = 0;
    record[100] = 0;
    TEST_ASSERT_EQUAL_UINT32(0, advance_skill_tree_node(&cursor, picks, field, tree));
    const char expected[] = {0, 3, 7, 12, 19, 99};
    TEST_ASSERT_EQUAL_INT8_ARRAY(expected, picks, 6);
    TEST_ASSERT_EQUAL_UINT8(5, cursor);
    TEST_ASSERT_EQUAL_UINT32(0, advance_skill_tree_node(&cursor, picks, field, tree));
    TEST_ASSERT_EQUAL_INT8_ARRAY(expected, picks, 6);
}

static void test_skill_tree_selects_class_and_resumes_at_cursor(void)
{
    const char tree[] = {1, 1, 1, 2, 1, 3, 1, 4, 1, 5,
                         1, 6, 1, 7, 1, 8, 1, 9, 1, 10};
    char picks[6] = {19, 18, 20, 20, 20, 99}, field[20] = {0};
    byte cursor = 2;
    record[100] = 1 << 5;
    TEST_ASSERT_EQUAL_UINT32(0, advance_skill_tree_node(&cursor, picks, field, tree));
    const char expected[] = {19, 18, 8, 9, 10, 99};
    TEST_ASSERT_EQUAL_INT8_ARRAY(expected, picks, 6);
}

static void test_skill_tree_branch_populates_choices_then_resumes(void)
{
    const char tree[] = {1, 2, 2, 5, 9, 1, 7, 1, 12, 1, 19};
    char picks[6] = {20, 20, 20, 20, 20, 99}, field[20] = {0};
    int list_offset = 1000;
    memcpy(field + 6, &list_offset, sizeof(list_offset));
    byte cursor = 0;
    record[100] = 0;
    TEST_ASSERT_EQUAL_UINT32(1, advance_skill_tree_node(&cursor, picks, field, tree));
    TEST_ASSERT_EQUAL_UINT8(2, cursor);
    TEST_ASSERT_EQUAL_UINT8(2, picks[0]);
    TEST_ASSERT_EQUAL_UINT8(20, picks[1]);
    TEST_ASSERT_EQUAL_UINT8(2, field[10]);
    TEST_ASSERT_EQUAL_UINT8(0, field[11]);
    TEST_ASSERT_EQUAL_UINT8(5 + 31, DAT_000fb8f0_backing[1000]);
    TEST_ASSERT_EQUAL_UINT8(9 + 31, DAT_000fb8f0_backing[1002]);
    TEST_ASSERT_EQUAL_UINT8(0, DAT_000fb8f0_backing[1001]);
    picks[1] = 9; /* confirmed choice normally supplied by input code */
    TEST_ASSERT_EQUAL_UINT32(0, advance_skill_tree_node(&cursor, picks, field, tree));
    const char expected[] = {2, 9, 7, 12, 19, 99};
    TEST_ASSERT_EQUAL_INT8_ARRAY(expected, picks, 6);
}

static void test_empty_skill_nodes_use_unselected_sentinel(void)
{
    const char tree[] = {0};
    char picks[6] = {0, 0, 0, 0, 0, 99}, field[20] = {0};
    byte cursor = 0;
    record[100] = 0;
    TEST_ASSERT_EQUAL_UINT32(0, advance_skill_tree_node(&cursor, picks, field, tree));
    const char expected[] = {20, 20, 20, 20, 20, 99};
    TEST_ASSERT_EQUAL_INT8_ARRAY(expected, picks, 6);
}

static void test_confirmed_picks_train_valid_skills_and_skip_sentinels(void)
{
    char picks[] = {0, 19, 20, (char)255, 7, 20};
    TEST_ASSERT_EQUAL_INT(3, apply_confirmed_skill_picks(0, picks));
    const int expected[] = {0, 19, 7};
    TEST_ASSERT_EQUAL_INT(3, trained_count);
    TEST_ASSERT_EQUAL_INT_ARRAY(expected, trained, 3);
}

static void test_confirmed_picks_resume_without_retraining_previous_choices(void)
{
    char picks[] = {1, 2, 3, 4, 5, 6};
    TEST_ASSERT_EQUAL_INT(6, apply_confirmed_skill_picks(3, picks));
    const int expected[] = {4, 5, 6};
    TEST_ASSERT_EQUAL_INT_ARRAY(expected, trained, 3);
    TEST_ASSERT_EQUAL_INT(6, apply_confirmed_skill_picks(6, picks));
    TEST_ASSERT_EQUAL_INT(3, trained_count);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_reset_creates_blank_stats_and_new_character_defaults);
    RUN_TEST(test_finalization_rolls_twenty_skills_and_three_attributes);
    RUN_TEST(test_each_class_uses_its_own_base_attributes);
    RUN_TEST(test_bonus_pool_caps_attributes_and_spends_remainder);
    RUN_TEST(test_skill_tree_collects_leaves_and_stops_at_five);
    RUN_TEST(test_skill_tree_selects_class_and_resumes_at_cursor);
    RUN_TEST(test_skill_tree_branch_populates_choices_then_resumes);
    RUN_TEST(test_empty_skill_nodes_use_unselected_sentinel);
    RUN_TEST(test_confirmed_picks_train_valid_skills_and_skip_sentinels);
    RUN_TEST(test_confirmed_picks_resume_without_retraining_previous_choices);
    return UNITY_END();
}
