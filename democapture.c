/* Records real (non-synthetic) input events to a demo-format file as they
 * happen during a live session -- see democapture.h. The output is a
 * plain demomode.c script (DELAY/WAIT/SDLMOVE/SDLDOWN/SDLUP/SDLRDOWN/
 * SDLRUP/SDLKEYDOWN/SDLKEYUP lines) that can be handed straight back in
 * as UW_DEMO_FILE to replay the session, including a crash.
 *
 * Controlled by UW_RECORD_DEMOFILE, ON BY DEFAULT (checked by value, same
 * convention as UW_DEMO_KEEP_RUNNING elsewhere in this project -- unset
 * or any value other than "0"/"false"/"no" means on):
 *   UW_RECORD_DEMOFILE unset        -- on, recording to ./current-demo.txt
 *   UW_RECORD_DEMOFILE=0/false/no   -- off
 *   UW_RECORD_DEMOFILE=1/true/yes   -- on, ./current-demo.txt
 *   UW_RECORD_DEMOFILE=<path>       -- on, recording to <path> instead
 * Recording defaults to OFF (regardless of the above) when UW_DEMO_FILE
 * is also set -- i.e. a demomode playback/regression run doesn't also
 * spam a recording by default, since every existing demo_*.txt script and
 * run-regressions.sh's parallel-ish back-to-back runs would otherwise all
 * clobber the same default output path. Set UW_RECORD_DEMOFILE explicitly
 * to record a playback run anyway (e.g. to re-derive/tweak a script from
 * what it actually does).
 *
 * Pacing is tick-native, not wall-clock-ms-based, on BOTH sides -- an ms
 * bucket (even a fine one) is only ever an approximation of the real
 * per-frame tick rate, and any mismatch between the recorder's bucket
 * size and the game's actual frame delivery jitter still drifts replay
 * out of sync with how long the session actually took (confirmed live,
 * twice: a 100ms bucket compounded badly; a 16ms bucket -- matching
 * gx_stub.c's own ~60Hz frame-budget cap -- was closer but still
 * noticeably off). Instead: democapture_tick() is called once per real
 * uw_pump_events() invocation (i.e. once per actual game tick, which is
 * itself already paced to ~60Hz by GXEndDraw's own frame-budget delay,
 * see its comment) and just increments an integer idle-tick counter --
 * no timestamps, no division, no ms anywhere. A recorded event consumes
 * the current tick for itself and flushes however many idle ticks
 * preceded it as a plain "WAIT <count>" line. Since demomode_pump() on
 * the replay side also processes exactly one line per its own real pump
 * call when its delay is 0 (the new default DELAY value this recorder
 * writes -- see demomode.c's own comment), both sides are driven by the
 * SAME real tick source with no ms conversion anywhere in the pipeline,
 * so replay pacing tracks the recording as closely as the two processes'
 * own frame timing naturally allows.
 *
 * UW_RECORD_DELAY_MS, if explicitly set to a positive value, overrides
 * only the DELAY line WRITTEN to the file (for a deliberately slowed-
 * down replay, e.g. to watch it happen) -- it does not change how the
 * recorder itself counts ticks. */
#include "democapture.h"
#include "gx_stub.h"
#include "demomode.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static FILE *g_rec_file;
static int g_rec_delay_ms = 0;
static int g_rec_idle_ticks;

/* Same truthy/falsy-by-value convention as UW_DEMO_KEEP_RUNNING (see
   demomode.c) -- getenv() alone can't tell "explicitly disabled" from
   "unset", and both need to mean different things here (unset defaults
   ON; explicitly "0" must still mean OFF). */
static int env_is_falsy(const char *v) {
    return v && *v != '\0' &&
           (strcmp(v, "0") == 0 || strcasecmp(v, "false") == 0 || strcasecmp(v, "no") == 0);
}
static int env_is_boolean_truthy(const char *v) {
    return v[0] == '\0' || strcmp(v, "1") == 0 ||
           strcasecmp(v, "true") == 0 || strcasecmp(v, "yes") == 0;
}

void democapture_init(void) {
    const char *rec = getenv("UW_RECORD_DEMOFILE");
    const char *demo_file = getenv("UW_DEMO_FILE");

    if (rec) {
        if (env_is_falsy(rec)) return;
    } else if (demo_file) {
        /* Default OFF while also playing back a demo file -- see this
           file's own top comment for why. */
        return;
    }

    const char *path = "current-demo.txt";
    if (rec && !env_is_boolean_truthy(rec)) {
        /* Not a recognized boolean word -- treat the value itself as the
           output path. */
        path = rec;
    }

    const char *delay_env = getenv("UW_RECORD_DELAY_MS");
    if (delay_env) {
        int v = atoi(delay_env);
        if (v > 0) g_rec_delay_ms = v; /* overrides only the written DELAY line -- see top comment */
    }

    g_rec_file = fopen(path, "w");
    if (!g_rec_file) {
        fprintf(stderr, "[record] failed to open UW_RECORD_DEMOFILE=%s for writing\n", path);
        return;
    }
    setvbuf(g_rec_file, NULL, _IOLBF, 0); /* line-buffered: a crash mid-session shouldn't lose the tail */
    fprintf(g_rec_file, "# recorded session, replay with UW_DEMO_FILE=%s\n", path);
    fprintf(g_rec_file, "DELAY %d\n", g_rec_delay_ms);
    g_rec_idle_ticks = 0;
    fprintf(stderr, "[record] recording input to %s (delay=%dms, tick-native pacing)\n", path, g_rec_delay_ms);
}

void democapture_shutdown(void) {
    if (!g_rec_file) return;
    fclose(g_rec_file);
    g_rec_file = NULL;
}

static Uint32 g_rec_debug_start;
void democapture_tick(void) {
    if (!g_rec_file) return;
    if (demomode_active()) return; /* see democapture_record_event's own comment */
    if (getenv("UW_DEBUG_RECORDTICK")) {
        if (g_rec_debug_start == 0) g_rec_debug_start = SDL_GetTicks();
        Uint32 elapsed = SDL_GetTicks() - g_rec_debug_start;
        fprintf(stderr, "[recordtick] idle_ticks=%d elapsed_ms=%u\n", g_rec_idle_ticks + 1, elapsed);
    }
    g_rec_idle_ticks++;
}

/* Flushes however many idle ticks preceded the line about to be written
   (the current tick, already counted by this call's own democapture_tick(),
   belongs to that line itself, not to the idle count -- un-count it
   first). Called before every recorded line. */
static void flush_idle(void) {
    if (g_rec_idle_ticks > 0) g_rec_idle_ticks--;
    if (g_rec_idle_ticks > 0) {
        fprintf(g_rec_file, "WAIT %d\n", g_rec_idle_ticks);
    }
    g_rec_idle_ticks = 0;
}

/* Inverse of demomode.c's demo_translate_sdlkey: pick the same spelling a
   human would write for a recognized key, falling back to a raw 0xNN
   SDL_Keycode (which that parser also accepts) for anything else -- so
   every key round-trips, not just the named ones. */
static const char *sdlkey_to_name(SDL_Keycode kc, char *buf, size_t bufsz) {
    switch (kc) {
        case SDLK_LEFT: return "LEFT";
        case SDLK_RIGHT: return "RIGHT";
        case SDLK_UP: return "UP";
        case SDLK_DOWN: return "DOWN";
        case SDLK_RETURN: return "RETURN";
        case SDLK_ESCAPE: return "ESCAPE";
        case SDLK_SPACE: return "SPACE";
        case SDLK_BACKSPACE: return "BACKSPACE";
        case SDLK_TAB: return "TAB";
        case SDLK_LSHIFT: return "LSHIFT";
        case SDLK_RSHIFT: return "RSHIFT";
        case SDLK_LCTRL: return "LCTRL";
        case SDLK_RCTRL: return "RCTRL";
        default: break;
    }
    if (kc >= 33 && kc < 127) {
        /* Printable, non-space ASCII -- demo_translate_sdlkey reads a
           single-character token as its own lowercase SDL_Keycode. Space
           is handled above (a literal space can't be one whitespace-
           delimited token). */
        buf[0] = (char)kc;
        buf[1] = '\0';
        return buf;
    }
    snprintf(buf, bufsz, "0x%x", (unsigned)kc);
    return buf;
}

/* Belt-and-suspenders on top of the per-event UW_SYNTH_* tag checks below:
   demomode's own SDL_WarpMouseInWindow calls (in uw_inject_mouse_down/up/
   rdown/rup -- see their own comments) can make SDL generate an
   additional, genuinely REAL (untagged) SDL_MOUSEMOTION as a side effect
   of the warp itself, not just the explicitly-tagged event the injector
   pushes -- confirmed live, this leaked a couple of untagged SDLMOVE
   lines into a recording taken during a demo playback run before this
   check was added. Suppressing everything for as long as a demo is
   actively feeding input (regardless of any tag) is the only fully
   robust way to guarantee demo playback never records itself, matching a
   direct user request. */
static int recording_suppressed(void) {
    return !g_rec_file || demomode_active();
}

void democapture_record_event(const SDL_Event *ev) {
    if (recording_suppressed()) return;

    switch (ev->type) {
        case SDL_KEYDOWN:
        case SDL_KEYUP: {
            if (ev->key.keysym.unused == UW_SYNTH_KEY) return; /* a demo script's own injection */
            if (ev->type == SDL_KEYDOWN && ev->key.repeat) return; /* held-key auto-repeat, not a fresh press */
            char namebuf[16];
            const char *name = sdlkey_to_name(ev->key.keysym.sym, namebuf, sizeof(namebuf));
            flush_idle();
            fprintf(g_rec_file, "%s %s\n", ev->type == SDL_KEYDOWN ? "SDLKEYDOWN" : "SDLKEYUP", name);
            break;
        }
        /* SDL_TEXTINPUT deliberately not recorded: uw_inject_key_down
           already pushes the matching SDL_TEXTINPUT itself for any
           printable key (see its own comment), so replaying the
           SDLKEYDOWN above regenerates it -- recording it too would
           double up (and demomode's own TYPE command, driven off it, is
           a separate, unrelated code path this recorder doesn't need). */
        default:
            break;
    }
}

void democapture_record_mouse(Uint32 event_type, Uint8 button, Uint32 which, int win_x, int win_y) {
    if (recording_suppressed()) return;
    if (which == UW_SYNTH_MOUSE) return;

    if (event_type == SDL_MOUSEMOTION) {
        flush_idle();
        fprintf(g_rec_file, "SDLMOVE %d %d\n", win_x, win_y);
        return;
    }
    if (button != SDL_BUTTON_LEFT && button != SDL_BUTTON_RIGHT) return;
    int is_right = button == SDL_BUTTON_RIGHT;
    int is_down = event_type == SDL_MOUSEBUTTONDOWN;
    const char *cmd = is_right ? (is_down ? "SDLRDOWN" : "SDLRUP")
                                : (is_down ? "SDLDOWN" : "SDLUP");
    flush_idle();
    fprintf(g_rec_file, "%s %d %d\n", cmd, win_x, win_y);
}
