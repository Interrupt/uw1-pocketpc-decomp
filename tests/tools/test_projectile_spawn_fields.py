"""Differential launch-field conversion with real packed projectile records."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
from generate_projectile_spawn_rules import generate
from extract_functions import extract
PATCH = ROOT / 'tools/coccinelle/projectile-spawn-fields.cocci'
assert PATCH.read_text() == generate(), 'regenerate projectile-spawn-fields.cocci'
FLAGS = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv[2:] else []
PREAMBLE = '''#include "src/headers/uw.h"
#include "src/headers/debug.h"
#include <assert.h>
unsigned input, observed[16];
int signed_input;
struct { byte before[8]; uw_projectile_object_t obj; byte after[8]; } storage;
uw_projectile_object_t template_record;
uw_object_type_props_t g_object_type_props[512];
uw_mobile_object_t *g_player_object;
ushort *DAT_00202a44;
short DAT_00202a38, DAT_00202a3c, DAT_00202a40;
ushort DAT_00202a48, DAT_00202a4c, DAT_00202a50, DAT_00202a54;
char *DAT_00086df8;
char character[256];
static ushort tile_record[2];
static unsigned allocations, frees, sounds, inserts, lookup_x, lookup_y;
uw_object_hdr_t *alloc_object_slot(int mobile) {
    ++allocations;
    return input % 17 == 0 ? NULL : &storage.obj.hdr;
}
void free_object_slot(uw_object_hdr_t *p) { assert(p == &storage.obj.hdr); ++frees; }
int check_object_drop_height(ushort *p, ushort *q) { return input % 7 != 0; }
int encode_object_slot_index(const uw_object_hdr_t *p) { return input & 1023; }
int play_sound_effect_at_object(int id, ushort *p, int bias) { ++sounds; return 0; }
void object_list_insert_head(ushort *head, uw_object_hdr_t *p) { ++inserts; }
void *tilemap_lookup(short x, short y) { lookup_x = x; lookup_y = y; return tile_record; }
void compute_object_placement_fields(void *p, uint x, uint y) {
    uw_projectile_object_t *obj = p;
    obj->hdr.xpos = x & 7; obj->hdr.ypos = y & 7;
    obj->tile_x = (x >> 3) & 63; obj->tile_y = (y >> 3) & 63;
}
divmod_result ordint_divmod(int divisor, int dividend) {
    return (divmod_result){dividend / divisor, dividend % divisor};
}
void DEBUG_impl(DebugLevel level, const char *file, int line, const char *fmt, ...) {}
'''
# The fixture exercises conversions with live snapshots and independent byte
# initializers, rather than embedding a second copy of the game function.
RAW = '''uw_object_hdr_t *spawn_object_near_player()
{
    ushort *puVar6;
    int iVar8 = signed_input;
    ushort uVar9;
    uint uVar7;
    byte bVar1, bVar2, bVar3;
    char cVar4 = (char)(input >> 8);
    short sVar5 = (short)input;
    puVar6 = (ushort *)alloc_object_slot(1);
    if (puVar6 == (ushort *)0x0) {
        puVar6 = (ushort *)0x0;
        return puVar6;
    }
    *(char *)((char *)puVar6 + 11) = (char)iVar8;
    *(char *)(puVar6 + 6) = (char)((uint)iVar8 >> 8);
    iVar8 ^= 0x5a5a;
    *(char *)((char *)puVar6 + 13) = (char)iVar8;
    *(char *)(puVar6 + 7) = (char)((uint)iVar8 >> 8);
    iVar8 ^= 0xa5a5;
    *(char *)((char *)puVar6 + 15) = (char)iVar8;
    *(char *)(puVar6 + 8) = (char)((uint)iVar8 >> 8);
    observed[0] = puVar6[11] >> 10;
    observed[1] = (puVar6[11] & 0x3f0) >> 4;
    observed[2] = (puVar6[11] & 0xfc00) >> 2;
    observed[3] = 3 + (puVar6[11] & 0x3f0) * 0x10 + 5;
    observed[4] = puVar6[11];
    *(byte *)(puVar6 + 12) = ((byte)DAT_00202a54 ^ (byte)puVar6[12]) & 0x1f ^ (byte)puVar6[12];
    *(char *)((char *)puVar6 + 9) = (char)DAT_00202a54;
    *(char *)(puVar6 + 9) = (char)sVar5;
    *(byte *)((char *)puVar6 + 21) = *(byte *)((char *)puVar6 + 21) & 0x7f;
    *(byte *)((char *)puVar6 + 19) = ((byte)DAT_00202a48 ^ *(byte *)((char *)puVar6 + 19)) & 0x7f ^ *(byte *)((char *)puVar6 + 19);
    *(byte *)(puVar6 + 10) = (char)DAT_00202a3c * '\\b' + 0x87U & 0xf9 | 1;
    ((uw_object_hdr_t *)puVar6)->chain_word_low = ((uw_object_hdr_t *)puVar6)->quality;
    ((uw_object_hdr_t *)puVar6)->chain_word_high = 0;
    ((uw_object_hdr_t *)puVar6)->link_word_low = ((uw_object_hdr_t *)puVar6)->owner | 0x40;
    ((uw_object_hdr_t *)puVar6)->link_word_high = 0;
    uVar7 = ((uw_object_hdr_t *)puVar6)->type_flags | 0x8000;
    ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)(char)((uw_object_hdr_t *)puVar6)->type_flags;
    ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)(char)(uVar7 >> 8);
    observed[5] = uVar7;
    uVar7 = (uVar7 ^ (int)DAT_00202a38) & 0x1ff ^ uVar7;
    ((uw_object_hdr_t *)puVar6)->type_flags = (ushort)uVar7;
    observed[6] = uVar7;
    uVar9 = (byte)DAT_00202a44[12] & 0x1f;
    DAT_00202a54 = (DAT_00202a44[1] >> 2 & 0xffe0) + DAT_00202a40 + uVar9 & 0xff;
    uVar7 = ((uw_object_hdr_t *)puVar6)->position_word & 0xfc7f | ((int)(short)(DAT_00202a54 & 0xe0) >> 5) << 7;
    ((uw_object_hdr_t *)puVar6)->position_word = (ushort)uVar7;
    observed[7] = uVar7;
    uVar9 = ((uw_object_hdr_t *)puVar6)->type_flags;
    ((uw_object_hdr_t *)puVar6)->type_flags_low = (byte)(char)(uVar9 & 0xdfff);
    ((uw_object_hdr_t *)puVar6)->type_flags_high = (byte)(char)((uVar9 & 0xdfff) >> 8);
    observed[8] = uVar9;
    uVar7 = (uint)((uw_object_hdr_t *)puVar6)->position_word;
    uVar7 = ((byte)DAT_00202a44[1] ^ uVar7) & 0x7f ^ uVar7;
    ((uw_object_hdr_t *)puVar6)->position_word_low = (byte)(char)uVar7;
    ((uw_object_hdr_t *)puVar6)->position_word_high = ((uw_object_hdr_t *)puVar6)->position_word_high;
    observed[9] = uVar7;
    uVar7 = (uVar7 ^ DAT_00202a44[1]) & 0x1fff ^ (uint)DAT_00202a44[1];
    bVar1 = (byte)uVar7;
    ((uw_object_hdr_t *)puVar6)->position_word_low = bVar1;
    bVar2 = (byte)(uVar7 >> 8);
    ((uw_object_hdr_t *)puVar6)->position_word_high = bVar2;
    bVar2 = (*(byte *)((char *)DAT_00202a44 + 3) ^ bVar2) & 0x1c ^ bVar2;
    ((uw_object_hdr_t *)puVar6)->position_word_low = bVar1;
    ((uw_object_hdr_t *)puVar6)->position_word_high = bVar2;
    observed[10] = uVar7; observed[11] = bVar1; observed[12] = bVar2;
    bVar3 = (cVar4 + (char)DAT_00202a3c * '\\x02' + (bVar1 & 0x7f) ^ bVar1) & 0x7f ^ bVar1;
    ((uw_object_hdr_t *)puVar6)->position_word_low = bVar3;
    ((uw_object_hdr_t *)puVar6)->position_word_high = bVar2;
    observed[13] = bVar3;
    ((uw_object_hdr_t *)puVar6)->position_word_low = (((char)DAT_00202a3c * '\\x02' - (*(byte *)(DAT_00086df8 + 0xb9) >> 3)) + g_object_type_props[(*DAT_00202a44 & 0x1ff)].height + (bVar1 & 0x7f) ^ bVar3) & 0x7f ^ bVar3;
    ((uw_object_hdr_t *)puVar6)->position_word_high = bVar2;
    uVar9 = ((uw_object_hdr_t *)puVar6)->link_word;
    ((uw_object_hdr_t *)puVar6)->link_word_low = (byte)(char)(uVar9 & 0xffc0);
    ((uw_object_hdr_t *)puVar6)->link_word_high = (byte)(char)((uVar9 & 0xffc0) >> 8);
    observed[14] = uVar9;
    return puVar6;
}
'''
HARNESS = '''
uw_object_hdr_t *reference_spawn(void);
static void reset(unsigned seed, int mode) {
    input = seed; signed_input = (int)seed - (mode & 1) * 65536;
    unsigned state = seed * 31 + mode;
    for (unsigned j = 0; j < sizeof(storage); ++j) {
        state = state * 1664525u + 1013904223u;
        ((byte *)&storage)[j] = state >> 24;
    }
    for (unsigned j = 0; j < sizeof(template_record); ++j)
        ((byte *)&template_record)[j] = (seed + j * 53) ^ (mode * 71);
    template_record.hdr.position_word = seed;
    template_record.hdr.type_flags = seed ^ 0x5a5a;
    for (unsigned j = 0; j < 512; ++j) {
        g_object_type_props[j].height = (seed >> 8) + j;
        g_object_type_props[j].can_have_owner = (seed + j) & 1;
    }
    DAT_00202a44 = (ushort *)&template_record;
    g_player_object = mode & 2 ? (uw_mobile_object_t *)&template_record : NULL;
    DAT_00202a38 = seed & 511; DAT_00202a3c = seed * 19;
    DAT_00202a40 = seed; DAT_00202a54 = seed & 1;
    DAT_00202a48 = seed; DAT_00202a4c = seed & 511; DAT_00202a50 = (seed * 17) & 511;
    DAT_00086df8 = character; character[0xb9] = seed >> 8;
    memset(observed, 0, sizeof(observed));
    allocations = frees = sounds = inserts = lookup_x = lookup_y = 0;
}
int main(void) {
    unsetenv("UW_DEBUG_THROW");
    for (unsigned seed = 0; seed < 65536; ++seed) {
        for (int mode = 0; mode < 4; ++mode) {
            byte expected[sizeof(storage)], source[sizeof(template_record)];
            unsigned snapshots[16], effects[7];
            reset(seed, mode);
            int returned = reference_spawn() != NULL;
            memcpy(expected, &storage, sizeof(storage));
            memcpy(source, &template_record, sizeof(template_record));
            memcpy(snapshots, observed, sizeof(observed));
            effects[0] = allocations; effects[1] = frees; effects[2] = sounds;
            effects[3] = inserts; effects[4] = lookup_x; effects[5] = lookup_y;
            effects[6] = DAT_00202a54;
            reset(seed, mode);
            assert((spawn_object_near_player() != NULL) == returned);
            assert(memcmp(expected, &storage, sizeof(storage)) == 0);
            assert(memcmp(source, &template_record, sizeof(template_record)) == 0);
            assert(memcmp(snapshots, observed, sizeof(observed)) == 0);
            assert(effects[0] == allocations && effects[1] == frees && effects[2] == sounds);
            assert(effects[3] == inserts && effects[4] == lookup_x && effects[5] == lookup_y);
            assert(effects[6] == DAT_00202a54);
        }
    }
    puts("Projectile launch: 65,536 inputs x 4 modes; full records, guards, source, snapshots and effects passed");
}
'''
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'spawn.c'
    reference = Path(tmp) / 'reference.c'
    reference.write_text('#include "src/headers/uw.h"\nextern unsigned input, observed[16];\nextern int signed_input;\n' + RAW.replace('spawn_object_near_player', 'reference_spawn'))
    excluded = '''int unrelated_projectile(ushort *puVar6)
{
    *(char *)(puVar6 + 6) = 1;
    return puVar6[11];
}
'''
    path.write_text(PREAMBLE + RAW + excluded + HARNESS)
    def transform():
        result = subprocess.run([sys.argv[1], '--sp-file', str(PATCH), str(path),
                                 '--all-includes', '--include-headers-for-types', '-I', str(ROOT),
                                 '-I', str(ROOT / 'src'), '--in-place'], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    transform()
    converted = path.read_text()
    body = extract(converted, 'spawn_object_near_player')
    assert 'uw_projectile_object_t *puVar6;' in body
    assert 'puVar6[' not in body and '((char *)puVar6 +' not in body
    assert '->npc_' not in body
    for field in ['precise_x', 'precise_y', 'precise_z', 'tile_x', 'tile_y', 'tile_position',
                  'fine_heading', 'heading', 'source_slot', 'animation_flags', 'pitch', 'speed']:
        assert 'puVar6->' + field in body, (field, body)
    assert 'position_word_low =' not in body and 'position_word_high =' not in body
    assert extract(converted, 'unrelated_projectile') == extract(excluded, 'unrelated_projectile')
    program = Path(tmp) / 'spawn'
    result = subprocess.run(['cc', '-std=c11', '-O2', *FLAGS, '-I', str(ROOT), str(path),
                             str(reference), '-o', str(program)], capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(program)], text=True).strip())
    transform()
    assert path.read_text() == converted, 'projectile launch rules are not idempotent'
