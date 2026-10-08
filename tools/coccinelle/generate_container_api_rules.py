"""Retype UW1 container object parameters, leaving packed link words alone."""
from pathlib import Path
rules=[]
for fn, old in [('discard_container_contents','ushort'), ('try_empty_container','ushort'),
                ('place_rune_in_bag','short')]:
    for kind, tail in [('definition','{ ... }'), ('prototype',';')]:
        arguments = ', rest' if fn != 'place_rune_in_bag' else ''
        rules.append(f'''@{fn}_{kind}@
type R;
identifier P;
{'parameter list rest;' if arguments else ''}
typedef ushort, uw_object_hdr_t;
@@
- R {fn}({old} *P{arguments})
+ R {fn}(uw_object_hdr_t *P{arguments})
 {tail}
''')
rules.append('''@rune_id@
type R;
@@
R place_rune_in_bag(...) {
<...
- (int)*rune_object & 0x1ffU
+ rune_object->item_id
...>
}
''')
rules.append('''@container_contents_word@
type R;
typedef byte;
@@
R discard_container_contents(...) {
<...
- *((byte *)container + 1) & 0x80
+ (container->is_quant << 7)
...>
}
''')
for kind, tail in [('definition','{ ... }'), ('prototype',';')]:
    rules.append(f'''@stack_{kind}@
type R;
identifier A, B;
typedef ushort, uw_object_hdr_t;
@@
- R objects_can_stack(ushort *A, ushort *B)
+ R objects_can_stack(const uw_object_hdr_t *A, const uw_object_hdr_t *B)
 {tail}
''')
Path(__file__).with_name('container-object-interfaces.cocci').write_text('\n'.join(rules))
