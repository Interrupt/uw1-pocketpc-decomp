#include "illustration_render_fixture.h"

void setUp(void) { illustration_render_fixture_reset(); }
void tearDown(void) { illustration_render_fixture_dispose(); }

static void test_window_illustration_loads_and_draws_real_picture(void)
{
    display_book_or_scroll_page(0x100);
    TEST_ASSERT_GREATER_THAN_INT(0, blits);
    TEST_ASSERT_EQUAL_INT(1, releases);
    TEST_ASSERT_EQUAL_HEX16_ARRAY(gameplay_palette, g_palette_rgb565_backing, 256);
    /* Subsequent HUD drawing must still use the game's palette. */
    byte hud_tile[4] = {32, 33, 34, 35};
    bitmap_blit_to_framebuffer(0, 0, hud_tile, 2, 2, 0, 0, 0);
    TEST_ASSERT_EQUAL_HEX16(gameplay_palette[32], framebuffer[0]);
    TEST_ASSERT_EQUAL_HEX16(gameplay_palette[35], framebuffer[321]);
    TEST_ASSERT_EQUAL_STRING("\\CUTS\\CS400.n00", opened[0]);
    TEST_ASSERT_EQUAL_STRING("\\CUTS\\CS400.n01", opened[1]);
    TEST_ASSERT_EQUAL_INT(alloc_count, frees);
    TEST_ASSERT_BITS_HIGH(2, DAT_00201c84);
    TEST_ASSERT_EQUAL_INT(0, g_text_use_palette_color);
}

static void test_picture_file_size_preserves_read_position(void)
{
    int handle = uw_file_open_read("\\CUTS\\CS400.N01");
    TEST_ASSERT_GREATER_THAN_INT(0, handle);
    file_handles[0] = handle;
    TEST_ASSERT_EQUAL_INT(7, uw_file_seek(handle, 7, 0));
    unsigned int high = 99;
    long size = GetFileSize(handle, &high);
    TEST_ASSERT_GREATER_THAN_INT(0xb00, size);
    TEST_ASSERT_EQUAL_UINT(0, high);
    TEST_ASSERT_EQUAL_INT(7, uw_file_seek(handle, 0, 1));
    TEST_ASSERT_EQUAL_INT(size, GetFileSize(handle, NULL));
    TEST_ASSERT_EQUAL_UINT(0xffffffffu, GetFileSize(-1, NULL));
    CloseHandle(handle);
    TEST_ASSERT_EQUAL_UINT(0xffffffffu, GetFileSize(handle, NULL));
}

static void test_opening_right_click_release_does_not_dismiss_picture(void)
{
    opening_hold_polls = 12;
    display_book_or_scroll_page(0x100);
    TEST_ASSERT_EQUAL_INT(1, releases);
    TEST_ASSERT_EQUAL_INT(1, dismissal_sent);
    TEST_ASSERT_GREATER_OR_EQUAL_INT(4, idle_polls);
    TEST_ASSERT_GREATER_THAN_INT(0, blits);
}

static void test_window_script_finishes_after_wait_is_dismissed(void)
{
    dismiss_event = 2;
    test_window_illustration_loads_and_draws_real_picture();
}

static void test_window_picture_without_registry_directory_uses_cuts(void)
{
    DAT_0023c698 = 0;
    test_window_illustration_loads_and_draws_real_picture();
}

static void test_missing_window_script_releases_viewer_buffers(void)
{
    missing_resource = 1;
    display_book_or_scroll_page(0x100);
    TEST_ASSERT_EQUAL_INT(0, blits);
    TEST_ASSERT_EQUAL_INT(alloc_count, frees);
    TEST_ASSERT_BITS_HIGH(2, DAT_00201c84);
    TEST_ASSERT_EQUAL_INT(0, g_text_use_palette_color);
}

static void test_missing_window_image_releases_viewer_buffers(void)
{
    missing_resource = 2;
    display_book_or_scroll_page(0x100);
    TEST_ASSERT_EQUAL_INT(0, blits);
    TEST_ASSERT_EQUAL_INT(alloc_count, frees);
    TEST_ASSERT_BITS_HIGH(2, DAT_00201c84);
    TEST_ASSERT_EQUAL_INT(0, g_text_use_palette_color);
}

static void test_palette_preserves_channel_values_and_clamps_brightness(void)
{
    byte palette[768] = {0};
    palette[3] = 64;                  /* red -> 96 -> 12 RGB565 bits */
    palette[7] = 128;                 /* green -> 192 -> 48 */
    palette[11] = 255;                /* blue clamps at 255 -> 31 */
    build_rgb565_palette(palette, -1);
    TEST_ASSERT_EQUAL_HEX16(0, g_palette_rgb565_backing[0]);
    TEST_ASSERT_EQUAL_HEX16(12 << 11, g_palette_rgb565_backing[1]);
    TEST_ASSERT_EQUAL_HEX16(48 << 5, g_palette_rgb565_backing[2]);
    TEST_ASSERT_EQUAL_HEX16(31, g_palette_rgb565_backing[3]);
}

static void test_palette_builds_original_dungeon_shade_rows(void)
{
    byte palette[768] = {0};
    palette[3] = 64;
    palette[7] = 128;
    palette[11] = 255;
    build_rgb565_palette(palette, 0);
    TEST_ASSERT_EQUAL_HEX16(11 << 11, DAT_00248418_backing[1]);
    TEST_ASSERT_EQUAL_HEX16(45 << 5, DAT_00248418_backing[2]);
    TEST_ASSERT_EQUAL_HEX16(29, DAT_00248418_backing[3]);
    TEST_ASSERT_EQUAL_HEX16(0, DAT_00248418_backing[19 * 256 + 1]);
    TEST_ASSERT_EQUAL_HEX16(2 << 5, DAT_00248418_backing[19 * 256 + 2]);
    TEST_ASSERT_EQUAL_HEX16(1, DAT_00248418_backing[19 * 256 + 3]);
}

static void test_window_dismissal_requests_original_dungeon_redraw_handler(void)
{
    display_book_or_scroll_page(0x100);
    TEST_ASSERT_BITS_HIGH(2, DAT_00201c84);
    TEST_ASSERT_NOT_NULL(DAT_00085668_real_table[1]);
    DAT_00085668_real_table[1]();
    TEST_ASSERT_EQUAL_INT(1, dungeon_redraws);
}

static void test_game_tick_presents_once_after_nested_redraws(void)
{
    testing_game_tick = 1;
    DAT_00201c84 = 2;
    main_loop_hud_flush();
    TEST_ASSERT_EQUAL_INT(1, dungeon_redraws);
    TEST_ASSERT_EQUAL_INT(1, presents);
    TEST_ASSERT_EQUAL_INT(0, g_force_flush);
}

static void test_modal_window_presents_inside_a_batched_game_tick(void)
{
    testing_game_tick = input_opens_window = 1;
    main_loop_hud_flush();
    TEST_ASSERT_GREATER_THAN_INT(0, blits);
    TEST_ASSERT_GREATER_THAN_INT(1, presents);
    TEST_ASSERT_EQUAL_INT(0, g_force_flush);
}

static void test_nested_batches_wait_for_outer_tick_to_finish(void)
{
    testing_game_tick = 1;
    uw_begin_present_batch();
    GXEndDraw();
    uw_begin_present_batch();
    GXEndDraw();
    uw_end_present_batch();
    TEST_ASSERT_EQUAL_INT(0, presents);
    uw_end_present_batch();
    TEST_ASSERT_EQUAL_INT(1, presents);
    uw_begin_present_batch();
    uw_end_present_batch();
    TEST_ASSERT_EQUAL_INT(1, presents);
}

static void test_modal_restores_batching_and_previous_flush_gate(void)
{
    testing_game_tick = 1;
    g_force_flush = 7;
    uw_begin_present_batch();
    GXEndDraw();
    uw_begin_modal_present();
    uw_begin_modal_present();
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(1, presents);
    uw_end_modal_present();
    TEST_ASSERT_EQUAL_INT(1, g_force_flush);
    uw_end_modal_present();
    TEST_ASSERT_EQUAL_INT(7, g_force_flush);
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(1, presents);
    uw_end_present_batch();
    TEST_ASSERT_EQUAL_INT(2, presents);
}

static void test_unbatched_animation_frames_present_immediately(void)
{
    testing_game_tick = 1;
    GXEndDraw();
    GXEndDraw();
    TEST_ASSERT_EQUAL_INT(2, presents);
}

static void test_desktop_cursor_allows_frames_while_dragging(void)
{
    testing_game_tick=1;
    g_selected_object=(char *)framebuffer;
    DAT_0023c63c=1;
    dirty_rect_set(0,200,0,320);
    flush_dirty_rect_to_display(1);
    TEST_ASSERT_EQUAL_INT(0,presents); /* Original stylus gate. */
    desktop_cursor=1;
    dirty_rect_set(0,200,0,320);
    flush_dirty_rect_to_display(1);
    TEST_ASSERT_EQUAL_INT(1,presents);
    TEST_ASSERT_EQUAL_INT(0,g_force_flush);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_palette_preserves_channel_values_and_clamps_brightness);
    RUN_TEST(test_palette_builds_original_dungeon_shade_rows);
    RUN_TEST(test_window_illustration_loads_and_draws_real_picture);
    RUN_TEST(test_picture_file_size_preserves_read_position);
    RUN_TEST(test_opening_right_click_release_does_not_dismiss_picture);
    RUN_TEST(test_window_script_finishes_after_wait_is_dismissed);
    RUN_TEST(test_window_picture_without_registry_directory_uses_cuts);
    RUN_TEST(test_missing_window_script_releases_viewer_buffers);
    RUN_TEST(test_missing_window_image_releases_viewer_buffers);
    RUN_TEST(test_window_dismissal_requests_original_dungeon_redraw_handler);
    RUN_TEST(test_game_tick_presents_once_after_nested_redraws);
    RUN_TEST(test_modal_window_presents_inside_a_batched_game_tick);
    RUN_TEST(test_nested_batches_wait_for_outer_tick_to_finish);
    RUN_TEST(test_modal_restores_batching_and_previous_flush_gate);
    RUN_TEST(test_unbatched_animation_frames_present_immediately);
    RUN_TEST(test_desktop_cursor_allows_frames_while_dragging);
    return UNITY_END();
}
