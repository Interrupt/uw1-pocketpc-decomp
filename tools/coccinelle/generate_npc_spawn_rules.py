"""Name the creature record in the audited NPC spawn initializer.

cast_summon_or_spawn_effect selects a newly spawned creature before calling
init_monster_spawn_defaults (ARM FUN_0002a35c). This proves NPC layout for its
saved scratch pointer, independently of other scratch/projectile consumers.
"""
from pathlib import Path
from generate_current_alias_rules import HEADER, NPC, SCALARS, rule

HERE = Path(__file__).resolve().parent
FUNCTION = 'init_monster_spawn_defaults'
POINTER = 'scratch_bytes'


UPDATES = [
    ('tile_word', 0x03ff, '', '| 0x80', 'npc_xhome', 32),
    ('tile_word', 0xfe0f, '', '| 2', 'npc_yhome', 32),
    ('tile_word', 0xfff0, '', '', 'npc_path_slot', 0),
    ('hdr.chain_word', 0xffc0, '^ 0x20', '', 'hdr.quality', 32),
    ('hdr.link_word', 0xffc0, '^ 0x20', '', 'hdr.owner', 32),
    ('goal_word', 0xfff8, '| 8', '', 'npc_goal', 8),
    ('goal_word', 0xf00f, '', '', 'npc_gtarg', 0),
    ('goal_word', 0x0fff, '', '', 'npc_animation_frame', 0),
    ('status_word', 0xfff0, '', '', 'npc_level', 0),
    ('status_word', 0xdfff, '', '', 'npc_talkedto', 0),
    ('status_word', 0x3fff, '', '| 0x80', 'npc_attitude', 2),
    ('target_word', 0xffc0, '', '', 'npc_target_tile_x', 0),
    ('target_word', 0xf03f, '', '', 'npc_target_tile_y', 0),
    ('target_word', 0x0fff, '', '', 'npc_swing_charge', 0),
]


def generate():
    rules = []
    fields = dict(SCALARS)
    for offset, field in (HEADER | NPC).items():
        for typ, suffix in [('ushort', ''), ('undefined2', ''), ('short', '_signed')]:
            forms = [f'*({typ} *)({POINTER} + {offset})',
                     f'*({typ} *)((char *){POINTER} + {offset})']
            rules.append(rule(FUNCTION, POINTER, f'word_{offset}_{typ}', forms,
                              'npc->' + field + suffix))
        fields[offset] = field + '_low'
        fields[offset + 1] = field + '_high'
    for offset, field in sorted(fields.items()):
        key = field.replace('.', '_')
        for typ in ['byte', 'undefined1', 'char']:
            forms = [f'*({typ} *)({POINTER} + {offset})',
                     f'*({typ} *)((char *){POINTER} + {offset})']
            if typ == 'byte':
                forms.append(f'{POINTER}[{offset}]')
            access = 'npc->' + field
            if typ == 'char':
                rules.append(rule(FUNCTION, POINTER, f'{key}_address',
                                  ['&' + form for form in forms], '(char *)&' + access))
                rules.append(rule(FUNCTION, POINTER, f'{key}_store',
                                  [form + ' = E;' for form in forms], access + ' = (byte)E;', True))
                access = '(char)' + access
            rules.append(rule(FUNCTION, POINTER, f'{key}_{typ}', forms, access))
    for field in ['type_flags', 'position_word', 'chain_word', 'link_word']:
        for suffix in ['', '_low', '_high', '_signed']:
            member = field + suffix
            rules.append(rule(FUNCTION, POINTER, f'header_{member}',
                              [f'((uw_object_hdr_t *){POINTER})->{member}'], 'npc->hdr.' + member))
    for field in ['item_id', 'zpos', 'heading', 'xpos', 'ypos', 'quality', 'next', 'owner', 'link']:
        rules.append(rule(FUNCTION, POINTER, f'header_{field}',
                          [f'((uw_object_hdr_t *){POINTER})->{field}'], 'npc->hdr.' + field))
    rules.append(rule(FUNCTION, POINTER, 'pointer',
                      [f'byte *{POINTER} = (byte *)g_scratch_object_ptr;'],
                      'uw_mobile_object_t *npc = (uw_mobile_object_t *)g_scratch_object_ptr;'))
    # Keep the old snapshot in V: later code may still consume its original
    # value. OR-inserted bits may also have been retained by the clear mask;
    # these reviewed recipes still overwrite the complete documented field.
    for index, (word, mask, low, high, field, value) in enumerate(UPDATES):
        rules.append(update_rule(index, word, mask, low, high, field, value))
    # Bits 4..12 of status_word have no documented property names. Preserve
    # each original clear and snapshot rather than inventing flag semantics.
    for mask in [0xff0f, 0xfdff, 0xfbff, 0xf7ff, 0xfeff, 0xefff]:
        rules.append(update_rule(f'reserved_{mask:x}', 'status_word', mask))
    rules.append(rule(FUNCTION, POINTER, 'full_heading',
                      ['(byte)(npc->hdr.position_word >> 2) & 0xe0'],
                      'npc->hdr.heading << 5'))
    rules.append(rule(FUNCTION, POINTER, 'monster_row',
                      ['DAT_001007c8 = &DAT_001007d0 + (npc->hdr.item_id & 0x3f) * 0x30;'],
                      'DAT_001007c8 = &g_monster_type_props[npc->hdr.item_id & 0x3f];'))
    rules.append(rule(FUNCTION, POINTER, 'max_hp', ['DAT_001007c8[4]'],
                      'DAT_001007c8->max_hp'))
    rules.append('''@monster_row_type@
typedef undefined, uw_monster_type_props_t;
@@
- static undefined *DAT_001007c8;
+ static uw_monster_type_props_t *DAT_001007c8;
''')
    return ('\n'.join(rules).rstrip() + '\n').replace(
        'ushort, uw_mobile_object_t;', 'ushort, uw_object_hdr_t, uw_mobile_object_t;')


def update_rule(key, word, mask, low='', high='', field=None, value=0):
    before = f'''V = npc->{word};
npc->{word}_low = (byte)(V & {hex(mask)}) {low};
npc->{word}_high = (byte)((V & {hex(mask)}) >> 8) {high};'''
    after = (f'npc->{field} = {value};' if field else
             f'npc->{word} = V & {hex(mask)};')
    return f'''@spawn_update_{key} disable drop_cast@
identifier V;
typedef byte;
@@
int init_monster_spawn_defaults(...) {{
<...
''' + '\n'.join('- ' + line for line in before.splitlines()) + f'''
+ V = npc->{word};
+ {after}
...>
}}
'''


if __name__ == '__main__':
    (HERE / 'npc-spawn-fields.cocci').write_text(generate())
