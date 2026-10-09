@store_type_flags_0 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->type_flags = (ushort)V;
|
- P->type_flags_low = (char)V;
- P->type_flags_high = (char)(V >> 8);
+ P->type_flags = (ushort)V;
|
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->type_flags = (ushort)V;
|
- P->type_flags_low = (byte)(char)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->type_flags = (ushort)V;
|
- P->type_flags_low = (char)V;
- P->type_flags_high = (byte)(V >> 8);
+ P->type_flags = (ushort)V;
|
- P->type_flags_low = (byte)V;
- P->type_flags_high = (byte)(char)(V >> 8);
+ P->type_flags = (ushort)V;
|
- P->type_flags_low = (byte)(V & C);
- P->type_flags_high = (byte)((V & C) >> 8);
+ P->type_flags = (ushort)(V & C);
|
- P->type_flags_low = (char)(V & C);
- P->type_flags_high = (char)((V & C) >> 8);
+ P->type_flags = (ushort)(V & C);
|
- P->type_flags_low = (byte)(char)(V & C);
- P->type_flags_high = (byte)((V & C) >> 8);
+ P->type_flags = (ushort)(V & C);
|
- P->type_flags_low = (byte)(char)(V & C);
- P->type_flags_high = (byte)(char)((V & C) >> 8);
+ P->type_flags = (ushort)(V & C);
|
- P->type_flags_low = (char)(V & C);
- P->type_flags_high = (byte)((V & C) >> 8);
+ P->type_flags = (ushort)(V & C);
|
- P->type_flags_low = (byte)(V & C);
- P->type_flags_high = (byte)(char)((V & C) >> 8);
+ P->type_flags = (ushort)(V & C);
|
- P->type_flags_low = (byte)(V | C);
- P->type_flags_high = (byte)((V | C) >> 8);
+ P->type_flags = (ushort)(V | C);
|
- P->type_flags_low = (char)(V | C);
- P->type_flags_high = (char)((V | C) >> 8);
+ P->type_flags = (ushort)(V | C);
|
- P->type_flags_low = (byte)(char)(V | C);
- P->type_flags_high = (byte)((V | C) >> 8);
+ P->type_flags = (ushort)(V | C);
|
- P->type_flags_low = (byte)(char)(V | C);
- P->type_flags_high = (byte)(char)((V | C) >> 8);
+ P->type_flags = (ushort)(V | C);
|
- P->type_flags_low = (char)(V | C);
- P->type_flags_high = (byte)((V | C) >> 8);
+ P->type_flags = (ushort)(V | C);
|
- P->type_flags_low = (byte)(V | C);
- P->type_flags_high = (byte)(char)((V | C) >> 8);
+ P->type_flags = (ushort)(V | C);
|
- P->type_flags_low = (byte)(V ^ C);
- P->type_flags_high = (byte)((V ^ C) >> 8);
+ P->type_flags = (ushort)(V ^ C);
|
- P->type_flags_low = (char)(V ^ C);
- P->type_flags_high = (char)((V ^ C) >> 8);
+ P->type_flags = (ushort)(V ^ C);
|
- P->type_flags_low = (byte)(char)(V ^ C);
- P->type_flags_high = (byte)((V ^ C) >> 8);
+ P->type_flags = (ushort)(V ^ C);
|
- P->type_flags_low = (byte)(char)(V ^ C);
- P->type_flags_high = (byte)(char)((V ^ C) >> 8);
+ P->type_flags = (ushort)(V ^ C);
|
- P->type_flags_low = (char)(V ^ C);
- P->type_flags_high = (byte)((V ^ C) >> 8);
+ P->type_flags = (ushort)(V ^ C);
|
- P->type_flags_low = (byte)(V ^ C);
- P->type_flags_high = (byte)(char)((V ^ C) >> 8);
+ P->type_flags = (ushort)(V ^ C);
)

@store_type_flags_1 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.type_flags = (ushort)V;
|
- P.type_flags_low = (char)V;
- P.type_flags_high = (char)(V >> 8);
+ P.type_flags = (ushort)V;
|
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.type_flags = (ushort)V;
|
- P.type_flags_low = (byte)(char)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.type_flags = (ushort)V;
|
- P.type_flags_low = (char)V;
- P.type_flags_high = (byte)(V >> 8);
+ P.type_flags = (ushort)V;
|
- P.type_flags_low = (byte)V;
- P.type_flags_high = (byte)(char)(V >> 8);
+ P.type_flags = (ushort)V;
|
- P.type_flags_low = (byte)(V & C);
- P.type_flags_high = (byte)((V & C) >> 8);
+ P.type_flags = (ushort)(V & C);
|
- P.type_flags_low = (char)(V & C);
- P.type_flags_high = (char)((V & C) >> 8);
+ P.type_flags = (ushort)(V & C);
|
- P.type_flags_low = (byte)(char)(V & C);
- P.type_flags_high = (byte)((V & C) >> 8);
+ P.type_flags = (ushort)(V & C);
|
- P.type_flags_low = (byte)(char)(V & C);
- P.type_flags_high = (byte)(char)((V & C) >> 8);
+ P.type_flags = (ushort)(V & C);
|
- P.type_flags_low = (char)(V & C);
- P.type_flags_high = (byte)((V & C) >> 8);
+ P.type_flags = (ushort)(V & C);
|
- P.type_flags_low = (byte)(V & C);
- P.type_flags_high = (byte)(char)((V & C) >> 8);
+ P.type_flags = (ushort)(V & C);
|
- P.type_flags_low = (byte)(V | C);
- P.type_flags_high = (byte)((V | C) >> 8);
+ P.type_flags = (ushort)(V | C);
|
- P.type_flags_low = (char)(V | C);
- P.type_flags_high = (char)((V | C) >> 8);
+ P.type_flags = (ushort)(V | C);
|
- P.type_flags_low = (byte)(char)(V | C);
- P.type_flags_high = (byte)((V | C) >> 8);
+ P.type_flags = (ushort)(V | C);
|
- P.type_flags_low = (byte)(char)(V | C);
- P.type_flags_high = (byte)(char)((V | C) >> 8);
+ P.type_flags = (ushort)(V | C);
|
- P.type_flags_low = (char)(V | C);
- P.type_flags_high = (byte)((V | C) >> 8);
+ P.type_flags = (ushort)(V | C);
|
- P.type_flags_low = (byte)(V | C);
- P.type_flags_high = (byte)(char)((V | C) >> 8);
+ P.type_flags = (ushort)(V | C);
|
- P.type_flags_low = (byte)(V ^ C);
- P.type_flags_high = (byte)((V ^ C) >> 8);
+ P.type_flags = (ushort)(V ^ C);
|
- P.type_flags_low = (char)(V ^ C);
- P.type_flags_high = (char)((V ^ C) >> 8);
+ P.type_flags = (ushort)(V ^ C);
|
- P.type_flags_low = (byte)(char)(V ^ C);
- P.type_flags_high = (byte)((V ^ C) >> 8);
+ P.type_flags = (ushort)(V ^ C);
|
- P.type_flags_low = (byte)(char)(V ^ C);
- P.type_flags_high = (byte)(char)((V ^ C) >> 8);
+ P.type_flags = (ushort)(V ^ C);
|
- P.type_flags_low = (char)(V ^ C);
- P.type_flags_high = (byte)((V ^ C) >> 8);
+ P.type_flags = (ushort)(V ^ C);
|
- P.type_flags_low = (byte)(V ^ C);
- P.type_flags_high = (byte)(char)((V ^ C) >> 8);
+ P.type_flags = (ushort)(V ^ C);
)

@store_type_flags_2 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.type_flags = (ushort)V;
|
- P->hdr.type_flags_low = (char)V;
- P->hdr.type_flags_high = (char)(V >> 8);
+ P->hdr.type_flags = (ushort)V;
|
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.type_flags = (ushort)V;
|
- P->hdr.type_flags_low = (byte)(char)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.type_flags = (ushort)V;
|
- P->hdr.type_flags_low = (char)V;
- P->hdr.type_flags_high = (byte)(V >> 8);
+ P->hdr.type_flags = (ushort)V;
|
- P->hdr.type_flags_low = (byte)V;
- P->hdr.type_flags_high = (byte)(char)(V >> 8);
+ P->hdr.type_flags = (ushort)V;
|
- P->hdr.type_flags_low = (byte)(V & C);
- P->hdr.type_flags_high = (byte)((V & C) >> 8);
+ P->hdr.type_flags = (ushort)(V & C);
|
- P->hdr.type_flags_low = (char)(V & C);
- P->hdr.type_flags_high = (char)((V & C) >> 8);
+ P->hdr.type_flags = (ushort)(V & C);
|
- P->hdr.type_flags_low = (byte)(char)(V & C);
- P->hdr.type_flags_high = (byte)((V & C) >> 8);
+ P->hdr.type_flags = (ushort)(V & C);
|
- P->hdr.type_flags_low = (byte)(char)(V & C);
- P->hdr.type_flags_high = (byte)(char)((V & C) >> 8);
+ P->hdr.type_flags = (ushort)(V & C);
|
- P->hdr.type_flags_low = (char)(V & C);
- P->hdr.type_flags_high = (byte)((V & C) >> 8);
+ P->hdr.type_flags = (ushort)(V & C);
|
- P->hdr.type_flags_low = (byte)(V & C);
- P->hdr.type_flags_high = (byte)(char)((V & C) >> 8);
+ P->hdr.type_flags = (ushort)(V & C);
|
- P->hdr.type_flags_low = (byte)(V | C);
- P->hdr.type_flags_high = (byte)((V | C) >> 8);
+ P->hdr.type_flags = (ushort)(V | C);
|
- P->hdr.type_flags_low = (char)(V | C);
- P->hdr.type_flags_high = (char)((V | C) >> 8);
+ P->hdr.type_flags = (ushort)(V | C);
|
- P->hdr.type_flags_low = (byte)(char)(V | C);
- P->hdr.type_flags_high = (byte)((V | C) >> 8);
+ P->hdr.type_flags = (ushort)(V | C);
|
- P->hdr.type_flags_low = (byte)(char)(V | C);
- P->hdr.type_flags_high = (byte)(char)((V | C) >> 8);
+ P->hdr.type_flags = (ushort)(V | C);
|
- P->hdr.type_flags_low = (char)(V | C);
- P->hdr.type_flags_high = (byte)((V | C) >> 8);
+ P->hdr.type_flags = (ushort)(V | C);
|
- P->hdr.type_flags_low = (byte)(V | C);
- P->hdr.type_flags_high = (byte)(char)((V | C) >> 8);
+ P->hdr.type_flags = (ushort)(V | C);
|
- P->hdr.type_flags_low = (byte)(V ^ C);
- P->hdr.type_flags_high = (byte)((V ^ C) >> 8);
+ P->hdr.type_flags = (ushort)(V ^ C);
|
- P->hdr.type_flags_low = (char)(V ^ C);
- P->hdr.type_flags_high = (char)((V ^ C) >> 8);
+ P->hdr.type_flags = (ushort)(V ^ C);
|
- P->hdr.type_flags_low = (byte)(char)(V ^ C);
- P->hdr.type_flags_high = (byte)((V ^ C) >> 8);
+ P->hdr.type_flags = (ushort)(V ^ C);
|
- P->hdr.type_flags_low = (byte)(char)(V ^ C);
- P->hdr.type_flags_high = (byte)(char)((V ^ C) >> 8);
+ P->hdr.type_flags = (ushort)(V ^ C);
|
- P->hdr.type_flags_low = (char)(V ^ C);
- P->hdr.type_flags_high = (byte)((V ^ C) >> 8);
+ P->hdr.type_flags = (ushort)(V ^ C);
|
- P->hdr.type_flags_low = (byte)(V ^ C);
- P->hdr.type_flags_high = (byte)(char)((V ^ C) >> 8);
+ P->hdr.type_flags = (ushort)(V ^ C);
)

@store_type_flags_3 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.type_flags = (ushort)V;
|
- P.hdr.type_flags_low = (char)V;
- P.hdr.type_flags_high = (char)(V >> 8);
+ P.hdr.type_flags = (ushort)V;
|
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.type_flags = (ushort)V;
|
- P.hdr.type_flags_low = (byte)(char)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.type_flags = (ushort)V;
|
- P.hdr.type_flags_low = (char)V;
- P.hdr.type_flags_high = (byte)(V >> 8);
+ P.hdr.type_flags = (ushort)V;
|
- P.hdr.type_flags_low = (byte)V;
- P.hdr.type_flags_high = (byte)(char)(V >> 8);
+ P.hdr.type_flags = (ushort)V;
|
- P.hdr.type_flags_low = (byte)(V & C);
- P.hdr.type_flags_high = (byte)((V & C) >> 8);
+ P.hdr.type_flags = (ushort)(V & C);
|
- P.hdr.type_flags_low = (char)(V & C);
- P.hdr.type_flags_high = (char)((V & C) >> 8);
+ P.hdr.type_flags = (ushort)(V & C);
|
- P.hdr.type_flags_low = (byte)(char)(V & C);
- P.hdr.type_flags_high = (byte)((V & C) >> 8);
+ P.hdr.type_flags = (ushort)(V & C);
|
- P.hdr.type_flags_low = (byte)(char)(V & C);
- P.hdr.type_flags_high = (byte)(char)((V & C) >> 8);
+ P.hdr.type_flags = (ushort)(V & C);
|
- P.hdr.type_flags_low = (char)(V & C);
- P.hdr.type_flags_high = (byte)((V & C) >> 8);
+ P.hdr.type_flags = (ushort)(V & C);
|
- P.hdr.type_flags_low = (byte)(V & C);
- P.hdr.type_flags_high = (byte)(char)((V & C) >> 8);
+ P.hdr.type_flags = (ushort)(V & C);
|
- P.hdr.type_flags_low = (byte)(V | C);
- P.hdr.type_flags_high = (byte)((V | C) >> 8);
+ P.hdr.type_flags = (ushort)(V | C);
|
- P.hdr.type_flags_low = (char)(V | C);
- P.hdr.type_flags_high = (char)((V | C) >> 8);
+ P.hdr.type_flags = (ushort)(V | C);
|
- P.hdr.type_flags_low = (byte)(char)(V | C);
- P.hdr.type_flags_high = (byte)((V | C) >> 8);
+ P.hdr.type_flags = (ushort)(V | C);
|
- P.hdr.type_flags_low = (byte)(char)(V | C);
- P.hdr.type_flags_high = (byte)(char)((V | C) >> 8);
+ P.hdr.type_flags = (ushort)(V | C);
|
- P.hdr.type_flags_low = (char)(V | C);
- P.hdr.type_flags_high = (byte)((V | C) >> 8);
+ P.hdr.type_flags = (ushort)(V | C);
|
- P.hdr.type_flags_low = (byte)(V | C);
- P.hdr.type_flags_high = (byte)(char)((V | C) >> 8);
+ P.hdr.type_flags = (ushort)(V | C);
|
- P.hdr.type_flags_low = (byte)(V ^ C);
- P.hdr.type_flags_high = (byte)((V ^ C) >> 8);
+ P.hdr.type_flags = (ushort)(V ^ C);
|
- P.hdr.type_flags_low = (char)(V ^ C);
- P.hdr.type_flags_high = (char)((V ^ C) >> 8);
+ P.hdr.type_flags = (ushort)(V ^ C);
|
- P.hdr.type_flags_low = (byte)(char)(V ^ C);
- P.hdr.type_flags_high = (byte)((V ^ C) >> 8);
+ P.hdr.type_flags = (ushort)(V ^ C);
|
- P.hdr.type_flags_low = (byte)(char)(V ^ C);
- P.hdr.type_flags_high = (byte)(char)((V ^ C) >> 8);
+ P.hdr.type_flags = (ushort)(V ^ C);
|
- P.hdr.type_flags_low = (char)(V ^ C);
- P.hdr.type_flags_high = (byte)((V ^ C) >> 8);
+ P.hdr.type_flags = (ushort)(V ^ C);
|
- P.hdr.type_flags_low = (byte)(V ^ C);
- P.hdr.type_flags_high = (byte)(char)((V ^ C) >> 8);
+ P.hdr.type_flags = (ushort)(V ^ C);
)

@store_type_flags_4 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (char)(V >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)V;
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)V;
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(V & C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(V & C);
- ((uw_object_hdr_t *)P)->type_flags_high = (char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(V & C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(V & C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(V & C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(V & C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(V | C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(V | C);
- ((uw_object_hdr_t *)P)->type_flags_high = (char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(V | C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(V | C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(V | C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(V | C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(V ^ C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(V ^ C);
- ((uw_object_hdr_t *)P)->type_flags_high = (char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(V ^ C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(char)(V ^ C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (char)(V ^ C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->type_flags_low = (byte)(V ^ C);
- ((uw_object_hdr_t *)P)->type_flags_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->type_flags = (ushort)(V ^ C);
)

@store_type_flags_5 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.type_flags_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.type_flags_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.type_flags = (ushort)(V ^ C);
)

@store_position_word_0 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(V >> 8);
+ P->position_word = (ushort)V;
|
- P->position_word_low = (char)V;
- P->position_word_high = (char)(V >> 8);
+ P->position_word = (ushort)V;
|
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(V >> 8);
+ P->position_word = (ushort)V;
|
- P->position_word_low = (byte)(char)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->position_word = (ushort)V;
|
- P->position_word_low = (char)V;
- P->position_word_high = (byte)(V >> 8);
+ P->position_word = (ushort)V;
|
- P->position_word_low = (byte)V;
- P->position_word_high = (byte)(char)(V >> 8);
+ P->position_word = (ushort)V;
|
- P->position_word_low = (byte)(V & C);
- P->position_word_high = (byte)((V & C) >> 8);
+ P->position_word = (ushort)(V & C);
|
- P->position_word_low = (char)(V & C);
- P->position_word_high = (char)((V & C) >> 8);
+ P->position_word = (ushort)(V & C);
|
- P->position_word_low = (byte)(char)(V & C);
- P->position_word_high = (byte)((V & C) >> 8);
+ P->position_word = (ushort)(V & C);
|
- P->position_word_low = (byte)(char)(V & C);
- P->position_word_high = (byte)(char)((V & C) >> 8);
+ P->position_word = (ushort)(V & C);
|
- P->position_word_low = (char)(V & C);
- P->position_word_high = (byte)((V & C) >> 8);
+ P->position_word = (ushort)(V & C);
|
- P->position_word_low = (byte)(V & C);
- P->position_word_high = (byte)(char)((V & C) >> 8);
+ P->position_word = (ushort)(V & C);
|
- P->position_word_low = (byte)(V | C);
- P->position_word_high = (byte)((V | C) >> 8);
+ P->position_word = (ushort)(V | C);
|
- P->position_word_low = (char)(V | C);
- P->position_word_high = (char)((V | C) >> 8);
+ P->position_word = (ushort)(V | C);
|
- P->position_word_low = (byte)(char)(V | C);
- P->position_word_high = (byte)((V | C) >> 8);
+ P->position_word = (ushort)(V | C);
|
- P->position_word_low = (byte)(char)(V | C);
- P->position_word_high = (byte)(char)((V | C) >> 8);
+ P->position_word = (ushort)(V | C);
|
- P->position_word_low = (char)(V | C);
- P->position_word_high = (byte)((V | C) >> 8);
+ P->position_word = (ushort)(V | C);
|
- P->position_word_low = (byte)(V | C);
- P->position_word_high = (byte)(char)((V | C) >> 8);
+ P->position_word = (ushort)(V | C);
|
- P->position_word_low = (byte)(V ^ C);
- P->position_word_high = (byte)((V ^ C) >> 8);
+ P->position_word = (ushort)(V ^ C);
|
- P->position_word_low = (char)(V ^ C);
- P->position_word_high = (char)((V ^ C) >> 8);
+ P->position_word = (ushort)(V ^ C);
|
- P->position_word_low = (byte)(char)(V ^ C);
- P->position_word_high = (byte)((V ^ C) >> 8);
+ P->position_word = (ushort)(V ^ C);
|
- P->position_word_low = (byte)(char)(V ^ C);
- P->position_word_high = (byte)(char)((V ^ C) >> 8);
+ P->position_word = (ushort)(V ^ C);
|
- P->position_word_low = (char)(V ^ C);
- P->position_word_high = (byte)((V ^ C) >> 8);
+ P->position_word = (ushort)(V ^ C);
|
- P->position_word_low = (byte)(V ^ C);
- P->position_word_high = (byte)(char)((V ^ C) >> 8);
+ P->position_word = (ushort)(V ^ C);
)

@store_position_word_1 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(V >> 8);
+ P.position_word = (ushort)V;
|
- P.position_word_low = (char)V;
- P.position_word_high = (char)(V >> 8);
+ P.position_word = (ushort)V;
|
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(V >> 8);
+ P.position_word = (ushort)V;
|
- P.position_word_low = (byte)(char)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.position_word = (ushort)V;
|
- P.position_word_low = (char)V;
- P.position_word_high = (byte)(V >> 8);
+ P.position_word = (ushort)V;
|
- P.position_word_low = (byte)V;
- P.position_word_high = (byte)(char)(V >> 8);
+ P.position_word = (ushort)V;
|
- P.position_word_low = (byte)(V & C);
- P.position_word_high = (byte)((V & C) >> 8);
+ P.position_word = (ushort)(V & C);
|
- P.position_word_low = (char)(V & C);
- P.position_word_high = (char)((V & C) >> 8);
+ P.position_word = (ushort)(V & C);
|
- P.position_word_low = (byte)(char)(V & C);
- P.position_word_high = (byte)((V & C) >> 8);
+ P.position_word = (ushort)(V & C);
|
- P.position_word_low = (byte)(char)(V & C);
- P.position_word_high = (byte)(char)((V & C) >> 8);
+ P.position_word = (ushort)(V & C);
|
- P.position_word_low = (char)(V & C);
- P.position_word_high = (byte)((V & C) >> 8);
+ P.position_word = (ushort)(V & C);
|
- P.position_word_low = (byte)(V & C);
- P.position_word_high = (byte)(char)((V & C) >> 8);
+ P.position_word = (ushort)(V & C);
|
- P.position_word_low = (byte)(V | C);
- P.position_word_high = (byte)((V | C) >> 8);
+ P.position_word = (ushort)(V | C);
|
- P.position_word_low = (char)(V | C);
- P.position_word_high = (char)((V | C) >> 8);
+ P.position_word = (ushort)(V | C);
|
- P.position_word_low = (byte)(char)(V | C);
- P.position_word_high = (byte)((V | C) >> 8);
+ P.position_word = (ushort)(V | C);
|
- P.position_word_low = (byte)(char)(V | C);
- P.position_word_high = (byte)(char)((V | C) >> 8);
+ P.position_word = (ushort)(V | C);
|
- P.position_word_low = (char)(V | C);
- P.position_word_high = (byte)((V | C) >> 8);
+ P.position_word = (ushort)(V | C);
|
- P.position_word_low = (byte)(V | C);
- P.position_word_high = (byte)(char)((V | C) >> 8);
+ P.position_word = (ushort)(V | C);
|
- P.position_word_low = (byte)(V ^ C);
- P.position_word_high = (byte)((V ^ C) >> 8);
+ P.position_word = (ushort)(V ^ C);
|
- P.position_word_low = (char)(V ^ C);
- P.position_word_high = (char)((V ^ C) >> 8);
+ P.position_word = (ushort)(V ^ C);
|
- P.position_word_low = (byte)(char)(V ^ C);
- P.position_word_high = (byte)((V ^ C) >> 8);
+ P.position_word = (ushort)(V ^ C);
|
- P.position_word_low = (byte)(char)(V ^ C);
- P.position_word_high = (byte)(char)((V ^ C) >> 8);
+ P.position_word = (ushort)(V ^ C);
|
- P.position_word_low = (char)(V ^ C);
- P.position_word_high = (byte)((V ^ C) >> 8);
+ P.position_word = (ushort)(V ^ C);
|
- P.position_word_low = (byte)(V ^ C);
- P.position_word_high = (byte)(char)((V ^ C) >> 8);
+ P.position_word = (ushort)(V ^ C);
)

@store_position_word_2 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.position_word = (ushort)V;
|
- P->hdr.position_word_low = (char)V;
- P->hdr.position_word_high = (char)(V >> 8);
+ P->hdr.position_word = (ushort)V;
|
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.position_word = (ushort)V;
|
- P->hdr.position_word_low = (byte)(char)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.position_word = (ushort)V;
|
- P->hdr.position_word_low = (char)V;
- P->hdr.position_word_high = (byte)(V >> 8);
+ P->hdr.position_word = (ushort)V;
|
- P->hdr.position_word_low = (byte)V;
- P->hdr.position_word_high = (byte)(char)(V >> 8);
+ P->hdr.position_word = (ushort)V;
|
- P->hdr.position_word_low = (byte)(V & C);
- P->hdr.position_word_high = (byte)((V & C) >> 8);
+ P->hdr.position_word = (ushort)(V & C);
|
- P->hdr.position_word_low = (char)(V & C);
- P->hdr.position_word_high = (char)((V & C) >> 8);
+ P->hdr.position_word = (ushort)(V & C);
|
- P->hdr.position_word_low = (byte)(char)(V & C);
- P->hdr.position_word_high = (byte)((V & C) >> 8);
+ P->hdr.position_word = (ushort)(V & C);
|
- P->hdr.position_word_low = (byte)(char)(V & C);
- P->hdr.position_word_high = (byte)(char)((V & C) >> 8);
+ P->hdr.position_word = (ushort)(V & C);
|
- P->hdr.position_word_low = (char)(V & C);
- P->hdr.position_word_high = (byte)((V & C) >> 8);
+ P->hdr.position_word = (ushort)(V & C);
|
- P->hdr.position_word_low = (byte)(V & C);
- P->hdr.position_word_high = (byte)(char)((V & C) >> 8);
+ P->hdr.position_word = (ushort)(V & C);
|
- P->hdr.position_word_low = (byte)(V | C);
- P->hdr.position_word_high = (byte)((V | C) >> 8);
+ P->hdr.position_word = (ushort)(V | C);
|
- P->hdr.position_word_low = (char)(V | C);
- P->hdr.position_word_high = (char)((V | C) >> 8);
+ P->hdr.position_word = (ushort)(V | C);
|
- P->hdr.position_word_low = (byte)(char)(V | C);
- P->hdr.position_word_high = (byte)((V | C) >> 8);
+ P->hdr.position_word = (ushort)(V | C);
|
- P->hdr.position_word_low = (byte)(char)(V | C);
- P->hdr.position_word_high = (byte)(char)((V | C) >> 8);
+ P->hdr.position_word = (ushort)(V | C);
|
- P->hdr.position_word_low = (char)(V | C);
- P->hdr.position_word_high = (byte)((V | C) >> 8);
+ P->hdr.position_word = (ushort)(V | C);
|
- P->hdr.position_word_low = (byte)(V | C);
- P->hdr.position_word_high = (byte)(char)((V | C) >> 8);
+ P->hdr.position_word = (ushort)(V | C);
|
- P->hdr.position_word_low = (byte)(V ^ C);
- P->hdr.position_word_high = (byte)((V ^ C) >> 8);
+ P->hdr.position_word = (ushort)(V ^ C);
|
- P->hdr.position_word_low = (char)(V ^ C);
- P->hdr.position_word_high = (char)((V ^ C) >> 8);
+ P->hdr.position_word = (ushort)(V ^ C);
|
- P->hdr.position_word_low = (byte)(char)(V ^ C);
- P->hdr.position_word_high = (byte)((V ^ C) >> 8);
+ P->hdr.position_word = (ushort)(V ^ C);
|
- P->hdr.position_word_low = (byte)(char)(V ^ C);
- P->hdr.position_word_high = (byte)(char)((V ^ C) >> 8);
+ P->hdr.position_word = (ushort)(V ^ C);
|
- P->hdr.position_word_low = (char)(V ^ C);
- P->hdr.position_word_high = (byte)((V ^ C) >> 8);
+ P->hdr.position_word = (ushort)(V ^ C);
|
- P->hdr.position_word_low = (byte)(V ^ C);
- P->hdr.position_word_high = (byte)(char)((V ^ C) >> 8);
+ P->hdr.position_word = (ushort)(V ^ C);
)

@store_position_word_3 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.position_word = (ushort)V;
|
- P.hdr.position_word_low = (char)V;
- P.hdr.position_word_high = (char)(V >> 8);
+ P.hdr.position_word = (ushort)V;
|
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.position_word = (ushort)V;
|
- P.hdr.position_word_low = (byte)(char)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.position_word = (ushort)V;
|
- P.hdr.position_word_low = (char)V;
- P.hdr.position_word_high = (byte)(V >> 8);
+ P.hdr.position_word = (ushort)V;
|
- P.hdr.position_word_low = (byte)V;
- P.hdr.position_word_high = (byte)(char)(V >> 8);
+ P.hdr.position_word = (ushort)V;
|
- P.hdr.position_word_low = (byte)(V & C);
- P.hdr.position_word_high = (byte)((V & C) >> 8);
+ P.hdr.position_word = (ushort)(V & C);
|
- P.hdr.position_word_low = (char)(V & C);
- P.hdr.position_word_high = (char)((V & C) >> 8);
+ P.hdr.position_word = (ushort)(V & C);
|
- P.hdr.position_word_low = (byte)(char)(V & C);
- P.hdr.position_word_high = (byte)((V & C) >> 8);
+ P.hdr.position_word = (ushort)(V & C);
|
- P.hdr.position_word_low = (byte)(char)(V & C);
- P.hdr.position_word_high = (byte)(char)((V & C) >> 8);
+ P.hdr.position_word = (ushort)(V & C);
|
- P.hdr.position_word_low = (char)(V & C);
- P.hdr.position_word_high = (byte)((V & C) >> 8);
+ P.hdr.position_word = (ushort)(V & C);
|
- P.hdr.position_word_low = (byte)(V & C);
- P.hdr.position_word_high = (byte)(char)((V & C) >> 8);
+ P.hdr.position_word = (ushort)(V & C);
|
- P.hdr.position_word_low = (byte)(V | C);
- P.hdr.position_word_high = (byte)((V | C) >> 8);
+ P.hdr.position_word = (ushort)(V | C);
|
- P.hdr.position_word_low = (char)(V | C);
- P.hdr.position_word_high = (char)((V | C) >> 8);
+ P.hdr.position_word = (ushort)(V | C);
|
- P.hdr.position_word_low = (byte)(char)(V | C);
- P.hdr.position_word_high = (byte)((V | C) >> 8);
+ P.hdr.position_word = (ushort)(V | C);
|
- P.hdr.position_word_low = (byte)(char)(V | C);
- P.hdr.position_word_high = (byte)(char)((V | C) >> 8);
+ P.hdr.position_word = (ushort)(V | C);
|
- P.hdr.position_word_low = (char)(V | C);
- P.hdr.position_word_high = (byte)((V | C) >> 8);
+ P.hdr.position_word = (ushort)(V | C);
|
- P.hdr.position_word_low = (byte)(V | C);
- P.hdr.position_word_high = (byte)(char)((V | C) >> 8);
+ P.hdr.position_word = (ushort)(V | C);
|
- P.hdr.position_word_low = (byte)(V ^ C);
- P.hdr.position_word_high = (byte)((V ^ C) >> 8);
+ P.hdr.position_word = (ushort)(V ^ C);
|
- P.hdr.position_word_low = (char)(V ^ C);
- P.hdr.position_word_high = (char)((V ^ C) >> 8);
+ P.hdr.position_word = (ushort)(V ^ C);
|
- P.hdr.position_word_low = (byte)(char)(V ^ C);
- P.hdr.position_word_high = (byte)((V ^ C) >> 8);
+ P.hdr.position_word = (ushort)(V ^ C);
|
- P.hdr.position_word_low = (byte)(char)(V ^ C);
- P.hdr.position_word_high = (byte)(char)((V ^ C) >> 8);
+ P.hdr.position_word = (ushort)(V ^ C);
|
- P.hdr.position_word_low = (char)(V ^ C);
- P.hdr.position_word_high = (byte)((V ^ C) >> 8);
+ P.hdr.position_word = (ushort)(V ^ C);
|
- P.hdr.position_word_low = (byte)(V ^ C);
- P.hdr.position_word_high = (byte)(char)((V ^ C) >> 8);
+ P.hdr.position_word = (ushort)(V ^ C);
)

@store_position_word_4 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (char)(V >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(V & C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(V & C);
- ((uw_object_hdr_t *)P)->position_word_high = (char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(V & C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(V & C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(V & C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(V & C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(V | C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(V | C);
- ((uw_object_hdr_t *)P)->position_word_high = (char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(V | C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(V | C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(V | C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(V | C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(V ^ C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(V ^ C);
- ((uw_object_hdr_t *)P)->position_word_high = (char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(V ^ C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(char)(V ^ C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (char)(V ^ C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->position_word_low = (byte)(V ^ C);
- ((uw_object_hdr_t *)P)->position_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->position_word = (ushort)(V ^ C);
)

@store_position_word_5 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.position_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.position_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.position_word = (ushort)(V ^ C);
)

@store_chain_word_0 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->chain_word_low = (byte)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->chain_word = (ushort)V;
|
- P->chain_word_low = (char)V;
- P->chain_word_high = (char)(V >> 8);
+ P->chain_word = (ushort)V;
|
- P->chain_word_low = (byte)(char)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->chain_word = (ushort)V;
|
- P->chain_word_low = (byte)(char)V;
- P->chain_word_high = (byte)(char)(V >> 8);
+ P->chain_word = (ushort)V;
|
- P->chain_word_low = (char)V;
- P->chain_word_high = (byte)(V >> 8);
+ P->chain_word = (ushort)V;
|
- P->chain_word_low = (byte)V;
- P->chain_word_high = (byte)(char)(V >> 8);
+ P->chain_word = (ushort)V;
|
- P->chain_word_low = (byte)(V & C);
- P->chain_word_high = (byte)((V & C) >> 8);
+ P->chain_word = (ushort)(V & C);
|
- P->chain_word_low = (char)(V & C);
- P->chain_word_high = (char)((V & C) >> 8);
+ P->chain_word = (ushort)(V & C);
|
- P->chain_word_low = (byte)(char)(V & C);
- P->chain_word_high = (byte)((V & C) >> 8);
+ P->chain_word = (ushort)(V & C);
|
- P->chain_word_low = (byte)(char)(V & C);
- P->chain_word_high = (byte)(char)((V & C) >> 8);
+ P->chain_word = (ushort)(V & C);
|
- P->chain_word_low = (char)(V & C);
- P->chain_word_high = (byte)((V & C) >> 8);
+ P->chain_word = (ushort)(V & C);
|
- P->chain_word_low = (byte)(V & C);
- P->chain_word_high = (byte)(char)((V & C) >> 8);
+ P->chain_word = (ushort)(V & C);
|
- P->chain_word_low = (byte)(V | C);
- P->chain_word_high = (byte)((V | C) >> 8);
+ P->chain_word = (ushort)(V | C);
|
- P->chain_word_low = (char)(V | C);
- P->chain_word_high = (char)((V | C) >> 8);
+ P->chain_word = (ushort)(V | C);
|
- P->chain_word_low = (byte)(char)(V | C);
- P->chain_word_high = (byte)((V | C) >> 8);
+ P->chain_word = (ushort)(V | C);
|
- P->chain_word_low = (byte)(char)(V | C);
- P->chain_word_high = (byte)(char)((V | C) >> 8);
+ P->chain_word = (ushort)(V | C);
|
- P->chain_word_low = (char)(V | C);
- P->chain_word_high = (byte)((V | C) >> 8);
+ P->chain_word = (ushort)(V | C);
|
- P->chain_word_low = (byte)(V | C);
- P->chain_word_high = (byte)(char)((V | C) >> 8);
+ P->chain_word = (ushort)(V | C);
|
- P->chain_word_low = (byte)(V ^ C);
- P->chain_word_high = (byte)((V ^ C) >> 8);
+ P->chain_word = (ushort)(V ^ C);
|
- P->chain_word_low = (char)(V ^ C);
- P->chain_word_high = (char)((V ^ C) >> 8);
+ P->chain_word = (ushort)(V ^ C);
|
- P->chain_word_low = (byte)(char)(V ^ C);
- P->chain_word_high = (byte)((V ^ C) >> 8);
+ P->chain_word = (ushort)(V ^ C);
|
- P->chain_word_low = (byte)(char)(V ^ C);
- P->chain_word_high = (byte)(char)((V ^ C) >> 8);
+ P->chain_word = (ushort)(V ^ C);
|
- P->chain_word_low = (char)(V ^ C);
- P->chain_word_high = (byte)((V ^ C) >> 8);
+ P->chain_word = (ushort)(V ^ C);
|
- P->chain_word_low = (byte)(V ^ C);
- P->chain_word_high = (byte)(char)((V ^ C) >> 8);
+ P->chain_word = (ushort)(V ^ C);
)

@store_chain_word_1 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.chain_word_low = (byte)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.chain_word = (ushort)V;
|
- P.chain_word_low = (char)V;
- P.chain_word_high = (char)(V >> 8);
+ P.chain_word = (ushort)V;
|
- P.chain_word_low = (byte)(char)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.chain_word = (ushort)V;
|
- P.chain_word_low = (byte)(char)V;
- P.chain_word_high = (byte)(char)(V >> 8);
+ P.chain_word = (ushort)V;
|
- P.chain_word_low = (char)V;
- P.chain_word_high = (byte)(V >> 8);
+ P.chain_word = (ushort)V;
|
- P.chain_word_low = (byte)V;
- P.chain_word_high = (byte)(char)(V >> 8);
+ P.chain_word = (ushort)V;
|
- P.chain_word_low = (byte)(V & C);
- P.chain_word_high = (byte)((V & C) >> 8);
+ P.chain_word = (ushort)(V & C);
|
- P.chain_word_low = (char)(V & C);
- P.chain_word_high = (char)((V & C) >> 8);
+ P.chain_word = (ushort)(V & C);
|
- P.chain_word_low = (byte)(char)(V & C);
- P.chain_word_high = (byte)((V & C) >> 8);
+ P.chain_word = (ushort)(V & C);
|
- P.chain_word_low = (byte)(char)(V & C);
- P.chain_word_high = (byte)(char)((V & C) >> 8);
+ P.chain_word = (ushort)(V & C);
|
- P.chain_word_low = (char)(V & C);
- P.chain_word_high = (byte)((V & C) >> 8);
+ P.chain_word = (ushort)(V & C);
|
- P.chain_word_low = (byte)(V & C);
- P.chain_word_high = (byte)(char)((V & C) >> 8);
+ P.chain_word = (ushort)(V & C);
|
- P.chain_word_low = (byte)(V | C);
- P.chain_word_high = (byte)((V | C) >> 8);
+ P.chain_word = (ushort)(V | C);
|
- P.chain_word_low = (char)(V | C);
- P.chain_word_high = (char)((V | C) >> 8);
+ P.chain_word = (ushort)(V | C);
|
- P.chain_word_low = (byte)(char)(V | C);
- P.chain_word_high = (byte)((V | C) >> 8);
+ P.chain_word = (ushort)(V | C);
|
- P.chain_word_low = (byte)(char)(V | C);
- P.chain_word_high = (byte)(char)((V | C) >> 8);
+ P.chain_word = (ushort)(V | C);
|
- P.chain_word_low = (char)(V | C);
- P.chain_word_high = (byte)((V | C) >> 8);
+ P.chain_word = (ushort)(V | C);
|
- P.chain_word_low = (byte)(V | C);
- P.chain_word_high = (byte)(char)((V | C) >> 8);
+ P.chain_word = (ushort)(V | C);
|
- P.chain_word_low = (byte)(V ^ C);
- P.chain_word_high = (byte)((V ^ C) >> 8);
+ P.chain_word = (ushort)(V ^ C);
|
- P.chain_word_low = (char)(V ^ C);
- P.chain_word_high = (char)((V ^ C) >> 8);
+ P.chain_word = (ushort)(V ^ C);
|
- P.chain_word_low = (byte)(char)(V ^ C);
- P.chain_word_high = (byte)((V ^ C) >> 8);
+ P.chain_word = (ushort)(V ^ C);
|
- P.chain_word_low = (byte)(char)(V ^ C);
- P.chain_word_high = (byte)(char)((V ^ C) >> 8);
+ P.chain_word = (ushort)(V ^ C);
|
- P.chain_word_low = (char)(V ^ C);
- P.chain_word_high = (byte)((V ^ C) >> 8);
+ P.chain_word = (ushort)(V ^ C);
|
- P.chain_word_low = (byte)(V ^ C);
- P.chain_word_high = (byte)(char)((V ^ C) >> 8);
+ P.chain_word = (ushort)(V ^ C);
)

@store_chain_word_2 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.chain_word_low = (byte)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.chain_word = (ushort)V;
|
- P->hdr.chain_word_low = (char)V;
- P->hdr.chain_word_high = (char)(V >> 8);
+ P->hdr.chain_word = (ushort)V;
|
- P->hdr.chain_word_low = (byte)(char)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.chain_word = (ushort)V;
|
- P->hdr.chain_word_low = (byte)(char)V;
- P->hdr.chain_word_high = (byte)(char)(V >> 8);
+ P->hdr.chain_word = (ushort)V;
|
- P->hdr.chain_word_low = (char)V;
- P->hdr.chain_word_high = (byte)(V >> 8);
+ P->hdr.chain_word = (ushort)V;
|
- P->hdr.chain_word_low = (byte)V;
- P->hdr.chain_word_high = (byte)(char)(V >> 8);
+ P->hdr.chain_word = (ushort)V;
|
- P->hdr.chain_word_low = (byte)(V & C);
- P->hdr.chain_word_high = (byte)((V & C) >> 8);
+ P->hdr.chain_word = (ushort)(V & C);
|
- P->hdr.chain_word_low = (char)(V & C);
- P->hdr.chain_word_high = (char)((V & C) >> 8);
+ P->hdr.chain_word = (ushort)(V & C);
|
- P->hdr.chain_word_low = (byte)(char)(V & C);
- P->hdr.chain_word_high = (byte)((V & C) >> 8);
+ P->hdr.chain_word = (ushort)(V & C);
|
- P->hdr.chain_word_low = (byte)(char)(V & C);
- P->hdr.chain_word_high = (byte)(char)((V & C) >> 8);
+ P->hdr.chain_word = (ushort)(V & C);
|
- P->hdr.chain_word_low = (char)(V & C);
- P->hdr.chain_word_high = (byte)((V & C) >> 8);
+ P->hdr.chain_word = (ushort)(V & C);
|
- P->hdr.chain_word_low = (byte)(V & C);
- P->hdr.chain_word_high = (byte)(char)((V & C) >> 8);
+ P->hdr.chain_word = (ushort)(V & C);
|
- P->hdr.chain_word_low = (byte)(V | C);
- P->hdr.chain_word_high = (byte)((V | C) >> 8);
+ P->hdr.chain_word = (ushort)(V | C);
|
- P->hdr.chain_word_low = (char)(V | C);
- P->hdr.chain_word_high = (char)((V | C) >> 8);
+ P->hdr.chain_word = (ushort)(V | C);
|
- P->hdr.chain_word_low = (byte)(char)(V | C);
- P->hdr.chain_word_high = (byte)((V | C) >> 8);
+ P->hdr.chain_word = (ushort)(V | C);
|
- P->hdr.chain_word_low = (byte)(char)(V | C);
- P->hdr.chain_word_high = (byte)(char)((V | C) >> 8);
+ P->hdr.chain_word = (ushort)(V | C);
|
- P->hdr.chain_word_low = (char)(V | C);
- P->hdr.chain_word_high = (byte)((V | C) >> 8);
+ P->hdr.chain_word = (ushort)(V | C);
|
- P->hdr.chain_word_low = (byte)(V | C);
- P->hdr.chain_word_high = (byte)(char)((V | C) >> 8);
+ P->hdr.chain_word = (ushort)(V | C);
|
- P->hdr.chain_word_low = (byte)(V ^ C);
- P->hdr.chain_word_high = (byte)((V ^ C) >> 8);
+ P->hdr.chain_word = (ushort)(V ^ C);
|
- P->hdr.chain_word_low = (char)(V ^ C);
- P->hdr.chain_word_high = (char)((V ^ C) >> 8);
+ P->hdr.chain_word = (ushort)(V ^ C);
|
- P->hdr.chain_word_low = (byte)(char)(V ^ C);
- P->hdr.chain_word_high = (byte)((V ^ C) >> 8);
+ P->hdr.chain_word = (ushort)(V ^ C);
|
- P->hdr.chain_word_low = (byte)(char)(V ^ C);
- P->hdr.chain_word_high = (byte)(char)((V ^ C) >> 8);
+ P->hdr.chain_word = (ushort)(V ^ C);
|
- P->hdr.chain_word_low = (char)(V ^ C);
- P->hdr.chain_word_high = (byte)((V ^ C) >> 8);
+ P->hdr.chain_word = (ushort)(V ^ C);
|
- P->hdr.chain_word_low = (byte)(V ^ C);
- P->hdr.chain_word_high = (byte)(char)((V ^ C) >> 8);
+ P->hdr.chain_word = (ushort)(V ^ C);
)

@store_chain_word_3 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.chain_word_low = (byte)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.chain_word = (ushort)V;
|
- P.hdr.chain_word_low = (char)V;
- P.hdr.chain_word_high = (char)(V >> 8);
+ P.hdr.chain_word = (ushort)V;
|
- P.hdr.chain_word_low = (byte)(char)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.chain_word = (ushort)V;
|
- P.hdr.chain_word_low = (byte)(char)V;
- P.hdr.chain_word_high = (byte)(char)(V >> 8);
+ P.hdr.chain_word = (ushort)V;
|
- P.hdr.chain_word_low = (char)V;
- P.hdr.chain_word_high = (byte)(V >> 8);
+ P.hdr.chain_word = (ushort)V;
|
- P.hdr.chain_word_low = (byte)V;
- P.hdr.chain_word_high = (byte)(char)(V >> 8);
+ P.hdr.chain_word = (ushort)V;
|
- P.hdr.chain_word_low = (byte)(V & C);
- P.hdr.chain_word_high = (byte)((V & C) >> 8);
+ P.hdr.chain_word = (ushort)(V & C);
|
- P.hdr.chain_word_low = (char)(V & C);
- P.hdr.chain_word_high = (char)((V & C) >> 8);
+ P.hdr.chain_word = (ushort)(V & C);
|
- P.hdr.chain_word_low = (byte)(char)(V & C);
- P.hdr.chain_word_high = (byte)((V & C) >> 8);
+ P.hdr.chain_word = (ushort)(V & C);
|
- P.hdr.chain_word_low = (byte)(char)(V & C);
- P.hdr.chain_word_high = (byte)(char)((V & C) >> 8);
+ P.hdr.chain_word = (ushort)(V & C);
|
- P.hdr.chain_word_low = (char)(V & C);
- P.hdr.chain_word_high = (byte)((V & C) >> 8);
+ P.hdr.chain_word = (ushort)(V & C);
|
- P.hdr.chain_word_low = (byte)(V & C);
- P.hdr.chain_word_high = (byte)(char)((V & C) >> 8);
+ P.hdr.chain_word = (ushort)(V & C);
|
- P.hdr.chain_word_low = (byte)(V | C);
- P.hdr.chain_word_high = (byte)((V | C) >> 8);
+ P.hdr.chain_word = (ushort)(V | C);
|
- P.hdr.chain_word_low = (char)(V | C);
- P.hdr.chain_word_high = (char)((V | C) >> 8);
+ P.hdr.chain_word = (ushort)(V | C);
|
- P.hdr.chain_word_low = (byte)(char)(V | C);
- P.hdr.chain_word_high = (byte)((V | C) >> 8);
+ P.hdr.chain_word = (ushort)(V | C);
|
- P.hdr.chain_word_low = (byte)(char)(V | C);
- P.hdr.chain_word_high = (byte)(char)((V | C) >> 8);
+ P.hdr.chain_word = (ushort)(V | C);
|
- P.hdr.chain_word_low = (char)(V | C);
- P.hdr.chain_word_high = (byte)((V | C) >> 8);
+ P.hdr.chain_word = (ushort)(V | C);
|
- P.hdr.chain_word_low = (byte)(V | C);
- P.hdr.chain_word_high = (byte)(char)((V | C) >> 8);
+ P.hdr.chain_word = (ushort)(V | C);
|
- P.hdr.chain_word_low = (byte)(V ^ C);
- P.hdr.chain_word_high = (byte)((V ^ C) >> 8);
+ P.hdr.chain_word = (ushort)(V ^ C);
|
- P.hdr.chain_word_low = (char)(V ^ C);
- P.hdr.chain_word_high = (char)((V ^ C) >> 8);
+ P.hdr.chain_word = (ushort)(V ^ C);
|
- P.hdr.chain_word_low = (byte)(char)(V ^ C);
- P.hdr.chain_word_high = (byte)((V ^ C) >> 8);
+ P.hdr.chain_word = (ushort)(V ^ C);
|
- P.hdr.chain_word_low = (byte)(char)(V ^ C);
- P.hdr.chain_word_high = (byte)(char)((V ^ C) >> 8);
+ P.hdr.chain_word = (ushort)(V ^ C);
|
- P.hdr.chain_word_low = (char)(V ^ C);
- P.hdr.chain_word_high = (byte)((V ^ C) >> 8);
+ P.hdr.chain_word = (ushort)(V ^ C);
|
- P.hdr.chain_word_low = (byte)(V ^ C);
- P.hdr.chain_word_high = (byte)(char)((V ^ C) >> 8);
+ P.hdr.chain_word = (ushort)(V ^ C);
)

@store_chain_word_4 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (char)(V >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(V & C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(V & C);
- ((uw_object_hdr_t *)P)->chain_word_high = (char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(V & C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(V & C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(V & C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(V & C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(V | C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(V | C);
- ((uw_object_hdr_t *)P)->chain_word_high = (char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(V | C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(V | C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(V | C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(V | C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(V ^ C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(V ^ C);
- ((uw_object_hdr_t *)P)->chain_word_high = (char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(V ^ C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(char)(V ^ C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (char)(V ^ C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->chain_word_low = (byte)(V ^ C);
- ((uw_object_hdr_t *)P)->chain_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->chain_word = (ushort)(V ^ C);
)

@store_chain_word_5 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.chain_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.chain_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.chain_word = (ushort)(V ^ C);
)

@store_link_word_0 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->link_word_low = (byte)V;
- P->link_word_high = (byte)(V >> 8);
+ P->link_word = (ushort)V;
|
- P->link_word_low = (char)V;
- P->link_word_high = (char)(V >> 8);
+ P->link_word = (ushort)V;
|
- P->link_word_low = (byte)(char)V;
- P->link_word_high = (byte)(V >> 8);
+ P->link_word = (ushort)V;
|
- P->link_word_low = (byte)(char)V;
- P->link_word_high = (byte)(char)(V >> 8);
+ P->link_word = (ushort)V;
|
- P->link_word_low = (char)V;
- P->link_word_high = (byte)(V >> 8);
+ P->link_word = (ushort)V;
|
- P->link_word_low = (byte)V;
- P->link_word_high = (byte)(char)(V >> 8);
+ P->link_word = (ushort)V;
|
- P->link_word_low = (byte)(V & C);
- P->link_word_high = (byte)((V & C) >> 8);
+ P->link_word = (ushort)(V & C);
|
- P->link_word_low = (char)(V & C);
- P->link_word_high = (char)((V & C) >> 8);
+ P->link_word = (ushort)(V & C);
|
- P->link_word_low = (byte)(char)(V & C);
- P->link_word_high = (byte)((V & C) >> 8);
+ P->link_word = (ushort)(V & C);
|
- P->link_word_low = (byte)(char)(V & C);
- P->link_word_high = (byte)(char)((V & C) >> 8);
+ P->link_word = (ushort)(V & C);
|
- P->link_word_low = (char)(V & C);
- P->link_word_high = (byte)((V & C) >> 8);
+ P->link_word = (ushort)(V & C);
|
- P->link_word_low = (byte)(V & C);
- P->link_word_high = (byte)(char)((V & C) >> 8);
+ P->link_word = (ushort)(V & C);
|
- P->link_word_low = (byte)(V | C);
- P->link_word_high = (byte)((V | C) >> 8);
+ P->link_word = (ushort)(V | C);
|
- P->link_word_low = (char)(V | C);
- P->link_word_high = (char)((V | C) >> 8);
+ P->link_word = (ushort)(V | C);
|
- P->link_word_low = (byte)(char)(V | C);
- P->link_word_high = (byte)((V | C) >> 8);
+ P->link_word = (ushort)(V | C);
|
- P->link_word_low = (byte)(char)(V | C);
- P->link_word_high = (byte)(char)((V | C) >> 8);
+ P->link_word = (ushort)(V | C);
|
- P->link_word_low = (char)(V | C);
- P->link_word_high = (byte)((V | C) >> 8);
+ P->link_word = (ushort)(V | C);
|
- P->link_word_low = (byte)(V | C);
- P->link_word_high = (byte)(char)((V | C) >> 8);
+ P->link_word = (ushort)(V | C);
|
- P->link_word_low = (byte)(V ^ C);
- P->link_word_high = (byte)((V ^ C) >> 8);
+ P->link_word = (ushort)(V ^ C);
|
- P->link_word_low = (char)(V ^ C);
- P->link_word_high = (char)((V ^ C) >> 8);
+ P->link_word = (ushort)(V ^ C);
|
- P->link_word_low = (byte)(char)(V ^ C);
- P->link_word_high = (byte)((V ^ C) >> 8);
+ P->link_word = (ushort)(V ^ C);
|
- P->link_word_low = (byte)(char)(V ^ C);
- P->link_word_high = (byte)(char)((V ^ C) >> 8);
+ P->link_word = (ushort)(V ^ C);
|
- P->link_word_low = (char)(V ^ C);
- P->link_word_high = (byte)((V ^ C) >> 8);
+ P->link_word = (ushort)(V ^ C);
|
- P->link_word_low = (byte)(V ^ C);
- P->link_word_high = (byte)(char)((V ^ C) >> 8);
+ P->link_word = (ushort)(V ^ C);
)

@store_link_word_1 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.link_word_low = (byte)V;
- P.link_word_high = (byte)(V >> 8);
+ P.link_word = (ushort)V;
|
- P.link_word_low = (char)V;
- P.link_word_high = (char)(V >> 8);
+ P.link_word = (ushort)V;
|
- P.link_word_low = (byte)(char)V;
- P.link_word_high = (byte)(V >> 8);
+ P.link_word = (ushort)V;
|
- P.link_word_low = (byte)(char)V;
- P.link_word_high = (byte)(char)(V >> 8);
+ P.link_word = (ushort)V;
|
- P.link_word_low = (char)V;
- P.link_word_high = (byte)(V >> 8);
+ P.link_word = (ushort)V;
|
- P.link_word_low = (byte)V;
- P.link_word_high = (byte)(char)(V >> 8);
+ P.link_word = (ushort)V;
|
- P.link_word_low = (byte)(V & C);
- P.link_word_high = (byte)((V & C) >> 8);
+ P.link_word = (ushort)(V & C);
|
- P.link_word_low = (char)(V & C);
- P.link_word_high = (char)((V & C) >> 8);
+ P.link_word = (ushort)(V & C);
|
- P.link_word_low = (byte)(char)(V & C);
- P.link_word_high = (byte)((V & C) >> 8);
+ P.link_word = (ushort)(V & C);
|
- P.link_word_low = (byte)(char)(V & C);
- P.link_word_high = (byte)(char)((V & C) >> 8);
+ P.link_word = (ushort)(V & C);
|
- P.link_word_low = (char)(V & C);
- P.link_word_high = (byte)((V & C) >> 8);
+ P.link_word = (ushort)(V & C);
|
- P.link_word_low = (byte)(V & C);
- P.link_word_high = (byte)(char)((V & C) >> 8);
+ P.link_word = (ushort)(V & C);
|
- P.link_word_low = (byte)(V | C);
- P.link_word_high = (byte)((V | C) >> 8);
+ P.link_word = (ushort)(V | C);
|
- P.link_word_low = (char)(V | C);
- P.link_word_high = (char)((V | C) >> 8);
+ P.link_word = (ushort)(V | C);
|
- P.link_word_low = (byte)(char)(V | C);
- P.link_word_high = (byte)((V | C) >> 8);
+ P.link_word = (ushort)(V | C);
|
- P.link_word_low = (byte)(char)(V | C);
- P.link_word_high = (byte)(char)((V | C) >> 8);
+ P.link_word = (ushort)(V | C);
|
- P.link_word_low = (char)(V | C);
- P.link_word_high = (byte)((V | C) >> 8);
+ P.link_word = (ushort)(V | C);
|
- P.link_word_low = (byte)(V | C);
- P.link_word_high = (byte)(char)((V | C) >> 8);
+ P.link_word = (ushort)(V | C);
|
- P.link_word_low = (byte)(V ^ C);
- P.link_word_high = (byte)((V ^ C) >> 8);
+ P.link_word = (ushort)(V ^ C);
|
- P.link_word_low = (char)(V ^ C);
- P.link_word_high = (char)((V ^ C) >> 8);
+ P.link_word = (ushort)(V ^ C);
|
- P.link_word_low = (byte)(char)(V ^ C);
- P.link_word_high = (byte)((V ^ C) >> 8);
+ P.link_word = (ushort)(V ^ C);
|
- P.link_word_low = (byte)(char)(V ^ C);
- P.link_word_high = (byte)(char)((V ^ C) >> 8);
+ P.link_word = (ushort)(V ^ C);
|
- P.link_word_low = (char)(V ^ C);
- P.link_word_high = (byte)((V ^ C) >> 8);
+ P.link_word = (ushort)(V ^ C);
|
- P.link_word_low = (byte)(V ^ C);
- P.link_word_high = (byte)(char)((V ^ C) >> 8);
+ P.link_word = (ushort)(V ^ C);
)

@store_link_word_2 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->hdr.link_word_low = (byte)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.link_word = (ushort)V;
|
- P->hdr.link_word_low = (char)V;
- P->hdr.link_word_high = (char)(V >> 8);
+ P->hdr.link_word = (ushort)V;
|
- P->hdr.link_word_low = (byte)(char)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.link_word = (ushort)V;
|
- P->hdr.link_word_low = (byte)(char)V;
- P->hdr.link_word_high = (byte)(char)(V >> 8);
+ P->hdr.link_word = (ushort)V;
|
- P->hdr.link_word_low = (char)V;
- P->hdr.link_word_high = (byte)(V >> 8);
+ P->hdr.link_word = (ushort)V;
|
- P->hdr.link_word_low = (byte)V;
- P->hdr.link_word_high = (byte)(char)(V >> 8);
+ P->hdr.link_word = (ushort)V;
|
- P->hdr.link_word_low = (byte)(V & C);
- P->hdr.link_word_high = (byte)((V & C) >> 8);
+ P->hdr.link_word = (ushort)(V & C);
|
- P->hdr.link_word_low = (char)(V & C);
- P->hdr.link_word_high = (char)((V & C) >> 8);
+ P->hdr.link_word = (ushort)(V & C);
|
- P->hdr.link_word_low = (byte)(char)(V & C);
- P->hdr.link_word_high = (byte)((V & C) >> 8);
+ P->hdr.link_word = (ushort)(V & C);
|
- P->hdr.link_word_low = (byte)(char)(V & C);
- P->hdr.link_word_high = (byte)(char)((V & C) >> 8);
+ P->hdr.link_word = (ushort)(V & C);
|
- P->hdr.link_word_low = (char)(V & C);
- P->hdr.link_word_high = (byte)((V & C) >> 8);
+ P->hdr.link_word = (ushort)(V & C);
|
- P->hdr.link_word_low = (byte)(V & C);
- P->hdr.link_word_high = (byte)(char)((V & C) >> 8);
+ P->hdr.link_word = (ushort)(V & C);
|
- P->hdr.link_word_low = (byte)(V | C);
- P->hdr.link_word_high = (byte)((V | C) >> 8);
+ P->hdr.link_word = (ushort)(V | C);
|
- P->hdr.link_word_low = (char)(V | C);
- P->hdr.link_word_high = (char)((V | C) >> 8);
+ P->hdr.link_word = (ushort)(V | C);
|
- P->hdr.link_word_low = (byte)(char)(V | C);
- P->hdr.link_word_high = (byte)((V | C) >> 8);
+ P->hdr.link_word = (ushort)(V | C);
|
- P->hdr.link_word_low = (byte)(char)(V | C);
- P->hdr.link_word_high = (byte)(char)((V | C) >> 8);
+ P->hdr.link_word = (ushort)(V | C);
|
- P->hdr.link_word_low = (char)(V | C);
- P->hdr.link_word_high = (byte)((V | C) >> 8);
+ P->hdr.link_word = (ushort)(V | C);
|
- P->hdr.link_word_low = (byte)(V | C);
- P->hdr.link_word_high = (byte)(char)((V | C) >> 8);
+ P->hdr.link_word = (ushort)(V | C);
|
- P->hdr.link_word_low = (byte)(V ^ C);
- P->hdr.link_word_high = (byte)((V ^ C) >> 8);
+ P->hdr.link_word = (ushort)(V ^ C);
|
- P->hdr.link_word_low = (char)(V ^ C);
- P->hdr.link_word_high = (char)((V ^ C) >> 8);
+ P->hdr.link_word = (ushort)(V ^ C);
|
- P->hdr.link_word_low = (byte)(char)(V ^ C);
- P->hdr.link_word_high = (byte)((V ^ C) >> 8);
+ P->hdr.link_word = (ushort)(V ^ C);
|
- P->hdr.link_word_low = (byte)(char)(V ^ C);
- P->hdr.link_word_high = (byte)(char)((V ^ C) >> 8);
+ P->hdr.link_word = (ushort)(V ^ C);
|
- P->hdr.link_word_low = (char)(V ^ C);
- P->hdr.link_word_high = (byte)((V ^ C) >> 8);
+ P->hdr.link_word = (ushort)(V ^ C);
|
- P->hdr.link_word_low = (byte)(V ^ C);
- P->hdr.link_word_high = (byte)(char)((V ^ C) >> 8);
+ P->hdr.link_word = (ushort)(V ^ C);
)

@store_link_word_3 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.hdr.link_word_low = (byte)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.link_word = (ushort)V;
|
- P.hdr.link_word_low = (char)V;
- P.hdr.link_word_high = (char)(V >> 8);
+ P.hdr.link_word = (ushort)V;
|
- P.hdr.link_word_low = (byte)(char)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.link_word = (ushort)V;
|
- P.hdr.link_word_low = (byte)(char)V;
- P.hdr.link_word_high = (byte)(char)(V >> 8);
+ P.hdr.link_word = (ushort)V;
|
- P.hdr.link_word_low = (char)V;
- P.hdr.link_word_high = (byte)(V >> 8);
+ P.hdr.link_word = (ushort)V;
|
- P.hdr.link_word_low = (byte)V;
- P.hdr.link_word_high = (byte)(char)(V >> 8);
+ P.hdr.link_word = (ushort)V;
|
- P.hdr.link_word_low = (byte)(V & C);
- P.hdr.link_word_high = (byte)((V & C) >> 8);
+ P.hdr.link_word = (ushort)(V & C);
|
- P.hdr.link_word_low = (char)(V & C);
- P.hdr.link_word_high = (char)((V & C) >> 8);
+ P.hdr.link_word = (ushort)(V & C);
|
- P.hdr.link_word_low = (byte)(char)(V & C);
- P.hdr.link_word_high = (byte)((V & C) >> 8);
+ P.hdr.link_word = (ushort)(V & C);
|
- P.hdr.link_word_low = (byte)(char)(V & C);
- P.hdr.link_word_high = (byte)(char)((V & C) >> 8);
+ P.hdr.link_word = (ushort)(V & C);
|
- P.hdr.link_word_low = (char)(V & C);
- P.hdr.link_word_high = (byte)((V & C) >> 8);
+ P.hdr.link_word = (ushort)(V & C);
|
- P.hdr.link_word_low = (byte)(V & C);
- P.hdr.link_word_high = (byte)(char)((V & C) >> 8);
+ P.hdr.link_word = (ushort)(V & C);
|
- P.hdr.link_word_low = (byte)(V | C);
- P.hdr.link_word_high = (byte)((V | C) >> 8);
+ P.hdr.link_word = (ushort)(V | C);
|
- P.hdr.link_word_low = (char)(V | C);
- P.hdr.link_word_high = (char)((V | C) >> 8);
+ P.hdr.link_word = (ushort)(V | C);
|
- P.hdr.link_word_low = (byte)(char)(V | C);
- P.hdr.link_word_high = (byte)((V | C) >> 8);
+ P.hdr.link_word = (ushort)(V | C);
|
- P.hdr.link_word_low = (byte)(char)(V | C);
- P.hdr.link_word_high = (byte)(char)((V | C) >> 8);
+ P.hdr.link_word = (ushort)(V | C);
|
- P.hdr.link_word_low = (char)(V | C);
- P.hdr.link_word_high = (byte)((V | C) >> 8);
+ P.hdr.link_word = (ushort)(V | C);
|
- P.hdr.link_word_low = (byte)(V | C);
- P.hdr.link_word_high = (byte)(char)((V | C) >> 8);
+ P.hdr.link_word = (ushort)(V | C);
|
- P.hdr.link_word_low = (byte)(V ^ C);
- P.hdr.link_word_high = (byte)((V ^ C) >> 8);
+ P.hdr.link_word = (ushort)(V ^ C);
|
- P.hdr.link_word_low = (char)(V ^ C);
- P.hdr.link_word_high = (char)((V ^ C) >> 8);
+ P.hdr.link_word = (ushort)(V ^ C);
|
- P.hdr.link_word_low = (byte)(char)(V ^ C);
- P.hdr.link_word_high = (byte)((V ^ C) >> 8);
+ P.hdr.link_word = (ushort)(V ^ C);
|
- P.hdr.link_word_low = (byte)(char)(V ^ C);
- P.hdr.link_word_high = (byte)(char)((V ^ C) >> 8);
+ P.hdr.link_word = (ushort)(V ^ C);
|
- P.hdr.link_word_low = (char)(V ^ C);
- P.hdr.link_word_high = (byte)((V ^ C) >> 8);
+ P.hdr.link_word = (ushort)(V ^ C);
|
- P.hdr.link_word_low = (byte)(V ^ C);
- P.hdr.link_word_high = (byte)(char)((V ^ C) >> 8);
+ P.hdr.link_word = (ushort)(V ^ C);
)

@store_link_word_4 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_hdr_t *)P)->link_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (char)(V >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(V >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)V;
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)(V >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)V;
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(V & C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(V & C);
- ((uw_object_hdr_t *)P)->link_word_high = (char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(V & C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(V & C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(V & C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(V & C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V & C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(V | C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(V | C);
- ((uw_object_hdr_t *)P)->link_word_high = (char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(V | C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(V | C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(V | C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(V | C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V | C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(V ^ C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(V ^ C);
- ((uw_object_hdr_t *)P)->link_word_high = (char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(V ^ C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(char)(V ^ C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (char)(V ^ C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V ^ C);
|
- ((uw_object_hdr_t *)P)->link_word_low = (byte)(V ^ C);
- ((uw_object_hdr_t *)P)->link_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_object_hdr_t *)P)->link_word = (ushort)(V ^ C);
)

@store_link_word_5 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->hdr.link_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->hdr.link_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->hdr.link_word = (ushort)(V ^ C);
)

@store_goal_word_0 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->goal_word = (ushort)V;
|
- P->goal_word_low = (char)V;
- P->goal_word_high = (char)(V >> 8);
+ P->goal_word = (ushort)V;
|
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->goal_word = (ushort)V;
|
- P->goal_word_low = (byte)(char)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->goal_word = (ushort)V;
|
- P->goal_word_low = (char)V;
- P->goal_word_high = (byte)(V >> 8);
+ P->goal_word = (ushort)V;
|
- P->goal_word_low = (byte)V;
- P->goal_word_high = (byte)(char)(V >> 8);
+ P->goal_word = (ushort)V;
|
- P->goal_word_low = (byte)(V & C);
- P->goal_word_high = (byte)((V & C) >> 8);
+ P->goal_word = (ushort)(V & C);
|
- P->goal_word_low = (char)(V & C);
- P->goal_word_high = (char)((V & C) >> 8);
+ P->goal_word = (ushort)(V & C);
|
- P->goal_word_low = (byte)(char)(V & C);
- P->goal_word_high = (byte)((V & C) >> 8);
+ P->goal_word = (ushort)(V & C);
|
- P->goal_word_low = (byte)(char)(V & C);
- P->goal_word_high = (byte)(char)((V & C) >> 8);
+ P->goal_word = (ushort)(V & C);
|
- P->goal_word_low = (char)(V & C);
- P->goal_word_high = (byte)((V & C) >> 8);
+ P->goal_word = (ushort)(V & C);
|
- P->goal_word_low = (byte)(V & C);
- P->goal_word_high = (byte)(char)((V & C) >> 8);
+ P->goal_word = (ushort)(V & C);
|
- P->goal_word_low = (byte)(V | C);
- P->goal_word_high = (byte)((V | C) >> 8);
+ P->goal_word = (ushort)(V | C);
|
- P->goal_word_low = (char)(V | C);
- P->goal_word_high = (char)((V | C) >> 8);
+ P->goal_word = (ushort)(V | C);
|
- P->goal_word_low = (byte)(char)(V | C);
- P->goal_word_high = (byte)((V | C) >> 8);
+ P->goal_word = (ushort)(V | C);
|
- P->goal_word_low = (byte)(char)(V | C);
- P->goal_word_high = (byte)(char)((V | C) >> 8);
+ P->goal_word = (ushort)(V | C);
|
- P->goal_word_low = (char)(V | C);
- P->goal_word_high = (byte)((V | C) >> 8);
+ P->goal_word = (ushort)(V | C);
|
- P->goal_word_low = (byte)(V | C);
- P->goal_word_high = (byte)(char)((V | C) >> 8);
+ P->goal_word = (ushort)(V | C);
|
- P->goal_word_low = (byte)(V ^ C);
- P->goal_word_high = (byte)((V ^ C) >> 8);
+ P->goal_word = (ushort)(V ^ C);
|
- P->goal_word_low = (char)(V ^ C);
- P->goal_word_high = (char)((V ^ C) >> 8);
+ P->goal_word = (ushort)(V ^ C);
|
- P->goal_word_low = (byte)(char)(V ^ C);
- P->goal_word_high = (byte)((V ^ C) >> 8);
+ P->goal_word = (ushort)(V ^ C);
|
- P->goal_word_low = (byte)(char)(V ^ C);
- P->goal_word_high = (byte)(char)((V ^ C) >> 8);
+ P->goal_word = (ushort)(V ^ C);
|
- P->goal_word_low = (char)(V ^ C);
- P->goal_word_high = (byte)((V ^ C) >> 8);
+ P->goal_word = (ushort)(V ^ C);
|
- P->goal_word_low = (byte)(V ^ C);
- P->goal_word_high = (byte)(char)((V ^ C) >> 8);
+ P->goal_word = (ushort)(V ^ C);
)

@store_goal_word_1 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.goal_word = (ushort)V;
|
- P.goal_word_low = (char)V;
- P.goal_word_high = (char)(V >> 8);
+ P.goal_word = (ushort)V;
|
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.goal_word = (ushort)V;
|
- P.goal_word_low = (byte)(char)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.goal_word = (ushort)V;
|
- P.goal_word_low = (char)V;
- P.goal_word_high = (byte)(V >> 8);
+ P.goal_word = (ushort)V;
|
- P.goal_word_low = (byte)V;
- P.goal_word_high = (byte)(char)(V >> 8);
+ P.goal_word = (ushort)V;
|
- P.goal_word_low = (byte)(V & C);
- P.goal_word_high = (byte)((V & C) >> 8);
+ P.goal_word = (ushort)(V & C);
|
- P.goal_word_low = (char)(V & C);
- P.goal_word_high = (char)((V & C) >> 8);
+ P.goal_word = (ushort)(V & C);
|
- P.goal_word_low = (byte)(char)(V & C);
- P.goal_word_high = (byte)((V & C) >> 8);
+ P.goal_word = (ushort)(V & C);
|
- P.goal_word_low = (byte)(char)(V & C);
- P.goal_word_high = (byte)(char)((V & C) >> 8);
+ P.goal_word = (ushort)(V & C);
|
- P.goal_word_low = (char)(V & C);
- P.goal_word_high = (byte)((V & C) >> 8);
+ P.goal_word = (ushort)(V & C);
|
- P.goal_word_low = (byte)(V & C);
- P.goal_word_high = (byte)(char)((V & C) >> 8);
+ P.goal_word = (ushort)(V & C);
|
- P.goal_word_low = (byte)(V | C);
- P.goal_word_high = (byte)((V | C) >> 8);
+ P.goal_word = (ushort)(V | C);
|
- P.goal_word_low = (char)(V | C);
- P.goal_word_high = (char)((V | C) >> 8);
+ P.goal_word = (ushort)(V | C);
|
- P.goal_word_low = (byte)(char)(V | C);
- P.goal_word_high = (byte)((V | C) >> 8);
+ P.goal_word = (ushort)(V | C);
|
- P.goal_word_low = (byte)(char)(V | C);
- P.goal_word_high = (byte)(char)((V | C) >> 8);
+ P.goal_word = (ushort)(V | C);
|
- P.goal_word_low = (char)(V | C);
- P.goal_word_high = (byte)((V | C) >> 8);
+ P.goal_word = (ushort)(V | C);
|
- P.goal_word_low = (byte)(V | C);
- P.goal_word_high = (byte)(char)((V | C) >> 8);
+ P.goal_word = (ushort)(V | C);
|
- P.goal_word_low = (byte)(V ^ C);
- P.goal_word_high = (byte)((V ^ C) >> 8);
+ P.goal_word = (ushort)(V ^ C);
|
- P.goal_word_low = (char)(V ^ C);
- P.goal_word_high = (char)((V ^ C) >> 8);
+ P.goal_word = (ushort)(V ^ C);
|
- P.goal_word_low = (byte)(char)(V ^ C);
- P.goal_word_high = (byte)((V ^ C) >> 8);
+ P.goal_word = (ushort)(V ^ C);
|
- P.goal_word_low = (byte)(char)(V ^ C);
- P.goal_word_high = (byte)(char)((V ^ C) >> 8);
+ P.goal_word = (ushort)(V ^ C);
|
- P.goal_word_low = (char)(V ^ C);
- P.goal_word_high = (byte)((V ^ C) >> 8);
+ P.goal_word = (ushort)(V ^ C);
|
- P.goal_word_low = (byte)(V ^ C);
- P.goal_word_high = (byte)(char)((V ^ C) >> 8);
+ P.goal_word = (ushort)(V ^ C);
)

@store_goal_word_2 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (char)(V >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->goal_word_high = (char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->goal_word_high = (char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->goal_word_high = (char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->goal_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->goal_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->goal_word = (ushort)(V ^ C);
)

@store_status_word_0 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(V >> 8);
+ P->status_word = (ushort)V;
|
- P->status_word_low = (char)V;
- P->status_word_high = (char)(V >> 8);
+ P->status_word = (ushort)V;
|
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(V >> 8);
+ P->status_word = (ushort)V;
|
- P->status_word_low = (byte)(char)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->status_word = (ushort)V;
|
- P->status_word_low = (char)V;
- P->status_word_high = (byte)(V >> 8);
+ P->status_word = (ushort)V;
|
- P->status_word_low = (byte)V;
- P->status_word_high = (byte)(char)(V >> 8);
+ P->status_word = (ushort)V;
|
- P->status_word_low = (byte)(V & C);
- P->status_word_high = (byte)((V & C) >> 8);
+ P->status_word = (ushort)(V & C);
|
- P->status_word_low = (char)(V & C);
- P->status_word_high = (char)((V & C) >> 8);
+ P->status_word = (ushort)(V & C);
|
- P->status_word_low = (byte)(char)(V & C);
- P->status_word_high = (byte)((V & C) >> 8);
+ P->status_word = (ushort)(V & C);
|
- P->status_word_low = (byte)(char)(V & C);
- P->status_word_high = (byte)(char)((V & C) >> 8);
+ P->status_word = (ushort)(V & C);
|
- P->status_word_low = (char)(V & C);
- P->status_word_high = (byte)((V & C) >> 8);
+ P->status_word = (ushort)(V & C);
|
- P->status_word_low = (byte)(V & C);
- P->status_word_high = (byte)(char)((V & C) >> 8);
+ P->status_word = (ushort)(V & C);
|
- P->status_word_low = (byte)(V | C);
- P->status_word_high = (byte)((V | C) >> 8);
+ P->status_word = (ushort)(V | C);
|
- P->status_word_low = (char)(V | C);
- P->status_word_high = (char)((V | C) >> 8);
+ P->status_word = (ushort)(V | C);
|
- P->status_word_low = (byte)(char)(V | C);
- P->status_word_high = (byte)((V | C) >> 8);
+ P->status_word = (ushort)(V | C);
|
- P->status_word_low = (byte)(char)(V | C);
- P->status_word_high = (byte)(char)((V | C) >> 8);
+ P->status_word = (ushort)(V | C);
|
- P->status_word_low = (char)(V | C);
- P->status_word_high = (byte)((V | C) >> 8);
+ P->status_word = (ushort)(V | C);
|
- P->status_word_low = (byte)(V | C);
- P->status_word_high = (byte)(char)((V | C) >> 8);
+ P->status_word = (ushort)(V | C);
|
- P->status_word_low = (byte)(V ^ C);
- P->status_word_high = (byte)((V ^ C) >> 8);
+ P->status_word = (ushort)(V ^ C);
|
- P->status_word_low = (char)(V ^ C);
- P->status_word_high = (char)((V ^ C) >> 8);
+ P->status_word = (ushort)(V ^ C);
|
- P->status_word_low = (byte)(char)(V ^ C);
- P->status_word_high = (byte)((V ^ C) >> 8);
+ P->status_word = (ushort)(V ^ C);
|
- P->status_word_low = (byte)(char)(V ^ C);
- P->status_word_high = (byte)(char)((V ^ C) >> 8);
+ P->status_word = (ushort)(V ^ C);
|
- P->status_word_low = (char)(V ^ C);
- P->status_word_high = (byte)((V ^ C) >> 8);
+ P->status_word = (ushort)(V ^ C);
|
- P->status_word_low = (byte)(V ^ C);
- P->status_word_high = (byte)(char)((V ^ C) >> 8);
+ P->status_word = (ushort)(V ^ C);
)

@store_status_word_1 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(V >> 8);
+ P.status_word = (ushort)V;
|
- P.status_word_low = (char)V;
- P.status_word_high = (char)(V >> 8);
+ P.status_word = (ushort)V;
|
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(V >> 8);
+ P.status_word = (ushort)V;
|
- P.status_word_low = (byte)(char)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.status_word = (ushort)V;
|
- P.status_word_low = (char)V;
- P.status_word_high = (byte)(V >> 8);
+ P.status_word = (ushort)V;
|
- P.status_word_low = (byte)V;
- P.status_word_high = (byte)(char)(V >> 8);
+ P.status_word = (ushort)V;
|
- P.status_word_low = (byte)(V & C);
- P.status_word_high = (byte)((V & C) >> 8);
+ P.status_word = (ushort)(V & C);
|
- P.status_word_low = (char)(V & C);
- P.status_word_high = (char)((V & C) >> 8);
+ P.status_word = (ushort)(V & C);
|
- P.status_word_low = (byte)(char)(V & C);
- P.status_word_high = (byte)((V & C) >> 8);
+ P.status_word = (ushort)(V & C);
|
- P.status_word_low = (byte)(char)(V & C);
- P.status_word_high = (byte)(char)((V & C) >> 8);
+ P.status_word = (ushort)(V & C);
|
- P.status_word_low = (char)(V & C);
- P.status_word_high = (byte)((V & C) >> 8);
+ P.status_word = (ushort)(V & C);
|
- P.status_word_low = (byte)(V & C);
- P.status_word_high = (byte)(char)((V & C) >> 8);
+ P.status_word = (ushort)(V & C);
|
- P.status_word_low = (byte)(V | C);
- P.status_word_high = (byte)((V | C) >> 8);
+ P.status_word = (ushort)(V | C);
|
- P.status_word_low = (char)(V | C);
- P.status_word_high = (char)((V | C) >> 8);
+ P.status_word = (ushort)(V | C);
|
- P.status_word_low = (byte)(char)(V | C);
- P.status_word_high = (byte)((V | C) >> 8);
+ P.status_word = (ushort)(V | C);
|
- P.status_word_low = (byte)(char)(V | C);
- P.status_word_high = (byte)(char)((V | C) >> 8);
+ P.status_word = (ushort)(V | C);
|
- P.status_word_low = (char)(V | C);
- P.status_word_high = (byte)((V | C) >> 8);
+ P.status_word = (ushort)(V | C);
|
- P.status_word_low = (byte)(V | C);
- P.status_word_high = (byte)(char)((V | C) >> 8);
+ P.status_word = (ushort)(V | C);
|
- P.status_word_low = (byte)(V ^ C);
- P.status_word_high = (byte)((V ^ C) >> 8);
+ P.status_word = (ushort)(V ^ C);
|
- P.status_word_low = (char)(V ^ C);
- P.status_word_high = (char)((V ^ C) >> 8);
+ P.status_word = (ushort)(V ^ C);
|
- P.status_word_low = (byte)(char)(V ^ C);
- P.status_word_high = (byte)((V ^ C) >> 8);
+ P.status_word = (ushort)(V ^ C);
|
- P.status_word_low = (byte)(char)(V ^ C);
- P.status_word_high = (byte)(char)((V ^ C) >> 8);
+ P.status_word = (ushort)(V ^ C);
|
- P.status_word_low = (char)(V ^ C);
- P.status_word_high = (byte)((V ^ C) >> 8);
+ P.status_word = (ushort)(V ^ C);
|
- P.status_word_low = (byte)(V ^ C);
- P.status_word_high = (byte)(char)((V ^ C) >> 8);
+ P.status_word = (ushort)(V ^ C);
)

@store_status_word_2 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (char)(V >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->status_word_high = (char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->status_word_high = (char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->status_word_high = (char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->status_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->status_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->status_word = (ushort)(V ^ C);
)

@store_target_word_0 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(V >> 8);
+ P->target_word = (ushort)V;
|
- P->target_word_low = (char)V;
- P->target_word_high = (char)(V >> 8);
+ P->target_word = (ushort)V;
|
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(V >> 8);
+ P->target_word = (ushort)V;
|
- P->target_word_low = (byte)(char)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->target_word = (ushort)V;
|
- P->target_word_low = (char)V;
- P->target_word_high = (byte)(V >> 8);
+ P->target_word = (ushort)V;
|
- P->target_word_low = (byte)V;
- P->target_word_high = (byte)(char)(V >> 8);
+ P->target_word = (ushort)V;
|
- P->target_word_low = (byte)(V & C);
- P->target_word_high = (byte)((V & C) >> 8);
+ P->target_word = (ushort)(V & C);
|
- P->target_word_low = (char)(V & C);
- P->target_word_high = (char)((V & C) >> 8);
+ P->target_word = (ushort)(V & C);
|
- P->target_word_low = (byte)(char)(V & C);
- P->target_word_high = (byte)((V & C) >> 8);
+ P->target_word = (ushort)(V & C);
|
- P->target_word_low = (byte)(char)(V & C);
- P->target_word_high = (byte)(char)((V & C) >> 8);
+ P->target_word = (ushort)(V & C);
|
- P->target_word_low = (char)(V & C);
- P->target_word_high = (byte)((V & C) >> 8);
+ P->target_word = (ushort)(V & C);
|
- P->target_word_low = (byte)(V & C);
- P->target_word_high = (byte)(char)((V & C) >> 8);
+ P->target_word = (ushort)(V & C);
|
- P->target_word_low = (byte)(V | C);
- P->target_word_high = (byte)((V | C) >> 8);
+ P->target_word = (ushort)(V | C);
|
- P->target_word_low = (char)(V | C);
- P->target_word_high = (char)((V | C) >> 8);
+ P->target_word = (ushort)(V | C);
|
- P->target_word_low = (byte)(char)(V | C);
- P->target_word_high = (byte)((V | C) >> 8);
+ P->target_word = (ushort)(V | C);
|
- P->target_word_low = (byte)(char)(V | C);
- P->target_word_high = (byte)(char)((V | C) >> 8);
+ P->target_word = (ushort)(V | C);
|
- P->target_word_low = (char)(V | C);
- P->target_word_high = (byte)((V | C) >> 8);
+ P->target_word = (ushort)(V | C);
|
- P->target_word_low = (byte)(V | C);
- P->target_word_high = (byte)(char)((V | C) >> 8);
+ P->target_word = (ushort)(V | C);
|
- P->target_word_low = (byte)(V ^ C);
- P->target_word_high = (byte)((V ^ C) >> 8);
+ P->target_word = (ushort)(V ^ C);
|
- P->target_word_low = (char)(V ^ C);
- P->target_word_high = (char)((V ^ C) >> 8);
+ P->target_word = (ushort)(V ^ C);
|
- P->target_word_low = (byte)(char)(V ^ C);
- P->target_word_high = (byte)((V ^ C) >> 8);
+ P->target_word = (ushort)(V ^ C);
|
- P->target_word_low = (byte)(char)(V ^ C);
- P->target_word_high = (byte)(char)((V ^ C) >> 8);
+ P->target_word = (ushort)(V ^ C);
|
- P->target_word_low = (char)(V ^ C);
- P->target_word_high = (byte)((V ^ C) >> 8);
+ P->target_word = (ushort)(V ^ C);
|
- P->target_word_low = (byte)(V ^ C);
- P->target_word_high = (byte)(char)((V ^ C) >> 8);
+ P->target_word = (ushort)(V ^ C);
)

@store_target_word_1 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(V >> 8);
+ P.target_word = (ushort)V;
|
- P.target_word_low = (char)V;
- P.target_word_high = (char)(V >> 8);
+ P.target_word = (ushort)V;
|
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(V >> 8);
+ P.target_word = (ushort)V;
|
- P.target_word_low = (byte)(char)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.target_word = (ushort)V;
|
- P.target_word_low = (char)V;
- P.target_word_high = (byte)(V >> 8);
+ P.target_word = (ushort)V;
|
- P.target_word_low = (byte)V;
- P.target_word_high = (byte)(char)(V >> 8);
+ P.target_word = (ushort)V;
|
- P.target_word_low = (byte)(V & C);
- P.target_word_high = (byte)((V & C) >> 8);
+ P.target_word = (ushort)(V & C);
|
- P.target_word_low = (char)(V & C);
- P.target_word_high = (char)((V & C) >> 8);
+ P.target_word = (ushort)(V & C);
|
- P.target_word_low = (byte)(char)(V & C);
- P.target_word_high = (byte)((V & C) >> 8);
+ P.target_word = (ushort)(V & C);
|
- P.target_word_low = (byte)(char)(V & C);
- P.target_word_high = (byte)(char)((V & C) >> 8);
+ P.target_word = (ushort)(V & C);
|
- P.target_word_low = (char)(V & C);
- P.target_word_high = (byte)((V & C) >> 8);
+ P.target_word = (ushort)(V & C);
|
- P.target_word_low = (byte)(V & C);
- P.target_word_high = (byte)(char)((V & C) >> 8);
+ P.target_word = (ushort)(V & C);
|
- P.target_word_low = (byte)(V | C);
- P.target_word_high = (byte)((V | C) >> 8);
+ P.target_word = (ushort)(V | C);
|
- P.target_word_low = (char)(V | C);
- P.target_word_high = (char)((V | C) >> 8);
+ P.target_word = (ushort)(V | C);
|
- P.target_word_low = (byte)(char)(V | C);
- P.target_word_high = (byte)((V | C) >> 8);
+ P.target_word = (ushort)(V | C);
|
- P.target_word_low = (byte)(char)(V | C);
- P.target_word_high = (byte)(char)((V | C) >> 8);
+ P.target_word = (ushort)(V | C);
|
- P.target_word_low = (char)(V | C);
- P.target_word_high = (byte)((V | C) >> 8);
+ P.target_word = (ushort)(V | C);
|
- P.target_word_low = (byte)(V | C);
- P.target_word_high = (byte)(char)((V | C) >> 8);
+ P.target_word = (ushort)(V | C);
|
- P.target_word_low = (byte)(V ^ C);
- P.target_word_high = (byte)((V ^ C) >> 8);
+ P.target_word = (ushort)(V ^ C);
|
- P.target_word_low = (char)(V ^ C);
- P.target_word_high = (char)((V ^ C) >> 8);
+ P.target_word = (ushort)(V ^ C);
|
- P.target_word_low = (byte)(char)(V ^ C);
- P.target_word_high = (byte)((V ^ C) >> 8);
+ P.target_word = (ushort)(V ^ C);
|
- P.target_word_low = (byte)(char)(V ^ C);
- P.target_word_high = (byte)(char)((V ^ C) >> 8);
+ P.target_word = (ushort)(V ^ C);
|
- P.target_word_low = (char)(V ^ C);
- P.target_word_high = (byte)((V ^ C) >> 8);
+ P.target_word = (ushort)(V ^ C);
|
- P.target_word_low = (byte)(V ^ C);
- P.target_word_high = (byte)(char)((V ^ C) >> 8);
+ P.target_word = (ushort)(V ^ C);
)

@store_target_word_2 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (char)(V >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->target_word_high = (char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->target_word_high = (char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->target_word_high = (char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->target_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->target_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->target_word = (ushort)(V ^ C);
)

@store_tile_word_0 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->tile_word = (ushort)V;
|
- P->tile_word_low = (char)V;
- P->tile_word_high = (char)(V >> 8);
+ P->tile_word = (ushort)V;
|
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->tile_word = (ushort)V;
|
- P->tile_word_low = (byte)(char)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->tile_word = (ushort)V;
|
- P->tile_word_low = (char)V;
- P->tile_word_high = (byte)(V >> 8);
+ P->tile_word = (ushort)V;
|
- P->tile_word_low = (byte)V;
- P->tile_word_high = (byte)(char)(V >> 8);
+ P->tile_word = (ushort)V;
|
- P->tile_word_low = (byte)(V & C);
- P->tile_word_high = (byte)((V & C) >> 8);
+ P->tile_word = (ushort)(V & C);
|
- P->tile_word_low = (char)(V & C);
- P->tile_word_high = (char)((V & C) >> 8);
+ P->tile_word = (ushort)(V & C);
|
- P->tile_word_low = (byte)(char)(V & C);
- P->tile_word_high = (byte)((V & C) >> 8);
+ P->tile_word = (ushort)(V & C);
|
- P->tile_word_low = (byte)(char)(V & C);
- P->tile_word_high = (byte)(char)((V & C) >> 8);
+ P->tile_word = (ushort)(V & C);
|
- P->tile_word_low = (char)(V & C);
- P->tile_word_high = (byte)((V & C) >> 8);
+ P->tile_word = (ushort)(V & C);
|
- P->tile_word_low = (byte)(V & C);
- P->tile_word_high = (byte)(char)((V & C) >> 8);
+ P->tile_word = (ushort)(V & C);
|
- P->tile_word_low = (byte)(V | C);
- P->tile_word_high = (byte)((V | C) >> 8);
+ P->tile_word = (ushort)(V | C);
|
- P->tile_word_low = (char)(V | C);
- P->tile_word_high = (char)((V | C) >> 8);
+ P->tile_word = (ushort)(V | C);
|
- P->tile_word_low = (byte)(char)(V | C);
- P->tile_word_high = (byte)((V | C) >> 8);
+ P->tile_word = (ushort)(V | C);
|
- P->tile_word_low = (byte)(char)(V | C);
- P->tile_word_high = (byte)(char)((V | C) >> 8);
+ P->tile_word = (ushort)(V | C);
|
- P->tile_word_low = (char)(V | C);
- P->tile_word_high = (byte)((V | C) >> 8);
+ P->tile_word = (ushort)(V | C);
|
- P->tile_word_low = (byte)(V | C);
- P->tile_word_high = (byte)(char)((V | C) >> 8);
+ P->tile_word = (ushort)(V | C);
|
- P->tile_word_low = (byte)(V ^ C);
- P->tile_word_high = (byte)((V ^ C) >> 8);
+ P->tile_word = (ushort)(V ^ C);
|
- P->tile_word_low = (char)(V ^ C);
- P->tile_word_high = (char)((V ^ C) >> 8);
+ P->tile_word = (ushort)(V ^ C);
|
- P->tile_word_low = (byte)(char)(V ^ C);
- P->tile_word_high = (byte)((V ^ C) >> 8);
+ P->tile_word = (ushort)(V ^ C);
|
- P->tile_word_low = (byte)(char)(V ^ C);
- P->tile_word_high = (byte)(char)((V ^ C) >> 8);
+ P->tile_word = (ushort)(V ^ C);
|
- P->tile_word_low = (char)(V ^ C);
- P->tile_word_high = (byte)((V ^ C) >> 8);
+ P->tile_word = (ushort)(V ^ C);
|
- P->tile_word_low = (byte)(V ^ C);
- P->tile_word_high = (byte)(char)((V ^ C) >> 8);
+ P->tile_word = (ushort)(V ^ C);
)

@store_tile_word_1 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.tile_word = (ushort)V;
|
- P.tile_word_low = (char)V;
- P.tile_word_high = (char)(V >> 8);
+ P.tile_word = (ushort)V;
|
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.tile_word = (ushort)V;
|
- P.tile_word_low = (byte)(char)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.tile_word = (ushort)V;
|
- P.tile_word_low = (char)V;
- P.tile_word_high = (byte)(V >> 8);
+ P.tile_word = (ushort)V;
|
- P.tile_word_low = (byte)V;
- P.tile_word_high = (byte)(char)(V >> 8);
+ P.tile_word = (ushort)V;
|
- P.tile_word_low = (byte)(V & C);
- P.tile_word_high = (byte)((V & C) >> 8);
+ P.tile_word = (ushort)(V & C);
|
- P.tile_word_low = (char)(V & C);
- P.tile_word_high = (char)((V & C) >> 8);
+ P.tile_word = (ushort)(V & C);
|
- P.tile_word_low = (byte)(char)(V & C);
- P.tile_word_high = (byte)((V & C) >> 8);
+ P.tile_word = (ushort)(V & C);
|
- P.tile_word_low = (byte)(char)(V & C);
- P.tile_word_high = (byte)(char)((V & C) >> 8);
+ P.tile_word = (ushort)(V & C);
|
- P.tile_word_low = (char)(V & C);
- P.tile_word_high = (byte)((V & C) >> 8);
+ P.tile_word = (ushort)(V & C);
|
- P.tile_word_low = (byte)(V & C);
- P.tile_word_high = (byte)(char)((V & C) >> 8);
+ P.tile_word = (ushort)(V & C);
|
- P.tile_word_low = (byte)(V | C);
- P.tile_word_high = (byte)((V | C) >> 8);
+ P.tile_word = (ushort)(V | C);
|
- P.tile_word_low = (char)(V | C);
- P.tile_word_high = (char)((V | C) >> 8);
+ P.tile_word = (ushort)(V | C);
|
- P.tile_word_low = (byte)(char)(V | C);
- P.tile_word_high = (byte)((V | C) >> 8);
+ P.tile_word = (ushort)(V | C);
|
- P.tile_word_low = (byte)(char)(V | C);
- P.tile_word_high = (byte)(char)((V | C) >> 8);
+ P.tile_word = (ushort)(V | C);
|
- P.tile_word_low = (char)(V | C);
- P.tile_word_high = (byte)((V | C) >> 8);
+ P.tile_word = (ushort)(V | C);
|
- P.tile_word_low = (byte)(V | C);
- P.tile_word_high = (byte)(char)((V | C) >> 8);
+ P.tile_word = (ushort)(V | C);
|
- P.tile_word_low = (byte)(V ^ C);
- P.tile_word_high = (byte)((V ^ C) >> 8);
+ P.tile_word = (ushort)(V ^ C);
|
- P.tile_word_low = (char)(V ^ C);
- P.tile_word_high = (char)((V ^ C) >> 8);
+ P.tile_word = (ushort)(V ^ C);
|
- P.tile_word_low = (byte)(char)(V ^ C);
- P.tile_word_high = (byte)((V ^ C) >> 8);
+ P.tile_word = (ushort)(V ^ C);
|
- P.tile_word_low = (byte)(char)(V ^ C);
- P.tile_word_high = (byte)(char)((V ^ C) >> 8);
+ P.tile_word = (ushort)(V ^ C);
|
- P.tile_word_low = (char)(V ^ C);
- P.tile_word_high = (byte)((V ^ C) >> 8);
+ P.tile_word = (ushort)(V ^ C);
|
- P.tile_word_low = (byte)(V ^ C);
- P.tile_word_high = (byte)(char)((V ^ C) >> 8);
+ P.tile_word = (ushort)(V ^ C);
)

@store_tile_word_2 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (char)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->tile_word_high = (char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->tile_word_high = (char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_word_high = (char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->tile_word_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_word_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_word = (ushort)(V ^ C);
)

@store_tile_position_0 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->tile_position_low = (byte)V;
- P->tile_position_high = (byte)(V >> 8);
+ P->tile_position = (ushort)V;
|
- P->tile_position_low = (char)V;
- P->tile_position_high = (char)(V >> 8);
+ P->tile_position = (ushort)V;
|
- P->tile_position_low = (byte)(char)V;
- P->tile_position_high = (byte)(V >> 8);
+ P->tile_position = (ushort)V;
|
- P->tile_position_low = (byte)(char)V;
- P->tile_position_high = (byte)(char)(V >> 8);
+ P->tile_position = (ushort)V;
|
- P->tile_position_low = (char)V;
- P->tile_position_high = (byte)(V >> 8);
+ P->tile_position = (ushort)V;
|
- P->tile_position_low = (byte)V;
- P->tile_position_high = (byte)(char)(V >> 8);
+ P->tile_position = (ushort)V;
|
- P->tile_position_low = (byte)(V & C);
- P->tile_position_high = (byte)((V & C) >> 8);
+ P->tile_position = (ushort)(V & C);
|
- P->tile_position_low = (char)(V & C);
- P->tile_position_high = (char)((V & C) >> 8);
+ P->tile_position = (ushort)(V & C);
|
- P->tile_position_low = (byte)(char)(V & C);
- P->tile_position_high = (byte)((V & C) >> 8);
+ P->tile_position = (ushort)(V & C);
|
- P->tile_position_low = (byte)(char)(V & C);
- P->tile_position_high = (byte)(char)((V & C) >> 8);
+ P->tile_position = (ushort)(V & C);
|
- P->tile_position_low = (char)(V & C);
- P->tile_position_high = (byte)((V & C) >> 8);
+ P->tile_position = (ushort)(V & C);
|
- P->tile_position_low = (byte)(V & C);
- P->tile_position_high = (byte)(char)((V & C) >> 8);
+ P->tile_position = (ushort)(V & C);
|
- P->tile_position_low = (byte)(V | C);
- P->tile_position_high = (byte)((V | C) >> 8);
+ P->tile_position = (ushort)(V | C);
|
- P->tile_position_low = (char)(V | C);
- P->tile_position_high = (char)((V | C) >> 8);
+ P->tile_position = (ushort)(V | C);
|
- P->tile_position_low = (byte)(char)(V | C);
- P->tile_position_high = (byte)((V | C) >> 8);
+ P->tile_position = (ushort)(V | C);
|
- P->tile_position_low = (byte)(char)(V | C);
- P->tile_position_high = (byte)(char)((V | C) >> 8);
+ P->tile_position = (ushort)(V | C);
|
- P->tile_position_low = (char)(V | C);
- P->tile_position_high = (byte)((V | C) >> 8);
+ P->tile_position = (ushort)(V | C);
|
- P->tile_position_low = (byte)(V | C);
- P->tile_position_high = (byte)(char)((V | C) >> 8);
+ P->tile_position = (ushort)(V | C);
|
- P->tile_position_low = (byte)(V ^ C);
- P->tile_position_high = (byte)((V ^ C) >> 8);
+ P->tile_position = (ushort)(V ^ C);
|
- P->tile_position_low = (char)(V ^ C);
- P->tile_position_high = (char)((V ^ C) >> 8);
+ P->tile_position = (ushort)(V ^ C);
|
- P->tile_position_low = (byte)(char)(V ^ C);
- P->tile_position_high = (byte)((V ^ C) >> 8);
+ P->tile_position = (ushort)(V ^ C);
|
- P->tile_position_low = (byte)(char)(V ^ C);
- P->tile_position_high = (byte)(char)((V ^ C) >> 8);
+ P->tile_position = (ushort)(V ^ C);
|
- P->tile_position_low = (char)(V ^ C);
- P->tile_position_high = (byte)((V ^ C) >> 8);
+ P->tile_position = (ushort)(V ^ C);
|
- P->tile_position_low = (byte)(V ^ C);
- P->tile_position_high = (byte)(char)((V ^ C) >> 8);
+ P->tile_position = (ushort)(V ^ C);
)

@store_tile_position_1 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.tile_position_low = (byte)V;
- P.tile_position_high = (byte)(V >> 8);
+ P.tile_position = (ushort)V;
|
- P.tile_position_low = (char)V;
- P.tile_position_high = (char)(V >> 8);
+ P.tile_position = (ushort)V;
|
- P.tile_position_low = (byte)(char)V;
- P.tile_position_high = (byte)(V >> 8);
+ P.tile_position = (ushort)V;
|
- P.tile_position_low = (byte)(char)V;
- P.tile_position_high = (byte)(char)(V >> 8);
+ P.tile_position = (ushort)V;
|
- P.tile_position_low = (char)V;
- P.tile_position_high = (byte)(V >> 8);
+ P.tile_position = (ushort)V;
|
- P.tile_position_low = (byte)V;
- P.tile_position_high = (byte)(char)(V >> 8);
+ P.tile_position = (ushort)V;
|
- P.tile_position_low = (byte)(V & C);
- P.tile_position_high = (byte)((V & C) >> 8);
+ P.tile_position = (ushort)(V & C);
|
- P.tile_position_low = (char)(V & C);
- P.tile_position_high = (char)((V & C) >> 8);
+ P.tile_position = (ushort)(V & C);
|
- P.tile_position_low = (byte)(char)(V & C);
- P.tile_position_high = (byte)((V & C) >> 8);
+ P.tile_position = (ushort)(V & C);
|
- P.tile_position_low = (byte)(char)(V & C);
- P.tile_position_high = (byte)(char)((V & C) >> 8);
+ P.tile_position = (ushort)(V & C);
|
- P.tile_position_low = (char)(V & C);
- P.tile_position_high = (byte)((V & C) >> 8);
+ P.tile_position = (ushort)(V & C);
|
- P.tile_position_low = (byte)(V & C);
- P.tile_position_high = (byte)(char)((V & C) >> 8);
+ P.tile_position = (ushort)(V & C);
|
- P.tile_position_low = (byte)(V | C);
- P.tile_position_high = (byte)((V | C) >> 8);
+ P.tile_position = (ushort)(V | C);
|
- P.tile_position_low = (char)(V | C);
- P.tile_position_high = (char)((V | C) >> 8);
+ P.tile_position = (ushort)(V | C);
|
- P.tile_position_low = (byte)(char)(V | C);
- P.tile_position_high = (byte)((V | C) >> 8);
+ P.tile_position = (ushort)(V | C);
|
- P.tile_position_low = (byte)(char)(V | C);
- P.tile_position_high = (byte)(char)((V | C) >> 8);
+ P.tile_position = (ushort)(V | C);
|
- P.tile_position_low = (char)(V | C);
- P.tile_position_high = (byte)((V | C) >> 8);
+ P.tile_position = (ushort)(V | C);
|
- P.tile_position_low = (byte)(V | C);
- P.tile_position_high = (byte)(char)((V | C) >> 8);
+ P.tile_position = (ushort)(V | C);
|
- P.tile_position_low = (byte)(V ^ C);
- P.tile_position_high = (byte)((V ^ C) >> 8);
+ P.tile_position = (ushort)(V ^ C);
|
- P.tile_position_low = (char)(V ^ C);
- P.tile_position_high = (char)((V ^ C) >> 8);
+ P.tile_position = (ushort)(V ^ C);
|
- P.tile_position_low = (byte)(char)(V ^ C);
- P.tile_position_high = (byte)((V ^ C) >> 8);
+ P.tile_position = (ushort)(V ^ C);
|
- P.tile_position_low = (byte)(char)(V ^ C);
- P.tile_position_high = (byte)(char)((V ^ C) >> 8);
+ P.tile_position = (ushort)(V ^ C);
|
- P.tile_position_low = (char)(V ^ C);
- P.tile_position_high = (byte)((V ^ C) >> 8);
+ P.tile_position = (ushort)(V ^ C);
|
- P.tile_position_low = (byte)(V ^ C);
- P.tile_position_high = (byte)(char)((V ^ C) >> 8);
+ P.tile_position = (ushort)(V ^ C);
)

@store_tile_position_2 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_position_low = (char)V;
- ((uw_mobile_object_t *)P)->tile_position_high = (char)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(char)V;
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_position_low = (char)V;
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)V;
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(char)(V >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)V;
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->tile_position_high = (char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(char)(V & C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (char)(V & C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(V & C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(char)((V & C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V & C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->tile_position_high = (char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(char)(V | C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (char)(V | C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(V | C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(char)((V | C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V | C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_position_high = (char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(char)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (char)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V ^ C);
|
- ((uw_mobile_object_t *)P)->tile_position_low = (byte)(V ^ C);
- ((uw_mobile_object_t *)P)->tile_position_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_mobile_object_t *)P)->tile_position = (ushort)(V ^ C);
)

@store_size_weight_0 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->size_weight = (ushort)V;
|
- P->size_weight_low = (char)V;
- P->size_weight_high = (char)(V >> 8);
+ P->size_weight = (ushort)V;
|
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->size_weight = (ushort)V;
|
- P->size_weight_low = (byte)(char)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->size_weight = (ushort)V;
|
- P->size_weight_low = (char)V;
- P->size_weight_high = (byte)(V >> 8);
+ P->size_weight = (ushort)V;
|
- P->size_weight_low = (byte)V;
- P->size_weight_high = (byte)(char)(V >> 8);
+ P->size_weight = (ushort)V;
|
- P->size_weight_low = (byte)(V & C);
- P->size_weight_high = (byte)((V & C) >> 8);
+ P->size_weight = (ushort)(V & C);
|
- P->size_weight_low = (char)(V & C);
- P->size_weight_high = (char)((V & C) >> 8);
+ P->size_weight = (ushort)(V & C);
|
- P->size_weight_low = (byte)(char)(V & C);
- P->size_weight_high = (byte)((V & C) >> 8);
+ P->size_weight = (ushort)(V & C);
|
- P->size_weight_low = (byte)(char)(V & C);
- P->size_weight_high = (byte)(char)((V & C) >> 8);
+ P->size_weight = (ushort)(V & C);
|
- P->size_weight_low = (char)(V & C);
- P->size_weight_high = (byte)((V & C) >> 8);
+ P->size_weight = (ushort)(V & C);
|
- P->size_weight_low = (byte)(V & C);
- P->size_weight_high = (byte)(char)((V & C) >> 8);
+ P->size_weight = (ushort)(V & C);
|
- P->size_weight_low = (byte)(V | C);
- P->size_weight_high = (byte)((V | C) >> 8);
+ P->size_weight = (ushort)(V | C);
|
- P->size_weight_low = (char)(V | C);
- P->size_weight_high = (char)((V | C) >> 8);
+ P->size_weight = (ushort)(V | C);
|
- P->size_weight_low = (byte)(char)(V | C);
- P->size_weight_high = (byte)((V | C) >> 8);
+ P->size_weight = (ushort)(V | C);
|
- P->size_weight_low = (byte)(char)(V | C);
- P->size_weight_high = (byte)(char)((V | C) >> 8);
+ P->size_weight = (ushort)(V | C);
|
- P->size_weight_low = (char)(V | C);
- P->size_weight_high = (byte)((V | C) >> 8);
+ P->size_weight = (ushort)(V | C);
|
- P->size_weight_low = (byte)(V | C);
- P->size_weight_high = (byte)(char)((V | C) >> 8);
+ P->size_weight = (ushort)(V | C);
|
- P->size_weight_low = (byte)(V ^ C);
- P->size_weight_high = (byte)((V ^ C) >> 8);
+ P->size_weight = (ushort)(V ^ C);
|
- P->size_weight_low = (char)(V ^ C);
- P->size_weight_high = (char)((V ^ C) >> 8);
+ P->size_weight = (ushort)(V ^ C);
|
- P->size_weight_low = (byte)(char)(V ^ C);
- P->size_weight_high = (byte)((V ^ C) >> 8);
+ P->size_weight = (ushort)(V ^ C);
|
- P->size_weight_low = (byte)(char)(V ^ C);
- P->size_weight_high = (byte)(char)((V ^ C) >> 8);
+ P->size_weight = (ushort)(V ^ C);
|
- P->size_weight_low = (char)(V ^ C);
- P->size_weight_high = (byte)((V ^ C) >> 8);
+ P->size_weight = (ushort)(V ^ C);
|
- P->size_weight_low = (byte)(V ^ C);
- P->size_weight_high = (byte)(char)((V ^ C) >> 8);
+ P->size_weight = (ushort)(V ^ C);
)

@store_size_weight_1 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.size_weight = (ushort)V;
|
- P.size_weight_low = (char)V;
- P.size_weight_high = (char)(V >> 8);
+ P.size_weight = (ushort)V;
|
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.size_weight = (ushort)V;
|
- P.size_weight_low = (byte)(char)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.size_weight = (ushort)V;
|
- P.size_weight_low = (char)V;
- P.size_weight_high = (byte)(V >> 8);
+ P.size_weight = (ushort)V;
|
- P.size_weight_low = (byte)V;
- P.size_weight_high = (byte)(char)(V >> 8);
+ P.size_weight = (ushort)V;
|
- P.size_weight_low = (byte)(V & C);
- P.size_weight_high = (byte)((V & C) >> 8);
+ P.size_weight = (ushort)(V & C);
|
- P.size_weight_low = (char)(V & C);
- P.size_weight_high = (char)((V & C) >> 8);
+ P.size_weight = (ushort)(V & C);
|
- P.size_weight_low = (byte)(char)(V & C);
- P.size_weight_high = (byte)((V & C) >> 8);
+ P.size_weight = (ushort)(V & C);
|
- P.size_weight_low = (byte)(char)(V & C);
- P.size_weight_high = (byte)(char)((V & C) >> 8);
+ P.size_weight = (ushort)(V & C);
|
- P.size_weight_low = (char)(V & C);
- P.size_weight_high = (byte)((V & C) >> 8);
+ P.size_weight = (ushort)(V & C);
|
- P.size_weight_low = (byte)(V & C);
- P.size_weight_high = (byte)(char)((V & C) >> 8);
+ P.size_weight = (ushort)(V & C);
|
- P.size_weight_low = (byte)(V | C);
- P.size_weight_high = (byte)((V | C) >> 8);
+ P.size_weight = (ushort)(V | C);
|
- P.size_weight_low = (char)(V | C);
- P.size_weight_high = (char)((V | C) >> 8);
+ P.size_weight = (ushort)(V | C);
|
- P.size_weight_low = (byte)(char)(V | C);
- P.size_weight_high = (byte)((V | C) >> 8);
+ P.size_weight = (ushort)(V | C);
|
- P.size_weight_low = (byte)(char)(V | C);
- P.size_weight_high = (byte)(char)((V | C) >> 8);
+ P.size_weight = (ushort)(V | C);
|
- P.size_weight_low = (char)(V | C);
- P.size_weight_high = (byte)((V | C) >> 8);
+ P.size_weight = (ushort)(V | C);
|
- P.size_weight_low = (byte)(V | C);
- P.size_weight_high = (byte)(char)((V | C) >> 8);
+ P.size_weight = (ushort)(V | C);
|
- P.size_weight_low = (byte)(V ^ C);
- P.size_weight_high = (byte)((V ^ C) >> 8);
+ P.size_weight = (ushort)(V ^ C);
|
- P.size_weight_low = (char)(V ^ C);
- P.size_weight_high = (char)((V ^ C) >> 8);
+ P.size_weight = (ushort)(V ^ C);
|
- P.size_weight_low = (byte)(char)(V ^ C);
- P.size_weight_high = (byte)((V ^ C) >> 8);
+ P.size_weight = (ushort)(V ^ C);
|
- P.size_weight_low = (byte)(char)(V ^ C);
- P.size_weight_high = (byte)(char)((V ^ C) >> 8);
+ P.size_weight = (ushort)(V ^ C);
|
- P.size_weight_low = (char)(V ^ C);
- P.size_weight_high = (byte)((V ^ C) >> 8);
+ P.size_weight = (ushort)(V ^ C);
|
- P.size_weight_low = (byte)(V ^ C);
- P.size_weight_high = (byte)(char)((V ^ C) >> 8);
+ P.size_weight = (ushort)(V ^ C);
)

@store_size_weight_2 disable drop_cast, bitand_comm, bitor_comm@
identifier P, V;
constant C =~ "^[0-9]";
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)V;
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)V;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)V;
- ((uw_object_type_props_t *)P)->size_weight_high = (char)(V >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)V;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)V;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)V;
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)V;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)V;
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(V >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)V;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)V;
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(char)(V >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)V;
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(V & C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)((V & C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V & C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)(V & C);
- ((uw_object_type_props_t *)P)->size_weight_high = (char)((V & C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V & C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)(V & C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)((V & C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V & C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)(V & C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(char)((V & C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V & C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)(V & C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)((V & C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V & C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(V & C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(char)((V & C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V & C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(V | C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)((V | C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V | C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)(V | C);
- ((uw_object_type_props_t *)P)->size_weight_high = (char)((V | C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V | C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)(V | C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)((V | C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V | C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)(V | C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(char)((V | C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V | C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)(V | C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)((V | C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V | C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(V | C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(char)((V | C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V | C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(V ^ C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)((V ^ C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V ^ C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)(V ^ C);
- ((uw_object_type_props_t *)P)->size_weight_high = (char)((V ^ C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V ^ C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)(V ^ C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)((V ^ C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V ^ C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(char)(V ^ C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V ^ C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (char)(V ^ C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)((V ^ C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V ^ C);
|
- ((uw_object_type_props_t *)P)->size_weight_low = (byte)(V ^ C);
- ((uw_object_type_props_t *)P)->size_weight_high = (byte)(char)((V ^ C) >> 8);
+ ((uw_object_type_props_t *)P)->size_weight = (ushort)(V ^ C);
)
