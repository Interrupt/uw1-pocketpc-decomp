#include "critter_palette_fixture.h"

void setUp(void) { critter_palette_fixture_reset(); }
void tearDown(void) { critter_palette_fixture_dispose(); }

static void test_gray_goblin_palette_one_decodes_gray_skin(void)
{
    TEST_ASSERT_EQUAL_UINT(1, DAT_0023ce70_backing[12 * 2 + 1]);
    assert_skin_colors(0x4c, 153, 154, 155);
}
static void test_gray_goblin_palette_three_decodes_gray_skin(void)
{
    TEST_ASSERT_EQUAL_UINT(3, DAT_0023ce70_backing[14 * 2 + 1]);
    assert_skin_colors(0x4e, 153, 154, 155);
}
static void test_green_goblin_palette_zero_decodes_green_skin(void)
{
    TEST_ASSERT_EQUAL_UINT(0, DAT_0023ce70_backing[6 * 2 + 1]);
    assert_skin_colors(0x46, 88, 90, 91);
}
static void test_level1_goblin_at_36_28_has_green_skin_in_bundled_data(void)
{
    uint offset;
    ushort link, type;
    read_data("DATA/LEV.ARK", 2, &offset, sizeof offset);
    read_data("DATA/LEV.ARK", offset + (28 * 64 + 36) * 4 + 2, &link, sizeof link);
    TEST_ASSERT_EQUAL_UINT(225, link >> 6);
    read_data("DATA/LEV.ARK", offset + 0x4000 + (link >> 6) * 27, &type, sizeof type);
    TEST_ASSERT_EQUAL_UINT(0x4d, type & 0x1ff);
    TEST_ASSERT_EQUAL_UINT(2, DAT_0023ce70_backing[13 * 2 + 1]);
    /* Palette 2 differs in clothing from palette 0, but both use green
       skin (88/90/91), not the gray ramp (153/154/155) of palettes 1/3. */
    assert_skin_colors(type & 0x1ff, 88, 90, 91);
}
static void test_wide_goblin_combat_frame_gets_a_new_texture(void)
{
    TEST_ASSERT_EQUAL_INT(1, resolve_critter_sprite_tier(13, 0, 0, 0));
    const void *previous = g_tile_texptr_emit[0];
    /* This is the only goblin frame wider than the old 64-pixel limit. */
    TEST_ASSERT_EQUAL_INT(1, resolve_critter_sprite_tier(13, 3, 3, 0));
    TEST_ASSERT_EQUAL_UINT(2, allocations);
    TEST_ASSERT_EQUAL_UINT(68, DAT_00202508);
    TEST_ASSERT_EQUAL_UINT(44, DAT_002022f8);
    TEST_ASSERT_EQUAL_UINT(68 * 44, allocation_size);
    TEST_ASSERT_TRUE(previous != g_tile_texptr_emit[0]);
    /* The per-page scratch slot is replaced each draw. Free the old draw
       here; the game's per-frame teardown frees it before the next frame. */
    free((void *)previous);
}
static void test_all_goblin_frames_decode_complete_bitmaps(void)
{
    for (int direction = 0; direction < 160; direction++) {
        byte *page = pages[direction >= 32];
        if (page[direction - page[0] + 2] == 0xff) continue;
        for (int frame = 0; frame < 8; frame++) {
            memset(pixels, 0xcd, sizeof pixels);
            unsigned before = allocations;
            TEST_ASSERT_EQUAL_INT(1, resolve_critter_sprite_tier(13, direction, frame, 0));
            int count = DAT_00202508 * DAT_002022f8;
            char message[100];
            snprintf(message, sizeof message, "direction=%d frame=%d bitmap=%dx%d", direction, frame,
                     DAT_00202508, DAT_002022f8);
            TEST_ASSERT_EQUAL_UINT_MESSAGE(before + 1, allocations, message);
            TEST_ASSERT_EQUAL_UINT_MESSAGE(count, allocation_size, message);
            TEST_ASSERT_EQUAL_PTR_MESSAGE(DAT_002020f8_arr[direction >= 32], g_tile_texptr_emit[0], message);
            TEST_ASSERT_GREATER_OR_EQUAL_INT_MESSAGE(count, DAT_000b461c - pixels, message);
            for (int i = 0; i < count; i++) TEST_ASSERT_NOT_EQUAL_MESSAGE(0xcd, pixels[i], message);

            tearDown();
        }
    }
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_gray_goblin_palette_one_decodes_gray_skin);
    RUN_TEST(test_gray_goblin_palette_three_decodes_gray_skin);
    RUN_TEST(test_green_goblin_palette_zero_decodes_green_skin);
    RUN_TEST(test_level1_goblin_at_36_28_has_green_skin_in_bundled_data);
    RUN_TEST(test_wide_goblin_combat_frame_gets_a_new_texture);
    RUN_TEST(test_all_goblin_frames_decode_complete_bitmaps);
    return UNITY_END();
}
