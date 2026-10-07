#ifndef HEADERS_OBJECTS_H
#define HEADERS_OBJECTS_H

/* Declarations for objects.c: the object table (slot alloc/free,
 * linked-list primitives, spawning). Pulls in uw.h itself so this
 * header is self-contained for any caller. */
#include "uw.h"

extern undefined2 DAT_002020a0;
extern undefined2 DAT_002020a4;
extern undefined4 DAT_00202c84;
extern undefined1 DAT_00202c90_backing[8192];

// Typed view over the same array for new code -- see uw_object_type_props_t
// above. Index by an object's type id (obj_hdr.item_id & 0x1ff), matching
// every existing `(&DAT_00202c9X)[id * 0xd]` call site's own indexing.
#define g_object_type_props ((uw_object_type_props_t *)DAT_00202c90_backing)
#define DAT_002027d2 DAT_002027d0_backing[2] /* third byte of each loaded weapon record */
#define DAT_002027d1 DAT_002027d0_backing[1] /* projectile speed in each loaded weapon record */
/* BUG FIX (unit-testing-framework merge): this branch's own history had drifted into giving
   DAT_00202c39..3f each their OWN independent backing array... */
#define DAT_00202c39 DAT_00202c38_backing[1]
#define DAT_00202c3a DAT_00202c38_backing[2]
#define DAT_00202c3b DAT_00202c38_backing[3]
#define DAT_00202c3c DAT_00202c38_backing[4]
#define DAT_00202c3d DAT_00202c38_backing[5]
#define DAT_00202c3e DAT_00202c38_backing[6]
#define DAT_00202c3f DAT_00202c38_backing[7]
#define DAT_00202c9b DAT_00202c90_backing[0xb]
#define DAT_00202806 DAT_00202800_backing[6]

#define DAT_00202c90 DAT_00202c90_backing[0]
#define DAT_00202c91 DAT_00202c90_backing[1]
#define DAT_00202c93 DAT_00202c90_backing[3]
#define DAT_00202c95 DAT_00202c90_backing[5]
#define DAT_00202c97 DAT_00202c90_backing[7]
#define DAT_00202c98 DAT_00202c90_backing[8]
#define DAT_00202c99 DAT_00202c90_backing[9]
#define DAT_00202c9a DAT_00202c90_backing[0xa]
extern undefined1 DAT_002027d0_backing[48];
#define DAT_002027d0 DAT_002027d0_backing[0]
extern undefined1 DAT_00202800_backing[256];
#define DAT_00202800 DAT_00202800_backing[0]
extern ushort *DAT_002046b4;
extern undefined1 DAT_0024cfe0_backing[16];
#define DAT_0024cfe0 DAT_0024cfe0_backing[0]
extern undefined1 DAT_00250730_backing[128];
#define DAT_00250730 DAT_00250730_backing[0]
#define DAT_00250732 DAT_00250730_backing[2]
#define DAT_00250733 DAT_00250730_backing[3]
extern short DAT_00202080;
extern byte * DAT_00202c6c;
extern char * DAT_0023b82c;
extern ushort * g_scratch_object_ptr;
extern undefined1 DAT_00202800_backing[256];
/* Globals defined in uw.c but also used by functions that now live in
   objects.c (the object table) -- extern'd here so both translation
   units see the same storage. */
extern short DAT_0010144c;
extern short DAT_00101454;
extern short DAT_00202a38;
extern short DAT_00202a3c;
extern short DAT_00202a40;
/* FUN_0004ad10 reads word 1 (position) and word 12 (heading). */
extern ushort * DAT_00202a44;
extern ushort DAT_00202a48;
extern ushort DAT_00202a4c;
extern undefined2 DAT_00202a50;
extern undefined2 DAT_00202a54;
extern char * DAT_0020469c;
extern char * DAT_002046a4;
extern char * DAT_002046a8;
extern char * DAT_002046bc;
extern short DAT_002046b0;
extern byte * DAT_002046c0;
extern byte * DAT_002046c8;
extern undefined1 DAT_002029f8_backing[256];
#define g_carry_weight_limit_table DAT_002029f8_backing[0]
extern undefined1 DAT_002029d8_backing[256];
#define g_light_radius_table DAT_002029d8_backing[0]
/* Six-byte collision candidates: top, bottom, packed link, tile offset.
 * Ghidra split overlapping fields (and next-record sort views) into globals. */
extern undefined1 DAT_00202c38_backing[1536];
#define DAT_00202c38 DAT_00202c38_backing[0]


int reset_burnt_out_item_state(char *tile_link, void *object);
int apply_object_destruction_effect(ushort *object, ushort *attacker, uint damage_type_mask, int tile_x, short tile_y);
int find_placement_via_tile_flood_fill(ushort *object, short tile_x, short tile_y, short *out_x, short *out_y, int strict);
int clear_object_temp_flag_callback(ushort *object);
void clear_temp_flags_on_all_objects();
void load_class6_variant_effect_table(int file_handle);
void load_class7_variant_effect_table(int file_handle);
void *class0_variant_effect_table_lookup();
void *class1_variant_effect_table_lookup();
void *class2_variant_effect_table_lookup();
void *class6_variant_effect_table_lookup();
void *class7_variant_effect_table_lookup();
int class3_variant_effect_stub();
int class4_variant_effect_stub();
int class5_variant_effect_stub();
void free_player_inventory_chain(char *link_field);
uint calculate_object_weight(ushort *object);
ushort *spawn_object_near_player();
int place_object_in_world(uint tile_x, uint tile_y, int height, void *object, short radius, int skip_roll);
int find_object_placement(ushort *object, uint tile_x, uint tile_y, short height, short radius);
int load_object_catalog_data();
void *get_scanned_object_class_effect_ptr();
int walk_object_tree(void *object, int (*callback)());
int object_exceeds_size_threshold(void *object);
int should_destroy_linked_object(int base_chance, ushort *link_field);
void despawn_objects_outside_radius(int keep_rows, short max_destroyed);
void *alloc_object_slot(int region);
void free_object_slot(void *object);
void object_list_insert_head(void *link_field, void *object);
void object_list_append_tail(void *link_field, void *object);
void object_list_unlink(void *link_field, void *object);
ushort *discard_misplaced_object(void *tile_link, ushort *object, int skip_roll);
void free_linked_object_recursive(void *link_field);
void unlink_and_free_object(void *link_field, void *object);
void *resolve_object_link(void *link_field);
int encode_object_slot_index(void *object);
void *get_object_record_by_slot_index(short slot_index);
ushort *find_object_by_encoded_slot_in_chain(void *link_field, int recurse, int slot);
int object_ptr_in_arena(void *object);
void active_mobile_list_add(byte slot);
void active_mobile_list_remove(char slot);
ushort *find_object_in_chain(void *link_cursor, int recurse, int object_class, int subclass, short quality);
int object_or_contents_has_type(void *object, ushort type_id);
ushort *find_object_in_world(int object_class, int subclass, short quality, short *out_x, short *out_y);
ushort *reallocate_object_to_arena(ushort *object);
void compute_object_placement_fields(void *object, uint tile_x, uint tile_y);
void randomize_settled_snapshot_position(void *snapshot);
ushort *settle_dropped_object(void *object, short tile_x, short tile_y, int force);
void *spawn_new_object(uint object_type, int region);

#endif
