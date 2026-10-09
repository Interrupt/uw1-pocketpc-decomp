/* Independent byte oracle for the actual placement snapshot builder. */
#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(4) byte arena[128];
char *DAT_002046c4 = (char *)arena + 64;
short DAT_0010144c, DAT_00101454;
uw_object_type_props_t g_object_type_props[512];
static unsigned random_state, random_calls;
static unsigned read16(const byte *p) { return p[0] + p[1] * 256u; }
static void write16(byte *p, unsigned v) { p[0] = v; p[1] = v >> 8; }
int encode_object_slot_index(const uw_object_hdr_t *obj) { return (int)((const byte *)obj - arena); }
long ce_rand(void) { ++random_calls; random_state = random_state * 1664525u + 1013904223u; return random_state >> 16; }
#include "placement_functions.c"

static void expected(const byte *obj, byte *out, int mobile, const unsigned *rnd)
{
    unsigned type = read16(obj) & 511u, position = read16(obj + 2);
    const byte *props = (const byte *)&g_object_type_props[type];
    unsigned npc = (type & 0x1c0) == 0x40;
    unsigned x = position >> 13, y = (position >> 10) & 7, z = position & 127;
    unsigned speed = 0, pitch = 0, gravity = 0;
    out[35] = obj - arena; out[36] = 0;
    write16(out + 24, read16(props + 1) >> 4);
    out[26] = (props[7] >> 4) & 1;
    out[27] = out[28] = out[29] = 0;
    out[22] = (read16(props + 7) >> 5) & 15;
    out[31] = props[9]; out[32] = out[33] = out[39] = 0;
    out[34] = ((position >> 7) & 7) * 32;
    out[37] = props[1] & 7; out[38] = props[0];
    if (mobile) {
        x += (read16(obj + 22) >> 10) * 8;
        y += ((read16(obj + 22) >> 4) & 63) * 8;
        out[34] = obj[9]; out[40] = 1u << ((obj[10] >> 4) & 7);
        pitch = ((int)(obj[20] >> 3) - 16) * 64;
        gravity = (obj[19] >> 7) * -4;
        out[30] = obj[8];
        if (!npc) { x = read16(obj + 11); y = read16(obj + 13); z = read16(obj + 15); }
        speed = obj[19] & 127;
        if (npc || gravity || pitch || (props[3] & 8)) {
            speed *= 47;
            if (npc) out[39] = 8;
        } else {
            unsigned quality_flag = out[26];
            speed = (quality_flag + 1) * 2 < speed ? speed * (quality_flag * 4 + 41) : 0;
        }
    } else {
        out[30] = obj[4] & 63;
        x += DAT_0010144c * 8; y += DAT_00101454 * 8;
    }
    write16(out + 10, pitch); write16(out + 16, gravity); write16(out + 20, speed);
    if (!mobile || npc) { x = x * 32 + (rnd[0] & 31); y = y * 32 + (rnd[1] & 31); z = z * 8 + (rnd[2] & 7); }
    write16(out, x); write16(out + 2, y); write16(out + 4, z);
    out[41] = out[42] = 0;
}

int main(void)
{
    unsigned count = 0;
    for (unsigned seed = 0; seed < 65536; ++seed) {
        for (unsigned kind = 0; kind < 3; ++kind) {
            byte actual[48], oracle[48], before[128];
            unsigned state = seed + 1;
            for (unsigned j = 0; j < sizeof arena; ++j) { state = state * 1664525u + 1013904223u; arena[j] = state >> 24; }
            for (unsigned j = 0; j < sizeof actual; ++j) actual[j] = oracle[j] = j * 17 + seed;
            byte *obj = arena + (kind == 2 ? 80 : 16);
            unsigned type = kind == 0 ? 0x40 | (seed & 63) : 0x80 | (seed & 63);
            write16(obj, (read16(obj) & 0xfe00) | type);
            write16(obj + 2, seed); write16(obj + 22, seed ^ 0x5a5a);
            byte *props = (byte *)&g_object_type_props[type];
            for (unsigned j = 0; j < sizeof *g_object_type_props; ++j) { state = state * 1664525u + 1013904223u; props[j] = state >> 24; }
            DAT_0010144c = (seed >> 6) & 63; DAT_00101454 = seed & 63;
            unsigned rnd[3]; random_state = seed;
            for (unsigned j = 0; j < 3; ++j) rnd[j] = ce_rand();
            expected(obj, oracle, kind != 2, rnd);
            memcpy(before, arena, sizeof arena); random_state = seed; random_calls = 0;
            build_object_placement_snapshot((ushort *)obj, actual);
            assert(random_calls == (kind == 1 ? 0 : 3));
            for (unsigned j = 0; j < sizeof actual; ++j) {
                if (actual[j] != oracle[j]) {
                    fprintf(stderr, "seed=%u kind=%u byte=%u actual=%u expected=%u\n", seed, kind, j, actual[j], oracle[j]);
                    abort();
                }
            }
            assert(memcmp(before, arena, sizeof arena) == 0);
#ifdef REFERENCE_AVAILABLE
            byte reference[48]; for (unsigned j = 0; j < sizeof reference; ++j) reference[j] = j * 17 + seed;
            random_state = seed; random_calls = 0;
            reference_build_object_placement_snapshot((ushort *)obj, reference);
            assert(memcmp(actual, reference, sizeof actual) == 0);
#endif
            ++count;
        }
    }
    printf("Placement snapshots: %u independent byte cases passed\n", count);
}
