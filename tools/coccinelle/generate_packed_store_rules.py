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


if __name__ == '__main__':
    (HERE / 'packed-stores.cocci').write_text(generate())
