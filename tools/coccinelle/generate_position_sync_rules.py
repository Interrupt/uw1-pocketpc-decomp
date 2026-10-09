"""Name shared mobile fields in sync_object_tile_position.

Its arena test proves mobile storage before accessing bytes 8..26. The
placement snapshot builder consumes the same fields for NPCs and projectiles.
Only the explicit non-NPC branch uses projectile precise coordinates; these
must not become NPC goal/status/target words. Snapshot buffer offsets remain a
separate migration. Saved scalar values retain their exact original formulas.
"""
from pathlib import Path
from generate_word_access_rules import generate as word_rules
from generate_current_alias_rules import rule as access_rule

HERE = Path(__file__).resolve().parent
FUNCTION = 'sync_object_tile_position'
SCALARS = {8: 'hit_points', 9: 'full_heading', 10: 'movement_flags',
           19: 'motion_flags', 20: 'attack_pitch'}


def update(key, before, after):
    return f'''@sync_{key} disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {{
<...
''' + '\n'.join('- ' + line for line in before.splitlines()) + '\n' + \
        '\n'.join('+ ' + line for line in after.splitlines()) + '\n...>\n}\n'


def generate_accesses():
    rules = [word_rules('object', {22: 'tile_position'}, r'^sync_object_tile_position$', raw_type='ushort *').replace('uw_object_hdr_t', 'uw_mobile_object_t')]
    for offset, field in SCALARS.items():
        access = f'((uw_mobile_object_t *)object)->{field}'
        for typ in ['byte', 'undefined1', 'char']:
            forms = [f'*({typ} *)((char *)object + {hex(offset)})']
            if offset % 2 == 0:
                forms += [f'*({typ} *)(object + {hex(offset//2)})',
                          f'({typ})object[{hex(offset//2)}]']
            if typ == 'char':
                rules.append(access_rule(FUNCTION, 'object', field + '_address',
                                         ['&' + f for f in forms if not f.startswith('(char)')], '(char *)&' + access))
                rules.append(access_rule(FUNCTION, 'object', field + '_store',
                                         [f + ' = E;' for f in forms if not f.startswith('(char)')], access + ' = (byte)E;', True))
            rules.append(access_rule(FUNCTION, 'object', field + '_' + typ, forms,
                                     ('(char)' if typ == 'char' else '') + access))
    return '\n'.join(rules)


def generate_updates():
    hdr = '((uw_object_hdr_t *)object)->'
    mob = '((uw_mobile_object_t *)object)->'
    rules = []
    rules.append(update('z', f'''{hdr}position_word_low = (byte)(uVar7 & 0xff80) | bVar9;
{hdr}position_word_high = (byte)(char)((uVar7 & 0xff80) >> 8);''', f'{hdr}zpos = bVar9;'))
    rules.append(update('x', f'''{hdr}position_word_low = (byte)(uVar7 & 0x1f80) | bVar9;
{hdr}position_word_high = (byte)((uVar7 & 0x1f80) >> 8) | bVar3;''', f'{hdr}xpos = (bVar3 >> 5) & 7;'))
    rules.append(update('y', f'''{hdr}position_word_low = (byte)(uVar7 & 0x380) | bVar9;
{hdr}position_word_high = (byte)((uVar7 & 0x380) >> 8) | bVar3 | (byte)((uint)(((int)(short)(uVar1 & 0xe0) >> 5) << 10) >> 8);''', f'{hdr}ypos = (uVar1 >> 5) & 7;'))
    rules.append(update('quality', f'''{hdr}chain_word_low = (byte)position[0xf] & 0x3f | (byte)(uVar1 & 0xffc0);
{hdr}chain_word_high = (byte)(char)((uVar1 & 0xffc0) >> 8);''', f'{hdr}quality = position[0xf] & 0x3f;'))
    rules.append(update('tile_x', f'''{mob}tile_position_low = (byte)(char)uVar8;
{mob}tile_position_high = (byte)(uVar8 >> 8) | (byte)(uVar7 >> 8);''', f'{mob}tile_x = (uVar7 >> 10) & 0x3f;'))
    rules.append(update('mode', f'''{mob}movement_flags = {mob}movement_flags & 0x8f | ((&DAT_000868c0)[(byte)position[0x14]] & 7) << 4;''', f'{mob}movement_mode = (&DAT_000868c0)[(byte)position[0x14]] & 7;'))
    rules.append(update('pitch', f'''{mob}attack_pitch = (byte)((int)sVar4 << 3) | {mob}attack_pitch & 7;''', f'{mob}pitch = (byte)sVar4 & 0x1f;'))
    # uVar7 retains the complete packed value. X and the reserved low nibble
    # already match it here, so only Y needs updating in the record.
    rules.append(update('tile_word', f'''{mob}tile_position_low = (byte)(char)uVar7;
{mob}tile_position_high = (byte)(char)(uVar7 >> 8);''', f'{mob}tile_y = (uVar7 >> 4) & 0x3f;'))
    rules.append(update('gravity', f'{mob}motion_flags = bVar9;', f'{mob}gravity_flag = bVar9 >> 7;'))
    rules.append(update('speed', f'{mob}motion_flags = (bVar3 ^ bVar9) & 0x7f ^ bVar9;', f'{mob}speed = bVar3 & 0x7f;'))
    formula = f'{hdr}position_word & 0xfc7f | ((int)*(short *)((char *)position + 0x21) >> 0xd & 7U) << 7'
    rules.append(update('heading', f'uVar7 = {formula};\n{hdr}position_word = (ushort)uVar7;',
                        f'uVar7 = {formula};\n{hdr}heading = (uVar7 >> 7) & 7;'))
    before = []
    after = []
    for i, axis in enumerate('xyz'):
        read = '*position' if i == 0 else f'position[{i}]'
        before += [f'uVar1 = {read};', f'*(char *)((char *)object + {hex(11+i*2)}) = (char)uVar1;',
                   f'*(char *)(object + {hex(6+i)}) = (char)(uVar1 >> 8);']
        after += [f'uVar1 = {read};', f'projectile->precise_{axis} = uVar1;']
    guard = f'if (({hdr}item_id & 0x1c0) != 0x40) {{'
    rules.append(update('projectile_coordinates', guard + '\n' + '\n'.join(before) + '\n}',
                        guard + '\nuw_projectile_object_t *projectile = (uw_projectile_object_t *)object;\n' + '\n'.join(after) + '\n}'))
    return '\n'.join(rules)


if __name__ == '__main__':
    (HERE / 'position-sync-accesses.cocci').write_text(generate_accesses())
    (HERE / 'position-sync-updates.cocci').write_text(generate_updates())
