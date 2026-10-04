#ifndef UW_TEST_GEOMETRY_FIXTURE_H
#define UW_TEST_GEOMETRY_FIXTURE_H
#include "unity.h"
#include "game_fixture.h"
extern int geometry_triangles;
extern int geometry_surface_ids[1024];
extern undefined4 geometry_last_triangle[15];
void geometry_fixture_reset(void);
void geometry_fixture_wall(unsigned records, float x, float depth);
void geometry_fixture_render(void);
#endif
