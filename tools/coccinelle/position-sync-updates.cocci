@sync_z disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- ((uw_object_hdr_t *)object)->position_word_low = (byte)(uVar7 & 0xff80) | bVar9;
- ((uw_object_hdr_t *)object)->position_word_high = (byte)(char)((uVar7 & 0xff80) >> 8);
+ ((uw_object_hdr_t *)object)->zpos = bVar9;
...>
}

@sync_x disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- ((uw_object_hdr_t *)object)->position_word_low = (byte)(uVar7 & 0x1f80) | bVar9;
- ((uw_object_hdr_t *)object)->position_word_high = (byte)((uVar7 & 0x1f80) >> 8) | bVar3;
+ ((uw_object_hdr_t *)object)->xpos = (bVar3 >> 5) & 7;
...>
}

@sync_y disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- ((uw_object_hdr_t *)object)->position_word_low = (byte)(uVar7 & 0x380) | bVar9;
- ((uw_object_hdr_t *)object)->position_word_high = (byte)((uVar7 & 0x380) >> 8) | bVar3 | (byte)((uint)(((int)(short)(uVar1 & 0xe0) >> 5) << 10) >> 8);
+ ((uw_object_hdr_t *)object)->ypos = (uVar1 >> 5) & 7;
...>
}

@sync_quality disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- ((uw_object_hdr_t *)object)->chain_word_low = (byte)position[0xf] & 0x3f | (byte)(uVar1 & 0xffc0);
- ((uw_object_hdr_t *)object)->chain_word_high = (byte)(char)((uVar1 & 0xffc0) >> 8);
+ ((uw_object_hdr_t *)object)->quality = position[0xf] & 0x3f;
...>
}

@sync_tile_x disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- ((uw_mobile_object_t *)object)->tile_position_low = (byte)(char)uVar8;
- ((uw_mobile_object_t *)object)->tile_position_high = (byte)(uVar8 >> 8) | (byte)(uVar7 >> 8);
+ ((uw_mobile_object_t *)object)->tile_x = (uVar7 >> 10) & 0x3f;
...>
}

@sync_mode disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- ((uw_mobile_object_t *)object)->movement_flags = ((uw_mobile_object_t *)object)->movement_flags & 0x8f | ((&DAT_000868c0)[(byte)position[0x14]] & 7) << 4;
+ ((uw_mobile_object_t *)object)->movement_mode = (&DAT_000868c0)[(byte)position[0x14]] & 7;
...>
}

@sync_pitch disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- ((uw_mobile_object_t *)object)->attack_pitch = (byte)((int)sVar4 << 3) | ((uw_mobile_object_t *)object)->attack_pitch & 7;
+ ((uw_mobile_object_t *)object)->pitch = (byte)sVar4 & 0x1f;
...>
}

@sync_tile_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- ((uw_mobile_object_t *)object)->tile_position_low = (byte)(char)uVar7;
- ((uw_mobile_object_t *)object)->tile_position_high = (byte)(char)(uVar7 >> 8);
+ ((uw_mobile_object_t *)object)->tile_y = (uVar7 >> 4) & 0x3f;
...>
}

@sync_gravity disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- ((uw_mobile_object_t *)object)->motion_flags = bVar9;
+ ((uw_mobile_object_t *)object)->gravity_flag = bVar9 >> 7;
...>
}

@sync_speed disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- ((uw_mobile_object_t *)object)->motion_flags = (bVar3 ^ bVar9) & 0x7f ^ bVar9;
+ ((uw_mobile_object_t *)object)->speed = bVar3 & 0x7f;
...>
}

@sync_heading disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- uVar7 = ((uw_object_hdr_t *)object)->position_word & 0xfc7f | ((int)*(short *)((char *)position + 0x21) >> 0xd & 7U) << 7;
- ((uw_object_hdr_t *)object)->position_word = (ushort)uVar7;
+ uVar7 = ((uw_object_hdr_t *)object)->position_word & 0xfc7f | ((int)*(short *)((char *)position + 0x21) >> 0xd & 7U) << 7;
+ ((uw_object_hdr_t *)object)->heading = (uVar7 >> 7) & 7;
...>
}

@sync_projectile_coordinates disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
typedef byte, ushort, uint, uw_object_hdr_t, uw_mobile_object_t, uw_projectile_object_t;
@@
int sync_object_tile_position(...) {
<...
- if ((((uw_object_hdr_t *)object)->item_id & 0x1c0) != 0x40) {
- uVar1 = *position;
- *(char *)((char *)object + 0xb) = (char)uVar1;
- *(char *)(object + 0x6) = (char)(uVar1 >> 8);
- uVar1 = position[1];
- *(char *)((char *)object + 0xd) = (char)uVar1;
- *(char *)(object + 0x7) = (char)(uVar1 >> 8);
- uVar1 = position[2];
- *(char *)((char *)object + 0xf) = (char)uVar1;
- *(char *)(object + 0x8) = (char)(uVar1 >> 8);
- }
+ if ((((uw_object_hdr_t *)object)->item_id & 0x1c0) != 0x40) {
+ uw_projectile_object_t *projectile = (uw_projectile_object_t *)object;
+ uVar1 = *position;
+ projectile->precise_x = uVar1;
+ uVar1 = position[1];
+ projectile->precise_y = uVar1;
+ uVar1 = position[2];
+ projectile->precise_z = uVar1;
+ }
...>
}
