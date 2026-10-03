#ifndef HEADERS_CHARGEN_H
#define HEADERS_CHARGEN_H

/* Declarations for chargen.c: character creation (the field-by-field
 * state machine, its resource-loading setup, and the critical-section
 * entry wrapper). Pulls in uw.h itself so this header is self-contained
 * for any caller. */
#include "uw.h"

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
