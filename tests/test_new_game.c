#include "unity.h"
#include "src/headers/game.h"
#include "src/headers/level.h"

/* In-memory archive and player-save fixtures keep this test independent of
 * game data, disk writes, character-creation input, and display setup. */
static unsigned char arena[0x7c08], pristine_level[0x7c08], saved_level[0x7c08];
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

static bool accept_character, copy_ok, archive_ok;
static int scheduler_result;
static int character_calls, saves, copies, seeds, opens, reads, closes;
static int restores, textures, automaps, cache_resets, attacker_resets;
static int spawn_calls, special_state_calls, cursor_resets;
static bool archive_open, destination_exists;
static int copy_probe_closes;

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
    TEST_ASSERT_EQUAL_STRING("fixture\\SAVE0", path);
    TEST_ASSERT_EQUAL_STRING("Test Avatar", character);
    return 1;
}

bool write_player_save_record(const char *path)
{
    if (saves == 0) TEST_ASSERT_EQUAL_STRING("fixture\\SAVE0", path);
    else TEST_ASSERT_NULL(path); /* load_level's snapshot */
    memcpy(saved_character, character, sizeof(character));
    saves++;
    return true;
}

int uw_file_copy(const char *source, const char *destination)
{
    TEST_ASSERT_EQUAL_STRING("fixture\\DATA\\lev.ark", source);
    TEST_ASSERT_EQUAL_STRING("fixture\\SAVE0\\lev.ark", destination);
    TEST_ASSERT_EQUAL_INT(1, saves);
    copies++;
    if (!copy_ok) return 0;
    memcpy(saved_level, pristine_level, sizeof(saved_level));
    return 1;
}

/* The converter's static-buffer boundary is reproduced here; the actual
 * ordinal path adapters and file-copy implementation are compiled below. */
undefined *FUN_0002295c(char *path)
{
    static char converted[520];
    Ordinal_196(0, 2, path, -1, converted, 255);
    return (undefined *)converted;
}
int uw_file_open_read(const char *path)
{
    TEST_ASSERT_EQUAL_STRING("fixture\\SAVE0\\lev.ark", path);
    return destination_exists ? 7 : -1;
}
int uw_file_close(int handle)
{
    TEST_ASSERT_EQUAL_INT(7, handle);
    copy_probe_closes++;
    return 0;
}

undefined4 seed_conversation_globals_for_new_game(void)
{
    TEST_ASSERT_EQUAL_INT(1, copies);
    seeds++;
    return 0;
}

bool open_level_archive(byte *handle, const char *path)
{
    TEST_ASSERT_EQUAL_STRING("\\SAVE0\\lev.ark", path);
    TEST_ASSERT_EQUAL_INT(1, seeds);
    TEST_ASSERT_EQUAL_INT(-1, DAT_00202080);
    opens++;
    if (!archive_ok) return false;
    memset(handle, 0, 16);
    handle[0] = 0x42;
    handle[15] = 0x24;
    archive_open = true;
    return true;
}

undefined2 read_archive_entry(byte *handle, int entry, void *destination)
{
    TEST_ASSERT_TRUE(archive_open);
    TEST_ASSERT_EQUAL_UINT8(0x42, handle[0]);
    TEST_ASSERT_EQUAL_UINT8(0x24, handle[15]);
    TEST_ASSERT_EQUAL_INT(0, entry); /* level 1 is archive entry 0 */
    TEST_ASSERT_EQUAL_PTR(arena, destination);
    memcpy(destination, saved_level, sizeof(saved_level));
    reads++;
    return sizeof(saved_level);
}

undefined4 scheduler_load(byte *handle, int level)
{
    TEST_ASSERT_EQUAL_UINT8(0x42, handle[0]);
    TEST_ASSERT_EQUAL_INT(1, level);
    TEST_ASSERT_EQUAL_INT(1, reads);
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
    TEST_ASSERT_EQUAL_UINT8(0x42, handle[0]);
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
    TEST_ASSERT_EQUAL_UINT8(0x42, handle[0]);
    TEST_ASSERT_EQUAL_INT(1, level);
    TEST_ASSERT_EQUAL_INT(1, automaps);
    automaps++;
    return 1;
}
byte close_level_archive(byte *handle)
{
    TEST_ASSERT_TRUE(archive_open);
    TEST_ASSERT_EQUAL_UINT8(0x42, handle[0]);
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
    memset(pristine_level, 0, sizeof(pristine_level));
    memset(saved_level, 0, sizeof(saved_level));
    memset(character, 0, sizeof(character));
    memset(saved_character, 0, sizeof(saved_character));
    memset(mode_state, 0, sizeof(mode_state));
    strcpy((char *)DAT_0023cca8_backing, "fixture");
    strcpy((char *)DAT_000857a0_backing, "\\SAVE0");
    /* Minimal synthetic level block: one recognizable spawn tile, free-list
     * offsets, and the marker validated by load_level_object_table. */
    pristine_level[(2 * 64 + 32) * 4] = 1;
    const short trailer[] = {3, 4, 5, 0x7577};
    memcpy(pristine_level + 0x7c00, trailer, sizeof(trailer));
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
    accept_character = copy_ok = archive_ok = true;
    scheduler_result = 1;
    character_calls = saves = copies = seeds = opens = reads = closes = 0;
    restores = textures = automaps = cache_resets = attacker_resets = 0;
    spawn_calls = special_state_calls = cursor_resets = 0;
    archive_open = destination_exists = false;
    copy_probe_closes = 0;
}
void tearDown(void) { TEST_ASSERT_FALSE(archive_open); }

static void test_stub_character_loads_level_one_and_enters_gameplay(void)
{
    TEST_ASSERT_TRUE(prepare_new_game());
    begin_gameplay();

    TEST_ASSERT_EQUAL_STRING("Test Avatar", character);
    TEST_ASSERT_EQUAL_UINT8(12, character[0x21]);
    TEST_ASSERT_EQUAL_UINT8(2, (byte)character[100] >> 5);
    TEST_ASSERT_EQUAL_INT(1, character_calls);
    TEST_ASSERT_EQUAL_INT(2, saves);
    TEST_ASSERT_EQUAL_INT(1, copies);
    TEST_ASSERT_EQUAL_INT(1, seeds);
    TEST_ASSERT_EQUAL_INT(1, opens);
    TEST_ASSERT_EQUAL_INT(1, reads);
    TEST_ASSERT_EQUAL_INT(1, restores);
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_MEMORY(pristine_level, arena, sizeof(arena));
    TEST_ASSERT_EQUAL_PTR(arena + 0x7308, DAT_002046a8);
    TEST_ASSERT_EQUAL_PTR(arena + 0x7506, DAT_0020469c);
    TEST_ASSERT_EQUAL_PTR(arena + 0x7afd, DAT_002046c8);
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
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_INT(0, saves);
    TEST_ASSERT_EQUAL_INT(0, copies);
    TEST_ASSERT_EQUAL_INT(0, opens);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

static void test_failed_world_copy_does_not_load_or_spawn(void)
{
    copy_ok = false;
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
    TEST_ASSERT_EQUAL_INT(0, reads);
    TEST_ASSERT_EQUAL_INT(0, closes);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

static void test_failed_level_load_closes_archive_without_spawning(void)
{
    scheduler_result = 0;
    TEST_ASSERT_FALSE(prepare_new_game());
    TEST_ASSERT_EQUAL_INT(1, reads);
    TEST_ASSERT_EQUAL_INT(1, restores);
    TEST_ASSERT_EQUAL_INT(1, closes);
    TEST_ASSERT_EQUAL_INT(0, textures);
    TEST_ASSERT_EQUAL_INT(0, spawn_calls);
    TEST_ASSERT_EQUAL_INT(0, DAT_00201b60);
}

static void test_ordinal_164_preserves_existing_destination_when_requested(void)
{
    destination_exists = true;
    TEST_ASSERT_EQUAL_INT(0, Ordinal_164("fixture\\DATA\\lev.ark",
                                       "fixture\\SAVE0\\lev.ark", 1));
    TEST_ASSERT_EQUAL_INT(0, copies);
    TEST_ASSERT_EQUAL_INT(1, copy_probe_closes);
}

static void test_ordinal_164_copies_when_destination_does_not_exist(void)
{
    saves = 1;
    TEST_ASSERT_EQUAL_INT(1, Ordinal_164("fixture\\DATA\\lev.ark",
                                       "fixture\\SAVE0\\lev.ark", 1));
    TEST_ASSERT_EQUAL_INT(1, copies);
    TEST_ASSERT_EQUAL_INT(0, copy_probe_closes);
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_stub_character_loads_level_one_and_enters_gameplay);
    RUN_TEST(test_cancelled_character_does_not_load_or_start_game);
    RUN_TEST(test_failed_world_copy_does_not_load_or_spawn);
    RUN_TEST(test_missing_level_archive_does_not_start_game);
    RUN_TEST(test_failed_level_load_closes_archive_without_spawning);
    RUN_TEST(test_ordinal_164_preserves_existing_destination_when_requested);
    RUN_TEST(test_ordinal_164_copies_when_destination_does_not_exist);
    return UNITY_END();
}
