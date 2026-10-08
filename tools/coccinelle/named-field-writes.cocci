@type_flags_0_item_id_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0xfe00 | H & 0x1ff;
+ P->item_id = H & 0x1ff;

@type_flags_0_item_id_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xfe00 | H & 0x1ff;
- P->type_flags = (ushort)V;
+ P->item_id = H & 0x1ff;
+ V = P->type_flags;

@type_flags_0_item_id_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xfe00 | H & 0x1ff;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->item_id = H & 0x1ff;
+ V = P->type_flags;

@type_flags_0_item_id_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xfe00 | H & 0x1ff;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->item_id = H & 0x1ff;
+ V = P->type_flags;

@type_flags_0_item_id_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0xfe00;
+ P->item_id = 0x0;

@type_flags_0_item_id_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xfe00;
- P->type_flags = (ushort)V;
+ P->item_id = 0x0;
+ V = P->type_flags;

@type_flags_0_item_id_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xfe00;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->item_id = 0x0;
+ V = P->type_flags;

@type_flags_0_item_id_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xfe00;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->item_id = 0x0;
+ V = P->type_flags;

@type_flags_0_item_id_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags | 0x1ff;
+ P->item_id = 0x1ff;

@type_flags_0_item_id_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x1ff;
- P->type_flags = (ushort)V;
+ P->item_id = 0x1ff;
+ V = P->type_flags;

@type_flags_0_item_id_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x1ff;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->item_id = 0x1ff;
+ V = P->type_flags;

@type_flags_0_item_id_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x1ff;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->item_id = 0x1ff;
+ V = P->type_flags;

@type_flags_0_flags_res_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0xf1ff | (H & 0x7) << 9;
+ P->flags_res = H & 0x7;

@type_flags_0_flags_res_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xf1ff | (H & 0x7) << 9;
- P->type_flags = (ushort)V;
+ P->flags_res = H & 0x7;
+ V = P->type_flags;

@type_flags_0_flags_res_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xf1ff | (H & 0x7) << 9;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->flags_res = H & 0x7;
+ V = P->type_flags;

@type_flags_0_flags_res_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xf1ff | (H & 0x7) << 9;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->flags_res = H & 0x7;
+ V = P->type_flags;

@type_flags_0_flags_res_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0xf1ff;
+ P->flags_res = 0x0;

@type_flags_0_flags_res_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xf1ff;
- P->type_flags = (ushort)V;
+ P->flags_res = 0x0;
+ V = P->type_flags;

@type_flags_0_flags_res_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xf1ff;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->flags_res = 0x0;
+ V = P->type_flags;

@type_flags_0_flags_res_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xf1ff;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->flags_res = 0x0;
+ V = P->type_flags;

@type_flags_0_flags_res_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags | 0xe00;
+ P->flags_res = 0x7;

@type_flags_0_flags_res_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0xe00;
- P->type_flags = (ushort)V;
+ P->flags_res = 0x7;
+ V = P->type_flags;

@type_flags_0_flags_res_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0xe00;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->flags_res = 0x7;
+ V = P->type_flags;

@type_flags_0_flags_res_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0xe00;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->flags_res = 0x7;
+ V = P->type_flags;

@type_flags_0_flags_res_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high & 0xf1 | (H & 0x7) << 1;
+ P->flags_res = H & 0x7;

@type_flags_0_flags_res_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high & 0xf1;
+ P->flags_res = 0;

@type_flags_0_flags_res_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high | 0xe;
+ P->flags_res = 0x7;

@type_flags_0_flags_res_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = (H ^ P->type_flags_high) & 0xe ^ P->type_flags_high;
+ P->flags_res = (H >> 1) & 0x7;

@type_flags_0_flags_res_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = (P->type_flags_high ^ H) & 0xe ^ P->type_flags_high;
+ P->flags_res = (H >> 1) & 0x7;

@type_flags_0_enchanted_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0xefff | (H & 0x1) << 12;
+ P->enchanted = H & 0x1;

@type_flags_0_enchanted_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xefff | (H & 0x1) << 12;
- P->type_flags = (ushort)V;
+ P->enchanted = H & 0x1;
+ V = P->type_flags;

@type_flags_0_enchanted_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xefff | (H & 0x1) << 12;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->enchanted = H & 0x1;
+ V = P->type_flags;

@type_flags_0_enchanted_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xefff | (H & 0x1) << 12;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->enchanted = H & 0x1;
+ V = P->type_flags;

@type_flags_0_enchanted_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0xefff;
+ P->enchanted = 0x0;

@type_flags_0_enchanted_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xefff;
- P->type_flags = (ushort)V;
+ P->enchanted = 0x0;
+ V = P->type_flags;

@type_flags_0_enchanted_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xefff;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->enchanted = 0x0;
+ V = P->type_flags;

@type_flags_0_enchanted_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xefff;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->enchanted = 0x0;
+ V = P->type_flags;

@type_flags_0_enchanted_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags | 0x1000;
+ P->enchanted = 0x1;

@type_flags_0_enchanted_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x1000;
- P->type_flags = (ushort)V;
+ P->enchanted = 0x1;
+ V = P->type_flags;

@type_flags_0_enchanted_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x1000;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->enchanted = 0x1;
+ V = P->type_flags;

@type_flags_0_enchanted_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x1000;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->enchanted = 0x1;
+ V = P->type_flags;

@type_flags_0_enchanted_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high & 0xef | (H & 0x1) << 4;
+ P->enchanted = H & 0x1;

@type_flags_0_enchanted_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high & 0xef;
+ P->enchanted = 0;

@type_flags_0_enchanted_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high | 0x10;
+ P->enchanted = 0x1;

@type_flags_0_enchanted_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = (H ^ P->type_flags_high) & 0x10 ^ P->type_flags_high;
+ P->enchanted = (H >> 4) & 0x1;

@type_flags_0_enchanted_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = (P->type_flags_high ^ H) & 0x10 ^ P->type_flags_high;
+ P->enchanted = (H >> 4) & 0x1;

@type_flags_0_doordir_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0xdfff | (H & 0x1) << 13;
+ P->doordir = H & 0x1;

@type_flags_0_doordir_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xdfff | (H & 0x1) << 13;
- P->type_flags = (ushort)V;
+ P->doordir = H & 0x1;
+ V = P->type_flags;

@type_flags_0_doordir_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xdfff | (H & 0x1) << 13;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->doordir = H & 0x1;
+ V = P->type_flags;

@type_flags_0_doordir_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xdfff | (H & 0x1) << 13;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->doordir = H & 0x1;
+ V = P->type_flags;

@type_flags_0_doordir_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0xdfff;
+ P->doordir = 0x0;

@type_flags_0_doordir_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xdfff;
- P->type_flags = (ushort)V;
+ P->doordir = 0x0;
+ V = P->type_flags;

@type_flags_0_doordir_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xdfff;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->doordir = 0x0;
+ V = P->type_flags;

@type_flags_0_doordir_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xdfff;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->doordir = 0x0;
+ V = P->type_flags;

@type_flags_0_doordir_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags | 0x2000;
+ P->doordir = 0x1;

@type_flags_0_doordir_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x2000;
- P->type_flags = (ushort)V;
+ P->doordir = 0x1;
+ V = P->type_flags;

@type_flags_0_doordir_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x2000;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->doordir = 0x1;
+ V = P->type_flags;

@type_flags_0_doordir_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x2000;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->doordir = 0x1;
+ V = P->type_flags;

@type_flags_0_doordir_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high & 0xdf | (H & 0x1) << 5;
+ P->doordir = H & 0x1;

@type_flags_0_doordir_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high & 0xdf;
+ P->doordir = 0;

@type_flags_0_doordir_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high | 0x20;
+ P->doordir = 0x1;

@type_flags_0_doordir_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = (H ^ P->type_flags_high) & 0x20 ^ P->type_flags_high;
+ P->doordir = (H >> 5) & 0x1;

@type_flags_0_doordir_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = (P->type_flags_high ^ H) & 0x20 ^ P->type_flags_high;
+ P->doordir = (H >> 5) & 0x1;

@type_flags_0_invisible_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0xbfff | (H & 0x1) << 14;
+ P->invisible = H & 0x1;

@type_flags_0_invisible_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xbfff | (H & 0x1) << 14;
- P->type_flags = (ushort)V;
+ P->invisible = H & 0x1;
+ V = P->type_flags;

@type_flags_0_invisible_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xbfff | (H & 0x1) << 14;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->invisible = H & 0x1;
+ V = P->type_flags;

@type_flags_0_invisible_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xbfff | (H & 0x1) << 14;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->invisible = H & 0x1;
+ V = P->type_flags;

@type_flags_0_invisible_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0xbfff;
+ P->invisible = 0x0;

@type_flags_0_invisible_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xbfff;
- P->type_flags = (ushort)V;
+ P->invisible = 0x0;
+ V = P->type_flags;

@type_flags_0_invisible_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xbfff;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->invisible = 0x0;
+ V = P->type_flags;

@type_flags_0_invisible_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0xbfff;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->invisible = 0x0;
+ V = P->type_flags;

@type_flags_0_invisible_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags | 0x4000;
+ P->invisible = 0x1;

@type_flags_0_invisible_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x4000;
- P->type_flags = (ushort)V;
+ P->invisible = 0x1;
+ V = P->type_flags;

@type_flags_0_invisible_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x4000;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->invisible = 0x1;
+ V = P->type_flags;

@type_flags_0_invisible_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x4000;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->invisible = 0x1;
+ V = P->type_flags;

@type_flags_0_invisible_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high & 0xbf | (H & 0x1) << 6;
+ P->invisible = H & 0x1;

@type_flags_0_invisible_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high & 0xbf;
+ P->invisible = 0;

@type_flags_0_invisible_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high | 0x40;
+ P->invisible = 0x1;

@type_flags_0_invisible_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = (H ^ P->type_flags_high) & 0x40 ^ P->type_flags_high;
+ P->invisible = (H >> 6) & 0x1;

@type_flags_0_invisible_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = (P->type_flags_high ^ H) & 0x40 ^ P->type_flags_high;
+ P->invisible = (H >> 6) & 0x1;

@type_flags_0_is_quant_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0x7fff | (H & 0x1) << 15;
+ P->is_quant = H & 0x1;

@type_flags_0_is_quant_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0x7fff | (H & 0x1) << 15;
- P->type_flags = (ushort)V;
+ P->is_quant = H & 0x1;
+ V = P->type_flags;

@type_flags_0_is_quant_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0x7fff | (H & 0x1) << 15;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->is_quant = H & 0x1;
+ V = P->type_flags;

@type_flags_0_is_quant_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0x7fff | (H & 0x1) << 15;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->is_quant = H & 0x1;
+ V = P->type_flags;

@type_flags_0_is_quant_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags & 0x7fff;
+ P->is_quant = 0x0;

@type_flags_0_is_quant_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0x7fff;
- P->type_flags = (ushort)V;
+ P->is_quant = 0x0;
+ V = P->type_flags;

@type_flags_0_is_quant_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0x7fff;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->is_quant = 0x0;
+ V = P->type_flags;

@type_flags_0_is_quant_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags & 0x7fff;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->is_quant = 0x0;
+ V = P->type_flags;

@type_flags_0_is_quant_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags = P->type_flags | 0x8000;
+ P->is_quant = 0x1;

@type_flags_0_is_quant_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x8000;
- P->type_flags = (ushort)V;
+ P->is_quant = 0x1;
+ V = P->type_flags;

@type_flags_0_is_quant_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x8000;
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->is_quant = 0x1;
+ V = P->type_flags;

@type_flags_0_is_quant_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->type_flags | 0x8000;
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->is_quant = 0x1;
+ V = P->type_flags;

@type_flags_0_is_quant_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high & 0x7f | (H & 0x1) << 7;
+ P->is_quant = H & 0x1;

@type_flags_0_is_quant_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high & 0x7f;
+ P->is_quant = 0;

@type_flags_0_is_quant_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = P->type_flags_high | 0x80;
+ P->is_quant = 0x1;

@type_flags_0_is_quant_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = (H ^ P->type_flags_high) & 0x80 ^ P->type_flags_high;
+ P->is_quant = (H >> 7) & 0x1;

@type_flags_0_is_quant_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->type_flags_high = (P->type_flags_high ^ H) & 0x80 ^ P->type_flags_high;
+ P->is_quant = (H >> 7) & 0x1;

@type_flags_1_item_id_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0xfe00 | H & 0x1ff;
+ P.item_id = H & 0x1ff;

@type_flags_1_item_id_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xfe00 | H & 0x1ff;
- P.type_flags = (ushort)V;
+ P.item_id = H & 0x1ff;
+ V = P.type_flags;

@type_flags_1_item_id_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xfe00 | H & 0x1ff;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.item_id = H & 0x1ff;
+ V = P.type_flags;

@type_flags_1_item_id_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xfe00 | H & 0x1ff;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.item_id = H & 0x1ff;
+ V = P.type_flags;

@type_flags_1_item_id_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0xfe00;
+ P.item_id = 0x0;

@type_flags_1_item_id_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xfe00;
- P.type_flags = (ushort)V;
+ P.item_id = 0x0;
+ V = P.type_flags;

@type_flags_1_item_id_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xfe00;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.item_id = 0x0;
+ V = P.type_flags;

@type_flags_1_item_id_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xfe00;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.item_id = 0x0;
+ V = P.type_flags;

@type_flags_1_item_id_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags | 0x1ff;
+ P.item_id = 0x1ff;

@type_flags_1_item_id_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x1ff;
- P.type_flags = (ushort)V;
+ P.item_id = 0x1ff;
+ V = P.type_flags;

@type_flags_1_item_id_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x1ff;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.item_id = 0x1ff;
+ V = P.type_flags;

@type_flags_1_item_id_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x1ff;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.item_id = 0x1ff;
+ V = P.type_flags;

@type_flags_1_flags_res_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0xf1ff | (H & 0x7) << 9;
+ P.flags_res = H & 0x7;

@type_flags_1_flags_res_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xf1ff | (H & 0x7) << 9;
- P.type_flags = (ushort)V;
+ P.flags_res = H & 0x7;
+ V = P.type_flags;

@type_flags_1_flags_res_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xf1ff | (H & 0x7) << 9;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.flags_res = H & 0x7;
+ V = P.type_flags;

@type_flags_1_flags_res_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xf1ff | (H & 0x7) << 9;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.flags_res = H & 0x7;
+ V = P.type_flags;

@type_flags_1_flags_res_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0xf1ff;
+ P.flags_res = 0x0;

@type_flags_1_flags_res_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xf1ff;
- P.type_flags = (ushort)V;
+ P.flags_res = 0x0;
+ V = P.type_flags;

@type_flags_1_flags_res_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xf1ff;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.flags_res = 0x0;
+ V = P.type_flags;

@type_flags_1_flags_res_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xf1ff;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.flags_res = 0x0;
+ V = P.type_flags;

@type_flags_1_flags_res_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags | 0xe00;
+ P.flags_res = 0x7;

@type_flags_1_flags_res_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0xe00;
- P.type_flags = (ushort)V;
+ P.flags_res = 0x7;
+ V = P.type_flags;

@type_flags_1_flags_res_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0xe00;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.flags_res = 0x7;
+ V = P.type_flags;

@type_flags_1_flags_res_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0xe00;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.flags_res = 0x7;
+ V = P.type_flags;

@type_flags_1_flags_res_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high & 0xf1 | (H & 0x7) << 1;
+ P.flags_res = H & 0x7;

@type_flags_1_flags_res_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high & 0xf1;
+ P.flags_res = 0;

@type_flags_1_flags_res_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high | 0xe;
+ P.flags_res = 0x7;

@type_flags_1_flags_res_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = (H ^ P.type_flags_high) & 0xe ^ P.type_flags_high;
+ P.flags_res = (H >> 1) & 0x7;

@type_flags_1_flags_res_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = (P.type_flags_high ^ H) & 0xe ^ P.type_flags_high;
+ P.flags_res = (H >> 1) & 0x7;

@type_flags_1_enchanted_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0xefff | (H & 0x1) << 12;
+ P.enchanted = H & 0x1;

@type_flags_1_enchanted_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xefff | (H & 0x1) << 12;
- P.type_flags = (ushort)V;
+ P.enchanted = H & 0x1;
+ V = P.type_flags;

@type_flags_1_enchanted_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xefff | (H & 0x1) << 12;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.enchanted = H & 0x1;
+ V = P.type_flags;

@type_flags_1_enchanted_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xefff | (H & 0x1) << 12;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.enchanted = H & 0x1;
+ V = P.type_flags;

@type_flags_1_enchanted_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0xefff;
+ P.enchanted = 0x0;

@type_flags_1_enchanted_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xefff;
- P.type_flags = (ushort)V;
+ P.enchanted = 0x0;
+ V = P.type_flags;

@type_flags_1_enchanted_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xefff;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.enchanted = 0x0;
+ V = P.type_flags;

@type_flags_1_enchanted_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xefff;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.enchanted = 0x0;
+ V = P.type_flags;

@type_flags_1_enchanted_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags | 0x1000;
+ P.enchanted = 0x1;

@type_flags_1_enchanted_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x1000;
- P.type_flags = (ushort)V;
+ P.enchanted = 0x1;
+ V = P.type_flags;

@type_flags_1_enchanted_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x1000;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.enchanted = 0x1;
+ V = P.type_flags;

@type_flags_1_enchanted_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x1000;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.enchanted = 0x1;
+ V = P.type_flags;

@type_flags_1_enchanted_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high & 0xef | (H & 0x1) << 4;
+ P.enchanted = H & 0x1;

@type_flags_1_enchanted_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high & 0xef;
+ P.enchanted = 0;

@type_flags_1_enchanted_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high | 0x10;
+ P.enchanted = 0x1;

@type_flags_1_enchanted_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = (H ^ P.type_flags_high) & 0x10 ^ P.type_flags_high;
+ P.enchanted = (H >> 4) & 0x1;

@type_flags_1_enchanted_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = (P.type_flags_high ^ H) & 0x10 ^ P.type_flags_high;
+ P.enchanted = (H >> 4) & 0x1;

@type_flags_1_doordir_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0xdfff | (H & 0x1) << 13;
+ P.doordir = H & 0x1;

@type_flags_1_doordir_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xdfff | (H & 0x1) << 13;
- P.type_flags = (ushort)V;
+ P.doordir = H & 0x1;
+ V = P.type_flags;

@type_flags_1_doordir_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xdfff | (H & 0x1) << 13;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.doordir = H & 0x1;
+ V = P.type_flags;

@type_flags_1_doordir_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xdfff | (H & 0x1) << 13;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.doordir = H & 0x1;
+ V = P.type_flags;

@type_flags_1_doordir_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0xdfff;
+ P.doordir = 0x0;

@type_flags_1_doordir_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xdfff;
- P.type_flags = (ushort)V;
+ P.doordir = 0x0;
+ V = P.type_flags;

@type_flags_1_doordir_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xdfff;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.doordir = 0x0;
+ V = P.type_flags;

@type_flags_1_doordir_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xdfff;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.doordir = 0x0;
+ V = P.type_flags;

@type_flags_1_doordir_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags | 0x2000;
+ P.doordir = 0x1;

@type_flags_1_doordir_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x2000;
- P.type_flags = (ushort)V;
+ P.doordir = 0x1;
+ V = P.type_flags;

@type_flags_1_doordir_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x2000;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.doordir = 0x1;
+ V = P.type_flags;

@type_flags_1_doordir_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x2000;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.doordir = 0x1;
+ V = P.type_flags;

@type_flags_1_doordir_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high & 0xdf | (H & 0x1) << 5;
+ P.doordir = H & 0x1;

@type_flags_1_doordir_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high & 0xdf;
+ P.doordir = 0;

@type_flags_1_doordir_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high | 0x20;
+ P.doordir = 0x1;

@type_flags_1_doordir_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = (H ^ P.type_flags_high) & 0x20 ^ P.type_flags_high;
+ P.doordir = (H >> 5) & 0x1;

@type_flags_1_doordir_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = (P.type_flags_high ^ H) & 0x20 ^ P.type_flags_high;
+ P.doordir = (H >> 5) & 0x1;

@type_flags_1_invisible_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0xbfff | (H & 0x1) << 14;
+ P.invisible = H & 0x1;

@type_flags_1_invisible_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xbfff | (H & 0x1) << 14;
- P.type_flags = (ushort)V;
+ P.invisible = H & 0x1;
+ V = P.type_flags;

@type_flags_1_invisible_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xbfff | (H & 0x1) << 14;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.invisible = H & 0x1;
+ V = P.type_flags;

@type_flags_1_invisible_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xbfff | (H & 0x1) << 14;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.invisible = H & 0x1;
+ V = P.type_flags;

@type_flags_1_invisible_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0xbfff;
+ P.invisible = 0x0;

@type_flags_1_invisible_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xbfff;
- P.type_flags = (ushort)V;
+ P.invisible = 0x0;
+ V = P.type_flags;

@type_flags_1_invisible_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xbfff;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.invisible = 0x0;
+ V = P.type_flags;

@type_flags_1_invisible_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0xbfff;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.invisible = 0x0;
+ V = P.type_flags;

@type_flags_1_invisible_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags | 0x4000;
+ P.invisible = 0x1;

@type_flags_1_invisible_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x4000;
- P.type_flags = (ushort)V;
+ P.invisible = 0x1;
+ V = P.type_flags;

@type_flags_1_invisible_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x4000;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.invisible = 0x1;
+ V = P.type_flags;

@type_flags_1_invisible_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x4000;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.invisible = 0x1;
+ V = P.type_flags;

@type_flags_1_invisible_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high & 0xbf | (H & 0x1) << 6;
+ P.invisible = H & 0x1;

@type_flags_1_invisible_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high & 0xbf;
+ P.invisible = 0;

@type_flags_1_invisible_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high | 0x40;
+ P.invisible = 0x1;

@type_flags_1_invisible_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = (H ^ P.type_flags_high) & 0x40 ^ P.type_flags_high;
+ P.invisible = (H >> 6) & 0x1;

@type_flags_1_invisible_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = (P.type_flags_high ^ H) & 0x40 ^ P.type_flags_high;
+ P.invisible = (H >> 6) & 0x1;

@type_flags_1_is_quant_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0x7fff | (H & 0x1) << 15;
+ P.is_quant = H & 0x1;

@type_flags_1_is_quant_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0x7fff | (H & 0x1) << 15;
- P.type_flags = (ushort)V;
+ P.is_quant = H & 0x1;
+ V = P.type_flags;

@type_flags_1_is_quant_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0x7fff | (H & 0x1) << 15;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.is_quant = H & 0x1;
+ V = P.type_flags;

@type_flags_1_is_quant_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0x7fff | (H & 0x1) << 15;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.is_quant = H & 0x1;
+ V = P.type_flags;

@type_flags_1_is_quant_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags & 0x7fff;
+ P.is_quant = 0x0;

@type_flags_1_is_quant_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0x7fff;
- P.type_flags = (ushort)V;
+ P.is_quant = 0x0;
+ V = P.type_flags;

@type_flags_1_is_quant_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0x7fff;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.is_quant = 0x0;
+ V = P.type_flags;

@type_flags_1_is_quant_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags & 0x7fff;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.is_quant = 0x0;
+ V = P.type_flags;

@type_flags_1_is_quant_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags = P.type_flags | 0x8000;
+ P.is_quant = 0x1;

@type_flags_1_is_quant_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x8000;
- P.type_flags = (ushort)V;
+ P.is_quant = 0x1;
+ V = P.type_flags;

@type_flags_1_is_quant_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x8000;
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.is_quant = 0x1;
+ V = P.type_flags;

@type_flags_1_is_quant_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.type_flags | 0x8000;
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.is_quant = 0x1;
+ V = P.type_flags;

@type_flags_1_is_quant_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high & 0x7f | (H & 0x1) << 7;
+ P.is_quant = H & 0x1;

@type_flags_1_is_quant_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high & 0x7f;
+ P.is_quant = 0;

@type_flags_1_is_quant_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = P.type_flags_high | 0x80;
+ P.is_quant = 0x1;

@type_flags_1_is_quant_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = (H ^ P.type_flags_high) & 0x80 ^ P.type_flags_high;
+ P.is_quant = (H >> 7) & 0x1;

@type_flags_1_is_quant_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.type_flags_high = (P.type_flags_high ^ H) & 0x80 ^ P.type_flags_high;
+ P.is_quant = (H >> 7) & 0x1;

@type_flags_2_item_id_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0xfe00 | H & 0x1ff;
+ P->hdr.item_id = H & 0x1ff;

@type_flags_2_item_id_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xfe00 | H & 0x1ff;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.item_id = H & 0x1ff;
+ V = P->hdr.type_flags;

@type_flags_2_item_id_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xfe00 | H & 0x1ff;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.item_id = H & 0x1ff;
+ V = P->hdr.type_flags;

@type_flags_2_item_id_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xfe00 | H & 0x1ff;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.item_id = H & 0x1ff;
+ V = P->hdr.type_flags;

@type_flags_2_item_id_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0xfe00;
+ P->hdr.item_id = 0x0;

@type_flags_2_item_id_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xfe00;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.item_id = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_item_id_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xfe00;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.item_id = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_item_id_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xfe00;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.item_id = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_item_id_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags | 0x1ff;
+ P->hdr.item_id = 0x1ff;

@type_flags_2_item_id_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x1ff;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.item_id = 0x1ff;
+ V = P->hdr.type_flags;

@type_flags_2_item_id_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x1ff;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.item_id = 0x1ff;
+ V = P->hdr.type_flags;

@type_flags_2_item_id_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x1ff;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.item_id = 0x1ff;
+ V = P->hdr.type_flags;

@type_flags_2_flags_res_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
+ P->hdr.flags_res = H & 0x7;

@type_flags_2_flags_res_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.flags_res = H & 0x7;
+ V = P->hdr.type_flags;

@type_flags_2_flags_res_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.flags_res = H & 0x7;
+ V = P->hdr.type_flags;

@type_flags_2_flags_res_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.flags_res = H & 0x7;
+ V = P->hdr.type_flags;

@type_flags_2_flags_res_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0xf1ff;
+ P->hdr.flags_res = 0x0;

@type_flags_2_flags_res_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xf1ff;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.flags_res = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_flags_res_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xf1ff;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.flags_res = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_flags_res_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xf1ff;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.flags_res = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_flags_res_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags | 0xe00;
+ P->hdr.flags_res = 0x7;

@type_flags_2_flags_res_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0xe00;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.flags_res = 0x7;
+ V = P->hdr.type_flags;

@type_flags_2_flags_res_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0xe00;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.flags_res = 0x7;
+ V = P->hdr.type_flags;

@type_flags_2_flags_res_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0xe00;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.flags_res = 0x7;
+ V = P->hdr.type_flags;

@type_flags_2_flags_res_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high & 0xf1 | (H & 0x7) << 1;
+ P->hdr.flags_res = H & 0x7;

@type_flags_2_flags_res_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high & 0xf1;
+ P->hdr.flags_res = 0;

@type_flags_2_flags_res_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high | 0xe;
+ P->hdr.flags_res = 0x7;

@type_flags_2_flags_res_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = (H ^ P->hdr.type_flags_high) & 0xe ^ P->hdr.type_flags_high;
+ P->hdr.flags_res = (H >> 1) & 0x7;

@type_flags_2_flags_res_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = (P->hdr.type_flags_high ^ H) & 0xe ^ P->hdr.type_flags_high;
+ P->hdr.flags_res = (H >> 1) & 0x7;

@type_flags_2_enchanted_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0xefff | (H & 0x1) << 12;
+ P->hdr.enchanted = H & 0x1;

@type_flags_2_enchanted_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xefff | (H & 0x1) << 12;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.enchanted = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_enchanted_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xefff | (H & 0x1) << 12;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.enchanted = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_enchanted_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xefff | (H & 0x1) << 12;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.enchanted = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_enchanted_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0xefff;
+ P->hdr.enchanted = 0x0;

@type_flags_2_enchanted_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xefff;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.enchanted = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_enchanted_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xefff;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.enchanted = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_enchanted_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xefff;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.enchanted = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_enchanted_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags | 0x1000;
+ P->hdr.enchanted = 0x1;

@type_flags_2_enchanted_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x1000;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.enchanted = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_enchanted_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x1000;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.enchanted = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_enchanted_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x1000;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.enchanted = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_enchanted_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high & 0xef | (H & 0x1) << 4;
+ P->hdr.enchanted = H & 0x1;

@type_flags_2_enchanted_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high & 0xef;
+ P->hdr.enchanted = 0;

@type_flags_2_enchanted_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high | 0x10;
+ P->hdr.enchanted = 0x1;

@type_flags_2_enchanted_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = (H ^ P->hdr.type_flags_high) & 0x10 ^ P->hdr.type_flags_high;
+ P->hdr.enchanted = (H >> 4) & 0x1;

@type_flags_2_enchanted_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = (P->hdr.type_flags_high ^ H) & 0x10 ^ P->hdr.type_flags_high;
+ P->hdr.enchanted = (H >> 4) & 0x1;

@type_flags_2_doordir_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0xdfff | (H & 0x1) << 13;
+ P->hdr.doordir = H & 0x1;

@type_flags_2_doordir_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xdfff | (H & 0x1) << 13;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.doordir = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_doordir_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xdfff | (H & 0x1) << 13;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.doordir = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_doordir_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xdfff | (H & 0x1) << 13;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.doordir = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_doordir_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0xdfff;
+ P->hdr.doordir = 0x0;

@type_flags_2_doordir_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xdfff;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.doordir = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_doordir_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xdfff;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.doordir = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_doordir_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xdfff;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.doordir = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_doordir_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags | 0x2000;
+ P->hdr.doordir = 0x1;

@type_flags_2_doordir_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x2000;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.doordir = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_doordir_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x2000;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.doordir = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_doordir_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x2000;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.doordir = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_doordir_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high & 0xdf | (H & 0x1) << 5;
+ P->hdr.doordir = H & 0x1;

@type_flags_2_doordir_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high & 0xdf;
+ P->hdr.doordir = 0;

@type_flags_2_doordir_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high | 0x20;
+ P->hdr.doordir = 0x1;

@type_flags_2_doordir_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = (H ^ P->hdr.type_flags_high) & 0x20 ^ P->hdr.type_flags_high;
+ P->hdr.doordir = (H >> 5) & 0x1;

@type_flags_2_doordir_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = (P->hdr.type_flags_high ^ H) & 0x20 ^ P->hdr.type_flags_high;
+ P->hdr.doordir = (H >> 5) & 0x1;

@type_flags_2_invisible_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0xbfff | (H & 0x1) << 14;
+ P->hdr.invisible = H & 0x1;

@type_flags_2_invisible_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xbfff | (H & 0x1) << 14;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.invisible = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_invisible_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xbfff | (H & 0x1) << 14;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.invisible = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_invisible_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xbfff | (H & 0x1) << 14;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.invisible = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_invisible_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0xbfff;
+ P->hdr.invisible = 0x0;

@type_flags_2_invisible_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xbfff;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.invisible = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_invisible_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xbfff;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.invisible = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_invisible_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0xbfff;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.invisible = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_invisible_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags | 0x4000;
+ P->hdr.invisible = 0x1;

@type_flags_2_invisible_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x4000;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.invisible = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_invisible_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x4000;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.invisible = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_invisible_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x4000;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.invisible = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_invisible_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high & 0xbf | (H & 0x1) << 6;
+ P->hdr.invisible = H & 0x1;

@type_flags_2_invisible_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high & 0xbf;
+ P->hdr.invisible = 0;

@type_flags_2_invisible_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high | 0x40;
+ P->hdr.invisible = 0x1;

@type_flags_2_invisible_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = (H ^ P->hdr.type_flags_high) & 0x40 ^ P->hdr.type_flags_high;
+ P->hdr.invisible = (H >> 6) & 0x1;

@type_flags_2_invisible_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = (P->hdr.type_flags_high ^ H) & 0x40 ^ P->hdr.type_flags_high;
+ P->hdr.invisible = (H >> 6) & 0x1;

@type_flags_2_is_quant_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0x7fff | (H & 0x1) << 15;
+ P->hdr.is_quant = H & 0x1;

@type_flags_2_is_quant_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0x7fff | (H & 0x1) << 15;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.is_quant = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_is_quant_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0x7fff | (H & 0x1) << 15;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.is_quant = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_is_quant_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0x7fff | (H & 0x1) << 15;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.is_quant = H & 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_is_quant_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags & 0x7fff;
+ P->hdr.is_quant = 0x0;

@type_flags_2_is_quant_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0x7fff;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.is_quant = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_is_quant_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0x7fff;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.is_quant = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_is_quant_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags & 0x7fff;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.is_quant = 0x0;
+ V = P->hdr.type_flags;

@type_flags_2_is_quant_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags = P->hdr.type_flags | 0x8000;
+ P->hdr.is_quant = 0x1;

@type_flags_2_is_quant_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x8000;
- P->hdr.type_flags = (ushort)V;
+ P->hdr.is_quant = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_is_quant_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x8000;
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.is_quant = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_is_quant_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.type_flags | 0x8000;
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.is_quant = 0x1;
+ V = P->hdr.type_flags;

@type_flags_2_is_quant_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high & 0x7f | (H & 0x1) << 7;
+ P->hdr.is_quant = H & 0x1;

@type_flags_2_is_quant_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high & 0x7f;
+ P->hdr.is_quant = 0;

@type_flags_2_is_quant_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = P->hdr.type_flags_high | 0x80;
+ P->hdr.is_quant = 0x1;

@type_flags_2_is_quant_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = (H ^ P->hdr.type_flags_high) & 0x80 ^ P->hdr.type_flags_high;
+ P->hdr.is_quant = (H >> 7) & 0x1;

@type_flags_2_is_quant_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.type_flags_high = (P->hdr.type_flags_high ^ H) & 0x80 ^ P->hdr.type_flags_high;
+ P->hdr.is_quant = (H >> 7) & 0x1;

@type_flags_3_item_id_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0xfe00 | H & 0x1ff;
+ P.hdr.item_id = H & 0x1ff;

@type_flags_3_item_id_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xfe00 | H & 0x1ff;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.item_id = H & 0x1ff;
+ V = P.hdr.type_flags;

@type_flags_3_item_id_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xfe00 | H & 0x1ff;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.item_id = H & 0x1ff;
+ V = P.hdr.type_flags;

@type_flags_3_item_id_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xfe00 | H & 0x1ff;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.item_id = H & 0x1ff;
+ V = P.hdr.type_flags;

@type_flags_3_item_id_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0xfe00;
+ P.hdr.item_id = 0x0;

@type_flags_3_item_id_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xfe00;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.item_id = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_item_id_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xfe00;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.item_id = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_item_id_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xfe00;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.item_id = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_item_id_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags | 0x1ff;
+ P.hdr.item_id = 0x1ff;

@type_flags_3_item_id_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x1ff;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.item_id = 0x1ff;
+ V = P.hdr.type_flags;

@type_flags_3_item_id_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x1ff;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.item_id = 0x1ff;
+ V = P.hdr.type_flags;

@type_flags_3_item_id_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x1ff;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.item_id = 0x1ff;
+ V = P.hdr.type_flags;

@type_flags_3_flags_res_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
+ P.hdr.flags_res = H & 0x7;

@type_flags_3_flags_res_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.flags_res = H & 0x7;
+ V = P.hdr.type_flags;

@type_flags_3_flags_res_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.flags_res = H & 0x7;
+ V = P.hdr.type_flags;

@type_flags_3_flags_res_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.flags_res = H & 0x7;
+ V = P.hdr.type_flags;

@type_flags_3_flags_res_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0xf1ff;
+ P.hdr.flags_res = 0x0;

@type_flags_3_flags_res_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xf1ff;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.flags_res = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_flags_res_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xf1ff;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.flags_res = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_flags_res_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xf1ff;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.flags_res = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_flags_res_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags | 0xe00;
+ P.hdr.flags_res = 0x7;

@type_flags_3_flags_res_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0xe00;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.flags_res = 0x7;
+ V = P.hdr.type_flags;

@type_flags_3_flags_res_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0xe00;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.flags_res = 0x7;
+ V = P.hdr.type_flags;

@type_flags_3_flags_res_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0xe00;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.flags_res = 0x7;
+ V = P.hdr.type_flags;

@type_flags_3_flags_res_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high & 0xf1 | (H & 0x7) << 1;
+ P.hdr.flags_res = H & 0x7;

@type_flags_3_flags_res_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high & 0xf1;
+ P.hdr.flags_res = 0;

@type_flags_3_flags_res_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high | 0xe;
+ P.hdr.flags_res = 0x7;

@type_flags_3_flags_res_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = (H ^ P.hdr.type_flags_high) & 0xe ^ P.hdr.type_flags_high;
+ P.hdr.flags_res = (H >> 1) & 0x7;

@type_flags_3_flags_res_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = (P.hdr.type_flags_high ^ H) & 0xe ^ P.hdr.type_flags_high;
+ P.hdr.flags_res = (H >> 1) & 0x7;

@type_flags_3_enchanted_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0xefff | (H & 0x1) << 12;
+ P.hdr.enchanted = H & 0x1;

@type_flags_3_enchanted_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xefff | (H & 0x1) << 12;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.enchanted = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_enchanted_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xefff | (H & 0x1) << 12;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.enchanted = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_enchanted_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xefff | (H & 0x1) << 12;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.enchanted = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_enchanted_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0xefff;
+ P.hdr.enchanted = 0x0;

@type_flags_3_enchanted_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xefff;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.enchanted = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_enchanted_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xefff;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.enchanted = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_enchanted_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xefff;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.enchanted = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_enchanted_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags | 0x1000;
+ P.hdr.enchanted = 0x1;

@type_flags_3_enchanted_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x1000;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.enchanted = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_enchanted_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x1000;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.enchanted = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_enchanted_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x1000;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.enchanted = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_enchanted_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high & 0xef | (H & 0x1) << 4;
+ P.hdr.enchanted = H & 0x1;

@type_flags_3_enchanted_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high & 0xef;
+ P.hdr.enchanted = 0;

@type_flags_3_enchanted_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high | 0x10;
+ P.hdr.enchanted = 0x1;

@type_flags_3_enchanted_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = (H ^ P.hdr.type_flags_high) & 0x10 ^ P.hdr.type_flags_high;
+ P.hdr.enchanted = (H >> 4) & 0x1;

@type_flags_3_enchanted_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = (P.hdr.type_flags_high ^ H) & 0x10 ^ P.hdr.type_flags_high;
+ P.hdr.enchanted = (H >> 4) & 0x1;

@type_flags_3_doordir_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0xdfff | (H & 0x1) << 13;
+ P.hdr.doordir = H & 0x1;

@type_flags_3_doordir_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xdfff | (H & 0x1) << 13;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.doordir = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_doordir_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xdfff | (H & 0x1) << 13;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.doordir = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_doordir_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xdfff | (H & 0x1) << 13;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.doordir = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_doordir_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0xdfff;
+ P.hdr.doordir = 0x0;

@type_flags_3_doordir_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xdfff;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.doordir = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_doordir_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xdfff;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.doordir = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_doordir_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xdfff;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.doordir = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_doordir_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags | 0x2000;
+ P.hdr.doordir = 0x1;

@type_flags_3_doordir_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x2000;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.doordir = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_doordir_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x2000;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.doordir = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_doordir_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x2000;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.doordir = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_doordir_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high & 0xdf | (H & 0x1) << 5;
+ P.hdr.doordir = H & 0x1;

@type_flags_3_doordir_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high & 0xdf;
+ P.hdr.doordir = 0;

@type_flags_3_doordir_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high | 0x20;
+ P.hdr.doordir = 0x1;

@type_flags_3_doordir_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = (H ^ P.hdr.type_flags_high) & 0x20 ^ P.hdr.type_flags_high;
+ P.hdr.doordir = (H >> 5) & 0x1;

@type_flags_3_doordir_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = (P.hdr.type_flags_high ^ H) & 0x20 ^ P.hdr.type_flags_high;
+ P.hdr.doordir = (H >> 5) & 0x1;

@type_flags_3_invisible_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0xbfff | (H & 0x1) << 14;
+ P.hdr.invisible = H & 0x1;

@type_flags_3_invisible_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xbfff | (H & 0x1) << 14;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.invisible = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_invisible_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xbfff | (H & 0x1) << 14;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.invisible = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_invisible_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xbfff | (H & 0x1) << 14;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.invisible = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_invisible_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0xbfff;
+ P.hdr.invisible = 0x0;

@type_flags_3_invisible_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xbfff;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.invisible = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_invisible_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xbfff;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.invisible = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_invisible_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0xbfff;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.invisible = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_invisible_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags | 0x4000;
+ P.hdr.invisible = 0x1;

@type_flags_3_invisible_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x4000;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.invisible = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_invisible_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x4000;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.invisible = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_invisible_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x4000;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.invisible = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_invisible_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high & 0xbf | (H & 0x1) << 6;
+ P.hdr.invisible = H & 0x1;

@type_flags_3_invisible_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high & 0xbf;
+ P.hdr.invisible = 0;

@type_flags_3_invisible_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high | 0x40;
+ P.hdr.invisible = 0x1;

@type_flags_3_invisible_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = (H ^ P.hdr.type_flags_high) & 0x40 ^ P.hdr.type_flags_high;
+ P.hdr.invisible = (H >> 6) & 0x1;

@type_flags_3_invisible_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = (P.hdr.type_flags_high ^ H) & 0x40 ^ P.hdr.type_flags_high;
+ P.hdr.invisible = (H >> 6) & 0x1;

@type_flags_3_is_quant_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0x7fff | (H & 0x1) << 15;
+ P.hdr.is_quant = H & 0x1;

@type_flags_3_is_quant_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0x7fff | (H & 0x1) << 15;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.is_quant = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_is_quant_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0x7fff | (H & 0x1) << 15;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.is_quant = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_is_quant_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0x7fff | (H & 0x1) << 15;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.is_quant = H & 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_is_quant_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags & 0x7fff;
+ P.hdr.is_quant = 0x0;

@type_flags_3_is_quant_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0x7fff;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.is_quant = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_is_quant_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0x7fff;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.is_quant = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_is_quant_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags & 0x7fff;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.is_quant = 0x0;
+ V = P.hdr.type_flags;

@type_flags_3_is_quant_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags = P.hdr.type_flags | 0x8000;
+ P.hdr.is_quant = 0x1;

@type_flags_3_is_quant_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x8000;
- P.hdr.type_flags = (ushort)V;
+ P.hdr.is_quant = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_is_quant_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x8000;
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.is_quant = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_is_quant_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.type_flags | 0x8000;
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.is_quant = 0x1;
+ V = P.hdr.type_flags;

@type_flags_3_is_quant_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high & 0x7f | (H & 0x1) << 7;
+ P.hdr.is_quant = H & 0x1;

@type_flags_3_is_quant_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high & 0x7f;
+ P.hdr.is_quant = 0;

@type_flags_3_is_quant_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = P.hdr.type_flags_high | 0x80;
+ P.hdr.is_quant = 0x1;

@type_flags_3_is_quant_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = (H ^ P.hdr.type_flags_high) & 0x80 ^ P.hdr.type_flags_high;
+ P.hdr.is_quant = (H >> 7) & 0x1;

@type_flags_3_is_quant_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.type_flags_high = (P.hdr.type_flags_high ^ H) & 0x80 ^ P.hdr.type_flags_high;
+ P.hdr.is_quant = (H >> 7) & 0x1;

@type_flags_4_item_id_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0xfe00 | H & 0x1ff;
+ ((uw_object_hdr_t *)P)->item_id = H & 0x1ff;

@type_flags_4_item_id_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xfe00 | H & 0x1ff;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->item_id = H & 0x1ff;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_item_id_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xfe00 | H & 0x1ff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->item_id = H & 0x1ff;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_item_id_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xfe00 | H & 0x1ff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->item_id = H & 0x1ff;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_item_id_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0xfe00;
+ ((uw_object_hdr_t *)P)->item_id = 0x0;

@type_flags_4_item_id_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xfe00;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->item_id = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_item_id_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xfe00;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->item_id = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_item_id_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xfe00;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->item_id = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_item_id_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags | 0x1ff;
+ ((uw_object_hdr_t *)P)->item_id = 0x1ff;

@type_flags_4_item_id_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x1ff;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->item_id = 0x1ff;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_item_id_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x1ff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->item_id = 0x1ff;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_item_id_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x1ff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->item_id = 0x1ff;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_flags_res_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0xf1ff | (H & 0x7) << 9;
+ ((uw_object_hdr_t *)P)->flags_res = H & 0x7;

@type_flags_4_flags_res_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xf1ff | (H & 0x7) << 9;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->flags_res = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_flags_res_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xf1ff | (H & 0x7) << 9;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->flags_res = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_flags_res_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xf1ff | (H & 0x7) << 9;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->flags_res = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_flags_res_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0xf1ff;
+ ((uw_object_hdr_t *)P)->flags_res = 0x0;

@type_flags_4_flags_res_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xf1ff;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->flags_res = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_flags_res_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xf1ff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->flags_res = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_flags_res_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xf1ff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->flags_res = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_flags_res_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags | 0xe00;
+ ((uw_object_hdr_t *)P)->flags_res = 0x7;

@type_flags_4_flags_res_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0xe00;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->flags_res = 0x7;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_flags_res_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0xe00;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->flags_res = 0x7;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_flags_res_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0xe00;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->flags_res = 0x7;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_flags_res_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high & 0xf1 | (H & 0x7) << 1;
+ ((uw_object_hdr_t *)P)->flags_res = H & 0x7;

@type_flags_4_flags_res_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high & 0xf1;
+ ((uw_object_hdr_t *)P)->flags_res = 0;

@type_flags_4_flags_res_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high | 0xe;
+ ((uw_object_hdr_t *)P)->flags_res = 0x7;

@type_flags_4_flags_res_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = (H ^ ((uw_object_hdr_t *)P)->type_flags_high) & 0xe ^ ((uw_object_hdr_t *)P)->type_flags_high;
+ ((uw_object_hdr_t *)P)->flags_res = (H >> 1) & 0x7;

@type_flags_4_flags_res_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = (((uw_object_hdr_t *)P)->type_flags_high ^ H) & 0xe ^ ((uw_object_hdr_t *)P)->type_flags_high;
+ ((uw_object_hdr_t *)P)->flags_res = (H >> 1) & 0x7;

@type_flags_4_enchanted_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0xefff | (H & 0x1) << 12;
+ ((uw_object_hdr_t *)P)->enchanted = H & 0x1;

@type_flags_4_enchanted_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xefff | (H & 0x1) << 12;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->enchanted = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_enchanted_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xefff | (H & 0x1) << 12;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->enchanted = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_enchanted_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xefff | (H & 0x1) << 12;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->enchanted = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_enchanted_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0xefff;
+ ((uw_object_hdr_t *)P)->enchanted = 0x0;

@type_flags_4_enchanted_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xefff;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->enchanted = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_enchanted_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xefff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->enchanted = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_enchanted_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xefff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->enchanted = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_enchanted_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags | 0x1000;
+ ((uw_object_hdr_t *)P)->enchanted = 0x1;

@type_flags_4_enchanted_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x1000;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->enchanted = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_enchanted_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x1000;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->enchanted = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_enchanted_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x1000;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->enchanted = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_enchanted_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high & 0xef | (H & 0x1) << 4;
+ ((uw_object_hdr_t *)P)->enchanted = H & 0x1;

@type_flags_4_enchanted_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high & 0xef;
+ ((uw_object_hdr_t *)P)->enchanted = 0;

@type_flags_4_enchanted_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high | 0x10;
+ ((uw_object_hdr_t *)P)->enchanted = 0x1;

@type_flags_4_enchanted_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = (H ^ ((uw_object_hdr_t *)P)->type_flags_high) & 0x10 ^ ((uw_object_hdr_t *)P)->type_flags_high;
+ ((uw_object_hdr_t *)P)->enchanted = (H >> 4) & 0x1;

@type_flags_4_enchanted_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = (((uw_object_hdr_t *)P)->type_flags_high ^ H) & 0x10 ^ ((uw_object_hdr_t *)P)->type_flags_high;
+ ((uw_object_hdr_t *)P)->enchanted = (H >> 4) & 0x1;

@type_flags_4_doordir_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0xdfff | (H & 0x1) << 13;
+ ((uw_object_hdr_t *)P)->doordir = H & 0x1;

@type_flags_4_doordir_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xdfff | (H & 0x1) << 13;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->doordir = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_doordir_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xdfff | (H & 0x1) << 13;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->doordir = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_doordir_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xdfff | (H & 0x1) << 13;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->doordir = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_doordir_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0xdfff;
+ ((uw_object_hdr_t *)P)->doordir = 0x0;

@type_flags_4_doordir_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xdfff;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->doordir = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_doordir_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xdfff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->doordir = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_doordir_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xdfff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->doordir = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_doordir_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags | 0x2000;
+ ((uw_object_hdr_t *)P)->doordir = 0x1;

@type_flags_4_doordir_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x2000;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->doordir = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_doordir_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x2000;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->doordir = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_doordir_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x2000;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->doordir = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_doordir_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high & 0xdf | (H & 0x1) << 5;
+ ((uw_object_hdr_t *)P)->doordir = H & 0x1;

@type_flags_4_doordir_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high & 0xdf;
+ ((uw_object_hdr_t *)P)->doordir = 0;

@type_flags_4_doordir_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high | 0x20;
+ ((uw_object_hdr_t *)P)->doordir = 0x1;

@type_flags_4_doordir_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = (H ^ ((uw_object_hdr_t *)P)->type_flags_high) & 0x20 ^ ((uw_object_hdr_t *)P)->type_flags_high;
+ ((uw_object_hdr_t *)P)->doordir = (H >> 5) & 0x1;

@type_flags_4_doordir_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = (((uw_object_hdr_t *)P)->type_flags_high ^ H) & 0x20 ^ ((uw_object_hdr_t *)P)->type_flags_high;
+ ((uw_object_hdr_t *)P)->doordir = (H >> 5) & 0x1;

@type_flags_4_invisible_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0xbfff | (H & 0x1) << 14;
+ ((uw_object_hdr_t *)P)->invisible = H & 0x1;

@type_flags_4_invisible_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xbfff | (H & 0x1) << 14;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->invisible = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_invisible_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xbfff | (H & 0x1) << 14;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->invisible = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_invisible_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xbfff | (H & 0x1) << 14;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->invisible = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_invisible_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0xbfff;
+ ((uw_object_hdr_t *)P)->invisible = 0x0;

@type_flags_4_invisible_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xbfff;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->invisible = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_invisible_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xbfff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->invisible = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_invisible_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0xbfff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->invisible = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_invisible_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags | 0x4000;
+ ((uw_object_hdr_t *)P)->invisible = 0x1;

@type_flags_4_invisible_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x4000;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->invisible = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_invisible_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x4000;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->invisible = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_invisible_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x4000;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->invisible = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_invisible_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high & 0xbf | (H & 0x1) << 6;
+ ((uw_object_hdr_t *)P)->invisible = H & 0x1;

@type_flags_4_invisible_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high & 0xbf;
+ ((uw_object_hdr_t *)P)->invisible = 0;

@type_flags_4_invisible_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high | 0x40;
+ ((uw_object_hdr_t *)P)->invisible = 0x1;

@type_flags_4_invisible_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = (H ^ ((uw_object_hdr_t *)P)->type_flags_high) & 0x40 ^ ((uw_object_hdr_t *)P)->type_flags_high;
+ ((uw_object_hdr_t *)P)->invisible = (H >> 6) & 0x1;

@type_flags_4_invisible_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = (((uw_object_hdr_t *)P)->type_flags_high ^ H) & 0x40 ^ ((uw_object_hdr_t *)P)->type_flags_high;
+ ((uw_object_hdr_t *)P)->invisible = (H >> 6) & 0x1;

@type_flags_4_is_quant_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0x7fff | (H & 0x1) << 15;
+ ((uw_object_hdr_t *)P)->is_quant = H & 0x1;

@type_flags_4_is_quant_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0x7fff | (H & 0x1) << 15;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->is_quant = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_is_quant_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0x7fff | (H & 0x1) << 15;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->is_quant = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_is_quant_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0x7fff | (H & 0x1) << 15;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->is_quant = H & 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_is_quant_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags & 0x7fff;
+ ((uw_object_hdr_t *)P)->is_quant = 0x0;

@type_flags_4_is_quant_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0x7fff;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->is_quant = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_is_quant_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0x7fff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->is_quant = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_is_quant_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags & 0x7fff;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->is_quant = 0x0;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_is_quant_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags = ((uw_object_hdr_t *)P)->type_flags | 0x8000;
+ ((uw_object_hdr_t *)P)->is_quant = 0x1;

@type_flags_4_is_quant_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x8000;
- ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
+ ((uw_object_hdr_t *)P)->is_quant = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_is_quant_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x8000;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->is_quant = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_is_quant_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->type_flags | 0x8000;
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->is_quant = 0x1;
+ V = ((uw_object_hdr_t *)P)->type_flags;

@type_flags_4_is_quant_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high & 0x7f | (H & 0x1) << 7;
+ ((uw_object_hdr_t *)P)->is_quant = H & 0x1;

@type_flags_4_is_quant_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high & 0x7f;
+ ((uw_object_hdr_t *)P)->is_quant = 0;

@type_flags_4_is_quant_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = ((uw_object_hdr_t *)P)->type_flags_high | 0x80;
+ ((uw_object_hdr_t *)P)->is_quant = 0x1;

@type_flags_4_is_quant_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = (H ^ ((uw_object_hdr_t *)P)->type_flags_high) & 0x80 ^ ((uw_object_hdr_t *)P)->type_flags_high;
+ ((uw_object_hdr_t *)P)->is_quant = (H >> 7) & 0x1;

@type_flags_4_is_quant_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->type_flags_high = (((uw_object_hdr_t *)P)->type_flags_high ^ H) & 0x80 ^ ((uw_object_hdr_t *)P)->type_flags_high;
+ ((uw_object_hdr_t *)P)->is_quant = (H >> 7) & 0x1;

@type_flags_5_item_id_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xfe00 | H & 0x1ff;
+ ((uw_mobile_object_t *)P)->hdr.item_id = H & 0x1ff;

@type_flags_5_item_id_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xfe00 | H & 0x1ff;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.item_id = H & 0x1ff;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_item_id_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xfe00 | H & 0x1ff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.item_id = H & 0x1ff;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_item_id_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xfe00 | H & 0x1ff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.item_id = H & 0x1ff;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_item_id_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xfe00;
+ ((uw_mobile_object_t *)P)->hdr.item_id = 0x0;

@type_flags_5_item_id_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xfe00;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.item_id = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_item_id_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xfe00;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.item_id = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_item_id_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xfe00;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.item_id = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_item_id_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x1ff;
+ ((uw_mobile_object_t *)P)->hdr.item_id = 0x1ff;

@type_flags_5_item_id_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x1ff;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.item_id = 0x1ff;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_item_id_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x1ff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.item_id = 0x1ff;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_item_id_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x1ff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.item_id = 0x1ff;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_flags_res_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = H & 0x7;

@type_flags_5_flags_res_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_flags_res_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.flags_res = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_flags_res_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xf1ff | (H & 0x7) << 9;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.flags_res = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_flags_res_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xf1ff;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = 0x0;

@type_flags_5_flags_res_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xf1ff;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_flags_res_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xf1ff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.flags_res = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_flags_res_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xf1ff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.flags_res = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_flags_res_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags | 0xe00;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = 0x7;

@type_flags_5_flags_res_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0xe00;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_flags_res_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0xe00;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.flags_res = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_flags_res_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0xe00;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.flags_res = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_flags_res_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high & 0xf1 | (H & 0x7) << 1;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = H & 0x7;

@type_flags_5_flags_res_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high & 0xf1;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = 0;

@type_flags_5_flags_res_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high | 0xe;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = 0x7;

@type_flags_5_flags_res_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (H ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high) & 0xe ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = (H >> 1) & 0x7;

@type_flags_5_flags_res_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (((uw_mobile_object_t *)P)->hdr.type_flags_high ^ H) & 0xe ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.flags_res = (H >> 1) & 0x7;

@type_flags_5_enchanted_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xefff | (H & 0x1) << 12;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = H & 0x1;

@type_flags_5_enchanted_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xefff | (H & 0x1) << 12;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_enchanted_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xefff | (H & 0x1) << 12;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.enchanted = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_enchanted_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xefff | (H & 0x1) << 12;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.enchanted = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_enchanted_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xefff;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = 0x0;

@type_flags_5_enchanted_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xefff;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_enchanted_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xefff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.enchanted = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_enchanted_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xefff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.enchanted = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_enchanted_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x1000;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = 0x1;

@type_flags_5_enchanted_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x1000;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_enchanted_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x1000;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.enchanted = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_enchanted_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x1000;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.enchanted = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_enchanted_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high & 0xef | (H & 0x1) << 4;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = H & 0x1;

@type_flags_5_enchanted_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high & 0xef;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = 0;

@type_flags_5_enchanted_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high | 0x10;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = 0x1;

@type_flags_5_enchanted_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (H ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high) & 0x10 ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = (H >> 4) & 0x1;

@type_flags_5_enchanted_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (((uw_mobile_object_t *)P)->hdr.type_flags_high ^ H) & 0x10 ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.enchanted = (H >> 4) & 0x1;

@type_flags_5_doordir_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xdfff | (H & 0x1) << 13;
+ ((uw_mobile_object_t *)P)->hdr.doordir = H & 0x1;

@type_flags_5_doordir_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xdfff | (H & 0x1) << 13;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.doordir = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_doordir_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xdfff | (H & 0x1) << 13;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.doordir = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_doordir_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xdfff | (H & 0x1) << 13;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.doordir = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_doordir_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xdfff;
+ ((uw_mobile_object_t *)P)->hdr.doordir = 0x0;

@type_flags_5_doordir_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xdfff;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.doordir = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_doordir_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xdfff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.doordir = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_doordir_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xdfff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.doordir = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_doordir_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x2000;
+ ((uw_mobile_object_t *)P)->hdr.doordir = 0x1;

@type_flags_5_doordir_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x2000;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.doordir = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_doordir_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x2000;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.doordir = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_doordir_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x2000;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.doordir = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_doordir_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high & 0xdf | (H & 0x1) << 5;
+ ((uw_mobile_object_t *)P)->hdr.doordir = H & 0x1;

@type_flags_5_doordir_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high & 0xdf;
+ ((uw_mobile_object_t *)P)->hdr.doordir = 0;

@type_flags_5_doordir_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high | 0x20;
+ ((uw_mobile_object_t *)P)->hdr.doordir = 0x1;

@type_flags_5_doordir_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (H ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high) & 0x20 ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.doordir = (H >> 5) & 0x1;

@type_flags_5_doordir_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (((uw_mobile_object_t *)P)->hdr.type_flags_high ^ H) & 0x20 ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.doordir = (H >> 5) & 0x1;

@type_flags_5_invisible_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xbfff | (H & 0x1) << 14;
+ ((uw_mobile_object_t *)P)->hdr.invisible = H & 0x1;

@type_flags_5_invisible_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xbfff | (H & 0x1) << 14;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.invisible = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_invisible_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xbfff | (H & 0x1) << 14;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.invisible = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_invisible_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xbfff | (H & 0x1) << 14;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.invisible = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_invisible_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xbfff;
+ ((uw_mobile_object_t *)P)->hdr.invisible = 0x0;

@type_flags_5_invisible_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xbfff;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.invisible = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_invisible_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xbfff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.invisible = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_invisible_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0xbfff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.invisible = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_invisible_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x4000;
+ ((uw_mobile_object_t *)P)->hdr.invisible = 0x1;

@type_flags_5_invisible_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x4000;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.invisible = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_invisible_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x4000;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.invisible = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_invisible_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x4000;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.invisible = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_invisible_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high & 0xbf | (H & 0x1) << 6;
+ ((uw_mobile_object_t *)P)->hdr.invisible = H & 0x1;

@type_flags_5_invisible_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high & 0xbf;
+ ((uw_mobile_object_t *)P)->hdr.invisible = 0;

@type_flags_5_invisible_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high | 0x40;
+ ((uw_mobile_object_t *)P)->hdr.invisible = 0x1;

@type_flags_5_invisible_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (H ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high) & 0x40 ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.invisible = (H >> 6) & 0x1;

@type_flags_5_invisible_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (((uw_mobile_object_t *)P)->hdr.type_flags_high ^ H) & 0x40 ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.invisible = (H >> 6) & 0x1;

@type_flags_5_is_quant_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0x7fff | (H & 0x1) << 15;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = H & 0x1;

@type_flags_5_is_quant_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0x7fff | (H & 0x1) << 15;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_is_quant_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0x7fff | (H & 0x1) << 15;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.is_quant = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_is_quant_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0x7fff | (H & 0x1) << 15;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.is_quant = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_is_quant_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags & 0x7fff;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = 0x0;

@type_flags_5_is_quant_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0x7fff;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_is_quant_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0x7fff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.is_quant = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_is_quant_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags & 0x7fff;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.is_quant = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_is_quant_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x8000;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = 0x1;

@type_flags_5_is_quant_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x8000;
- ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_is_quant_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x8000;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.is_quant = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_is_quant_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.type_flags | 0x8000;
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.is_quant = 0x1;
+ V = ((uw_mobile_object_t *)P)->hdr.type_flags;

@type_flags_5_is_quant_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high & 0x7f | (H & 0x1) << 7;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = H & 0x1;

@type_flags_5_is_quant_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high & 0x7f;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = 0;

@type_flags_5_is_quant_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = ((uw_mobile_object_t *)P)->hdr.type_flags_high | 0x80;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = 0x1;

@type_flags_5_is_quant_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (H ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high) & 0x80 ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = (H >> 7) & 0x1;

@type_flags_5_is_quant_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (((uw_mobile_object_t *)P)->hdr.type_flags_high ^ H) & 0x80 ^ ((uw_mobile_object_t *)P)->hdr.type_flags_high;
+ ((uw_mobile_object_t *)P)->hdr.is_quant = (H >> 7) & 0x1;

@position_word_0_zpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word & 0xff80 | H & 0x7f;
+ P->zpos = H & 0x7f;

@position_word_0_zpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xff80 | H & 0x7f;
- P->position_word = (ushort)V;
+ P->zpos = H & 0x7f;
+ V = P->position_word;

@position_word_0_zpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xff80 | H & 0x7f;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->zpos = H & 0x7f;
+ V = P->position_word;

@position_word_0_zpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xff80 | H & 0x7f;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->zpos = H & 0x7f;
+ V = P->position_word;

@position_word_0_zpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word & 0xff80;
+ P->zpos = 0x0;

@position_word_0_zpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xff80;
- P->position_word = (ushort)V;
+ P->zpos = 0x0;
+ V = P->position_word;

@position_word_0_zpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xff80;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->zpos = 0x0;
+ V = P->position_word;

@position_word_0_zpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xff80;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->zpos = 0x0;
+ V = P->position_word;

@position_word_0_zpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word | 0x7f;
+ P->zpos = 0x7f;

@position_word_0_zpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0x7f;
- P->position_word = (ushort)V;
+ P->zpos = 0x7f;
+ V = P->position_word;

@position_word_0_zpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0x7f;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->zpos = 0x7f;
+ V = P->position_word;

@position_word_0_zpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0x7f;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->zpos = 0x7f;
+ V = P->position_word;

@position_word_0_zpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_low = P->position_word_low & 0x80 | H & 0x7f;
+ P->zpos = H & 0x7f;

@position_word_0_zpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_low = P->position_word_low & 0x80;
+ P->zpos = 0;

@position_word_0_zpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_low = P->position_word_low | 0x7f;
+ P->zpos = 0x7f;

@position_word_0_zpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_low = (H ^ P->position_word_low) & 0x7f ^ P->position_word_low;
+ P->zpos = H & 0x7f;

@position_word_0_zpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_low = (P->position_word_low ^ H) & 0x7f ^ P->position_word_low;
+ P->zpos = H & 0x7f;

@position_word_0_heading_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word & 0xfc7f | (H & 0x7) << 7;
+ P->heading = H & 0x7;

@position_word_0_heading_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xfc7f | (H & 0x7) << 7;
- P->position_word = (ushort)V;
+ P->heading = H & 0x7;
+ V = P->position_word;

@position_word_0_heading_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xfc7f | (H & 0x7) << 7;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->heading = H & 0x7;
+ V = P->position_word;

@position_word_0_heading_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xfc7f | (H & 0x7) << 7;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->heading = H & 0x7;
+ V = P->position_word;

@position_word_0_heading_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word & 0xfc7f;
+ P->heading = 0x0;

@position_word_0_heading_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xfc7f;
- P->position_word = (ushort)V;
+ P->heading = 0x0;
+ V = P->position_word;

@position_word_0_heading_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xfc7f;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->heading = 0x0;
+ V = P->position_word;

@position_word_0_heading_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xfc7f;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->heading = 0x0;
+ V = P->position_word;

@position_word_0_heading_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word | 0x380;
+ P->heading = 0x7;

@position_word_0_heading_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0x380;
- P->position_word = (ushort)V;
+ P->heading = 0x7;
+ V = P->position_word;

@position_word_0_heading_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0x380;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->heading = 0x7;
+ V = P->position_word;

@position_word_0_heading_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0x380;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->heading = 0x7;
+ V = P->position_word;

@position_word_0_ypos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word & 0xe3ff | (H & 0x7) << 10;
+ P->ypos = H & 0x7;

@position_word_0_ypos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xe3ff | (H & 0x7) << 10;
- P->position_word = (ushort)V;
+ P->ypos = H & 0x7;
+ V = P->position_word;

@position_word_0_ypos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xe3ff | (H & 0x7) << 10;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->ypos = H & 0x7;
+ V = P->position_word;

@position_word_0_ypos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xe3ff | (H & 0x7) << 10;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->ypos = H & 0x7;
+ V = P->position_word;

@position_word_0_ypos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word & 0xe3ff;
+ P->ypos = 0x0;

@position_word_0_ypos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xe3ff;
- P->position_word = (ushort)V;
+ P->ypos = 0x0;
+ V = P->position_word;

@position_word_0_ypos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xe3ff;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->ypos = 0x0;
+ V = P->position_word;

@position_word_0_ypos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0xe3ff;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->ypos = 0x0;
+ V = P->position_word;

@position_word_0_ypos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word | 0x1c00;
+ P->ypos = 0x7;

@position_word_0_ypos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0x1c00;
- P->position_word = (ushort)V;
+ P->ypos = 0x7;
+ V = P->position_word;

@position_word_0_ypos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0x1c00;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->ypos = 0x7;
+ V = P->position_word;

@position_word_0_ypos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0x1c00;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->ypos = 0x7;
+ V = P->position_word;

@position_word_0_ypos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_high = P->position_word_high & 0xe3 | (H & 0x7) << 2;
+ P->ypos = H & 0x7;

@position_word_0_ypos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_high = P->position_word_high & 0xe3;
+ P->ypos = 0;

@position_word_0_ypos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_high = P->position_word_high | 0x1c;
+ P->ypos = 0x7;

@position_word_0_ypos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_high = (H ^ P->position_word_high) & 0x1c ^ P->position_word_high;
+ P->ypos = (H >> 2) & 0x7;

@position_word_0_ypos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_high = (P->position_word_high ^ H) & 0x1c ^ P->position_word_high;
+ P->ypos = (H >> 2) & 0x7;

@position_word_0_xpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word & 0x1fff | (H & 0x7) << 13;
+ P->xpos = H & 0x7;

@position_word_0_xpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0x1fff | (H & 0x7) << 13;
- P->position_word = (ushort)V;
+ P->xpos = H & 0x7;
+ V = P->position_word;

@position_word_0_xpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0x1fff | (H & 0x7) << 13;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->xpos = H & 0x7;
+ V = P->position_word;

@position_word_0_xpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0x1fff | (H & 0x7) << 13;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->xpos = H & 0x7;
+ V = P->position_word;

@position_word_0_xpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word & 0x1fff;
+ P->xpos = 0x0;

@position_word_0_xpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0x1fff;
- P->position_word = (ushort)V;
+ P->xpos = 0x0;
+ V = P->position_word;

@position_word_0_xpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0x1fff;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->xpos = 0x0;
+ V = P->position_word;

@position_word_0_xpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word & 0x1fff;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->xpos = 0x0;
+ V = P->position_word;

@position_word_0_xpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word = P->position_word | 0xe000;
+ P->xpos = 0x7;

@position_word_0_xpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0xe000;
- P->position_word = (ushort)V;
+ P->xpos = 0x7;
+ V = P->position_word;

@position_word_0_xpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0xe000;
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->xpos = 0x7;
+ V = P->position_word;

@position_word_0_xpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->position_word | 0xe000;
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->xpos = 0x7;
+ V = P->position_word;

@position_word_0_xpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_high = P->position_word_high & 0x1f | (H & 0x7) << 5;
+ P->xpos = H & 0x7;

@position_word_0_xpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_high = P->position_word_high & 0x1f;
+ P->xpos = 0;

@position_word_0_xpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_high = P->position_word_high | 0xe0;
+ P->xpos = 0x7;

@position_word_0_xpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_high = (H ^ P->position_word_high) & 0xe0 ^ P->position_word_high;
+ P->xpos = (H >> 5) & 0x7;

@position_word_0_xpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->position_word_high = (P->position_word_high ^ H) & 0xe0 ^ P->position_word_high;
+ P->xpos = (H >> 5) & 0x7;

@position_word_1_zpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word & 0xff80 | H & 0x7f;
+ P.zpos = H & 0x7f;

@position_word_1_zpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xff80 | H & 0x7f;
- P.position_word = (ushort)V;
+ P.zpos = H & 0x7f;
+ V = P.position_word;

@position_word_1_zpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xff80 | H & 0x7f;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.zpos = H & 0x7f;
+ V = P.position_word;

@position_word_1_zpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xff80 | H & 0x7f;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.zpos = H & 0x7f;
+ V = P.position_word;

@position_word_1_zpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word & 0xff80;
+ P.zpos = 0x0;

@position_word_1_zpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xff80;
- P.position_word = (ushort)V;
+ P.zpos = 0x0;
+ V = P.position_word;

@position_word_1_zpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xff80;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.zpos = 0x0;
+ V = P.position_word;

@position_word_1_zpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xff80;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.zpos = 0x0;
+ V = P.position_word;

@position_word_1_zpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word | 0x7f;
+ P.zpos = 0x7f;

@position_word_1_zpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0x7f;
- P.position_word = (ushort)V;
+ P.zpos = 0x7f;
+ V = P.position_word;

@position_word_1_zpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0x7f;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.zpos = 0x7f;
+ V = P.position_word;

@position_word_1_zpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0x7f;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.zpos = 0x7f;
+ V = P.position_word;

@position_word_1_zpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_low = P.position_word_low & 0x80 | H & 0x7f;
+ P.zpos = H & 0x7f;

@position_word_1_zpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_low = P.position_word_low & 0x80;
+ P.zpos = 0;

@position_word_1_zpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_low = P.position_word_low | 0x7f;
+ P.zpos = 0x7f;

@position_word_1_zpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_low = (H ^ P.position_word_low) & 0x7f ^ P.position_word_low;
+ P.zpos = H & 0x7f;

@position_word_1_zpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_low = (P.position_word_low ^ H) & 0x7f ^ P.position_word_low;
+ P.zpos = H & 0x7f;

@position_word_1_heading_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word & 0xfc7f | (H & 0x7) << 7;
+ P.heading = H & 0x7;

@position_word_1_heading_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xfc7f | (H & 0x7) << 7;
- P.position_word = (ushort)V;
+ P.heading = H & 0x7;
+ V = P.position_word;

@position_word_1_heading_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xfc7f | (H & 0x7) << 7;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.heading = H & 0x7;
+ V = P.position_word;

@position_word_1_heading_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xfc7f | (H & 0x7) << 7;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.heading = H & 0x7;
+ V = P.position_word;

@position_word_1_heading_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word & 0xfc7f;
+ P.heading = 0x0;

@position_word_1_heading_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xfc7f;
- P.position_word = (ushort)V;
+ P.heading = 0x0;
+ V = P.position_word;

@position_word_1_heading_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xfc7f;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.heading = 0x0;
+ V = P.position_word;

@position_word_1_heading_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xfc7f;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.heading = 0x0;
+ V = P.position_word;

@position_word_1_heading_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word | 0x380;
+ P.heading = 0x7;

@position_word_1_heading_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0x380;
- P.position_word = (ushort)V;
+ P.heading = 0x7;
+ V = P.position_word;

@position_word_1_heading_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0x380;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.heading = 0x7;
+ V = P.position_word;

@position_word_1_heading_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0x380;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.heading = 0x7;
+ V = P.position_word;

@position_word_1_ypos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word & 0xe3ff | (H & 0x7) << 10;
+ P.ypos = H & 0x7;

@position_word_1_ypos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xe3ff | (H & 0x7) << 10;
- P.position_word = (ushort)V;
+ P.ypos = H & 0x7;
+ V = P.position_word;

@position_word_1_ypos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xe3ff | (H & 0x7) << 10;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.ypos = H & 0x7;
+ V = P.position_word;

@position_word_1_ypos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xe3ff | (H & 0x7) << 10;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.ypos = H & 0x7;
+ V = P.position_word;

@position_word_1_ypos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word & 0xe3ff;
+ P.ypos = 0x0;

@position_word_1_ypos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xe3ff;
- P.position_word = (ushort)V;
+ P.ypos = 0x0;
+ V = P.position_word;

@position_word_1_ypos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xe3ff;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.ypos = 0x0;
+ V = P.position_word;

@position_word_1_ypos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0xe3ff;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.ypos = 0x0;
+ V = P.position_word;

@position_word_1_ypos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word | 0x1c00;
+ P.ypos = 0x7;

@position_word_1_ypos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0x1c00;
- P.position_word = (ushort)V;
+ P.ypos = 0x7;
+ V = P.position_word;

@position_word_1_ypos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0x1c00;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.ypos = 0x7;
+ V = P.position_word;

@position_word_1_ypos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0x1c00;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.ypos = 0x7;
+ V = P.position_word;

@position_word_1_ypos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_high = P.position_word_high & 0xe3 | (H & 0x7) << 2;
+ P.ypos = H & 0x7;

@position_word_1_ypos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_high = P.position_word_high & 0xe3;
+ P.ypos = 0;

@position_word_1_ypos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_high = P.position_word_high | 0x1c;
+ P.ypos = 0x7;

@position_word_1_ypos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_high = (H ^ P.position_word_high) & 0x1c ^ P.position_word_high;
+ P.ypos = (H >> 2) & 0x7;

@position_word_1_ypos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_high = (P.position_word_high ^ H) & 0x1c ^ P.position_word_high;
+ P.ypos = (H >> 2) & 0x7;

@position_word_1_xpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word & 0x1fff | (H & 0x7) << 13;
+ P.xpos = H & 0x7;

@position_word_1_xpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0x1fff | (H & 0x7) << 13;
- P.position_word = (ushort)V;
+ P.xpos = H & 0x7;
+ V = P.position_word;

@position_word_1_xpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0x1fff | (H & 0x7) << 13;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.xpos = H & 0x7;
+ V = P.position_word;

@position_word_1_xpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0x1fff | (H & 0x7) << 13;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.xpos = H & 0x7;
+ V = P.position_word;

@position_word_1_xpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word & 0x1fff;
+ P.xpos = 0x0;

@position_word_1_xpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0x1fff;
- P.position_word = (ushort)V;
+ P.xpos = 0x0;
+ V = P.position_word;

@position_word_1_xpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0x1fff;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.xpos = 0x0;
+ V = P.position_word;

@position_word_1_xpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word & 0x1fff;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.xpos = 0x0;
+ V = P.position_word;

@position_word_1_xpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word = P.position_word | 0xe000;
+ P.xpos = 0x7;

@position_word_1_xpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0xe000;
- P.position_word = (ushort)V;
+ P.xpos = 0x7;
+ V = P.position_word;

@position_word_1_xpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0xe000;
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.xpos = 0x7;
+ V = P.position_word;

@position_word_1_xpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.position_word | 0xe000;
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.xpos = 0x7;
+ V = P.position_word;

@position_word_1_xpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_high = P.position_word_high & 0x1f | (H & 0x7) << 5;
+ P.xpos = H & 0x7;

@position_word_1_xpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_high = P.position_word_high & 0x1f;
+ P.xpos = 0;

@position_word_1_xpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_high = P.position_word_high | 0xe0;
+ P.xpos = 0x7;

@position_word_1_xpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_high = (H ^ P.position_word_high) & 0xe0 ^ P.position_word_high;
+ P.xpos = (H >> 5) & 0x7;

@position_word_1_xpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.position_word_high = (P.position_word_high ^ H) & 0xe0 ^ P.position_word_high;
+ P.xpos = (H >> 5) & 0x7;

@position_word_2_zpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0xff80 | H & 0x7f;
+ P->hdr.zpos = H & 0x7f;

@position_word_2_zpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xff80 | H & 0x7f;
- P->hdr.position_word = (ushort)V;
+ P->hdr.zpos = H & 0x7f;
+ V = P->hdr.position_word;

@position_word_2_zpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xff80 | H & 0x7f;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.zpos = H & 0x7f;
+ V = P->hdr.position_word;

@position_word_2_zpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xff80 | H & 0x7f;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.zpos = H & 0x7f;
+ V = P->hdr.position_word;

@position_word_2_zpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0xff80;
+ P->hdr.zpos = 0x0;

@position_word_2_zpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xff80;
- P->hdr.position_word = (ushort)V;
+ P->hdr.zpos = 0x0;
+ V = P->hdr.position_word;

@position_word_2_zpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xff80;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.zpos = 0x0;
+ V = P->hdr.position_word;

@position_word_2_zpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xff80;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.zpos = 0x0;
+ V = P->hdr.position_word;

@position_word_2_zpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word | 0x7f;
+ P->hdr.zpos = 0x7f;

@position_word_2_zpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0x7f;
- P->hdr.position_word = (ushort)V;
+ P->hdr.zpos = 0x7f;
+ V = P->hdr.position_word;

@position_word_2_zpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0x7f;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.zpos = 0x7f;
+ V = P->hdr.position_word;

@position_word_2_zpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0x7f;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.zpos = 0x7f;
+ V = P->hdr.position_word;

@position_word_2_zpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_low = P->hdr.position_word_low & 0x80 | H & 0x7f;
+ P->hdr.zpos = H & 0x7f;

@position_word_2_zpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_low = P->hdr.position_word_low & 0x80;
+ P->hdr.zpos = 0;

@position_word_2_zpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_low = P->hdr.position_word_low | 0x7f;
+ P->hdr.zpos = 0x7f;

@position_word_2_zpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_low = (H ^ P->hdr.position_word_low) & 0x7f ^ P->hdr.position_word_low;
+ P->hdr.zpos = H & 0x7f;

@position_word_2_zpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_low = (P->hdr.position_word_low ^ H) & 0x7f ^ P->hdr.position_word_low;
+ P->hdr.zpos = H & 0x7f;

@position_word_2_heading_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
+ P->hdr.heading = H & 0x7;

@position_word_2_heading_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- P->hdr.position_word = (ushort)V;
+ P->hdr.heading = H & 0x7;
+ V = P->hdr.position_word;

@position_word_2_heading_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.heading = H & 0x7;
+ V = P->hdr.position_word;

@position_word_2_heading_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.heading = H & 0x7;
+ V = P->hdr.position_word;

@position_word_2_heading_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0xfc7f;
+ P->hdr.heading = 0x0;

@position_word_2_heading_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xfc7f;
- P->hdr.position_word = (ushort)V;
+ P->hdr.heading = 0x0;
+ V = P->hdr.position_word;

@position_word_2_heading_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xfc7f;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.heading = 0x0;
+ V = P->hdr.position_word;

@position_word_2_heading_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xfc7f;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.heading = 0x0;
+ V = P->hdr.position_word;

@position_word_2_heading_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word | 0x380;
+ P->hdr.heading = 0x7;

@position_word_2_heading_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0x380;
- P->hdr.position_word = (ushort)V;
+ P->hdr.heading = 0x7;
+ V = P->hdr.position_word;

@position_word_2_heading_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0x380;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.heading = 0x7;
+ V = P->hdr.position_word;

@position_word_2_heading_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0x380;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.heading = 0x7;
+ V = P->hdr.position_word;

@position_word_2_ypos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
+ P->hdr.ypos = H & 0x7;

@position_word_2_ypos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- P->hdr.position_word = (ushort)V;
+ P->hdr.ypos = H & 0x7;
+ V = P->hdr.position_word;

@position_word_2_ypos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.ypos = H & 0x7;
+ V = P->hdr.position_word;

@position_word_2_ypos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.ypos = H & 0x7;
+ V = P->hdr.position_word;

@position_word_2_ypos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0xe3ff;
+ P->hdr.ypos = 0x0;

@position_word_2_ypos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xe3ff;
- P->hdr.position_word = (ushort)V;
+ P->hdr.ypos = 0x0;
+ V = P->hdr.position_word;

@position_word_2_ypos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xe3ff;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.ypos = 0x0;
+ V = P->hdr.position_word;

@position_word_2_ypos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0xe3ff;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.ypos = 0x0;
+ V = P->hdr.position_word;

@position_word_2_ypos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word | 0x1c00;
+ P->hdr.ypos = 0x7;

@position_word_2_ypos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0x1c00;
- P->hdr.position_word = (ushort)V;
+ P->hdr.ypos = 0x7;
+ V = P->hdr.position_word;

@position_word_2_ypos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0x1c00;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.ypos = 0x7;
+ V = P->hdr.position_word;

@position_word_2_ypos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0x1c00;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.ypos = 0x7;
+ V = P->hdr.position_word;

@position_word_2_ypos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_high = P->hdr.position_word_high & 0xe3 | (H & 0x7) << 2;
+ P->hdr.ypos = H & 0x7;

@position_word_2_ypos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_high = P->hdr.position_word_high & 0xe3;
+ P->hdr.ypos = 0;

@position_word_2_ypos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_high = P->hdr.position_word_high | 0x1c;
+ P->hdr.ypos = 0x7;

@position_word_2_ypos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_high = (H ^ P->hdr.position_word_high) & 0x1c ^ P->hdr.position_word_high;
+ P->hdr.ypos = (H >> 2) & 0x7;

@position_word_2_ypos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_high = (P->hdr.position_word_high ^ H) & 0x1c ^ P->hdr.position_word_high;
+ P->hdr.ypos = (H >> 2) & 0x7;

@position_word_2_xpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0x1fff | (H & 0x7) << 13;
+ P->hdr.xpos = H & 0x7;

@position_word_2_xpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0x1fff | (H & 0x7) << 13;
- P->hdr.position_word = (ushort)V;
+ P->hdr.xpos = H & 0x7;
+ V = P->hdr.position_word;

@position_word_2_xpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0x1fff | (H & 0x7) << 13;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.xpos = H & 0x7;
+ V = P->hdr.position_word;

@position_word_2_xpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0x1fff | (H & 0x7) << 13;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.xpos = H & 0x7;
+ V = P->hdr.position_word;

@position_word_2_xpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word & 0x1fff;
+ P->hdr.xpos = 0x0;

@position_word_2_xpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0x1fff;
- P->hdr.position_word = (ushort)V;
+ P->hdr.xpos = 0x0;
+ V = P->hdr.position_word;

@position_word_2_xpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0x1fff;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.xpos = 0x0;
+ V = P->hdr.position_word;

@position_word_2_xpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word & 0x1fff;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.xpos = 0x0;
+ V = P->hdr.position_word;

@position_word_2_xpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word = P->hdr.position_word | 0xe000;
+ P->hdr.xpos = 0x7;

@position_word_2_xpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0xe000;
- P->hdr.position_word = (ushort)V;
+ P->hdr.xpos = 0x7;
+ V = P->hdr.position_word;

@position_word_2_xpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0xe000;
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.xpos = 0x7;
+ V = P->hdr.position_word;

@position_word_2_xpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.position_word | 0xe000;
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.xpos = 0x7;
+ V = P->hdr.position_word;

@position_word_2_xpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_high = P->hdr.position_word_high & 0x1f | (H & 0x7) << 5;
+ P->hdr.xpos = H & 0x7;

@position_word_2_xpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_high = P->hdr.position_word_high & 0x1f;
+ P->hdr.xpos = 0;

@position_word_2_xpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_high = P->hdr.position_word_high | 0xe0;
+ P->hdr.xpos = 0x7;

@position_word_2_xpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_high = (H ^ P->hdr.position_word_high) & 0xe0 ^ P->hdr.position_word_high;
+ P->hdr.xpos = (H >> 5) & 0x7;

@position_word_2_xpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.position_word_high = (P->hdr.position_word_high ^ H) & 0xe0 ^ P->hdr.position_word_high;
+ P->hdr.xpos = (H >> 5) & 0x7;

@position_word_3_zpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word & 0xff80 | H & 0x7f;
+ P.hdr.zpos = H & 0x7f;

@position_word_3_zpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xff80 | H & 0x7f;
- P.hdr.position_word = (ushort)V;
+ P.hdr.zpos = H & 0x7f;
+ V = P.hdr.position_word;

@position_word_3_zpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xff80 | H & 0x7f;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.zpos = H & 0x7f;
+ V = P.hdr.position_word;

@position_word_3_zpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xff80 | H & 0x7f;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.zpos = H & 0x7f;
+ V = P.hdr.position_word;

@position_word_3_zpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word & 0xff80;
+ P.hdr.zpos = 0x0;

@position_word_3_zpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xff80;
- P.hdr.position_word = (ushort)V;
+ P.hdr.zpos = 0x0;
+ V = P.hdr.position_word;

@position_word_3_zpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xff80;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.zpos = 0x0;
+ V = P.hdr.position_word;

@position_word_3_zpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xff80;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.zpos = 0x0;
+ V = P.hdr.position_word;

@position_word_3_zpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word | 0x7f;
+ P.hdr.zpos = 0x7f;

@position_word_3_zpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0x7f;
- P.hdr.position_word = (ushort)V;
+ P.hdr.zpos = 0x7f;
+ V = P.hdr.position_word;

@position_word_3_zpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0x7f;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.zpos = 0x7f;
+ V = P.hdr.position_word;

@position_word_3_zpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0x7f;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.zpos = 0x7f;
+ V = P.hdr.position_word;

@position_word_3_zpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_low = P.hdr.position_word_low & 0x80 | H & 0x7f;
+ P.hdr.zpos = H & 0x7f;

@position_word_3_zpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_low = P.hdr.position_word_low & 0x80;
+ P.hdr.zpos = 0;

@position_word_3_zpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_low = P.hdr.position_word_low | 0x7f;
+ P.hdr.zpos = 0x7f;

@position_word_3_zpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_low = (H ^ P.hdr.position_word_low) & 0x7f ^ P.hdr.position_word_low;
+ P.hdr.zpos = H & 0x7f;

@position_word_3_zpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_low = (P.hdr.position_word_low ^ H) & 0x7f ^ P.hdr.position_word_low;
+ P.hdr.zpos = H & 0x7f;

@position_word_3_heading_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word & 0xfc7f | (H & 0x7) << 7;
+ P.hdr.heading = H & 0x7;

@position_word_3_heading_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- P.hdr.position_word = (ushort)V;
+ P.hdr.heading = H & 0x7;
+ V = P.hdr.position_word;

@position_word_3_heading_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.heading = H & 0x7;
+ V = P.hdr.position_word;

@position_word_3_heading_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.heading = H & 0x7;
+ V = P.hdr.position_word;

@position_word_3_heading_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word & 0xfc7f;
+ P.hdr.heading = 0x0;

@position_word_3_heading_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xfc7f;
- P.hdr.position_word = (ushort)V;
+ P.hdr.heading = 0x0;
+ V = P.hdr.position_word;

@position_word_3_heading_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xfc7f;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.heading = 0x0;
+ V = P.hdr.position_word;

@position_word_3_heading_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xfc7f;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.heading = 0x0;
+ V = P.hdr.position_word;

@position_word_3_heading_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word | 0x380;
+ P.hdr.heading = 0x7;

@position_word_3_heading_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0x380;
- P.hdr.position_word = (ushort)V;
+ P.hdr.heading = 0x7;
+ V = P.hdr.position_word;

@position_word_3_heading_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0x380;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.heading = 0x7;
+ V = P.hdr.position_word;

@position_word_3_heading_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0x380;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.heading = 0x7;
+ V = P.hdr.position_word;

@position_word_3_ypos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word & 0xe3ff | (H & 0x7) << 10;
+ P.hdr.ypos = H & 0x7;

@position_word_3_ypos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- P.hdr.position_word = (ushort)V;
+ P.hdr.ypos = H & 0x7;
+ V = P.hdr.position_word;

@position_word_3_ypos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.ypos = H & 0x7;
+ V = P.hdr.position_word;

@position_word_3_ypos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.ypos = H & 0x7;
+ V = P.hdr.position_word;

@position_word_3_ypos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word & 0xe3ff;
+ P.hdr.ypos = 0x0;

@position_word_3_ypos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xe3ff;
- P.hdr.position_word = (ushort)V;
+ P.hdr.ypos = 0x0;
+ V = P.hdr.position_word;

@position_word_3_ypos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xe3ff;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.ypos = 0x0;
+ V = P.hdr.position_word;

@position_word_3_ypos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0xe3ff;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.ypos = 0x0;
+ V = P.hdr.position_word;

@position_word_3_ypos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word | 0x1c00;
+ P.hdr.ypos = 0x7;

@position_word_3_ypos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0x1c00;
- P.hdr.position_word = (ushort)V;
+ P.hdr.ypos = 0x7;
+ V = P.hdr.position_word;

@position_word_3_ypos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0x1c00;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.ypos = 0x7;
+ V = P.hdr.position_word;

@position_word_3_ypos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0x1c00;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.ypos = 0x7;
+ V = P.hdr.position_word;

@position_word_3_ypos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_high = P.hdr.position_word_high & 0xe3 | (H & 0x7) << 2;
+ P.hdr.ypos = H & 0x7;

@position_word_3_ypos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_high = P.hdr.position_word_high & 0xe3;
+ P.hdr.ypos = 0;

@position_word_3_ypos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_high = P.hdr.position_word_high | 0x1c;
+ P.hdr.ypos = 0x7;

@position_word_3_ypos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_high = (H ^ P.hdr.position_word_high) & 0x1c ^ P.hdr.position_word_high;
+ P.hdr.ypos = (H >> 2) & 0x7;

@position_word_3_ypos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_high = (P.hdr.position_word_high ^ H) & 0x1c ^ P.hdr.position_word_high;
+ P.hdr.ypos = (H >> 2) & 0x7;

@position_word_3_xpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word & 0x1fff | (H & 0x7) << 13;
+ P.hdr.xpos = H & 0x7;

@position_word_3_xpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0x1fff | (H & 0x7) << 13;
- P.hdr.position_word = (ushort)V;
+ P.hdr.xpos = H & 0x7;
+ V = P.hdr.position_word;

@position_word_3_xpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0x1fff | (H & 0x7) << 13;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.xpos = H & 0x7;
+ V = P.hdr.position_word;

@position_word_3_xpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0x1fff | (H & 0x7) << 13;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.xpos = H & 0x7;
+ V = P.hdr.position_word;

@position_word_3_xpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word & 0x1fff;
+ P.hdr.xpos = 0x0;

@position_word_3_xpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0x1fff;
- P.hdr.position_word = (ushort)V;
+ P.hdr.xpos = 0x0;
+ V = P.hdr.position_word;

@position_word_3_xpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0x1fff;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.xpos = 0x0;
+ V = P.hdr.position_word;

@position_word_3_xpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word & 0x1fff;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.xpos = 0x0;
+ V = P.hdr.position_word;

@position_word_3_xpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word = P.hdr.position_word | 0xe000;
+ P.hdr.xpos = 0x7;

@position_word_3_xpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0xe000;
- P.hdr.position_word = (ushort)V;
+ P.hdr.xpos = 0x7;
+ V = P.hdr.position_word;

@position_word_3_xpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0xe000;
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.xpos = 0x7;
+ V = P.hdr.position_word;

@position_word_3_xpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.position_word | 0xe000;
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.xpos = 0x7;
+ V = P.hdr.position_word;

@position_word_3_xpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_high = P.hdr.position_word_high & 0x1f | (H & 0x7) << 5;
+ P.hdr.xpos = H & 0x7;

@position_word_3_xpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_high = P.hdr.position_word_high & 0x1f;
+ P.hdr.xpos = 0;

@position_word_3_xpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_high = P.hdr.position_word_high | 0xe0;
+ P.hdr.xpos = 0x7;

@position_word_3_xpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_high = (H ^ P.hdr.position_word_high) & 0xe0 ^ P.hdr.position_word_high;
+ P.hdr.xpos = (H >> 5) & 0x7;

@position_word_3_xpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.position_word_high = (P.hdr.position_word_high ^ H) & 0xe0 ^ P.hdr.position_word_high;
+ P.hdr.xpos = (H >> 5) & 0x7;

@position_word_4_zpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0xff80 | H & 0x7f;
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;

@position_word_4_zpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xff80 | H & 0x7f;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_zpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xff80 | H & 0x7f;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_zpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xff80 | H & 0x7f;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_zpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0xff80;
+ ((uw_object_hdr_t *)P)->zpos = 0x0;

@position_word_4_zpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xff80;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->zpos = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_zpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xff80;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->zpos = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_zpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xff80;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->zpos = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_zpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word | 0x7f;
+ ((uw_object_hdr_t *)P)->zpos = 0x7f;

@position_word_4_zpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0x7f;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->zpos = 0x7f;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_zpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0x7f;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->zpos = 0x7f;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_zpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0x7f;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->zpos = 0x7f;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_zpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_low = ((uw_object_hdr_t *)P)->position_word_low & 0x80 | H & 0x7f;
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;

@position_word_4_zpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_low = ((uw_object_hdr_t *)P)->position_word_low & 0x80;
+ ((uw_object_hdr_t *)P)->zpos = 0;

@position_word_4_zpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_low = ((uw_object_hdr_t *)P)->position_word_low | 0x7f;
+ ((uw_object_hdr_t *)P)->zpos = 0x7f;

@position_word_4_zpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_low = (H ^ ((uw_object_hdr_t *)P)->position_word_low) & 0x7f ^ ((uw_object_hdr_t *)P)->position_word_low;
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;

@position_word_4_zpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_low = (((uw_object_hdr_t *)P)->position_word_low ^ H) & 0x7f ^ ((uw_object_hdr_t *)P)->position_word_low;
+ ((uw_object_hdr_t *)P)->zpos = H & 0x7f;

@position_word_4_heading_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0xfc7f | (H & 0x7) << 7;
+ ((uw_object_hdr_t *)P)->heading = H & 0x7;

@position_word_4_heading_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f | (H & 0x7) << 7;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->heading = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_heading_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f | (H & 0x7) << 7;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->heading = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_heading_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f | (H & 0x7) << 7;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->heading = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_heading_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0xfc7f;
+ ((uw_object_hdr_t *)P)->heading = 0x0;

@position_word_4_heading_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->heading = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_heading_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->heading = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_heading_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xfc7f;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->heading = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_heading_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word | 0x380;
+ ((uw_object_hdr_t *)P)->heading = 0x7;

@position_word_4_heading_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0x380;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->heading = 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_heading_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0x380;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->heading = 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_heading_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0x380;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->heading = 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_ypos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0xe3ff | (H & 0x7) << 10;
+ ((uw_object_hdr_t *)P)->ypos = H & 0x7;

@position_word_4_ypos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xe3ff | (H & 0x7) << 10;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->ypos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_ypos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xe3ff | (H & 0x7) << 10;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->ypos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_ypos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xe3ff | (H & 0x7) << 10;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->ypos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_ypos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0xe3ff;
+ ((uw_object_hdr_t *)P)->ypos = 0x0;

@position_word_4_ypos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xe3ff;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->ypos = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_ypos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xe3ff;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->ypos = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_ypos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0xe3ff;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->ypos = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_ypos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word | 0x1c00;
+ ((uw_object_hdr_t *)P)->ypos = 0x7;

@position_word_4_ypos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0x1c00;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->ypos = 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_ypos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0x1c00;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->ypos = 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_ypos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0x1c00;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->ypos = 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_ypos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_object_hdr_t *)P)->position_word_high & 0xe3 | (H & 0x7) << 2;
+ ((uw_object_hdr_t *)P)->ypos = H & 0x7;

@position_word_4_ypos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_object_hdr_t *)P)->position_word_high & 0xe3;
+ ((uw_object_hdr_t *)P)->ypos = 0;

@position_word_4_ypos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_object_hdr_t *)P)->position_word_high | 0x1c;
+ ((uw_object_hdr_t *)P)->ypos = 0x7;

@position_word_4_ypos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_high = (H ^ ((uw_object_hdr_t *)P)->position_word_high) & 0x1c ^ ((uw_object_hdr_t *)P)->position_word_high;
+ ((uw_object_hdr_t *)P)->ypos = (H >> 2) & 0x7;

@position_word_4_ypos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_high = (((uw_object_hdr_t *)P)->position_word_high ^ H) & 0x1c ^ ((uw_object_hdr_t *)P)->position_word_high;
+ ((uw_object_hdr_t *)P)->ypos = (H >> 2) & 0x7;

@position_word_4_xpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0x1fff | (H & 0x7) << 13;
+ ((uw_object_hdr_t *)P)->xpos = H & 0x7;

@position_word_4_xpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0x1fff | (H & 0x7) << 13;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->xpos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_xpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0x1fff | (H & 0x7) << 13;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->xpos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_xpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0x1fff | (H & 0x7) << 13;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->xpos = H & 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_xpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word & 0x1fff;
+ ((uw_object_hdr_t *)P)->xpos = 0x0;

@position_word_4_xpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0x1fff;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->xpos = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_xpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0x1fff;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->xpos = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_xpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word & 0x1fff;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->xpos = 0x0;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_xpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word = ((uw_object_hdr_t *)P)->position_word | 0xe000;
+ ((uw_object_hdr_t *)P)->xpos = 0x7;

@position_word_4_xpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0xe000;
- ((uw_object_hdr_t *)P)->position_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->xpos = 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_xpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0xe000;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->xpos = 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_xpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->position_word | 0xe000;
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->xpos = 0x7;
+ V = ((uw_object_hdr_t *)P)->position_word;

@position_word_4_xpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_object_hdr_t *)P)->position_word_high & 0x1f | (H & 0x7) << 5;
+ ((uw_object_hdr_t *)P)->xpos = H & 0x7;

@position_word_4_xpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_object_hdr_t *)P)->position_word_high & 0x1f;
+ ((uw_object_hdr_t *)P)->xpos = 0;

@position_word_4_xpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_high = ((uw_object_hdr_t *)P)->position_word_high | 0xe0;
+ ((uw_object_hdr_t *)P)->xpos = 0x7;

@position_word_4_xpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_high = (H ^ ((uw_object_hdr_t *)P)->position_word_high) & 0xe0 ^ ((uw_object_hdr_t *)P)->position_word_high;
+ ((uw_object_hdr_t *)P)->xpos = (H >> 5) & 0x7;

@position_word_4_xpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->position_word_high = (((uw_object_hdr_t *)P)->position_word_high ^ H) & 0xe0 ^ ((uw_object_hdr_t *)P)->position_word_high;
+ ((uw_object_hdr_t *)P)->xpos = (H >> 5) & 0x7;

@position_word_5_zpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word & 0xff80 | H & 0x7f;
+ ((uw_mobile_object_t *)P)->hdr.zpos = H & 0x7f;

@position_word_5_zpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xff80 | H & 0x7f;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.zpos = H & 0x7f;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_zpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xff80 | H & 0x7f;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.zpos = H & 0x7f;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_zpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xff80 | H & 0x7f;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.zpos = H & 0x7f;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_zpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word & 0xff80;
+ ((uw_mobile_object_t *)P)->hdr.zpos = 0x0;

@position_word_5_zpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xff80;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.zpos = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_zpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xff80;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.zpos = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_zpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xff80;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.zpos = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_zpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word | 0x7f;
+ ((uw_mobile_object_t *)P)->hdr.zpos = 0x7f;

@position_word_5_zpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0x7f;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.zpos = 0x7f;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_zpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0x7f;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.zpos = 0x7f;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_zpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0x7f;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.zpos = 0x7f;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_zpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_low = ((uw_mobile_object_t *)P)->hdr.position_word_low & 0x80 | H & 0x7f;
+ ((uw_mobile_object_t *)P)->hdr.zpos = H & 0x7f;

@position_word_5_zpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_low = ((uw_mobile_object_t *)P)->hdr.position_word_low & 0x80;
+ ((uw_mobile_object_t *)P)->hdr.zpos = 0;

@position_word_5_zpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_low = ((uw_mobile_object_t *)P)->hdr.position_word_low | 0x7f;
+ ((uw_mobile_object_t *)P)->hdr.zpos = 0x7f;

@position_word_5_zpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (H ^ ((uw_mobile_object_t *)P)->hdr.position_word_low) & 0x7f ^ ((uw_mobile_object_t *)P)->hdr.position_word_low;
+ ((uw_mobile_object_t *)P)->hdr.zpos = H & 0x7f;

@position_word_5_zpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (((uw_mobile_object_t *)P)->hdr.position_word_low ^ H) & 0x7f ^ ((uw_mobile_object_t *)P)->hdr.position_word_low;
+ ((uw_mobile_object_t *)P)->hdr.zpos = H & 0x7f;

@position_word_5_heading_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
+ ((uw_mobile_object_t *)P)->hdr.heading = H & 0x7;

@position_word_5_heading_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.heading = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_heading_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.heading = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_heading_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xfc7f | (H & 0x7) << 7;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.heading = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_heading_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word & 0xfc7f;
+ ((uw_mobile_object_t *)P)->hdr.heading = 0x0;

@position_word_5_heading_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xfc7f;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.heading = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_heading_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xfc7f;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.heading = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_heading_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xfc7f;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.heading = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_heading_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word | 0x380;
+ ((uw_mobile_object_t *)P)->hdr.heading = 0x7;

@position_word_5_heading_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0x380;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.heading = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_heading_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0x380;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.heading = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_heading_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0x380;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.heading = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_ypos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
+ ((uw_mobile_object_t *)P)->hdr.ypos = H & 0x7;

@position_word_5_ypos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.ypos = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_ypos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.ypos = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_ypos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xe3ff | (H & 0x7) << 10;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.ypos = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_ypos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word & 0xe3ff;
+ ((uw_mobile_object_t *)P)->hdr.ypos = 0x0;

@position_word_5_ypos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xe3ff;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.ypos = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_ypos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xe3ff;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.ypos = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_ypos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0xe3ff;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.ypos = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_ypos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word | 0x1c00;
+ ((uw_mobile_object_t *)P)->hdr.ypos = 0x7;

@position_word_5_ypos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0x1c00;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.ypos = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_ypos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0x1c00;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.ypos = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_ypos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0x1c00;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.ypos = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_ypos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_mobile_object_t *)P)->hdr.position_word_high & 0xe3 | (H & 0x7) << 2;
+ ((uw_mobile_object_t *)P)->hdr.ypos = H & 0x7;

@position_word_5_ypos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_mobile_object_t *)P)->hdr.position_word_high & 0xe3;
+ ((uw_mobile_object_t *)P)->hdr.ypos = 0;

@position_word_5_ypos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_mobile_object_t *)P)->hdr.position_word_high | 0x1c;
+ ((uw_mobile_object_t *)P)->hdr.ypos = 0x7;

@position_word_5_ypos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (H ^ ((uw_mobile_object_t *)P)->hdr.position_word_high) & 0x1c ^ ((uw_mobile_object_t *)P)->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.ypos = (H >> 2) & 0x7;

@position_word_5_ypos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (((uw_mobile_object_t *)P)->hdr.position_word_high ^ H) & 0x1c ^ ((uw_mobile_object_t *)P)->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.ypos = (H >> 2) & 0x7;

@position_word_5_xpos_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word & 0x1fff | (H & 0x7) << 13;
+ ((uw_mobile_object_t *)P)->hdr.xpos = H & 0x7;

@position_word_5_xpos_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0x1fff | (H & 0x7) << 13;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.xpos = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_xpos_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0x1fff | (H & 0x7) << 13;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.xpos = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_xpos_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0x1fff | (H & 0x7) << 13;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.xpos = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_xpos_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word & 0x1fff;
+ ((uw_mobile_object_t *)P)->hdr.xpos = 0x0;

@position_word_5_xpos_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0x1fff;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.xpos = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_xpos_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0x1fff;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.xpos = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_xpos_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word & 0x1fff;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.xpos = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_xpos_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word = ((uw_mobile_object_t *)P)->hdr.position_word | 0xe000;
+ ((uw_mobile_object_t *)P)->hdr.xpos = 0x7;

@position_word_5_xpos_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0xe000;
- ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.xpos = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_xpos_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0xe000;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.xpos = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_xpos_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.position_word | 0xe000;
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.xpos = 0x7;
+ V = ((uw_mobile_object_t *)P)->hdr.position_word;

@position_word_5_xpos_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_mobile_object_t *)P)->hdr.position_word_high & 0x1f | (H & 0x7) << 5;
+ ((uw_mobile_object_t *)P)->hdr.xpos = H & 0x7;

@position_word_5_xpos_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_mobile_object_t *)P)->hdr.position_word_high & 0x1f;
+ ((uw_mobile_object_t *)P)->hdr.xpos = 0;

@position_word_5_xpos_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_high = ((uw_mobile_object_t *)P)->hdr.position_word_high | 0xe0;
+ ((uw_mobile_object_t *)P)->hdr.xpos = 0x7;

@position_word_5_xpos_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (H ^ ((uw_mobile_object_t *)P)->hdr.position_word_high) & 0xe0 ^ ((uw_mobile_object_t *)P)->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.xpos = (H >> 5) & 0x7;

@position_word_5_xpos_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (((uw_mobile_object_t *)P)->hdr.position_word_high ^ H) & 0xe0 ^ ((uw_mobile_object_t *)P)->hdr.position_word_high;
+ ((uw_mobile_object_t *)P)->hdr.xpos = (H >> 5) & 0x7;

@chain_word_0_quality_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word = P->chain_word & 0xffc0 | H & 0x3f;
+ P->quality = H & 0x3f;

@chain_word_0_quality_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0xffc0 | H & 0x3f;
- P->chain_word = (ushort)V;
+ P->quality = H & 0x3f;
+ V = P->chain_word;

@chain_word_0_quality_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0xffc0 | H & 0x3f;
- P->chain_word_low = (byte)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->quality = H & 0x3f;
+ V = P->chain_word;

@chain_word_0_quality_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0xffc0 | H & 0x3f;
- P->chain_word_low = (byte)(char)V;
- P->chain_word_high = (byte)(char)(V >> 8);
+ P->quality = H & 0x3f;
+ V = P->chain_word;

@chain_word_0_quality_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word = P->next << 6 | H & 0x3f;
+ P->quality = H & 0x3f;

@chain_word_0_quality_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->next << 6 | H & 0x3f;
- P->chain_word = (ushort)V;
+ P->quality = H & 0x3f;
+ V = P->chain_word;

@chain_word_0_quality_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->next << 6 | H & 0x3f;
- P->chain_word_low = (byte)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->quality = H & 0x3f;
+ V = P->chain_word;

@chain_word_0_quality_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->next << 6 | H & 0x3f;
- P->chain_word_low = (byte)(char)V;
- P->chain_word_high = (byte)(char)(V >> 8);
+ P->quality = H & 0x3f;
+ V = P->chain_word;

@chain_word_0_quality_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word = P->chain_word & 0xffc0;
+ P->quality = 0x0;

@chain_word_0_quality_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0xffc0;
- P->chain_word = (ushort)V;
+ P->quality = 0x0;
+ V = P->chain_word;

@chain_word_0_quality_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0xffc0;
- P->chain_word_low = (byte)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->quality = 0x0;
+ V = P->chain_word;

@chain_word_0_quality_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0xffc0;
- P->chain_word_low = (byte)(char)V;
- P->chain_word_high = (byte)(char)(V >> 8);
+ P->quality = 0x0;
+ V = P->chain_word;

@chain_word_0_quality_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word = P->chain_word | 0x3f;
+ P->quality = 0x3f;

@chain_word_0_quality_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word | 0x3f;
- P->chain_word = (ushort)V;
+ P->quality = 0x3f;
+ V = P->chain_word;

@chain_word_0_quality_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word | 0x3f;
- P->chain_word_low = (byte)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->quality = 0x3f;
+ V = P->chain_word;

@chain_word_0_quality_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word | 0x3f;
- P->chain_word_low = (byte)(char)V;
- P->chain_word_high = (byte)(char)(V >> 8);
+ P->quality = 0x3f;
+ V = P->chain_word;

@chain_word_0_quality_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word_low = P->chain_word_low & 0xc0 | H & 0x3f;
+ P->quality = H & 0x3f;

@chain_word_0_quality_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word_low = P->chain_word_low & 0xc0;
+ P->quality = 0;

@chain_word_0_quality_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word_low = P->chain_word_low | 0x3f;
+ P->quality = 0x3f;

@chain_word_0_quality_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word_low = (H ^ P->chain_word_low) & 0x3f ^ P->chain_word_low;
+ P->quality = H & 0x3f;

@chain_word_0_quality_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word_low = (P->chain_word_low ^ H) & 0x3f ^ P->chain_word_low;
+ P->quality = H & 0x3f;

@chain_word_0_next_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word = P->chain_word & 0x3f | (H & 0x3ff) << 6;
+ P->next = H & 0x3ff;

@chain_word_0_next_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0x3f | (H & 0x3ff) << 6;
- P->chain_word = (ushort)V;
+ P->next = H & 0x3ff;
+ V = P->chain_word;

@chain_word_0_next_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0x3f | (H & 0x3ff) << 6;
- P->chain_word_low = (byte)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->next = H & 0x3ff;
+ V = P->chain_word;

@chain_word_0_next_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0x3f | (H & 0x3ff) << 6;
- P->chain_word_low = (byte)(char)V;
- P->chain_word_high = (byte)(char)(V >> 8);
+ P->next = H & 0x3ff;
+ V = P->chain_word;

@chain_word_0_next_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word = P->quality | (H & 0x3ff) << 6;
+ P->next = H & 0x3ff;

@chain_word_0_next_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->quality | (H & 0x3ff) << 6;
- P->chain_word = (ushort)V;
+ P->next = H & 0x3ff;
+ V = P->chain_word;

@chain_word_0_next_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->quality | (H & 0x3ff) << 6;
- P->chain_word_low = (byte)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->next = H & 0x3ff;
+ V = P->chain_word;

@chain_word_0_next_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->quality | (H & 0x3ff) << 6;
- P->chain_word_low = (byte)(char)V;
- P->chain_word_high = (byte)(char)(V >> 8);
+ P->next = H & 0x3ff;
+ V = P->chain_word;

@chain_word_0_next_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word = P->chain_word & 0x3f;
+ P->next = 0x0;

@chain_word_0_next_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0x3f;
- P->chain_word = (ushort)V;
+ P->next = 0x0;
+ V = P->chain_word;

@chain_word_0_next_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0x3f;
- P->chain_word_low = (byte)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->next = 0x0;
+ V = P->chain_word;

@chain_word_0_next_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word & 0x3f;
- P->chain_word_low = (byte)(char)V;
- P->chain_word_high = (byte)(char)(V >> 8);
+ P->next = 0x0;
+ V = P->chain_word;

@chain_word_0_next_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->chain_word = P->chain_word | 0xffc0;
+ P->next = 0x3ff;

@chain_word_0_next_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word | 0xffc0;
- P->chain_word = (ushort)V;
+ P->next = 0x3ff;
+ V = P->chain_word;

@chain_word_0_next_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word | 0xffc0;
- P->chain_word_low = (byte)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->next = 0x3ff;
+ V = P->chain_word;

@chain_word_0_next_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->chain_word | 0xffc0;
- P->chain_word_low = (byte)(char)V;
- P->chain_word_high = (byte)(char)(V >> 8);
+ P->next = 0x3ff;
+ V = P->chain_word;

@chain_word_1_quality_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word = P.chain_word & 0xffc0 | H & 0x3f;
+ P.quality = H & 0x3f;

@chain_word_1_quality_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0xffc0 | H & 0x3f;
- P.chain_word = (ushort)V;
+ P.quality = H & 0x3f;
+ V = P.chain_word;

@chain_word_1_quality_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0xffc0 | H & 0x3f;
- P.chain_word_low = (byte)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.quality = H & 0x3f;
+ V = P.chain_word;

@chain_word_1_quality_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0xffc0 | H & 0x3f;
- P.chain_word_low = (byte)(char)V;
- P.chain_word_high = (byte)(char)(V >> 8);
+ P.quality = H & 0x3f;
+ V = P.chain_word;

@chain_word_1_quality_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word = P.next << 6 | H & 0x3f;
+ P.quality = H & 0x3f;

@chain_word_1_quality_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.next << 6 | H & 0x3f;
- P.chain_word = (ushort)V;
+ P.quality = H & 0x3f;
+ V = P.chain_word;

@chain_word_1_quality_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.next << 6 | H & 0x3f;
- P.chain_word_low = (byte)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.quality = H & 0x3f;
+ V = P.chain_word;

@chain_word_1_quality_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.next << 6 | H & 0x3f;
- P.chain_word_low = (byte)(char)V;
- P.chain_word_high = (byte)(char)(V >> 8);
+ P.quality = H & 0x3f;
+ V = P.chain_word;

@chain_word_1_quality_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word = P.chain_word & 0xffc0;
+ P.quality = 0x0;

@chain_word_1_quality_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0xffc0;
- P.chain_word = (ushort)V;
+ P.quality = 0x0;
+ V = P.chain_word;

@chain_word_1_quality_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0xffc0;
- P.chain_word_low = (byte)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.quality = 0x0;
+ V = P.chain_word;

@chain_word_1_quality_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0xffc0;
- P.chain_word_low = (byte)(char)V;
- P.chain_word_high = (byte)(char)(V >> 8);
+ P.quality = 0x0;
+ V = P.chain_word;

@chain_word_1_quality_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word = P.chain_word | 0x3f;
+ P.quality = 0x3f;

@chain_word_1_quality_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word | 0x3f;
- P.chain_word = (ushort)V;
+ P.quality = 0x3f;
+ V = P.chain_word;

@chain_word_1_quality_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word | 0x3f;
- P.chain_word_low = (byte)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.quality = 0x3f;
+ V = P.chain_word;

@chain_word_1_quality_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word | 0x3f;
- P.chain_word_low = (byte)(char)V;
- P.chain_word_high = (byte)(char)(V >> 8);
+ P.quality = 0x3f;
+ V = P.chain_word;

@chain_word_1_quality_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word_low = P.chain_word_low & 0xc0 | H & 0x3f;
+ P.quality = H & 0x3f;

@chain_word_1_quality_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word_low = P.chain_word_low & 0xc0;
+ P.quality = 0;

@chain_word_1_quality_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word_low = P.chain_word_low | 0x3f;
+ P.quality = 0x3f;

@chain_word_1_quality_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word_low = (H ^ P.chain_word_low) & 0x3f ^ P.chain_word_low;
+ P.quality = H & 0x3f;

@chain_word_1_quality_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word_low = (P.chain_word_low ^ H) & 0x3f ^ P.chain_word_low;
+ P.quality = H & 0x3f;

@chain_word_1_next_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word = P.chain_word & 0x3f | (H & 0x3ff) << 6;
+ P.next = H & 0x3ff;

@chain_word_1_next_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0x3f | (H & 0x3ff) << 6;
- P.chain_word = (ushort)V;
+ P.next = H & 0x3ff;
+ V = P.chain_word;

@chain_word_1_next_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0x3f | (H & 0x3ff) << 6;
- P.chain_word_low = (byte)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.next = H & 0x3ff;
+ V = P.chain_word;

@chain_word_1_next_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0x3f | (H & 0x3ff) << 6;
- P.chain_word_low = (byte)(char)V;
- P.chain_word_high = (byte)(char)(V >> 8);
+ P.next = H & 0x3ff;
+ V = P.chain_word;

@chain_word_1_next_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word = P.quality | (H & 0x3ff) << 6;
+ P.next = H & 0x3ff;

@chain_word_1_next_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.quality | (H & 0x3ff) << 6;
- P.chain_word = (ushort)V;
+ P.next = H & 0x3ff;
+ V = P.chain_word;

@chain_word_1_next_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.quality | (H & 0x3ff) << 6;
- P.chain_word_low = (byte)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.next = H & 0x3ff;
+ V = P.chain_word;

@chain_word_1_next_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.quality | (H & 0x3ff) << 6;
- P.chain_word_low = (byte)(char)V;
- P.chain_word_high = (byte)(char)(V >> 8);
+ P.next = H & 0x3ff;
+ V = P.chain_word;

@chain_word_1_next_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word = P.chain_word & 0x3f;
+ P.next = 0x0;

@chain_word_1_next_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0x3f;
- P.chain_word = (ushort)V;
+ P.next = 0x0;
+ V = P.chain_word;

@chain_word_1_next_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0x3f;
- P.chain_word_low = (byte)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.next = 0x0;
+ V = P.chain_word;

@chain_word_1_next_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word & 0x3f;
- P.chain_word_low = (byte)(char)V;
- P.chain_word_high = (byte)(char)(V >> 8);
+ P.next = 0x0;
+ V = P.chain_word;

@chain_word_1_next_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.chain_word = P.chain_word | 0xffc0;
+ P.next = 0x3ff;

@chain_word_1_next_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word | 0xffc0;
- P.chain_word = (ushort)V;
+ P.next = 0x3ff;
+ V = P.chain_word;

@chain_word_1_next_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word | 0xffc0;
- P.chain_word_low = (byte)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.next = 0x3ff;
+ V = P.chain_word;

@chain_word_1_next_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.chain_word | 0xffc0;
- P.chain_word_low = (byte)(char)V;
- P.chain_word_high = (byte)(char)(V >> 8);
+ P.next = 0x3ff;
+ V = P.chain_word;

@chain_word_2_quality_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word = P->hdr.chain_word & 0xffc0 | H & 0x3f;
+ P->hdr.quality = H & 0x3f;

@chain_word_2_quality_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0xffc0 | H & 0x3f;
- P->hdr.chain_word = (ushort)V;
+ P->hdr.quality = H & 0x3f;
+ V = P->hdr.chain_word;

@chain_word_2_quality_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0xffc0 | H & 0x3f;
- P->hdr.chain_word_low = (byte)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.quality = H & 0x3f;
+ V = P->hdr.chain_word;

@chain_word_2_quality_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0xffc0 | H & 0x3f;
- P->hdr.chain_word_low = (byte)(char)V;
- P->hdr.chain_word_high = (byte)(char)(V >> 8);
+ P->hdr.quality = H & 0x3f;
+ V = P->hdr.chain_word;

@chain_word_2_quality_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word = P->hdr.next << 6 | H & 0x3f;
+ P->hdr.quality = H & 0x3f;

@chain_word_2_quality_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.next << 6 | H & 0x3f;
- P->hdr.chain_word = (ushort)V;
+ P->hdr.quality = H & 0x3f;
+ V = P->hdr.chain_word;

@chain_word_2_quality_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.next << 6 | H & 0x3f;
- P->hdr.chain_word_low = (byte)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.quality = H & 0x3f;
+ V = P->hdr.chain_word;

@chain_word_2_quality_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.next << 6 | H & 0x3f;
- P->hdr.chain_word_low = (byte)(char)V;
- P->hdr.chain_word_high = (byte)(char)(V >> 8);
+ P->hdr.quality = H & 0x3f;
+ V = P->hdr.chain_word;

@chain_word_2_quality_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word = P->hdr.chain_word & 0xffc0;
+ P->hdr.quality = 0x0;

@chain_word_2_quality_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0xffc0;
- P->hdr.chain_word = (ushort)V;
+ P->hdr.quality = 0x0;
+ V = P->hdr.chain_word;

@chain_word_2_quality_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0xffc0;
- P->hdr.chain_word_low = (byte)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.quality = 0x0;
+ V = P->hdr.chain_word;

@chain_word_2_quality_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0xffc0;
- P->hdr.chain_word_low = (byte)(char)V;
- P->hdr.chain_word_high = (byte)(char)(V >> 8);
+ P->hdr.quality = 0x0;
+ V = P->hdr.chain_word;

@chain_word_2_quality_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word = P->hdr.chain_word | 0x3f;
+ P->hdr.quality = 0x3f;

@chain_word_2_quality_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word | 0x3f;
- P->hdr.chain_word = (ushort)V;
+ P->hdr.quality = 0x3f;
+ V = P->hdr.chain_word;

@chain_word_2_quality_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word | 0x3f;
- P->hdr.chain_word_low = (byte)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.quality = 0x3f;
+ V = P->hdr.chain_word;

@chain_word_2_quality_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word | 0x3f;
- P->hdr.chain_word_low = (byte)(char)V;
- P->hdr.chain_word_high = (byte)(char)(V >> 8);
+ P->hdr.quality = 0x3f;
+ V = P->hdr.chain_word;

@chain_word_2_quality_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word_low = P->hdr.chain_word_low & 0xc0 | H & 0x3f;
+ P->hdr.quality = H & 0x3f;

@chain_word_2_quality_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word_low = P->hdr.chain_word_low & 0xc0;
+ P->hdr.quality = 0;

@chain_word_2_quality_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word_low = P->hdr.chain_word_low | 0x3f;
+ P->hdr.quality = 0x3f;

@chain_word_2_quality_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word_low = (H ^ P->hdr.chain_word_low) & 0x3f ^ P->hdr.chain_word_low;
+ P->hdr.quality = H & 0x3f;

@chain_word_2_quality_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word_low = (P->hdr.chain_word_low ^ H) & 0x3f ^ P->hdr.chain_word_low;
+ P->hdr.quality = H & 0x3f;

@chain_word_2_next_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word = P->hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
+ P->hdr.next = H & 0x3ff;

@chain_word_2_next_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
- P->hdr.chain_word = (ushort)V;
+ P->hdr.next = H & 0x3ff;
+ V = P->hdr.chain_word;

@chain_word_2_next_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
- P->hdr.chain_word_low = (byte)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.next = H & 0x3ff;
+ V = P->hdr.chain_word;

@chain_word_2_next_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
- P->hdr.chain_word_low = (byte)(char)V;
- P->hdr.chain_word_high = (byte)(char)(V >> 8);
+ P->hdr.next = H & 0x3ff;
+ V = P->hdr.chain_word;

@chain_word_2_next_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word = P->hdr.quality | (H & 0x3ff) << 6;
+ P->hdr.next = H & 0x3ff;

@chain_word_2_next_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.quality | (H & 0x3ff) << 6;
- P->hdr.chain_word = (ushort)V;
+ P->hdr.next = H & 0x3ff;
+ V = P->hdr.chain_word;

@chain_word_2_next_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.quality | (H & 0x3ff) << 6;
- P->hdr.chain_word_low = (byte)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.next = H & 0x3ff;
+ V = P->hdr.chain_word;

@chain_word_2_next_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.quality | (H & 0x3ff) << 6;
- P->hdr.chain_word_low = (byte)(char)V;
- P->hdr.chain_word_high = (byte)(char)(V >> 8);
+ P->hdr.next = H & 0x3ff;
+ V = P->hdr.chain_word;

@chain_word_2_next_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word = P->hdr.chain_word & 0x3f;
+ P->hdr.next = 0x0;

@chain_word_2_next_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0x3f;
- P->hdr.chain_word = (ushort)V;
+ P->hdr.next = 0x0;
+ V = P->hdr.chain_word;

@chain_word_2_next_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0x3f;
- P->hdr.chain_word_low = (byte)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.next = 0x0;
+ V = P->hdr.chain_word;

@chain_word_2_next_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word & 0x3f;
- P->hdr.chain_word_low = (byte)(char)V;
- P->hdr.chain_word_high = (byte)(char)(V >> 8);
+ P->hdr.next = 0x0;
+ V = P->hdr.chain_word;

@chain_word_2_next_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.chain_word = P->hdr.chain_word | 0xffc0;
+ P->hdr.next = 0x3ff;

@chain_word_2_next_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word | 0xffc0;
- P->hdr.chain_word = (ushort)V;
+ P->hdr.next = 0x3ff;
+ V = P->hdr.chain_word;

@chain_word_2_next_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word | 0xffc0;
- P->hdr.chain_word_low = (byte)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.next = 0x3ff;
+ V = P->hdr.chain_word;

@chain_word_2_next_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.chain_word | 0xffc0;
- P->hdr.chain_word_low = (byte)(char)V;
- P->hdr.chain_word_high = (byte)(char)(V >> 8);
+ P->hdr.next = 0x3ff;
+ V = P->hdr.chain_word;

@chain_word_3_quality_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word = P.hdr.chain_word & 0xffc0 | H & 0x3f;
+ P.hdr.quality = H & 0x3f;

@chain_word_3_quality_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0xffc0 | H & 0x3f;
- P.hdr.chain_word = (ushort)V;
+ P.hdr.quality = H & 0x3f;
+ V = P.hdr.chain_word;

@chain_word_3_quality_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0xffc0 | H & 0x3f;
- P.hdr.chain_word_low = (byte)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.quality = H & 0x3f;
+ V = P.hdr.chain_word;

@chain_word_3_quality_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0xffc0 | H & 0x3f;
- P.hdr.chain_word_low = (byte)(char)V;
- P.hdr.chain_word_high = (byte)(char)(V >> 8);
+ P.hdr.quality = H & 0x3f;
+ V = P.hdr.chain_word;

@chain_word_3_quality_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word = P.hdr.next << 6 | H & 0x3f;
+ P.hdr.quality = H & 0x3f;

@chain_word_3_quality_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.next << 6 | H & 0x3f;
- P.hdr.chain_word = (ushort)V;
+ P.hdr.quality = H & 0x3f;
+ V = P.hdr.chain_word;

@chain_word_3_quality_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.next << 6 | H & 0x3f;
- P.hdr.chain_word_low = (byte)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.quality = H & 0x3f;
+ V = P.hdr.chain_word;

@chain_word_3_quality_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.next << 6 | H & 0x3f;
- P.hdr.chain_word_low = (byte)(char)V;
- P.hdr.chain_word_high = (byte)(char)(V >> 8);
+ P.hdr.quality = H & 0x3f;
+ V = P.hdr.chain_word;

@chain_word_3_quality_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word = P.hdr.chain_word & 0xffc0;
+ P.hdr.quality = 0x0;

@chain_word_3_quality_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0xffc0;
- P.hdr.chain_word = (ushort)V;
+ P.hdr.quality = 0x0;
+ V = P.hdr.chain_word;

@chain_word_3_quality_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0xffc0;
- P.hdr.chain_word_low = (byte)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.quality = 0x0;
+ V = P.hdr.chain_word;

@chain_word_3_quality_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0xffc0;
- P.hdr.chain_word_low = (byte)(char)V;
- P.hdr.chain_word_high = (byte)(char)(V >> 8);
+ P.hdr.quality = 0x0;
+ V = P.hdr.chain_word;

@chain_word_3_quality_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word = P.hdr.chain_word | 0x3f;
+ P.hdr.quality = 0x3f;

@chain_word_3_quality_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word | 0x3f;
- P.hdr.chain_word = (ushort)V;
+ P.hdr.quality = 0x3f;
+ V = P.hdr.chain_word;

@chain_word_3_quality_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word | 0x3f;
- P.hdr.chain_word_low = (byte)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.quality = 0x3f;
+ V = P.hdr.chain_word;

@chain_word_3_quality_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word | 0x3f;
- P.hdr.chain_word_low = (byte)(char)V;
- P.hdr.chain_word_high = (byte)(char)(V >> 8);
+ P.hdr.quality = 0x3f;
+ V = P.hdr.chain_word;

@chain_word_3_quality_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word_low = P.hdr.chain_word_low & 0xc0 | H & 0x3f;
+ P.hdr.quality = H & 0x3f;

@chain_word_3_quality_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word_low = P.hdr.chain_word_low & 0xc0;
+ P.hdr.quality = 0;

@chain_word_3_quality_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word_low = P.hdr.chain_word_low | 0x3f;
+ P.hdr.quality = 0x3f;

@chain_word_3_quality_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word_low = (H ^ P.hdr.chain_word_low) & 0x3f ^ P.hdr.chain_word_low;
+ P.hdr.quality = H & 0x3f;

@chain_word_3_quality_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word_low = (P.hdr.chain_word_low ^ H) & 0x3f ^ P.hdr.chain_word_low;
+ P.hdr.quality = H & 0x3f;

@chain_word_3_next_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word = P.hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
+ P.hdr.next = H & 0x3ff;

@chain_word_3_next_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
- P.hdr.chain_word = (ushort)V;
+ P.hdr.next = H & 0x3ff;
+ V = P.hdr.chain_word;

@chain_word_3_next_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
- P.hdr.chain_word_low = (byte)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.next = H & 0x3ff;
+ V = P.hdr.chain_word;

@chain_word_3_next_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
- P.hdr.chain_word_low = (byte)(char)V;
- P.hdr.chain_word_high = (byte)(char)(V >> 8);
+ P.hdr.next = H & 0x3ff;
+ V = P.hdr.chain_word;

@chain_word_3_next_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word = P.hdr.quality | (H & 0x3ff) << 6;
+ P.hdr.next = H & 0x3ff;

@chain_word_3_next_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.quality | (H & 0x3ff) << 6;
- P.hdr.chain_word = (ushort)V;
+ P.hdr.next = H & 0x3ff;
+ V = P.hdr.chain_word;

@chain_word_3_next_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.quality | (H & 0x3ff) << 6;
- P.hdr.chain_word_low = (byte)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.next = H & 0x3ff;
+ V = P.hdr.chain_word;

@chain_word_3_next_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.quality | (H & 0x3ff) << 6;
- P.hdr.chain_word_low = (byte)(char)V;
- P.hdr.chain_word_high = (byte)(char)(V >> 8);
+ P.hdr.next = H & 0x3ff;
+ V = P.hdr.chain_word;

@chain_word_3_next_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word = P.hdr.chain_word & 0x3f;
+ P.hdr.next = 0x0;

@chain_word_3_next_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0x3f;
- P.hdr.chain_word = (ushort)V;
+ P.hdr.next = 0x0;
+ V = P.hdr.chain_word;

@chain_word_3_next_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0x3f;
- P.hdr.chain_word_low = (byte)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.next = 0x0;
+ V = P.hdr.chain_word;

@chain_word_3_next_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word & 0x3f;
- P.hdr.chain_word_low = (byte)(char)V;
- P.hdr.chain_word_high = (byte)(char)(V >> 8);
+ P.hdr.next = 0x0;
+ V = P.hdr.chain_word;

@chain_word_3_next_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.chain_word = P.hdr.chain_word | 0xffc0;
+ P.hdr.next = 0x3ff;

@chain_word_3_next_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word | 0xffc0;
- P.hdr.chain_word = (ushort)V;
+ P.hdr.next = 0x3ff;
+ V = P.hdr.chain_word;

@chain_word_3_next_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word | 0xffc0;
- P.hdr.chain_word_low = (byte)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.next = 0x3ff;
+ V = P.hdr.chain_word;

@chain_word_3_next_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.chain_word | 0xffc0;
- P.hdr.chain_word_low = (byte)(char)V;
- P.hdr.chain_word_high = (byte)(char)(V >> 8);
+ P.hdr.next = 0x3ff;
+ V = P.hdr.chain_word;

@chain_word_4_quality_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)P)->chain_word & 0xffc0 | H & 0x3f;
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;

@chain_word_4_quality_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0xffc0 | H & 0x3f;
- ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0xffc0 | H & 0x3f;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0xffc0 | H & 0x3f;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)P)->next << 6 | H & 0x3f;
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;

@chain_word_4_quality_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->next << 6 | H & 0x3f;
- ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->next << 6 | H & 0x3f;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->next << 6 | H & 0x3f;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)P)->chain_word & 0xffc0;
+ ((uw_object_hdr_t *)P)->quality = 0x0;

@chain_word_4_quality_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0xffc0;
- ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->quality = 0x0;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0xffc0;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->quality = 0x0;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0xffc0;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->quality = 0x0;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)P)->chain_word | 0x3f;
+ ((uw_object_hdr_t *)P)->quality = 0x3f;

@chain_word_4_quality_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word | 0x3f;
- ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->quality = 0x3f;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word | 0x3f;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->quality = 0x3f;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word | 0x3f;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->quality = 0x3f;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_quality_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word_low = ((uw_object_hdr_t *)P)->chain_word_low & 0xc0 | H & 0x3f;
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;

@chain_word_4_quality_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word_low = ((uw_object_hdr_t *)P)->chain_word_low & 0xc0;
+ ((uw_object_hdr_t *)P)->quality = 0;

@chain_word_4_quality_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word_low = ((uw_object_hdr_t *)P)->chain_word_low | 0x3f;
+ ((uw_object_hdr_t *)P)->quality = 0x3f;

@chain_word_4_quality_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word_low = (H ^ ((uw_object_hdr_t *)P)->chain_word_low) & 0x3f ^ ((uw_object_hdr_t *)P)->chain_word_low;
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;

@chain_word_4_quality_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word_low = (((uw_object_hdr_t *)P)->chain_word_low ^ H) & 0x3f ^ ((uw_object_hdr_t *)P)->chain_word_low;
+ ((uw_object_hdr_t *)P)->quality = H & 0x3f;

@chain_word_4_next_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)P)->chain_word & 0x3f | (H & 0x3ff) << 6;
+ ((uw_object_hdr_t *)P)->next = H & 0x3ff;

@chain_word_4_next_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->next = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->next = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->next = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)P)->quality | (H & 0x3ff) << 6;
+ ((uw_object_hdr_t *)P)->next = H & 0x3ff;

@chain_word_4_next_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->quality | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->next = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->quality | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->next = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->quality | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->next = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)P)->chain_word & 0x3f;
+ ((uw_object_hdr_t *)P)->next = 0x0;

@chain_word_4_next_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0x3f;
- ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->next = 0x0;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0x3f;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->next = 0x0;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word & 0x3f;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->next = 0x0;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->chain_word = ((uw_object_hdr_t *)P)->chain_word | 0xffc0;
+ ((uw_object_hdr_t *)P)->next = 0x3ff;

@chain_word_4_next_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word | 0xffc0;
- ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->next = 0x3ff;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word | 0xffc0;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->next = 0x3ff;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_4_next_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->chain_word | 0xffc0;
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->next = 0x3ff;
+ V = ((uw_object_hdr_t *)P)->chain_word;

@chain_word_5_quality_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)P)->hdr.chain_word & 0xffc0 | H & 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;

@chain_word_5_quality_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0xffc0 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0xffc0 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0xffc0 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)P)->hdr.next << 6 | H & 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;

@chain_word_5_quality_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.next << 6 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.next << 6 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.next << 6 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)P)->hdr.chain_word & 0xffc0;
+ ((uw_mobile_object_t *)P)->hdr.quality = 0x0;

@chain_word_5_quality_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.quality = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.quality = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.quality = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)P)->hdr.chain_word | 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.quality = 0x3f;

@chain_word_5_quality_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word | 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.quality = 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word | 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.quality = 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word | 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.quality = 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_quality_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = ((uw_mobile_object_t *)P)->hdr.chain_word_low & 0xc0 | H & 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;

@chain_word_5_quality_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = ((uw_mobile_object_t *)P)->hdr.chain_word_low & 0xc0;
+ ((uw_mobile_object_t *)P)->hdr.quality = 0;

@chain_word_5_quality_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = ((uw_mobile_object_t *)P)->hdr.chain_word_low | 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.quality = 0x3f;

@chain_word_5_quality_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (H ^ ((uw_mobile_object_t *)P)->hdr.chain_word_low) & 0x3f ^ ((uw_mobile_object_t *)P)->hdr.chain_word_low;
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;

@chain_word_5_quality_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (((uw_mobile_object_t *)P)->hdr.chain_word_low ^ H) & 0x3f ^ ((uw_mobile_object_t *)P)->hdr.chain_word_low;
+ ((uw_mobile_object_t *)P)->hdr.quality = H & 0x3f;

@chain_word_5_next_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)P)->hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
+ ((uw_mobile_object_t *)P)->hdr.next = H & 0x3ff;

@chain_word_5_next_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.next = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.next = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.next = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)P)->hdr.quality | (H & 0x3ff) << 6;
+ ((uw_mobile_object_t *)P)->hdr.next = H & 0x3ff;

@chain_word_5_next_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.quality | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.next = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.quality | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.next = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.quality | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.next = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)P)->hdr.chain_word & 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.next = 0x0;

@chain_word_5_next_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.next = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.next = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.next = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.chain_word = ((uw_mobile_object_t *)P)->hdr.chain_word | 0xffc0;
+ ((uw_mobile_object_t *)P)->hdr.next = 0x3ff;

@chain_word_5_next_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word | 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.next = 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word | 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.next = 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@chain_word_5_next_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.chain_word | 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.next = 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.chain_word;

@link_word_0_owner_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word = P->link_word & 0xffc0 | H & 0x3f;
+ P->owner = H & 0x3f;

@link_word_0_owner_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0xffc0 | H & 0x3f;
- P->link_word = (ushort)V;
+ P->owner = H & 0x3f;
+ V = P->link_word;

@link_word_0_owner_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0xffc0 | H & 0x3f;
- P->link_word_low = (byte)V;
- P->link_word_high = (byte)(V >> 8);
+ P->owner = H & 0x3f;
+ V = P->link_word;

@link_word_0_owner_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0xffc0 | H & 0x3f;
- P->link_word_low = (byte)(char)V;
- P->link_word_high = (byte)(char)(V >> 8);
+ P->owner = H & 0x3f;
+ V = P->link_word;

@link_word_0_owner_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word = P->link << 6 | H & 0x3f;
+ P->owner = H & 0x3f;

@link_word_0_owner_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link << 6 | H & 0x3f;
- P->link_word = (ushort)V;
+ P->owner = H & 0x3f;
+ V = P->link_word;

@link_word_0_owner_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link << 6 | H & 0x3f;
- P->link_word_low = (byte)V;
- P->link_word_high = (byte)(V >> 8);
+ P->owner = H & 0x3f;
+ V = P->link_word;

@link_word_0_owner_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link << 6 | H & 0x3f;
- P->link_word_low = (byte)(char)V;
- P->link_word_high = (byte)(char)(V >> 8);
+ P->owner = H & 0x3f;
+ V = P->link_word;

@link_word_0_owner_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word = P->link_word & 0xffc0;
+ P->owner = 0x0;

@link_word_0_owner_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0xffc0;
- P->link_word = (ushort)V;
+ P->owner = 0x0;
+ V = P->link_word;

@link_word_0_owner_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0xffc0;
- P->link_word_low = (byte)V;
- P->link_word_high = (byte)(V >> 8);
+ P->owner = 0x0;
+ V = P->link_word;

@link_word_0_owner_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0xffc0;
- P->link_word_low = (byte)(char)V;
- P->link_word_high = (byte)(char)(V >> 8);
+ P->owner = 0x0;
+ V = P->link_word;

@link_word_0_owner_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word = P->link_word | 0x3f;
+ P->owner = 0x3f;

@link_word_0_owner_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word | 0x3f;
- P->link_word = (ushort)V;
+ P->owner = 0x3f;
+ V = P->link_word;

@link_word_0_owner_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word | 0x3f;
- P->link_word_low = (byte)V;
- P->link_word_high = (byte)(V >> 8);
+ P->owner = 0x3f;
+ V = P->link_word;

@link_word_0_owner_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word | 0x3f;
- P->link_word_low = (byte)(char)V;
- P->link_word_high = (byte)(char)(V >> 8);
+ P->owner = 0x3f;
+ V = P->link_word;

@link_word_0_owner_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word_low = P->link_word_low & 0xc0 | H & 0x3f;
+ P->owner = H & 0x3f;

@link_word_0_owner_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word_low = P->link_word_low & 0xc0;
+ P->owner = 0;

@link_word_0_owner_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word_low = P->link_word_low | 0x3f;
+ P->owner = 0x3f;

@link_word_0_owner_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word_low = (H ^ P->link_word_low) & 0x3f ^ P->link_word_low;
+ P->owner = H & 0x3f;

@link_word_0_owner_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word_low = (P->link_word_low ^ H) & 0x3f ^ P->link_word_low;
+ P->owner = H & 0x3f;

@link_word_0_link_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word = P->link_word & 0x3f | (H & 0x3ff) << 6;
+ P->link = H & 0x3ff;

@link_word_0_link_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0x3f | (H & 0x3ff) << 6;
- P->link_word = (ushort)V;
+ P->link = H & 0x3ff;
+ V = P->link_word;

@link_word_0_link_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0x3f | (H & 0x3ff) << 6;
- P->link_word_low = (byte)V;
- P->link_word_high = (byte)(V >> 8);
+ P->link = H & 0x3ff;
+ V = P->link_word;

@link_word_0_link_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0x3f | (H & 0x3ff) << 6;
- P->link_word_low = (byte)(char)V;
- P->link_word_high = (byte)(char)(V >> 8);
+ P->link = H & 0x3ff;
+ V = P->link_word;

@link_word_0_link_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word = P->owner | (H & 0x3ff) << 6;
+ P->link = H & 0x3ff;

@link_word_0_link_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->owner | (H & 0x3ff) << 6;
- P->link_word = (ushort)V;
+ P->link = H & 0x3ff;
+ V = P->link_word;

@link_word_0_link_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->owner | (H & 0x3ff) << 6;
- P->link_word_low = (byte)V;
- P->link_word_high = (byte)(V >> 8);
+ P->link = H & 0x3ff;
+ V = P->link_word;

@link_word_0_link_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->owner | (H & 0x3ff) << 6;
- P->link_word_low = (byte)(char)V;
- P->link_word_high = (byte)(char)(V >> 8);
+ P->link = H & 0x3ff;
+ V = P->link_word;

@link_word_0_link_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word = P->link_word & 0x3f;
+ P->link = 0x0;

@link_word_0_link_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0x3f;
- P->link_word = (ushort)V;
+ P->link = 0x0;
+ V = P->link_word;

@link_word_0_link_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0x3f;
- P->link_word_low = (byte)V;
- P->link_word_high = (byte)(V >> 8);
+ P->link = 0x0;
+ V = P->link_word;

@link_word_0_link_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word & 0x3f;
- P->link_word_low = (byte)(char)V;
- P->link_word_high = (byte)(char)(V >> 8);
+ P->link = 0x0;
+ V = P->link_word;

@link_word_0_link_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->link_word = P->link_word | 0xffc0;
+ P->link = 0x3ff;

@link_word_0_link_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word | 0xffc0;
- P->link_word = (ushort)V;
+ P->link = 0x3ff;
+ V = P->link_word;

@link_word_0_link_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word | 0xffc0;
- P->link_word_low = (byte)V;
- P->link_word_high = (byte)(V >> 8);
+ P->link = 0x3ff;
+ V = P->link_word;

@link_word_0_link_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->link_word | 0xffc0;
- P->link_word_low = (byte)(char)V;
- P->link_word_high = (byte)(char)(V >> 8);
+ P->link = 0x3ff;
+ V = P->link_word;

@link_word_1_owner_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word = P.link_word & 0xffc0 | H & 0x3f;
+ P.owner = H & 0x3f;

@link_word_1_owner_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0xffc0 | H & 0x3f;
- P.link_word = (ushort)V;
+ P.owner = H & 0x3f;
+ V = P.link_word;

@link_word_1_owner_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0xffc0 | H & 0x3f;
- P.link_word_low = (byte)V;
- P.link_word_high = (byte)(V >> 8);
+ P.owner = H & 0x3f;
+ V = P.link_word;

@link_word_1_owner_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0xffc0 | H & 0x3f;
- P.link_word_low = (byte)(char)V;
- P.link_word_high = (byte)(char)(V >> 8);
+ P.owner = H & 0x3f;
+ V = P.link_word;

@link_word_1_owner_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word = P.link << 6 | H & 0x3f;
+ P.owner = H & 0x3f;

@link_word_1_owner_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link << 6 | H & 0x3f;
- P.link_word = (ushort)V;
+ P.owner = H & 0x3f;
+ V = P.link_word;

@link_word_1_owner_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link << 6 | H & 0x3f;
- P.link_word_low = (byte)V;
- P.link_word_high = (byte)(V >> 8);
+ P.owner = H & 0x3f;
+ V = P.link_word;

@link_word_1_owner_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link << 6 | H & 0x3f;
- P.link_word_low = (byte)(char)V;
- P.link_word_high = (byte)(char)(V >> 8);
+ P.owner = H & 0x3f;
+ V = P.link_word;

@link_word_1_owner_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word = P.link_word & 0xffc0;
+ P.owner = 0x0;

@link_word_1_owner_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0xffc0;
- P.link_word = (ushort)V;
+ P.owner = 0x0;
+ V = P.link_word;

@link_word_1_owner_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0xffc0;
- P.link_word_low = (byte)V;
- P.link_word_high = (byte)(V >> 8);
+ P.owner = 0x0;
+ V = P.link_word;

@link_word_1_owner_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0xffc0;
- P.link_word_low = (byte)(char)V;
- P.link_word_high = (byte)(char)(V >> 8);
+ P.owner = 0x0;
+ V = P.link_word;

@link_word_1_owner_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word = P.link_word | 0x3f;
+ P.owner = 0x3f;

@link_word_1_owner_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word | 0x3f;
- P.link_word = (ushort)V;
+ P.owner = 0x3f;
+ V = P.link_word;

@link_word_1_owner_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word | 0x3f;
- P.link_word_low = (byte)V;
- P.link_word_high = (byte)(V >> 8);
+ P.owner = 0x3f;
+ V = P.link_word;

@link_word_1_owner_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word | 0x3f;
- P.link_word_low = (byte)(char)V;
- P.link_word_high = (byte)(char)(V >> 8);
+ P.owner = 0x3f;
+ V = P.link_word;

@link_word_1_owner_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word_low = P.link_word_low & 0xc0 | H & 0x3f;
+ P.owner = H & 0x3f;

@link_word_1_owner_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word_low = P.link_word_low & 0xc0;
+ P.owner = 0;

@link_word_1_owner_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word_low = P.link_word_low | 0x3f;
+ P.owner = 0x3f;

@link_word_1_owner_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word_low = (H ^ P.link_word_low) & 0x3f ^ P.link_word_low;
+ P.owner = H & 0x3f;

@link_word_1_owner_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word_low = (P.link_word_low ^ H) & 0x3f ^ P.link_word_low;
+ P.owner = H & 0x3f;

@link_word_1_link_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word = P.link_word & 0x3f | (H & 0x3ff) << 6;
+ P.link = H & 0x3ff;

@link_word_1_link_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0x3f | (H & 0x3ff) << 6;
- P.link_word = (ushort)V;
+ P.link = H & 0x3ff;
+ V = P.link_word;

@link_word_1_link_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0x3f | (H & 0x3ff) << 6;
- P.link_word_low = (byte)V;
- P.link_word_high = (byte)(V >> 8);
+ P.link = H & 0x3ff;
+ V = P.link_word;

@link_word_1_link_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0x3f | (H & 0x3ff) << 6;
- P.link_word_low = (byte)(char)V;
- P.link_word_high = (byte)(char)(V >> 8);
+ P.link = H & 0x3ff;
+ V = P.link_word;

@link_word_1_link_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word = P.owner | (H & 0x3ff) << 6;
+ P.link = H & 0x3ff;

@link_word_1_link_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.owner | (H & 0x3ff) << 6;
- P.link_word = (ushort)V;
+ P.link = H & 0x3ff;
+ V = P.link_word;

@link_word_1_link_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.owner | (H & 0x3ff) << 6;
- P.link_word_low = (byte)V;
- P.link_word_high = (byte)(V >> 8);
+ P.link = H & 0x3ff;
+ V = P.link_word;

@link_word_1_link_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.owner | (H & 0x3ff) << 6;
- P.link_word_low = (byte)(char)V;
- P.link_word_high = (byte)(char)(V >> 8);
+ P.link = H & 0x3ff;
+ V = P.link_word;

@link_word_1_link_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word = P.link_word & 0x3f;
+ P.link = 0x0;

@link_word_1_link_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0x3f;
- P.link_word = (ushort)V;
+ P.link = 0x0;
+ V = P.link_word;

@link_word_1_link_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0x3f;
- P.link_word_low = (byte)V;
- P.link_word_high = (byte)(V >> 8);
+ P.link = 0x0;
+ V = P.link_word;

@link_word_1_link_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word & 0x3f;
- P.link_word_low = (byte)(char)V;
- P.link_word_high = (byte)(char)(V >> 8);
+ P.link = 0x0;
+ V = P.link_word;

@link_word_1_link_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.link_word = P.link_word | 0xffc0;
+ P.link = 0x3ff;

@link_word_1_link_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word | 0xffc0;
- P.link_word = (ushort)V;
+ P.link = 0x3ff;
+ V = P.link_word;

@link_word_1_link_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word | 0xffc0;
- P.link_word_low = (byte)V;
- P.link_word_high = (byte)(V >> 8);
+ P.link = 0x3ff;
+ V = P.link_word;

@link_word_1_link_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.link_word | 0xffc0;
- P.link_word_low = (byte)(char)V;
- P.link_word_high = (byte)(char)(V >> 8);
+ P.link = 0x3ff;
+ V = P.link_word;

@link_word_2_owner_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word = P->hdr.link_word & 0xffc0 | H & 0x3f;
+ P->hdr.owner = H & 0x3f;

@link_word_2_owner_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0xffc0 | H & 0x3f;
- P->hdr.link_word = (ushort)V;
+ P->hdr.owner = H & 0x3f;
+ V = P->hdr.link_word;

@link_word_2_owner_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0xffc0 | H & 0x3f;
- P->hdr.link_word_low = (byte)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.owner = H & 0x3f;
+ V = P->hdr.link_word;

@link_word_2_owner_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0xffc0 | H & 0x3f;
- P->hdr.link_word_low = (byte)(char)V;
- P->hdr.link_word_high = (byte)(char)(V >> 8);
+ P->hdr.owner = H & 0x3f;
+ V = P->hdr.link_word;

@link_word_2_owner_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word = P->hdr.link << 6 | H & 0x3f;
+ P->hdr.owner = H & 0x3f;

@link_word_2_owner_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link << 6 | H & 0x3f;
- P->hdr.link_word = (ushort)V;
+ P->hdr.owner = H & 0x3f;
+ V = P->hdr.link_word;

@link_word_2_owner_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link << 6 | H & 0x3f;
- P->hdr.link_word_low = (byte)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.owner = H & 0x3f;
+ V = P->hdr.link_word;

@link_word_2_owner_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link << 6 | H & 0x3f;
- P->hdr.link_word_low = (byte)(char)V;
- P->hdr.link_word_high = (byte)(char)(V >> 8);
+ P->hdr.owner = H & 0x3f;
+ V = P->hdr.link_word;

@link_word_2_owner_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word = P->hdr.link_word & 0xffc0;
+ P->hdr.owner = 0x0;

@link_word_2_owner_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0xffc0;
- P->hdr.link_word = (ushort)V;
+ P->hdr.owner = 0x0;
+ V = P->hdr.link_word;

@link_word_2_owner_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0xffc0;
- P->hdr.link_word_low = (byte)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.owner = 0x0;
+ V = P->hdr.link_word;

@link_word_2_owner_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0xffc0;
- P->hdr.link_word_low = (byte)(char)V;
- P->hdr.link_word_high = (byte)(char)(V >> 8);
+ P->hdr.owner = 0x0;
+ V = P->hdr.link_word;

@link_word_2_owner_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word = P->hdr.link_word | 0x3f;
+ P->hdr.owner = 0x3f;

@link_word_2_owner_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word | 0x3f;
- P->hdr.link_word = (ushort)V;
+ P->hdr.owner = 0x3f;
+ V = P->hdr.link_word;

@link_word_2_owner_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word | 0x3f;
- P->hdr.link_word_low = (byte)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.owner = 0x3f;
+ V = P->hdr.link_word;

@link_word_2_owner_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word | 0x3f;
- P->hdr.link_word_low = (byte)(char)V;
- P->hdr.link_word_high = (byte)(char)(V >> 8);
+ P->hdr.owner = 0x3f;
+ V = P->hdr.link_word;

@link_word_2_owner_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word_low = P->hdr.link_word_low & 0xc0 | H & 0x3f;
+ P->hdr.owner = H & 0x3f;

@link_word_2_owner_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word_low = P->hdr.link_word_low & 0xc0;
+ P->hdr.owner = 0;

@link_word_2_owner_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word_low = P->hdr.link_word_low | 0x3f;
+ P->hdr.owner = 0x3f;

@link_word_2_owner_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word_low = (H ^ P->hdr.link_word_low) & 0x3f ^ P->hdr.link_word_low;
+ P->hdr.owner = H & 0x3f;

@link_word_2_owner_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word_low = (P->hdr.link_word_low ^ H) & 0x3f ^ P->hdr.link_word_low;
+ P->hdr.owner = H & 0x3f;

@link_word_2_link_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word = P->hdr.link_word & 0x3f | (H & 0x3ff) << 6;
+ P->hdr.link = H & 0x3ff;

@link_word_2_link_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0x3f | (H & 0x3ff) << 6;
- P->hdr.link_word = (ushort)V;
+ P->hdr.link = H & 0x3ff;
+ V = P->hdr.link_word;

@link_word_2_link_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0x3f | (H & 0x3ff) << 6;
- P->hdr.link_word_low = (byte)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.link = H & 0x3ff;
+ V = P->hdr.link_word;

@link_word_2_link_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0x3f | (H & 0x3ff) << 6;
- P->hdr.link_word_low = (byte)(char)V;
- P->hdr.link_word_high = (byte)(char)(V >> 8);
+ P->hdr.link = H & 0x3ff;
+ V = P->hdr.link_word;

@link_word_2_link_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word = P->hdr.owner | (H & 0x3ff) << 6;
+ P->hdr.link = H & 0x3ff;

@link_word_2_link_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.owner | (H & 0x3ff) << 6;
- P->hdr.link_word = (ushort)V;
+ P->hdr.link = H & 0x3ff;
+ V = P->hdr.link_word;

@link_word_2_link_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.owner | (H & 0x3ff) << 6;
- P->hdr.link_word_low = (byte)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.link = H & 0x3ff;
+ V = P->hdr.link_word;

@link_word_2_link_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.owner | (H & 0x3ff) << 6;
- P->hdr.link_word_low = (byte)(char)V;
- P->hdr.link_word_high = (byte)(char)(V >> 8);
+ P->hdr.link = H & 0x3ff;
+ V = P->hdr.link_word;

@link_word_2_link_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word = P->hdr.link_word & 0x3f;
+ P->hdr.link = 0x0;

@link_word_2_link_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0x3f;
- P->hdr.link_word = (ushort)V;
+ P->hdr.link = 0x0;
+ V = P->hdr.link_word;

@link_word_2_link_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0x3f;
- P->hdr.link_word_low = (byte)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.link = 0x0;
+ V = P->hdr.link_word;

@link_word_2_link_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word & 0x3f;
- P->hdr.link_word_low = (byte)(char)V;
- P->hdr.link_word_high = (byte)(char)(V >> 8);
+ P->hdr.link = 0x0;
+ V = P->hdr.link_word;

@link_word_2_link_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->hdr.link_word = P->hdr.link_word | 0xffc0;
+ P->hdr.link = 0x3ff;

@link_word_2_link_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word | 0xffc0;
- P->hdr.link_word = (ushort)V;
+ P->hdr.link = 0x3ff;
+ V = P->hdr.link_word;

@link_word_2_link_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word | 0xffc0;
- P->hdr.link_word_low = (byte)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.link = 0x3ff;
+ V = P->hdr.link_word;

@link_word_2_link_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->hdr.link_word | 0xffc0;
- P->hdr.link_word_low = (byte)(char)V;
- P->hdr.link_word_high = (byte)(char)(V >> 8);
+ P->hdr.link = 0x3ff;
+ V = P->hdr.link_word;

@link_word_3_owner_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word = P.hdr.link_word & 0xffc0 | H & 0x3f;
+ P.hdr.owner = H & 0x3f;

@link_word_3_owner_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0xffc0 | H & 0x3f;
- P.hdr.link_word = (ushort)V;
+ P.hdr.owner = H & 0x3f;
+ V = P.hdr.link_word;

@link_word_3_owner_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0xffc0 | H & 0x3f;
- P.hdr.link_word_low = (byte)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.owner = H & 0x3f;
+ V = P.hdr.link_word;

@link_word_3_owner_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0xffc0 | H & 0x3f;
- P.hdr.link_word_low = (byte)(char)V;
- P.hdr.link_word_high = (byte)(char)(V >> 8);
+ P.hdr.owner = H & 0x3f;
+ V = P.hdr.link_word;

@link_word_3_owner_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word = P.hdr.link << 6 | H & 0x3f;
+ P.hdr.owner = H & 0x3f;

@link_word_3_owner_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link << 6 | H & 0x3f;
- P.hdr.link_word = (ushort)V;
+ P.hdr.owner = H & 0x3f;
+ V = P.hdr.link_word;

@link_word_3_owner_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link << 6 | H & 0x3f;
- P.hdr.link_word_low = (byte)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.owner = H & 0x3f;
+ V = P.hdr.link_word;

@link_word_3_owner_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link << 6 | H & 0x3f;
- P.hdr.link_word_low = (byte)(char)V;
- P.hdr.link_word_high = (byte)(char)(V >> 8);
+ P.hdr.owner = H & 0x3f;
+ V = P.hdr.link_word;

@link_word_3_owner_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word = P.hdr.link_word & 0xffc0;
+ P.hdr.owner = 0x0;

@link_word_3_owner_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0xffc0;
- P.hdr.link_word = (ushort)V;
+ P.hdr.owner = 0x0;
+ V = P.hdr.link_word;

@link_word_3_owner_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0xffc0;
- P.hdr.link_word_low = (byte)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.owner = 0x0;
+ V = P.hdr.link_word;

@link_word_3_owner_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0xffc0;
- P.hdr.link_word_low = (byte)(char)V;
- P.hdr.link_word_high = (byte)(char)(V >> 8);
+ P.hdr.owner = 0x0;
+ V = P.hdr.link_word;

@link_word_3_owner_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word = P.hdr.link_word | 0x3f;
+ P.hdr.owner = 0x3f;

@link_word_3_owner_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word | 0x3f;
- P.hdr.link_word = (ushort)V;
+ P.hdr.owner = 0x3f;
+ V = P.hdr.link_word;

@link_word_3_owner_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word | 0x3f;
- P.hdr.link_word_low = (byte)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.owner = 0x3f;
+ V = P.hdr.link_word;

@link_word_3_owner_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word | 0x3f;
- P.hdr.link_word_low = (byte)(char)V;
- P.hdr.link_word_high = (byte)(char)(V >> 8);
+ P.hdr.owner = 0x3f;
+ V = P.hdr.link_word;

@link_word_3_owner_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word_low = P.hdr.link_word_low & 0xc0 | H & 0x3f;
+ P.hdr.owner = H & 0x3f;

@link_word_3_owner_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word_low = P.hdr.link_word_low & 0xc0;
+ P.hdr.owner = 0;

@link_word_3_owner_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word_low = P.hdr.link_word_low | 0x3f;
+ P.hdr.owner = 0x3f;

@link_word_3_owner_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word_low = (H ^ P.hdr.link_word_low) & 0x3f ^ P.hdr.link_word_low;
+ P.hdr.owner = H & 0x3f;

@link_word_3_owner_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word_low = (P.hdr.link_word_low ^ H) & 0x3f ^ P.hdr.link_word_low;
+ P.hdr.owner = H & 0x3f;

@link_word_3_link_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word = P.hdr.link_word & 0x3f | (H & 0x3ff) << 6;
+ P.hdr.link = H & 0x3ff;

@link_word_3_link_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0x3f | (H & 0x3ff) << 6;
- P.hdr.link_word = (ushort)V;
+ P.hdr.link = H & 0x3ff;
+ V = P.hdr.link_word;

@link_word_3_link_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0x3f | (H & 0x3ff) << 6;
- P.hdr.link_word_low = (byte)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.link = H & 0x3ff;
+ V = P.hdr.link_word;

@link_word_3_link_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0x3f | (H & 0x3ff) << 6;
- P.hdr.link_word_low = (byte)(char)V;
- P.hdr.link_word_high = (byte)(char)(V >> 8);
+ P.hdr.link = H & 0x3ff;
+ V = P.hdr.link_word;

@link_word_3_link_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word = P.hdr.owner | (H & 0x3ff) << 6;
+ P.hdr.link = H & 0x3ff;

@link_word_3_link_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.owner | (H & 0x3ff) << 6;
- P.hdr.link_word = (ushort)V;
+ P.hdr.link = H & 0x3ff;
+ V = P.hdr.link_word;

@link_word_3_link_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.owner | (H & 0x3ff) << 6;
- P.hdr.link_word_low = (byte)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.link = H & 0x3ff;
+ V = P.hdr.link_word;

@link_word_3_link_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.owner | (H & 0x3ff) << 6;
- P.hdr.link_word_low = (byte)(char)V;
- P.hdr.link_word_high = (byte)(char)(V >> 8);
+ P.hdr.link = H & 0x3ff;
+ V = P.hdr.link_word;

@link_word_3_link_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word = P.hdr.link_word & 0x3f;
+ P.hdr.link = 0x0;

@link_word_3_link_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0x3f;
- P.hdr.link_word = (ushort)V;
+ P.hdr.link = 0x0;
+ V = P.hdr.link_word;

@link_word_3_link_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0x3f;
- P.hdr.link_word_low = (byte)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.link = 0x0;
+ V = P.hdr.link_word;

@link_word_3_link_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word & 0x3f;
- P.hdr.link_word_low = (byte)(char)V;
- P.hdr.link_word_high = (byte)(char)(V >> 8);
+ P.hdr.link = 0x0;
+ V = P.hdr.link_word;

@link_word_3_link_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.hdr.link_word = P.hdr.link_word | 0xffc0;
+ P.hdr.link = 0x3ff;

@link_word_3_link_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word | 0xffc0;
- P.hdr.link_word = (ushort)V;
+ P.hdr.link = 0x3ff;
+ V = P.hdr.link_word;

@link_word_3_link_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word | 0xffc0;
- P.hdr.link_word_low = (byte)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.link = 0x3ff;
+ V = P.hdr.link_word;

@link_word_3_link_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.hdr.link_word | 0xffc0;
- P.hdr.link_word_low = (byte)(char)V;
- P.hdr.link_word_high = (byte)(char)(V >> 8);
+ P.hdr.link = 0x3ff;
+ V = P.hdr.link_word;

@link_word_4_owner_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)P)->link_word & 0xffc0 | H & 0x3f;
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;

@link_word_4_owner_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0xffc0 | H & 0x3f;
- ((uw_object_hdr_t *)P)->link_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0xffc0 | H & 0x3f;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0xffc0 | H & 0x3f;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)P)->link << 6 | H & 0x3f;
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;

@link_word_4_owner_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link << 6 | H & 0x3f;
- ((uw_object_hdr_t *)P)->link_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link << 6 | H & 0x3f;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link << 6 | H & 0x3f;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)P)->link_word & 0xffc0;
+ ((uw_object_hdr_t *)P)->owner = 0x0;

@link_word_4_owner_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0xffc0;
- ((uw_object_hdr_t *)P)->link_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->owner = 0x0;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0xffc0;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->owner = 0x0;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0xffc0;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->owner = 0x0;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)P)->link_word | 0x3f;
+ ((uw_object_hdr_t *)P)->owner = 0x3f;

@link_word_4_owner_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word | 0x3f;
- ((uw_object_hdr_t *)P)->link_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->owner = 0x3f;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word | 0x3f;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->owner = 0x3f;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word | 0x3f;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->owner = 0x3f;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_owner_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word_low = ((uw_object_hdr_t *)P)->link_word_low & 0xc0 | H & 0x3f;
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;

@link_word_4_owner_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word_low = ((uw_object_hdr_t *)P)->link_word_low & 0xc0;
+ ((uw_object_hdr_t *)P)->owner = 0;

@link_word_4_owner_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word_low = ((uw_object_hdr_t *)P)->link_word_low | 0x3f;
+ ((uw_object_hdr_t *)P)->owner = 0x3f;

@link_word_4_owner_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word_low = (H ^ ((uw_object_hdr_t *)P)->link_word_low) & 0x3f ^ ((uw_object_hdr_t *)P)->link_word_low;
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;

@link_word_4_owner_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word_low = (((uw_object_hdr_t *)P)->link_word_low ^ H) & 0x3f ^ ((uw_object_hdr_t *)P)->link_word_low;
+ ((uw_object_hdr_t *)P)->owner = H & 0x3f;

@link_word_4_link_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)P)->link_word & 0x3f | (H & 0x3ff) << 6;
+ ((uw_object_hdr_t *)P)->link = H & 0x3ff;

@link_word_4_link_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->link_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->link = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->link = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->link = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)P)->owner | (H & 0x3ff) << 6;
+ ((uw_object_hdr_t *)P)->link = H & 0x3ff;

@link_word_4_link_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->owner | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->link_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->link = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->owner | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->link = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->owner | (H & 0x3ff) << 6;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->link = H & 0x3ff;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)P)->link_word & 0x3f;
+ ((uw_object_hdr_t *)P)->link = 0x0;

@link_word_4_link_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0x3f;
- ((uw_object_hdr_t *)P)->link_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->link = 0x0;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0x3f;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->link = 0x0;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word & 0x3f;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->link = 0x0;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_object_hdr_t *)P)->link_word = ((uw_object_hdr_t *)P)->link_word | 0xffc0;
+ ((uw_object_hdr_t *)P)->link = 0x3ff;

@link_word_4_link_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word | 0xffc0;
- ((uw_object_hdr_t *)P)->link_word = (ushort)V;
+ ((uw_object_hdr_t *)P)->link = 0x3ff;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word | 0xffc0;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->link = 0x3ff;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_4_link_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_object_hdr_t *)P)->link_word | 0xffc0;
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->link = 0x3ff;
+ V = ((uw_object_hdr_t *)P)->link_word;

@link_word_5_owner_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)P)->hdr.link_word & 0xffc0 | H & 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;

@link_word_5_owner_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0xffc0 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0xffc0 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0xffc0 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)P)->hdr.link << 6 | H & 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;

@link_word_5_owner_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link << 6 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link << 6 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link << 6 | H & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)P)->hdr.link_word & 0xffc0;
+ ((uw_mobile_object_t *)P)->hdr.owner = 0x0;

@link_word_5_owner_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.owner = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.owner = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.owner = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)P)->hdr.link_word | 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.owner = 0x3f;

@link_word_5_owner_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word | 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.owner = 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word | 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.owner = 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word | 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.owner = 0x3f;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_owner_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word_low = ((uw_mobile_object_t *)P)->hdr.link_word_low & 0xc0 | H & 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;

@link_word_5_owner_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word_low = ((uw_mobile_object_t *)P)->hdr.link_word_low & 0xc0;
+ ((uw_mobile_object_t *)P)->hdr.owner = 0;

@link_word_5_owner_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word_low = ((uw_mobile_object_t *)P)->hdr.link_word_low | 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.owner = 0x3f;

@link_word_5_owner_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (H ^ ((uw_mobile_object_t *)P)->hdr.link_word_low) & 0x3f ^ ((uw_mobile_object_t *)P)->hdr.link_word_low;
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;

@link_word_5_owner_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (((uw_mobile_object_t *)P)->hdr.link_word_low ^ H) & 0x3f ^ ((uw_mobile_object_t *)P)->hdr.link_word_low;
+ ((uw_mobile_object_t *)P)->hdr.owner = H & 0x3f;

@link_word_5_link_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)P)->hdr.link_word & 0x3f | (H & 0x3ff) << 6;
+ ((uw_mobile_object_t *)P)->hdr.link = H & 0x3ff;

@link_word_5_link_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.link = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0x3f | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_direct_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)P)->hdr.owner | (H & 0x3ff) << 6;
+ ((uw_mobile_object_t *)P)->hdr.link = H & 0x3ff;

@link_word_5_link_temporary_1_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.owner | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.link = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_temporary_1_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.owner | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_temporary_1_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.owner | (H & 0x3ff) << 6;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link = H & 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)P)->hdr.link_word & 0x3f;
+ ((uw_mobile_object_t *)P)->hdr.link = 0x0;

@link_word_5_link_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.link = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word & 0x3f;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link = 0x0;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->hdr.link_word = ((uw_mobile_object_t *)P)->hdr.link_word | 0xffc0;
+ ((uw_mobile_object_t *)P)->hdr.link = 0x3ff;

@link_word_5_link_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word | 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->hdr.link = 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word | 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link = 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@link_word_5_link_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->hdr.link_word | 0xffc0;
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link = 0x3ff;
+ V = ((uw_mobile_object_t *)P)->hdr.link_word;

@goal_word_0_npc_goal_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word = P->goal_word & 0xfff0 | H & 0xf;
+ P->npc_goal = H & 0xf;

@goal_word_0_npc_goal_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff0 | H & 0xf;
- P->goal_word = (ushort)V;
+ P->npc_goal = H & 0xf;
+ V = P->goal_word;

@goal_word_0_npc_goal_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff0 | H & 0xf;
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->npc_goal = H & 0xf;
+ V = P->goal_word;

@goal_word_0_npc_goal_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff0 | H & 0xf;
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->npc_goal = H & 0xf;
+ V = P->goal_word;

@goal_word_0_npc_goal_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word = P->goal_word & 0xfff0;
+ P->npc_goal = 0x0;

@goal_word_0_npc_goal_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff0;
- P->goal_word = (ushort)V;
+ P->npc_goal = 0x0;
+ V = P->goal_word;

@goal_word_0_npc_goal_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff0;
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->npc_goal = 0x0;
+ V = P->goal_word;

@goal_word_0_npc_goal_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff0;
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->npc_goal = 0x0;
+ V = P->goal_word;

@goal_word_0_npc_goal_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word = P->goal_word | 0xf;
+ P->npc_goal = 0xf;

@goal_word_0_npc_goal_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word | 0xf;
- P->goal_word = (ushort)V;
+ P->npc_goal = 0xf;
+ V = P->goal_word;

@goal_word_0_npc_goal_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word | 0xf;
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->npc_goal = 0xf;
+ V = P->goal_word;

@goal_word_0_npc_goal_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word | 0xf;
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->npc_goal = 0xf;
+ V = P->goal_word;

@goal_word_0_npc_goal_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word_low = P->goal_word_low & 0xf0 | H & 0xf;
+ P->npc_goal = H & 0xf;

@goal_word_0_npc_goal_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word_low = P->goal_word_low & 0xf0;
+ P->npc_goal = 0;

@goal_word_0_npc_goal_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word_low = P->goal_word_low | 0xf;
+ P->npc_goal = 0xf;

@goal_word_0_npc_goal_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word_low = (H ^ P->goal_word_low) & 0xf ^ P->goal_word_low;
+ P->npc_goal = H & 0xf;

@goal_word_0_npc_goal_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word_low = (P->goal_word_low ^ H) & 0xf ^ P->goal_word_low;
+ P->npc_goal = H & 0xf;

@goal_word_0_npc_gtarg_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word = P->goal_word & 0xf00f | (H & 0xff) << 4;
+ P->npc_gtarg = H & 0xff;

@goal_word_0_npc_gtarg_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xf00f | (H & 0xff) << 4;
- P->goal_word = (ushort)V;
+ P->npc_gtarg = H & 0xff;
+ V = P->goal_word;

@goal_word_0_npc_gtarg_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xf00f | (H & 0xff) << 4;
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->npc_gtarg = H & 0xff;
+ V = P->goal_word;

@goal_word_0_npc_gtarg_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xf00f | (H & 0xff) << 4;
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->npc_gtarg = H & 0xff;
+ V = P->goal_word;

@goal_word_0_npc_gtarg_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word = P->goal_word & 0xf00f;
+ P->npc_gtarg = 0x0;

@goal_word_0_npc_gtarg_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xf00f;
- P->goal_word = (ushort)V;
+ P->npc_gtarg = 0x0;
+ V = P->goal_word;

@goal_word_0_npc_gtarg_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xf00f;
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->npc_gtarg = 0x0;
+ V = P->goal_word;

@goal_word_0_npc_gtarg_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xf00f;
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->npc_gtarg = 0x0;
+ V = P->goal_word;

@goal_word_0_npc_gtarg_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word = P->goal_word | 0xff0;
+ P->npc_gtarg = 0xff;

@goal_word_0_npc_gtarg_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word | 0xff0;
- P->goal_word = (ushort)V;
+ P->npc_gtarg = 0xff;
+ V = P->goal_word;

@goal_word_0_npc_gtarg_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word | 0xff0;
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->npc_gtarg = 0xff;
+ V = P->goal_word;

@goal_word_0_npc_gtarg_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word | 0xff0;
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->npc_gtarg = 0xff;
+ V = P->goal_word;

@goal_word_0_npc_animation_frame_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word = P->goal_word & 0xfff | (H & 0xf) << 12;
+ P->npc_animation_frame = H & 0xf;

@goal_word_0_npc_animation_frame_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff | (H & 0xf) << 12;
- P->goal_word = (ushort)V;
+ P->npc_animation_frame = H & 0xf;
+ V = P->goal_word;

@goal_word_0_npc_animation_frame_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff | (H & 0xf) << 12;
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->npc_animation_frame = H & 0xf;
+ V = P->goal_word;

@goal_word_0_npc_animation_frame_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff | (H & 0xf) << 12;
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->npc_animation_frame = H & 0xf;
+ V = P->goal_word;

@goal_word_0_npc_animation_frame_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word = P->goal_word & 0xfff;
+ P->npc_animation_frame = 0x0;

@goal_word_0_npc_animation_frame_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff;
- P->goal_word = (ushort)V;
+ P->npc_animation_frame = 0x0;
+ V = P->goal_word;

@goal_word_0_npc_animation_frame_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff;
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->npc_animation_frame = 0x0;
+ V = P->goal_word;

@goal_word_0_npc_animation_frame_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word & 0xfff;
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->npc_animation_frame = 0x0;
+ V = P->goal_word;

@goal_word_0_npc_animation_frame_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word = P->goal_word | 0xf000;
+ P->npc_animation_frame = 0xf;

@goal_word_0_npc_animation_frame_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word | 0xf000;
- P->goal_word = (ushort)V;
+ P->npc_animation_frame = 0xf;
+ V = P->goal_word;

@goal_word_0_npc_animation_frame_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word | 0xf000;
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->npc_animation_frame = 0xf;
+ V = P->goal_word;

@goal_word_0_npc_animation_frame_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->goal_word | 0xf000;
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->npc_animation_frame = 0xf;
+ V = P->goal_word;

@goal_word_0_npc_animation_frame_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word_high = P->goal_word_high & 0xf | (H & 0xf) << 4;
+ P->npc_animation_frame = H & 0xf;

@goal_word_0_npc_animation_frame_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word_high = P->goal_word_high & 0xf;
+ P->npc_animation_frame = 0;

@goal_word_0_npc_animation_frame_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word_high = P->goal_word_high | 0xf0;
+ P->npc_animation_frame = 0xf;

@goal_word_0_npc_animation_frame_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word_high = (H ^ P->goal_word_high) & 0xf0 ^ P->goal_word_high;
+ P->npc_animation_frame = (H >> 4) & 0xf;

@goal_word_0_npc_animation_frame_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->goal_word_high = (P->goal_word_high ^ H) & 0xf0 ^ P->goal_word_high;
+ P->npc_animation_frame = (H >> 4) & 0xf;

@goal_word_1_npc_goal_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word = P.goal_word & 0xfff0 | H & 0xf;
+ P.npc_goal = H & 0xf;

@goal_word_1_npc_goal_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff0 | H & 0xf;
- P.goal_word = (ushort)V;
+ P.npc_goal = H & 0xf;
+ V = P.goal_word;

@goal_word_1_npc_goal_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff0 | H & 0xf;
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.npc_goal = H & 0xf;
+ V = P.goal_word;

@goal_word_1_npc_goal_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff0 | H & 0xf;
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.npc_goal = H & 0xf;
+ V = P.goal_word;

@goal_word_1_npc_goal_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word = P.goal_word & 0xfff0;
+ P.npc_goal = 0x0;

@goal_word_1_npc_goal_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff0;
- P.goal_word = (ushort)V;
+ P.npc_goal = 0x0;
+ V = P.goal_word;

@goal_word_1_npc_goal_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff0;
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.npc_goal = 0x0;
+ V = P.goal_word;

@goal_word_1_npc_goal_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff0;
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.npc_goal = 0x0;
+ V = P.goal_word;

@goal_word_1_npc_goal_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word = P.goal_word | 0xf;
+ P.npc_goal = 0xf;

@goal_word_1_npc_goal_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word | 0xf;
- P.goal_word = (ushort)V;
+ P.npc_goal = 0xf;
+ V = P.goal_word;

@goal_word_1_npc_goal_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word | 0xf;
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.npc_goal = 0xf;
+ V = P.goal_word;

@goal_word_1_npc_goal_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word | 0xf;
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.npc_goal = 0xf;
+ V = P.goal_word;

@goal_word_1_npc_goal_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word_low = P.goal_word_low & 0xf0 | H & 0xf;
+ P.npc_goal = H & 0xf;

@goal_word_1_npc_goal_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word_low = P.goal_word_low & 0xf0;
+ P.npc_goal = 0;

@goal_word_1_npc_goal_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word_low = P.goal_word_low | 0xf;
+ P.npc_goal = 0xf;

@goal_word_1_npc_goal_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word_low = (H ^ P.goal_word_low) & 0xf ^ P.goal_word_low;
+ P.npc_goal = H & 0xf;

@goal_word_1_npc_goal_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word_low = (P.goal_word_low ^ H) & 0xf ^ P.goal_word_low;
+ P.npc_goal = H & 0xf;

@goal_word_1_npc_gtarg_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word = P.goal_word & 0xf00f | (H & 0xff) << 4;
+ P.npc_gtarg = H & 0xff;

@goal_word_1_npc_gtarg_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xf00f | (H & 0xff) << 4;
- P.goal_word = (ushort)V;
+ P.npc_gtarg = H & 0xff;
+ V = P.goal_word;

@goal_word_1_npc_gtarg_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xf00f | (H & 0xff) << 4;
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.npc_gtarg = H & 0xff;
+ V = P.goal_word;

@goal_word_1_npc_gtarg_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xf00f | (H & 0xff) << 4;
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.npc_gtarg = H & 0xff;
+ V = P.goal_word;

@goal_word_1_npc_gtarg_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word = P.goal_word & 0xf00f;
+ P.npc_gtarg = 0x0;

@goal_word_1_npc_gtarg_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xf00f;
- P.goal_word = (ushort)V;
+ P.npc_gtarg = 0x0;
+ V = P.goal_word;

@goal_word_1_npc_gtarg_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xf00f;
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.npc_gtarg = 0x0;
+ V = P.goal_word;

@goal_word_1_npc_gtarg_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xf00f;
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.npc_gtarg = 0x0;
+ V = P.goal_word;

@goal_word_1_npc_gtarg_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word = P.goal_word | 0xff0;
+ P.npc_gtarg = 0xff;

@goal_word_1_npc_gtarg_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word | 0xff0;
- P.goal_word = (ushort)V;
+ P.npc_gtarg = 0xff;
+ V = P.goal_word;

@goal_word_1_npc_gtarg_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word | 0xff0;
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.npc_gtarg = 0xff;
+ V = P.goal_word;

@goal_word_1_npc_gtarg_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word | 0xff0;
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.npc_gtarg = 0xff;
+ V = P.goal_word;

@goal_word_1_npc_animation_frame_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word = P.goal_word & 0xfff | (H & 0xf) << 12;
+ P.npc_animation_frame = H & 0xf;

@goal_word_1_npc_animation_frame_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff | (H & 0xf) << 12;
- P.goal_word = (ushort)V;
+ P.npc_animation_frame = H & 0xf;
+ V = P.goal_word;

@goal_word_1_npc_animation_frame_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff | (H & 0xf) << 12;
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.npc_animation_frame = H & 0xf;
+ V = P.goal_word;

@goal_word_1_npc_animation_frame_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff | (H & 0xf) << 12;
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.npc_animation_frame = H & 0xf;
+ V = P.goal_word;

@goal_word_1_npc_animation_frame_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word = P.goal_word & 0xfff;
+ P.npc_animation_frame = 0x0;

@goal_word_1_npc_animation_frame_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff;
- P.goal_word = (ushort)V;
+ P.npc_animation_frame = 0x0;
+ V = P.goal_word;

@goal_word_1_npc_animation_frame_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff;
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.npc_animation_frame = 0x0;
+ V = P.goal_word;

@goal_word_1_npc_animation_frame_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word & 0xfff;
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.npc_animation_frame = 0x0;
+ V = P.goal_word;

@goal_word_1_npc_animation_frame_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word = P.goal_word | 0xf000;
+ P.npc_animation_frame = 0xf;

@goal_word_1_npc_animation_frame_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word | 0xf000;
- P.goal_word = (ushort)V;
+ P.npc_animation_frame = 0xf;
+ V = P.goal_word;

@goal_word_1_npc_animation_frame_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word | 0xf000;
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.npc_animation_frame = 0xf;
+ V = P.goal_word;

@goal_word_1_npc_animation_frame_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.goal_word | 0xf000;
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.npc_animation_frame = 0xf;
+ V = P.goal_word;

@goal_word_1_npc_animation_frame_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word_high = P.goal_word_high & 0xf | (H & 0xf) << 4;
+ P.npc_animation_frame = H & 0xf;

@goal_word_1_npc_animation_frame_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word_high = P.goal_word_high & 0xf;
+ P.npc_animation_frame = 0;

@goal_word_1_npc_animation_frame_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word_high = P.goal_word_high | 0xf0;
+ P.npc_animation_frame = 0xf;

@goal_word_1_npc_animation_frame_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word_high = (H ^ P.goal_word_high) & 0xf0 ^ P.goal_word_high;
+ P.npc_animation_frame = (H >> 4) & 0xf;

@goal_word_1_npc_animation_frame_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.goal_word_high = (P.goal_word_high ^ H) & 0xf0 ^ P.goal_word_high;
+ P.npc_animation_frame = (H >> 4) & 0xf;

@goal_word_2_npc_goal_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)P)->goal_word & 0xfff0 | H & 0xf;
+ ((uw_mobile_object_t *)P)->npc_goal = H & 0xf;

@goal_word_2_npc_goal_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff0 | H & 0xf;
- ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_goal = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_goal_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff0 | H & 0xf;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_goal = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_goal_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff0 | H & 0xf;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_goal = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_goal_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)P)->goal_word & 0xfff0;
+ ((uw_mobile_object_t *)P)->npc_goal = 0x0;

@goal_word_2_npc_goal_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff0;
- ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_goal = 0x0;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_goal_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff0;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_goal = 0x0;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_goal_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff0;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_goal = 0x0;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_goal_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)P)->goal_word | 0xf;
+ ((uw_mobile_object_t *)P)->npc_goal = 0xf;

@goal_word_2_npc_goal_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word | 0xf;
- ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_goal = 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_goal_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word | 0xf;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_goal = 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_goal_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word | 0xf;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_goal = 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_goal_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word_low = ((uw_mobile_object_t *)P)->goal_word_low & 0xf0 | H & 0xf;
+ ((uw_mobile_object_t *)P)->npc_goal = H & 0xf;

@goal_word_2_npc_goal_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word_low = ((uw_mobile_object_t *)P)->goal_word_low & 0xf0;
+ ((uw_mobile_object_t *)P)->npc_goal = 0;

@goal_word_2_npc_goal_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word_low = ((uw_mobile_object_t *)P)->goal_word_low | 0xf;
+ ((uw_mobile_object_t *)P)->npc_goal = 0xf;

@goal_word_2_npc_goal_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word_low = (H ^ ((uw_mobile_object_t *)P)->goal_word_low) & 0xf ^ ((uw_mobile_object_t *)P)->goal_word_low;
+ ((uw_mobile_object_t *)P)->npc_goal = H & 0xf;

@goal_word_2_npc_goal_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word_low = (((uw_mobile_object_t *)P)->goal_word_low ^ H) & 0xf ^ ((uw_mobile_object_t *)P)->goal_word_low;
+ ((uw_mobile_object_t *)P)->npc_goal = H & 0xf;

@goal_word_2_npc_gtarg_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)P)->goal_word & 0xf00f | (H & 0xff) << 4;
+ ((uw_mobile_object_t *)P)->npc_gtarg = H & 0xff;

@goal_word_2_npc_gtarg_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xf00f | (H & 0xff) << 4;
- ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_gtarg = H & 0xff;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_gtarg_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xf00f | (H & 0xff) << 4;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_gtarg = H & 0xff;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_gtarg_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xf00f | (H & 0xff) << 4;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_gtarg = H & 0xff;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_gtarg_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)P)->goal_word & 0xf00f;
+ ((uw_mobile_object_t *)P)->npc_gtarg = 0x0;

@goal_word_2_npc_gtarg_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xf00f;
- ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_gtarg = 0x0;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_gtarg_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xf00f;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_gtarg = 0x0;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_gtarg_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xf00f;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_gtarg = 0x0;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_gtarg_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)P)->goal_word | 0xff0;
+ ((uw_mobile_object_t *)P)->npc_gtarg = 0xff;

@goal_word_2_npc_gtarg_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word | 0xff0;
- ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_gtarg = 0xff;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_gtarg_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word | 0xff0;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_gtarg = 0xff;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_gtarg_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word | 0xff0;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_gtarg = 0xff;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_animation_frame_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)P)->goal_word & 0xfff | (H & 0xf) << 12;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = H & 0xf;

@goal_word_2_npc_animation_frame_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff | (H & 0xf) << 12;
- ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_animation_frame_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff | (H & 0xf) << 12;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_animation_frame = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_animation_frame_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff | (H & 0xf) << 12;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_animation_frame = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_animation_frame_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)P)->goal_word & 0xfff;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = 0x0;

@goal_word_2_npc_animation_frame_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff;
- ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = 0x0;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_animation_frame_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_animation_frame = 0x0;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_animation_frame_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word & 0xfff;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_animation_frame = 0x0;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_animation_frame_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word = ((uw_mobile_object_t *)P)->goal_word | 0xf000;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = 0xf;

@goal_word_2_npc_animation_frame_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word | 0xf000;
- ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_animation_frame_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word | 0xf000;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_animation_frame = 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_animation_frame_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->goal_word | 0xf000;
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_animation_frame = 0xf;
+ V = ((uw_mobile_object_t *)P)->goal_word;

@goal_word_2_npc_animation_frame_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word_high = ((uw_mobile_object_t *)P)->goal_word_high & 0xf | (H & 0xf) << 4;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = H & 0xf;

@goal_word_2_npc_animation_frame_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word_high = ((uw_mobile_object_t *)P)->goal_word_high & 0xf;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = 0;

@goal_word_2_npc_animation_frame_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word_high = ((uw_mobile_object_t *)P)->goal_word_high | 0xf0;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = 0xf;

@goal_word_2_npc_animation_frame_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word_high = (H ^ ((uw_mobile_object_t *)P)->goal_word_high) & 0xf0 ^ ((uw_mobile_object_t *)P)->goal_word_high;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = (H >> 4) & 0xf;

@goal_word_2_npc_animation_frame_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->goal_word_high = (((uw_mobile_object_t *)P)->goal_word_high ^ H) & 0xf0 ^ ((uw_mobile_object_t *)P)->goal_word_high;
+ ((uw_mobile_object_t *)P)->npc_animation_frame = (H >> 4) & 0xf;

@status_word_0_npc_level_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word = P->status_word & 0xfff0 | H & 0xf;
+ P->npc_level = H & 0xf;

@status_word_0_npc_level_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xfff0 | H & 0xf;
- P->status_word = (ushort)V;
+ P->npc_level = H & 0xf;
+ V = P->status_word;

@status_word_0_npc_level_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xfff0 | H & 0xf;
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(V >> 8);
+ P->npc_level = H & 0xf;
+ V = P->status_word;

@status_word_0_npc_level_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xfff0 | H & 0xf;
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->npc_level = H & 0xf;
+ V = P->status_word;

@status_word_0_npc_level_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word = P->status_word & 0xfff0;
+ P->npc_level = 0x0;

@status_word_0_npc_level_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xfff0;
- P->status_word = (ushort)V;
+ P->npc_level = 0x0;
+ V = P->status_word;

@status_word_0_npc_level_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xfff0;
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(V >> 8);
+ P->npc_level = 0x0;
+ V = P->status_word;

@status_word_0_npc_level_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xfff0;
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->npc_level = 0x0;
+ V = P->status_word;

@status_word_0_npc_level_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word = P->status_word | 0xf;
+ P->npc_level = 0xf;

@status_word_0_npc_level_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word | 0xf;
- P->status_word = (ushort)V;
+ P->npc_level = 0xf;
+ V = P->status_word;

@status_word_0_npc_level_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word | 0xf;
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(V >> 8);
+ P->npc_level = 0xf;
+ V = P->status_word;

@status_word_0_npc_level_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word | 0xf;
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->npc_level = 0xf;
+ V = P->status_word;

@status_word_0_npc_level_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_low = P->status_word_low & 0xf0 | H & 0xf;
+ P->npc_level = H & 0xf;

@status_word_0_npc_level_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_low = P->status_word_low & 0xf0;
+ P->npc_level = 0;

@status_word_0_npc_level_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_low = P->status_word_low | 0xf;
+ P->npc_level = 0xf;

@status_word_0_npc_level_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_low = (H ^ P->status_word_low) & 0xf ^ P->status_word_low;
+ P->npc_level = H & 0xf;

@status_word_0_npc_level_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_low = (P->status_word_low ^ H) & 0xf ^ P->status_word_low;
+ P->npc_level = H & 0xf;

@status_word_0_npc_talkedto_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word = P->status_word & 0xdfff | (H & 0x1) << 13;
+ P->npc_talkedto = H & 0x1;

@status_word_0_npc_talkedto_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xdfff | (H & 0x1) << 13;
- P->status_word = (ushort)V;
+ P->npc_talkedto = H & 0x1;
+ V = P->status_word;

@status_word_0_npc_talkedto_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xdfff | (H & 0x1) << 13;
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(V >> 8);
+ P->npc_talkedto = H & 0x1;
+ V = P->status_word;

@status_word_0_npc_talkedto_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xdfff | (H & 0x1) << 13;
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->npc_talkedto = H & 0x1;
+ V = P->status_word;

@status_word_0_npc_talkedto_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word = P->status_word & 0xdfff;
+ P->npc_talkedto = 0x0;

@status_word_0_npc_talkedto_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xdfff;
- P->status_word = (ushort)V;
+ P->npc_talkedto = 0x0;
+ V = P->status_word;

@status_word_0_npc_talkedto_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xdfff;
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(V >> 8);
+ P->npc_talkedto = 0x0;
+ V = P->status_word;

@status_word_0_npc_talkedto_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0xdfff;
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->npc_talkedto = 0x0;
+ V = P->status_word;

@status_word_0_npc_talkedto_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word = P->status_word | 0x2000;
+ P->npc_talkedto = 0x1;

@status_word_0_npc_talkedto_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word | 0x2000;
- P->status_word = (ushort)V;
+ P->npc_talkedto = 0x1;
+ V = P->status_word;

@status_word_0_npc_talkedto_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word | 0x2000;
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(V >> 8);
+ P->npc_talkedto = 0x1;
+ V = P->status_word;

@status_word_0_npc_talkedto_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word | 0x2000;
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->npc_talkedto = 0x1;
+ V = P->status_word;

@status_word_0_npc_talkedto_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_high = P->status_word_high & 0xdf | (H & 0x1) << 5;
+ P->npc_talkedto = H & 0x1;

@status_word_0_npc_talkedto_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_high = P->status_word_high & 0xdf;
+ P->npc_talkedto = 0;

@status_word_0_npc_talkedto_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_high = P->status_word_high | 0x20;
+ P->npc_talkedto = 0x1;

@status_word_0_npc_talkedto_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_high = (H ^ P->status_word_high) & 0x20 ^ P->status_word_high;
+ P->npc_talkedto = (H >> 5) & 0x1;

@status_word_0_npc_talkedto_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_high = (P->status_word_high ^ H) & 0x20 ^ P->status_word_high;
+ P->npc_talkedto = (H >> 5) & 0x1;

@status_word_0_npc_attitude_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word = P->status_word & 0x3fff | (H & 0x3) << 14;
+ P->npc_attitude = H & 0x3;

@status_word_0_npc_attitude_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0x3fff | (H & 0x3) << 14;
- P->status_word = (ushort)V;
+ P->npc_attitude = H & 0x3;
+ V = P->status_word;

@status_word_0_npc_attitude_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0x3fff | (H & 0x3) << 14;
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(V >> 8);
+ P->npc_attitude = H & 0x3;
+ V = P->status_word;

@status_word_0_npc_attitude_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0x3fff | (H & 0x3) << 14;
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->npc_attitude = H & 0x3;
+ V = P->status_word;

@status_word_0_npc_attitude_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word = P->status_word & 0x3fff;
+ P->npc_attitude = 0x0;

@status_word_0_npc_attitude_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0x3fff;
- P->status_word = (ushort)V;
+ P->npc_attitude = 0x0;
+ V = P->status_word;

@status_word_0_npc_attitude_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0x3fff;
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(V >> 8);
+ P->npc_attitude = 0x0;
+ V = P->status_word;

@status_word_0_npc_attitude_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word & 0x3fff;
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->npc_attitude = 0x0;
+ V = P->status_word;

@status_word_0_npc_attitude_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word = P->status_word | 0xc000;
+ P->npc_attitude = 0x3;

@status_word_0_npc_attitude_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word | 0xc000;
- P->status_word = (ushort)V;
+ P->npc_attitude = 0x3;
+ V = P->status_word;

@status_word_0_npc_attitude_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word | 0xc000;
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(V >> 8);
+ P->npc_attitude = 0x3;
+ V = P->status_word;

@status_word_0_npc_attitude_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->status_word | 0xc000;
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->npc_attitude = 0x3;
+ V = P->status_word;

@status_word_0_npc_attitude_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_high = P->status_word_high & 0x3f | (H & 0x3) << 6;
+ P->npc_attitude = H & 0x3;

@status_word_0_npc_attitude_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_high = P->status_word_high & 0x3f;
+ P->npc_attitude = 0;

@status_word_0_npc_attitude_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_high = P->status_word_high | 0xc0;
+ P->npc_attitude = 0x3;

@status_word_0_npc_attitude_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_high = (H ^ P->status_word_high) & 0xc0 ^ P->status_word_high;
+ P->npc_attitude = (H >> 6) & 0x3;

@status_word_0_npc_attitude_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->status_word_high = (P->status_word_high ^ H) & 0xc0 ^ P->status_word_high;
+ P->npc_attitude = (H >> 6) & 0x3;

@status_word_1_npc_level_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word = P.status_word & 0xfff0 | H & 0xf;
+ P.npc_level = H & 0xf;

@status_word_1_npc_level_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xfff0 | H & 0xf;
- P.status_word = (ushort)V;
+ P.npc_level = H & 0xf;
+ V = P.status_word;

@status_word_1_npc_level_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xfff0 | H & 0xf;
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(V >> 8);
+ P.npc_level = H & 0xf;
+ V = P.status_word;

@status_word_1_npc_level_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xfff0 | H & 0xf;
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.npc_level = H & 0xf;
+ V = P.status_word;

@status_word_1_npc_level_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word = P.status_word & 0xfff0;
+ P.npc_level = 0x0;

@status_word_1_npc_level_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xfff0;
- P.status_word = (ushort)V;
+ P.npc_level = 0x0;
+ V = P.status_word;

@status_word_1_npc_level_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xfff0;
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(V >> 8);
+ P.npc_level = 0x0;
+ V = P.status_word;

@status_word_1_npc_level_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xfff0;
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.npc_level = 0x0;
+ V = P.status_word;

@status_word_1_npc_level_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word = P.status_word | 0xf;
+ P.npc_level = 0xf;

@status_word_1_npc_level_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word | 0xf;
- P.status_word = (ushort)V;
+ P.npc_level = 0xf;
+ V = P.status_word;

@status_word_1_npc_level_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word | 0xf;
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(V >> 8);
+ P.npc_level = 0xf;
+ V = P.status_word;

@status_word_1_npc_level_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word | 0xf;
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.npc_level = 0xf;
+ V = P.status_word;

@status_word_1_npc_level_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_low = P.status_word_low & 0xf0 | H & 0xf;
+ P.npc_level = H & 0xf;

@status_word_1_npc_level_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_low = P.status_word_low & 0xf0;
+ P.npc_level = 0;

@status_word_1_npc_level_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_low = P.status_word_low | 0xf;
+ P.npc_level = 0xf;

@status_word_1_npc_level_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_low = (H ^ P.status_word_low) & 0xf ^ P.status_word_low;
+ P.npc_level = H & 0xf;

@status_word_1_npc_level_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_low = (P.status_word_low ^ H) & 0xf ^ P.status_word_low;
+ P.npc_level = H & 0xf;

@status_word_1_npc_talkedto_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word = P.status_word & 0xdfff | (H & 0x1) << 13;
+ P.npc_talkedto = H & 0x1;

@status_word_1_npc_talkedto_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xdfff | (H & 0x1) << 13;
- P.status_word = (ushort)V;
+ P.npc_talkedto = H & 0x1;
+ V = P.status_word;

@status_word_1_npc_talkedto_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xdfff | (H & 0x1) << 13;
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(V >> 8);
+ P.npc_talkedto = H & 0x1;
+ V = P.status_word;

@status_word_1_npc_talkedto_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xdfff | (H & 0x1) << 13;
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.npc_talkedto = H & 0x1;
+ V = P.status_word;

@status_word_1_npc_talkedto_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word = P.status_word & 0xdfff;
+ P.npc_talkedto = 0x0;

@status_word_1_npc_talkedto_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xdfff;
- P.status_word = (ushort)V;
+ P.npc_talkedto = 0x0;
+ V = P.status_word;

@status_word_1_npc_talkedto_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xdfff;
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(V >> 8);
+ P.npc_talkedto = 0x0;
+ V = P.status_word;

@status_word_1_npc_talkedto_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0xdfff;
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.npc_talkedto = 0x0;
+ V = P.status_word;

@status_word_1_npc_talkedto_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word = P.status_word | 0x2000;
+ P.npc_talkedto = 0x1;

@status_word_1_npc_talkedto_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word | 0x2000;
- P.status_word = (ushort)V;
+ P.npc_talkedto = 0x1;
+ V = P.status_word;

@status_word_1_npc_talkedto_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word | 0x2000;
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(V >> 8);
+ P.npc_talkedto = 0x1;
+ V = P.status_word;

@status_word_1_npc_talkedto_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word | 0x2000;
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.npc_talkedto = 0x1;
+ V = P.status_word;

@status_word_1_npc_talkedto_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_high = P.status_word_high & 0xdf | (H & 0x1) << 5;
+ P.npc_talkedto = H & 0x1;

@status_word_1_npc_talkedto_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_high = P.status_word_high & 0xdf;
+ P.npc_talkedto = 0;

@status_word_1_npc_talkedto_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_high = P.status_word_high | 0x20;
+ P.npc_talkedto = 0x1;

@status_word_1_npc_talkedto_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_high = (H ^ P.status_word_high) & 0x20 ^ P.status_word_high;
+ P.npc_talkedto = (H >> 5) & 0x1;

@status_word_1_npc_talkedto_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_high = (P.status_word_high ^ H) & 0x20 ^ P.status_word_high;
+ P.npc_talkedto = (H >> 5) & 0x1;

@status_word_1_npc_attitude_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word = P.status_word & 0x3fff | (H & 0x3) << 14;
+ P.npc_attitude = H & 0x3;

@status_word_1_npc_attitude_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0x3fff | (H & 0x3) << 14;
- P.status_word = (ushort)V;
+ P.npc_attitude = H & 0x3;
+ V = P.status_word;

@status_word_1_npc_attitude_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0x3fff | (H & 0x3) << 14;
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(V >> 8);
+ P.npc_attitude = H & 0x3;
+ V = P.status_word;

@status_word_1_npc_attitude_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0x3fff | (H & 0x3) << 14;
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.npc_attitude = H & 0x3;
+ V = P.status_word;

@status_word_1_npc_attitude_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word = P.status_word & 0x3fff;
+ P.npc_attitude = 0x0;

@status_word_1_npc_attitude_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0x3fff;
- P.status_word = (ushort)V;
+ P.npc_attitude = 0x0;
+ V = P.status_word;

@status_word_1_npc_attitude_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0x3fff;
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(V >> 8);
+ P.npc_attitude = 0x0;
+ V = P.status_word;

@status_word_1_npc_attitude_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word & 0x3fff;
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.npc_attitude = 0x0;
+ V = P.status_word;

@status_word_1_npc_attitude_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word = P.status_word | 0xc000;
+ P.npc_attitude = 0x3;

@status_word_1_npc_attitude_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word | 0xc000;
- P.status_word = (ushort)V;
+ P.npc_attitude = 0x3;
+ V = P.status_word;

@status_word_1_npc_attitude_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word | 0xc000;
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(V >> 8);
+ P.npc_attitude = 0x3;
+ V = P.status_word;

@status_word_1_npc_attitude_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.status_word | 0xc000;
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.npc_attitude = 0x3;
+ V = P.status_word;

@status_word_1_npc_attitude_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_high = P.status_word_high & 0x3f | (H & 0x3) << 6;
+ P.npc_attitude = H & 0x3;

@status_word_1_npc_attitude_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_high = P.status_word_high & 0x3f;
+ P.npc_attitude = 0;

@status_word_1_npc_attitude_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_high = P.status_word_high | 0xc0;
+ P.npc_attitude = 0x3;

@status_word_1_npc_attitude_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_high = (H ^ P.status_word_high) & 0xc0 ^ P.status_word_high;
+ P.npc_attitude = (H >> 6) & 0x3;

@status_word_1_npc_attitude_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.status_word_high = (P.status_word_high ^ H) & 0xc0 ^ P.status_word_high;
+ P.npc_attitude = (H >> 6) & 0x3;

@status_word_2_npc_level_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)P)->status_word & 0xfff0 | H & 0xf;
+ ((uw_mobile_object_t *)P)->npc_level = H & 0xf;

@status_word_2_npc_level_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xfff0 | H & 0xf;
- ((uw_mobile_object_t *)P)->status_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_level = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_level_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xfff0 | H & 0xf;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_level = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_level_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xfff0 | H & 0xf;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_level = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_level_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)P)->status_word & 0xfff0;
+ ((uw_mobile_object_t *)P)->npc_level = 0x0;

@status_word_2_npc_level_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xfff0;
- ((uw_mobile_object_t *)P)->status_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_level = 0x0;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_level_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xfff0;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_level = 0x0;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_level_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xfff0;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_level = 0x0;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_level_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)P)->status_word | 0xf;
+ ((uw_mobile_object_t *)P)->npc_level = 0xf;

@status_word_2_npc_level_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word | 0xf;
- ((uw_mobile_object_t *)P)->status_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_level = 0xf;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_level_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word | 0xf;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_level = 0xf;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_level_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word | 0xf;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_level = 0xf;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_level_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_low = ((uw_mobile_object_t *)P)->status_word_low & 0xf0 | H & 0xf;
+ ((uw_mobile_object_t *)P)->npc_level = H & 0xf;

@status_word_2_npc_level_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_low = ((uw_mobile_object_t *)P)->status_word_low & 0xf0;
+ ((uw_mobile_object_t *)P)->npc_level = 0;

@status_word_2_npc_level_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_low = ((uw_mobile_object_t *)P)->status_word_low | 0xf;
+ ((uw_mobile_object_t *)P)->npc_level = 0xf;

@status_word_2_npc_level_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_low = (H ^ ((uw_mobile_object_t *)P)->status_word_low) & 0xf ^ ((uw_mobile_object_t *)P)->status_word_low;
+ ((uw_mobile_object_t *)P)->npc_level = H & 0xf;

@status_word_2_npc_level_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_low = (((uw_mobile_object_t *)P)->status_word_low ^ H) & 0xf ^ ((uw_mobile_object_t *)P)->status_word_low;
+ ((uw_mobile_object_t *)P)->npc_level = H & 0xf;

@status_word_2_npc_talkedto_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)P)->status_word & 0xdfff | (H & 0x1) << 13;
+ ((uw_mobile_object_t *)P)->npc_talkedto = H & 0x1;

@status_word_2_npc_talkedto_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xdfff | (H & 0x1) << 13;
- ((uw_mobile_object_t *)P)->status_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_talkedto = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_talkedto_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xdfff | (H & 0x1) << 13;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_talkedto = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_talkedto_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xdfff | (H & 0x1) << 13;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_talkedto = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_talkedto_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)P)->status_word & 0xdfff;
+ ((uw_mobile_object_t *)P)->npc_talkedto = 0x0;

@status_word_2_npc_talkedto_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xdfff;
- ((uw_mobile_object_t *)P)->status_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_talkedto = 0x0;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_talkedto_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xdfff;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_talkedto = 0x0;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_talkedto_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0xdfff;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_talkedto = 0x0;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_talkedto_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)P)->status_word | 0x2000;
+ ((uw_mobile_object_t *)P)->npc_talkedto = 0x1;

@status_word_2_npc_talkedto_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word | 0x2000;
- ((uw_mobile_object_t *)P)->status_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_talkedto = 0x1;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_talkedto_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word | 0x2000;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_talkedto = 0x1;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_talkedto_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word | 0x2000;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_talkedto = 0x1;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_talkedto_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_high = ((uw_mobile_object_t *)P)->status_word_high & 0xdf | (H & 0x1) << 5;
+ ((uw_mobile_object_t *)P)->npc_talkedto = H & 0x1;

@status_word_2_npc_talkedto_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_high = ((uw_mobile_object_t *)P)->status_word_high & 0xdf;
+ ((uw_mobile_object_t *)P)->npc_talkedto = 0;

@status_word_2_npc_talkedto_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_high = ((uw_mobile_object_t *)P)->status_word_high | 0x20;
+ ((uw_mobile_object_t *)P)->npc_talkedto = 0x1;

@status_word_2_npc_talkedto_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_high = (H ^ ((uw_mobile_object_t *)P)->status_word_high) & 0x20 ^ ((uw_mobile_object_t *)P)->status_word_high;
+ ((uw_mobile_object_t *)P)->npc_talkedto = (H >> 5) & 0x1;

@status_word_2_npc_talkedto_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_high = (((uw_mobile_object_t *)P)->status_word_high ^ H) & 0x20 ^ ((uw_mobile_object_t *)P)->status_word_high;
+ ((uw_mobile_object_t *)P)->npc_talkedto = (H >> 5) & 0x1;

@status_word_2_npc_attitude_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)P)->status_word & 0x3fff | (H & 0x3) << 14;
+ ((uw_mobile_object_t *)P)->npc_attitude = H & 0x3;

@status_word_2_npc_attitude_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0x3fff | (H & 0x3) << 14;
- ((uw_mobile_object_t *)P)->status_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_attitude = H & 0x3;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_attitude_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0x3fff | (H & 0x3) << 14;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_attitude = H & 0x3;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_attitude_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0x3fff | (H & 0x3) << 14;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_attitude = H & 0x3;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_attitude_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)P)->status_word & 0x3fff;
+ ((uw_mobile_object_t *)P)->npc_attitude = 0x0;

@status_word_2_npc_attitude_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0x3fff;
- ((uw_mobile_object_t *)P)->status_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_attitude = 0x0;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_attitude_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0x3fff;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_attitude = 0x0;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_attitude_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word & 0x3fff;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_attitude = 0x0;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_attitude_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word = ((uw_mobile_object_t *)P)->status_word | 0xc000;
+ ((uw_mobile_object_t *)P)->npc_attitude = 0x3;

@status_word_2_npc_attitude_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word | 0xc000;
- ((uw_mobile_object_t *)P)->status_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_attitude = 0x3;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_attitude_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word | 0xc000;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_attitude = 0x3;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_attitude_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->status_word | 0xc000;
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_attitude = 0x3;
+ V = ((uw_mobile_object_t *)P)->status_word;

@status_word_2_npc_attitude_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_high = ((uw_mobile_object_t *)P)->status_word_high & 0x3f | (H & 0x3) << 6;
+ ((uw_mobile_object_t *)P)->npc_attitude = H & 0x3;

@status_word_2_npc_attitude_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_high = ((uw_mobile_object_t *)P)->status_word_high & 0x3f;
+ ((uw_mobile_object_t *)P)->npc_attitude = 0;

@status_word_2_npc_attitude_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_high = ((uw_mobile_object_t *)P)->status_word_high | 0xc0;
+ ((uw_mobile_object_t *)P)->npc_attitude = 0x3;

@status_word_2_npc_attitude_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_high = (H ^ ((uw_mobile_object_t *)P)->status_word_high) & 0xc0 ^ ((uw_mobile_object_t *)P)->status_word_high;
+ ((uw_mobile_object_t *)P)->npc_attitude = (H >> 6) & 0x3;

@status_word_2_npc_attitude_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->status_word_high = (((uw_mobile_object_t *)P)->status_word_high ^ H) & 0xc0 ^ ((uw_mobile_object_t *)P)->status_word_high;
+ ((uw_mobile_object_t *)P)->npc_attitude = (H >> 6) & 0x3;

@target_word_0_npc_target_tile_x_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word = P->target_word & 0xffc0 | H & 0x3f;
+ P->npc_target_tile_x = H & 0x3f;

@target_word_0_npc_target_tile_x_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xffc0 | H & 0x3f;
- P->target_word = (ushort)V;
+ P->npc_target_tile_x = H & 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_x_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xffc0 | H & 0x3f;
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(V >> 8);
+ P->npc_target_tile_x = H & 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_x_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xffc0 | H & 0x3f;
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->npc_target_tile_x = H & 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_x_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word = P->target_word & 0xffc0;
+ P->npc_target_tile_x = 0x0;

@target_word_0_npc_target_tile_x_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xffc0;
- P->target_word = (ushort)V;
+ P->npc_target_tile_x = 0x0;
+ V = P->target_word;

@target_word_0_npc_target_tile_x_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xffc0;
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(V >> 8);
+ P->npc_target_tile_x = 0x0;
+ V = P->target_word;

@target_word_0_npc_target_tile_x_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xffc0;
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->npc_target_tile_x = 0x0;
+ V = P->target_word;

@target_word_0_npc_target_tile_x_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word = P->target_word | 0x3f;
+ P->npc_target_tile_x = 0x3f;

@target_word_0_npc_target_tile_x_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word | 0x3f;
- P->target_word = (ushort)V;
+ P->npc_target_tile_x = 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_x_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word | 0x3f;
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(V >> 8);
+ P->npc_target_tile_x = 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_x_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word | 0x3f;
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->npc_target_tile_x = 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_x_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word_low = P->target_word_low & 0xc0 | H & 0x3f;
+ P->npc_target_tile_x = H & 0x3f;

@target_word_0_npc_target_tile_x_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word_low = P->target_word_low & 0xc0;
+ P->npc_target_tile_x = 0;

@target_word_0_npc_target_tile_x_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word_low = P->target_word_low | 0x3f;
+ P->npc_target_tile_x = 0x3f;

@target_word_0_npc_target_tile_x_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word_low = (H ^ P->target_word_low) & 0x3f ^ P->target_word_low;
+ P->npc_target_tile_x = H & 0x3f;

@target_word_0_npc_target_tile_x_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word_low = (P->target_word_low ^ H) & 0x3f ^ P->target_word_low;
+ P->npc_target_tile_x = H & 0x3f;

@target_word_0_npc_target_tile_y_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word = P->target_word & 0xf03f | (H & 0x3f) << 6;
+ P->npc_target_tile_y = H & 0x3f;

@target_word_0_npc_target_tile_y_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xf03f | (H & 0x3f) << 6;
- P->target_word = (ushort)V;
+ P->npc_target_tile_y = H & 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_y_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xf03f | (H & 0x3f) << 6;
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(V >> 8);
+ P->npc_target_tile_y = H & 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_y_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xf03f | (H & 0x3f) << 6;
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->npc_target_tile_y = H & 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_y_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word = P->target_word & 0xf03f;
+ P->npc_target_tile_y = 0x0;

@target_word_0_npc_target_tile_y_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xf03f;
- P->target_word = (ushort)V;
+ P->npc_target_tile_y = 0x0;
+ V = P->target_word;

@target_word_0_npc_target_tile_y_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xf03f;
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(V >> 8);
+ P->npc_target_tile_y = 0x0;
+ V = P->target_word;

@target_word_0_npc_target_tile_y_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xf03f;
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->npc_target_tile_y = 0x0;
+ V = P->target_word;

@target_word_0_npc_target_tile_y_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word = P->target_word | 0xfc0;
+ P->npc_target_tile_y = 0x3f;

@target_word_0_npc_target_tile_y_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word | 0xfc0;
- P->target_word = (ushort)V;
+ P->npc_target_tile_y = 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_y_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word | 0xfc0;
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(V >> 8);
+ P->npc_target_tile_y = 0x3f;
+ V = P->target_word;

@target_word_0_npc_target_tile_y_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word | 0xfc0;
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->npc_target_tile_y = 0x3f;
+ V = P->target_word;

@target_word_0_npc_swing_charge_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word = P->target_word & 0xfff | (H & 0xf) << 12;
+ P->npc_swing_charge = H & 0xf;

@target_word_0_npc_swing_charge_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xfff | (H & 0xf) << 12;
- P->target_word = (ushort)V;
+ P->npc_swing_charge = H & 0xf;
+ V = P->target_word;

@target_word_0_npc_swing_charge_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xfff | (H & 0xf) << 12;
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(V >> 8);
+ P->npc_swing_charge = H & 0xf;
+ V = P->target_word;

@target_word_0_npc_swing_charge_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xfff | (H & 0xf) << 12;
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->npc_swing_charge = H & 0xf;
+ V = P->target_word;

@target_word_0_npc_swing_charge_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word = P->target_word & 0xfff;
+ P->npc_swing_charge = 0x0;

@target_word_0_npc_swing_charge_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xfff;
- P->target_word = (ushort)V;
+ P->npc_swing_charge = 0x0;
+ V = P->target_word;

@target_word_0_npc_swing_charge_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xfff;
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(V >> 8);
+ P->npc_swing_charge = 0x0;
+ V = P->target_word;

@target_word_0_npc_swing_charge_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word & 0xfff;
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->npc_swing_charge = 0x0;
+ V = P->target_word;

@target_word_0_npc_swing_charge_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word = P->target_word | 0xf000;
+ P->npc_swing_charge = 0xf;

@target_word_0_npc_swing_charge_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word | 0xf000;
- P->target_word = (ushort)V;
+ P->npc_swing_charge = 0xf;
+ V = P->target_word;

@target_word_0_npc_swing_charge_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word | 0xf000;
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(V >> 8);
+ P->npc_swing_charge = 0xf;
+ V = P->target_word;

@target_word_0_npc_swing_charge_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->target_word | 0xf000;
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->npc_swing_charge = 0xf;
+ V = P->target_word;

@target_word_0_npc_swing_charge_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word_high = P->target_word_high & 0xf | (H & 0xf) << 4;
+ P->npc_swing_charge = H & 0xf;

@target_word_0_npc_swing_charge_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word_high = P->target_word_high & 0xf;
+ P->npc_swing_charge = 0;

@target_word_0_npc_swing_charge_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word_high = P->target_word_high | 0xf0;
+ P->npc_swing_charge = 0xf;

@target_word_0_npc_swing_charge_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word_high = (H ^ P->target_word_high) & 0xf0 ^ P->target_word_high;
+ P->npc_swing_charge = (H >> 4) & 0xf;

@target_word_0_npc_swing_charge_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->target_word_high = (P->target_word_high ^ H) & 0xf0 ^ P->target_word_high;
+ P->npc_swing_charge = (H >> 4) & 0xf;

@target_word_1_npc_target_tile_x_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word = P.target_word & 0xffc0 | H & 0x3f;
+ P.npc_target_tile_x = H & 0x3f;

@target_word_1_npc_target_tile_x_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xffc0 | H & 0x3f;
- P.target_word = (ushort)V;
+ P.npc_target_tile_x = H & 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_x_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xffc0 | H & 0x3f;
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(V >> 8);
+ P.npc_target_tile_x = H & 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_x_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xffc0 | H & 0x3f;
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.npc_target_tile_x = H & 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_x_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word = P.target_word & 0xffc0;
+ P.npc_target_tile_x = 0x0;

@target_word_1_npc_target_tile_x_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xffc0;
- P.target_word = (ushort)V;
+ P.npc_target_tile_x = 0x0;
+ V = P.target_word;

@target_word_1_npc_target_tile_x_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xffc0;
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(V >> 8);
+ P.npc_target_tile_x = 0x0;
+ V = P.target_word;

@target_word_1_npc_target_tile_x_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xffc0;
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.npc_target_tile_x = 0x0;
+ V = P.target_word;

@target_word_1_npc_target_tile_x_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word = P.target_word | 0x3f;
+ P.npc_target_tile_x = 0x3f;

@target_word_1_npc_target_tile_x_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word | 0x3f;
- P.target_word = (ushort)V;
+ P.npc_target_tile_x = 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_x_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word | 0x3f;
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(V >> 8);
+ P.npc_target_tile_x = 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_x_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word | 0x3f;
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.npc_target_tile_x = 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_x_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word_low = P.target_word_low & 0xc0 | H & 0x3f;
+ P.npc_target_tile_x = H & 0x3f;

@target_word_1_npc_target_tile_x_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word_low = P.target_word_low & 0xc0;
+ P.npc_target_tile_x = 0;

@target_word_1_npc_target_tile_x_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word_low = P.target_word_low | 0x3f;
+ P.npc_target_tile_x = 0x3f;

@target_word_1_npc_target_tile_x_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word_low = (H ^ P.target_word_low) & 0x3f ^ P.target_word_low;
+ P.npc_target_tile_x = H & 0x3f;

@target_word_1_npc_target_tile_x_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word_low = (P.target_word_low ^ H) & 0x3f ^ P.target_word_low;
+ P.npc_target_tile_x = H & 0x3f;

@target_word_1_npc_target_tile_y_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word = P.target_word & 0xf03f | (H & 0x3f) << 6;
+ P.npc_target_tile_y = H & 0x3f;

@target_word_1_npc_target_tile_y_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xf03f | (H & 0x3f) << 6;
- P.target_word = (ushort)V;
+ P.npc_target_tile_y = H & 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_y_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xf03f | (H & 0x3f) << 6;
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(V >> 8);
+ P.npc_target_tile_y = H & 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_y_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xf03f | (H & 0x3f) << 6;
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.npc_target_tile_y = H & 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_y_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word = P.target_word & 0xf03f;
+ P.npc_target_tile_y = 0x0;

@target_word_1_npc_target_tile_y_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xf03f;
- P.target_word = (ushort)V;
+ P.npc_target_tile_y = 0x0;
+ V = P.target_word;

@target_word_1_npc_target_tile_y_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xf03f;
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(V >> 8);
+ P.npc_target_tile_y = 0x0;
+ V = P.target_word;

@target_word_1_npc_target_tile_y_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xf03f;
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.npc_target_tile_y = 0x0;
+ V = P.target_word;

@target_word_1_npc_target_tile_y_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word = P.target_word | 0xfc0;
+ P.npc_target_tile_y = 0x3f;

@target_word_1_npc_target_tile_y_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word | 0xfc0;
- P.target_word = (ushort)V;
+ P.npc_target_tile_y = 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_y_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word | 0xfc0;
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(V >> 8);
+ P.npc_target_tile_y = 0x3f;
+ V = P.target_word;

@target_word_1_npc_target_tile_y_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word | 0xfc0;
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.npc_target_tile_y = 0x3f;
+ V = P.target_word;

@target_word_1_npc_swing_charge_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word = P.target_word & 0xfff | (H & 0xf) << 12;
+ P.npc_swing_charge = H & 0xf;

@target_word_1_npc_swing_charge_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xfff | (H & 0xf) << 12;
- P.target_word = (ushort)V;
+ P.npc_swing_charge = H & 0xf;
+ V = P.target_word;

@target_word_1_npc_swing_charge_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xfff | (H & 0xf) << 12;
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(V >> 8);
+ P.npc_swing_charge = H & 0xf;
+ V = P.target_word;

@target_word_1_npc_swing_charge_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xfff | (H & 0xf) << 12;
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.npc_swing_charge = H & 0xf;
+ V = P.target_word;

@target_word_1_npc_swing_charge_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word = P.target_word & 0xfff;
+ P.npc_swing_charge = 0x0;

@target_word_1_npc_swing_charge_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xfff;
- P.target_word = (ushort)V;
+ P.npc_swing_charge = 0x0;
+ V = P.target_word;

@target_word_1_npc_swing_charge_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xfff;
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(V >> 8);
+ P.npc_swing_charge = 0x0;
+ V = P.target_word;

@target_word_1_npc_swing_charge_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word & 0xfff;
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.npc_swing_charge = 0x0;
+ V = P.target_word;

@target_word_1_npc_swing_charge_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word = P.target_word | 0xf000;
+ P.npc_swing_charge = 0xf;

@target_word_1_npc_swing_charge_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word | 0xf000;
- P.target_word = (ushort)V;
+ P.npc_swing_charge = 0xf;
+ V = P.target_word;

@target_word_1_npc_swing_charge_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word | 0xf000;
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(V >> 8);
+ P.npc_swing_charge = 0xf;
+ V = P.target_word;

@target_word_1_npc_swing_charge_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.target_word | 0xf000;
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.npc_swing_charge = 0xf;
+ V = P.target_word;

@target_word_1_npc_swing_charge_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word_high = P.target_word_high & 0xf | (H & 0xf) << 4;
+ P.npc_swing_charge = H & 0xf;

@target_word_1_npc_swing_charge_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word_high = P.target_word_high & 0xf;
+ P.npc_swing_charge = 0;

@target_word_1_npc_swing_charge_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word_high = P.target_word_high | 0xf0;
+ P.npc_swing_charge = 0xf;

@target_word_1_npc_swing_charge_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word_high = (H ^ P.target_word_high) & 0xf0 ^ P.target_word_high;
+ P.npc_swing_charge = (H >> 4) & 0xf;

@target_word_1_npc_swing_charge_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.target_word_high = (P.target_word_high ^ H) & 0xf0 ^ P.target_word_high;
+ P.npc_swing_charge = (H >> 4) & 0xf;

@target_word_2_npc_target_tile_x_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)P)->target_word & 0xffc0 | H & 0x3f;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = H & 0x3f;

@target_word_2_npc_target_tile_x_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xffc0 | H & 0x3f;
- ((uw_mobile_object_t *)P)->target_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_x_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xffc0 | H & 0x3f;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_x_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xffc0 | H & 0x3f;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_x_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)P)->target_word & 0xffc0;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = 0x0;

@target_word_2_npc_target_tile_x_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xffc0;
- ((uw_mobile_object_t *)P)->target_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = 0x0;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_x_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xffc0;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = 0x0;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_x_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xffc0;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = 0x0;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_x_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)P)->target_word | 0x3f;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = 0x3f;

@target_word_2_npc_target_tile_x_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word | 0x3f;
- ((uw_mobile_object_t *)P)->target_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_x_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word | 0x3f;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_x_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word | 0x3f;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_x_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word_low = ((uw_mobile_object_t *)P)->target_word_low & 0xc0 | H & 0x3f;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = H & 0x3f;

@target_word_2_npc_target_tile_x_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word_low = ((uw_mobile_object_t *)P)->target_word_low & 0xc0;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = 0;

@target_word_2_npc_target_tile_x_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word_low = ((uw_mobile_object_t *)P)->target_word_low | 0x3f;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = 0x3f;

@target_word_2_npc_target_tile_x_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word_low = (H ^ ((uw_mobile_object_t *)P)->target_word_low) & 0x3f ^ ((uw_mobile_object_t *)P)->target_word_low;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = H & 0x3f;

@target_word_2_npc_target_tile_x_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word_low = (((uw_mobile_object_t *)P)->target_word_low ^ H) & 0x3f ^ ((uw_mobile_object_t *)P)->target_word_low;
+ ((uw_mobile_object_t *)P)->npc_target_tile_x = H & 0x3f;

@target_word_2_npc_target_tile_y_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)P)->target_word & 0xf03f | (H & 0x3f) << 6;
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = H & 0x3f;

@target_word_2_npc_target_tile_y_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xf03f | (H & 0x3f) << 6;
- ((uw_mobile_object_t *)P)->target_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_y_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xf03f | (H & 0x3f) << 6;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_y_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xf03f | (H & 0x3f) << 6;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_y_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)P)->target_word & 0xf03f;
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = 0x0;

@target_word_2_npc_target_tile_y_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xf03f;
- ((uw_mobile_object_t *)P)->target_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = 0x0;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_y_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xf03f;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = 0x0;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_y_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xf03f;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = 0x0;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_y_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)P)->target_word | 0xfc0;
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = 0x3f;

@target_word_2_npc_target_tile_y_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word | 0xfc0;
- ((uw_mobile_object_t *)P)->target_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_y_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word | 0xfc0;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_target_tile_y_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word | 0xfc0;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_target_tile_y = 0x3f;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_swing_charge_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)P)->target_word & 0xfff | (H & 0xf) << 12;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = H & 0xf;

@target_word_2_npc_swing_charge_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xfff | (H & 0xf) << 12;
- ((uw_mobile_object_t *)P)->target_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_swing_charge_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xfff | (H & 0xf) << 12;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_swing_charge = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_swing_charge_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xfff | (H & 0xf) << 12;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_swing_charge = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_swing_charge_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)P)->target_word & 0xfff;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = 0x0;

@target_word_2_npc_swing_charge_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xfff;
- ((uw_mobile_object_t *)P)->target_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = 0x0;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_swing_charge_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xfff;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_swing_charge = 0x0;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_swing_charge_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word & 0xfff;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_swing_charge = 0x0;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_swing_charge_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word = ((uw_mobile_object_t *)P)->target_word | 0xf000;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = 0xf;

@target_word_2_npc_swing_charge_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word | 0xf000;
- ((uw_mobile_object_t *)P)->target_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = 0xf;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_swing_charge_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word | 0xf000;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_swing_charge = 0xf;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_swing_charge_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->target_word | 0xf000;
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_swing_charge = 0xf;
+ V = ((uw_mobile_object_t *)P)->target_word;

@target_word_2_npc_swing_charge_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word_high = ((uw_mobile_object_t *)P)->target_word_high & 0xf | (H & 0xf) << 4;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = H & 0xf;

@target_word_2_npc_swing_charge_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word_high = ((uw_mobile_object_t *)P)->target_word_high & 0xf;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = 0;

@target_word_2_npc_swing_charge_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word_high = ((uw_mobile_object_t *)P)->target_word_high | 0xf0;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = 0xf;

@target_word_2_npc_swing_charge_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word_high = (H ^ ((uw_mobile_object_t *)P)->target_word_high) & 0xf0 ^ ((uw_mobile_object_t *)P)->target_word_high;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = (H >> 4) & 0xf;

@target_word_2_npc_swing_charge_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->target_word_high = (((uw_mobile_object_t *)P)->target_word_high ^ H) & 0xf0 ^ ((uw_mobile_object_t *)P)->target_word_high;
+ ((uw_mobile_object_t *)P)->npc_swing_charge = (H >> 4) & 0xf;

@tile_word_0_npc_path_slot_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word = P->tile_word & 0xfff0 | H & 0xf;
+ P->npc_path_slot = H & 0xf;

@tile_word_0_npc_path_slot_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfff0 | H & 0xf;
- P->tile_word = (ushort)V;
+ P->npc_path_slot = H & 0xf;
+ V = P->tile_word;

@tile_word_0_npc_path_slot_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfff0 | H & 0xf;
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->npc_path_slot = H & 0xf;
+ V = P->tile_word;

@tile_word_0_npc_path_slot_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfff0 | H & 0xf;
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->npc_path_slot = H & 0xf;
+ V = P->tile_word;

@tile_word_0_npc_path_slot_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word = P->tile_word & 0xfff0;
+ P->npc_path_slot = 0x0;

@tile_word_0_npc_path_slot_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfff0;
- P->tile_word = (ushort)V;
+ P->npc_path_slot = 0x0;
+ V = P->tile_word;

@tile_word_0_npc_path_slot_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfff0;
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->npc_path_slot = 0x0;
+ V = P->tile_word;

@tile_word_0_npc_path_slot_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfff0;
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->npc_path_slot = 0x0;
+ V = P->tile_word;

@tile_word_0_npc_path_slot_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word = P->tile_word | 0xf;
+ P->npc_path_slot = 0xf;

@tile_word_0_npc_path_slot_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word | 0xf;
- P->tile_word = (ushort)V;
+ P->npc_path_slot = 0xf;
+ V = P->tile_word;

@tile_word_0_npc_path_slot_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word | 0xf;
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->npc_path_slot = 0xf;
+ V = P->tile_word;

@tile_word_0_npc_path_slot_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word | 0xf;
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->npc_path_slot = 0xf;
+ V = P->tile_word;

@tile_word_0_npc_path_slot_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word_low = P->tile_word_low & 0xf0 | H & 0xf;
+ P->npc_path_slot = H & 0xf;

@tile_word_0_npc_path_slot_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word_low = P->tile_word_low & 0xf0;
+ P->npc_path_slot = 0;

@tile_word_0_npc_path_slot_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word_low = P->tile_word_low | 0xf;
+ P->npc_path_slot = 0xf;

@tile_word_0_npc_path_slot_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word_low = (H ^ P->tile_word_low) & 0xf ^ P->tile_word_low;
+ P->npc_path_slot = H & 0xf;

@tile_word_0_npc_path_slot_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word_low = (P->tile_word_low ^ H) & 0xf ^ P->tile_word_low;
+ P->npc_path_slot = H & 0xf;

@tile_word_0_npc_yhome_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word = P->tile_word & 0xfc0f | (H & 0x3f) << 4;
+ P->npc_yhome = H & 0x3f;

@tile_word_0_npc_yhome_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfc0f | (H & 0x3f) << 4;
- P->tile_word = (ushort)V;
+ P->npc_yhome = H & 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_yhome_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfc0f | (H & 0x3f) << 4;
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->npc_yhome = H & 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_yhome_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfc0f | (H & 0x3f) << 4;
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->npc_yhome = H & 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_yhome_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word = P->tile_word & 0xfc0f;
+ P->npc_yhome = 0x0;

@tile_word_0_npc_yhome_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfc0f;
- P->tile_word = (ushort)V;
+ P->npc_yhome = 0x0;
+ V = P->tile_word;

@tile_word_0_npc_yhome_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfc0f;
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->npc_yhome = 0x0;
+ V = P->tile_word;

@tile_word_0_npc_yhome_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0xfc0f;
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->npc_yhome = 0x0;
+ V = P->tile_word;

@tile_word_0_npc_yhome_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word = P->tile_word | 0x3f0;
+ P->npc_yhome = 0x3f;

@tile_word_0_npc_yhome_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word | 0x3f0;
- P->tile_word = (ushort)V;
+ P->npc_yhome = 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_yhome_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word | 0x3f0;
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->npc_yhome = 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_yhome_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word | 0x3f0;
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->npc_yhome = 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_xhome_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word = P->tile_word & 0x3ff | (H & 0x3f) << 10;
+ P->npc_xhome = H & 0x3f;

@tile_word_0_npc_xhome_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0x3ff | (H & 0x3f) << 10;
- P->tile_word = (ushort)V;
+ P->npc_xhome = H & 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_xhome_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0x3ff | (H & 0x3f) << 10;
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->npc_xhome = H & 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_xhome_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0x3ff | (H & 0x3f) << 10;
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->npc_xhome = H & 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_xhome_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word = P->tile_word & 0x3ff;
+ P->npc_xhome = 0x0;

@tile_word_0_npc_xhome_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0x3ff;
- P->tile_word = (ushort)V;
+ P->npc_xhome = 0x0;
+ V = P->tile_word;

@tile_word_0_npc_xhome_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0x3ff;
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->npc_xhome = 0x0;
+ V = P->tile_word;

@tile_word_0_npc_xhome_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word & 0x3ff;
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->npc_xhome = 0x0;
+ V = P->tile_word;

@tile_word_0_npc_xhome_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word = P->tile_word | 0xfc00;
+ P->npc_xhome = 0x3f;

@tile_word_0_npc_xhome_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word | 0xfc00;
- P->tile_word = (ushort)V;
+ P->npc_xhome = 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_xhome_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word | 0xfc00;
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->npc_xhome = 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_xhome_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->tile_word | 0xfc00;
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->npc_xhome = 0x3f;
+ V = P->tile_word;

@tile_word_0_npc_xhome_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word_high = P->tile_word_high & 0x3 | (H & 0x3f) << 2;
+ P->npc_xhome = H & 0x3f;

@tile_word_0_npc_xhome_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word_high = P->tile_word_high & 0x3;
+ P->npc_xhome = 0;

@tile_word_0_npc_xhome_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word_high = P->tile_word_high | 0xfc;
+ P->npc_xhome = 0x3f;

@tile_word_0_npc_xhome_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word_high = (H ^ P->tile_word_high) & 0xfc ^ P->tile_word_high;
+ P->npc_xhome = (H >> 2) & 0x3f;

@tile_word_0_npc_xhome_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->tile_word_high = (P->tile_word_high ^ H) & 0xfc ^ P->tile_word_high;
+ P->npc_xhome = (H >> 2) & 0x3f;

@tile_word_1_npc_path_slot_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word = P.tile_word & 0xfff0 | H & 0xf;
+ P.npc_path_slot = H & 0xf;

@tile_word_1_npc_path_slot_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfff0 | H & 0xf;
- P.tile_word = (ushort)V;
+ P.npc_path_slot = H & 0xf;
+ V = P.tile_word;

@tile_word_1_npc_path_slot_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfff0 | H & 0xf;
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.npc_path_slot = H & 0xf;
+ V = P.tile_word;

@tile_word_1_npc_path_slot_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfff0 | H & 0xf;
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.npc_path_slot = H & 0xf;
+ V = P.tile_word;

@tile_word_1_npc_path_slot_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word = P.tile_word & 0xfff0;
+ P.npc_path_slot = 0x0;

@tile_word_1_npc_path_slot_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfff0;
- P.tile_word = (ushort)V;
+ P.npc_path_slot = 0x0;
+ V = P.tile_word;

@tile_word_1_npc_path_slot_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfff0;
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.npc_path_slot = 0x0;
+ V = P.tile_word;

@tile_word_1_npc_path_slot_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfff0;
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.npc_path_slot = 0x0;
+ V = P.tile_word;

@tile_word_1_npc_path_slot_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word = P.tile_word | 0xf;
+ P.npc_path_slot = 0xf;

@tile_word_1_npc_path_slot_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word | 0xf;
- P.tile_word = (ushort)V;
+ P.npc_path_slot = 0xf;
+ V = P.tile_word;

@tile_word_1_npc_path_slot_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word | 0xf;
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.npc_path_slot = 0xf;
+ V = P.tile_word;

@tile_word_1_npc_path_slot_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word | 0xf;
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.npc_path_slot = 0xf;
+ V = P.tile_word;

@tile_word_1_npc_path_slot_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word_low = P.tile_word_low & 0xf0 | H & 0xf;
+ P.npc_path_slot = H & 0xf;

@tile_word_1_npc_path_slot_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word_low = P.tile_word_low & 0xf0;
+ P.npc_path_slot = 0;

@tile_word_1_npc_path_slot_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word_low = P.tile_word_low | 0xf;
+ P.npc_path_slot = 0xf;

@tile_word_1_npc_path_slot_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word_low = (H ^ P.tile_word_low) & 0xf ^ P.tile_word_low;
+ P.npc_path_slot = H & 0xf;

@tile_word_1_npc_path_slot_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word_low = (P.tile_word_low ^ H) & 0xf ^ P.tile_word_low;
+ P.npc_path_slot = H & 0xf;

@tile_word_1_npc_yhome_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word = P.tile_word & 0xfc0f | (H & 0x3f) << 4;
+ P.npc_yhome = H & 0x3f;

@tile_word_1_npc_yhome_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfc0f | (H & 0x3f) << 4;
- P.tile_word = (ushort)V;
+ P.npc_yhome = H & 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_yhome_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfc0f | (H & 0x3f) << 4;
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.npc_yhome = H & 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_yhome_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfc0f | (H & 0x3f) << 4;
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.npc_yhome = H & 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_yhome_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word = P.tile_word & 0xfc0f;
+ P.npc_yhome = 0x0;

@tile_word_1_npc_yhome_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfc0f;
- P.tile_word = (ushort)V;
+ P.npc_yhome = 0x0;
+ V = P.tile_word;

@tile_word_1_npc_yhome_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfc0f;
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.npc_yhome = 0x0;
+ V = P.tile_word;

@tile_word_1_npc_yhome_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0xfc0f;
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.npc_yhome = 0x0;
+ V = P.tile_word;

@tile_word_1_npc_yhome_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word = P.tile_word | 0x3f0;
+ P.npc_yhome = 0x3f;

@tile_word_1_npc_yhome_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word | 0x3f0;
- P.tile_word = (ushort)V;
+ P.npc_yhome = 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_yhome_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word | 0x3f0;
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.npc_yhome = 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_yhome_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word | 0x3f0;
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.npc_yhome = 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_xhome_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word = P.tile_word & 0x3ff | (H & 0x3f) << 10;
+ P.npc_xhome = H & 0x3f;

@tile_word_1_npc_xhome_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0x3ff | (H & 0x3f) << 10;
- P.tile_word = (ushort)V;
+ P.npc_xhome = H & 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_xhome_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0x3ff | (H & 0x3f) << 10;
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.npc_xhome = H & 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_xhome_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0x3ff | (H & 0x3f) << 10;
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.npc_xhome = H & 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_xhome_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word = P.tile_word & 0x3ff;
+ P.npc_xhome = 0x0;

@tile_word_1_npc_xhome_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0x3ff;
- P.tile_word = (ushort)V;
+ P.npc_xhome = 0x0;
+ V = P.tile_word;

@tile_word_1_npc_xhome_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0x3ff;
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.npc_xhome = 0x0;
+ V = P.tile_word;

@tile_word_1_npc_xhome_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word & 0x3ff;
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.npc_xhome = 0x0;
+ V = P.tile_word;

@tile_word_1_npc_xhome_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word = P.tile_word | 0xfc00;
+ P.npc_xhome = 0x3f;

@tile_word_1_npc_xhome_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word | 0xfc00;
- P.tile_word = (ushort)V;
+ P.npc_xhome = 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_xhome_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word | 0xfc00;
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.npc_xhome = 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_xhome_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.tile_word | 0xfc00;
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.npc_xhome = 0x3f;
+ V = P.tile_word;

@tile_word_1_npc_xhome_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word_high = P.tile_word_high & 0x3 | (H & 0x3f) << 2;
+ P.npc_xhome = H & 0x3f;

@tile_word_1_npc_xhome_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word_high = P.tile_word_high & 0x3;
+ P.npc_xhome = 0;

@tile_word_1_npc_xhome_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word_high = P.tile_word_high | 0xfc;
+ P.npc_xhome = 0x3f;

@tile_word_1_npc_xhome_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word_high = (H ^ P.tile_word_high) & 0xfc ^ P.tile_word_high;
+ P.npc_xhome = (H >> 2) & 0x3f;

@tile_word_1_npc_xhome_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.tile_word_high = (P.tile_word_high ^ H) & 0xfc ^ P.tile_word_high;
+ P.npc_xhome = (H >> 2) & 0x3f;

@tile_word_2_npc_path_slot_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)P)->tile_word & 0xfff0 | H & 0xf;
+ ((uw_mobile_object_t *)P)->npc_path_slot = H & 0xf;

@tile_word_2_npc_path_slot_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfff0 | H & 0xf;
- ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_path_slot = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_path_slot_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfff0 | H & 0xf;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_path_slot = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_path_slot_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfff0 | H & 0xf;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_path_slot = H & 0xf;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_path_slot_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)P)->tile_word & 0xfff0;
+ ((uw_mobile_object_t *)P)->npc_path_slot = 0x0;

@tile_word_2_npc_path_slot_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfff0;
- ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_path_slot = 0x0;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_path_slot_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfff0;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_path_slot = 0x0;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_path_slot_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfff0;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_path_slot = 0x0;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_path_slot_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)P)->tile_word | 0xf;
+ ((uw_mobile_object_t *)P)->npc_path_slot = 0xf;

@tile_word_2_npc_path_slot_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word | 0xf;
- ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_path_slot = 0xf;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_path_slot_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word | 0xf;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_path_slot = 0xf;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_path_slot_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word | 0xf;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_path_slot = 0xf;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_path_slot_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word_low = ((uw_mobile_object_t *)P)->tile_word_low & 0xf0 | H & 0xf;
+ ((uw_mobile_object_t *)P)->npc_path_slot = H & 0xf;

@tile_word_2_npc_path_slot_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word_low = ((uw_mobile_object_t *)P)->tile_word_low & 0xf0;
+ ((uw_mobile_object_t *)P)->npc_path_slot = 0;

@tile_word_2_npc_path_slot_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word_low = ((uw_mobile_object_t *)P)->tile_word_low | 0xf;
+ ((uw_mobile_object_t *)P)->npc_path_slot = 0xf;

@tile_word_2_npc_path_slot_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word_low = (H ^ ((uw_mobile_object_t *)P)->tile_word_low) & 0xf ^ ((uw_mobile_object_t *)P)->tile_word_low;
+ ((uw_mobile_object_t *)P)->npc_path_slot = H & 0xf;

@tile_word_2_npc_path_slot_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word_low = (((uw_mobile_object_t *)P)->tile_word_low ^ H) & 0xf ^ ((uw_mobile_object_t *)P)->tile_word_low;
+ ((uw_mobile_object_t *)P)->npc_path_slot = H & 0xf;

@tile_word_2_npc_yhome_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)P)->tile_word & 0xfc0f | (H & 0x3f) << 4;
+ ((uw_mobile_object_t *)P)->npc_yhome = H & 0x3f;

@tile_word_2_npc_yhome_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfc0f | (H & 0x3f) << 4;
- ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_yhome = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_yhome_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfc0f | (H & 0x3f) << 4;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_yhome = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_yhome_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfc0f | (H & 0x3f) << 4;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_yhome = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_yhome_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)P)->tile_word & 0xfc0f;
+ ((uw_mobile_object_t *)P)->npc_yhome = 0x0;

@tile_word_2_npc_yhome_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfc0f;
- ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_yhome = 0x0;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_yhome_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfc0f;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_yhome = 0x0;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_yhome_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0xfc0f;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_yhome = 0x0;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_yhome_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)P)->tile_word | 0x3f0;
+ ((uw_mobile_object_t *)P)->npc_yhome = 0x3f;

@tile_word_2_npc_yhome_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word | 0x3f0;
- ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_yhome = 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_yhome_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word | 0x3f0;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_yhome = 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_yhome_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word | 0x3f0;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_yhome = 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_xhome_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)P)->tile_word & 0x3ff | (H & 0x3f) << 10;
+ ((uw_mobile_object_t *)P)->npc_xhome = H & 0x3f;

@tile_word_2_npc_xhome_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0x3ff | (H & 0x3f) << 10;
- ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_xhome = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_xhome_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0x3ff | (H & 0x3f) << 10;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_xhome = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_xhome_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0x3ff | (H & 0x3f) << 10;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_xhome = H & 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_xhome_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)P)->tile_word & 0x3ff;
+ ((uw_mobile_object_t *)P)->npc_xhome = 0x0;

@tile_word_2_npc_xhome_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0x3ff;
- ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_xhome = 0x0;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_xhome_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0x3ff;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_xhome = 0x0;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_xhome_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word & 0x3ff;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_xhome = 0x0;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_xhome_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word = ((uw_mobile_object_t *)P)->tile_word | 0xfc00;
+ ((uw_mobile_object_t *)P)->npc_xhome = 0x3f;

@tile_word_2_npc_xhome_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word | 0xfc00;
- ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
+ ((uw_mobile_object_t *)P)->npc_xhome = 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_xhome_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word | 0xfc00;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_xhome = 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_xhome_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->tile_word | 0xfc00;
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->npc_xhome = 0x3f;
+ V = ((uw_mobile_object_t *)P)->tile_word;

@tile_word_2_npc_xhome_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word_high = ((uw_mobile_object_t *)P)->tile_word_high & 0x3 | (H & 0x3f) << 2;
+ ((uw_mobile_object_t *)P)->npc_xhome = H & 0x3f;

@tile_word_2_npc_xhome_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word_high = ((uw_mobile_object_t *)P)->tile_word_high & 0x3;
+ ((uw_mobile_object_t *)P)->npc_xhome = 0;

@tile_word_2_npc_xhome_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word_high = ((uw_mobile_object_t *)P)->tile_word_high | 0xfc;
+ ((uw_mobile_object_t *)P)->npc_xhome = 0x3f;

@tile_word_2_npc_xhome_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word_high = (H ^ ((uw_mobile_object_t *)P)->tile_word_high) & 0xfc ^ ((uw_mobile_object_t *)P)->tile_word_high;
+ ((uw_mobile_object_t *)P)->npc_xhome = (H >> 2) & 0x3f;

@tile_word_2_npc_xhome_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->tile_word_high = (((uw_mobile_object_t *)P)->tile_word_high ^ H) & 0xfc ^ ((uw_mobile_object_t *)P)->tile_word_high;
+ ((uw_mobile_object_t *)P)->npc_xhome = (H >> 2) & 0x3f;

@size_weight_0_collision_radius_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight = P->size_weight & 0xfff8 | H & 0x7;
+ P->collision_radius = H & 0x7;

@size_weight_0_collision_radius_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff8 | H & 0x7;
- P->size_weight = (ushort)V;
+ P->collision_radius = H & 0x7;
+ V = P->size_weight;

@size_weight_0_collision_radius_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff8 | H & 0x7;
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->collision_radius = H & 0x7;
+ V = P->size_weight;

@size_weight_0_collision_radius_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff8 | H & 0x7;
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->collision_radius = H & 0x7;
+ V = P->size_weight;

@size_weight_0_collision_radius_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight = P->size_weight & 0xfff8;
+ P->collision_radius = 0x0;

@size_weight_0_collision_radius_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff8;
- P->size_weight = (ushort)V;
+ P->collision_radius = 0x0;
+ V = P->size_weight;

@size_weight_0_collision_radius_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff8;
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->collision_radius = 0x0;
+ V = P->size_weight;

@size_weight_0_collision_radius_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff8;
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->collision_radius = 0x0;
+ V = P->size_weight;

@size_weight_0_collision_radius_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight = P->size_weight | 0x7;
+ P->collision_radius = 0x7;

@size_weight_0_collision_radius_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight | 0x7;
- P->size_weight = (ushort)V;
+ P->collision_radius = 0x7;
+ V = P->size_weight;

@size_weight_0_collision_radius_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight | 0x7;
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->collision_radius = 0x7;
+ V = P->size_weight;

@size_weight_0_collision_radius_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight | 0x7;
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->collision_radius = 0x7;
+ V = P->size_weight;

@size_weight_0_collision_radius_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight_low = P->size_weight_low & 0xf8 | H & 0x7;
+ P->collision_radius = H & 0x7;

@size_weight_0_collision_radius_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight_low = P->size_weight_low & 0xf8;
+ P->collision_radius = 0;

@size_weight_0_collision_radius_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight_low = P->size_weight_low | 0x7;
+ P->collision_radius = 0x7;

@size_weight_0_collision_radius_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight_low = (H ^ P->size_weight_low) & 0x7 ^ P->size_weight_low;
+ P->collision_radius = H & 0x7;

@size_weight_0_collision_radius_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight_low = (P->size_weight_low ^ H) & 0x7 ^ P->size_weight_low;
+ P->collision_radius = H & 0x7;

@size_weight_0_animated_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight = P->size_weight & 0xfff7 | (H & 0x1) << 3;
+ P->animated = H & 0x1;

@size_weight_0_animated_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff7 | (H & 0x1) << 3;
- P->size_weight = (ushort)V;
+ P->animated = H & 0x1;
+ V = P->size_weight;

@size_weight_0_animated_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff7 | (H & 0x1) << 3;
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->animated = H & 0x1;
+ V = P->size_weight;

@size_weight_0_animated_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff7 | (H & 0x1) << 3;
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->animated = H & 0x1;
+ V = P->size_weight;

@size_weight_0_animated_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight = P->size_weight & 0xfff7;
+ P->animated = 0x0;

@size_weight_0_animated_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff7;
- P->size_weight = (ushort)V;
+ P->animated = 0x0;
+ V = P->size_weight;

@size_weight_0_animated_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff7;
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->animated = 0x0;
+ V = P->size_weight;

@size_weight_0_animated_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xfff7;
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->animated = 0x0;
+ V = P->size_weight;

@size_weight_0_animated_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight = P->size_weight | 0x8;
+ P->animated = 0x1;

@size_weight_0_animated_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight | 0x8;
- P->size_weight = (ushort)V;
+ P->animated = 0x1;
+ V = P->size_weight;

@size_weight_0_animated_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight | 0x8;
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->animated = 0x1;
+ V = P->size_weight;

@size_weight_0_animated_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight | 0x8;
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->animated = 0x1;
+ V = P->size_weight;

@size_weight_0_animated_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight_low = P->size_weight_low & 0xf7 | (H & 0x1) << 3;
+ P->animated = H & 0x1;

@size_weight_0_animated_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight_low = P->size_weight_low & 0xf7;
+ P->animated = 0;

@size_weight_0_animated_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight_low = P->size_weight_low | 0x8;
+ P->animated = 0x1;

@size_weight_0_animated_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight_low = (H ^ P->size_weight_low) & 0x8 ^ P->size_weight_low;
+ P->animated = (H >> 3) & 0x1;

@size_weight_0_animated_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight_low = (P->size_weight_low ^ H) & 0x8 ^ P->size_weight_low;
+ P->animated = (H >> 3) & 0x1;

@size_weight_0_unit_weight_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight = P->size_weight & 0xf | (H & 0xfff) << 4;
+ P->unit_weight = H & 0xfff;

@size_weight_0_unit_weight_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xf | (H & 0xfff) << 4;
- P->size_weight = (ushort)V;
+ P->unit_weight = H & 0xfff;
+ V = P->size_weight;

@size_weight_0_unit_weight_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xf | (H & 0xfff) << 4;
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->unit_weight = H & 0xfff;
+ V = P->size_weight;

@size_weight_0_unit_weight_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xf | (H & 0xfff) << 4;
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->unit_weight = H & 0xfff;
+ V = P->size_weight;

@size_weight_0_unit_weight_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight = P->size_weight & 0xf;
+ P->unit_weight = 0x0;

@size_weight_0_unit_weight_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xf;
- P->size_weight = (ushort)V;
+ P->unit_weight = 0x0;
+ V = P->size_weight;

@size_weight_0_unit_weight_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xf;
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->unit_weight = 0x0;
+ V = P->size_weight;

@size_weight_0_unit_weight_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight & 0xf;
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->unit_weight = 0x0;
+ V = P->size_weight;

@size_weight_0_unit_weight_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->size_weight = P->size_weight | 0xfff0;
+ P->unit_weight = 0xfff;

@size_weight_0_unit_weight_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight | 0xfff0;
- P->size_weight = (ushort)V;
+ P->unit_weight = 0xfff;
+ V = P->size_weight;

@size_weight_0_unit_weight_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight | 0xfff0;
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->unit_weight = 0xfff;
+ V = P->size_weight;

@size_weight_0_unit_weight_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P->size_weight | 0xfff0;
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->unit_weight = 0xfff;
+ V = P->size_weight;

@size_weight_1_collision_radius_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight = P.size_weight & 0xfff8 | H & 0x7;
+ P.collision_radius = H & 0x7;

@size_weight_1_collision_radius_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff8 | H & 0x7;
- P.size_weight = (ushort)V;
+ P.collision_radius = H & 0x7;
+ V = P.size_weight;

@size_weight_1_collision_radius_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff8 | H & 0x7;
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.collision_radius = H & 0x7;
+ V = P.size_weight;

@size_weight_1_collision_radius_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff8 | H & 0x7;
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.collision_radius = H & 0x7;
+ V = P.size_weight;

@size_weight_1_collision_radius_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight = P.size_weight & 0xfff8;
+ P.collision_radius = 0x0;

@size_weight_1_collision_radius_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff8;
- P.size_weight = (ushort)V;
+ P.collision_radius = 0x0;
+ V = P.size_weight;

@size_weight_1_collision_radius_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff8;
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.collision_radius = 0x0;
+ V = P.size_weight;

@size_weight_1_collision_radius_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff8;
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.collision_radius = 0x0;
+ V = P.size_weight;

@size_weight_1_collision_radius_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight = P.size_weight | 0x7;
+ P.collision_radius = 0x7;

@size_weight_1_collision_radius_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight | 0x7;
- P.size_weight = (ushort)V;
+ P.collision_radius = 0x7;
+ V = P.size_weight;

@size_weight_1_collision_radius_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight | 0x7;
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.collision_radius = 0x7;
+ V = P.size_weight;

@size_weight_1_collision_radius_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight | 0x7;
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.collision_radius = 0x7;
+ V = P.size_weight;

@size_weight_1_collision_radius_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight_low = P.size_weight_low & 0xf8 | H & 0x7;
+ P.collision_radius = H & 0x7;

@size_weight_1_collision_radius_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight_low = P.size_weight_low & 0xf8;
+ P.collision_radius = 0;

@size_weight_1_collision_radius_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight_low = P.size_weight_low | 0x7;
+ P.collision_radius = 0x7;

@size_weight_1_collision_radius_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight_low = (H ^ P.size_weight_low) & 0x7 ^ P.size_weight_low;
+ P.collision_radius = H & 0x7;

@size_weight_1_collision_radius_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight_low = (P.size_weight_low ^ H) & 0x7 ^ P.size_weight_low;
+ P.collision_radius = H & 0x7;

@size_weight_1_animated_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight = P.size_weight & 0xfff7 | (H & 0x1) << 3;
+ P.animated = H & 0x1;

@size_weight_1_animated_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff7 | (H & 0x1) << 3;
- P.size_weight = (ushort)V;
+ P.animated = H & 0x1;
+ V = P.size_weight;

@size_weight_1_animated_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff7 | (H & 0x1) << 3;
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.animated = H & 0x1;
+ V = P.size_weight;

@size_weight_1_animated_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff7 | (H & 0x1) << 3;
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.animated = H & 0x1;
+ V = P.size_weight;

@size_weight_1_animated_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight = P.size_weight & 0xfff7;
+ P.animated = 0x0;

@size_weight_1_animated_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff7;
- P.size_weight = (ushort)V;
+ P.animated = 0x0;
+ V = P.size_weight;

@size_weight_1_animated_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff7;
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.animated = 0x0;
+ V = P.size_weight;

@size_weight_1_animated_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xfff7;
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.animated = 0x0;
+ V = P.size_weight;

@size_weight_1_animated_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight = P.size_weight | 0x8;
+ P.animated = 0x1;

@size_weight_1_animated_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight | 0x8;
- P.size_weight = (ushort)V;
+ P.animated = 0x1;
+ V = P.size_weight;

@size_weight_1_animated_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight | 0x8;
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.animated = 0x1;
+ V = P.size_weight;

@size_weight_1_animated_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight | 0x8;
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.animated = 0x1;
+ V = P.size_weight;

@size_weight_1_animated_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight_low = P.size_weight_low & 0xf7 | (H & 0x1) << 3;
+ P.animated = H & 0x1;

@size_weight_1_animated_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight_low = P.size_weight_low & 0xf7;
+ P.animated = 0;

@size_weight_1_animated_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight_low = P.size_weight_low | 0x8;
+ P.animated = 0x1;

@size_weight_1_animated_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight_low = (H ^ P.size_weight_low) & 0x8 ^ P.size_weight_low;
+ P.animated = (H >> 3) & 0x1;

@size_weight_1_animated_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight_low = (P.size_weight_low ^ H) & 0x8 ^ P.size_weight_low;
+ P.animated = (H >> 3) & 0x1;

@size_weight_1_unit_weight_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight = P.size_weight & 0xf | (H & 0xfff) << 4;
+ P.unit_weight = H & 0xfff;

@size_weight_1_unit_weight_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xf | (H & 0xfff) << 4;
- P.size_weight = (ushort)V;
+ P.unit_weight = H & 0xfff;
+ V = P.size_weight;

@size_weight_1_unit_weight_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xf | (H & 0xfff) << 4;
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.unit_weight = H & 0xfff;
+ V = P.size_weight;

@size_weight_1_unit_weight_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xf | (H & 0xfff) << 4;
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.unit_weight = H & 0xfff;
+ V = P.size_weight;

@size_weight_1_unit_weight_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight = P.size_weight & 0xf;
+ P.unit_weight = 0x0;

@size_weight_1_unit_weight_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xf;
- P.size_weight = (ushort)V;
+ P.unit_weight = 0x0;
+ V = P.size_weight;

@size_weight_1_unit_weight_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xf;
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.unit_weight = 0x0;
+ V = P.size_weight;

@size_weight_1_unit_weight_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight & 0xf;
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.unit_weight = 0x0;
+ V = P.size_weight;

@size_weight_1_unit_weight_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.size_weight = P.size_weight | 0xfff0;
+ P.unit_weight = 0xfff;

@size_weight_1_unit_weight_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight | 0xfff0;
- P.size_weight = (ushort)V;
+ P.unit_weight = 0xfff;
+ V = P.size_weight;

@size_weight_1_unit_weight_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight | 0xfff0;
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.unit_weight = 0xfff;
+ V = P.size_weight;

@size_weight_1_unit_weight_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = P.size_weight | 0xfff0;
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.unit_weight = 0xfff;
+ V = P.size_weight;

@size_weight_2_collision_radius_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight = ((uw_mobile_object_t *)P)->size_weight & 0xfff8 | H & 0x7;
+ ((uw_mobile_object_t *)P)->collision_radius = H & 0x7;

@size_weight_2_collision_radius_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff8 | H & 0x7;
- ((uw_mobile_object_t *)P)->size_weight = (ushort)V;
+ ((uw_mobile_object_t *)P)->collision_radius = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_collision_radius_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff8 | H & 0x7;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->collision_radius = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_collision_radius_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff8 | H & 0x7;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->collision_radius = H & 0x7;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_collision_radius_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight = ((uw_mobile_object_t *)P)->size_weight & 0xfff8;
+ ((uw_mobile_object_t *)P)->collision_radius = 0x0;

@size_weight_2_collision_radius_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff8;
- ((uw_mobile_object_t *)P)->size_weight = (ushort)V;
+ ((uw_mobile_object_t *)P)->collision_radius = 0x0;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_collision_radius_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff8;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->collision_radius = 0x0;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_collision_radius_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff8;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->collision_radius = 0x0;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_collision_radius_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight = ((uw_mobile_object_t *)P)->size_weight | 0x7;
+ ((uw_mobile_object_t *)P)->collision_radius = 0x7;

@size_weight_2_collision_radius_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight | 0x7;
- ((uw_mobile_object_t *)P)->size_weight = (ushort)V;
+ ((uw_mobile_object_t *)P)->collision_radius = 0x7;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_collision_radius_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight | 0x7;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->collision_radius = 0x7;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_collision_radius_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight | 0x7;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->collision_radius = 0x7;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_collision_radius_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight_low = ((uw_mobile_object_t *)P)->size_weight_low & 0xf8 | H & 0x7;
+ ((uw_mobile_object_t *)P)->collision_radius = H & 0x7;

@size_weight_2_collision_radius_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight_low = ((uw_mobile_object_t *)P)->size_weight_low & 0xf8;
+ ((uw_mobile_object_t *)P)->collision_radius = 0;

@size_weight_2_collision_radius_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight_low = ((uw_mobile_object_t *)P)->size_weight_low | 0x7;
+ ((uw_mobile_object_t *)P)->collision_radius = 0x7;

@size_weight_2_collision_radius_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight_low = (H ^ ((uw_mobile_object_t *)P)->size_weight_low) & 0x7 ^ ((uw_mobile_object_t *)P)->size_weight_low;
+ ((uw_mobile_object_t *)P)->collision_radius = H & 0x7;

@size_weight_2_collision_radius_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight_low = (((uw_mobile_object_t *)P)->size_weight_low ^ H) & 0x7 ^ ((uw_mobile_object_t *)P)->size_weight_low;
+ ((uw_mobile_object_t *)P)->collision_radius = H & 0x7;

@size_weight_2_animated_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight = ((uw_mobile_object_t *)P)->size_weight & 0xfff7 | (H & 0x1) << 3;
+ ((uw_mobile_object_t *)P)->animated = H & 0x1;

@size_weight_2_animated_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff7 | (H & 0x1) << 3;
- ((uw_mobile_object_t *)P)->size_weight = (ushort)V;
+ ((uw_mobile_object_t *)P)->animated = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_animated_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff7 | (H & 0x1) << 3;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->animated = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_animated_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff7 | (H & 0x1) << 3;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->animated = H & 0x1;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_animated_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight = ((uw_mobile_object_t *)P)->size_weight & 0xfff7;
+ ((uw_mobile_object_t *)P)->animated = 0x0;

@size_weight_2_animated_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff7;
- ((uw_mobile_object_t *)P)->size_weight = (ushort)V;
+ ((uw_mobile_object_t *)P)->animated = 0x0;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_animated_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff7;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->animated = 0x0;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_animated_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xfff7;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->animated = 0x0;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_animated_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight = ((uw_mobile_object_t *)P)->size_weight | 0x8;
+ ((uw_mobile_object_t *)P)->animated = 0x1;

@size_weight_2_animated_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight | 0x8;
- ((uw_mobile_object_t *)P)->size_weight = (ushort)V;
+ ((uw_mobile_object_t *)P)->animated = 0x1;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_animated_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight | 0x8;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->animated = 0x1;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_animated_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight | 0x8;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->animated = 0x1;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_animated_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight_low = ((uw_mobile_object_t *)P)->size_weight_low & 0xf7 | (H & 0x1) << 3;
+ ((uw_mobile_object_t *)P)->animated = H & 0x1;

@size_weight_2_animated_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight_low = ((uw_mobile_object_t *)P)->size_weight_low & 0xf7;
+ ((uw_mobile_object_t *)P)->animated = 0;

@size_weight_2_animated_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight_low = ((uw_mobile_object_t *)P)->size_weight_low | 0x8;
+ ((uw_mobile_object_t *)P)->animated = 0x1;

@size_weight_2_animated_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight_low = (H ^ ((uw_mobile_object_t *)P)->size_weight_low) & 0x8 ^ ((uw_mobile_object_t *)P)->size_weight_low;
+ ((uw_mobile_object_t *)P)->animated = (H >> 3) & 0x1;

@size_weight_2_animated_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight_low = (((uw_mobile_object_t *)P)->size_weight_low ^ H) & 0x8 ^ ((uw_mobile_object_t *)P)->size_weight_low;
+ ((uw_mobile_object_t *)P)->animated = (H >> 3) & 0x1;

@size_weight_2_unit_weight_direct_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight = ((uw_mobile_object_t *)P)->size_weight & 0xf | (H & 0xfff) << 4;
+ ((uw_mobile_object_t *)P)->unit_weight = H & 0xfff;

@size_weight_2_unit_weight_temporary_0_0@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xf | (H & 0xfff) << 4;
- ((uw_mobile_object_t *)P)->size_weight = (ushort)V;
+ ((uw_mobile_object_t *)P)->unit_weight = H & 0xfff;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_unit_weight_temporary_0_1@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xf | (H & 0xfff) << 4;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->unit_weight = H & 0xfff;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_unit_weight_temporary_0_2@
identifier P, H, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xf | (H & 0xfff) << 4;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->unit_weight = H & 0xfff;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_unit_weight_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight = ((uw_mobile_object_t *)P)->size_weight & 0xf;
+ ((uw_mobile_object_t *)P)->unit_weight = 0x0;

@size_weight_2_unit_weight_clear_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xf;
- ((uw_mobile_object_t *)P)->size_weight = (ushort)V;
+ ((uw_mobile_object_t *)P)->unit_weight = 0x0;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_unit_weight_clear_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xf;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->unit_weight = 0x0;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_unit_weight_clear_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight & 0xf;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->unit_weight = 0x0;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_unit_weight_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- ((uw_mobile_object_t *)P)->size_weight = ((uw_mobile_object_t *)P)->size_weight | 0xfff0;
+ ((uw_mobile_object_t *)P)->unit_weight = 0xfff;

@size_weight_2_unit_weight_set_0@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight | 0xfff0;
- ((uw_mobile_object_t *)P)->size_weight = (ushort)V;
+ ((uw_mobile_object_t *)P)->unit_weight = 0xfff;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_unit_weight_set_1@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight | 0xfff0;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->unit_weight = 0xfff;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@size_weight_2_unit_weight_set_2@
identifier P, V;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- V = ((uw_mobile_object_t *)P)->size_weight | 0xfff0;
- ((uw_mobile_object_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->unit_weight = 0xfff;
+ V = ((uw_mobile_object_t *)P)->size_weight;

@owner_flags_0_can_have_owner_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->owner_flags = P->owner_flags & 0x7f | (H & 0x1) << 7;
+ P->can_have_owner = H & 0x1;

@owner_flags_0_can_have_owner_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->owner_flags = P->owner_flags & 0x7f;
+ P->can_have_owner = 0;

@owner_flags_0_can_have_owner_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->owner_flags = P->owner_flags | 0x80;
+ P->can_have_owner = 0x1;

@owner_flags_0_can_have_owner_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->owner_flags = (H ^ P->owner_flags) & 0x80 ^ P->owner_flags;
+ P->can_have_owner = (H >> 7) & 0x1;

@owner_flags_0_can_have_owner_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->owner_flags = (P->owner_flags ^ H) & 0x80 ^ P->owner_flags;
+ P->can_have_owner = (H >> 7) & 0x1;

@owner_flags_1_can_have_owner_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.owner_flags = P.owner_flags & 0x7f | (H & 0x1) << 7;
+ P.can_have_owner = H & 0x1;

@owner_flags_1_can_have_owner_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.owner_flags = P.owner_flags & 0x7f;
+ P.can_have_owner = 0;

@owner_flags_1_can_have_owner_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.owner_flags = P.owner_flags | 0x80;
+ P.can_have_owner = 0x1;

@owner_flags_1_can_have_owner_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.owner_flags = (H ^ P.owner_flags) & 0x80 ^ P.owner_flags;
+ P.can_have_owner = (H >> 7) & 0x1;

@owner_flags_1_can_have_owner_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.owner_flags = (P.owner_flags ^ H) & 0x80 ^ P.owner_flags;
+ P.can_have_owner = (H >> 7) & 0x1;

@description_flags_0_quality_type_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->description_flags = P->description_flags & 0xf0 | H & 0xf;
+ P->quality_type = H & 0xf;

@description_flags_0_quality_type_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->description_flags = P->description_flags & 0xf0;
+ P->quality_type = 0;

@description_flags_0_quality_type_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->description_flags = P->description_flags | 0xf;
+ P->quality_type = 0xf;

@description_flags_0_quality_type_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->description_flags = (H ^ P->description_flags) & 0xf ^ P->description_flags;
+ P->quality_type = H & 0xf;

@description_flags_0_quality_type_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->description_flags = (P->description_flags ^ H) & 0xf ^ P->description_flags;
+ P->quality_type = H & 0xf;

@description_flags_0_has_look_description_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->description_flags = P->description_flags & 0xef | (H & 0x1) << 4;
+ P->has_look_description = H & 0x1;

@description_flags_0_has_look_description_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->description_flags = P->description_flags & 0xef;
+ P->has_look_description = 0;

@description_flags_0_has_look_description_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->description_flags = P->description_flags | 0x10;
+ P->has_look_description = 0x1;

@description_flags_0_has_look_description_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->description_flags = (H ^ P->description_flags) & 0x10 ^ P->description_flags;
+ P->has_look_description = (H >> 4) & 0x1;

@description_flags_0_has_look_description_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->description_flags = (P->description_flags ^ H) & 0x10 ^ P->description_flags;
+ P->has_look_description = (H >> 4) & 0x1;

@description_flags_1_quality_type_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.description_flags = P.description_flags & 0xf0 | H & 0xf;
+ P.quality_type = H & 0xf;

@description_flags_1_quality_type_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.description_flags = P.description_flags & 0xf0;
+ P.quality_type = 0;

@description_flags_1_quality_type_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.description_flags = P.description_flags | 0xf;
+ P.quality_type = 0xf;

@description_flags_1_quality_type_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.description_flags = (H ^ P.description_flags) & 0xf ^ P.description_flags;
+ P.quality_type = H & 0xf;

@description_flags_1_quality_type_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.description_flags = (P.description_flags ^ H) & 0xf ^ P.description_flags;
+ P.quality_type = H & 0xf;

@description_flags_1_has_look_description_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.description_flags = P.description_flags & 0xef | (H & 0x1) << 4;
+ P.has_look_description = H & 0x1;

@description_flags_1_has_look_description_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.description_flags = P.description_flags & 0xef;
+ P.has_look_description = 0;

@description_flags_1_has_look_description_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.description_flags = P.description_flags | 0x10;
+ P.has_look_description = 0x1;

@description_flags_1_has_look_description_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.description_flags = (H ^ P.description_flags) & 0x10 ^ P.description_flags;
+ P.has_look_description = (H >> 4) & 0x1;

@description_flags_1_has_look_description_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.description_flags = (P.description_flags ^ H) & 0x10 ^ P.description_flags;
+ P.has_look_description = (H >> 4) & 0x1;

@heading_flags_0_npc_heading_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->heading_flags = P->heading_flags & 0xe0 | H & 0x1f;
+ P->npc_heading = H & 0x1f;

@heading_flags_0_npc_heading_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->heading_flags = P->heading_flags & 0xe0;
+ P->npc_heading = 0;

@heading_flags_0_npc_heading_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->heading_flags = P->heading_flags | 0x1f;
+ P->npc_heading = 0x1f;

@heading_flags_0_npc_heading_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->heading_flags = (H ^ P->heading_flags) & 0x1f ^ P->heading_flags;
+ P->npc_heading = H & 0x1f;

@heading_flags_0_npc_heading_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->heading_flags = (P->heading_flags ^ H) & 0x1f ^ P->heading_flags;
+ P->npc_heading = H & 0x1f;

@heading_flags_1_npc_heading_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.heading_flags = P.heading_flags & 0xe0 | H & 0x1f;
+ P.npc_heading = H & 0x1f;

@heading_flags_1_npc_heading_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.heading_flags = P.heading_flags & 0xe0;
+ P.npc_heading = 0;

@heading_flags_1_npc_heading_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.heading_flags = P.heading_flags | 0x1f;
+ P.npc_heading = 0x1f;

@heading_flags_1_npc_heading_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.heading_flags = (H ^ P.heading_flags) & 0x1f ^ P.heading_flags;
+ P.npc_heading = H & 0x1f;

@heading_flags_1_npc_heading_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.heading_flags = (P.heading_flags ^ H) & 0x1f ^ P.heading_flags;
+ P.npc_heading = H & 0x1f;

@pitch_flags_0_pitch_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->pitch_flags = P->pitch_flags & 0x7 | (H & 0x1f) << 3;
+ P->pitch = H & 0x1f;

@pitch_flags_0_pitch_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->pitch_flags = P->pitch_flags & 0x7;
+ P->pitch = 0;

@pitch_flags_0_pitch_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->pitch_flags = P->pitch_flags | 0xf8;
+ P->pitch = 0x1f;

@pitch_flags_0_pitch_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->pitch_flags = (H ^ P->pitch_flags) & 0xf8 ^ P->pitch_flags;
+ P->pitch = (H >> 3) & 0x1f;

@pitch_flags_0_pitch_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P->pitch_flags = (P->pitch_flags ^ H) & 0xf8 ^ P->pitch_flags;
+ P->pitch = (H >> 3) & 0x1f;

@pitch_flags_1_pitch_byte_insert@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.pitch_flags = P.pitch_flags & 0x7 | (H & 0x1f) << 3;
+ P.pitch = H & 0x1f;

@pitch_flags_1_pitch_byte_clear@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.pitch_flags = P.pitch_flags & 0x7;
+ P.pitch = 0;

@pitch_flags_1_pitch_byte_set@
identifier P;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.pitch_flags = P.pitch_flags | 0xf8;
+ P.pitch = 0x1f;

@pitch_flags_1_pitch_byte_xor_0@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.pitch_flags = (H ^ P.pitch_flags) & 0xf8 ^ P.pitch_flags;
+ P.pitch = (H >> 3) & 0x1f;

@pitch_flags_1_pitch_byte_xor_1@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t;
@@
- P.pitch_flags = (P.pitch_flags ^ H) & 0xf8 ^ P.pitch_flags;
+ P.pitch = (H >> 3) & 0x1f;
