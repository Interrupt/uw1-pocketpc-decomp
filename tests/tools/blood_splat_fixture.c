#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(8) byte record[40], snapshots[2][40], tile[8];
byte *DAT_00202c6c;
short DAT_00100610;
static unsigned seed, mode, mutation, height_calls, projections, spawns, sounds, schedules, frees, inserts;
static uint64_t events;
static uw_object_hdr_t *object(void) { return (uw_object_hdr_t *)(record + 4); }
static void observe(unsigned kind)
{
    events = events * 31 + kind;
    for (unsigned i = 0; i < sizeof record; ++i) events = events * 31 + record[i];
    for (unsigned i = 0; i < sizeof snapshots; ++i) events = events * 31 + ((byte *)snapshots)[i];
    for (unsigned i = 0; i < sizeof tile; ++i) events = events * 31 + tile[i];
    events = events * 31 + (DAT_00202c6c == snapshots[1] + 4);
}
static void argument(int value) { events = events * 31 + (uint)value; }
void collision_build_height_field(uint limit)
{
    assert(limit == 0); observe(1); ++height_calls;
    if (mutation && mode == 6) DAT_00202c6c = snapshots[1] + 4;
    if (mutation) DAT_00202c6c[4] ^= 0xa5;
    DAT_00202c6c[13] &= 0xfc; DAT_00202c6c[15] &= 0xfc;
    if (mode != 4 && (mode != 1 || height_calls >= 3))
        DAT_00202c6c[13 + 2 * (seed & 1)] |= 1 << ((seed >> 1) & 1);
}
void project_position_by_heading(int heading, short distance, void *x, void *y)
{
    assert(heading == (int)(seed & 255) && distance == 16); observe(2); ++projections;
    argument(*(short *)x); argument(*(short *)y);
    *(short *)x = (short)(*(short *)x + distance);
    *(short *)y = (short)(*(short *)y - distance);
}
uw_object_hdr_t *spawn_new_object(uint id, int region)
{
    assert(id == 0x1cb && region == 0); observe(3); ++spawns;
    if (mutation) { object()->position_word ^= 0xa5a5; DAT_00202c6c[2] ^= 0x5a; }
    return mode == 2 ? NULL : object();
}
int play_positional_sound_effect(uint id, short x, short y, uint bias)
{
    assert(id == 7 && bias == 0); observe(4); ++sounds; argument(x); argument(y);
    if (mutation) { object()->position_word ^= 0x5555; DAT_00202c6c[0] ^= 0xaa; }
    return 0;
}
int encode_object_slot_index(const uw_object_hdr_t *p)
{
    assert(p == object()); observe(5);
    if (mutation) { object()->position_word ^= 0xaaaa; DAT_00202c6c[2] ^= 0x55; }
    return 257;
}
uint scheduler_add_entry(uint link, int delay, byte frame, byte x, byte y)
{
    assert(link == 257 && delay == 2 && frame == 0); observe(6); ++schedules;
    argument(x); argument(y);
    if (mutation) { object()->position_word ^= 0x3333; DAT_00202c6c[0] ^= 0x55; }
    return mode == 3 ? 0xffffffff : 7;
}
void free_object_slot(uw_object_hdr_t *p) { assert(p == object()); observe(7); ++frees; }
void *tilemap_lookup(short x, short y) { observe(8); argument(x); argument(y); return tile; }
void object_list_append_tail(ushort *link, uw_object_hdr_t *p)
{
    assert((byte *)link == tile + 2 && p == object()); observe(9); ++inserts;
    p->next = *link >> 6; *link = (*link & 63) | (257 << 6);
}
#include "blood_splat_functions.c"

struct result {
    byte record[40], snapshots[80], tile[8];
    unsigned counts[7]; uint64_t events; bool second_snapshot;
};
static struct result run(int reference)
{
    memset(record, 0xa5, sizeof record); memset(snapshots, 0x5a, sizeof snapshots); memset(tile, 0x3c, sizeof tile);
    object()->type_flags = seed ^ 0xaaaa; object()->position_word = seed;
    object()->chain_word = seed ^ 0x5555; object()->link_word = seed ^ 0xffff;
    for (unsigned i = 0; i < 2; ++i) {
        short x = (short)(seed * 37 + i * 19), y = (short)(seed * 13 - i * 17);
        memcpy(snapshots[i] + 4, &x, 2); memcpy(snapshots[i] + 6, &y, 2);
        snapshots[i][8] = seed + i * 73;
    }
    DAT_00202c6c = NULL; DAT_00100610 = mode == 5 ? 0 : 1;
    height_calls = projections = spawns = sounds = schedules = frees = inserts = 0; events = 0;
    if (reference) reference_spawn_blood_splat_object(seed & 255, 3, snapshots[0] + 4);
    else spawn_blood_splat_object(seed & 255, 3, snapshots[0] + 4);
    struct result result = {0};
    memcpy(result.record, record, sizeof record); memcpy(result.snapshots, snapshots, sizeof snapshots);
    memcpy(result.tile, tile, sizeof tile);
    unsigned counts[] = {height_calls, projections, spawns, sounds, schedules, frees, inserts};
    memcpy(result.counts, counts, sizeof counts); result.events = events;
    result.second_snapshot = DAT_00202c6c == snapshots[1] + 4;
    return result;
}
int main(void)
{
    unsetenv("UW_DEBUG_COMBAT");
    unsigned cases = 0;
    for (seed = 0; seed < 65536; ++seed)
        for (mode = 0; mode < 7; ++mode)
            for (mutation = 0; mutation < 2; ++mutation) {
                struct result before = run(1), after = run(0);
                assert(memcmp(before.record, after.record, sizeof record) == 0);
                assert(memcmp(before.snapshots, after.snapshots, sizeof snapshots) == 0);
                assert(memcmp(before.tile, after.tile, sizeof tile) == 0);
                assert(memcmp(before.counts, after.counts, sizeof before.counts) == 0);
                assert(before.events == after.events && before.second_snapshot == after.second_snapshot);
                ++cases;
            }
    printf("%u blood-splat cases preserve placement, records/guards, snapshots and callbacks\n", cases);
    return 0;
}
