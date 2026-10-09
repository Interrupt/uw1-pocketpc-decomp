/* Real NPC goal helpers, with independent packed-byte and callback expectations. */
#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(4) byte arena[96], stats[256];
char *DAT_00086df8 = (char *)stats;
uw_mobile_object_t *DAT_0010190c;
short DAT_00101444, DAT_00101448;
static unsigned seed_value, scenario, refreshes, headings, randoms;
static uint64_t events;
static unsigned read16(const byte *p) { return p[0] | (p[1] << 8); }
static void write16(byte *p, unsigned word) { p[0] = word; p[1] = word >> 8; }
static void event(unsigned code) {
    events = events * 31 + code;
    for (unsigned j = 0; j < sizeof arena; ++j) events = events * 31 + arena[j];
}
int refresh_npc_target_delta(void) {
    assert((byte *)DAT_0010190c == arena);
    assert(((read16(arena + 11) >> 4) & 255) == 1);
    ++refreshes; event(1);
    DAT_00101444 = scenario & 4 ? 20 : 1;
    DAT_00101448 = 0;
    if (scenario & 16) DAT_0010190c = (uw_mobile_object_t *)(arena + 32);
    return 0;
}
int compute_movement_heading(int x, int y) {
    assert(x == DAT_00101444 && y == 0);
    ++headings; event(2); return (seed_value >> 3) & 15;
}
long ce_rand(void) {
    ++randoms; event(3);
    if (scenario & 32) DAT_0010190c = (uw_mobile_object_t *)(arena + 64);
    return scenario & 8 ? 1 : 0;
}
#include "goal_functions.c"

static uint64_t run_react(void (*function)(void)) {
    uint64_t hash = 1;
    for (seed_value = 0; seed_value < 65536; ++seed_value) {
      for (scenario = 0; scenario < 64; ++scenario) {
        for (unsigned j = 0; j < sizeof arena; ++j) arena[j] = (seed_value >> (j & 7)) + j * 31;
        for (unsigned record = 0; record < 3; ++record) write16(arena + record * 32 + 11, seed_value ^ (record * 0x5555));
        arena[19] = scenario & 2 ? 0x87 : 0x80;
        stats[0x5f] = scenario & 1 ? 2 : 0;
        byte expected[96]; memcpy(expected, arena, sizeof arena);
        unsigned current = 0, enabled = !(scenario & 2) || (scenario & 1);
        if (enabled) {
            write16(expected + 11, (read16(expected + 11) & 0xf00f) | 0x10);
            if (scenario & 16) current = 32;
            if (!(scenario & 4)) {
                expected[current + 19] &= 128;
                expected[current + 21] = (expected[current + 21] & 224) | 32;
                expected[current + 20] = (expected[current + 20] & 254) | 6;
                if (scenario & 32) current = 64;
                if (scenario & 8) {
                    unsigned goal = read16(expected + current + 11);
                    write16(expected + current + 11, (goal & 4095) | ((((goal >> 12) + 1) % 4) << 12));
                }
                unsigned position = read16(expected + current + 2);
                write16(expected + current + 2, (position & 0xfc7f) | (((seed_value >> 3) & 7) << 7));
                expected[current + 24] &= 224;
            }
        }
        DAT_0010190c = (uw_mobile_object_t *)arena;
        DAT_00101444 = DAT_00101448 = -100;
        events = refreshes = headings = randoms = 0;
        function();
        assert(!memcmp(arena, expected, sizeof arena));
        assert((byte *)DAT_0010190c == arena + current);
        assert(refreshes == enabled);
        assert(headings == (enabled && !(scenario & 4)) && randoms == headings);
        hash = hash * 31 + events;
        for (unsigned j = 0; j < sizeof arena; ++j) hash = hash * 31 + arena[j];
      }
    }
    return hash;
}
static uint64_t run_clear(void (*function)(void)) {
    uint64_t hash = 1;
    for (unsigned goal = 0; goal < 65536; ++goal) {
      for (unsigned level = 0; level < 16; ++level) {
        for (unsigned j = 0; j < sizeof arena; ++j) arena[j] = (goal >> (j & 7)) + j * 31;
        write16(arena + 11, goal);
        write16(arena + 13, (goal & 0xfff0) | level);
        byte expected[96]; memcpy(expected, arena, sizeof arena);
        write16(expected + 11, (goal & 0xf000) | (level ? 0x10 | level : 2));
        if (level) expected[13] &= 240;
        DAT_0010190c = (uw_mobile_object_t *)arena;
        function();
        assert(!memcmp(arena, expected, sizeof arena));
        assert((byte *)DAT_0010190c == arena);
        for (unsigned j = 0; j < sizeof arena; ++j) hash = hash * 31 + arena[j];
      }
    }
    return hash;
}
int main(void) {
    uint64_t react = run_react(npc_react_to_nearby_player);
    uint64_t clear = run_clear(npc_clear_special_goal);
#ifdef REFERENCE_AVAILABLE
    assert(react == run_react(reference_npc_react_to_nearby_player));
    assert(clear == run_clear(reference_npc_clear_special_goal));
#endif
    printf("5,242,880 real-helper cases preserve packed bytes and callback events: %llu %llu\n",
           (unsigned long long)react, (unsigned long long)clear);
}
