"""Verify spawn conversions and the exact game initializer against indexed bytes."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
from generate_npc_spawn_rules import generate, UPDATES, cleanup_dead_snapshots, cleanup_spawn_source
from generate_mobile_tick_rules import generate as phase_rules
from generate_current_alias_rules import HEADER, NPC
from extract_functions import extract

PATCH = ROOT / 'tools/coccinelle/npc-spawn-fields.cocci'
assert PATCH.read_text() == generate(), 'regenerate npc-spawn-fields.cocci'
PHASE_PATCH = ROOT / 'tools/coccinelle/mobile-tick-phase.cocci'
assert PHASE_PATCH.read_text() == phase_rules(), 'regenerate mobile-tick-phase.cocci'

# The cleanup is all-or-nothing: a later use or escaped address must retain
# every original snapshot, even when individual assignments look redundant.
dead = '''int init_monster_spawn_defaults()
{
  ushort uVar1;
  uVar1 = npc->goal_word;
  npc->npc_goal = 8;
  uVar1 = npc->status_word;
  /* preserve the explanation */
  npc->status_word = uVar1 & 0xfdff;
  return 1;
}'''
cleaned = cleanup_dead_snapshots(dead)
assert 'uVar1' not in cleaned and 'npc->status_word &= 0xfdff;' in cleaned
assert '/* preserve the explanation */' in cleaned
assert cleanup_dead_snapshots(cleaned) == cleaned
for use in ['return uVar1;', 'escape(&uVar1); return 1;', 'consume(uVar1); return 1;']:
    live = dead.replace('return 1;', use)
    assert cleanup_dead_snapshots(live) == live
assert cleanup_dead_snapshots(dead.replace('ushort uVar1;', 'volatile ushort uVar1;')) == dead.replace('ushort uVar1;', 'volatile ushort uVar1;')
SANITIZER_FLAGS = (['-fsanitize=address', '-fno-omit-frame-pointer']
                   if '--asan' in sys.argv[2:] else [])
PREAMBLE = '''#include "src/headers/uw.h"
#include <assert.h>
#include <limits.h>
uw_object_hdr_t *g_scratch_object_ptr;
byte monster_table[64 * 48];
uw_monster_type_props_t *DAT_001007c8;
#undef DAT_001007d0
#define DAT_001007d0 monster_table[0]
#define g_monster_type_props ((uw_monster_type_props_t *)monster_table)
static int random_value;
long ce_rand(void) { return random_value; }
unsigned input;
'''

with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'spawn.c'
    def execute(text):
        path.write_text(text)
        program = Path(tmp) / 'spawn'
        result = subprocess.run(['cc', '-std=c11', '-O2', *SANITIZER_FLAGS, '-I', str(ROOT), str(path),
                                 '-o', str(program)], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        return subprocess.check_output([str(program)], text=True)
    def transform(text):
        path.write_text(text)
        for patch in [PATCH, PHASE_PATCH]:
            result = subprocess.run([sys.argv[1], '--sp-file', str(patch), str(path),
                                 '--all-includes', '--include-headers-for-types', '-I', str(ROOT),
                                 '-I', str(ROOT / 'src'), '--in-place'], capture_output=True, text=True)
            assert result.returncode == 0, result.stdout + result.stderr
        return path.read_text()
    harness = '''
int main(void) {
    uint64_t hash = 0;
    for (input = 0; input < 65536; ++input) {
        uw_mobile_object_t obj;
        memset(&obj, 0xa5, sizeof(obj));
        for (unsigned k = 0; k < 64; ++k)
            monster_table[k * 48 + 4] = input + k;
        g_scratch_object_ptr = &obj.hdr;
        hash = hash * 31 + init_monster_spawn_defaults();
        for (unsigned j = 0; j < sizeof(obj); ++j)
            hash = hash * 31 + ((byte *)&obj)[j];
    }
    printf("%llu\\n", (unsigned long long)hash);
}
'''
    excluded = '''int unrelated_spawn(byte *scratch_bytes)
{
    scratch_bytes[8] = 7;
    return *(ushort *)(scratch_bytes + 11);
}
int projectile_spawn(byte *scratch_bytes)
{
    scratch_bytes[8] = 9;
    return *(ushort *)(scratch_bytes + 22);
}
'''
    accesses = []
    for offset in range(27):
        accesses += [f'scratch_bytes[{offset}] = input + {offset};',
                     f'hash = hash * 31 + scratch_bytes[{offset}];',
                     f'hash = hash * 31 + *(char *)(scratch_bytes + {offset});']
    for offset in (HEADER | NPC):
        accesses += [f'*(ushort *)(scratch_bytes + {offset}) = input;',
                     f'hash = hash * 31 + *(ushort *)(scratch_bytes + {offset});',
                     f'hash = hash * 31 + *(short *)(scratch_bytes + {offset});']
    accesses += ['*(char *)(scratch_bytes + 26) = (char)input;',
                 'char *identity = &*(char *)(scratch_bytes + 26);',
                 'hash += *identity;']
    accesses += ['DAT_001007c8 = &DAT_001007d0 + (((uw_object_hdr_t *)scratch_bytes)->object_id & 0x3f) * 0x30;',
                 'hash += (byte)DAT_001007c8[4];']
    raw = PREAMBLE.replace('uw_monster_type_props_t *DAT_001007c8;',
                           'static undefined *DAT_001007c8;') + excluded + '''int init_monster_spawn_defaults()
{
    byte *scratch_bytes = (byte *)g_scratch_object_ptr;
    unsigned hash = 0;
''' + '\n'.join(accesses) + '\nreturn hash;\n}\n' + harness
    before = execute(raw)
    converted = transform(raw)
    body = extract(converted, 'init_monster_spawn_defaults')
    assert 'scratch_bytes' not in body and 'uw_mobile_object_t *npc' in body
    assert 'DAT_001007c8->max_hp' in body and 'uw_monster_type_props_t *DAT_001007c8' in converted
    assert '(char *)&' in body and 'npc->npc_whoami = (byte)' in body
    for name in ['unrelated_spawn', 'projectile_spawn']:
        assert extract(raw, name) == extract(converted, name)
    assert execute(converted) == before, 'raw spawn offsets changed bytes or signed accesses'
    assert transform(converted) == converted

    updates = []
    for word, mask, low, high, field, value in UPDATES:
        updates += [f'npc->{word} = input;', f'V = npc->{word};',
                    f'npc->{word}_low = (byte)(V & {hex(mask)}) {low};',
                    f'npc->{word}_high = (byte)((V & {hex(mask)}) >> 8) {high};',
                    'hash = hash * 31 + V;', f'hash = hash * 31 + npc->{word};']
    for mask in [0xff0f, 0xfdff, 0xfbff, 0xf7ff, 0xfeff, 0xefff]:
        updates += ['npc->status_word = input;', 'V = npc->status_word;',
                    f'npc->status_word_low = (byte)(V & {hex(mask)});',
                    f'npc->status_word_high = (byte)((V & {hex(mask)}) >> 8);',
                    'hash = hash * 31 + V + npc->status_word;']
    raw = PREAMBLE + '''int init_monster_spawn_defaults()
{
    uw_mobile_object_t *npc = (uw_mobile_object_t *)g_scratch_object_ptr;
    ushort V;
    unsigned hash = 0;
''' + '\n'.join(updates) + '\nreturn hash;\n}\n' + harness
    before = execute(raw)
    converted = transform(raw)
    body = extract(converted, 'init_monster_spawn_defaults')
    assert '_low' not in body and '_high' not in body
    for _, _, _, _, field, value in UPDATES:
        assert f'npc->{field} = {value};' in body
    assert execute(converted) == before, 'spawn update changed live snapshots or packed bytes'
    assert transform(converted) == converted

    # Test the actual function, not a checked-in implementation copy. Expected
    # bytes use independent numeric offsets and final states from the legacy
    # initializer; this also catches changes to unknown status/AI flag bits.
    actual = extract((ROOT / 'src/object_actions.c').read_text(), 'init_monster_spawn_defaults')
    assert 'scratch_bytes' not in actual and '_low' not in actual and '_high' not in actual
    assert 'uVar1' not in actual and 'npc->tick_phase = 0;' in actual
    assert cleanup_spawn_source((ROOT / 'src/object_actions.c').read_text()) == (ROOT / 'src/object_actions.c').read_text()
    source = PREAMBLE + actual + '''
int main(void) {
    for (unsigned seed = 0; seed < 65536; ++seed) {
        for (int r = 0; r < 50; ++r) {
            byte memory[43], expected[43];
            unsigned state = seed + 1;
            for (unsigned j = 0; j < sizeof(memory); ++j) {
                state = state * 1664525u + 1013904223u;
                memory[j] = state >> 24;
            }
            byte *b = memory + 8;
            b[2] = seed; b[3] = seed >> 8;
            for (unsigned k = 0; k < 64; ++k)
                monster_table[k * 48 + 4] = (seed >> 8) + k;
            memcpy(expected, memory, sizeof(memory));
            byte *e = expected + 8;
            random_value = r < 48 ? r - 24 : r == 48 ? INT_MIN : INT_MAX;
            int hp = ((random_value % 24) + 16) * monster_table[(b[0] & 63) * 48 + 4];
            if (hp < 0) hp += 31;
            e[4] = (e[4] & 0xc0) | 32;
            e[6] = (e[6] & 0xc0) | 32;
            e[8] = hp >> 5;
            e[9] = ((seed >> 7) & 7) << 5;
            e[10] &= 0x70;
            e[11] = 8; e[12] = 0;
            e[13] = 0; e[14] = 0x80;
            e[15] = 0; e[16] = 0;
            e[17] = 0; e[18] = 0; e[19] = 0;
            e[20] = 0x84;
            e[21] = 0x20;
            e[22] = 0; e[23] = 0x82;
            e[24] &= 0x1f;
            e[25] = 0; e[26] = 0;
            g_scratch_object_ptr = (uw_object_hdr_t *)b;
            assert(init_monster_spawn_defaults() == 1);
            if (memcmp(memory, expected, sizeof(memory)) != 0) {
                for (unsigned j = 0; j < sizeof(memory); ++j)
                    if (memory[j] != expected[j])
                        fprintf(stderr, "seed=%u random=%d offset=%d actual=%u expected=%u\\n",
                                seed, random_value, (int)j - 8, memory[j], expected[j]);
                abort();
            }
            assert(DAT_001007c8 == &g_monster_type_props[b[0] & 63]);
        }
    }
    puts("NPC spawn initializer: 65,536 headings/record seeds x 50 random inputs passed");
}
'''
    print(execute(source).strip())
    assert transform(source) == source, 'game spawn initializer is not idempotent'
    print('NPC spawn conversions: offsets, signed reads/stores/addresses, live snapshots, exclusions and idempotence passed')

    phases = PREAMBLE + '''uw_mobile_object_t *DAT_0010190c;
static unsigned phase_read;
int init_monster_spawn_defaults()
{
    uw_mobile_object_t *npc = (uw_mobile_object_t *)g_scratch_object_ptr;
    npc->movement_flags = npc->movement_flags & 0xf0;
    return npc->movement_flags;
}
void tick_mobile_objects(char elapsed)
{
    phase_read = DAT_0010190c->movement_flags & 0xf;
}
int npc_ai_tick()
{
    return DAT_0010190c->movement_flags & 0xf;
}
int unrelated(uw_monster_type_props_t *row)
{
    return row->movement_flags & 0xf;
}
int main(void) {
    uw_mobile_object_t obj;
    DAT_0010190c = &obj;
    g_scratch_object_ptr = &obj.hdr;
    for (unsigned n = 0; n < 256; ++n) {
        memset(&obj, 0x5a, sizeof(obj));
        obj.movement_flags = n;
        tick_mobile_objects(0);
        assert(phase_read == (n & 15));
        assert(npc_ai_tick() == (n & 15));
        assert(init_monster_spawn_defaults() == (n & 240));
        for (unsigned j = 0; j < sizeof(obj); ++j)
            assert(((byte *)&obj)[j] == (j == 10 ? n & 240 : 0x5a));
    }
    puts("Mobile tick phase: 256 byte values; upper bits and neighboring bytes preserved");
}
'''
    before = execute(phases)
    converted = transform(phases)
    assert 'npc->tick_phase = 0;' in converted
    assert 'return DAT_0010190c->tick_phase;' in converted
    assert 'phase_read = DAT_0010190c->tick_phase;' in converted
    assert extract(phases, 'unrelated') == extract(converted, 'unrelated')
    assert execute(converted) == before
    assert transform(converted) == converted
    print(before.strip())
