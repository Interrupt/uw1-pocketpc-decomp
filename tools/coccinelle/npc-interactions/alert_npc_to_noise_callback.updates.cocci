@update_attitude disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ((uw_mobile_object_t *)npc)->status_word_low = (byte)(char)uVar6;
- ((uw_mobile_object_t *)npc)->status_word_high = (byte)(uVar6 >> 8) | (byte)(((uVar8 & 3) << 0xe) >> 8);
+ ((uw_mobile_object_t *)npc)->npc_attitude = uVar8 & 3;
...>
}
