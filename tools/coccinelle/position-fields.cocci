@position_0_zpos_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xff80 | H & 0x7f;
- P->hdr.position_word = (ushort)V;
+ P->hdr.zpos = H & 0x7f;
+ V = P->hdr.position_word;

@position_0_zpos_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xff80 | H & 0x7f;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.zpos = H & 0x7f;
+ V = P->hdr.position_word;

@position_0_zpos_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xff80 | H & 0x7f;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.zpos = H & 0x7f;
+ V = P->hdr.position_word;

@position_0_zpos_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0xff80 | H & 0x7f;
+ P->hdr.zpos = H & 0x7f;

@position_0_zpos_read@
identifier P;
typedef uw_object_hdr_t;
@@
- P->hdr.position_word & 0x7f
+ P->hdr.zpos

@position_0_heading_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- P->hdr.position_word = (ushort)V;
+ P->hdr.heading = H & 0x7;
+ V = P->hdr.position_word;

@position_0_heading_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.heading = H & 0x7;
+ V = P->hdr.position_word;

@position_0_heading_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.heading = H & 0x7;
+ V = P->hdr.position_word;

@position_0_heading_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
+ P->hdr.heading = H & 0x7;

@position_0_heading_read@
identifier P;
typedef uw_object_hdr_t;
@@
(
- (P->hdr.position_word >> 7) & 0x7
+ P->hdr.heading
|
- (P->hdr.position_word & 0x380) >> 7
+ P->hdr.heading
)

@position_0_ypos_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- P->hdr.position_word = (ushort)V;
+ P->hdr.ypos = H & 0x7;
+ V = P->hdr.position_word;

@position_0_ypos_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.ypos = H & 0x7;
+ V = P->hdr.position_word;

@position_0_ypos_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.ypos = H & 0x7;
+ V = P->hdr.position_word;

@position_0_ypos_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
+ P->hdr.ypos = H & 0x7;

@position_0_ypos_read@
identifier P;
typedef uw_object_hdr_t;
@@
(
- (P->hdr.position_word >> 10) & 0x7
+ P->hdr.ypos
|
- (P->hdr.position_word & 0x1c00) >> 10
+ P->hdr.ypos
)

@position_0_xpos_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0x1fff | (H & 0x7) << 13;
- P->hdr.position_word = (ushort)V;
+ P->hdr.xpos = H & 0x7;
+ V = P->hdr.position_word;

@position_0_xpos_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0x1fff | (H & 0x7) << 13;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.xpos = H & 0x7;
+ V = P->hdr.position_word;

@position_0_xpos_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0x1fff | (H & 0x7) << 13;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.xpos = H & 0x7;
+ V = P->hdr.position_word;

@position_0_xpos_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0x1fff | (H & 0x7) << 13;
+ P->hdr.xpos = H & 0x7;

@position_0_xpos_read@
identifier P;
typedef uw_object_hdr_t;
@@
(
- (P->hdr.position_word >> 13) & 0x7
+ P->hdr.xpos
|
- (P->hdr.position_word & 0xe000) >> 13
+ P->hdr.xpos
)

@position_1_zpos_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xff80 | H & 0x7f;
- P->position_word = (ushort)V;
+ P->zpos = H & 0x7f;
+ V = P->position_word;

@position_1_zpos_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xff80 | H & 0x7f;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->zpos = H & 0x7f;
+ V = P->position_word;

@position_1_zpos_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xff80 | H & 0x7f;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->zpos = H & 0x7f;
+ V = P->position_word;

@position_1_zpos_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- P->position_word = P->position_word & 0xff80 | H & 0x7f;
+ P->zpos = H & 0x7f;

@position_1_zpos_read@
identifier P;
typedef uw_object_hdr_t;
@@
- P->position_word & 0x7f
+ P->zpos

@position_1_heading_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xfc7f | (H & 0x7) << 7;
- P->position_word = (ushort)V;
+ P->heading = H & 0x7;
+ V = P->position_word;

@position_1_heading_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xfc7f | (H & 0x7) << 7;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->heading = H & 0x7;
+ V = P->position_word;

@position_1_heading_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xfc7f | (H & 0x7) << 7;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->heading = H & 0x7;
+ V = P->position_word;

@position_1_heading_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- P->position_word = P->position_word & 0xfc7f | (H & 0x7) << 7;
+ P->heading = H & 0x7;

@position_1_heading_read@
identifier P;
typedef uw_object_hdr_t;
@@
(
- (P->position_word >> 7) & 0x7
+ P->heading
|
- (P->position_word & 0x380) >> 7
+ P->heading
)

@position_1_ypos_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xe3ff | (H & 0x7) << 10;
- P->position_word = (ushort)V;
+ P->ypos = H & 0x7;
+ V = P->position_word;

@position_1_ypos_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xe3ff | (H & 0x7) << 10;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->ypos = H & 0x7;
+ V = P->position_word;

@position_1_ypos_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xe3ff | (H & 0x7) << 10;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->ypos = H & 0x7;
+ V = P->position_word;

@position_1_ypos_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- P->position_word = P->position_word & 0xe3ff | (H & 0x7) << 10;
+ P->ypos = H & 0x7;

@position_1_ypos_read@
identifier P;
typedef uw_object_hdr_t;
@@
(
- (P->position_word >> 10) & 0x7
+ P->ypos
|
- (P->position_word & 0x1c00) >> 10
+ P->ypos
)

@position_1_xpos_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0x1fff | (H & 0x7) << 13;
- P->position_word = (ushort)V;
+ P->xpos = H & 0x7;
+ V = P->position_word;

@position_1_xpos_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0x1fff | (H & 0x7) << 13;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->xpos = H & 0x7;
+ V = P->position_word;

@position_1_xpos_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0x1fff | (H & 0x7) << 13;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->xpos = H & 0x7;
+ V = P->position_word;

@position_1_xpos_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- P->position_word = P->position_word & 0x1fff | (H & 0x7) << 13;
+ P->xpos = H & 0x7;

@position_1_xpos_read@
identifier P;
typedef uw_object_hdr_t;
@@
(
- (P->position_word >> 13) & 0x7
+ P->xpos
|
- (P->position_word & 0xe000) >> 13
+ P->xpos
)

@position_2_zpos_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xff80 | H & 0x7f;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_zpos_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xff80 | H & 0x7f;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_zpos_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xff80 | H & 0x7f;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_zpos_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0xff80 | H & 0x7f;
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;

@position_2_zpos_read@
identifier P;
typedef uw_object_hdr_t;
@@
- ((uw_object_hdr_t *)P)->position_word & 0x7f
+ ((uw_object_hdr_t *)P)->zpos

@position_2_heading_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f | (H & 0x7) << 7;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->heading = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_heading_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f | (H & 0x7) << 7;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->heading = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_heading_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f | (H & 0x7) << 7;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->heading = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_heading_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0xfc7f | (H & 0x7) << 7;
+ ((uw_object_hdr_t *)P)->heading = H & 0x7;

@position_2_heading_read@
identifier P;
typedef uw_object_hdr_t;
@@
(
- (((uw_object_hdr_t *)P)->position_word >> 7) & 0x7
+ ((uw_object_hdr_t *)P)->heading
|
- (((uw_object_hdr_t *)P)->position_word & 0x380) >> 7
+ ((uw_object_hdr_t *)P)->heading
)

@position_2_ypos_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xe3ff | (H & 0x7) << 10;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->ypos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_ypos_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xe3ff | (H & 0x7) << 10;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->ypos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_ypos_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xe3ff | (H & 0x7) << 10;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->ypos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_ypos_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0xe3ff | (H & 0x7) << 10;
+ ((uw_object_hdr_t *)P)->ypos = H & 0x7;

@position_2_ypos_read@
identifier P;
typedef uw_object_hdr_t;
@@
(
- (((uw_object_hdr_t *)P)->position_word >> 10) & 0x7
+ ((uw_object_hdr_t *)P)->ypos
|
- (((uw_object_hdr_t *)P)->position_word & 0x1c00) >> 10
+ ((uw_object_hdr_t *)P)->ypos
)

@position_2_xpos_store_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0x1fff | (H & 0x7) << 13;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->xpos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_xpos_store_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0x1fff | (H & 0x7) << 13;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->xpos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_xpos_store_2@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0x1fff | (H & 0x7) << 13;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->xpos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_2_xpos_direct@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0x1fff | (H & 0x7) << 13;
+ ((uw_object_hdr_t *)P)->xpos = H & 0x7;

@position_2_xpos_read@
identifier P;
typedef uw_object_hdr_t;
@@
(
- (((uw_object_hdr_t *)P)->position_word >> 13) & 0x7
+ ((uw_object_hdr_t *)P)->xpos
|
- (((uw_object_hdr_t *)P)->position_word & 0xe000) >> 13
+ ((uw_object_hdr_t *)P)->xpos
)

@fine_heading_0_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xfc7f | (H & 0xe0) << 2;
- P->hdr.position_word = (ushort)V;
+ P->hdr.heading = (H >> 5) & 7;
+ V = P->hdr.position_word;

@fine_heading_0_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->hdr.position_word & 0xfc7f | (H & 0xe0) << 2;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.heading = (H >> 5) & 7;
+ V = P->hdr.position_word;

@fine_heading_1_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xfc7f | (H & 0xe0) << 2;
- P->position_word = (ushort)V;
+ P->heading = (H >> 5) & 7;
+ V = P->position_word;

@fine_heading_1_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = P->position_word & 0xfc7f | (H & 0xe0) << 2;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->heading = (H >> 5) & 7;
+ V = P->position_word;

@fine_heading_2_0@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f | (H & 0xe0) << 2;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->heading = (H >> 5) & 7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@fine_heading_2_1@
identifier P, H, V;
typedef ushort, byte, uw_object_hdr_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f | (H & 0xe0) << 2;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->heading = (H >> 5) & 7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@full_heading_byte@
identifier P;
expression E;
typedef byte;
@@
- *(char *)&P->full_heading = (char)E;
+ P->full_heading = (byte)E;
