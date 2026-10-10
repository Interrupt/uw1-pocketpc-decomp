"""Name verified NPC fields in summon, noise and conversation consumers.

Summoned-record extensions occur only in the variant-4 NPC branch. Caster
extensions are shared mobile coordinates/heading. NPC snapshots and local
receivers survive calls that select a different current object.
"""
import argparse
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import subprocess
import sys
import tempfile
import re
from generate_header_field_rules import regex
from generate_word_access_rules import generate as words
from generate_current_alias_rules import rule
from generate_shared_mobile_rules import access_rules, bit_rules, coordinate_rules
from generate_named_field_read_rules import generate as reads
from struct_field_catalog import WORDS

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT / 'tests/tools'))
from extract_functions import extract
SITES = {'cast_summon_or_spawn_effect': 'object_actions.c',
         'alert_npc_to_noise_callback': 'ai.c',
         'trigger_scripted_npc_conversation': 'traps.c',
         'babl_builtin_set_race_attitude': 'babl.c'}


def storage(function, pointer, typ, fields):
    return words(pointer, fields, regex([function]), raw_type=typ).replace(
        'uw_object_hdr_t', 'uw_mobile_object_t').replace('@w_', '@'+pointer+'_w_')


def accesses(function):
    parts = []
    if function == 'cast_summon_or_spawn_effect':
        parts += [access_rules([(function, 'caster', 'void *', 'shared')]),
                  storage(function, 'pObj', 'char *', {13: 'status_word', 15: 'target_word', 22: 'tile_position'}),
                  rule(function, 'pObj', 'ai_flags', ['*(byte *)(pObj + 0x19)'],
                       '((uw_mobile_object_t *)pObj)->npc_ai_flags'),
                  bit_rules([(function, 'caster', 'void *', 'shared')]),
                  coordinate_rules([(function, 'caster', 'void *', 'shared')])]
    elif function == 'trigger_scripted_npc_conversation':
        parts += [storage(function, 'iVar2', 'char *', {11: 'goal_word', 13: 'status_word'}),
                  rule(function, 'iVar2', 'identity', ['*(undefined1 *)(iVar2 + 0x1a)'],
                       '((uw_mobile_object_t *)iVar2)->npc_whoami')]
    else:
        pointer = 'npc' if function == 'alert_npc_to_noise_callback' else 'puVar7'
        parts += [storage(function, pointer, 'ushort *', {13: 'status_word'}),
                  rule(function, pointer, 'movement', [f'({pointer}[5] & 0x80)'],
                       f'(((uw_mobile_object_t *){pointer})->movement_flags & 0x80)')]
        if function == 'babl_builtin_set_race_attitude':
            parts += [storage(function, 'DAT_00100674', 'ushort *', {22: 'tile_position'})]
    parts.append(reads({name: WORDS[name] for name in ['status_word', 'tile_position']}, {}))
    return '\n'.join(parts)


def updates(function):
    parts = []
    def change(key, before, after, meta=''):
        parts.append(f'''@update_{key} disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "{regex([function])}";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;
{meta}
@@
R F(...) {{
<...
''' + '\n'.join('- '+line for line in before.splitlines()) + '\n' +
                     '\n'.join('+ '+line for line in after.splitlines()) + '\n...>\n}\n')
    if function == 'cast_summon_or_spawn_effect':
        hdr = '((uw_object_hdr_t *)pObj)->'
        npc = '((uw_mobile_object_t *)pObj)->'
        change('xpos', f'{hdr}position_word_low = (byte)(char)uVar6;\n{hdr}position_word_high = (byte)(uVar6 >> 8) | bVar1;',
               f'{hdr}xpos = local_34 & 7;')
        change('ypos', f'{hdr}position_word_low = (byte)(char)uVar6;\n{hdr}position_word_high = (byte)(uVar6 >> 8) | bVar1 | (byte)(((local_32 & 7) << 10) >> 8);',
               f'{hdr}ypos = local_32 & 7;')
        change('tile', f'{npc}tile_position_low = {npc}tile_position_low & 0xf | (byte)(uVar6 << 4);\n{npc}tile_position_high = (byte)(char)(uVar6 >> 4);',
               f'{npc}tile_y = local_2e & 0x3f;\n{npc}tile_x = local_2c & 0x3f;')
        change('attitude', f'uVar10 = {npc}status_word & 0x3fff;\n{npc}status_word = (ushort)uVar10;',
               f'uVar10 = {npc}status_word & 0x3fff;\n{npc}npc_attitude = 0;')
        change('target_x', f'{npc}target_word_low = (byte)uVar10 | bVar1;\n{npc}target_word_high = (byte)(char)(uVar10 >> 8);',
               f'{npc}npc_target_tile_x = bVar1;')
        change('target_y', f'uVar10 = uVar2 & 0xf000 | (uint)bVar1 | (g_player_object->npc_yhome << 4) << 2;\n{npc}target_word = (ushort)uVar10;',
               f'uVar10 = uVar2 & 0xf000 | (uint)bVar1 | (g_player_object->npc_yhome << 4) << 2;\n{npc}npc_target_tile_y = g_player_object->npc_yhome;')
        change('quality', f'{hdr}chain_word_low = (byte)uVar7 | 0x3f;\n{hdr}chain_word_high = (byte)(char)((ushort)uVar7 >> 8);',
               f'{hdr}quality = 0x3f;')
        change('zpos', f'{hdr}position_word_low = (bVar1 ^ (byte)local_30) & 0x7f ^ bVar1;\n{hdr}position_word_high = (byte)(char)((ushort)uVar7 >> 8);',
               f'{hdr}zpos = (byte)local_30 & 0x7f;')
    elif function == 'trigger_scripted_npc_conversation':
        npc = '((uw_mobile_object_t *)iVar2)->'
        change('attitude', f'{npc}status_word_low = (byte)(char)uVar1;\n{npc}status_word_high = (byte)((ushort)uVar1 >> 8) | 0xc0;',
               f'{npc}npc_attitude = 3;')
        change('goal', f'{npc}goal_word_low = (byte)uVar3 | 10;\n{npc}goal_word_high = (byte)(char)(uVar3 >> 8);',
               f'{npc}npc_goal = 10;')
    else:
        pointer, saved, value = ('npc', 'uVar6', 'uVar8') if function == 'alert_npc_to_noise_callback' else ('puVar7', 'uVar11', 'uVar2')
        npc = f'((uw_mobile_object_t *){pointer})->'
        change('attitude', f'{npc}status_word_low = (byte)(char){saved};\n{npc}status_word_high = (byte)({saved} >> 8) | (byte)((({value} & 3) << 0xe) >> 8);',
               f'{npc}npc_attitude = {value} & 3;')
    if function == 'cast_summon_or_spawn_effect':
        change('local_type', 'char *pObj;', 'uw_object_hdr_t *pObj;')
        change('spawn_type', r"pObj = (char *)spawn_new_object(uVar10,variant == '\x04');",
               r"pObj = spawn_new_object(uVar10,variant == '\x04');")
        change('header_fields', '((uw_object_hdr_t *)pObj)->M', 'pObj->M', 'identifier M;')
    elif function == 'trigger_scripted_npc_conversation':
        change('local_type', 'char *iVar2;', 'uw_mobile_object_t *iVar2;')
        change('spawn_type', 'iVar2 = (char *)spawn_new_object(0x40,1);',
               'iVar2 = (uw_mobile_object_t *)spawn_new_object(0x40,1);')
        change('npc_fields', '((uw_mobile_object_t *)iVar2)->M', 'iVar2->M', 'identifier M;')
        change('free_header', 'free_object_slot(iVar2);', 'free_object_slot(&iVar2->hdr);')
    elif function == 'babl_builtin_set_race_attitude':
        change('chain_address', 'resolve_object_link(puVar7 + 2)',
               'resolve_object_link(&((uw_mobile_object_t *)puVar7)->hdr.chain_word)')
        change('local_type', 'ushort *puVar7;', 'uw_mobile_object_t *puVar7;')
        change('resolve_type', 'puVar7 = (ushort *)resolve_object_link(E);',
               'puVar7 = (uw_mobile_object_t *)resolve_object_link(E);', 'expression E;')
        change('null_type', 'puVar7 != (ushort *)0x0', 'puVar7 != NULL')
        change('npc_fields', '((uw_mobile_object_t *)puVar7)->M', 'puVar7->M', 'identifier M;')
        change('header_fields', '((uw_object_hdr_t *)puVar7)->M', 'puVar7->hdr.M', 'identifier M;')
        change('speaker_header', '*DAT_00100674', '((uw_object_hdr_t *)DAT_00100674)->type_flags')
    return '\n'.join(parts)


def cleanup_conversation_snapshots(body):
    """Remove only these pure reads when no use or escaped address remains."""
    for name, field in [('uVar1', 'status_word'), ('uVar3', 'goal_word & 0xfffa')]:
        declaration = re.compile(r'^  (?:undefined2|ushort|uint) '+name+r';\n', re.M)
        assignment = re.compile(r'^  '+name+r' = iVar2->'+re.escape(field)+r';\n', re.M)
        if len(declaration.findall(body)) != 1 or len(assignment.findall(body)) != 1: continue
        candidate = assignment.sub('', declaration.sub('', body))
        code = re.sub(r'/\*[\s\S]*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"', '', candidate)
        if not re.search(r'\b'+name+r'\b', code): body = candidate
    return body


def convert(function, source, spatch='spatch'):
    before = extract(source, function)
    with tempfile.TemporaryDirectory() as tmp:
        work = Path(tmp) / 'interaction.c'
        work.write_text('#include "src/headers/uw.h"\n' + before + '\n')
        for index, patch in enumerate([accesses(function), (HERE/'packed-stores.cocci').read_text(), updates(function)]):
            path = Path(tmp) / 'phase.cocci'; path.write_text(patch)
            result = subprocess.run([spatch, '--sp-file', str(path), str(work), '--all-includes',
                                     '--include-headers-for-types', '-I', str(ROOT), '-I', str(ROOT/'src'), '--in-place'],
                                    capture_output=True, text=True)
            if result.returncode: raise RuntimeError(result.stdout + result.stderr)
            print(f'{function}: phase {index} finished', flush=True)
        after = extract(work.read_text(), function)
        if function == 'trigger_scripted_npc_conversation':
            after = cleanup_conversation_snapshots(after)
    return source.replace(before, after, 1)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    group = parser.add_mutually_exclusive_group()
    group.add_argument('--in-place', action='store_true')
    group.add_argument('--check', action='store_true')
    args = parser.parse_args()
    out = HERE / 'npc-interactions'; out.mkdir(exist_ok=True)
    for function in SITES:
        (out / (function+'.accesses.cocci')).write_text(accesses(function))
        (out / (function+'.updates.cocci')).write_text(updates(function))
    if not (args.in_place or args.check): return
    by_file = {}
    for function, filename in SITES.items(): by_file.setdefault(filename, []).append(function)
    def apply(item):
        filename, functions = item
        path = ROOT / 'src' / filename
        before = path.read_text(); after = before
        for function in functions: after = convert(function, after)
        if args.in_place: path.write_text(after)
        changed = before != after
        print(filename + ': ' + ('converted' if changed and args.in_place else 'changes pending' if changed else 'unchanged'), flush=True)
        return args.check and changed
    with ThreadPoolExecutor(max_workers=4) as pool:
        results = list(pool.map(apply, by_file.items()))
    if any(results): raise SystemExit(1)


if __name__ == '__main__': main()
