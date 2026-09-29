#ifndef GHIDRA_INTRINSICS_H
#define GHIDRA_INTRINSICS_H

#include <string.h>

/* Standard Ghidra pseudo-intrinsics used by the decompiler output.
 * CONCATxy(hi, lo): concatenate an x-byte high part and y-byte low part
 * into an (x+y)-byte value. SUBab(v, off): extract b bytes from an a-byte
 * value starting at byte offset `off` from the LSB. */

#define CONCAT11(hi, lo) \
    ((unsigned short)(((unsigned)(unsigned char)(hi) << 8) | (unsigned char)(lo)))
#define CONCAT12(hi, lo) \
    ((unsigned int)(((unsigned)(unsigned char)(hi) << 16) | (unsigned short)(lo)))
#define CONCAT13(hi, lo) \
    ((unsigned int)(((unsigned)(unsigned char)(hi) << 24) | ((unsigned)(lo) & 0xFFFFFFu)))
#define CONCAT14(hi, lo) \
    ((unsigned long long)(((unsigned long long)(unsigned char)(hi) << 32) | (unsigned)(lo)))
#define CONCAT22(hi, lo) \
    ((unsigned int)(((unsigned)(unsigned short)(hi) << 16) | (unsigned short)(lo)))
#define CONCAT31(hi, lo) \
    ((unsigned int)(((unsigned)(hi) << 8) | (unsigned char)(lo)))
#define CONCAT44(hi, lo) \
    ((unsigned long long)(((unsigned long long)(unsigned)(hi) << 32) | (unsigned)(lo)))

#define SUB42(v, off) ((unsigned short)((unsigned)(v) >> ((off) * 8)))

static inline unsigned char SBORROW4(int a, int b) {
    long r = (long)a - (long)b;
    return (unsigned char)(((a ^ b) & (a ^ r)) < 0);
}

static inline unsigned char SCARRY4(int a, int b) {
    long r = (long)a + (long)b;
    return (unsigned char)(((a ^ r) & (b ^ r)) < 0);
}

#define builtin_strncpy strncpy

#endif
