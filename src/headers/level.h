#ifndef HEADERS_LEVEL_H
#define HEADERS_LEVEL_H

/* Declarations for level.c: level loading (object-table arena, per-
 * level object load, dungeon-view/level entry points). Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

/* Port-only timing flag consumed by the first entry after character creation. */
extern bool g_new_game_entry_pause_pending;

undefined4 teleport_object_to_level_tile();
void reset_level_arena_and_invalidate();
void enter_dungeon_view();
undefined4 init_level_object_arena();
void free_level_tile_arena();
int load_level_object_table();
void reset_level_object_arena();
int load_level();
int transition_to_level();
void save_or_restore_level_special_state();
undefined4 trigger_random_level_special_event();

#endif
