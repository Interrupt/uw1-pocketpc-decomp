@shared_tick_phase@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->movement_flags = ((uw_mobile_object_t *)P)->movement_flags & 0xf0 | H & 0xf;
+ ((uw_mobile_object_t *)P)->tick_phase = H & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((uw_mobile_object_t *)P)->movement_flags & 0xf0;
+ ((uw_mobile_object_t *)P)->tick_phase = 0;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((uw_mobile_object_t *)P)->movement_flags | 0xf;
+ ((uw_mobile_object_t *)P)->tick_phase = 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = (H ^ ((uw_mobile_object_t *)P)->movement_flags) & 0xf ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = H & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = (((uw_mobile_object_t *)P)->movement_flags ^ H) & 0xf ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = H & 0xf;
)

@shared_movement_mode@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->movement_flags = ((uw_mobile_object_t *)P)->movement_flags & 0x8f | (H & 0x7) << 4;
+ ((uw_mobile_object_t *)P)->movement_mode = H & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((uw_mobile_object_t *)P)->movement_flags & 0x8f;
+ ((uw_mobile_object_t *)P)->movement_mode = 0;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((uw_mobile_object_t *)P)->movement_flags | 0x70;
+ ((uw_mobile_object_t *)P)->movement_mode = 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = (H ^ ((uw_mobile_object_t *)P)->movement_flags) & 0x70 ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = (H >> 4) & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = (((uw_mobile_object_t *)P)->movement_flags ^ H) & 0x70 ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = (H >> 4) & 0x7;
)

@shared_speed@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->motion_flags = ((uw_mobile_object_t *)P)->motion_flags & 0x80 | H & 0x7f;
+ ((uw_mobile_object_t *)P)->speed = H & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((uw_mobile_object_t *)P)->motion_flags & 0x80;
+ ((uw_mobile_object_t *)P)->speed = 0;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((uw_mobile_object_t *)P)->motion_flags | 0x7f;
+ ((uw_mobile_object_t *)P)->speed = 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = (H ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x7f ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = H & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = (((uw_mobile_object_t *)P)->motion_flags ^ H) & 0x7f ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = H & 0x7f;
)

@shared_gravity_flag@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->motion_flags = ((uw_mobile_object_t *)P)->motion_flags & 0x7f | (H & 0x1) << 7;
+ ((uw_mobile_object_t *)P)->gravity_flag = H & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((uw_mobile_object_t *)P)->motion_flags & 0x7f;
+ ((uw_mobile_object_t *)P)->gravity_flag = 0;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((uw_mobile_object_t *)P)->motion_flags | 0x80;
+ ((uw_mobile_object_t *)P)->gravity_flag = 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = (H ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x80 ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = (H >> 7) & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = (((uw_mobile_object_t *)P)->motion_flags ^ H) & 0x80 ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = (H >> 7) & 0x1;
)

@shared_pitch@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->attack_pitch = ((uw_mobile_object_t *)P)->attack_pitch & 0x7 | (H & 0x1f) << 3;
+ ((uw_mobile_object_t *)P)->pitch = H & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = ((uw_mobile_object_t *)P)->attack_pitch & 0x7;
+ ((uw_mobile_object_t *)P)->pitch = 0;
|
- ((uw_mobile_object_t *)P)->attack_pitch = ((uw_mobile_object_t *)P)->attack_pitch | 0xf8;
+ ((uw_mobile_object_t *)P)->pitch = 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = (H ^ ((uw_mobile_object_t *)P)->attack_pitch) & 0xf8 ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = (H >> 3) & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = (((uw_mobile_object_t *)P)->attack_pitch ^ H) & 0xf8 ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = (H >> 3) & 0x1f;
)

@shared_fine_heading@
identifier P, H;
typedef byte, ushort, uw_object_hdr_t, uw_mobile_object_t, uw_object_type_props_t;
@@
(
- ((uw_mobile_object_t *)P)->heading_flags = ((uw_mobile_object_t *)P)->heading_flags & 0xe0 | H & 0x1f;
+ ((uw_mobile_object_t *)P)->fine_heading = H & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = ((uw_mobile_object_t *)P)->heading_flags & 0xe0;
+ ((uw_mobile_object_t *)P)->fine_heading = 0;
|
- ((uw_mobile_object_t *)P)->heading_flags = ((uw_mobile_object_t *)P)->heading_flags | 0x1f;
+ ((uw_mobile_object_t *)P)->fine_heading = 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = (H ^ ((uw_mobile_object_t *)P)->heading_flags) & 0x1f ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = H & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = (((uw_mobile_object_t *)P)->heading_flags ^ H) & 0x1f ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = H & 0x1f;
)
@shared_tick_phase_expression_0 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]", D =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->movement_flags = (((H & C) + D) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0xf ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = ((H & C) + D) & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((((H & C) + D) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0xf) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = ((H & C) + D) & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = (((uw_mobile_object_t *)P)->movement_flags ^ ((H & C) + D)) & 0xf ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = ((H & C) + D) & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((((uw_mobile_object_t *)P)->movement_flags ^ ((H & C) + D)) & 0xf) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = ((H & C) + D) & 0xf;
)

@shared_tick_phase_expression_1 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H, N;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->movement_flags = (((H & C) + N) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0xf ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = ((H & C) + N) & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((((H & C) + N) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0xf) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = ((H & C) + N) & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = (((uw_mobile_object_t *)P)->movement_flags ^ ((H & C) + N)) & 0xf ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = ((H & C) + N) & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((((uw_mobile_object_t *)P)->movement_flags ^ ((H & C) + N)) & 0xf) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = ((H & C) + N) & 0xf;
)

@shared_tick_phase_expression_2 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->movement_flags = ((H << C) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0xf ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = (H << C) & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = (((H << C) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0xf) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = (H << C) & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = (((uw_mobile_object_t *)P)->movement_flags ^ (H << C)) & 0xf ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = (H << C) & 0xf;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((((uw_mobile_object_t *)P)->movement_flags ^ (H << C)) & 0xf) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->tick_phase = (H << C) & 0xf;
)

@shared_movement_mode_expression_0 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]", D =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->movement_flags = (((H & C) + D) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0x70 ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = (((H & C) + D) >> 4) & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((((H & C) + D) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0x70) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = (((H & C) + D) >> 4) & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = (((uw_mobile_object_t *)P)->movement_flags ^ ((H & C) + D)) & 0x70 ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = (((H & C) + D) >> 4) & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((((uw_mobile_object_t *)P)->movement_flags ^ ((H & C) + D)) & 0x70) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = (((H & C) + D) >> 4) & 0x7;
)

@shared_movement_mode_expression_1 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H, N;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->movement_flags = (((H & C) + N) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0x70 ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = (((H & C) + N) >> 4) & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((((H & C) + N) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0x70) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = (((H & C) + N) >> 4) & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = (((uw_mobile_object_t *)P)->movement_flags ^ ((H & C) + N)) & 0x70 ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = (((H & C) + N) >> 4) & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((((uw_mobile_object_t *)P)->movement_flags ^ ((H & C) + N)) & 0x70) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = (((H & C) + N) >> 4) & 0x7;
)

@shared_movement_mode_expression_2 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->movement_flags = ((H << C) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0x70 ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = ((H << C) >> 4) & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = (((H << C) ^ ((uw_mobile_object_t *)P)->movement_flags) & 0x70) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = ((H << C) >> 4) & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = (((uw_mobile_object_t *)P)->movement_flags ^ (H << C)) & 0x70 ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = ((H << C) >> 4) & 0x7;
|
- ((uw_mobile_object_t *)P)->movement_flags = ((((uw_mobile_object_t *)P)->movement_flags ^ (H << C)) & 0x70) ^ ((uw_mobile_object_t *)P)->movement_flags;
+ ((uw_mobile_object_t *)P)->movement_mode = ((H << C) >> 4) & 0x7;
)

@shared_speed_expression_0 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]", D =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->motion_flags = (((H & C) + D) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x7f ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = ((H & C) + D) & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((((H & C) + D) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x7f) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = ((H & C) + D) & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = (((uw_mobile_object_t *)P)->motion_flags ^ ((H & C) + D)) & 0x7f ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = ((H & C) + D) & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((((uw_mobile_object_t *)P)->motion_flags ^ ((H & C) + D)) & 0x7f) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = ((H & C) + D) & 0x7f;
)

@shared_speed_expression_1 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H, N;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->motion_flags = (((H & C) + N) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x7f ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = ((H & C) + N) & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((((H & C) + N) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x7f) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = ((H & C) + N) & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = (((uw_mobile_object_t *)P)->motion_flags ^ ((H & C) + N)) & 0x7f ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = ((H & C) + N) & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((((uw_mobile_object_t *)P)->motion_flags ^ ((H & C) + N)) & 0x7f) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = ((H & C) + N) & 0x7f;
)

@shared_speed_expression_2 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->motion_flags = ((H << C) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x7f ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = (H << C) & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = (((H << C) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x7f) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = (H << C) & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = (((uw_mobile_object_t *)P)->motion_flags ^ (H << C)) & 0x7f ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = (H << C) & 0x7f;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((((uw_mobile_object_t *)P)->motion_flags ^ (H << C)) & 0x7f) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->speed = (H << C) & 0x7f;
)

@shared_gravity_flag_expression_0 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]", D =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->motion_flags = (((H & C) + D) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x80 ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = (((H & C) + D) >> 7) & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((((H & C) + D) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x80) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = (((H & C) + D) >> 7) & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = (((uw_mobile_object_t *)P)->motion_flags ^ ((H & C) + D)) & 0x80 ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = (((H & C) + D) >> 7) & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((((uw_mobile_object_t *)P)->motion_flags ^ ((H & C) + D)) & 0x80) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = (((H & C) + D) >> 7) & 0x1;
)

@shared_gravity_flag_expression_1 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H, N;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->motion_flags = (((H & C) + N) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x80 ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = (((H & C) + N) >> 7) & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((((H & C) + N) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x80) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = (((H & C) + N) >> 7) & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = (((uw_mobile_object_t *)P)->motion_flags ^ ((H & C) + N)) & 0x80 ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = (((H & C) + N) >> 7) & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((((uw_mobile_object_t *)P)->motion_flags ^ ((H & C) + N)) & 0x80) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = (((H & C) + N) >> 7) & 0x1;
)

@shared_gravity_flag_expression_2 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->motion_flags = ((H << C) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x80 ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = ((H << C) >> 7) & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = (((H << C) ^ ((uw_mobile_object_t *)P)->motion_flags) & 0x80) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = ((H << C) >> 7) & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = (((uw_mobile_object_t *)P)->motion_flags ^ (H << C)) & 0x80 ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = ((H << C) >> 7) & 0x1;
|
- ((uw_mobile_object_t *)P)->motion_flags = ((((uw_mobile_object_t *)P)->motion_flags ^ (H << C)) & 0x80) ^ ((uw_mobile_object_t *)P)->motion_flags;
+ ((uw_mobile_object_t *)P)->gravity_flag = ((H << C) >> 7) & 0x1;
)

@shared_pitch_expression_0 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]", D =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->attack_pitch = (((H & C) + D) ^ ((uw_mobile_object_t *)P)->attack_pitch) & 0xf8 ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = (((H & C) + D) >> 3) & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = ((((H & C) + D) ^ ((uw_mobile_object_t *)P)->attack_pitch) & 0xf8) ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = (((H & C) + D) >> 3) & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = (((uw_mobile_object_t *)P)->attack_pitch ^ ((H & C) + D)) & 0xf8 ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = (((H & C) + D) >> 3) & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = ((((uw_mobile_object_t *)P)->attack_pitch ^ ((H & C) + D)) & 0xf8) ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = (((H & C) + D) >> 3) & 0x1f;
)

@shared_pitch_expression_1 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H, N;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->attack_pitch = (((H & C) + N) ^ ((uw_mobile_object_t *)P)->attack_pitch) & 0xf8 ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = (((H & C) + N) >> 3) & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = ((((H & C) + N) ^ ((uw_mobile_object_t *)P)->attack_pitch) & 0xf8) ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = (((H & C) + N) >> 3) & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = (((uw_mobile_object_t *)P)->attack_pitch ^ ((H & C) + N)) & 0xf8 ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = (((H & C) + N) >> 3) & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = ((((uw_mobile_object_t *)P)->attack_pitch ^ ((H & C) + N)) & 0xf8) ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = (((H & C) + N) >> 3) & 0x1f;
)

@shared_pitch_expression_2 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->attack_pitch = ((H << C) ^ ((uw_mobile_object_t *)P)->attack_pitch) & 0xf8 ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = ((H << C) >> 3) & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = (((H << C) ^ ((uw_mobile_object_t *)P)->attack_pitch) & 0xf8) ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = ((H << C) >> 3) & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = (((uw_mobile_object_t *)P)->attack_pitch ^ (H << C)) & 0xf8 ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = ((H << C) >> 3) & 0x1f;
|
- ((uw_mobile_object_t *)P)->attack_pitch = ((((uw_mobile_object_t *)P)->attack_pitch ^ (H << C)) & 0xf8) ^ ((uw_mobile_object_t *)P)->attack_pitch;
+ ((uw_mobile_object_t *)P)->pitch = ((H << C) >> 3) & 0x1f;
)

@shared_fine_heading_expression_0 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]", D =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->heading_flags = (((H & C) + D) ^ ((uw_mobile_object_t *)P)->heading_flags) & 0x1f ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = ((H & C) + D) & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = ((((H & C) + D) ^ ((uw_mobile_object_t *)P)->heading_flags) & 0x1f) ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = ((H & C) + D) & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = (((uw_mobile_object_t *)P)->heading_flags ^ ((H & C) + D)) & 0x1f ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = ((H & C) + D) & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = ((((uw_mobile_object_t *)P)->heading_flags ^ ((H & C) + D)) & 0x1f) ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = ((H & C) + D) & 0x1f;
)

@shared_fine_heading_expression_1 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H, N;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->heading_flags = (((H & C) + N) ^ ((uw_mobile_object_t *)P)->heading_flags) & 0x1f ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = ((H & C) + N) & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = ((((H & C) + N) ^ ((uw_mobile_object_t *)P)->heading_flags) & 0x1f) ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = ((H & C) + N) & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = (((uw_mobile_object_t *)P)->heading_flags ^ ((H & C) + N)) & 0x1f ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = ((H & C) + N) & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = ((((uw_mobile_object_t *)P)->heading_flags ^ ((H & C) + N)) & 0x1f) ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = ((H & C) + N) & 0x1f;
)

@shared_fine_heading_expression_2 disable drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier P, H;
constant C =~ "^[0-9]";
typedef uw_mobile_object_t;
@@
(
- ((uw_mobile_object_t *)P)->heading_flags = ((H << C) ^ ((uw_mobile_object_t *)P)->heading_flags) & 0x1f ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = (H << C) & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = (((H << C) ^ ((uw_mobile_object_t *)P)->heading_flags) & 0x1f) ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = (H << C) & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = (((uw_mobile_object_t *)P)->heading_flags ^ (H << C)) & 0x1f ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = (H << C) & 0x1f;
|
- ((uw_mobile_object_t *)P)->heading_flags = ((((uw_mobile_object_t *)P)->heading_flags ^ (H << C)) & 0x1f) ^ ((uw_mobile_object_t *)P)->heading_flags;
+ ((uw_mobile_object_t *)P)->fine_heading = (H << C) & 0x1f;
)
