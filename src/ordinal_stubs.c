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

long EnterCriticalSection(param_1,param_2,param_3,param_4)
long param_1;
long param_2;
long param_3;
long param_4;
{
    return 0;
}

long GetSystemTime(param_1)
long param_1;
{
    return 0;
}

long LocalAlloc(param_1,param_2)
long param_1;
long param_2;
{
    return 0;
}

long LocalReAlloc(param_1,param_2,param_3)
long param_1;
long param_2;
long param_3;
{
    return 0;
}

long LocalSize(param_1)
long param_1;
{
    return 0;
}

long RemoteLocalReAlloc(param_1,param_2,param_3,param_4,param_5)
long param_1;
long param_2;
long param_3;
long param_4;
long param_5;
{
    return 0;
}

long HeapReAlloc(param_1)
long param_1;
{
    return 0;
}

long ce_wcscat()
{
    return 0;
}

/* Wide-string copy-shaped call (identity inferred from call sites). Receives (destination, source)
   after FUN_0002295c converts a game path; used to fill source/destination buffers for the new-game
   archive copy. */
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

/* SystemParametersInfo-shaped call (action=0x102=SPI_GETOEMINFO at its only call site). */
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

long RegisterClassW(param_1)
long param_1;
{
    return 0;
}

long CopyRect(param_1)
long param_1;
{
    return 0;
}

long CreateDirectoryW(param_1,param_2)
long param_1;
long param_2;
{
    return 0;
}

long RemoveDirectoryW()
{
    return 0;
}

/* CopyFileW-shaped call (source path, destination path, fail-if-exists). Used to seed SAVE0\lev.ark
   from DATA\lev.ark for a new game, and by older save-slot copy paths. The native conversion
   adapters retain ANSI paths; uw_file_copy resolves them against UW_DATA_DIR and copies bytes. */
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

/* uw.c is riddled with call sites that pass a real pointer through an `undefined4`/`int`-typed
   local (this file's single most common bug class -- truncates to 32 bits on this 64-bit build),
   and both of these ordinals used to be no-op stubs that never dereferenced their arguments... */
static int looks_like_real_pointer(const void *p)
{
    return (uintptr_t)p >= 0x10000;
}

/* CreateDirectory-shaped. */
long create_directory_path(void *path_ptr)
{
    if (!looks_like_real_pointer(path_ptr)) return 0;
    return uw_ensure_directory((const char *)path_ptr) ? 1 : 0;
}

/* FindFirstFile-shaped. */
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

long CreateFileW(param_1,param_2,param_3,param_4,param_5,param_6,param_7)
long param_1;
long param_2;
long param_3;
long param_4;
long param_5;
long param_6;
long param_7;
{
    return 0;
}

long ReadFile(param_1,param_2,param_3,param_4,param_5)
long param_1;
long param_2;
long param_3;
long param_4;
long param_5;
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

long SetFileTime(param_1,param_2)
long param_1;
long param_2;
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

/* MultiByteToWideChar-shaped call (API identity inferred from arguments). FUN_0002295c passes (0,
   2, ANSI path, -1, output buffer, 0xff) to prepare a path for WinCE file APIs. This native port
   retains ANSI bytes because its file API adapters accept narrow paths, rather than UTF-16. */
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

long WideCharToMultiByte(param_1,param_2,param_3,param_4,param_5,param_6,param_7,param_8)
long param_1;
long param_2;
long param_3;
long param_4;
long param_5;
long param_6;
long param_7;
long param_8;
{
    return 0;
}

long GetUserDefaultLangID(param_1)
long param_1;
{
    return 0;
}

long FoldStringW(param_1)
long param_1;
{
    return 0;
}

/* UTF-16 string-equality check; the only call site compares SystemParametersInfoW's SPI_GETOEMINFO
   string against a fixed device name (see SystemParametersInfoW's comment). wcscmp isn't used here
   because macOS wchar_t is 4 bytes, not the 2-byte UTF-16 units this game's strings use. */
long _wcsicmp(a, b)
unsigned short *a;
unsigned short *b;
{
    while (*a && *b && *a == *b) { a++; b++; }
    return *a == *b;
}

long CloseAllFileHandles(param_1)
long param_1;
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

long ShowWindow(param_1,param_2)
long param_1;
long param_2;
{
    return 0;
}

long UpdateWindow(param_1)
long param_1;
{
    return 0;
}

int FindWindowW(void *a, void *b)
{
    (void)a; (void)b;
    fprintf(stderr, "[ordinal] FindWindowW: single-instance check, reporting no existing instance\n");
    return 0; /* no existing instance / success */
}

long BatteryDrvrGetLevels(param_1)
long param_1;
{
    return 0;
}

long CeReadRecordProps(param_1,param_2)
long param_1;
long param_2;
{
    return 0;
}

long waveOutClose()
{
    return 0;
}

long waveOutPrepareHeader(param_1,param_2,param_3)
long param_1;
long param_2;
long param_3;
{
    return 0;
}

long waveOutUnprepareHeader(param_1,param_2,param_3)
long param_1;
long param_2;
long param_3;
{
    return 0;
}

long waveOutWrite(param_1,param_2,param_3)
long param_1;
long param_2;
long param_3;
{
    return 0;
}

long waveOutReset()
{
    return 0;
}

long waveOutOpen(param_1,param_2,param_3,param_4,param_5,param_6)
long param_1;
long param_2;
long param_3;
long param_4;
long param_5;
long param_6;
{
    return 0;
}

long RegCloseKey(param_1)
long param_1;
{
    return 0;
}

long RegCreateKeyExW(param_1,param_2,param_3,param_4,param_5,param_6,param_7,param_8,param_9)
long param_1;
long param_2;
long param_3;
long param_4;
long param_5;
long param_6;
long param_7;
long param_8;
long param_9;
{
    return 0;
}

int RegOpenKeyExW(unsigned int hkey, void *subkey, unsigned int reserved, void *result)
{
    (void)hkey; (void)subkey; (void)reserved; (void)result;
    fprintf(stderr, "[ordinal] RegOpenKeyExW: RegOpenKeyEx-shaped call, reporting success so the game takes its safe bounded-copy path instead of a hardcoded-offset fallback that segfaults when recompiled\n");
    return 0;
}

long RegQueryValueExW(param_1,param_2,param_3,param_4,param_5,param_6)
long param_1;
long param_2;
long param_3;
long param_4;
long param_5;
long param_6;
{
    return 0;
}

long RegSetValueExW(param_1,param_2,param_3,param_4,param_5,param_6)
long param_1;
long param_2;
long param_3;
long param_4;
long param_5;
long param_6;
{
    return 0;
}

/* Sleep-shaped: real elapsed-ms delay. Was a hardcoded no-op, so every `Sleep(ms)` call across the
   game -- e.g. the splash-screen sequence's 1.5s dwell between each image
   (run_game_startup_sequence) and app_main_loop's own startup 2000ms pause -- did nothing at all. */
long Sleep(unsigned int ms)
{
    DEBUG(TRACE, "[sleep] Sleep requested ms=%u", ms);
    /* UW_FAST_SLEEP: debug-only switch to skip the real delay below (splash dwells, app_main_loop's
       startup pause, etc. otherwise add up to real wall-clock seconds every run) so
       automated/demo-driven test runs reach gameplay quickly. */
    static int fast = -1;
    if (fast < 0) {
        fast = getenv("UW_FAST_SLEEP") != NULL;
    }
    if (fast) {
        SDL_PumpEvents();
        return 0;
    }
    /* HACK: a single long SDL_Delay(ms) blocks this thread for the whole duration without ever
       pumping SDL's event queue, which on macOS (and likely other platforms) stops the window from
       actually compositing/repainting whatever was just SDL_RenderPresent()'d... */
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

long FindResourceW(param_1,param_2,param_3)
long param_1;
long param_2;
long param_3;
{
    return 0;
}

long LoadResource(param_1)
long param_1;
{
    return 0;
}

/* GetTickCount-shaped: real elapsed milliseconds since startup. */
long GetTickCount()
{
    return (long)SDL_GetTicks();
}

/* CloseHandle-shaped file-close, used ~49 times across uw.c (e.g. read_buffer_from_file closes
   every file it opens through this). */
long CloseHandle(handle)
int handle;
{
    return uw_file_close(handle);
}

long GetDlgItemTextW(param_1,param_2,param_3,param_4)
long param_1;
long param_2;
long param_3;
long param_4;
{
    return 0;
}

long DialogBoxIndirectParamW()
{
    return 0;
}

long EndDialog(param_1,param_2)
long param_1;
long param_2;
{
    return 0;
}

long SetForegroundWindow(param_1)
long param_1;
{
    return 0;
}

long ce_sprintf()
{
    return 0;
}

long MessageBoxW(param_1,param_2)
long param_1;
long param_2;
{
    return 0;
}

long DispatchMessageW(param_1)
long param_1;
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
    /* Originally always returned 0 ("never a message pending") on the assumption that every caller
       only branches on the message contents when this is nonzero and that driving input via
       DAT_0023c448 directly was independent of that. */
    return (DAT_0023c448 != 0) || uw_take_mouse_event_pending();
}

long PostQuitMessage(param_1)
long param_1;
{
    return 0;
}

/* Real coredll ordinal: PostMessage(hwnd, msg, wParam, lParam). */
int PostMessageW(void *hwnd, unsigned int msg, unsigned int wparam, int lparam)
{
    return (int)handle_keyboard_message(hwnd, msg, wparam);
}

long TranslateMessage(param_1)
long param_1;
{
    return 0;
}

long GetSystemMetrics(param_1)
long param_1;
{
    return 0;
}

long DeleteObject(param_1)
long param_1;
{
    return 0;
}

long GetStockObject(param_1)
long param_1;
{
    return 0;
}

long ce_atoi(param_1)
long param_1;
{
    return 0;
}

/* cos(x): x is a double bit-pattern arriving in the return/first-arg register (chained from
   ordfloat_float_to_double in build_trig_tables, which builds the renderer's per-degree cos table
   DAT_000d9ed8). */
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
    /* deliberately a leak, not free(ptr): several call sites have no argument expression at all
       (Ghidra dropped it), so ptr may be garbage -- freeing it would be a likely crash. Leaking for
       the life of this short-lived stub process is harmless. */
    (void)ptr;
}

long _itoa(param_1,param_2,param_3)
long param_1;
long param_2;
long param_3;
{
    return 0;
}

long ordfloat_log()
{
    return 0;
}

long _ltoa(param_1,param_2,param_3)
long param_1;
long param_2;
long param_3;
{
    return 0;
}

void *ce_malloc(size)
unsigned int size;
{
    /* Was plain malloc -- real WinCE code allocating a small tracking record and never explicitly
       zeroing it (e.g. open_backpack_container's 12-byte container-tracking record, which reads its
       own byte offset 8 in a masked read-modify-write without ever writing it first)... */
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

/* COREDLL ordinal 1053 = rand(). Was stubbed to always return 0, which silently killed every
   randomized effect in the game -- e.g. the automap water/lava fill collapsed from its intended
   2-/3-tone dither to a flat single color. */
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

long ce_srand(param_1)
long param_1;
{
    return 0;
}

/* strcat: appends src to the NUL-terminated string in dest and returns dest. Used to assemble
   game/save paths from an install-directory prefix and suffixes such as \DATA\lev.ark and \SAVE0.
   Does not check capacity; both arguments must be valid strings. Null arguments skip the append. */
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

/* MSVCRT `strncpy(dest, src, n)` -- sits right after strcmp(1065)/ strlen(1068)/strncmp(1070) in
   the ordinal table, matching that sequential string-function grouping. */
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

long ce_strstr(param_1,param_2)
long param_1;
long param_2;
{
    return 0;
}

/* Windows CE keyboard-translation ordinal (likely a VK-code-to-character case transform, given its
   sibling ce_toupper and their shared call site at uw.c ~50479)... */
long ce_tolower(param_1)
long param_1;
{
    return param_1;
}

/* Sibling of ce_tolower just above -- same fix, same reasoning. */
long ce_toupper(param_1)
long param_1;
{
    return param_1;
}

/* Was, and stays, a hardcoded no-op always returning 0 (NULL) -- every single call site (the
   MOD-tracker music engine's buffer/pattern/ instrument allocators in audio.c)... */
long cpp_operator_delete(param_1)
long param_1;
{
    return 0;
}

long cpp_operator_new(param_1)
long param_1;
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

/* Zeroing allocator, called as ce_calloc(elem_size, count) at every site (e.g. the .tr texture
   loader's offset table, load_texture_arena). Was a no-op stub that returned NULL ->
   report_fatal_error_and_exit(0x1008) fatal the moment the texture files actually started loading. */
void *ce_calloc(elem_size, count)
unsigned int elem_size;
unsigned int count;
{
    if (elem_size == 0) elem_size = 1;
    if (count == 0) count = 1;
    return calloc(count, elem_size);
}

/* MSVCRT `strrchr(str, c)` -- find the LAST occurrence of character `c` in `str`, or NULL if
   absent. */
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

long _strlwr(param_1)
long param_1;
{
    return 0;
}

/* MSVCRT `_strupr(str)` -- uppercase a string in place, return the same pointer. Sits right before
   _isctype (`_isctype`), matching MSVCRT's own clustering of case/character-type functions. */
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

/* MSVCRT-style `_isctype(c, mask)` character classification helper -- every call site ORs together
   the standard CRT _ctype.h bit values as its mask... */
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

/* ARM has no hardware integer divide, so the original WinCE/ARM compiler routed every `/` and `%`
   in the whole game through this shared runtime division helper -- it's called ~250 places across
   uw.c. */
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

/* Unsigned sibling of ordint_divmod (Ordinal_2005) -- this is Ordinal_2008, misidentified in an
   earlier pass as "ordfloat_double_mul" (float multiply) from thin, as it turns out nonexistent,
   audio.c-adjacent evidence. */
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

/* Softfloat single-precision SUBTRACT: a - b (IEEE-754 bit patterns in, bit pattern out). Was a
   no-op stub, which zeroed every subtraction in the 3D vertex-clip / projection math
   (near_clip_visible_tiles &c). */
long ordfloat_sub(a, b)
unsigned int a;
unsigned int b;
{
    return (long)ordfloat_float_to_bits(ordfloat_bits_to_float(a) - ordfloat_bits_to_float(b));
}

long ordfloat_double_binop(param_1,param_2,param_3,param_4)
long param_1;
long param_2;
long param_3;
long param_4;
{
    return 0;
}

/* ARM/WinCE softfloat helper ABI: floats travel as raw IEEE-754 bit patterns through plain integer
   registers/params (no hardware FPU on the original target). ordfloat_int_to_float2/2026/2020/2018
   are the int<->float conversion and multiply primitives used throughout the game's palette... */
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

/* Called with NO explicit argument at every use site in uw.c -- Ghidra dropped the parameter
   because it's just the return-register value chained straight from the preceding ordfloat_mul/2032
   call... */
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

/* Softfloat single-precision NEGATE: -x. Called both with an explicit arg and no-arg (chained).
   build_view_matrix uses it for a view matrix's translation column (-camera_pos) and the -sin
   entries of its rotation blocks; it also appears in the sprite/billboard transform. */
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

/* Softfloat single-precision COMPARE: returns 1 when a < b, else 0. Paired with 2030 (<=), 2036
   (>), 2038 (>=) -- inferred from the viewport-cull tests in raster_triangle (all verts left of x0
   -> cull uses 2028; all verts right of x1 -> cull uses 2036). */
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

long ordfloat_double_from_int(param_1)
long param_1;
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

/* Softfloat single-precision COMPARE for the 3D near-plane clip test: returns 1 when a >= b, else
   0. Call sites read it as `if (ordfloat_ge(vertex_z, near_plane) == 0) { ...clip... }`. */
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

long ordfloat_double_binop2(param_1,param_2,param_3,param_4)
long param_1;
long param_2;
long param_3;
long param_4;
{
    return 0;
}

/* Softfloat single-precision ADD: a + b. The workhorse of the 3D matrix-multiply / vertex-transform
   math (project_verts_through_view_matrix, translate_verts_to_camera_space,
   near_clip_visible_tiles). */
long ordfloat_add(a, b)
unsigned int a;
unsigned int b;
{
    return (long)ordfloat_float_to_bits(ordfloat_bits_to_float(a) + ordfloat_bits_to_float(b));
}

long ordfloat_double_op3(param_1,param_2,param_3,param_4)
long param_1;
long param_2;
long param_3;
long param_4;
{
    return 0;
}

long ordaudio_op_2063(param_1,param_2,param_3,param_4)
long param_1;
long param_2;
long param_3;
long param_4;
{
    return 0;
}

long ordaudio_op_2135()
{
    return 0;
}

long ordaudio_op_2142(param_1)
long param_1;
{
    return 0;
}

long ordaudio_op_2304(param_1,param_2,param_3)
long param_1;
long param_2;
long param_3;
{
    return 0;
}

long ordaudio_op_2413(param_1,param_2,param_3)
long param_1;
long param_2;
long param_3;
{
    return 0;
}

long ordaudio_op_2582()
{
    return 0;
}

long ordaudio_op_2588(param_1,param_2)
long param_1;
long param_2;
{
    return 0;
}
