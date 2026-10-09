"""Verify trap clone/property conversion and real before/after helper behavior."""
from pathlib import Path
import re
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_trap_consumer_rules import generate, changes, REMOVE_ORIGINAL
from extract_functions import extract
PATCH=ROOT/'tools/coccinelle/trap-consumer-fields.cocci'
assert PATCH.read_text()==generate()
def tokens(text):
    return r'\s*'.join(re.escape(token) for token in re.findall(r'\w+|[^\w\s]',text))

NAMES=['dispatch_trap_type_effect','remove_trap_chain_marker','apply_quest_event_numeric_effect']
actual={name:extract((ROOT/'src/traps.c').read_text(),name) for name in NAMES}
original=dict(actual)
for change in reversed(changes()):
    name=change['function']
    if name=='remove_trap_chain_marker': continue
    before,after=change['before'],change['after']
    if '\n' in before:
        pattern=re.compile(r'(?m)^([ \t]*)'+tokens(after))
        original[name],count=pattern.subn(lambda m:m[1]+before.replace('\n','\n'+m[1]),original[name])
        assert count==1, change['key']
    else: original[name]=original[name].replace(after,before)
original['remove_trap_chain_marker']=REMOVE_ORIGINAL
if '--reference' in sys.argv:
    source=Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
    original={name:extract(source,name) for name in NAMES}
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path=Path(tmp)/'trap_consumer_functions.c'
    def apply():
        r=subprocess.run([sys.argv[1],'--sp-file',str(PATCH),str(path),'--all-includes',
            '--include-headers-for-types','-I',str(ROOT),'-I',str(ROOT/'src'),'--in-place'],capture_output=True,text=True)
        assert r.returncode==0,r.stdout+r.stderr
    path.write_text('#include "src/headers/uw.h"\n'+'\n'.join(original.values()))
    apply()
    for name in NAMES: assert extract(path.read_text(),name)==actual[name], name
    before=path.read_text();apply();assert path.read_text()==before
    # Whole-marker proof rejects changes to captures, callback ordering or locals.
    for old,new in [('ushort uVar2;','volatile ushort uVar2;'),
                    ('return;', 'observe(); return;'),
                    ('uVar1 = (uVar2 & 0x1e00) >> 9;',
                     'uVar1 = (uVar2 & 0x1e00) >> 9; observe();'),
                    ('free_object_slot(trap_object);','escape(&uVar2); free_object_slot(trap_object);')]:
        protected=REMOVE_ORIGINAL.replace(old,new,1)
        if protected==REMOVE_ORIGINAL: continue
        path.write_text('#include "src/headers/uw.h"\n'+protected);apply()
        assert extract(path.read_text(),'remove_trap_chain_marker')==protected
    # Source/destination copies and z writes cannot fold across callbacks.
    for change in changes():
        if '\n' not in change['before'] or change['function']=='remove_trap_chain_marker': continue
        name=change['function'];first=change['before'].splitlines()[0]
        protected=original[name].replace(first,first+'\n    observe();',1)
        path.write_text('#include "src/headers/uw.h"\n'+protected);apply()
        deleted=next(line for line in change['before'].splitlines() if line not in change['after'].splitlines())
        assert re.search(tokens(deleted),path.read_text()),change['key']
        assert 'observe();' in path.read_text()
    for name in NAMES:
        excluded=original[name].replace(name+'(', 'excluded(',1)
        path.write_text('#include "src/headers/uw.h"\n'+excluded);apply()
        assert extract(path.read_text(),'excluded')==excluded
    path.write_text('\n'.join(actual.values())+'\n'+'\n'.join(
        original[name].replace(name+'(', 'reference_'+name+'(') for name in NAMES))
    exe=Path(tmp)/'traps'
    r=subprocess.run(['cc','-std=c11','-O2','-Wno-pointer-sign','-Wno-address-of-packed-member',
        *flags,'-I',str(ROOT),'-I',tmp,str(ROOT/'tests/tools/trap_consumer_fixture.c'),'-o',str(exe)],capture_output=True,text=True)
    assert r.returncode==0,r.stdout+r.stderr
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Exact trap consumer conversion, idempotence and callback/scope/capture guards pass')
