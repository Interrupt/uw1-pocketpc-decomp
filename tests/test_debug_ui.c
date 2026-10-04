/* Debug panel picking/dispatch: keyboard UP/DOWN selection, RETURN/
 * LEFT/RIGHT dispatch, and mouse-click dispatch, all through the real
 * public dbgui_* API (src/debug_ui.c) -- no decompiled game code
 * involved, so this suite links that file directly rather than going
 * through the extract_functions.py pipeline (see tests/CMakeLists.txt).
 */
#include "unity.h"
#include "src/headers/debug_ui.h"
#include <string.h>
#include <stdio.h>

#define DBGUI_KEY_RETURN 13
#define DBGUI_KEY_UP     0x40000052
#define DBGUI_KEY_DOWN   0x40000051
#define DBGUI_KEY_LEFT   0x40000050
#define DBGUI_KEY_RIGHT  0x4000004F

#define N_FIELDS 10

static int vals[N_FIELDS];

void setUp(void)
{
    int i;
    for (i = 0; i < N_FIELDS; i++) vals[i] = 0;
    dbgui_test_reset();
    dbgui_toggle(); /* panel starts hidden; open it */
}
void tearDown(void) {}

static void build_fields(void)
{
    char name[16];
    int i;
    dbgui_begin("Test Panel");
    for (i = 0; i < N_FIELDS; i++) {
        snprintf(name, sizeof(name), "f%d", i);
        dbgui_field_toggle(name, &vals[i]);
    }
    dbgui_end();
}

/* Only field `want` may have changed since `before` was snapshotted. */
static void assert_only_field_toggled(const int *before, int want)
{
    int i;
    for (i = 0; i < N_FIELDS; i++) {
        if (i == want) {
            TEST_ASSERT_NOT_EQUAL_INT_MESSAGE(before[i], vals[i], "expected field did not toggle");
        } else {
            TEST_ASSERT_EQUAL_INT_MESSAGE(before[i], vals[i], "an unrelated field changed");
        }
    }
}

/* Regression test for the reported bug: repeatedly pressing DOWN then
 * dispatching (RETURN) should walk every field in order, 0..N-1, with
 * no field skipped or the walk stalling partway through -- QA reported
 * selection appearing "stuck" and unable to reach fields past index
 * 3 or 4 in a longer list. */
static void test_down_then_return_walks_every_field_in_order(void)
{
    int i;
    build_fields();
    for (i = 0; i < N_FIELDS; i++) {
        int before[N_FIELDS];
        memcpy(before, vals, sizeof(vals));
        dbgui_feed_key(DBGUI_KEY_RETURN);
        assert_only_field_toggled(before, i);
        dbgui_feed_key(DBGUI_KEY_DOWN);
    }
}

static void test_up_then_return_walks_every_field_in_reverse(void)
{
    int i;
    build_fields();
    /* Selection starts at 0; one UP wraps to the last field first. */
    for (i = N_FIELDS - 1; i >= 0; i--) {
        int before[N_FIELDS];
        dbgui_feed_key(DBGUI_KEY_UP);
        memcpy(before, vals, sizeof(vals));
        dbgui_feed_key(DBGUI_KEY_RETURN);
        assert_only_field_toggled(before, i);
    }
}

static void test_down_wraps_from_last_field_to_first(void)
{
    int i, before[N_FIELDS];
    build_fields();
    for (i = 0; i < N_FIELDS - 1; i++) dbgui_feed_key(DBGUI_KEY_DOWN);
    /* Now on the last field (N_FIELDS-1); one more DOWN should wrap to 0. */
    dbgui_feed_key(DBGUI_KEY_DOWN);
    memcpy(before, vals, sizeof(vals));
    dbgui_feed_key(DBGUI_KEY_RETURN);
    assert_only_field_toggled(before, 0);
}

static void test_left_and_right_also_dispatch_toggle_fields(void)
{
    int before[N_FIELDS];
    build_fields();
    dbgui_feed_key(DBGUI_KEY_DOWN);
    dbgui_feed_key(DBGUI_KEY_DOWN);
    dbgui_feed_key(DBGUI_KEY_DOWN); /* selected = field 3 */
    memcpy(before, vals, sizeof(vals));
    dbgui_feed_key(DBGUI_KEY_RIGHT);
    assert_only_field_toggled(before, 3);
    memcpy(before, vals, sizeof(vals));
    dbgui_feed_key(DBGUI_KEY_LEFT);
    assert_only_field_toggled(before, 3);
}

static void test_hidden_panel_ignores_keyboard_input(void)
{
    int before[N_FIELDS];
    build_fields();
    dbgui_toggle(); /* close it */
    memcpy(before, vals, sizeof(vals));
    dbgui_feed_key(DBGUI_KEY_DOWN);
    dbgui_feed_key(DBGUI_KEY_RETURN);
    assert_only_field_toggled(before, -1); /* -1: nothing should change */
}

/* Mouse picking: click through every field's real, just-drawn row rect
 * (dbgui_test_row_y, populated by dbgui_draw() the same way a live
 * frame populates it) and confirm each click dispatches that exact
 * field, including rows past index 3/4 -- the same scenario as the
 * keyboard regression test, through the other input path. */
static void test_mouse_click_dispatches_the_clicked_row(void)
{
    int i;
    build_fields();
    dbgui_draw();
    for (i = 0; i < N_FIELDS; i++) {
        int before[N_FIELDS];
        int ry = dbgui_test_row_y(i);
        TEST_ASSERT_GREATER_OR_EQUAL_INT_MESSAGE(0, ry, "row_y not populated for this field");
        memcpy(before, vals, sizeof(vals));
        dbgui_feed_mouse_down(dbgui_test_row_x(), ry);
        assert_only_field_toggled(before, i);
    }
}

static void test_mouse_click_outside_panel_dispatches_nothing(void)
{
    int before[N_FIELDS];
    build_fields();
    dbgui_draw();
    memcpy(before, vals, sizeof(vals));
    dbgui_feed_mouse_down(dbgui_test_row_x(), dbgui_test_row_y(0) + 1000);
    assert_only_field_toggled(before, -1);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_down_then_return_walks_every_field_in_order);
    RUN_TEST(test_up_then_return_walks_every_field_in_reverse);
    RUN_TEST(test_down_wraps_from_last_field_to_first);
    RUN_TEST(test_left_and_right_also_dispatch_toggle_fields);
    RUN_TEST(test_hidden_panel_ignores_keyboard_input);
    RUN_TEST(test_mouse_click_dispatches_the_clicked_row);
    RUN_TEST(test_mouse_click_outside_panel_dispatches_nothing);
    return UNITY_END();
}
