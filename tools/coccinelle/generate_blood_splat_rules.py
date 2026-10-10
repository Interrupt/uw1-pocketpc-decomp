"""Name blood-splat placement fields while preserving captured intermediates."""
from pathlib import Path
from difflib import SequenceMatcher
import re
HERE = Path(__file__).resolve().parent
FUNCTION = 'spawn_blood_splat_object'
ORIGINAL = r"""void spawn_blood_splat_object(int object_slot, int step_count, byte *snapshot)
{
  byte bVar1;
  byte bVar2;
  ushort uVar3;
  short sVar4;
  short sVar5;
  short sVar6;
  char *iVar7;  /* was `int` -- truncated spawn_new_object's real object
                   pointer, latent while that function always returned 0 */
  undefined4 uVar8;
  char *iVar9;  /* was `int` -- truncated tilemap_lookup's real `void *` return (same class as iVar7 above and this
   whole file's dominant bug). */
  uint uVar10;
  short local_18;
  short local_16;

  step_count = step_count + 1;
  DAT_00202c6c = snapshot;
  snapshot[8] = 1;
  DAT_00202c6c[10] = 0;
  DAT_00202c6c[0xb] = 0;
  local_18 = (short)((uint)((int)*(short *)DAT_00202c6c << 0x14) >> 0x10);
  local_16 = (short)((uint)((int)*(short *)(DAT_00202c6c + 2) << 0x14) >> 0x10);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object ENTRY object_slot=%d step_count=%d\n", (int)object_slot, step_count);
  while (collision_build_height_field(0),
        ((*(ushort *)(DAT_00202c6c + 0xe) | *(ushort *)(DAT_00202c6c + 0xc)) & 0x300) == 0) {
    project_position_by_heading(object_slot,0x10,&local_18,&local_16);
    step_count = step_count + -1;
    *DAT_00202c6c = (byte)((int)local_18 >> 4);
    DAT_00202c6c[1] = (byte)((uint)((int)local_18 >> 4) >> 8);
    DAT_00202c6c[2] = (byte)((int)local_16 >> 4);
    DAT_00202c6c[3] = (byte)((uint)((int)local_16 >> 4) >> 8);
    if (step_count * 0x10000 >> 0x10 < 1) {
      if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: no floor/ceiling boundary found within range, bailing\n");
      return;
    }
  }
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: spawning object 0x1cb\n");
  iVar7 = (char *)spawn_new_object(0x1cb,0);
  if (iVar7 == (char *)0x0) {
    if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: spawn_new_object FAILED (returned NULL)\n");
    return;
  }
  uVar3 = ((uw_object_hdr_t *)iVar7)->position_word;
  uVar10 = uVar3 & 0x1fff;
  bVar1 = (byte)(((*DAT_00202c6c & 7) << 0xd) >> 8);
  ((uw_object_hdr_t *)iVar7)->position_word_low = (byte)(char)uVar10;
  ((uw_object_hdr_t *)iVar7)->position_word_high = (byte)(uVar10 >> 8) | bVar1;
  uVar10 = uVar3 & 0x3ff;
  bVar1 = (byte)(uVar10 >> 8) | bVar1 | (byte)(((DAT_00202c6c[2] & 7) << 10) >> 8);
  bVar2 = (byte)uVar10;
  ((uw_object_hdr_t *)iVar7)->position_word_low = bVar2;
  ((uw_object_hdr_t *)iVar7)->position_word_high = bVar1;
  sVar4 = *(short *)DAT_00202c6c;
  sVar5 = *(short *)(DAT_00202c6c + 2);
  ((uw_object_hdr_t *)iVar7)->position_word_low = (DAT_00202c6c[4] + 8 ^ bVar2) & 0x7f ^ bVar2;
  ((uw_object_hdr_t *)iVar7)->position_word_high = bVar1;
  if (DAT_00100610 == 1) {
    play_positional_sound_effect(7,*(undefined2 *)DAT_00202c6c,*(undefined2 *)(DAT_00202c6c + 2),0);
  }
  uVar8 = encode_object_slot_index(iVar7);
  sVar6 = scheduler_add_entry(uVar8,2,0,(int)sVar4 >> 3 & 0xff,(char)((int)sVar5 >> 3));
  if (sVar6 == -1) {
    if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: scheduler_add_entry queue full, freeing slot\n");
    free_object_slot(iVar7);
    return;
  }
  iVar9 = tilemap_lookup((int)sVar4 >> 3,(int)sVar5 >> 3);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: tilemap_lookup(%d,%d)=%p, appending\n", (int)sVar4>>3, (int)sVar5>>3, (void*)iVar9);
  object_list_append_tail(iVar9 + 2,iVar7);
  if (getenv("UW_DEBUG_COMBAT")) fprintf(stderr, "[blood-splat] spawn_blood_splat_object: SUCCESS, splat placed\n");
}"""


def converted():
    result = ORIGINAL
    replacements = [
        ('char *iVar7;  /* was `int` -- truncated spawn_new_object\'s real object\n                   pointer, latent while that function always returned 0 */',
         '/* was `int` -- truncated spawn_new_object\'s real object\n     pointer, latent while that function always returned 0 */\n  uw_object_hdr_t *iVar7;'),
        ('iVar7 = (char *)spawn_new_object(0x1cb,0);', 'iVar7 = spawn_new_object(0x1cb, 0);'),
        ('iVar7 == (char *)0x0', 'iVar7 == (uw_object_hdr_t *)0x0'),
        ("""  ((uw_object_hdr_t *)iVar7)->position_word_low = (byte)(char)uVar10;
  ((uw_object_hdr_t *)iVar7)->position_word_high = (byte)(uVar10 >> 8) | bVar1;""",
         '  iVar7->xpos = bVar1 >> 5;'),
        ("""  ((uw_object_hdr_t *)iVar7)->position_word_low = bVar2;
  ((uw_object_hdr_t *)iVar7)->position_word_high = bVar1;""",
         '  iVar7->ypos = (bVar1 >> 2) & 7;'),
        ("""  ((uw_object_hdr_t *)iVar7)->position_word_low = (DAT_00202c6c[4] + 8 ^ bVar2) & 0x7f ^ bVar2;
  ((uw_object_hdr_t *)iVar7)->position_word_high = bVar1;""",
         '  iVar7->zpos = (DAT_00202c6c[4] + 8) & 0x7f;'),
    ]
    for before, after in replacements:
        assert result.count(before) == 1, before
        result = result.replace(before, after)
    return result.replace('((uw_object_hdr_t *)iVar7)->', 'iVar7->')


def generate():
    old = [line.rstrip() for line in re.sub(r'/\*[\s\S]*?\*/', '', ORIGINAL).splitlines()]
    new = [line.rstrip() for line in re.sub(r'/\*[\s\S]*?\*/', '', converted()).splitlines()]
    patch = []
    for tag, i, j, k, l in SequenceMatcher(a=old, b=new, autojunk=False).get_opcodes():
        if tag == 'equal':
            patch.extend(' '+line if line.strip() else '' for line in old[i:j])
        else:
            patch.extend('- '+line if line else '-' for line in old[i:j])
            for line in new[k:l]:
                if 'uw_object_hdr_t *iVar7;' in line:
                    patch.extend(['+   /* was `int` -- truncated spawn_new_object\'s real object',
                                  '+      pointer, latent while that function always returned 0 */'])
                patch.append('+ '+line if line else '+')
    return ('@blood_splat_exact disable paren, optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@\n'
        'typedef byte, ushort, uint, undefined4, undefined2, uw_object_hdr_t;\n@@\n'
        + '\n'.join(patch) + '\n')


if __name__ == '__main__':
    (HERE/'blood-splat-fields.cocci').write_text(generate())
