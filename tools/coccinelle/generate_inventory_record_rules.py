"""Copy the four common-header words in audited save-record transfers.

Inventory and held-item records have an eight-byte common header; NPC and
projectile extension interpretations do not apply. Source records live in the
level arena and save records live in a separate allocated buffer. Keep the
copy order and all link/equipment remapping and scalar temporaries intact.
"""
from pathlib import Path
from generate_projectile_spawn_rules import rule

HERE = Path(__file__).resolve().parent
WORDS = [('type_flags', 0), ('position_word', 2), ('chain_word', 4), ('link_word', 6)]


def changes():
    def change(key, before, after, meta='', function='spawn_object_near_player'):
        return dict(key=key, before=before, after=after, meta=meta, function=function)
    rules = []
    for word, offset in WORDS:
        rules.append(change('serialize_' + word,
            f'''puVar2[{offset}] = ((uw_object_hdr_t *)puVar1)->{word}_low;
puVar2[{offset + 1}] = ((uw_object_hdr_t *)puVar1)->{word}_high;'''.replace('puVar2[0]', '*puVar2'),
            f'((uw_object_hdr_t *)puVar2)->{word} = ((uw_object_hdr_t *)puVar1)->{word};',
            function='serialize_inventory_link_chain'))
        rules.append(change('deserialize_' + word,
            f'''((uw_object_hdr_t *)puVar1)->{word}_low = puVar3[{offset}];
((uw_object_hdr_t *)puVar1)->{word}_high = puVar3[{offset + 1}];'''.replace('puVar3[0]', '*puVar3'),
            f'((uw_object_hdr_t *)puVar1)->{word} = ((uw_object_hdr_t *)puVar3)->{word};',
            function='deserialize_inventory_link_chain'))
        source = '*g_selected_object' if offset == 0 else f'puVar4[{offset}]'
        rules.append(change('held_save_' + word,
            f'''out_record[{hex(0x1b + offset)}] = {source};
out_record[{hex(0x1c + offset)}] = puVar4[{offset + 1}];''',
            f'((uw_object_hdr_t *)(out_record + 0x1b))->{word} = ((uw_object_hdr_t *)puVar4)->{word};',
            function='build_player_save_record'))
        destination = '*puVar2' if offset == 0 else f'puVar2[{offset}]'
        rules.append(change('held_restore_' + word,
            f'''{destination} = record[{hex(0x1b + offset)}];
puVar2[{offset + 1}] = record[{hex(0x1c + offset)}];''',
            f'((uw_object_hdr_t *)puVar2)->{word} = ((uw_object_hdr_t *)(record + 0x1b))->{word};',
            function='restore_player_save_record'))
    rules.append(change('player_next_clear',
        'out_record[4] = out_record[4] & 0x3f;\nout_record[5] = 0;',
        '((uw_object_hdr_t *)out_record)->next = 0;',
        function='build_player_save_record'))
    rules.append(change('held_save_quantity',
        '(g_selected_object[1] & 0x80) == 0',
        '((uw_object_hdr_t *)g_selected_object)->is_quant == 0',
        function='build_player_save_record'))
    rules.append(change('held_restore_quantity',
        '(record[0x1c] & 0x80) == 0',
        '((uw_object_hdr_t *)(record + 0x1b))->is_quant == 0',
        function='restore_player_save_record'))
    return rules


def generate():
    return ''.join(rule(**change) for change in changes()).replace('@projectile_spawn_', '@inventory_record_')


if __name__ == '__main__':
    (HERE / 'inventory-record-words.cocci').write_text(generate())
