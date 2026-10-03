#ifndef HEADERS_LEVEL_H
#define HEADERS_LEVEL_H

/* Declarations for level.c: level loading (object-table arena, per-
 * level object load, dungeon-view/level entry points). Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "../../uw.h"

/* Port-only timing flag consumed by the first entry after character creation. */
extern bool g_new_game_entry_pause_pending;

#endif
