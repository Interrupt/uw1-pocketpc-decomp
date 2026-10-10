@projectile_spawn_npc_react_to_nearby_player_target_player disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_react_to_nearby_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = DAT_0010190c->goal_word & 0xf01f;
- DAT_0010190c->goal_word_low = (byte)V | 0x10;
- DAT_0010190c->goal_word_high = (byte)(char)(V >> 8);
+ V = DAT_0010190c->goal_word & 0xf01f;
+ DAT_0010190c->npc_gtarg = 1;
)
...>
}

@projectile_spawn_npc_notice_and_idle_tick_target_player disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_notice_and_idle_tick$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = DAT_0010190c->goal_word & 0xf01f;
- DAT_0010190c->goal_word_low = (byte)V | 0x10;
- DAT_0010190c->goal_word_high = (byte)(char)(V >> 8);
+ V = DAT_0010190c->goal_word & 0xf01f;
+ DAT_0010190c->npc_gtarg = 1;
)
...>
}

@projectile_spawn_npc_clear_special_goal_target_player disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_clear_special_goal$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = DAT_0010190c->goal_word & 0xf01f;
- DAT_0010190c->goal_word_low = (byte)V | 0x10;
- DAT_0010190c->goal_word_high = (byte)(char)(V >> 8);
+ V = DAT_0010190c->goal_word & 0xf01f;
+ DAT_0010190c->npc_gtarg = 1;
)
...>
}

@projectile_spawn_npc_react_to_nearby_player_frame disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_react_to_nearby_player$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;
identifier S, N, V;
@@
R F(...) {
<...
(
- S = DAT_0010190c->goal_word;
- N = ((int)((S >> 0xc) + 1)) % (4);
- V = S & 0xfff;
- DAT_0010190c->goal_word_low = (byte)(char)V;
- DAT_0010190c->goal_word_high = (byte)(V >> 8) | (byte)(((N & 0xf) << 0xc) >> 8);
+ S = DAT_0010190c->goal_word;
+ N = ((int)(DAT_0010190c->npc_animation_frame + 1)) % (4);
+ V = S & 0xfff;
+ DAT_0010190c->npc_animation_frame = N & 0xf;
)
...>
}

@projectile_spawn_npc_ai_default_tick_frame disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_ai_default_tick$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;
identifier S, N, V;
@@
R F(...) {
<...
(
- S = DAT_0010190c->goal_word;
- N = ((int)((S >> 0xc) + 1)) % (4);
- V = S & 0xfff;
- ((uw_mobile_object_t *)npc_rec)->goal_word_low = (byte)(char)V;
- DAT_0010190c->goal_word_high = (byte)(V >> 8) | (byte)(((N & 0xf) << 0xc) >> 8);
+ S = DAT_0010190c->goal_word;
+ N = ((int)(DAT_0010190c->npc_animation_frame + 1)) % (4);
+ V = S & 0xfff;
+ DAT_0010190c->npc_animation_frame = N & 0xf;
)
...>
}

@projectile_spawn_npc_notice_and_idle_tick_frame disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_notice_and_idle_tick$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;
identifier S, N, V;
@@
R F(...) {
<...
(
- S = DAT_0010190c->goal_word;
- N = ((int)((S >> 0xc) + 1)) % (4);
- V = S & 0xfff;
- ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)(char)V;
- DAT_0010190c->goal_word_high = (byte)(V >> 8) | (byte)(((N & 0xf) << 0xc) >> 8);
+ S = DAT_0010190c->goal_word;
+ N = ((int)(DAT_0010190c->npc_animation_frame + 1)) % (4);
+ V = S & 0xfff;
+ DAT_0010190c->npc_animation_frame = N & 0xf;
)
...>
}

@projectile_spawn_npc_wander_return_home_exact_tick_frame disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_wander_return_home_exact_tick$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;
identifier S, N, V;
@@
R F(...) {
<...
(
- S = DAT_0010190c->goal_word;
- N = ((int)((S >> 0xc) + 1)) % (4);
- V = S & 0xfff;
- ((uw_mobile_object_t *)iVar2)->goal_word_low = (byte)(char)V;
- DAT_0010190c->goal_word_high = (byte)(V >> 8) | (byte)(((N & 0xf) << 0xc) >> 8);
+ S = DAT_0010190c->goal_word;
+ N = ((int)(DAT_0010190c->npc_animation_frame + 1)) % (4);
+ V = S & 0xfff;
+ DAT_0010190c->npc_animation_frame = N & 0xf;
)
...>
}

@projectile_spawn_idle_frame disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_idle_behavior_tick$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- ((uw_mobile_object_t *)iVar9)->goal_word_low = (byte)(char)(uVar1 & 0xfff);
- DAT_0010190c->goal_word_high = (byte)((uVar1 & 0xfff) >> 8) | (byte)(((uVar7 & 0xf) << 0xc) >> 8);
+ DAT_0010190c->npc_animation_frame = uVar7 & 0xf;
)
...>
}

@projectile_spawn_clear_idle_goal disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_clear_special_goal$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;
identifier V;
@@
R F(...) {
<...
(
- V = DAT_0010190c->goal_word & 0xfff2;
- DAT_0010190c->goal_word_low = (byte)V | 2;
- DAT_0010190c->goal_word_high = (byte)(char)(V >> 8);
+ V = DAT_0010190c->goal_word & 0xfff2;
+ DAT_0010190c->npc_goal = 2;
)
...>
}

@projectile_spawn_clear_level_goal disable drop_cast, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc, bitand_comm, bitor_comm@
type R;
identifier F =~ "^npc_clear_special_goal$";
typedef byte, ushort, uint, uw_object_hdr_t, uw_projectile_object_t, uw_mobile_object_t;

@@
R F(...) {
<...
(
- uVar1 = DAT_0010190c->goal_word;
- bVar2 = (byte)uVar1;
- DAT_0010190c->goal_word_low = (bVar2 ^ DAT_0010190c->status_word_low) & 0xf ^ bVar2;
- DAT_0010190c->goal_word_high = (byte)(char)((ushort)uVar1 >> 8);
+ uVar1 = DAT_0010190c->goal_word;
+ bVar2 = (byte)uVar1;
+ DAT_0010190c->npc_goal = DAT_0010190c->npc_level;
)
...>
}
