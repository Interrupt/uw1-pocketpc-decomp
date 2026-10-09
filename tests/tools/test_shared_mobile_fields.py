"""Verify shared-mobile recipes and placement output against independent bytes."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
from generate_shared_mobile_rules import CONTEXTS, access_rules, bit_rules, precise_rules, coordinate_rules, shared_write_rules
from extract_functions import extract
from generate_named_field_read_rules import generate as named_reads
from struct_field_catalog import WORDS

HERE = ROOT / 'tools/coccinelle/shared-mobile'
for filename, entries in CONTEXTS.items():
    assert (HERE / (filename + '.cocci')).read_text() == access_rules(entries)
    assert (HERE / (filename + '.bits.cocci')).read_text() == bit_rules(entries)
    assert (HERE / (filename + '.coordinates.cocci')).read_text() == coordinate_rules(entries)
assert (HERE / 'precise.cocci').read_text() == precise_rules()
assert (HERE / 'writes.cocci').read_text() == shared_write_rules()

actual = extract((ROOT / 'src/ai.c').read_text(), 'build_object_placement_snapshot')
assert 'object[' not in actual
for field in ['tile_x', 'tile_y', 'movement_mode', 'gravity_flag', 'hit_points',
              'speed', 'pitch', 'precise_x', 'precise_y', 'precise_z']:
    assert '->' + field in actual, field
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'placement_functions.c'
    source = actual
    if '--reference' in sys.argv:
        ref = Path(sys.argv[sys.argv.index('--reference') + 1]).read_text()
        source += '\n#define REFERENCE_AVAILABLE\n' + extract(ref, 'build_object_placement_snapshot').replace(
            'build_object_placement_snapshot(', 'reference_build_object_placement_snapshot(', 1)
    path.write_text(source)
    flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
    executable = Path(tmp) / 'placement'
    result = subprocess.run(['cc', '-std=c11', '-O2', *flags, '-Wno-incompatible-pointer-types',
                             '-I', str(ROOT), '-I', tmp, str(ROOT / 'tests/tools/placement_snapshot_fixture.c'),
                             '-o', str(executable)], capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(executable)], text=True).strip())

    # Exercise declaration-dependent scaling and signed reads, with an
    # unrelated monster-table field and an out-of-scope function as guards.
    entries = [('shared_word', 'p', 'ushort *', 'shared'),
               ('shared_char', 'p', 'char *', 'shared'),
               ('shared_void', 'p', 'void *', 'shared')]
    bodies = []
    for name, _, typ, _ in entries:
        hp = '(byte)p[4]' if typ == 'ushort *' else '*(byte *)(p + 8)'
        tile = 'p[11]' if typ == 'ushort *' else '*(ushort *)(p + 22)'
        bodies.append(f'''int {name}({typ}p)
{{
    return {hp} + *(char *)((char *)p + 19) +
        (({tile} & 0xfc00) >> 7) * 3 + (({tile} >> 1) & 0x1f8) +
        (((uw_mobile_object_t *)p)->movement_flags & 15) + (table.movement_flags & 15) +
        ((byte)(((uw_mobile_object_t *)p)->movement_flags >> 4) & 7);
}}
''')
    path = Path(tmp) / 'receivers.c'
    path.write_text('''#include "src/headers/uw.h"
uw_monster_type_props_t table;
int excluded(ushort *p)
{
    return (byte)p[4];
}
void shared_store(uw_mobile_object_t *p, unsigned value)
{
    ((uw_mobile_object_t *)p)->movement_flags = ((uw_mobile_object_t *)p)->movement_flags & 0xf0;
    ((uw_mobile_object_t *)p)->motion_flags = ((((value & 3) + 2) ^ ((uw_mobile_object_t *)p)->motion_flags) & 0x7f) ^ ((uw_mobile_object_t *)p)->motion_flags;
    ((uw_mobile_object_t *)p)->attack_pitch = (((value << 3) ^ ((uw_mobile_object_t *)p)->attack_pitch) & 0xf8) ^ ((uw_mobile_object_t *)p)->attack_pitch;
}
''' + '\n'.join(bodies) + '''
int main(void) {
    _Alignas(2) byte bytes[28]; uint64_t hash = 1;
    for (unsigned seed = 0; seed < 65536; ++seed) {
        for (unsigned j = 0; j < sizeof bytes; ++j) bytes[j] = (seed >> (j & 7)) + j * 31;
        table.movement_flags = seed;
        hash = hash * 31 + shared_word((ushort *)bytes);
        hash = hash * 31 + shared_char((char *)bytes);
        hash = hash * 31 + shared_void(bytes);
        hash = hash * 31 + excluded((ushort *)bytes);
        shared_store((uw_mobile_object_t *)bytes, seed);
        for (unsigned j = 0; j < sizeof bytes; ++j) hash = hash * 31 + bytes[j];
    }
    printf("%llu\\n", (unsigned long long)hash);
}
''')
    def execute():
        result = subprocess.run(['cc', '-std=c11', '-O2', *flags, '-I', str(ROOT), str(path),
                                 '-o', str(executable)], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        return subprocess.check_output([str(executable)], text=True)
    before = execute()
    phases = [access_rules(entries), bit_rules(entries), coordinate_rules(entries),
              named_reads({'tile_position': WORDS['tile_position']}, {}), shared_write_rules()]
    for iteration in range(2):
        previous = path.read_text()
        for phase in phases:
            patch = Path(tmp) / 'phase.cocci'; patch.write_text(phase)
            result = subprocess.run([sys.argv[1], '--sp-file', str(patch), str(path),
                                     '--all-includes', '--include-headers-for-types', '-I', str(ROOT),
                                     '-I', str(ROOT / 'src'), '--in-place'], capture_output=True, text=True)
            assert result.returncode == 0, result.stdout + result.stderr
        converted = path.read_text()
        assert execute() == before
        for name, _, _, _ in entries:
            body = extract(converted, name)
            for field in ['hit_points', 'motion_flags', 'tile_x', 'tile_y', 'tick_phase', 'movement_mode']:
                assert '->' + field in body, (name, field, body)
            assert '(table.movement_flags & 15)' in body
        assert extract(converted, 'excluded') == extract(previous, 'excluded')
        stores = extract(converted, 'shared_store')
        assert '->tick_phase = 0;' in stores and '->speed =' in stores and '->pitch =' in stores, stores
        if iteration: assert converted == previous
    print('Shared mobile scaling, signed reads, scope exclusions and idempotence passed')
