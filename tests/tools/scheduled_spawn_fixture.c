#include "src/headers/uw.h"
#include <assert.h>

uw_object_type_props_t g_object_type_props[512];
undefined2 DAT_0023adb8_backing[16];
undefined1 DAT_00204880_backing[128];
short DAT_00201c70, DAT_00201b68;
static _Alignas(4) byte records[2][32], tile[4], character[512];
char *DAT_00086df8=(char *)character;
static unsigned seed, mode, door, spawned, scheduled, inserted, freed, lookups;
static uint64_t events;
static int effect_group, delay;
static byte animation;
static short adjust, tile_x, tile_y;
static ushort target_x, target_y;
static uw_object_hdr_t *object(unsigned i)
{ return (uw_object_hdr_t *)(records[i]+4); }
static void observe(unsigned kind)
{
    events=events*31+kind;
    for (unsigned i=0;i<sizeof records;++i) events=events*31+((byte *)records)[i];
    for (unsigned i=0;i<sizeof tile;++i) events=events*31+tile[i];
    for (unsigned i=0;i<sizeof character;++i) events=events*31+character[i];
}
static void argument(int value)
{ events=events*31+(uint)value; }
void project_position_by_heading(int heading, short distance, void *x, void *y)
{
    assert(door && heading==(int)DAT_00201c70>>8 && distance==11);
    observe(1); argument(*(ushort *)x); argument(*(ushort *)y);
    *(ushort *)x=target_x; *(ushort *)y=target_y;
}
void *tilemap_lookup(short x, short y)
{
    assert(x==(door ? (short)((short)target_x>>3) : tile_x));
    assert(y==(door ? (short)((short)target_y>>3) : tile_y));
    observe(2); ++lookups;
    if (mode&8) {
        object(0)->position_word^=0x0f0f;
        object(1)->position_word^=0xa5a5;
    }
    return tile;
}
int check_object_placement_clearance(short type, short slot, short x, short y, short z, int check, byte step)
{
    assert(door && type==0x1ca && slot==0 && x==(short)target_x && y==(short)target_y);
    assert(z==((*(ushort *)tile>>4 &15)<<3) && check==0 && step==0);
    observe(3); argument(z); return (mode&2) ? 0 : 1;
}
uw_object_hdr_t *spawn_new_object(uint type, int region)
{
    assert(region==0 && type==(door ? 0x1ca : 0x1c0+effect_group));
    observe(4); ++spawned;
    if (mode&8) {
        object(0)->position_word^=0x5a5a;
        object(1)->position_word^=0x3333;
    }
    return !door && (mode&2) ? NULL : object(0);
}
int encode_object_slot_index(const uw_object_hdr_t *p)
{
    assert(p==object(0)); observe(5);
    if (mode&8) object(0)->position_word^=0xaaaa;
    return (seed&0x3ff);
}
uint scheduler_add_entry(uint link, int ticks, byte anim, byte x, byte y)
{
    assert(link==(seed&0x3ff));
    assert(ticks==(door ? -1 : delay) && anim==(door ? 0 : animation));
    assert(x==(door ? (byte)((short)target_x>>3) : (byte)tile_x));
    assert(y==(door ? (byte)((short)target_y>>3) : (byte)tile_y));
    observe(6); argument(link); argument(ticks); argument(anim); argument(x); argument(y);
    ++scheduled;
    if (mode&8) { object(0)->type_flags^=0x8000; object(1)->position_word^=0x0101; }
    return (mode&1) ? (door ? 0 : (uint)-1) : 1;
}
void free_object_slot(uw_object_hdr_t *p)
{ assert(p==object(0)); observe(7); ++freed; }
static void insert(ushort *link, uw_object_hdr_t *p)
{
    assert((byte *)link==tile+2 && p==object(0)); observe(8); ++inserted;
    p->next=*(ushort *)(tile+2)>>6;
    *(ushort *)(tile+2)=(*(ushort *)(tile+2)&63)|((seed&0x3ff)<<6);
}
void object_list_insert_head(ushort *link, uw_object_hdr_t *p)
{ assert(door); insert(link,p); }
void object_list_append_tail(ushort *link, uw_object_hdr_t *p)
{ assert(!door); insert(link,p); }
#include "scheduled_spawn_functions.c"

struct result {
    byte records[sizeof records], tile[sizeof tile], character[sizeof character];
    unsigned spawned, scheduled, inserted, freed, lookups;
    int value;
    uint64_t events;
};
static struct result run(int reference)
{
    static const short adjustments[]={-32768,-256,-1,0,1,7,127,32767};
    spawned=scheduled=inserted=freed=lookups=0; events=0;
    memset(records,0xa5,sizeof records); memset(tile,0x3c,sizeof tile);
    memset(character,0x5a,sizeof character); memset(DAT_00204880_backing,0,sizeof DAT_00204880_backing);
    object(0)->type_flags=seed^0xaaaa; object(0)->position_word=seed;
    object(0)->chain_word=seed^0x5555; object(0)->link_word=seed^0xffff;
    object(1)->type_flags=seed&0x1ff; object(1)->position_word=(ushort)(seed*37);
    object(1)->chain_word=seed^0x3333; object(1)->link_word=seed^0x7777;
    for (unsigned i=0;i<512;++i) g_object_type_props[i].height=(byte)(seed+i);
    for (unsigned i=0;i<16;++i) DAT_0023adb8_backing[i]=i*3;
    DAT_00201b68=(mode&4) ? 9 : 2;
    DAT_00201c70=(short)seed; DAT_00204880=(short)(seed*3); DAT_00204882=(short)(seed*7);
    *(ushort *)tile=(ushort)seed;
    target_x=seed; target_y=(ushort)(seed*31);
    effect_group=seed&15; delay=(int)seed-32768; animation=(byte)seed;
    adjust=adjustments[seed&7]; tile_x=(short)(seed*11); tile_y=(short)(seed*13);
    int value;
    if (door) value=reference ? reference_spawn_scheduled_door_texture_object() : spawn_scheduled_door_texture_object();
    else {
        ushort *source=(mode&4) ? NULL : (ushort *)object((mode&16) ? 0 : 1);
        value=reference ? reference_spawn_scheduled_effect_object(source,effect_group,delay,animation,adjust,tile_x,tile_y)
            : spawn_scheduled_effect_object(source,effect_group,delay,animation,adjust,tile_x,tile_y);
        assert(spawned==1 && scheduled==!(mode&2));
    }
    assert(inserted==(value==1) && freed==(scheduled && (mode&1)));
    struct result result={0};
    memcpy(result.records,records,sizeof records); memcpy(result.tile,tile,sizeof tile);
    memcpy(result.character,character,sizeof character);
    result.spawned=spawned; result.scheduled=scheduled; result.inserted=inserted;
    result.freed=freed; result.lookups=lookups; result.value=value; result.events=events;
    return result;
}
int main(void)
{
    for (door=0;door<2;++door) for (seed=0;seed<65536;++seed)
        for (mode=0;mode<(door ? 16 : 32);++mode) {
            struct result old=run(1), current=run(0);
            assert(!memcmp(old.records,current.records,sizeof records));
            assert(!memcmp(old.tile,current.tile,sizeof tile));
            assert(!memcmp(old.character,current.character,sizeof character));
            assert(old.value==current.value && old.events==current.events);
            assert(old.spawned==current.spawned && old.scheduled==current.scheduled);
            assert(old.inserted==current.inserted && old.freed==current.freed && old.lookups==current.lookups);
        }
    puts("3145728 scheduled-spawn cases preserve coordinates, header bytes, aliases, callbacks and failure paths");
    return 0;
}
