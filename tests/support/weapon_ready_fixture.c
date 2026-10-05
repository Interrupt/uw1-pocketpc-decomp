#include "weapon_ready_fixture.h"

static char character[256], attributes[256];
static ushort player[16];
char *DAT_00086df8, *DAT_0023be74;
ushort *g_player_object;
short DAT_00201b68;
undefined2 DAT_00201b60, g_cursor_holding_state, g_cursor_mode, DAT_000868d8;
static short click_position[2];
short *DAT_00085a6c = click_position;
undefined1 DAT_0023c118_arr[9], DAT_0023c130, g_active_hud_panel;
undefined1 DAT_0023c11a, DAT_0023c11b, DAT_0023c12a;
undefined1 DAT_0023c11c_arr[2], DAT_0023c12c_arr[2];
ushort DAT_0023c1d8, DAT_0023c1dc, DAT_0023c1e0;
char DAT_000870d8, DAT_000870dc;
undefined1 DAT_000870e0;
short DAT_000870e4, DAT_0023c1ec;
undefined2 DAT_000870e8;
int DAT_0023c260, g_blit_transparent_mode;
undefined1 DAT_00204880_backing[128];
char *g_weapon_swing_current_frame;
void *g_weapon_swing_raw_frames[UW_WEAPON_SWING_FRAME_COUNT];
byte weapon_frame_x[UW_WEAPON_SWING_FRAME_COUNT];
byte weapon_frame_y[UW_WEAPON_SWING_FRAME_COUNT];
static char raw_frame[3] = {0, 1, 1}, decoded_pixel;
int weapon_draws;
static byte music_track;

void weapon_ready_fixture_reset(void)
{
    /* Preserve the production initializer rather than inventing a fixture
       default: this is the regression that differs from the ARM binary. */
    static int initial_overlay = -1;
    if (initial_overlay == -1) initial_overlay = g_weapon_overlay_enabled;
    g_weapon_overlay_enabled = initial_overlay;
    uw_test_create_character(character, attributes, player);
    memset(DAT_0023c118_arr, 0, sizeof DAT_0023c118_arr);
    DAT_0023c120 = DAT_0023c130 = 6;
    DAT_000870d8 = DAT_000870dc = 3; /* loaded fist sprites */
    DAT_000870e4 = -1;
    DAT_000870e8 = 1;
    DAT_0023c260 = DAT_0023c1ec = 0;
    DAT_0023c1d8 = DAT_0023c1dc = DAT_0023c1e0 = 0;
    g_cursor_mode = g_cursor_holding_state = DAT_000868d8 = 0;
    DAT_00201b60 = 1;
    music_track = 0;
    weapon_draws = 0;
    for (int frame = 0; frame < UW_WEAPON_SWING_FRAME_COUNT; frame++)
        g_weapon_swing_raw_frames[frame] = raw_frame;
}

void weapon_ready_fixture_animate(void)
{
    for (int tick = 0; tick < 5; tick++) advance_action_animation_frame();
    weapon_swing_draw_tick();
}

/* Keep input, music, and bitmap services outside the tested mode and
   animation logic. The real draw function must reach its bitmap blit. */
void mode_icon_highlight_on(int mode) {}
void mode_icon_highlight_off(int mode) {}
void push_cursor_icon(int icon) {}
void pop_cursor_icon(int depth) {}
void wait_for_click_release(int mode) { TEST_ASSERT_EQUAL_INT(1, mode); }
void handle_pause_menu_region_click(int x, int y) { TEST_FAIL_MESSAGE("Unexpected pause click"); }
void run_pause_menu_modal_loop(int mode) { TEST_FAIL_MESSAGE("Unexpected pause menu"); }
byte get_current_music_track(void) { return music_track; }
void set_pending_music_track(uint track) { music_track = track; }
void pick_random_pending_music_track(void) { music_track = 0; }
void cancel_weapon_swing(void) {}
void set_pending_update_flags(int flags) {}
byte load_weapon_swing_sprites(void) { TEST_FAIL_MESSAGE("Unexpected sprite reload"); return 0; }
void randomize_weapon_jump_shake(int shake) {}
char *decode_gr_entry_bitmap(void *frame)
{
    TEST_ASSERT_EQUAL_PTR(raw_frame, frame);
    return &decoded_pixel;
}
void bitmap_blit_to_framebuffer(int x, int y, void *bitmap, int height,
                              int width, int a, int b, int transparent)
{
    TEST_ASSERT_EQUAL_PTR(&decoded_pixel, bitmap);
    weapon_draws++;
}
void draw_hud_icon_sprite(int sprite, int x, int y) {}
