"""Exercise real NPC consumers against bytes, callbacks and optional original code."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT/'tools/coccinelle'))
from generate_npc_interaction_rules import SITES, accesses, updates, convert, cleanup_conversation_snapshots
from extract_functions import extract

HERE = ROOT/'tools/coccinelle/npc-interactions'
dead = 'void f() {\n  undefined2 uVar1;\n  uVar1 = iVar2->status_word;\n}\n'
assert 'uVar1' not in cleanup_conversation_snapshots(dead)
for extra in ['  observe(uVar1);\n', '  escape(&uVar1);\n']:
    live = dead.replace('}\n', extra+'}\n')
    assert cleanup_conversation_snapshots(live) == live
volatile = dead.replace('undefined2 uVar1', 'volatile undefined2 uVar1')
assert cleanup_conversation_snapshots(volatile) == volatile
actual = {}
for function, filename in SITES.items():
    assert (HERE/(function+'.accesses.cocci')).read_text() == accesses(function)
    assert (HERE/(function+'.updates.cocci')).read_text() == updates(function)
    actual[function] = extract((ROOT/'src'/filename).read_text(), function)
    assert 'npc_attitude' in actual[function]
with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp)/'interaction_functions.c'
    source = '\n\n'.join(actual.values())
    reference = {}
    if '--reference-dir' in sys.argv:
        directory = Path(sys.argv[sys.argv.index('--reference-dir')+1])
        source += '\n#define REFERENCE_AVAILABLE\n'
        for function, filename in SITES.items():
            reference[function] = extract((directory/filename).read_text(), function)
            source += reference[function].replace(function+'(', 'reference_'+function+'(', 1)+'\n'
    path.write_text(source)
    flags = ['-fsanitize=address', '-fno-omit-frame-pointer'] if '--asan' in sys.argv else []
    executable = Path(tmp)/'interactions'
    result = subprocess.run(['cc', '-std=c11', '-O2', *flags, '-Wno-incompatible-pointer-types',
                             '-I', str(ROOT), '-I', tmp, str(ROOT/'tests/tools/npc_interaction_fixture.c'),
                             '-o', str(executable)], capture_output=True, text=True)
    assert result.returncode == 0, result.stdout+result.stderr
    print(subprocess.check_output([str(executable)], text=True).strip(), flush=True)
    for function in SITES:
        original = '#include "src/headers/uw.h"\n'+reference.get(function, actual[function])+'\n'
        converted = convert(function, original, sys.argv[1])
        assert extract(converted, function) == actual[function], function
        assert convert(function, converted, sys.argv[1]) == converted, function
    print('NPC interaction recipes: actual source coverage and idempotence passed')
