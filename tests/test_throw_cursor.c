#include "unity.h"
#include "uw.h"
#include <stdio.h>
#include <math.h>
#include "throw_test_globals.h"

/* Real cursor input, throw aiming, placement refinement and object creation.
   The fixture supplies an empty world and the original quantized sin/cos. */
short g_mouse_x, g_mouse_y;
static ushort arena[0x4000], held[4];
static short click[16];
static char character[256];
static ushort *thrown;
static int freed, allocations;
static short world_x(ushort *object)
{ return (object[0xb] >> 10) * 8 + (object[1] >> 13); }
static short world_y(ushort *object)
{ return (object[0xb] >> 4 & 63) * 8 + (object[1] >> 10 & 7); }
static short fine(ushort *object, int offset)
{ short value; memcpy(&value, (byte *)object + offset, 2); return value; }
void *alloc_object_slot(int mobile)
{
    TEST_ASSERT_EQUAL_INT(1, mobile);
    allocations++;
    return thrown;
}
void free_object_slot(void *object)
{
    TEST_ASSERT_EQUAL_PTR(held, object);
    freed++;
}
int encode_object_slot_index(void *object)
{ return ((char *)object - DAT_002046b8) / 27; }
void *tilemap_lookup(int x, int y)
{
    TEST_ASSERT_TRUE(x >= 0 && x < 64 && y >= 0 && y < 64);
    return (byte *)arena + (y * 64 + x) * 4;
}
void *resolve_object_link(ushort *head)
{ return (*head >> 6) ? DAT_002046b8 + (*head >> 6) * 27 : NULL; }
long Ordinal_2005(int divisor, int dividend) { return dividend / divisor; }
void heading_to_sine_cosine(uint heading, ushort *sine, ushort *cosine)
{
    double radians = (heading >> 8 & 255) * (2.0 * M_PI / 256.0);
    *sine = (short)lround(32767 * sin(radians));
    *cosine = (short)lround(32767 * cos(radians));
}
void collision_height_envelope(int unused, int mode)
{
    /* ARM placement record offsets: radius=8, object slot=10,
       tile flags=12/14, object candidate count=20. */
    TEST_ASSERT_EQUAL_INT(2, *(ushort *)(DAT_00202c6c + 10));
    TEST_ASSERT_EQUAL_UINT(DAT_00202c90_backing[0x80 * 13 + 1] & 7, DAT_00202c6c[8]);
    memset(DAT_00202c6c + 12, 0, 12);
}
void collision_build_height_field(int mode) {}
void FUN_00051dd0(void) { TEST_FAIL_MESSAGE("Empty world has no object contacts"); }
undefined4 play_sound_effect_at_object(void) { return 1; }
undefined4 object_ptr_in_arena(void) { return 1; }
ushort *discard_misplaced_object(void *list, ushort *object, int destroy)
{ return NULL; }
undefined4 play_sound_effect_with_pan(void) { return 1; }
ushort *reallocate_object_to_arena(void) { TEST_FAIL_MESSAGE("Unexpected ground drop"); return NULL; }
ushort *settle_dropped_object(void) { TEST_FAIL_MESSAGE("Unexpected ground drop"); return NULL; }
undefined4 FUN_00051fa0(void) { TEST_FAIL_MESSAGE("Unexpected ground drop"); return 0; }
void object_list_append_tail(void) { TEST_FAIL_MESSAGE("Unexpected ground drop"); }
undefined4 play_positional_sound_effect(void) { return 1; }
void print_scroll_message_by_id(void) {}
void set_ambient_bias_without_light(void) {}
void setUp(void)
{
    memset(arena, 0, sizeof arena);
    memset(held, 0, sizeof held);
    memset(click, 0, sizeof click);
    memset(character, 0, sizeof character);
    DAT_002046b8 = (char *)arena + 0x4000;
    DAT_002046c4 = (char *)arena + 0x5b00;
    g_player_object = (ushort *)(DAT_002046b8 + 27);
    thrown = (ushort *)(DAT_002046b8 + 2 * 27);
    g_player_object[0] = 0x7f;
    g_player_object[1] = 48 | (4 << 13) | (4 << 10);
    g_player_object[0xb] = (36 << 10) | (32 << 4);
    held[0] = 0x80;
    held[2] = 20;
    DAT_00085a6c = click;
    click[8] = 1;
    DAT_00086df8 = character;
    DAT_0023beb4 = 0;
    g_mouse_x = 141; g_mouse_y = 55;
    allocations = freed = 0;
    memset(DAT_00202c90_backing, 0, sizeof DAT_00202c90_backing);
    FILE *props = fopen(UW_TEST_DATA_DIR "/DATA/COMOBJ.DAT", "rb");
    TEST_ASSERT_NOT_NULL(props);
    const int ids[] = {0x7f, 0x80};
    for (int row = 0; row < 2; row++) {
        byte disk[11];
        TEST_ASSERT_EQUAL_INT(0, fseek(props, 2 + ids[row] * 11, SEEK_SET));
        TEST_ASSERT_EQUAL_UINT(11, fread(disk, 1, 11, props));
        memcpy(DAT_00202c90_backing + ids[row] * 13, disk, 4);
        memcpy(DAT_00202c90_backing + ids[row] * 13 + 5, disk + 4, 7);
    }
    fclose(props);
}
void tearDown(void) {}
static void launch(void)
{
    TEST_ASSERT_EQUAL_UINT(1, drop_held_object_near_player(held, 1));
    TEST_ASSERT_EQUAL_INT(1, allocations);
    TEST_ASSERT_EQUAL_INT(1, freed);
    TEST_ASSERT_EQUAL_UINT(0x80, thrown[0] & 0x1ff);
}
static void test_center_cursor_throw_starts_near_the_player(void)
{
    launch();
    TEST_ASSERT_EQUAL_INT(world_x(g_player_object), world_x(thrown));
    TEST_ASSERT_GREATER_THAN_INT(world_y(g_player_object), world_y(thrown));
    TEST_ASSERT_LESS_THAN_INT(world_y(g_player_object) + 16, world_y(thrown));
    TEST_ASSERT_EQUAL_INT(world_x(thrown) * 32 + 15, fine(thrown, 11));
    TEST_ASSERT_EQUAL_INT(world_y(thrown) * 32 + 15, fine(thrown, 13));
}
static void test_cursor_left_and_right_change_the_throw_origin(void)
{
    short origin_x = world_x(g_player_object);
    g_mouse_x = 70;
    launch();
    TEST_ASSERT_LESS_THAN_INT(origin_x, world_x(thrown));
    TEST_ASSERT_GREATER_THAN_INT(world_y(g_player_object), world_y(thrown));
    short left_x = world_x(thrown);
    setUp();
    g_mouse_x = 210;
    launch();
    TEST_ASSERT_GREATER_THAN_INT(origin_x, world_x(thrown));
    TEST_ASSERT_GREATER_THAN_INT(left_x, world_x(thrown));
    TEST_ASSERT_GREATER_THAN_INT(world_y(g_player_object), world_y(thrown));
}
static void test_cursor_throw_origin_rotates_with_player_facing(void)
{
    const int headings[] = {0, 64, 128, 192};
    for (int direction = 0; direction < 4; direction++) {
        setUp();
        g_player_object[1] |= (headings[direction] & 0xe0) << 2;
        short x = world_x(g_player_object), y = world_y(g_player_object);
        launch();
        if (direction == 0 || direction == 2) {
            TEST_ASSERT_EQUAL_INT(x, world_x(thrown));
            if (direction == 0) TEST_ASSERT_GREATER_THAN_INT(y, world_y(thrown));
            else TEST_ASSERT_LESS_THAN_INT(y, world_y(thrown));
        } else {
            TEST_ASSERT_EQUAL_INT(y, world_y(thrown));
            if (direction == 1) TEST_ASSERT_GREATER_THAN_INT(x, world_x(thrown));
            else TEST_ASSERT_LESS_THAN_INT(x, world_x(thrown));
        }
        TEST_ASSERT_EQUAL_INT(world_x(thrown) * 32 + 15, fine(thrown, 11));
        TEST_ASSERT_EQUAL_INT(world_y(thrown) * 32 + 15, fine(thrown, 13));
    }
}
static void test_cursor_height_changes_the_throw_origin_height(void)
{
    g_mouse_y = 30;
    launch();
    short high_z = fine(thrown, 15);
    setUp();
    g_mouse_y = 85;
    launch();
    TEST_ASSERT_LESS_THAN_INT(high_z, fine(thrown, 15));
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_center_cursor_throw_starts_near_the_player);
    RUN_TEST(test_cursor_left_and_right_change_the_throw_origin);
    RUN_TEST(test_cursor_height_changes_the_throw_origin_height);
    RUN_TEST(test_cursor_throw_origin_rotates_with_player_facing);
    return UNITY_END();
}
