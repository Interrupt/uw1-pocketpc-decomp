#include "headers/ordinal_stubs.h"
#include "headers/file_io.h"
#include "headers/debug.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <math.h>
#include <stdint.h>
#include <sys/stat.h>
#include <SDL.h>

void uw_pump_events(void);
unsigned int handle_keyboard_message(void *param_1, unsigned int param_2, unsigned int param_3);
int uw_take_mouse_event_pending(void);

long EnterCriticalSection()
{
    return 0;
}

long GetSystemTime()
{
    return 0;
}

long LocalAlloc()
{
    return 0;
}

long LocalReAlloc()
{
    return 0;
}

long LocalSize()
{
    return 0;
}

long RemoteLocalReAlloc()
{
    return 0;
}

long HeapReAlloc()
{
    return 0;
}

long ce_wcscat()
{
    return 0;
}

/* Wide-string copy-shaped call (identity inferred from call sites).
 * Receives (destination, source) after FUN_0002295c converts a game path;
 * used to fill source/destination buffers for the new-game archive copy.
 * This native port keeps converted paths as ANSI strings, matching the
 * CreateDirectory/FindFirstFile adapters, so copy the bytes here. */
long ce_wcscpy(destination, source)
char *destination;
const char *source;
{
    if (!destination || !source) return 0;
    strcpy(destination, source);
    return (long)(uintptr_t)destination;
}

long ce_wcslen()
{
    return 0;
}

long Random()
{
    return 0;
}

/* SystemParametersInfo-shaped call (action=0x102=SPI_GETOEMINFO at its
 * only call site). The caller uses the returned OEM string to decide
 * whether to run the "real" GAPI display-properties init path
 * (GXOpenInput + GXGetDisplayProperties, gated on _wcsicmp matching
 * against a specific hardware name, "HP,Jornada_540") or skip it
 * entirely. Skipping it left DAT_0023cdc0 (cBPP) permanently 0, so the
 * present/blit gate `DAT_0023cdc0 == 0x10` never passed and the screen
 * stayed black even once real pixel data was being drawn into the
 * software framebuffer. Our gx_stub.c backend is a fixed-size 16bpp
 * RGB565 framebuffer close enough to that device's, so report that same
 * device string unconditionally to make sure the game always takes the
 * branch that initializes pitch/BPP. */
static const unsigned short g_oem_info_str[] = {
    'H','P',',','J','o','r','n','a','d','a','_','5','4','0',0
};

long SystemParametersInfoW(action, cb, buf, fWinIni)
unsigned int action;
unsigned int cb;
void *buf;
unsigned int fWinIni;
{
    (void)fWinIni;
    if (action == 0x102 && buf && cb >= sizeof(g_oem_info_str)) {
        memcpy(buf, g_oem_info_str, sizeof(g_oem_info_str));
    }
    return 1;
}

long RegisterClassW()
{
    return 0;
}

long CopyRect()
{
    return 0;
}

long CreateDirectoryW()
{
    return 0;
}

long RemoveDirectoryW()
{
    return 0;
}

/* CopyFileW-shaped call (source path, destination path, fail-if-exists).
 * Used to seed SAVE0\lev.ark from DATA\lev.ark for a new game, and by
 * older save-slot copy paths. The native conversion adapters retain ANSI
 * paths; uw_file_copy resolves them against UW_DATA_DIR and copies bytes. */
long CopyFileW(source, destination, fail_if_exists)
const char *source;
const char *destination;
int fail_if_exists;
{
    if (!source || !destination) return 0;
    if (fail_if_exists) {
        int handle = uw_file_open_read(destination);
        if (handle >= 0) {
            uw_file_close(handle);
            return 0;
        }
    }
    return uw_file_copy(source, destination);
}

/* uw.c is riddled with call sites that pass a real pointer through an
 * `undefined4`/`int`-typed local (this file's single most common bug
 * class -- truncates to 32 bits on this 64-bit build), and both of these
 * ordinals used to be no-op stubs that never dereferenced their
 * arguments, so any such truncation feeding them was harmless/dormant.
 * Now that they actually touch the string, guard against the obviously-
 * truncated case: a real pointer on this platform is never this small. */
static int looks_like_real_pointer(const void *p)
{
    return (uintptr_t)p >= 0x10000;
}

/* CreateDirectory-shaped. Its one real call site (ensure_save_directory_exists, the
 * save-slot-directory creator -- was calling this with the argument
 * dropped entirely) treats "the directory is there" as success whether
 * or not it already existed, so uw_ensure_directory's EEXIST-tolerant
 * mkdir matches the intent better than a strict CreateDirectory would. */
long create_directory_path(void *path_ptr)
{
    if (!looks_like_real_pointer(path_ptr)) return 0;
    return uw_ensure_directory((const char *)path_ptr) ? 1 : 0;
}

/* FindFirstFile-shaped. Every known caller only ever checks the return
 * value against -1 (not found) and, for the one caller that cares
 * (ensure_save_directory_exists), reads back dwFileAttributes (the struct's first field)
 * to test FILE_ATTRIBUTE_DIRECTORY (0x10) -- none read the filename
 * fields a real WIN32_FIND_DATA also carries, so implemented against
 * stat() rather than a full opendir/readdir enumeration. Treats its
 * first argument as a plain path string (this port's MultiByteToWideChar/197
 * "wide" conversions are ANSI passthroughs -- see their comments) and
 * strips a trailing wildcard component (e.g. "\*.*", appended by
 * ensure_save_directory_exists before calling this) since stat() doesn't understand
 * wildcards. */
long FindFirstFileW(void *path_ptr, unsigned int *out_attrs)
{
    const char *win_path = (const char *)path_ptr;
    if (!win_path || !looks_like_real_pointer(path_ptr)) return -1;
    char pattern[1024];
    snprintf(pattern, sizeof(pattern), "%s", win_path);
    char *slash = strrchr(pattern, '\\');
    if (slash && strchr(slash, '*')) *slash = '\0';
    char real[4096];
    if (!uw_resolve_win_path(pattern, real, sizeof(real))) return -1;
    struct stat st;
    if (stat(real, &st) != 0) return -1;
    if (out_attrs) out_attrs[0] = S_ISDIR(st.st_mode) ? 0x10u : 0u;
    return 1;
}

long CreateFileW()
{
    return 0;
}

long ReadFile()
{
    return 0;
}

long WriteFile()
{
    return 0;
}

/* GetFileSize(handle, optional high-word pointer). The picture viewer uses
   this to allocate and read each LPF resource; returning zero skips it. */
long GetFileSize(int handle, unsigned int *high)
{
    return uw_file_size(handle, high);
}

long SetFilePointer()
{
    return 0;
}

long SetFileTime()
{
    return 0;
}

long FindNextFileW()
{
    return 0;
}

int GetDiskFreeSpaceExW(void *path, unsigned int flags, void *out_struct, unsigned int *out_free_lo)
{
    (void)path; (void)flags; (void)out_struct;
    if (out_free_lo) *out_free_lo = 0x7fffffff;
    return 1;
}

/* MultiByteToWideChar-shaped call (API identity inferred from arguments).
 * FUN_0002295c passes (0, 2, ANSI path, -1, output buffer, 0xff) to prepare
 * a path for WinCE file APIs. This native port retains ANSI bytes because
 * its file API adapters accept narrow paths, rather than UTF-16. Returns
 * the copied byte count (including NUL when source_count is -1), or zero
 * when the destination is too small. This is a path adapter, not a general
 * implementation of Windows code-page conversion. */
long MultiByteToWideChar(code_page, flags, source, source_count, destination, capacity)
unsigned int code_page;
unsigned int flags;
const char *source;
int source_count;
char *destination;
int capacity;
{
    size_t count;
    (void)code_page;
    (void)flags;
    if (!source || source_count == 0 || source_count < -1) return 0;
    count = source_count == -1 ? strlen(source) + 1 : (size_t)source_count;
    if (!destination && capacity == 0) return (long)count;
    if (!destination || capacity < 0 || count > (size_t)capacity) return 0;
    memmove(destination, source, count);
    return (long)count;
}

long WideCharToMultiByte()
{
    return 0;
}

long GetUserDefaultLangID()
{
    return 0;
}

long FoldStringW()
{
    return 0;
}

/* UTF-16 string-equality check; the only call site compares SystemParametersInfoW's
 * SPI_GETOEMINFO string against a fixed device name (see SystemParametersInfoW's
 * comment). wcscmp isn't used here because macOS wchar_t is 4 bytes,
 * not the 2-byte UTF-16 units this game's strings use. */
long _wcsicmp(a, b)
unsigned short *a;
unsigned short *b;
{
    while (*a && *b && *a == *b) { a++; b++; }
    return *a == *b;
}

long CloseAllFileHandles()
{
    return 0;
}

void *CreateWindowExW(void *a, void *b, void *c, unsigned int d)
{
    (void)a; (void)b; (void)c; (void)d;
    fprintf(stderr, "[ordinal] CreateWindowExW: CreateWindow-shaped call, returning a fake non-null HWND (real window comes from GXOpenDisplay)\n");
    return (void *)1; /* fake non-null HWND */
}

long DefWindowProcW()
{
    return 0;
}

long ShowWindow()
{
    return 0;
}

long UpdateWindow()
{
    return 0;
}

int FindWindowW(void *a, void *b)
{
    (void)a; (void)b;
    fprintf(stderr, "[ordinal] FindWindowW: single-instance check, reporting no existing instance\n");
    return 0; /* no existing instance / success */
}

long BatteryDrvrGetLevels()
{
    return 0;
}

long CeReadRecordProps()
{
    return 0;
}

long waveOutClose()
{
    return 0;
}

long waveOutPrepareHeader()
{
    return 0;
}

long waveOutUnprepareHeader()
{
    return 0;
}

long waveOutWrite()
{
    return 0;
}

long waveOutReset()
{
    return 0;
}

long waveOutOpen()
{
    return 0;
}

long RegCloseKey()
{
    return 0;
}

long RegCreateKeyExW()
{
    return 0;
}

int RegOpenKeyExW(unsigned int hkey, void *subkey, unsigned int reserved, void *result)
{
    (void)hkey; (void)subkey; (void)reserved; (void)result;
    fprintf(stderr, "[ordinal] RegOpenKeyExW: RegOpenKeyEx-shaped call, reporting success so the game takes its safe bounded-copy path instead of a hardcoded-offset fallback that segfaults when recompiled\n");
    return 0;
}

long RegQueryValueExW()
{
    return 0;
}

long RegSetValueExW()
{
    return 0;
}

/* Sleep-shaped: real elapsed-ms delay. Was a hardcoded no-op, so every
 * `Sleep(ms)` call across the game -- e.g. the splash-screen
 * sequence's 1.5s dwell between each image (run_game_startup_sequence) and
 * app_main_loop's own startup 2000ms pause -- did nothing at all.
 * Confirmed as the real cause of splash images blitting past instantly
 * ("flashes") instead of actually being shown for a moment: this stub,
 * not a missing fade, same root-cause class as GetTickCount (GetTickCount)
 * being a hardcoded 0 earlier this session. */
long Sleep(unsigned int ms)
{
    DEBUG(TRACE, "[sleep] Sleep requested ms=%u", ms);
    /* UW_FAST_SLEEP: debug-only switch to skip the real delay below (splash
     * dwells, app_main_loop's startup pause, etc. otherwise add up to real
     * wall-clock seconds every run) so automated/demo-driven test runs reach
     * gameplay quickly. Still pumps events once so the window doesn't look
     * dead. Checked once and cached -- this is a debug hook, not something
     * that should read the environment on every call. */
    static int fast = -1;
    if (fast < 0) {
        fast = getenv("UW_FAST_SLEEP") != NULL;
    }
    if (fast) {
        SDL_PumpEvents();
        return 0;
    }
    /* HACK: a single long SDL_Delay(ms) blocks this thread for the whole
     * duration without ever pumping SDL's event queue, which on macOS
     * (and likely other platforms) stops the window from actually
     * compositing/repainting whatever was just SDL_RenderPresent()'d --
     * it can look frozen/blank for the entire sleep instead of showing
     * the frame (confirmed report: splash images not displaying during
     * their now-real 1.5s dwell). Chunk the sleep and call
     * SDL_PumpEvents() between pieces instead of one long blocking call
     * -- this only lets the OS/SDL process its own event queue (window
     * expose/repaint, etc.), it does NOT dispatch anything into the
     * game's own input handling (that stays untouched, still driven by
     * uw_pump_events() elsewhere), so this doesn't change game
     * behavior, just keeps the window visually alive during a sleep. */
    const unsigned int chunk_ms = 10;
    unsigned int remaining = ms;
    while (remaining > 0) {
        unsigned int this_chunk = remaining < chunk_ms ? remaining : chunk_ms;
        SDL_Delay(this_chunk);
        SDL_PumpEvents();
        remaining -= this_chunk;
    }
    return 0;
}

long GetLastError()
{
    return 0;
}

long FindResourceW()
{
    return 0;
}

long LoadResource()
{
    return 0;
}

/* GetTickCount-shaped: real elapsed milliseconds since startup. Was a
 * hardcoded 0, meaning every read_realtime_clock_units() (this file's
 * GetTickCount() >> 2, uw.c) call across the whole game always read "0
 * elapsed" -- silently
 * breaking every timing check built on it, not just the one that
 * exposed it (fade_in's fade-in-from-black transition measured
 * 0ms end to end with this stubbed out, confirming the fade logic
 * itself was intact and only the time source was missing). */
long GetTickCount()
{
    return (long)SDL_GetTicks();
}

/* CloseHandle-shaped file-close, used ~49 times across uw.c (e.g.
 * read_buffer_from_file closes every file it opens through this). Was a no-op,
 * so every file handle ever opened leaked -- harmless until a loop that
 * opens+"closes" a file every frame (e.g. the credits screen, reopening
 * CREDIT1/2/3.BYT once per tick while waiting for input) exhausted the
 * 64-slot handle table within a few seconds, after which *every*
 * subsequent file open in the whole game failed (including files
 * completely unrelated to the credits screen, like OPSCR.BYT/PALS.DAT
 * when returning to the options menu), triggering a fatal error exit. */
long CloseHandle(handle)
int handle;
{
    return uw_file_close(handle);
}

long GetDlgItemTextW()
{
    return 0;
}

long DialogBoxIndirectParamW()
{
    return 0;
}

long EndDialog()
{
    return 0;
}

long SetForegroundWindow()
{
    return 0;
}

long ce_sprintf()
{
    return 0;
}

long MessageBoxW()
{
    return 0;
}

long DispatchMessageW()
{
    return 0;
}

/* DAT_0023c448 is uw.c's real "pending input event" flags word, set
 * directly by handle_keyboard_message() from uw_pump_events()'s real SDL key
 * events (not through a faked MSG struct). */
extern unsigned short DAT_0023c448;

int PeekMessageW(void *msg, void *hwndFilter, unsigned int wMsgFilterMin, unsigned int wMsgFilterMax, unsigned int wRemoveMsg)
{
    (void)msg; (void)hwndFilter; (void)wMsgFilterMin; (void)wMsgFilterMax; (void)wRemoveMsg;
    uw_pump_events();
    /* Originally always returned 0 ("never a message pending") on the
     * assumption that every caller only branches on the message
     * contents when this is nonzero and that driving input via
     * DAT_0023c448 directly was independent of that. That's wrong for
     * poll_input_event (uw.c) -- the real keyboard-polling function used by
     * every menu/input-wait loop in the game -- which only reads
     * DAT_0023c448 *inside* the branch gated on this return value being
     * nonzero. With this always 0, DAT_0023c448 was never read at all,
     * so no keypress could ever reach the game after the first screen
     * that waits on input (confirmed: menu displayed correctly but
     * never responded to any key). Report a message pending whenever
     * there's a real one queued.
     *
     * DAT_0023c448 only ever reflects keyboard state, though -- mouse
     * events are handled synchronously and completely inline in
     * uw_pump_events (handle_mouse_message finishes with each one immediately),
     * leaving no "pending" state for DAT_0023c448 to hold the way
     * keyboard input does. Without also checking
     * uw_take_mouse_event_pending(), poll_input_event never falls through to
     * poll_mouse_event()/update_mouse_state() for mouse-only activity
     * (no keyboard event pending at the same moment), so g_mouse_x/
     * g_mouse_y never track the real cursor and the game's own
     * registered-rect click hit-test (update_hotspot_cursor_icon) never runs. Real
     * WinCE PeekMessage would report a pending message for either input
     * type, so check both here to match. */
    return (DAT_0023c448 != 0) || uw_take_mouse_event_pending();
}

long PostQuitMessage()
{
    return 0;
}

/* Real coredll ordinal: PostMessage(hwnd, msg, wParam, lParam). Confirmed
 * via Ghidra headless disassembly -- this is the exact call the recovered
 * mouse handler (handle_mouse_message in uw.c) makes to re-dispatch a stylus tap
 * on the chargen on-screen keyboard as a synthetic WM_CHAR/WM_KEYDOWN.
 * This port never builds a real Win32 MSG queue (see PeekMessageW's
 * comment -- handle_keyboard_message is driven directly from DAT_0023c448), so
 * dispatch synchronously into the same handler real keyboard input
 * already reaches instead of queuing. */
int PostMessageW(void *hwnd, unsigned int msg, unsigned int wparam, int lparam)
{
    return (int)handle_keyboard_message(hwnd, msg, wparam);
}

long TranslateMessage()
{
    return 0;
}

long GetSystemMetrics()
{
    return 0;
}

long DeleteObject()
{
    return 0;
}

long GetStockObject()
{
    return 0;
}

long ce_atoi()
{
    return 0;
}

/* cos(x): x is a double bit-pattern arriving in the return/first-arg
   register (chained from ordfloat_float_to_double in build_trig_tables, which builds the
   renderer's per-degree cos table DAT_000d9ed8). Was a return-0 stub,
   which left the whole view matrix zero -> every 3D vertex projected to
   a single point. */
long ordfloat_cos(x)
unsigned long long x;
{
    double d;
    memcpy(&d, &x, 8);
    d = cos(d);
    memcpy(&x, &d, 8);
    return (long)x;
}

void LocalFree(ptr)
void *ptr;
{
    /* deliberately a leak, not free(ptr): several call sites
       have no argument expression at all (Ghidra dropped it),
       so ptr may be garbage -- freeing it would be a likely
       crash. Leaking for the life of this short-lived stub
       process is harmless. */
    (void)ptr;
}

long _itoa()
{
    return 0;
}

long ordfloat_log()
{
    return 0;
}

long _ltoa()
{
    return 0;
}

void *ce_malloc(size)
unsigned int size;
{
    /* Was plain malloc -- real WinCE code allocating a small tracking
       record and never explicitly zeroing it (e.g. open_backpack_container's
       12-byte container-tracking record, which reads its own byte offset
       8 in a masked read-modify-write without ever writing it first --
       confirmed present in the real ARM binary too, at 0x4346c/0x4348c)
       only makes sense if this ordinal itself zero-initializes, matching
       LocalAlloc(LPTR, ...) semantics (LMEM_FIXED | LMEM_ZEROINIT) --
       the idiomatic WinCE call for exactly this "alloc and rely on
       zeroed fields" pattern. Confirmed live: the un-zeroed offset 8
       byte fed a bogus object-slot index into release_container_reference
       on container close, corrupting an unrelated, effectively random
       object's data each time (matching a user report of "closing and
       reopening a container loses other contents seemingly randomly"). */
    if (size == 0 || size > (64u * 1024u * 1024u)) size = 4096;
    return calloc(1, size);
}

void *ce_memmove(dest, src, n)
void *dest;
void *src;
unsigned int n;
{
    if (dest == 0 || src == 0 || n == 0 || n > (64u * 1024u * 1024u)) return dest;
    memmove(dest, src, n);
    return dest;
}

/* memset: fills n bytes at ptr with val, returning ptr. Used throughout
 * startup to clear records and buffers; the old new-game menu also used
 * (path_buffer, 0, 0x104) before assembling file paths. Null ptr is ignored. */
void *ce_memset(void *ptr, int val, unsigned int n)
{
    if (ptr) memset(ptr, val, n);
    return ptr;
}

/* COREDLL ordinal 1053 = rand(). Was stubbed to always return 0, which
   silently killed every randomized effect in the game -- e.g. the
   automap water/lava fill collapsed from its intended 2-/3-tone dither
   to a flat single color. Real rand(); deterministic (no srand) so
   scripted runs stay reproducible. */
long ce_rand()
{
    return rand();
}

void *ce_realloc(void *ptr, unsigned int size)
{
    if (size == 0) return ptr;
    return realloc(ptr, size);
}

/* sin(x): x is a double bit-pattern split across the first two arg
   registers (build_trig_tables passes it as two ints). Builds DAT_000d9930. */
long ordfloat_sin(lo, hi)
unsigned int lo;
unsigned int hi;
{
    unsigned long long b = (unsigned long long)lo | ((unsigned long long)hi << 32);
    double d;
    memcpy(&d, &b, 8);
    d = sin(d);
    memcpy(&b, &d, 8);
    return (long)b;
}

long ce_srand()
{
    return 0;
}

/* strcat: appends src to the NUL-terminated string in dest and returns
 * dest. Used to assemble game/save paths from an install-directory prefix
 * and suffixes such as \DATA\lev.ark and \SAVE0. Does not check capacity;
 * both arguments must be valid strings. Null arguments skip the append. */
char *ce_strcat(dest, src)
char *dest;
char *src;
{
    if (dest && src) strcat(dest, src);
    return dest;
}

char *ce_strchr(const char *s, int c)
{
    if (s == 0) return 0;
    return strchr(s, c);
}

int ce_strcmp(const char *a, const char *b)
{
    if (a == 0 || b == 0) return -1;
    return strcmp(a, b);
}

unsigned int ce_strlen(s)
const char *s;
{
    if (s == 0) return 0;
    return (unsigned int)strlen(s);
}

int ce_strncmp(const char *a, const char *b, unsigned int n)
{
    if (a == 0 || b == 0) return -1;
    return strncmp(a, b, n);
}

/* MSVCRT `strncpy(dest, src, n)` -- sits right after strcmp(1065)/
 * strlen(1068)/strncmp(1070) in the ordinal table, matching that
 * sequential string-function grouping. Confirmed by its callers: every
 * site copies a fixed-width raw field (e.g. the player's name field)
 * into a stack buffer and then manually null-terminates one byte past
 * the copy length, exactly the defensive pattern strncpy's own
 * "doesn't guarantee termination" semantics require. Was a no-op stub
 * returning 0, which left every such buffer as uninitialized stack
 * garbage -- confirmed as the cause of the player name never
 * displaying on the stats panel (draw_stats_panel_header draws whatever garbage
 * was left in its local buffer instead of the real name). */
long ce_strncpy(dest, src, n)
char *dest;
const char *src;
unsigned int n;
{
    if (dest == 0) return 0;
    if (src == 0) {
        memset(dest, 0, n);
        return (long)dest;
    }
    strncpy(dest, src, n);
    return (long)dest;
}

long ce_strstr()
{
    return 0;
}

/* Windows CE keyboard-translation ordinal (likely a VK-code-to-character
 * case transform, given its sibling ce_toupper and their shared call
 * site at uw.c ~50479: `if (DAT_0023c448 == 0x400) sVar1 =
 * ce_tolower(sVar1); else sVar1 = ce_toupper();` -- a caps/shift-state
 * branch feeding the translated key code onward). Was a no-op stub
 * returning 0 even though its own call site already passes a real
 * argument -- every character typed down this specific path (whichever
 * keyboard state selects this branch) silently became NUL. Implemented
 * as an identity passthrough: real semantics (whatever exact case-fold
 * Windows CE's own import performs) aren't recovered, but returning the
 * input unchanged is strictly better than always returning 0/NUL, and
 * is correct for the common case where the raw key code is already the
 * intended printable character. */
long ce_tolower(param_1)
long param_1;
{
    return param_1;
}

/* Windows CE toupper import: the automap note editor uses this to map
 * lowercase input to the uppercase-only FONT4X5P.SYS glyphs. The original
 * dropped argument was restored earlier, but the identity stub still left
 * lowercase notes invisible. Preserve nonletters and input sentinels. */
long ce_toupper(param_1)
long param_1;
{
    if (param_1 >= 'a' && param_1 <= 'z') return param_1 - 'a' + 'A';
    return param_1;
}

/* Was, and stays, a hardcoded no-op always returning 0 (NULL) -- every
 * single call site (the MOD-tracker music engine's buffer/pattern/
 * instrument allocators in audio.c, plus one BMP-resource loader in
 * graphics.c) gets NULL back. graphics.c's one call site null-checks
 * the result and fails gracefully; audio.c's ~30 call sites mostly
 * don't (e.g. queue_mod_audio_buffer immediately writes through the
 * "allocated" pointer with no check at all) -- this is the second half
 * of "no music playback" alongside DAT_00087454/DAT_00087448 in
 * audio.c: once those gate flags are flipped nonzero, play_music_track's
 * very first real step (`iVar3 = cpp_operator_new(0x10581); if (iVar3
 * == 0) { ... }`) always takes the failure branch too, so
 * construct_and_load_mod_player (and the entire MOD engine under it)
 * has apparently never actually run even once since this was
 * decompiled.
 *
 * Investigated turning this into a real calloc()-backed allocator
 * (matching ce_malloc's own zero-init convention) as the other half of
 * fixing "no music playback" -- confirmed it builds and runs, but live-
 * tested it all the way through and it crashes construct_and_load_mod_player
 * on its first real file load: see DAT_00087454's comment in audio.c
 * for the full root cause (every MOD-engine "dynamic array" struct
 * stores this allocator's result in a 4-byte field and reads it back
 * later as a real address, which silently truncates on this 64-bit
 * build since no allocation here can land below 4GB -- confirmed
 * empirically, not just in theory: calloc() and even mmap(MAP_FIXED)
 * at every low address tried from 0x1000000 to 0xff000000 are refused
 * by the kernel on this platform). Left as the original no-op rather
 * than shipping something that trades silence for a crash; a real fix
 * needs that 4-byte-field problem solved first (see audio.c), at which
 * point this stub is the easy half -- just swap the `return 0` below
 * for a real `calloc(1, size)` (with a sane size clamp, see ce_malloc
 * above for the pattern) once that's done. cpp_operator_delete, right
 * below, would need the same follow-up treatment (it's a leak-not-free
 * no-op today; several of its call sites in audio.c's MOD-engine
 * cluster are reached with zero arguments -- a dropped-argument
 * decompilation artifact -- so a real free() behind it would free
 * whatever garbage sits in the argument register at those call sites;
 * harmless only because this stays a no-op). */
long cpp_operator_delete()
{
    return 0;
}

long cpp_operator_new()
{
    return 0;
}

void NKDbgPrintfW(const char *fmt, ...)
{
    if (fmt == 0) return;
    va_list ap;
    fprintf(stderr, "[game] ");
    va_start(ap, fmt);
    vfprintf(stderr, fmt, ap);
    va_end(ap);
    fprintf(stderr, "\n");
}

void *ce_fopen(void *path, void *mode)
{
    return uw_file_fopen((const char *)path, (const char *)mode);
}

int ce_fscanf(void *f, const char *fmt, ...)
{
    if (f == 0 || fmt == 0) return -1;
    va_list ap;
    va_start(ap, fmt);
    int r = vfscanf((FILE *)f, fmt, ap);
    va_end(ap);
    return r;
}

int ce_fclose(void *f)
{
    if (f == 0) return 0;
    return fclose((FILE *)f);
}

/* Zeroing allocator, called as ce_calloc(elem_size, count) at every
   site (e.g. the .tr texture loader's offset table, load_texture_arena). Was a
   no-op stub that returned NULL -> report_fatal_error_and_exit(0x1008) fatal the moment
   the texture files actually started loading. */
void *ce_calloc(elem_size, count)
unsigned int elem_size;
unsigned int count;
{
    if (elem_size == 0) elem_size = 1;
    if (count == 0) count = 1;
    return calloc(count, elem_size);
}

/* MSVCRT `strrchr(str, c)` -- find the LAST occurrence of character `c`
   in `str`, or NULL if absent. Was an unconditional `return 0;` stub
   (same dead-stub class as ce_strncpy/_strupr before they were
   fixed) -- most callers (message_scroll_print_wrapped's word-wrap)
   already defensively fall back on a NULL result, masking the stub
   there. open_level_archive's use has no such fallback: it calls this
   to find the last '\' in a level-archive path so it can replace the
   filename with "_arc.tmp" for its read-modify-write temp file, and a
   permanently-NULL result makes it truncate to an EMPTY prefix instead
   -- so the archive's own temp file for level-state writes ends up
   created at the data root ("_arc.tmp") instead of inside the save
   slot ("\SAVE0\_arc.tmp"), and \SAVE0\lev.ark itself never actually
   gets the current live level state written into it. Confirmed via a
   real save attempt: a stale, permanently-empty data/_arc.tmp sat there
   untouched while \SAVE0\lev.ark's content never changed no matter what
   the player did. */
long ce_strrchr(str, c)
char *str;
int c;
{
    char *p;
    char *last = 0;
    if (str == 0) return 0;
    for (p = str; ; p++) {
        if (*p == (char)c) last = p;
        if (*p == '\0') break;
    }
    return (long)last;
}

long _strlwr()
{
    return 0;
}

/* MSVCRT `_strupr(str)` -- uppercase a string in place, return the same
 * pointer. Sits right before _isctype (`_isctype`), matching
 * MSVCRT's own clustering of case/character-type functions. Confirmed
 * by its one already-argument-correct call site (FUN_0007002c's
 * "chant the mantra" puzzle: uppercases the player's typed word and a
 * looked-up mantra-list string before comparing them with strcmp, a
 * classic case-insensitive-match idiom) and by its 2 dropped-argument
 * call sites in the stats panel (draw_stats_panel_header's player title,
 * draw_stats_panel_skill_row's skill names) -- both were calling this with zero
 * explicit arguments, relying on the K&R leftover-register idiom used
 * throughout this codebase, which doesn't reliably carry the
 * just-returned get_message_string() string pointer through on this
 * recompile; fixed at those call sites to pass it explicitly. Was a
 * no-op stub returning 0, so every string passed through it vanished
 * (drawn as a NULL pointer) -- confirmed as the cause of the player's
 * title and every skill name never displaying on the stats panel. */
long _strupr(str)
char *str;
{
    char *p;
    if (str == 0) return 0;
    for (p = str; *p != '\0'; p++) {
        *p = (char)toupper((unsigned char)*p);
    }
    return (long)str;
}

/* MSVCRT-style `_isctype(c, mask)` character classification helper --
 * every call site ORs together the standard CRT _ctype.h bit values as
 * its mask (_UPPER=1, _LOWER=2, _DIGIT=4, _SPACE=8, _PUNCT=0x10,
 * _CONTROL=0x20, _BLANK=0x40, _HEX=0x80, _ALPHA=0x103) and checks the
 * result against 0, e.g. wait_for_chargen_field_input's name-entry field tests
 * `_isctype(ch, 0x157)` (_ALPHA|_DIGIT|_PUNCT|_BLANK, i.e. "any
 * typeable name character") to decide whether to append a typed
 * character to the name buffer. A prior no-op stub (`return 0`) made
 * that test always fail, so no character was ever considered valid --
 * every keystroke fell through to backspace-only handling, the name
 * buffer stayed permanently empty, and Enter's "buffer non-empty" exit
 * condition could never be satisfied, hanging the whole name-entry
 * screen (confirmed as the cause of character creation getting stuck
 * indefinitely at "Enter your name"). */
long _isctype(c, mask)
int c;
int mask;
{
    unsigned char ch = (unsigned char)c;
    int flags = 0;
    if ((ch >= 'A') && (ch <= 'Z')) flags |= 0x1;
    if ((ch >= 'a') && (ch <= 'z')) flags |= 0x2;
    if ((ch >= '0') && (ch <= '9')) flags |= 0x4;
    if (isspace(ch)) flags |= 0x8;
    if (ispunct(ch)) flags |= 0x10;
    if (iscntrl(ch)) flags |= 0x20;
    if ((ch == ' ') || (ch == '\t')) flags |= 0x40;
    if (isxdigit(ch)) flags |= 0x80;
    if (isalpha(ch)) flags |= 0x100;
    return flags & mask;
}

/* ARM has no hardware integer divide, so the original WinCE/ARM compiler
 * routed every `/` and `%` in the whole game through this shared runtime
 * division helper -- it's called ~250 places across uw.c. Per AAPCS32's
 * div/mod helper convention, it returns the quotient in r0 while the
 * remainder comes back in r1; Ghidra surfaced reads of that second
 * value as the `extraout_r1` idiom at call sites that wanted the
 * remainder instead of (or in addition to) the quotient. A prior no-op
 * stub (`return 0`) silently zeroed every division result in the game
 * and left `extraout_r1` reads pointing at genuinely uninitialized
 * memory -- confirmed as the cause of a SIGSEGV in itoa_radix indexing
 * a hex-digit table with garbage, and (once the quotient itself was
 * fixed) a whole further class of call sites still silently reading
 * garbage for the remainder half alone, fixed one at a time over the
 * course of this session.
 *
 * Returns both halves as a real struct instead of just the quotient --
 * there's no portable way for a normal C function to also hand back a
 * second value through "whatever happened to be in r1", so every call
 * site that wants the remainder (or both) now gets it by name off this
 * struct instead of reading a second return value that was never
 * really there. K&R-declared (matching the project's established
 * ce_strlen-style pattern) so call sites that only pass one argument --
 * relying on the original ABI's register-content-reuse from a
 * preceding computation -- still compile and get *a* value for the
 * unfilled parameter, exactly like the rest of this codebase's
 * "dropped argument" idiom; that idiom is about the arguments, not
 * this return type, so it's unaffected by the switch to a struct. */
divmod_result ordint_divmod(divisor, dividend)
int divisor;
int dividend;
{
    divmod_result result;
    if (divisor == 0) {
        result.quot = 0;
        result.rem = 0;
        return result;
    }
    result.quot = dividend / divisor;
    result.rem = dividend % divisor;
    return result;
}

/* Unsigned sibling of ordint_divmod (Ordinal_2005) -- this is Ordinal_2008,
 * misidentified in an earlier pass as "ordfloat_double_mul" (float
 * multiply) from thin, as it turns out nonexistent, audio.c-adjacent
 * evidence. Every real call site (babl.c's game-time/day/minute
 * breakdown, player.c's XP display/level-threshold scaling, automap.c's
 * archive-byte-count -> note-count conversion, visibility.c's frame-
 * rate calc, registration.c's random-bounded build number -- which
 * explicitly reads the remainder back via the same extraout_r1 idiom
 * ordint_divmod's own comment documents) is unmistakably
 * (divisor, dividend) -> dividend/divisor, exactly ordint_divmod's own
 * shape, just unsigned -- matching AAPCS32's separate
 * __aeabi_uidivmod/__aeabi_idivmod helper pair. Shares ordint_divmod's
 * divmod_result return for the same reason (see that function's own
 * comment): a real second return value can't be read back any other
 * way than naming it off a struct. A prior no-op stub (`return 0`)
 * silently zeroed every one of these too. */
divmod_result orduint_divmod(divisor, dividend)
unsigned int divisor;
unsigned int dividend;
{
    divmod_result result;
    if (divisor == 0) {
        result.quot = 0;
        result.rem = 0;
        return result;
    }
    result.quot = (int)(dividend / divisor);
    result.rem = (int)(dividend % divisor);
    return result;
}

static float ordfloat_bits_to_float(unsigned int bits);
static unsigned int ordfloat_float_to_bits(float f);

/* Softfloat single-precision SUBTRACT: a - b (IEEE-754 bit patterns in,
   bit pattern out). Was a no-op stub, which zeroed every subtraction in
   the 3D vertex-clip / projection math (near_clip_visible_tiles &c). Sibling of the
   already-real ordfloat_mul (multiply) / ordfloat_int_to_float2 (int->float). */
long ordfloat_sub(a, b)
unsigned int a;
unsigned int b;
{
    return (long)ordfloat_float_to_bits(ordfloat_bits_to_float(a) - ordfloat_bits_to_float(b));
}

long ordfloat_double_binop()
{
    return 0;
}

/* ARM/WinCE softfloat helper ABI: floats travel as raw IEEE-754 bit
 * patterns through plain integer registers/params (no hardware FPU on
 * the original target). ordfloat_int_to_float2/2026/2020/2018 are the int<->float
 * conversion and multiply primitives used throughout the game's palette
 * gamma correction and (likely) 3D math; they were previously no-op
 * stubs, which silently zeroed every value that passed through them
 * (e.g. the whole RGB565 palette LUT stayed all-black, since every
 * channel's gamma-corrected value came out 0 regardless of input). */
static float ordfloat_bits_to_float(unsigned int bits)
{
    float f;
    memcpy(&f, &bits, sizeof(f));
    return f;
}

static unsigned int ordfloat_float_to_bits(float f)
{
    unsigned int bits;
    memcpy(&bits, &f, sizeof(bits));
    return bits;
}

/* Called with NO explicit argument at every use site in uw.c -- Ghidra
 * dropped the parameter because it's just the return-register value
 * chained straight from the preceding ordfloat_mul/2032 call (the same
 * "K&R drops a register-reused argument" pattern already fixed
 * elsewhere in this codebase, e.g. ce_strlen's strlen argument).
 * Declaring one K&R parameter here lets the calling convention pick it
 * up from the register the prior call's return value is still sitting
 * in. No call site distinguishes its rounding behavior from
 * ordfloat_uint_to_float's, so implemented identically until proven otherwise. */
long ordfloat_int_to_float(x)
unsigned int x;
{
    return (long)ordfloat_bits_to_float(x);
}

long ordfloat_uint_to_float(x)
unsigned int x;
{
    return (long)ordfloat_bits_to_float(x);
}

/* Softfloat float -> double: single-precision bit pattern in the
   first-arg register (chained), returns the double bit pattern. Was a
   return-0 stub -- part of build_trig_tables's sin/cos table build. */
long ordfloat_float_to_double(x)
unsigned long long x;
{
    unsigned int fbits = (unsigned int)x;
    float f;
    double d;
    memcpy(&f, &fbits, 4);
    d = (double)f;
    memcpy(&x, &d, 8);
    return (long)x;
}

/* Softfloat single-precision NEGATE: -x. Called both with an explicit
   arg and no-arg (chained). build_view_matrix uses it for a view matrix's
   translation column (-camera_pos) and the -sin entries of its rotation
   blocks; it also appears in the sprite/billboard transform. Was a
   return-0 stub -> the view matrix had zero rotation and zero
   translation, so every transformed vertex collapsed to the origin. */
long ordfloat_negate(x)
unsigned int x;
{
    float f;
    memcpy(&f, &x, 4);
    f = -f;
    memcpy(&x, &f, 4);
    return (long)x;
}

long ordfloat_mul(a, b)
unsigned int a;
unsigned int b;
{
    return (long)ordfloat_float_to_bits(ordfloat_bits_to_float(a) * ordfloat_bits_to_float(b));
}

/* Softfloat double MULTIPLY: a * b, each passed as a lo/hi int pair.
   build_trig_tables multiplies (double)degrees by the constant
   0x3f91df45a50de271 == PI/180. Was a return-0 stub. */
long ordfloat_double_mul2(alo, ahi, blo, bhi)
unsigned int alo;
unsigned int ahi;
unsigned int blo;
unsigned int bhi;
{
    unsigned long long ab = (unsigned long long)alo | ((unsigned long long)ahi << 32);
    unsigned long long bb = (unsigned long long)blo | ((unsigned long long)bhi << 32);
    double a, b, r;
    memcpy(&a, &ab, 8);
    memcpy(&b, &bb, 8);
    r = a * b;
    memcpy(&ab, &r, 8);
    return (long)ab;
}

/* Softfloat single-precision COMPARE: returns 1 when a <  b, else 0.
   Paired with 2030 (<=), 2036 (>), 2038 (>=) -- inferred from the
   viewport-cull tests in raster_triangle (all verts left of x0 -> cull uses
   2028; all verts right of x1 -> cull uses 2036). Earlier no-op stub made
   every triangle survive culling with degenerate edges. */
long ordfloat_lt(a, b)
unsigned int a;
unsigned int b;
{
    return ordfloat_bits_to_float(a) < ordfloat_bits_to_float(b) ? 1 : 0;
}

/* Softfloat single-precision COMPARE: returns 1 when a <= b, else 0. */
long ordfloat_le(a, b)
unsigned int a;
unsigned int b;
{
    return ordfloat_bits_to_float(a) <= ordfloat_bits_to_float(b) ? 1 : 0;
}

long ordfloat_int_to_float2(x)
int x;
{
    return (long)ordfloat_float_to_bits((float)x);
}

long ordfloat_double_from_int()
{
    return 0;
}

/* Softfloat single-precision COMPARE: returns 1 when a >  b, else 0. */
long ordfloat_gt(a, b)
unsigned int a;
unsigned int b;
{
    return ordfloat_bits_to_float(a) > ordfloat_bits_to_float(b) ? 1 : 0;
}

/* Softfloat single-precision COMPARE for the 3D near-plane clip test:
   returns 1 when a >= b, else 0. Call sites read it as
   `if (ordfloat_ge(vertex_z, near_plane) == 0) { ...clip... }`. Was a
   no-op stub (always "clip"), so every vertex was treated as behind the
   near plane -> no visible geometry survived. */
long ordfloat_ge(a, b)
unsigned int a;
unsigned int b;
{
    return ordfloat_bits_to_float(a) >= ordfloat_bits_to_float(b) ? 1 : 0;
}

/* Softfloat double -> float: double bit pattern in the first-arg
   register (chained), returns the single-precision bit pattern. Was a
   return-0 stub -- the final step feeding DAT_000d9ed8 / DAT_000d9930. */
long ordfloat_double_to_float(x)
unsigned long long x;
{
    double d;
    float f;
    unsigned int r;
    memcpy(&d, &x, 8);
    f = (float)d;
    memcpy(&r, &f, 4);
    return (long)r;
}

long ordfloat_double_result()
{
    return 0;
}

/* Softfloat single-precision DIVIDE: a / b. Used for the near-plane
   clip interpolation factor ((near - z0) / (z1 - z0)) in near_clip_visible_tiles.
   Was a no-op stub. */
long ordfloat_div(a, b)
unsigned int a;
unsigned int b;
{
    float fb = ordfloat_bits_to_float(b);
    if (fb == 0.0f) return 0;
    return (long)ordfloat_float_to_bits(ordfloat_bits_to_float(a) / fb);
}

long ordfloat_double_binop2()
{
    return 0;
}

/* Softfloat single-precision ADD: a + b. The workhorse of the 3D
   matrix-multiply / vertex-transform math (project_verts_through_view_matrix, translate_verts_to_camera_space,
   near_clip_visible_tiles). Was a no-op stub -> every transformed vertex came out
   0 -> nothing to draw. */
long ordfloat_add(a, b)
unsigned int a;
unsigned int b;
{
    return (long)ordfloat_float_to_bits(ordfloat_bits_to_float(a) + ordfloat_bits_to_float(b));
}

long ordfloat_double_op3()
{
    return 0;
}

long ordaudio_op_2063()
{
    return 0;
}

long ordaudio_op_2135()
{
    return 0;
}

long ordaudio_op_2142()
{
    return 0;
}

long ordaudio_op_2304()
{
    return 0;
}

long ordaudio_op_2413()
{
    return 0;
}

long ordaudio_op_2582()
{
    return 0;
}

long ordaudio_op_2588()
{
    return 0;
}
