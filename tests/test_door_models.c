#include "unity.h"
#include "door_models_fixture.h"
#include <math.h>
#include <string.h>

void setUp(void) { door_models_reset(); }
void tearDown(void) {}

static void assert_xz(const float *p, float x, float z)
{
    TEST_ASSERT_FLOAT_WITHIN(0.03f, x, p[0]);
    TEST_ASSERT_FLOAT_WITHIN(0.03f, z, p[2]);
}
static double base_angle(int heading, int camera)
{
    return (heading * 45 - ((camera+1)/2 % 4) * 90) * 3.141592653589793 / 180;
}
static void test_closed_leaf_fills_frame_opening_in_every_view(void)
{
    for (int heading=0; heading<8; heading+=2) {
        for (int camera=0; camera<8; camera++) {
            float frame[24];
            memcpy(frame, door_models_draw(heading,camera,0,1,1), sizeof frame);
            const float *leaf = door_models_draw(heading,camera,0,1,14);
            for (int point=0; point<8; point++)
                assert_xz(leaf+point*3, frame[point*3], frame[point*3+2]);
        }
    }
}
static void test_frame_keeps_original_packed_anchor(void)
{
    for (int heading=0; heading<8; heading+=2) {
        for (int camera=0; camera<8; camera++) {
            double angle=base_angle(heading,camera);
            const float *p=door_models_draw(heading,camera,0,1,1);
            assert_xz(p,16*256+144-64*cos(angle),6*256+112+64*sin(angle));
            TEST_ASSERT_EQUAL_UINT16(16*256+144,DAT_0023b904);
            TEST_ASSERT_EQUAL_UINT16(6*256+112,DAT_0023b920);
        }
    }
}
static void test_leaf_rotates_about_fixed_hinge_at_every_animation_step(void)
{
    for (int catalog=14; catalog<=15; catalog++) {
        for (int heading=0; heading<8; heading+=2) {
            for (int camera=0; camera<8; camera++) {
                double base=base_angle(heading,camera);
                float hx=16*256+144-64*cos(base), hz=6*256+112+64*sin(base);
                for (int direction=-1; direction<=1; direction+=2) {
                    for (int progress=0; progress<8; progress++) {
                        /* ARM angle conversion truncates degrees toward zero. */
                        short phase=(short)(heading*8192-((camera+1)/2%4)*16384+
                                            direction*progress*4096);
                        int degrees=(int)(phase / 32768.0 * 180);
                        double angle=degrees * 3.141592653589793 / 180;
                        const float *p=door_models_draw(heading,camera,progress,direction,catalog);
                        assert_xz(p,hx,hz);
                        assert_xz(p+9,hx+128*cos(angle),hz-128*sin(angle));
                        TEST_ASSERT_FLOAT_WITHIN(0.03f,640,p[1]);
                        TEST_ASSERT_FLOAT_WITHIN(0.03f,640+208*1.2f,p[4]);
                    }
                }
            }
        }
    }
}
static void test_tile_33_8_frame_meets_both_neighboring_walls(void)
{
    /* Real level-one door: heading 6, packed position (5,3). North and
       south neighbors are solid walls. Previously its north edge was
       16 units short; its south edge protruded by the same amount. */
    for (int camera=0; camera<8; camera++) {
        const float *p=door_models_draw_level_one_frame(33,8,camera,1);
        int quarter=(camera+1)/2%4;
        int axis=(quarter%2)==0 ? 2 : 0;
        int tile=(axis==2) ? 8 : 33;
        float a=p[8*3+axis], b=p[10*3+axis];
        TEST_ASSERT_FLOAT_WITHIN(0.03f,tile*256,fminf(a,b));
        TEST_ASSERT_FLOAT_WITHIN(0.03f,(tile+1)*256,fmaxf(a,b));
        float opening[24];
        memcpy(opening,p,sizeof opening);
        p=door_models_draw_level_one_frame(33,8,camera,14);
        for (int point=0; point<8; point++)
            assert_xz(p+point*3,opening[point*3],opening[point*3+2]);
    }
}
static void test_frame_outer_edges_meet_tile_boundaries_for_all_headings(void)
{
    for (int heading=0; heading<8; heading+=2) {
        for (int camera=0; camera<8; camera++) {
            const float *p=door_models_draw(heading,camera,0,1,1);
            int quarter=(camera+1)/2%4;
            int axis=((heading/2-quarter)&1) ? 2 : 0;
            int tile=axis==2 ? 6 : 16;
            float a=p[8*3+axis],b=p[10*3+axis];
            TEST_ASSERT_FLOAT_WITHIN(0.03f,tile*256,fminf(a,b));
            TEST_ASSERT_FLOAT_WITHIN(0.03f,(tile+1)*256,fmaxf(a,b));
        }
    }
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_tile_33_8_frame_meets_both_neighboring_walls);
    RUN_TEST(test_frame_outer_edges_meet_tile_boundaries_for_all_headings);
    RUN_TEST(test_closed_leaf_fills_frame_opening_in_every_view);
    RUN_TEST(test_frame_keeps_original_packed_anchor);
    RUN_TEST(test_leaf_rotates_about_fixed_hinge_at_every_animation_step);
    return UNITY_END();
}
