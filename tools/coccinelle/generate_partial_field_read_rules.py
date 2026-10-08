"""Name partial reads wholly contained in a documented packed property.

The masks below are property-relative subsets observed in the remaining-access
inventory. A class/subclass mask is still an item_id operation; it must not
keep reading type_flags merely because it selects fewer than all nine bits.
Cross-property masks and packed copies are deliberately outside this pass.
Apply with --all-includes --include-headers-for-types and the project include
path: without typedef information Coccinelle can misparse byte casts as part
of a member receiver, retaining a narrowing cast around the replacement.
"""
from pathlib import Path
import re
from struct_field_catalog import WORDS

HERE = Path(__file__).resolve().parent
MASKS = {
    'item_id': [7, 15, 31, 0x30, 0x3f, 0x1c0, 0x1f0],
    'flags_res': [1, 2, 4],
    'zpos': [0x78],
    'quality': [0x30],
    'owner': [7, 15, 31, 0x30],
    'link': [0x1ff, 0x200],
    'npc_yhome': [15],
    'npc_xhome': [15],
}


def cases():
    for word, fields in WORDS.items():
        for shift, width, field in fields:
            for mask in MASKS.get(field, []):
                assert 0 < mask < (1 << width) - 1
                for suffix, start, total in [('', 0, 16), ('_signed', 0, 16),
                                             ('_low', 0, 8), ('_high', 8, 8)]:
                    selected = mask << shift
                    if selected & (((1 << total) - 1) << start) != selected:
                        continue
                    low = (selected & -selected).bit_length() - 1 - start
                    for right in sorted({0, low}):
                        yield word, field, width, shift, mask, suffix, start, right


def expressions(member, case):
    word, field, width, shift, mask, suffix, start, right = case
    base = f'B{member}{word}{suffix}'
    positioned = (mask << shift) >> start
    input_mask = positioned >> right
    forms = [f'({base} >> {right}) & {hex(input_mask)}',
             f'({base} & {hex(positioned)}) >> {right}'] if right else [f'{base} & {hex(positioned)}']
    # A low-byte cast is equivalent only if the selected bits fit in it.
    # The final mask discards any sign extension from char/signed-word reads.
    if positioned < 256:
        for cast in ['(byte)', '(char)', '(byte)(byte)']:
            cast_base = cast + '(' + base + ')'
            forms += ([f'({cast_base} >> {right}) & {hex(input_mask)}',
                       f'({cast_base} & {hex(positioned)}) >> {right}']
                      if right else [f'{cast_base} & {hex(positioned)}'])
    field_mask = f'B{member}{field} & {hex(mask)}'
    delta = shift - start - right
    replacement = (f'({field_mask}) << {delta}' if delta > 0 else
                   f'({field_mask}) >> {-delta}' if delta < 0 else field_mask)
    # Right-aligned slices read more naturally as a field extraction.
    low = (mask & -mask).bit_length() - 1
    if delta == -low and low:
        replacement = f'(B{member}{field} >> {low}) & {hex(mask >> low)}'
        if mask >> low == (1 << (width - low)) - 1:
            replacement = f'B{member}{field} >> {low}'
    return forms, replacement, field_mask


def observed_cases(source):
    # This is a speed filter, not layout evidence. It selects already-proved
    # rules by their literal input spelling; the full patch remains available.
    from audit_struct_property_usage import NONCODE
    pattern = re.compile(r'\b(' + '|'.join(WORDS) +
                         r')(_low|_high|_signed)?\b\s*\)*\s*'
                         r'(?:>>\s*(0x[\da-fA-F]+|\d+)[Uu]?\s*\)*\s*)?'
                         r'&\s*(0x[\da-fA-F]+|\d+)[Uu]?')
    found = {(w, suffix or '', int(right or '0', 0), int(mask, 0))
             for w, suffix, right, mask in pattern.findall(NONCODE.sub(' ', source))}
    return [case for case in cases()
            if (case[0], case[5], case[7],
                (case[4] << case[3]) >> case[6] >> case[7]) in found]


def generate(selected=None):
    parts = []
    for member in ['->', '.']:
        groups = {}
        for case in cases() if selected is None else selected:
            forms, replacement, field_mask = expressions(member, case)
            reads, comparisons = groups.setdefault((case[1], case[5], case[4]), ([], []))
            reads.extend((form, replacement) for form in forms)
            comparisons.extend((f'({form}) {op} 0', f'({field_mask}) {op} 0')
                               for form in forms for op in ['==', '!='])
        for number, (reads, comparisons) in enumerate(groups.values()):
            key = f'partial_{"ptr" if member == "->" else "value"}_{number}'
            meta = 'expression B;\ntypedef byte;\n@@\n'
            # Every selected bit lies within 16 bits, so zero comparisons can
            # discard its retained bit position without overflow or sign loss.
            # Coccinelle's default isnt_zero isomorphism can match a bare
            # numeric value as if it were a boolean comparison. Require the
            # actual comparison operator before simplifying its bit position.
            parts.append(f'@{key}_compare disable is_zero, isnt_zero, drop_cast@\n' + meta + '(\n' +
                         '\n|\n'.join(f'- {before}\n+ {after}'
                                       for before, after in dict.fromkeys(comparisons)) + '\n)\n')
            parts.append(f'@{key}_read disable drop_cast@\n' + meta + '(\n' +
                         '\n|\n'.join(f'- {before}\n+ {after}'
                                       for before, after in dict.fromkeys(reads)) + '\n)\n')
    return '\n'.join(parts).rstrip() + '\n'


if __name__ == '__main__':
    (HERE / 'partial-field-reads.cocci').write_text(generate())
