/* See demomode.h. Input file format: one command per line, case-
 * insensitive, blank lines and lines starting with '#' ignored:
 *   UP DOWN LEFT RIGHT ENTER SPACE CTRL ESC BACKSPACE
 *   HOLD <KEY> <ticks>  -- sends KEYDOWN for <KEY> once, then idles
 *                    (feeding no new input, so the game's own idle-tick
 *                    dispatch keeps running with the key conceptually
 *                    still down) for <ticks> more pump ticks before
 *                    finally sending KEYUP -- simulates a genuinely
 *                    held key, unlike the plain UP/DOWN/etc commands
 *                    (which send KEYDOWN+KEYUP back to back in the same
 *                    tick). Needed for anything gated on hold duration,
 *                    e.g. DAT_0024af6c in uw.c.
 *   TELEPORT <x> <y>  -- directly sets the player's tile position via
 *                    set_player_tile_position (the same function the game itself
 *                    uses for level-load/teleport placement), bypassing
 *                    the movement/collision engine entirely. For
 *                    testing the renderer against a known-good position
 *                    without depending on movement actually working.
 *   OPENMAP       -- calls FUN_00016354 (the automap-screen "enter"
 *                    routine) directly. No known caller anywhere in the
 *                    compiled game (whole-binary reference search found
 *                    zero) -- for testing the automap's own (simpler,
 *                    blit-based) draw path independent of the still-broken
 *                    3D dungeon view.
 *   TYPE <text>   -- sends each character of <text> as a real WM_CHAR
 *                    (0x102), one per delay tick, simulating name entry
 *   CLICK <portrait_x> <portrait_y>  -- injects a synthetic mouse click
 *                    directly in portrait "hardware" framebuffer
 *                    coordinates, bypassing gx_stub.c's window->portrait
 *                    transform (see FUN_00077dd0's comment in uw.c)
 *   SDLCLICK <window_x> <window_y>  -- warps the real cursor and pushes
 *                    genuine SDL mouse events, exercising the full
 *                    uw_pump_events() path (unlike CLICK above, which
 *                    bypasses it entirely)
 *   SCREENSHOT <path>  -- saves the current window contents (post-
 *                    rotation, what's actually on screen) as a BMP,
 *                    so a scripted run -- or Claude -- can see what a
 *                    screen looks like without a human taking one
 * Pacing is controlled by the UW_DEMO_DELAY_MS env var (default 250ms
 * between inputs). Once the file runs out, the process exits (making
 * scripted test runs self-terminating for fast feedback loops); set
 * UW_DEMO_KEEP_RUNNING=1 to keep the window open and just stop feeding
 * synthetic events instead. */
#include "demomode.h"
#include "uw.h"

#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

#define VK_UP 0x26
#define VK_DOWN 0x28
#define VK_LEFT 0x25
#define VK_RIGHT 0x27
#define VK_RETURN 0x0D
#define VK_SPACE 0x20
#define VK_CONTROL 0x11
#define VK_ESCAPE 0x1B
#define VK_BACK 0x08

#define DEMO_DEFAULT_DELAY_MS 250

static FILE *g_demo_file;
static Uint32 g_demo_next_tick;
static int g_demo_delay_ms = DEMO_DEFAULT_DELAY_MS;
static int g_demo_active;
static int g_demo_done;

/* When a "TYPE <text>" line is in progress, feed one character per pump
 * tick (rather than the whole string at once) so it plays back at the
 * same pace as other inputs and interleaves realistically. */
static char g_demo_type_buf[256];
static const char *g_demo_type_pos;

/* HOLD <KEY> <ticks> state: g_demo_hold_vk is the VK code currently
 * "held" (0 = nothing), g_demo_hold_ticks is how many more idle pump
 * ticks to wait before releasing it. */
static int g_demo_hold_vk;
static int g_demo_hold_ticks;

static int demo_translate_vk(const char *name) {
    if (strcasecmp(name, "UP") == 0) return VK_UP;
    if (strcasecmp(name, "DOWN") == 0) return VK_DOWN;
    if (strcasecmp(name, "LEFT") == 0) return VK_LEFT;
    if (strcasecmp(name, "RIGHT") == 0) return VK_RIGHT;
    if (strcasecmp(name, "ENTER") == 0 || strcasecmp(name, "RETURN") == 0) return VK_RETURN;
    if (strcasecmp(name, "SPACE") == 0) return VK_SPACE;
    if (strcasecmp(name, "CTRL") == 0 || strcasecmp(name, "CONTROL") == 0) return VK_CONTROL;
    if (strcasecmp(name, "ESC") == 0 || strcasecmp(name, "ESCAPE") == 0) return VK_ESCAPE;
    if (strcasecmp(name, "BACKSPACE") == 0 || strcasecmp(name, "BACK") == 0) return VK_BACK;
    return 0;
}

void demomode_init(void) {
    const char *path = getenv("UW_DEMO_FILE");
    if (!path) return;

    g_demo_file = fopen(path, "r");
    if (!g_demo_file) {
        fprintf(stderr, "[demo] failed to open UW_DEMO_FILE=%s\n", path);
        return;
    }

    const char *delay_env = getenv("UW_DEMO_DELAY_MS");
    if (delay_env) {
        int v = atoi(delay_env);
        if (v > 0) g_demo_delay_ms = v;
    }

    g_demo_active = 1;
    g_demo_next_tick = SDL_GetTicks() + (Uint32)g_demo_delay_ms;
    fprintf(stderr, "[demo] playing back input from %s (delay=%dms)\n", path, g_demo_delay_ms);
}

void demomode_pump(void) {
    if (!g_demo_active || g_demo_done) return;
    Uint32 now = SDL_GetTicks();
    if (now < g_demo_next_tick) return;

    /* Mid-HOLD: the key's KEYDOWN was already sent when the HOLD line
     * was first read (below); every tick until the countdown reaches 0
     * just idles (no new input fed at all, matching a real held key
     * generating no fresh keydown/keyup), then releases on the last one. */
    if (g_demo_hold_vk != 0) {
        if (g_demo_hold_ticks > 0) {
            g_demo_hold_ticks--;
            g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
            return;
        }
        fprintf(stderr, "[demo] releasing held key vk=0x%x\n", g_demo_hold_vk);
        handle_keyboard_message(0, 0x101u, (unsigned int)g_demo_hold_vk);
        g_demo_hold_vk = 0;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    /* Mid-TYPE: send the next character (as a real WM_CHAR, matching
     * SDL_TEXTINPUT's forwarding in gx_stub.c) and come back next tick
     * for the rest, rather than dumping the whole string in one frame. */
    if (g_demo_type_pos && *g_demo_type_pos) {
        unsigned char c = (unsigned char)*g_demo_type_pos++;
        fprintf(stderr, "[demo] typing '%c'\n", c);
        handle_keyboard_message(0, 0x102u, (unsigned int)c);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }
    g_demo_type_pos = NULL;

    char line[256];
    if (!fgets(line, sizeof(line), g_demo_file)) {
        g_demo_done = 1;
        fclose(g_demo_file);
        g_demo_file = NULL;
        /* Quitting here (instead of idling with the window still open)
         * makes scripted test runs self-terminating -- set
         * UW_DEMO_KEEP_RUNNING=1 to keep the window open after playback
         * finishes (e.g. to keep manually poking at the resulting state). */
        if (!getenv("UW_DEMO_KEEP_RUNNING")) {
            fprintf(stderr, "[demo] end of input, exiting\n");
            exit(0);
        }
        fprintf(stderr, "[demo] end of input, stopping playback\n");
        return;
    }

    char *nl = strpbrk(line, "\r\n");
    if (nl) *nl = '\0';
    char *p = line;
    while (*p == ' ' || *p == '\t') p++;

    if (*p == '\0' || *p == '#') {
        /* Blank/comment line -- retry immediately on the next pump
         * instead of burning a full delay slot on nothing. */
        g_demo_next_tick = now;
        return;
    }

    if (strncasecmp(p, "HOLD ", 5) == 0) {
        char keyname[32];
        int ticks = 0;
        if (sscanf(p + 5, "%31s %d", keyname, &ticks) != 2 || ticks < 0) {
            fprintf(stderr, "[demo] malformed HOLD line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        int vk = demo_translate_vk(keyname);
        if (vk == 0) {
            fprintf(stderr, "[demo] HOLD: unrecognized key '%s', skipping\n", keyname);
            g_demo_next_tick = now;
            return;
        }
        fprintf(stderr, "[demo] holding %s (vk=0x%x) for %d ticks\n", keyname, vk, ticks);
        handle_keyboard_message(0, 0x100u, (unsigned int)vk);
        g_demo_hold_vk = vk;
        g_demo_hold_ticks = ticks;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "TYPE ", 5) == 0) {
        const char *text = p + 5;
        strncpy(g_demo_type_buf, text, sizeof(g_demo_type_buf) - 1);
        g_demo_type_buf[sizeof(g_demo_type_buf) - 1] = '\0';
        fprintf(stderr, "[demo] queued typing '%s'\n", g_demo_type_buf);
        g_demo_type_pos = g_demo_type_buf;
        /* Retry immediately so the first character goes out on the next
         * pump rather than burning a delay slot on the TYPE line itself. */
        g_demo_next_tick = now;
        return;
    }

    if (strncasecmp(p, "TELEPORT ", 9) == 0) {
        int tx = 0, ty = 0;
        if (sscanf(p + 9, "%d %d", &tx, &ty) != 2) {
            fprintf(stderr, "[demo] malformed TELEPORT line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        fprintf(stderr, "[demo] teleporting to tile (%d,%d)\n", tx, ty);
        set_player_tile_position(tx, ty);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "OPENMAP") == 0) {
        /* Calls FUN_00016354 (the automap-screen "enter" routine) directly.
         * A whole-binary Ghidra reference search found ZERO callers of this
         * function anywhere in the compiled game -- whatever HUD button or
         * key is supposed to reach it in the real Pocket PC UI has not been
         * found yet. Added so the automap's own drawing path (a much
         * simpler blit-based renderer than the still-broken 3D dungeon
         * view) can be tested directly while that real trigger stays
         * unidentified. */
        fprintf(stderr, "[demo] opening automap screen\n");
        FUN_00016354();
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "CLICK ", 6) == 0) {
        /* CLICK <portrait_x> <portrait_y> -- injects a synthetic
         * WM_LBUTTONDOWN directly into FUN_00077dd0 (the recovered mouse
         * handler) using portrait "hardware" framebuffer coordinates
         * directly, bypassing gx_stub.c's SDL window->portrait transform
         * entirely. Lets us test the click-to-button-ID recovery in
         * isolation from that coordinate math. */
        int px = 0, py = 0;
        sscanf(p + 6, "%d %d", &px, &py);
        fprintf(stderr, "[demo] CLICK portrait=(%d,%d)\n", px, py);
        int lparam = (py << 16) | (px & 0xffff);
        FUN_00077dd0(0, 0x201u, 0, lparam);
        FUN_00077dd0(0, 0x202u, 0, lparam);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLCLICK ", 9) == 0) {
        /* SDLCLICK <window_x> <window_y> -- warps the real cursor and
         * pushes genuine SDL mouse events (via uw_inject_mouse_click),
         * so unlike CLICK above this exercises the actual
         * uw_pump_events() path end to end, including
         * g_mouse_event_pending/Ordinal_864. */
        int wx = 0, wy = 0;
        sscanf(p + 9, "%d %d", &wx, &wy);
        fprintf(stderr, "[demo] SDLCLICK window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_click(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLDOWN ", 8) == 0) {
        /* SDLDOWN/SDLUP <window_x> <window_y> -- split halves of
         * SDLCLICK, for testing a click with a real multi-tick gap
         * between button-down and button-up (matching an actual held
         * click's timing) rather than both queued in the same instant. */
        int wx = 0, wy = 0;
        sscanf(p + 8, "%d %d", &wx, &wy);
        fprintf(stderr, "[demo] SDLDOWN window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_down(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLUP ", 6) == 0) {
        int wx = 0, wy = 0;
        sscanf(p + 6, "%d %d", &wx, &wy);
        fprintf(stderr, "[demo] SDLUP window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_up(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SCREENSHOT ", 11) == 0) {
        const char *path = p + 11;
        uw_save_screenshot(path);
        g_demo_next_tick = now;
        return;
    }

    int vk = demo_translate_vk(p);
    if (vk == 0) {
        fprintf(stderr, "[demo] unrecognized input '%s', skipping\n", p);
    } else if (vk == VK_BACK) {
        /* Backspace only ever reaches the game as WM_CHAR (0x102), not a
         * VK keydown/keyup -- see gx_stub.c's uw_pump_events. */
        fprintf(stderr, "[demo] sending %s\n", p);
        handle_keyboard_message(0, 0x102u, (unsigned int)VK_BACK);
    } else {
        fprintf(stderr, "[demo] sending %s\n", p);
        handle_keyboard_message(0, 0x100u, (unsigned int)vk);
        handle_keyboard_message(0, 0x101u, (unsigned int)vk);
        /* Used to also send a WM_CHAR(0x0D) here for Enter specifically,
         * on the theory that text-entry fields submit on the WM_CHAR
         * rather than the VK keydown. That's now known wrong on two
         * counts: (1) name entry already submits correctly off the
         * keydown alone -- confirmed empirically once DAT_0023ce34
         * (start.vk) was fixed to really hold VK_RETURN (see its uw.c
         * comment) -- and (2) sending both messages actively breaks
         * every other consumer of DAT_0023c448: handle_keyboard_message's WM_CHAR
         * case ORs its byte in rather than replacing
         * (`DAT_0023c448 = DAT_0023c448 | uVar1`), so this always
         * corrupted the keydown's real command code (0x93, the "start
         * button" pressed) into a value nothing recognizes (0x93|0xd =
         * 0x9f) -- silently discarding every Enter press system-wide,
         * menus and world movement alike, without ever crashing. */
    }
    g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
}
