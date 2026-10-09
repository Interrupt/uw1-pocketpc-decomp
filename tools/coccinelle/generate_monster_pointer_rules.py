"""Type the current UW1 critter template, preserving signed byte views."""
from pathlib import Path
from generate_monster_property_rules import FIELDS
G='DAT_00101404'
rules=['''@definition@
typedef uw_monster_type_props_t;
@@
- char *DAT_00101404;
+ uw_monster_type_props_t *DAT_00101404;

@prototype@
typedef uw_monster_type_props_t;
@@
- extern char *DAT_00101404;
+ extern uw_monster_type_props_t *DAT_00101404;
''']
for off,field in FIELDS.items():
    rules.append(f'''@unsigned_{off}@
typedef byte, undefined1;
@@
(
- *(byte *)({G} + {off})
+ {G}->{field}
|
- *(undefined1 *)({G} + {off})
+ {G}->{field}
)

@signed_{off}@
@@
(
- *(char *)({G} + {off})
+ *(char *)&{G}->{field}
|
- {G}[{off}]
+ *(char *)&{G}->{field}
)
''')
for off,field in [(34,'item_loot[0]'),(36,'item_loot[1]'),(40,'experience')]:
    rules.append(f'''@word_{off}@
typedef ushort, undefined2;
@@
(
- *(ushort *)({G} + {off})
+ {G}->{field}
|
- *(undefined2 *)({G} + {off})
+ {G}->{field}
)
''')
for off,field in [(19,'skill'),(20,'damage'),(21,'probability')]:
    rules.append(f'''@attack_{off}@
expression E;
typedef byte;
@@
(
- *(byte *)(E * 3 + {G} + {off})
+ {G}->attacks[E].{field}
|
- *(byte *)({G} + E * 3 + {off})
+ {G}->attacks[E].{field}
)
''')
rules.append('''@row_address_assignment@
expression E;
@@
- DAT_00101404 = &DAT_001007d0 + E
+ DAT_00101404 = &g_monster_type_props[(E) / 0x30]

@byte_row_assignment@
expression E;
typedef byte;
@@
- DAT_00101404 = (char *)((byte *)g_monster_type_props) + E
+ DAT_00101404 = &g_monster_type_props[(E) / 0x30]

@remaining_index@
expression E;
@@
- DAT_00101404[E]
+ ((char *)DAT_00101404)[E]

@remaining_offset@
expression E;
@@
- DAT_00101404 + E
+ (char *)DAT_00101404 + E
''')
Path(__file__).with_name('monster-template-pointer.cocci').write_text('\n'.join(rules))
