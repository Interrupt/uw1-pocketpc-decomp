/* Records real (non-synthetic) input events to a demo-format file as they
 * happen during a live session, so a gameplay sequence -- including a
 * crash -- can be handed back to demomode.c as a UW_DEMO_FILE and
 * replayed exactly. See democapture.c for the format/pacing details and
 * the UW_RECORD_DEMOFILE env var (on by default). */
#ifndef DEMOCAPTURE_H
#define DEMOCAPTURE_H

#include <SDL.h>

/* Call once after SDL is initialized (same point as demomode_init). No-op
 * if recording is disabled (see UW_RECORD_DEMOFILE's own comment). */
void democapture_init(void);

/* Call once per real uw_pump_events() invocation (i.e. once per actual
 * game tick), BEFORE the SDL event loop -- advances the recorder's own
 * idle-tick counter, the sole source of a recording's WAIT lines (see
 * democapture.c's top comment for why this is tick-counted, not
 * wall-clock timed). No-op if recording is off or a demo is currently
 * being played back. */
void democapture_tick(void);

/* Call from uw_pump_events for every KEYBOARD event actually pulled off
 * SDL's queue, BEFORE any demo-injected/synthetic filtering -- democapture
 * does its own synthetic check (keysym.unused == UW_SYNTH_KEY) so it only
 * records genuine input, not a demo script's own injected events or its
 * own text-input echo. Mouse events are NOT handled here -- see
 * democapture_record_mouse below, which needs coordinates gx_stub.c
 * hasn't computed yet at the point this would otherwise be called. No-op
 * if recording is off, the event isn't a keyboard one, or it's not one
 * this recorder captures (e.g. auto-repeat). */
void democapture_record_event(const SDL_Event *ev);

/* Call from uw_pump_events's mouse-event case, AFTER it has computed the
 * real window-relative (win_x, win_y) for the event -- NOT ev.motion.x/y
 * or ev.button.x/y directly, which can read back at half scale on a
 * HiDPI display (see that call site's own comment) and would record a
 * click/drag that replays short of where it actually happened. which
 * (the SDL_Event's own button.which/motion.which) is passed through so
 * this can still recognize and skip a demo's own synthetic injection.
 * event_type is the raw SDL_MOUSEMOTION/SDL_MOUSEBUTTONDOWN/
 * SDL_MOUSEBUTTONUP; button is ev.button.button (ignored for motion). */
void democapture_record_mouse(Uint32 event_type, Uint8 button, Uint32 which, int win_x, int win_y);

/* Flush and close the recording file. Call once before the process exits
 * (every exit path -- SDL_QUIT and the g_running check both call this). */
void democapture_shutdown(void);

#endif
