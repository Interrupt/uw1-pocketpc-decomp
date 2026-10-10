#include "jump_walking_fixture.h"

int GXResume(void) { return 1; }
int GXSuspend(void) { return 1; }
uint read_realtime_clock_units(void) { return 0; }
int poll_keyboard_char_input(void *out_char) { (void)out_char; return 0; }

int DAT_0024af60;
ushort DAT_0023c448;
short DAT_0024af6c;
int DAT_000876c8;
undefined1 DAT_0023ce10_backing[128];
int g_text_input_active;
undefined4 DAT_0023c648;
undefined4 DAT_0023bf50;
ushort g_held_move_code;
short g_movement_mode;
short DAT_0023bf48, DAT_0023bf4c, DAT_0023be88, DAT_0023bd80;
short *DAT_00085a6c;
char *DAT_00086df8;
undefined1 DAT_00204880_backing[128];

unsigned decode_calls;
unsigned short decode_latch_seen;
/* The forward key's decode: forward rate from the accelerator, movement mode 1. */
void decode_movement_command(void)
{
    decode_calls++;
    decode_latch_seen = DAT_0023c448;
    DAT_0023bf48 = DAT_0023c448 == 0x8d ? 100 : 0;
    DAT_0023bf4c = 0;
    if (DAT_0023c448 == 0x8d) g_movement_mode = 1;
}

static char character[256];
void jump_walking_fixture_reset(void)
{
    DAT_0024af60 = 0;
    DAT_0023c448 = 0;
    DAT_0024af6c = 0;
    DAT_000876c8 = 0;
    g_text_input_active = 0;
    g_movement_mode = 0;
    DAT_0023bf48 = DAT_0023bf4c = 0;
    memset(DAT_0023ce10_backing, 0, sizeof DAT_0023ce10_backing);
    memset(DAT_00204880_backing, 0, sizeof DAT_00204880_backing);
    memset(character, 0, sizeof character);
    DAT_00086df8 = character;
    g_held_move_code = 0;
    decode_calls = 0;
    decode_latch_seen = 0;
}
