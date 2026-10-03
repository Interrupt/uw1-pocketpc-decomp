#ifndef HEADERS_SAVELOAD_H
#define HEADERS_SAVELOAD_H

/* Declarations for saveload.c: the save/load slot menu and the actual
 * game save/load. Pulls in uw.h itself so this header is
 * self-contained for any caller. */
#include "uw.h"

extern char s__SAVE0_lev_ark_000842fc[];
extern char * g_save_record_buffer;
/* Globals defined in uw.c but also used by functions that now live in
   saveload.c (save/load) -- extern'd here so both translation units
   see the same storage. */
extern undefined2 DAT_000868dc;
extern short DAT_002046f0;


bool open_level_archive();
byte close_level_archive();
bool write_archive_entry();
undefined2 read_archive_entry();
int probe_archive_entry_exists();
bool check_can_save_game();
undefined4 check_can_load_game();
undefined4 load_player_save_record();
int write_level_tilemap_to_archive();
void draw_save_load_slot_list();
undefined4 write_level_quest_flags_to_archive();
undefined4 journey_onward_load_slot_menu();
undefined4 commit_level_to_save_slot();
void probe_save_slots();
void handle_save_load_menu_action();
undefined4 load_game_from_slot();
undefined4 save_game_to_slot();
undefined4 ensure_save_directory_exists();
undefined4 copy_save_slot_files();
bool write_buffer_to_file();

#endif
