"""Convert masked/extracted UW1 properties from named word and byte views."""
from pathlib import Path
from struct_field_catalog import WORDS, BYTES

HERE = Path(__file__).resolve().parent


def variants(base, shift, width, total, signed=False):
    mask = (1 << width) - 1
    positioned = mask << shift
    forms = []
    if shift:
        if width <= 8:
            forms += [(f'(byte)({base} >> {shift}) & {hex(mask)}', '')]
        forms += [(f'({base} >> {shift}) & {hex(mask)}', ''),
                  (f'({base} & {hex(positioned)}) >> {shift}', '')]
        if shift + width == total and not signed:
            forms.append((f'{base} >> {shift}', ''))
    else:
        forms += [(f'({base} & {hex(mask)}) >> 0', ''),
                  (f'({base} >> 0) & {hex(mask)}', ''),
                  (f'{base} & {hex(mask)}', '')]
    # An unshifted mask still reads the same property, retaining its original
    # bit position for callers that compare or encode the result.
    if shift:
        forms.append((f'{base} & {hex(positioned)}', f' << {shift}'))
    return forms


def generate(words=WORDS, bytes_=BYTES):
    rules = []
    for member in ['->', '.']:
        for word, fields in words.items():
            for shift, width, field in fields:
                forms = variants(f'B{member}{word}', shift, width, 16)
                forms += variants(f'B{member}{word}_signed', shift, width, 16, True)
                for start, suffix in [(0, '_low'), (8, '_high')]:
                    if start <= shift and shift + width <= start + 8:
                        bit = shift - start
                        byte = f'B{member}{word}{suffix}'
                        forms += variants(byte, bit, width, 8)
                        forms += variants('(char)' + byte, bit, width, 8, True)
                if shift + width <= 8:
                    forms += variants(f'(byte)B{member}{word}', shift, width, 8)
                    forms += variants(f'(char)B{member}{word}', shift, width, 8, True)
                key = f'{word}_{field}_{"ptr" if member == "->" else "value"}'
                rules.append(f'''@{key} disable drop_cast, is_zero, isnt_zero@
expression B;
typedef byte;
@@
(
''' + '\n|\n'.join(f'- {before}\n+ ' + (f'(B{member}{field}{after})' if after else f'B{member}{field}')
                    for before, after in dict.fromkeys(forms)) + '\n)\n')
        for byte, fields in bytes_.items():
            for shift, width, field in fields:
                forms = variants(f'B{member}{byte}', shift, width, 8)
                key = f'{byte}_{field}_{"ptr" if member == "->" else "value"}'
                rules.append(f'''@{key} disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
''' + '\n|\n'.join(f'- {before}\n+ ' + (f'(B{member}{field}{after})' if after else f'B{member}{field}')
                    for before, after in forms) + '\n)\n')
    # Undo the retained bit position when a comparison proves it unnecessary.
    # Enumerating the field domain gives exact constants without truncating an
    # arbitrary comparison value that could have bits outside the field mask.
    for member in ['->', '.']:
        for word, fields in words.items():
            for shift, width, field in fields:
                shifts = [shift] if shift else []
                if shift >= 8:
                    shifts.append(shift - 8)
                values = range(1 << min(width, 4))
                for bit in sorted(set(shifts) - {0}):
                    forms = []
                    for value in values:
                        for op in ['==', '!=']:
                            # A positioned replacement can retain the input's
                            # mask parentheses as well as its own. Match both
                            # levels so cast receivers simplify in one pass.
                            for depth in [1, 2]:
                                positioned = '(' * depth + f'B{member}{field} << {bit}' + ')' * depth
                                forms.append((f'{positioned} {op} {hex(value << bit)}',
                                              f'B{member}{field} {op} {value}'))
                    rules.append(f'''@compare_{word}_{field}_{bit}_{"ptr" if member == "->" else "value"} disable drop_cast, is_zero, isnt_zero@
expression B;
@@
(
''' + '\n|\n'.join(f'- {before}\n+ {after}' for before, after in forms) + '\n)\n')
    return '\n'.join(rules).rstrip() + '\n'


if __name__ == '__main__':
    (HERE / 'named-field-reads.cocci').write_text(generate())
