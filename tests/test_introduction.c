#include "unity.h"
#include "uw.h"
#include "src/headers/file_io.h"

/* Use the actual introduction bytecode and STRINGS.PAK decoder. */
undefined1 DAT_0023c698_backing[32768], DAT_00101968_backing[8192];
undefined4 DAT_0024bf98;
unsigned short *DAT_0024cfb8;
char *DAT_0024cfa8;
short DAT_0024cfc0, DAT_0024cfb4;
undefined2 DAT_0024cfac, DAT_000878bc;
undefined1 DAT_0024af98_backing[4096], DAT_0024bfa0_backing[1052672];
undefined2 DAT_0024cfbc_backing[8192];
char *g_bfa2_real_ptrs[263168];
undefined2 DAT_000890b0_backing[32768];
static char font_header[12], font_glyphs[0x1080];
char *DAT_000879b0 = font_header, *DAT_000890a4 = font_glyphs;
char *g_font_glyph_data_base;
ushort g_font_line_height;
short g_font_row_stride, DAT_000a85b8;
undefined2 DAT_000a85b0;
static ushort tree_count;
static ushort script[2048];
static size_t script_words;
static struct babl_render_state state;
static int voice_enabled;

undefined4 read_file_handle(int handle, void *buf, unsigned int size)
{ return uw_file_read(handle, buf, size); }
undefined4 seek_file_handle(int handle, int offset, int method)
{ return uw_file_seek(handle, offset, method); }
unsigned int Ordinal_1068(const char *s) { return (unsigned int)strlen(s); }
undefined4 audio_always_true_stub(void) { return voice_enabled; }

void setUp(void)
{
    setenv("UW_DATA_DIR", UW_TEST_DATA_DIR, 1);
    DAT_0024bf98 = uw_file_open_read("\\DATA\\STRINGS.PAK");
    TEST_ASSERT_GREATER_THAN_INT(0, DAT_0024bf98);
    TEST_ASSERT_EQUAL_INT(2, uw_file_read(DAT_0024bf98, &tree_count, 2));
    DAT_0024cfb8 = &tree_count;
    DAT_0024cfa8 = malloc(tree_count * 4);
    TEST_ASSERT_NOT_NULL(DAT_0024cfa8);
    TEST_ASSERT_EQUAL_INT(tree_count * 4, uw_file_read(DAT_0024bf98, DAT_0024cfa8, tree_count * 4));
    DAT_0024cfc0 = DAT_0024cfb4 = 0;
    DAT_0024cfac = 0xc00; /* Main menu's Introduction is page 0. */
    FILE *file = fopen(UW_TEST_DATA_DIR "/CUTS/CS000.N00", "rb");
    TEST_ASSERT_NOT_NULL(file);
    script_words = fread(script, sizeof(*script), 2048, file);
    fclose(file);
    memset(&state, 0, sizeof state);
    state.bytes[0x45] = 1;
    file = fopen(UW_TEST_DATA_DIR "/DATA/FONTBIG.SYS", "rb");
    TEST_ASSERT_NOT_NULL(file);
    TEST_ASSERT_EQUAL_UINT(12, fread(font_header, 1, 12, file));
    TEST_ASSERT_GREATER_THAN_UINT(0, fread(font_glyphs, 1, sizeof font_glyphs, file));
    fclose(file);
    load_font_metrics();
    voice_enabled = 0;
    DAT_0023c698_backing[0] = 0;
}
void tearDown(void)
{
    uw_file_close(DAT_0024bf98);
    free(DAT_0024cfa8);
}
static void test_introduction_first_say_keeps_host_pointers(void)
{
    TEST_ASSERT_GREATER_THAN_UINT(5, script_words);
    TEST_ASSERT_EQUAL_UINT16(13, script[1]);
    TEST_ASSERT_EQUAL_UINT16(0, script[3]);
    char *message = get_message_string(script[3]);
    TEST_ASSERT_NOT_NULL(message);
    TEST_ASSERT_GREATER_THAN_UINT(0, strlen(message));
    TEST_ASSERT_EQUAL_INT(3, babl_render_op_say((intptr_t)(script + 2), (intptr_t)state.bytes));
    ushort lines;
    memcpy(&lines, state.bytes + 0x35, 2);
    TEST_ASSERT_GREATER_THAN_INT(0, lines);
    TEST_ASSERT_LESS_OR_EQUAL_INT(6, lines);
    for (unsigned i = 0; i < lines; i++) {
        TEST_ASSERT_NOT_NULL(state.lines[i]);
        TEST_ASSERT_TRUE(state.lines[i] >= (char *)DAT_0024af98_backing &&
                         state.lines[i] < (char *)DAT_0024af98_backing + sizeof DAT_0024af98_backing);
        TEST_ASSERT_GREATER_THAN_INT(0, measure_text_width(state.lines[i]));
    }
    TEST_ASSERT_EQUAL_UINT8(script[2] & 0xff, state.bytes[0x34]);
    TEST_ASSERT_EQUAL_UINT8(1, state.bytes[0x45]);
}
static void test_all_introduction_say_directives_wrap_real_strings(void)
{
    static const unsigned consumed[16] = {2,0,2,1,2,1,1,1,2,1,1,1,1,3,2,0};
    unsigned sayings = 0;
    for (size_t pos = 0; pos + 1 < script_words;) {
        unsigned opcode = script[pos + 1];
        TEST_ASSERT_LESS_THAN_UINT(16, opcode);
        if (opcode == 6) break;
        TEST_ASSERT_LESS_OR_EQUAL_UINT(script_words, pos + 2 + consumed[opcode]);
        if (opcode == 13) {
            memset(&state, 0, sizeof state);
            state.bytes[0x45] = 0x21;
            voice_enabled = 1;
            TEST_ASSERT_EQUAL_INT(3, babl_render_op_say((intptr_t)(script + pos + 2), (intptr_t)state.bytes));
            ushort count, voice;
            memcpy(&count, state.bytes + 0x35, 2);
            memcpy(&voice, state.bytes + 0x3f, 2);
            TEST_ASSERT_GREATER_THAN_INT(0, count);
            TEST_ASSERT_LESS_OR_EQUAL_INT(6, count);
            for (unsigned i = 0; i < count; i++) {
                TEST_ASSERT_NOT_NULL(state.lines[i]);
                TEST_ASSERT_GREATER_THAN_INT(0, measure_text_width(state.lines[i]));
                TEST_ASSERT_LESS_OR_EQUAL_INT(320, measure_text_width(state.lines[i]));
            }
            TEST_ASSERT_EQUAL_UINT16(script[pos + 4] == 999 ? 0xffff : script[pos + 4], voice);
            TEST_ASSERT_EQUAL_UINT8(0x21, state.bytes[0x45]);
            sayings++;
        }
        pos += 2 + consumed[opcode];
    }
    TEST_ASSERT_GREATER_THAN_UINT(20, sayings);
}
static void test_muted_say_keeps_subtitles_and_clears_voice_flag(void)
{
    state.bytes[0x45] = 0x21;
    voice_enabled = 0;
    babl_render_op_say((intptr_t)(script + 2), (intptr_t)state.bytes);
    ushort voice;
    memcpy(&voice, state.bytes + 0x3f, 2);
    TEST_ASSERT_EQUAL_HEX16(0xffff, voice);
    TEST_ASSERT_EQUAL_UINT8(1, state.bytes[0x45]);
    TEST_ASSERT_NOT_NULL(state.lines[0]);
}
static void test_say_voice_sentinel_keeps_subtitles(void)
{
    ushort say[3] = {240, 0, 999};
    state.bytes[0x45] = 0x61; /* Voice already enabled. */
    babl_render_op_say((intptr_t)say, (intptr_t)state.bytes);
    ushort voice;
    memcpy(&voice, state.bytes + 0x3f, 2);
    TEST_ASSERT_EQUAL_HEX16(0xffff, voice);
    TEST_ASSERT_EQUAL_UINT8(0x61, state.bytes[0x45]);
    TEST_ASSERT_NOT_NULL(state.lines[0]);
}
static void test_subtitle_paragraph_limit_preserves_state_fields(void)
{
    char paragraphs[] = "one\ntwo\nthree\nfour\nfive\nsix\nseven";
    DAT_0024cfc0 = 1;
    memset(DAT_0024bfa0_backing, 0, 2);
    g_bfa2_real_ptrs[0] = paragraphs;
    ushort say[3] = {240, 0, 999};
    state.bytes[0x45] = 1;
    babl_render_op_say((intptr_t)say, (intptr_t)state.bytes);
    ushort count;
    memcpy(&count, state.bytes + 0x35, 2);
    TEST_ASSERT_EQUAL_UINT16(6, count);
    TEST_ASSERT_EQUAL_STRING("one", state.lines[0]);
    TEST_ASSERT_EQUAL_STRING("six", state.lines[5]);
    TEST_ASSERT_EQUAL_UINT8(240, state.bytes[0x34]);
    TEST_ASSERT_EQUAL_UINT8(1, state.bytes[0x45]);
}
static void test_later_intro_sections_keep_cuts_directory_and_load_real_lpf(void)
{
    static const unsigned consumed[16] = {2,0,2,1,2,1,1,1,2,1,1,1,1,3,2,0};
    strcpy(state.bytes, "\\CS000.n00");
    unsigned switches = 0;
    for (size_t pos = 0; pos + 1 < script_words;) {
        unsigned opcode = script[pos + 1];
        TEST_ASSERT_LESS_THAN_UINT(16, opcode);
        if (opcode == 6) break;
        TEST_ASSERT_LESS_OR_EQUAL_UINT(script_words, pos + 2 + consumed[opcode]);
        if (opcode == 8) {
            TEST_ASSERT_EQUAL_INT(2, babl_render_op_show_code(script + pos + 2, (intptr_t)state.bytes));
            TEST_ASSERT_EQUAL_MEMORY("\\CUTS\\CS000.n", DAT_00101968_backing, 12);
            if (switches == 0) TEST_ASSERT_EQUAL_STRING("\\CUTS\\CS000.n02", DAT_00101968_backing);
            int handle = uw_file_open_read((char *)DAT_00101968_backing);
            TEST_ASSERT_GREATER_THAN_INT_MESSAGE(0, handle, (char *)DAT_00101968_backing);
            char magic[4];
            int bytes = uw_file_read(handle, magic, sizeof magic);
            uw_file_close(handle);
            TEST_ASSERT_EQUAL_INT(4, bytes);
            TEST_ASSERT_EQUAL_MEMORY("LPF ", magic, 4);
            switches++;
        }
        pos += 2 + consumed[opcode];
    }
    TEST_ASSERT_EQUAL_UINT(34, switches);
}
static void test_section_switch_preserves_configured_directory(void)
{
    strcpy((char *)DAT_0023c698_backing, "\\custom\\cuts");
    strcpy(state.bytes, "\\CS000.n00");
    ushort section[2] = {0, 2};
    TEST_ASSERT_EQUAL_INT(2, babl_render_op_show_code(section, (intptr_t)state.bytes));
    TEST_ASSERT_EQUAL_STRING("\\custom\\cuts\\CS000.n02", DAT_00101968_backing);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_introduction_first_say_keeps_host_pointers);
    RUN_TEST(test_all_introduction_say_directives_wrap_real_strings);
    RUN_TEST(test_muted_say_keeps_subtitles_and_clears_voice_flag);
    RUN_TEST(test_say_voice_sentinel_keeps_subtitles);
    RUN_TEST(test_subtitle_paragraph_limit_preserves_state_fields);
    RUN_TEST(test_later_intro_sections_keep_cuts_directory_and_load_real_lpf);
    RUN_TEST(test_section_switch_preserves_configured_directory);
    return UNITY_END();
}
