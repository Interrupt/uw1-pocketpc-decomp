"""Verify NPC goal recipes, actual helper output and live scalar snapshots."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_npc_goal_rules import generate, FRAME_SITES, TARGET_SITES
from extract_functions import extract
PATCH = ROOT/'tools/coccinelle/npc-goal-fields.cocci'
assert PATCH.read_text() == generate()
flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
actual = (ROOT/'src/ai.c').read_text()
names = list(dict.fromkeys(TARGET_SITES + [fn for fn,_ in FRAME_SITES] + ['npc_idle_behavior_tick']))
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'goal_functions.c'
    functions = '\n'.join(extract(actual, fn) for fn in ['npc_react_to_nearby_player','npc_clear_special_goal'])
    reference = None
    if '--reference' in sys.argv:
        reference = Path(sys.argv[sys.argv.index('--reference') + 1]).read_text()
        functions += '\n#define REFERENCE_AVAILABLE\n' + '\n'.join(extract(reference, fn).replace(fn+'(', 'reference_'+fn+'(', 1) for fn in ['npc_react_to_nearby_player','npc_clear_special_goal'])
    path.write_text(functions)
    executable = Path(tmp)/'goals'
    subprocess.run(['cc', '-std=c11', '-O2', *flags, '-I', str(ROOT), '-I', tmp,
                    str(ROOT/'tests/tools/npc_goal_fixture.c'), '-o', str(executable)], check=True)
    print(subprocess.check_output([str(executable)], text=True).strip(), flush=True)
    def apply():
        r = subprocess.run([sys.argv[1], '--sp-file', str(PATCH), str(path), '--all-includes',
                            '--include-headers-for-types', '-I', str(ROOT), '-I', str(ROOT/'src'), '--in-place'], capture_output=True, text=True)
        assert r.returncode == 0, r.stdout + r.stderr
    if reference:
        path.write_text(reference); apply()
        for fn in names:
            assert extract(path.read_text(), fn) == extract(actual, fn), fn
    path.write_text(actual); apply()
    assert path.read_text() == actual, 'current ai.c is not idempotent'
    # Exact scalar snapshots are observed after each frame rewrite. These
    # reduced fixtures use the same function names/alias contracts as the game.
    bodies = []
    for fn, alias in FRAME_SITES:
        low = f'((uw_mobile_object_t *){alias})->' if alias else 'DAT_0010190c->'
        capture = f'char *{alias} = (char *)DAT_0010190c;' if alias else ''
        bodies.append(f'''uint {fn}(void) {{
{capture}
ushort S; uint V; int N;
S = DAT_0010190c->goal_word;
N = ((int)((S >> 0xc) + 1)) % (4);
V = S & 0xfff;
{low}goal_word_low = (byte)(char)V;
DAT_0010190c->goal_word_high = (byte)(V >> 8) | (byte)(((N & 0xf) << 0xc) >> 8);
return S + V * 65536u + N;
}}''')
    raw = '\n'.join('#define '+fn+' declared_'+fn for fn,_ in FRAME_SITES) + '\n#include "src/headers/uw.h"\n' + '\n'.join('#undef '+fn for fn,_ in FRAME_SITES) + '''
#include <assert.h>
uw_mobile_object_t *DAT_0010190c;
''' + '\n'.join(bodies) + '''
void excluded(uw_mobile_object_t *p) { p->goal_word_low = 5; }
int main(void) {
  uw_mobile_object_t object; DAT_0010190c = &object;
  uint64_t hash = 1;
  for (unsigned seed = 0; seed < 65536; ++seed) {
''' + '\n'.join(f'''    memset(&object, 0xa5, sizeof object); object.goal_word = seed;
    hash = hash * 31 + {fn}();
    assert(object.goal_word == ((seed & 4095) | ((((seed >> 12) + 1) % 4) << 12)));
    for (unsigned j=0;j<sizeof object;++j) hash = hash * 31 + ((byte *)&object)[j];''' for fn,_ in FRAME_SITES) + '''
  }
  printf("%llu\\n", (unsigned long long)hash);
}
'''
    path.write_text(raw)
    def run():
        subprocess.run(['cc', '-std=c11', '-O2', *flags, '-I', str(ROOT), str(path), '-o', str(executable)], check=True)
        return subprocess.check_output([str(executable)], text=True)
    before = run(); apply(); converted = path.read_text()
    assert converted != raw
    assert run() == before
    for fn,_ in FRAME_SITES:
        assert '->npc_animation_frame =' in extract(converted, fn)
    assert extract(converted,'excluded') == extract(raw,'excluded')
    apply(); assert path.read_text() == converted
print('262,144 frame conversions retain live snapshots, packed bytes, scope and idempotence')
