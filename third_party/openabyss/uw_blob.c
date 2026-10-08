/* SPDX-License-Identifier: MIT */
/* VENDORING SHIM -- not an OpenAbyss file. See uw.h here for why this
 * exists rather than vendoring upstream's uw_util.c.
 *
 * Same contract as upstream's uw_read_file/uw_free (openabyss src/uw_util.c),
 * minus its case-insensitive uw_fopen: every path this port hands the audio
 * layer is already resolved, so a plain fopen is enough. */
#include "uw.h"
#include <stdio.h>
#include <stdlib.h>

uw_blob uw_read_file(const char *path)
{
    uw_blob b = {NULL, 0, NULL};
    FILE *f = fopen(path, "rb");
    if (!f) { b.why = "cannot open"; return b; }
    if (fseek(f, 0, SEEK_END) != 0) { fclose(f); b.why = "cannot seek"; return b; }
    long n = ftell(f);
    if (n < 0) { fclose(f); b.why = "cannot tell"; return b; }
    rewind(f);
    b.data = malloc((size_t)n ? (size_t)n : 1);
    if (!b.data) { fclose(f); b.why = "out of memory"; return b; }
    b.size = fread(b.data, 1, (size_t)n, f);
    fclose(f);
    if (b.size != (size_t)n) { free(b.data); b.data = NULL; b.why = "short read"; }
    return b;
}

void uw_free(uw_blob *b) { free(b->data); b->data = NULL; b->size = 0; }
