#ifndef DOOR_MODELS_FIXTURE_H
#define DOOR_MODELS_FIXTURE_H
#include "src/headers/uw.h"
void door_models_reset(void);
const float *door_models_draw(int heading, int camera_heading, int progress, int direction, int catalog);
const float *door_models_draw_level_one_frame(int x, int y, int camera_heading, int catalog);
#endif
