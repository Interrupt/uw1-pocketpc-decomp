"""Verify guarded blood-splat conversion and original/current behavior."""
from pathlib import Path
import re
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_blood_splat_rules import FUNCTION, ORIGINAL, converted, generate
from extract_functions import extract

def tokens(source):
    # Keep literals intact while ignoring formatting and explanatory comments.
    return re.findall(r'"(?:\\.|[^"\\])*"|\w+|[^\w\s]', re.sub(r'/\*[\s\S]*?\*/', '', source))

PATCH = ROOT/'tools/coccinelle/blood-splat-fields.cocci'
assert PATCH.read_text() == generate()
actual = extract((ROOT/'src/combat.c').read_text(), FUNCTION)
assert tokens(actual) == tokens(converted()) and tokens(actual) != tokens(ORIGINAL)
if '--reference' in sys.argv:
    source = Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
    assert extract(source, FUNCTION) == ORIGINAL
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'blood_splat_functions.c'
    def apply():
        result = subprocess.run([sys.argv[1], '--sp-file', str(PATCH), str(path),
            '--all-includes', '--include-headers-for-types', '-I', str(ROOT),
            '-I', str(ROOT/'src'), '--in-place'], capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+ORIGINAL); apply()
    assert tokens(extract(path.read_text(), FUNCTION)) == tokens(actual)
    assert 'latent while that function always returned 0' in path.read_text()
    before = path.read_text(); apply(); assert path.read_text() == before
    for old, new in [
        ('ushort uVar3;', 'volatile ushort uVar3;'),
        ('bVar2 = (byte)uVar10;', 'bVar2 = (byte)uVar10; observe();'),
        ('sVar5 = *(short *)(DAT_00202c6c + 2);',
         'sVar5 = *(short *)(DAT_00202c6c + 2); escape(&bVar1);'),
        ('uVar8 = encode_object_slot_index(iVar7);',
         'observe(uVar10); uVar8 = encode_object_slot_index(iVar7);'),
        ('& 0x1fff', '& 0x0fff'),
        ('->position_word_high = bVar1;', '->position_word_high = observe_byte(), bVar1;')]:
        assert old in ORIGINAL
        protected = ORIGINAL.replace(old, new, 1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(), FUNCTION) == protected, old
    excluded = ORIGINAL.replace(FUNCTION, 'excluded', 1)
    path.write_text('#include "src/headers/uw.h"\n'+excluded); apply()
    assert extract(path.read_text(), 'excluded') == excluded
    path.write_text(actual+'\n'+ORIGINAL.replace(FUNCTION+'(', 'reference_'+FUNCTION+'(', 1))
    exe = Path(tmp)/'blood_splat'
    result = subprocess.run(['cc', '-std=c11', '-D_DARWIN_C_SOURCE', '-O2', '-Wno-pointer-sign',
        *flags, '-I', str(ROOT), '-I', tmp, str(ROOT/'tests/tools/blood_splat_fixture.c'), '-o', str(exe)],
        capture_output=True, text=True)
    assert result.returncode == 0, result.stdout + result.stderr
    print(subprocess.check_output([str(exe)], text=True).strip())
print('Exact blood-splat token conversion, idempotence and callback/capture/scope guards pass')
