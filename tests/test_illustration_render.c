#include "unity.h"
#include "../src/headers/uw.h"
#include "src/headers/file_io.h"

/* Real script, LPF page loading, RLE decoding and viewer loop. Stub only the
   display/audio/input services; one click dismisses the static window image. */
undefined1 DAT_00085448_backing[11] = "\\CSXXX.nXX";
undefined1 DAT_0023c698_backing[32768];
undefined1 DAT_00101968_backing[8192];
uintptr_t DAT_00101a70;
ushort DAT_00101a6c, DAT_000853f8, DAT_000853fc, DAT_00085400;
static byte image[64000];
static int file_handles[4];
static void *allocations[64];
static int alloc_count, frees, opens, blits, clicks, dungeon_redraws;
static uint clock_units;
static int dismiss_event, missing_resource, opening_click_pending, releases;
static ushort gameplay_palette[256];
static char opened[4][260];
codeval *const PTR_FUN_00085408[16] = {
    babl_render_op_wrap_message, FUN_000362e8, FUN_00036300, FUN_00036308,
    FUN_00036394, FUN_000363f0, FUN_00036404, FUN_00036418,
    babl_render_op_show_code, FUN_000365bc, FUN_000365fc, FUN_0003663c,
    FUN_00036698, babl_render_op_say, FUN_00036344, babl_render_op_play_sound
};
undefined4 babl_render_op_wrap_message(void) { TEST_FAIL_MESSAGE("Unexpected text in window script"); return 0; }
undefined4 babl_render_op_say(void) { TEST_FAIL_MESSAGE("Unexpected voice in window script"); return 0; }
undefined4 babl_render_op_play_sound(void) { return 0; }
void *Ordinal_1041(unsigned int count)
{
    TEST_ASSERT_LESS_THAN_INT(64, alloc_count);
    void *p = calloc(1, count);
    TEST_ASSERT_NOT_NULL(p);
    allocations[alloc_count++] = p;
    return p;
}
void *Ordinal_1346(unsigned int count, unsigned int size) { return Ordinal_1041(count * size); }
void *Ordinal_1047(void *p, int value, unsigned int count) { return memset(p, value, count); }
void *Ordinal_1044(void *p, const void *source, unsigned int count) { return memcpy(p, source, count); }
char *Ordinal_1063(char *p, const char *source) { return strcat(p, source); }
void Ordinal_1018(void *p)
{
    for (int i = 0; i < alloc_count; i++) if (allocations[i] == p) {
        free(p); allocations[i] = NULL; frees++; return;
    }
    TEST_FAIL_MESSAGE("Free must receive the complete allocated pointer");
}
long Ordinal_553(int handle)
{
    for (int i = 0; i < 4; i++) if (file_handles[i] == handle) file_handles[i] = 0;
    return uw_file_close(handle);
}
long Ordinal_2005(int divisor, int dividend) { return dividend / divisor; }
long Ordinal_496(void) { return 0; }
undefined4 open_file_for_read(const char *path)
{
    TEST_ASSERT_LESS_THAN_INT(4, opens);
    int slot = opens++;
    strcpy(opened[slot], path);
    if ((!strcmp(path, "\\CUTS\\CS400.n00") && missing_resource == 1) ||
        (!strcmp(path, "\\CUTS\\CS400.n01") && missing_resource == 2)) return -1;
    int handle = uw_file_open_read(path);
    if (handle > 0) file_handles[slot] = handle;
    return handle;
}
undefined4 read_file_handle(int handle, void *p, unsigned int count)
{
    unsigned int bytes = uw_file_read(handle, p, count);
    /* Emulate the discovery handler's three script patches in memory. */
    if (bytes == 16) { ((ushort *)p)[2] = 1; ((ushort *)p)[3] = 1; ((ushort *)p)[6] = 1; }
    return bytes;
}
undefined4 seek_file_handle(int handle, int offset, int origin) { return uw_file_seek(handle, offset, origin); }
uint read_realtime_clock_units(void) { clock_units += 0x100; return clock_units; }
/* Run the real input poll/release logic. Only the OS message service is
   scripted: hold the opening right click, release, idle, then click again. */
short DAT_00086968, DAT_0008696e, DAT_00204850;
undefined2 DAT_0008696a, DAT_0008696c;
short g_mouse_x, g_mouse_y;
ushort DAT_0023c448;
undefined2 DAT_00201b60;
int DAT_0020484c;
undefined4 DAT_00204868;
char DAT_002506aa, DAT_002506ab;
static short mouse_driver;
short *DAT_000876c4 = &mouse_driver;
static char keyboard_case;
char *DAT_0008794c = &keyboard_case;
static int opening_hold_polls, idle_polls, dismissal_sent;
long Ordinal_870(void) { return 0; }
long Ordinal_859(void) { return 0; }
long Ordinal_1417(void) { return 0; }
long Ordinal_1090(int key) { return key; }
long Ordinal_1091(int key) { return key; }
int Ordinal_864(void *msg, void *hwnd, unsigned int low,
                unsigned int high, unsigned int remove)
{
    (void)msg; (void)hwnd; (void)low; (void)high; (void)remove;
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(1000, ++clicks, "Viewer never presented or dismissed");
    if (opening_click_pending) {
        if (opening_hold_polls-- > 0) return 1;
        opening_click_pending = 0;
        DAT_002506ab = 0;
        releases++;
        return 1;
    }
    if (blits > 0 && idle_polls++ >= 3 && !dismissal_sent) {
        dismissal_sent = 1;
        if (dismiss_event < 4) {
            DAT_0023c63c = dismiss_event & 1;
            DAT_002506ab = (dismiss_event & 2) != 0;
        } else DAT_0023c448 = dismiss_event;
        return 1;
    }
    return 0;
}
void noop_key_handler(void) {}
void update_mouse_state(void) {}

undefined1 *DAT_00201b40, *DAT_00201b50;
int DAT_00201b54, DAT_00201b4c, DAT_00201b58, DAT_00201b3c;
ushort DAT_00201b48;
short DAT_00201b44;
void *g_uw_framebuffer;
undefined1 DAT_00088d98_backing[1536];
static byte draw_color;
byte *g_draw_color_index = &draw_color;
undefined1 *DAT_00084298 = &draw_color;
char *DAT_000879b0;
short DAT_0023c63c;
ushort DAT_00101960;
int g_text_use_palette_color, DAT_00201c98;
undefined2 DAT_0024cfac;
short *DAT_00085a6c;
char s_FONTBIG_SYS_00085454[] = "FONTBIG.SYS";
char s_font5x6p_sys_0008430c[] = "font5x6p.sys";
void debug_framebuffer_dump(const char *tag) { (void)tag; }
void fade_out(void) {}
void tick_book_illustration_palette_cycles(void) {}
void clear_ambient_sound_target(void) {}
void voice_sample_cluster_stub_1(void) {}
void voice_sample_cluster_stub_2(void) {}
void advance_menu_music_track(void) {}
void stop_voice_sample(void) {}
void clear_screen_and_restore_cursor(void) {}
void clear_ambient_sound_target_thunk(void) {}
void draw_text_string(void) { TEST_FAIL_MESSAGE("Unexpected window text"); }
int measure_text_width(void) { TEST_FAIL_MESSAGE("Unexpected window text"); return 0; }
static void assert_visible_picture(void);
undefined4 get_audio_subsystem_flag(void) { return 0; }
undefined4 play_numbered_voice_sample(void) { return 0; }
bool is_voice_sample_finished(void) { return 1; }
undefined4 play_music_track(void) { return 0; }
bool select_active_font(void) { return true; }
bool set_palette_bank(void) { return true; }
void decrement_cursor_hide_depth(void) {}
void load_dungeon_texture_arenas(void) {}
void change_game_mode(void) {}
undefined4 cursor_show_idle_tick(void) { return 0; }

static ushort framebuffer[320 * 200], hardware_framebuffer[240 * 320];
static int presents, testing_game_tick, input_opens_window;
int g_force_flush, g_force_redraw_no_xp;
unsigned int g_uw_frame_clock_units;
char *g_selected_object;
short DAT_00084f10;
int DAT_00088954, DAT_0008895c, DAT_00088950, DAT_00088958;
short DAT_00201b64;
undefined2 DAT_00201c90;
static char selected_window;
undefined2 g_palette_rgb565_backing[32768];
undefined1 DAT_00084a40_backing[32768];
undefined2 DAT_00248418_backing[20 * 256], DAT_00242010_backing[32768];
undefined2 DAT_000a85c0;
int g_blit_transparent_mode, DAT_0024af70;
void *DAT_0023c430;
undefined1 DAT_0023cdb0_backing[32768];
short DAT_00201c84;
int uw_defer_present(void);
void *GXBeginDraw(void) { return hardware_framebuffer; }
int GXEndDraw(void)
{
    if (uw_defer_present()) return 1;
    presents++;
    if (!testing_game_tick) assert_visible_picture();
    return 1;
}
static void assert_visible_picture(void)
{
    unsigned colored_pixels = 0;
    for (int row = 19; row < 131; row++)
        for (int col = 52; col < 224; col++)
            if (framebuffer[row * 320 + col]) {
                TEST_ASSERT_EQUAL_HEX16(framebuffer[row * 320 + col],
                    hardware_framebuffer[(319 - col) * 240 + row]);
                colored_pixels++;
            }
    TEST_ASSERT_GREATER_THAN_UINT(256, colored_pixels);
    TEST_ASSERT_EQUAL_INT(64000, DAT_00201b4c);
    blits++;
}
void render_dungeon_frame_timed(void)
{
    TEST_ASSERT_EQUAL_HEX16_ARRAY(gameplay_palette, g_palette_rgb565_backing, 256);
    dungeon_redraws++;
    if (testing_game_tick) flush_dungeon_frame();
}
void enter_dungeon_view(void) { TEST_FAIL_MESSAGE("Unexpected enter_dungeon_view during picture dismissal"); }
undefined4 dungeon_view_anim_tick(void) { TEST_FAIL_MESSAGE("Unexpected dungeon_view_anim_tick during picture dismissal"); return 0; }
void refresh_equipment_display_if_visible(void) { TEST_FAIL_MESSAGE("Unexpected refresh_equipment_display_if_visible during picture dismissal"); }
void handle_game_victory_sequence(void) { TEST_FAIL_MESSAGE("Unexpected handle_game_victory_sequence during picture dismissal"); }
void movement_pacing_handler(void) { TEST_FAIL_MESSAGE("Unexpected movement_pacing_handler during picture dismissal"); }
void sync_player_stats_to_hud(void) { TEST_FAIL_MESSAGE("Unexpected sync_player_stats_to_hud during picture dismissal"); }
void hud_panel_redraw_dispatch(void) { TEST_FAIL_MESSAGE("Unexpected hud_panel_redraw_dispatch during picture dismissal"); }
void enter_automap_screen(void) { TEST_FAIL_MESSAGE("Unexpected enter_automap_screen during picture dismissal"); }
void exit_automap_screen(void) { TEST_FAIL_MESSAGE("Unexpected exit_automap_screen during picture dismissal"); }
void enter_conversation_mode_screen(void) { TEST_FAIL_MESSAGE("Unexpected enter_conversation_mode_screen during picture dismissal"); }
void exit_talk_mode(void) { TEST_FAIL_MESSAGE("Unexpected exit_talk_mode during picture dismissal"); }

void setUp(void)
{
    alloc_count = frees = opens = blits = clicks = dungeon_redraws = 0;
    clock_units = 0;
    dismiss_event = 1;
    missing_resource = 0;
    memset(allocations, 0, sizeof allocations);
    memset(file_handles, 0, sizeof file_handles);
    setenv("UW_DATA_DIR", UW_TEST_DATA_DIR, 1);
    memset(image, 0, sizeof image);
    DAT_00101a70 = (uintptr_t)image;
    g_uw_framebuffer = framebuffer;
    memset(framebuffer, 0, sizeof framebuffer);
    memset(hardware_framebuffer, 0, sizeof hardware_framebuffer);
    presents = testing_game_tick = input_opens_window = 0;
    DAT_0023cdb8 = 2; DAT_0023cdbc = 480; DAT_0023cdc0 = 16;
    DAT_00088954 = DAT_00088950 = 0;
    DAT_0008895c = 200; DAT_00088958 = 320;
    g_force_flush = 0;
    g_selected_object = &selected_window;
    DAT_0023c63c = 1;
    DAT_00201b64 = DAT_00201c90 = 0;
    FILE *palette = fopen(UW_TEST_DATA_DIR "/DATA/PALS.DAT", "rb");
    TEST_ASSERT_NOT_NULL(palette);
    TEST_ASSERT_EQUAL_UINT(768, fread(DAT_00088d98_backing, 1, 768, palette));
    TEST_ASSERT_EQUAL_INT(0, fclose(palette));
    byte rgb[768];
    expand_pals_bytes(rgb, DAT_00088d98_backing, 0);
    build_rgb565_palette(rgb, -1);
    memcpy(gameplay_palette, g_palette_rgb565_backing, sizeof gameplay_palette);
    opening_click_pending = 1;
    releases = 0;
    opening_hold_polls = 4;
    idle_polls = dismissal_sent = 0;
    DAT_002506aa = 0;
    DAT_002506ab = 1;
    DAT_0023c63c = 0;
    DAT_00204850 = 2;
    DAT_00086968 = DAT_0008696e = -1;
    DAT_0023c448 = 0;
    DAT_00201c84 = 0;
    strcpy((char *)DAT_0023c698_backing, "\\CUTS");
}
void tearDown(void)
{
    for (int i = 0; i < 4; i++) if (file_handles[i] > 0) uw_file_close(file_handles[i]);
    for (int i = 0; i < alloc_count; i++) if (allocations[i]) free(allocations[i]);
}
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
    long size = Ordinal_172(handle, &high);
    TEST_ASSERT_GREATER_THAN_INT(0xb00, size);
    TEST_ASSERT_EQUAL_UINT(0, high);
    TEST_ASSERT_EQUAL_INT(7, uw_file_seek(handle, 0, 1));
    TEST_ASSERT_EQUAL_INT(size, Ordinal_172(handle, NULL));
    TEST_ASSERT_EQUAL_UINT(0xffffffffu, Ordinal_172(-1, NULL));
    Ordinal_553(handle);
    TEST_ASSERT_EQUAL_UINT(0xffffffffu, Ordinal_172(handle, NULL));
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
void dirty_rect_set(int top, int bottom, int left, int right)
{ DAT_00088954 = top; DAT_0008895c = bottom; DAT_00088950 = left; DAT_00088958 = right; }
void dispatch_sticky_mode_handlers(void)
{
    if (DAT_00201c84 & 2) DAT_00085668_real_table[1]();
    DAT_00201c84 = 0;
    /* Other HUD handlers may request their own intermediate flush. */
    flush_dirty_rect_to_display(1);
}
void uw_debug_blit_pick_buffer(void) {}
void render_dungeon_view_frame(void) {}
void uw_debug_draw_inv_hotspot_positions(void) {}
void dbgui_draw(void) {}
void uw_debug_dump_sprite_frames_once(void) {}
void uw_debug_dump_critter_sheet_once(void) {}
void uw_debug_force_item_id_once(void) {}
void tick_weapon_swing_state(void) {}
void poll_input_bindings(void)
{
    if (input_opens_window) {
        int saved_presents = presents;
        testing_game_tick = 0;
        display_book_or_scroll_page(0x100);
        testing_game_tick = 1;
        TEST_ASSERT_GREATER_THAN_INT(saved_presents, presents);
        TEST_ASSERT_EQUAL_INT(0, g_force_flush);
    }
    flush_dirty_rect_to_display(1);
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
    return UNITY_END();
}
