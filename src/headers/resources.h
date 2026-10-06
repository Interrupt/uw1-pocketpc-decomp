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
void *uw_alloc_grtile(uint width, uint height);
void blit_grtile_to_framebuffer(ushort x, int y, int grtile_key, short height, short width, short src_x, short src_y, int transparent);
byte *decompress_gr_bitmap(byte *source, byte *dest, char mode);
uint merge_byte_into_word(uint word, uint new_byte, int into_high_byte);
void select_gr_bitmap_remap_table(int unused_a, uint bank, int unused_b, uint shade);
void decode_gr_rle_stream(int unused_a, int unused_b, uint offset);
int register_gr_group_entry(void *buf, unsigned size, int idx);
/* Forward declarations needed because load_gr_resource_group, load_objects_gr, load_tmflat_gr,
   load_hud_icon_gr, reload_single_grtile_entry, and decode_gr_entry_to_buffer (now in
   src/resources.c) take these LAB_ callbacks' addresses and reference these globals... */
void *gr_resource_bump_alloc_entry(unsigned int byte_count);
int register_objects_gr_entry(void *buf, unsigned size, int idx);
int register_tmflat_gr_entry(void *buf, unsigned size, int idx);
void *hud_icon_gr_bump_alloc_entry(unsigned int byte_count);
void *decode_gr_entry_bump_alloc_entry(unsigned int byte_count);
unsigned int uw_copy_gr_entry_to_dest(void *buf, unsigned int size, int idx);
byte *uw_load_critter_page_cached(int param_1, int param_2);
undefined *load_string_resource(char *text);
undefined *load_string_resource_large(char *text);
char *decode_gr_entry_bitmap(char *entry);
bool load_pals_bank(int bank, void *dest);
bool set_palette_bank(int bank);
undefined4 load_gr_format3_extra_table();
int open_gr_resource_file(char *path, char flag);
void close_gr_resource_file();
uint read_gr_resource_record(uint index, void *buffer);
bool register_grtile_entry(void *buffer, int unused, short index);
int reregister_grtile_entry(void *buffer, int unused, short index);
uint load_gr_resource_entries(char *path, int first_entry, short count, void *(*allocator)(), int (*post_process)());
int load_gr_resource_group(char *path);
int load_objects_gr(char *path);
int load_tmflat_gr(char *path, short texture_base, int entry_count);
int load_hud_icon_gr(char *path);
void reload_single_grtile_entry(short slot, char *path, int entry_index);
int decode_gr_entry_to_buffer(char *path, int entry_index, void *dest);
void load_door_frames();
void load_armor_variant_tables(int file_handle);
undefined4 alloc_flip_grtile_slot();
void *resolve_flip_grtile_slot(int slot);
void load_light_food_effect_tables(int file_handle);
void init_grtile_registry();
int grtile_alloc_registered(uint width, uint height);
int invalidate_grtile_by_key(int key);
int capture_framebuffer_rect_to_grtile(short *key, int left, int top, int right, short bottom);
int restore_captured_grtile_backdrop(short *key);
undefined4 init_string_resource_cache();
void close_strings_pak_file_thunk();
char *get_message_string(ushort message_id);
int register_interned_string(char *string, int page);
uint overwrite_interned_string(char *string, uint message_id);
void reset_string_resource_page(int page);
undefined4 open_strings_pak_file();
void close_strings_pak_file();
byte *decode_strings_pak_entry(short page, short index);
byte walk_strings_pak_huffman_tree(int file_handle, ushort node);
int read_strings_pak_bit(int file_handle);
bool read_buffer_from_file(char *path, void *buffer, int byte_count);

#endif
