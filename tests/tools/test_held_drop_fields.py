"""Verify exact held-drop conversion and original/current record behavior."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_held_drop_rules import generate,converted,changes,ORIGINAL,FUNCTION
from extract_functions import extract
from main_diagnostic_removals import without_env_prints
PATCH=ROOT/'tools/coccinelle/held-drop-fields.json'
assert PATCH.read_text()==generate()
actual=extract((ROOT/'src/item_use.c').read_text(),FUNCTION)
original=ORIGINAL
if '--reference' in sys.argv:
    original=extract(Path(sys.argv[sys.argv.index('--reference')+1]).read_text(),FUNCTION)
    assert original==ORIGINAL
historical=converted()
assert actual==without_env_prints(historical,'UW_DEBUG_THROW') and actual!=original
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path=Path(tmp)/'held_drop_functions.c'
    def apply():
        result=subprocess.run([sys.executable,str(ROOT/'tools/coccinelle/apply_held_drop_rules.py'),str(path)],capture_output=True,text=True)
        assert result.returncode==0,result.stdout+result.stderr
    path.write_text('#include "src/headers/uw.h"\n#include "src/headers/debug.h"\n'+original); apply()
    assert extract(path.read_text(),FUNCTION)==historical
    before=path.read_text(); apply(); assert path.read_text()==before
    for key,old,new in changes():
        if '\n' not in old: continue
        first=old.splitlines()[0]; line=next(line for line in original.splitlines() if first in line)
        protected=original.replace(line,line+'\n    observe();',1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(),FUNCTION)==protected,key
    for old,new in [('ushort uVar2;','volatile ushort uVar2;'),
                    ('& 0x7fff','& 0x3fff'),
                    ('free_object_slot(held_object);','observe(uVar6); free_object_slot(held_object);'),
                    ('free_object_slot(held_object);','escape(&bVar1); free_object_slot(held_object);'),
                    ('256.0','255.0')]:
        assert old in original
        protected=original.replace(old,new,1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(),FUNCTION)==protected,(old,new)
    excluded=original.replace(FUNCTION,'excluded',1)
    path.write_text('#include "src/headers/uw.h"\n'+excluded); apply()
    assert extract(path.read_text(),'excluded')==excluded
    quoted='/* Example only:\n'+original+'\n*/\n'
    path.write_text(quoted); apply(); assert path.read_text()==quoted
    path.write_text(actual+'\n'+original.replace(FUNCTION+'(','reference_'+FUNCTION+'(',1))
    exe=Path(tmp)/'held_drop'
    result=subprocess.run(['cc','-std=c11','-D_DARWIN_C_SOURCE','-O2','-Wno-pointer-sign',*flags,
        '-I',str(ROOT),'-I',tmp,str(ROOT/'tests/tools/held_drop_fixture.c'),'-lm','-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Exact held-drop conversion, idempotence and callback/capture/scope guards pass')
