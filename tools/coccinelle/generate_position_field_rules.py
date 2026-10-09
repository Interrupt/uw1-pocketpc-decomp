"""Replace complete packed-position operations with UW1 named fields."""
from pathlib import Path

HERE = Path(__file__).resolve().parent
FIELDS = [('zpos', 0, 7), ('heading', 7, 3), ('ypos', 10, 3), ('xpos', 13, 3)]
RECEIVERS = ['P->hdr.', 'P->', '((uw_object_hdr_t *)P)->']


def generate():
    parts = []
    for number, receiver in enumerate(RECEIVERS):
        word = receiver + 'position_word'
        for field, shift, width in FIELDS:
            mask = (1 << width) - 1
            clear = 0xffff ^ (mask << shift)
            insert = f'(H & {hex(mask)}) << {shift}' if shift else f'H & {hex(mask)}'
            prefix = f'position_{number}_{field}'
            # H and P are identifiers: no evaluation-order changes from calls,
            # increments or other side effects in a receiver or inserted value.
            meta = 'identifier P, H, V;\ntypedef ushort, byte, uw_object_hdr_t;'
            stores = [f'{word} = (ushort)V;',
                      f'{word}_low = (byte)(char)V;\n{word}_high = (byte)(char)(V >> 8);',
                      f'{word}_low = (byte)V;\n{word}_high = (byte)(V >> 8);']
            for index, store in enumerate(stores):
                parts.append(f'''@{prefix}_store_{index}@
{meta}
@@
- V = {word} & {hex(clear)} | {insert};
- {store.replace(chr(10), chr(10)+'- ')}
+ {receiver}{field} = H & {hex(mask)};
+ V = {word};
''')
            parts.append(f'''@{prefix}_direct@
{meta}
@@
- {word} = {word} & {hex(clear)} | {insert};
+ {receiver}{field} = H & {hex(mask)};
''')
            if shift:
                parts.append(f'''@{prefix}_read@
identifier P;
typedef uw_object_hdr_t;
@@
(
- ({word} >> {shift}) & {hex(mask)}
+ {receiver}{field}
|
- ({word} & {hex(mask << shift)}) >> {shift}
+ {receiver}{field}
)
''')
            else:
                parts.append(f'''@{prefix}_read@
identifier P;
typedef uw_object_hdr_t;
@@
- {word} & {hex(mask)}
+ {receiver}{field}
''')
    # A fine heading's top three byte bits encode the same coarse heading.
    for number, receiver in enumerate(RECEIVERS):
        word = receiver + 'position_word'
        for index, store in enumerate([
            f'{word} = (ushort)V;',
            f'{word}_low = (byte)(char)V;\n{word}_high = (byte)(char)(V >> 8);',
        ]):
            parts.append(f'''@fine_heading_{number}_{index}@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = {word} & 0xfc7f | (H & 0xe0) << 2;
- {store.replace(chr(10), chr(10)+'- ')}
+ {receiver}heading = (H >> 5) & 7;
+ V = {word};
''')
    # This is a byte field, so writing through a char lvalue is unnecessary.
    parts.append('''@full_heading_byte@
identifier P;
expression E;
typedef byte;
@@
- *(char *)&P->full_heading = (char)E;
+ P->full_heading = (byte)E;
''')
    return '\n'.join(parts).rstrip() + '\n'


def generate_dead_temporaries():
    parts = ['// Remove packed-result reloads only when control flow proves the\n'
             '// temporary unused before exit or an independent overwrite.\n']
    for index in range(1, 33):
        name = f'uVar{index}'
        parts.append(f'''@dead_before_overwrite_{index}@
type R;
identifier F, P;
identifier V =~ "^{name}$";
expression E !~ "{name}";
@@
R F(...) {{
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}}
''')
    # Goto-heavy routines can exceed the generic CFG pattern's reach.
    # Audited: these reloads have no readers before an independent overwrite
    # or return on any path (including npc_walk_toward_tile's backward gotos).
    for function, name in [('npc_walk_toward_tile', 'uVar8'),
                           ('walk_using_cached_path', 'uVar7'),
                           ('npc_react_to_nearby_player', 'uVar5'),
                           ('npc_combat_approach_tick', 'uVar7'),
                           ('npc_combat_engage_wide_tick', 'uVar3'),
                           ('npc_combat_position_tick', 'uVar1'),
                           ('npc_combat_position_tick', 'uVar8'),
                           ('npc_combat_disengage_tick', 'uVar5')]:
        parts.append(f'''@audited_dead_{function}_{name}@
type R;
@@
R {function}(...) {{
<...
- {name} = DAT_0010190c->hdr.position_word;
...>
}}
''')
    parts.append('''@dead_before_exit@
type R;
identifier F, P, V;
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
}
''')
    return '\n'.join(parts).rstrip() + '\n'


if __name__ == '__main__':
    (HERE / 'position-fields.cocci').write_text(generate())
    (HERE / 'position-dead-temporaries.cocci').write_text(generate_dead_temporaries())
