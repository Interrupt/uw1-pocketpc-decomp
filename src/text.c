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

  /* Was `Ordinal_1068()` -- called with no argument, relying on
     whatever was left in the first-argument register from earlier code
     (the "dropped argument" idiom used throughout this file). That
     register no longer reliably holds param_1 by this point under this
     compiler/ABI (confirmed via ASAN: iVar2 came out larger than the
     caller's actual buffer, e.g. FUN_00024840's 4-byte `local_2c`
     scratch string, causing a stack-buffer-overflow read here). iVar2
     is provably meant to be strlen(param_1) -- the very next line
     computes the same length via measure_text_width(param_1), and the
     allocation size below (`uVar3 * uVar10`) only makes sense if the
     inner loop below (which runs iVar2 times) walks exactly that many
     characters of param_1. Pass it explicitly instead of relying on
     register leftovers. */
  iVar2 = Ordinal_1068(param_1);
  uVar3 = measure_text_width(param_1);
  uVar10 = (uint)g_font_line_height;
  if (getenv("UW_DIAG_TEXT"))
    fprintf(stderr, "[diag11060] measured_width=%u line_height(g_font_line_height)=%u alloc=%u\n",
            uVar3, uVar10, (uVar3 & 0xffff) * uVar10);
  pcVar4 = (char *)Ordinal_1041((uVar3 & 0xffff) * uVar10);
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
          Ordinal_1044(pcVar8,auStack_40,(int)sVar1);
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
    Ordinal_1018(pcVar4);
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

  /* Was `Ordinal_1068()` with no argument, relying on register leftovers
     to still hold param_1 (see draw_text_string's matching fix/comment a
     few lines above -- same root bug, this is the more foundational of
     the two call sites since measure_text_width is the general string pixel-
     width measurement used throughout the file). */
  uVar2 = Ordinal_1068(param_1);
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
      uVar2 = FUN_000228ac(0,*param_2,1);
      uVar1 = FUN_000228ac(uVar2,param_2[1],0);
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
  Ordinal_1063(acStack_110,s__DATA__00085970);
  Ordinal_1063(acStack_110,param_1);
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
    Ordinal_553(iVar3);
    load_font_metrics();
  }
  return iVar3 != -1;
}

