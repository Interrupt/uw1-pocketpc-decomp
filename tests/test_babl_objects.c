#include "unity.h"
#include "src/headers/uw.h"

static struct { byte before[8]; uw_object_hdr_t object; byte after[8]; } guarded;
static short variables[64];
static uw_tile_t floor_tile;
static int tile_calls, tile_x, tile_y;
static short barter_count, barter_ids[8], barter_slots[8];

void setUp(void) {
    memset(&guarded, 0xa5, sizeof(guarded));
    memset(variables, 0, sizeof(variables));
    memset(&floor_tile, 0, sizeof(floor_tile));
    tile_calls = 0; barter_count = 0;
}
void tearDown(void) {}
intptr_t babl_var_word_addr(short index) { return (intptr_t)&variables[index]; }
int babl_read_var_word(short index) { return variables[index]; }
void babl_write_var_word(short index, short value) { variables[index] = value; }
uw_object_hdr_t *get_object_record_by_slot_index(short slot) { (void)slot; return &guarded.object; }
void *tilemap_lookup(short x, short y) {
    ++tile_calls; tile_x = x; tile_y = y; return &floor_tile;
}
int collect_included_player_barter_items(void *ids, void *slots) {
    memcpy(ids, barter_ids, barter_count * sizeof(short));
    memcpy(slots, barter_slots, barter_count * sizeof(short));
    return barter_count;
}
static void check_neighbors(const byte *before, unsigned offset, unsigned count) {
    const byte *after = (const byte *)&guarded;
    for (unsigned j = 0; j < sizeof(guarded); ++j)
        if (j < 8 + offset || j >= 8 + offset + count)
            TEST_ASSERT_EQUAL_UINT8(before[j], after[j]);
}

static void test_inventory_quantity_and_quality_for_every_word(void) {
    short args[] = {0, 1};
    short read_args[] = {0};
    for (unsigned input = 0; input < 65536; ++input) {
        guarded.object.type_flags = input;
        guarded.object.link_word = input ^ 0x5a5a;
        guarded.object.chain_word = input;
        unsigned link = input ^ 0x5a5a;
        unsigned expected = !(input & 0x8000) || (link & 0x8000) ? 1 : link >> 6;
        TEST_ASSERT_EQUAL_UINT16(expected, babl_builtin_count_inv((char *)(read_args + 1)));
        TEST_ASSERT_EQUAL_UINT8(input & 63, babl_builtin_check_inv_quality((char *)(read_args + 1)));
        byte before[sizeof(guarded)]; memcpy(before, &guarded, sizeof(before));
        variables[1] = (short)(input * 17 + 91);
        TEST_ASSERT_EQUAL_INT(1, babl_builtin_set_inv_quality((char *)(args + 2)));
        TEST_ASSERT_EQUAL_UINT16((input & 0xffc0) | ((unsigned)variables[1] & 63), guarded.object.chain_word);
        check_neighbors(before, 4, 2);
    }
}

static void test_position_getters_and_sentinels_for_every_word(void) {
    short args[] = {0, 1, 2, 3, 4};
    for (unsigned input = 0; input < 65536; ++input) {
        guarded.object.position_word = input;
        variables[1] = 0;
        variables[2] = variables[3] = variables[4] = 0;
        byte before[sizeof(guarded)]; memcpy(before, &guarded, sizeof(before));
        babl_builtin_x_obj_pos((char *)(args + 5));
        TEST_ASSERT_EQUAL_UINT16(input >> 13, variables[2]);
        TEST_ASSERT_EQUAL_UINT16((input >> 10) & 7, variables[3]);
        TEST_ASSERT_EQUAL_UINT16(input & 127, variables[4]);
        TEST_ASSERT_EQUAL_MEMORY(before, &guarded, sizeof(before));
        variables[2] = variables[3] = variables[4] = -1;
        babl_builtin_x_obj_pos((char *)(args + 5));
        TEST_ASSERT_EQUAL_INT16(-1, variables[2]);
        TEST_ASSERT_EQUAL_INT16(-1, variables[3]);
        TEST_ASSERT_EQUAL_INT16(-1, variables[4]);
    }
}

static void test_position_setters_preserve_heading_and_handle_floor_mode(void) {
    short args[] = {0, 1, 2, 3, 4};
    const short z_values[] = {-32768, -2, -1, 0, 127, 128, 255, 32767};
    for (unsigned input = 0; input < 65536; ++input) {
        for (unsigned mode = 0; mode < sizeof(z_values)/sizeof(*z_values); ++mode) {
            guarded.object.position_word = input;
            variables[1] = 1;
            variables[2] = mode & 1 ? -1 : (short)(input * 3);
            variables[3] = mode & 2 ? -1 : (short)(input * 5);
            variables[4] = z_values[mode];
            floor_tile.floor_height = (input >> 8) & 15;
            unsigned expected = input;
            if (variables[2] != -1) expected = (expected & 0x1fff) | ((variables[2] & 7) << 13);
            if (variables[3] != -1) expected = (expected & 0xe3ff) | ((variables[3] & 7) << 10);
            int expected_calls = 0;
            if (variables[4] != -1) {
                unsigned z = variables[4] < 128 ? (variables[4] & 127) : floor_tile.floor_height * 8;
                expected_calls = variables[4] >= 128;
                expected = (expected & 0xff80) | z;
            }
            byte before[sizeof(guarded)]; memcpy(before, &guarded, sizeof(before));
            tile_calls = 0;
            babl_builtin_x_obj_pos((char *)(args + 5));
            TEST_ASSERT_EQUAL_UINT16(expected, guarded.object.position_word);
            TEST_ASSERT_EQUAL_INT(expected_calls, tile_calls);
            if (tile_calls) {
                TEST_ASSERT_EQUAL_INT(variables[2], tile_x);
                TEST_ASSERT_EQUAL_INT(variables[3], tile_y);
            }
            check_neighbors(before, 2, 2);
        }
    }
}

static void test_barter_total_preserves_special_links_and_quantity_zero(void) {
    short args[] = {0, 1, 4, 3};
    barter_count = 2;
    barter_ids[0] = barter_ids[1] = 7;
    barter_slots[0] = 1; barter_slots[1] = 2;
    variables[0] = 7;
    for (unsigned input = 0; input < 65536; ++input) {
        guarded.object.type_flags = input;
        guarded.object.link_word = input ^ 0x5a5a;
        unsigned link = input ^ 0x5a5a;
        unsigned one = !(input & 0x8000) || (link & 0x8000) ? 1 : link >> 6;
        TEST_ASSERT_EQUAL_INT(one != 0, babl_builtin_find_barter_total((char *)(args + 4)));
        TEST_ASSERT_EQUAL_INT16(2, variables[1]);
        TEST_ASSERT_EQUAL_INT16(one * 2, variables[3]);
        TEST_ASSERT_EQUAL_INT16(1, variables[4]);
        TEST_ASSERT_EQUAL_INT16(2, variables[5]);
    }
}
int main(void) {
    UNITY_BEGIN();
    RUN_TEST(test_inventory_quantity_and_quality_for_every_word);
    RUN_TEST(test_position_getters_and_sentinels_for_every_word);
    RUN_TEST(test_position_setters_preserve_heading_and_handle_floor_mode);
    RUN_TEST(test_barter_total_preserves_special_links_and_quantity_zero);
    return UNITY_END();
}
