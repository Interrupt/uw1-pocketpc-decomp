// Remove packed-result reloads only when control flow proves the
// temporary unused before exit or an independent overwrite.

@dead_before_overwrite_1@
type R;
identifier F, P;
identifier V =~ "^uVar1$";
expression E !~ "uVar1";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_2@
type R;
identifier F, P;
identifier V =~ "^uVar2$";
expression E !~ "uVar2";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_3@
type R;
identifier F, P;
identifier V =~ "^uVar3$";
expression E !~ "uVar3";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_4@
type R;
identifier F, P;
identifier V =~ "^uVar4$";
expression E !~ "uVar4";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_5@
type R;
identifier F, P;
identifier V =~ "^uVar5$";
expression E !~ "uVar5";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_6@
type R;
identifier F, P;
identifier V =~ "^uVar6$";
expression E !~ "uVar6";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_7@
type R;
identifier F, P;
identifier V =~ "^uVar7$";
expression E !~ "uVar7";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_8@
type R;
identifier F, P;
identifier V =~ "^uVar8$";
expression E !~ "uVar8";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_9@
type R;
identifier F, P;
identifier V =~ "^uVar9$";
expression E !~ "uVar9";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_10@
type R;
identifier F, P;
identifier V =~ "^uVar10$";
expression E !~ "uVar10";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_11@
type R;
identifier F, P;
identifier V =~ "^uVar11$";
expression E !~ "uVar11";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_12@
type R;
identifier F, P;
identifier V =~ "^uVar12$";
expression E !~ "uVar12";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_13@
type R;
identifier F, P;
identifier V =~ "^uVar13$";
expression E !~ "uVar13";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_14@
type R;
identifier F, P;
identifier V =~ "^uVar14$";
expression E !~ "uVar14";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_15@
type R;
identifier F, P;
identifier V =~ "^uVar15$";
expression E !~ "uVar15";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_16@
type R;
identifier F, P;
identifier V =~ "^uVar16$";
expression E !~ "uVar16";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_17@
type R;
identifier F, P;
identifier V =~ "^uVar17$";
expression E !~ "uVar17";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_18@
type R;
identifier F, P;
identifier V =~ "^uVar18$";
expression E !~ "uVar18";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_19@
type R;
identifier F, P;
identifier V =~ "^uVar19$";
expression E !~ "uVar19";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_20@
type R;
identifier F, P;
identifier V =~ "^uVar20$";
expression E !~ "uVar20";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_21@
type R;
identifier F, P;
identifier V =~ "^uVar21$";
expression E !~ "uVar21";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_22@
type R;
identifier F, P;
identifier V =~ "^uVar22$";
expression E !~ "uVar22";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_23@
type R;
identifier F, P;
identifier V =~ "^uVar23$";
expression E !~ "uVar23";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_24@
type R;
identifier F, P;
identifier V =~ "^uVar24$";
expression E !~ "uVar24";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_25@
type R;
identifier F, P;
identifier V =~ "^uVar25$";
expression E !~ "uVar25";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_26@
type R;
identifier F, P;
identifier V =~ "^uVar26$";
expression E !~ "uVar26";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_27@
type R;
identifier F, P;
identifier V =~ "^uVar27$";
expression E !~ "uVar27";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_28@
type R;
identifier F, P;
identifier V =~ "^uVar28$";
expression E !~ "uVar28";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_29@
type R;
identifier F, P;
identifier V =~ "^uVar29$";
expression E !~ "uVar29";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_30@
type R;
identifier F, P;
identifier V =~ "^uVar30$";
expression E !~ "uVar30";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_31@
type R;
identifier F, P;
identifier V =~ "^uVar31$";
expression E !~ "uVar31";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@dead_before_overwrite_32@
type R;
identifier F, P;
identifier V =~ "^uVar32$";
expression E !~ "uVar32";
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
V = E;
...
}

@audited_dead_npc_walk_toward_tile_uVar8@
type R;
@@
R npc_walk_toward_tile(...) {
<...
- uVar8 = DAT_0010190c->hdr.position_word;
...>
}

@audited_dead_walk_using_cached_path_uVar7@
type R;
@@
R walk_using_cached_path(...) {
<...
- uVar7 = DAT_0010190c->hdr.position_word;
...>
}

@audited_dead_npc_react_to_nearby_player_uVar5@
type R;
@@
R npc_react_to_nearby_player(...) {
<...
- uVar5 = DAT_0010190c->hdr.position_word;
...>
}

@audited_dead_npc_combat_approach_tick_uVar7@
type R;
@@
R npc_combat_approach_tick(...) {
<...
- uVar7 = DAT_0010190c->hdr.position_word;
...>
}

@audited_dead_npc_combat_engage_wide_tick_uVar3@
type R;
@@
R npc_combat_engage_wide_tick(...) {
<...
- uVar3 = DAT_0010190c->hdr.position_word;
...>
}

@audited_dead_npc_combat_position_tick_uVar1@
type R;
@@
R npc_combat_position_tick(...) {
<...
- uVar1 = DAT_0010190c->hdr.position_word;
...>
}

@audited_dead_npc_combat_position_tick_uVar8@
type R;
@@
R npc_combat_position_tick(...) {
<...
- uVar8 = DAT_0010190c->hdr.position_word;
...>
}

@audited_dead_npc_combat_disengage_tick_uVar5@
type R;
@@
R npc_combat_disengage_tick(...) {
<...
- uVar5 = DAT_0010190c->hdr.position_word;
...>
}

@dead_before_exit@
type R;
identifier F, P, V;
@@
R F(...) {
...
- V = P->hdr.position_word;
... when != V
}
