"""Name player tile/fine coordinates, frame and headings; keep scalar snapshots."""
from pathlib import Path
from generate_projectile_spawn_rules import rule
HERE = Path(__file__).resolve().parent
SITES = {'commit_player_move': 'player.c', 'set_player_tile_position': 'player.c',
         'begin_directional_move': 'input.c'}


def generate():
    parts = []
    h = 'g_player_object->hdr.'
    p = 'g_player_object->'
    def add(fn, key, before, after, meta=''):
        parts.append(rule(fn+'_'+key, before, after, meta, function=fn))
    for fn in ['commit_player_move', 'begin_directional_move']:
        for field, mask, shift in [('xpos',0x1fff,13), ('ypos',0xe3ff,10)]:
            add(fn,field,f'''V = {h}position_word & {hex(mask)};
{h}position_word_low = (byte)(char)V;
{h}position_word_high = (byte)(V >> 8) | (byte)((uint)(((int)(short)W >> 5) << {hex(shift)}) >> 8);''',
                f'''V = {h}position_word & {hex(mask)};
{h}{field} = (W >> 5) & 7;''','identifier V, W;')
        add(fn,'tile_x',f'''V = {p}tile_word & 0x3ff;
{p}tile_word_low = (byte)(char)V;
{p}tile_word_high = (byte)(V >> 8) | (byte)((uint)(((int)(short)W >> 8) << 10) >> 8);''',
            f'''V = {p}tile_word & 0x3ff;
{p}tile_x = (W >> 8) & 0x3f;''','identifier V, W;')
        add(fn,'tile_y',f'''V = {p}tile_word & 0xfc0f | ((int)(short)(DAT_00204882 & 0x3f00) >> 8) << 4;
{p}tile_word = (ushort)V;''',f'''{p}tile_y = ((ushort)DAT_00204882 >> 8) & 0x3f;
V = {p}tile_word;''','identifier V;')
        add(fn,'heading',f'''V = {h}position_word & 0xfc7f | ((int)(short)DAT_00201c70 >> 0xd & 7U) << 7;
{h}position_word = (ushort)V;''',f'''{h}heading = ((ushort)DAT_00201c70 >> 13) & 7;
V = {h}position_word;''','identifier V;')
        add(fn,'fine_heading',f'''{p}heading_flags = ((byte)(DAT_00201c70 >> 8) ^ {p}heading_flags) & 0x1f ^ {p}heading_flags;''',
            f'{p}fine_heading = ((ushort)DAT_00201c70 >> 8) & 0x1f;')
        add(fn,'frame',f'''H = {p}goal_word & 0xfff;
{p}goal_word_low = (byte)(char)H;
{p}goal_word_high = (byte)(H >> 8) | (byte)(((V & 0xc0) << 6) >> 8);''',f'''H = {p}goal_word & 0xfff;
{p}npc_animation_frame = (V >> 6) & 3;''','identifier H, V;')
    for fn in ['commit_player_move','set_player_tile_position']:
        add(fn,'zpos',f'''V = {h}position_word & 0xff80;
{h}position_word_low = (byte)V | (byte)((int)(((int)DAT_00204884 & 0x3f8U) << 0x10) >> 0x13);
{h}position_word_high = (byte)(char)(V >> 8);''',f'''V = {h}position_word & 0xff80;
{h}zpos = ((ushort)DAT_00204884 >> 3) & 0x7f;''','identifier V;')
    add('begin_directional_move','step_z',f'''uVar1 = {h}position_word;
bVar2 = (byte)uVar1;
{h}position_word_low = (bVar2 ^ (byte)DAT_00202c30) & 0x7f ^ bVar2;
{h}position_word_high = (byte)(char)((ushort)uVar1 >> 8);''',f'''uVar1 = {h}position_word;
bVar2 = (byte)uVar1;
{h}zpos = (byte)DAT_00202c30 & 0x7f;''')
    fn = 'set_player_tile_position'
    add(fn,'tile_x',f'''V = {p}tile_word & 0x3ff;
{p}tile_word_low = (byte)(char)V;
{p}tile_word_high = (byte)(V >> 8) | (byte)(((tile_x & 0x3f) << 10) >> 8);''',f'''V = {p}tile_word & 0x3ff;
{p}tile_x = tile_x & 0x3f;''','identifier V;')
    add(fn,'tile_y_alias',f'{p}npc_yhome = tile_y & 0x3f;',f'{p}tile_y = tile_y & 0x3f;')
    for key,mask,value,field in [('xpos',0x1fff,0x60,'xpos'),('ypos',0xefff,0xc,'ypos')]:
        add(fn,key,f'''V = {h}position_word & {hex(mask)};
{h}position_word_low = (byte)(char)V;
{h}position_word_high = (byte)(V >> 8) | {hex(value)};''',f'''V = {h}position_word & {hex(mask)};
{h}{field} = 3;''','identifier V;')
    add(fn,'chain_clear',f'''V = {h}next << 6;
{h}chain_word = (ushort)V;
{h}chain_word_low = {h}quality;
{h}chain_word_high = 0;''',f'''V = {h}next << 6;
{h}chain_word = 0;''','identifier V;')
    return '\n'.join(parts)

if __name__ == '__main__':
    (HERE/'player-position-fields.cocci').write_text(generate())
