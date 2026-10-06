#include "throw_fixture.h"

void setUp(void) { throw_fixture_reset(); }
void tearDown(void) { throw_fixture_dispose(); }

static void test_throw_remains_mobile_and_moves_over_successive_ticks(void)
{
    launch();
    short y=fine(thrown,13), z=fine(thrown,15);
    for(int i=0;i<3;i++) {
        tick();
        TEST_ASSERT_GREATER_THAN_INT(y,fine(thrown,13));
        TEST_ASSERT_EQUAL_INT(0,static_allocations);
        y=fine(thrown,13);
    }
    TEST_ASSERT_NOT_EQUAL(z,fine(thrown,15));
}
static void test_thrown_item_falls_and_settles_only_after_landing(void)
{
    launch();
    int ticks=0;
    while(!static_allocations && ticks++<150) tick();
    TEST_ASSERT_GREATER_THAN_INT(3,ticks);
    TEST_ASSERT_EQUAL_INT(1,static_allocations);
    ushort *landed=(ushort *)(DAT_002046c4+8);
    TEST_ASSERT_EQUAL_UINT16(0x80,landed[0]&0x1ff);
    TEST_ASSERT_EQUAL_UINT16(0,landed[1]&0x7f);
    ushort *tile=(ushort *)tilemap_lookup(DAT_0010144c,DAT_00101454);
    TEST_ASSERT_EQUAL_PTR(landed,resolve_object_link(tile+1));
    TEST_ASSERT_NULL(resolve_object_link(landed+2));
    TEST_ASSERT_EQUAL_INT(2,freed); /* held record, then stopped mobile record */
}
static void test_thrown_item_bounces_off_a_wall_and_keeps_falling(void)
{
    wall=true;
    launch();
    bool bounced=false;
    short previous_y=fine(thrown,13), impact_z=0;
    for(int i=0;i<30 && !static_allocations;i++) {
        tick();
        TEST_ASSERT_LESS_THAN_INT(88*32,fine(thrown,13));
        if(fine(thrown,13)<previous_y) { bounced=true; impact_z=fine(thrown,15); break; }
        previous_y=fine(thrown,13);
    }
    TEST_ASSERT_TRUE_MESSAGE(bounced,"Thrown object never reflected off the wall");
    TEST_ASSERT_EQUAL_INT(0,static_allocations);
    for(int i=0;i<10 && !static_allocations;i++) tick();
    TEST_ASSERT_LESS_THAN_INT(impact_z,fine(thrown,15));
}
static void test_player_lands_and_can_walk_without_rearming_gravity(void)
{
    const short falls[][2]={{2*8,-256},{48*8,-8},{2*8,-2048}};
    for(unsigned fall=0;fall<sizeof falls/sizeof falls[0];fall++) {
        byte *movement=DAT_00204880_backing;
        memset(movement,0,sizeof DAT_00204880_backing);
        *(short *)(movement+0)=10*256+128;
        *(short *)(movement+2)=10*256+128;
        *(short *)(movement+4)=falls[fall][0];
        *(short *)(movement+10)=falls[fall][1];
        *(short *)(movement+0x10)=-4;
        *(short *)(movement+0x12)=16;
        *(short *)(movement+0x23)=1; /* player slot */
        movement[0x16]=5; /* apply_heading_turn's original player profile */
        movement[0x26]=23;
        movement[0x27]=8;
        movement[0x28]=0x10;
        DAT_00202084=0x10; DAT_0020208c=0;
        int ticks=0;
        do {
            *(short *)(movement+0x12)=16; /* apply_heading_turn refreshes the tick delta */
            movement[0x17]=g_fall_accel ? 0 : 0x80;
            movement_collision_sweep(movement,(char *)DAT_002049a0_backing);
            set_locomotion_state(movement[0x28],0); /* commit_player_move's final step */
        } while((g_vertical_velocity || g_fall_accel) && ++ticks<80);
        TEST_ASSERT_LESS_THAN_INT(80,ticks);
        TEST_ASSERT_EQUAL_INT(0,*(short *)(movement+4));
        TEST_ASSERT_EQUAL_INT(0,g_vertical_velocity);
        TEST_ASSERT_EQUAL_INT(0,g_fall_accel);
        TEST_ASSERT_EQUAL_UINT(0,movement[0x28]&0x10);
        *(short *)(movement+0x14)=256;
        short previous_y=*(short *)(movement+2);
        for(int i=0;i<5;i++) {
            *(short *)(movement+0x12)=16;
            movement[0x17]=0x80;
            movement_collision_sweep(movement,(char *)DAT_002049a0_backing);
            set_locomotion_state(movement[0x28],0);
            TEST_ASSERT_GREATER_THAN_INT(previous_y,*(short *)(movement+2));
            TEST_ASSERT_EQUAL_INT(0,*(short *)(movement+4));
            TEST_ASSERT_EQUAL_INT(0,g_vertical_velocity);
            TEST_ASSERT_EQUAL_INT(0,g_fall_accel);
            previous_y=*(short *)(movement+2);
        }
    }
}

static void hard_player_landing(void)
{
    byte *movement=DAT_00204880_backing;
    memset(movement,0,sizeof DAT_00204880_backing);
    *(short *)(movement+0)=10*256+128;
    *(short *)(movement+2)=10*256+128;
    *(short *)(movement+4)=2*8;
    *(short *)(movement+10)=-2048;
    *(short *)(movement+0x10)=-4;
    *(short *)(movement+0x12)=16;
    *(short *)(movement+0x23)=1;
    movement[0x16]=5;
    movement[0x26]=23;
    movement[0x27]=8;
    movement[0x28]=0x10;
    movement_collision_sweep(movement,(char *)DAT_002049a0_backing);
}
static void test_player_no_bounce_is_disabled_by_zero(void)
{
    setenv("UW_PLAYER_NO_BOUNCE","0",1);
    hard_player_landing();
    TEST_ASSERT_GREATER_THAN_INT(0,g_vertical_velocity);
}
static void test_player_no_bounce_stops_the_player_on_first_landing(void)
{
    for (int mode = 0; mode < 2; mode++) {
        if (mode) setenv("UW_PLAYER_NO_BOUNCE","1",1);
        hard_player_landing();
        TEST_ASSERT_EQUAL_INT(0,DAT_00204884);
        TEST_ASSERT_EQUAL_INT(0,g_vertical_velocity);
        TEST_ASSERT_EQUAL_INT(0,g_fall_accel);
        TEST_ASSERT_EQUAL_UINT(0,DAT_002048a8&0x10);
    }
}
static void test_player_no_bounce_preserves_thrown_item_wall_bounces(void)
{
    setenv("UW_PLAYER_NO_BOUNCE","1",1);
    test_thrown_item_bounces_off_a_wall_and_keeps_falling();
}
static void test_falling_selects_the_highest_bridge_below_the_player(void)
{
    bridge_fixture=true; bridge_count=3;
    bridge_heights[0]=32; bridge_heights[1]=24; bridge_heights[2]=64;
    byte *movement=DAT_00204880_backing;
    memset(movement,0,sizeof DAT_00204880_backing);
    *(short *)(movement+4)=48*8;
    *(short *)(movement+10)=-8;
    *(short *)(movement+0x23)=1;
    movement[0x26]=23;
    DAT_00204874=(char *)movement;
    g_sweep_velocity=(short *)(movement+6);
    sweep_init_position();
    collision_height_envelope(0, 0);
    reticle_object_pick(0);
    TEST_ASSERT_EQUAL_UINT16(32,_DAT_0008699b);
    TEST_ASSERT_EQUAL_INT(1,DAT_00086998); /* after sorting 24,32,64 */
}
static void test_falling_player_lands_on_bridge_across_fall_speeds(void)
{
    const short velocities[]={-8,-256,-768};
    const short heights[]={33,48,80};
    bridge_fixture=true; bridge_count=1; bridge_heights[0]=32;
    for(int mode=0;mode<2;mode++) {
        setenv("UW_PLAYER_NO_BOUNCE",mode ? "1" : "0",1);
        for(unsigned height=0;height<3;height++) for(unsigned speed=0;speed<3;speed++) {
            byte *movement=DAT_00204880_backing;
            memset(movement,0,sizeof DAT_00204880_backing);
            *(short *)(movement+0)=10*256+128;
            *(short *)(movement+2)=10*256+128;
            *(short *)(movement+4)=heights[height]*8;
            *(short *)(movement+10)=velocities[speed];
            *(short *)(movement+0x10)=-4;
            *(short *)(movement+0x23)=1;
            movement[0x16]=5; movement[0x26]=23; movement[0x27]=8;
            movement[0x28]=0x10;
            DAT_00202084=0x10; DAT_0020208c=0;
            int ticks=0;
            do {
                *(short *)(movement+0x12)=16;
                movement[0x17]=g_fall_accel ? 0 : 0x80;
                movement_collision_sweep(movement,(char *)DAT_002049a0_backing);
                set_locomotion_state(movement[0x28],0);
                TEST_ASSERT_GREATER_OR_EQUAL_INT(32*8,*(short *)(movement+4));
            } while((g_vertical_velocity || g_fall_accel) && ++ticks<80);
            TEST_ASSERT_LESS_THAN_INT(80,ticks);
            TEST_ASSERT_EQUAL_INT(32*8,*(short *)(movement+4));
        }
    }
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_throw_remains_mobile_and_moves_over_successive_ticks);
    RUN_TEST(test_thrown_item_falls_and_settles_only_after_landing);
    RUN_TEST(test_thrown_item_bounces_off_a_wall_and_keeps_falling);
    RUN_TEST(test_player_lands_and_can_walk_without_rearming_gravity);
    RUN_TEST(test_player_no_bounce_is_disabled_by_zero);
    RUN_TEST(test_player_no_bounce_stops_the_player_on_first_landing);
    RUN_TEST(test_player_no_bounce_preserves_thrown_item_wall_bounces);
    RUN_TEST(test_falling_selects_the_highest_bridge_below_the_player);
    RUN_TEST(test_falling_player_lands_on_bridge_across_fall_speeds);
    return UNITY_END();
}
