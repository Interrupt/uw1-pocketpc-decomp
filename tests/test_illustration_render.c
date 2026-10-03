#include "unity.h"
#include "uw.h"
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
static int testing_fade, intro_fade_test, palette_installs, presents;
static unsigned long long fade_brightness[256];
static unsigned fade_samples;
static uint fade_clock_ms, fade_present_ms;
bool g_new_game_entry_pause_pending;
static unsigned entry_pauses, entry_pause_sample;
static uint fade_present_times[256];
static ushort fade_pixels[256];
static int testing_entry_tick, first_dungeon_draw_sample;
static int testing_menu, menu_polls, menu_dismissal_sent, menu_visible_before_close;
static int input_opens_prompt, prompt_polls, prompt_event, prompt_visible_before_input;
static int prompt_start_presents;
static char prompt_answer[4];
static ushort framebuffer[320 * 200], hardware_framebuffer[240 * 320];
static ushort gameplay_palette[256];
static char opened[4][260];
codeval *const PTR_FUN_00085408[16] = {
    babl_render_op_wrap_message, FUN_000362e8, FUN_00036300, FUN_00036308,
    FUN_00036394, FUN_000363f0, FUN_00036404, FUN_00036418,
    babl_render_op_show_code, FUN_000365bc, FUN_000365fc, FUN_0003663c,
    FUN_00036698, babl_render_op_say, FUN_00036344, babl_render_op_play_sound
};
undefined4 babl_render_op_wrap_message(void) { if (intro_fade_test) return 2; TEST_FAIL_MESSAGE("Unexpected text in window script"); return 0; }
undefined4 babl_render_op_say(void) { if (intro_fade_test) return 3; TEST_FAIL_MESSAGE("Unexpected voice in window script"); return 0; }
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
long Ordinal_496(unsigned int ms)
{
    if (testing_fade && ms == 500) {
        entry_pauses++;
        entry_pause_sample = fade_samples;
    }
    if (testing_fade) fade_clock_ms += ms;
    return 0;
}
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
uint read_realtime_clock_units(void)
{
    if (testing_fade) return fade_clock_ms++ >> 2;
    clock_units += 0x100;
    return clock_units;
}
long Ordinal_535(void)
{
    if (testing_fade) return fade_clock_ms++;
    clock_units += 0x100;
    return clock_units * 4;
}
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
undefined2 g_cursor_holding_state;
static short mouse_driver;
short *DAT_000876c4 = &mouse_driver;
static char keyboard_case;
char *DAT_0008794c = &keyboard_case;
static int opening_hold_polls, idle_polls, dismissal_sent;
long Ordinal_870(void) { return 0; }
long Ordinal_859(void) { return 0; }
long Ordinal_1417(int key, int mask) { return input_opens_prompt && key >= '0' && key <= '9'; }
long Ordinal_1090(int key) { return key; }
long Ordinal_1091(int key) { return key; }
int Ordinal_864(void *msg, void *hwnd, unsigned int low,
                unsigned int high, unsigned int remove)
{
    (void)msg; (void)hwnd; (void)low; (void)high; (void)remove;
    if (input_opens_prompt && g_text_input_active) {
        ++prompt_polls;
        if (prompt_event == 0 && (presents > prompt_start_presents || prompt_polls >= 8)) {
            prompt_visible_before_input = presents > prompt_start_presents;
            prompt_event = 1;
            DAT_0023c448 = '2';
            return 1;
        }
        if (prompt_event == 1 && (presents > prompt_start_presents + 1 || prompt_polls >= 12)) {
            prompt_event = 2;
            DAT_0023c448 = 0xd;
            return 1;
        }
        return 0;
    }
    if (testing_menu) {
        if (++menu_polls >= 4 && !menu_dismissal_sent) {
            menu_visible_before_close = presents > 0 && hardware_framebuffer[319 * 240] == 0x001f;
            menu_dismissal_sent = 1;
            DAT_0023c448 = 0x1b;
            return 1;
        }
        return 0;
    }
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(1000, ++clicks, "Viewer never presented or dismissed");
    if (opening_click_pending) {
        if (opening_hold_polls-- > 0) return 1;
        opening_click_pending = 0;
        DAT_002506ab = 0;
        releases++;
        return 1;
    }
    if (intro_fade_test && fade_samples && fade_brightness[fade_samples - 1] && !dismissal_sent) {
        dismissal_sent = 1;
        DAT_0023c448 = 0x1b;
        return 1;
    }
    if (!intro_fade_test && blits > 0 && idle_polls++ >= 3 && !dismissal_sent) {
        dismissal_sent = 1;
        if (dismiss_event < 4) {
            DAT_0023c63c = dismiss_event & 1;
            DAT_002506ab = (dismiss_event & 2) != 0;
        } else DAT_0023c448 = dismiss_event;
        return 1;
    }
    return 0;
}
void FUN_00058734(void) {}
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
void apply_palette_buffer(void) { palette_installs++; }
void tick_book_illustration_palette_cycles(void) {}
void clear_ambient_sound_target(void) {}
void voice_sample_cluster_stub_1(void) {}
void voice_sample_cluster_stub_2(void) {}
void advance_menu_music_track(void) {}
void stop_voice_sample(void) {}
void clear_screen_and_restore_cursor(void) {}
void thunk_FUN_0007ec1c(void) {}
void draw_text_string(void) { if (!input_opens_prompt) TEST_FAIL_MESSAGE("Unexpected window text"); }
int measure_text_width(const char *text) { if (!input_opens_prompt) TEST_FAIL_MESSAGE("Unexpected window text"); return strlen(text) * 6; }
static void assert_visible_picture(void);
undefined4 get_audio_subsystem_flag(void) { return 0; }
undefined4 play_numbered_voice_sample(void) { return 0; }
bool is_voice_sample_finished(void) { return 1; }
undefined4 play_music_track(void) { return 0; }
bool select_active_font(void) { return true; }
bool set_palette_bank(void) { return true; }
void FUN_00057118(void) {}
void FUN_0005b36c(void) {}
void change_game_mode(void) {}
undefined4 cursor_show_idle_tick(void) { return 0; }

static int testing_game_tick, input_opens_window;
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
    if (testing_fade) fade_clock_ms += fade_present_ms;
    if (testing_fade || intro_fade_test) {
        TEST_ASSERT_LESS_THAN_UINT(256, fade_samples);
        unsigned long long brightness = 0;
        for (unsigned row = 0; row < 200; row++)
            for (unsigned col = 0; col < 320; col++) {
                ushort pixel = hardware_framebuffer[(319 - col) * 240 + row];
                brightness += (pixel >> 11) + ((pixel >> 5) & 63) + (pixel & 31);
            }
        fade_present_times[fade_samples] = fade_clock_ms;
        fade_pixels[fade_samples] = hardware_framebuffer[319 * 240];
        fade_brightness[fade_samples++] = brightness;
    } else if (!testing_game_tick) assert_visible_picture();
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
    if (testing_entry_tick) {
        if (first_dungeon_draw_sample < 0) first_dungeon_draw_sample = fade_samples;
        for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0x07e0;
    }
    if (testing_game_tick) flush_dungeon_frame();
}
undefined4 dungeon_view_anim_tick(void) { TEST_FAIL_MESSAGE("Unexpected dungeon_view_anim_tick during picture dismissal"); return 0; }
void refresh_equipment_display_if_visible(void) { TEST_FAIL_MESSAGE("Unexpected refresh_equipment_display_if_visible during picture dismissal"); }
void handle_game_victory_sequence(void) { TEST_FAIL_MESSAGE("Unexpected handle_game_victory_sequence during picture dismissal"); }
void movement_pacing_handler(void) { TEST_FAIL_MESSAGE("Unexpected movement_pacing_handler during picture dismissal"); }
void sync_player_stats_to_hud(void) { TEST_FAIL_MESSAGE("Unexpected sync_player_stats_to_hud during picture dismissal"); }
void hud_panel_redraw_dispatch(void) { TEST_FAIL_MESSAGE("Unexpected hud_panel_redraw_dispatch during picture dismissal"); }
void enter_automap_screen(void) { TEST_FAIL_MESSAGE("Unexpected enter_automap_screen during picture dismissal"); }
void exit_automap_screen(void) { TEST_FAIL_MESSAGE("Unexpected exit_automap_screen during picture dismissal"); }
void FUN_000286cc(void) { TEST_FAIL_MESSAGE("Unexpected FUN_000286cc during picture dismissal"); }
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
    testing_fade = intro_fade_test = palette_installs = 0;
    fade_samples = 0;
    fade_clock_ms = 0;
    fade_present_ms = 16;
    g_new_game_entry_pause_pending = false;
    entry_pauses = entry_pause_sample = 0;
    testing_entry_tick = 0;
    first_dungeon_draw_sample = -1;
    testing_menu = menu_polls = menu_dismissal_sent = menu_visible_before_close = 0;
    input_opens_prompt = prompt_polls = prompt_event = prompt_visible_before_input = 0;
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
    if (DAT_00201c84 & 1) {
        DAT_00201c84 &= ~1;
        DAT_00085668_real_table[0]();
    }
    if (DAT_00201c84 & 2) DAT_00085668_real_table[1]();
    DAT_00201c84 = 0;
    /* Other HUD handlers may request their own intermediate flush. */
    flush_dirty_rect_to_display(1);
}
void uw_debug_blit_pick_buffer(void) {}
void FUN_0005bac0(void) {}
void uw_debug_draw_inv_hotspot_positions(void) {}
void dbgui_draw(void) {}
/* Screen-transition fixtures keep the real background files and palette
   data; unrelated character choices and dungeon rendering are stubbed. */
char *DAT_001005c4, *DAT_001005c8, *DAT_000fb858;
undefined1 DAT_000fb860_backing[256], DAT_000fb8f0_backing[1680];
undefined1 DAT_0023cca8_backing[32768];
int DAT_00201c98;
char s_chrbtns_00084ef8[] = "chrbtns";
char s__DATA_skills_dat_00084ee4[] = "\\DATA\\skills.dat";
char s__DATA_chrgen_dat_00084ed0[] = "\\DATA\\chrgen.dat";
char s_FONTCHAR_SYS_00084ec0[] = "FONTCHAR.SYS";
char s_FONT5X6P_SYS_00084e9c[] = "FONT5X6P.SYS";
char s__DATA_CHARGEN_BYT_00084eac[] = "\\DATA\\CHARGEN.BYT";
char s__DATA_main_byt_000857a8[] = "\\DATA\\main.byt";
static int character_screen_inputs;
char *LAB_000255b4(void) { return NULL; }
undefined4 LAB_000255d0(void) { return 0; }
uint load_gr_resource_entries(void) { return 1; }
undefined4 reset_dialogue_speech_state(void) { return 0; }
void chargen_ui_transition_hook(void) {}
void init_new_character_record(void) {}
void report_fatal_error_and_exit(void) { TEST_FAIL_MESSAGE("Screen resources must load"); }
void set_viewport_clip_rect(void) {}
bool read_buffer_from_file(char *path, void *buffer, unsigned int count)
{
    int handle = uw_file_open_read(path);
    TEST_ASSERT_GREATER_THAN_INT(0, handle);
    int bytes = uw_file_read(handle, buffer, count);
    uw_file_close(handle);
    return bytes == count;
}
bool load_pals_bank(unsigned int bank, void *buffer)
{
    FILE *file = fopen(UW_TEST_DATA_DIR "/DATA/PALS.DAT", "rb");
    TEST_ASSERT_NOT_NULL(file);
    TEST_ASSERT_EQUAL_INT(0, fseek(file, bank * 768, SEEK_SET));
    TEST_ASSERT_EQUAL_UINT(768, fread(buffer, 1, 768, file));
    fclose(file);
    byte rgb[768];
    expand_pals_bytes(rgb, buffer, 0);
    build_rgb565_palette(rgb, bank);
    return true;
}
undefined4 character_generator_loop(void)
{
    character_screen_inputs++;
    TEST_ASSERT_EQUAL_UINT(9, fade_samples);
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(320, fade_clock_ms);
    TEST_ASSERT_GREATER_THAN_UINT(0, fade_brightness[8]);
    for (unsigned step = 1; step < 8; step++)
        TEST_ASSERT_TRUE(fade_brightness[step] > fade_brightness[step - 1]);
    return 0; /* Cancel after verifying the initial screen. */
}
void unregister_game_view_interact_zones(void) {}
void FUN_0005b758(void) {}
void enter_dungeon_view_hud_init(void) {}
void refresh_player_equipment_effects(void) {}
void full_dungeon_redraw(void)
{
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    flush_dirty_rect_to_display(1);
}
void weapon_overlay_and_full_redraw(void) { flush_dirty_rect_to_display(1); }
undefined2 DAT_000868d8;
int DAT_002046f8;
void FUN_00056cc8(int state)
{
    TEST_ASSERT_EQUAL_INT(6, state);
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0x001f;
    dirty_rect_union(0, 200, 0, 320);
}
void FUN_00057504(void) { TEST_FAIL_MESSAGE("Menu regression uses the keyboard"); }
void FUN_00056d38(void) { TEST_FAIL_MESSAGE("Menu regression uses the keyboard"); }
void FUN_00056d6c(void) { TEST_FAIL_MESSAGE("Menu regression closes without taking an action"); }
void close_ui_panel_return_to_game(void) { DAT_000868d8 = 0; DAT_002046f8 = 1; }
int g_text_input_active;
undefined4 g_scroll_control_codes_enabled;
short DAT_0025070c;
undefined *DAT_00250704;
undefined s_dash_000879a4_backing[8192] = "-";
undefined s_scroll_prompt_arrow_000879a8_backing[8192] = ">";
static short prompt_panel[16], prompt_font[8];
void select_msg_scroll_mode_normal(void) {}
int message_scroll_print_wrapped(void)
{
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0x001f;
    dirty_rect_union(0, 200, 0, 320);
    return 0;
}
void set_draw_color(void) {}
void rect_fill_or_save_restore(void) {}
void uw_debug_dump_sprite_frames_once(void) {}
void uw_debug_dump_critter_sheet_once(void) {}
void uw_debug_force_item_id_once(void) {}
void tick_weapon_swing_state(void) {}
void poll_input_bindings(void)
{
    if (input_opens_prompt) {
        prompt_start_presents = presents;
        TEST_ASSERT_EQUAL_INT(0xd, scroll_text_entry_prompt("Move how many?", "1", prompt_answer, 0, 3));
    }
    if (input_opens_window) {
        int saved_presents = presents;
        testing_game_tick = 0;
        display_book_or_scroll_page(0x100);
        testing_game_tick = 1;
        TEST_ASSERT_GREATER_THAN_INT(saved_presents, presents);
        TEST_ASSERT_EQUAL_INT(0, g_force_flush);
    }
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
    fade_in(0, 0, framebuffer);
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
    fade_out(0, 0, framebuffer);
    unsigned after_fade_out = fade_samples;
    int force_after_fade_out = g_force_flush;
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    flush_dirty_rect_to_display(1);
    unsigned after_ordinary_flush = fade_samples;
    fade_in(0, 0, framebuffer);
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
    fade_out(0, 0, framebuffer);
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
    TEST_ASSERT_EQUAL_INT(0, palette_installs);
    TEST_ASSERT_EQUAL_INT(alloc_count, frees);
}
static void test_fades_hold_each_brightness_step_for_40ms(void)
{
    testing_fade = 1;
    g_force_flush = 1;
    for (unsigned i = 0; i < 64000; i++) framebuffer[i] = 0xffff;
    fade_in(0, 0, framebuffer);
    TEST_ASSERT_EQUAL_UINT(9, fade_samples);
    for (unsigned i = 1; i < 8; i++)
        TEST_ASSERT_GREATER_OR_EQUAL_UINT(40, fade_present_times[i] - fade_present_times[i - 1]);
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(320, fade_clock_ms);
    TEST_ASSERT_LESS_THAN_UINT(370, fade_clock_ms);

    fade_samples = fade_clock_ms = 0;
    fade_out(0, 0, framebuffer);
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
    fade_in(0, 0, framebuffer);
    TEST_ASSERT_GREATER_OR_EQUAL_UINT(9 * 48, fade_clock_ms);
    TEST_ASSERT_LESS_THAN_UINT(9 * 48 + 40, fade_clock_ms);
    fade_samples = fade_clock_ms = 0;
    fade_out(0, 0, framebuffer);
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
    FUN_000564f8(1);
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
