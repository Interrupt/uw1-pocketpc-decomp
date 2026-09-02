#include "file_io.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <strings.h>
#include <sys/stat.h>
#include <errno.h>

#define MAX_HANDLES 64
static FILE *g_handles[MAX_HANDLES];

static const char *data_dir(void) {
    static const char *dir = NULL;
    static int looked_up = 0;
    if (!looked_up) {
        dir = getenv("UW_DATA_DIR");
        looked_up = 1;
        if (dir) {
            fprintf(stderr, "[fileio] UW_DATA_DIR = %s\n", dir);
        } else {
            fprintf(stderr, "[fileio] UW_DATA_DIR not set -- game data file "
                            "loads will fail\n");
        }
    }
    return dir;
}

/* Case-insensitively find `name` inside `dir_path`, filling `out` with the
 * real on-disk name if found. Returns 1 on success. */
static int find_case_insensitive(const char *dir_path, const char *name, char *out, size_t out_sz) {
    DIR *d = opendir(dir_path);
    if (!d) return 0;
    struct dirent *ent;
    int found = 0;
    while ((ent = readdir(d)) != NULL) {
        if (strcasecmp(ent->d_name, name) == 0) {
            snprintf(out, out_sz, "%s", ent->d_name);
            found = 1;
            break;
        }
    }
    closedir(d);
    return found;
}

/* Translate a Windows-style game path ("\DATA\cnv.ark") into a real path
 * under UW_DATA_DIR, resolving each path component case-insensitively
 * since the extracted CE install files are all-uppercase but the game
 * code references them in mixed/lower case. */
static int resolve_path(const char *win_path, char *out, size_t out_sz) {
    const char *base = data_dir();
    if (!base) return 0;

    char cur[4096];
    snprintf(cur, sizeof(cur), "%s", base);

    char comp[256];
    const char *p = win_path;
    while (*p == '\\' || *p == '/') p++;

    while (*p) {
        size_t n = 0;
        while (p[n] && p[n] != '\\' && p[n] != '/') n++;
        if (n >= sizeof(comp)) n = sizeof(comp) - 1;
        memcpy(comp, p, n);
        comp[n] = '\0';
        p += n;
        while (*p == '\\' || *p == '/') p++;

        char resolved[256];
        if (!find_case_insensitive(cur, comp, resolved, sizeof(resolved))) {
            /* Not found case-insensitively (e.g. a file being newly
             * created, like a save game) -- use the name as given. */
            snprintf(resolved, sizeof(resolved), "%s", comp);
        }
        char next[4096];
        snprintf(next, sizeof(next), "%s/%s", cur, resolved);
        snprintf(cur, sizeof(cur), "%s", next);
    }

    snprintf(out, out_sz, "%s", cur);
    return 1;
}

/* The game's WinCE install always had its SAVE0/SAVE1/etc. directories
 * pre-created (part of the shipped install), so it never needed to
 * create one itself -- resolve_path() only case-insensitively matches
 * existing entries and otherwise passes the path through unchanged.
 * We're extracting fresh data without those save directories, so create
 * the target file's parent directory on write instead of failing (this
 * showed up as a fatal "not enough disk space"-style error at startup,
 * from a bglobals.dat save write into a nonexistent SAVE0/). */
static void ensure_parent_dir(const char *path) {
    char dir[4096];
    snprintf(dir, sizeof(dir), "%s", path);
    char *slash = strrchr(dir, '/');
    if (!slash || slash == dir) return;
    *slash = '\0';
    if (mkdir(dir, 0755) != 0 && errno != EEXIST) {
        fprintf(stderr, "[fileio] mkdir FAILED: %s (errno %d)\n", dir, errno);
    }
}

static int alloc_handle(FILE *f) {
    for (int i = 1; i < MAX_HANDLES; i++) {
        if (!g_handles[i]) {
            g_handles[i] = f;
            return i;
        }
    }
    fclose(f);
    return -1;
}

int uw_file_open_read(const char *win_path) {
    char real[4096];
    if (!resolve_path(win_path, real, sizeof(real))) return -1;
    /* real Windows CreateFile fails to open a directory as a file (without
     * FILE_FLAG_BACKUP_SEMANTICS, which this game never asks for); POSIX
     * fopen() happily "succeeds" on one instead, which papers over game
     * paths that are missing a filename component (a path built from a
     * directory prefix with no filename ever appended -- see uw.c's
     * FUN_0005b514 for a case that depends on this failing cleanly rather
     * than than silently opening the directory and returning garbage on
     * every subsequent read). */
    struct stat st;
    if (stat(real, &st) == 0 && S_ISDIR(st.st_mode)) {
        fprintf(stderr, "[fileio] open-read FAILED (is a directory): %s -> %s\n", win_path, real);
        return -1;
    }
    FILE *f = fopen(real, "rb");
    if (!f) {
        fprintf(stderr, "[fileio] open-read FAILED: %s -> %s\n", win_path, real);
        return -1;
    }
    int h = alloc_handle(f);
    fprintf(stderr, "[fileio] open-read: %s -> %s (handle %d)\n", win_path, real, h);
    return h;
}

void *uw_file_fopen(const char *win_path, const char *mode) {
    char real[4096];
    if (!resolve_path(win_path, real, sizeof(real))) return NULL;
    struct stat st;
    if (stat(real, &st) == 0 && S_ISDIR(st.st_mode)) {
        fprintf(stderr, "[fileio] fopen FAILED (is a directory): %s -> %s\n", win_path, real);
        return NULL;
    }
    if (!mode || !mode[0]) mode = "r";
    if (mode[0] == 'w' || mode[0] == 'a') ensure_parent_dir(real);
    FILE *f = fopen(real, mode);
    fprintf(stderr, "[fileio] fopen: %s -> %s (mode %s) %s\n", win_path, real, mode, f ? "ok" : "FAILED");
    return f;
}

int uw_file_open_write(const char *win_path, int create_always) {
    char real[4096];
    if (!resolve_path(win_path, real, sizeof(real))) return -1;
    ensure_parent_dir(real);
    const char *mode = create_always ? "wb+" : "rb+";
    FILE *f = fopen(real, mode);
    if (!f && !create_always) f = fopen(real, "wb+");
    if (!f) {
        fprintf(stderr, "[fileio] open-write FAILED: %s -> %s\n", win_path, real);
        return -1;
    }
    int h = alloc_handle(f);
    fprintf(stderr, "[fileio] open-write: %s -> %s (handle %d)\n", win_path, real, h);
    return h;
}

static FILE *lookup(int handle) {
    if (handle <= 0 || handle >= MAX_HANDLES) return NULL;
    return g_handles[handle];
}

int uw_file_read(int handle, void *buf, unsigned int size) {
    FILE *f = lookup(handle);
    if (!f || !buf) {
        fprintf(stderr, "[fileio] read: handle %d invalid or null buf, size=%u\n", handle, size);
        return 0;
    }
    int n = (int)fread(buf, 1, size, f);
    fprintf(stderr, "[fileio] read: handle %d requested=%u got=%d\n", handle, size, n);
    return n;
}

int uw_file_write(int handle, const void *buf, unsigned int size) {
    FILE *f = lookup(handle);
    if (!f || !buf || size > (64u * 1024u * 1024u)) {
        fprintf(stderr, "[fileio] write: handle %d invalid/null-buf/oversized, size=%u\n", handle, size);
        return 0;
    }
    int n = (int)fwrite(buf, 1, size, f);
    fprintf(stderr, "[fileio] write: handle %d requested=%u wrote=%d\n", handle, size, n);
    return n;
}

int uw_file_seek(int handle, int distance, int method) {
    FILE *f = lookup(handle);
    if (!f) return -1;
    int whence = (method == 1) ? SEEK_CUR : (method == 2) ? SEEK_END : SEEK_SET;
    if (fseek(f, distance, whence) != 0) return -1;
    return (int)ftell(f);
}

int uw_file_close(int handle) {
    if (handle <= 0 || handle >= MAX_HANDLES || !g_handles[handle]) return -1;
    fclose(g_handles[handle]);
    g_handles[handle] = NULL;
    return 0;
}
