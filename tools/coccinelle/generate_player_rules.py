"""Generate UW1 field rules; offsets are byte offsets, never pointer indices."""
from pathlib import Path

rules = [Path(__file__).with_name('player-object.cocci').read_text()]
fields = [(0,0,0x1ff,'hdr.item_id'), (2,0,0x7f,'hdr.zpos'),
          (2,7,7,'hdr.heading'), (2,10,7,'hdr.ypos'), (2,13,7,'hdr.xpos'),
          (4,0,0x3f,'hdr.quality'), (4,6,0x3ff,'hdr.next'),
          (6,0,0x3f,'hdr.owner'), (6,6,0x3ff,'hdr.link'),
          (0xb,0,0xf,'npc_goal'), (0xb,4,0xff,'npc_gtarg'),
          (0xd,0,0xf,'npc_level'), (0xd,13,1,'npc_talkedto'),
          (0xd,14,3,'npc_attitude'), (0x16,4,0x3f,'npc_yhome'),
          (0x16,10,0x3f,'npc_xhome'), (0x18,0,0x1f,'npc_heading')]
for n,(offset,shift,mask,field) in enumerate(fields):
    variants=[f'*(ushort *)((char *)g_player_object + {hex(offset)})']
    if offset%2==0:
        variants += [f'g_player_object[{hex(offset//2)}]', f'((ushort *)g_player_object)[{hex(offset//2)}]']
    if offset==0: variants+=['*g_player_object', '*(ushort *)g_player_object']
    if shift+mask.bit_length()<=8:
        variants += [f'*(byte *)((char *)g_player_object + {hex(offset)})', f'(byte)((ushort *)g_player_object)[{hex(offset//2)}]']
    if shift>=8:
        bytebase=f'*(byte *)((char *)g_player_object + {hex(offset+1)})'
        bs=shift-8
        patterns_byte=[f'({bytebase} >> {bs}) & {hex(mask)}', f'({bytebase} & {hex(mask<<bs)}) >> {bs}'] if bs else [f'{bytebase} & {hex(mask)}']
        if bs+mask.bit_length()==8: patterns_byte += [f'{bytebase} >> {bs}']
    else: patterns_byte=[]
    patterns=patterns_byte.copy()
    for base in variants:
        if shift:
            patterns += [f'({base} >> {shift}) & {hex(mask)}',
                         f'({base} & {hex(mask<<shift)}) >> {shift}']
            if (mask<<shift)==(0xffff & (0xffff<<shift)):
                patterns += [f'{base} >> {shift}']
        else: patterns += [f'{base} & {hex(mask)}']
    rules += [f'@field_{n}@\ntypedef ushort, byte;\n@@\n(\n'+
              '\n|\n'.join(f'- {p}\n+ g_player_object->{field}' for p in patterns)+'\n)\n']
Path(__file__).with_name('player-fields.cocci').write_text('\n'.join(rules))
# Full byte fields, including assignments. Signed-char reads retain their
# signed interpretation; stores into the byte field retain low eight bits.
byte_fields={8:'npc_hp',9:'full_heading',10:'movement_flags',17:'recent_damage',
             18:'damage_source',19:'motion_flags',20:'attack_pitch',
             21:'animation_flags',24:'heading_flags',25:'npc_ai_flags',26:'npc_whoami'}
for offset,field in byte_fields.items():
    rules += [f'@byte_store_{offset}@\nexpression value;\ntypedef byte;\n@@\n- *(char *)((char *)g_player_object + {hex(offset)}) = value;\n+ g_player_object->{field} = (byte)value;\n']
    variants=[f'*(byte *)((char *)g_player_object + {hex(offset)})',
              f'*(undefined1 *)((char *)g_player_object + {hex(offset)})',
              f'((byte *)g_player_object)[{hex(offset)}]']
    if offset%2==0: variants += [f'(byte)((ushort *)g_player_object)[{hex(offset//2)}]']
    rules += [f'@byte_field_{offset}@\ntypedef byte, undefined1, ushort;\n@@\n(\n'+
              '\n|\n'.join(f'- {p}\n+ g_player_object->{field}' for p in variants)+'\n)\n']
    rules += [f'@signed_byte_{offset}@\n@@\n- *(char *)((char *)g_player_object + {hex(offset)})\n+ (char)g_player_object->{field}\n']
Path(__file__).with_name('player-fields.cocci').write_text('\n'.join(rules))

# After matching individual bitfields, replace remaining full-word accesses.
# These include reads saved into temporaries and masked updates; requiring an
# adjacent bit mask would miss them. Packed members retain byte alignment.
word_fields = {0:'hdr.type_flags', 2:'hdr.position_word', 4:'hdr.chain_word',
               6:'hdr.link_word', 0xb:'goal_word', 0xd:'status_word',
               0xf:'target_word', 0x16:'tile_word'}
for offset, field in word_fields.items():
    variants = [f'*(ushort *)((char *)g_player_object + {hex(offset)})',
                f'*(ushort *)((byte *)g_player_object + {hex(offset)})']
    if offset % 2 == 0:
        variants += [f'((ushort *)g_player_object)[{hex(offset//2)}]']
    if offset == 0:
        variants += ['*(ushort *)g_player_object']
    rules += [f'@word_field_{offset}@\ntypedef ushort, byte;\n@@\n(\n' +
              '\n|\n'.join(f'- {p}\n+ g_player_object->{field}' for p in variants) + '\n)\n']
Path(__file__).with_name('player-fields.cocci').write_text('\n'.join(rules))
