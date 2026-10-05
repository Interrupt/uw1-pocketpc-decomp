#ifndef HEADERS_CONTAINERS_H
#define HEADERS_CONTAINERS_H

/* Declarations for containers.c: the open-container/backpack view
 * stack, auto-place/empty logic, and equipped-item slot encoding.
 * Pulls in uw.h itself so this header is self-contained for any
 * caller. */
#include "uw.h"

extern char * g_open_container_list;
/* Globals defined in uw.c but also used by functions that now live in
   containers.c (the open-container/backpack view stack) -- extern'd
   here so both translation units see the same storage. */
extern undefined1 DAT_00085c88_backing[128];
#define DAT_00085c88 DAT_00085c88_backing[0]


void scroll_container_grid_up(void);
void scroll_container_grid_down(void);
undefined4 discard_container_contents();
void release_container_reference();
void free_open_container_chain();
void close_backpack_container();
void leave_nested_container_level();
void refresh_container_view();
void repopulate_container_grid_slots();
void open_backpack_container();
undefined4 auto_place_in_container();
void sum_container_weight();
void encode_equipped_item_index();
void decode_equipped_item_index();
undefined4 place_rune_in_bag();
void *get_equipped_item_at_slot();
void reset_equipment_and_container_state();
undefined4 empty_container_into_world();
void try_empty_container();

#endif
