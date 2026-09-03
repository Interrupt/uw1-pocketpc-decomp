#include "ordinal_stubs.h"
#include "file_io.h"
#include "debug.h"
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <SDL.h>

void uw_pump_events(void);
unsigned int FUN_00077b2c(void *param_1, unsigned int param_2, unsigned int param_3);
int uw_take_mouse_event_pending(void);

long Ordinal_4()
{
    return 0;
}

long Ordinal_25()
{
    return 0;
}

long Ordinal_33()
{
    return 0;
}

long Ordinal_34()
{
    return 0;
}

long Ordinal_35()
{
    return 0;
}

long Ordinal_38()
{
    return 0;
}

long Ordinal_47()
{
    return 0;
}

long Ordinal_58()
{
    return 0;
}

long Ordinal_61()
{
    return 0;
}

long Ordinal_63()
{
    return 0;
}

long Ordinal_80()
{
    return 0;
}

/* SystemParametersInfo-shaped call (action=0x102=SPI_GETOEMINFO at its
 * only call site). The caller uses the returned OEM string to decide
 * whether to run the "real" GAPI display-properties init path
 * (GXOpenInput + GXGetDisplayProperties, gated on Ordinal_230 matching
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

long Ordinal_89(action, cb, buf, fWinIni)
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

long Ordinal_95()
{
    return 0;
}

long Ordinal_97()
{
    return 0;
}

long Ordinal_160()
{
    return 0;
}

long Ordinal_161()
{
    return 0;
}

long Ordinal_164()
{
    return 0;
}

long Ordinal_165()
{
    return 0;
}

long Ordinal_167()
{
    return 0;
}

long Ordinal_168()
{
    return 0;
}

long Ordinal_170()
{
    return 0;
}

long Ordinal_171()
{
    return 0;
}

long Ordinal_172()
{
    return 0;
}

long Ordinal_173()
{
    return 0;
}

long Ordinal_177()
{
    return 0;
}

long Ordinal_181()
{
    return 0;
}

int Ordinal_184(void *path, unsigned int flags, void *out_struct, unsigned int *out_free_lo)
{
    (void)path; (void)flags; (void)out_struct;
    if (out_free_lo) *out_free_lo = 0x7fffffff;
    return 1;
}

long Ordinal_196()
{
    return 0;
}

long Ordinal_197()
{
    return 0;
}

long Ordinal_212()
{
    return 0;
}

long Ordinal_218()
{
    return 0;
}

/* UTF-16 string-equality check; the only call site compares Ordinal_89's
 * SPI_GETOEMINFO string against a fixed device name (see Ordinal_89's
 * comment). wcscmp isn't used here because macOS wchar_t is 4 bytes,
 * not the 2-byte UTF-16 units this game's strings use. */
long Ordinal_230(a, b)
unsigned short *a;
unsigned short *b;
{
    while (*a && *b && *a == *b) { a++; b++; }
    return *a == *b;
}

long Ordinal_242()
{
    return 0;
}

void *Ordinal_246(void *a, void *b, void *c, unsigned int d)
{
    (void)a; (void)b; (void)c; (void)d;
    fprintf(stderr, "[ordinal] Ordinal_246: CreateWindow-shaped call, returning a fake non-null HWND (real window comes from GXOpenDisplay)\n");
    return (void *)1; /* fake non-null HWND */
}

long Ordinal_264()
{
    return 0;
}

long Ordinal_266()
{
    return 0;
}

long Ordinal_267()
{
    return 0;
}

int Ordinal_286(void *a, void *b)
{
    (void)a; (void)b;
    fprintf(stderr, "[ordinal] Ordinal_286: single-instance check, reporting no existing instance\n");
    return 0; /* no existing instance / success */
}

long Ordinal_297()
{
    return 0;
}

long Ordinal_321()
{
    return 0;
}

long Ordinal_384()
{
    return 0;
}

long Ordinal_385()
{
    return 0;
}

long Ordinal_386()
{
    return 0;
}

long Ordinal_387()
{
    return 0;
}

long Ordinal_390()
{
    return 0;
}

long Ordinal_399()
{
    return 0;
}

long Ordinal_455()
{
    return 0;
}

long Ordinal_456()
{
    return 0;
}

int Ordinal_461(unsigned int hkey, void *subkey, unsigned int reserved, void *result)
{
    (void)hkey; (void)subkey; (void)reserved; (void)result;
    fprintf(stderr, "[ordinal] Ordinal_461: RegOpenKeyEx-shaped call, reporting success so the game takes its safe bounded-copy path instead of a hardcoded-offset fallback that segfaults when recompiled\n");
    return 0;
}

long Ordinal_463()
{
    return 0;
}

long Ordinal_464()
{
    return 0;
}

/* Sleep-shaped: real elapsed-ms delay. Was a hardcoded no-op, so every
 * `Ordinal_496(ms)` call across the game -- e.g. the splash-screen
 * sequence's 1.5s dwell between each image (FUN_0003b820) and
 * app_main_loop's own startup 2000ms pause -- did nothing at all.
 * Confirmed as the real cause of splash images blitting past instantly
 * ("flashes") instead of actually being shown for a moment: this stub,
 * not a missing fade, same root-cause class as Ordinal_535 (GetTickCount)
 * being a hardcoded 0 earlier this session. */
long Ordinal_496(unsigned int ms)
{
    DEBUG(TRACE, "[sleep] Ordinal_496 requested ms=%u", ms);
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

long Ordinal_516()
{
    return 0;
}

long Ordinal_532()
{
    return 0;
}

long Ordinal_533()
{
    return 0;
}

/* GetTickCount-shaped: real elapsed milliseconds since startup. Was a
 * hardcoded 0, meaning every FUN_0002294c() (this file's Ordinal_535()
 * >> 2) call across the whole game always read "0 elapsed" -- silently
 * breaking every timing check built on it, not just the one that
 * exposed it (FUN_000122d4's fade-in-from-black transition measured
 * 0ms end to end with this stubbed out, confirming the fade logic
 * itself was intact and only the time source was missing). */
long Ordinal_535()
{
    return (long)SDL_GetTicks();
}

/* CloseHandle-shaped file-close, used ~49 times across uw.c (e.g.
 * FUN_0007ee4c closes every file it opens through this). Was a no-op,
 * so every file handle ever opened leaked -- harmless until a loop that
 * opens+"closes" a file every frame (e.g. the credits screen, reopening
 * CREDIT1/2/3.BYT once per tick while waiting for input) exhausted the
 * 64-slot handle table within a few seconds, after which *every*
 * subsequent file open in the whole game failed (including files
 * completely unrelated to the credits screen, like OPSCR.BYT/PALS.DAT
 * when returning to the options menu), triggering a fatal error exit. */
long Ordinal_553(handle)
int handle;
{
    return uw_file_close(handle);
}

long Ordinal_687()
{
    return 0;
}

long Ordinal_690()
{
    return 0;
}

long Ordinal_691()
{
    return 0;
}

long Ordinal_702()
{
    return 0;
}

long Ordinal_719()
{
    return 0;
}

long Ordinal_858()
{
    return 0;
}

long Ordinal_859()
{
    return 0;
}

/* DAT_0023c448 is uw.c's real "pending input event" flags word, set
 * directly by FUN_00077b2c() from uw_pump_events()'s real SDL key
 * events (not through a faked MSG struct). */
extern unsigned short DAT_0023c448;

int Ordinal_864(void *msg, void *hwndFilter, unsigned int wMsgFilterMin, unsigned int wMsgFilterMax, unsigned int wRemoveMsg)
{
    (void)msg; (void)hwndFilter; (void)wMsgFilterMin; (void)wMsgFilterMax; (void)wRemoveMsg;
    uw_pump_events();
    /* Originally always returned 0 ("never a message pending") on the
     * assumption that every caller only branches on the message
     * contents when this is nonzero and that driving input via
     * DAT_0023c448 directly was independent of that. That's wrong for
     * FUN_000579e4 (uw.c) -- the real keyboard-polling function used by
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
     * uw_pump_events (FUN_00077dd0 finishes with each one immediately),
     * leaving no "pending" state for DAT_0023c448 to hold the way
     * keyboard input does. Without also checking
     * uw_take_mouse_event_pending(), FUN_000579e4 never falls through to
     * poll_mouse_event()/update_mouse_state() for mouse-only activity
     * (no keyboard event pending at the same moment), so g_mouse_x/
     * g_mouse_y never track the real cursor and the game's own
     * registered-rect click hit-test (FUN_00057e54) never runs. Real
     * WinCE PeekMessage would report a pending message for either input
     * type, so check both here to match. */
    return (DAT_0023c448 != 0) || uw_take_mouse_event_pending();
}

long Ordinal_866()
{
    return 0;
}

/* Real coredll ordinal: PostMessage(hwnd, msg, wParam, lParam). Confirmed
 * via Ghidra headless disassembly -- this is the exact call the recovered
 * mouse handler (FUN_00077dd0 in uw.c) makes to re-dispatch a stylus tap
 * on the chargen on-screen keyboard as a synthetic WM_CHAR/WM_KEYDOWN.
 * This port never builds a real Win32 MSG queue (see Ordinal_864's
 * comment -- FUN_00077b2c is driven directly from DAT_0023c448), so
 * dispatch synchronously into the same handler real keyboard input
 * already reaches instead of queuing. */
int Ordinal_868(void *hwnd, unsigned int msg, unsigned int wparam, int lparam)
{
    return (int)FUN_00077b2c(hwnd, msg, wparam);
}

long Ordinal_870()
{
    return 0;
}

long Ordinal_885()
{
    return 0;
}

long Ordinal_912()
{
    return 0;
}

long Ordinal_919()
{
    return 0;
}

long Ordinal_993()
{
    return 0;
}

long Ordinal_1004()
{
    return 0;
}

void Ordinal_1018(ptr)
void *ptr;
{
    /* deliberately a leak, not free(ptr): several call sites
       have no argument expression at all (Ghidra dropped it),
       so ptr may be garbage -- freeing it would be a likely
       crash. Leaking for the life of this short-lived stub
       process is harmless. */
    (void)ptr;
}

long Ordinal_1025()
{
    return 0;
}

long Ordinal_1033()
{
    return 0;
}

long Ordinal_1039()
{
    return 0;
}

void *Ordinal_1041(size)
unsigned int size;
{
    if (size == 0 || size > (64u * 1024u * 1024u)) size = 4096;
    return malloc(size);
}

void *Ordinal_1044(dest, src, n)
void *dest;
void *src;
unsigned int n;
{
    if (dest == 0 || src == 0 || n == 0 || n > (64u * 1024u * 1024u)) return dest;
    memmove(dest, src, n);
    return dest;
}

void *Ordinal_1047(void *ptr, int val, unsigned int n)
{
    if (ptr) memset(ptr, val, n);
    return ptr;
}

long Ordinal_1053()
{
    return 0;
}

void *Ordinal_1054(void *ptr, unsigned int size)
{
    if (size == 0) return ptr;
    return realloc(ptr, size);
}

long Ordinal_1058()
{
    return 0;
}

long Ordinal_1061()
{
    return 0;
}

char *Ordinal_1063(dest, src)
char *dest;
char *src;
{
    if (dest && src) strcat(dest, src);
    return dest;
}

char *Ordinal_1064(const char *s, int c)
{
    if (s == 0) return 0;
    return strchr(s, c);
}

int Ordinal_1065(const char *a, const char *b)
{
    if (a == 0 || b == 0) return -1;
    return strcmp(a, b);
}

unsigned int Ordinal_1068(s)
const char *s;
{
    if (s == 0) return 0;
    return (unsigned int)strlen(s);
}

int Ordinal_1070(const char *a, const char *b, unsigned int n)
{
    if (a == 0 || b == 0) return -1;
    return strncmp(a, b, n);
}

long Ordinal_1071()
{
    return 0;
}

long Ordinal_1072()
{
    return 0;
}

long Ordinal_1090()
{
    return 0;
}

long Ordinal_1091()
{
    return 0;
}

long Ordinal_1094()
{
    return 0;
}

long Ordinal_1095()
{
    return 0;
}

void Ordinal_1102(const char *fmt, ...)
{
    if (fmt == 0) return;
    va_list ap;
    fprintf(stderr, "[game] ");
    va_start(ap, fmt);
    vfprintf(stderr, fmt, ap);
    va_end(ap);
    fprintf(stderr, "\n");
}

void *Ordinal_1113(void *path, void *mode)
{
    return uw_file_fopen((const char *)path, (const char *)mode);
}

int Ordinal_1114(void *f, const char *fmt, ...)
{
    if (f == 0 || fmt == 0) return -1;
    va_list ap;
    va_start(ap, fmt);
    int r = vfscanf((FILE *)f, fmt, ap);
    va_end(ap);
    return r;
}

int Ordinal_1118(void *f)
{
    if (f == 0) return 0;
    return fclose((FILE *)f);
}

long Ordinal_1346()
{
    return 0;
}

long Ordinal_1407()
{
    return 0;
}

long Ordinal_1415()
{
    return 0;
}

long Ordinal_1416()
{
    return 0;
}

/* MSVCRT-style `_isctype(c, mask)` character classification helper --
 * every call site ORs together the standard CRT _ctype.h bit values as
 * its mask (_UPPER=1, _LOWER=2, _DIGIT=4, _SPACE=8, _PUNCT=0x10,
 * _CONTROL=0x20, _BLANK=0x40, _HEX=0x80, _ALPHA=0x103) and checks the
 * result against 0, e.g. FUN_00024840's name-entry field tests
 * `Ordinal_1417(ch, 0x157)` (_ALPHA|_DIGIT|_PUNCT|_BLANK, i.e. "any
 * typeable name character") to decide whether to append a typed
 * character to the name buffer. A prior no-op stub (`return 0`) made
 * that test always fail, so no character was ever considered valid --
 * every keystroke fell through to backspace-only handling, the name
 * buffer stayed permanently empty, and Enter's "buffer non-empty" exit
 * condition could never be satisfied, hanging the whole name-entry
 * screen (confirmed as the cause of character creation getting stuck
 * indefinitely at "Enter your name"). */
long Ordinal_1417(c, mask)
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
 * div/mod helper convention, it returns the quotient in r0 (the normal
 * C return value here) while the remainder comes back in r1; Ghidra
 * surfaces reads of that second value as the `extraout_r1` idiom at call
 * sites that want the remainder instead of (or in addition to) the
 * quotient. A prior no-op stub (`return 0`) silently zeroed every
 * division result in the game and left `extraout_r1` reads pointing at
 * genuinely uninitialized memory -- confirmed as the cause of a SIGSEGV
 * in FUN_000229e0 indexing a hex-digit table with garbage. K&R-declared
 * (matching the project's established Ordinal_1068-style pattern) so
 * call sites that only pass one argument -- relying on the original
 * ABI's register-content-reuse from a preceding computation -- still
 * compile and get *a* value for the unfilled parameter, exactly like
 * the rest of this codebase's "dropped argument" idiom. */
long Ordinal_2005(divisor, dividend)
int divisor;
int dividend;
{
    if (divisor == 0) return 0;
    return dividend / divisor;
}

long Ordinal_2008()
{
    return 0;
}

long Ordinal_2015()
{
    return 0;
}

long Ordinal_2016()
{
    return 0;
}

/* ARM/WinCE softfloat helper ABI: floats travel as raw IEEE-754 bit
 * patterns through plain integer registers/params (no hardware FPU on
 * the original target). Ordinal_2032/2026/2020/2018 are the int<->float
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
 * chained straight from the preceding Ordinal_2026/2032 call (the same
 * "K&R drops a register-reused argument" pattern already fixed
 * elsewhere in this codebase, e.g. Ordinal_1068's strlen argument).
 * Declaring one K&R parameter here lets the calling convention pick it
 * up from the register the prior call's return value is still sitting
 * in. No call site distinguishes its rounding behavior from
 * Ordinal_2020's, so implemented identically until proven otherwise. */
long Ordinal_2018(x)
unsigned int x;
{
    return (long)ordfloat_bits_to_float(x);
}

long Ordinal_2020(x)
unsigned int x;
{
    return (long)ordfloat_bits_to_float(x);
}

long Ordinal_2021()
{
    return 0;
}

long Ordinal_2023()
{
    return 0;
}

long Ordinal_2026(a, b)
unsigned int a;
unsigned int b;
{
    return (long)ordfloat_float_to_bits(ordfloat_bits_to_float(a) * ordfloat_bits_to_float(b));
}

long Ordinal_2027()
{
    return 0;
}

long Ordinal_2028()
{
    return 0;
}

long Ordinal_2030()
{
    return 0;
}

long Ordinal_2032(x)
int x;
{
    return (long)ordfloat_float_to_bits((float)x);
}

long Ordinal_2033()
{
    return 0;
}

long Ordinal_2036()
{
    return 0;
}

long Ordinal_2038()
{
    return 0;
}

long Ordinal_2044()
{
    return 0;
}

long Ordinal_2046()
{
    return 0;
}

long Ordinal_2047()
{
    return 0;
}

long Ordinal_2048()
{
    return 0;
}

long Ordinal_2051()
{
    return 0;
}

long Ordinal_2053()
{
    return 0;
}

long Ordinal_2063()
{
    return 0;
}

long Ordinal_2135()
{
    return 0;
}

long Ordinal_2142()
{
    return 0;
}

long Ordinal_2304()
{
    return 0;
}

long Ordinal_2413()
{
    return 0;
}

long Ordinal_2582()
{
    return 0;
}

long Ordinal_2588()
{
    return 0;
}

