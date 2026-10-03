#ifndef HEADERS_MODELS_H
#define HEADERS_MODELS_H

/* Declarations for models.c: the 3D "catalog object" model-rendering
 * pipeline -- animation-record ticking, emitting a catalog object
 * (door, bridge, decal, sign) as real .E model geometry, and door
 * animation-frame emission. Pulls in uw.h itself so this header is
 * self-contained for any caller. */
#include "uw.h"

void parse_e_model_file();
void *tick_anim_record();
void apply_model_position_offset();
void scale_model_part_offsets();
void load_3d_object_models();
void emit_catalog_object();
void emit_anim_object_frames();

#endif
