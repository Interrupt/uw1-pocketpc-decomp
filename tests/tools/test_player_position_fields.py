"""Verify player field conversions against real movement and live-value fixtures."""
from pathlib import Path
import subprocess
import sys
import tempfile
ROOT=Path(__file__).resolve().parents[2]
sys.path.insert(0,str(ROOT/'tools/coccinelle'))
from generate_player_position_rules import generate, SITES
from extract_functions import extract
PATCH=ROOT/'tools/coccinelle/player-position-fields.cocci'
assert PATCH.read_text()==generate()
flags=['-fsanitize=address','-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
ref=Path(sys.argv[sys.argv.index('--reference-dir')+1]) if '--reference-dir' in sys.argv else None
with tempfile.TemporaryDirectory() as tmp:
    path=Path(tmp)/'position_functions.c'
    code=extract((ROOT/'src/player.c').read_text(),'commit_player_move')
    if ref: code+='\n#define REFERENCE_AVAILABLE\n'+extract((ref/'player.c').read_text(),'commit_player_move').replace('commit_player_move(', 'reference_commit_player_move(',1)
    path.write_text(code)
    exe=Path(tmp)/'positions'
    subprocess.run(['cc','-std=c11','-O2',*flags,'-Wno-incompatible-pointer-types','-I',str(ROOT),'-I',tmp,str(ROOT/'tests/tools/player_position_fixture.c'),'-o',str(exe)],check=True)
    print(subprocess.check_output([str(exe)],text=True).strip(),flush=True)
    def apply():
        r=subprocess.run([sys.argv[1],'--sp-file',str(PATCH),str(path),'--all-includes','--include-headers-for-types','-I',str(ROOT),'-I',str(ROOT/'src'),'--in-place'],capture_output=True,text=True)
        assert r.returncode==0,r.stdout+r.stderr
    for filename in set(SITES.values()):
        actual=(ROOT/'src'/filename).read_text()
        if ref:
            path.write_text((ref/filename).read_text()); apply()
            for fn,file in SITES.items():
                if file==filename: assert extract(path.read_text(),fn)==extract(actual,fn),fn
        path.write_text(actual); apply(); assert path.read_text()==actual,filename
    # The complete original teleport update sequence checks unusual partial
    # masks and observes masked snapshots, including the old chain's next.
    raw='''#include "src/headers/uw.h"
#include <assert.h>
uw_mobile_object_t *g_player_object;
_Alignas(4) undefined1 DAT_00204880_backing[128];
uint observed;
void set_player_tile_position(uint tile_x,uint tile_y,int flag) {
uint uVar3;
uVar3 = g_player_object->hdr.position_word & 0xff80;
g_player_object->hdr.position_word_low = (byte)uVar3 | (byte)((int)(((int)DAT_00204884 & 0x3f8U) << 0x10) >> 0x13);
g_player_object->hdr.position_word_high = (byte)(char)(uVar3 >> 8);
uVar3 = g_player_object->tile_word & 0x3ff;
g_player_object->tile_word_low = (byte)(char)uVar3;
g_player_object->tile_word_high = (byte)(uVar3 >> 8) | (byte)(((tile_x & 0x3f) << 10) >> 8);
g_player_object->npc_yhome = tile_y & 0x3f;
uVar3 = g_player_object->tile_word;
uVar3 = g_player_object->hdr.position_word & 0x1fff;
g_player_object->hdr.position_word_low = (byte)(char)uVar3;
g_player_object->hdr.position_word_high = (byte)(uVar3 >> 8) | 0x60;
uVar3 = g_player_object->hdr.position_word & 0xefff;
g_player_object->hdr.position_word_low = (byte)(char)uVar3;
g_player_object->hdr.position_word_high = (byte)(uVar3 >> 8) | 0xc;
uVar3 = g_player_object->hdr.next << 6;
g_player_object->hdr.chain_word = (ushort)uVar3;
g_player_object->hdr.chain_word_low = g_player_object->hdr.quality;
g_player_object->hdr.chain_word_high = 0;
observed = uVar3;
}
void excluded(uw_mobile_object_t *p) { p->hdr.position_word_low=5; }
int main(void) {
uw_mobile_object_t obj; g_player_object=&obj;
uint64_t hash=1;
for(unsigned word=0;word<65536;++word) {
 for(unsigned mode=0;mode<8;++mode) {
  memset(&obj,0xa5,sizeof obj); obj.hdr.position_word=word; obj.hdr.chain_word=word;
  obj.tile_word=word; DAT_00204884=(short)(word^mode*0x5555);
  set_player_tile_position(word+mode,word*17+mode,0);
  uint value=observed;
  assert(value==(word&0xffc0));
  assert(obj.hdr.position_word==((word&0x380)|0x6c00|(((ushort)DAT_00204884>>3)&127)));
  assert(obj.tile_word==((word&15)|(((word+mode)&63)<<10)|(((word*17+mode)&63)<<4)));
  assert(obj.hdr.chain_word==0);
  hash=hash*31+value;
  for(unsigned j=0;j<sizeof obj;++j) hash=hash*31+((byte *)&obj)[j];
 }
}
printf("%llu\\n",(unsigned long long)hash);
}
'''
    path.write_text(raw)
    def run():
        subprocess.run(['cc','-std=c11','-O2',*flags,'-I',str(ROOT),str(path),'-o',str(exe)],check=True)
        return subprocess.check_output([str(exe)],text=True)
    before=run(); apply(); converted=path.read_text()
    assert converted!=raw, 'teleport fixture did not match'
    assert run()==before, 'teleport snapshots changed'
    assert extract(converted,'excluded')==extract(raw,'excluded')
    for member in ['zpos','xpos','ypos','tile_x','tile_y']:
        assert '.'+member+' =' in converted or '->'+member+' =' in converted,member
    apply(); assert path.read_text()==converted
print('524,288 teleport field cases preserve snapshots, bytes, scope and idempotence')
