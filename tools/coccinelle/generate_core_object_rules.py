"""Typed UW1 object receivers; packed link cursors retain their word units."""
from pathlib import Path

rules = []
roles = {
    'find_object_in_chain': [('puVar1', 'ushort'), ('puVar2', 'ushort')],
    'find_object_by_encoded_slot_in_chain': [('iVar3', 'byte'), ('iVar4', 'ushort')],
    'find_object_in_world': [('puVar6', 'ushort')],
    'sum_container_weight': [('puVar2', 'ushort')],
    'discard_container_contents': [('puVar1', 'ushort'), ('container', 'ushort')],
    'try_empty_container': [('container', 'ushort')],
    'objects_can_stack': [('object_a', 'ushort'), ('object_b', 'ushort')],
}
for function, names in roles.items():
    for name, old in names:
        prefix = function + '_' + name
        rules.append(f'''@{prefix}_declaration@
type R;
typedef {old}, uw_object_hdr_t;
@@
R {function}(...) {{
<...
- {old} *{name};
+ uw_object_hdr_t *{name};
...>
}}
''')
        rules.append(f'''@{prefix}_casts@
type R;
expression E;
typedef {old}, uw_object_hdr_t;
@@
R {function}(...) {{
<...
- {name} = ({old} *)E
+ {name} = E
...>
}}
''')
        if old == 'ushort':
            for number, field in enumerate(['type_flags', 'position_word', 'chain_word', 'link_word']):
                alternatives = [f'{name}[{number}]']
                if number == 0:
                    alternatives.append('*' + name)
                rules.append(f'''@{prefix}_word_{number}@
type R;
typedef uw_object_hdr_t;
@@
R {function}(...) {{
<...
(
''' + '\n|\n'.join(f'- {expr}\n+ {name}->{field}' for expr in alternatives) + '''
)
...>
}
''')
            for number, field in [(2, 'chain_word'), (3, 'link_word')]:
                rules.append(f'''@{prefix}_link_{number}@
type R;
@@
R {function}(...) {{
<...
- {name} + {number}
+ &{name}->{field}
...>
}}
''')
        else:
            for offset, field in [(4, 'chain_word'), (6, 'link_word')]:
                rules.append(f'''@{prefix}_byteword_{offset}@
type R;
typedef ushort;
@@
R {function}(...) {{
<...
- *(ushort *)({name} + {offset})
+ {name}->{field}
...>
}}
''')
                rules.append(f'''@{prefix}_bytelink_{offset}@
type R;
typedef ushort;
@@
R {function}(...) {{
<...
- (ushort *)({name} + {offset})
+ &{name}->{field}
...>
}}
''')
            rules.append(f'''@{prefix}_quantity@
type R;
typedef byte;
@@
R {function}(...) {{
<...
- *(byte *)({name} + 1) & 0x80
+ ({name}->is_quant << 7)
...>
}}
''')
        rules.append(f'''@{prefix}_header_cast@
type R;
typedef uw_object_hdr_t;
@@
R {function}(...) {{
<...
- (uw_object_hdr_t *){name}
+ {name}
...>
}}
''')
        for field in ['type_flags', 'position_word', 'chain_word', 'link_word',
                      'object_id', 'owner', 'link', 'quality', 'next', 'is_quant']:
            rules.append(f'''@{prefix}_parenthesized_{field}@
type R;
@@
R {function}(...) {{
<...
- ({name})->{field}
+ {name}->{field}
...>
}}
''')
        rules.append(f'''@{prefix}_null@
type R;
typedef ushort;
@@
R {function}(...) {{
<...
- {name} != (ushort *)0x0
+ {name} != NULL
...>
}}
''')
        rules.append(f'''@{prefix}_null_equal@
type R;
typedef ushort;
@@
R {function}(...) {{
<...
- {name} == (ushort *)0x0
+ {name} == NULL
...>
}}
''')
        for operator in ['==', '!=']:
            rules.append(f'''@{prefix}_quantity_{'zero' if operator == '==' else 'nonzero'}@
type R;
@@
R {function}(...) {{
<...
- ({name}->type_flags & 0x8000) {operator} 0
+ {name}->is_quant {operator} 0
...>
}}
''')
        for packed, mask, field in [('chain_word', '0xffc0', 'next'),
                                     ('link_word', '0xffc0', 'link')]:
            for operator in ['==', '!=']:
                rules.append(f'''@{prefix}_{field}_{'zero' if operator == '==' else 'nonzero'}@
type R;
@@
R {function}(...) {{
<...
- ({name}->{packed} & {mask}) {operator} 0
+ {name}->{field} {operator} 0
...>
}}
''')
        for shift, mask in [(6, 7), (4, 3)]:
            rules.append(f'''@{prefix}_class_{shift}@
type R;
@@
R {function}(...) {{
<...
- {name}->type_flags >> {shift} & {mask}
+ {name}->object_id >> {shift} & {mask}
...>
}}
''')
        for packed, mask, field in [('type_flags', '0x1ff', 'object_id'),
                                     ('chain_word', '0x3f', 'quality'),
                                     ('link_word', '0x3f', 'owner')]:
            rules.append(f'''@{prefix}_mask_{field}@
type R;
typedef byte;
@@
R {function}(...) {{
<...
(
- {name}->{packed} & {mask}
+ {name}->{field}
|
- (byte){name}->{packed} & {mask}
+ {name}->{field}
)
...>
}}
''')
rules.append('''@null_chain_return@
typedef ushort;
@@
uw_object_hdr_t *find_object_in_chain(...) {
<...
- return (ushort *)0x0;
+ return NULL;
...>
}
''')
Path(__file__).with_name('core-object-receivers.cocci').write_text('\n'.join(rules))
