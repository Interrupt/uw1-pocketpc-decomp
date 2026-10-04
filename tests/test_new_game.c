#include "new_game_fixture.h"

void setUp(void) { new_game_fixture_reset(); }
void tearDown(void) { new_game_fixture_dispose(); }

static void test_stub_character_loads_level_one_and_enters_gameplay(void)
{
    TEST_ASSERT_TRUE(prepare_new_game());
    begin_gameplay();

    TEST_ASSERT_EQUAL_STRING("Test Avatar", character);
    TEST_ASSERT_EQUAL_UINT8(12, character[0x21]);
    TEST_ASSERT_EQUAL_UINT8(2, (byte)character[100] >> 5);
    TEST_ASSERT_EQUAL_INT(1, character_calls);
    TEST_ASSERT_EQUAL_INT(2, saves);
    TEST_ASSERT_EQUAL_INT(1, seeds);
    TEST_ASSERT_EQUAL_INT(1, opens);
    TEST_ASSERT_EQUAL_HEX16(0x7577, *(ushort *)(arena + 0x7c06));
    TEST_ASSERT_EQUAL_INT(1, restores);
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_MEMORY(pristine_level, arena, sizeof(arena));
    TEST_ASSERT_EQUAL_PTR(arena + 0x7300 + *(ushort *)(pristine_level + 0x7c02) * 2, DAT_002046a8);
    TEST_ASSERT_EQUAL_PTR(arena + 0x74fc + *(ushort *)(pristine_level + 0x7c04) * 2, DAT_0020469c);
    TEST_ASSERT_EQUAL_PTR(arena + 0x7afa + *(ushort *)(pristine_level + 0x7c00), DAT_002046c8);
    TEST_ASSERT_EQUAL_UINT32(0, DAT_002029d0);
    TEST_ASSERT_EQUAL_INT(2, automaps);
    TEST_ASSERT_EQUAL_INT(1, cache_resets);
    TEST_ASSERT_EQUAL_INT(1, attacker_resets);
    TEST_ASSERT_EQUAL_INT(160, DAT_00202080); /* spawn tile (32, 2) */
    TEST_ASSERT_EQUAL_INT(1, DAT_00201b60); /* gameplay mode */
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b64);
    TEST_ASSERT_EQUAL_INT(1, mode_state[4]); /* input dispatcher's mode */
    TEST_ASSERT_EQUAL_INT(1, cursor_resets);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_000868d8);
}

static void test_cancelled_character_does_not_load_or_start_game(void)
{
    accept_character = false;
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_INT(0, saves);
    TEST_ASSERT_EQUAL_INT(0, opens);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

static void test_failed_world_copy_does_not_load_or_spawn(void)
{
    TEST_ASSERT_EQUAL_INT(0, unlink(data_link));
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_INT(0, seeds);
    TEST_ASSERT_EQUAL_INT(0, opens);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

static void test_missing_level_archive_does_not_start_game(void)
{
    archive_ok = false;
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_INT(1, opens);
    TEST_ASSERT_EQUAL_INT(0, closes);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

static void test_failed_level_load_closes_archive_without_spawning(void)
{
    scheduler_result = 0;
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_HEX16(0x7577, *(ushort *)(arena + 0x7c06));
    TEST_ASSERT_EQUAL_INT(1, restores);
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_INT(0, textures);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

int main(void)
{
    UNITY_BEGIN();
    new_game_fixture_begin();
    RUN_TEST(test_stub_character_loads_level_one_and_enters_gameplay);
    RUN_TEST(test_cancelled_character_does_not_load_or_start_game);
    RUN_TEST(test_failed_world_copy_does_not_load_or_spawn);
    RUN_TEST(test_missing_level_archive_does_not_start_game);
    RUN_TEST(test_failed_level_load_closes_archive_without_spawning);
    new_game_fixture_end();
    return UNITY_END();
}
