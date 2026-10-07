#include "noise_fixture.h"

static char character[256], attributes[256];
static ushort player[16];
char *DAT_00086df8, *DAT_0023be74;
ushort *g_player_object;
short DAT_00201b68;
undefined1 DAT_001007d0_backing[3072], DAT_00202c90_backing[8192];
byte DAT_0010195c;
ushort *DAT_00101958;
undefined2 DAT_002020a0, DAT_002020a4;
ushort noise_npc[16], noise_source[16];
int noise_los_clear, noise_messages, noise_los_checks, noise_scans;
uint noise_message_id;
char noise_printed_message[80];
static char reaction_message[] = " hears a noise.";

void noise_set_reaction_count(unsigned count)
{
    ushort state;
    memcpy(&state, (byte *)noise_npc + 0xd, sizeof state);
    state = (state & 0x3fff) | ((count & 3) << 14);
    memcpy((byte *)noise_npc + 0xd, &state, sizeof state);
}

unsigned noise_reaction_count(void)
{
    ushort state;
    memcpy(&state, (byte *)noise_npc + 0xd, sizeof state);
    return state >> 14;
}

void noise_fixture_reset(void)
{
    uw_test_create_character(character, attributes, player);
    memset(noise_npc, 0, sizeof noise_npc);
    memset(noise_source, 0, sizeof noise_source);
    memset(DAT_001007d0_backing, 0, sizeof DAT_001007d0_backing);
    memset(DAT_00202c90_backing, 0, sizeof DAT_00202c90_backing);
    noise_npc[0] = 0x41;
    noise_source[0] = 0x80;
    DAT_00101958 = noise_source;
    DAT_0010195c = 5;
    DAT_001007d0_backing[0x30 + 9] = 5; /* matching noise class */
    DAT_001007d0_backing[0x30 + 0x1e] = 4 << 4; /* four-tile range */
    DAT_002020a0 = 20;
    DAT_002020a4 = 20;
    noise_set_reaction_count(3);
    noise_los_clear = 1;
    noise_messages = noise_los_checks = noise_scans = 0;
    noise_message_id = 0;
    memset(noise_printed_message, 0, sizeof noise_printed_message);
}

int check_fine_line_of_sight(uint x, uint y, uint z, short sx, short sy, short sz)
{
    noise_los_checks++;
    return noise_los_clear;
}

int build_object_display_name(char *buffer, void *object, int article, int mode)
{
    TEST_ASSERT_EQUAL_PTR(noise_npc, object);
    TEST_ASSERT_EQUAL_INT(1, article);
    TEST_ASSERT_EQUAL_INT(0, mode);
    strcpy(buffer, "A goblin");
    return 1;
}

char *get_message_string(ushort id)
{
    noise_message_id = id;
    return reaction_message; /* A real host pointer, not a 32-bit value. */
}

int message_scroll_print_wrapped(char *message)
{
    TEST_ASSERT_LESS_THAN_UINT(sizeof noise_printed_message, strlen(message));
    strcpy(noise_printed_message, message);
    noise_messages++;
    return 0;
}

/* The area search is a boundary here; use the real noise callback for the
   candidate, as the world scanner does after filtering its object list. */
void scan_area_for_matching_objects(char budget, byte excluded, int (*callback)(),
                                   char filter, char x, char y, char width, char height)
{
    TEST_ASSERT_EQUAL_INT(20, budget);
    TEST_ASSERT_EQUAL_INT(0, excluded);
    TEST_ASSERT_EQUAL_INT(0, filter);
    TEST_ASSERT_EQUAL_INT(13, x);
    TEST_ASSERT_EQUAL_INT(13, y);
    TEST_ASSERT_EQUAL_INT(15, width);
    TEST_ASSERT_EQUAL_INT(15, height);
    noise_scans++;
    ((int (*)(int, int, void *))callback)(21, 20, noise_npc);
}
