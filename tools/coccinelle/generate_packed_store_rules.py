"""Combine matching partial stores of the same scalar into a packed word copy.

Identifiers exclude calls/increments; different values and intervening code
remain separate. The source temporary's full value is never changed.
"""
from pathlib import Path
from struct_field_catalog import WORDS
from generate_named_field_write_rules import receivers

HERE = Path(__file__).resolve().parent
CASTS = [('(byte)', '(byte)'), ('(char)', '(char)'),
         ('(byte)(char)', '(byte)'), ('(byte)(char)', '(byte)(char)'),
         ('(char)', '(byte)'), ('(byte)', '(byte)(char)')]


def generate():
    rules = []
    for word in WORDS:
        for index, prefix in enumerate(receivers(word)):
            packed = prefix + word
            variants = []
            for low, high in CASTS:
                variants.append(f'''- {packed}_low = {low}V;
- {packed}_high = {high}(V >> 8);
+ {packed} = (ushort)V;''')
            rules.append(f'''@store_{word}_{index}@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
''' + '\n|\n'.join(variants) + '\n)\n')
    return '\n'.join(rules).rstrip() + '\n'


COPY_LOW_CASTS = ['', '(byte)', '(char)', '(byte)(char)']


def generate_copies(words=WORDS):
    """Copy the same member between valid, non-overlapping object records.

    Self-copies are valid too. Identifier receivers exclude side effects;
    adjacency excludes intervening modifications. Partially overlapping raw
    buffers and volatile/device memory are outside this object-layout pass.
    """
    rules = []
    for word in words:
        for di, prefix in enumerate(receivers(word)):
            for si, source in enumerate(receivers(word)):
                dest = prefix + word
                source = source.replace('P', 'Q') + word
                variants = []
                for cast in COPY_LOW_CASTS:
                    low = source + '_low' if not cast else cast + '(' + source + ')'
                    variants.append(f'''- {dest}_low = {low};
- {dest}_high = {source}_high;
+ {dest} = {source};''')
                rules.append(f'''@copy_{word}_{di}_{si} disable drop_cast@
identifier P, Q;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
''' + '\n|\n'.join(variants) + '\n)\n')
    return '\n'.join(rules).rstrip() + '\n'


if __name__ == '__main__':
    (HERE / 'packed-stores.cocci').write_text(generate())
    (HERE / 'packed-field-copies.cocci').write_text(generate_copies())
