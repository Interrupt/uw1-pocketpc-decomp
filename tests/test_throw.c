#include "unity.h"
#include "uw.h"
#include <stdio.h>
#include <stdlib.h>
#include "throw_test_globals.h"

/* Real throw, snapshot, physics sweep, tile relinking and landing.
   A flat floor and one optional wall are supplied at the map boundary. */
static ushort arena[0x4000], held[4];
static char character[256], game_mode[32];
static int cursor_y, mobile_allocations, static_allocations, freed;
static bool wall, bridge_fixture;
static byte bridge_heights[3];
static int bridge_count;
static ushort *thrown;
static short fine(ushort *object, int offset)
{ short value; memcpy(&value, (byte *)object + offset, 2); return value; }
void *alloc_object_slot(int mobile)
{
    if (mobile) { mobile_allocations++; return (char *)arena + 0x4000 + 2 * 27; }
    static_allocations++;
    return (char *)arena + 0x5b00 + 8;
}
void free_object_slot(void *object) { freed++; }
int encode_object_slot_index(void *object)
{
    return (char *)object < DAT_002046c4 ? ((char *)object-DAT_002046b8)/27
        : 256+((char *)object-DAT_002046c4)/8;
}
void *tilemap_lookup(int x, int y)
{ TEST_ASSERT_TRUE(x>=0 && x<64 && y>=0 && y<64); return (byte *)arena + (y*64+x)*4; }
void *resolve_object_link(ushort *head)
{
    unsigned slot=*head>>6;
    return !slot ? NULL : slot<256 ? DAT_002046b8+slot*27 : DAT_002046c4+(slot-256)*8;
}
void *FUN_000535fc(int slot)
{ return slot<256 ? DAT_002046b8+slot*27 : DAT_002046c4+(slot-256)*8; }
void FUN_00057504(short *x, short *y) { *x=141; *y=cursor_y; }
long Ordinal_2005(int divisor, int dividend) { TEST_ASSERT_NOT_EQUAL(0,divisor); return dividend/divisor; }
long Ordinal_1053(void) { return 0; }
void angle_to_screen_delta(int heading, short *x, short *y)
{
    /* Original fixed-point compass, cardinal headings used by this fixture. */
    switch ((ushort)heading) {
    case 0: *x=0; *y=32767; break;
    case 0x8000: *x=0; *y=-32768; break;
    case 0x4000: *x=-32768; *y=0; break;
    case 0xc000: *x=32767; *y=0; break;
    default: TEST_FAIL_MESSAGE("Unexpected non-cardinal heading");
    }
}
void collision_build_height_field(int step)
{
    DAT_002049d4 = wall && g_sweep_foot_pos[1]>=88 ? 0 : 4;
}
void collision_height_envelope(void)
{
    DAT_002049d6=0;
    DAT_002049d8=DAT_002049d9=wall && g_sweep_foot_pos[1]>=88 ? 128 : 0;
    DAT_002049dc=DAT_002049dd=DAT_002049de=0;
    if(bridge_fixture) {
        for(int i=0;i<bridge_count;i++) {
            byte *record=DAT_00202c38_backing+i*6;
            record[0]=bridge_heights[i]; /* top */
            record[1]=bridge_heights[i]-2; /* underside */
            *(ushort *)(record+2)=(300+i)<<6;
            *(short *)(record+4)=0; /* same tile */
            ushort *bridge=FUN_000535fc(300+i);
            bridge[0]=0x164;
            bridge[1]=bridge_heights[i]-2;
        }
        DAT_002049dc=bridge_count;
    }
}
void resolve_wall_slide_corner(void) { DAT_002049da=9; }
undefined4 check_object_drop_height(void) { return 1; }
undefined4 object_ptr_in_arena(void) { return 1; }
undefined4 play_sound_effect_at_object(void) { return 0; }
undefined4 play_sound_effect_with_pan(void) { return 0; }
undefined4 apply_typed_damage_to_object(void) { return 0; }
undefined4 roll_object_destroy_chance(void) { return 0; }
undefined4 spawn_scheduled_effect_object(void) { return 0; }
void print_scroll_message_by_id(void) {}
void FUN_00049924(void) {}
void spawn_effect_debris_burst(void) {}
void scheduler_relink_entry(void) {}
void set_ambient_bias_without_light(void) {}
undefined4 activate_area_hazard_object(void) { return 1; }
ushort *discard_misplaced_object(void *list, ushort *object, int destroy)
{
    if (!destroy) return object;
    object_list_unlink(list,object);
    free_object_slot(object);
    return NULL;
}
ushort *settle_dropped_object(ushort *object, int x, int y, int mode) { return object; }
ushort *reallocate_object_to_arena(void) { TEST_FAIL_MESSAGE("Unexpected reallocation during flight"); return NULL; }
void project_position_by_heading(void) { TEST_FAIL_MESSAGE("Throw took the ground-drop path"); }
undefined4 FUN_00051fa0(void) { return 1; }

int FUN_00050aa8(void) { return 0; }
undefined4 FUN_000546c4(int contact, int slot)
{
    if(bridge_fixture && contact>=0) TEST_ASSERT_LESS_THAN_INT(bridge_count,contact);
    else TEST_ASSERT_EQUAL_INT(-1,contact);
    TEST_ASSERT_TRUE(slot==1 || slot==2);
    return 4;
}
void FUN_00055ef8(void) {}
void object_list_append_tail(void) { TEST_FAIL_MESSAGE("Throw took the ground-drop path"); }
undefined4 play_positional_sound_effect(void) { return 0; }

bool apply_swim_wade_pose(void) { TEST_FAIL_MESSAGE("Unexpected water"); return false; }

void setUp(void)
{
    unsetenv("UW_PLAYER_NO_BOUNCE");
    memset(arena,0,sizeof arena); memset(held,0,sizeof held);
    memset(character,0,sizeof character); memset(game_mode,0,sizeof game_mode);
    memset(DAT_00202c90_backing,0,sizeof DAT_00202c90_backing);
    memset(DAT_00204920_backing,0,sizeof DAT_00204920_backing);
    memset(DAT_00086998_backing,0,sizeof DAT_00086998_backing);
    memset(DAT_002049c8_backing,0,sizeof DAT_002049c8_backing);
    memset(DAT_002049a0_backing,0,sizeof DAT_002049a0_backing);
    DAT_00085a6c=(short *)game_mode; *(short *)(game_mode+16)=1;
    DAT_00086df8=character;
    DAT_002046b8=(char *)arena+0x4000; DAT_002046c4=(char *)arena+0x5b00;
    g_player_object=(ushort *)(DAT_002046b8+27);
    g_player_object[0]=0x7f;
    g_player_object[1]=48 | (4<<13) | (4<<10);
    g_player_object[0xb]=(10<<10)|(10<<4);
    held[0]=0x80; held[2]=20;
    g_sweep_foot_pos=(short *)DAT_002049c8_backing;
    DAT_002049a8=(undefined1 *)collision_response_mobile_object;
    /* Use the real COMOBJ properties for the player and thrown sack. */
    FILE *props=fopen(UW_TEST_DATA_DIR "/DATA/COMOBJ.DAT","rb");
    TEST_ASSERT_NOT_NULL(props);
    const int property_ids[]={0x7f,0x80,0x164};
    for(unsigned row=0;row<sizeof property_ids/sizeof property_ids[0];row++) {
        int type=property_ids[row];
        byte disk[11];
        TEST_ASSERT_EQUAL_INT(0,fseek(props,2+type*11,SEEK_SET));
        TEST_ASSERT_EQUAL_UINT(11,fread(disk,1,11,props));
        memcpy(DAT_00202c90_backing+type*13,disk,4);
        memcpy(DAT_00202c90_backing+type*13+5,disk+4,7);
    }
    fclose(props);
    DAT_000869a8_backing[0]=0; DAT_000869a8_backing[1]=0;
    DAT_000869a8_backing[4]=0; DAT_000869a8_backing[5]=0xc0;
    cursor_y=55; wall=bridge_fixture=false; bridge_count=0;
    mobile_allocations=static_allocations=freed=0;
    thrown=NULL;
}
void tearDown(void) { unsetenv("UW_PLAYER_NO_BOUNCE"); }
static void launch(void)
{
    TEST_ASSERT_EQUAL_UINT(1,drop_held_object_near_player(held,1));
    TEST_ASSERT_EQUAL_INT(1,mobile_allocations);
    TEST_ASSERT_EQUAL_INT(0,static_allocations);
    TEST_ASSERT_EQUAL_INT(1,freed); /* original inventory record */
    thrown=(ushort *)(DAT_002046b8+2*27);
    TEST_ASSERT_EQUAL_UINT16(0x80,thrown[0]&0x1ff);
}
static void tick(void)
{ DAT_0010190c=thrown; mobile_object_tick(); }
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
static void test_player_no_bounce_is_disabled_by_default_and_by_zero(void)
{
    hard_player_landing();
    TEST_ASSERT_GREATER_THAN_INT(0,g_vertical_velocity);
    setenv("UW_PLAYER_NO_BOUNCE","0",1);
    hard_player_landing();
    TEST_ASSERT_GREATER_THAN_INT(0,g_vertical_velocity);
}
static void test_player_no_bounce_stops_the_player_on_first_landing(void)
{
    setenv("UW_PLAYER_NO_BOUNCE","1",1);
    hard_player_landing();
    TEST_ASSERT_EQUAL_INT(0,DAT_00204884);
    TEST_ASSERT_EQUAL_INT(0,g_vertical_velocity);
    TEST_ASSERT_EQUAL_INT(0,g_fall_accel);
    TEST_ASSERT_EQUAL_UINT(0,DAT_002048a8&0x10);
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
    collision_height_envelope();
    reticle_object_pick();
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
    RUN_TEST(test_player_no_bounce_is_disabled_by_default_and_by_zero);
    RUN_TEST(test_player_no_bounce_stops_the_player_on_first_landing);
    RUN_TEST(test_player_no_bounce_preserves_thrown_item_wall_bounces);
    RUN_TEST(test_falling_selects_the_highest_bridge_below_the_player);
    RUN_TEST(test_falling_player_lands_on_bridge_across_fall_speeds);
    return UNITY_END();
}
