@debris_exact disable optional_qualifier, drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, undefined1, undefined4, uw_object_hdr_t;
@@
 void spawn_effect_debris_burst(void *template_ptr, uint tile_x, int tile_y)
 {
-   byte *template = (byte *)template_ptr;
+   uw_object_hdr_t *template = (uw_object_hdr_t *)template_ptr;
   int uw_ord2005_rem_170 = 0; int uw_ord2005_rem_171 = 0; int uw_ord2005_rem_172 = 0; int uw_ord2005_rem_173 = 0; int uw_ord2005_rem_174 = 0;
   short sVar1;
   ushort uVar2;
   byte bVar3;
   byte bVar4;
   short sVar5;
   undefined4 uVar6;
   int iVar7;
-   ushort *puVar8;
+   uw_object_hdr_t *puVar8;
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

   uVar6 = ce_rand();
   uw_ord2005_rem_170 = ((int)(uVar6)) % (3);
   iVar7 = uw_ord2005_rem_170 + 2;
   sVar1 = (short)iVar7;
   while (-1 < iVar7 * 0x10000 >> 0x10) {
-     puVar8 = (ushort *)alloc_object_slot(0);
-     ((uw_object_hdr_t *)puVar8)->type_flags_low = *template;
-     ((uw_object_hdr_t *)puVar8)->type_flags_high = template[1];
-     ((uw_object_hdr_t *)puVar8)->position_word_low = template[2];
-     ((uw_object_hdr_t *)puVar8)->position_word_high = template[3];
-     ((uw_object_hdr_t *)puVar8)->chain_word_low = template[4];
-     ((uw_object_hdr_t *)puVar8)->chain_word_high = template[5];
-     ((uw_object_hdr_t *)puVar8)->link_word_low = template[6];
-     ((uw_object_hdr_t *)puVar8)->link_word_high = template[7];
+     puVar8 = alloc_object_slot(0);
+     puVar8->type_flags = template->type_flags;
+     puVar8->position_word = template->position_word;
+     puVar8->chain_word = template->chain_word;
+     puVar8->link_word = template->link_word;
     uVar9 = ce_rand();
-     uVar10 = (uint)((uw_object_hdr_t *)puVar8)->type_flags;
+     uVar10 = (uint)puVar8->type_flags;
     uVar10 = ((uVar9 & 1) + uVar10 + 1 ^ uVar10) & 0x1ff ^ uVar10;
-     ((uw_object_hdr_t *)puVar8)->type_flags = (ushort)uVar10;
-     bVar3 = ((uw_object_hdr_t *)puVar8)->xpos;
+     puVar8->object_id = uVar10 & 0x1ff;
+     bVar3 = puVar8->xpos;
     do {
       do {
         uVar6 = ce_rand();
         uw_ord2005_rem_171 = ((int)(uVar6)) % (5);
         iVar7 = ((int)(((int)uw_ord2005_rem_171 - 2U) * 0x10000) >> 0x10) + (int)(short)(ushort)bVar3;
       } while (iVar7 < 0);
     } while (7 < iVar7);
-     uVar9 = ((uw_object_hdr_t *)puVar8)->position_word & 0x1fff ^ (((int)uw_ord2005_rem_171 - 2U & 0xffff) + (uint)bVar3 & 0xffff) << 0xd
+     uVar9 = puVar8->position_word & 0x1fff ^ (((int)uw_ord2005_rem_171 - 2U & 0xffff) + (uint)bVar3 & 0xffff) << 0xd
     ;
-     ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)(char)(((uw_object_hdr_t *)puVar8)->position_word & 0x1fff);
-     ((uw_object_hdr_t *)puVar8)->position_word_high = (byte)(char)(uVar9 >> 8);
+     puVar8->xpos = (uVar9 >> 13) & 7;
     uVar9 = (uVar9 & 0x1c00) >> 10;
     do {
       do {
         uVar6 = ce_rand();
         uw_ord2005_rem_172 = ((int)(uVar6)) % (5);
         iVar7 = ((int)(((int)uw_ord2005_rem_172 - 2U) * 0x10000) >> 0x10) + (int)(short)uVar9;
       } while (iVar7 < 0);
     } while (7 < iVar7);
-     bVar3 = (byte)(((uw_object_hdr_t *)puVar8)->position_word >> 8);
-     ((uw_object_hdr_t *)puVar8)->position_word_low = (byte)(char)((uw_object_hdr_t *)puVar8)->position_word;
-     ((uw_object_hdr_t *)puVar8)->position_word_high =
-         (bVar3 ^ (byte)(((((int)uw_ord2005_rem_172 - 2U & 0xffff) + uVar9 & 0xffff) << 10) >> 8)) &
-        0x1c ^ bVar3;
+     bVar3 = (byte)(puVar8->position_word >> 8);
+     puVar8->ypos = (((int)uw_ord2005_rem_172 - 2U & 0xffff) + uVar9) & 7;
     bVar4 = ce_rand();
-     uVar2 = ((uw_object_hdr_t *)puVar8)->position_word;
+     uVar2 = puVar8->position_word;
     bVar3 = (byte)uVar2;
-     ((uw_object_hdr_t *)puVar8)->position_word_low = (((bVar4 & 0xf) + bVar3) - 8 ^ bVar3) & 0x7f ^ bVar3;
-     ((uw_object_hdr_t *)puVar8)->position_word_high = (byte)(char)(uVar2 >> 8);
+     puVar8->zpos = ((bVar4 & 0xf) + bVar3 - 8) & 0x7f;
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
 }
