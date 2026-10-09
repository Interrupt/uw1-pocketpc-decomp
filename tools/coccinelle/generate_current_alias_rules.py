"""Name fields of saved current-NPC aliases proved by the Clang role audit.

Keep the saved pointer; replacing it with DAT_0010190c would change behavior
when a nested operation selects another object. No function or storage moves.
"""
import json
from pathlib import Path
from generate_header_field_rules import regex

HERE = Path(__file__).resolve().parent
HEADER = {0: 'hdr.type_flags', 2: 'hdr.position_word',
          4: 'hdr.chain_word', 6: 'hdr.link_word'}
NPC = {11: 'goal_word', 13: 'status_word', 15: 'target_word', 22: 'tile_word'}
SCALARS = {8: 'npc_hp', 9: 'full_heading', 10: 'movement_flags',
           17: 'recent_damage', 18: 'damage_source', 19: 'motion_flags',
           20: 'attack_pitch', 21: 'animation_flags', 24: 'heading_flags',
           25: 'npc_ai_flags', 26: 'npc_whoami'}
NPC_CONTEXTS = {'walk_using_cached_path', 'handle_blocked_cached_path',
                'setup_npc_ai_tick_state', 'set_npc_altitude_state',
                'refresh_npc_target_delta', 'check_npc_morale_flee',
                'initiate_npc_death', 'handle_monster_death',
                'compute_pathfind_search_radius'}


def generate(source):
    rules = []
    for function in source.get('functions', []):
        name = function['function']
        if not (name.startswith('npc_') or name in NPC_CONTEXTS):
            continue
        for role in function['roles']:
            if not role.get('current_mobile_alias'):
                continue
            pointer, typ = role['name'], role['type']
            byte_pointer = typ in ['char *', 'byte *', 'undefined1 *',
                                   'unsigned char *', 'void *']
            word_pointer = typ in ['ushort *', 'undefined2 *', 'short *', 'unsigned short *']
            base = f'((uw_mobile_object_t *){pointer})->'
            fields = dict(SCALARS)
            for off, field in (HEADER | NPC).items():
                for type_, suffix in [('ushort', ''), ('undefined2', ''), ('short', '_signed')]:
                    forms = [f'*({type_} *)((char *){pointer} + {off})']
                    if byte_pointer:
                        forms.append(f'*({type_} *)({pointer} + {off})')
                        if off == 0:
                            forms.append(f'*({type_} *){pointer}')
                    if word_pointer and off % 2 == 0 and (typ == 'short *') == (type_ == 'short'):
                        forms.append(f'{pointer}[{off//2}]')
                        if off == 0:
                            forms.append(f'*{pointer}')
                    rules.append(rule(name, pointer, f'word_{off}_{type_}', forms, base + field + suffix))
                fields[off] = field + '_low'
                fields[off + 1] = field + '_high'
            for off, field in sorted(fields.items()):
                for type_ in ['byte', 'undefined1', 'char']:
                    forms = [f'*({type_} *)((char *){pointer} + {off})']
                    if byte_pointer:
                        forms.append(f'*({type_} *)({pointer} + {off})')
                        if off == 0:
                            forms.append(f'*({type_} *){pointer}')
                    if word_pointer and off % 2 == 0:
                        forms.append(f'*({type_} *)({pointer} + {off//2})')
                        forms.append(f'({type_}){pointer}[{off//2}]')
                    if byte_pointer and (typ == 'char *') == (type_ == 'char'):
                        forms.append(f'{pointer}[{off}]')
                    access = base + field
                    key = f'byte_{off}_{type_}'
                    if type_ == 'char':
                        # Preserve signed reads, stores, and address-taking
                        # separately; a casted rvalue is not a valid lvalue.
                        rules.append(rule(name, pointer, key + '_address',
                                          ['&' + form for form in forms if not form.startswith('(char)')],
                                          '(char *)&' + access))
                        rules.append(rule(name, pointer, key + '_store',
                                          [form + ' = E;' for form in forms if not form.startswith('(char)')],
                                          access + ' = (byte)E;', expression=True))
                        access = '(char)' + access
                    rules.append(rule(name, pointer, key, forms, access))
    return '\n'.join(rules).rstrip() + '\n' if rules else ''


def rule(function, pointer, key, forms, replacement, expression=False):
    return f'''@{function}_{pointer}_{key}@
type R;
identifier F =~ "{regex([function])}";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
{'expression E;' if expression else ''}
@@
R F(...) {{
<...
(
''' + '\n|\n'.join(f'- {form}\n+ {replacement}' for form in dict.fromkeys(forms)) + '\n)\n...>\n}\n'


if __name__ == '__main__':
    out = HERE / 'current-aliases'
    out.mkdir(exist_ok=True)
    for source in json.loads((HERE / 'object-pointer-roles.json').read_text())['sources']:
        patch = generate(source)
        if patch:
            (out / (Path(source['source']).stem + '.cocci')).write_text(patch)
