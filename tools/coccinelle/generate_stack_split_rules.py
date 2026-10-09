"""Name object-header clone and quantity accesses in stack splitting.

Exact original bodies retain scalar captures, allocator mutations, chain
callbacks, slot/UI bookkeeping and legacy container metadata walks.
"""
from pathlib import Path
from difflib import SequenceMatcher
import re
HERE=Path(__file__).resolve().parent
EXTRACT='extract_matching_object_from_slot'
REDUCE='reduce_object_count'
ORIGINALS={}
ORIGINALS['reduce_object_count']="""int reduce_object_count(ushort *stack_object, uint amount)
{
  short sVar1;
  ushort uVar2;
  int iVar3;
  undefined4 uVar4;
  undefined1 *puVar5;
  undefined1 *puVar6;
  int iVar7;
  int iVar8;
  uint uVar9;
  char *pObj;

  /* Dropped argument: calculate_object_weight dereferences its own declared stack_object immediately --
     called bare here, same idiom as this whole session's other fixes. */
  iVar3 = calculate_object_weight((uw_object_hdr_t *)stack_object);
  uVar4 = encode_object_slot_index(stack_object);
  iVar7 = 0;
  do {
    if ((uint)(*(ushort *)(&g_equipped_items + iVar7 * 2) >> 6) == (int)(short)uVar4) break;
    iVar7 = (iVar7 + 1) * 0x10000 >> 0x10;
  } while (iVar7 < 0x1c);
  iVar8 = (int)(short)iVar7;
  sVar1 = (short)amount;
  if (iVar8 < 0x1c) {
    extract_and_refresh_slot_item(0xffffffff,0xffffffff,0xffffffff,iVar7,sVar1);
    if (iVar8 < 0x13) {
      redraw_inventory_widget((int)(char)(&g_backpack_slot_to_widget)[iVar8]);
    }
    else {
      repopulate_container_grid_slots();
      refresh_container_view();
      /* Was `for (iVar7 = g_current_container_record; ...)` -- truncated g_current_container_record
         (a real char* global) into a 32-bit int, then rebuilt a bogus "next" address out of raw
         bytes at iVar7+4..+7 instead of resolving the object's real next-link via... */
      for (pObj = g_current_container_record; pObj != NULL;
          pObj = (*(ushort *)(pObj + 4) & 0xffc0) == 0 ? NULL :
                 (char *)resolve_object_link((ushort *)(pObj + 4))) {
        iVar8 = *(short *)(pObj + 10) - iVar3;
        *(char *)(pObj + 10) = (char)iVar8;
        *(char *)(pObj + 0xb) = (char)((uint)iVar8 >> 8);
      }
    }
  }
  else {
    puVar5 = (undefined1 *)find_object_by_encoded_slot_in_chain((char *)g_player_object + 6,1,uVar4);
    if (puVar5 == (undefined1 *)0x0) {
      return 0;
    }
    if (((0 < sVar1) && (((uw_object_hdr_t *)puVar5)->is_quant != 0)) && ((((uw_object_hdr_t *)puVar5)->link & 0x200) == 0)) {
      uVar2 = ((uw_object_hdr_t *)puVar5)->link;
      if ((1 < uVar2) && (sVar1 < (short)uVar2)) {
        puVar6 = (undefined1 *)alloc_object_slot(0);
        ((uw_object_hdr_t *)puVar6)->type_flags = ((uw_object_hdr_t *)puVar5)->type_flags;
        ((uw_object_hdr_t *)puVar6)->position_word = ((uw_object_hdr_t *)puVar5)->position_word;
        ((uw_object_hdr_t *)puVar6)->chain_word = ((uw_object_hdr_t *)puVar5)->chain_word;
        ((uw_object_hdr_t *)puVar6)->link_word = ((uw_object_hdr_t *)puVar5)->link_word;
        uVar9 = (amount & 0xffff) * 0x3ff + (uint)uVar2;
        ((uw_object_hdr_t *)puVar6)->link_word_low = ((uw_object_hdr_t *)puVar6)->owner ^ (char)uVar9 * '@';
        ((uw_object_hdr_t *)puVar6)->link_word_high = (char)((uVar9 & 0x3ffffff) >> 2);
        ((uw_object_hdr_t *)puVar5)->link_word_low = ((uw_object_hdr_t *)puVar5)->owner | (byte)((amount & 0x3ff) << 6);
        ((uw_object_hdr_t *)puVar5)->link_word_high = (char)((amount << 0x16) >> 0x18);
        object_list_insert_head(puVar5 + 4,puVar6);
      }
    }
    object_list_unlink(DAT_002046b4,puVar5);
    g_player_carry_weight = g_player_carry_weight - (short)iVar3;
    /* This else-branch (reached when the object isn't found among the 28
       direct/open-container-borrowed slots at all, e.g. nested two containers deep) unlinked the
       object but... */
    repopulate_container_grid_slots();
    refresh_container_view();
    redraw_inventory_widget(0x13);
    refresh_player_equipment_effects();
  }
  return 1;
}"""
ORIGINALS['extract_matching_object_from_slot']="""ushort *extract_matching_object_from_slot(int category, int subcategory, int quality, short slot, ushort flag)
{
  ushort uVar1;
  short sVar2;
  ushort *puVar3;
  int iVar4;
  char *iVar5;
  uint uVar6;
  ushort uVar7;
  uint uVar8;
  int iVar9;
  byte *pbVar10;
  byte *pbVar11;
  char *local_28;
\x20\x20
  iVar4 = (int)slot;
  pbVar11 = &g_equipped_items + iVar4 * 2;
  pbVar10 = (byte *)0x0;
  puVar3 = (ushort *)resolve_object_link(pbVar11);
  if (puVar3 != (ushort *)0x0) {
    if (iVar4 < 0x13) {
      local_28 = (char *)g_player_object;
    }
    else {
      /* Was `resolve_object_link(g_current_container_record + 8)` -- g_current_container_record is
         a small (12-byte) ce_malloc heap allocation, nowhere near the object arena buffer
         resolve_object_link's own bounds guard checks against (see its own comment)... */
      local_28 = resolve_object_link(&g_current_container_link);
    }
    uVar6 = (uint)(short)category;
    uVar7 = (ushort)subcategory;
    uVar1 = (ushort)quality;
    if ((((((int)uVar6 < 0) && ((short)uVar7 < 0)) && ((short)uVar1 < 0)) ||
        (((((int)uVar6 < 0 || ((*puVar3 >> 6 & 7) == uVar6)) &&
          (((short)uVar7 < 0 || (((byte)((byte)*puVar3 >> 4) & 3) == uVar7)))) &&
         (((short)uVar1 < 0 || (((byte)*puVar3 & 0xf) == uVar1)))))) ||
       (puVar3 = (ushort *)find_object_in_link_chain(category,subcategory,quality,&local_28), puVar3 != (ushort *)0x0)
       ) {
      if (((flag != 0) && ((*puVar3 & 0x8000) != 0)) && ((puVar3[3] & 0x8000) == 0)) {
        uVar7 = puVar3[3] >> 6;
        if ((1 < uVar7) && ((short)flag < (short)uVar7)) {
          pbVar10 = (byte *)alloc_object_slot(0);
          ((uw_object_hdr_t *)pbVar10)->type_flags_low = (byte)*puVar3;
          ((uw_object_hdr_t *)pbVar10)->type_flags_high = *(byte *)((char *)puVar3 + 1);
          ((uw_object_hdr_t *)pbVar10)->position_word_low = (byte)puVar3[1];
          ((uw_object_hdr_t *)pbVar10)->position_word_high = *(byte *)((char *)puVar3 + 3);
          ((uw_object_hdr_t *)pbVar10)->chain_word_low = (byte)puVar3[2];
          ((uw_object_hdr_t *)pbVar10)->chain_word_high = *(byte *)((char *)puVar3 + 5);
          ((uw_object_hdr_t *)pbVar10)->link_word_low = (byte)puVar3[3];
          ((uw_object_hdr_t *)pbVar10)->link_word_high = *(byte *)((char *)puVar3 + 7);
          uVar6 = (uint)flag;
          uVar8 = uVar6 * 0x3ff + (uint)uVar7;
          ((uw_object_hdr_t *)pbVar10)->link_word_low = ((uw_object_hdr_t *)pbVar10)->owner ^ (char)uVar8 * '@';
          ((uw_object_hdr_t *)pbVar10)->link_word_high = (byte)((uVar8 & 0x3ffffff) >> 2);
          *(byte *)(puVar3 + 3) = (byte)puVar3[3] & 0x3f | (byte)((uVar6 & 0x3ff) << 6);
          *(byte *)((char *)puVar3 + 7) = (byte)((uVar6 << 0x16) >> 0x18);
          object_list_insert_head(puVar3 + 2,pbVar10);
        }
      }
      if ((local_28 == (char *)g_player_object) || (0x13 < iVar4)) {
        if (pbVar10 == (byte *)0x0) {
          uVar7 = *pbVar11 & 0x3f;
        }
        else {
          sVar2 = encode_object_slot_index(pbVar10);
          uVar7 = *pbVar11 & 0x3f | sVar2 << 6;
        }
        *pbVar11 = (byte)uVar7;
        (&DAT_00202951)[iVar4 * 2] = (char)(uVar7 >> 8);
      }
      object_list_unlink(local_28 + 6,puVar3);
      iVar4 = calculate_object_weight((uw_object_hdr_t *)puVar3);
      g_player_carry_weight = g_player_carry_weight - (short)iVar4;
      if (g_current_container_record == 0) {
        return puVar3;
      }
      sVar2 = encode_object_slot_index(local_28);
      if ((uint)(*(ushort *)(g_current_container_record + 8) >> 6) != (int)sVar2) {
        return puVar3;
      }
      sVar2 = encode_object_slot_index(puVar3);
      iVar9 = 0x14;
      do {
        if ((uint)(*(ushort *)(&g_equipped_items + iVar9 * 2) >> 6) == (int)sVar2) {
          if (pbVar10 == (byte *)0x0) {
            uVar6 = 0;
          }
          else {
            sVar2 = encode_object_slot_index(pbVar10);
            uVar6 = (uint)sVar2;
          }
          iVar9 = (int)(short)iVar9;
          (&g_equipped_items)[iVar9 * 2] =
               (&g_equipped_items)[iVar9 * 2] & 0x3f | (byte)((uVar6 & 0x3ff) << 6);
          iVar5 = g_current_container_record;
          (&DAT_00202951)[iVar9 * 2] = (char)((uVar6 << 0x16) >> 0x18);
          /* Legacy truncated "prev" walk -- same fix as
             place_object_in_backpack_slot's sibling copy above (search
             "still broken for genuine container nesting"). */
          for (; iVar5 != 0; iVar5 = *(char **)(iVar5 + 0x14)) {
            iVar9 = *(short *)(iVar5 + 10) - iVar4;
            *(char *)(iVar5 + 10) = (char)iVar9;
            *(char *)(iVar5 + 0xb) = (char)((uint)iVar9 >> 8);
          }
          return puVar3;
        }
        iVar9 = (iVar9 + 1) * 0x10000 >> 0x10;
      } while (iVar9 < 0x1c);
      return puVar3;
    }
  }
  return (ushort *)0x0;
}"""


def changes():
    result=[]
    def add(function,key,before,after):
        result.append(dict(function=function,key=key,before=before,after=after))
    a='((uw_object_hdr_t *)pbVar10)->'
    b='((uw_object_hdr_t *)puVar3)->'
    add(EXTRACT,'typed_source','ushort *puVar3;','uw_object_hdr_t *puVar3;')
    add(EXTRACT,'typed_source_resolve','puVar3 = (ushort *)resolve_object_link(pbVar11)',
        'puVar3 = resolve_object_link(pbVar11)')
    add(EXTRACT,'typed_source_search','puVar3 = (ushort *)find_object_in_link_chain',
        'puVar3 = (uw_object_hdr_t *)find_object_in_link_chain')
    add(EXTRACT,'typed_source_null','puVar3 != (ushort *)0x0',
        'puVar3 != (uw_object_hdr_t *)0x0')
    add(EXTRACT,'source_return','return puVar3;', 'return (ushort *)puVar3;')
    add(EXTRACT,'typed_clone','byte *pbVar10;','uw_object_hdr_t *pbVar10;')
    add(EXTRACT,'typed_clone_null','pbVar10 == (byte *)0x0','pbVar10 == (uw_object_hdr_t *)0x0')
    add(EXTRACT,'typed_clone_initial','pbVar10 = (byte *)0x0','pbVar10 = (uw_object_hdr_t *)0x0')
    add(EXTRACT,'typed_allocation','pbVar10 = (byte *)alloc_object_slot(0)','pbVar10 = alloc_object_slot(0)')
    for field,offset in [('type_flags',0),('position_word',2),('chain_word',4),('link_word',6)]:
        low='*puVar3' if offset==0 else f'puVar3[{offset//2}]'
        add(EXTRACT,'copy_'+field,
            f'{a}{field}_low = (byte){low};\n{a}{field}_high = *(byte *)((char *)puVar3 + {offset+1});',
            f'{a}{field} = {b}{field};')
    add(EXTRACT,'remaining_quantity',f"{a}link_word_low = {a}owner ^ (char)uVar8 * '@';\n{a}link_word_high = (byte)((uVar8 & 0x3ffffff) >> 2);",
        f'{a}link = uVar8 & 0x3ff;')
    add(EXTRACT,'extracted_quantity', '''*(byte *)(puVar3 + 3) = (byte)puVar3[3] & 0x3f | (byte)((uVar6 & 0x3ff) << 6);
*(byte *)((char *)puVar3 + 7) = (byte)((uVar6 << 0x16) >> 0x18);''', f'{b}link = uVar6 & 0x3ff;')
    for key,before,after in [
        ('category','*puVar3 >> 6 & 7',b+'object_id >> 6 & 7'),
        ('subcategory','(byte)((byte)*puVar3 >> 4) & 3',b+'object_id >> 4 & 3'),
        ('quality_filter','(byte)*puVar3 & 0xf',b+'object_id & 0xf'),
        ('quantity_flag','(*puVar3 & 0x8000) != 0',b+'is_quant != 0'),
        ('quantity_kind','(puVar3[3] & 0x8000) == 0','('+b+'link & 0x200) == 0'),
        ('quantity_read','puVar3[3] >> 6',b+'link'),
        ('clone_chain','object_list_insert_head(puVar3 + 2,pbVar10)','object_list_insert_head(&'+b+'chain_word,pbVar10)'),
        ('parent_chain','object_list_unlink(local_28 + 6,puVar3)','object_list_unlink(&((uw_object_hdr_t *)local_28)->link_word,puVar3)'),
    ]: add(EXTRACT,key,before,after)
    a='((uw_object_hdr_t *)puVar6)->'
    b='((uw_object_hdr_t *)puVar5)->'
    for ptr in ['puVar5','puVar6']:
        add(REDUCE,'typed_'+ptr,f'undefined1 *{ptr};',f'uw_object_hdr_t *{ptr};')
    add(REDUCE,'typed_found','puVar5 = (undefined1 *)find_object_by_encoded_slot_in_chain((char *)g_player_object + 6,1,uVar4)',
        'puVar5 = find_object_by_encoded_slot_in_chain(&g_player_object->hdr.link_word,1,uVar4)')
    add(REDUCE,'typed_null','puVar5 == (undefined1 *)0x0','puVar5 == (uw_object_hdr_t *)0x0')
    add(REDUCE,'typed_allocation','puVar6 = (undefined1 *)alloc_object_slot(0)','puVar6 = alloc_object_slot(0)')
    add(REDUCE,'remaining_quantity',f"{a}link_word_low = {a}owner ^ (char)uVar9 * '@';\n{a}link_word_high = (char)((uVar9 & 0x3ffffff) >> 2);",
        f'{a}link = uVar9 & 0x3ff;')
    add(REDUCE,'extracted_quantity',f'{b}link_word_low = {b}owner | (byte)((amount & 0x3ff) << 6);\n{b}link_word_high = (char)((amount << 0x16) >> 0x18);',
        f'{b}link = amount & 0x3ff;')
    add(REDUCE,'clone_chain','object_list_insert_head(puVar5 + 4,puVar6)',f'object_list_insert_head(&{b}chain_word,puVar6)')
    return result


def converted(function):
    final=ORIGINALS[function]
    for change in changes():
        if change['function']!=function: continue
        before,after=change['before'],change['after']
        if '\n' in before:
            pattern=re.compile(r'(?m)^([ \t]*)'+r'\s*'.join(re.escape(line) for line in before.splitlines()))
            final,count=pattern.subn(lambda m:m[1]+after.replace('\n','\n'+m[1]),final)
        else: final,count=re.subn(re.escape(before),lambda m:after,final)
        expected={'typed_clone_null':2,'typed_source_null':2,'source_return':4}.get(change['key'],1)
        assert count==expected,change['key']
    for ptr in (['pbVar10','puVar3'] if function==EXTRACT else ['puVar5','puVar6']):
        final=final.replace(f'((uw_object_hdr_t *){ptr})->',ptr+'->')
    if function==EXTRACT:
        final=final.replace('calculate_object_weight((uw_object_hdr_t *)puVar3)',
                            'calculate_object_weight(puVar3)')
    return final


def generate():
    rules=[]
    for function in [EXTRACT,REDUCE]:
        old,new=ORIGINALS[function].splitlines(),converted(function).splitlines()
        patch=[]
        for tag,i,j,k,l in SequenceMatcher(a=old,b=new,autojunk=False).get_opcodes():
            if tag=='equal': patch.extend(' '+line if line.strip() else '' for line in old[i:j])
            else:
                patch.extend('- '+line if line else '-' for line in old[i:j])
                patch.extend('+ '+line if line else '+' for line in new[k:l])
        rules.append(f'@{function}_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@\n'
            'typedef byte, ushort, uint, undefined1, undefined4, uw_object_hdr_t;\n@@\n'+'\n'.join(patch)+'\n')
    return ''.join(rules)


if __name__=='__main__':
    (HERE/'stack-split-fields.cocci').write_text(generate())
