#ifndef HEADERS_CHARGEN_H
#define HEADERS_CHARGEN_H

/* Declarations for chargen.c: character creation (the field-by-field
 * state machine, its resource-loading setup, and the critical-section
 * entry wrapper). Pulls in uw.h itself so this header is self-contained
 * for any caller. */
#include "uw.h"

extern char s_FONT5X6P_SYS_00084e9c[];
/* Globals defined in uw.c but also used by functions that now live in
   saveload.c (open_level_archive, close_level_archive,
   write_archive_entry, read_archive_entry) -- extern'd here so both
   translation units see the same storage. */
/* Globals defined in uw.c but also used by functions that now live in
   chargen.c (character_generator_start, run_character_generator,
   character_generator_loop) -- extern'd here so both translation units
   see the same storage. */
extern char *DAT_00086df8;
/* chrbtns.gr cumulative per-entry offset table (built by chrbtns_offset_table_builder).
   DAT_000fb8c4 is an alias into it starting at element 17 -- the same
   relationship DAT_000fb884 (element 1) has, matching the 0xfb8c4 vs
   0xfb880 symbol addresses (0x44 = 17*4). Elements 17..26 are the
   full-body figure offsets read by character_generator_loop case 4. */
extern undefined4 DAT_000fb880_backing[4096];
#define DAT_000fb8c4 (((undefined1 *)DAT_000fb880_backing)[0x44])
#define DAT_000fb880 DAT_000fb880_backing[0]
#define DAT_000fb884 (((undefined1 *)DAT_000fb880_backing)[4])
#define DAT_000fb898 (((int *)DAT_000fb880_backing)[6])
/* Fourth byte of each loaded class row is its attribute bonus pool. */
extern char *DAT_001005c8;
extern char *g_chargen_textfield_buf;


undefined4 character_generator_start();
int run_character_generator();
undefined4 character_generator_loop();

/* chrbtns_bump_alloc_entry/chrbtns_offset_table_builder: orphaned callbacks Ghidra never recognized
   as real functions (only reached indirectly, via addresses passed to
   load_gr_resource_entries) -- their definitions stay in uw.c (see their own comment
   there for the full recovery story), forward-declared here because
   run_character_generator (chargen.c) takes their addresses. */
char *chrbtns_bump_alloc_entry();
undefined4 chrbtns_offset_table_builder();
void init_new_character_record();
undefined4 advance_skill_tree_node();
void draw_chargen_attribute_summary();
void draw_selected_skills_list();
int apply_confirmed_skill_picks();
void reroll_attributes_for_class_race();
void draw_chargen_field_value();
undefined4 draw_chargen_field_options();
uint character_generator_touch_select();
uint wait_for_chargen_field_input();
void chargen_ui_transition_hook();

#endif
