#ifndef UW_TEST_TRAPS_FIXTURE_H
#define UW_TEST_TRAPS_FIXTURE_H
/* Fixture state and controlled services for reusable traps tests. */
#include "unity.h"
#include "src/headers/uw.h"
extern char *DAT_00086df8, *DAT_0024cff4;
extern ushort *DAT_0024cff0;
extern uw_mobile_object_t *g_player_object;
extern undefined4 DAT_00202c84;
extern undefined2 DAT_002020a0, DAT_002020a4;
extern char s_Look__it_s_a_text_trap_00087918[];
extern byte level_one[0x7c08];
extern char message[];
extern char *available_message;
extern uint message_id;
extern int lookups, prints;
ushort *orb_text_trap(void);
void traps_fixture_reset(void);
void traps_fixture_dispose(void);
#endif
