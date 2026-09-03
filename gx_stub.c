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

static int translate_vk(SDL_Keycode sym) {
    switch (sym) {
        case SDLK_UP: return VK_UP;
        case SDLK_DOWN: return VK_DOWN;
        case SDLK_LEFT: return VK_LEFT;
        case SDLK_RIGHT: return VK_RIGHT;
        case SDLK_RETURN: return VK_RETURN;
        case SDLK_SPACE: return VK_SPACE;
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
                    FUN_00077b2c(0, msg, (unsigned int)vk);
                }
                /* Backspace/Enter don't come through SDL_TEXTINPUT (that
                 * event only fires for printable characters), but the
                 * game's WM_CHAR handler (FUN_00077b2c, message 0x102)
                 * treats any raw byte value the same way regardless of
                 * how it arrived, so send them here as the real
                 * control-character bytes a Windows WM_CHAR would carry. */
                if (ev.type == SDL_KEYDOWN) {
                    if (ev.key.keysym.sym == SDLK_BACKSPACE) {
                        FUN_00077b2c(0, 0x102u, 0x08u);
                    } else if (ev.key.keysym.sym == SDLK_RETURN) {
                        FUN_00077b2c(0, 0x102u, 0x0Du);
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
                 * FUN_00077b2c's real-text-input path. Only ever one
                 * pending-input slot is read per poll (see the keydown
                 * case above), so stop after this event too. */
                for (const char *p = ev.text.text; *p; p++) {
                    unsigned char c = (unsigned char)*p;
                    if (c < 0x80) {
                        FUN_00077b2c(0, 0x102u, (unsigned int)c);
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
                 * separate from FUN_00077b2c's keyboard-only table) does
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
                g_mouse_event_pending = 1;
                FUN_00077dd0(0, msg, 0, lparam);
                return;
            }
            case SDL_WINDOWEVENT:
                if (ev.window.event == SDL_WINDOWEVENT_FOCUS_GAINED)
                    FUN_00077b2c(0, 7, 0);
                else if (ev.window.event == SDL_WINDOWEVENT_FOCUS_LOST)
                    FUN_00077b2c(0, 8, 0);
                break;
        }
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
    g_ren = SDL_CreateRenderer(g_win, -1, SDL_RENDERER_ACCELERATED);
    if (!g_ren) g_ren = SDL_CreateRenderer(g_win, -1, 0);
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

int uw_inject_mouse_click(int window_x, int window_y) {
    /* For scripted/unattended testing: warps the real OS cursor into the
     * window at the given point (window points, not logical/portrait
     * coordinates) then pushes genuine SDL_MOUSEBUTTONDOWN/UP events, so
     * this exercises the exact same code path a real click does --
     * unlike demomode's CLICK command, which calls FUN_00077dd0 directly
     * and bypasses uw_pump_events (and therefore g_mouse_event_pending)
     * entirely. gx_stub.c's own mouse handling reads the cursor position
     * via SDL_GetGlobalMouseState() (see its HiDPI-workaround comment),
     * not the event's own x/y fields, so the warp is what actually
     * controls where the click lands. */
    if (!g_win) return 0;
    SDL_WarpMouseInWindow(g_win, window_x, window_y);
    SDL_PumpEvents();
    SDL_Event down = {0};
    down.type = SDL_MOUSEBUTTONDOWN;
    down.button.button = SDL_BUTTON_LEFT;
    down.button.x = window_x;
    down.button.y = window_y;
    SDL_PushEvent(&down);
    SDL_Event up = {0};
    up.type = SDL_MOUSEBUTTONUP;
    up.button.button = SDL_BUTTON_LEFT;
    up.button.x = window_x;
    up.button.y = window_y;
    SDL_PushEvent(&up);
    return 1;
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
    fprintf(stderr, "[gx] GXGetDefaultKeys: mapping arrows/space/ctrl/esc/enter to the game's "
                    "D-pad and A/B/C/Start buttons\n");
    GxKeyList *kl = (GxKeyList *)outBuffer;
    if (!kl) return outBuffer;
    memset(kl, 0, sizeof(*kl));
    kl->a.vk = VK_SPACE;
    kl->b.vk = VK_CONTROL;
    kl->c.vk = VK_ESCAPE;
    kl->start.vk = VK_RETURN;
    kl->up.vk = VK_UP;
    kl->down.vk = VK_DOWN;
    kl->left.vk = VK_LEFT;
    kl->right.vk = VK_RIGHT;
    return outBuffer;
}
