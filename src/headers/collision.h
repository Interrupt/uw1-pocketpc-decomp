#ifndef HEADERS_COLLISION_H
#define HEADERS_COLLISION_H

/* Declarations for collision.c: collision geometry (height field
 * build, placement sweep, corner flags, height envelope). Pulls in
 * uw.h itself so this header is self-contained for any caller. */
#include "uw.h"

extern short DAT_00202c68;
extern short DAT_00202c30;
extern undefined DAT_00204920_backing[128];
#define DAT_00204920 DAT_00204920_backing[0]


ushort collision_neighbor_shade_or_zero(ushort *base, byte idx);
uint collision_sample_floor_height();
int compute_floor_height_at_position();
bool collision_classify_corner_wall();
bool collision_corner_flags();
void collision_build_height_field();
void collision_add_candidate_object();
void collision_height_envelope();
void swap_collision_candidates();
void sort_collision_candidates();
undefined4 check_object_placement_clearance();
int build_collision_height_field_for_object(); // was FUN_0002b7a0
undefined4 apply_placement_collision_sweep(); // was FUN_0002bd70

#endif
