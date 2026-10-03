#ifndef HEADERS_INVENTORY_H
#define HEADERS_INVENTORY_H

/* Declarations for inventory.c: inventory panel click handling, widget
 * hit-test/redraw, and link-chain (de)serialization. Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

void perform_object_search_check();
void handle_inventory_panel_normal_click();
void inventory_panel_click_region();
void toggle_weapon_ready();
void serialize_inventory_link_chain();
void *alloc_save_record_slot();
void *save_record_slot_from_index();
void deserialize_inventory_link_chain();
void handle_inventory_panel_click();
void redraw_inventory_widget();
void redraw_inventory_widget_range();
int hit_test_inventory_widget();

#endif
