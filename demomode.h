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

#endif
