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

/* Call from uw_pump_events for every event actually pulled off SDL's
 * queue, BEFORE any demo-injected/synthetic filtering -- democapture
 * does its own synthetic check (SDL_KEYDOWN/UP's keysym.unused ==
 * UW_SYNTH_KEY, SDL_MOUSEBUTTONDOWN/UP/MOTION's button.which/motion.which
 * == UW_SYNTH_MOUSE) so it only records genuine input, not a demo
 * script's own injected events or its own text-input echo. No-op if
 * recording is off or the event type isn't one it captures. */
void democapture_record_event(const SDL_Event *ev);

/* Flush and close the recording file. Call once before the process exits
 * (every exit path -- SDL_QUIT and the g_running check both call this). */
void democapture_shutdown(void);

#endif
