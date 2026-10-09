@initiate_npc_death_npc_npc_hp_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(npc + 8)
+ ((uw_mobile_object_t *)npc)->npc_hp
|
- *(byte *)((char *)npc + 8)
+ ((uw_mobile_object_t *)npc)->npc_hp
)
...>
}

@initiate_npc_death_npc_npc_hp_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(npc + 8)
+ ((uw_mobile_object_t *)npc)->npc_hp
|
- *(undefined1 *)((char *)npc + 8)
+ ((uw_mobile_object_t *)npc)->npc_hp
)
...>
}

@initiate_npc_death_npc_npc_hp_address@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(npc + 8)
+ (char *)&((uw_mobile_object_t *)npc)->npc_hp
|
- &*(char *)((char *)npc + 8)
+ (char *)&((uw_mobile_object_t *)npc)->npc_hp
)
...>
}

@initiate_npc_death_npc_npc_hp_store@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(npc + 8) = E;
+ ((uw_mobile_object_t *)npc)->npc_hp = (byte)E;
|
- *(char *)((char *)npc + 8) = E;
+ ((uw_mobile_object_t *)npc)->npc_hp = (byte)E;
)
...>
}

@initiate_npc_death_npc_npc_hp_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(npc + 8)
+ (char)((uw_mobile_object_t *)npc)->npc_hp
|
- *(char *)((char *)npc + 8)
+ (char)((uw_mobile_object_t *)npc)->npc_hp
)
...>
}

@initiate_npc_death_npc_goal_word_low_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(npc + 11)
+ ((uw_mobile_object_t *)npc)->goal_word_low
|
- *(byte *)((char *)npc + 11)
+ ((uw_mobile_object_t *)npc)->goal_word_low
)
...>
}

@initiate_npc_death_npc_goal_word_low_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(npc + 11)
+ ((uw_mobile_object_t *)npc)->goal_word_low
|
- *(undefined1 *)((char *)npc + 11)
+ ((uw_mobile_object_t *)npc)->goal_word_low
)
...>
}

@initiate_npc_death_npc_goal_word_low_address@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(npc + 11)
+ (char *)&((uw_mobile_object_t *)npc)->goal_word_low
|
- &*(char *)((char *)npc + 11)
+ (char *)&((uw_mobile_object_t *)npc)->goal_word_low
)
...>
}

@initiate_npc_death_npc_goal_word_low_store@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(npc + 11) = E;
+ ((uw_mobile_object_t *)npc)->goal_word_low = (byte)E;
|
- *(char *)((char *)npc + 11) = E;
+ ((uw_mobile_object_t *)npc)->goal_word_low = (byte)E;
)
...>
}

@initiate_npc_death_npc_goal_word_low_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(npc + 11)
+ (char)((uw_mobile_object_t *)npc)->goal_word_low
|
- *(char *)((char *)npc + 11)
+ (char)((uw_mobile_object_t *)npc)->goal_word_low
)
...>
}

@initiate_npc_death_npc_goal_word_high_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(npc + 12)
+ ((uw_mobile_object_t *)npc)->goal_word_high
|
- *(byte *)((char *)npc + 12)
+ ((uw_mobile_object_t *)npc)->goal_word_high
)
...>
}

@initiate_npc_death_npc_goal_word_high_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(npc + 12)
+ ((uw_mobile_object_t *)npc)->goal_word_high
|
- *(undefined1 *)((char *)npc + 12)
+ ((uw_mobile_object_t *)npc)->goal_word_high
)
...>
}

@initiate_npc_death_npc_goal_word_high_address@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(npc + 12)
+ (char *)&((uw_mobile_object_t *)npc)->goal_word_high
|
- &*(char *)((char *)npc + 12)
+ (char *)&((uw_mobile_object_t *)npc)->goal_word_high
)
...>
}

@initiate_npc_death_npc_goal_word_high_store@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(npc + 12) = E;
+ ((uw_mobile_object_t *)npc)->goal_word_high = (byte)E;
|
- *(char *)((char *)npc + 12) = E;
+ ((uw_mobile_object_t *)npc)->goal_word_high = (byte)E;
)
...>
}

@initiate_npc_death_npc_goal_word_high_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(npc + 12)
+ (char)((uw_mobile_object_t *)npc)->goal_word_high
|
- *(char *)((char *)npc + 12)
+ (char)((uw_mobile_object_t *)npc)->goal_word_high
)
...>
}

@initiate_npc_death_npc_attack_pitch_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(npc + 20)
+ ((uw_mobile_object_t *)npc)->attack_pitch
|
- *(byte *)((char *)npc + 20)
+ ((uw_mobile_object_t *)npc)->attack_pitch
)
...>
}

@initiate_npc_death_npc_attack_pitch_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(npc + 20)
+ ((uw_mobile_object_t *)npc)->attack_pitch
|
- *(undefined1 *)((char *)npc + 20)
+ ((uw_mobile_object_t *)npc)->attack_pitch
)
...>
}

@initiate_npc_death_npc_attack_pitch_address@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(npc + 20)
+ (char *)&((uw_mobile_object_t *)npc)->attack_pitch
|
- &*(char *)((char *)npc + 20)
+ (char *)&((uw_mobile_object_t *)npc)->attack_pitch
)
...>
}

@initiate_npc_death_npc_attack_pitch_store@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(npc + 20) = E;
+ ((uw_mobile_object_t *)npc)->attack_pitch = (byte)E;
|
- *(char *)((char *)npc + 20) = E;
+ ((uw_mobile_object_t *)npc)->attack_pitch = (byte)E;
)
...>
}

@initiate_npc_death_npc_attack_pitch_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(npc + 20)
+ (char)((uw_mobile_object_t *)npc)->attack_pitch
|
- *(char *)((char *)npc + 20)
+ (char)((uw_mobile_object_t *)npc)->attack_pitch
)
...>
}

@initiate_npc_death_npc_animation_flags_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(npc + 21)
+ ((uw_mobile_object_t *)npc)->animation_flags
|
- *(byte *)((char *)npc + 21)
+ ((uw_mobile_object_t *)npc)->animation_flags
)
...>
}

@initiate_npc_death_npc_animation_flags_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(npc + 21)
+ ((uw_mobile_object_t *)npc)->animation_flags
|
- *(undefined1 *)((char *)npc + 21)
+ ((uw_mobile_object_t *)npc)->animation_flags
)
...>
}

@initiate_npc_death_npc_animation_flags_address@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(npc + 21)
+ (char *)&((uw_mobile_object_t *)npc)->animation_flags
|
- &*(char *)((char *)npc + 21)
+ (char *)&((uw_mobile_object_t *)npc)->animation_flags
)
...>
}

@initiate_npc_death_npc_animation_flags_store@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(npc + 21) = E;
+ ((uw_mobile_object_t *)npc)->animation_flags = (byte)E;
|
- *(char *)((char *)npc + 21) = E;
+ ((uw_mobile_object_t *)npc)->animation_flags = (byte)E;
)
...>
}

@initiate_npc_death_npc_animation_flags_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(npc + 21)
+ (char)((uw_mobile_object_t *)npc)->animation_flags
|
- *(char *)((char *)npc + 21)
+ (char)((uw_mobile_object_t *)npc)->animation_flags
)
...>
}

@initiate_npc_death_npc_npc_whoami_byte@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(npc + 26)
+ ((uw_mobile_object_t *)npc)->npc_whoami
|
- *(byte *)((char *)npc + 26)
+ ((uw_mobile_object_t *)npc)->npc_whoami
)
...>
}

@initiate_npc_death_npc_npc_whoami_undefined1@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(npc + 26)
+ ((uw_mobile_object_t *)npc)->npc_whoami
|
- *(undefined1 *)((char *)npc + 26)
+ ((uw_mobile_object_t *)npc)->npc_whoami
)
...>
}

@initiate_npc_death_npc_npc_whoami_address@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(npc + 26)
+ (char *)&((uw_mobile_object_t *)npc)->npc_whoami
|
- &*(char *)((char *)npc + 26)
+ (char *)&((uw_mobile_object_t *)npc)->npc_whoami
)
...>
}

@initiate_npc_death_npc_npc_whoami_store@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(npc + 26) = E;
+ ((uw_mobile_object_t *)npc)->npc_whoami = (byte)E;
|
- *(char *)((char *)npc + 26) = E;
+ ((uw_mobile_object_t *)npc)->npc_whoami = (byte)E;
)
...>
}

@initiate_npc_death_npc_npc_whoami_char@
type R;
identifier F =~ "^\(initiate_npc_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(npc + 26)
+ (char)((uw_mobile_object_t *)npc)->npc_whoami
|
- *(char *)((char *)npc + 26)
+ (char)((uw_mobile_object_t *)npc)->npc_whoami
)
...>
}

@handle_monster_death_npc_animation_flags_byte@
type R;
identifier F =~ "^\(handle_monster_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(byte *)(npc + 21)
+ ((uw_mobile_object_t *)npc)->animation_flags
|
- *(byte *)((char *)npc + 21)
+ ((uw_mobile_object_t *)npc)->animation_flags
)
...>
}

@handle_monster_death_npc_animation_flags_undefined1@
type R;
identifier F =~ "^\(handle_monster_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(undefined1 *)(npc + 21)
+ ((uw_mobile_object_t *)npc)->animation_flags
|
- *(undefined1 *)((char *)npc + 21)
+ ((uw_mobile_object_t *)npc)->animation_flags
)
...>
}

@handle_monster_death_npc_animation_flags_address@
type R;
identifier F =~ "^\(handle_monster_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- &*(char *)(npc + 21)
+ (char *)&((uw_mobile_object_t *)npc)->animation_flags
|
- &*(char *)((char *)npc + 21)
+ (char *)&((uw_mobile_object_t *)npc)->animation_flags
)
...>
}

@handle_monster_death_npc_animation_flags_store@
type R;
identifier F =~ "^\(handle_monster_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;
expression E;
@@
R F(...) {
<...
(
- *(char *)(npc + 21) = E;
+ ((uw_mobile_object_t *)npc)->animation_flags = (byte)E;
|
- *(char *)((char *)npc + 21) = E;
+ ((uw_mobile_object_t *)npc)->animation_flags = (byte)E;
)
...>
}

@handle_monster_death_npc_animation_flags_char@
type R;
identifier F =~ "^\(handle_monster_death\)$";
typedef byte, undefined1, undefined2, ushort, uw_mobile_object_t;

@@
R F(...) {
<...
(
- *(char *)(npc + 21)
+ (char)((uw_mobile_object_t *)npc)->animation_flags
|
- *(char *)((char *)npc + 21)
+ (char)((uw_mobile_object_t *)npc)->animation_flags
)
...>
}
