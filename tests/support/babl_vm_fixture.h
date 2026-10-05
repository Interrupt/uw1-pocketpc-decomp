#ifndef UW_BABL_VM_FIXTURE_H
#define UW_BABL_VM_FIXTURE_H
#include "game_fixture.h"
#include "unity.h"
extern short babl_words[1024];
extern unsigned babl_coverage[42];
extern int babl_saves, babl_steps, babl_frees, babl_expand_owned;
extern char babl_speech[128], babl_reply[128];
void babl_fixture_reset(void);
void babl_symbol(int record, const char *name, int slot, int count, int type, int category);
void babl_run(const short *script, size_t count);
short babl_top(void);
extern ushort babl_items[12][4];
extern ushort *babl_dropped[8], *babl_drop_owner[8];
extern int babl_drop_count, babl_loot_calls;
void babl_bind_npc_variables(void);
short babl_named_word(char *name);
extern int babl_awarded_xp;
extern int babl_input_polls, babl_next_choice, babl_invalid_first_choice;
#endif
