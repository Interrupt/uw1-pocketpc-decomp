@inventory_record_serialize_type_flags disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^serialize_inventory_link_chain$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *puVar2 = ((uw_object_hdr_t *)puVar1)->type_flags_low;
- puVar2[1] = ((uw_object_hdr_t *)puVar1)->type_flags_high;
+ ((uw_object_hdr_t *)puVar2)->type_flags = ((uw_object_hdr_t *)puVar1)->type_flags;
)
...>
}
@inventory_record_deserialize_type_flags disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^deserialize_inventory_link_chain$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar1)->type_flags_low = *puVar3;
- ((uw_object_hdr_t *)puVar1)->type_flags_high = puVar3[1];
+ ((uw_object_hdr_t *)puVar1)->type_flags = ((uw_object_hdr_t *)puVar3)->type_flags;
)
...>
}
@inventory_record_held_save_type_flags disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^build_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- out_record[0x1b] = *g_selected_object;
- out_record[0x1c] = puVar4[1];
+ ((uw_object_hdr_t *)(out_record + 0x1b))->type_flags = ((uw_object_hdr_t *)puVar4)->type_flags;
)
...>
}
@inventory_record_held_restore_type_flags disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^restore_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- *puVar2 = record[0x1b];
- puVar2[1] = record[0x1c];
+ ((uw_object_hdr_t *)puVar2)->type_flags = ((uw_object_hdr_t *)(record + 0x1b))->type_flags;
)
...>
}
@inventory_record_serialize_position_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^serialize_inventory_link_chain$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar2[2] = ((uw_object_hdr_t *)puVar1)->position_word_low;
- puVar2[3] = ((uw_object_hdr_t *)puVar1)->position_word_high;
+ ((uw_object_hdr_t *)puVar2)->position_word = ((uw_object_hdr_t *)puVar1)->position_word;
)
...>
}
@inventory_record_deserialize_position_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^deserialize_inventory_link_chain$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar1)->position_word_low = puVar3[2];
- ((uw_object_hdr_t *)puVar1)->position_word_high = puVar3[3];
+ ((uw_object_hdr_t *)puVar1)->position_word = ((uw_object_hdr_t *)puVar3)->position_word;
)
...>
}
@inventory_record_held_save_position_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^build_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- out_record[0x1d] = puVar4[2];
- out_record[0x1e] = puVar4[3];
+ ((uw_object_hdr_t *)(out_record + 0x1b))->position_word = ((uw_object_hdr_t *)puVar4)->position_word;
)
...>
}
@inventory_record_held_restore_position_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^restore_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar2[2] = record[0x1d];
- puVar2[3] = record[0x1e];
+ ((uw_object_hdr_t *)puVar2)->position_word = ((uw_object_hdr_t *)(record + 0x1b))->position_word;
)
...>
}
@inventory_record_serialize_chain_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^serialize_inventory_link_chain$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar2[4] = ((uw_object_hdr_t *)puVar1)->chain_word_low;
- puVar2[5] = ((uw_object_hdr_t *)puVar1)->chain_word_high;
+ ((uw_object_hdr_t *)puVar2)->chain_word = ((uw_object_hdr_t *)puVar1)->chain_word;
)
...>
}
@inventory_record_deserialize_chain_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^deserialize_inventory_link_chain$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar1)->chain_word_low = puVar3[4];
- ((uw_object_hdr_t *)puVar1)->chain_word_high = puVar3[5];
+ ((uw_object_hdr_t *)puVar1)->chain_word = ((uw_object_hdr_t *)puVar3)->chain_word;
)
...>
}
@inventory_record_held_save_chain_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^build_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- out_record[0x1f] = puVar4[4];
- out_record[0x20] = puVar4[5];
+ ((uw_object_hdr_t *)(out_record + 0x1b))->chain_word = ((uw_object_hdr_t *)puVar4)->chain_word;
)
...>
}
@inventory_record_held_restore_chain_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^restore_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar2[4] = record[0x1f];
- puVar2[5] = record[0x20];
+ ((uw_object_hdr_t *)puVar2)->chain_word = ((uw_object_hdr_t *)(record + 0x1b))->chain_word;
)
...>
}
@inventory_record_serialize_link_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^serialize_inventory_link_chain$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar2[6] = ((uw_object_hdr_t *)puVar1)->link_word_low;
- puVar2[7] = ((uw_object_hdr_t *)puVar1)->link_word_high;
+ ((uw_object_hdr_t *)puVar2)->link_word = ((uw_object_hdr_t *)puVar1)->link_word;
)
...>
}
@inventory_record_deserialize_link_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^deserialize_inventory_link_chain$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- ((uw_object_hdr_t *)puVar1)->link_word_low = puVar3[6];
- ((uw_object_hdr_t *)puVar1)->link_word_high = puVar3[7];
+ ((uw_object_hdr_t *)puVar1)->link_word = ((uw_object_hdr_t *)puVar3)->link_word;
)
...>
}
@inventory_record_held_save_link_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^build_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- out_record[0x21] = puVar4[6];
- out_record[0x22] = puVar4[7];
+ ((uw_object_hdr_t *)(out_record + 0x1b))->link_word = ((uw_object_hdr_t *)puVar4)->link_word;
)
...>
}
@inventory_record_held_restore_link_word disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^restore_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- puVar2[6] = record[0x21];
- puVar2[7] = record[0x22];
+ ((uw_object_hdr_t *)puVar2)->link_word = ((uw_object_hdr_t *)(record + 0x1b))->link_word;
)
...>
}
@inventory_record_player_next_clear disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^build_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- out_record[4] = out_record[4] & 0x3f;
- out_record[5] = 0;
+ ((uw_object_hdr_t *)out_record)->next = 0;
)
...>
}
@inventory_record_held_save_quantity disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^build_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (g_selected_object[1] & 0x80) == 0
+ ((uw_object_hdr_t *)g_selected_object)->is_quant == 0
)
...>
}
@inventory_record_held_restore_quantity disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^restore_player_save_record$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t;

@@
R F(...) {
<...
(
- (record[0x1c] & 0x80) == 0
+ ((uw_object_hdr_t *)(record + 0x1b))->is_quant == 0
)
...>
}
