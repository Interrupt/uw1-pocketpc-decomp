#include "unity.h"
#include "gx_pacing_test_api.h"

/* Exercise the actual pickup/release path. The OS polls move the cursor
   while the button is held, then release it over the world or backpack. */
static ushort object[4];
char *g_selected_object;
undefined2 g_cursor_holding_state;
undefined1 g_active_hud_panel;
unsigned char g_backpack_widget_to_slot_backing[0x17];
undefined4 DAT_00204844;
short DAT_0023c63c, DAT_00086968, DAT_0008696e, DAT_00204850;
undefined2 DAT_0008696a, DAT_0008696c;
short g_mouse_x, g_mouse_y;
int DAT_0020485c;
static short driver_present = 1;
short *DAT_000876c4 = &driver_present;
char DAT_002506aa, DAT_002506ab;
static int polls, redraws, drops, backpack_drops, release_poll, target_widget;
static int game_ticks, world_frames, presents, displayed_world_frames;
static uint64_t now_us;
static int movement_ticks, scheduler_steps;
static char character[256];
char *DAT_00086df8 = character;
unsigned int g_uw_frame_clock_units;
undefined4 DAT_0023bf54, DAT_002020d4;
byte DAT_0023bf58;
int DAT_000879ac;
short g_movement_mode, DAT_0023bf4c;
ushort DAT_0023c448;
short DAT_00201b64;
short DAT_00201c84;
undefined2 DAT_00201c90;
int g_force_flush;

uint read_realtime_clock_units(void) { return polls * 5; } /* 20ms per OS poll */
long Ordinal_535(void) { return polls * 20; }
unsigned int uw_frame_clock_ms(void) { return g_uw_frame_clock_units; }
void movement_tick(uint elapsed, uint bob, int mode)
{
    TEST_ASSERT_NOT_NULL(g_selected_object);
    TEST_ASSERT_GREATER_THAN_UINT(0, elapsed);
    movement_ticks++;
}
void scheduler_tick(uint elapsed)
{
    TEST_ASSERT_NOT_NULL(g_selected_object);
    scheduler_steps += elapsed;
}
int GXEndDraw(void)
{
    if (uw_present_frame_due(now_us)) {
        presents++;
        displayed_world_frames = world_frames;
    }
    return 1;
}

void FUN_00057c5c(int type) { TEST_ASSERT_EQUAL_HEX16(0x82, type); }
void FUN_00057504(short *x, short *y) { *x = g_mouse_x; *y = g_mouse_y; }
int hit_test_inventory_widget(int x, int y)
{
    TEST_ASSERT_EQUAL_INT(release_poll, polls);
    TEST_ASSERT_EQUAL_INT(100 + release_poll, x);
    TEST_ASSERT_EQUAL_INT(50 + release_poll, y);
    return target_widget;
}
int FUN_00056fe8(void) { return 1; }
void FUN_00057cac(int mode) { TEST_ASSERT_EQUAL_INT(3, mode); }
void handle_object_drop_target(int widget)
{
    TEST_ASSERT_EQUAL_INT(0x17, widget);
    TEST_ASSERT_EQUAL_INT(release_poll, polls);
    TEST_ASSERT_EQUAL_INT(0, FUN_00058738());
    drops++;
    g_selected_object = NULL;
    g_cursor_holding_state = 0;
}
void handle_backpack_slot_click(int slot)
{
    TEST_ASSERT_EQUAL_INT(4, slot);
    TEST_ASSERT_EQUAL_INT(release_poll, polls);
    backpack_drops++;
    g_selected_object = NULL;
}
void update_mouse_state(void) { if (g_selected_object) GXEndDraw(); }
void FUN_00058734(void) {}
uint FUN_00057904(int peek) { (void)peek; return 0; }
undefined4 peek_input_event(void)
{
    TEST_ASSERT_LESS_THAN_INT_MESSAGE(100, ++polls, "Pickup never noticed release");
    g_mouse_x = 100 + polls;
    g_mouse_y = 50 + polls;
    if (polls == release_poll) {
        DAT_0023c63c = 0;
        DAT_002506ab = 0;
    }
    now_us = (uint64_t)polls * 20000;
    unsigned previous_clock = g_uw_frame_clock_units;
    uw_service_game_clock(now_us);
    if (g_uw_frame_clock_units != previous_clock) game_ticks++;
    uw_service_pending_present(now_us);
    update_mouse_state();
    int buttons = FUN_00058738();
    return buttons ? buttons : -1;
}
void dispatch_sticky_mode_handlers(void)
{
    TEST_ASSERT_LESS_THAN_INT(release_poll, polls);
    TEST_ASSERT_EQUAL_PTR(object, g_selected_object);
    TEST_ASSERT_EQUAL_INT(0, drops + backpack_drops);
    /* draw_dungeon_view calls this while the pickup's release wait runs. */
    FUN_00058438(0);
    movement_pacing_handler();
    redraws++;
    if (DAT_00201c84 & 2) {
        TEST_ASSERT_GREATER_THAN_INT(0, game_ticks);
        world_frames++;
        DAT_00201c84 &= ~2;
    }
}

void setUp(void)
{
    memset(object, 0, sizeof(object));
    object[0] = 0x82;
    g_selected_object = NULL;
    g_cursor_holding_state = 1;
    g_active_hud_panel = 0;
    DAT_00204844 = 1;
    DAT_0023c63c = DAT_002506aa = DAT_002506ab = 0;
    DAT_00086968 = DAT_0008696e = -1;
    DAT_00204850 = DAT_0020485c = 0;
    g_mouse_x = 100; g_mouse_y = 50;
    polls = redraws = drops = backpack_drops = 0;
    release_poll = 5;
    target_widget = 0x17;
    g_backpack_widget_to_slot_backing[4] = 4;
    game_ticks = world_frames = presents = displayed_world_frames = 0;
    now_us = 0;
    uw_reset_frame_pacing();
    movement_ticks = scheduler_steps = 0;
    memset(character, 0, sizeof(character));
    g_uw_frame_clock_units = DAT_0023bf54 = DAT_002020d4 = DAT_0023bf58 = 0;
    DAT_000879ac = 1;
    DAT_00201b64 = DAT_00201c90 = DAT_00201c84 = g_force_flush = 0;
}
void tearDown(void) {}

static void test_right_pickup_stays_held_while_mouse_moves_and_world_redraws(void)
{
    DAT_002506ab = 1;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll, polls);
    TEST_ASSERT_EQUAL_INT(release_poll - 1, redraws);
    TEST_ASSERT_EQUAL_INT(1, drops);
    TEST_ASSERT_NULL(g_selected_object);
}
static void test_right_pickup_can_drag_to_backpack_before_release(void)
{
    DAT_002506ab = 1;
    target_widget = 4;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll - 1, redraws);
    TEST_ASSERT_EQUAL_INT(1, backpack_drops);
    TEST_ASSERT_EQUAL_INT(0, drops);
    TEST_ASSERT_EQUAL_INT(0, g_cursor_holding_state);
}
static void test_left_pickup_still_waits_for_release(void)
{
    DAT_0023c63c = 1;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll - 1, redraws);
    TEST_ASSERT_EQUAL_INT(1, drops);
}
static void test_pickup_after_release_keeps_object_on_cursor(void)
{
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_PTR(object, g_selected_object);
    TEST_ASSERT_EQUAL_INT(0, polls);
    TEST_ASSERT_EQUAL_INT(0, drops + backpack_drops);
}
static void test_drag_ticks_and_presents_the_world_before_release(void)
{
    DAT_002506ab = 1;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll, game_ticks);
    TEST_ASSERT_EQUAL_INT(release_poll - 1, world_frames);
    TEST_ASSERT_EQUAL_INT(world_frames, movement_ticks);
    TEST_ASSERT_EQUAL_INT(world_frames, displayed_world_frames);
    TEST_ASSERT_LESS_OR_EQUAL_INT(world_frames + 1, presents);
    TEST_ASSERT_EQUAL_INT(0, g_force_flush);
}
static void test_long_drag_continues_scheduled_world_animation(void)
{
    release_poll = 20;
    DAT_002506ab = 1;
    attach_picked_up_object_to_cursor(object);
    TEST_ASSERT_EQUAL_INT(release_poll - 1, movement_ticks);
    TEST_ASSERT_GREATER_THAN_INT(0, scheduler_steps);
    TEST_ASSERT_EQUAL_INT(movement_ticks, world_frames);
    TEST_ASSERT_EQUAL_INT(world_frames, displayed_world_frames);
}
static void test_release_wait_in_a_modal_view_does_not_tick_the_world(void)
{
    DAT_002506ab = 1;
    DAT_00204850 = 2;
    g_selected_object = (char *)object;
    DAT_00201c90 = 1;
    wait_for_click_release(0);
    TEST_ASSERT_EQUAL_INT(0, game_ticks);
    TEST_ASSERT_EQUAL_INT(0, world_frames);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_right_pickup_stays_held_while_mouse_moves_and_world_redraws);
    RUN_TEST(test_right_pickup_can_drag_to_backpack_before_release);
    RUN_TEST(test_left_pickup_still_waits_for_release);
    RUN_TEST(test_pickup_after_release_keeps_object_on_cursor);
    RUN_TEST(test_drag_ticks_and_presents_the_world_before_release);
    RUN_TEST(test_long_drag_continues_scheduled_world_animation);
    RUN_TEST(test_release_wait_in_a_modal_view_does_not_tick_the_world);
    return UNITY_END();
}
