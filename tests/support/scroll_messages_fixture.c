#include "scroll_messages_fixture.h"
static short panel[12], font[6];
static char lines[128][256];
static byte draw_color, text_mode;
static char character[256];
char *DAT_00086df8 = character;
undefined *DAT_00250704;
char *DAT_000879b0;
byte *g_draw_color_index = &draw_color;
undefined1 *DAT_00084298 = &text_mode;
ushort DAT_00201b60;
int DAT_00250718;
undefined4 DAT_00250708, DAT_0025071c, DAT_00250720, g_scroll_control_codes_enabled;
undefined2 DAT_00250714;
short DAT_00250710;
char *g_selected_object;
undefined2 g_cursor_holding_state;
char *DAT_00202098;
code *DAT_002020b8;

void scroll_messages_fixture_reset(void)
{
    memset(panel, 0, sizeof panel);
    memset(font, 0, sizeof font);
    memset(lines, 0, sizeof lines);
    memset(character, 0, sizeof character);
    character[0x3d] = 1;
    DAT_00250704 = (undefined *)panel;
    DAT_000879b0 = (char *)font;
    panel[1] = 127; /* Room for text without the modal MORE prompt. */
    panel[3] = 240;
    font[3] = 1;
    DAT_00201b60 = 1;
    DAT_00250718 = DAT_00250708 = DAT_0025071c = DAT_00250720 = 0;
    DAT_00250714 = DAT_00250710 = 0;
    g_scroll_control_codes_enabled = 1;
    g_selected_object = NULL;
    g_cursor_holding_state = 0;
}
void scroll_messages_fixture_width(unsigned columns) { panel[3] = columns; }
void scroll_messages_fixture_print(unsigned address)
{
    for (size_t i = 0; i < uw_test_static_string_count; i++) {
        if (uw_test_static_strings[i].address == address) {
            message_scroll_print_wrapped((char *)uw_test_static_strings[i].actual);
            return;
        }
    }
    TEST_FAIL_MESSAGE("Unverified static string address");
}
const char *scroll_messages_fixture_line(unsigned line)
{
    TEST_ASSERT_LESS_THAN_UINT(128, line);
    return lines[line];
}

/* Exercise the actual scroll parser/wrapper and cursor state. Only font
   measurement and drawing are replaced by a one-cell character canvas. */
int measure_text_width(const char *text) { return strlen(text); }
void draw_text_string(const char *text, int x, int y)
{
    TEST_ASSERT_GREATER_OR_EQUAL_INT(0, x);
    TEST_ASSERT_GREATER_OR_EQUAL_INT(0, y);
    TEST_ASSERT_LESS_THAN_INT(128, y);
    size_t length = strlen(text), used = strlen(lines[y]);
    TEST_ASSERT_LESS_THAN_UINT(256, x + length);
    if ((unsigned)x > used) memset(lines[y] + used, ' ', x - used);
    memcpy(lines[y] + x, text, length + 1);
}
void check_mouse_over_msg_scroll_panel(int mode) {}
void decrement_cursor_hide_depth(void) { TEST_FAIL_MESSAGE("Unexpected cursor hide"); }
undefined4 cursor_show_idle_tick(void) { TEST_FAIL_MESSAGE("Unexpected cursor show"); return 0; }
void msg_scroll_panel_reset(int mode) { TEST_FAIL_MESSAGE("Unexpected scroll reset"); }
void msg_scroll_more_prompt(void) { TEST_FAIL_MESSAGE("Unexpected MORE prompt"); }
void msg_scroll_scroll_up_line(int bottom) { TEST_FAIL_MESSAGE("Unexpected scrolling"); }
void wait_for_click_to_continue(int delay, int mode) { TEST_FAIL_MESSAGE("Unexpected input wait"); }
uint read_realtime_clock_units(void) { return 0; }
void push_cursor_icon(unsigned icon) {}
void print_scroll_message_by_id(unsigned id)
{
    TEST_ASSERT_EQUAL_HEX(0x93, id);
    message_scroll_print_wrapped("You have attained experience level");
}
undefined4 recalculate_player_stats(int refill) { return 0; }
void refresh_stats_panel_if_active(void) {}
undefined4 build_object_display_name(char *buffer, ushort *object, int article, int mode)
{
    strcpy(buffer, "iron key");
    return 1;
}
