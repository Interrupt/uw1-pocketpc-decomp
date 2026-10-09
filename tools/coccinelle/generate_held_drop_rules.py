"""Name header fields in held-object dropping while preserving throw roles.

The held record is a common header; spawn_object_near_player constructs a
projectile with its own extension. Exact body guards retain all snapshots,
callbacks, clearance attempts and existing fallback behavior.
"""
from pathlib import Path
import re
HERE=Path(__file__).resolve().parent
FUNCTION='drop_held_object_near_player'
ORIGINAL=r"""int drop_held_object_near_player(void *held_object_ptr, int force)
{
  ushort *held_object = (ushort *)held_object_ptr;
  byte bVar1;
  ushort uVar2;
  bool bVar3;
  int iVar4;
  ushort *puVar5;
  uint uVar6;
  int iVar7;
  int iVar8;
  char cVar9;
  /* iVar4 is reused earlier in this function as a plain int (return codes from
     compute_drop_aim_from_cursor/check_object_placement_clearance) -- real uses, left alone -- but
     also held tilemap_lookup's real 64-bit pointer return, truncating it to 32 bits on this host. */
  char *pDropTile;
  ushort local_28;
  ushort local_26;
@BLANK@
  DAT_00202a4c = (ushort)(g_player_object->npc_xhome);
  DAT_00202a50 = (short)(g_player_object->npc_yhome);
  if (getenv("UW_DEBUG_THROW") && (*held_object & 0x1ff) == 0x80)
    fprintf(stderr, "[throw-playertile] player tile=(%d,%d) fine_pos(DAT_00204880/2/4)=(%d,%d,%d) = world(%g,%g) tile-frac(%g,%g)\n",
            (int)DAT_00202a4c, (int)DAT_00202a50,
            (int)DAT_00204880, (int)DAT_00204882, (int)DAT_00204884,
            (double)DAT_00204880 / 256.0, (double)DAT_00204882 / 256.0,
            fmod((double)DAT_00204880 / 256.0, 1.0), fmod((double)DAT_00204882 / 256.0, 1.0));
  if (getenv("UW_DEBUG_THROW"))
    fprintf(stderr, "[branch-gate] game_mode=%d\n", (int)*(short *)(DAT_00085a6c + 8));
  if ((*(short *)(DAT_00085a6c + 8) == 1) && (iVar4 = compute_drop_aim_from_cursor(), iVar4 != 0)) {
    DAT_00202a54 = 1;
    DAT_00202a44 = g_player_object;
    DAT_00202a38 = *held_object & 0x1ff;
    DAT_00202a48 = 0xf;
    puVar5 = (ushort *)spawn_object_near_player();
    if (puVar5 != (ushort *)0x0) {
      uVar6 = (((uw_object_hdr_t *)puVar5)->type_flags ^ *held_object) & 0x7fff ^ (uint)*held_object;
      ((uw_object_hdr_t *)puVar5)->type_flags = (ushort)uVar6;
      uVar2 = held_object[3];
      bVar1 = (byte)uVar2;
      ((uw_object_hdr_t *)puVar5)->link_word_low = ((byte)((uw_object_hdr_t *)puVar5)->link_word ^ bVar1) & 0x3f ^ bVar1;
      ((uw_object_hdr_t *)puVar5)->link_word_high = (byte)(char)(uVar2 >> 8);
      bVar1 = *(byte *)((char *)held_object + 1);
      ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)(char)((uw_object_hdr_t *)puVar5)->type_flags;
      ((uw_object_hdr_t *)puVar5)->type_flags_high =
          (bVar1 ^ ((uw_object_hdr_t *)puVar5)->type_flags_high) & 0x1e ^ ((uw_object_hdr_t *)puVar5)->type_flags_high;
      ((uw_projectile_object_t *)puVar5)->lifetime = ((uw_object_hdr_t *)held_object)->quality;
      ((uw_object_hdr_t *)puVar5)->link_word_low = ((byte)held_object[3] ^ (byte)((uw_object_hdr_t *)puVar5)->link_word) & 0x3f ^ (byte)((uw_object_hdr_t *)puVar5)->link_word;
      ((uw_object_hdr_t *)puVar5)->link_word_high = ((uw_object_hdr_t *)puVar5)->link_word_high;
      bVar1 = *(byte *)((char *)held_object + 1);
      ((uw_object_hdr_t *)puVar5)->type_flags_low = (byte)(char)((uw_object_hdr_t *)puVar5)->type_flags;
      ((uw_object_hdr_t *)puVar5)->doordir = (bVar1 >> 5) & 0x1;
      if (((*held_object & 0x1c0) != 0x140) && ((g_object_type_props[(*held_object & 0x1ff)].class_flags & 3) != 2)) {
        ((uw_projectile_object_t *)puVar5)->original_heading = ((uw_object_hdr_t *)held_object)->heading;
      }
      free_object_slot(held_object);
      held_object = (ushort *)0x0;
    }
  }
  if (held_object != (ushort *)0x0) {
    local_28 = (ushort)(g_player_object->hdr.xpos) + DAT_00202a4c * 8;
    local_26 = (short)(g_player_object->hdr.ypos) + DAT_00202a50 * 8;
    *(byte *)(held_object + 1) = ((byte) g_player_object->hdr.position_word ^ (byte)held_object[1]) & 0x7f ^ (byte)held_object[1];
    *(byte *)((char *)held_object + 3) = *(byte *)((char *)held_object + 3);
    cVar9 = (g_object_type_props[((ushort)*held_object & 0x1ff)].collision_radius) + (g_object_type_props[(g_player_object->hdr.object_id)].collision_radius) + '\x01';
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-heading] facing_byte(g_player_object+0x18)&0x1f=%d fine_aim((g_player_object[1]&0x380)>>2)=%d heading=%d dist(cVar9)=%d start=(%d,%d)\n",
              (int)(g_player_object->npc_heading),
              (int)((g_player_object->hdr.heading << 7) >> 2),
              (int)((g_player_object->npc_heading) + ((g_player_object->hdr.heading << 7) >> 2)),
              (int)cVar9, (int)local_28, (int)local_26);
    project_position_by_heading((g_player_object->npc_heading) + ((g_player_object->hdr.heading << 7) >> 2),
                                cVar9,&local_28
                                ,&local_26);
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-heading] after 1st project_position_by_heading: local_28(X)=%d local_26(Y)=%d\n",
              (int)local_28, (int)local_26);
    iVar4 = check_object_placement_clearance(*held_object & 0x1ff,0,(int)(short)local_28,(int)(short)local_26,
                         g_player_object->hdr.zpos,1,cVar9);
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-heading] 1st check_object_placement_clearance iVar4=%d\n", iVar4);
    if (iVar4 == 0) {
      bVar3 = true;
    }
    else {
      project_position_by_heading((g_player_object->npc_heading) + ((g_player_object->hdr.heading << 7) >> 2),
                                  3,&local_28,
                                  &local_26);
      if (getenv("UW_DEBUG_THROW"))
        fprintf(stderr, "[throw-heading] after 2nd(retry) project_position_by_heading: local_28(X)=%d local_26(Y)=%d\n",
                (int)local_28, (int)local_26);
      iVar4 = check_object_placement_clearance(*held_object & 0x1ff,0,(int)(short)local_28,(int)(short)local_26,
                           g_player_object->hdr.zpos,1,
                           cVar9);
      if (getenv("UW_DEBUG_THROW"))
        fprintf(stderr, "[throw-heading] 2nd check_object_placement_clearance iVar4=%d\n", iVar4);
      bVar3 = true;
      if (iVar4 != 0) {
        bVar3 = false;
      }
    }
    iVar7 = (int)(short)local_28;
    iVar8 = (int)(short)local_26;
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-fallback] dropping via trajectory path: tile=(%d,%d)\n", iVar7 >> 3, iVar8 >> 3);
    pDropTile = (char *)tilemap_lookup(iVar7 >> 3,iVar8 >> 3);
    /* tilemap_lookup returns NULL for any tile coordinate outside 0-63 (see its own bounds check)
       -- confirmed live: dragging an item out of an open backpack slot and dropping it back into
       the 3D view crashed in object_list_append_tail(pDropTile+2, ...)... */
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-fallback] bVar3(no-room)=%d pDropTile=%p\n", (int)bVar3, (void *)pDropTile);
    if ((bVar3) || (pDropTile == NULL)) {
      if (getenv("UW_DEBUG_THROW"))
        fprintf(stderr, "[throw-fallback] -> BAILED, item never inserted anywhere\n");
      if (force != 0) {
        print_scroll_message_by_id(0xfd);
      }
      play_sound_effect_with_pan(0xf,0x40,0xf6);
      return 0;
    }
    uVar2 = held_object[1];
    *(byte *)(held_object + 1) = (byte)(uVar2 & 0x3ff);
    *(byte *)((char *)held_object + 3) =
         (byte)((uVar2 & 0x3ff) >> 8) |
         (byte)(((local_26 & 7 | (local_28 & 0x1fff) << 3) << 10) >> 8);
    if (getenv("UW_DEBUG_THROW"))
      fprintf(stderr, "[throw-fallback] inserting held_object=%p type=0x%x at pDropTile+2=%p heightfield(held_object[7]/8)=%d\n",
              (void *)held_object, (unsigned)(*held_object & 0x1ff), (void *)(pDropTile + 2),
              (int)*(short *)((char *)held_object + 0xe));
    DEBUG(INFO, "[drop] object id=0x%03x landed at tile=(%d,%d)\n",
          (unsigned)(*held_object & 0x1ff), iVar7 >> 3, iVar8 >> 3);
    object_list_append_tail((byte *)(pDropTile + 2),(char *)held_object);
    uVar2 = *held_object;
    if ((((uVar2 & 0x1f0) == 0x90) && (3 < (uVar2 & 0xf))) && ((uVar2 & 0xf) < 7)) {
      bVar1 = (byte)uVar2;
      *(byte *)held_object = (bVar1 - 4 ^ bVar1) & 0xf ^ bVar1;
      *(byte *)((char *)held_object + 1) = (byte)(uVar2 >> 8);
      set_ambient_bias_without_light(0);
    }
    /* Preserve the original placement path; moving objects settle during
       mobile_object_tick, rather than being grounded synchronously here. */
    settle_dropped_object(held_object,iVar7 >> 3,iVar8 >> 3,1);
  }
  return 1;
}""".replace("@BLANK@", "  ")


def changes():
    a='((uw_object_hdr_t *)puVar5)->'
    b='((uw_object_hdr_t *)held_object)->'
    return [
        ('typed_held','ushort *held_object = (ushort *)held_object_ptr;',
         'uw_object_hdr_t *held_object = (uw_object_hdr_t *)held_object_ptr;'),
        ('typed_projectile','ushort *puVar5;', 'uw_projectile_object_t *puVar5;'),
        ('typed_spawn','puVar5 = (ushort *)spawn_object_near_player();',
         'puVar5 = (uw_projectile_object_t *)spawn_object_near_player();'),
        ('projectile_null','puVar5 != (ushort *)0x0','puVar5 != (uw_projectile_object_t *)0x0'),
        ('held_null','held_object != (ushort *)0x0','held_object != (uw_object_hdr_t *)0x0'),
        ('held_clear','held_object = (ushort *)0x0','held_object = (uw_object_hdr_t *)0x0'),
        ('projectile_quantity_flag',f'{a}type_flags = (ushort)uVar6;',f'{a}is_quant = (uVar6 >> 15) & 1;'),
        ('projectile_link',f'{a}link_word_low = ((byte){a}link_word ^ bVar1) & 0x3f ^ bVar1;\n{a}link_word_high = (byte)(char)(uVar2 >> 8);',
         f'{a}link = uVar2 >> 6;'),
        ('projectile_flags',f'''{a}type_flags_low = (byte)(char){a}type_flags;
{a}type_flags_high =
(bVar1 ^ {a}type_flags_high) & 0x1e ^ {a}type_flags_high;''',
         f'{a}flags_res = (bVar1 >> 1) & 7;\n{a}enchanted = (bVar1 >> 4) & 1;'),
        ('projectile_owner',f'{a}link_word_low = ((byte)held_object[3] ^ (byte){a}link_word) & 0x3f ^ (byte){a}link_word;\n{a}link_word_high = {a}link_word_high;',
         f'{a}owner = {b}owner;'),
        ('plain_self_store',f'{a}type_flags_low = (byte)(char){a}type_flags;',''),
        ('fallback_zpos', '''*(byte *)(held_object + 1) = ((byte) g_player_object->hdr.position_word ^ (byte)held_object[1]) & 0x7f ^ (byte)held_object[1];
*(byte *)((char *)held_object + 3) = *(byte *)((char *)held_object + 3);''',
         f'{b}zpos = g_player_object->hdr.zpos;'),
        ('fallback_coordinates', '''*(byte *)(held_object + 1) = (byte)(uVar2 & 0x3ff);
*(byte *)((char *)held_object + 3) =
(byte)((uVar2 & 0x3ff) >> 8) |
(byte)(((local_26 & 7 | (local_28 & 0x1fff) << 3) << 10) >> 8);''',
         f'{b}xpos = local_28 & 7;\n{b}ypos = local_26 & 7;'),
        ('light_id', '''*(byte *)held_object = (bVar1 - 4 ^ bVar1) & 0xf ^ bVar1;
*(byte *)((char *)held_object + 1) = (byte)(uVar2 >> 8);''',
         f'{b}object_id = (uVar2 & 0x1ff) - 4;'),
    ]


def converted():
    final=ORIGINAL
    for key,before,after in changes():
        if key=='plain_self_store':
            final,count=re.subn(r'(?m)^[ \t]*'+re.escape(before)+r'\n','',final)
        elif '\n' in before:
            pattern=re.compile(r'(?m)^([ \t]*)'+r'\s*'.join(re.escape(line) for line in before.splitlines()))
            final,count=pattern.subn(lambda m:m[1]+after.replace('\n','\n'+m[1]),final)
        else: final,count=re.subn(re.escape(before),lambda m:after,final)
        assert count==1,key
    # Named full-word views preserve the values of scalar captures and casts.
    final=final.replace('(ushort)*held_object & 0x1ff','held_object->object_id')
    final=final.replace('*held_object & 0x1ff','held_object->object_id')
    final=final.replace('*held_object & 0x1c0','held_object->object_id & 0x1c0')
    final=final.replace('*(byte *)((char *)held_object + 1)', '(byte)(held_object->type_flags >> 8)')
    final=final.replace('held_object[3]','held_object->link_word').replace('held_object[1]','held_object->position_word')
    final=re.sub(r'\*held_object\b','held_object->type_flags',final)
    # Restore the declaration, which contains a pointer-star rather than a read.
    final=final.replace('uw_object_hdr_t held_object->type_flags =','uw_object_hdr_t *held_object =')
    final=final.replace('((uw_object_hdr_t *)held_object)->','held_object->')
    final=final.replace('((uw_object_hdr_t *)puVar5)->','puVar5->hdr.')
    final=final.replace('((uw_projectile_object_t *)puVar5)->','puVar5->')
    final=final.replace('(char *)held_object);','held_object);')
    return final


def generate():
    import json
    return json.dumps(dict(function=FUNCTION,before=ORIGINAL,after=converted()),indent=2)+'\n'


if __name__=='__main__':
    (HERE/'held-drop-fields.json').write_text(generate())
