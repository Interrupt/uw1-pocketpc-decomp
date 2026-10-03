#include "unity.h"
#include "uw.h"
#include "src/headers/debug.h"
#include <stdio.h>

/* Decode the real goblin page, including palette remapping and RLE. */
undefined1 DAT_0023ce70_backing[8192], DAT_000842ac_backing[4096];
void *DAT_002020f8_arr[256], *g_tile_texptr_emit[UW_MAX_VIS_TILES];
ushort DAT_00202508, DAT_002022f8, DAT_00202300, DAT_00202304;
int DAT_002022fc, DAT_0023b83c;
byte *DAT_0024af78, *DAT_0024af7c, *DAT_000b4628, *DAT_000b461c;
byte *DAT_000b4610, *DAT_000b4624, *DAT_000b5630, *DAT_000b462c;
char *DAT_0024fa2c, *DAT_000b4614;
byte *DAT_000b4618;
static byte pages[2][0x7fff], unpacked[65536], pixels[65536];
static byte light[65536];
static unsigned allocations, allocation_size;
void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...) {}
void uw_debug_dump_critter_sprite(int type, int tier, int direction, int frame,
                                const unsigned char *buffer, int width, int height) {}
void *Ordinal_1041(int size)
{
    TEST_ASSERT_GREATER_THAN_INT(0, size);
    TEST_ASSERT_LESS_OR_EQUAL_INT(65536, size);
    allocations++;
    allocation_size = size;
    void *buffer = calloc(1, size);
    TEST_ASSERT_NOT_NULL(buffer);
    return buffer;
}
void *Ordinal_1047(void *buffer, int value, unsigned int size) { return memset(buffer, value, size); }
void *Ordinal_1044(void *dest, const void *src, int size) { return memcpy(dest, src, size); }
byte *uw_load_critter_page_cached(int page, int tier)
{
    TEST_ASSERT_EQUAL_INT(0, page);
    return tier >= 0 && tier < 2 ? pages[tier] : NULL;
}
static void read_data(const char *name, long offset, void *buffer, size_t count)
{
    char path[512];
    snprintf(path, sizeof path, "%s/%s", UW_TEST_DATA_DIR, name);
    FILE *file = fopen(path, "rb");
    TEST_ASSERT_NOT_NULL(file);
    TEST_ASSERT_EQUAL_INT(0, fseek(file, offset, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(count, fread(buffer, 1, count, file));
    fclose(file);
}
void setUp(void)
{
    read_data("CRIT/ASSOC.ANM", 0x100, DAT_0023ce70_backing, 0x80);
    for (int tier = 0; tier < 2; tier++) {
        char name[64], path[512];
        snprintf(name, sizeof name, "CRIT/CR00PAGE.N%02d", tier);
        snprintf(path, sizeof path, "%s/%s", UW_TEST_DATA_DIR, name);
        FILE *file = fopen(path, "rb");
        TEST_ASSERT_NOT_NULL(file);
        memset(pages[tier], 0, sizeof pages[tier]);
        TEST_ASSERT_GREATER_THAN_UINT(0, fread(pages[tier], 1, sizeof pages[tier], file));
        fclose(file);
    }
    DAT_0024af78 = unpacked;
    DAT_0024af7c = pixels;
    DAT_0024fa2c = (char *)light;
    for (unsigned i = 0; i < sizeof light; i++) light[i] = i & 255;
    allocations = allocation_size = 0;
}
void tearDown(void)
{
    for (int i = 0; i < 256; i++) { free(DAT_002020f8_arr[i]); DAT_002020f8_arr[i] = NULL; }
}
static void assert_skin_colors(int type, int forehead, int cheek, int leg)
{
    TEST_ASSERT_EQUAL_INT(1, resolve_critter_sprite_tier(type & 0x3f, 0, 0, 0));
    TEST_ASSERT_EQUAL_UINT(1, allocations);
    TEST_ASSERT_EQUAL_UINT(35, DAT_00202508);
    TEST_ASSERT_EQUAL_UINT(45, DAT_002022f8);
    const byte *bitmap = g_tile_texptr_emit[0];
    TEST_ASSERT_NOT_NULL(bitmap);
    TEST_ASSERT_EQUAL_UINT(forehead, bitmap[3 * 35 + 17]);
    TEST_ASSERT_EQUAL_UINT(cheek, bitmap[5 * 35 + 17]);
    TEST_ASSERT_EQUAL_UINT(leg, bitmap[30 * 35 + 20]);
}
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
