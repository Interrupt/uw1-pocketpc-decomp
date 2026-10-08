"""Replace complete UW1 packed-field updates without losing live temporaries."""
from pathlib import Path
import re
from struct_field_catalog import WORDS, BYTES

HERE = Path(__file__).resolve().parent
HEADER = {'type_flags', 'position_word', 'chain_word', 'link_word'}


def rule(key, before, after):
    names = ', '.join(name for name in ['P', 'H', 'V']
                      if re.search(r'\b' + name + r'\b', before))
    return f'''@{key}@
identifier {names};
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
''' + '\n'.join('- ' + line for line in before.splitlines()) + '\n' + \
        '\n'.join('+ ' + line for line in after.splitlines()) + '\n'


def receivers(word):
    if word in HEADER:
        return ['P->', 'P.', 'P->hdr.', 'P.hdr.',
                '((uw_object_hdr_t *)P)->', '((uw_mobile_object_t *)P)->hdr.']
    return ['P->', 'P.', '((uw_mobile_object_t *)P)->']


def generate():
    rules = []
    for word, fields in WORDS.items():
        for r, prefix in enumerate(receivers(word)):
            packed = prefix + word
            stores = [f'{packed} = (ushort)V;',
                      f'{packed}_low = (byte)V;\n{packed}_high = (byte)(V >> 8);',
                      f'{packed}_low = (byte)(char)V;\n{packed}_high = (byte)(char)(V >> 8);']
            for shift, width, field in fields:
                mask = (1 << width) - 1
                bits = mask << shift
                clear = 0xffff ^ bits
                dst = prefix + field
                insert = f'(H & {hex(mask)}) << {shift}' if shift else f'H & {hex(mask)}'
                preserve = [f'{packed} & {hex(clear)}']
                # The read sweep may already have named the complementary
                # field in two-field owner/link and quality/next words.
                if len(fields) == 2:
                    other = next(entry for entry in fields if entry[2] != field)
                    if ((1 << other[1]) - 1) << other[0] == clear:
                        preserve.append(prefix + other[2] + (f' << {other[0]}' if other[0] else ''))
                key = f'{word}_{r}_{field}'
                for n, kept in enumerate(preserve):
                    formula = f'{kept} | {insert}'
                    rules.append(rule(key + f'_direct_{n}', f'{packed} = {formula};',
                                      f'{dst} = H & {hex(mask)};'))
                    for s, store in enumerate(stores):
                        rules.append(rule(key + f'_temporary_{n}_{s}',
                                          f'V = {formula};\n{store}',
                                          f'{dst} = H & {hex(mask)};\nV = {packed};'))
                for operation, formula, value in [('clear', f'{packed} & {hex(clear)}', 0),
                                                   ('set', f'{packed} | {hex(bits)}', mask)]:
                    rules.append(rule(key + '_' + operation, f'{packed} = {formula};', f'{dst} = {hex(value)};'))
                    for s, store in enumerate(stores):
                        rules.append(rule(key + f'_{operation}_{s}', f'V = {formula};\n{store}',
                                          f'{dst} = {hex(value)};\nV = {packed};'))
                # Full-field updates wholly contained in one byte can be
                # named without touching a neighboring property or byte.
                start = 0 if shift < 8 else 8
                if shift + width <= start + 8:
                    byte = packed + ('_low' if start == 0 else '_high')
                    rules += byte_rules(key, byte, dst, shift - start, width)
    for word, fields in BYTES.items():
        for r, prefix in enumerate(['P->', 'P.']):
            for shift, width, field in fields:
                rules += byte_rules(f'{word}_{r}_{field}', prefix + word,
                                    prefix + field, shift, width)
    return '\n'.join(rules).rstrip() + '\n'


def byte_rules(key, byte, dst, shift, width):
    mask = (1 << width) - 1
    bits = mask << shift
    clear = 0xff ^ bits
    insert = f'(H & {hex(mask)}) << {shift}' if shift else f'H & {hex(mask)}'
    rules = [rule(key + '_byte_insert', f'{byte} = {byte} & {hex(clear)} | {insert};',
                  f'{dst} = H & {hex(mask)};'),
             rule(key + '_byte_clear', f'{byte} = {byte} & {hex(clear)};', f'{dst} = 0;'),
             rule(key + '_byte_set', f'{byte} = {byte} | {hex(bits)};', f'{dst} = {hex(mask)};')]
    value = f'(H >> {shift}) & {hex(mask)}' if shift else f'H & {hex(mask)}'
    for n, formula in enumerate([f'(H ^ {byte}) & {hex(bits)} ^ {byte}',
                                 f'({byte} ^ H) & {hex(bits)} ^ {byte}']):
        rules.append(rule(key + f'_byte_xor_{n}', f'{byte} = {formula};', f'{dst} = {value};'))
    return rules


if __name__ == '__main__':
    (HERE / 'named-field-writes.cocci').write_text(generate())
