#include "game_fixture.h"
#include "illustrations_fixture.h"

/* Local service declarations; game function bodies link these mocks. */
void describe_picked_terrain(int mode, int texture);
void print_scroll_message_by_id(void);
char *get_message_string(void);
void msg_scroll_panel_reset(void);
undefined1 *format_object_display_name(void);
int message_scroll_print_wrapped(void);
undefined4 open_file_for_read(void);
undefined4 read_file_handle(void);
undefined4 open_existing_file_rw_alt(const char *path);
undefined4 seek_file_handle(int handle, int offset, int origin);
undefined4 write_file_handle(int handle, const void *source, int count);
long CloseHandle(int handle);
void display_book_or_scroll_page(uint page);

short DAT_00201b68;

undefined2 DAT_0023add0_backing[64];

undefined1 DAT_0023c698_backing[1024];

undefined1 DAT_00085460_backing[11] = "\\CSXXX.N00";

undefined1 DAT_0023cca8_backing[1024];

char s__DATA_grave_dat_00085cf8[] = "\\DATA\\grave.dat";

undefined s_scroll_newline_0008522c_backing[8192] = "\n";

byte level_one[0x7c08], script[16];

int descriptions, opens, writes, closes, displays, position;

int fail_open, fail_write;

uint displayed_page;

char opened_path[260];

void describe_picked_terrain(int mode, int texture)
{ TEST_ASSERT_EQUAL_INT(2, mode); TEST_ASSERT_EQUAL_INT(24, texture); descriptions++; }

void print_scroll_message_by_id(void) { TEST_FAIL_MESSAGE("Unexpected scroll message"); }

char *get_message_string(void) { TEST_FAIL_MESSAGE("Unexpected inscription text"); return NULL; }

void msg_scroll_panel_reset(void) { TEST_FAIL_MESSAGE("Unexpected inscription reset"); }

undefined1 *format_object_display_name(void) { TEST_FAIL_MESSAGE("Unexpected inscription formatting"); return NULL; }

int message_scroll_print_wrapped(void) { TEST_FAIL_MESSAGE("Unexpected inscription printing"); return 0; }

undefined4 open_file_for_read(void) { TEST_FAIL_MESSAGE("Unexpected grave file"); return -1; }

undefined4 read_file_handle(void) { TEST_FAIL_MESSAGE("Unexpected grave file read"); return 0; }

undefined4 open_existing_file_rw_alt(const char *path)
{
    opens++;
    TEST_ASSERT_LESS_THAN_UINT(sizeof opened_path, strlen(path));
    strcpy(opened_path, path);
    if (fail_open || strcmp(path, "\\CUTS\\CS400.N00")) return -1;
    FILE *file = fopen(UW_TEST_DATA_DIR "/CUTS/CS400.N00", "rb");
    TEST_ASSERT_NOT_NULL(file);
    TEST_ASSERT_EQUAL_UINT(sizeof script, fread(script, 1, sizeof script, file));
    TEST_ASSERT_EQUAL_INT(0, fclose(file));
    position = 0;
    return 1;
}

undefined4 seek_file_handle(int handle, int offset, int origin)
{
    if (handle != 1) return -1;
    position = origin == 0 ? offset : position + offset;
    return position;
}

undefined4 write_file_handle(int handle, const void *source, int count)
{
    if (handle != 1 || fail_write) return 0;
    TEST_ASSERT_EQUAL_INT(2, count);
    TEST_ASSERT_TRUE(position >= 0 && position + count <= sizeof script);
    memcpy(script + position, source, count);
    position += count;
    writes++;
    return count;
}

long CloseHandle(int handle) { if (handle != 1) return 0; closes++; return 1; }

void display_book_or_scroll_page(uint page) { displays++; displayed_page = page; }

ushort *window_object(void)
{
    uw_test_load_map(level_one, sizeof level_one, 1);
    ushort *tile = (ushort *)(level_one + (35 + 32 * 64) * 4);
    unsigned slot = tile[1] >> 6;
    TEST_ASSERT_EQUAL_UINT(881, slot);
    ushort *object = (ushort *)(level_one + 0x5b00 + (slot - 256) * 8);
    TEST_ASSERT_EQUAL_HEX16(0x16e, *object & 0x1ff);
    TEST_ASSERT_EQUAL_UINT(23, object[3] & 0x3f);
    return object;
}

void illustrations_fixture_reset(void)
{
    descriptions = opens = writes = closes = displays = position = 0;
    fail_open = fail_write = 0;
    displayed_page = 0;
    memset(opened_path, 0, sizeof opened_path);
    memset(DAT_0023add0_backing, 0, sizeof DAT_0023add0_backing);
    strcpy((char *)DAT_0023c698_backing, "\\CUTS");
    DAT_00201b68 = 1;
    DAT_0023add0_backing[23] = 9;
}

void illustrations_fixture_dispose(void) {}
