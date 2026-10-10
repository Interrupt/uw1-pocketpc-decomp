@update_attitude disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ((uw_mobile_object_t *)puVar7)->status_word_low = (byte)(char)uVar11;
- ((uw_mobile_object_t *)puVar7)->status_word_high = (byte)(uVar11 >> 8) | (byte)(((uVar2 & 3) << 0xe) >> 8);
+ ((uw_mobile_object_t *)puVar7)->npc_attitude = uVar2 & 3;
...>
}

@update_chain_address disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- resolve_object_link(puVar7 + 2)
+ resolve_object_link(&((uw_mobile_object_t *)puVar7)->hdr.chain_word)
...>
}

@update_local_type disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ushort *puVar7;
+ uw_mobile_object_t *puVar7;
...>
}

@update_resolve_type disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
- puVar7 = (ushort *)resolve_object_link(E);
+ puVar7 = (uw_mobile_object_t *)resolve_object_link(E);
...>
}

@update_null_type disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- puVar7 != (ushort *)0x0
+ puVar7 != NULL
...>
}

@update_npc_fields disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;
identifier M;
@@
R F(...) {
<...
- ((uw_mobile_object_t *)puVar7)->M
+ puVar7->M
...>
}

@update_header_fields disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;
identifier M;
@@
R F(...) {
<...
- ((uw_object_hdr_t *)puVar7)->M
+ puVar7->hdr.M
...>
}

@update_speaker_header disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(babl_builtin_set_race_attitude\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- *DAT_00100674
+ ((uw_object_hdr_t *)DAT_00100674)->type_flags
...>
}
