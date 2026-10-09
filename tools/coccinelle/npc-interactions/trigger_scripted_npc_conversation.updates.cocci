@update_attitude disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ((uw_mobile_object_t *)iVar2)->status_word_low = (byte)(char)uVar1;
- ((uw_mobile_object_t *)iVar2)->status_word_high = (byte)((ushort)uVar1 >> 8) | 0xc0;
+ ((uw_mobile_object_t *)iVar2)->npc_attitude = 3;
...>
}

@update_goal disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)uVar3 | 10;
- ((uw_mobile_object_t *)iVar2)->goal_word_high = (byte)(char)(uVar3 >> 8);
+ ((uw_mobile_object_t *)iVar2)->npc_goal = 10;
...>
}

@update_local_type disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- char *iVar2;
+ uw_mobile_object_t *iVar2;
...>
}

@update_spawn_type disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- iVar2 = (char *)spawn_new_object(0x40,1);
+ iVar2 = (uw_mobile_object_t *)spawn_new_object(0x40,1);
...>
}

@update_npc_fields disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;
identifier M;
@@
R F(...) {
<...
- ((uw_mobile_object_t *)iVar2)->M
+ iVar2->M
...>
}

@update_free_header disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
type R;
identifier F =~ "^\(trigger_scripted_npc_conversation\)$";
typedef byte, uint, ushort, uw_object_hdr_t, uw_mobile_object_t;

@@
R F(...) {
<...
- free_object_slot(iVar2);
+ free_object_slot(&iVar2->hdr);
...>
}
