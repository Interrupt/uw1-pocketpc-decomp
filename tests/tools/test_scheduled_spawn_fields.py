"""Check exact scheduled-spawn recipes and real before/after game bodies."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_scheduled_spawn_rules import generate, changes, ORIGINALS, DOOR, EFFECT
from extract_functions import extract
PATCH=ROOT/'tools/coccinelle/scheduled-spawn-fields.cocci'
assert PATCH.read_text()==generate()
SITES={DOOR:'doors.c',EFFECT:'scheduler.c'}
actual={name:extract((ROOT/'src'/source).read_text(),name) for name,source in SITES.items()}
original=dict(ORIGINALS)
if '--reference-dir' in sys.argv:
    directory=Path(sys.argv[sys.argv.index('--reference-dir')+1])
    original={name:extract((directory/source).read_text(),name) for name,source in SITES.items()}
    assert original==ORIGINALS
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path=Path(tmp)/'scheduled_spawn_functions.c'
    def apply():
        result=subprocess.run([sys.argv[1],'--sp-file',str(PATCH),str(path),
            '--all-includes','--include-headers-for-types','-I',str(ROOT),'-I',str(ROOT/'src'),
            '--in-place'],capture_output=True,text=True)
        assert result.returncode==0,result.stdout+result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+'\n'.join(original.values()))
    apply()
    for name in SITES: assert extract(path.read_text(),name)==actual[name],name
    before=path.read_text(); apply(); assert path.read_text()==before
    for change in changes():
        name=change['function']; first=change['before'].splitlines()[0]
        assert first in original[name],change['key']
        # Expression-only recipes (such as the null predicate) must insert
        # a valid statement after the complete source line, not inside it.
        line=next(line for line in original[name].splitlines() if first in line)
        protected=original[name].replace(line,line+'\n    observe();',1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(),name)==protected,change['key']
    for name,old,new in [(DOOR,'ushort tile_word;','volatile ushort tile_word;'),
                         (DOOR,'tile_word >> 4 & 0xf','tile_word >> 4 & 0xe'),
                         (DOOR,'position_high_bits =','observe(object_word); position_high_bits ='),
                         (EFFECT,'undefined2 uVar3;','volatile undefined2 uVar3;'),
                         (EFFECT,'& 0x1fff','& 0x1ffe'),
                         (EFFECT,'uVar7 = encode_object_slot_index','escape(&uVar6); uVar7 = encode_object_slot_index')]:
        assert old in original[name]
        protected=original[name].replace(old,new,1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(),name)==protected,(name,old)
    for name in SITES:
        excluded=original[name].replace(name,'excluded',1)
        path.write_text('#include "src/headers/uw.h"\n'+excluded); apply()
        assert extract(path.read_text(),'excluded')==excluded
    path.write_text('\n'.join(actual.values())+'\n'+'\n'.join(body.replace(name+'(','reference_'+name+'(',1) for name,body in original.items()))
    exe=Path(tmp)/'scheduled_spawn'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,
        '-I',str(ROOT),'-I',tmp,str(ROOT/'tests/tools/scheduled_spawn_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Exact scheduled-spawn conversion, idempotence and callback/capture/scope guards pass')
