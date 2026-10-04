#include "unity.h"
#include "support/game_fixture.h"

static char character[256], attributes[256];
static ushort object[16];
static byte map[0x8000], first_map[0x8000], properties[512 * 13];
void setUp(void) {}
void tearDown(void) {}

static void test_character_helper_runs_game_defaults_without_ui(void)
{
    memset(character, 0xa5, sizeof character);
    uw_test_create_character(character, attributes, object);
    TEST_ASSERT_EQUAL_PTR(character, DAT_00086df8);
    TEST_ASSERT_EQUAL_PTR(object, g_player_object);
    TEST_ASSERT_EQUAL_STRING("Test Avatar", character);
    TEST_ASSERT_EQUAL_HEX16(0x7f, object[0]);
    TEST_ASSERT_EQUAL_UINT8(1, character[0x3d]); /* level */
    TEST_ASSERT_EQUAL_UINT8(0xc0, (byte)character[0x39]); /* food */
    TEST_ASSERT_EQUAL_UINT8(24, character[0x47]); /* empty rune */
    TEST_ASSERT_GREATER_THAN_UINT8(0, character[0x35]); /* alive */
    TEST_ASSERT_FALSE(uw_test_creating_character);
}
static void test_map_helper_reads_distinct_real_level_blocks(void)
{
    memset(map, 0xa5, sizeof map);
    uw_test_load_map(map, sizeof map, 1);
    memcpy(first_map, map, UW_TEST_LEVEL_SIZE);
    TEST_ASSERT_EQUAL_HEX16(0x7577, *(ushort *)(map + 0x7c06));
    TEST_ASSERT_EQUAL_UINT8(0xa5, map[UW_TEST_LEVEL_SIZE]); /* bounded read */
    uw_test_load_map(map, sizeof map, 2);
    TEST_ASSERT_EQUAL_HEX16(0x7577, *(ushort *)(map + 0x7c06));
    TEST_ASSERT_NOT_EQUAL(0, memcmp(first_map, map, 0x4000));
}
static void test_property_helper_expands_real_player_and_door_metadata(void)
{
    uw_test_load_object_properties(properties, sizeof properties);
    TEST_ASSERT_EQUAL_UINT8(0, properties[0x140 * 13 + 4]); /* expansion gap */
    TEST_ASSERT_EQUAL_UINT8(3, properties[0x140 * 13 + 1] & 7); /* door radius */
    TEST_ASSERT_EQUAL_UINT8(2, properties[0x7f * 13 + 1] & 7); /* player radius */
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_character_helper_runs_game_defaults_without_ui);
    RUN_TEST(test_map_helper_reads_distinct_real_level_blocks);
    RUN_TEST(test_property_helper_expands_real_player_and_door_metadata);
    return UNITY_END();
}
