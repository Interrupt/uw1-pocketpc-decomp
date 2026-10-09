/* SPDX-License-Identifier: MIT */
/* VENDORING SHIM -- not an OpenAbyss file.
 *
 * The four vendored audio sources (uw_sound.c, uw_ail.c, uw_adlib.c,
 * uw_opl.c) are byte-for-byte upstream. They include "uw.h", but of that
 * header they use only three things: the uw_blob type and the
 * uw_read_file/uw_free pair. Upstream's real uw.h additionally declares the
 * .ARK container, an RNG and more, and its uw_read_file lives in
 * uw_util.c, which pulls in uw_gamedir.h and the whole ARK implementation.
 *
 * Vendoring that cascade to obtain two functions would drag in far more of
 * the project than this port needs, so this file supplies exactly the
 * subset the audio sources reference, with the same contract as upstream
 * (see uw_util.c there): on failure `data` is NULL and `why` says why; a
 * zero-length file still yields a non-NULL one-byte allocation.
 *
 * Keeping the name "uw.h" is what lets the vendored sources stay
 * unmodified. It does not collide with this project's own src/headers/uw.h:
 * a quoted include resolves against the including file's own directory
 * first, so the vendored sources find this one and the headers under
 * src/headers find theirs. */
/* NOT the include guard upstream uses. This project has its own
   src/headers/uw.h whose guard is UW_H, and a translation unit that pulls
   in both (platform_dosmidi.c includes headers/audio.h as well as the
   vendored headers) would otherwise see whichever came first suppress the
   other -- which it did, as "unknown type name 'uw_blob'". The two
   headers share no declarations, so they coexist happily once the guards
   differ. */
#ifndef OPENABYSS_UW_H
#define OPENABYSS_UW_H

#include <stddef.h>
#include <stdint.h>
#include <stdbool.h>

/* The retail files are little-endian throughout and this reads them by
 * offset rather than by casting a struct over them: the records are not
 * aligned, several are bit-packed, and a struct overlay would be
 * byte-order- and padding-dependent for no gain. (Upstream's own, verbatim.) */
static inline uint16_t uw_u16(const uint8_t *p) {
    return (uint16_t)(p[0] | ((uint16_t)p[1] << 8));
}
static inline uint32_t uw_u32(const uint8_t *p) {
    return (uint32_t)p[0] | ((uint32_t)p[1] << 8)
         | ((uint32_t)p[2] << 16) | ((uint32_t)p[3] << 24);
}

typedef struct {
    uint8_t *data;
    size_t   size;
    const char *why;
} uw_blob;

uw_blob uw_read_file(const char *path);
void    uw_free(uw_blob *b);

#endif
