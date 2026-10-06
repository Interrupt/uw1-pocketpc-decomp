#include "unity.h"
#include "src/headers/uw.h"

/* Exercise light toggling, equipment selection, real shading data and pixels.
   Inventory/UI services are fixtures; the game functions stay in their files. */
char *DAT_00086df8, *DAT_0023be74, *DAT_0024fa2c, *DAT_0023cca0;
byte *g_scratch_object_ptr;
char *g_selected_object;
undefined1 DAT_00086da8, DAT_00202800_backing[256];
undefined1 DAT_0023b039_backing[4096];
undefined4 DAT_000b5638_backing[160];
undefined1 DAT_0023cca8_backing[1024];
unsigned char DAT_00085ac8_backing[16] = {5,6,7,8};
undefined4 DAT_0023bc98, DAT_002020d8;
char DAT_000872a0, DAT_000842b0, DAT_0023b830;
short DAT_00201b68, DAT_0025063c, DAT_0025064c, DAT_002506dc;
short g_visibility_max_ring_passes, DAT_00086b28, DAT_00086b24;
undefined2 DAT_000da47c, g_palette_rgb565_backing[32768];
char s__DATA_light_dat_000872c8[] = "\\DATA\\LIGHT.DAT";
char s__DATA_mono_dat_000872b8[] = "\\DATA\\MONO.DAT";
char s__DATA_shades_dat_000872a4[] = "\\DATA\\SHADES.DAT";
char player[256], stats[256], mappings[4096], stencil[16];
ushort lights[4][4], *slots[11];
byte light_records[32];
int rebuilds, message;
int g_ambient_bias_reduction;
void *get_equipped_item_at_slot(short slot) { return slots[slot]; }
void *get_scanned_object_class_effect_ptr(void)
{
    return light_records + (*(ushort *)g_scratch_object_ptr & 15) * 2;
}
int compute_object_weight(void) { return 0; }
void request_weapon_swing_graphic(char category) {}
void reset_player_derived_state(void) {}
undefined4 is_valid_equipment_slot_item(int id, int slot) { return 0; }
undefined4 resolve_object_variant_or_special_link(ushort *o, byte *a, byte *b, int *c) { return 0; }
void clear_object_pending_special_flag(ushort *o) {}
undefined4 apply_equipped_item_effect(int effect, int level, ushort *flags, int slot)
{
    /* Fixture for the intrinsic light effect, independent of physical lamps. */
    TEST_ASSERT_EQUAL_INT(0, effect);
    if ((byte)player[99] >> 4 < level) player[99] = level << 4;
    return 0;
}
void apply_equipment_effect_penalties(int flags) {}
void update_screen_flicker_effect(int active) {}
void force_locomotion_state_refresh(void) {}
void apply_movement_mode_profile(int mode) {}
int find_or_assign_object_widget(ushort *object) { return 5; }
void decrement_object_count(ushort *object) { TEST_FAIL_MESSAGE("Unexpected auto-equip"); }
undefined4 place_object_in_backpack_slot(ushort *object, int slot) { return 1; }
void redraw_container_icon_slot(void) {}
void redraw_backpack_slot_widget(int slot) {}
void print_scroll_message_by_id(int id) { message = id; }
void set_pending_update_flags(int mode) { rebuilds++; }
/* Use real platform file I/O, including Windows path translation. */
int open_file_for_read(const char *path)
{
    const char *prefix = (char *)DAT_0023cca8_backing;
    if (*prefix) TEST_ASSERT_EQUAL_MEMORY(prefix, path, strlen(prefix));
    return uw_file_open_read(path);
}
int read_file_handle(int h, void *buf, unsigned n) { return uw_file_read(h, buf, n); }
int seek_file_handle(int h, int offset, int whence) { return uw_file_seek(h, offset, whence); }
long CloseHandle(int h) { return uw_file_close(h); }
void *ce_memset(void *p, int value, unsigned n) { return memset(p, value, n); }
char *ce_strcat(char *p, const char *s) { return strcat(p, s); }
void lighting_fixture_reset(void)
{
    setenv("UW_DATA_DIR", UW_TEST_DATA_DIR, 1);
    unsetenv("UW_LIGHT_MODE");
    setenv("UW_DITHER", "0", 1); /* Isolate undithered falloff assertions. */
    unsetenv("UW_AMBIENT_BIAS_REDUCTION");
    g_ambient_bias_reduction = 0;
    memset(player, 0, sizeof player); memset(stats, 0, sizeof stats);
    memset(slots, 0, sizeof slots); memset(lights, 0, sizeof lights);
    memset(DAT_0023cca8_backing, 0, sizeof DAT_0023cca8_backing);
    DAT_00086df8 = player; DAT_0023be74 = stats;
    DAT_0024fa2c = mappings; DAT_0023cca0 = stencil;
    DAT_000872a0 = -1; DAT_000842b0 = 8;
    DAT_002020d8 = DAT_0023bc98 = 0; g_selected_object = NULL;
    DAT_0023b830 = 0; rebuilds = message = 0;
    build_shade_lut();
    int h = uw_file_open_read("\\DATA\\OBJECTS.DAT");
    TEST_ASSERT_NOT_EQUAL(-1, h);
    TEST_ASSERT_EQUAL_INT(3426, uw_file_seek(h, 3426, 0));
    TEST_ASSERT_EQUAL_INT(32, uw_file_read(h, light_records, 32)); uw_file_close(h);
    h = uw_file_open_read("\\DATA\\LIGHT.DAT"); TEST_ASSERT_NOT_EQUAL(-1, h);
    TEST_ASSERT_EQUAL_INT(4096, uw_file_read(h, mappings, 4096)); uw_file_close(h);
    /* Distinct RGB565 entries let assertions identify the exact palette index. */
    for (int i = 0; i < 256; i++) g_palette_rgb565_backing[i] = i + 0x100;
}
void lighting_fixture_dispose(void)
{
    unsetenv("UW_LIGHT_MODE");
    unsetenv("UW_DITHER");
    unsetenv("UW_AMBIENT_BIAS_REDUCTION");
}
void assert_mode(int mode, int falloff, int initial, int offset)
{
    TEST_ASSERT_EQUAL_INT(mode, DAT_000872a0);
    TEST_ASSERT_EQUAL_INT(falloff, DAT_0025063c);
    TEST_ASSERT_EQUAL_INT(initial, DAT_0025064c);
    TEST_ASSERT_EQUAL_INT(offset, DAT_002506dc);
}

/* Draw actual raster spans at dungeon projection coordinates. Keep buffer and
   edge setup here so lighting tests specify points and expected colours. */
void lighting_draw_span(int reciprocal_w, int x, int y, int count, int clip_left, ushort *pixels)
{
    static ushort framebuffer[320 * 200];
    int gradients[32] = {0}, left[32] = {0}, right[32] = {0};
    int clip[] = {clip_left, 0, x + count, 200};
    memset(framebuffer, 0, sizeof framebuffer);
    left[8/4] = y;
    left[0x28/4] = x << 14;
    left[0x30/4] = reciprocal_w;
    right[0x28/4] = (x + count) << 14;
    raster_textured_span(320, (intptr_t)framebuffer, (intptr_t)gradients,
                        (intptr_t)left, (intptr_t)right, 1, 1, 0, clip, 88);
    memcpy(pixels, framebuffer + y * 320 + x, count * sizeof *pixels);
}
ushort lighting_draw_texel(int reciprocal_w, int x, int y)
{
    ushort pixel;
    lighting_draw_span(reciprocal_w, x, y, 1, x, &pixel);
    return pixel;
}
