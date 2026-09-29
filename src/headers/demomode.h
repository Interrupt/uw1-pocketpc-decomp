/* Scripted input playback for unattended testing. Reads key names, one
 * per line, from the file named by the UW_DEMO_FILE env var and injects
 * them as real keydown/keyup events on a timer, so a crash sequence can
 * be reproduced without a human at the keyboard. */
#ifndef DEMOMODE_H
#define DEMOMODE_H

/* Call once after SDL is initialized. No-op if UW_DEMO_FILE isn't set. */
void demomode_init(void);

/* Call every time real events are pumped (uw_pump_events). Injects the
 * next queued input once its delay has elapsed; no-op once the file is
 * exhausted or if demo mode was never activated. */
void demomode_pump(void);

/* 1 while a demo file is still being played back (activated and not yet
 * exhausted/aborted), 0 otherwise. Lets the real event loop know a
 * physical keypress can be used to interrupt playback. */
int demomode_active(void);

/* Stop demo playback immediately: drop any in-progress HOLD/TYPE/WAIT,
 * release a still-held key, close the file, and hand control back to the
 * live keyboard/mouse. Does NOT exit the process (unlike running the file
 * to its end) -- the window stays open to poke at the resulting state.
 * No-op if no demo is active. Bound to the physical ESC key in
 * uw_pump_events. */
void demomode_abort(const char *reason);

#endif
