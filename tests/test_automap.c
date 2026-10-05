#include "automap_fixture.h"

void setUp(void) { automap_fixture_reset(); automap_storage_fixture_reset(); }
void tearDown(void) { automap_storage_fixture_dispose(); }

static void test_tint_uses_second_random_draw_and_original_palette_formula(void)
{
    automap_fixture_set_pixel(10,10,59);
    automap_random[0]=32767; /* discarded */
    automap_random[1]=0;
    darken_pixel(10,10,6,2);
    TEST_ASSERT_EQUAL_INT(2,automap_random_calls);
    TEST_ASSERT_EQUAL_UINT8(65,automap_indices[189*320+10]);
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[65],automap_pixels[190*320+10]);
    automap_random[2]=0;
    automap_random[3]=32767;
    darken_pixel(10,10,0,4);
    TEST_ASSERT_EQUAL_INT(4,automap_random_calls);
    TEST_ASSERT_EQUAL_UINT8(69,automap_indices[189*320+10]);
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[69],automap_pixels[190*320+10]);
}

static void test_tint_preserves_palette_identity_and_byte_wrap(void)
{
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[64],g_palette_rgb565_backing[65]);
    automap_fixture_set_pixel(10,10,65);
    darken_pixel(10,10,2,3);
    TEST_ASSERT_EQUAL_UINT8(67,automap_indices[189*320+10]);
    automap_fixture_set_pixel(10,10,254);
    darken_pixel(10,10,6,2);
    TEST_ASSERT_EQUAL_UINT8(4,automap_indices[189*320+10]);
}

static void test_tint_masks_host_random_to_original_15_bit_range(void)
{
    automap_fixture_set_pixel(10,10,59);
    automap_random[1]=0x7fffffff;
    darken_pixel(10,10,6,2);
    TEST_ASSERT_EQUAL_UINT8(67,automap_indices[189*320+10]);
}

static void test_wall_edges_use_original_discovered_and_undiscovered_shades(void)
{
    static const int dx[]={0,1,0,-1},dy[]={1,0,-1,0};
    for (int edge=0; edge<4; ++edge) {
        int x=edge==1 ? 40 : edge==3 ? 36 : 37;
        int y=edge==0 ? 37 : edge==2 ? 33 : 34;
        int neighbor=(10+dy[edge])*64+10+dx[edge];
        for (int shape=0; shape<=15; ++shape) {
            if (shape>0 && shape<10) continue;
            automap_fixture_reset();
            automap_cells[neighbor]=shape;
            automap_fixture_set_pixel(x,y,59);
            /* Half-scale roll: +2 for spread 4, +1 for spread 2. */
            automap_random[1]=16383;
            TEST_ASSERT_EQUAL_INT(1,draw_automap_cell_edge(edge,10,10));
            int expected=shape==11 ? 61 : 66;
            TEST_ASSERT_EQUAL_UINT8(expected,automap_indices[(199-y)*320+x]);
            TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[expected],automap_pixels[(200-y)*320+x]);
            TEST_ASSERT_EQUAL_INT(6,automap_random_calls);
        }
    }
}

static void test_floor_fill_uses_original_two_add_three_spread(void)
{
    byte before[9];
    for (int x=0; x<3; ++x)
        for (int y=0; y<3; ++y)
            before[x*3+y]=automap_indices[(199-34-y)*320+37+x];
    draw_automap_cell(1,10,10);
    TEST_ASSERT_EQUAL_INT(18,automap_random_calls);
    for (int x=0; x<3; ++x)
        for (int y=0; y<3; ++y) {
            byte expected=before[x*3+y]+2;
            TEST_ASSERT_EQUAL_UINT8(expected,automap_indices[(199-34-y)*320+37+x]);
            TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[expected],automap_pixels[(200-34-y)*320+37+x]);
        }
}

static void test_explored_open_neighbor_does_not_draw_a_wall(void)
{
    automap_cells[10*64+11]=1;
    TEST_ASSERT_EQUAL_INT(0,draw_automap_cell_edge(1,10,10));
    TEST_ASSERT_EQUAL_INT(0,automap_random_calls);
}

static void test_water_fill_updates_palette_indices_before_a_later_tint(void)
{
    automap_cells[10*64+10]=0x11; /* explored water */
    draw_automap_cell(1,10,10);
    TEST_ASSERT_EQUAL_UINT8(0xb1,automap_indices[165*320+37]);
    darken_pixel(37,34,6,3);
    TEST_ASSERT_EQUAL_UINT8(0xb7,automap_indices[165*320+37]);
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[0xb7],automap_pixels[166*320+37]);
}

static void clear_notes_in_memory(void)
{
    memset(DAT_000ba9d8_backing,0,sizeof DAT_000ba9d8_backing);
    DAT_000bbef0=0;
    automap_text_draws=0;
}

static void test_closing_and_reopening_map_persists_note_text_and_coordinates(void)
{
    enter_automap_screen();
    automap_fixture_type_note("STAIRS",258,137);
    automap_fixture_add_note("FOUNTAIN",41,73);
    exit_automap_screen();
    FILE *file=uw_file_fopen("\\SAVE0\\lev.ark","rb");
    TEST_ASSERT_NOT_NULL(file);
    uint offset;
    TEST_ASSERT_EQUAL_INT(0,fseek(file,2+(1+0x23)*4,SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(1,fread(&offset,4,1,file));
    TEST_ASSERT_GREATER_THAN_UINT(0,offset);
    TEST_ASSERT_EQUAL_INT(0,fseek(file,offset,SEEK_SET));
    byte persisted[108];
    TEST_ASSERT_EQUAL_UINT(108,fread(persisted,1,sizeof persisted,file));
    TEST_ASSERT_EQUAL_MEMORY(DAT_000ba9d8_backing,persisted,sizeof persisted);
    TEST_ASSERT_EQUAL_INT(0,fclose(file));
    clear_notes_in_memory();
    enter_automap_screen();
    TEST_ASSERT_EQUAL_INT(2,DAT_000bbef0);
    TEST_ASSERT_EQUAL_INT(2,automap_text_draws);
    TEST_ASSERT_EQUAL_STRING("STAIRS",automap_drawn_text[0]);
    TEST_ASSERT_EQUAL_INT(258,automap_drawn_x[0]);
    TEST_ASSERT_EQUAL_INT(137,automap_drawn_y[0]);
    TEST_ASSERT_EQUAL_STRING("FOUNTAIN",automap_drawn_text[1]);
    TEST_ASSERT_EQUAL_INT(41,automap_drawn_x[1]);
    TEST_ASSERT_EQUAL_INT(73,automap_drawn_y[1]);
}

static void test_resizing_notes_preserves_other_levels_and_level_data(void)
{
    automap_fixture_add_note("ONE",100,100);
    save_automap_notes_to_archive(1);
    clear_notes_in_memory();
    automap_fixture_add_note("TWO",200,120);
    save_automap_notes_to_archive(2);
    clear_notes_in_memory();
    load_automap_notes_from_archive(1);
    automap_fixture_add_note("THREE",280,130);
    save_automap_notes_to_archive(1); /* grows and copies another entry */
    clear_notes_in_memory();
    load_automap_notes_from_archive(2);
    TEST_ASSERT_EQUAL_INT(1,DAT_000bbef0);
    TEST_ASSERT_EQUAL_STRING("TWO",automap_drawn_text[0]);
    clear_notes_in_memory();
    load_automap_notes_from_archive(1);
    TEST_ASSERT_EQUAL_INT(2,DAT_000bbef0);
    TEST_ASSERT_EQUAL_STRING("THREE",automap_drawn_text[1]);
    TEST_ASSERT_EQUAL_INT(280,automap_drawn_x[1]);
    uint archive[4];
    TEST_ASSERT_TRUE(open_level_archive(archive,s__SAVE0_lev_ark_000842fc));
    char level[8];
    TEST_ASSERT_EQUAL_INT(8,read_archive_entry(archive,0,level));
    TEST_ASSERT_EQUAL_MEMORY("LEVELONE",level,8);
    TEST_ASSERT_TRUE(close_level_archive(archive));
}

static void test_deleted_notes_are_compacted_and_last_deletion_persists(void)
{
    automap_fixture_add_note("DELETE ONE",100,100);
    automap_fixture_add_note("DELETE TWO",120,120);
    automap_fixture_add_note("KEEP",140,140);
    save_automap_notes_to_archive(1);
    *(short *)(DAT_000ba9d8_backing+50)=-1;
    *(short *)(DAT_000ba9d8_backing+54+50)=-1;
    DAT_000b99c4=1;
    save_automap_notes_to_archive(1);
    clear_notes_in_memory();
    load_automap_notes_from_archive(1);
    TEST_ASSERT_EQUAL_INT(1,DAT_000bbef0);
    TEST_ASSERT_EQUAL_STRING("KEEP",automap_drawn_text[0]);
    TEST_ASSERT_EQUAL_INT(140,automap_drawn_x[0]);
    DAT_000bbef0=0; /* editor deletes the last record by lowering count */
    DAT_000b99c4=1;
    save_automap_notes_to_archive(1);
    clear_notes_in_memory();
    load_automap_notes_from_archive(1);
    TEST_ASSERT_EQUAL_INT(0,DAT_000bbef0);
    TEST_ASSERT_EQUAL_INT(0,automap_text_draws);
    automap_fixture_add_note("OTHER LEVEL",200,120);
    save_automap_notes_to_archive(2);
    clear_notes_in_memory();
    load_automap_notes_from_archive(1);
    TEST_ASSERT_EQUAL_INT(0,DAT_000bbef0);
}

static void test_automap_cursor_erases_when_a_dungeon_mode_is_selected(void)
{
    g_cursor_mode=5; /* retained interact mode */
    ushort before[320*200];
    memcpy(before,automap_pixels,sizeof before);
    draw_idle_mouse_cursor();
    TEST_ASSERT_EQUAL_INT(1,DAT_00204844);
    TEST_ASSERT_EQUAL_HEX16(0xf800,automap_pixels[50*320+50]);
    decrement_cursor_hide_depth();
    TEST_ASSERT_EQUAL_INT(0,DAT_00204844);
    TEST_ASSERT_EQUAL_MEMORY(before,automap_pixels,sizeof before);
    g_mouse_x=80; g_mouse_y=80;
    cursor_show_idle_tick();
    decrement_cursor_hide_depth();
    TEST_ASSERT_EQUAL_MEMORY(before,automap_pixels,sizeof before);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_tint_uses_second_random_draw_and_original_palette_formula);
    RUN_TEST(test_tint_preserves_palette_identity_and_byte_wrap);
    RUN_TEST(test_tint_masks_host_random_to_original_15_bit_range);
    RUN_TEST(test_wall_edges_use_original_discovered_and_undiscovered_shades);
    RUN_TEST(test_floor_fill_uses_original_two_add_three_spread);
    RUN_TEST(test_explored_open_neighbor_does_not_draw_a_wall);
    RUN_TEST(test_water_fill_updates_palette_indices_before_a_later_tint);
    RUN_TEST(test_closing_and_reopening_map_persists_note_text_and_coordinates);
    RUN_TEST(test_resizing_notes_preserves_other_levels_and_level_data);
    RUN_TEST(test_deleted_notes_are_compacted_and_last_deletion_persists);
    RUN_TEST(test_automap_cursor_erases_when_a_dungeon_mode_is_selected);
    int result=UNITY_END();
    automap_storage_fixture_finish();
    return result;
}
