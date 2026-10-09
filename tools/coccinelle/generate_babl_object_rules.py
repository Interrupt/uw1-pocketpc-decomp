"""Type audited BABL object receivers and name position/quality stores.

Only the shared object header is used for inventory/position builtins.
VM argument offsets and VM variable pointers are deliberately untouched.
Packed snapshots keep their original values and their original ordering.
"""
from pathlib import Path
from generate_header_field_rules import regex

HERE = Path(__file__).resolve().parent
RECEIVERS = {'babl_builtin_x_obj_pos': 'iVar5',
             'babl_builtin_count_inv': 'iVar2',
             'babl_builtin_check_inv_quality': 'iVar1',
             'babl_builtin_set_inv_quality': 'iVar4',
             'babl_builtin_find_barter_total': 'iVar3'}


def rule(function, key, before, after, meta=''):
    return f'''@babl_{key} disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "{regex([function])}";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;
{meta}
@@
R F(...) {{
<...
''' + '\n'.join('- ' + line for line in before.splitlines()) + '\n' + \
        '\n'.join('+ ' + line for line in after.splitlines()) + '\n...>\n}\n'


def generate():
    rules = []
    for function, pointer in RECEIVERS.items():
        rules.append(rule(function, pointer + '_receiver', f'((uw_object_hdr_t *){pointer})->M',
                          f'{pointer}->M', 'identifier M;'))
        rules.append(rule(function, pointer + '_type', f'void *{pointer};', f'uw_object_hdr_t *{pointer};'))
    function = 'babl_builtin_x_obj_pos'
    for key, mask, inserted, field, value in [
        ('x', 0x1fff, '(byte)(((uVar8 & 7) << 0xd) >> 8)', 'xpos', 'uVar8 & 7'),
        ('y', 0xe3ff, '(byte)((((int)sVar1 & 7U) << 10) >> 8)', 'ypos', 'sVar1 & 7'),
    ]:
        rules.append(rule(function, key + '_store', f'''uVar7 = iVar5->position_word & {hex(mask)};
iVar5->position_word_low = (byte)(char)uVar7;
iVar5->position_word_high = (byte)(uVar7 >> 8) | {inserted};''',
                          f'uVar7 = iVar5->position_word & {hex(mask)};\niVar5->{field} = {value};'))
    rules.append(rule(function, 'z_store',
                      'uVar8 = (uVar8 ^ iVar5->position_word) & 0x7f ^ iVar5->position_word;',
                      'iVar5->zpos = uVar8 & 0x7f;\nuVar8 = iVar5->position_word;'))
    rules.append(rule(function, 'floor_z',
                      'uVar8 = *pbVar6 >> 1 & 0x78 | iVar5->position_word & 0xff80;',
                      'iVar5->zpos = pbVar6->floor_height << 3;\nuVar8 = iVar5->position_word;'))
    rules.append(rule(function, 'floor_pointer', 'byte *pbVar6;', 'uw_tile_t *pbVar6;'))
    rules.append(rule(function, 'floor_lookup',
                      'pbVar6 = (byte *)tilemap_lookup((int)(short)*puVar2,(int)*psVar3);',
                      'pbVar6 = (uw_tile_t *)tilemap_lookup((int)(short)*puVar2,(int)*psVar3);'))
    rules.append(rule(function, 'packed_store', '''iVar5->position_word_low = (byte)(char)uVar8;
iVar5->position_word_high = (byte)(char)(uVar8 >> 8);''',
                      'iVar5->position_word = uVar8;'))
    rules.append(rule('babl_builtin_set_inv_quality', 'quality', '''uVar1 = iVar4->chain_word;
bVar2 = (byte)uVar1;
iVar4->chain_word_low = (bVar2 ^ bVar3) & 0x3f ^ bVar2;
iVar4->chain_word_high = (byte)(char)((ushort)uVar1 >> 8);''',
                      '''uVar1 = iVar4->chain_word;
bVar2 = (byte)uVar1;
iVar4->quality = bVar3 & 0x3f;'''))
    return '\n'.join(rules).rstrip() + '\n'


if __name__ == '__main__':
    (HERE / 'babl-object-fields.cocci').write_text(generate())
