"""Migrate the current 27-byte slot without changing arithmetic units.

The engine also puts projectiles in DAT_0010190c. Common physical byte fields
are safe across both layouts; overlapping goal/coordinate words are rewritten
only inside NPC functions. Remaining word arithmetic is explicitly temporary.
"""
from pathlib import Path

G='DAT_0010190c'
rules=['''@definition@
typedef ushort, uw_mobile_object_t;
@@
- ushort *DAT_0010190c;
+ uw_mobile_object_t *DAT_0010190c;

@global_declaration@
typedef ushort, uw_mobile_object_t;
@@
- extern ushort *DAT_0010190c;
+ extern uw_mobile_object_t *DAT_0010190c;
''']
for off,field in [(8,'npc_hp'),(9,'full_heading'),(10,'movement_flags'),
                  (0x11,'recent_damage'),(0x12,'damage_source'),(0x13,'motion_flags'),
                  (0x14,'attack_pitch'),(0x15,'animation_flags'),(0x18,'heading_flags'),
                  (0x19,'npc_ai_flags'),(0x1a,'npc_whoami')]:
    # byte reads/stores and signed char views retain their original semantics.
    forms=[f'*(byte *)((char *){G} + {off})',
           f'*(undefined1 *)((char *){G} + {off})']
    if off%2==0:
        forms += [f'*(byte *)({G} + {off//2})',
                  f'*(undefined1 *)({G} + {off//2})',
                  f'(byte){G}[{off//2}]']
    rules.append(f'''@byte_{off}@
typedef byte, undefined1;
@@
(
'''+'\n|\n'.join(f'- {form}\n+ {G}->{field}' for form in forms)+'''
)
''')
    rules.append(f'''@signed_byte_{off}@
@@
- *(char *)((char *){G} + {off})
+ *(char *)&{G}->{field}
''')
for index,field in enumerate(['type_flags','position_word','chain_word','link_word']):
    off=2*index
    forms=[f'{G}[{index}]',f'*(ushort *)((char *){G} + {off})']
    if index==0:forms+=[f'*{G}']
    rules.append(f'''@header_word_{index}@
typedef ushort;
@@
(
'''+'\n|\n'.join(f'- {form}\n+ {G}->hdr.{field}' for form in forms)+'''
)
''')
# These words have different meanings when mobile_object_tick is processing
# a projectile. Do not apply the NPC names to that path.
for off,field in [(0xb,'goal_word'),(0xd,'status_word'),(0xf,'target_word'),(0x16,'tile_word')]:
    forms=[f'*(ushort *)((char *){G} + {off})',
           f'*(undefined2 *)((char *){G} + {off})']
    if off%2==0: forms += [f'{G}[{off//2}]']
    rules.append(f'''@npc_word_{off}@
type R;
identifier F =~ "^\\(npc_.*\\|setup_npc_ai_tick_state\\|set_npc_altitude_state\\|refresh_npc_target_delta\\|check_npc_morale_flee\\|initiate_npc_death\\|handle_monster_death\\|compute_pathfind_search_radius\\)$";
typedef ushort, undefined2;
@@
R F(...) {{
<...
(
'''+'\n|\n'.join(f'- {form}\n+ {G}->{field}' for form in forms)+'''
)
...>
}
''')
# Retyping the slot must not scale the remaining ushort indexing by 27.
rules.append('''@remaining_index@
expression I;
typedef ushort;
@@
- DAT_0010190c[I]
+ ((ushort *)DAT_0010190c)[I]

@remaining_offset@
expression I;
typedef ushort;
@@
- DAT_0010190c + I
+ (ushort *)DAT_0010190c + I

@assigned_word_cast@
expression E;
typedef ushort, uw_mobile_object_t;
@@
- DAT_0010190c = (ushort *)E
+ DAT_0010190c = (uw_mobile_object_t *)E
''')
Path(__file__).with_name('current-mobile-object.cocci').write_text('\n'.join(rules))
