#include "lighting_fixture.h"

void setUp(void) { lighting_fixture_reset(); }
void tearDown(void) { lighting_fixture_dispose(); }

static void test_each_light_selects_its_data_mode_and_extinguishes(void)
{
    setenv("UW_LIGHT_MODE", "dos", 1);
    const int modes[] = {4,2,1,3}, falloffs[] = {28,39,46,30};
    const int initial[] = {0,2,4,1}, offset[] = {0,-2,-3,0};
    slots[5] = lights[0]; lights[0][2] = 63;
    for (int i = 0; i < 4; i++) {
        lights[0][0] = 0x90 + i;
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_HEX16(0x94 + i, lights[0][0]);
        assert_mode(modes[i], falloffs[i], initial[i], offset[i]);
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_HEX16(0x90 + i, lights[0][0]);
        assert_mode(0,56,5,-3);
    }
    TEST_ASSERT_EQUAL_INT(0, message);
}
static void test_extinguishing_one_source_keeps_the_other_source(void)
{
    setenv("UW_LIGHT_MODE", "dos", 1);
    slots[5] = lights[0]; slots[8] = lights[1];
    lights[0][0] = 0x94; lights[0][2] = 63; lights[1][0] = 0x95;
    refresh_player_equipment_effects(); assert_mode(4,28,0,0);
    use_light_source(lights[0], 1); assert_mode(2,39,2,-2);
    TEST_ASSERT_EQUAL_HEX8(0x23, (byte)player[99]); /* source slot index 3 */
}
static void test_held_light_and_intrinsic_light_compete_by_strength(void)
{
    setenv("UW_LIGHT_MODE", "dos", 1);
    lights[0][0] = 0x96; g_selected_object = (char *)lights[0];
    refresh_player_equipment_effects(); assert_mode(1,46,4,-3);
    player[0x5f] = 0x40; player[0x3e] = 0x30; /* one light effect, mode 3 */
    refresh_player_equipment_effects(); assert_mode(3,30,1,0);
    g_selected_object = NULL;
    refresh_player_equipment_effects(); assert_mode(3,30,1,0);
}
static void test_night_vision_transition_reloads_palette_and_shades(void)
{
    /* A nonempty install prefix must survive both path constructions. */
    strcpy((char *)DAT_0023cca8_backing, "\\DATA\\..");
    load_shading_level_config(5); assert_mode(5,21,0,0);
    byte mono[4096], normal[4096];
    int h = uw_file_open_read("\\DATA\\MONO.DAT");
    TEST_ASSERT_EQUAL_INT(4096, uw_file_read(h, mono, 4096)); uw_file_close(h);
    TEST_ASSERT_EQUAL_MEMORY(mono, mappings, 4096);
    load_shading_level_config(2); assert_mode(2,39,2,-2);
    h = uw_file_open_read("\\DATA\\LIGHT.DAT");
    TEST_ASSERT_EQUAL_INT(4096, uw_file_read(h, normal, 4096)); uw_file_close(h);
    TEST_ASSERT_EQUAL_MEMORY(normal, mappings, 4096);
    TEST_ASSERT_EQUAL_INT(2, rebuilds);
    load_shading_level_config(2); TEST_ASSERT_EQUAL_INT(2, rebuilds);
}
static ushort draw_one_texel(int inverse_depth)
{
    int gradients[32] = {0}, left[32] = {0}, right[32] = {0};
    int clip[] = {0,0,1,1}; ushort pixel = 0;
    left[0x30/4] = (0x1000000 / inverse_depth) * 4;
    right[0x28/4] = 1 << 14;
    raster_textured_span(1, (intptr_t)&pixel, (intptr_t)gradients,
                        (intptr_t)left, (intptr_t)right, 1, 1, 0, clip, 88);
    return pixel;
}
static void test_textured_surfaces_use_palette_mapping_and_light_strength(void)
{
    setenv("UW_LIGHT_MODE", "dos", 1);
    load_shading_level_config(0);
    /* A near wall changes from shade 6 (no light) to shade 2 (lantern). */
    ushort dark = draw_one_texel(512); /* 187.5 world units, ~0.73 tile */
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[(byte)mappings[6*256+88]], dark);
    load_shading_level_config(4);
    ushort lit = draw_one_texel(512);
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[(byte)mappings[2*256+88]], lit);
    TEST_ASSERT_NOT_EQUAL(dark, lit);
    DAT_000842b0 = -80; TEST_ASSERT_EQUAL_HEX16(lit, draw_one_texel(512));
    TEST_ASSERT_EQUAL_HEX16(g_palette_rgb565_backing[(byte)mappings[14*256+88]], draw_one_texel(8192));
}
static ushort draw_at_world_depth(float depth)
{
    int gradients[32] = {0}, left[32] = {0}, right[32] = {0};
    int clip[] = {0,0,1,1}; ushort pixel = 0;
    /* tmap.c supplies w = depth / 1500. raster_edge_setup stores 1/w
       scaled by 0x46800000 (16384.0f); the span shifts that by two. */
    left[0x30/4] = (int)(16384.0f / (depth / 1500.0f));
    right[0x28/4] = 1 << 14;
    raster_textured_span(1, (intptr_t)&pixel, (intptr_t)gradients,
                        (intptr_t)left, (intptr_t)right, 1, 1, 0, clip, 88);
    return pixel;
}
static void test_wall_light_falloff_at_known_world_distances(void)
{
    setenv("UW_LIGHT_MODE", "dos", 1);
    /* One tile is 256 world units. Offset samples by 16 units to avoid
       integer perspective rounding at an exact eighth-tile boundary. */
    const float depths[] = {144,272,528,784};
    const int modes[] = {2,4}; /* torch, lantern */
    const int shades[2][4] = {{2,4,9,14}, {1,3,7,10}};
    for (int light = 0; light < 2; light++) {
        load_shading_level_config(modes[light]);
        for (int distance = 0; distance < 4; distance++) {
            ushort expected = g_palette_rgb565_backing[
                (byte)mappings[shades[light][distance]*256+88]];
            TEST_ASSERT_EQUAL_HEX16(expected, draw_at_world_depth(depths[distance]));
        }
    }
}
static void test_spent_light_does_not_change_shading(void)
{
    load_shading_level_config(0);
    slots[5] = lights[0]; lights[0][0] = 0x91; lights[0][2] = 0;
    use_light_source(lights[0], 1);
    TEST_ASSERT_EQUAL_HEX16(0x91, lights[0][0]);
    TEST_ASSERT_EQUAL_INT(0x7c, message);
    assert_mode(0,56,5,-3);
}
static void test_daylight_override_is_preserved(void)
{
    DAT_002020d8 = 1; refresh_player_equipment_effects(); assert_mode(6,18,0,0);
}
static void test_arm_mode_toggles_rgb_bias_and_updates_automap_light_grid(void)
{
    /* ARM renders through RGB bias; both modes still update automap discovery. */
    for (int explicit_mode = 0; explicit_mode < 2; explicit_mode++) {
        if (explicit_mode) setenv("UW_LIGHT_MODE", "arm", 1);
        slots[5] = lights[0]; lights[0][2] = 63; lights[0][0] = 0x91;
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_HEX16(0x95, lights[0][0]);
        TEST_ASSERT_EQUAL_INT(-24, DAT_000842b0);
        TEST_ASSERT_EQUAL_HEX8(0x20, (byte)player[99]);
        TEST_ASSERT_EQUAL_INT(2, DAT_000872a0);
        TEST_ASSERT_GREATER_THAN_INT(0, rebuilds);
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_HEX16(0x91, lights[0][0]);
        TEST_ASSERT_EQUAL_INT(8, DAT_000842b0);
    }
}
static void test_arm_surfaces_use_original_rgb_lut_and_clamps(void)
{
    g_palette_rgb565_backing[88] = 0xffff;
    TEST_ASSERT_EQUAL_INT(4096, DAT_000b5638_backing[0]);
    TEST_ASSERT_EQUAL_INT(3276, DAT_000b5638_backing[32]);
    TEST_ASSERT_EQUAL_INT(25, DAT_000b5638_backing[159]);
    set_ambient_bias_with_light(0);
    TEST_ASSERT_EQUAL_HEX16(0xffff, draw_one_texel(512)); /* distance 32 - 32 */
    TEST_ASSERT_EQUAL_HEX16(0xffff, draw_one_texel(128)); /* near clamp */
    TEST_ASSERT_EQUAL_HEX16(0xc658, draw_one_texel(1024)); /* distance 64 - 32 */
    set_ambient_bias_without_light(0);
    TEST_ASSERT_EQUAL_HEX16(0xbdf7, draw_one_texel(512)); /* distance 32 + 8 */
    TEST_ASSERT_EQUAL_HEX16(0, draw_one_texel(8192)); /* far clamp */
    setenv("UW_LIGHT_MODE", "arm", 1);
    TEST_ASSERT_EQUAL_HEX16(0xbdf7, draw_one_texel(512));
    setenv("UW_LIGHT_MODE", "unknown", 1);
    TEST_ASSERT_EQUAL_HEX16(0xbdf7, draw_one_texel(512));
}
static void test_ambient_bias_calibration_restores_default_and_env_override(void)
{
    g_ambient_bias_reduction = 64;
    set_ambient_bias_with_light(0); TEST_ASSERT_EQUAL_INT(32, DAT_000842b0);
    set_ambient_bias_without_light(0); TEST_ASSERT_EQUAL_INT(72, DAT_000842b0);
    setenv("UW_AMBIENT_BIAS_REDUCTION", "0", 1);
    set_ambient_bias_with_light(0); TEST_ASSERT_EQUAL_INT(-32, DAT_000842b0);
    set_ambient_bias_without_light(0); TEST_ASSERT_EQUAL_INT(8, DAT_000842b0);
    setenv("UW_AMBIENT_BIAS_REDUCTION", "-8", 1);
    set_ambient_bias_with_light(0); TEST_ASSERT_EQUAL_INT(-40, DAT_000842b0);
    set_ambient_bias_without_light(0); TEST_ASSERT_EQUAL_INT(0, DAT_000842b0);
    g_palette_rgb565_backing[88] = 0xffff;
    TEST_ASSERT_EQUAL_HEX16(0xc658, draw_one_texel(512));
    setenv("UW_AMBIENT_BIAS_REDUCTION", "8", 1);
    set_ambient_bias_without_light(0); TEST_ASSERT_EQUAL_INT(16, DAT_000842b0);
    TEST_ASSERT_EQUAL_HEX16(0xad95, draw_one_texel(512));
}
static void test_arm_light_types_step_bias_by_sixteen_and_keep_calibration(void)
{
    const int strengths[] = {4,2,1,3}; /* lantern, torch, candle, taper */
    slots[5] = lights[0]; lights[0][2] = 63;
    g_ambient_bias_reduction = 64;
    for (int type = 0; type < 4; type++) {
        lights[0][0] = 0x90 + type;
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_INT(72 - strengths[type]*16, DAT_000842b0);
        use_light_source(lights[0], 1);
        TEST_ASSERT_EQUAL_INT(72, DAT_000842b0);
    }
    /* Source index 3 must not affect the strength calculation. */
    slots[5] = NULL; slots[8] = lights[1]; lights[1][0] = 0x95;
    refresh_player_equipment_effects();
    TEST_ASSERT_EQUAL_HEX8(0x23, (byte)player[99]);
    TEST_ASSERT_EQUAL_INT(40, DAT_000842b0);
    /* An intrinsic light stronger than the torch wins, using the same steps. */
    player[0x5f] = 0x40; player[0x3e] = 0x30;
    refresh_player_equipment_effects(); TEST_ASSERT_EQUAL_INT(24, DAT_000842b0);
    setenv("UW_AMBIENT_BIAS_REDUCTION", "0", 1);
    refresh_player_equipment_effects(); TEST_ASSERT_EQUAL_INT(-40, DAT_000842b0);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_each_light_selects_its_data_mode_and_extinguishes);
    RUN_TEST(test_extinguishing_one_source_keeps_the_other_source);
    RUN_TEST(test_held_light_and_intrinsic_light_compete_by_strength);
    RUN_TEST(test_night_vision_transition_reloads_palette_and_shades);
    RUN_TEST(test_textured_surfaces_use_palette_mapping_and_light_strength);
    RUN_TEST(test_wall_light_falloff_at_known_world_distances);
    RUN_TEST(test_spent_light_does_not_change_shading);
    RUN_TEST(test_daylight_override_is_preserved);
    RUN_TEST(test_arm_mode_toggles_rgb_bias_and_updates_automap_light_grid);
    RUN_TEST(test_arm_surfaces_use_original_rgb_lut_and_clamps);
    RUN_TEST(test_ambient_bias_calibration_restores_default_and_env_override);
    RUN_TEST(test_arm_light_types_step_bias_by_sixteen_and_keep_calibration);
    return UNITY_END();
}
