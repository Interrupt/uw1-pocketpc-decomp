#include "game_fixture.h"
#include "unity.h"
#include "src/headers/uw.h"
#include "src/headers/debug.h"
#include <stdio.h>

/* Decode the real goblin page, including palette remapping and RLE. */
undefined1 DAT_0023ce70_backing[128], DAT_000842ac_backing[32];
void *DAT_002020f8_arr[256], *g_tile_texptr_emit[UW_MAX_VIS_TILES];
ushort DAT_00202508, DAT_002022f8, DAT_00202300, DAT_00202304;
int DAT_002022fc, DAT_0023b83c;
byte *DAT_0024af78, *DAT_0024af7c, *DAT_000b4628, *DAT_000b461c;
byte *DAT_000b4610, *DAT_000b4624, *DAT_000b5630, *DAT_000b462c;
char *DAT_0024fa2c, *DAT_000b4614;
byte *DAT_000b4618;
byte pages[2][0x7fff], unpacked[65536], pixels[65536];
byte light[65536];
unsigned allocations, allocation_size;
void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...) {}
void uw_debug_dump_critter_sprite(int type, int tier, int direction, int frame,
                                const unsigned char *buffer, int width, int height) {}
void *ce_malloc(int size)
{
    TEST_ASSERT_GREATER_THAN_INT(0, size);
    TEST_ASSERT_LESS_OR_EQUAL_INT(65536, size);
    allocations++;
    allocation_size = size;
    void *buffer = calloc(1, size);
    TEST_ASSERT_NOT_NULL(buffer);
    return buffer;
}
void *ce_memset(void *buffer, int value, unsigned int size) { return memset(buffer, value, size); }
void *ce_memmove(void *dest, const void *src, int size) { return memcpy(dest, src, size); }
byte *uw_load_critter_page_cached(int page, int tier)
{
    TEST_ASSERT_EQUAL_INT(0, page);
    return tier >= 0 && tier < 2 ? pages[tier] : NULL;
}
void read_data(const char *name, long offset, void *buffer, size_t count)
{
    uw_test_read_data(name, buffer, count, offset, SEEK_SET);
}
void critter_palette_fixture_reset(void)
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
void critter_palette_fixture_dispose(void)
{
    for (int i = 0; i < 256; i++) { free(DAT_002020f8_arr[i]); DAT_002020f8_arr[i] = NULL; }
}
void assert_skin_colors(int type, int forehead, int cheek, int leg)
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
