#ifndef HEADERS_DOORS_H
#define HEADERS_DOORS_H

/* Declarations for doors.c: door open/close/toggle handlers and the
 * doors.GR frame-buffer allocator. Pulls in uw.h itself so this header
 * is self-contained for any caller. */
#include "uw.h"

void *alloc_door_frame_buffer(unsigned int byte_count);
void close_door_object(char *actor, ushort *door);
void open_door_object(ushort *door);
void toggle_door_object(char *actor, byte *door);
undefined4 spawn_scheduled_door_texture_object(void);
bool check_scheduled_object_level_match(short stored_level, ushort packed_tile);
void apply_special_object_use_effect(void);
void schedule_door_open_animation(ushort *door);
void adjust_door_close_animation_delay(ushort *door);

#endif
