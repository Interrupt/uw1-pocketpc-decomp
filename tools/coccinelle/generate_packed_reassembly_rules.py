"""Collapse byte reassembly only when both bytes belong to one packed value."""
from pathlib import Path

HERE = Path(__file__).resolve().parent
FIELDS = ['type_flags', 'position_word', 'chain_word', 'link_word',
          'goal_word', 'status_word', 'target_word', 'tile_word', 'size_weight']


def generate():
    parts = []
    receivers = ['P->', 'P.', 'P->hdr.',
                 '((uw_object_hdr_t *)P)->',
                 '((uw_mobile_object_t *)P)->hdr.']
    for field in FIELDS:
        for receiver_index, receiver in enumerate(receivers):
            word = receiver + field
            # Restrict receivers to identifiers/member paths: collapsing two
            # calls or increments into one evaluation would change behavior.
            lows = [word + '_low', '(char)' + word, '(byte)' + word,
                    '(undefined1)' + word]
            for n, low in enumerate(lows):
                parts.append(f'''@named_{field}_{receiver_index}_{n}@
identifier P;
typedef byte, undefined1, uw_object_hdr_t, uw_mobile_object_t;
@@
- CONCAT11({word}_high, {low})
+ {word}
''')
    # These forms already read the low byte through a 16-bit lvalue. Preserve
    # that access and its unsigned result, without adding an unaligned word load.
    for type_ in ['ushort', 'undefined2', 'unsigned short', 'short']:
        for index in range(10):
            word = '*P' if index == 0 else f'P[{index}]'
            highoff = index * 2 + 1
            for byte_ in ['byte', 'undefined1', 'char']:
                for low_ in ['byte', 'char', 'undefined1']:
                    parts.append(f'''@indexed_{type_.replace(' ', '_')}_{index}_{byte_}_{low_}@
typedef ushort, undefined2, byte, undefined1;
{type_} *P =~ "^[A-Za-z_][A-Za-z_0-9]*$";
@@
- CONCAT11(*({byte_} *)((char *)P + {highoff}), ({low_}){word})
+ (ushort){word}
''')
    # Byte-only object aliases whose roles have been independently established.
    # Scope by original function and pointer name; never infer an object from
    # an arbitrary byte buffer or apply NPC fields to projectile records.
    sites = [
        ('drop_monster_loot', 'pDropObj', 4, 'uw_object_hdr_t', 'chain_word', False),
        ('initiate_npc_death', 'npc', 11, 'uw_mobile_object_t', 'goal_word', False),
        ('resolve_unique_npc_special_behavior', 'npc', 11, 'uw_mobile_object_t', 'goal_word', False),
        ('trigger_scripted_npc_conversation', 'iVar2', 11, 'uw_mobile_object_t', 'goal_word', False),
        ('damage_equipped_item_in_slot', 'puVar5', 0, 'uw_object_hdr_t', 'type_flags', True),
        ('compute_object_placement_fields', 'object', 0, 'uw_object_hdr_t', 'type_flags', False),
    ]
    for function, pointer, offset, type_, field, cast in sites:
        lowptr = f'(char *){pointer}' if cast else pointer
        low = f'*(undefined1 *){pointer}' if offset == 0 else f'*(undefined1 *)({lowptr} + {offset})'
        high = f'*(undefined1 *)({lowptr} + {offset+1})'
        if function == 'compute_object_placement_fields':
            low, high = '*object', 'object[1]'
        parts.append(f'''@raw_{function}@
type R;
typedef undefined1, {type_};
@@
R {function}(...) {{
<...
- CONCAT11({high}, {low})
+ (({type_} *){pointer})->{field}
...>
}}
''')
    # In this original stacking branch bVar1 caches object[3]'s low
    # byte (quantity case), then puVar6[2]'s low byte (quality average).
    # Neither source word changes before its corresponding CONCAT11.
    for byte_, pointer, offset, field in [
        ('byte', 'object', 7, 'link_word'),
        ('undefined1', 'puVar6', 5, 'chain_word'),
    ]:
        parts.append(f'''@stacking_{field}@
type R;
typedef byte, undefined1, uw_object_hdr_t;
@@
R auto_place_in_container(...) {{
<...
- CONCAT11(*({byte_} *)((char *){pointer} + {offset}), bVar1)
+ ((uw_object_hdr_t *){pointer})->{field}
...>
}}
''')
    return '\n'.join(parts).rstrip() + '\n'


if __name__ == '__main__':
    (HERE / 'packed-reassembly.cocci').write_text(generate())
