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


bool open_level_archive(undefined1 *archive, char *path);
byte close_level_archive(undefined4 *archive);
bool write_archive_entry(undefined4 *archive, uint entry_index, void *data, uint byte_count);
undefined2 read_archive_entry(undefined4 *archive, uint entry_index, void *buffer);
int probe_archive_entry_exists(char *path, uint entry_index);
bool check_can_save_game(void);
undefined4 check_can_load_game(void);
undefined4 load_player_save_record(char *slot_dir);
int write_level_tilemap_to_archive(undefined1 *archive, int level_number);
void draw_save_load_slot_list(void);
undefined4 write_level_quest_flags_to_archive(undefined1 *archive, int level_number);
undefined4 journey_onward_load_slot_menu(void);
undefined4 commit_level_to_save_slot(int level_number);
void probe_save_slots(char *slot_descriptions, ushort *used_mask);
void handle_save_load_menu_action(short action, int slot);
undefined4 load_game_from_slot(char slot_digit);
undefined4 save_game_to_slot(char slot_digit, char *description);
undefined4 ensure_save_directory_exists(char *path);
undefined4 copy_save_slot_files(char *dest_dir, char *source_dir);
bool write_buffer_to_file(void *buffer, char *filename, ushort byte_count);

#endif
