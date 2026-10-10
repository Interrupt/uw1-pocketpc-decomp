"""Generate ARM-proven offset repairs for two isolated combat contexts.

Apply only with apply_npc_combat_byte_offsets.py: these member remappings
repair earlier doubled offsets, and must never run over unrelated functions.
ARM FUN_00031214/00031a94 use BYTE offsets +2/+9/+0xb/+0xc/+0x13..0x19.
"""
from pathlib import Path
HERE=Path(__file__).resolve().parent
rules=['/* Context-limited patch: use apply_npc_combat_byte_offsets.py. */']
repairs={'hdr.chain_word_low':'hdr.position_word_low',
         'hdr.chain_word':'hdr.position_word',
         'hdr.link_word_low':'hdr.position_word_high',
         'tile_word_low':'goal_word_low','tile_word':'goal_word',
         'damage_source':'full_heading','heading_flags':'goal_word_high',
         'npc_path_slot':'npc_goal'}
for n,(old,new) in enumerate(repairs.items()):
    rules.append(f'@member_{n}@\n@@\n- DAT_0010190c->{old}\n+ DAT_0010190c->{new}\n')
rules.append('''@byte_boundary@
typedef ushort;
expression E;
@@
- (ushort *)DAT_0010190c + E
+ (char *)DAT_0010190c + E
''')
for local in ['iVar7_rec','iVar2']:
    rules.append(f'''@{local}_type@
typedef uw_mobile_object_t;
@@
- char *{local};
+ uw_mobile_object_t *{local};

@{local}_assignment@
@@
- {local} = (char *)DAT_0010190c;
+ {local} = DAT_0010190c;

@{local}_goal_store@
@@
- *(char *)({local} + 0xb)
+ {local}->goal_word_low

@{local}_heading@
typedef byte;
@@
- *(byte *)({local} + 9)
+ {local}->full_heading
''')
(HERE/'npc-combat-byte-offsets.cocci').write_text('\n'.join(rules))
