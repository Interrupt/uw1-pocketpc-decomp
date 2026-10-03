#include "unity.h"
#include "src/headers/game.h"
#include "src/headers/level.h"
#include <unistd.h>
#include <sys/stat.h>

/* Real game data and file I/O; only unrelated game/UI services are stubbed.
 * Writes go to a private temporary directory, never the supplied saves. */
static unsigned char arena[0x7c08], pristine_level[0x7c08];
static char character[256], saved_character[256];
static short mode_state[16];
char *DAT_002029cc = (char *)arena;
char *DAT_002046a4, *DAT_002046a8, *DAT_002046bc, *DAT_0020469c;
char *DAT_002046c4;
byte *DAT_002046c0, *DAT_002046c8;
undefined4 DAT_002029d0;
short DAT_00202080;
short *DAT_00085a6c = mode_state;
undefined2 DAT_00201b60, DAT_000868d8;
short DAT_00201b64;
undefined1 DAT_0023cca8_backing[32768];
undefined1 DAT_000857a0_backing[32768];
char s__DATA_lev_ark_00085734[] = "\\DATA\\lev.ark";
char s__SAVE0_lev_ark_000842fc[] = "\\SAVE0\\lev.ark";

static bool accept_character, archive_ok;
bool g_new_game_entry_pause_pending;
static char workspace[] = "/tmp/uw-new-game-XXXXXX";
static char data_link[512], save_path[512], archive_path[512];
undefined DAT_000b78b8_backing[8192];
static int scheduler_result;
static int character_calls, saves, seeds, opens, closes;
static int restores, textures, automaps, cache_resets, attacker_resets;
static int spawn_calls, special_state_calls, cursor_resets;
static bool archive_open;

undefined4 character_generator_start(void)
{
    character_calls++;
    if (!accept_character) return 0;
    memset(character, 0, sizeof(character));
    strcpy(character, "Test Avatar");
    character[0x21] = 12; /* starting skill */
    character[100] = 2 << 5; /* class */
    return 1;
}

undefined4 ensure_save_directory_exists(const char *path)
{
    TEST_ASSERT_EQUAL_STRING("\\SAVE0", path);
    TEST_ASSERT_EQUAL_STRING("Test Avatar", character);
    return 1;
}

bool write_player_save_record(const char *path)
{
    if (saves == 0) TEST_ASSERT_EQUAL_STRING("\\SAVE0", path);
    else TEST_ASSERT_NULL(path); /* load_level's snapshot */
    memcpy(saved_character, character, sizeof(character));
    saves++;
    return true;
}

/* The converter's static-buffer boundary is reproduced here; the actual
 * ordinal path adapters and file-copy implementation are compiled below. */
undefined *FUN_0002295c(char *path)
{
    static char converted[520];
    Ordinal_196(0, 2, path, -1, converted, 255);
    return (undefined *)converted;
}
undefined4 seed_conversation_globals_for_new_game(void)
{
    seeds++;
    return 0;
}

/* Keep archive lifecycle isolated from save-slot bookkeeping. The game’s
 * read_archive_entry below consumes this same native 16-byte handle layout. */
bool open_level_archive(byte *handle, const char *path)
{
    opens++;
    if (!archive_ok) TEST_ASSERT_EQUAL_INT(0, unlink(archive_path));
    int file = uw_file_open_read(path);
    if (file < 0) return false;
    ushort entries;
    TEST_ASSERT_EQUAL_INT(2, uw_file_read(file, &entries, 2));
    TEST_ASSERT_LESS_OR_EQUAL_UINT(sizeof(DAT_000b78b8_backing), entries * 4);
    TEST_ASSERT_EQUAL_INT(entries * 4,
                         uw_file_read(file, DAT_000b78b8_backing, entries * 4));
    memset(handle, 0, 16);
    memcpy(handle, &file, 4);
    memcpy(handle + 8, &entries, 2);
    archive_open = true;
    return true;
}
undefined4 seek_file_handle(int handle, int offset, int method)
{ return uw_file_seek(handle, offset, method); }
undefined4 read_file_handle(int handle, void *destination, uint size)
{ return uw_file_read(handle, destination, size); }

undefined4 scheduler_load(byte *handle, int level)
{
    TEST_ASSERT_TRUE(archive_open);
    TEST_ASSERT_EQUAL_INT(1, level);
    TEST_ASSERT_EQUAL_HEX16(0x7577, *(ushort *)(arena + 0x7c06));
    return scheduler_result;
}

undefined4 load_player_save_record(const char *path)
{
    TEST_ASSERT_NULL(path);
    TEST_ASSERT_TRUE(archive_open);
    memcpy(character, saved_character, sizeof(character));
    restores++;
    return 1;
}

bool load_level_texture_ids(byte *handle, int level)
{
    TEST_ASSERT_TRUE(archive_open);
    TEST_ASSERT_EQUAL_INT(1, level);
    textures++;
    return true;
}

void clear_automap_reveal_buffer(void) { automaps++; }
void reset_npc_path_cache(void) { cache_resets++; }
void clear_last_attacker_record(void) { attacker_resets++; }
undefined4 load_automap_reveal_from_archive(byte *handle, int level)
{
    TEST_ASSERT_TRUE(archive_open);
    TEST_ASSERT_EQUAL_INT(1, level);
    TEST_ASSERT_EQUAL_INT(1, automaps);
    automaps++;
    return 1;
}
byte close_level_archive(byte *handle)
{
    TEST_ASSERT_TRUE(archive_open);
    int file;
    memcpy(&file, handle, 4);
    TEST_ASSERT_EQUAL_INT(1, uw_file_close(file));
    archive_open = false;
    closes++;
    return 1;
}

void set_player_tile_position(uint x, uint y, int flag)
{
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_INT(1, textures);
    TEST_ASSERT_EQUAL_UINT32(32, x);
    TEST_ASSERT_EQUAL_UINT32(2, y);
    TEST_ASSERT_EQUAL_INT(1, flag);
    DAT_00202080 = y * 64 + x;
    spawn_calls++;
}
void debug_print_player_position(const char *label)
{
    TEST_ASSERT_EQUAL_STRING("chargen-spawn", label);
}
void save_or_restore_level_special_state(int restore, int slot)
{
    TEST_ASSERT_EQUAL_INT(1, spawn_calls);
    TEST_ASSERT_EQUAL_INT(1, restore);
    TEST_ASSERT_EQUAL_INT(0, slot);
    special_state_calls++;
}

/* Display/audio boundaries are stubbed; set_game_mode itself is real. */
void FUN_00057cac(int state) { TEST_ASSERT_EQUAL_INT(3, state); }
undefined4 cursor_show_idle_tick(void) { return 0; }
void FUN_00049924(int sound) { TEST_ASSERT_EQUAL_INT(0x7ffe, sound); }
void reset_cursor_confine_rect(void)
{
    TEST_ASSERT_EQUAL_INT(1, special_state_calls);
    cursor_resets++;
}
void report_fatal_error_and_exit(void)
{
    TEST_FAIL_MESSAGE("New game unexpectedly reached a fatal-error path");
}
void uw_debug_dump_tmap(int level, const unsigned char *data)
{
    TEST_ASSERT_EQUAL_INT(1, level);
    TEST_ASSERT_EQUAL_PTR(arena, data);
}
void *tilemap_lookup(void) { return NULL; }
void *resolve_object_link(void) { return NULL; }

void setUp(void)
{
    memset(arena, 0xa5, sizeof(arena));
    memset(character, 0, sizeof(character));
    memset(saved_character, 0, sizeof(saved_character));
    memset(mode_state, 0, sizeof(mode_state));
    DAT_0023cca8_backing[0] = 0;
    strcpy((char *)DAT_000857a0_backing, "\\SAVE0");
    int source = uw_file_open_read("\\DATA\\lev.ark");
    TEST_ASSERT_GREATER_OR_EQUAL_INT(0, source);
    uint offset;
    TEST_ASSERT_EQUAL_INT(2, uw_file_seek(source, 2, 0));
    TEST_ASSERT_EQUAL_INT(4, uw_file_read(source, &offset, 4));
    TEST_ASSERT_EQUAL_INT(offset, uw_file_seek(source, offset, 0));
    TEST_ASSERT_EQUAL_INT(sizeof(pristine_level),
                         uw_file_read(source, pristine_level, sizeof(pristine_level)));
    TEST_ASSERT_EQUAL_INT(1, uw_file_close(source));
    DAT_002046a4 = (char *)arena + 0x7300;
    DAT_002046bc = (char *)arena + 0x74fc;
    DAT_002046c0 = arena + 0x7afa;
    DAT_002046c4 = (char *)arena + 0x5b00;
    DAT_002046a8 = DAT_0020469c = NULL;
    DAT_002046c8 = NULL;
    DAT_002029d0 = 99;
    DAT_00202080 = 42;
    DAT_00201b60 = 0;
    DAT_00201b64 = -1;
    DAT_000868d8 = 99;
    accept_character = archive_ok = true;
    scheduler_result = 1;
    character_calls = saves = seeds = opens = closes = 0;
    restores = textures = automaps = cache_resets = attacker_resets = 0;
    spawn_calls = special_state_calls = cursor_resets = 0;
    archive_open = false;
}
void tearDown(void)
{
    TEST_ASSERT_FALSE(archive_open);
    if (access(data_link, F_OK) != 0)
        TEST_ASSERT_EQUAL_INT(0, symlink(UW_TEST_DATA_DIR "/DATA", data_link));
    unlink(archive_path);
}

static void test_stub_character_loads_level_one_and_enters_gameplay(void)
{
    TEST_ASSERT_TRUE(prepare_new_game());
    TEST_ASSERT_TRUE(g_new_game_entry_pause_pending);
    begin_gameplay();

    TEST_ASSERT_EQUAL_STRING("Test Avatar", character);
    TEST_ASSERT_EQUAL_UINT8(12, character[0x21]);
    TEST_ASSERT_EQUAL_UINT8(2, (byte)character[100] >> 5);
    TEST_ASSERT_EQUAL_INT(1, character_calls);
    TEST_ASSERT_EQUAL_INT(2, saves);
    TEST_ASSERT_EQUAL_INT(1, seeds);
    TEST_ASSERT_EQUAL_INT(1, opens);
    TEST_ASSERT_EQUAL_HEX16(0x7577, *(ushort *)(arena + 0x7c06));
    TEST_ASSERT_EQUAL_INT(1, restores);
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_MEMORY(pristine_level, arena, sizeof(arena));
    TEST_ASSERT_EQUAL_PTR(arena + 0x7300 + *(ushort *)(pristine_level + 0x7c02) * 2, DAT_002046a8);
    TEST_ASSERT_EQUAL_PTR(arena + 0x74fc + *(ushort *)(pristine_level + 0x7c04) * 2, DAT_0020469c);
    TEST_ASSERT_EQUAL_PTR(arena + 0x7afa + *(ushort *)(pristine_level + 0x7c00), DAT_002046c8);
    TEST_ASSERT_EQUAL_UINT32(0, DAT_002029d0);
    TEST_ASSERT_EQUAL_INT(2, automaps);
    TEST_ASSERT_EQUAL_INT(1, cache_resets);
    TEST_ASSERT_EQUAL_INT(1, attacker_resets);
    TEST_ASSERT_EQUAL_INT(160, DAT_00202080); /* spawn tile (32, 2) */
    TEST_ASSERT_EQUAL_INT(1, DAT_00201b60); /* gameplay mode */
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b64);
    TEST_ASSERT_EQUAL_INT(1, mode_state[4]); /* input dispatcher's mode */
    TEST_ASSERT_EQUAL_INT(1, cursor_resets);
    TEST_ASSERT_EQUAL_UINT16(0, DAT_000868d8);
}

static void test_cancelled_character_does_not_load_or_start_game(void)
{
    accept_character = false;
    g_new_game_entry_pause_pending = true;
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_FALSE(g_new_game_entry_pause_pending);
    TEST_ASSERT_EQUAL_INT(0, saves);
    TEST_ASSERT_EQUAL_INT(0, opens);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

static void test_failed_world_copy_does_not_load_or_spawn(void)
{
    TEST_ASSERT_EQUAL_INT(0, unlink(data_link));
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_INT(0, seeds);
    TEST_ASSERT_EQUAL_INT(0, opens);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

static void test_missing_level_archive_does_not_start_game(void)
{
    archive_ok = false;
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_INT(1, opens);
    TEST_ASSERT_EQUAL_INT(0, closes);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

static void test_failed_level_load_closes_archive_without_spawning(void)
{
    scheduler_result = 0;
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_HEX16(0x7577, *(ushort *)(arena + 0x7c06));
    TEST_ASSERT_EQUAL_INT(1, restores);
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_INT(0, textures);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

int main(void)
{
    UNITY_BEGIN();
    TEST_ASSERT_NOT_NULL(mkdtemp(workspace));
    snprintf(data_link, sizeof(data_link), "%s/DATA", workspace);
    snprintf(save_path, sizeof(save_path), "%s/SAVE0", workspace);
    snprintf(archive_path, sizeof(archive_path), "%s/lev.ark", save_path);
    TEST_ASSERT_EQUAL_INT(0, symlink(UW_TEST_DATA_DIR "/DATA", data_link));
    TEST_ASSERT_EQUAL_INT(0, mkdir(save_path, 0700));
    TEST_ASSERT_EQUAL_INT(0, setenv("UW_DATA_DIR", workspace, 1));
    RUN_TEST(test_stub_character_loads_level_one_and_enters_gameplay);
    RUN_TEST(test_cancelled_character_does_not_load_or_start_game);
    RUN_TEST(test_failed_world_copy_does_not_load_or_spawn);
    RUN_TEST(test_missing_level_archive_does_not_start_game);
    RUN_TEST(test_failed_level_load_closes_archive_without_spawning);
    unlink(data_link);
    rmdir(save_path);
    rmdir(workspace);
    return UNITY_END();
}
