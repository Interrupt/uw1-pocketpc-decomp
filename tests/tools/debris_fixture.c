#include "src/headers/uw.h"
#include <assert.h>

static _Alignas(4) byte records[5][32], source[16], tile[4];
static unsigned seed, mode, allocation, scheduled, random_calls, insertions, frees;
static uint rng;
static uint64_t events;
static uint tile_x;
static int tile_y;
static uw_object_hdr_t *object(unsigned slot)
{ return (uw_object_hdr_t *)(records[slot] + 4); }
static uw_object_hdr_t *template_object(void)
{ return (uw_object_hdr_t *)(source + 3); }
static void observe(unsigned kind)
{
    events = events * 31 + kind;
    for (unsigned i=0; i<sizeof records; ++i) events=events*31+((byte *)records)[i];
    for (unsigned i=0; i<sizeof source; ++i) events=events*31+source[i];
    for (unsigned i=0; i<sizeof tile; ++i) events=events*31+tile[i];
}
long ce_rand(void)
{
    observe(1); ++random_calls;
    assert(random_calls < 1024);
    rng = rng * 1664525U + 1013904223U;
    if ((mode & 1) && allocation) {
        /* Calls between coordinate captures and their stores may alter the
           object. Earlier scalar captures and later field reads differ. */
        object(allocation-1)->type_flags ^= 0xfe00;
        object(allocation-1)->position_word ^= (ushort)(rng >> 16);
        template_object()->chain_word ^= (ushort)rng;
    }
    return (rng >> 16) & 0x7fff;
}
uw_object_hdr_t *alloc_object_slot(int region)
{
    assert(region == 0 && allocation < 5);
    observe(2); return object(allocation++);
}
void *tilemap_lookup(short x, short y)
{
    assert(x == (short)tile_x && y == (short)tile_y);
    observe(3); return tile;
}
void object_list_insert_head(ushort *link, uw_object_hdr_t *p)
{
    assert((byte *)link == tile+2 && p == object(allocation-1));
    observe(4); ++insertions;
    p->next = *(ushort *)(tile+2) >> 6;
    *(ushort *)(tile+2) = (*(ushort *)(tile+2) & 63) | allocation << 6;
    if (mode & 1) {
        p->position_word ^= 0x5a5a;
        template_object()->type_flags ^= 0x0101;
    }
}
void object_list_unlink(ushort *link, uw_object_hdr_t *p)
{
    assert((byte *)link == tile+2 && p == object(allocation-1));
    observe(5); *(ushort *)(tile+2) &= 63;
}
void free_object_slot(uw_object_hdr_t *p)
{ assert(p == object(allocation-1)); observe(6); ++frees; }
int encode_object_slot_index(const uw_object_hdr_t *p)
{ assert(p == object(allocation-1)); observe(7); return (seed+allocation) & 0x3ff; }
uint scheduler_add_entry(uint link, int delay, byte animation, byte x, byte y)
{
    assert(link == ((seed+allocation) & 0x3ff));
    assert(delay >= 0 && delay <= 4 && animation <= 2);
    assert(x == (byte)tile_x && y == (byte)tile_y);
    observe(8); events=events*31+link; events=events*31+delay;
    events=events*31+animation; events=events*31+x; events=events*31+y;
    ++scheduled;
    return mode/2 == scheduled ? (uint)-1 : scheduled;
}
#include "debris_functions.c"

struct result {
    byte records[sizeof records], source[sizeof source], tile[sizeof tile];
    unsigned allocation, scheduled, random_calls, insertions, frees;
    uint64_t events;
};
static struct result run(int reference)
{
    allocation=scheduled=random_calls=insertions=frees=0; events=0;
    rng=seed*37+mode; tile_x=seed*31; tile_y=(int)seed-32768;
    memset(records,0xa5,sizeof records); memset(source,0x5a,sizeof source);
    memset(tile,0x3c,sizeof tile);
    template_object()->type_flags=seed;
    template_object()->position_word=(ushort)seed;
    template_object()->chain_word=seed^0xaaaa;
    template_object()->link_word=seed^0x5555;
    if (reference) reference_spawn_effect_debris_burst(template_object(),tile_x,tile_y);
    else spawn_effect_debris_burst(template_object(),tile_x,tile_y);
    assert(allocation >= 1 && allocation <= 5 && scheduled == allocation);
    assert(insertions == allocation && frees == (mode/2 && mode/2 <= allocation));
    struct result result={0};
    memcpy(result.records,records,sizeof records); memcpy(result.source,source,sizeof source);
    memcpy(result.tile,tile,sizeof tile);
    result.allocation=allocation; result.scheduled=scheduled; result.random_calls=random_calls;
    result.insertions=insertions; result.frees=frees; result.events=events;
    return result;
}
int main(void)
{
    for (seed=0; seed<65536; ++seed) for (mode=0; mode<12; ++mode) {
        struct result old=run(1), current=run(0);
        assert(memcmp(&old,&current,sizeof old) == 0);
    }
    puts("786432 debris cases preserve header bytes, random retries, callback mutations and scheduling failures");
    return 0;
}
