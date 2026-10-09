"""Verify lifetime/heading recipes, scope, idempotence and packed-byte preservation."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
from generate_projectile_lifecycle_rules import generate, SITES
from extract_functions import extract
PATCH = ROOT / 'tools/coccinelle/projectile-lifecycle-fields.cocci'
assert PATCH.read_text() == generate()
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
raw = '''#define drop_held_object_near_player declared_drop
#define fire_ranged_weapon declared_fire
#define reallocate_object_to_arena declared_reallocate
#define settle_mobile_to_immobile declared_settle
#include "src/headers/uw.h"
#undef drop_held_object_near_player
#undef fire_ranged_weapon
#undef reallocate_object_to_arena
#undef settle_mobile_to_immobile
#include <assert.h>
#include <string.h>
void drop_held_object_near_player(ushort *puVar5, ushort *held_object) {
    *(byte *)(puVar5 + 4) = (byte)held_object[2] & 0x3f;
    *(byte *)(puVar5 + 0xd) = (byte)(held_object[1] >> 7) & 7;
}
void fire_ranged_weapon(ushort *puVar6, ushort *puVar7) {
    *(byte *)(puVar6 + 4) = (byte)puVar7[2] & 0x3f;
    *(byte *)(puVar6 + 0xd) = (byte)(puVar7[1] >> 7) & 7;
}
void reallocate_object_to_arena(ushort *puVar2, ushort *object) {
    *(byte *)(puVar2 + 0xd) = ((uw_object_hdr_t *)object)->heading;
}
uint settle_mobile_to_immobile(ushort *object, ushort *puVar9) {
    uint uVar11;
    uVar11 = ((uw_object_hdr_t *)puVar9)->position_word & 0xfc7f | ((byte)object[0xd] & 7) << 7;
    ((uw_object_hdr_t *)puVar9)->position_word = (ushort)uVar11;
    return uVar11;
}
void excluded(ushort *puVar5, ushort *held_object) {
    *(byte *)(puVar5 + 4) = (byte)held_object[2] & 0x3f;
}
int main(void) {
    _Alignas(2) byte source[28], dest[28], expected[28];
    for (unsigned word = 0; word < 65536; ++word) {
        for (unsigned heading = 0; heading < 256; ++heading) {
            memset(source, 0x5a, sizeof source);
            memset(dest, 0xa5, sizeof dest);
            source[2] = word; source[3] = word >> 8;
            source[4] = word; source[5] = word >> 8;
            memcpy(expected, dest, sizeof dest);
            expected[8] = word & 63; expected[26] = (word >> 7) & 7;
            drop_held_object_near_player((ushort *)dest, (ushort *)source);
            assert(!memcmp(dest, expected, sizeof dest));
            memset(dest, 0xa5, sizeof dest);
            fire_ranged_weapon((ushort *)dest, (ushort *)source);
            assert(!memcmp(dest, expected, sizeof dest));
            memset(dest, 0xa5, sizeof dest);
            expected[8] = 0xa5;
            reallocate_object_to_arena((ushort *)dest, (ushort *)source);
            assert(!memcmp(dest, expected, sizeof dest));
            source[26] = heading;
            dest[2] = word; dest[3] = word >> 8;
            memcpy(expected, dest, sizeof dest);
            unsigned restored = (word & 0xfc7f) | ((heading & 7) << 7);
            expected[2] = restored; expected[3] = restored >> 8;
            assert(settle_mobile_to_immobile((ushort *)source, (ushort *)dest) == restored);
            assert(!memcmp(dest, expected, sizeof dest));
        }
    }
    puts("16,777,216 heading/position combinations preserve all bytes and live word results");
}
'''
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'lifecycle.c'
    executable = Path(tmp) / 'lifecycle'
    path.write_text(raw)
    def apply():
        result = subprocess.run([sys.argv[1], '--sp-file', str(PATCH), str(path),
                                 '--all-includes', '--include-headers-for-types',
                                 '-I', str(ROOT), '-I', str(ROOT/'src'), '--in-place'],
                                capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    def run():
        subprocess.run(['cc', '-std=c11', '-O2', *flags, '-I', str(ROOT), str(path),
                        '-o', str(executable)], check=True)
        print(subprocess.check_output([str(executable)], text=True).strip())
    run()
    apply()
    converted = path.read_text()
    assert converted != raw
    assert extract(converted, 'excluded') == extract(raw, 'excluded')
    for name in SITES:
        assert 'original_heading' in extract(converted, name)
    run()
    apply()
    assert path.read_text() == converted
    for function, filename in SITES.items():
        actual = extract((ROOT/'src'/filename).read_text(), function)
        if '--reference-dir' in sys.argv:
            reference = Path(sys.argv[sys.argv.index('--reference-dir') + 1]) / filename
            path.write_text('#include "src/headers/uw.h"\n' + extract(reference.read_text(), function))
            apply()
            assert extract(path.read_text(), function) == actual, function
        path.write_text('#include "src/headers/uw.h"\n' + actual)
        apply()
        assert extract(path.read_text(), function) == actual, function
print('Lifecycle source conversions and idempotence pass')
