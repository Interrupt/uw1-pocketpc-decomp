#include "game_fixture.h"
#include "chargen_fixture.h"

void setUp(void) { chargen_fixture_reset(); }
void tearDown(void) { chargen_fixture_dispose(); }

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
    TEST_ASSERT_EQUAL_UINT8(19, ((byte *)player_object)[8]);
    TEST_ASSERT_EQUAL_INT(1, DAT_00201b68);
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
    TEST_ASSERT_EQUAL_UINT8(34, attributes[4]);
    TEST_ASSERT_EQUAL_UINT8(18, record[0x38]);
    TEST_ASSERT_EQUAL_UINT8(18, record[0x37]);
    TEST_ASSERT_EQUAL_UINT16(420, g_player_max_carry_weight);
    TEST_ASSERT_EQUAL_INT16(0, g_player_carry_weight);
}

static void test_each_class_uses_its_own_base_attributes(void)
{
    record[0x3d] = 1;
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
        TEST_ASSERT_EQUAL_UINT8(30 + (byte)attributes[5] / 5, ((byte *)player_object)[8]);
        TEST_ASSERT_EQUAL_UINT16((byte)attributes[5] * 20, g_player_max_carry_weight);
    }
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
    char tree[] = {1, 0, 1, 3, 1, 7, 1, 12, 1, 19};
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
    char tree[] = {1, 1, 1, 2, 1, 3, 1, 4, 1, 5,
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
    char tree[] = {1, 2, 2, 5, 9, 1, 7, 1, 12, 1, 19};
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
    char tree[] = {0};
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

static void test_recalculation_updates_limits_without_refilling_live_mana(void)
{
    record[0x3d] = 5;
    record[0x28] = 15;
    record[0x37] = 3;
    attributes[5] = 30;
    attributes[7] = 24;
    g_player_carry_weight = 175;
    recalculate_player_stats(0);
    TEST_ASSERT_EQUAL_UINT8(60, attributes[4]);
    TEST_ASSERT_EQUAL_UINT8(48, record[0x38]);
    TEST_ASSERT_EQUAL_UINT8(3, record[0x37]);
    TEST_ASSERT_EQUAL_UINT16(600, g_player_max_carry_weight);
    TEST_ASSERT_EQUAL_INT16(175, g_player_carry_weight);
    TEST_ASSERT_EQUAL_UINT8(0x58, record[0x4c]);
    TEST_ASSERT_EQUAL_UINT8(2, record[0x4d]);
    recalculate_player_stats(1);
    TEST_ASSERT_EQUAL_UINT8(48, record[0x37]);
}

static void test_level_seven_preserves_special_mana_state(void)
{
    DAT_00201b68 = 7;
    record[0x3d] = 1;
    record[0x28] = 7;
    record[0x37] = 2;
    record[0x38] = 9;
    attributes[5] = 20;
    attributes[7] = 25;
    recalculate_player_stats(0);
    TEST_ASSERT_EQUAL_UINT8(25, record[0xb0]);
    TEST_ASSERT_EQUAL_UINT8(9, record[0x38]);
    TEST_ASSERT_EQUAL_UINT8(2, record[0x37]);
    TEST_ASSERT_EQUAL_UINT16(400, g_player_max_carry_weight);
}

static void test_status_save_restores_calculated_stats_and_carry_fields(void)
{
    prepare_initial_randomness();
    init_new_character_record(0);
    g_player_carry_weight = 75;
    write_player_status_block(1);
    memset(record, 0, sizeof record);
    memset(attributes, 0, sizeof attributes);
    read_player_status_block(1);
    TEST_ASSERT_EQUAL_UINT8(21, attributes[5]);
    TEST_ASSERT_EQUAL_UINT8(21, attributes[6]);
    TEST_ASSERT_EQUAL_UINT8(21, attributes[7]);
    TEST_ASSERT_EQUAL_UINT8(34, attributes[4]);
    TEST_ASSERT_EQUAL_UINT8(18, record[0x38]);
    TEST_ASSERT_EQUAL_UINT8(18, record[0x37]);
    TEST_ASSERT_EQUAL_UINT16(420, g_player_max_carry_weight);
    TEST_ASSERT_EQUAL_INT16(75, g_player_carry_weight);
}

static void test_armor_protection_uses_loaded_table_and_quality(void)
{
    uw_test_read_data("DATA/OBJECTS.DAT", ((byte *)g_armor_type_props), 0x80,
                      2 + 0x80 + 0x30, SEEK_SET);
    for (int item = 0x20; item < 0x40; item++) {
        player_object[0] = item;
        player_object[2] = 63;
        TEST_ASSERT_EQUAL_INT(1 + g_armor_type_props[item - 0x20].protection * 63 / 64,
                              compute_object_weight(player_object));
        player_object[2] = 0;
        TEST_ASSERT_EQUAL_INT(1, compute_object_weight(player_object));
    }
}

static void test_pickup_limit_reads_capacity_and_current_load_from_record(void)
{
    record[0x3d] = 1;
    attributes[5] = 21;
    recalculate_player_stats(0);
    g_player_carry_weight = 395;
    TEST_ASSERT_TRUE(check_object_carry_weight(player_object));
    g_player_carry_weight = 396;
    TEST_ASSERT_FALSE(check_object_carry_weight(player_object));
}

static void test_equipment_bonus_updates_all_regions_and_reset_clears_them(void)
{
    reset_player_derived_state();
    apply_equipped_item_effect(3, 1, player_object, 0);
    const byte expected[] = {3, 3, 3, 3};
    TEST_ASSERT_EQUAL_UINT8_ARRAY(expected, DAT_0010060c_backing, 4);
    reset_player_derived_state();
    const byte cleared[] = {0, 0, 0, 0};
    TEST_ASSERT_EQUAL_UINT8_ARRAY(cleared, DAT_0010060c_backing, 4);
}

static void test_equipment_slots_apply_bonuses_to_original_armor_regions(void)
{
    const int regions[] = {3, 0, 1, 2, 2};
    for (int slot = 0; slot < 5; slot++) {
        reset_player_derived_state();
        apply_equipped_item_effect(0xc, 2, player_object, slot);
        for (int region = 0; region < 4; region++)
            TEST_ASSERT_EQUAL_UINT8(region == regions[slot] ? 3 : 0,
                                     DAT_0010060c_backing[region]);
    }
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_pickup_limit_reads_capacity_and_current_load_from_record);
    RUN_TEST(test_equipment_bonus_updates_all_regions_and_reset_clears_them);
    RUN_TEST(test_equipment_slots_apply_bonuses_to_original_armor_regions);
    RUN_TEST(test_recalculation_updates_limits_without_refilling_live_mana);
    RUN_TEST(test_level_seven_preserves_special_mana_state);
    RUN_TEST(test_status_save_restores_calculated_stats_and_carry_fields);
    RUN_TEST(test_armor_protection_uses_loaded_table_and_quality);
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
