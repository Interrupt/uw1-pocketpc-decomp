"""Execute scoped death-field conversions against the real mobile layout."""
from pathlib import Path
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / 'tests/tools'))
from extract_functions import extract

with tempfile.TemporaryDirectory() as tmp:
    path = Path(tmp) / 'death.c'
    path.write_text('''#include "src/headers/uw.h"
#include <assert.h>
unsigned input_value;
int initiate_npc_death(char *npc)
{
    uint packed;
    char *identity = &*(char *)(npc + 0x1a);
    int who = *(char *)(npc + 0x1a);
    *(byte *)(npc + 0x15) = *(byte *)(npc + 0x15) & 0xcc | 0xc;
    packed = ((uw_mobile_object_t *)npc)->goal_word & 0xfff;
    *(char *)(npc + 0xb) = (char)packed;
    *(char *)(npc + 0xc) = (char)(packed >> 8);
    *(byte *)(npc + 0x14) = *(byte *)(npc + 0x14) & 0xfc | 4;
    *(undefined1 *)(npc + 8) = input_value;
    return packed + who + (identity == npc + 0x1a);
}
int handle_monster_death(void *npc_ptr)
{
    char *npc = (char *)npc_ptr;
    return *(byte *)(npc + 0x15) & 0x3f;
}
void unrelated(char *npc)
{
    *(char *)(npc + 0xb) = 1;
    *(byte *)(npc + 8) = 2;
}
void projectile_death(char *npc)
{
    *(char *)(npc + 0xb) = 3;
    *(byte *)(npc + 0x15) = 4;
}
int main(void)
{
    uint64_t hash = 0;
    for (unsigned input = 0; input < 65536; ++input) {
        uw_mobile_object_t obj, before;
        memset(&obj, 0xa5, sizeof(obj));
        obj.goal_word = input;
        obj.animation_flags = input;
        obj.attack_pitch = input >> 8;
        obj.npc_whoami = input;
        memcpy(&before, &obj, sizeof(obj));
        input_value = input;
        unsigned result = initiate_npc_death((char *)&obj);
        assert(obj.goal_word == (input & 0xfff));
        assert(obj.animation_flags == ((before.animation_flags & 0xcc) | 0xc));
        assert(obj.attack_pitch == ((before.attack_pitch & 0xfc) | 4));
        assert(obj.npc_hp == (byte)input);
        for (unsigned j = 0; j < sizeof(obj); ++j)
            if (j != 8 && j != 11 && j != 12 && j != 20 && j != 21)
                assert(((byte *)&obj)[j] == ((byte *)&before)[j]);
        hash = hash * 31 + result + handle_monster_death(&obj);
        for (unsigned j = 0; j < sizeof(obj); ++j)
            hash = hash * 31 + ((byte *)&obj)[j];
    }
    printf("%llu\\n", (unsigned long long)hash);
}
''')

    def execute():
        program = Path(tmp) / 'death'
        result = subprocess.run(['cc', '-std=c11', '-O2', '-I', str(ROOT),
                                 str(path), '-o', str(program)],
                                capture_output=True, text=True)
        assert result.returncode == 0, result.stdout + result.stderr
        return subprocess.check_output([str(program)], text=True)

    def transform():
        for patch in ['npc-death-fields.cocci', 'named-field-writes.cocci']:
            result = subprocess.run([sys.argv[1], '--sp-file',
                                     str(ROOT / 'tools/coccinelle' / patch),
                                     str(path), '--no-includes', '--in-place'],
                                    capture_output=True, text=True)
            assert result.returncode == 0, result.stdout + result.stderr

    original = execute()
    exclusions = {name: extract(path.read_text(), name)
                  for name in ['unrelated', 'projectile_death']}
    transform()
    converted = path.read_text()
    body = extract(converted, 'initiate_npc_death')
    for field in ['npc_hp', 'animation_flags', 'attack_pitch', 'npc_whoami',
                  'npc_animation_frame']:
        assert '->' + field in body, (field, body)
    assert '(char *)&' in body, body
    assert 'npc + 0xb' not in body and 'npc + 0xc' not in body, body
    for name, before in exclusions.items():
        assert extract(converted, name) == before, name
    assert execute() == original, 'death conversion changed bytes or signed values'
    transform()
    assert path.read_text() == converted, 'death conversion is not idempotent'
    print('NPC death fields: 65,536 packed words, flags, signed reads and addresses passed')
