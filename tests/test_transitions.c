#include "transitions_fixture.h"

void setUp(void) { transitions_fixture_reset(); }
void tearDown(void) { transitions_fixture_dispose(); }

static void test_window_illustration_loads_and_draws_real_picture(void)
{
    display_book_or_scroll_page(0x100);
    TEST_ASSERT_GREATER_THAN_INT(0, blits);
    TEST_ASSERT_EQUAL_INT(1, releases);
    TEST_ASSERT_EQUAL_HEX16_ARRAY(gameplay_palette, g_palette_rgb565_backing, 256);
    /* Subsequent HUD drawing must still use the game's palette. */
    byte hud_tile[4] = {32, 33, 34, 35};
    bitmap_blit_to_framebuffer(0, 0, hud_tile, 2, 2, 0, 0);
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
static void test_fade_in_presents_progressive_brightness_and_keeps_palette(void)
{
    testing_fade = 1;
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    g_force_flush = 1;
    fade_in(framebuffer, NULL, 0);
    TEST_ASSERT_EQUAL_UINT(9, fade_samples);
    for (unsigned step = 1; step <= 8; step++)
        TEST_ASSERT_EQUAL_UINT64(64000ULL * (2 * (31 * step / 8) + 63 * step / 8), fade_brightness[step - 1]);
    TEST_ASSERT_EQUAL_UINT64(64000ULL * 125, fade_brightness[8]);
    TEST_ASSERT_EQUAL_HEX16(0xffff, framebuffer[0]);
    TEST_ASSERT_EQUAL_INT(0, palette_installs);
    TEST_ASSERT_EQUAL_HEX16_ARRAY(gameplay_palette, g_palette_rgb565_backing, 256);
}
static void test_fades_present_each_step_inside_gameplay_batch_with_held_click(void)
{
    testing_fade = 1;
    DAT_0023c63c = 1;
    g_force_flush = 0;
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    uw_begin_present_batch();
    fade_out(framebuffer, NULL, 0);
    unsigned after_fade_out = fade_samples;
    int force_after_fade_out = g_force_flush;
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    flush_dirty_rect_to_display(1);
    unsigned after_ordinary_flush = fade_samples;
    fade_in(framebuffer, NULL, 0);
    unsigned after_fade_in = fade_samples;
    uw_end_present_batch();
    TEST_ASSERT_EQUAL_UINT(8, after_fade_out);
    TEST_ASSERT_EQUAL_INT(0, force_after_fade_out);
    TEST_ASSERT_EQUAL_UINT64(0, fade_brightness[7]);
    TEST_ASSERT_EQUAL_UINT(8, after_ordinary_flush);
    TEST_ASSERT_EQUAL_UINT(17, after_fade_in);
    TEST_ASSERT_EQUAL_UINT64(64000ULL * 125, fade_brightness[16]);
    TEST_ASSERT_EQUAL_INT(0, g_force_flush);
    TEST_ASSERT_EQUAL_UINT(17, fade_samples);
}
static void test_fade_out_presents_progressive_brightness_to_black(void)
{
    testing_fade = 1;
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    g_force_flush = 1;
    fade_out(framebuffer, NULL, 0);
    TEST_ASSERT_EQUAL_UINT(8, fade_samples);
    for (unsigned step = 7; step > 0; step--)
        TEST_ASSERT_EQUAL_UINT64(64000ULL * (2 * (31 * step / 8) + 63 * step / 8), fade_brightness[7 - step]);
    TEST_ASSERT_EQUAL_UINT64(0, fade_brightness[7]);
    TEST_ASSERT_EQUAL_HEX16(0, framebuffer[0]);
    TEST_ASSERT_EQUAL_INT(0, palette_installs);
}
static void test_intro_first_face_fades_in_before_full_brightness(void)
{
    intro_fade_test = 1;
    opening_click_pending = DAT_002506ab = 0;
    uw_begin_modal_present();
    render_babl_dialog_window(0, 0, 199, 320, 200);
    uw_end_modal_present();
    /* N01 is black behind the opening text; N02 contains the first face.
       Dismiss only after that face has actually been presented. */
    TEST_ASSERT_EQUAL_INT(3, opens);
    TEST_ASSERT_EQUAL_STRING("\\CUTS\\CS000.n02", opened[2]);
    unsigned first_face = 0;
    while (first_face < fade_samples && !fade_brightness[first_face]) first_face++;
    TEST_ASSERT_LESS_THAN_UINT(fade_samples, first_face + 8);
    for (unsigned step = 1; step < 8; step++)
        TEST_ASSERT_TRUE(fade_brightness[first_face + step] > fade_brightness[first_face + step - 1]);
    TEST_ASSERT_EQUAL_UINT64(fade_brightness[first_face + 7], fade_brightness[first_face + 8]);
    TEST_ASSERT_EQUAL_INT(1, dismissal_sent);
    /* The opening/closing fades install the saved gameplay palette;
       the face fade itself keeps the current cutscene palette. */
    TEST_ASSERT_EQUAL_INT(2, palette_installs);
    TEST_ASSERT_EQUAL_INT(alloc_count, frees);
}
static void test_fades_hold_each_brightness_step_for_40ms(void)
{
    testing_fade = 1;
    g_force_flush = 1;
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    fade_in(framebuffer, NULL, 0);
    TEST_ASSERT_EQUAL_UINT(9, fade_samples);
    for (unsigned i = 1; i < 8; i++)
        TEST_ASSERT_GREATER_OR_EQUAL_UINT(40, fade_present_times[i] - fade_present_times[i - 1]);
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(320, fade_clock_ms);
    TEST_ASSERT_LESS_THAN_UINT(370, fade_clock_ms);

    fade_samples = fade_clock_ms = 0;
    fade_out(framebuffer, NULL, 0);
    TEST_ASSERT_EQUAL_UINT(8, fade_samples);
    for (unsigned i = 1; i < 8; i++)
        TEST_ASSERT_GREATER_OR_EQUAL_UINT(40, fade_present_times[i] - fade_present_times[i - 1]);
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(320, fade_clock_ms);
    TEST_ASSERT_LESS_THAN_UINT(370, fade_clock_ms);
}
static void test_character_creator_fades_in_real_background_before_input(void)
{
    testing_fade = 1;
    character_screen_inputs = 0;
    memset(DAT_0023cca8_backing, 0, sizeof DAT_0023cca8_backing);
    TEST_ASSERT_EQUAL_INT(0, run_character_generator());
    TEST_ASSERT_EQUAL_INT(1, character_screen_inputs);
    TEST_ASSERT_EQUAL_INT(alloc_count, frees);
    TEST_ASSERT_EQUAL_INT(0, g_force_flush);
}
static void test_new_game_dungeon_transition_presents_fade_out_and_fade_in(void)
{
    testing_fade = 1;
    DAT_0023c63c = 0;
    g_selected_object = NULL;
    memset(DAT_0023cca8_backing, 0, sizeof DAT_0023cca8_backing);
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    uw_begin_present_batch();
    enter_dungeon_view();
    unsigned transition_samples = fade_samples;
    uw_end_present_batch();
    TEST_ASSERT_EQUAL_UINT(17, transition_samples);
    TEST_ASSERT_EQUAL_UINT(17, fade_samples);
    for (unsigned step = 1; step < 8; step++)
        TEST_ASSERT_TRUE(fade_brightness[step] < fade_brightness[step - 1]);
    TEST_ASSERT_EQUAL_UINT64(0, fade_brightness[7]);
    for (unsigned step = 9; step < 16; step++)
        TEST_ASSERT_TRUE(fade_brightness[step] > fade_brightness[step - 1]);
    TEST_ASSERT_EQUAL_INT(0, g_force_flush);
    TEST_ASSERT_EQUAL_UINT(0, entry_pauses);
}
static void test_character_creation_entry_holds_black_for_half_second_once(void)
{
    testing_fade = 1;
    g_selected_object = NULL;
    DAT_0023c63c = 0;
    g_new_game_entry_pause_pending = true;
    memset(DAT_0023cca8_backing, 0, sizeof DAT_0023cca8_backing);
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    uw_begin_present_batch();
    enter_dungeon_view();
    uw_end_present_batch();
    TEST_ASSERT_EQUAL_UINT(1, entry_pauses);
    TEST_ASSERT_EQUAL_UINT(8, entry_pause_sample);
    TEST_ASSERT_EQUAL_HEX16(0, fade_pixels[7]);
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(500, fade_present_times[8] - fade_present_times[7]);
    TEST_ASSERT_FALSE(g_new_game_entry_pause_pending);
    uw_begin_present_batch();
    enter_dungeon_view();
    uw_end_present_batch();
    TEST_ASSERT_EQUAL_UINT(1, entry_pauses);
}
static void test_slow_presentations_count_toward_fade_step_duration(void)
{
    testing_fade = 1;
    fade_present_ms = 48;
    g_force_flush = 1;
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    fade_in(framebuffer, NULL, 0);
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(9 * 48, fade_clock_ms);
    TEST_ASSERT_LESS_THAN_UINT(9 * 48 + 40, fade_clock_ms);
    fade_samples = fade_clock_ms = 0;
    fade_out(framebuffer, NULL, 0);
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(8 * 48, fade_clock_ms);
    TEST_ASSERT_LESS_THAN_UINT(8 * 48 + 40, fade_clock_ms);
}
static void test_entry_tick_fades_character_screen_before_drawing_dungeon(void)
{
    testing_fade = testing_game_tick = testing_entry_tick = 1;
    g_selected_object = NULL;
    DAT_0023c63c = 0;
    DAT_00201c84 = 3; /* Entry transition and ordinary dungeon redraw. */
    memset(DAT_0023cca8_backing, 0, sizeof DAT_0023cca8_backing);
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xf800;
    main_loop_hud_flush();
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(17, fade_samples);
    /* Red identifies the outgoing character screen; green identifies a
       premature dungeon redraw. The actual entry draws white after black. */
    for (unsigned step = 7; step > 0; step--)
        TEST_ASSERT_EQUAL_HEX16((31 * step / 8) << 11, fade_pixels[7 - step]);
    TEST_ASSERT_EQUAL_HEX16(0, fade_pixels[7]);
    TEST_ASSERT_GREATER_OR_EQUAL_INT(8, first_dungeon_draw_sample);
    TEST_ASSERT_EQUAL_HEX16(0xffff, fade_pixels[16]);
}
static void test_options_menu_presents_while_waiting_inside_gameplay_batch(void)
{
    testing_menu = testing_game_tick = 1;
    g_selected_object = NULL;
    DAT_0023c63c = 0;
    opening_click_pending = DAT_002506ab = 0;
    uw_begin_present_batch();
    run_pause_menu_modal_loop(1);
    int force_after_menu = g_force_flush;
    int presents_after_menu = presents;
    uw_end_present_batch();
    TEST_ASSERT_EQUAL_INT(1, menu_visible_before_close);
    TEST_ASSERT_GREATER_THAN_INT(0, presents_after_menu);
    TEST_ASSERT_EQUAL_INT(0, force_after_menu);
    TEST_ASSERT_EQUAL_INT(0, DAT_000868d8);
}
static void test_stack_count_prompt_presents_before_accepting_input(void)
{
    testing_game_tick = input_opens_prompt = 1;
    opening_click_pending = DAT_002506ab = 0;
    DAT_0023c63c = 0;
    g_selected_object = NULL;
    memset(prompt_panel, 0, sizeof prompt_panel);
    prompt_panel[3] = 320;
    DAT_00250704 = (undefined *)prompt_panel;
    prompt_font[3] = 6;
    DAT_000879b0 = (char *)prompt_font;
    main_loop_hud_flush();
    TEST_ASSERT_EQUAL_INT(1, prompt_visible_before_input);
    TEST_ASSERT_EQUAL_STRING("2", prompt_answer);
    TEST_ASSERT_EQUAL_INT(0, g_text_input_active);
}
static void test_nested_input_suspension_restores_batching_and_flush_gate(void)
{
    testing_game_tick = 1;
    g_force_flush = 7;
    uw_begin_present_batch();
    GXEndDraw();
    uw_suspend_present_batch();
    uw_suspend_present_batch();
    GXEndDraw();
    unsigned first = presents;
    uw_resume_present_batch();
    GXEndDraw();
    unsigned nested = presents;
    uw_resume_present_batch();
    GXEndDraw();
    unsigned resumed = presents;
    uw_end_present_batch();
    TEST_ASSERT_EQUAL_UINT(1, first);
    TEST_ASSERT_EQUAL_UINT(2, nested);
    TEST_ASSERT_EQUAL_UINT(2, resumed);
    TEST_ASSERT_EQUAL_UINT(3, presents);
    TEST_ASSERT_EQUAL_INT(7, g_force_flush);
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
    RUN_TEST(test_fade_in_presents_progressive_brightness_and_keeps_palette);
    RUN_TEST(test_fades_present_each_step_inside_gameplay_batch_with_held_click);
    RUN_TEST(test_fade_out_presents_progressive_brightness_to_black);
    RUN_TEST(test_intro_first_face_fades_in_before_full_brightness);
    RUN_TEST(test_fades_hold_each_brightness_step_for_40ms);
    RUN_TEST(test_character_creator_fades_in_real_background_before_input);
    RUN_TEST(test_new_game_dungeon_transition_presents_fade_out_and_fade_in);
    RUN_TEST(test_character_creation_entry_holds_black_for_half_second_once);
    RUN_TEST(test_slow_presentations_count_toward_fade_step_duration);
    RUN_TEST(test_entry_tick_fades_character_screen_before_drawing_dungeon);
    RUN_TEST(test_options_menu_presents_while_waiting_inside_gameplay_batch);
    RUN_TEST(test_stack_count_prompt_presents_before_accepting_input);
    RUN_TEST(test_nested_input_suspension_restores_batching_and_flush_gate);
    return UNITY_END();
}
