"""Read UW1 header/NPC fields from the typed current slot."""
from pathlib import Path

G='DAT_0010190c'
NPC_REGEX=r'^\(npc_.*\|setup_npc_ai_tick_state\|set_npc_altitude_state\|refresh_npc_target_delta\|check_npc_morale_flee\|initiate_npc_death\|handle_monster_death\|compute_pathfind_search_radius\)$'
fields=[(0,'hdr.type_flags',0,0x1ff,'hdr.object_id'),
        (0,'hdr.type_flags',15,1,'hdr.is_quant'),
        (2,'hdr.position_word',0,0x7f,'hdr.zpos'),
        (2,'hdr.position_word',7,7,'hdr.heading'),
        (2,'hdr.position_word',10,7,'hdr.ypos'),
        (2,'hdr.position_word',13,7,'hdr.xpos'),
        (4,'hdr.chain_word',0,0x3f,'hdr.quality'),
        (4,'hdr.chain_word',6,0x3ff,'hdr.next'),
        (6,'hdr.link_word',0,0x3f,'hdr.owner'),
        (6,'hdr.link_word',6,0x3ff,'hdr.link'),
        (0xb,'goal_word',0,15,'npc_goal'),
        (0xb,'goal_word',4,255,'npc_gtarg'),
        (0xb,'goal_word',12,15,'npc_animation_frame'),
        (0xd,'status_word',0,15,'npc_level'),
        (0xd,'status_word',13,1,'npc_talkedto'),
        (0xd,'status_word',14,3,'npc_attitude'),
        (0xf,'target_word',0,63,'npc_target_tile_x'),
        (0xf,'target_word',6,63,'npc_target_tile_y'),
        (0xf,'target_word',12,15,'npc_swing_charge'),
        (0x16,'tile_word',4,63,'npc_yhome'),
        (0x16,'tile_word',10,63,'npc_xhome')]
rules=[]
for i,(off,word,shift,mask,field) in enumerate(fields):
    base=f'{G}->{word}'
    forms = ([f'({base} >> {shift}) & {hex(mask)}',
              f'({base} & {hex(mask<<shift)}) >> {shift}'] if shift else [f'{base} & {hex(mask)}'])
    if shift+mask.bit_length()==16:
        forms += [f'{base} >> {shift}']
    if shift+mask.bit_length()<=8:
        byteforms=[f'*(byte *)((char *){G} + {off})',f'(byte){base}']
        forms += [f'({b} >> {shift}) & {hex(mask)}' if shift else f'{b} & {hex(mask)}' for b in byteforms]
    if shift>=8:
        bs=shift-8
        b=f'*(byte *)((char *){G} + {off+1})'
        forms += [f'({b} >> {bs}) & {hex(mask)}' if bs else f'{b} & {hex(mask)}']
        if bs+mask.bit_length()==8:
            forms += [f'{b} >> {bs}']
    scoped=off>=8
    rules.append(f'''@field_{i}@
{'type R;'+chr(10)+'identifier F =~ "'+NPC_REGEX+'";' if scoped else ''}
typedef byte;
@@
{'R F(...) {'+chr(10)+'<...' if scoped else ''}
(
'''+'\n|\n'.join(f'- {form}\n+ {G}->{field}' for form in forms)+'''
)
'''+('...>\n}\n' if scoped else ''))
Path(__file__).with_name('current-mobile-fields.cocci').write_text('\n'.join(rules))
