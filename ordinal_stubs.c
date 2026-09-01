#include "ordinal_stubs.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void uw_pump_events(void);

long Ordinal_4()
{
    return 0;
}

long Ordinal_25()
{
    return 0;
}

long Ordinal_33()
{
    return 0;
}

long Ordinal_34()
{
    return 0;
}

long Ordinal_35()
{
    return 0;
}

long Ordinal_38()
{
    return 0;
}

long Ordinal_47()
{
    return 0;
}

long Ordinal_58()
{
    return 0;
}

long Ordinal_61()
{
    return 0;
}

long Ordinal_63()
{
    return 0;
}

long Ordinal_80()
{
    return 0;
}

long Ordinal_89()
{
    return 0;
}

long Ordinal_95()
{
    return 0;
}

long Ordinal_97()
{
    return 0;
}

long Ordinal_160()
{
    return 0;
}

long Ordinal_161()
{
    return 0;
}

long Ordinal_164()
{
    return 0;
}

long Ordinal_165()
{
    return 0;
}

long Ordinal_167()
{
    return 0;
}

long Ordinal_168()
{
    return 0;
}

long Ordinal_170()
{
    return 0;
}

long Ordinal_171()
{
    return 0;
}

long Ordinal_172()
{
    return 0;
}

long Ordinal_173()
{
    return 0;
}

long Ordinal_177()
{
    return 0;
}

long Ordinal_181()
{
    return 0;
}

long Ordinal_184()
{
    return 0;
}

long Ordinal_196()
{
    return 0;
}

long Ordinal_197()
{
    return 0;
}

long Ordinal_212()
{
    return 0;
}

long Ordinal_218()
{
    return 0;
}

long Ordinal_230()
{
    return 0;
}

long Ordinal_242()
{
    return 0;
}

void *Ordinal_246(void *a, void *b, void *c, unsigned int d)
{
    (void)a; (void)b; (void)c; (void)d;
    fprintf(stderr, "[ordinal] Ordinal_246: CreateWindow-shaped call, returning a fake non-null HWND (real window comes from GXOpenDisplay)\n");
    return (void *)1; /* fake non-null HWND */
}

long Ordinal_264()
{
    return 0;
}

long Ordinal_266()
{
    return 0;
}

long Ordinal_267()
{
    return 0;
}

int Ordinal_286(void *a, void *b)
{
    (void)a; (void)b;
    fprintf(stderr, "[ordinal] Ordinal_286: single-instance check, reporting no existing instance\n");
    return 0; /* no existing instance / success */
}

long Ordinal_297()
{
    return 0;
}

long Ordinal_321()
{
    return 0;
}

long Ordinal_384()
{
    return 0;
}

long Ordinal_385()
{
    return 0;
}

long Ordinal_386()
{
    return 0;
}

long Ordinal_387()
{
    return 0;
}

long Ordinal_390()
{
    return 0;
}

long Ordinal_399()
{
    return 0;
}

long Ordinal_455()
{
    return 0;
}

long Ordinal_456()
{
    return 0;
}

int Ordinal_461(unsigned int hkey, void *subkey, unsigned int reserved, void *result)
{
    (void)hkey; (void)subkey; (void)reserved; (void)result;
    fprintf(stderr, "[ordinal] Ordinal_461: RegOpenKeyEx-shaped call, reporting success so the game takes its safe bounded-copy path instead of a hardcoded-offset fallback that segfaults when recompiled\n");
    return 0;
}

long Ordinal_463()
{
    return 0;
}

long Ordinal_464()
{
    return 0;
}

long Ordinal_496()
{
    return 0;
}

long Ordinal_516()
{
    return 0;
}

long Ordinal_532()
{
    return 0;
}

long Ordinal_533()
{
    return 0;
}

long Ordinal_535()
{
    return 0;
}

long Ordinal_553()
{
    return 0;
}

long Ordinal_687()
{
    return 0;
}

long Ordinal_690()
{
    return 0;
}

long Ordinal_691()
{
    return 0;
}

long Ordinal_702()
{
    return 0;
}

long Ordinal_719()
{
    return 0;
}

long Ordinal_858()
{
    return 0;
}

long Ordinal_859()
{
    return 0;
}

int Ordinal_864(void *msg, void *hwndFilter, unsigned int wMsgFilterMin, unsigned int wMsgFilterMax, unsigned int wRemoveMsg)
{
    (void)msg; (void)hwndFilter; (void)wMsgFilterMin; (void)wMsgFilterMax; (void)wRemoveMsg;
    uw_pump_events();
    return 0; /* always report "no message pending": the caller
                 branches on the message contents only when this
                 is nonzero, and we drive input/quit directly from
                 uw_pump_events() instead of faking a MSG struct. */
}

long Ordinal_866()
{
    return 0;
}

long Ordinal_868()
{
    return 0;
}

long Ordinal_870()
{
    return 0;
}

long Ordinal_885()
{
    return 0;
}

long Ordinal_912()
{
    return 0;
}

long Ordinal_919()
{
    return 0;
}

long Ordinal_993()
{
    return 0;
}

long Ordinal_1004()
{
    return 0;
}

void Ordinal_1018(ptr)
void *ptr;
{
    /* deliberately a leak, not free(ptr): several call sites
       have no argument expression at all (Ghidra dropped it),
       so ptr may be garbage -- freeing it would be a likely
       crash. Leaking for the life of this short-lived stub
       process is harmless. */
    (void)ptr;
}

long Ordinal_1025()
{
    return 0;
}

long Ordinal_1033()
{
    return 0;
}

long Ordinal_1039()
{
    return 0;
}

void *Ordinal_1041(size)
unsigned int size;
{
    if (size == 0 || size > (64u * 1024u * 1024u)) size = 4096;
    return malloc(size);
}

long Ordinal_1044()
{
    return 0;
}

void *Ordinal_1047(void *ptr, int val, unsigned int n)
{
    if (ptr) memset(ptr, val, n);
    return ptr;
}

long Ordinal_1053()
{
    return 0;
}

long Ordinal_1054()
{
    return 0;
}

long Ordinal_1058()
{
    return 0;
}

long Ordinal_1061()
{
    return 0;
}

char *Ordinal_1063(dest, src)
char *dest;
char *src;
{
    if (dest && src) strcat(dest, src);
    return dest;
}

long Ordinal_1064()
{
    return 0;
}

long Ordinal_1065()
{
    return 0;
}

long Ordinal_1068()
{
    return 0;
}

long Ordinal_1070()
{
    return 0;
}

long Ordinal_1071()
{
    return 0;
}

long Ordinal_1072()
{
    return 0;
}

long Ordinal_1090()
{
    return 0;
}

long Ordinal_1091()
{
    return 0;
}

long Ordinal_1094()
{
    return 0;
}

long Ordinal_1095()
{
    return 0;
}

long Ordinal_1102()
{
    return 0;
}

long Ordinal_1113()
{
    return 0;
}

long Ordinal_1114()
{
    return 0;
}

long Ordinal_1118()
{
    return 0;
}

long Ordinal_1346()
{
    return 0;
}

long Ordinal_1407()
{
    return 0;
}

long Ordinal_1415()
{
    return 0;
}

long Ordinal_1416()
{
    return 0;
}

long Ordinal_1417()
{
    return 0;
}

long Ordinal_2005()
{
    return 0;
}

long Ordinal_2008()
{
    return 0;
}

long Ordinal_2015()
{
    return 0;
}

long Ordinal_2016()
{
    return 0;
}

long Ordinal_2018()
{
    return 0;
}

long Ordinal_2020()
{
    return 0;
}

long Ordinal_2021()
{
    return 0;
}

long Ordinal_2023()
{
    return 0;
}

long Ordinal_2026()
{
    return 0;
}

long Ordinal_2027()
{
    return 0;
}

long Ordinal_2028()
{
    return 0;
}

long Ordinal_2030()
{
    return 0;
}

long Ordinal_2032()
{
    return 0;
}

long Ordinal_2033()
{
    return 0;
}

long Ordinal_2036()
{
    return 0;
}

long Ordinal_2038()
{
    return 0;
}

long Ordinal_2044()
{
    return 0;
}

long Ordinal_2046()
{
    return 0;
}

long Ordinal_2047()
{
    return 0;
}

long Ordinal_2048()
{
    return 0;
}

long Ordinal_2051()
{
    return 0;
}

long Ordinal_2053()
{
    return 0;
}

long Ordinal_2063()
{
    return 0;
}

long Ordinal_2135()
{
    return 0;
}

long Ordinal_2142()
{
    return 0;
}

long Ordinal_2304()
{
    return 0;
}

long Ordinal_2413()
{
    return 0;
}

long Ordinal_2582()
{
    return 0;
}

long Ordinal_2588()
{
    return 0;
}

