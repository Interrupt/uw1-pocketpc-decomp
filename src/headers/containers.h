#ifndef HEADERS_CONTAINERS_H
#define HEADERS_CONTAINERS_H

/* Declarations for containers.c: the open-container/backpack view stack, auto-place/empty logic,
   and equipped-item slot encoding. Pulls in uw.h itself so this header is self-contained for any
   caller. */
#include "uw.h"

extern char * g_open_container_list;
/* Globals defined in uw.c but also used by functions that now live in
   containers.c (the open-container/backpack view stack) -- extern'd
   here so both translation units see the same storage. */
extern undefined1 DAT_00085c88_backing[128];
#define DAT_00085c88 DAT_00085c88_backing[0]


void scroll_container_grid_up();
void scroll_container_grid_down();
int discard_container_contents(ushort *container, int remove_all);
void release_container_reference(char *container_link);
void free_open_container_chain();
void close_backpack_container();
void leave_nested_container_level();
void refresh_container_view();
void repopulate_container_grid_slots();
void open_backpack_container(short container_slot);
int auto_place_in_container(ushort *object, short slot);
void sum_container_weight(ushort *link_field, short *total_weight);
void encode_equipped_item_index(ushort *item_link, ushort *out_index);
void decode_equipped_item_index(ushort *saved_index, ushort *out_link);
int place_rune_in_bag(short *rune_object);
void *get_equipped_item_at_slot(short slot);
void reset_equipment_and_container_state();
int empty_container_into_world(ushort *container, short clear_flag);
void try_empty_container(ushort *container, int owned_by_player);

#endif
