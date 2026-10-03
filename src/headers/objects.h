#ifndef HEADERS_OBJECTS_H
#define HEADERS_OBJECTS_H

/* Declarations for objects.c: the object table (slot alloc/free,
 * linked-list primitives, spawning). Pulls in uw.h itself so this
 * header is self-contained for any caller. */
#include "uw.h"

undefined4 reset_burnt_out_item_state();
undefined4 apply_object_destruction_effect();
undefined4 find_placement_via_tile_flood_fill();
undefined4 clear_object_temp_flag_callback();
void clear_temp_flags_on_all_objects();
void load_class6_variant_effect_table();
void load_class7_variant_effect_table();
void *class0_variant_effect_table_lookup();
void *class1_variant_effect_table_lookup();
void *class2_variant_effect_table_lookup();
void *class6_variant_effect_table_lookup();
void *class7_variant_effect_table_lookup();
undefined4 class3_variant_effect_stub();
undefined4 class4_variant_effect_stub();
undefined4 class5_variant_effect_stub();
void free_player_inventory_chain();
uint calculate_object_weight();
ushort *spawn_object_near_player();
undefined4 place_object_in_world();
undefined4 find_object_placement();
undefined4 load_object_catalog_data();
void *get_scanned_object_class_effect_ptr();
undefined4 walk_object_tree();
undefined4 object_exceeds_size_threshold();
undefined4 should_destroy_linked_object();
void despawn_objects_outside_radius();
void *alloc_object_slot();
void free_object_slot();
void object_list_insert_head();
void object_list_append_tail();
void object_list_unlink();
ushort *discard_misplaced_object();
void free_linked_object_recursive();
void unlink_and_free_object();
void *resolve_object_link();
int encode_object_slot_index();
void *get_object_record_by_slot_index();
ushort *find_object_by_encoded_slot_in_chain();
undefined4 object_ptr_in_arena();
void active_mobile_list_add();
void active_mobile_list_remove();
ushort *find_object_in_chain();
undefined4 object_or_contents_has_type();
ushort *find_object_in_world();
ushort *reallocate_object_to_arena();
void compute_object_placement_fields();
void randomize_settled_snapshot_position();
ushort *settle_dropped_object();
void *spawn_new_object();

#endif
