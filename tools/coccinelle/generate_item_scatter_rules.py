"""Name common-header clone and quantity writes in the item scatter callback.

Exact body matching preserves captured values, source rereads, random calls,
spawn failures and cursor/tile/list callbacks. Active targets and new slots
are distinct whole records; no partially overlapping header copies occur.
"""
from pathlib import Path
from difflib import SequenceMatcher
import re
HERE=Path(__file__).resolve().parent
FUNCTION='complete_use_item_scatter_spawn'
ORIGINAL="""void complete_use_item_scatter_spawn(short *target, int clicked, int confirmed)
{
  int uw_ord2005_rem_168 = 0;
  undefined1 uVar1;
  byte bVar2;
  ushort uVar3;
  short sVar4;
  undefined4 uVar5;
  int iVar6;
  ushort *found_item;
  char *iVar7;  /* was `int` -- truncated tilemap_lookup's real `void *` return */
  ushort *puVar8;
  uint uVar9;
  uint uVar10;
  uint extraout_r1;
  uint uVar11;

  pop_cursor_icon(3);
  g_selected_object = 0;
  g_cursor_holding_state = 0;
  if ((clicked != 0) && (confirmed == 0)) {
    uVar5 = encode_object_slot_index(target);
    found_item = find_object_by_encoded_slot_in_chain((char *)g_player_object + 6,1,uVar5);
    if (found_item == 0) {
      uVar11 = (int)*target & 0x1ff;
      if (((ushort)uVar11 < 0x153) || (0x156 < (ushort)uVar11)) {
        print_scroll_message_by_id(0x84);
      }
      else {
        print_scroll_message_by_id(0x87);
        iVar7 = (char *)tilemap_lookup((int)DAT_002020a0,(int)DAT_002020a4);
        sVar4 = rand_below(2);
        iVar6 = ((int)sVar4 - uVar11) + 0x156;
        while( true ) {
          iVar6 = iVar6 * 0x10000 >> 0x10;
          if ((iVar6 < 1) || (puVar8 = (ushort *)spawn_new_object(1,0), puVar8 == (ushort *)0x0)) break;
          ((uw_object_hdr_t *)puVar8)->type_flags_low = (byte)(char)*target;
          ((uw_object_hdr_t *)puVar8)->type_flags_high = *(undefined1 *)((char *)target + 1);
          ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)(char)target[1];
          ((uw_object_hdr_t *)puVar8)->position_word_high = *(undefined1 *)((char *)target + 3);
          ((uw_object_hdr_t *)puVar8)->chain_word_low = (byte)(char)target[2];
          ((uw_object_hdr_t *)puVar8)->chain_word_high = *(undefined1 *)((char *)target + 5);
          ((uw_object_hdr_t *)puVar8)->link_word_low = (byte)(char)target[3];
          ((uw_object_hdr_t *)puVar8)->link_word_high = *(undefined1 *)((char *)target + 7);
          sVar4 = rand_below(2);
          uVar9 = uVar11 + (int)sVar4 + 1;
          if (0x156 < (int)(uVar9 * 0x10000) >> 0x10) {
            uVar9 = 0x10;
          }
          uVar10 = (((uw_object_hdr_t *)puVar8)->type_flags ^ uVar9) & 0x1ff ^ (uint)((uw_object_hdr_t *)puVar8)->type_flags;
          uVar1 = (undefined1)uVar10;
          ((uw_object_hdr_t *)puVar8)->type_flags_low = uVar1;
          bVar2 = (byte)(uVar10 >> 8);
          ((uw_object_hdr_t *)puVar8)->type_flags_high = bVar2;
          if ((short)uVar9 == 0x10) {
            ((uw_object_hdr_t *)puVar8)->type_flags_low = uVar1;
            ((uw_object_hdr_t *)puVar8)->type_flags_high = bVar2 | 0x80;
            uVar5 = ce_rand();
            uw_ord2005_rem_168 = ((int)(uVar5)) % (6);
            uVar9 = (uw_ord2005_rem_168 & 0xffff) + 3;
            ((uw_object_hdr_t *)puVar8)->link_word_low = ((uw_object_hdr_t *)puVar8)->owner ^ (char)uVar9 * '@';
            ((uw_object_hdr_t *)puVar8)->link_word_high = (byte)(char)(uVar9 >> 2);
          }
          uVar3 = target[1];
          place_object_in_world((uint)(uVar3 >> 0xd) + DAT_002020a0 * 8,
                       ((uVar3 & 0x1c00) >> 10) + DAT_002020a4 * 8,uVar3 & 0x7f,puVar8,6,0);
          iVar6 = iVar6 + -1;
        }
        discard_misplaced_object(iVar7 + 2,target,1);
        set_pending_update_flags(2);
      }
    }
  }
}"""


def changes():
    a='((uw_object_hdr_t *)puVar8)->'
    b='((uw_object_hdr_t *)target)->'
    result=[('typed_destination','ushort *puVar8;','uw_object_hdr_t *puVar8;'),
        ('typed_allocation','puVar8 = (ushort *)spawn_new_object(1,0)','puVar8 = spawn_new_object(1,0)'),
        ('typed_null','puVar8 == (ushort *)0x0','puVar8 == (uw_object_hdr_t *)0x0'),
        ('target_id','(int)*target & 0x1ff',b+'object_id')]
    for field,offset in [('type_flags',0),('position_word',2),('chain_word',4),('link_word',6)]:
        low='*target' if offset==0 else f'target[{offset//2}]'
        result.append(('copy_'+field,
            f'{a}{field}_low = (byte)(char){low};\n{a}{field}_high = *(undefined1 *)((char *)target + {offset+1});',
            f'{a}{field} = {b}{field};'))
    result.extend([
        ('clone_id',f'{a}type_flags_low = uVar1;\nbVar2 = (byte)(uVar10 >> 8);\n{a}type_flags_high = bVar2;',
         f'bVar2 = (byte)(uVar10 >> 8);\n{a}object_id = uVar10 & 0x1ff;'),
        ('clone_quantity_flag',f'{a}type_flags_low = uVar1;\n{a}type_flags_high = bVar2 | 0x80;',f'{a}is_quant = 1;'),
        ('clone_quantity',f"{a}link_word_low = {a}owner ^ (char)uVar9 * '@';\n{a}link_word_high = (byte)(char)(uVar9 >> 2);",
         f'{a}link = uVar9 & 0x3ff;'),
        ('placement', '''uVar3 = target[1];
place_object_in_world((uint)(uVar3 >> 0xd) + DAT_002020a0 * 8,
((uVar3 & 0x1c00) >> 10) + DAT_002020a4 * 8,uVar3 & 0x7f,puVar8,6,0);''',
         f'''uVar3 = {b}position_word;
place_object_in_world({b}xpos + DAT_002020a0 * 8,
{b}ypos + DAT_002020a4 * 8,{b}zpos,puVar8,6,0);'''),
    ])
    return result


def converted():
    final=ORIGINAL
    for key,before,after in changes():
        if '\n' in before:
            pattern=re.compile(r'(?m)^([ \t]*)'+r'\s*'.join(re.escape(line) for line in before.splitlines()))
            final,count=pattern.subn(lambda m:m[1]+after.replace('\n','\n'+m[1]),final)
        else: final,count=re.subn(re.escape(before),lambda m:after,final)
        assert count==1,key
    return final.replace('((uw_object_hdr_t *)puVar8)->','puVar8->')


def generate():
    old,new=ORIGINAL.splitlines(),converted().splitlines()
    patch=[]
    for tag,i,j,k,l in SequenceMatcher(a=old,b=new,autojunk=False).get_opcodes():
        if tag=='equal': patch.extend(' '+line if line.strip() else '' for line in old[i:j])
        else:
            patch.extend('- '+line if line else '-' for line in old[i:j])
            patch.extend('+ '+line if line else '+' for line in new[k:l])
    return ('@item_scatter_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@\n'
        'typedef byte, ushort, uint, undefined1, undefined4, uw_object_hdr_t;\n@@\n'+'\n'.join(patch)+'\n')


if __name__=='__main__':
    (HERE/'item-scatter-fields.cocci').write_text(generate())
