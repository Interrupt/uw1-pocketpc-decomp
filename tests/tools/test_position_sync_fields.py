"""Check position-sync conversions against independent bytes and optional original source."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tools/coccinelle'))
from generate_position_sync_rules import generate_accesses, generate_updates
from extract_functions import extract

patches = [('position-sync-accesses.cocci', generate_accesses()),
           ('position-sync-updates.cocci', generate_updates())]
for name, text in patches:
    assert (ROOT / 'tools/coccinelle' / name).read_text() == text
actual = extract((ROOT / 'src/ai.c').read_text(), 'sync_object_tile_position')
assert 'object[' not in actual and '*(byte *)(object' not in actual and '*(char *)(object' not in actual
assert 'projectile->precise_x' in actual and '->movement_mode' in actual and '->pitch =' in actual
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'sync_functions.c'
    original = '#include "src/headers/uw.h"\n' + actual + '\n'
    if '--reference' in sys.argv:
        ref = Path(sys.argv[sys.argv.index('--reference') + 1]).read_text()
        original += '#define REFERENCE_AVAILABLE\n' + extract(ref, 'sync_object_tile_position').replace('sync_object_tile_position(', 'reference_sync_object_tile_position(', 1) + '\n'
    path.write_text(original)
    fixture = ROOT / 'tests/tools/position_sync_fixture.c'
    flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
    result = subprocess.run(['cc', '-std=c11', '-O2', *flags, '-Wno-incompatible-pointer-types', '-I', str(ROOT), '-I', tmp,
                             str(fixture), '-o', str(Path(tmp) / 'sync')], capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(Path(tmp) / 'sync')], text=True).strip())
    # Check both current source idempotence and the complete legacy conversion
    # when the optional original revision is supplied for a reviewed batch.
    if '--reference' in sys.argv:
        path.write_text('#include "src/headers/uw.h"\n' + extract(ref, 'sync_object_tile_position') + '\n')
    for _ in range(2):
        before = path.read_text()
        for name, _ in patches:
            result = subprocess.run([sys.argv[1], '--sp-file', str(ROOT / 'tools/coccinelle' / name), str(path),
                                     '--all-includes', '--include-headers-for-types', '-I', str(ROOT), '-I', str(ROOT / 'src'), '--in-place'], capture_output=True, text=True)
            assert result.returncode == 0, result.stdout + result.stderr
        assert extract(path.read_text(), 'sync_object_tile_position') == actual
    print('Position synchronization rules: coverage and idempotence passed')
