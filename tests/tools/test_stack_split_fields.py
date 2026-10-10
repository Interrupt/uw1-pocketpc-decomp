"""Compare real before/after stack splitting and exact recipe guards."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_stack_split_rules import generate,changes,ORIGINALS,EXTRACT,REDUCE
from extract_functions import extract
PATCH=ROOT/'tools/coccinelle/stack-split-fields.cocci'
assert PATCH.read_text()==generate()
actual={name:extract((ROOT/'src/item_use.c').read_text(),name) for name in ORIGINALS}
original=dict(ORIGINALS)
if '--reference' in sys.argv:
    source=Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
    original={name:extract(source,name) for name in ORIGINALS}
    assert original==ORIGINALS
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path=Path(tmp)/'stack_split_functions.c'
    def apply():
        result=subprocess.run([sys.argv[1],'--sp-file',str(PATCH),str(path),
            '--all-includes','--include-headers-for-types','-I',str(ROOT),'-I',str(ROOT/'src'),
            '--in-place'],capture_output=True,text=True)
        assert result.returncode==0,result.stdout+result.stderr
    path.write_text('#include "src/headers/uw.h"\n'+'\n'.join(original.values())); apply()
    for name in original: assert extract(path.read_text(),name)==actual[name],name
    before=path.read_text(); apply(); assert path.read_text()==before
    for change in changes():
        if '\n' not in change['before']: continue
        name=change['function']; first=change['before'].splitlines()[0]
        line=next(line for line in original[name].splitlines() if first in line)
        protected=original[name].replace(line,line+'\n    observe();',1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(),name)==protected,change['key']
    for name,old,new in [(EXTRACT,'ushort uVar7;','volatile ushort uVar7;'),
                         (EXTRACT,'uVar6 * 0x3ff','uVar6 * 0x3fe'),
                         (EXTRACT,'uVar6 = (uint)flag;','escape(&uVar7); uVar6 = (uint)flag;'),
                         (REDUCE,'ushort uVar2;','volatile ushort uVar2;'),
                         (REDUCE,'(amount & 0xffff)','(amount & 0x3ff)'),
                         (REDUCE,'object_list_insert_head(puVar5 + 4,puVar6);','observe(uVar9); object_list_insert_head(puVar5 + 4,puVar6);')]:
        assert old in original[name]
        protected=original[name].replace(old,new,1)
        path.write_text('#include "src/headers/uw.h"\n'+protected); apply()
        assert extract(path.read_text(),name)==protected,(name,old)
    for name in original:
        excluded=original[name].replace(name,'excluded',1)
        path.write_text('#include "src/headers/uw.h"\n'+excluded); apply()
        assert extract(path.read_text(),'excluded')==excluded
    path.write_text('\n'.join(actual.values())+'\n'+'\n'.join(body.replace(name+'(','reference_'+name+'(',1) for name,body in original.items()))
    exe=Path(tmp)/'stack_split'
    result=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign',*flags,
        '-I',str(ROOT),'-I',tmp,str(ROOT/'tests/tools/stack_split_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert result.returncode==0,result.stdout+result.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Exact stack-split conversion, idempotence and callback/capture/scope guards pass')
