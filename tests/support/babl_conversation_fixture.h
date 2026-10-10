#ifndef UW_BABL_CONVERSATION_FIXTURE_H
#define UW_BABL_CONVERSATION_FIXTURE_H
#include "game_fixture.h"
#include "unity.h"

/* Drives whole CNV.ARK conversations through the real start_npc_conversation.
   NPC records come from level 1; presentation, input and the unrelated
   object-world builtins are controlled. Selections are scripted: every menu the
   conversation shows must be answered by the next queued choice, and a test
   fails (instead of hanging) if a conversation never ends. */
enum { CONV_KETCHAVAL = 7, CONV_RETICHALL = 8 };
enum { CONV_NPC_SLOT_KETCHAVAL = 238, CONV_NPC_SLOT_RETICHALL = 249 };

enum { CONV_SPEECH = 'S', CONV_REPLY = 'R', CONV_CHOICE = 'C', CONV_MENU = 'M',
       CONV_BUILTIN = 'B' };
typedef struct { char kind; char text[320]; } conv_line;
extern conv_line conv_log[1024];
extern int conv_log_count;

void conv_fixture_begin(void);
void conv_fixture_end(void);
/* Fresh bglobals.dat and player; call before the first conversation of a case. */
void conv_reset(void);

/* Queue the next answer: the first menu entry containing `text`. A NULL `text`
   means "any entry" (the first). `before` runs just before the choice is made. */
void conv_pick(const char *text, void (*before)(void));
/* Talk to the level-1 NPC in `slot` (CONV_NPC_SLOT_*). Returns once the
   conversation script has finished. */
void conv_talk(unsigned slot);
/* Same, but the NPC speaks a different CNV.ARK script (its whoami byte). */
void conv_talk_as(unsigned slot, unsigned conversation);
/* Fails unless every queued choice was used and no menu was left unanswered. */
void conv_expect_finished(void);

int conv_log_has(char kind, const char *needle);
void conv_dump(void);
/* Menu entries currently offered (text after the "N. " number). */
int conv_menu_count(void);
const char *conv_menu_text(int index);
int conv_builtin_calls(const char *name);

/* Barter staging helpers (the UI normally does this with the mouse). */
/* The NPC in level-1 `npc_slot` carries item `slot` (1-11) of `object_id`. */
void conv_npc_add_item(unsigned npc_slot, int slot, int object_id);
/* Barter temperament: trade_patience nibbles = (patience, mood), trade_level = (lean, shrewd). */
void conv_set_trade_stats(unsigned npc_slot, int patience, int level);
void conv_player_offers(int position, int slot, int object_id);
extern ushort babl_items[12][4];
extern ushort *babl_dropped[16], *babl_drop_owner[16];
extern int babl_drop_count;
void conv_set_object_value(int object_id, int value);
extern ushort *conv_npc;
extern int conv_steps, conv_polls;
#endif
