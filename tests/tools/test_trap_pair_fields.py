"""Test named trap-pair initialization with real before/after game functions."""
from pathlib import Path
import re
import subprocess
import sys
import tempfile
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from extract_functions import extract
from generate_trap_pair_rules import generate, changes, FUNCTION
PATCH = ROOT/'tools/coccinelle/trap-pair-fields.cocci'
assert PATCH.read_text() == generate()
actual = extract((ROOT/'src/traps.c').read_text(), FUNCTION)
original = actual
for key,before,after in changes():
    pattern = re.compile(r'(?m)^([ \t]*)' + r'\s*'.join(re.escape(line) for line in after.splitlines()))
    original,count = pattern.subn(lambda m: m[1] + before.replace('\n', '\n'+m[1]), original)
    assert count == 1, key
if '--reference' in sys.argv:
    original = extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(), FUNCTION)
flags = ['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'trap_pair_functions.c'
    def apply():
        result = subprocess.run([sys.argv[1],'--sp-file',str(PATCH),str(path),
            '--all-includes','--include-headers-for-types','-I',str(ROOT),'-I',str(ROOT/'src'),
            '--in-place'],capture_output=True,text=True)
        assert result.returncode == 0, result.stdout+result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+original)
    apply(); assert extract(path.read_text(),FUNCTION) == actual
    before = path.read_text(); apply(); assert path.read_text() == before
    # Calls inside a folded block invalidate that block's exact adjacency.
    for key,old,new in changes():
        if '\n' not in old: continue
        protected = original.replace(old.splitlines()[0],old.splitlines()[0]+'\n      observe();',1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(),FUNCTION) == protected, key
    for old,new in [('ushort uVar2;', 'volatile ushort uVar2;'),
                    ('uVar2 & 0xffa0', 'uVar2 & 0xfff0'),
                    ('return uVar8;', 'observe(uVar7); return uVar8;'),
                    ('return uVar8;', 'escape(&uVar11); return uVar8;')]:
        protected = original.replace(old,new,1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(),FUNCTION) == protected, (old,new)
    excluded = original.replace(FUNCTION, 'excluded',1)
    path.write_text('#include "src/headers/uw.h"\n'+excluded); apply()
    assert extract(path.read_text(),'excluded') == excluded
    path.write_text(actual+'\n'+original.replace(FUNCTION+'(', 'reference_'+FUNCTION+'(',1))
    exe = Path(tmp)/'traps'
    result = subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,
        '-I',str(ROOT),'-I',tmp,str(ROOT/'tests/tools/trap_pair_fixture.c'),'-o',str(exe)],
        capture_output=True,text=True)
    assert result.returncode == 0, result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Exact trap-pair conversion, idempotence and callback/scope guards pass')
