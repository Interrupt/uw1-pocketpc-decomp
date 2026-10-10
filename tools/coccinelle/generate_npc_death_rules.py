"""Name byte accesses in the two ARM-reviewed NPC death routines.

ai.c documents full-object byte offsets at 0x345bc..0x3462c and
0x34638..0x34648. These function-local char pointers denote NPC records;
the rules must not be applied to unrelated buffers or projectile consumers.
"""
from pathlib import Path
from generate_current_alias_rules import rule

HERE = Path(__file__).resolve().parent


def generate():
    rules = []
    for function, fields in {
        'initiate_npc_death': {8: 'npc_hp', 11: 'goal_word_low',
                               12: 'goal_word_high', 20: 'attack_pitch',
                               21: 'animation_flags', 26: 'npc_whoami'},
        'handle_monster_death': {21: 'animation_flags'},
    }.items():
        for offset, field in fields.items():
            access = f'((uw_mobile_object_t *)npc)->{field}'
            for typ in ['byte', 'undefined1', 'char']:
                forms = [f'*({typ} *)(npc + {offset})',
                         f'*({typ} *)((char *)npc + {offset})']
                if typ == 'char':
                    rules.append(rule(function, 'npc', f'{field}_address',
                                      ['&' + form for form in forms],
                                      '(char *)&' + access))
                    rules.append(rule(function, 'npc', f'{field}_store',
                                      [form + ' = E;' for form in forms],
                                      access + ' = (byte)E;', expression=True))
                rules.append(rule(function, 'npc', f'{field}_{typ}', forms,
                                  ('(char)' if typ == 'char' else '') + access))
    return '\n'.join(rules).rstrip() + '\n'


if __name__ == '__main__':
    (HERE / 'npc-death-fields.cocci').write_text(generate())
