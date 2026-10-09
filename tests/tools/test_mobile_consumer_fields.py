"""Differential packed-byte consumers, signed height, saved NPC and scope guards."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_shared_mobile_rules import CONTEXTS, access_rules, precise_rules, shared_write_rules
from generate_mobile_consumer_rules import generate
from extract_functions import extract
assert (ROOT/'tools/coccinelle/mobile-consumer-fields.cocci').read_text() == generate()
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
names = ['collision_height_envelope', 'resolve_collision_candidate_interaction',
         'apply_object_durability_damage', 'apply_melee_damage', 'emit_tile_features',
         'pick_object_under_cursor', 'begin_directional_move', 'detect_npc_wander_proximity',
         'npc_ai_default_tick']
raw = '\n'.join('#define '+n+' declared_'+n for n in names) + '\n#include "src/headers/uw.h"\n' + '\n'.join('#undef '+n for n in names) + '''
#include <assert.h>
#include <string.h>
uw_mobile_object_t *g_player_object, *DAT_0010190c;
int collision_height_envelope(ushort *puVar7) {
    return (*(byte *)((char *)puVar7 + 0x15) & 0x80) == 0;
}
void resolve_collision_candidate_interaction(ushort *puVar4) {
    *(byte *)((char *)puVar4 + 0x15) = *(byte *)((char *)puVar4 + 0x15) | 0x80;
}
int apply_object_durability_damage(ushort *object, int iVar5) {
    int iVar1;
    iVar5 = (uint)(byte)object[4] - iVar5;
    iVar1 = iVar5 * 0x10000 >> 0x10;
    if (iVar1 < 1) iVar5 = 0;
    *(char *)(object + 4) = (char)iVar5;
    return iVar1;
}
int apply_melee_damage(ushort *puVar6) {
    return (puVar6[7] & 4) + (uint)(byte)puVar6[4] * 3;
}
int emit_tile_features(ushort *puVar5) {
    return *(short *)((char *)puVar5 + 0xf);
}
uint pick_object_under_cursor(ushort *puVar3) {
    return (unsigned)*(byte *)((char *)puVar3 + 10) +
           257 * (unsigned)*(byte *)((char *)puVar3 + 0x13) +
           65537 * (unsigned)*(byte *)((char *)puVar3 + 0x14) +
           16777217 * (unsigned)*(byte *)((char *)puVar3 + 0x15);
}
ushort begin_directional_move(ushort z) {
    ushort uVar1;
    byte bVar2;
    uVar1 = *(undefined2 *)((char *)g_player_object + 2);
    bVar2 = (byte)uVar1;
    g_player_object->hdr.position_word_low = (bVar2 ^ (byte)z) & 0x7f ^ bVar2;
    g_player_object->hdr.position_word_high = (byte)(char)((ushort)uVar1 >> 8);
    return uVar1;
}
void detect_npc_wander_proximity(ushort *puVar7) {
    *(byte *)((char *)puVar7 + 0x19) = *(byte *)((char *)puVar7 + 0x19) & 0xfe;
}
uint npc_ai_default_tick(void) {
    char *npc_rec;
    ushort uVar2;
    uint uVar11;
    int uw_ord2005_rem_96;
    npc_rec = (char *)DAT_0010190c;
    uVar2 = DAT_0010190c->goal_word;
    uw_ord2005_rem_96 = ((int)((uVar2 >> 0xc) + 1)) % (4);
    uVar11 = uVar2 & 0xfff;
    *(char *)(npc_rec + 0xb) = (char)uVar11;
    DAT_0010190c->goal_word_high = (byte)(uVar11 >> 8) | (byte)(((uw_ord2005_rem_96 & 0xf) << 0xc) >> 8);
    return uVar11;
}
void excluded(ushort *puVar4) {
    *(byte *)((char *)puVar4 + 0x15) = *(byte *)((char *)puVar4 + 0x15) | 0x80;
}
int main(void) {
    _Alignas(2) byte bytes[28], expected[28];
    uint64_t hash = 1;
    for (unsigned seed = 0; seed < 65536; ++seed) {
      for (unsigned damage = 0; damage < 260; damage += 13) {
        for (unsigned j = 0; j < sizeof bytes; ++j) bytes[j] = (seed >> (j & 7)) + j * 31;
        g_player_object = DAT_0010190c = (uw_mobile_object_t *)bytes;
        memcpy(expected, bytes, sizeof bytes);
        assert(emit_tile_features((ushort *)bytes) == (short)(bytes[15] | (bytes[16] << 8)));
        assert(apply_melee_damage((ushort *)bytes) == (bytes[14] & 4) + bytes[8] * 3);
        assert(collision_height_envelope((ushort *)bytes) == ((bytes[21] & 128) == 0));
        hash = hash * 31 + pick_object_under_cursor((ushort *)bytes);
        resolve_collision_candidate_interaction((ushort *)bytes);
        expected[21] |= 128;
        assert(!memcmp(bytes, expected, sizeof bytes));
        int hp = expected[8] - damage;
        hash = hash * 31 + apply_object_durability_damage((ushort *)bytes, damage);
        expected[8] = hp < 1 ? 0 : hp;
        assert(!memcmp(bytes, expected, sizeof bytes));
        unsigned oldpos = expected[2] | (expected[3] << 8);
        assert(begin_directional_move(seed) == oldpos);
        expected[2] = (expected[2] & 128) | (seed & 127);
        detect_npc_wander_proximity((ushort *)bytes);
        expected[25] &= 254;
        unsigned oldgoal = expected[11] | (expected[12] << 8);
        assert(npc_ai_default_tick() == (oldgoal & 4095));
        unsigned goal = (oldgoal & 4095) | ((((oldgoal >> 12) + 1) % 4) << 12);
        expected[11] = goal; expected[12] = goal >> 8;
        assert(!memcmp(bytes, expected, sizeof bytes));
        for (unsigned j = 0; j < sizeof bytes; ++j) hash = hash * 31 + bytes[j];
      }
    }
    printf("%llu\\n", (unsigned long long)hash);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'consumers.c'; path.write_text(raw)
    executable = Path(tmp)/'consumers'
    def run():
        subprocess.run(['cc', '-std=c11', '-O2', *flags, '-I', str(ROOT), str(path), '-o', str(executable)], check=True)
        return subprocess.check_output([str(executable)], text=True)
    before = run()
    entries = [e for group in CONTEXTS.values() for e in group if e[0] in names]
    phases = [access_rules(entries), precise_rules(), generate(), shared_write_rules()]
    for iteration in range(2):
        previous = path.read_text()
        for phase in phases:
            patch = Path(tmp)/'phase.cocci'; patch.write_text(phase)
            result = subprocess.run([sys.argv[1], '--sp-file', str(patch), str(path), '--all-includes',
                                     '--include-headers-for-types', '-I', str(ROOT), '-I', str(ROOT/'src'), '--in-place'],
                                    capture_output=True, text=True)
            assert result.returncode == 0, result.stdout + result.stderr
        converted = path.read_text()
        assert run() == before
        assert extract(converted, 'excluded') == extract(previous, 'excluded')
        for name, member in [('apply_object_durability_damage','hit_points'), ('emit_tile_features','precise_z'),
                             ('detect_npc_wander_proximity','npc_ai_flags'), ('npc_ai_default_tick','goal_word_low'),
                             ('apply_melee_damage','status_word_high')]:
            assert '->'+member in extract(converted, name), name
        assert 'g_player_object->hdr.position_word' in extract(converted, 'begin_directional_move')
        if iteration: assert converted == previous
print('1,310,720 consumer cases preserve bytes, signed height, damage, and snapshots')
