#ifndef HEADERS_DOORS_H
#define HEADERS_DOORS_H

/* Declarations for doors.c: door open/close/toggle handlers and the
 * doors.GR frame-buffer allocator. Pulls in uw.h itself so this header
 * is self-contained for any caller. */
#include "uw.h"

void *alloc_door_frame_buffer();
void close_door_object();
void open_door_object();
void toggle_door_object();
undefined4 spawn_scheduled_door_texture_object();
bool check_scheduled_object_level_match();
void apply_special_object_use_effect();
void schedule_door_open_animation();
void adjust_door_close_animation_delay();

#endif
