/* Records real (non-synthetic) input events to a demo-format file as they happen during a live
   session, so a gameplay sequence -- including a crash -- can be handed back to demomode.c as a
   --demo-file and replayed exactly. */
#ifndef DEMOCAPTURE_H
#define DEMOCAPTURE_H

#include <SDL.h>

/* Call once after SDL is initialized (same point as demomode_init). No-op
 * if recording is disabled (see --record-demofile's own comment). */
void democapture_init();

/* Call once per real uw_pump_events() invocation (i.e. once per actual game tick), BEFORE the SDL
   event loop -- advances the recorder's own idle-tick counter, the sole source of a recording's
   WAIT lines (see democapture.c's top comment for why this is tick-counted, not wall-clock timed). */
void democapture_tick();

/* Call from uw_pump_events for every KEYBOARD event actually pulled off SDL's queue, BEFORE any
   demo-injected/synthetic filtering -- democapture does its own synthetic check (keysym.unused ==
   UW_SYNTH_KEY) so it only records genuine input... */
void democapture_record_event(const SDL_Event *ev);

/* Call from uw_pump_events's mouse-event case, AFTER it has computed the real window-relative
   (win_x, win_y) for the event -- NOT ev.motion.x/y or ev.button.x/y directly... */
void democapture_record_mouse(Uint32 event_type, Uint8 button, Uint32 which, int win_x, int win_y);

/* Flush and close the recording file. Call once before the process exits
 * (every exit path -- SDL_QUIT and the g_running check both call this). */
void democapture_shutdown();

#endif
