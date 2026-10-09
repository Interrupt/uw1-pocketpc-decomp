@phase_0_clear disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
@@
R F(...) {
<...
- npc->movement_flags = npc->movement_flags & 0xf0;
+ npc->tick_phase = 0;
...>
}

@phase_0_read disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(init_monster_spawn_defaults\)$";
@@
R F(...) {
<...
- npc->movement_flags & 0xf
+ npc->tick_phase
...>
}

@phase_1_clear disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
@@
R F(...) {
<...
- DAT_0010190c->movement_flags = DAT_0010190c->movement_flags & 0xf0;
+ DAT_0010190c->tick_phase = 0;
...>
}

@phase_1_read disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(npc_ai_tick\)$";
@@
R F(...) {
<...
- DAT_0010190c->movement_flags & 0xf
+ DAT_0010190c->tick_phase
...>
}

@phase_2_clear disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_mobile_objects\)$";
@@
R F(...) {
<...
- DAT_0010190c->movement_flags = DAT_0010190c->movement_flags & 0xf0;
+ DAT_0010190c->tick_phase = 0;
...>
}

@phase_2_read disable drop_cast, is_zero, isnt_zero@
type R;
identifier F =~ "^\(tick_mobile_objects\)$";
@@
R F(...) {
<...
- DAT_0010190c->movement_flags & 0xf
+ DAT_0010190c->tick_phase
...>
}
