#include "headers/file_io.h"

#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>
#include <strings.h>
#include <sys/stat.h>
#include <errno.h>
#include <stdint.h>

#define MAX_HANDLES 64
static FILE *g_handles[MAX_HANDLES];

static const char *data_dir(void) {
    static const char *dir = NULL;
    static int looked_up = 0;
    if (!looked_up) {
        dir = getenv("UW_DATA_DIR");
        looked_up = 1;
        if (dir) {
            DEBUG(INFO, "[fileio] UW_DATA_DIR = %s\n", dir);
        } else {
            DEBUG(ERR, "[fileio] UW_DATA_DIR not set -- game data file "
                            "loads will fail\n");
        }
    }
    return dir;
}

/* A second, READ-ONLY root holding this port's own bundled copies of the
 * files it needs that an original DOS install simply does not have.
 *
 * The port runs against either asset set. Most files are common to both (or
 * differ only in a way the loader handles -- see chargen.c's CHRGEN.DAT
 * record-stride conversion and platform_voice.c's VOCnn.WAV/nn.VOC pair),
 * but a handful exist only on the Pocket PC side:
 *
 *   DATA3D/*.E (30 files)  the 3D models. DOS kept these COMPILED INTO
 *                          UW.EXE as bytecode; .E is Looking Glass's ASCII
 *                          source format (BEGIN/POINTS/PARTS/END -- there
 *                          is not one byte of it anywhere in UW.EXE), so
 *                          there is nothing in a DOS install for models.c's
 *                          parse_e_model_file to read. Without them no
 *                          model renders at all.
 *   DATA/COPYRIGHT.BYT     port-added full-screen images.
 *   DATA/CREDIT1-3.BYT
 *   CUTS/CS405.N01
 *
 * All of it is data this port already ships, ~440KB in total, so the fix is
 * to fall back to it rather than to recover the DOS originals: the models
 * would need a bytecode-to-.E decompiler to be usable here, and would come
 * out as the same geometry these files already hold.
 *
 * Read-only, and deliberately so: a save written while UW_DATA_DIR points at
 * a DOS install must land in that install, never back in the port's bundle.
 * So only the read paths below consult it -- uw_file_open_write,
 * uw_ensure_directory, uw_file_copy's destination and uw_resolve_win_path
 * (whose callers include a file DELETE, winfile_wrappers.c) all stay on
 * UW_DATA_DIR alone. */
static char g_port_data_dir[4096];

void uw_set_port_data_dir(const char *dir) {
    if (!dir || !dir[0]) return;
    snprintf(g_port_data_dir, sizeof(g_port_data_dir), "%s", dir);
    DEBUG(INFO, "[fileio] port asset fallback = %s\n", g_port_data_dir);
}

/* UW_PORT_DATA_DIR overrides whatever startup detected, so a run can point
 * the fallback somewhere else without moving files around. */
static const char *port_data_dir(void) {
    static int looked_up = 0;
    if (!looked_up) {
        looked_up = 1;
        const char *env = getenv("UW_PORT_DATA_DIR");
        if (env && env[0]) {
            snprintf(g_port_data_dir, sizeof(g_port_data_dir), "%s", env);
            DEBUG(INFO, "[fileio] UW_PORT_DATA_DIR = %s\n", g_port_data_dir);
        }
    }
    return g_port_data_dir[0] ? g_port_data_dir : NULL;
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

/* Translate a Windows-style game path ("\DATA\cnv.ark") into a real path under `base`,
   resolving each path component case-insensitively since the extracted CE install files are
   all-uppercase but the game code references them in mixed/lower case. */
static int resolve_under(const char *base, const char *win_path, char *out, size_t out_sz) {
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

static int resolve_path(const char *win_path, char *out, size_t out_sz) {
    return resolve_under(data_dir(), win_path, out, out_sz);
}

/* Which game paths the port-asset fallback is allowed to answer at all: the
   read-only asset trees, and nothing else.

   An allow-list rather than a "not a save" check, because getting this wrong
   is silent and nasty. The save slots are the obvious case -- SAVE0..SAVE4
   hold mutable per-install state, and this port's own data/ happens to
   contain a populated SAVE0, so without this a fresh install (or the
   regression harness, which deliberately starts every script with empty save
   slots) would read somebody else's old save instead of correctly finding
   nothing. _ARC.TMP, the archive scratch file the game writes and reads back,
   is the same hazard. Only genuinely immutable shipped assets belong here. */
static int path_may_use_port_assets(const char *win_path) {
    static const char *const roots[] = {
        "DATA3D", "DATA", "CRIT", "CUTS", "SOUND", "UU.EXE", "GX.DLL",
    };
    while (*win_path == '\\' || *win_path == '/') win_path++;
    size_t n = 0;
    while (win_path[n] && win_path[n] != '\\' && win_path[n] != '/') n++;
    for (unsigned i = 0; i < sizeof roots / sizeof roots[0]; i++) {
        if (strlen(roots[i]) == n && strncasecmp(win_path, roots[i], n) == 0) return 1;
    }
    return 0;
}

/* As resolve_path, but when UW_DATA_DIR has no such file and the port's own
   bundled assets do, hand back theirs -- that is what lets a DOS install
   render models and show the port-added screens. See g_port_data_dir above
   for why this is read-only, and path_may_use_port_assets for what it covers. */
static int resolve_path_for_read(const char *win_path, char *out, size_t out_sz) {
    if (!resolve_path(win_path, out, out_sz)) return 0;

    struct stat st;
    if (stat(out, &st) == 0) return 1;
    if (!path_may_use_port_assets(win_path)) return 1;

    const char *fallback = port_data_dir();
    if (!fallback) return 1;
    const char *base = data_dir();
    if (base && strcmp(base, fallback) == 0) return 1;

    char alt[4096];
    if (!resolve_under(fallback, win_path, alt, sizeof(alt))) return 1;
    if (stat(alt, &st) != 0) return 1;

    DEBUG(INFO, "[fileio] %s not in UW_DATA_DIR -- using the port's own %s\n", win_path, alt);
    snprintf(out, out_sz, "%s", alt);
    return 1;
}

/* The game's WinCE install always had its SAVE0/SAVE1/etc. directories pre-created (part of the
   shipped install), so it never needed to create one itself -- resolve_path() only
   case-insensitively matches existing entries and otherwise passes the path through unchanged. */
static void ensure_parent_dir(const char *path) {
    char dir[4096];
    snprintf(dir, sizeof(dir), "%s", path);
    char *slash = strrchr(dir, '/');
    if (!slash || slash == dir) return;
    *slash = '\0';
    if (mkdir(dir, 0755) != 0 && errno != EEXIST) {
        DEBUG(ERR, "[fileio] mkdir FAILED: %s (errno %d)\n", dir, errno);
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
    if (!resolve_path_for_read(win_path, real, sizeof(real))) return -1;
    /* real Windows CreateFile fails to open a directory as a file (without
       FILE_FLAG_BACKUP_SEMANTICS, which this game never asks for); POSIX fopen() happily "succeeds"
       on one instead... */
    struct stat st;
    if (stat(real, &st) == 0 && S_ISDIR(st.st_mode)) {
        DEBUG(WARN, "[fileio] open-read FAILED (is a directory): %s -> %s\n", win_path, real);
        return -1;
    }
    FILE *f = fopen(real, "rb");
    if (!f) {
        DEBUG(ERR, "[fileio] open-read FAILED: %s -> %s\n", win_path, real);
        return -1;
    }
    int h = alloc_handle(f);
    DEBUG(INFO, "[fileio] open-read: %s -> %s (handle %d)\n", win_path, real, h);
    return h;
}

void *uw_file_fopen(const char *win_path, const char *mode) {
    char real[4096];
    /* "r" without a '+' is the only mode that cannot create or modify the
       file it names, so it is the only one the port's read-only asset
       fallback may answer. */
    int read_only = mode && mode[0] == 'r' && !strchr(mode, '+');
    if (!(read_only ? resolve_path_for_read(win_path, real, sizeof(real))
                    : resolve_path(win_path, real, sizeof(real)))) return NULL;
    struct stat st;
    if (stat(real, &st) == 0 && S_ISDIR(st.st_mode)) {
        DEBUG(ERR, "[fileio] fopen FAILED (is a directory): %s -> %s\n", win_path, real);
        return NULL;
    }
    if (!mode || !mode[0]) mode = "r";
    if (mode[0] == 'w' || mode[0] == 'a') ensure_parent_dir(real);
    FILE *f = fopen(real, mode);
    DEBUG(INFO, "[fileio] fopen: %s -> %s (mode %s) %s\n", win_path, real, mode, f ? "ok" : "FAILED");
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
        DEBUG(ERR, "[fileio] open-write FAILED: %s -> %s\n", win_path, real);
        return -1;
    }
    int h = alloc_handle(f);
    DEBUG(INFO, "[fileio] open-write: %s -> %s (handle %d)\n", win_path, real, h);
    return h;
}

static FILE *lookup(int handle) {
    if (handle <= 0 || handle >= MAX_HANDLES) return NULL;
    return g_handles[handle];
}

int uw_file_read(int handle, void *buf, unsigned int size) {
    FILE *f = lookup(handle);
    if (!f || !buf) {
        DEBUG(ERR, "[fileio] read: handle %d invalid or null buf, size=%u\n", handle, size);
        return 0;
    }
    /* Symmetric with uw_file_write's own phantom seek -- see its
     * comment. A write-then-read on the same update-mode stream has
     * the identical undefined-behavior risk. */
    fseek(f, 0, SEEK_CUR);
    int n = (int)fread(buf, 1, size, f);
    /* fprintf(stderr, "[fileio] read: handle %d requested=%u got=%d\n", handle, size, n); */
    return n;
}

int uw_file_write(int handle, const void *buf, unsigned int size) {
    FILE *f = lookup(handle);
    if (!f || !buf || size > (64u * 1024u * 1024u)) {
        DEBUG(ERR, "[fileio] write: handle %d invalid/null-buf/oversized, size=%u\n", handle, size);
        return 0;
    }
    /* C89/C99 7.19.5.3: on a stream opened for update ("rb+"/"wb+"), output must not directly
       follow input without an intervening fseek/fflush/rewind call (even a zero-distance SEEK_CUR),
       or the write's effect is undefined. */
    fseek(f, 0, SEEK_CUR);
    errno = 0;
    int n = (int)fwrite(buf, 1, size, f);
    if (getenv("UW_DEBUG_INPUTEVENT"))
        fprintf(stderr, "[fileio] write: handle %d requested=%u wrote=%d errno=%d(%s) ferror=%d feof=%d\n",
                handle, size, n, errno, strerror(errno), ferror(f), feof(f));
    return n;
}

/* GetFileSize: query the open handle without changing its read position.
   Flush buffered writes so the size matches the WinCE handle behavior. */
unsigned int uw_file_size(int handle, unsigned int *high)
{
    FILE *f = lookup(handle);
    struct stat st;
    if (high) *high = 0;
    if (!f || fflush(f) != 0 || fstat(fileno(f), &st) != 0 || st.st_size < 0)
        return UINT32_MAX;
    uint64_t size = (uint64_t)st.st_size;
    if (high) *high = (unsigned int)(size >> 32);
    return (unsigned int)(size & UINT32_MAX);
}

int uw_file_seek(int handle, int distance, int method) {
    FILE *f = lookup(handle);
    if (!f) return -1;
    int whence = (method == 1) ? SEEK_CUR : (method == 2) ? SEEK_END : SEEK_SET;
    if (fseek(f, distance, whence) != 0) return -1;
    return (int)ftell(f);
}

/* CloseHandle-shaped (CloseHandle): callers that check the return value (uw.c:7717, 25111, 36182,
   58401 as of this writing) all treat it as "nonzero = success", matching uw_file_copy's own
   documented Win32 convention just below... */
int uw_file_close(int handle) {
    if (handle <= 0 || handle >= MAX_HANDLES || !g_handles[handle]) return 0;
    fclose(g_handles[handle]);
    g_handles[handle] = NULL;
    return 1;
}

/* Byte-for-byte copy of one game-path file to another (CopyFile-shaped). Used for new-game world
   setup (\DATA\lev.ark -> \SAVE0\lev.ark) and save/restore. Returns 1 on success, 0 on failure --
   the Win32 CopyFile convention the callers expect. */
int uw_file_copy(const char *win_src, const char *win_dst) {
    char src[4096], dst[4096];
    if (!resolve_path_for_read(win_src, src, sizeof(src)) ||
        !resolve_path(win_dst, dst, sizeof(dst))) {
        return 0;
    }
    FILE *in = fopen(src, "rb");
    if (!in) {
        DEBUG(ERR, "[fileio] copy FAILED (no source): %s -> %s\n", win_src, src);
        return 0;
    }
    ensure_parent_dir(dst);
    FILE *out = fopen(dst, "wb");
    if (!out) {
        DEBUG(ERR, "[fileio] copy FAILED (cannot create dest): %s -> %s\n", win_dst, dst);
        fclose(in);
        return 0;
    }
    char buf[65536];
    size_t n;
    int ok = 1;
    while ((n = fread(buf, 1, sizeof(buf), in)) > 0) {
        if (fwrite(buf, 1, n, out) != n) { ok = 0; break; }
    }
    if (ferror(in)) ok = 0;
    fclose(in);
    if (fclose(out) != 0) ok = 0;
    DEBUG(ERR, "[fileio] copy %s: %s -> %s\n", ok ? "ok" : "FAILED", src, dst);
    return ok;
}

int uw_resolve_win_path(const char *win_path, char *out, unsigned int out_sz) {
    return resolve_path(win_path, out, out_sz);
}

int uw_ensure_directory(const char *win_path) {
    char real[4096];
    if (!resolve_path(win_path, real, sizeof(real))) return 0;
    if (mkdir(real, 0755) == 0 || errno == EEXIST) {
        DEBUG(INFO, "[fileio] mkdir ok: %s -> %s\n", win_path, real);
        return 1;
    }
    DEBUG(ERR, "[fileio] mkdir FAILED: %s -> %s (errno %d)\n", win_path, real, errno);
    return 0;
}
