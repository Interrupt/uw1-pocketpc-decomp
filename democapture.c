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
 * Pacing: UW_RECORD_DELAY_MS (default 100) sets the recorder's own tick
 * granularity -- both how idle gaps get quantized into WAIT lines, and
 * the DELAY line written at the top of the file, so a later replay paces
 * itself the same way by default (see demomode.c's DELAY command). Real
 * play has far finer-grained timing than that; this is a compromise
 * between faithful timing and file size, matching demomode.c's own
 * default playback delay's order of magnitude rather than one line per
 * video frame. */
#include "democapture.h"
#include "gx_stub.h"
#include "demomode.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static FILE *g_rec_file;
static int g_rec_delay_ms = 100;
static Uint32 g_rec_last_write_tick;

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
        if (v > 0) g_rec_delay_ms = v;
    }

    g_rec_file = fopen(path, "w");
    if (!g_rec_file) {
        fprintf(stderr, "[record] failed to open UW_RECORD_DEMOFILE=%s for writing\n", path);
        return;
    }
    setvbuf(g_rec_file, NULL, _IOLBF, 0); /* line-buffered: a crash mid-session shouldn't lose the tail */
    fprintf(g_rec_file, "# recorded session, replay with UW_DEMO_FILE=%s\n", path);
    fprintf(g_rec_file, "DELAY %d\n", g_rec_delay_ms);
    g_rec_last_write_tick = SDL_GetTicks();
    fprintf(stderr, "[record] recording input to %s (delay=%dms)\n", path, g_rec_delay_ms);
}

void democapture_shutdown(void) {
    if (!g_rec_file) return;
    fclose(g_rec_file);
    g_rec_file = NULL;
}

/* Quantizes the real elapsed time since the last written line into whole
   g_rec_delay_ms ticks and, if any passed, writes a WAIT line for them --
   called before every other line so a gap between inputs replays at
   roughly the pace it was recorded at. Snaps g_rec_last_write_tick to
   `now` exactly (not to the ticks-quantized value) so rounding remainders
   don't accumulate across many idle periods. */
static void flush_idle(Uint32 now) {
    Uint32 elapsed = now - g_rec_last_write_tick;
    int ticks = (int)(elapsed / (Uint32)g_rec_delay_ms);
    if (ticks > 0) {
        fprintf(g_rec_file, "WAIT %d\n", ticks);
    }
    g_rec_last_write_tick = now;
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

void democapture_record_event(const SDL_Event *ev) {
    if (!g_rec_file) return;
    /* Belt-and-suspenders on top of the per-event UW_SYNTH_* tag checks
       below: demomode's own SDL_WarpMouseInWindow calls (in
       uw_inject_mouse_down/up/rdown/rup -- see their own comments) can
       make SDL generate an additional, genuinely REAL (untagged)
       SDL_MOUSEMOTION as a side effect of the warp itself, not just the
       explicitly-tagged event the injector pushes -- confirmed live,
       this leaked a couple of untagged SDLMOVE lines into a recording
       taken during a demo playback run before this check was added.
       Suppressing everything for as long as a demo is actively feeding
       input (regardless of any tag) is the only fully robust way to
       guarantee demo playback never records itself, matching a direct
       user request. */
    if (demomode_active()) return;
    Uint32 now = SDL_GetTicks();

    switch (ev->type) {
        case SDL_KEYDOWN:
        case SDL_KEYUP: {
            if (ev->key.keysym.unused == UW_SYNTH_KEY) return; /* a demo script's own injection */
            if (ev->type == SDL_KEYDOWN && ev->key.repeat) return; /* held-key auto-repeat, not a fresh press */
            char namebuf[16];
            const char *name = sdlkey_to_name(ev->key.keysym.sym, namebuf, sizeof(namebuf));
            flush_idle(now);
            fprintf(g_rec_file, "%s %s\n", ev->type == SDL_KEYDOWN ? "SDLKEYDOWN" : "SDLKEYUP", name);
            break;
        }
        case SDL_MOUSEMOTION: {
            if (ev->motion.which == UW_SYNTH_MOUSE) return;
            flush_idle(now);
            fprintf(g_rec_file, "SDLMOVE %d %d\n", ev->motion.x, ev->motion.y);
            break;
        }
        case SDL_MOUSEBUTTONDOWN:
        case SDL_MOUSEBUTTONUP: {
            if (ev->button.which == UW_SYNTH_MOUSE) return;
            if (ev->button.button != SDL_BUTTON_LEFT && ev->button.button != SDL_BUTTON_RIGHT) return;
            int is_right = ev->button.button == SDL_BUTTON_RIGHT;
            int is_down = ev->type == SDL_MOUSEBUTTONDOWN;
            const char *cmd = is_right ? (is_down ? "SDLRDOWN" : "SDLRUP")
                                        : (is_down ? "SDLDOWN" : "SDLUP");
            flush_idle(now);
            fprintf(g_rec_file, "%s %d %d\n", cmd, ev->button.x, ev->button.y);
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
