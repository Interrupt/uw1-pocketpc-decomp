"""Keep UW1 packed chain-word parameters distinct from object pointers."""
from pathlib import Path
rules=[]
for fn, typ in [('resolve_object_link', 'ushort *'),
                ('find_object_by_encoded_slot_in_chain', 'ushort *'),
                ('find_object_in_chain', 'ushort **')]:
    for kind, ending in [('definition', ' { ... }'), ('prototype', ';')]:
        rules.append(f'''@{fn}_{kind}@
identifier P;
parameter list rest;
typedef uw_object_hdr_t, ushort;
@@
- uw_object_hdr_t *{fn}(void *P, rest)
+ uw_object_hdr_t *{fn}({typ}P, rest)
 {ending}
''')
    if fn == 'resolve_object_link':
        for kind, ending in [('definition', ' { ... }'), ('prototype', ';')]:
            rules.append(f'''@{fn}_single_{kind}@
identifier P;
typedef uw_object_hdr_t, ushort;
@@
- uw_object_hdr_t *{fn}(void *P)
+ uw_object_hdr_t *{fn}(ushort *P)
 {ending}
''')
Path(__file__).with_name('object-link-interfaces.cocci').write_text('\n'.join(rules))
