/* GAPI (Windows CE "GX*" Game API) stub, backed by real SDL2 so the game
 * gets an actual window instead of a headless no-op. */
#include "gx_stub.h"
#include "ordinal_stubs.h"
#include "uw.h"
#include "demomode.h"

#include <SDL.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <time.h>

#define GX_W 320
#define GX_H 240

/* The game's own screen-flush routines (FUN_00022f0c/FUN_0002310c in
 * uw.c) always blit by transposing rows<->columns from the software
 * framebuffer into whatever GXBeginDraw() returns, using the pitch
 * values from GXGetDisplayProperties() -- i.e. the code unconditionally
 * performs a 90-degree rotation from its internal 320x240 landscape
 * buffer into the "hardware" framebuffer. That only makes sense if the
 * real target device's framebuffer is natively portrait-oriented
 * (matches the original HP Jornada/Pocket PC-class hardware this port
 * targets); reporting landscape pitch/dimensions here made the blit's
 * row/column math write far outside the buffer (global-buffer-overflow
 * on `g_framebuffer`). Emulate that portrait "hardware" framebuffer
 * faithfully, then rotate it back to landscape ourselves when
 * presenting to the (landscape, GX_W x GX_H) SDL window/texture. */
#define HW_W 240
#define HW_H 320

/* Real Microsoft GXDisplayProperties layout (6 x 4-byte fields = 0x18). */
typedef struct {
    unsigned int cxWidth;
    int cyHeight;
    int cbxPitch;
    int cbyPitch;
    int cBPP;
    unsigned int ffFormat;
} GxDisplayProps;

#define KF_DIRECT565 0x10u

/* Real Microsoft GXKeyList layout: 8x (short vk + POINT pt), 12 bytes each
 * after alignment padding = 0x60. Only the vk fields are meaningful here. */
typedef struct {
    short vk;
    short pad;
    int ptx, pty;
} GxKeyEntry;

typedef struct {
    GxKeyEntry a, b, c, start, up, down, left, right;
} GxKeyList;

#define VK_UP 0x26
#define VK_DOWN 0x28
#define VK_LEFT 0x25
#define VK_RIGHT 0x27
#define VK_RETURN 0x0D
#define VK_SPACE 0x20
#define VK_CONTROL 0x11
#define VK_ESCAPE 0x1B
/* WinCE app-launch button virtual-key. Real GAPI hands the game codes
 * like this for the hardware A/B/C/Start buttons -- never ASCII keys --
 * so mapping "button A" to one keeps the spacebar free to type a literal
 * space in the name-entry field. */
#define VK_APP1 0xC1

static SDL_Window *g_win;
static SDL_Renderer *g_ren;
static SDL_Texture *g_tex;
static unsigned short g_framebuffer[HW_W * HW_H]; /* RGB565, portrait "hardware" buffer */
static unsigned short g_display_buf[GX_W * GX_H]; /* RGB565, rotated landscape buffer for display */
static int g_running = 1;
/* Mouse events (unlike keyboard ones) get handled synchronously and
 * completely inline in uw_pump_events -- FUN_00077dd0 processes and
 * finishes with each one before uw_pump_events even returns, so there's
 * no lingering "pending" state the way DAT_0023c448 stays set for
 * keyboard input. Real WinCE PeekMessage would report ANY pending
 * message type, not just keyboard, so Ordinal_864 needs a way to know
 * "a mouse message was just processed" too -- this one-shot flag is
 * that signal, consumed via uw_take_mouse_event_pending(). */
static int g_mouse_event_pending = 0;

/* A button-up dispatched on the very next poll after its matching
 * button-down leaves character_generator_touch_select's position-
 * validation loop (uw.c's character_generator_touch_select, called via
 * FUN_00024840) with zero chances to ever run: its first internal poll
 * (a *second* call, right after the outer poll that consumed the
 * button-down) immediately dequeues the already-queued button-up,
 * resetting DAT_0023c63c before the loop body -- which does the actual
 * hit-test against button bounds -- executes even once. With no
 * validated hit, it falls through to its "return the selection
 * unchanged" default, which the caller unconditionally treats as
 * "confirmed" -- so ANY click, on or off a button, advanced the field
 * (confirmed via screenshot diffing: identical result whether or not
 * the click landed on a button). Holding the button-up back for exactly
 * one extra uw_pump_events() call keeps DAT_0023c63c==1 visible to that
 * loop's first iteration, so it runs the real position check before the
 * (now-deferred) release finally clears it. */
static int g_mouseup_deferred = 0;
static int g_mouseup_deferred_lparam = 0;

/* True from a dispatched button-down until the (possibly still-deferred)
 * matching button-up actually dispatches. See its use at the bottom of
 * uw_pump_events for why this is needed even with g_mouseup_deferred
 * above: a *real* held click (any actual wall-clock gap between press
 * and release, which is every real click) means several poll calls
 * happen while the button is down but nothing NEW has arrived from SDL.
 * Ordinal_864/FUN_000579e4 treat "no new message this call" as "no
 * message at all" and return early without ever reading DAT_0023c448 or
 * calling poll_mouse_event() -- so DAT_0023c63c (still 1, genuinely
 * held) never even gets checked, and character_generator_touch_select's
 * position-check loop (gated on seeing a positive code from that same
 * poll chain) never runs even once. Confirmed via diagnostics: a click
 * with a real hold duration confirmed the current selection on the very
 * first poll after button-down, before release ever happened. Keeping
 * g_mouse_event_pending true for every poll while the button is
 * physically down (not just the instant a new SDL event arrives) fixes
 * this by making poll_mouse_event() get consulted continuously, the
 * same way a real WinCE input driver would keep reporting a held
 * touch. */
static int g_mouse_button_held = 0;

static int translate_vk(SDL_Keycode sym) {
    switch (sym) {
        case SDLK_UP: return VK_UP;
        case SDLK_DOWN: return VK_DOWN;
        case SDLK_LEFT: return VK_LEFT;
        case SDLK_RIGHT: return VK_RIGHT;
        case SDLK_RETURN: return VK_RETURN;
        /* SDLK_SPACE is deliberately NOT mapped here: the spacebar must
         * reach the game only as a WM_CHAR (0x20) via SDL_TEXTINPUT so it
         * types a literal space in the name-entry field. Sending a
         * WM_KEYDOWN for it too made handle_keyboard_message match it against the
         * "button A" key (see GXGetDefaultKeys) and emit event 0x91,
         * which that field handles as delete -- so every space deleted
         * the character before it. */
        case SDLK_LCTRL:
        case SDLK_RCTRL: return VK_CONTROL;
        case SDLK_ESCAPE: return VK_ESCAPE;
        default: return 0;
    }
}

void uw_pump_events(void) {
    SDL_Event ev;
    if (!g_win) return;
    demomode_pump();

    if (g_mouseup_deferred) {
        /* See g_mouseup_deferred's comment. Dispatch the button-up we
         * held back last call now, one full poll cycle after the
         * matching button-down. */
        g_mouseup_deferred = 0;
        g_mouse_button_held = 0;
        g_mouse_event_pending = 1;
        FUN_00077dd0(0, 0x202u, 0, g_mouseup_deferred_lparam);
        return;
    }

    while (SDL_PollEvent(&ev)) {
        switch (ev.type) {
            case SDL_QUIT:
                g_running = 0;
                SDL_DestroyTexture(g_tex);
                SDL_DestroyRenderer(g_ren);
                SDL_DestroyWindow(g_win);
                SDL_Quit();
                exit(0);
                break;
            case SDL_KEYDOWN:
            case SDL_KEYUP: {
                /* SDL auto-repeats a held key as a stream of SDL_KEYDOWN
                 * events; the game's menu/chargen "wait for one keypress"
                 * loops (e.g. FUN_00024840) treat every keydown as a
                 * fresh confirm/select, so a held Enter blasts through
                 * many unrelated screens in a fraction of a second
                 * (confirmed via a state-trace: 3 full character-
                 * generation cycles logged almost instantly). Drop
                 * repeats so each physical press yields exactly one
                 * keydown, matching how a deliberate tap actually
                 * behaves. */
                if (ev.type == SDL_KEYDOWN && ev.key.repeat) {
                    break;
                }
                int vk = translate_vk(ev.key.keysym.sym);
                if (vk != 0) {
                    unsigned int msg = (ev.type == SDL_KEYDOWN) ? 0x100u : 0x101u;
                    handle_keyboard_message(0, msg, (unsigned int)vk);
                }
                /* Backspace/Enter don't come through SDL_TEXTINPUT (that
                 * event only fires for printable characters), but the
                 * game's WM_CHAR handler (handle_keyboard_message, message 0x102)
                 * treats any raw byte value the same way regardless of
                 * how it arrived, so send them here as the real
                 * control-character bytes a Windows WM_CHAR would carry. */
                if (ev.type == SDL_KEYDOWN) {
                    if (ev.key.keysym.sym == SDLK_BACKSPACE) {
                        handle_keyboard_message(0, 0x102u, 0x08u);
                    } else if (ev.key.keysym.sym == SDLK_RETURN) {
                        handle_keyboard_message(0, 0x102u, 0x0Du);
                    }
                }
                /* Real Windows delivers WM_KEYDOWN and WM_CHAR as
                 * separate messages, polled one at a time -- the game's
                 * input loop (FUN_000579e4 et al) clears its single
                 * pending-input slot (DAT_0023c448) and re-reads it
                 * fresh on every poll. SDL instead reports a keydown and
                 * its matching SDL_TEXTINPUT in the same batch; draining
                 * both in one uw_pump_events() call let Space's mapped
                 * button code (VK_SPACE -> 0x4a, a direct assignment)
                 * get bitwise-ORed with its char code (0x20) in the same
                 * slot before the game ever polled in between, producing
                 * neither a clean space char nor a clean button press
                 * (confirmed: Space did nothing in the name field).
                 * Stop draining after any key event so its SDL_TEXTINPUT
                 * counterpart (if any) is left in SDL's own queue for
                 * the *next* pump call instead, landing on its own
                 * freshly-cleared poll. */
                return;
            }
            case SDL_TEXTINPUT: {
                /* Real typed characters (respects keyboard layout/shift
                 * state) -- forwarded as WM_CHAR (0x102), matching
                 * handle_keyboard_message's real-text-input path. Only ever one
                 * pending-input slot is read per poll (see the keydown
                 * case above), so stop after this event too. */
                for (const char *p = ev.text.text; *p; p++) {
                    unsigned char c = (unsigned char)*p;
                    if (c < 0x80) {
                        handle_keyboard_message(0, 0x102u, (unsigned int)c);
                    }
                }
                return;
            }
            case SDL_MOUSEBUTTONDOWN:
            case SDL_MOUSEBUTTONUP:
            case SDL_MOUSEMOTION: {
                /* The real device's stylus reports taps in the portrait
                 * "hardware" framebuffer's own 240x320 coordinate space
                 * (see the HW_W/HW_H comment up top), packed as a real
                 * Windows lParam (y<<16)|x -- FUN_00077dd0 (recovered from
                 * the original binary's mouse message-dispatch table,
                 * separate from handle_keyboard_message's keyboard-only table) does
                 * its own portrait Y flip internally, so just convert SDL's
                 * landscape window coordinates into the same un-rotated
                 * portrait space GXEndDraw's blit reads from:
                 * portrait_x = landscape_y, portrait_y = (HW_H-1) -
                 * landscape_x (inverse of GXEndDraw's rotation -- note
                 * HW_H, the portrait *height*, here: landscape_x ranges
                 * over the full 0..319 GX_W span, which is what portrait_y
                 * must cover too). Go through SDL_RenderWindowToLogical
                 * rather than a fixed /2 scale since the window is
                 * resizable.
                 *
                 * ev.button.x/y (and ev.motion.x/y) come back at half the
                 * scale SDL_GetWindowSize/SDL_GetRendererOutputSize agree
                 * on, on at least one real HiDPI Mac setup tested (SDL2
                 * 2.32.4) -- confirmed by comparing against
                 * SDL_GetGlobalMouseState() - SDL_GetWindowPosition(),
                 * which does NOT show the same halving. Use that instead
                 * of the raw event fields. */
                int win_x, win_y;
                {
                    int gx = 0, gy = 0, wx = 0, wy = 0;
                    SDL_GetGlobalMouseState(&gx, &gy);
                    SDL_GetWindowPosition(g_win, &wx, &wy);
                    win_x = gx - wx;
                    win_y = gy - wy;
                }
                float lx, ly;
                SDL_RenderWindowToLogical(g_ren, win_x, win_y, &lx, &ly);
                int landscape_x = (int)lx, landscape_y = (int)ly;
                int portrait_x = landscape_y;
                int portrait_y = (HW_H - 1) - landscape_x;
                int lparam = (portrait_y << 16) | (portrait_x & 0xffff);
                unsigned int msg = (ev.type == SDL_MOUSEBUTTONDOWN) ? 0x201u
                                  : (ev.type == SDL_MOUSEBUTTONUP) ? 0x202u
                                  : 0x200u;
                if (ev.type == SDL_MOUSEBUTTONDOWN) {
                    fprintf(stderr, "[mouse] click win=(%d,%d) landscape=(%d,%d) portrait=(%d,%d) %s\n",
                            win_x, win_y, landscape_x, landscape_y, portrait_x, portrait_y,
                            (portrait_x > 200 && portrait_x < 0xf0) ? "IN on-screen-keyboard strip" : "outside keyboard strip");
                }
                if (ev.type != SDL_MOUSEMOTION && ev.button.button != SDL_BUTTON_LEFT) {
                    break;
                }
                if (ev.type == SDL_MOUSEBUTTONUP) {
                    /* Hold this back one poll cycle -- see
                     * g_mouseup_deferred's comment. Still report a
                     * pending message this call (without touching
                     * DAT_0023c63c yet) so callers that only consult
                     * poll_mouse_event() after seeing "a message
                     * arrived" get a chance to read the still-held-down
                     * state first. */
                    g_mouseup_deferred = 1;
                    g_mouseup_deferred_lparam = lparam;
                    g_mouse_event_pending = 1;
                    return;
                }
                if (ev.type == SDL_MOUSEBUTTONDOWN) {
                    g_mouse_button_held = 1;
                }
                g_mouse_event_pending = 1;
                FUN_00077dd0(0, msg, 0, lparam);
                return;
            }
            case SDL_WINDOWEVENT:
                if (ev.window.event == SDL_WINDOWEVENT_FOCUS_GAINED)
                    handle_keyboard_message(0, 7, 0);
                else if (ev.window.event == SDL_WINDOWEVENT_FOCUS_LOST)
                    handle_keyboard_message(0, 8, 0);
                break;
        }
    }

    /* No new SDL event this call -- see g_mouse_button_held's comment
     * for why we still need to signal "a message is pending" here
     * whenever the button remains physically held. */
    if (g_mouse_button_held) {
        g_mouse_event_pending = 1;
    }
}

int GXOpenDisplay(void *hwnd, unsigned int flags) {
    (void)hwnd;
    (void)flags;
    fprintf(stderr, "[gx] GXOpenDisplay: opening %dx%d SDL window (game's GAPI display init)\n",
            GX_W, GX_H);
    if (SDL_Init(SDL_INIT_VIDEO) != 0) {
        fprintf(stderr, "SDL_Init failed: %s\n", SDL_GetError());
        return 0;
    }
    g_win = SDL_CreateWindow("Ultima Underworld", SDL_WINDOWPOS_CENTERED,
                              SDL_WINDOWPOS_CENTERED, GX_W * 2, GX_H * 2,
                              SDL_WINDOW_SHOWN | SDL_WINDOW_RESIZABLE);
    if (!g_win) {
        fprintf(stderr, "SDL_CreateWindow failed: %s\n", SDL_GetError());
        return 0;
    }
    {
        int wx = 0, wy = 0, ww = 0, wh = 0;
        SDL_GetWindowPosition(g_win, &wx, &wy);
        SDL_GetWindowSize(g_win, &ww, &wh);
        int numDisplays = SDL_GetNumVideoDisplays();
        fprintf(stderr, "[gx] window created at pos=(%d,%d) size=(%d,%d), %d display(s)\n", wx, wy, ww, wh, numDisplays);
        for (int i = 0; i < numDisplays; i++) {
            SDL_Rect bounds;
            float ddpi = 0, hdpi = 0, vdpi = 0;
            SDL_GetDisplayBounds(i, &bounds);
            SDL_GetDisplayDPI(i, &ddpi, &hdpi, &vdpi);
            fprintf(stderr, "[gx] display %d: bounds=(%d,%d,%d,%d) dpi=(%.1f,%.1f,%.1f)\n",
                    i, bounds.x, bounds.y, bounds.w, bounds.h, ddpi, hdpi, vdpi);
        }
    }
    SDL_StartTextInput();
    /* VSYNC matters beyond just avoiding tearing here: several original
     * routines (e.g. FUN_000122d4's fade-in-from-black transition) pace
     * themselves purely by how long each GXEndDraw-equivalent present
     * call naturally takes, with no explicit delay of their own -- real
     * WinCE hardware's slow per-pixel math and real hardware blit made
     * that implicitly visible (confirmed: FUN_000122d4's 8-step fade
     * plus final restore pass completed in 0ms without this, i.e.
     * instantly/imperceptibly, on modern hardware). Real display refresh
     * pacing via vsync restores roughly the intended per-step timing
     * without adding an artificial sleep/delay this decompile never had. */
    g_ren = SDL_CreateRenderer(g_win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
    if (!g_ren) g_ren = SDL_CreateRenderer(g_win, -1, SDL_RENDERER_PRESENTVSYNC);
    if (!g_ren) g_ren = SDL_CreateRenderer(g_win, -1, 0);
    {
        SDL_RendererInfo info;
        SDL_GetRendererInfo(g_ren, &info);
        fprintf(stderr, "[gx] renderer=%s vsync=%s\n", info.name,
                (info.flags & SDL_RENDERER_PRESENTVSYNC) ? "yes" : "no");
    }
    SDL_RenderSetLogicalSize(g_ren, GX_W, GX_H);
    g_tex = SDL_CreateTexture(g_ren, SDL_PIXELFORMAT_RGB565,
                               SDL_TEXTUREACCESS_STREAMING, GX_W, GX_H);
    memset(g_framebuffer, 0, sizeof(g_framebuffer));
    demomode_init();
    return 1;
}

int uw_take_mouse_event_pending(void) {
    int had = g_mouse_event_pending;
    g_mouse_event_pending = 0;
    return had;
}

int uw_inject_mouse_down(int window_x, int window_y) {
    /* For scripted/unattended testing: warps the real OS cursor into the
     * window at the given point (window points, not logical/portrait
     * coordinates) then pushes a genuine SDL_MOUSEBUTTONDOWN event, so
     * this exercises the exact same code path a real click does --
     * unlike demomode's CLICK command, which calls FUN_00077dd0 directly
     * and bypasses uw_pump_events (and therefore g_mouse_event_pending)
     * entirely. gx_stub.c's own mouse handling reads the cursor position
     * via SDL_GetGlobalMouseState() (see its HiDPI-workaround comment),
     * not the event's own x/y fields, so the warp is what actually
     * controls where the click lands. Split from the button-up half (see
     * uw_inject_mouse_up) so tests can insert a real multi-poll gap
     * between them, matching how an actual held click behaves -- a
     * same-instant down+up pair hides bugs that only show up once
     * genuine wall-clock time (and therefore multiple uw_pump_events()
     * calls with nothing new queued in between) separates the two. */
    if (!g_win) return 0;
    SDL_WarpMouseInWindow(g_win, window_x, window_y);
    SDL_PumpEvents();
    SDL_Event down = {0};
    down.type = SDL_MOUSEBUTTONDOWN;
    down.button.button = SDL_BUTTON_LEFT;
    down.button.x = window_x;
    down.button.y = window_y;
    SDL_PushEvent(&down);
    return 1;
}

int uw_inject_mouse_up(int window_x, int window_y) {
    /* See uw_inject_mouse_down's comment. */
    if (!g_win) return 0;
    SDL_WarpMouseInWindow(g_win, window_x, window_y);
    SDL_PumpEvents();
    SDL_Event up = {0};
    up.type = SDL_MOUSEBUTTONUP;
    up.button.button = SDL_BUTTON_LEFT;
    up.button.x = window_x;
    up.button.y = window_y;
    SDL_PushEvent(&up);
    return 1;
}

int uw_inject_mouse_click(int window_x, int window_y) {
    /* Instantaneous down+up, both already queued before the game ever
     * polls -- see uw_inject_mouse_down's comment for why that's not
     * fully representative of a real click's timing. */
    if (!uw_inject_mouse_down(window_x, window_y)) return 0;
    return uw_inject_mouse_up(window_x, window_y);
}

int uw_save_screenshot(const char *path) {
    if (!g_ren) return 0;
    int w = 0, h = 0;
    SDL_GetRendererOutputSize(g_ren, &w, &h);
    /* RGB24 (no alpha) rather than ARGB8888 -- some BMP readers (macOS's
       `sips` among them) choke on 32bpp BMPs with an alpha channel. */
    SDL_Surface *surf = SDL_CreateRGBSurfaceWithFormat(0, w, h, 24, SDL_PIXELFORMAT_RGB24);
    if (!surf) {
        fprintf(stderr, "[gx] screenshot: SDL_CreateRGBSurfaceWithFormat failed: %s\n", SDL_GetError());
        return 0;
    }
    if (SDL_RenderReadPixels(g_ren, NULL, SDL_PIXELFORMAT_RGB24, surf->pixels, surf->pitch) != 0) {
        fprintf(stderr, "[gx] screenshot: SDL_RenderReadPixels failed: %s\n", SDL_GetError());
        SDL_FreeSurface(surf);
        return 0;
    }
    int ok = SDL_SaveBMP(surf, path) == 0;
    if (!ok) {
        fprintf(stderr, "[gx] screenshot: SDL_SaveBMP failed: %s\n", SDL_GetError());
    } else {
        fprintf(stderr, "[gx] screenshot saved to %s (%dx%d)\n", path, w, h);
    }
    SDL_FreeSurface(surf);
    return ok;
}

static void debug_mkdir_p(const char *path) {
    char buf[300];
    size_t len = strlen(path);
    if (len >= sizeof(buf)) return;
    strcpy(buf, path);
    for (char *p = buf + 1; *p; p++) {
        if (*p == '/') {
            *p = '\0';
            mkdir(buf, 0755);
            *p = '/';
        }
    }
    mkdir(buf, 0755);
}

void uw_debug_dump_gr_entry(const char *gr_name, int entry_index,
                             const unsigned char *entry_data, int entry_size) {
    static int enabled = -1;
    if (enabled < 0) {
        const char *env = getenv("UW_DEBUG_DUMP_GR");
        enabled = (env && env[0] && strcmp(env, "0") != 0);
    }
    if (!enabled) return;

    /* See the header comment: byte0=format, byte1=width, byte2=height,
       bytes3-4 unknown, then width*height raw palette-index pixels.
       Confirmed via bitmap_blit_to_framebuffer's real param semantics
       (its param_4/height arg is clipped against 200, param_5/width arg
       against 0x140=320) traced back through FUN_0006a200's blit call
       and FUN_0006a0c8's header-byte-to-record-field assignment -- a
       width<->height swap here previously produced transposed BMPs for
       every non-square entry. */
    if (entry_size < 5) return;
    int width = entry_data[1];
    int height = entry_data[2];
    int payload_len = entry_size - 5;
    if (width == 0 || height == 0 || width * height > payload_len) {
        fprintf(stderr, "[gr-dump] %s entry %d: header dims %dx%d don't fit a %d-byte payload -- skipped\n",
                gr_name, entry_index, width, height, payload_len);
        return;
    }

    char dir[280];
    snprintf(dir, sizeof(dir), "debug/gr/%s", gr_name);
    debug_mkdir_p(dir);

    char path[320];
    snprintf(path, sizeof(path), "%s/%03d.bmp", dir, entry_index);

    SDL_Surface *surf = SDL_CreateRGBSurfaceWithFormat(0, width, height, 8, SDL_PIXELFORMAT_INDEX8);
    if (!surf) {
        fprintf(stderr, "[gr-dump] SDL_CreateRGBSurfaceWithFormat failed: %s\n", SDL_GetError());
        return;
    }

    unsigned char *pal = uw_get_default_palette(gr_name);
    SDL_Color colors[256];
    for (int i = 0; i < 256; i++) {
        colors[i].r = pal[i * 3 + 0];
        colors[i].g = pal[i * 3 + 1];
        colors[i].b = pal[i * 3 + 2];
        colors[i].a = 255;
    }
    SDL_SetPaletteColors(surf->format->palette, colors, 0, 256);

    const unsigned char *src = entry_data + 5;
    for (int y = 0; y < height; y++) {
        memcpy((unsigned char *)surf->pixels + y * surf->pitch, src + y * width, width);
    }

    if (SDL_SaveBMP(surf, path) != 0) {
        fprintf(stderr, "[gr-dump] SDL_SaveBMP failed for %s: %s\n", path, SDL_GetError());
    }
    SDL_FreeSurface(surf);
}

void debug_framebuffer_dump(const char *tag) {
    static int enabled = -1;
    if (enabled < 0) {
        const char *env = getenv("UW_DEBUG_DRAW");
        enabled = (env && env[0] && strcmp(env, "0") != 0);
    }
    if (!enabled) return;

    /* One directory per run, named for when the run started; every dump
       this process makes lands under it. Created lazily so a run that
       never draws doesn't leave an empty folder behind. */
    static char run_dir[300];
    static int run_dir_ready = 0;
    if (!run_dir_ready) {
        time_t now = time(NULL);
        struct tm tm_now;
        localtime_r(&now, &tm_now);
        char ts[32];
        strftime(ts, sizeof(ts), "%Y%m%d_%H%M%S", &tm_now);
        snprintf(run_dir, sizeof(run_dir), "debug/drawdumps/%s", ts);
        debug_mkdir_p(run_dir);
        run_dir_ready = 1;
    }

    static unsigned int counter = 0;
    char path[360];
    snprintf(path, sizeof(path), "%s/%06u_%s.bmp", run_dir, counter++, tag ? tag : "draw");

    /* g_uw_framebuffer is the game's internal 320x240 RGB565 software
       framebuffer that every graphics.c draw primitive writes into (see
       its declaration comment in uw.c) -- already landscape-oriented, no
       rotation needed (unlike g_framebuffer/g_display_buf below, which are
       the portrait "hardware" buffer this gets flushed to later). */
    SDL_Surface *surf = SDL_CreateRGBSurfaceWithFormat(0, GX_W, GX_H, 16, SDL_PIXELFORMAT_RGB565);
    if (!surf) {
        fprintf(stderr, "[draw-dump] SDL_CreateRGBSurfaceWithFormat failed: %s\n", SDL_GetError());
        return;
    }
    memcpy(surf->pixels, g_uw_framebuffer, (size_t)GX_W * GX_H * 2);
    if (SDL_SaveBMP(surf, path) != 0) {
        fprintf(stderr, "[draw-dump] SDL_SaveBMP failed for %s: %s\n", path, SDL_GetError());
    }
    SDL_FreeSurface(surf);
}

int GXCloseDisplay(void) {
    fprintf(stderr, "[gx] GXCloseDisplay\n");
    if (g_tex) { SDL_DestroyTexture(g_tex); g_tex = NULL; }
    if (g_ren) { SDL_DestroyRenderer(g_ren); g_ren = NULL; }
    if (g_win) { SDL_DestroyWindow(g_win); g_win = NULL; }
    return 1;
}

void *GXBeginDraw(void) {
    static int logged = 0;
    if (!logged) {
        fprintf(stderr, "[gx] GXBeginDraw: game locking framebuffer for the first time "
                        "(further calls not logged, this runs every frame)\n");
        logged = 1;
    }
    if (!g_running) exit(0);
    return g_framebuffer;
}

int GXEndDraw(void) {
    if (!g_tex) return 0;
    /* Un-rotate the portrait "hardware" framebuffer back to a natural
     * landscape image for display -- see the HW_W/HW_H comment above.
     * landscape(x,y) = portrait((HW_W-1-x), y), i.e. the inverse of the
     * clockwise rotation the game's own blit performs. */
    for (int y = 0; y < GX_H; y++) {
        for (int x = 0; x < GX_W; x++) {
            g_display_buf[y * GX_W + x] = g_framebuffer[(HW_H - 1 - x) * HW_W + y];
        }
    }
    SDL_UpdateTexture(g_tex, NULL, g_display_buf, GX_W * sizeof(unsigned short));
    SDL_RenderClear(g_ren);
    SDL_RenderCopy(g_ren, g_tex, NULL, NULL);
    SDL_RenderPresent(g_ren);

    /* Real GAPI hardware's GXEndDraw blocked until the next display
     * refresh -- that's what gave the whole game its effective 60Hz
     * tick rate (every polling/redraw loop in the game funnels through
     * here via FUN_00022f0c), with no explicit frame-rate code of its
     * own anywhere in the decompile. SDL_RENDERER_PRESENTVSYNC alone
     * doesn't reliably reproduce that on this host -- desktop GPU
     * drivers can queue/batch several presents before actually blocking
     * on a vsync (confirmed: FUN_000122d4's fade-in, which calls
     * GXEndDraw 8 times in a tight loop, measured only ~19ms total
     * instead of something near 8 * 16.67ms). Explicitly cap how often
     * a call here can complete, so every present -- not just whichever
     * ones the driver happens to actually block on -- gets real ~60Hz
     * pacing. */
    static Uint32 last_frame_ticks = 0;
    const Uint32 frame_budget_ms = 1000 / 60;
    Uint32 now = SDL_GetTicks();
    if (last_frame_ticks != 0) {
        Uint32 elapsed = now - last_frame_ticks;
        if (elapsed < frame_budget_ms) {
            SDL_Delay(frame_budget_ms - elapsed);
        }
    }
    last_frame_ticks = SDL_GetTicks();

    return 1;
}

int GXOpenInput(void) { fprintf(stderr, "[gx] GXOpenInput\n"); return 1; }
int GXCloseInput(void) { fprintf(stderr, "[gx] GXCloseInput\n"); return 1; }
int GXSuspend(void) { fprintf(stderr, "[gx] GXSuspend (window lost focus)\n"); return 1; }
int GXResume(void) { fprintf(stderr, "[gx] GXResume (window gained focus)\n"); return 1; }

void *GXGetDisplayProperties(void) {
    fprintf(stderr, "[gx] GXGetDisplayProperties: reporting %dx%d 16bpp RGB565 (portrait "
                    "hardware framebuffer; presented rotated to a %dx%d landscape window)\n",
            HW_W, HW_H, GX_W, GX_H);
    static GxDisplayProps props;
    props.cxWidth = HW_W;
    props.cyHeight = HW_H;
    props.cbxPitch = 2;
    props.cbyPitch = HW_W * 2;
    props.cBPP = 16;
    props.ffFormat = KF_DIRECT565;
    return &props;
}

void *GXGetDefaultKeys(void *outBuffer) {
    fprintf(stderr, "[gx] GXGetDefaultKeys: mapping arrows/ctrl/esc/enter to the game's "
                    "D-pad and B/C/Start buttons (A left unbound -- see below)\n");
    GxKeyList *kl = (GxKeyList *)outBuffer;
    if (!kl) return outBuffer;
    memset(kl, 0, sizeof(*kl));
    /* Button A was VK_SPACE, which collided with typing a space in the
     * name-entry field (handle_keyboard_message turns a button-A keydown into event
     * 0x91 = delete-previous-char). Use a WinCE app-button VK instead --
     * the shape real GAPI returns -- so the spacebar is free. Desktop
     * "activate" is the mouse click, so leaving A without a keyboard
     * binding costs nothing here. */
    kl->a.vk = VK_APP1;
    kl->b.vk = VK_CONTROL;
    kl->c.vk = VK_ESCAPE;
    kl->start.vk = VK_RETURN;
    kl->up.vk = VK_UP;
    kl->down.vk = VK_DOWN;
    kl->left.vk = VK_LEFT;
    kl->right.vk = VK_RIGHT;
    return outBuffer;
}
