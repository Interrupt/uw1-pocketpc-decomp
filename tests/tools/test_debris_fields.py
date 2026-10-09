"""Verify exact debris conversion and before/after game behavior."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_debris_rules import generate, changes, ORIGINAL, FUNCTION
from extract_functions import extract
PATCH=ROOT/'tools/coccinelle/debris-fields.cocci'
assert PATCH.read_text()==generate()
actual=extract((ROOT/'src/object_actions.c').read_text(),FUNCTION)
original=ORIGINAL
if '--reference' in sys.argv:
    original=extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION)
    assert original==ORIGINAL
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path=Path(tmp)/'debris_functions.c'
    def apply():
        result=subprocess.run([sys.argv[1],'--sp-file',str(PATCH),str(path),
            '--all-includes','--include-headers-for-types','-I',str(ROOT),'-I',str(ROOT/'src'),
            '--in-place'],capture_output=True,text=True)
        assert result.returncode==0,result.stdout+result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+original)
    apply(); assert extract(path.read_text(),FUNCTION)==actual
    before=path.read_text(); apply(); assert path.read_text()==before
    # The full body guard rejects callbacks, volatile captures, changed
    # arithmetic, escaping/live temporary observations and renamed scope.
    for key,old,new in changes():
        first=old.splitlines()[0]
        assert first in original,key
        protected=original.replace(first,first+'\n    observe();',1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(),FUNCTION)==protected,key
    for old,new in [('ushort uVar2;','volatile ushort uVar2;'),
                    ('uVar10 + 1','uVar10 + 2'),
                    ('bVar3 = (byte)uVar2;','bVar3 = (byte)uVar2; escape(&uVar2);'),
                    ('bVar3 = (byte)uVar2;','bVar3 = (byte)uVar2; observe(uVar10);')]:
        assert old in original
        protected=original.replace(old,new,1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(),FUNCTION)==protected,(old,new)
    excluded=original.replace(FUNCTION,'excluded',1)
    path.write_text('#include "src/headers/uw.h"\n'+excluded); apply()
    assert extract(path.read_text(),'excluded')==excluded
    path.write_text(actual+'\n'+original.replace(FUNCTION+'(','reference_'+FUNCTION+'(',1))
    exe=Path(tmp)/'debris'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,
        '-I',str(ROOT),'-I',tmp,str(ROOT/'tests/tools/debris_fixture.c'),'-o',str(exe)],
        capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Exact debris conversion, idempotence and callback/capture/scope guards pass')
