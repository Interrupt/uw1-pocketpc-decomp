#ifndef HEADERS_SCHEDULER_H
#define HEADERS_SCHEDULER_H

/* Declarations for scheduler.c: the timed-effects queue (System Shock's own term for this shared
   mechanism -- doors' open/close swing, blood splats, combat highlights, ...). Pulls in uw.h itself
   so this header is self-contained for any caller. */
#include "uw.h"

extern short DAT_0010062c;
extern undefined1 g_scheduler_count;
extern char *g_scheduler_table;
#define DAT_00250778 g_scheduler_table[0]
#define DAT_00250779 g_scheduler_table[1]
#define DAT_0025077a g_scheduler_table[2]
#define DAT_0025077b g_scheduler_table[3]
#define DAT_0025077c g_scheduler_table[4]
#define DAT_0025077d g_scheduler_table[5]


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
