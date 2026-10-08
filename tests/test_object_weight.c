#include "src/headers/objects.h"
#include "src/headers/containers.h"
#include "unity.h"

uw_object_type_props_t g_object_type_props[512];
static uw_object_hdr_t object;
static int contents_calls;
static short contents_weight;

/* The chain traversal is a separate boundary. Assert that the migrated
 * caller passes the real packed link word, not a scaled struct offset. */
void sum_container_weight(ushort *link, short *weight)
{
    TEST_ASSERT_EQUAL_PTR((byte *)&object + 6, link);
    ++contents_calls;
    *weight += contents_weight;
}

void setUp(void)
{
    memset(g_object_type_props, 0, sizeof g_object_type_props);
    memset(&object, 0, sizeof object);
    object.item_id = 0x80;
    g_object_type_props[0x80].unit_weight = 12;
    contents_calls = 0;
    contents_weight = 60;
}
void tearDown(void) {}

static void test_single_item_weight(void)
{
    object.owner = 47;
    TEST_ASSERT_EQUAL_UINT(12, calculate_object_weight(&object));
    TEST_ASSERT_EQUAL_INT(0, contents_calls);
}
static void test_stack_quantity_weight(void)
{
    object.is_quant = 1;
    object.owner = 47;
    object.link = 7;
    TEST_ASSERT_EQUAL_UINT(84, calculate_object_weight(&object));
    TEST_ASSERT_EQUAL_INT(0, contents_calls);
}
static void test_special_property_is_not_a_quantity(void)
{
    object.is_quant = 1;
    object.link = 600;
    TEST_ASSERT_EQUAL_UINT(12, calculate_object_weight(&object));
    TEST_ASSERT_EQUAL_INT(0, contents_calls);
}
static void test_contents_add_to_base_weight(void)
{
    object.link = 2;
    TEST_ASSERT_EQUAL_UINT(72, calculate_object_weight(&object));
    TEST_ASSERT_EQUAL_INT(1, contents_calls);
}
int main(void)
{
    UNITY_BEGIN();
    RUN_TEST(test_single_item_weight);
    RUN_TEST(test_stack_quantity_weight);
    RUN_TEST(test_special_property_is_not_a_quantity);
    RUN_TEST(test_contents_add_to_base_weight);
    return UNITY_END();
}
