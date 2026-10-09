#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(4) byte records[2][32];
static _Alignas(4) byte tile[4];
static unsigned allocation, failure, insertions, frees, indices;
static unsigned seed, mutations;
static uint64_t events;

static uw_object_hdr_t *object(unsigned slot)
{ return (uw_object_hdr_t *)(records[slot] + 4); }
static void observe(unsigned kind)
{
    events = events * 31 + kind;
    for (unsigned j = 0; j < sizeof records; ++j)
        events = events * 31 + ((byte *)records)[j];
    for (unsigned j = 0; j < sizeof tile; ++j) events = events * 31 + tile[j];
}
uw_object_hdr_t *alloc_object_slot(int region)
{
    assert(region == 0 && allocation < 2);
    observe(1 + allocation);
    ++allocation;
    return failure == allocation ? NULL : object(allocation - 1);
}
void free_object_slot(uw_object_hdr_t *p)
{ assert(p == object(0)); ++frees; observe(3); }
void *tilemap_lookup(short x, short y)
{
    assert(x == (short)((int)seed - 32768));
    assert(y == (short)(seed * 37 - 65536));
    observe(4);
    return tile;
}
int encode_object_slot_index(const uw_object_hdr_t *p)
{
    assert(p == object(indices == 0 ? 1 : 0));
    ++indices; observe(5);
    if (mutations && indices == 1) {
        /* The initializer must use fields read after this callback while
           retaining earlier captures only where the original did so. */
        object(0)->chain_word ^= 0xa5a5;
        object(0)->link_word ^= 0x5a5a;
    }
    return p == object(0) ? 0x101 : (seed & 0x3ff);
}
void object_list_insert_head(ushort *link, uw_object_hdr_t *p)
{
    assert((byte *)link == tile + 2);
    assert(p == object(insertions));
    ++insertions; observe(6);
    p->next = *(ushort *)(tile + 2) >> 6;
    *(ushort *)(tile + 2) = (*(ushort *)(tile + 2) & 63) | (insertions == 1 ? 257 : 258) << 6;
    if (mutations && insertions == 1) {
        object(1)->type_flags ^= 0xaaaa;
        object(1)->position_word ^= 0x5555;
        tile[0] ^= 0xfe;
    }
}

#include "trap_pair_functions.c"

static uint64_t run(int (*function)(int,int,uint))
{
    uint64_t hash = 1;
    for (seed = 0; seed < 65536; ++seed) {
        for (mutations = 0; mutations < 2; ++mutations) {
            for (failure = 0; failure < 3; ++failure) {
                for (unsigned j = 0; j < sizeof records; ++j)
                    ((byte *)records)[j] = (seed >> (j & 7)) + j * 31;
                for (unsigned j = 0; j < sizeof tile; ++j) tile[j] = seed >> ((j & 1) * 8);
                allocation = insertions = indices = frees = 0; events = 0;
                int result = function((int)seed - 32768, seed * 37 - 65536,
                                      (seed << 16) | (seed ^ 0xa55a));
                assert(result == (failure ? 0 : 257));
                assert(allocation == (failure == 1 ? 1 : 2));
                assert(frees == (failure == 2));
                assert(insertions == (failure ? 0 : 2));
                hash = hash * 31 + events;
                hash = hash * 31 + result;
                for (unsigned j = 0; j < sizeof records; ++j)
                    hash = hash * 31 + ((byte *)records)[j];
                for (unsigned j = 0; j < sizeof tile; ++j) hash = hash * 31 + tile[j];
            }
        }
    }
    return hash;
}
int main(void)
{
    assert(run(create_scripted_trap_pair_at_tile) == run(reference_create_scripted_trap_pair_at_tile));
    puts("393216 trap-pair cases preserve records, guard bytes, callback observations and allocation failures");
}
