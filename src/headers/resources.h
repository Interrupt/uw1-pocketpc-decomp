#ifndef HEADERS_RESOURCES_H
#define HEADERS_RESOURCES_H

/* Declarations for resources.c: .GR bitmap resource loading, the
 * flip-grtile capture slots, and door-frame loading. Pulls in uw.h
 * itself so this header is self-contained for any caller. */
#include "uw.h"

/* Globals defined in uw.c but also used by functions that now live in
   resources.c (.GR bitmap loading, flip-grtile slots, door frames) --
   extern'd here so both translation units see the same storage. */
extern ushort DAT_00202744;
extern undefined1 DAT_0023b840_backing[8];

#define DAT_0023b841 DAT_0023b840_backing[1]

#define DAT_0023b840 DAT_0023b840_backing[0]
extern undefined1 DAT_00202750_backing[128];
#define DAT_00202750 DAT_00202750_backing[0]
extern void * g_grtile_real_ptrs[320];
extern char s__DATA__00085970[];


/* Forward declaration needed because register_grtile_entry (much earlier in uw.c)
   calls this before its own definition later in the file -- see its
   definition, right after grtile_alloc_registered, for why it exists. */
void *uw_alloc_grtile();
void blit_grtile_to_framebuffer();
byte *decompress_gr_bitmap();
uint merge_byte_into_word();
void select_gr_bitmap_remap_table();
void decode_gr_rle_stream();
int register_gr_group_entry(void *buf, unsigned size, int idx);
/* Forward declarations needed because load_gr_resource_group, load_objects_gr, load_tmflat_gr,
   load_hud_icon_gr, reload_single_grtile_entry, and decode_gr_entry_to_buffer (now in
   src/resources.c) take these LAB_ callbacks' addresses and reference these globals... */
void *gr_resource_bump_alloc_entry();
int register_objects_gr_entry(void *buf, unsigned size, int idx);
int register_tmflat_gr_entry(void *buf, unsigned size, int idx);
void *hud_icon_gr_bump_alloc_entry();
void *decode_gr_entry_bump_alloc_entry();
unsigned int uw_copy_gr_entry_to_dest(void *buf, unsigned int size, int idx);
byte *uw_load_critter_page_cached(int param_1, int param_2);
undefined *load_string_resource();
undefined *load_string_resource_large();
char *decode_gr_entry_bitmap();
bool load_pals_bank();
bool set_palette_bank();
undefined4 load_gr_format3_extra_table();
undefined4 open_gr_resource_file();
void close_gr_resource_file();
uint read_gr_resource_record();
bool register_grtile_entry();
undefined4 reregister_grtile_entry();
uint load_gr_resource_entries();
undefined4 load_gr_resource_group();
undefined4 load_objects_gr();
undefined4 load_tmflat_gr();
undefined4 load_hud_icon_gr();
void reload_single_grtile_entry();
undefined4 decode_gr_entry_to_buffer();
void load_door_frames();
void load_armor_variant_tables();
undefined4 alloc_flip_grtile_slot();
void *resolve_flip_grtile_slot();
void load_light_food_effect_tables();
void init_grtile_registry();
undefined4 grtile_alloc_registered();
undefined4 invalidate_grtile_by_key();
undefined4 capture_framebuffer_rect_to_grtile();
undefined4 restore_captured_grtile_backdrop();
undefined4 init_string_resource_cache();
void close_strings_pak_file_thunk();
char *get_message_string();
int register_interned_string();
uint overwrite_interned_string();
void reset_string_resource_page();
undefined4 open_strings_pak_file();
void close_strings_pak_file();
undefined1 *decode_strings_pak_entry();
undefined1 walk_strings_pak_huffman_tree();
int read_strings_pak_bit();
bool read_buffer_from_file();

#endif
