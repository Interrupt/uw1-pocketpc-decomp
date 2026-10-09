"""Name projectile launch fields in spawn_object_near_player (ARM FUN_0004ad10).

Its newly allocated mobile record is advanced by mobile_object_tick and is
converted to an immobile item only on landing. NPC goal/status field names
must not be used for its overlapping precise-coordinate words.
"""
from pathlib import Path

HERE = Path(__file__).resolve().parent


def rule(key, before, after, meta='', function='spawn_object_near_player'):
    forms = before if isinstance(before, list) else [before]
    # The audited formulas are emitted in source order. Expanding arithmetic
    # permutations of the nested height formula costs minutes and adds no
    # coverage for this scoped conversion.
    return f'''@projectile_spawn_{key} disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^{function}$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;
{meta}
@@
R F(...) {{
<...
(
''' + '\n|\n'.join('\n'.join('- ' + line for line in form.splitlines()) + '\n' +
                    '\n'.join('+ ' + line for line in after.splitlines()) for form in forms) + '\n)\n...>\n}\n'


def generate():
    rules = []
    for field, offset in [('precise_x', 11), ('precise_y', 13), ('precise_z', 15)]:
        rules.append(rule(field, f'''*(char *)((char *)puVar6 + {offset}) = (char)V;
*(char *)(puVar6 + {(offset + 1)//2}) = (char)((uint)V >> 8);''',
                          f'puVar6->{field} = (ushort)V;', 'identifier V;'))
    word = 'puVar6[11]'
    rules += [rule('tile_x', f'{word} >> 10', 'puVar6->tile_x'),
              rule('tile_y', f'({word} & 0x3f0) >> 4', 'puVar6->tile_y'),
              rule('tile_y_precise', [f'({word} & 0x3f0) * 0x10', '(puVar6->tile_position & 0x3f0) * 0x10'], '(puVar6->tile_y << 8)'),
              rule('tile_x_precise', f'({word} & 0xfc00) >> 2', '(puVar6->tile_x << 8)'),
              rule('tile_debug_word', word, 'puVar6->tile_position')]
    rules.append(rule('fine_heading',
                      '*(byte *)(puVar6 + 12) = ((byte)DAT_00202a54 ^ (byte)puVar6[12]) & 0x1f ^ (byte)puVar6[12];',
                      'puVar6->fine_heading = (byte)DAT_00202a54 & 0x1f;'))
    rules.append(rule('speed',
                      '*(byte *)((char *)puVar6 + 19) = ((byte)DAT_00202a48 ^ *(byte *)((char *)puVar6 + 19)) & 0x7f ^ *(byte *)((char *)puVar6 + 19);',
                      'puVar6->speed = (byte)DAT_00202a48 & 0x7f;'))
    rules.append(rule('pitch',
                      "*(byte *)(puVar6 + 10) = (char)DAT_00202a3c * '\\b' + 0x87U & 0xf9 | 1;",
                      'puVar6->pitch_flags = 1;\npuVar6->pitch = ((char)DAT_00202a3c + 16) & 0x1f;'))
    for offset, index, field in [(9, None, 'heading'), (18, 9, 'source_slot')]:
        raw = (f'*(char *)((char *)puVar6 + {offset})' if index is None else
               f'*(char *)(puVar6 + {index})')
        rules.append(rule(field, raw + ' = E;', f'puVar6->{field} = (byte)E;', 'expression E;'))
    rules.append(rule('animation_flags', '*(byte *)((char *)puVar6 + 21)', 'puVar6->animation_flags'))
    # The template can be an NPC or another moving item; only its common
    # header and the shared physical fine-heading bits are read here.
    rules.append(rule('template_fine_heading', '(byte)DAT_00202a44[12] & 0x1f',
                      '((uw_projectile_object_t *)DAT_00202a44)->fine_heading'))
    rules.append(rule('template_header_type', '*DAT_00202a44',
                      '((uw_object_hdr_t *)DAT_00202a44)->type_flags'))
    rules.append(rule('template_header_position', 'DAT_00202a44[1]',
                      '((uw_object_hdr_t *)DAT_00202a44)->position_word'))
    rules.append(rule('template_header_high', '*(byte *)((char *)DAT_00202a44 + 3)',
                      '((uw_object_hdr_t *)DAT_00202a44)->position_word_high'))
    rules.append(rule('template_item_id', '((uw_object_hdr_t *)DAT_00202a44)->type_flags & 0x1ff',
                      '((uw_object_hdr_t *)DAT_00202a44)->object_id'))
    rules.append(rule('template_class', '((uw_object_hdr_t *)DAT_00202a44)->type_flags & 0x1c0',
                      '((uw_object_hdr_t *)DAT_00202a44)->object_id & 0x1c0'))
    rules.append(rule('launch_heading',
                      'DAT_00202a54 = (((uw_object_hdr_t *)DAT_00202a44)->position_word >> 2 & 0xffe0) + DAT_00202a40 + uVar9 & 0xff;',
                      'DAT_00202a54 = (((uw_object_hdr_t *)DAT_00202a44)->heading << 5) + DAT_00202a40 + uVar9 & 0xff;'))
    rules.append(rule('header_receiver', '((uw_object_hdr_t *)puVar6)->M',
                      'puVar6->hdr.M', 'identifier M;'))
    rules.append(rule('next_clear', '''puVar6->hdr.chain_word_low = puVar6->hdr.quality;
puVar6->hdr.chain_word_high = 0;''', 'puVar6->hdr.next = 0;'))
    rules.append(rule('link_one', '''puVar6->hdr.link_word_low = puVar6->hdr.owner | 0x40;
puVar6->hdr.link_word_high = 0;''', 'puVar6->hdr.link = 1;'))
    rules.append(rule('quantity', '''uVar7 = puVar6->hdr.type_flags | 0x8000;
puVar6->hdr.type_flags_low = (byte)(char)puVar6->hdr.type_flags;
puVar6->hdr.type_flags_high = (byte)(char)(uVar7 >> 8);''',
                      '''uVar7 = puVar6->hdr.type_flags | 0x8000;
puVar6->hdr.is_quant = 1;'''))
    rules.append(rule('object_id', '''uVar7 = (uVar7 ^ (int)DAT_00202a38) & 0x1ff ^ uVar7;
puVar6->hdr.type_flags = (ushort)uVar7;''',
                      '''puVar6->hdr.object_id = (int)DAT_00202a38 & 0x1ff;
uVar7 = puVar6->hdr.type_flags;'''))
    rules.append(rule('coarse_heading', '''uVar7 = puVar6->hdr.position_word & 0xfc7f | ((int)(short)(DAT_00202a54 & 0xe0) >> 5) << 7;
puVar6->hdr.position_word = (ushort)uVar7;''',
                      '''puVar6->hdr.heading = (DAT_00202a54 >> 5) & 7;
uVar7 = puVar6->hdr.position_word;'''))
    for mask, field in [(0xdfff, 'doordir'), (0xffc0, 'owner')]:
        word = 'type_flags' if field == 'doordir' else 'link_word'
        rules.append(rule(field, f'''uVar9 = puVar6->hdr.{word};
puVar6->hdr.{word}_low = (byte)(char)(uVar9 & {hex(mask)});
puVar6->hdr.{word}_high = (byte)(char)((uVar9 & {hex(mask)}) >> 8);''',
                          f'uVar9 = puVar6->hdr.{word};\npuVar6->hdr.{field} = 0;'))
    rules.append(rule('zpos', '''uVar7 = (uint)puVar6->hdr.position_word;
uVar7 = ((byte)((uw_object_hdr_t *)DAT_00202a44)->position_word ^ uVar7) & 0x7f ^ uVar7;
puVar6->hdr.position_word_low = (byte)(char)uVar7;
puVar6->hdr.position_word_high = puVar6->hdr.position_word_high;''',
                      '''puVar6->hdr.zpos = ((uw_object_hdr_t *)DAT_00202a44)->zpos;
uVar7 = puVar6->hdr.position_word;'''))
    rules.append(rule('position_copy', '''uVar7 = (uVar7 ^ ((uw_object_hdr_t *)DAT_00202a44)->position_word) & 0x1fff ^ (uint)((uw_object_hdr_t *)DAT_00202a44)->position_word;
bVar1 = (byte)uVar7;
puVar6->hdr.position_word_low = bVar1;
bVar2 = (byte)(uVar7 >> 8);
puVar6->hdr.position_word_high = bVar2;
bVar2 = (((uw_object_hdr_t *)DAT_00202a44)->position_word_high ^ bVar2) & 0x1c ^ bVar2;
puVar6->hdr.position_word_low = bVar1;
puVar6->hdr.position_word_high = bVar2;''',
                      '''puVar6->hdr.xpos = ((uw_object_hdr_t *)DAT_00202a44)->xpos;
uVar7 = puVar6->hdr.position_word;
bVar1 = (byte)uVar7;
bVar2 = (byte)(uVar7 >> 8);
puVar6->hdr.ypos = ((uw_object_hdr_t *)DAT_00202a44)->ypos;
bVar2 = puVar6->hdr.position_word_high;'''))
    rules.append(rule('height_adjust', '''bVar3 = (cVar4 + (char)DAT_00202a3c * '\\x02' + (bVar1 & 0x7f) ^ bVar1) & 0x7f ^ bVar1;
puVar6->hdr.position_word_low = bVar3;
puVar6->hdr.position_word_high = bVar2;''',
                      '''puVar6->hdr.zpos = cVar4 + (char)DAT_00202a3c * '\\x02' + (bVar1 & 0x7f);
bVar3 = puVar6->hdr.position_word_low;'''))
    rules.append(rule('crouch_height', '''puVar6->hdr.position_word_low = (((char)DAT_00202a3c * '\\x02' - (*(byte *)(DAT_00086df8 + 0xb9) >> 3)) + g_object_type_props[(((uw_object_hdr_t *)DAT_00202a44)->object_id)].height + (bVar1 & 0x7f) ^ bVar3) & 0x7f ^ bVar3;
puVar6->hdr.position_word_high = bVar2;''',
                      '''puVar6->hdr.zpos = ((char)DAT_00202a3c * '\\x02' - (*(byte *)(DAT_00086df8 + 0xb9) >> 3)) + g_object_type_props[(((uw_object_hdr_t *)DAT_00202a44)->object_id)].height + (bVar1 & 0x7f);'''))
    rules += [rule('pointer', 'ushort *puVar6;', 'uw_projectile_object_t *puVar6;'),
              rule('allocate', 'puVar6 = (ushort *)alloc_object_slot(1);',
                   'puVar6 = (uw_projectile_object_t *)alloc_object_slot(1);'),
              rule('null_assignment', 'puVar6 = (ushort *)0x0;', 'puVar6 = NULL;'),
              rule('null_check', 'puVar6 == (ushort *)0x0', 'puVar6 == NULL'),
              rule('drop_boundary', 'check_object_drop_height(puVar6,DAT_00202a44)',
                   'check_object_drop_height((ushort *)puVar6,DAT_00202a44)'),
              rule('free_boundary', 'free_object_slot(puVar6)', 'free_object_slot(&puVar6->hdr)'),
              rule('sound_boundary', 'play_sound_effect_at_object(10,puVar6,0)',
                   'play_sound_effect_at_object(10,(ushort *)puVar6,0)'),
              rule('list_boundary', 'object_list_insert_head(pbTile + 2,puVar6)',
                   'object_list_insert_head(pbTile + 2,&puVar6->hdr)'),
              rule('return_boundary', 'return puVar6;', 'return (uw_object_hdr_t *)puVar6;')]
    return '\n'.join(rules).rstrip() + '\n'


if __name__ == '__main__':
    (HERE / 'projectile-spawn-fields.cocci').write_text(generate())
