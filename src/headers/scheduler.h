#ifndef HEADERS_SCHEDULER_H
#define HEADERS_SCHEDULER_H

/* Declarations for scheduler.c: the timed-effects queue (System
 * Shock's own term for this shared mechanism -- doors' open/close
 * swing, blood splats, combat highlights, ...). Pulls in uw.h itself
 * so this header is self-contained for any caller. */
#include "uw.h"

void scheduler_despawn_entry();
void scheduler_remove_entry();
void scheduler_finish_entry();
void scheduler_relink_entry();
uint scheduler_add_entry();
void scheduler_step_entry();
void scheduler_tick();
undefined4 spawn_scheduled_effect_object();
int scheduler_find_entry();
int scheduler_get_delay();
void scheduler_set_delay();
undefined4 scheduler_advance_effect();
undefined4 scheduler_load();
undefined4 scheduler_save();

#endif
