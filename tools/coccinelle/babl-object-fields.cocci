@babl_iVar5_receiver disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;
identifier M;
@@
R F(...) {
<...
- ((uw_object_hdr_t *)iVar5)->M
+ iVar5->M
...>
}

@babl_iVar5_type disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- void *iVar5;
+ uw_object_hdr_t *iVar5;
...>
}

@babl_iVar2_receiver disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;
identifier M;
@@
R F(...) {
<...
- ((uw_object_hdr_t *)iVar2)->M
+ iVar2->M
...>
}

@babl_iVar2_type disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_count_inv\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- void *iVar2;
+ uw_object_hdr_t *iVar2;
...>
}

@babl_iVar1_receiver disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;
identifier M;
@@
R F(...) {
<...
- ((uw_object_hdr_t *)iVar1)->M
+ iVar1->M
...>
}

@babl_iVar1_type disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_check_inv_quality\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- void *iVar1;
+ uw_object_hdr_t *iVar1;
...>
}

@babl_iVar4_receiver disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;
identifier M;
@@
R F(...) {
<...
- ((uw_object_hdr_t *)iVar4)->M
+ iVar4->M
...>
}

@babl_iVar4_type disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- void *iVar4;
+ uw_object_hdr_t *iVar4;
...>
}

@babl_iVar3_receiver disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;
identifier M;
@@
R F(...) {
<...
- ((uw_object_hdr_t *)iVar3)->M
+ iVar3->M
...>
}

@babl_iVar3_type disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_find_barter_total\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- void *iVar3;
+ uw_object_hdr_t *iVar3;
...>
}

@babl_x_store disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- uVar7 = iVar5->position_word & 0x1fff;
- iVar5->position_word_low = (byte)(char)uVar7;
- iVar5->position_word_high = (byte)(uVar7 >> 8) | (byte)(((uVar8 & 7) << 0xd) >> 8);
+ uVar7 = iVar5->position_word & 0x1fff;
+ iVar5->xpos = uVar8 & 7;
...>
}

@babl_y_store disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- uVar7 = iVar5->position_word & 0xe3ff;
- iVar5->position_word_low = (byte)(char)uVar7;
- iVar5->position_word_high = (byte)(uVar7 >> 8) | (byte)((((int)sVar1 & 7U) << 10) >> 8);
+ uVar7 = iVar5->position_word & 0xe3ff;
+ iVar5->ypos = sVar1 & 7;
...>
}

@babl_z_store disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- uVar8 = (uVar8 ^ iVar5->position_word) & 0x7f ^ iVar5->position_word;
+ iVar5->zpos = uVar8 & 0x7f;
+ uVar8 = iVar5->position_word;
...>
}

@babl_floor_z disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- uVar8 = *pbVar6 >> 1 & 0x78 | iVar5->position_word & 0xff80;
+ iVar5->zpos = pbVar6->floor_height << 3;
+ uVar8 = iVar5->position_word;
...>
}

@babl_floor_pointer disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- byte *pbVar6;
+ uw_tile_t *pbVar6;
...>
}

@babl_floor_lookup disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- pbVar6 = (byte *)tilemap_lookup((int)(short)*puVar2,(int)*psVar3);
+ pbVar6 = (uw_tile_t *)tilemap_lookup((int)(short)*puVar2,(int)*psVar3);
...>
}

@babl_packed_store disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_x_obj_pos\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- iVar5->position_word_low = (byte)(char)uVar8;
- iVar5->position_word_high = (byte)(char)(uVar8 >> 8);
+ iVar5->position_word = uVar8;
...>
}

@babl_quality disable drop_cast, plus_comm, plus_assoc, mult_comm@
type R;
identifier F =~ "^\(babl_builtin_set_inv_quality\)$";
typedef byte, ushort, uw_object_hdr_t, uw_tile_t;

@@
R F(...) {
<...
- uVar1 = iVar4->chain_word;
- bVar2 = (byte)uVar1;
- iVar4->chain_word_low = (bVar2 ^ bVar3) & 0x3f ^ bVar2;
- iVar4->chain_word_high = (byte)(char)((ushort)uVar1 >> 8);
+ uVar1 = iVar4->chain_word;
+ bVar2 = (byte)uVar1;
+ iVar4->quality = bVar3 & 0x3f;
...>
}
