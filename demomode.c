/* See demomode.h. Input file format: one command per line, case-
 * insensitive, blank lines and lines starting with '#' ignored:
 *   UP DOWN LEFT RIGHT ENTER SPACE CTRL ESC BACKSPACE
 *   WAIT <ticks>  -- burns <ticks> idle pump ticks feeding no input at
 *                    all, letting the game's own idle-tick dispatch run
 *                    on its own (e.g. after a TELEPORT, to see whether
 *                    anything reacts to the new position before the
 *                    next scripted input).
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
 *   REVEAL        -- calls full_dungeon_redraw (the "full dungeon redraw"
 *                    wrapper) directly at the current position, forcing
 *                    the ring-walk that marks automap tiles revealed --
 *                    TELEPORT and ordinary movement don't trigger this
 *                    on their own.
 *   SETPLAYERPOS <x> <y> <z> <yaw> <pitch>  -- like TELEPORT but fine-grained:
 *                    x/y take a fractional tile position (e.g. "32.5 2.25"),
 *                    z is the raw height unit the [playerpos] print's own
 *                    "z=" value uses (not a tile coordinate -- copy a value
 *                    straight from that print to land on the same height),
 *                    and yaw/pitch (degrees) set the player's facing/look
 *                    angle directly, via demo_set_player_pos. Goes through
 *                    the same object-sync path as TELEPORT (set_player_tile_
 *                    position for the integer tile part, then
 *                    commit_player_move to pack the exact fine position/
 *                    yaw back into the player object) rather than the
 *                    movement/collision engine. For pinning the player to
 *                    an exact spot/facing to reproduce something
 *                    position-dependent (e.g. the wall-decal depth issue) --
 *                    pair with the always-on [playerpos] console print in
 *                    sync_camera_from_player to read back where this landed.
 *   REVEALALL     -- marks every walkable tile of the current level's
 *                    automap revealed in one pass (automap_reveal_all_tiles),
 *                    no per-tile teleport/redraw. For exercising the
 *                    automap renderer on a fully-explored map quickly.
 *   OPENMAP       -- calls change_game_mode(2), the real switch to the
 *                    automap game mode (its entry handler,
 *                    enter_automap_screen, then fires on the next idle
 *                    tick). Follow it with a WAIT so that tick happens
 *                    before a SCREENSHOT. Whatever HUD button/key
 *                    reaches this in the real Pocket PC UI still hasn't
 *                    been found.
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
 *   SDLRCLICK <window_x> <window_y>  -- right-button version of SDLCLICK
 *                    (interact)
 *   SDLDOWN/SDLUP <window_x> <window_y>  -- split halves of SDLCLICK, for
 *                    a real multi-tick gap between button-down and
 *                    button-up instead of both queued instantaneously
 *   SDLRDOWN/SDLRUP <window_x> <window_y>  -- right-button versions of
 *                    SDLDOWN/SDLUP -- combine with SDLMOVE to script a
 *                    real drag (e.g. SDLRDOWN on a world object, WAIT,
 *                    SDLMOVE toward the target, WAIT, SDLRUP over the
 *                    inventory HUD, to test grabbing and dropping an item)
 *   SDLMOVE <window_x> <window_y>  -- warps the cursor and pushes a
 *                    genuine SDL_MOUSEMOTION with no button-state change,
 *                    the "move while held" middle of a drag
 *   SCREENSHOT <path>  -- saves the current window contents (post-
 *                    rotation, what's actually on screen) as a BMP,
 *                    so a scripted run -- or Claude -- can see what a
 *                    screen looks like without a human taking one
 *   RAWKEY <KEY>   -- pushes one UNTAGGED SDL_KEYDOWN+KEYUP, i.e. what a
 *                    human at the keyboard produces (SDLHOLD's injections
 *                    are tagged so demo-control shortcuts ignore them;
 *                    RAWKEY's are not). RAWKEY ESCAPE therefore aborts
 *                    the rest of the demo file -- the same thing hitting
 *                    the physical ESC key does. KEY name as for SDLHOLD.
 *   SDLHOLD SHIFT+<KEY> <ticks>  -- like SDLHOLD, but holds SDLK_LSHIFT
 *                    down for the same duration. Real UW controls use
 *                    SHIFT+turn-key for a sharp, discrete 45-degree snap
 *                    turn (a bare turn-key free-turns instead); see
 *                    in_dungeon_freelook()'s comment in gx_stub.c.
 * Pacing is controlled by the UW_DEMO_DELAY_MS env var (default 250ms
 * between inputs). Once the file runs out, the process exits (making
 * scripted test runs self-terminating for fast feedback loops); set
 * UW_DEMO_KEEP_RUNNING=1 to keep the window open and just stop feeding
 * synthetic events instead.
 *
 * Pressing the physical ESC key while a demo is playing aborts playback
 * immediately (any in-progress HOLD is released, the file is closed) and
 * hands control back to the live keyboard/mouse without exiting -- so a
 * demo that's driving toward a bad state can be stopped and the result
 * poked at by hand. That ESC is swallowed; it does not also reach the
 * game. With no demo running, ESC behaves normally. */
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
 * ticks to wait before releasing it. g_demo_hold_is_sdl distinguishes a
 * SDLHOLD (real SDL_KEYDOWN/KEYUP pushed through uw_pump_events, so the
 * gx_stub key path -- key-repeat takeover, TEXTINPUT, etc -- is
 * exercised) from a plain HOLD (handle_keyboard_message called directly).
 * For SDLHOLD g_demo_hold_vk carries the SDL_Keycode, not a Windows VK. */
static int g_demo_hold_vk;
static int g_demo_hold_ticks;
static int g_demo_hold_is_sdl;

/* Set when the current SDLHOLD is a "SHIFT+<key>" combo (see SDLHOLD
 * parsing below) -- SDLK_LSHIFT was injected down alongside g_demo_hold_vk
 * and needs releasing alongside it, in the same up/abort paths. Real UW
 * controls use SHIFT+turn-key for a sharp 45-degree snap turn (plain
 * turn-key alone free-turns); in_dungeon_freelook() in gx_stub.c checks
 * g_synth_scancode_held for the shift scancode, which is what makes an
 * injected SDLK_LSHIFT actually register as "held" for that check
 * (SDL_GetModState() alone does not see synthetic/pushed events). */
static int g_demo_hold_shift;

/* WAIT <ticks> state: how many more idle pump ticks to burn with no
 * input at all before reading the next line. */
static int g_demo_wait_ticks;

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
    /* Single letter or digit -> its Windows VK code (VK_A..VK_Z == 'A'..'Z'
       == 0x41..0x5A, VK_0..VK_9 == '0'..'9'). NOTE: the W/S/X/A/D world
       movement (walk / turn) is actually bound by *WM_CHAR* (lowercase
       0x61..), not by these VK codes -- a plain "HOLD A" therefore does
       nothing. Use SDLHOLD (which pushes a real SDL key event through
       gx_stub's held-movement-letter path) to drive those from a demo. */
    if (name[0] && name[1] == '\0') {
        unsigned char c = (unsigned char)name[0];
        if (c >= 'a' && c <= 'z') return c - 'a' + 'A';
        if ((c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')) return c;
    }
    /* 0xNN / decimal -> raw key/command code, for the GAPI D-pad movement
       codes (0x8d/0x8f/0x91/0x93) and anything else bound directly. */
    if ((name[0] == '0' && (name[1] == 'x' || name[1] == 'X')) ||
        (name[0] >= '0' && name[0] <= '9')) {
        long v = strtol(name, NULL, 0);
        if (v > 0 && v < 0x400) return (int)v;
    }
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

int demomode_active(void) {
    return g_demo_active && !g_demo_done;
}

void demomode_abort(const char *reason) {
    if (!g_demo_active || g_demo_done) return;

    /* If a HOLD left a key pressed, release it now so the game doesn't
     * think it's still down after playback stops. (A SDLHOLD's KEYUP is
     * skipped -- an abort is an abort, and the synthetic keyup would just
     * re-enter this same event path.) */
    if (g_demo_hold_vk != 0 && !g_demo_hold_is_sdl) {
        handle_keyboard_message(0, 0x101u, (unsigned int)g_demo_hold_vk);
    }
    if (g_demo_hold_shift) {
        uw_clear_synth_scancode(SDLK_LSHIFT);
    }
    g_demo_hold_vk = 0;
    g_demo_hold_is_sdl = 0;
    g_demo_hold_shift = 0;
    g_demo_hold_ticks = 0;
    g_demo_type_pos = NULL;
    g_demo_type_buf[0] = '\0';
    g_demo_wait_ticks = 0;

    g_demo_done = 1;
    g_demo_active = 0;
    if (g_demo_file) {
        fclose(g_demo_file);
        g_demo_file = NULL;
    }
    fprintf(stderr, "[demo] aborted (%s) -- playback stopped, window still live\n",
            reason ? reason : "requested");
}

void demomode_pump(void) {
    if (!g_demo_active || g_demo_done) return;
    Uint32 now = SDL_GetTicks();
    if (now < g_demo_next_tick) return;

    /* Mid-WAIT: burn one idle tick with no input at all, letting
     * whatever the game's own idle-tick dispatch does run on its own --
     * unlike HOLD, nothing is pressed during this. */
    if (g_demo_wait_ticks > 0) {
        g_demo_wait_ticks--;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

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
        fprintf(stderr, "[demo] releasing held key %s=0x%x\n",
                g_demo_hold_is_sdl ? "sdlkey" : "vk", g_demo_hold_vk);
        if (g_demo_hold_is_sdl) {
            uw_inject_key_up(g_demo_hold_vk);
        } else {
            handle_keyboard_message(0, 0x101u, (unsigned int)g_demo_hold_vk);
        }
        if (g_demo_hold_shift) {
            fprintf(stderr, "[demo] releasing held SHIFT\n");
            uw_inject_key_up(SDLK_LSHIFT);
        }
        g_demo_hold_vk = 0;
        g_demo_hold_is_sdl = 0;
        g_demo_hold_shift = 0;
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
         * finishes (e.g. to keep manually poking at the resulting state).
         * Checked by VALUE, not just presence -- UW_DEMO_KEEP_RUNNING=0
         * (as opposed to leaving it unset) is a common explicit "don't keep
         * running" from a test harness/script, and getenv() alone can't
         * tell that apart from =1. */
        const char *keep_running = getenv("UW_DEMO_KEEP_RUNNING");
        int keep = keep_running && *keep_running != '\0' &&
                   strcmp(keep_running, "0") != 0 &&
                   strcasecmp(keep_running, "false") != 0;
        if (!keep) {
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

    if (strncasecmp(p, "WAIT ", 5) == 0) {
        int ticks = 0;
        if (sscanf(p + 5, "%d", &ticks) != 1 || ticks < 0) {
            fprintf(stderr, "[demo] malformed WAIT line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        fprintf(stderr, "[demo] waiting %d idle ticks\n", ticks);
        g_demo_wait_ticks = ticks;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
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
        g_demo_hold_is_sdl = 0;
        g_demo_hold_ticks = ticks;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLHOLD ", 8) == 0) {
        /* Like HOLD, but pushes a real SDL_KEYDOWN (+ SDL_TEXTINPUT for a
         * printable key) now and a real SDL_KEYUP after <ticks>, so the
         * whole gx_stub.c key path runs -- unlike HOLD, which calls
         * handle_keyboard_message directly. Use it to test the held
         * W/S/X/A/D movement-letter repeat takeover. Key is a single
         * character (its lowercase ASCII == SDL_Keycode) or one of
         * LEFT/RIGHT/UP/DOWN/RETURN/ESCAPE/SPACE.
         * A "SHIFT+<key>" key holds SDLK_LSHIFT down first -- real UW
         * controls use SHIFT+turn-key for a sharp 45-degree snap turn
         * (plain turn-key alone free-turns via poll_dungeon_movement_keys);
         * see in_dungeon_freelook()'s comment in gx_stub.c. */
        char keyname[32];
        int ticks = 0;
        if (sscanf(p + 8, "%31s %d", keyname, &ticks) != 2 || ticks < 0) {
            fprintf(stderr, "[demo] malformed SDLHOLD line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        int want_shift = 0;
        char *plus = strchr(keyname, '+');
        if (plus) {
            *plus = '\0';
            if (strcasecmp(keyname, "SHIFT") != 0) {
                fprintf(stderr, "[demo] SDLHOLD: unrecognized modifier '%s', skipping\n", keyname);
                g_demo_next_tick = now;
                return;
            }
            want_shift = 1;
            memmove(keyname, plus + 1, strlen(plus + 1) + 1);
        }
        int kc = 0;
        if (keyname[0] && keyname[1] == '\0') {
            unsigned char c = (unsigned char)keyname[0];
            if (c >= 'A' && c <= 'Z') c = (unsigned char)(c - 'A' + 'a');
            kc = c;
        } else if (strcasecmp(keyname, "LEFT") == 0)   kc = SDLK_LEFT;
        else if (strcasecmp(keyname, "RIGHT") == 0)    kc = SDLK_RIGHT;
        else if (strcasecmp(keyname, "UP") == 0)       kc = SDLK_UP;
        else if (strcasecmp(keyname, "DOWN") == 0)     kc = SDLK_DOWN;
        else if (strcasecmp(keyname, "RETURN") == 0 || strcasecmp(keyname, "ENTER") == 0) kc = SDLK_RETURN;
        else if (strcasecmp(keyname, "ESCAPE") == 0 || strcasecmp(keyname, "ESC") == 0)   kc = SDLK_ESCAPE;
        else if (strcasecmp(keyname, "SPACE") == 0)    kc = SDLK_SPACE;
        if (kc == 0) {
            fprintf(stderr, "[demo] SDLHOLD: unrecognized key '%s', skipping\n", keyname);
            g_demo_next_tick = now;
            return;
        }
        if (want_shift) {
            fprintf(stderr, "[demo] SDL-holding SHIFT+%s (sdlkey=0x%x) for %d ticks\n", keyname, kc, ticks);
            uw_inject_key_down(SDLK_LSHIFT);
        } else {
            fprintf(stderr, "[demo] SDL-holding %s (sdlkey=0x%x) for %d ticks\n", keyname, kc, ticks);
        }
        uw_inject_key_down(kc);
        g_demo_hold_vk = kc;
        g_demo_hold_is_sdl = 1;
        g_demo_hold_shift = want_shift;
        g_demo_hold_ticks = ticks;
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "RAWKEY ", 7) == 0) {
        /* Push a single UNTAGGED SDL_KEYDOWN+SDL_KEYUP -- i.e. exactly
         * what a human at the keyboard produces, with no UW_SYNTH_KEY
         * stamp. Unlike SDLHOLD (scripted-injection, tagged so it can't
         * trip demo-control shortcuts), a RAWKEY ESCAPE is treated as the
         * player hitting ESC and therefore aborts the rest of the demo
         * file -- which is what this command exists to exercise. Key name
         * as for SDLHOLD. */
        char keyname[32];
        if (sscanf(p + 7, "%31s", keyname) != 1) {
            fprintf(stderr, "[demo] malformed RAWKEY line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        int kc = 0;
        if (keyname[0] && keyname[1] == '\0') {
            unsigned char c = (unsigned char)keyname[0];
            if (c >= 'A' && c <= 'Z') c = (unsigned char)(c - 'A' + 'a');
            kc = c;
        } else if (strcasecmp(keyname, "LEFT") == 0)   kc = SDLK_LEFT;
        else if (strcasecmp(keyname, "RIGHT") == 0)    kc = SDLK_RIGHT;
        else if (strcasecmp(keyname, "UP") == 0)       kc = SDLK_UP;
        else if (strcasecmp(keyname, "DOWN") == 0)     kc = SDLK_DOWN;
        else if (strcasecmp(keyname, "RETURN") == 0 || strcasecmp(keyname, "ENTER") == 0) kc = SDLK_RETURN;
        else if (strcasecmp(keyname, "ESCAPE") == 0 || strcasecmp(keyname, "ESC") == 0)   kc = SDLK_ESCAPE;
        else if (strcasecmp(keyname, "SPACE") == 0)    kc = SDLK_SPACE;
        if (kc == 0) {
            fprintf(stderr, "[demo] RAWKEY: unrecognized key '%s', skipping\n", keyname);
            g_demo_next_tick = now;
            return;
        }
        fprintf(stderr, "[demo] RAWKEY %s (sdlkey=0x%x)\n", keyname, kc);
        SDL_Event e = {0};
        e.type = SDL_KEYDOWN;
        e.key.state = SDL_PRESSED;
        e.key.repeat = 0;
        e.key.keysym.sym = (SDL_Keycode)kc;
        e.key.keysym.scancode = SDL_GetScancodeFromKey((SDL_Keycode)kc);
        SDL_PushEvent(&e);
        e.type = SDL_KEYUP;
        e.key.state = SDL_RELEASED;
        SDL_PushEvent(&e);
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

    if (strncasecmp(p, "SETPLAYERPOS ", 13) == 0) {
        double x = 0, y = 0, z = 0, yaw = 0, pitch = 0;
        if (sscanf(p + 13, "%lf %lf %lf %lf %lf", &x, &y, &z, &yaw, &pitch) != 5) {
            fprintf(stderr, "[demo] malformed SETPLAYERPOS line '%s', skipping\n", p);
            g_demo_next_tick = now;
            return;
        }
        fprintf(stderr, "[demo] SETPLAYERPOS tile=(%.3f,%.3f) z=%.0f yaw=%.1f pitch=%.1f\n",
                x, y, z, yaw, pitch);
        demo_set_player_pos(x, y, z, yaw, pitch);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "OPENMAP") == 0) {
        /* set_game_mode(2) is the real mode switch: DAT_00201b60 = 2 maps
         * to game-mode index DAT_00201b64 = 1 (the automap), whose entry
         * handler in DAT_00085668's mode-1 row is enter_automap_screen.
         * Going through the mode switch (rather than calling
         * enter_automap_screen directly, as an earlier version did) keeps
         * the game in map mode so the HUD's per-frame redraw doesn't
         * immediately paint over it. Whatever HUD button/key reaches this
         * in the real Pocket PC UI still hasn't been found -- a
         * whole-binary Ghidra reference search on the automap entry point
         * came up empty. */
        fprintf(stderr, "[demo] switching to automap mode (change_game_mode(2))\n");
        change_game_mode(2);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "REVEAL") == 0) {
        /* Calls full_dungeon_redraw (the "full dungeon redraw" wrapper,
         * was FUN_0005bb5c) directly at the player's current position.
         * This is the only thing that runs the ring-walk which marks
         * automap tiles revealed -- confirmed it does NOT run on
         * TELEPORT or ordinary movement, only on a handful of discrete
         * events (level entry/transition, pause-close, etc.), none of
         * which a demo script naturally passes through. Added so a
         * script can force that update at each TELEPORT stop instead of
         * only ever seeing the single reveal mark from dungeon entry. */
        fprintf(stderr, "[demo] forcing a full dungeon redraw (automap reveal update)\n");
        {
            /* Print the player's tile so a scripted TELEPORT/REVEAL sweep
               can be correlated with what's on screen. */
            extern void *DAT_0023be64;
            unsigned short *pl = (unsigned short *)DAT_0023be64;
            if (pl)
                fprintf(stderr, "[demo] player tile = (%d,%d)\n",
                        pl[0x16/2] >> 10, (pl[0x16/2] & 0x3f0) >> 4);
        }
        full_dungeon_redraw();
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strcasecmp(p, "REVEALALL") == 0) {
        /* Reveal the entire current level's automap in one pass, with
         * no per-tile teleport or dungeon redraw. Much faster than a
         * TELEPORT+REVEAL sweep for exercising the automap renderer on
         * a fully-explored map. */
        fprintf(stderr, "[demo] revealing the entire level automap\n");
        automap_reveal_all_tiles();
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

    if (strncasecmp(p, "SDLRCLICK ", 10) == 0) {
        /* SDLRCLICK <window_x> <window_y> -- right-button click (interact). */
        int wx = 0, wy = 0;
        sscanf(p + 10, "%d %d", &wx, &wy);
        fprintf(stderr, "[demo] SDLRCLICK window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_rclick(wx, wy);
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

    if (strncasecmp(p, "SDLRDOWN ", 9) == 0) {
        /* SDLRDOWN/SDLMOVE/SDLRUP -- right-button drag primitives (grab
         * an object, hold, move the cursor, release elsewhere -- e.g.
         * dragging a picked-up item onto the inventory HUD). */
        int wx = 0, wy = 0;
        sscanf(p + 9, "%d %d", &wx, &wy);
        fprintf(stderr, "[demo] SDLRDOWN window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_rdown(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLRUP ", 7) == 0) {
        int wx = 0, wy = 0;
        sscanf(p + 7, "%d %d", &wx, &wy);
        fprintf(stderr, "[demo] SDLRUP window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_rup(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SDLMOVE ", 8) == 0) {
        int wx = 0, wy = 0;
        sscanf(p + 8, "%d %d", &wx, &wy);
        fprintf(stderr, "[demo] SDLMOVE window=(%d,%d)\n", wx, wy);
        uw_inject_mouse_motion(wx, wy);
        g_demo_next_tick = now + (Uint32)g_demo_delay_ms;
        return;
    }

    if (strncasecmp(p, "SCREENSHOT ", 11) == 0) {
        const char *path = p + 11;
        /* Push the whole software framebuffer to the display before
         * capturing. The in-game main loop's main_loop_hud_flush() resets the
         * dirty rect to a degenerate {100,100,100,100} every iteration,
         * so anything drawn by a bare demomode call (full_dungeon_redraw
         * for the 3D view, automap fills, ...) lands in g_uw_framebuffer
         * but is never flushed to the GX framebuffer that the screenshot
         * reads back. Force a full-screen flush the same way FUN_0005857c
         * and the click-hold redraw path force their own. */
        { extern int g_force_flush; extern void flush_dirty_rect_to_display();
          dirty_rect_union(0, 200, 0, 0x140);
          g_force_flush = 1;
          flush_dirty_rect_to_display(1);
          g_force_flush = 0; }
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
