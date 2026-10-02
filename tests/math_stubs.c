#include "unity.h"
#include "src/headers/math.h"

/* Other math.c functions depend on game services. Fail if a test calls
 * one accidentally; the value-stepping helper needs none of them.
 * heading_to_sine_cosine is NOT stubbed here -- it's a real, self-
 * contained function fully defined within math.c itself (linked whole),
 * not an external dependency. */

/* angle_to_screen_delta/lookup_arctan_primary_range/lookup_arctan_reciprocal_range
 * and heading_to_sine_cosine (all in math.c, linked whole) index into these
 * real sin/cos/arctan lookup tables, but no test here calls them --
 * zero-filled storage only to satisfy the linker. */
const short DAT_00085d48_sine[260];
const short DAT_00085f50_cosine[260];
undefined1 DAT_00086260_backing[1024];
undefined1 DAT_00086264_backing[1024];
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
