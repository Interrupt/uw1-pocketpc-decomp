"""Expose remaining whole header words at proven object pointer sites.

Signed short aliases are deliberately excluded from direct word rewrites:
their reads promote differently, and casting a replacement breaks lvalues.
"""
import json
from pathlib import Path
from generate_header_field_rules import regex

HERE = Path(__file__).resolve().parent
WORDS = ['type_flags', 'position_word', 'chain_word', 'link_word']

def generate(source):
    groups = {}
    for function in source.get('functions', []):
        for role in function['roles']:
            if '**' not in role['type']:
                groups.setdefault((role['name'], role['type']), []).append(function['function'])
    rules = []
    for number, ((name, rawtype), functions) in enumerate(groups.items()):
        for index, field in enumerate(WORDS):
            offset = 2 * index
            expressions = [f'*(ushort *)((char *){name} + {offset})',
                           f'((ushort *){name})[{index}]']
            if offset == 0:
                expressions += [f'*(ushort *){name}']
            if rawtype in ('ushort *', 'unsigned short *', 'const ushort *'):
                expressions += [f'{name}[{index}]']
                if offset == 0:
                    expressions += [f'*{name}']
            if rawtype in ('char *', 'byte *', 'undefined *', 'undefined1 *', 'unsigned char *'):
                expressions += [f'*(ushort *)({name} + {offset})']
            rules.append(f'''@word_{number}_{index}@
type R;
identifier F =~ "{regex(functions)}";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {{
<...
(
''' + '\n|\n'.join(f'- {e}\n+ ((uw_object_hdr_t *){name})->{field}' for e in dict.fromkeys(expressions)) + '''
)
...>
}
''')
    return '\n'.join(rules)

if __name__ == '__main__':
    output = HERE / 'header-words'
    output.mkdir(exist_ok=True)
    for source in json.loads((HERE / 'object-pointer-roles.json').read_text())['sources']:
        patch = generate(source)
        if patch:
            (output / (Path(source['source']).stem + '.cocci')).write_text(patch)
