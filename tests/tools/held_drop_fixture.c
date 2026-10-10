#include "src/headers/uw.h"
#include "src/headers/debug.h"
#include <assert.h>
#include <stdarg.h>
#include <math.h>

static _Alignas(8) byte records[2][48], player[32], tile[4];
static short game[16];
short *DAT_00085a6c=game;
uw_mobile_object_t *g_player_object=(uw_mobile_object_t *)player;
uw_object_type_props_t g_object_type_props[512];
ushort *DAT_00202a44;
short DAT_00202a38;
ushort DAT_00202a48,DAT_00202a4c,DAT_00202a50,DAT_00202a54;
undefined1 DAT_00204880_backing[128];
static unsigned seed,mode,mutation,projections,clearances,spawns,frees,inserts,settles,sounds,lights;
static uint64_t events;
static uw_object_hdr_t *held(void) { return (uw_object_hdr_t *)(records[0]+4); }
static uw_projectile_object_t *projectile(void) { return (uw_projectile_object_t *)(records[1]+4); }
static void observe(unsigned kind)
{
    events=events*31+kind;
    for (unsigned i=0;i<sizeof records;++i) events=events*31+((byte *)records)[i];
    for (unsigned i=0;i<sizeof player;++i) events=events*31+player[i];
    for (unsigned i=0;i<sizeof tile;++i) events=events*31+tile[i];
    events=events*31+DAT_00202a38; events=events*31+DAT_00202a48;
    events=events*31+DAT_00202a4c; events=events*31+DAT_00202a50; events=events*31+DAT_00202a54;
    events=events*31+(DAT_00202a44==(ushort *)g_player_object);
}
static void argument(int value) { events=events*31+(uint)value; }
bool compute_drop_aim_from_cursor(void) { observe(1); return mode!=6; }
uw_object_hdr_t *spawn_object_near_player(void)
{
    observe(2); ++spawns;
    assert(DAT_00202a54==1 && DAT_00202a44==(ushort *)g_player_object);
    if (mutation) { held()->type_flags^=0xaaaa; held()->link_word^=0x5555; }
    return mode==1 || mode==7 ? NULL : &projectile()->hdr;
}
void free_object_slot(uw_object_hdr_t *p) { assert(p==held()); observe(3); ++frees; }
void project_position_by_heading(int heading,short distance,void *x,void *y)
{
    observe(4); argument(heading); argument(distance); argument(*(ushort *)x); argument(*(ushort *)y);
    ++projections; *(ushort *)x=(*(ushort *)x+distance)&511; *(ushort *)y=(*(ushort *)y-distance)&511;
    if (mutation) held()->position_word^=0xaaaa;
}
int check_object_placement_clearance(short type,short slot,short x,short y,short z,int check,byte step)
{
    observe(5); argument(type); argument(slot); argument(x); argument(y); argument(z); argument(check); argument(step);
    assert(slot==0 && check==1); ++clearances;
    if (mutation) held()->position_word^=0x5555;
    return mode==2 || mode==7 || (mode==3 && clearances==2) ? 0 : 1;
}
void *tilemap_lookup(short x,short y)
{
    observe(6); argument(x); argument(y);
    if (mutation) held()->position_word^=0xa5a5;
    return mode==5 ? NULL : tile;
}
void print_scroll_message_by_id(uint id) { assert(id==0xfd); observe(7); }
int play_sound_effect_with_pan(uint id,byte pan,uint volume)
{ assert(id==15 && pan==64 && volume==0xf6); observe(8); ++sounds; return 0; }
void DEBUG_impl(DebugLevel level,const char *file,int line,const char *fmt,...)
{
    (void)file; (void)line; (void)fmt; assert(level==INFO); observe(9);
    va_list args; va_start(args,fmt); argument(va_arg(args,unsigned)); argument(va_arg(args,int)); argument(va_arg(args,int)); va_end(args);
}
void object_list_append_tail(ushort *link,uw_object_hdr_t *p)
{
    assert((byte *)link==tile+2 && p==held()); observe(10); ++inserts;
    p->next=*link>>6; *link=(*link&63)|(257<<6);
    if (mutation && mode>=8) p->object_id=0x94+(seed%3);
}
void set_ambient_bias_without_light(char value) { assert(value==0); observe(11); ++lights; }
uw_object_hdr_t *settle_dropped_object(void *p,short x,short y,int skip)
{ assert(p==held() && skip==1); observe(12); argument(x); argument(y); ++settles; return p; }
#include "held_drop_functions.c"

struct result {
    byte records[sizeof records],player[sizeof player],tile[sizeof tile];
    ushort globals[6];
    unsigned counts[8];
    int value;
    uint64_t events;
};
static struct result run(int reference)
{
    projections=clearances=spawns=frees=inserts=settles=sounds=lights=0; events=0;
    memset(records,0xa5,sizeof records); memset(player,0x5a,sizeof player); memset(tile,0x3c,sizeof tile); memset(game,0,sizeof game);
    held()->type_flags=seed; held()->position_word=(ushort)(seed*37); held()->chain_word=seed^0xaaaa; held()->link_word=seed^0x5555;
    projectile()->hdr.type_flags=seed^0xaaaa; projectile()->hdr.link_word=seed^0xffff;
    g_player_object->hdr.object_id=0x7f; g_player_object->hdr.position_word=(ushort)(seed*17);
    g_player_object->npc_xhome=seed&63; g_player_object->npc_yhome=(seed>>6)&63; g_player_object->npc_heading=seed&31;
    for (unsigned i=0;i<512;++i) { g_object_type_props[i].collision_radius=i&7; g_object_type_props[i].class_flags=i&3; }
    game[8]=mode==0 || mode==1 || mode==6 || mode==7 ? 1 : 0;
    DAT_00202a44=NULL; DAT_00202a38=0; DAT_00202a48=DAT_00202a4c=DAT_00202a50=DAT_00202a54=0;
    int value=reference ? reference_drop_held_object_near_player(held(),seed&1) : drop_held_object_near_player(held(),seed&1);
    assert(spawns<=1 && frees<=1 && inserts<=1 && settles==inserts && lights<=1);
    assert(value==0 || value==1);
    struct result result={0};
    memcpy(result.records,records,sizeof records); memcpy(result.player,player,sizeof player); memcpy(result.tile,tile,sizeof tile);
    ushort globals[]={DAT_00202a38,DAT_00202a48,DAT_00202a4c,DAT_00202a50,DAT_00202a54,DAT_00202a44==(ushort *)g_player_object};
    unsigned counts[]={projections,clearances,spawns,frees,inserts,settles,sounds,lights};
    memcpy(result.globals,globals,sizeof globals); memcpy(result.counts,counts,sizeof counts);
    result.value=value; result.events=events; return result;
}
int main(void)
{
    unsetenv("UW_DEBUG_THROW");
    for (seed=0;seed<65536;++seed) for (mode=0;mode<10;++mode) for (mutation=0;mutation<2;++mutation) {
        struct result old=run(1),current=run(0);
        assert(!memcmp(old.records,current.records,sizeof records));
        assert(!memcmp(old.player,current.player,sizeof player) && !memcmp(old.tile,current.tile,sizeof tile));
        assert(!memcmp(old.globals,current.globals,sizeof old.globals));
        assert(!memcmp(old.counts,current.counts,sizeof old.counts));
        assert(old.value==current.value && old.events==current.events);
    }
    puts("1310720 held-drop cases preserve projectile/header bytes, callbacks, clearance retries, light IDs and fallback behavior");
    return 0;
}
