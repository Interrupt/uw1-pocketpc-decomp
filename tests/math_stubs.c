#include "unity.h"
#include "src/headers/math.h"

/* Other math.c functions depend on game services. Fail if a test calls
 * one accidentally; the value-stepping helper needs none of them. */
void heading_to_sine_cosine()
{
    TEST_FAIL_MESSAGE("Unexpected heading_to_sine_cosine call");
}

uint read_realtime_clock_units()
{
    TEST_FAIL_MESSAGE("Unexpected read_realtime_clock_units call");
    return 0;
}

undefined4 rand_below()
{
    TEST_FAIL_MESSAGE("Unexpected rand_below call");
    return 0;
}

long Ordinal_2005()
{
    TEST_FAIL_MESSAGE("Unexpected Ordinal_2005 call");
    return 0;
}
