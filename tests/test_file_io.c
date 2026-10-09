/* file_io.c's read-only port-asset fallback: the mechanism that lets the game
   run against an original DOS install, which has no DATA3D/*.E models at all
   (DOS compiled them into UW.EXE) and none of the port-added screens.

   UW_DATA_DIR stays the one true root. The fallback only ever answers a READ
   that the primary root cannot, which is the property that keeps a save
   written while playing a DOS install inside that install -- so most of what
   is checked here is where writes and deletes land, not just where reads come
   from.

   file_io.c caches UW_DATA_DIR on first use and never re-reads it, so the
   whole suite shares one pair of directories, set up before any file call. */

#include "unity.h"
#include "src/headers/file_io.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <unistd.h>

static char g_primary[512];   /* stands in for UW_DATA_DIR: a DOS install */
static char g_bundle[512];    /* stands in for the port's own shipped data */

static void write_text(const char *dir, const char *rel, const char *text)
{
    char path[1200];
    snprintf(path, sizeof path, "%s/%s", dir, rel);
    FILE *f = fopen(path, "wb");
    TEST_ASSERT_NOT_NULL_MESSAGE(f, path);
    TEST_ASSERT_EQUAL_UINT_MESSAGE(strlen(text), fwrite(text, 1, strlen(text), f), path);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, fclose(f), path);
}

static int read_text(const char *dir, const char *rel, char *out, size_t out_sz)
{
    char path[1200];
    snprintf(path, sizeof path, "%s/%s", dir, rel);
    FILE *f = fopen(path, "rb");
    if (!f) return 0;
    size_t n = fread(out, 1, out_sz - 1, f);
    out[n] = '\0';
    fclose(f);
    return 1;
}

/* Read a whole game file through the real API under test. Returns 0 if it
   could not be opened at all. */
static int read_game_file(const char *win_path, char *out, size_t out_sz)
{
    int h = uw_file_open_read(win_path);
    if (h == -1) return 0;
    int n = uw_file_read(h, out, (unsigned)out_sz - 1);
    uw_file_close(h);
    if (n < 0) n = 0;
    out[n] = '\0';
    return 1;
}

static void setup_once(void)
{
    if (g_primary[0]) return;

    char a[] = "/tmp/uw_fileio_primary_XXXXXX";
    char b[] = "/tmp/uw_fileio_bundle_XXXXXX";
    TEST_ASSERT_NOT_NULL_MESSAGE(mkdtemp(a), "mkdtemp primary");
    TEST_ASSERT_NOT_NULL_MESSAGE(mkdtemp(b), "mkdtemp bundle");
    snprintf(g_primary, sizeof g_primary, "%s", a);
    snprintf(g_bundle, sizeof g_bundle, "%s", b);

    char sub[1200];
    snprintf(sub, sizeof sub, "%s/DATA", g_primary);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, mkdir(sub, 0755), sub);
    snprintf(sub, sizeof sub, "%s/DATA", g_bundle);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, mkdir(sub, 0755), sub);
    snprintf(sub, sizeof sub, "%s/DATA3D", g_bundle);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, mkdir(sub, 0755), sub);
    snprintf(sub, sizeof sub, "%s/SAVE0", g_primary);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, mkdir(sub, 0755), sub);
    snprintf(sub, sizeof sub, "%s/SAVE0", g_bundle);
    TEST_ASSERT_EQUAL_INT_MESSAGE(0, mkdir(sub, 0755), sub);

    /* In both roots, with different content, so a test can tell which one
       answered. */
    write_text(g_primary, "DATA/SHARED.DAT", "from the primary root");
    write_text(g_bundle, "DATA/SHARED.DAT", "from the bundle");

    /* Bundle only -- the DATA3D/*.E case. Lower-case on disk, asked for in
       upper, so the fallback has to resolve case-insensitively too. */
    write_text(g_bundle, "DATA3D/cube.e", "BEGIN \"cube\"");

    /* Bundle only, and a test writes to this same path: the write must land
       in the primary root and leave the bundle's copy alone. */
    write_text(g_bundle, "DATA/PORTONLY.DAT", "bundle original");

    /* Bundle only, and a test deletes it by resolved path. */
    write_text(g_bundle, "DATA/DELETEME.DAT", "bundle original");

    /* Mutable per-install state that only the bundle happens to have: this
       port's own data/ really does carry a populated SAVE0. Reads of it must
       NOT fall through, or a fresh install would load a stranger's save. */
    write_text(g_bundle, "SAVE0/PLAYER.DAT", "the bundle's old save");
    write_text(g_bundle, "_ARC.TMP", "the bundle's old scratch archive");

    TEST_ASSERT_EQUAL_INT_MESSAGE(0, setenv("UW_DATA_DIR", g_primary, 1), "setenv UW_DATA_DIR");
    uw_set_port_data_dir(g_bundle);
}

void setUp(void) { setup_once(); }
void tearDown(void) {}

static void test_primary_root_wins_when_both_have_the_file(void)
{
    char got[256];
    TEST_ASSERT_TRUE(read_game_file("\\DATA\\SHARED.DAT", got, sizeof got));
    TEST_ASSERT_EQUAL_STRING("from the primary root", got);
}

static void test_bundle_answers_a_read_the_primary_root_cannot(void)
{
    char got[256];
    TEST_ASSERT_TRUE(read_game_file("\\DATA3D\\CUBE.E", got, sizeof got));
    TEST_ASSERT_EQUAL_STRING("BEGIN \"cube\"", got);
}

static void test_missing_from_both_roots_still_fails(void)
{
    char got[256];
    TEST_ASSERT_FALSE(read_game_file("\\DATA3D\\NOSUCH.E", got, sizeof got));
}

/* The property that matters most: a save written while UW_DATA_DIR points at
   a DOS install has to land in that install. If writes followed the fallback,
   the game would quietly write back into the port's own shipped assets. */
static void test_a_write_lands_in_the_primary_root_and_leaves_the_bundle_alone(void)
{
    int h = uw_file_open_write("\\DATA\\PORTONLY.DAT", 1);
    TEST_ASSERT_NOT_EQUAL_INT(-1, h);
    const char *payload = "written by the game";
    TEST_ASSERT_EQUAL_INT((int)strlen(payload),
                          uw_file_write(h, payload, (unsigned)strlen(payload)));
    uw_file_close(h);

    char got[256];
    TEST_ASSERT_TRUE_MESSAGE(read_text(g_primary, "DATA/PORTONLY.DAT", got, sizeof got),
                             "the write should have created the file in the primary root");
    TEST_ASSERT_EQUAL_STRING(payload, got);

    TEST_ASSERT_TRUE(read_text(g_bundle, "DATA/PORTONLY.DAT", got, sizeof got));
    TEST_ASSERT_EQUAL_STRING("bundle original", got);

    /* And now that the primary root has its own copy, reads stop falling
       through. */
    TEST_ASSERT_TRUE(read_game_file("\\DATA\\PORTONLY.DAT", got, sizeof got));
    TEST_ASSERT_EQUAL_STRING(payload, got);
}

/* uw_resolve_win_path backs a file DELETE (winfile_wrappers.c), so it must
   never hand back a path inside the bundle -- otherwise deleting a save the
   DOS install doesn't have would delete the port's own asset. */
static void test_resolve_win_path_never_points_into_the_bundle(void)
{
    char resolved[4096];
    TEST_ASSERT_TRUE(uw_resolve_win_path("\\DATA\\DELETEME.DAT", resolved, sizeof resolved));
    TEST_ASSERT_NOT_NULL(strstr(resolved, g_primary));
    TEST_ASSERT_NULL_MESSAGE(strstr(resolved, g_bundle),
                             "a resolved path must stay inside UW_DATA_DIR");

    /* Deleting through it leaves the bundle's copy -- and so the read
       fallback still finds one. */
    remove(resolved);
    char got[256];
    TEST_ASSERT_TRUE(read_text(g_bundle, "DATA/DELETEME.DAT", got, sizeof got));
    TEST_ASSERT_EQUAL_STRING("bundle original", got);
}

/* A read-write fopen mode can modify the file it names, so it stays on the
   primary root; only a plain "r" may be answered from the bundle. */
static void test_only_a_plain_read_mode_may_come_from_the_bundle(void)
{
    FILE *f = (FILE *)uw_file_fopen("\\DATA3D\\CUBE.E", "r");
    TEST_ASSERT_NOT_NULL_MESSAGE(f, "a plain read of a bundle-only file should open");
    fclose(f);

    /* "r+" cannot create a file, so this is expected to fail outright rather
       than be served from the bundle -- what must not happen is it opening
       the bundle's copy for modification. */
    f = (FILE *)uw_file_fopen("\\DATA3D\\CUBE.E", "r+");
    if (f) {
        fclose(f);
        char path[1200];
        snprintf(path, sizeof path, "%s/DATA3D/CUBE.E", g_primary);
        struct stat st;
        TEST_ASSERT_EQUAL_INT_MESSAGE(0, stat(path, &st),
            "an r+ open must have resolved inside the primary root, not the bundle");
    }
}

/* The fallback covers immutable shipped assets only. Save slots and the
   archive scratch file are per-install state; serving those from the bundle
   would silently hand a fresh install (or a regression script that
   deliberately starts with empty save slots) somebody else's save. */
static void test_save_slots_never_fall_back_to_the_bundle(void)
{
    char got[256];
    TEST_ASSERT_FALSE_MESSAGE(read_game_file("\\SAVE0\\PLAYER.DAT", got, sizeof got),
        "an empty save slot must read as empty, not as the bundle's copy");
}

static void test_the_archive_scratch_file_never_falls_back(void)
{
    char got[256];
    TEST_ASSERT_FALSE_MESSAGE(read_game_file("\\_ARC.TMP", got, sizeof got),
        "_ARC.TMP is written then read back -- it must never come from the bundle");
}

int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_primary_root_wins_when_both_have_the_file);
    RUN_TEST(test_bundle_answers_a_read_the_primary_root_cannot);
    RUN_TEST(test_missing_from_both_roots_still_fails);
    RUN_TEST(test_a_write_lands_in_the_primary_root_and_leaves_the_bundle_alone);
    RUN_TEST(test_resolve_win_path_never_points_into_the_bundle);
    RUN_TEST(test_only_a_plain_read_mode_may_come_from_the_bundle);
    RUN_TEST(test_save_slots_never_fall_back_to_the_bundle);
    RUN_TEST(test_the_archive_scratch_file_never_falls_back);
    return UNITY_END();
}
