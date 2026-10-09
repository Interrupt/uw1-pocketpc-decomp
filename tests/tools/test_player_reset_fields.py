"""Verify exact reset folding, full record bytes and guarded conversion scope."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_player_reset_rules import generate, ORIGINAL
from extract_functions import extract
PATCH=ROOT/'tools/coccinelle/player-reset-fields.cocci'
assert PATCH.read_text()==generate()
actual=extract((ROOT/'src/game.c').read_text(),'reset_player_object_record')
original='void reset_player_object_record()\n\n{\n  '+ORIGINAL+'\n}'
memory=extract((ROOT/'src/ordinal_stubs.c').read_text(),'ce_memset').replace('ce_memset(', 'memory_ce_memset(',1)
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
with tempfile.TemporaryDirectory() as tmp:
    path=Path(tmp)/'reset.c'
    def apply():
        r=subprocess.run([sys.argv[1],'--sp-file',str(PATCH),str(path),'--all-includes','--include-headers-for-types','-I',str(ROOT),'-I',str(ROOT/'src'),'--in-place'],capture_output=True,text=True)
        assert r.returncode==0,r.stdout+r.stderr
    path.write_text('#include "src/headers/uw.h"\n'+original)
    apply(); assert extract(path.read_text(),'reset_player_object_record')==actual
    before=path.read_text(); apply(); assert path.read_text()==before
    # No partial match may discard an escaped value, an intervening callback,
    # volatile scalar storage, or assumptions about the complete zero clear.
    for old,new in [('return;', 'observe(uVar1); return;'),
                    ('return;', 'escape(&uVar1); return;'),
                    ('ushort uVar1;', 'volatile ushort uVar1;'),
                    ('ce_memset(g_player_object,0,0x1b);','ce_memset(g_player_object,0,0x1b); callback();'),
                    ('ce_memset(g_player_object,0,0x1b);','ce_memset(g_player_object,0,8);'),
                    ('ce_memset(g_player_object,0,0x1b);','')]:
        protected='#include "src/headers/uw.h"\n'+original.replace(old,new)
        path.write_text(protected); apply(); assert path.read_text()==protected,(old,new)
    excluded=original.replace('reset_player_object_record()', 'excluded()')
    path.write_text('#include "src/headers/uw.h"\n'+excluded); apply()
    assert extract(path.read_text(),'excluded')==excluded
    if '--reference' in sys.argv:
        reference=Path(sys.argv[sys.argv.index('--reference')+1]).read_text()
        path.write_text(reference); apply()
        assert extract(path.read_text(),'reset_player_object_record')==actual
    path.write_text('#include "src/headers/uw.h"\n'+actual); apply()
    assert extract(path.read_text(),'reset_player_object_record')==actual
    harness='''#include "src/headers/uw.h"
#include <assert.h>
static _Alignas(4) byte storage[160];
uw_mobile_object_t *g_player_object;
static unsigned clears;
static uint64_t events;
''' + memory + '''
void *ce_memset(void *pointer,int value,unsigned int size) {
    assert(pointer==g_player_object && value==0 && size==27);
    ++clears;
    for(unsigned j=0;j<sizeof storage;++j) events=events*31+storage[j];
    return memory_ce_memset(pointer,value,size);
}
''' + actual + '\n' + original.replace('reset_player_object_record()', 'reference_reset_player_object_record()',1) + '''
static uint64_t run(void (*function)(void)) {
    uint64_t hash=1;
    for(unsigned seed=0;seed<65536;++seed) {
      for(unsigned slot=0;slot<4;++slot) {
        for(unsigned j=0;j<sizeof storage;++j) storage[j]=(seed>>(j&7))+j*31;
        byte expected[160]; memcpy(expected,storage,sizeof storage);
        unsigned offset=8+slot*32;
        memset(expected+offset,0,27); expected[offset]=127; expected[offset+13]=253;
        g_player_object=(uw_mobile_object_t *)(storage+offset);
        events=clears=0;
        function();
        assert(clears==1 && !memcmp(storage,expected,sizeof storage));
        assert((byte *)g_player_object==storage+offset);
        hash=hash*31+events;
        for(unsigned j=0;j<sizeof storage;++j) hash=hash*31+storage[j];
      }
    }
    return hash;
}
int main(void) {
    assert(sizeof(uw_mobile_object_t)==27);
    assert(run(reset_player_object_record)==run(reference_reset_player_object_record));
    puts("262,144 reset cases preserve all record/guard bytes and the memory-clear call");
}
'''
    path.write_text(harness)
    exe=Path(tmp)/'reset'
    subprocess.run(['cc','-std=c11','-O2',*flags,'-I',str(ROOT),str(path),'-o',str(exe)],check=True)
    print(subprocess.check_output([str(exe)],text=True).strip())
print('Exact reset conversion, idempotence, live/escape/callback/volatile guards pass')
