@word_0_0@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- ((ushort *)player_rec)[0]
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(ushort *)player_rec
+ ((uw_object_hdr_t *)player_rec)->type_flags
|
- *(ushort *)(player_rec + 0)
+ ((uw_object_hdr_t *)player_rec)->type_flags
)
...>
}

@word_0_1@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 2)
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- ((ushort *)player_rec)[1]
+ ((uw_object_hdr_t *)player_rec)->position_word
|
- *(ushort *)(player_rec + 2)
+ ((uw_object_hdr_t *)player_rec)->position_word
)
...>
}

@word_0_2@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- ((ushort *)player_rec)[2]
+ ((uw_object_hdr_t *)player_rec)->chain_word
|
- *(ushort *)(player_rec + 4)
+ ((uw_object_hdr_t *)player_rec)->chain_word
)
...>
}

@word_0_3@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)player_rec + 6)
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- ((ushort *)player_rec)[3]
+ ((uw_object_hdr_t *)player_rec)->link_word
|
- *(ushort *)(player_rec + 6)
+ ((uw_object_hdr_t *)player_rec)->link_word
)
...>
}

@word_1_0@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- ((ushort *)pcVar3)[0]
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(ushort *)pcVar3
+ ((uw_object_hdr_t *)pcVar3)->type_flags
|
- *(ushort *)(pcVar3 + 0)
+ ((uw_object_hdr_t *)pcVar3)->type_flags
)
...>
}

@word_1_1@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- ((ushort *)pcVar3)[1]
+ ((uw_object_hdr_t *)pcVar3)->position_word
|
- *(ushort *)(pcVar3 + 2)
+ ((uw_object_hdr_t *)pcVar3)->position_word
)
...>
}

@word_1_2@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- ((ushort *)pcVar3)[2]
+ ((uw_object_hdr_t *)pcVar3)->chain_word
|
- *(ushort *)(pcVar3 + 4)
+ ((uw_object_hdr_t *)pcVar3)->chain_word
)
...>
}

@word_1_3@
type R;
identifier F =~ "^\(roll_object_destroy_chance\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pcVar3 + 6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- ((ushort *)pcVar3)[3]
+ ((uw_object_hdr_t *)pcVar3)->link_word
|
- *(ushort *)(pcVar3 + 6)
+ ((uw_object_hdr_t *)pcVar3)->link_word
)
...>
}

@word_2_0@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 0)
+ ((uw_object_hdr_t *)object)->type_flags
|
- ((ushort *)object)[0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *(ushort *)object
+ ((uw_object_hdr_t *)object)->type_flags
|
- object[0]
+ ((uw_object_hdr_t *)object)->type_flags
|
- *object
+ ((uw_object_hdr_t *)object)->type_flags
)
...>
}

@word_2_1@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 2)
+ ((uw_object_hdr_t *)object)->position_word
|
- ((ushort *)object)[1]
+ ((uw_object_hdr_t *)object)->position_word
|
- object[1]
+ ((uw_object_hdr_t *)object)->position_word
)
...>
}

@word_2_2@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 4)
+ ((uw_object_hdr_t *)object)->chain_word
|
- ((ushort *)object)[2]
+ ((uw_object_hdr_t *)object)->chain_word
|
- object[2]
+ ((uw_object_hdr_t *)object)->chain_word
)
...>
}

@word_2_3@
type R;
identifier F =~ "^\(settle_mobile_to_immobile\|sync_object_tile_position\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)object + 6)
+ ((uw_object_hdr_t *)object)->link_word
|
- ((ushort *)object)[3]
+ ((uw_object_hdr_t *)object)->link_word
|
- object[3]
+ ((uw_object_hdr_t *)object)->link_word
)
...>
}

@word_3_0@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 0)
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- ((ushort *)pObj)[0]
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- *(ushort *)pObj
+ ((uw_object_hdr_t *)pObj)->type_flags
|
- *(ushort *)(pObj + 0)
+ ((uw_object_hdr_t *)pObj)->type_flags
)
...>
}

@word_3_1@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 2)
+ ((uw_object_hdr_t *)pObj)->position_word
|
- ((ushort *)pObj)[1]
+ ((uw_object_hdr_t *)pObj)->position_word
|
- *(ushort *)(pObj + 2)
+ ((uw_object_hdr_t *)pObj)->position_word
)
...>
}

@word_3_2@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 4)
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- ((ushort *)pObj)[2]
+ ((uw_object_hdr_t *)pObj)->chain_word
|
- *(ushort *)(pObj + 4)
+ ((uw_object_hdr_t *)pObj)->chain_word
)
...>
}

@word_3_3@
type R;
identifier F =~ "^\(spawn_creature_special_item_drop\|spawn_creature_treasure_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pObj + 6)
+ ((uw_object_hdr_t *)pObj)->link_word
|
- ((ushort *)pObj)[3]
+ ((uw_object_hdr_t *)pObj)->link_word
|
- *(ushort *)(pObj + 6)
+ ((uw_object_hdr_t *)pObj)->link_word
)
...>
}

@word_4_0@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- ((ushort *)pbVar4)[0]
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)pbVar4
+ ((uw_object_hdr_t *)pbVar4)->type_flags
|
- *(ushort *)(pbVar4 + 0)
+ ((uw_object_hdr_t *)pbVar4)->type_flags
)
...>
}

@word_4_1@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- ((ushort *)pbVar4)[1]
+ ((uw_object_hdr_t *)pbVar4)->position_word
|
- *(ushort *)(pbVar4 + 2)
+ ((uw_object_hdr_t *)pbVar4)->position_word
)
...>
}

@word_4_2@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- ((ushort *)pbVar4)[2]
+ ((uw_object_hdr_t *)pbVar4)->chain_word
|
- *(ushort *)(pbVar4 + 4)
+ ((uw_object_hdr_t *)pbVar4)->chain_word
)
...>
}

@word_4_3@
type R;
identifier F =~ "^\(spawn_creature_equipment_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pbVar4 + 6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- ((ushort *)pbVar4)[3]
+ ((uw_object_hdr_t *)pbVar4)->link_word
|
- *(ushort *)(pbVar4 + 6)
+ ((uw_object_hdr_t *)pbVar4)->link_word
)
...>
}

@word_5_0@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- ((ushort *)iVar6)[0]
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(ushort *)iVar6
+ ((uw_object_hdr_t *)iVar6)->type_flags
|
- *(ushort *)(iVar6 + 0)
+ ((uw_object_hdr_t *)iVar6)->type_flags
)
...>
}

@word_5_1@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 2)
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- ((ushort *)iVar6)[1]
+ ((uw_object_hdr_t *)iVar6)->position_word
|
- *(ushort *)(iVar6 + 2)
+ ((uw_object_hdr_t *)iVar6)->position_word
)
...>
}

@word_5_2@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- ((ushort *)iVar6)[2]
+ ((uw_object_hdr_t *)iVar6)->chain_word
|
- *(ushort *)(iVar6 + 4)
+ ((uw_object_hdr_t *)iVar6)->chain_word
)
...>
}

@word_5_3@
type R;
identifier F =~ "^\(spawn_creature_misc_item_drop\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar6 + 6)
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- ((ushort *)iVar6)[3]
+ ((uw_object_hdr_t *)iVar6)->link_word
|
- *(ushort *)(iVar6 + 6)
+ ((uw_object_hdr_t *)iVar6)->link_word
)
...>
}

@word_6_0@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- ((ushort *)pDropObj)[0]
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- *(ushort *)pDropObj
+ ((uw_object_hdr_t *)pDropObj)->type_flags
|
- *(ushort *)(pDropObj + 0)
+ ((uw_object_hdr_t *)pDropObj)->type_flags
)
...>
}

@word_6_1@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 2)
+ ((uw_object_hdr_t *)pDropObj)->position_word
|
- ((ushort *)pDropObj)[1]
+ ((uw_object_hdr_t *)pDropObj)->position_word
|
- *(ushort *)(pDropObj + 2)
+ ((uw_object_hdr_t *)pDropObj)->position_word
)
...>
}

@word_6_2@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
|
- ((ushort *)pDropObj)[2]
+ ((uw_object_hdr_t *)pDropObj)->chain_word
|
- *(ushort *)(pDropObj + 4)
+ ((uw_object_hdr_t *)pDropObj)->chain_word
)
...>
}

@word_6_3@
type R;
identifier F =~ "^\(drop_monster_loot\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)pDropObj + 6)
+ ((uw_object_hdr_t *)pDropObj)->link_word
|
- ((ushort *)pDropObj)[3]
+ ((uw_object_hdr_t *)pDropObj)->link_word
|
- *(ushort *)(pDropObj + 6)
+ ((uw_object_hdr_t *)pDropObj)->link_word
)
...>
}

@word_7_0@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- ((ushort *)iVar1)[0]
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)iVar1
+ ((uw_object_hdr_t *)iVar1)->type_flags
|
- *(ushort *)(iVar1 + 0)
+ ((uw_object_hdr_t *)iVar1)->type_flags
)
...>
}

@word_7_1@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 2)
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- ((ushort *)iVar1)[1]
+ ((uw_object_hdr_t *)iVar1)->position_word
|
- *(ushort *)(iVar1 + 2)
+ ((uw_object_hdr_t *)iVar1)->position_word
)
...>
}

@word_7_2@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- ((ushort *)iVar1)[2]
+ ((uw_object_hdr_t *)iVar1)->chain_word
|
- *(ushort *)(iVar1 + 4)
+ ((uw_object_hdr_t *)iVar1)->chain_word
)
...>
}

@word_7_3@
type R;
identifier F =~ "^\(reset_npc_path_cache\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)iVar1 + 6)
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- ((ushort *)iVar1)[3]
+ ((uw_object_hdr_t *)iVar1)->link_word
|
- *(ushort *)(iVar1 + 6)
+ ((uw_object_hdr_t *)iVar1)->link_word
)
...>
}

@word_8_0@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 0)
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- ((ushort *)puVar8)[0]
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *(ushort *)puVar8
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- puVar8[0]
+ ((uw_object_hdr_t *)puVar8)->type_flags
|
- *puVar8
+ ((uw_object_hdr_t *)puVar8)->type_flags
)
...>
}

@word_8_1@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 2)
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- ((ushort *)puVar8)[1]
+ ((uw_object_hdr_t *)puVar8)->position_word
|
- puVar8[1]
+ ((uw_object_hdr_t *)puVar8)->position_word
)
...>
}

@word_8_2@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 4)
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- ((ushort *)puVar8)[2]
+ ((uw_object_hdr_t *)puVar8)->chain_word
|
- puVar8[2]
+ ((uw_object_hdr_t *)puVar8)->chain_word
)
...>
}

@word_8_3@
type R;
identifier F =~ "^\(spawn_rest_interrupt_monster_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)puVar8 + 6)
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- ((ushort *)puVar8)[3]
+ ((uw_object_hdr_t *)puVar8)->link_word
|
- puVar8[3]
+ ((uw_object_hdr_t *)puVar8)->link_word
)
...>
}

@word_9_0@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 0)
+ ((uw_object_hdr_t *)npc)->type_flags
|
- ((ushort *)npc)[0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *(ushort *)npc
+ ((uw_object_hdr_t *)npc)->type_flags
|
- npc[0]
+ ((uw_object_hdr_t *)npc)->type_flags
|
- *npc
+ ((uw_object_hdr_t *)npc)->type_flags
)
...>
}

@word_9_1@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 2)
+ ((uw_object_hdr_t *)npc)->position_word
|
- ((ushort *)npc)[1]
+ ((uw_object_hdr_t *)npc)->position_word
|
- npc[1]
+ ((uw_object_hdr_t *)npc)->position_word
)
...>
}

@word_9_2@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 4)
+ ((uw_object_hdr_t *)npc)->chain_word
|
- ((ushort *)npc)[2]
+ ((uw_object_hdr_t *)npc)->chain_word
|
- npc[2]
+ ((uw_object_hdr_t *)npc)->chain_word
)
...>
}

@word_9_3@
type R;
identifier F =~ "^\(alert_npc_to_noise_callback\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)npc + 6)
+ ((uw_object_hdr_t *)npc)->link_word
|
- ((ushort *)npc)[3]
+ ((uw_object_hdr_t *)npc)->link_word
|
- npc[3]
+ ((uw_object_hdr_t *)npc)->link_word
)
...>
}

@word_10_0@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 0)
+ ((uw_object_hdr_t *)source)->type_flags
|
- ((ushort *)source)[0]
+ ((uw_object_hdr_t *)source)->type_flags
|
- *(ushort *)source
+ ((uw_object_hdr_t *)source)->type_flags
|
- source[0]
+ ((uw_object_hdr_t *)source)->type_flags
|
- *source
+ ((uw_object_hdr_t *)source)->type_flags
)
...>
}

@word_10_1@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 2)
+ ((uw_object_hdr_t *)source)->position_word
|
- ((ushort *)source)[1]
+ ((uw_object_hdr_t *)source)->position_word
|
- source[1]
+ ((uw_object_hdr_t *)source)->position_word
)
...>
}

@word_10_2@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 4)
+ ((uw_object_hdr_t *)source)->chain_word
|
- ((ushort *)source)[2]
+ ((uw_object_hdr_t *)source)->chain_word
|
- source[2]
+ ((uw_object_hdr_t *)source)->chain_word
)
...>
}

@word_10_3@
type R;
identifier F =~ "^\(emit_noise_alert\)$";
typedef ushort, uw_object_hdr_t;
@@
R F(...) {
<...
(
- *(ushort *)((char *)source + 6)
+ ((uw_object_hdr_t *)source)->link_word
|
- ((ushort *)source)[3]
+ ((uw_object_hdr_t *)source)->link_word
|
- source[3]
+ ((uw_object_hdr_t *)source)->link_word
)
...>
}
