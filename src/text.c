/* Text/font rendering: string draw, width measurement, glyph bitmap
 * unpacking, and font metrics loading/selection. Split out of uw.c
 * (the original monolithic decompile) once these functions' real
 * roles were confirmed.
 */
#include "headers/text.h"
#include "headers/debug.h"
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

// was DAT_0024ae20. Flat RGB565 ink color draw_text_string uses when
// g_text_use_palette_color is 0 -- never written anywhere, silently 0
// (black). Fine as the default on message-scroll's light parchment
// background; menu screens with a dark backdrop need the palette-
// indexed path instead (force g_text_use_palette_color there).
undefined2 g_text_flat_color;
static undefined2 DAT_000890b0_backing[32768];
#define DAT_000890b0 DAT_000890b0_backing[0]
// was DAT_0008909c. Line height (pixels) of the currently-active font,
// read from its header by load_font_metrics; 0 would make
// draw_text_string allocate/draw nothing.
static ushort g_font_line_height;
// was DAT_0008894c. Per-glyph row stride (bytes) of the currently-active
// font, also from load_font_metrics; selects unpack_glyph_bitmap's 8- vs
// 16-bit-per-row decode.
static short g_font_row_stride;
static short DAT_000a85b8;
/* Was `int`, truncating the real char* pointer (DAT_000890a4) assigned
   into it -- used as a glyph-bitmap-data base address in byte-pointer
   arithmetic passed to unpack_glyph_bitmap. */
static char *g_font_glyph_data_base;
static undefined2 DAT_000a85b0;
static char s_0123456789ABCDEF_00084a28[] = "0123456789ABCDEF";
static undefined1 DAT_00189588;
/* Was a single `undefined2`/`undefined1` scalar, but
   init_glyph_width_table (the only function anywhere in this
   decompile that touches any of these 4 globals) indexes each one via
   `(&DAT_xxx)[i]` up to the extents below -- an out-of-bounds
   scalar-as-array access, same class of bug as DAT_001007ee earlier
   this session. Widened to real arrays; sizes match the highest index
   each is ever written to in that function (DAT_00110bc0's stride-0x10
   writes imply a wider structure this decompile doesn't otherwise use,
   sized here to its observed 32x16 shape). */
static undefined2 DAT_00110a78[0xa0];
static undefined2 DAT_00110bc0[0x200];
static undefined1 DAT_00110fd0[0x20];
static undefined1 DAT_00201b18[0x20];
static undefined2 DAT_00189572;
static undefined2 DAT_00189574;
char * DAT_00110fc8 = 0;
static undefined1 DAT_00110fc4;
static undefined4 DAT_00110bb8;
/* Was `undefined4` (4 bytes) despite init_draw_command_cursor using it to reset
   DAT_00110fc0 (`char *`) -- truncating on this 64-bit host, and
   overwriting the DAT_00110fc0_scratch fallback (see DAT_00110fc0's own
   comment) with a truncated garbage/NULL pointer right before
   init_dungeon_rendering dereferences it. Retyped to a real pointer, defaulted to
   the same scratch buffer for the same "no real initializer found,
   avoid crashing" reason. */
static char *DAT_00110fcc = DAT_00110fc0_scratch;
static undefined2 DAT_00201b38;
static undefined2 DAT_00201b10;
static undefined4 DAT_0020250c;






// WARNING: Globals starting with '_' overlap smaller symbols at the same address

// was FUN_00011060
void draw_text_string(param_1,param_2,param_3)
char * param_1;
short param_2;
short param_3;

{
  /* Opt-in trace (UW_DIAG_TEXT=1): every text draw's calling function
     (via dladdr on the return address), position, and content. Zero
     cost when unset. Has repeatedly been the fastest way to pin down
     which of this file's many draw call sites is responsible for a
     given on-screen text bug -- keep it. */
  if (getenv("UW_DIAG_TEXT")) {
    Dl_info _dli;
    const char *_caller = "?";
    if (dladdr(__builtin_return_address(0), &_dli) && _dli.dli_sname) {
      _caller = _dli.dli_sname;
    }
    fprintf(stderr, "[diag11060] caller=%s xy=(%d,%d) str=\"%.30s\"\n", _caller, param_2, param_3, param_1 ? param_1 : "(null)");
  }
  short sVar1;
  int iVar2;
  uint uVar3;
  char *pcVar4;
  int iVar5;
  int iVar6;
  int iVar7;
  char *pcVar8;
  char *pcVar9;
  uint uVar10;
  int iVar11;
  int iVar12;
  char *local_48;
  undefined1 auStack_40 [16];

  /* Was `ce_strlen()` -- called with no argument, relying on
     whatever was left in the first-argument register from earlier code
     (the "dropped argument" idiom used throughout this file). That
     register no longer reliably holds param_1 by this point under this
     compiler/ABI (confirmed via ASAN: iVar2 came out larger than the
     caller's actual buffer, e.g. wait_for_chargen_field_input's 4-byte `local_2c`
     scratch string, causing a stack-buffer-overflow read here). iVar2
     is provably meant to be strlen(param_1) -- the very next line
     computes the same length via measure_text_width(param_1), and the
     allocation size below (`uVar3 * uVar10`) only makes sense if the
     inner loop below (which runs iVar2 times) walks exactly that many
     characters of param_1. Pass it explicitly instead of relying on
     register leftovers. */
  iVar2 = ce_strlen(param_1);
  uVar3 = measure_text_width(param_1);
  uVar10 = (uint)g_font_line_height;
  if (getenv("UW_DIAG_TEXT"))
    fprintf(stderr, "[diag11060] measured_width=%u line_height(g_font_line_height)=%u alloc=%u\n",
            uVar3, uVar10, (uVar3 & 0xffff) * uVar10);
  pcVar4 = (char *)ce_malloc((uVar3 & 0xffff) * uVar10);
  iVar11 = 0;
  pcVar8 = pcVar4;
  if (uVar10 != 0) {
    do {
      iVar7 = iVar2;
      pcVar9 = param_1;
      if (0 < iVar2) {
        do {
          /* char is signed by default on this host; the original ARM
             ABI treats it as unsigned, so bytes >=0x80 (e.g. any
             extended/high glyph index) went NEGATIVE here and indexed
             before the table -- reading garbage widths (observed: 190,
             causing a downstream buffer overflow) and, for the common
             case, contributing to characters silently not rendering.
             Cast to byte (unsigned char) to match the original
             semantics. */
          sVar1 = (&DAT_000890b0)[(byte)*pcVar9];
          {
            int _fmt = (int)g_font_row_stride << 3;
            /* Same signed-char bug as the width lookup just above (see
               its own comment) -- `*pcVar9` is `char`, signed on this
               host, so any extended/high glyph index (>=0x80) sign-
               extended to a negative int here, computing a glyph
               pointer hundreds of bytes BEFORE g_font_glyph_data_base
               instead of after it. Confirmed live via UW_DIAG_TEXT: char
               0x9e computed a pointer 490 bytes before the real base --
               an ASan-caught heap-buffer-overflow (uw.c:7030) reading
               whatever heap memory happened to sit there instead of the
               real glyph 0x9e. Cast to byte to match the fix already
               applied to the sibling width lookup two lines up. */
            undefined4 _r = unpack_glyph_bitmap(auStack_40,
                       (DAT_000a85b8 + 1) * (int)(byte)*pcVar9 + g_font_row_stride * iVar11 + g_font_glyph_data_base,
                       _fmt);
            if (getenv("UW_DIAG_TEXT"))
              fprintf(stderr, "[diag11060] glyph '%c' fmt=%d(0x%x) rowbytes(g_font_row_stride)=%d ret=%d width(sVar1)=%d auStack_40[0..3]=%d,%d,%d,%d\n",
                      *pcVar9, _fmt, _fmt, (int)g_font_row_stride, (int)_r, (int)sVar1,
                      (int)auStack_40[0], (int)auStack_40[1], (int)auStack_40[2], (int)auStack_40[3]);
          }
          /* BUG FIX: sVar1 (the glyph's pixel width, from the width
             table above) was used unclamped as this copy's byte count,
             but unpack_glyph_bitmap only ever fills 8 or 16 bytes of
             auStack_40 (its two handled cases, param_3==8/0x10) --
             any other _fmt (e.g. a wider font's row_stride producing
             _fmt==0x40) hits neither branch, leaves auStack_40
             untouched, and still returns success. Confirmed live via
             ASan: automap notes (a different, wider font than normal
             dialog text) hit exactly this with sVar1==0x40 against a
             16-byte buffer, reading far past it. Clamp to the buffer's
             real capacity so a width/stride this code doesn't know how
             to unpack can't read uninitialized/out-of-bounds stack
             memory; narrower glyphs (the common case) are unaffected. */
          ce_memmove(pcVar8,auStack_40,(int)sVar1 > (int)sizeof(auStack_40) ? (int)sizeof(auStack_40) : (int)sVar1);
          iVar7 = iVar7 + -1;
          pcVar8 = pcVar8 + sVar1;
          pcVar9 = pcVar9 + 1;
        } while (iVar7 != 0);
      }
      iVar11 = iVar11 + 1;
    } while (iVar11 < (int)uVar10);
  }
  iVar2 = (int)param_3;
  iVar11 = (int)param_2;
  iVar7 = uVar10 + iVar2;
  iVar12 = iVar11 + (uVar3 & 0xffff);
  dirty_rect_union(iVar2,iVar7,iVar11,iVar12);
  if (iVar2 < iVar7) {
    iVar6 = iVar2 * 0x140;
    pcVar8 = pcVar4;
    local_48 = pcVar4;
    do {
      iVar5 = iVar11;
      if (63999 < iVar6) break;
      for (; (iVar5 < iVar12 && (iVar5 < 0x140)); iVar5 = iVar5 + 1) {
        if (*pcVar8 == '\x01') {
          if (g_text_use_palette_color == 0) {
            *(undefined2 *)((g_uw_framebuffer) + (iVar6 + iVar5) * 2) =
                 g_text_flat_color;
          }
          else {
            *(undefined2 *)((g_uw_framebuffer) + (iVar6 + iVar5) * 2) =
                 (&g_palette_rgb565)[*g_draw_color_index];
            pcVar8 = local_48;
          }
        }
        pcVar8 = pcVar8 + 1;
        local_48 = pcVar8;
      }
      iVar2 = iVar2 + 1;
      iVar6 = iVar6 + 0x140;
    } while (iVar2 < iVar7);
  }
  if (pcVar4 != (char *)0x0) {
    LocalFree(pcVar4);
  }
  debug_framebuffer_dump("draw_text_string");
  return;
}



// was FUN_000112a0
int measure_text_width(param_1)
char * param_1;

{
  char cVar1;
  uint uVar2;
  short sVar3;

  /* Was `ce_strlen()` with no argument, relying on register leftovers
     to still hold param_1 (see draw_text_string's matching fix/comment a
     few lines above -- same root bug, this is the more foundational of
     the two call sites since measure_text_width is the general string pixel-
     width measurement used throughout the file). */
  uVar2 = ce_strlen(param_1);
  sVar3 = 0;
  for (uVar2 = uVar2 & 0xffff; uVar2 != 0; uVar2 = uVar2 - 1) {
    cVar1 = *param_1;
    param_1 = param_1 + 1;
    /* Same signed-char-indexing bug as draw_text_string above. */
    sVar3 = sVar3 + (&DAT_000890b0)[(byte)cVar1];
  }
  return (int)sVar3;
}



// was FUN_000112fc
undefined4 unpack_glyph_bitmap(param_1,param_2,param_3)
undefined1 * param_1;
byte * param_2;
short param_3;

{
  uint uVar1;
  undefined4 uVar2;
  uint uVar3;
  
  if ((param_2 == (byte *)0x0) || (param_1 == (undefined1 *)0x0)) {
    uVar2 = 0;
  }
  else {
    if (param_3 == 8) {
      uVar1 = 7;
      do {
        if (((uint)*param_2 & 1 << (uVar1 & 0xff)) == 0) {
          *param_1 = 0;
        }
        else {
          *param_1 = 1;
        }
        param_1 = param_1 + 1;
        uVar1 = uVar1 - 1;
      } while (-1 < (int)uVar1);
    }
    else if (param_3 == 0x10) {
      uVar2 = pack_word_byte(0,*param_2,1);
      uVar1 = pack_word_byte(uVar2,param_2[1],0);
      uVar3 = 0xf;
      do {
        if ((uVar1 & 0xffff & 1 << (uVar3 & 0xff)) == 0) {
          *param_1 = 0;
        }
        else {
          *param_1 = 1;
        }
        param_1 = param_1 + 1;
        uVar3 = uVar3 - 1;
      } while (-1 < (int)uVar3);
    }
    uVar2 = 1;
  }
  return uVar2;
}



// was FUN_000113b4
void load_font_metrics()

{
  int iVar1;
  byte bVar2;
  byte *pbVar3;
  int iVar4;
  ushort *puVar5;
  
  g_font_line_height = *(undefined2 *)(DAT_000879b0 + 6);
  g_font_row_stride = *(undefined2 *)(DAT_000879b0 + 8);
  DAT_000a85b0 = *(undefined2 *)(DAT_000879b0 + 10);
  DAT_000a85b8 = *(short *)(DAT_000879b0 + 2);
  g_font_glyph_data_base = DAT_000890a4;
  iVar1 = (int)DAT_000a85b8;
  puVar5 = &DAT_000890b0;
  pbVar3 = (byte *)(DAT_000890a4 + iVar1);
  iVar4 = 0x80;
  do {
    bVar2 = *pbVar3;
    iVar4 = iVar4 + -1;
    pbVar3 = pbVar3 + iVar1 + 1;
    *puVar5 = (ushort)bVar2;
    puVar5 = puVar5 + 1;
  } while (iVar4 != 0);
  return;
}




// was FUN_00040d00
bool select_active_font(param_1)
char *param_1;

{
  char stack0xffdc3248_buf [256];
  char *stack0xffdc3248_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  char acStack_110 [260];
  
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3248_ptr = acStack_110;
  do {
    cVar1 = *pcVar2;
    *stack0xffdc3248_ptr = cVar1; stack0xffdc3248_ptr = stack0xffdc3248_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar1 != '\0');
  ce_strcat(acStack_110,s__DATA__00085970);
  ce_strcat(acStack_110,param_1);
  iVar3 = open_file_for_read(acStack_110);
  if (iVar3 != -1) {
    DAT_0020250c = 1;
    read_file_handle(iVar3,DAT_000879b0,0xc);
    /* Was `((int)DAT_000879b0[1] + (int)*DAT_000879b0) * 0x80` -- reads
       header bytes 0 and 1 (both always 1 and 0 across every font file
       checked) giving a constant 128-byte read regardless of the font.
       load_font_metrics (called right after) walks this buffer with a real
       per-glyph stride of (height+1) for 128 glyphs -- e.g. FONTCHAR.SYS
       needs ~2667 bytes (its real on-disk size minus the 12-byte
       header), FONTBIG.SYS needs ~3937 -- so the actual glyph data was
       >90% truncated, leaving load_font_metrics reading uninitialized malloc
       memory as "widths" (observed: a bogus width of 190, causing a
       downstream buffer overflow, and more generally wrong/zero widths
       silently keeping characters undrawn). DAT_000890a4's own buffer
       is allocated at a fixed 0x1080 (4224) bytes -- comfortably larger
       than any of these font files' real data -- so just read up to
       that whole capacity; fread naturally stops at EOF for smaller
       files. */
    read_file_handle(iVar3,DAT_000890a4,0x1080);
    CloseHandle(iVar3);
    load_font_metrics();
  }
  return iVar3 != -1;
}



// was FUN_000228ac -- sets one byte of a 16-bit word, keeping the other
// byte from param_1: param_3==0 keeps param_1's high byte and sets the
// low byte from param_2; param_3!=0 keeps param_1's low byte and sets
// the high byte from param_2 (shifted up). Used by unpack_glyph_bitmap
// (src/text.c) to assemble a big-endian 16-bit font glyph row from two
// separate bytes.
uint pack_word_byte(param_1,param_2,param_3)
uint param_1;
uint param_2;
int param_3;

{
  uint uVar1;
  
  if (param_3 == 0) {
    uVar1 = param_1 & 0xff00 | param_2 & 0xff;
  }
  else {
    uVar1 = param_1 & 0xff | (param_2 & 0xff) << 8;
  }
  return uVar1;
}





// was FUN_000229e0 -- itoa-style integer-to-string helper: writes
// param_1's string representation in base param_3 into buffer param_2
// (via the s_0123456789ABCDEF_00084a28 digit table), handling a '-'
// sign for negative values. param_4 is only used as the literal output
// character for the param_1==0 special case (hardcoded to '0' whenever
// the caller doesn't override it) -- every real call site omits it and
// always passes base 10, so this isn't the dropped-argument bug class
// seen elsewhere in this file; the unused-when-nonzero param_4 is simply
// never read outside that one branch.
void itoa_radix(param_1,param_2,param_3,param_4)
int param_1;
undefined1 * param_2;
undefined4 param_3;
undefined1 param_4;

{
  char cVar1;
  int extraout_r1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  bool bVar5;
  bool bVar6;
  /* acStack_41[31] and local_22[2] were separate Ghidra locals, but
     their names encode adjacent stack offsets in the original binary
     (-0x41 to -0x22 is exactly 31 bytes) and the code walks backward
     from `local_22 + 1` straight into acStack_41 -- the classic
     "separate locals relied on being contiguous" artifact documented
     in the README. Merged into one 33-byte array; local_22[x] becomes
     acStack_41[31 + x]. */
  char acStack_41 [33];
  /* param_2 - pcVar2 offset-reconstruction idiom (same pattern as
     expand_pals_bytes): `(int)param_2 - (int)pcVar2` truncated both real
     pointers before iVar3's later `pcVar2[iVar3]` re-addition. iVar3
     itself is reused for a plain int digit-counter earlier in this
     function, so this needs its own dedicated variable. */
  intptr_t offset;
  
  bVar5 = param_1 < 0;
  bVar6 = param_1 == 0;
  if (bVar6) {
    param_4 = 0x30;
  }
  acStack_41[32] = 0;
  if (bVar6) {
    *param_2 = param_4;
    param_2[1] = 0;
  }
  iVar3 = 0x1f;
  if (!bVar6) {
    if (bVar5) {
      param_1 = -param_1;
    }
    if (0 < param_1) {
      pcVar2 = acStack_41 + 32;
      do {
        iVar3 = iVar3 + -1;
        pcVar2 = pcVar2 + -1;
        /* Original idiom read the divide helper's remainder back via
           the extraout_r1 register-leftover trick (see ordint_divmod's
           comment) -- computed directly here instead, since C gives us
           no portable way to recover "whatever was left in r1" and the
           uninitialized read was corrupting this index (confirmed
           SIGSEGV). */
        *pcVar2 = s_0123456789ABCDEF_00084a28[param_1 % param_3];
        param_1 = ordint_divmod(param_3,param_1);
      } while (0 < param_1);
    }
    iVar4 = iVar3;
    if (bVar5) {
      iVar4 = iVar3 + -1;
      acStack_41[iVar3] = '-';
    }
    pcVar2 = acStack_41 + iVar4 + 1;
    offset = (intptr_t)param_2 - (intptr_t)pcVar2;
    do {
      cVar1 = *pcVar2;
      pcVar2[offset] = cVar1;
      pcVar2 = pcVar2 + 1;
    } while (cVar1 != '\0');
  }
  return;
}


// was FUN_0003894c -- initializes the glyph-width lookup table
// (DAT_00110a78, 0xa0/160 entries) for the currently-loaded font: the
// first 0x60 entries default to 0xffff ("no glyph"/fixed-width
// fallback), while entries 0x60-0x9f are read from the real font data
// (DAT_00110fc8, halved from its raw stored width) with 0xffff read
// through unchanged. Also resets a few related font-state globals
// (DAT_00189570/72/74, DAT_00110fc0/fc4, DAT_00189588) and a parallel
// glyph-index/offset table (DAT_00201b18/DAT_00110bc0/DAT_00110fd0).
// Guarded on DAT_00110fc8 being set -- see that global's own comment
// for why it's sometimes NULL in this decompile.
void init_glyph_width_table()

{
  int iVar1;
  char *iVar2;
  int iVar3;
  ushort uVar4;
  int iVar5;
  uint uVar6;

  /* DAT_00110fc8 (and DAT_00110fcc, used identically a bit further down)
     are real pointers (`char *`) but are never assigned anywhere in this
     decompile -- whatever originally set them up (almost certainly
     another dropped/unrecovered call site, the same class of bug as the
     "argument dropped entirely" cases documented on ce_malloc/1063)
     couldn't be traced. Confirmed via a temporary diagnostic print that
     this was NOT reading a proper zero: as a plain tentative definition
     (`char * DAT_00110fc8;`, no initializer) it read back an
     unpredictable nonzero bit pattern instead of NULL every run --
     giving both globals an explicit `= 0` initializer (see their
     declarations) fixed that and made this guard actually effective.
     Skip this glyph-width-table setup rather than dereference garbage;
     whatever UI text this feeds may render with wrong character spacing
     until the real initializer is found. */
  if (DAT_00110fc8 == 0) {
    return;
  }
  iVar2 = DAT_00110fc8;
  DAT_00189570 = 99;
  DAT_00189572 = 0x30;
  DAT_00189574 = 0x50;
  DAT_00110fc0 = DAT_00110fc8;
  iVar3 = 0;
  do {
    DAT_00201b18[iVar3] = (char)iVar3;
    DAT_00110bc0[iVar3 * 0x10] = 0xffff;
    DAT_00110fd0[iVar3] = 0;
    iVar1 = (iVar3 + 1) * 0x10000;
    iVar5 = iVar1 >> 0x10;
    DAT_00110a78[iVar3] = 0xffff;
    iVar3 = iVar5;
  } while (iVar5 < 0x20);
  iVar3 = (int)(short)((uint)iVar1 >> 0x10);
  while (iVar3 < 0x60) {
    DAT_00110a78[iVar3] = 0xffff;
    iVar3 = (iVar3 + 1) * 0x10000 >> 0x10;
    iVar5 = iVar3;
  }
  for (iVar3 = (int)(short)iVar5; iVar3 < 0xa0; iVar3 = (iVar3 + 1) * 0x10000 >> 0x10) {
    uVar4 = *(ushort *)(iVar3 * 2 + iVar2 + -0x158);
    uVar6 = (uint)uVar4;
    if (uVar6 != 0xffffffff) {
      uVar4 = uVar4 >> 1;
    }
    if (uVar6 != 0xffffffff) {
      DAT_00110a78[iVar3] = uVar4;
    }
    else {
      DAT_00110a78[iVar3] = 0xffff;
    }
  }
  DAT_00110fc4 = 0x1f;
  DAT_00189588 = 0x20;
  return;
}


// was FUN_00038a8c -- computes a catalog sprite/texture id's stored
// width value from the glyph/sprite data table (DAT_00110fc8). Widely
// used across the HUD, dungeon-view, and 3D model-rendering code
// (as "tex_w"/"tex_h" at its call sites) to look up a catalog
// sprite's width for layout/UV purposes -- shares its underlying
// table with the glyph-width system (init_glyph_width_table,
// emit_glyph_draw_command, finalize_glyph_draw_command).
int get_catalog_sprite_width(param_1)
int param_1;

{
  return (param_1 + 0x7ff4) * 2 + (uint)(ushort)DAT_00110fc8;
}



// was FUN_00038ab0 -- saves the current draw-command list write
// cursor (DAT_00110fc0) into DAT_00110bb8.
void save_draw_command_cursor()

{
  DAT_00110bb8 = DAT_00110fc0;
  return;
}



// was FUN_00038acc -- one-time bootstrap: resets the draw-command
// list write cursor (DAT_00110fc0) to its buffer base (DAT_00110fcc).
// Only known caller runs during game init, immediately before
// DAT_0023aed0 (the list start draw_command_list_rewind later resets
// to) is captured from the resulting cursor position.
void init_draw_command_cursor()

{
  DAT_00110fc0 = DAT_00110fcc;
  return;
}



// was FUN_00038ae8 -- emits a glyph/sprite reference (param_1, a
// catalog id; param_2 a value used only for the special id 0xa0) into
// the draw-command list at the write cursor. For an already-
// registered glyph (DAT_00110a78[id] != -1) writes a direct
// byte-code reference and returns; otherwise records this occurrence
// in the pending-reference table (DAT_00110bc0/DAT_00110fd0, up to 16
// per glyph) to be backpatched once the glyph's width is known via
// finalize_glyph_draw_command. Id 0xa0 is a special end-of-list
// marker, saving its own state into DAT_00201b38/DAT_00201b10 instead.
void emit_glyph_draw_command(param_1,param_2)
uint param_1;
undefined2 param_2;

{
  byte bVar1;
  short *psVar2;
  byte *pbVar3;
  
  param_1 = param_1 & 0xff;
  if (param_1 == 0xa0) {
    DAT_00201b38 = (undefined2)((int)DAT_00110fc0 - (int)DAT_00110fc8 >> 1);
    psVar2 = DAT_00110fc0;
    DAT_00201b10 = param_2;
  }
  else {
    if (DAT_00110a78[param_1] != -1) {
      *DAT_00110fc0 =
           (((short)((int)DAT_00110fc0 - (int)DAT_00110fc8 >> 1) + 1) * 0x7fff + DAT_00110a78[param_1]
           ) * 2;
      goto LAB_00038c04;
    }
    pbVar3 = DAT_00110fd0 + param_1;
    if ((*pbVar3 == 0x10) || (0x1f < param_1)) {
      terminate_process(0xffffffec);
    }
    psVar2 = DAT_00110fc0;
    bVar1 = *pbVar3;
    DAT_00110bc0[(uint)bVar1 + param_1 * 0x10] = (short)((int)DAT_00110fc0 - (int)DAT_00110fc8 >> 1);
    *pbVar3 = bVar1 + 1;
  }
  *psVar2 = 0;
LAB_00038c04:
  DAT_00110fc0 = DAT_00110fc0 + 1;
  return;
}



// was FUN_00038c14 -- finalizes a glyph/sprite id's draw-command
// entry (param_1): computes its width from the current cursor delta
// and records it in DAT_00110a78, then backpatches every pending
// reference emit_glyph_draw_command recorded for it. Id 0xa0 instead
// backpatches the special end-of-list marker saved by that function's
// own 0xa0 branch. Always called with 0xa0 at every currently-visible
// call site (list-finalize time); the general id path is reached
// internally by the glyph/sprite catalog build this shares with
// emit_glyph_draw_command.
void finalize_glyph_draw_command(param_1)
uint param_1;

{
  int iVar1;
  char *iVar2;

  /* Same never-initialized-in-this-decompile DAT_00110fc8 issue documented
     on its sibling function above (see that comment) -- guard this one the
     same way instead of dereferencing NULL. */
  if (DAT_00110fc8 == 0) {
    return;
  }
  iVar2 = DAT_00110fc8;
  param_1 = param_1 & 0xff;
  if (param_1 == 0xa0) {
    *(ushort *)(DAT_00110fc8 + (uint)DAT_00201b38 * 2) =
         ((DAT_00201b10 + DAT_00201b38) * 0x7fff + (short)(DAT_00110fc0 - DAT_00110fc8 >> 1)) * 2;
  }
  else {
    DAT_00110a78[param_1] = (short)(DAT_00110fc0 - DAT_00110fc8 >> 1);
    if ((param_1 < 0x20) && (DAT_00110fd0[param_1] != 0)) {
      iVar1 = 0;
      do {
        *(ushort *)(iVar2 + (uint)(ushort)DAT_00110bc0[param_1 * 0x10 + iVar1] * 2) =
             ((DAT_00110bc0[param_1 * 0x10 + iVar1] + 1) * 0x7fff + DAT_00110a78[param_1]) * 2
        ;
        iVar1 = (iVar1 + 1) * 0x10000 >> 0x10;
        iVar2 = DAT_00110fc8;
      } while (iVar1 < (int)(uint)(byte)DAT_00110fd0[param_1]);
    }
  }
  return;
}
