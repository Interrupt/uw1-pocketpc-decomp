"""Name common-header copies and coordinates in the debris burst spawner.

Callers supply a live object and the stationary allocator returns separate
whole slots. The exact function guard preserves all random calls, retry loops,
scalar captures, callback reads, and scheduling/failure order.
"""
from pathlib import Path
from difflib import SequenceMatcher
import re
HERE = Path(__file__).resolve().parent
FUNCTION = 'spawn_effect_debris_burst'
ORIGINAL = """void spawn_effect_debris_burst(void *template_ptr, uint tile_x, int tile_y)
{
  byte *template = (byte *)template_ptr;
  int uw_ord2005_rem_170 = 0; int uw_ord2005_rem_171 = 0; int uw_ord2005_rem_172 = 0; int uw_ord2005_rem_173 = 0; int uw_ord2005_rem_174 = 0;
  short sVar1;
  ushort uVar2;
  byte bVar3;
  byte bVar4;
  short sVar5;
  undefined4 uVar6;
  int iVar7;
  ushort *puVar8;
  uint uVar9;
  uint uVar10;
  undefined4 uVar11;
  short extraout_r1;
  short extraout_r1_00;
  short extraout_r1_01;
  short extraout_r1_02;
  short extraout_r1_03;
  undefined1 uVar12;
  undefined1 uVar13;
\x20\x20
  uVar6 = ce_rand();
  uw_ord2005_rem_170 = ((int)(uVar6)) % (3);
  iVar7 = uw_ord2005_rem_170 + 2;
  sVar1 = (short)iVar7;
  while (-1 < iVar7 * 0x10000 >> 0x10) {
    puVar8 = (ushort *)alloc_object_slot(0);
    ((uw_object_hdr_t *)puVar8)->type_flags_low = *template;
    ((uw_object_hdr_t *)puVar8)->type_flags_high = template[1];
    ((uw_object_hdr_t *)puVar8)->position_word_low = template[2];
    ((uw_object_hdr_t *)puVar8)->position_word_high = template[3];
    ((uw_object_hdr_t *)puVar8)->chain_word_low = template[4];
    ((uw_object_hdr_t *)puVar8)->chain_word_high = template[5];
    ((uw_object_hdr_t *)puVar8)->link_word_low = template[6];
    ((uw_object_hdr_t *)puVar8)->link_word_high = template[7];
    uVar9 = ce_rand();
    uVar10 = (uint)((uw_object_hdr_t *)puVar8)->type_flags;
    uVar10 = ((uVar9 & 1) + uVar10 + 1 ^ uVar10) & 0x1ff ^ uVar10;
    ((uw_object_hdr_t *)puVar8)->type_flags = (ushort)uVar10;
    bVar3 = ((uw_object_hdr_t *)puVar8)->xpos;
    do {
      do {
        uVar6 = ce_rand();
        uw_ord2005_rem_171 = ((int)(uVar6)) % (5);
        iVar7 = ((int)(((int)uw_ord2005_rem_171 - 2U) * 0x10000) >> 0x10) + (int)(short)(ushort)bVar3;
      } while (iVar7 < 0);
    } while (7 < iVar7);
    uVar9 = ((uw_object_hdr_t *)puVar8)->position_word & 0x1fff ^ (((int)uw_ord2005_rem_171 - 2U & 0xffff) + (uint)bVar3 & 0xffff) << 0xd
    ;
    ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)(char)(((uw_object_hdr_t *)puVar8)->position_word & 0x1fff);
    ((uw_object_hdr_t *)puVar8)->position_word_high = (byte)(char)(uVar9 >> 8);
    uVar9 = (uVar9 & 0x1c00) >> 10;
    do {
      do {
        uVar6 = ce_rand();
        uw_ord2005_rem_172 = ((int)(uVar6)) % (5);
        iVar7 = ((int)(((int)uw_ord2005_rem_172 - 2U) * 0x10000) >> 0x10) + (int)(short)uVar9;
      } while (iVar7 < 0);
    } while (7 < iVar7);
    bVar3 = (byte)(((uw_object_hdr_t *)puVar8)->position_word >> 8);
    ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)(char)((uw_object_hdr_t *)puVar8)->position_word;
    ((uw_object_hdr_t *)puVar8)->position_word_high =
        (bVar3 ^ (byte)(((((int)uw_ord2005_rem_172 - 2U & 0xffff) + uVar9 & 0xffff) << 10) >> 8)) &
       0x1c ^ bVar3;
    bVar4 = ce_rand();
    uVar2 = ((uw_object_hdr_t *)puVar8)->position_word;
    bVar3 = (byte)uVar2;
    ((uw_object_hdr_t *)puVar8)->position_word_low = (((bVar4 & 0xf) + bVar3) - 8 ^ bVar3) & 0x7f ^ bVar3;
    ((uw_object_hdr_t *)puVar8)->position_word_high = (byte)(char)(uVar2 >> 8);
    /* was folded into `int iVar7` (this function's loop counter, reused
       immediately after this for unrelated int values) -- truncated
       tilemap_lookup's real `void *` return */
    {
      char *_tile7 = (char *)tilemap_lookup(tile_x,tile_y);
      object_list_insert_head(_tile7 + 2,puVar8);
    }
    uVar6 = ce_rand();
    uw_ord2005_rem_173 = ((int)(uVar6)) % (3);
    uVar6 = ce_rand();
    uVar11 = encode_object_slot_index(puVar8);
    uVar12 = (undefined1)tile_y;
    uVar13 = (undefined1)uw_ord2005_rem_173;
    uw_ord2005_rem_174 = ((int)(uVar6)) % (3);
    sVar5 = scheduler_add_entry(uVar11,((int)uw_ord2005_rem_174 - (int)uw_ord2005_rem_173) + 2,(int)uw_ord2005_rem_173,
                         tile_x & 0xff,uVar12);  /* a 6th arg (uVar13) was Ghidra noise: ARM scheduler_add_entry takes 5 */
    if (sVar5 == -1) {
      /* was folded into `int iVar7` (this function's loop counter) --
         truncated tilemap_lookup's real `void *` return */
      char *_tile7b = (char *)tilemap_lookup(tile_x,tile_y);
      object_list_unlink(_tile7b + 2,puVar8);
      free_object_slot(puVar8);
      iVar7 = -1;
    }
    else {
      iVar7 = (int)sVar1;
    }
    iVar7 = iVar7 + -1;
    sVar1 = (short)iVar7;
  }
}"""


def changes():
    a = '((uw_object_hdr_t *)puVar8)->'
    result = [('typed_template', 'byte *template = (byte *)template_ptr;',
               'uw_object_hdr_t *template = (uw_object_hdr_t *)template_ptr;'),
              ('typed_destination', 'ushort *puVar8;', 'uw_object_hdr_t *puVar8;'),
              ('typed_allocation', 'puVar8 = (ushort *)alloc_object_slot(0);',
               'puVar8 = alloc_object_slot(0);')]
    for field,offset in [('type_flags',0),('position_word',2),('chain_word',4),('link_word',6)]:
        low = '*template' if offset == 0 else f'template[{offset}]'
        result.append(('copy_'+field,
            f'{a}{field}_low = {low};\n{a}{field}_high = template[{offset+1}];',
            f'{a}{field} = template->{field};'))
    result += [
        ('object_id', f'{a}type_flags = (ushort)uVar10;', f'{a}object_id = uVar10 & 0x1ff;'),
        ('xpos', f'{a}position_word_low = (byte)(char)({a}position_word & 0x1fff);\n{a}position_word_high = (byte)(char)(uVar9 >> 8);',
         f'{a}xpos = (uVar9 >> 13) & 7;'),
        ('ypos', f"""{a}position_word_low = (byte)(char){a}position_word;
{a}position_word_high =
(bVar3 ^ (byte)(((((int)uw_ord2005_rem_172 - 2U & 0xffff) + uVar9 & 0xffff) << 10) >> 8)) &
0x1c ^ bVar3;""",
         f'{a}ypos = (((int)uw_ord2005_rem_172 - 2U & 0xffff) + uVar9) & 7;'),
        ('zpos', f"""{a}position_word_low = (((bVar4 & 0xf) + bVar3) - 8 ^ bVar3) & 0x7f ^ bVar3;
{a}position_word_high = (byte)(char)(uVar2 >> 8);""",
         f'{a}zpos = ((bVar4 & 0xf) + bVar3 - 8) & 0x7f;'),
    ]
    return result


def converted():
    final = ORIGINAL
    for key,before,after in changes():
        pattern = re.compile(r'(?m)^([ \t]*)' + r'\s*'.join(re.escape(line) for line in before.splitlines()))
        final,count = pattern.subn(lambda m: m[1]+after.replace('\n','\n'+m[1]),final)
        assert count == 1, key
    return final.replace('((uw_object_hdr_t *)puVar8)->', 'puVar8->')


def generate():
    old,new = ORIGINAL.splitlines(),converted().splitlines()
    patch=[]
    for tag,i,j,k,l in SequenceMatcher(a=old,b=new,autojunk=False).get_opcodes():
        if tag == 'equal': patch.extend(' '+line if line.strip() else '' for line in old[i:j])
        else:
            patch.extend('- '+line if line else '-' for line in old[i:j])
            patch.extend('+ '+line if line else '+' for line in new[k:l])
    return ('@debris_exact disable optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@\n'
            'typedef byte, ushort, uint, undefined1, undefined4, uw_object_hdr_t;\n@@\n'
            + '\n'.join(patch)+'\n')


if __name__ == '__main__':
    (HERE/'debris-fields.cocci').write_text(generate())
