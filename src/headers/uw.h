#ifndef UW_H
#define UW_H

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <stdlib.h>
#include "ghidra_intrinsics.h"
#include "ordinal_stubs.h"
#include "gx_stub.h"
#include "file_io.h"

typedef unsigned char   undefined;

typedef unsigned char    byte;
typedef unsigned int    dword;
typedef unsigned int    uint;
typedef unsigned short   ushort;
typedef unsigned long long undefined8;
typedef unsigned int    uint3;
typedef unsigned int    undefined3;
typedef unsigned int    int3;
typedef unsigned long long ulonglong;
typedef long long       longlong;
typedef void            *pointer32;
typedef pointer32 ImageBaseOffset32;

typedef unsigned long    ulong;
typedef unsigned char    undefined1;
typedef unsigned short    undefined2;
typedef unsigned int    undefined4;
typedef unsigned short    word;
#define unkbyte9   unsigned long long
#define unkbyte10   unsigned long long
#define unkbyte11   unsigned long long
#define unkbyte12   unsigned long long
#define unkbyte13   unsigned long long
#define unkbyte14   unsigned long long
#define unkbyte15   unsigned long long
#define unkbyte16   unsigned long long

#define unkuint9   unsigned long long
#define unkuint10   unsigned long long
#define unkuint11   unsigned long long
#define unkuint12   unsigned long long
#define unkuint13   unsigned long long
#define unkuint14   unsigned long long
#define unkuint15   unsigned long long
#define unkuint16   unsigned long long

#define unkint9   long long
#define unkint10   long long
#define unkint11   long long
#define unkint12   long long
#define unkint13   long long
#define unkint14   long long
#define unkint15   long long
#define unkint16   long long

#define unkfloat1   float
#define unkfloat2   float
#define unkfloat3   float
#define unkfloat5   double
#define unkfloat6   double
#define unkfloat7   double
#define unkfloat9   long double
#define unkfloat11   long double
#define unkfloat12   long double
#define unkfloat13   long double
#define unkfloat14   long double
#define unkfloat15   long double
#define unkfloat16   long double

#define BADSPACEBASE   void
/* Ghidra's pseudo-type for "executable code" reached through a function
 * pointer. Must be a K&R (unspecified-parameter) function type, not void,
 * so that '(**(code **)expr)(args...)' -- calling through a doubly
 * indirected function pointer, Ghidra's usual idiom for vtable/jump-table
 * dispatch -- type-checks regardless of how many arguments are passed. */
typedef void code();
/* Same idea as 'code', but for call-through-pointer sites whose result is
 * actually used as a value (Ghidra's jump tables mix void and value-
 * returning targets under the same 'code' label). */
typedef undefined4 codeval();
/* Same idea as 'codeval', but for call-through-pointer sites whose result
 * is a real pointer (e.g. an allocator callback) rather than a 4-byte
 * scalar -- returning through 'codeval' truncates the pointer on 64-bit
 * hosts. */
typedef void *codeptr();

/* Forward declaration needed because register_grtile_entry (much earlier in uw.c)
   calls this before its own definition later in the file -- see its
   definition, right after grtile_alloc_registered, for why it exists. */
void *uw_alloc_grtile();

/* Forward declaration needed because main_menu_loop (now in game.c) takes
   this LAB_ callback's address to pass to load_gr_resource_entries; its own
   definition stays in uw.c (see gr_resource_bump_alloc_entry/hud_icon_gr_bump_alloc_entry's matching
   comment for what this callback family does). */
void *opbtn_gr_bump_alloc_entry();

/* ---------------------------------------------------------------------
 * Object / tile record structs.
 *
 * This WinCE port keeps the exact same bit-packed layout LEV.ARK uses on
 * disk for its object table and tilemap, in memory, at runtime -- not
 * just at load time. Layout is documented at
 * https://wiki.ultimacodex.com/wiki/File_uw-formats.txt section 4.2/4.3;
 * cross-confirmed field-by-field against this file's own independently-
 * recovered accesses (not just trusted from the wiki):
 *   - uw_object_hdr_t.item_id: `*g_player_object & 0x1ff`, uw.c ~394
 *   - uw_object_hdr_t.heading: emit_object_billboard's
 *     `*(ushort*)(g_player_object+2) >> 7 & 7` dispatch, uw.c ~54972
 *   - uw_object_hdr_t.quality/.next: object_list_insert_head/_unlink's
 *     `(param_2+4) & 0x3f` (quality preserved) / `sVar<<6` (next
 *     shifted into the high 10 bits), uw.c ~45790/45871
 *   - uw_object_hdr_t.owner/.link: unlink_and_free_object's own "+6,
 *     this file's standard container-contents offset" comment, uw.c
 *     ~46015 (word3's high 10 bits reused as a "contains" chain head)
 *   - uw_mobile_object_t.npc_yhome/npc_xhome (offset 0x16) and
 *     .npc_heading (offset 0x18): g_player_object[0xb]/[0xc]
 *     ushort-index reads, uw.c ~390-393
 * Fields inside the 19-byte mobile-extra block the wiki itself marks
 * "(unknown)", plus the entirely-undocumented 0x11-0x15 gap, are left
 * as raw reserved bytes rather than guessed at -- don't trust names
 * beyond the ones cited above without checking real disassembly first.
 *
 * Two record sizes share the same 8-byte common header (resolve_object_link,
 * uw.c ~46036, is the single accessor behind 70+ call sites):
 *   - slots 0x000-0x0ff: uw_mobile_object_t (0x1b/27 bytes, adds NPC
 *     state) -- DAT_002046b8 array
 *   - slots 0x100-0x3ff: uw_object_hdr_t alone (8 bytes) -- DAT_002046c4
 *     array
 * These typedefs exist so call sites can be migrated incrementally from
 * raw `*(ushort*)(ptr+N)` offset math to named field access; the bulk of
 * this file's ~900 existing raw accesses are NOT yet converted -- this
 * is a starting point, not a finished migration.
 * --------------------------------------------------------------------- */
typedef struct __attribute__((packed)) {
    /* word 0x00 */
    unsigned short item_id    : 9;  /* object id / type, 0-0x1ff */
    unsigned short flags_res  : 3;  /* bits 9-11: unused/unknown per wiki */
    unsigned short enchanted  : 1;  /* bit 12 */
    unsigned short doordir    : 1;  /* bit 13: door swing direction (doors only) */
    unsigned short invisible  : 1;  /* bit 14 */
    unsigned short is_quant   : 1;  /* bit 15: word3's low field is a quantity, not owner/special */

    /* word 0x02 */
    unsigned short zpos       : 7;  /* bits 0-6: object Z position, 0-127 */
    unsigned short heading    : 3;  /* bits 7-9: heading, *45 degrees */
    unsigned short ypos       : 3;  /* bits 10-12: sub-tile Y, 0-7 */
    unsigned short xpos       : 3;  /* bits 13-15: sub-tile X, 0-7 */

    /* word 0x04 */
    unsigned short quality    : 6;  /* bits 0-5 */
    unsigned short next       : 10; /* bits 6-15: next object slot index in this tile's/container's chain */

    /* word 0x06 */
    unsigned short owner      : 6;  /* bits 0-5: owner / special property (context-dependent) */
    unsigned short link       : 10; /* bits 6-15: quantity / special link / "contains" chain head, see is_quant */
} uw_object_hdr_t;

typedef struct __attribute__((packed)) {
    uw_object_hdr_t hdr;            /* 8 bytes, offset 0x00 */

    unsigned char  npc_hp;          /* offset 0x08 */
    unsigned char  _unk09;          /* offset 0x09: not in the wiki's own table */
    unsigned char  _unk0a;          /* offset 0x0a: wiki documents only bit 7 here, as "(unknown)" */

    unsigned short npc_goal    : 4; /* offset 0x0b, bits 0-3 */
    unsigned short npc_gtarg   : 8; /* bits 4-11 */
    unsigned short _pad0b      : 4; /* bits 12-15: not in the wiki's own table */

    unsigned short npc_level    : 4; /* offset 0x0d, bits 0-3 */
    unsigned short _pad0d       : 9; /* bits 4-12: not in the wiki's own table */
    unsigned short npc_talkedto : 1; /* bit 13 */
    unsigned short npc_attitude : 2; /* bits 14-15 */

    unsigned short _pad0f_lo   : 6; /* offset 0x0f, bits 0-5: not in the wiki's own table */
    unsigned short npc_height  : 7; /* bits 6-12 */
    unsigned short _pad0f_hi   : 3; /* bits 13-15: not in the wiki's own table */

    unsigned char  _unk11_15[5];    /* offsets 0x11-0x15: entirely undocumented by the wiki */

    unsigned short _pad16_lo  : 4;  /* offset 0x16, bits 0-3: not in the wiki's own table */
    unsigned short npc_yhome  : 6;  /* bits 4-9 */
    unsigned short npc_xhome  : 6;  /* bits 10-15 */

    unsigned char  npc_heading : 5; /* offset 0x18, bits 0-4 (rest of byte unused per wiki) */
    unsigned char  npc_hunger  : 7; /* offset 0x19, bits 0-6 */
    unsigned char  npc_whoami;      /* offset 0x1a, full byte */
} uw_mobile_object_t;  /* 0x1b (27) bytes total */

/* 4-byte level tilemap record (wiki section 4.2). DAT_002029cc is the
 * level's flat 64x64 array of these (tilemap_lookup, uw.c ~58433, is
 * the single shared accessor behind 70+ call sites: index = tileX +
 * tileY*0x40). Field-confirmed against this file's own code:
 *   - wall_tex: DAT_0023b4ec[2] & 0x3f (the tile-cache byte-pointer
 *     copy of a live tile record), matching the real wall-rendering
 *     code's own read a few hundred lines above emit_tile_objects
 *   - obj_head: the field object_list_insert_head/_unlink operate on
 *     via `tile_ptr + 2` at 70+ call sites throughout this file
 */
typedef struct __attribute__((packed)) {
    /* word 0x00 */
    unsigned short tile_type    : 4;  /* bits 0-3: 0-9 */
    unsigned short floor_height : 4;  /* bits 4-7 */
    unsigned short unk_light    : 1;  /* bit 8: possible special-light flag per wiki */
    unsigned short unused9      : 1;  /* bit 9: never used in uw1 per wiki */
    unsigned short floor_tex    : 4;  /* bits 10-13 */
    unsigned short no_magic     : 1;  /* bit 14: magic disallowed flag */
    unsigned short door_bit     : 1;  /* bit 15 */

    /* word 0x02 */
    unsigned short wall_tex     : 6;  /* bits 0-5 */
    unsigned short obj_head     : 10; /* bits 6-15: first object slot index on this tile */
} uw_tile_t;  /* 4 bytes total */

/* 0xd (13)-byte comobj.dat per-object-type property record.
 * DAT_00202c90_backing is the flat array (base DAT_00202c90, stride
 * 0xd), indexed by an object's type id (obj_hdr.item_id & 0x1ff).
 * Dozens of call sites throughout uw.c and the split-out src files read individual
 * byte offsets of this record directly; see struct-recovery-plan.md
 * for the fuller catalog. Only two single-bit fields have confirmed
 * evidence so far -- each is named directly in a comment elsewhere
 * in this codebase (see below) -- so everything else is left as an
 * honest unnamed gap per the struct-recovery methodology, even where
 * a mask/shift at some call site proves a byte packs multiple
 * sub-fields (offsets 1-2, 3, 7, 8, 9, 0xa, 0xb all have at least one
 * confirmed-used bit or value that just isn't individually pinned
 * down and named yet). Don't add fields here without the same bar of
 * evidence (a direct, already-written comment naming the bit/byte's
 * real meaning) that is_container/has_look_description had. */
typedef struct __attribute__((packed)) {
    unsigned char _unk00;        /* offset 0x00: a numeric stat (fed into ordint_divmod/roll-style calls in several places) -- not yet confirmed */
    unsigned char _unk01_02[2];  /* offsets 0x01-0x02: packed sub-fields -- a low 3 bits (&7) value read separately from a >>4 value spanning into offset 2, neither named yet */
    unsigned char _unk03;        /* offset 0x03: flag byte -- bits 2/3/8(0x8) individually checked at different call sites, none named yet */
    unsigned char _unk04;        /* offset 0x04: unconfirmed */
    unsigned short _unk05;       /* offsets 0x05-0x06: read as a 2-byte value, ==0/!=0 checked (possibly a "special/quest object" id) -- not yet confirmed */
    unsigned char _unk07;        /* offset 0x07: flag byte -- bit 0 (0x1) and bits 2-3 (0xc, compared <3/==3) individually checked, none named yet */

    unsigned char _unk08_lo5 : 5; /* offset 0x08, bits 0-4: unconfirmed */
    unsigned char _unk08_b5  : 1; /* offset 0x08, bit 5 (0x20): confirmed used as a flag (src/interact.c) but not yet named */
    unsigned char _unk08_b6  : 1; /* offset 0x08, bit 6: unconfirmed */
    unsigned char is_container : 1; /* offset 0x08, bit 7 (0x80): CONFIRMED -- src/containers.c's own comment names this exact byte/mask as "DAT_00202c98's own 'container' flag-table lookup", gating container-only behavior (e.g. complete_pending_player_command_target) */

    unsigned char _unk09;        /* offset 0x09: flag byte -- bits 0-1 (0x3, resistance-roll chance bits), bit 3 (0x8), and bit 7 (0x80, gates trigger_type_flagged_trap_effect) individually checked, none named yet */
    unsigned char _unk0a;        /* offset 0x0a: 2-bit value (&3), compared "!= 2" at many call sites (item-combination gating) -- likely an enum, not yet confirmed */

    unsigned char _unk0b_lo4 : 4;   /* offset 0x0b, bits 0-3 (&0xf): confirmed used as a message-id offset in dispatch_object_action, not yet named as a value field */
    unsigned char has_look_description : 1; /* offset 0x0b, bit 4 (0x10): CONFIRMED -- this file's own comment on DAT_00202c90's re-aliasing names this exact byte/mask as "the right-click 'look' description gate" in dispatch_object_action */
    unsigned char _unk0b_hi3 : 3;   /* offset 0x0b, bits 5-7: unconfirmed */

    unsigned char _unk0c;        /* offset 0x0c: unconfirmed (last byte of the 0xd-byte stride) */
} uw_object_type_props_t;  /* 0xd (13) bytes total */

/* ~0x2e-byte "current view" scratch record: the screen-space eye/
 * camera transform (world x/y/elevation, facing, and a camera-shake
 * offset pair), written once per frame by update_current_view_from_subject
 * (was FUN_00069470) from the live player state -- or, in that function's
 * other branches, from an NPC/corpse being looked at -- then read all
 * over the tile/sprite projection code. Single global instance, not an
 * array: DAT_00086e6c_backing is a 64-byte oversized-safety-margin
 * allocation (see its own comment) but only the ~0x2e (46) bytes below
 * have a confirmed call site; the two gaps are left as honest raw
 * bytes rather than guessed fields. */
typedef struct __attribute__((packed)) {
    unsigned char _unk00_09[10];   /* 0x00-0x09: unconfirmed */
    short view_x;                  /* 0x0a: world X */
    unsigned char _unk0c_0d[2];    /* 0x0c-0x0d: unconfirmed */
    short view_elevation;          /* 0x0e: world Z / eye height (clamped <=1000 in update_current_view_from_subject) */
    unsigned char _unk10_11[2];    /* 0x10-0x11: unconfirmed */
    short view_y;                  /* 0x12: world Y */
    unsigned char _unk14_27[0x14]; /* 0x14-0x27: unconfirmed */
    short view_shake_x;            /* 0x28: camera-shake/bob X accumulator */
    short view_shake_y;            /* 0x2a: camera-shake/bob Y accumulator */
    short view_facing;             /* 0x2c: heading */
} uw_current_view_t;  /* 0x2e (46) bytes total (of the 64-byte backing allocation) */

typedef union IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryUnion IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryUnion, *PIMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryUnion;

typedef struct IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct, *PIMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct;

struct IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct {
    dword OffsetToDirectory:31;
    dword DataIsDirectory:1;
};

union IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryUnion {
    dword OffsetToData;
    struct IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryStruct;
};

typedef unsigned short    wchar16;
typedef struct IMAGE_DOS_HEADER IMAGE_DOS_HEADER, *PIMAGE_DOS_HEADER;

struct IMAGE_DOS_HEADER {
    char e_magic[2]; // Magic number
    word e_cblp; // Bytes of last page
    word e_cp; // Pages in file
    word e_crlc; // Relocations
    word e_cparhdr; // Size of header in paragraphs
    word e_minalloc; // Minimum extra paragraphs needed
    word e_maxalloc; // Maximum extra paragraphs needed
    word e_ss; // Initial (relative) SS value
    word e_sp; // Initial SP value
    word e_csum; // Checksum
    word e_ip; // Initial IP value
    word e_cs; // Initial (relative) CS value
    word e_lfarlc; // File address of relocation table
    word e_ovno; // Overlay number
    word e_res[4][4]; // Reserved words
    word e_oemid; // OEM identifier (for e_oeminfo)
    word e_oeminfo; // OEM information; e_oemid specific
    word e_res2[10][10]; // Reserved words
    dword e_lfanew; // File address of new exe header
    byte e_program[64]; // Actual DOS program
};

typedef struct HWND__ HWND__, *PHWND__;

struct HWND__ { // PlaceHolder Structure
};

typedef struct GXKeyList GXKeyList, *PGXKeyList;

struct GXKeyList { // PlaceHolder Structure
};

typedef struct GXDisplayProperties GXDisplayProperties, *PGXDisplayProperties;

struct GXDisplayProperties { // PlaceHolder Structure
};

typedef struct IMAGE_OPTIONAL_HEADER32 IMAGE_OPTIONAL_HEADER32, *PIMAGE_OPTIONAL_HEADER32;

typedef struct IMAGE_DATA_DIRECTORY IMAGE_DATA_DIRECTORY, *PIMAGE_DATA_DIRECTORY;

struct IMAGE_DATA_DIRECTORY {
    ImageBaseOffset32 VirtualAddress;
    dword Size;
};

struct IMAGE_OPTIONAL_HEADER32 {
    word Magic;
    byte MajorLinkerVersion;
    byte MinorLinkerVersion;
    dword SizeOfCode;
    dword SizeOfInitializedData;
    dword SizeOfUninitializedData;
    ImageBaseOffset32 AddressOfEntryPoint;
    ImageBaseOffset32 BaseOfCode;
    ImageBaseOffset32 BaseOfData;
    pointer32 ImageBase;
    dword SectionAlignment;
    dword FileAlignment;
    word MajorOperatingSystemVersion;
    word MinorOperatingSystemVersion;
    word MajorImageVersion;
    word MinorImageVersion;
    word MajorSubsystemVersion;
    word MinorSubsystemVersion;
    dword Win32VersionValue;
    dword SizeOfImage;
    dword SizeOfHeaders;
    dword CheckSum;
    word Subsystem;
    word DllCharacteristics;
    dword SizeOfStackReserve;
    dword SizeOfStackCommit;
    dword SizeOfHeapReserve;
    dword SizeOfHeapCommit;
    dword LoaderFlags;
    dword NumberOfRvaAndSizes;
    struct IMAGE_DATA_DIRECTORY DataDirectory[16];
};

typedef struct _IMAGE_RUNTIME_FUNCTION_ENTRY _IMAGE_RUNTIME_FUNCTION_ENTRY, *P_IMAGE_RUNTIME_FUNCTION_ENTRY;

struct _IMAGE_RUNTIME_FUNCTION_ENTRY {
    ImageBaseOffset32 BeginAddress;
    ImageBaseOffset32 ExceptionInfo;
};

typedef struct IMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct IMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct, *PIMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct;

struct IMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct {
    dword NameOffset:31;
    dword NameIsString:1;
};

typedef struct _IMAGE_RUNTIME_FUNCTION_ENTRY_2 _IMAGE_RUNTIME_FUNCTION_ENTRY_2, *P_IMAGE_RUNTIME_FUNCTION_ENTRY_2;

struct _IMAGE_RUNTIME_FUNCTION_ENTRY_2 {
    ImageBaseOffset32 BeginAddress;
    dword Flag:2;
    dword FunctionLength:11;
    dword Ret:2;
    dword H:1;
    dword Reg:3;
    dword R:1;
    dword L:1;
    dword C:1;
    dword StackAdjust:10;
};

typedef struct IMAGE_FILE_HEADER IMAGE_FILE_HEADER, *PIMAGE_FILE_HEADER;

struct IMAGE_FILE_HEADER {
    word Machine; // 448
    word NumberOfSections;
    dword TimeDateStamp;
    dword PointerToSymbolTable;
    dword NumberOfSymbols;
    word SizeOfOptionalHeader;
    word Characteristics;
};

typedef struct IMAGE_NT_HEADERS32 IMAGE_NT_HEADERS32, *PIMAGE_NT_HEADERS32;

struct IMAGE_NT_HEADERS32 {
    char Signature[4];
    struct IMAGE_FILE_HEADER FileHeader;
    struct IMAGE_OPTIONAL_HEADER32 OptionalHeader;
};

typedef struct IMAGE_RESOURCE_DIRECTORY_ENTRY IMAGE_RESOURCE_DIRECTORY_ENTRY, *PIMAGE_RESOURCE_DIRECTORY_ENTRY;

typedef union IMAGE_RESOURCE_DIRECTORY_ENTRY_NameUnion IMAGE_RESOURCE_DIRECTORY_ENTRY_NameUnion, *PIMAGE_RESOURCE_DIRECTORY_ENTRY_NameUnion;

union IMAGE_RESOURCE_DIRECTORY_ENTRY_NameUnion {
    struct IMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct IMAGE_RESOURCE_DIRECTORY_ENTRY_NameStruct;
    dword Name;
    word Id;
};

struct IMAGE_RESOURCE_DIRECTORY_ENTRY {
    union IMAGE_RESOURCE_DIRECTORY_ENTRY_NameUnion NameUnion;
    union IMAGE_RESOURCE_DIRECTORY_ENTRY_DirectoryUnion DirectoryUnion;
};

typedef struct IMAGE_SECTION_HEADER IMAGE_SECTION_HEADER, *PIMAGE_SECTION_HEADER;

typedef union Misc Misc, *PMisc;

typedef enum SectionFlags {
    IMAGE_SCN_TYPE_NO_PAD=8,
    IMAGE_SCN_RESERVED_0001=16,
    IMAGE_SCN_CNT_CODE=32,
    IMAGE_SCN_CNT_INITIALIZED_DATA=64,
    IMAGE_SCN_CNT_UNINITIALIZED_DATA=128,
    IMAGE_SCN_LNK_OTHER=256,
    IMAGE_SCN_LNK_INFO=512,
    IMAGE_SCN_RESERVED_0040=1024,
    IMAGE_SCN_LNK_REMOVE=2048,
    IMAGE_SCN_LNK_COMDAT=4096,
    IMAGE_SCN_GPREL=32768,
    IMAGE_SCN_MEM_16BIT=131072,
    IMAGE_SCN_MEM_PURGEABLE=131072,
    IMAGE_SCN_MEM_LOCKED=262144,
    IMAGE_SCN_MEM_PRELOAD=524288,
    IMAGE_SCN_ALIGN_1BYTES=1048576,
    IMAGE_SCN_ALIGN_2BYTES=2097152,
    IMAGE_SCN_ALIGN_4BYTES=3145728,
    IMAGE_SCN_ALIGN_8BYTES=4194304,
    IMAGE_SCN_ALIGN_16BYTES=5242880,
    IMAGE_SCN_ALIGN_32BYTES=6291456,
    IMAGE_SCN_ALIGN_64BYTES=7340032,
    IMAGE_SCN_ALIGN_128BYTES=8388608,
    IMAGE_SCN_ALIGN_256BYTES=9437184,
    IMAGE_SCN_ALIGN_512BYTES=10485760,
    IMAGE_SCN_ALIGN_1024BYTES=11534336,
    IMAGE_SCN_ALIGN_2048BYTES=12582912,
    IMAGE_SCN_ALIGN_4096BYTES=13631488,
    IMAGE_SCN_ALIGN_8192BYTES=14680064,
    IMAGE_SCN_LNK_NRELOC_OVFL=16777216,
    IMAGE_SCN_MEM_DISCARDABLE=33554432,
    IMAGE_SCN_MEM_NOT_CACHED=67108864,
    IMAGE_SCN_MEM_NOT_PAGED=134217728,
    IMAGE_SCN_MEM_SHARED=268435456,
    IMAGE_SCN_MEM_EXECUTE=536870912,
    IMAGE_SCN_MEM_READ=1073741824,
    IMAGE_SCN_MEM_WRITE=2147483648
} SectionFlags;

union Misc {
    dword PhysicalAddress;
    dword VirtualSize;
};

struct IMAGE_SECTION_HEADER {
    char Name[8];
    union Misc Misc;
    ImageBaseOffset32 VirtualAddress;
    dword SizeOfRawData;
    dword PointerToRawData;
    dword PointerToRelocations;
    dword PointerToLinenumbers;
    word NumberOfRelocations;
    word NumberOfLinenumbers;
    enum SectionFlags Characteristics;
};

typedef struct IMAGE_RESOURCE_DIR_STRING_U_8 IMAGE_RESOURCE_DIR_STRING_U_8, *PIMAGE_RESOURCE_DIR_STRING_U_8;

struct IMAGE_RESOURCE_DIR_STRING_U_8 {
    word Length;
    wchar16 NameString[4];
};

typedef struct IMAGE_RESOURCE_DATA_ENTRY IMAGE_RESOURCE_DATA_ENTRY, *PIMAGE_RESOURCE_DATA_ENTRY;

struct IMAGE_RESOURCE_DATA_ENTRY {
    dword OffsetToData;
    dword Size;
    dword CodePage;
    dword Reserved;
};

typedef struct IMAGE_RESOURCE_DIRECTORY IMAGE_RESOURCE_DIRECTORY, *PIMAGE_RESOURCE_DIRECTORY;

struct IMAGE_RESOURCE_DIRECTORY {
    dword Characteristics;
    dword TimeDateStamp;
    word MajorVersion;
    word MinorVersion;
    word NumberOfNamedEntries;
    word NumberOfIdEntries;
};




/* Globals defined in uw.c but also used by functions that now live in
   graphics.c (bitmap_blit_to_framebuffer, rect_fill_or_save_restore,
   set_draw_color) -- extern'd here so both translation units see the same
   storage. */
extern void *g_uw_framebuffer;
/* 256-entry palette -> RGB565 lookup table (rebuilt by build_rgb565_palette on
   every palette load). Real binary size is 256 shorts at 0x0024ad60;
   over-allocated here as a safety margin. Indexed as
   `(&g_palette_rgb565)[palette_index]`. g_transparent_screen_color
   (uw.c) aliases entry 26. */
extern undefined2 g_palette_rgb565_backing[32768];
#define g_palette_rgb565 g_palette_rgb565_backing[0]
extern undefined2 DAT_000a85c0;
extern undefined2 DAT_000a85c4;
extern undefined2 DAT_000a85c8;
extern undefined2 DAT_000842a4;
extern undefined2 DAT_000842a8;
extern int DAT_00204848;
extern int g_blit_transparent_mode;
/* Globals defined in uw.c but also used by functions that now live in
   graphics.c (screen_backup_save/restore/restore_rect) -- extern'd here so
   both translation units see the same storage. */
#define g_transparent_screen_color (*(short *)&g_palette_rgb565_backing[26])
/* Globals defined in uw.c but also used by functions that now live in
   graphics.c (expand_pals_bytes, build_rgb565_palette,
   palette_cycle_range) -- extern'd here so both translation units see
   the same storage. */
extern int DAT_0024af70;
extern undefined2 DAT_00242010_backing[32768];
#define DAT_00242010 DAT_00242010_backing[0]
extern undefined2 DAT_00248418_backing[20 * 256];
#define DAT_00248418 DAT_00248418_backing[0]
/* Globals defined in uw.c but also used by functions that now live in
   automap.c (pick_closer_note_label, handle_automap_note_click,
   draw_automap_notes, save_automap_notes_to_archive,
   load_automap_notes_from_archive, switch_automap_level_display) --
   extern'd here so both translation units see the same storage. */
/* Globals defined in uw.c but also used by functions that now live in
   game.c (app_main_loop, main_menu_loop) -- extern'd here so both
   translation units see the same storage. */
extern undefined1 *DAT_00084298;
extern byte *g_draw_color_index;
extern undefined1 DAT_000857a0_backing[32768];
#define DAT_000857a0 DAT_000857a0_backing[0]
extern undefined2 DAT_000868d8;
extern ushort *DAT_000876bc;
extern short *DAT_000876c0;
extern int DAT_000876c8;
extern char *DAT_000879b0;
extern char *DAT_000890a4;
extern int DAT_00201c98;
extern char *g_weapon_swing_current_frame;
extern ushort DAT_0023c448;
extern undefined4 DAT_0023c540;
extern undefined4 DAT_0023c648;
extern void *DAT_0023c7a0_arr[0x140];
#define DAT_0023c7a0 DAT_0023c7a0_arr[0]
extern char *DAT_0023cca0;
extern char *DAT_0023cca4;
extern undefined1 DAT_0023cca8_backing[32768];
#define DAT_0023cca8 DAT_0023cca8_backing[0]
extern char *DAT_00248410;
extern int DAT_0024af60;
extern short DAT_0024af6c;
extern int g_text_use_palette_color;
extern byte *DAT_0024af78;
extern byte *DAT_0024af7c;
extern char s__SAVE0_lev_ark_000842fc[];
extern char s_FONT5X6P_SYS_00084e9c[];
extern char s_FONTBIG_SYS_00085454[];
/* Globals defined in uw.c but also used by functions that now live in
   saveload.c (open_level_archive, close_level_archive,
   write_archive_entry, read_archive_entry) -- extern'd here so both
   translation units see the same storage. */
/* Globals defined in uw.c but also used by functions that now live in
   chargen.c (character_generator_start, run_character_generator,
   character_generator_loop) -- extern'd here so both translation units
   see the same storage. */
extern char *DAT_00086df8;
/* chrbtns.gr cumulative per-entry offset table (built by chrbtns_offset_table_builder).
   DAT_000fb8c4 is an alias into it starting at element 17 -- the same
   relationship DAT_000fb884 (element 1) has, matching the 0xfb8c4 vs
   0xfb880 symbol addresses (0x44 = 17*4). Elements 17..26 are the
   full-body figure offsets read by character_generator_loop case 4. */
extern undefined4 DAT_000fb880_backing[4096];
#define DAT_000fb8c4 (((undefined1 *)DAT_000fb880_backing)[0x44])
#define DAT_000fb880 DAT_000fb880_backing[0]
#define DAT_000fb884 (((undefined1 *)DAT_000fb880_backing)[4])
#define DAT_000fb898 (((int *)DAT_000fb880_backing)[6])
/* Fourth byte of each loaded class row is its attribute bonus pool. */
extern char *DAT_001005c8;
extern char *g_chargen_textfield_buf;
/* chrbtns_bump_alloc_entry/chrbtns_offset_table_builder: orphaned callbacks Ghidra never recognized
   as real functions (only reached indirectly, via addresses passed to
   load_gr_resource_entries) -- their definitions stay in uw.c (see their own comment
   there for the full recovery story), forward-declared here because
   run_character_generator (chargen.c) takes their addresses. */
char *chrbtns_bump_alloc_entry();
undefined4 chrbtns_offset_table_builder();
/* Globals defined in uw.c but also used by functions that now live in
   babl.c (the conversation/dialogue scripting VM) -- extern'd here so
   both translation units see the same storage. */
extern char DAT_00085240_backing[8192];
#define DAT_00085240 DAT_00085240_backing[0]
extern char DAT_00085244_backing[32768];
#define DAT_00085244 DAT_00085244_backing[0]
extern char DAT_00085248_backing[32768];
#define DAT_00085248 DAT_00085248_backing[0]
extern undefined4 DAT_00085c54;
extern ushort * DAT_00100674;
extern ushort DAT_001007c4;
#define DAT_001007d5 DAT_001007d0_backing[0x5]
extern undefined DAT_001007d9_backing[8192];
#define DAT_001007d9 DAT_001007d9_backing[0]
extern short DAT_00201b68;
extern short DAT_00201c74;
extern undefined2 DAT_002020a0;
extern undefined2 DAT_002020a4;
extern undefined4 DAT_00202c84;
extern undefined1 DAT_00202c90_backing[65536];
#define DAT_00202c90 DAT_00202c90_backing[0]
#define DAT_00202c91 DAT_00202c90_backing[1]
#define DAT_00202c93 DAT_00202c90_backing[3]
#define DAT_00202c95 DAT_00202c90_backing[5]
#define DAT_00202c97 DAT_00202c90_backing[7]
#define DAT_00202c98 DAT_00202c90_backing[8]
#define DAT_00202c99 DAT_00202c90_backing[9]
#define DAT_00202c9a DAT_00202c90_backing[0xa]
// Typed view over the same array for new code -- see uw_object_type_props_t
// above. Index by an object's type id (obj_hdr.item_id & 0x1ff), matching
// every existing `(&DAT_00202c9X)[id * 0xd]` call site's own indexing.
#define g_object_type_props ((uw_object_type_props_t *)DAT_00202c90_backing)
extern char * DAT_0023be74;
extern undefined1 DAT_0023bf0c;
extern undefined2 DAT_0024cfac;
extern int DAT_00250718;
extern undefined1 g_active_hud_panel;
extern undefined2 g_cursor_mode;
/* OBJECTS.DAT monster records are loaded at DAT_001007d0, stride 0x30.
   These original addresses are fields of that same table: max HP (+4),
   flags (+0xa), defense (+0x12), perception (+0x1d). Separate backing
   arrays left these fields zero even after load_monster_combat_stats. */
#define g_monster_max_stats_table DAT_001007d0_backing[0x4]
#define DAT_001007da DAT_001007d0_backing[0xa]
#define DAT_001007e2 DAT_001007d0_backing[0x12]
#define DAT_001007ed DAT_001007d0_backing[0x1d]
#define DAT_001007ee DAT_001007d0_backing[0x1e] // per-class perception-range byte (>>4), read by alert_npc_to_noise_callback
extern short g_mouse_x;
extern short g_mouse_y;
extern ushort * g_player_object;
extern short g_pick_tile_off_backing[0x200];
extern undefined1 DAT_0023b676_backing[65536];
#define DAT_0023b676 DAT_0023b676_backing[0]
undefined4 babl_builtin_default_handler();
char * converse_res_bump_alloc_entry();
undefined4 converse_res_slot_store_callback();
extern char s__DATA_cnv_ark_00084fc8[];
/* Globals defined in uw.c but also used by functions that now live in
   babl.c (init_barter_ui) -- extern'd here so both translation units
   see the same storage. */
/* Globals defined in uw.c but also used by functions that now live in
   models.c (tick_anim_record, emit_catalog_object,
   emit_anim_object_frames) -- extern'd here so both translation units
   see the same storage. */
extern short DAT_000b4620;
extern char *DAT_00110fc0;
/* Shared scratch fallback buffer DAT_00110fc0/DAT_00110fcc point into;
   also read directly by demomode.c's debug accessors. */
extern char DAT_00110fc0_scratch[65536];
/* The 29 catalog 3D model buffers load_3d_object_models fills via
   parse_e_model_file, indexed by g_anim_model_slot -- see that array's
   own comment for the slot-order table. */
extern undefined DAT_00123ccc_backing[16384];
#define DAT_00123ccc DAT_00123ccc_backing[0]
void parse_e_model_file();

extern undefined2 DAT_00189570_backing[256];
#define DAT_00189570 DAT_00189570_backing[0]
extern char *DAT_00110fc8;
extern undefined2 DAT_00189578;
extern ushort DAT_0018957a;
extern ushort DAT_00189580;
extern undefined2 DAT_00202734;
extern undefined4 DAT_0023b804;
extern ushort DAT_0023b81c;
extern ushort DAT_0023b904;
extern ushort DAT_0023b91c;
extern ushort DAT_0023b920;
extern byte DAT_0023bc88;
extern int g_uw_debug_pick_diag;
/* Globals defined in uw.c but also used by functions that now live in
   player.c (reset_player_derived_state) -- extern'd here so both
   translation units see the same storage. */
extern undefined1 DAT_0010060c_backing[256];
#define DAT_0010060c DAT_0010060c_backing[0]
extern undefined4 DAT_002020d0;
extern undefined4 DAT_002020d8;
extern undefined4 DAT_002020d4;
extern int DAT_0023bc94;
/* Globals defined in uw.c but also used by functions that now live in
   visibility.c (load_floor_texture_arenas) -- extern'd here so both
   translation units see the same storage. */
extern ushort DAT_0023adc0;
extern char *DAT_0023ae34;
extern char *DAT_0023ae30;
extern undefined2 DAT_0023beb8;
extern undefined2 DAT_0023be8c;
extern char *DAT_0023ae38;
extern char *DAT_0023ae3c;
extern undefined1 DAT_002049e0_backing[0x100000];
#define DAT_002049e0 DAT_002049e0_backing[0]
extern int g_npc_tick_enabled;
void debug_adjust_view_heading();
void debug_force_rest_action();
undefined4 print_debug_stat_message();
extern short DAT_0023be90;
extern short DAT_0023be92;
extern short DAT_0023be94;
extern short DAT_0023bf00;
extern undefined2 DAT_0023bf02;
extern undefined2 DAT_0023bf04;
extern byte DAT_0023beb0;
extern byte DAT_0023beac;
extern undefined2 DAT_0023bea0;
extern short DAT_0023bea4;
extern short DAT_0023bf08;
extern char DAT_00086e84;
extern char *DAT_0008794c;
extern undefined2 DAT_0023be9a;
extern undefined2 DAT_0023be9c;
extern undefined2 DAT_0023be9e;
extern char DAT_0023bf18;
#define DAT_002048a5 DAT_00204880_backing[0x25]
#define DAT_002048a6 DAT_00204880_backing[0x26]
#define DAT_002027d2 DAT_002027d0_backing[2] /* third byte of each loaded weapon record */
extern undefined1 DAT_002027d0_backing[256];
#define DAT_002027d0 DAT_002027d0_backing[0]
extern undefined1 DAT_00202800_backing[65536];
#define DAT_00202800 DAT_00202800_backing[0]
extern undefined DAT_00202878;
extern unsigned char DAT_00084eff_backing[12];
#define DAT_00084eff DAT_00084eff_backing[0]
extern ushort *DAT_002046b4;
extern undefined DAT_00085ce0_backing[8192];
#define DAT_00085ce0 DAT_00085ce0_backing[0]
extern char s_You_read_the_00085ce8[];
extern undefined4 DAT_0024cfc8;
extern undefined1 DAT_0024cfe0_backing[8192];
#define DAT_0024cfe0 DAT_0024cfe0_backing[0]
extern char *DAT_0024cff4;
extern ushort *DAT_0024cff0;
extern ushort DAT_0024fa18;
extern char DAT_0024d000;
extern char DAT_0024fa28;
extern int g_text_input_active;
extern undefined1 DAT_00250730_backing[65536];
#define DAT_00250730 DAT_00250730_backing[0]
#define DAT_00250732 DAT_00250730_backing[2]
#define DAT_00250733 DAT_00250730_backing[3]
/* Globals defined in uw.c but also used by functions that now live in
   tmap.c (update_wall_partition_phase) -- extern'd here so both
   translation units see the same storage. */
extern char s_font5x6p_sys_0008430c[];
extern undefined s_scroll_newline_0008522c_backing[8192];
#define s_scroll_newline_0008522c s_scroll_newline_0008522c_backing[0]
/* Globals defined in uw.c but also used by functions that now live in
   automap.c (the automap screen) -- extern'd here so both translation
   units see the same storage. */
extern undefined1 DAT_000878d0_backing[256];
#define DAT_000878d0 DAT_000878d0_backing[0]
extern undefined1 DAT_000b99d0_backing[8192];
#define DAT_000b99d0 DAT_000b99d0_backing[0]
extern undefined4 DAT_000bbef4;
extern char * DAT_002029cc;
/* decompress_rle_stream's shared codec state -- see uw.c's own
   comment at the declarations for what each field tracks. */
extern char s_fontbig_sys_0008432c[];
/* Globals defined in uw.c but also used by functions that now live in
   inventory.c (the inventory panel) -- extern'd here so both
   translation units see the same storage. */
extern short * DAT_00085a6c;
extern unsigned char g_inventory_hotspot_table[0x17 * 0xe + 2];
#define _DAT_00085bf0 (*(unsigned short *)&g_inventory_hotspot_table[288])
#define DAT_00085bf2 g_inventory_hotspot_table[290]
#define DAT_00085bf3 g_inventory_hotspot_table[291]
#define DAT_00085bf4 g_inventory_hotspot_table[292]
#define DAT_00085bf5 g_inventory_hotspot_table[293]
#define g_inv_hotspot_click_x1 g_inventory_hotspot_table[0x0]
#define g_inv_hotspot_click_y1 g_inventory_hotspot_table[0x2]
#define g_inv_hotspot_click_x2 g_inventory_hotspot_table[0x4]
#define g_inv_hotspot_click_y2 g_inventory_hotspot_table[0x6]
#define g_inv_hotspot_draw_x (*(unsigned short *)&g_inventory_hotspot_table[0x8])
#define g_inv_hotspot_draw_y (*(unsigned short *)&g_inventory_hotspot_table[0xa])
#define g_inv_hotspot_dirty_w g_inventory_hotspot_table[0xc]
#define g_inv_hotspot_dirty_h g_inventory_hotspot_table[0xd]
extern unsigned char g_backpack_widget_to_slot_backing[0x17];
#define g_backpack_widget_to_slot g_backpack_widget_to_slot_backing[0]
#define DAT_00085c4c g_backpack_widget_to_slot_backing[20]
extern unsigned char g_backpack_slot_to_widget_backing[0x1c];
#define g_backpack_slot_to_widget g_backpack_slot_to_widget_backing[0]
extern undefined2 g_save_record_count_backing[8192];
#define g_save_record_count g_save_record_count_backing[0]
extern undefined4 DAT_002028e8_backing[64];
#define DAT_002028e8 DAT_002028e8_backing[0]
extern code * DAT_002020b8;
extern undefined4 DAT_00202938;
extern undefined4 DAT_0020299c;
extern undefined4 DAT_002029a0;
extern char * DAT_002046b8;
extern char * DAT_002046c4;
extern undefined4 DAT_00204844;
extern short DAT_0023bd80;
extern short DAT_0023be5c;
extern short DAT_0023be80;
extern short DAT_0023be88;
extern char * g_backpack_slot_table;
#define g_equipped_items g_backpack_slot_table[0]
extern char * g_current_container_record;
extern undefined2 g_cursor_holding_state;
extern short DAT_00201c94;
extern undefined4 DAT_002028d8;
extern ushort * g_interact_target;
extern char * g_open_container_list;
extern char * g_selected_object;
extern char s_font4x5p_sys_0008431c[];
/* Globals defined in uw.c but also used by functions that now live in
   combat.c (NPC melee combat AI) -- extern'd here so both translation
   units see the same storage. */
extern byte DAT_001013f8;
extern char * DAT_00101400;
extern char * DAT_00101404;
extern char DAT_00101408;
extern byte DAT_0010140c;
extern char DAT_00101410;
extern undefined1 DAT_00101420;
extern int DAT_00101430;
extern char DAT_0010143c;
extern short DAT_00101444; /* signed fine-coordinate delta; ARM reads 16 bits */
extern short DAT_00101448; /* signed fine-coordinate delta; ARM reads 16 bits */
extern undefined4 DAT_00101734_backing[256];
#define DAT_00101734 DAT_00101734_backing[0]
extern char DAT_0010173c;
extern ushort DAT_00101900;
extern ushort * DAT_0010190c;
extern byte DAT_00101918;
extern undefined4 DAT_00101924;
/* Globals defined in uw.c but also used by functions that now live in
   bitmap.c (sprite blitting / sprite-list system) -- extern'd here so
   both translation units see the same storage. */
extern undefined1 DAT_000842ac_backing[4096];
#define DAT_000842ac ((void *)DAT_000842ac_backing)
extern undefined1 DAT_00086e6c_backing[64];
#define DAT_00086e6c ((intptr_t)DAT_00086e6c_backing)
#define DAT_00087638 0x8000u
#define DAT_0008763c 0x4000u
#define DAT_00087640 0x2000u
#define DAT_00087644 0x1000u
#define DAT_00087648 0x0800u
#define DAT_0023c418 ((ushort)~0x4000u)
#define DAT_0023c408 ((ushort)~0x2000u)
#define DAT_0023c3f0 ((ushort)~0x1000u)
extern byte * DAT_000b4610;
extern char * DAT_000b4614;
extern byte * DAT_000b461c;
extern byte * DAT_000b4628;
extern byte * DAT_000b5630;
extern undefined1 DAT_00202520_backing[1024];
#define DAT_00202520 DAT_00202520_backing[0]
extern ushort DAT_00202738;
extern byte DAT_0023b4a0;
extern undefined2 DAT_0023b848_backing[64];
#define DAT_0023b848 DAT_0023b848_backing[0]
extern undefined1 DAT_0023b8c8_backing[128];
#define DAT_0023b8c8 DAT_0023b8c8_backing[0]
#define DAT_0023b8c9 DAT_0023b8c8_backing[1]
extern undefined2 DAT_0023b8c0;
extern char DAT_0023bb94;
extern undefined1 DAT_0023bb98_backing[512];
#define DAT_0023bb98 DAT_0023bb98_backing[0]
#define DAT_0023bb99 DAT_0023bb98_backing[1]
#define DAT_0023bb9a DAT_0023bb98_backing[2]
extern char DAT_0023c3e0;
extern char * DAT_0023c3e4;
extern char * DAT_0023c3e8;
extern char * DAT_0023c3ec;
extern char * DAT_0023c40c;
extern undefined2 DAT_0023c41c;
extern void *g_grtile_registry[65536];
/* Globals defined in uw.c but also used by functions that now live in
   3d.c (the 3D transform/rasterization pipeline) -- extern'd here so
   both translation units see the same storage. */
#define UW_MAX_VIS_TILES 2048
extern void * g_tile_texptr_emit[UW_MAX_VIS_TILES];
extern void * g_tile_texptr_out[UW_MAX_VIS_TILES];
extern char DAT_000842b0;
extern undefined4 DAT_000b5638_backing[160];
#define DAT_000b5638 DAT_000b5638_backing[0]
extern void * DAT_000c4838_backing[4096];
#define DAT_000c4838 DAT_000c4838_backing[0]
extern int DAT_000c8c98;
extern undefined2 DAT_000da47c;
extern undefined4 DAT_000db438;
extern undefined4 DAT_000db43c;
extern undefined4 DAT_000db440;
extern int DAT_000db448;
extern int DAT_000db44c;
extern char DAT_0023b830;
extern undefined4 DAT_000d9930_arr[512];
extern undefined4 DAT_000d9ed8_arr[512];
#define DAT_000d9930 (DAT_000d9930_arr[0])
#define DAT_000d9ed8 (DAT_000d9ed8_arr[0])
/* Globals defined in uw.c but also used by functions that now live in
   player.c (player state/movement/save persistence) -- extern'd here
   so both translation units see the same storage. */
extern undefined4 DAT_000858a0;
extern undefined1 DAT_00085d20_backing[65536];
#define DAT_00085d20 DAT_00085d20_backing[0]
extern short DAT_00201c70;
extern undefined2 DAT_00201c78;
extern short DAT_00202080;
extern short DAT_00202088;
extern undefined4 DAT_002020d8;
extern byte * DAT_00202c6c;
extern short DAT_00202c68;
extern short DAT_00202c30;
extern short DAT_0010061c;
extern short DAT_00100608;
/* Monster effect flags at offset 8 of each loaded 0x30-byte record. */
#define DAT_001007d8 DAT_001007d0_backing[8]
extern byte DAT_001005fc;
#define DAT_001007f8 DAT_001007d0_backing[0x28] /* per-class XP, 16 bits; loaded monster table */
extern undefined2 DAT_00100630_backing[32768];
#define DAT_00100630 DAT_00100630_backing[0]
extern undefined1 DAT_00203303;
extern undefined2 DAT_00203304;
extern undefined2 DAT_002048b0_backing[8192];
#define DAT_002048b0 DAT_002048b0_backing[0]
extern undefined2 DAT_002048b2;
extern undefined1 * DAT_002048b8;
extern char * DAT_0023b82c;
extern undefined1 DAT_0023bca8_backing[8192];
#define DAT_0023bca8 DAT_0023bca8_backing[0]
extern undefined2 DAT_0023be98;
extern undefined4 DAT_0023bea8;
extern short DAT_0023beb4;
extern unsigned char DAT_00085ac8_backing[16];
#define g_light_source_slots DAT_00085ac8_backing[0]
extern undefined1 * g_save_equip_table_ptr;
extern undefined1 * g_save_record_base_ptr;
extern char * g_save_record_buffer;
extern byte * g_scratch_object_ptr;
extern char s_player_dat_00085a74[];
extern undefined1 DAT_00202800_backing[65536];
extern undefined1 DAT_00204880_backing[128];
/* Globals defined in uw.c but also used by functions that now live in
   tmap.c (the dungeon tile map) -- extern'd here so both translation
   units see the same storage. */
extern undefined4 DAT_000a85d0_backing[16384];
#define UW_A85B(o) (*(undefined1 *)((char *)DAT_000a85d0_backing + (o)))
extern const undefined1 DAT_00086a00_region[0xb0];
extern const undefined1 DAT_00086b50_region[0xa0];
#define DAT_00086b50_at(off)  (*(const undefined1 *)(DAT_00086b50_region + (off)))
#define UW_B50_LIT(addr)  ((intptr_t)(const char *)DAT_00086b50_region + ((intptr_t)(addr) - 0x86b50))
extern const unsigned char DAT_00086bf0_real_table[16];
extern undefined4 DAT_00086b20;
extern short DAT_00086b24;
extern short DAT_00086b28;
extern char DAT_000872a0;
extern char *DAT_0024fa2c;
extern char s__DATA_mono_dat_000872b8[];
extern char s__DATA_light_dat_000872c8[];
extern char s_and_00087310[];
extern char DAT_0023c27c;
extern undefined2 DAT_00086b30;
extern char DAT_00087938;
#define DAT_000a85d0 DAT_000a85d0_backing[0]
extern char * DAT_00110fc0;
extern char * DAT_0023aecc;
extern code * DAT_0023b4d4;
extern ushort DAT_0023b4d8;
extern byte DAT_0023b4e0;
extern short DAT_0023b4e4;
extern short DAT_0023b4e8;
extern byte * DAT_0023b4ec;
extern char * DAT_0023b4f0;
extern code * DAT_0023b4f4;
extern code * DAT_0023b80c;
extern short DAT_0023b810;
extern byte * DAT_0023b814;
extern undefined1 DAT_0023b818;
extern ushort DAT_0023b81c;
extern undefined1 * DAT_0023b820;
extern undefined2 DAT_0023b824;
extern ushort DAT_0023b828;
extern char DAT_0023b834;
extern undefined4 DAT_0023b838;
extern int DAT_0023b83c;
extern int g_uw_hide_walls;
extern undefined1 g_visibility_ring_buffer_backing[32768];
#define g_visibility_ring_buffer g_visibility_ring_buffer_backing[0]
extern short g_visibility_ring_depth;
#define DAT_00086a00 (*(undefined1 *)(DAT_00086a00_region + 0x00))
#define DAT_00086a02 (*(undefined1 *)(DAT_00086a00_region + 0x02))
#define DAT_00086a20 (*(undefined1 *)(DAT_00086a00_region + 0x20))
#define DAT_00086b84  DAT_00086b50_at(0x34)
#define DAT_00086b88  DAT_00086b50_at(0x38)
#define DAT_00086bb0  DAT_00086b50_at(0x60)
#define DAT_00086bb1  DAT_00086b50_at(0x61)
#define DAT_00086bb2  DAT_00086b50_at(0x62)
#define DAT_00086bb3  DAT_00086b50_at(0x63)
#define DAT_00086bb4  DAT_00086b50_at(0x64)
#define DAT_00086bb5  DAT_00086b50_at(0x65)
#define DAT_00086bc8  DAT_00086b50_at(0x78)
#define DAT_00086bc9  DAT_00086b50_at(0x79)
#define DAT_00086bca  DAT_00086b50_at(0x7a)
#define DAT_00086bcb  DAT_00086b50_at(0x7b)
#define DAT_00086bcc  DAT_00086b50_at(0x7c)
#define DAT_00086bcd  DAT_00086b50_at(0x7d)
#define DAT_00086bf0 (*(undefined1 *)DAT_00086bf0_real_table)
#define DAT_000a85d4 (*(int *)((char *)DAT_000a85d0_backing + 0x4))
#define DAT_000a85d8 UW_A85B(0x8)
#define DAT_000a85d9 UW_A85B(0x9)
#define DAT_000a85da UW_A85B(0xa)
#define DAT_000a85db UW_A85B(0xb)
#define DAT_000a85dc UW_A85B(0xc)
#define DAT_000a85dd UW_A85B(0xd)
#define DAT_000a85de UW_A85B(0xe)
#define DAT_000a85df UW_A85B(0xf)
#define DAT_000a85e0 UW_A85B(0x10)
#define DAT_000a85e1 UW_A85B(0x11)
#define DAT_000a85e2 UW_A85B(0x12)
#define DAT_000a85e3 UW_A85B(0x13)
#define DAT_000acde4 UW_A85B(0x4814)
#define DAT_000acde5 UW_A85B(0x4815)
#define DAT_000acde6 UW_A85B(0x4816)
#define DAT_000acde7 UW_A85B(0x4817)
#define DAT_000acde8 UW_A85B(0x4818)
#define DAT_000acde9 UW_A85B(0x4819)
#define DAT_000acdea UW_A85B(0x481a)
#define DAT_000acdeb UW_A85B(0x481b)
#define DAT_000acdec UW_A85B(0x481c)
#define DAT_000acded UW_A85B(0x481d)
#define DAT_000acdee UW_A85B(0x481e)
#define DAT_000acdef UW_A85B(0x481f)
#define DAT_000acdf0 UW_A85B(0x4820)
#define DAT_000acdf1 UW_A85B(0x4821)
#define DAT_000acdf2 UW_A85B(0x4822)
#define DAT_000acdf3 UW_A85B(0x4823)
#define DAT_000acdf4 UW_A85B(0x4824)
#define DAT_000acdf5 UW_A85B(0x4825)
#define DAT_000acdf6 UW_A85B(0x4826)
#define DAT_000acdf7 UW_A85B(0x4827)
#define DAT_000acdfc UW_A85B(0x482c)
#define DAT_000acdfd UW_A85B(0x482d)
#define DAT_000acdfe UW_A85B(0x482e)
#define DAT_000acdff UW_A85B(0x482f)
#define DAT_000ace00 UW_A85B(0x4830)
#define DAT_000ace01 UW_A85B(0x4831)
#define DAT_000ace02 UW_A85B(0x4832)
#define DAT_000ace03 UW_A85B(0x4833)
#define DAT_000ace04 UW_A85B(0x4834)
#define DAT_000ace05 UW_A85B(0x4835)
#define DAT_000ace06 UW_A85B(0x4836)
#define DAT_000ace07 UW_A85B(0x4837)
#define DAT_000ace08 UW_A85B(0x4838)
#define DAT_000ace09 UW_A85B(0x4839)
#define DAT_000ace0a UW_A85B(0x483a)
#define DAT_000ace0b UW_A85B(0x483b)
#define DAT_000ace0c UW_A85B(0x483c)
#define DAT_000ace0d UW_A85B(0x483d)
#define DAT_000ace0e UW_A85B(0x483e)
#define DAT_000ace0f UW_A85B(0x483f)
#define DAT_000ace10 UW_A85B(0x4840)
#define DAT_000ace11 UW_A85B(0x4841)
#define DAT_000ace12 UW_A85B(0x4842)
#define DAT_000ace13 UW_A85B(0x4843)
#define DAT_000ace14 UW_A85B(0x4844)
#define DAT_000ace15 UW_A85B(0x4845)
#define DAT_000ace16 UW_A85B(0x4846)
#define DAT_000ace17 UW_A85B(0x4847)
#define DAT_000ace18 UW_A85B(0x4848)
#define DAT_000ace19 UW_A85B(0x4849)
#define DAT_000ace1a UW_A85B(0x484a)
#define DAT_000ace1b UW_A85B(0x484b)
#define DAT_000ace1c UW_A85B(0x484c)
#define DAT_000ace1d UW_A85B(0x484d)
#define DAT_000ace1e UW_A85B(0x484e)
#define DAT_000ace1f UW_A85B(0x484f)
#define DAT_000ace20 UW_A85B(0x4850)
#define DAT_000ace21 UW_A85B(0x4851)
#define DAT_000ace22 UW_A85B(0x4852)
#define DAT_000ace23 UW_A85B(0x4853)
#define DAT_000ace24 UW_A85B(0x4854)
#define DAT_000ace25 UW_A85B(0x4855)
#define DAT_000ace26 UW_A85B(0x4856)
#define DAT_000ace27 UW_A85B(0x4857)
#define DAT_000ace30 UW_A85B(0x4860)
#define DAT_000ace31 UW_A85B(0x4861)
#define DAT_000ace32 UW_A85B(0x4862)
#define DAT_000ace33 UW_A85B(0x4863)
#define g_current_tile ((uw_tile_t *)DAT_0023b4ec)
#define g_current_view ((uw_current_view_t *)DAT_00086e6c_backing)
/* Globals defined in uw.c but also used by functions that now live in
   objects.c (the object table) -- extern'd here so both translation
   units see the same storage. */
extern short DAT_0010144c;
extern short DAT_00101454;
extern short DAT_00202a38;
extern short DAT_00202a3c;
extern short DAT_00202a40;
/* FUN_0004ad10 reads word 1 (position) and word 12 (heading). */
extern ushort * DAT_00202a44;
extern ushort DAT_00202a48;
extern ushort DAT_00202a4c;
extern undefined2 DAT_00202a50;
extern undefined2 DAT_00202a54;
extern char * DAT_0020469c;
extern char * DAT_002046a4;
extern char * DAT_002046a8;
extern char * DAT_002046bc;
/* Globals defined in uw.c but also used by functions that now live in
   hud.c (the HUD and message scroll panel) -- extern'd here so both
   translation units see the same storage. */
extern code * DAT_00086b38_fnptrs[6];
extern undefined1 DAT_0023c118_arr[9];
extern undefined1 DAT_0023cdb0_backing[32768];
#define DAT_0023cdb0 DAT_0023cdb0_backing[0]
extern undefined1 DAT_0023ce10_backing[65536];
#define DAT_0023ce10 DAT_0023ce10_backing[0]
#define DAT_0023ce1c (*(ushort *)(DAT_0023ce10_backing + 0xc))
#define DAT_0023ce28 (*(ushort *)(DAT_0023ce10_backing + 0x18))
#define DAT_0023ce34 (*(ushort *)(DAT_0023ce10_backing + 0x24))
#define DAT_0023ce40 (*(ushort *)(DAT_0023ce10_backing + 0x30))
#define DAT_0023ce4c (*(ushort *)(DAT_0023ce10_backing + 0x3c))
#define DAT_0023ce58 (*(ushort *)(DAT_0023ce10_backing + 0x48))
#define DAT_0023ce64 (*(ushort *)(DAT_0023ce10_backing + 0x54))
extern undefined1 DAT_0023c698_backing[32768];
#define DAT_0023c698 DAT_0023c698_backing[0]
extern uintptr_t DAT_00101a70;
undefined4 FUN_000362e8();
undefined4 FUN_00036300();
undefined4 FUN_00036308();
undefined4 FUN_00036344();
undefined4 FUN_00036394();
undefined4 FUN_000363f0();
undefined4 FUN_00036404();
undefined4 FUN_00036418();
undefined4 FUN_000365bc();
undefined4 FUN_000365fc();
undefined4 FUN_0003663c();
undefined4 FUN_00036698();

extern HWND__ *DAT_0023c548;
extern void (*const g_hud_panel_handlers_table[13])(void);
/* Globals defined in uw.c but also used by functions that now live in
   ai.c (NPC AI) -- extern'd here so both translation units see the
   same storage. */
extern undefined DAT_00084f20_backing[8192];
#define DAT_00084f20 DAT_00084f20_backing[0]
extern undefined1 DAT_001007d0_backing[6144];
#define DAT_001007d0 DAT_001007d0_backing[0]
extern undefined4 DAT_001013fc;
extern ushort DAT_00101414;
extern ushort DAT_0010141c;
extern char * DAT_00101438;
extern undefined4 DAT_00101560;
extern void * DAT_0010172c;
extern char * DAT_00101904;
extern ushort DAT_00101910;
extern undefined4 DAT_0010191c;
extern char DAT_00101928;
extern short DAT_00101938;
extern short DAT_0010193c;
extern undefined4 DAT_00101944;
#define DAT_002027d1 DAT_002027d0_backing[1] /* projectile speed in each loaded weapon record */
extern short DAT_002046b0;
extern byte * DAT_002046c0;
extern byte * DAT_002046c8;
extern undefined2 DAT_002048c0_backing[32768];
#define DAT_002048c0 DAT_002048c0_backing[0]
extern undefined DAT_00204920_backing[8192];
#define DAT_00204920 DAT_00204920_backing[0]
extern undefined1 DAT_00204980_backing[65536];
#define DAT_00204980 DAT_00204980_backing[0]
extern undefined2 DAT_00204990_backing[32768];
#define DAT_00204990 DAT_00204990_backing[0]
extern undefined2 DAT_002049a0_backing[8192];
#define DAT_002049a0 DAT_002049a0_backing[0]
extern undefined2 DAT_002049b0_backing[32768];
#define DAT_002049b0 DAT_002049b0_backing[0]
undefined4 collision_response_mobile_object();
extern undefined1 DAT_00101424;
extern undefined1 DAT_00101428_backing[8192];
#define DAT_00101428 DAT_00101428_backing[0]
extern undefined2 DAT_00101418;
extern undefined2 DAT_00101908;
/* "Last attacker" record, confirmed via check_npc_morale_flee's own use
   (src/ai.c ~3230): a saved snapshot of who last attacked the current
   NPC (tile x/y/heading + slot index + class id), with an expiry
   timestamp so the alert reaction only fires while it's still recent.
   Persisted to/from the save-game block (DAT_00086df8+0xba..0xc1) by
   load_last_attacker_record/save_last_attacker_record. */
extern byte DAT_0010192c; // last attacker's tile x
extern byte DAT_00101930; // last attacker's tile y
extern undefined1 DAT_00101934; // last attacker's heading
extern char DAT_0010194c; // last attacker's object slot index
extern char DAT_000853d0; // last attacker's class id
extern int DAT_00101940; // game-clock timestamp the attack was recorded at
extern undefined2 DAT_00101960; // talking-portrait mouth-frame cycle count, reset by reset_dialogue_speech_state
/* Voice-sample page size cache used by load_voice_sample_page and
   read_voice_sample_page_chunk. DAT_000853f8 was mis-declared as a
   1-byte `undefined` in the original decompile despite holding a
   computed size masked with & 0xffff elsewhere -- widened to ushort,
   matching its siblings, to stop the silent truncation. */
extern ushort DAT_000853fc;
/* Globals defined in uw.c but also used by functions that now live in
   containers.c (the open-container/backpack view stack) -- extern'd
   here so both translation units see the same storage. */
extern undefined1 DAT_00085c88_backing[32768];
#define DAT_00085c88 DAT_00085c88_backing[0]
extern undefined1 DAT_002029f8_backing[256];
#define g_carry_weight_limit_table DAT_002029f8_backing[0]
extern short g_player_carry_weight;
#define DAT_002028ec DAT_002028e8_backing[1]
#define DAT_00202951 g_backpack_slot_table[1]
#define g_backpack_widget_to_slot_plus1 g_backpack_widget_to_slot_backing[1]
#define g_current_container_link (*(ushort *)&g_backpack_slot_table[56])
/* Globals defined in uw.c but also used by functions that now live in
   interact.c (object interaction dispatch) -- extern'd here so both
   translation units see the same storage. */
extern short DAT_000858c4;
extern char * DAT_002020b0;
/* Globals defined in uw.c but also used by functions that now live in
   resources.c (.GR bitmap loading, flip-grtile slots, door frames) --
   extern'd here so both translation units see the same storage. */
extern ushort DAT_00202744;
extern undefined1 DAT_0023b840_backing[8192];
#define DAT_0023b840 DAT_0023b840_backing[0]
extern undefined1 DAT_00202750_backing[256];
#define DAT_00202750 DAT_00202750_backing[0]
extern void * g_grtile_real_ptrs[320];
extern char s__DATA__00085970[];
/* Globals defined in uw.c but also used by functions that now live in
   item_use.c (item use) -- extern'd here so both translation units
   see the same storage. */
extern undefined1 DAT_00202a28_backing[256];
#define g_food_effect_table DAT_00202a28_backing[0]
extern undefined1 DAT_00087650_backing[40];
#define DAT_00087650 DAT_00087650_backing[0]
extern char DAT_002506aa;
extern undefined1 DAT_002029d8_backing[256];
#define g_light_radius_table DAT_002029d8_backing[0]
extern undefined4 g_weapon_overlay_enabled;
extern char s_UNNAMED_00084f24[];
/* Globals defined in uw.c but also used by functions that now live in
   movement.c (the movement collision sweep) -- extern'd here so both
   translation units see the same storage. */
extern unsigned char DAT_002049c8_backing[64];
extern unsigned char DAT_00086998_backing[16];
extern short DAT_00086990;
extern ushort DAT_00100610;
extern short DAT_0010062c;
extern char *DAT_001005e4;
extern char *DAT_001005e0;
extern char *DAT_002046b8;
/* Six-byte collision candidates: top, bottom, packed link, tile offset.
 * Ghidra split overlapping fields (and next-record sort views) into globals. */
extern undefined1 DAT_00202c38_backing[8192];
#define DAT_00202c38 DAT_00202c38_backing[0]
/* BUG FIX (unit-testing-framework merge): this branch's own history had
   drifted into giving DAT_00202c39..3f each their OWN independent
   backing array -- but every real use (uw.c's
   `(&DAT_00202c38)[i*6]`/`(&DAT_00202c3a)[i*6]`/`&DAT_00202c3c + i*6`
   address arithmetic) treats them as 8 adjacent byte-offsets WITHIN
   ONE combined per-candidate record array, not 8 separate arrays --
   confirmed by the unit-testing-framework branch independently finding
   the same thing. Aliasing them back onto DAT_00202c38_backing (as
   this branch's own DAT_00086998-family fields already do for a
   similar multi-field record elsewhere in this file) is the correct
   fix; the previous independent-array version let &DAT_00202c3a + i*6
   arithmetic silently walk into unrelated heap memory instead of the
   intended adjacent record. */
#define DAT_00202c39 DAT_00202c38_backing[1]
#define DAT_00202c3a DAT_00202c38_backing[2]
#define DAT_00202c3b DAT_00202c38_backing[3]
#define DAT_00202c3c DAT_00202c38_backing[4]
#define DAT_00202c3d DAT_00202c38_backing[5]
#define DAT_00202c3e DAT_00202c38_backing[6]
#define DAT_00202c3f DAT_00202c38_backing[7]
extern char * DAT_00204874;
extern char * DAT_002048bc;
#define DAT_00086998  (*(signed char *)(DAT_00086998_backing + 0))
#define DAT_00086999  (DAT_00086998_backing[1])
#define DAT_0008699a  (DAT_00086998_backing[2])
#define DAT_0008699b  (DAT_00086998_backing[3])
#define DAT_0008699f  (DAT_00086998_backing[7])
#define DAT_000869a0 (DAT_00086998_backing[8])
#define DAT_000869a1  (DAT_00086998_backing[9])
#define DAT_000869a2  (DAT_00086998_backing[10])
#define DAT_002049c8 (*(short *)(DAT_002049c8_backing + 0x00))
#define DAT_002049ca (*(short *)(DAT_002049c8_backing + 0x02))
#define DAT_002049cc (*(short *)(DAT_002049c8_backing + 0x04))
#define DAT_002049ce (*(undefined2 *)(DAT_002049c8_backing + 0x06))
#define DAT_002049d0 (DAT_002049c8_backing[0x08])
#define DAT_002049d1 (DAT_002049c8_backing[0x09])
#define DAT_002049d2 (*(undefined2 *)(DAT_002049c8_backing + 0x0a))
#define DAT_002049d4 (*(ushort *)(DAT_002049c8_backing + 0x0c))
#define DAT_002049d6 (*(ushort *)(DAT_002049c8_backing + 0x0e))
#define DAT_002049d8 (DAT_002049c8_backing[0x10])
#define DAT_002049d9 (DAT_002049c8_backing[0x11])
#define DAT_002049da (DAT_002049c8_backing[0x12])
#define DAT_002049dc (DAT_002049c8_backing[0x14])
#define DAT_002049dd (DAT_002049c8_backing[0x15])
#define DAT_002049de (DAT_002049c8_backing[0x16])
/* Globals defined in uw.c but also used by functions that now live in
   visibility.c (dungeon-view visibility/draw-list build) -- extern'd
   here so both translation units see the same storage. */
extern short DAT_00086b2c;
extern void * DAT_002020f8_arr[256];
#define DAT_002020f8 DAT_002020f8_arr[0]
extern void * DAT_00202308_arr[256];
#define DAT_00202308 DAT_00202308_arr[0]
extern char DAT_002506ab;
extern undefined2 DAT_0023adb0;
extern undefined2 DAT_0023adb8_backing[8192];
#define DAT_0023adb8 DAT_0023adb8_backing[0]
extern undefined2 DAT_0023add0_backing[8192];
#define DAT_0023add0 DAT_0023add0_backing[0]
extern undefined2 DAT_0023ae40_backing[8192];
#define DAT_0023ae40 DAT_0023ae40_backing[0]
extern undefined2 DAT_0023ae58_backing[8192];
#define DAT_0023ae58 DAT_0023ae58_backing[0]
extern undefined2 DAT_0023aeb8_backing[8192];
#define DAT_0023aeb8 DAT_0023aeb8_backing[0]
extern undefined2 * DAT_0023aed0;
extern undefined2 DAT_0023aed4;
extern undefined2 DAT_0023b020;
extern undefined4 DAT_0023b804;
#define DAT_0023b841 DAT_0023b840_backing[1]
extern short DAT_0025063c;
extern short DAT_0025064c;
extern short DAT_002506dc;
extern undefined4 g_dungeon_view_active;
extern short g_visibility_max_ring_passes;
#define DAT_00086a18 (*(undefined1 *)(DAT_00086a00_region + 0x18))
#define DAT_00086a60 (*(undefined1 *)(DAT_00086a00_region + 0x60))
/* Globals defined in uw.c but also used by functions that now live in
   saveload.c (save/load) -- extern'd here so both translation units
   see the same storage. */
extern undefined2 DAT_000868dc;
extern short DAT_002046f0;
extern int DAT_0020484c;
/* Globals defined in uw.c but also used by functions that now live in
   text.c (text/font rendering) -- extern'd here so both translation
   units see the same storage. */
extern undefined2 g_text_flat_color;
/* Globals defined in uw.c but also used by functions that now live in
   collision.c (collision geometry) -- extern'd here so both
   translation units see the same storage. */
extern undefined1 DAT_00202bf8_backing[32768];
#define DAT_00202bf8 DAT_00202bf8_backing[0]
#define DAT_00202bf9  (DAT_00202bf8_backing[0x01])
#define DAT_00202bfa  (DAT_00202bf8_backing[0x02])
#define DAT_00202bfb  (DAT_00202bf8_backing[0x03])
#define DAT_00202bfc  (DAT_00202bf8_backing[0x04])
#define DAT_00202bfd  (DAT_00202bf8_backing[0x05])
#define DAT_00202bfe  (DAT_00202bf8_backing[0x06])
#define DAT_00202bff  (DAT_00202bf8_backing[0x07])
#define DAT_00202c02  (DAT_00202bf8_backing[0x0a])
#define DAT_00202c03  (DAT_00202bf8_backing[0x0b])
#define DAT_00202c04  (DAT_00202bf8_backing[0x0c])
#define DAT_00202c07  (DAT_00202bf8_backing[0x0f])
#define DAT_00202c08  (DAT_00202bf8_backing[0x10])
#define DAT_00202c09  (DAT_00202bf8_backing[0x11])
#define DAT_00202c0a  (*(unsigned short *)(DAT_00202bf8_backing + 0x12))
#define DAT_00202c0c  (DAT_00202bf8_backing[0x14])
#define DAT_00202c0d  (DAT_00202bf8_backing[0x15])
#define DAT_00202c0e  (DAT_00202bf8_backing[0x16])
#define DAT_00202c14  (*(unsigned int *)(DAT_00202bf8_backing + 0x1c))
/* Globals defined in uw.c but also used by functions that now live in
   input.c (key bindings, movement commands, mouse) -- extern'd here
   so both translation units see the same storage. */
#define DAT_00086e68 15
#define DAT_0008589c 0x3ac
#define DAT_00085898 0xeb
#define DAT_00085894 0xbc
extern short DAT_00085890;
extern short DAT_002020ac;
extern void (*const PTR_FUN_000858c8_table[5])(void);
extern undefined1 DAT_0023c460_backing[32768];
#define DAT_0023c460 DAT_0023c460_backing[0]
extern short DAT_00086968;
extern undefined2 DAT_0008696a;
extern undefined2 DAT_0008696c;
extern short DAT_0008696e;
extern short * DAT_000876c4;
extern int DAT_000879ac;
extern undefined4 DAT_000bbef8;
extern short DAT_00202078;
extern byte DAT_0020208c;
extern undefined4 DAT_002020d4;
extern undefined2 DAT_0020470c;
extern undefined2 DAT_00204710;
extern short DAT_00204788;
extern undefined2 DAT_00204830;
extern undefined2 DAT_00204834;
extern short DAT_00204840;
extern short DAT_00204850;
extern int DAT_0020484c;
extern char DAT_002506aa;
extern int DAT_0020485c;
extern short DAT_0023bf48;
extern short DAT_0023bf4c;
extern undefined4 DAT_0023bf54;
extern byte DAT_0023bf58;
extern undefined DAT_00250658_backing[256];
#define DAT_00250658 DAT_00250658_backing[0]
extern short g_movement_mode;
/* Globals defined in uw.c but also used by functions that now live in
   object_actions.c (object action dispatch, critter sprite tier/page,
   placement/combination checks) -- extern'd here so both translation
   units see the same storage. */
extern ushort DAT_002022f8;
extern int DAT_002022fc;
extern ushort DAT_00202508;
#define DAT_00202c9b DAT_00202c90_backing[0xb]
extern undefined1 DAT_0023ce70_backing[8192];
#define DAT_0023ce70 DAT_0023ce70_backing[0]
#define DAT_0023ce71 DAT_0023ce70_backing[1]
extern ushort g_player_max_carry_weight;
extern char s_You_see_000858fc[];
/* Globals defined in uw.c but also used by functions that now live in
   weapon_swing.c (weapon swing animation) -- extern'd here so both
   translation units see the same storage. */
#define UW_WEAPON_SWING_FRAME_COUNT 28
extern undefined1 DAT_000870e0;
extern short DAT_000870e4;
/* Globals defined in uw.c but also used by functions that now live in
   level.c (level loading) -- extern'd here so both translation units
   see the same storage. */
extern undefined1 DAT_00088d98_backing[1536];
#define DAT_00088d98 DAT_00088d98_backing[0]
extern undefined4 DAT_002029d0;
extern undefined1 g_scheduler_count;
extern char *g_scheduler_table;
#define DAT_00250778 g_scheduler_table[0]
#define DAT_00250779 g_scheduler_table[1]
#define DAT_0025077a g_scheduler_table[2]
#define DAT_0025077b g_scheduler_table[3]
#define DAT_0025077c g_scheduler_table[4]
#define DAT_0025077d g_scheduler_table[5]
extern void (*const DAT_00085668_real_table[48])(void);
#define DAT_00085668_backing ((undefined1 *)DAT_00085668_real_table)
#define DAT_00085668 DAT_00085668_backing[0]
#define DAT_000856a4 (DAT_00085668_backing[15 * 8])
extern short DAT_00084f10;
extern char DAT_000870d8;
extern char DAT_000870dc;
extern undefined2 DAT_00189578;
extern ushort DAT_00189580;
extern undefined2 DAT_00189582;
extern undefined2 DAT_00201b60;
extern short DAT_00201b64;
extern short DAT_00201c84;
extern undefined2 DAT_00201c90;
extern undefined2 DAT_00201c8c;
extern short DAT_00201c7c;
extern code *DAT_00201c9c;
extern undefined1 DAT_0023c3dc;
extern undefined1 DAT_0023c3d8;
extern char *DAT_00202098;
extern undefined1 DAT_00087604_backing[65536];
#define DAT_00087604 DAT_00087604_backing[0]
extern undefined *PTR_FUN_00087614;
extern undefined DAT_00087530_backing[210];
#define DAT_00087530 DAT_00087530_backing[0]
extern undefined DAT_00087533_backing[210];
#define DAT_00087533 DAT_00087533_backing[0]
extern undefined1 DAT_00241f08_backing[32768];
#define DAT_00241f08 DAT_00241f08_backing[0]
extern undefined DAT_0023b4dc;
extern undefined2 DAT_0023b8c0;
extern undefined2 DAT_0023bc8c;
#define DAT_0023c118 DAT_0023c118_arr[0]
extern undefined1 DAT_0023c130;
extern ushort DAT_0023c1dc;
extern byte g_flip_grtile_cache_ready;
extern void * DAT_0023c430;
extern short DAT_0023c63c;
extern undefined * DAT_00250704;
extern int g_force_flush;
extern undefined4 g_scroll_control_codes_enabled;
extern unsigned int g_uw_frame_clock_units;
unsigned int uw_frame_clock_ms();
#define DAT_00086b38 (DAT_00086b38_fnptrs[0])
#define DAT_00086b3c (DAT_00086b38_fnptrs[1])
#define DAT_00086b40 (DAT_00086b38_fnptrs[2])
#define DAT_00086b44 (DAT_00086b38_fnptrs[3])
#define DAT_00086b48 (DAT_00086b38_fnptrs[4])
#define DAT_00086b50  DAT_00086b50_at(0x00)
#define DAT_00086b52  DAT_00086b50_at(0x02)
#define DAT_0023c11f DAT_0023c118_arr[7]
#define DAT_0023c120 DAT_0023c118_arr[8]
#define DAT_0023cdb8 (*(int *)(DAT_0023cdb0_backing + 8))
#define DAT_0023cdbc (*(int *)(DAT_0023cdb0_backing + 0xc))
#define DAT_0023cdc0 (*(int *)(DAT_0023cdb0_backing + 0x10))
#define g_hud_panel_handlers (g_hud_panel_handlers_table[0])
#define g_hud_panel_ticker_handlers (g_hud_panel_handlers_table[4])
#define g_target_hud_panel DAT_0023c118_arr[6]
#define DAT_00202806 DAT_00202800_backing[6]
#define DAT_00204880 (*(short *)&DAT_00204880_backing[0])
#define DAT_00204882 (*(short *)&DAT_00204880_backing[2])
#define DAT_00204884 (*(short *)&DAT_00204880_backing[4])
#define DAT_00204886 (*(short *)&DAT_00204880_backing[6])
#define DAT_00204888 (*(short *)&DAT_00204880_backing[8])
#define DAT_0020488c (*(short *)&DAT_00204880_backing[0xc])
#define DAT_0020488e (*(short *)&DAT_00204880_backing[0xe])
#define DAT_00204896 DAT_00204880_backing[0x16]
#define DAT_00204897 DAT_00204880_backing[0x17]
#define DAT_002048a1 DAT_00204880_backing[0x21]
#define DAT_002048a3 DAT_00204880_backing[0x23]
#define DAT_002048a4 DAT_00204880_backing[0x24]
#define DAT_002048a7 DAT_00204880_backing[0x27]
#define DAT_002048a8 DAT_00204880_backing[0x28]
#define DAT_002048a9 DAT_00204880_backing[0x29]
#define DAT_00204892 (*(short *)&DAT_00204880_backing[0x12])
#define DAT_002048a2 DAT_00204880_backing[0x22]
#define DAT_002048aa DAT_00204880_backing[0x2a]
#define g_fall_accel (*(short *)&DAT_00204880_backing[0x10])
#define g_jump_ascent_timer (*(short *)&DAT_00204880_backing[0x14])
#define g_vertical_velocity (*(short *)&DAT_00204880_backing[0xa]) // was DAT_0020488a



void dirty_rect_union();
void dirty_rect_set();
void draw_text_string();
int measure_text_width();
undefined4 unpack_glyph_bitmap();
void load_font_metrics();
undefined4 screen_backup_save();
void screen_backup_restore();
void screen_backup_restore_rect();
void set_viewport_clip_rect();
void draw_horizontal_line();
void fill_viewport_and_flush();
void blit_grtile_to_framebuffer();
void blit_bitmap_to_framebuffer_clipped();
void fade_in();
void fade_out();
void blit_raw_sprite_clipped();
void copy_framebuffer_rect();
void debug_noop_frame_hook();
void flush_dungeon_frame();
void show_error_dialog_stub_thunk();
void reset_viewport_to_fullscreen();
undefined4 render_dungeon_view();
undefined8 compute_view_y_bound();
byte *decompress_gr_bitmap();
uint merge_byte_into_word();
void select_gr_bitmap_remap_table();
void blit_sprite_row_remapped();
void decode_gr_rle_stream();
int integer_sqrt();
void multiply_matrix4x4();
void set_identity_matrix4x4();
void copy_matrix4x4();
void build_shade_lut();
void set_ambient_bias_with_light();
void set_ambient_bias_without_light();
void raster_triangle();
void vec3_sub();
void vec3_cross();
undefined4 check_and_reset_landing_state();
void uw_debug_blit_pick_buffer(void);
void uw_debug_draw_inv_hotspot_positions(void);
void uw_debug_dump_critter_sheet_once(void);
void uw_debug_dump_sprite_frames_once(void);
void uw_debug_force_item_id_once(void);
undefined4 register_gr_group_entry(void *buf, unsigned size, int idx);
/* Forward declarations needed because load_gr_resource_group,
   load_objects_gr, load_tmflat_gr, load_hud_icon_gr,
   reload_single_grtile_entry, and decode_gr_entry_to_buffer (now in
   src/resources.c) take these LAB_ callbacks' addresses and reference
   these globals; their own definitions stay in uw.c (see
   gr_resource_bump_alloc_entry/hud_icon_gr_bump_alloc_entry's matching comment above for what this
   callback family does). */
void *gr_resource_bump_alloc_entry();
undefined4 register_objects_gr_entry(void *buf, unsigned size, int idx);
undefined4 register_tmflat_gr_entry(void *buf, unsigned size, int idx);
void *hud_icon_gr_bump_alloc_entry();
void *decode_gr_entry_bump_alloc_entry();
unsigned int uw_copy_gr_entry_to_dest(void *buf, unsigned int size, int idx);
extern ushort DAT_00202730;
extern char s_lfti_000859fc[];
extern char s_bodies_00085c58[];
extern undefined2 DAT_00085c50;
extern undefined1 DAT_00202988_backing[16];
#define DAT_00202988 DAT_00202988_backing[0]
extern short DAT_00085b64;
extern undefined2 DAT_00085b72;
void *alloc_door_frame_buffer();
void close_door_object();
void open_door_object();
void toggle_door_object();
ushort collision_neighbor_shade_or_zero(ushort *base, byte idx);
int uw_always_show_cursor(void);
int uw_turn_rate_accel(void);
undefined4 decode_critter_sprite_page();
undefined4 resolve_critter_sprite_tier();
byte *uw_load_critter_page_cached(int param_1, int param_2);
undefined4 weapon_swing_frame_loaded(void *buf, unsigned size, int idx);
void *weapon_swing_frame_alloc();
void scroll_container_grid_up(void);
void scroll_container_grid_down(void);
int raster_edge_step();
void raster_triangle_perspective_setup();
void raster_edge_setup();
void raster_textured_span();
bool open_level_archive();
byte close_level_archive();
bool write_archive_entry();
undefined2 read_archive_entry();
int probe_archive_entry_exists();
void enter_automap_screen();
undefined4 save_automap_reveal_to_archive();
undefined4 load_automap_reveal_from_archive();
void exit_automap_screen();
void clear_automap_reveal_buffer();
void draw_automap_tiles();
undefined4 draw_automap_cell_edge();
void darken_pixel();
void darken_pixel_light();
void draw_automap_cell();
void draw_automap_door_edge();
char *pick_closer_note_label();
void handle_automap_note_click();
void draw_automap_notes();
void save_automap_notes_to_archive();
void load_automap_notes_from_archive();
void draw_automap_screen();
void switch_automap_level_display();
void babl_builtin_set_attitude();
void babl_builtin_set_race_attitude();
undefined1 babl_builtin_x_skills();
undefined1 babl_builtin_x_traps();
undefined4 babl_builtin_place_object();
ushort babl_builtin_take_from_npc_inv();
void babl_builtin_add_to_npc_inv();
void babl_builtin_remove_talker();
void babl_builtin_set_quest();
undefined1 babl_builtin_get_quest();
undefined4 babl_builtin_gronk_door();
void babl_builtin_x_obj_stuff();
void babl_builtin_x_obj_pos();
uint *babl_alloc();
void babl_free();
intptr_t babl_resize();
undefined4 seed_conversation_globals_for_new_game();
void load_npc_conversation_variables();
undefined4 load_npc_conversation_record();
void init_conv_var_terminator_record();
int babl_builtin_random();
bool babl_builtin_compare();
undefined4 babl_builtin_plural();
undefined4 babl_builtin_contains();
void babl_builtin_append();
void babl_builtin_copy();
int babl_builtin_find();
int babl_builtin_val();
char *babl_expand_string_refs();
int parse_babl_string_ref_expr();
undefined4 build_babl_symbol_table();
void babl_vm_load_script(int param_1);
undefined4 run_babl_bytecode_interpreter();
void save_npc_conversation_variables();
void babl_op_add();
void babl_op_negate();
void babl_op_mul();
void babl_op_sub();
void babl_op_div();
void babl_op_mod();
void babl_op_or();
void babl_op_and();
void babl_op_gt();
void babl_op_ge();
void babl_op_lt();
void babl_op_le();
void babl_op_eq();
void babl_op_ne();
void babl_op_call();
bool babl_op_return();
void babl_op_push_var_raw();
void babl_op_combine_index();
void babl_op_set_var();
void babl_op_call_builtin();
void babl_op_string_eq();
void babl_op_say();
void babl_op_respond();
int babl_var_word_addr();
int babl_read_var_word();
void babl_write_var_word();
int babl_read_frame_word();
void babl_register_builtin();
void babl_set_variable();
void babl_get_variable();
void init_babl_variable_defaults();
void babl_builtin_setup_to_barter();
void init_barter_ui();
void end_barter_ui();
void handle_barter_player_panel_click();
int hit_test_barter_player_slot();
int hit_test_barter_npc_slot();
void handle_barter_player_slot_drop();
void handle_barter_npc_panel_click();
void handle_barter_slot_click();
undefined4 resolve_barter_slot_at_point();
void redraw_barter_slot_icon();
void pick_up_barter_slot_item();
void place_item_in_barter_slot();
undefined4 merge_or_swap_barter_slot_item();
void draw_hotspot_crosshair_marker(); // was FUN_0001c420
undefined4 barter_offer_is_empty();
undefined4 babl_builtin_do_offer();
int babl_builtin_set_attitude_apply();
undefined2 babl_builtin_length();
undefined4 babl_builtin_sex();
void babl_builtin_do_decline();
undefined4 babl_builtin_take_from_npc();
undefined4 babl_builtin_take_id_from_npc();
undefined4 babl_builtin_do_inv_create();
void finalize_npc_barter_items();
void finalize_player_barter_items();
undefined4 babl_builtin_do_demand();
void babl_builtin_do_judgement();
int sum_barter_offer_value();
undefined4 compute_barter_item_value();
int randomize_value_pct();
int collect_included_player_barter_items();
void add_item_to_npc_inventory();
void give_barter_item_by_item_id();
undefined4 remove_item_from_npc_inventory_by_id();
undefined4 babl_builtin_set_likes_dislikes();
undefined4 check_npc_item_preference();
void *tick_anim_record();
void build_trig_tables();
void build_view_matrix();
void translate_verts_to_camera_space();
void project_verts_through_view_matrix();
void apply_model_position_offset();
void scale_model_part_offsets();
void build_euler_rotation_matrix();
void transform_points_by_matrix();
void near_clip_visible_tiles();
void render_visible_tile_list();
undefined4 win_file_exists();
undefined4 open_existing_file_rw();
bool close_file_handle();
undefined4 open_file_for_read();
undefined4 open_existing_file_rw_alt();
undefined4 seek_file_handle();
undefined4 read_file_handle();
undefined4 write_file_handle();
uint pack_word_byte();
void compute_dimension_volume();
undefined4 rand_below();
uint read_realtime_clock_units();
undefined *load_string_resource();
undefined *load_string_resource_large();
void itoa_radix();
void expand_pals_bytes();
void build_rgb565_palette();
void flush_dirty_rect_to_display();
void flush_dirty_rect_to_display_240();
void end_gx_draw_session();
void init_new_character_record();
undefined4 advance_skill_tree_node();
void draw_chargen_attribute_summary();
void draw_selected_skills_list();
int apply_confirmed_skill_picks();
void reroll_attributes_for_class_race();
void draw_chargen_field_value();
undefined4 draw_chargen_field_options();
uint character_generator_touch_select();
uint wait_for_chargen_field_input();
void palette_cycle_range();
undefined4 resolve_combat_hit_zone();
int find_nearest_hit_target(short *param_1);
void spawn_blood_splat_object();
undefined4 resolve_melee_swing_hit();
int resolve_weapon_hit_skill_check();
void apply_melee_damage();
undefined4 play_weapon_impact_sound();
void compute_attack_relative_facing(void);
undefined4 process_melee_attack_swing();
int find_and_consume_ammo();
undefined4 resolve_equipped_weapon_attack();
void compute_player_weapon_attack_stats();
void reset_weapon_swing_state();
void update_weapon_ready_hud_icon();
void cancel_weapon_swing();
void tick_weapon_swing_state();
void apply_direct_object_hit();
int resolve_npc_melee_attack();
void award_monster_kill_experience();
void load_combat_data_file();
int objects_are_combinable();
undefined4 spawn_combined_object();
bool is_object_consumed_in_combination();
undefined4 check_offering_container_puzzle();
void attempt_talk_interaction();
void enter_conversation_mode_screen();
void exit_talk_mode();
void start_npc_conversation();
void run_babl_menu_wait_loop();
int babl_menu(); // was LAB_0002912c, a no-op stub -- see its own comment next to babl_fmenu
int babl_fmenu();
void select_babl_menu_response();
void babl_builtin_say();
void babl_builtin_respond();
void echo_selected_conversation_choice();
void babl_builtin_print();
undefined4 babl_builtin_pause();
int babl_builtin_ask();
undefined4 babl_builtin_show_inv();
int babl_builtin_find_barter();
bool babl_builtin_find_barter_total();
undefined4 babl_builtin_give_to_npc();
undefined4 babl_builtin_give_ptr_npc();
void babl_builtin_do_inv_delete();
void babl_builtin_find_inv();
undefined4 babl_builtin_identify_inv();
ushort babl_builtin_count_inv();
byte babl_builtin_check_inv_quality();
undefined4 babl_builtin_set_inv_quality();
void load_monster_combat_stats();
undefined4 init_monster_spawn_defaults();
void sync_conv_vars_from_npc();
bool sync_conv_vars_to_npc();
void drop_monster_loot();
int mobile_object_tick(); // was FUN_0002b47c
void init_collision_response_profiles();
int build_collision_height_field_for_object(); // was FUN_0002b7a0
undefined4 collision_response_default();
undefined4 collision_response_alt_locomotion();
undefined4 collision_response_other_locomotion();
undefined4 apply_placement_collision_sweep(); // was FUN_0002bd70
undefined4 tile_pair_los_blocked();
undefined4 can_step_between_tiles();
undefined4 creature_find_path_to_tile();
void reconstruct_path_from_bfs();
int try_direct_line_walk();
undefined4 check_fine_line_of_sight();
undefined4 record_line_walk_step();
undefined4 pop_pending_path_cache_slot();
void reset_npc_path_cache();
void save_walk_path_to_cache_slot();
undefined4 advance_cached_path_step();
undefined4 check_path_cache_position_match();
undefined4 walk_using_cached_path();
void handle_blocked_cached_path();
undefined4 compute_movement_heading();
void npc_set_walk_target();
void npc_walk_toward_tile();
void set_npc_altitude_state();
void npc_arrival_interaction();
void npc_idle_behavior_tick();
void npc_combat_approach_tick();
void npc_wander_return_home_tick();
void npc_notice_and_idle_tick();
void npc_combat_engage_close_tick();
undefined4 npc_combat_set_stance();
void npc_wander_reposition();
undefined4 try_npc_special_ability_no_los();
undefined4 try_npc_special_ability_ranged();
undefined4 try_npc_special_ability_alt();
void npc_combat_engage_wide_tick();
void npc_combat_position_tick();
uint adjust_heading_away_from_player();
void npc_combat_disengage_tick();
void npc_react_to_nearby_player();
void npc_wander_return_home_exact_tick();
undefined4 detect_npc_wander_proximity();
undefined4 check_npc_target_alignment();
undefined4 check_npc_fine_facing_alignment();
int compute_vertical_aim_offset();
void setup_npc_ai_tick_state();
undefined4 npc_ai_tick(); // was FUN_00032d38
void npc_ai_default_tick();
undefined4 refresh_npc_target_delta();
undefined4 check_npc_morale_flee();
int compute_pathfind_search_radius();
void npc_set_goal();
void npc_clear_special_goal();
undefined4 initiate_npc_death(char *param_1);
undefined4 handle_monster_death(char *param_1);
undefined4 apply_damage_to_object();
undefined4 object_tick_is_due(); // was FUN_0003495c
void tick_mobile_objects(); // was FUN_000349bc
void npc_set_goal_for_object();
void randomize_active_npc_flags();
undefined4 resolve_tile_entry_offset();
void npc_movement_tick();
undefined4 settle_misplaced_mobile_object();
void advance_mobile_objects();
undefined4 detect_unsafe_rest_object_callback();
undefined4 check_rest_area_unsafe();
undefined4 spawn_rest_interrupt_monster_callback();
undefined4 check_rest_interrupted_by_monster();
void load_last_attacker_record();
void save_last_attacker_record();
void clear_last_attacker_record();
undefined4 alert_npc_to_noise_callback();
void emit_noise_alert();
undefined4 reset_dialogue_speech_state();
void chargen_ui_transition_hook();
void clear_ambient_sound_target_thunk();
void bubble_sort_indices_by_key_table();
undefined2 load_voice_sample_page();
uint read_voice_sample_page_chunk();
void convert_palette_bgrx_to_rgb();
void tick_book_illustration_palette_cycles();
undefined4 babl_render_op_wrap_message();
undefined4 babl_render_op_show_code();
undefined4 babl_render_op_say();
undefined4 babl_render_op_play_sound();
void babl_render_tick();
void render_babl_dialog_window();
void display_book_or_scroll_page();
void cache_ambient_sound_handle();
void record_illustration_discovery_and_display();
undefined4 discard_container_contents();
undefined4 reset_burnt_out_item_state();
undefined4 apply_object_destruction_effect();
undefined4 resolve_damage_type_resistance();
undefined4 apply_typed_damage_to_object();
bool apply_object_durability_damage();
void load_3d_object_models();
void init_glyph_width_table();
int get_catalog_sprite_width();
void save_draw_command_cursor();
void init_draw_command_cursor();
void emit_glyph_draw_command();
void finalize_glyph_draw_command();
undefined4 find_placement_via_tile_flood_fill();
undefined4 teleport_object_to_level_tile();
undefined4 apply_area_terrain_effect();
undefined4 apply_poison_or_damage_trap_effect();
undefined4 dispatch_trap_special_or_tile_action();
undefined4 try_climb_wall();
void handle_level4_maze_puzzle_button();
void try_combine_shrine_markers();
void emit_player_noise_alert();
void apply_quest_event_numeric_effect();
void trigger_exploding_book_trap();
void trigger_exploding_book_trap_at_tile();
void trigger_scripted_npc_conversation();
void advance_scheduler_and_show_page3();
undefined4 unlink_object_from_tile_callback();
void trigger_quest_milestone_cleanup_event();
undefined4 resolve_unique_npc_special_behavior();
int resolve_lock_difficulty_rating();
uint attempt_pick_lock();
void use_lockpick_on_object();
undefined4 clear_object_temp_flag_callback();
void clear_temp_flags_on_all_objects();
undefined4 load_bmp_resource_to_rgb565();
void decompress_rle_stream();
uint pack_byte_into_word();
uint read_rle_op_code();
void rle_op_handle_short_run();
void rle_op_copy_pairs_even();
void rle_op_copy_pairs_odd();
void rle_op_fill_doubled_byte_even();
void rle_op_fill_doubled_byte_odd();
void rle_op_finalize_length();
void rle_op_mark_stream_done();
void run_game_startup_sequence();
void run_game_shutdown_sequence();
void wait_and_show_intro_page();
void init_main_loop_state();
void request_game_exit();
void reset_level_arena_and_invalidate();
void set_game_mode();
void change_game_mode();
void enter_dungeon_view();
void reset_player_for_resurrection();
void handle_player_death_and_menu_transition();
undefined4 dungeon_view_anim_tick();
void show_error_dialog_stub();
void log_categorized_error_message();
void report_categorized_fatal_error();
void report_fatal_error_and_exit();
void report_fatal_error_message_and_exit();
bool apply_swim_wade_pose();
void set_locomotion_state();
void apply_level9_random_hazard_tick();
undefined4 begin_directional_move();
void apply_heading_turn();
void set_player_tile_position();
void commit_player_move();
void demo_set_player_pos(double x, double y, double z, double yaw_deg, double pitch_deg);
void debug_print_player_position(const char *label);
void resolve_move_vector();
void trigger_player_jump_if_grounded();
void force_locomotion_state_refresh();
void apply_vertical_launch_impulse();
void trigger_quest_stumble_animation();
void apply_quest_vertical_effect();
void apply_movement_mode_profile();
void toggle_stats_panel();
void print_character_description_scroll();
void show_flask_value_tooltip();
void register_stats_panel_click_regions();
void unregister_stats_panel_click_regions();
void enter_dungeon_view_hud_init();
void sync_player_stats_to_hud();
void refresh_equipment_display_if_visible();
undefined4 target_in_range();
uint object_chain_max_barrier();
undefined4 target_line_of_sight();
ushort *pick_object_under_cursor();
void describe_picked_terrain();
void finalize_object_pickup();
void interact_default();
void interact_talk_npc();
void dispatch_object_action();
void interact_look();
void interact_use();
void interact_attack();
void handle_game_view_click();
void perform_object_search_check();
void handle_inventory_panel_normal_click();
void inventory_panel_click_region();
void mode_icon_highlight_on();
void mode_icon_highlight_off();
void cursor_mode_button_click();
void cursor_mode_button_click_restricted();
void ready_weapon();
void unready_weapon();
void toggle_weapon_ready();
bool check_can_save_game();
undefined4 check_can_load_game();
undefined4 load_critter_association_tables();
void flush_pending_critter_resource_slots();
undefined4 decode_tile_object_billboard_texture();
void *lookup_grtile_by_id();
void blit_object_sprite_by_frame();
char *decode_gr_entry_bitmap();
uint resolve_sprite_id_to_frame();
void draw_sprite_by_id();
void draw_hud_icon_sprite();
void sprite_list_flush_blit_raw();
void *get_texture_page();
undefined4 select_default_hud_font();
bool select_active_font();
void decrement_cursor_hide_depth_thunk();
void clear_screen_and_restore_cursor();
bool load_pals_bank();
bool set_palette_bank();
void apply_palette_buffer();
void fade_active_palette_to_black();
void weapon_overlay_flash_hold();
void weapon_overlay_flash_restore();
void weapon_overlay_flash_once();
void play_view_restore_transition();
undefined4 load_gr_format3_extra_table();
undefined4 open_gr_resource_file();
void close_gr_resource_file();
uint read_gr_resource_record();
bool register_grtile_entry();
undefined4 reregister_grtile_entry();
uint load_gr_resource_entries();
unsigned char *uw_get_default_palette(const char *gr_name);
undefined4 load_gr_resource_group();
undefined4 load_objects_gr();
undefined4 load_tmflat_gr();
undefined4 load_hud_icon_gr();
void reload_single_grtile_entry();
undefined4 decode_gr_entry_to_buffer();
undefined4 load_startup_gr_resources();
void load_door_frames();
void load_armor_variant_tables();
void load_class6_variant_effect_table();
void load_class7_variant_effect_table();
void *class0_variant_effect_table_lookup();
void *class1_variant_effect_table_lookup();
void *class2_variant_effect_table_lookup();
void *class6_variant_effect_table_lookup();
void *class7_variant_effect_table_lookup();
undefined4 class3_variant_effect_stub();
undefined4 class4_variant_effect_stub();
undefined4 class5_variant_effect_stub();
void input_bindings_init();
void input_bindings_free();
int register_click_region();
int register_key_binding();
void unregister_key_binding();
void poll_input_bindings();
void dispatch_key_binding();
void handle_object_drop_target();
void release_container_reference();
void free_open_container_chain();
void close_backpack_container();
void leave_nested_container_level();
void refresh_container_view();
void repopulate_container_grid_slots();
void open_backpack_container();
undefined4 auto_place_in_container();
bool place_object_in_equipment_slot();
void sum_container_weight();
void build_player_save_record();
bool write_player_save_record();
void serialize_inventory_link_chain();
void encode_equipped_item_index();
void *alloc_save_record_slot();
void *save_record_slot_from_index();
void decode_equipped_item_index();
void deserialize_inventory_link_chain();
void free_player_inventory_chain();
void restore_player_save_record();
undefined4 load_player_save_record();
undefined4 place_rune_in_bag();
void clear_rune_bag_contents();
void draw_rune_icon();
void redraw_rune_bag_display();
void reset_ready_rune_slots();
void handle_rune_bag_click();
void print_not_a_spell_message();
void handle_light_source_click();
void handle_cast_spell_click();
undefined4 report_spell_cast_failure();
undefined4 cast_spell_from_rune_combo();
void redraw_backpack_slot_widget();
void *get_equipped_item_at_slot();
undefined4 place_object_in_backpack_slot();
int find_or_assign_object_widget();
ushort *find_equipped_item_by_category();
char *find_object_in_link_chain();
ushort *resolve_clicked_inventory_item();
ushort *get_equipped_item_at_widget_slot();
void deplete_object_count();
void decrement_object_count();
undefined4 reduce_object_count();
ushort *extract_clicked_backpack_item();
ushort *extract_ammo_and_refresh();
ushort *extract_and_refresh_slot_item();
ushort *extract_matching_object_from_slot();
undefined4 is_valid_equipment_slot_item();
undefined4 damage_equipped_item_in_slot();
uint calculate_object_weight();
bool check_object_carry_weight();
void reload_paperdoll_body_sprite();
void init_inventory_panel_hotspots();
void reset_equipment_and_container_state();
void handle_inventory_panel_click();
void attach_picked_up_object_to_cursor();
undefined4 load_armor_overlay_frame();
void redraw_armor_overlay_widgets();
void redraw_inventory_widget();
void swap_cursor_and_slot_item();
undefined1 *prompt_split_object_stack();
uint check_object_fits_in_slot();
void handle_backpack_slot_click();
undefined4 place_held_item_in_empty_slot();
undefined4 objects_can_stack();
undefined4 handle_backpack_slot_interact();
void redraw_container_icon_slot();
void redraw_inventory_widget_range();
bool update_carry_weight_display();
int hit_test_inventory_widget();
void dispatch_object_action_dup();
undefined4 append_object_property_tag();
undefined4 append_object_special_name();
void read_object_text();
void look_at_inscribed_object();
void describe_object_owner();
void print_object_flavor_text();
void build_creature_look_text();
void describe_special_object_property();
undefined4 identify_mushroom_type();
void main_loop_hud_flush();
void dispatch_sticky_mode_handlers();
void set_pending_update_flags();
undefined4 acquire_sound_resource_slot();
void release_sound_resource_slot();
undefined4 alloc_flip_grtile_slot();
void *resolve_flip_grtile_slot();
void release_grtile_handle();
undefined4 init_level_object_arena();
void free_level_tile_arena();
int load_level_object_table();
int write_level_tilemap_to_archive();
void heading_to_sine_cosine();
uint pack_angle_byte();
void angle_to_screen_delta();
int lookup_arctan_primary_range();
int lookup_arctan_reciprocal_range();
int compute_angle_from_slope();
void load_light_food_effect_tables();
bool compute_drop_aim_from_cursor();
void fire_ranged_weapon();
void spawn_npc_thrown_weapon();
bool spawn_object_near_actor();
undefined4 drop_held_object_near_player();
void spawn_trap_hazard_object();
ushort *spawn_object_near_player();
undefined4 check_object_drop_height();
undefined4 init_sound_channel_slot();
void release_sound_channel_slot();
undefined4 load_and_resample_wave_sample();
undefined4 load_and_resample_wave_file();
undefined1 *construct_and_load_mod_player();
undefined4 destroy_mod_player();
void reset_mod_player_state();
undefined4 start_mod_player_playback();
undefined4 stop_mod_player_playback();
bool queue_mod_audio_buffer();
void process_mod_tracker_row();
undefined4 mix_mod_channels_to_buffer();
void apply_mod_tracker_tick_effects();
void mod_player_wave_out_callback();
void adjust_mod_channel_volume();
void apply_mod_tone_portamento();
void apply_mod_vibrato_effect();
void apply_mod_tremolo_effect();
void build_mod_volume_sample_table();
int read_mod_word_length_field();
bool arm_sfx_trigger_slot();
undefined4 start_sfx_trigger_slot();
undefined4 stop_sfx_trigger_slot();
void register_sound_channel_pool_cleanup();
void init_all_sound_channel_slots();
void release_all_sound_channel_slots();
undefined1 is_sfx_trigger_slot_active();
void resize_mod_event_row_array();
void resize_mod_pattern_row_array();
void init_mod_dynamic_array();
void resize_mod_int_array();
void destroy_mod_dynamic_array();
undefined1 *reset_mod_dynamic_array_and_maybe_free();
void serialize_mod_int_array();
void init_mod_pattern_array();
void resize_mod_pattern_array();
void destroy_mod_pattern_array();
void serialize_mod_pattern_array();
void init_mod_instrument_array();
void resize_mod_instrument_array();
void destroy_mod_instrument_array();
void serialize_mod_instrument_array();
void init_mod_channel_state_array();
void resize_mod_channel_state_array();
void destroy_mod_channel_state_array();
void serialize_mod_channel_state_array();
undefined4 destroy_mod_dynamic_array_and_maybe_free();
undefined4 destroy_mod_pattern_array_and_maybe_free();
undefined4 destroy_mod_instrument_array_and_maybe_free();
undefined4 destroy_mod_channel_state_array_and_maybe_free();
void construct_mod_event_array_range();
void destroy_mod_row_array_range();
void destroy_mod_row_array_elem();
void serialize_mod_event_row_array();
undefined4 destroy_mod_row_array_elem_and_maybe_free();
void write_mod_event_array();
void construct_mod_row_array_range();
void construct_mod_int_array_range();
void destroy_mod_pattern_array_range();
void destroy_mod_pattern_array_elem();
void serialize_mod_pattern_row_array();
undefined4 destroy_mod_pattern_array_elem_and_maybe_free();
void write_mod_pattern_row_array();
void construct_mod_pattern_array_range();
void write_mod_pattern_array();
void destroy_mod_instrument_array_range();
void construct_mod_instrument_array_range();
void write_mod_instrument_array();
void construct_mod_channel_state_array_range();
void construct_mod_row_array_elem();
void construct_mod_pattern_array_elem();
uint collision_sample_floor_height();
int compute_floor_height_at_position();
bool collision_classify_corner_wall();
bool collision_corner_flags();
void collision_build_height_field();
void resolve_wall_slide_corner();
void collision_add_candidate_object();
void collision_height_envelope();
void swap_collision_candidates();
void sort_collision_candidates();
undefined4 check_object_placement_clearance();
undefined4 place_object_in_world();
undefined4 drop_object_near_target();
undefined4 find_object_placement();
undefined4 load_object_catalog_data();
void *get_scanned_object_class_effect_ptr();
void reset_level_object_arena();
undefined4 walk_object_tree();
undefined4 object_exceeds_size_threshold();
undefined4 roll_object_destroy_chance();
undefined4 should_destroy_linked_object();
void despawn_objects_outside_radius();
void *alloc_object_slot();
void free_object_slot();
void object_list_insert_head();
void object_list_append_tail();
void object_list_unlink();
ushort *discard_misplaced_object();
void free_linked_object_recursive();
void unlink_and_free_object();
void *resolve_object_link();
int encode_object_slot_index();
void *get_object_record_by_slot_index();
ushort *find_object_by_encoded_slot_in_chain();
undefined4 object_ptr_in_arena();
void active_mobile_list_add();
void active_mobile_list_remove();
ushort *find_object_in_chain();
undefined4 object_or_contents_has_type();
ushort *find_object_in_world();
undefined4 cycle_active_light_source();
void update_player_tick_effects();
undefined4 decay_equipped_light_sources();
void apply_drowning_hazard();
undefined4 add_active_light_source();
undefined4 apply_object_collision_scatter(ushort *param_1, ushort *param_2);
void apply_trap_type_damage_effect();
undefined4 resolve_collision_candidate_interaction();
void build_object_placement_snapshot(); // was FUN_00054a00
undefined4 sync_object_tile_position(); // was FUN_00054f6c
ushort *reallocate_object_to_arena();
void compute_object_placement_fields();
ushort *settle_mobile_to_immobile(); // was FUN_0005596c
void randomize_settled_snapshot_position();
ushort *settle_dropped_object();
void run_pause_menu_modal_loop();
void redraw_pause_menu_icon();
void redraw_pause_submenu_icon();
void update_pause_submenu_highlight();
void close_ui_panel_return_to_game();
void draw_pause_menu_main_list();
void draw_save_load_slot_list();
void draw_quit_confirm_panel();
void draw_music_or_sound_toggle_panel();
void draw_detail_level_panel();
void handle_music_toggle_click();
void handle_sound_toggle_click();
void handle_detail_level_click();
void handle_pause_menu_main_list_click();
void handle_save_load_slot_click();
void handle_quit_confirm_click();
void enter_pause_menu_state();
void dispatch_pause_menu_click();
void handle_pause_menu_region_click();
void handle_pause_menu_dpad_navigation();
void open_pause_menu_via_hotkey();
undefined4 init_cursor_subsystem();
int erase_cursor_icon();
undefined4 cursor_show_idle_tick();
void decrement_cursor_hide_depth();
void set_tracked_hotspot_rect();
undefined4 is_mouse_within_tracked_hotspot();
void track_hotspot_hover_state();
void redraw_hotspot_border_cursor();
void get_mouse_position();
void get_click_position();
void reset_keyboard_char_input();
void noop_post_input_reset_hook();
void warp_mouse_cursor();
int poll_keyboard_char_input();
void wait_for_click_release();
int wait_for_key_or_mouse_move();
void set_cursor_confine_rect();
void reset_cursor_confine_rect();
int poll_mouse_event();
undefined4 get_alternate_keyboard_scan_code();
uint process_pending_keyboard_scan_code();
uint poll_input_event();
undefined4 next_input_event();
undefined4 peek_input_event();
int lookup_onscreen_keyboard_key_hit();
int register_cursor_hotspot();
void unregister_cursor_hotspot();
void push_cursor_icon();
void pop_cursor_icon();
undefined4 is_position_within_rect();
void set_cursor_sprite_id();
void update_hotspot_cursor_icon();
void update_mouse_state();
void handle_mouse_button_message();
void save_cursor_background();
void draw_idle_mouse_cursor();
void noop_key_handler();
uint poll_mouse_button_flags();
void movement_collision_sweep();
void sweep_init_position();
void reticle_object_pick();
undefined4 movement_sweep_setup();
void sweep_restart_remaining();
void sweep_kill_velocity();
void sweep_writeback_position();
int sweep_integrate_substep();
undefined4 sweep_deflect_heading();
void sweep_slide_along_wall();
void sweep_apply_knockback();
void sweep_land_on_surface();
undefined4 sweep_step_vertical();
undefined4 sweep_step();
uint collision_flags_to_locomotion_code();
uint sweep_collision_flags();
void sweep_apply_collision();
void *find_nearby_door_in_candidates();
void *get_first_nearby_candidate_object();
undefined4 reset_texture_id_lists();
bool load_level_texture_ids();
undefined4 write_level_quest_flags_to_archive();
void load_dungeon_texture_arenas();
void load_texture_arena();
void load_terrain_texture_props();
void configure_dungeon_viewport();
void init_dungeon_rendering();
void draw_command_list_rewind();
void free_frame_geometry_buffers();
void render_dungeon_view_frame();
void full_dungeon_redraw();
void automap_reveal_all_tiles(void);
byte automap_reveal_byte(byte *tile_rec);
void render_dungeon_frame_timed();
undefined4 build_frame_draw_list();
void build_visibility_light_grid();
void seed_visibility_queue();
void visibility_ray_step_forward();
void visibility_ray_step_backward();
undefined4 compute_visibility_ray_offset();
undefined4 extend_visibility_ray_row();
void advance_visibility_ray();
void merge_adjacent_visibility_rays();
void run_visibility_flood();
void rebuild_dungeon_view();
void dungeon_view_prepass_stub();
void configure_texture_detail_functions();
void emit_hud_draw_commands();
void walk_visible_tiles();
void emit_flat_wall_texture_select();
void emit_flat_floor_texture_select();
void emit_flat_diagonal_texture_select();
void emit_floor_texture_select();
void emit_diagonal_wall_texture_select();
void process_visible_tile_cell();
void emit_tile_objects();
void emit_object_billboard();
void emit_catalog_object();
void emit_anim_object_frames();
void update_wall_partition_phase();
void sort_feature_pairs_by_depth();
void init_feature_sort_order();
void sprite_partition_step();
void sprite_partition_tmap();
void sprite_partition_by_depth();
void resolve_billboard_corner_offset();
void compute_feature_depth_key();
void flush_pending_tile_features();
void emit_tile_features();
void write_player_status_block();
void read_player_status_block();
void reset_player_derived_state();
void load_floor_texture_arenas();
void update_screen_flicker_effect();
undefined4 apply_equipped_item_effect();
void compute_light_source_colors();
void update_level7_floor_hazard_state();
void apply_equipment_effect_penalties();
int compute_object_weight();
void refresh_player_equipment_effects();
void close_panels_before_level_change();
void reset_player_object_record();
void init_gameplay_session();
void register_game_view_interact_zones();
void unregister_game_view_interact_zones();
void print_player_position_debug();
void print_help_message();
void set_custom_view_target();
void move_custom_view_target();
void set_view_subject_by_command();
void enter_free_camera_mode();
void restore_view_from_object_record();
void spin_view_full_rotation();
void *tilemap_lookup();
void *spawn_new_object();
void handle_game_view_click_hold();
void move_command_dispatch();
void decode_movement_command();
void uw_set_analog_move_turn(int fwd_held, int turn_dir);
void move_key_directional_step();
void movement_pacing_handler();
void movement_tick();
void settle_movement_to_rest();
void apply_movement_tick();
void trigger_view_transition();
void set_movement_animation_timer();
void update_current_view_from_subject();
void sync_camera_from_player();
undefined4 roll_skill_check();
void grant_experience_points();
void refresh_experience_display();
bool step_value_toward_limit();
void project_position_by_heading();
void busy_wait_ms();
int roll_dice_sum();
bool populate_menu_button_bitmap_entry();
void animate_title_palette_cycle();
void update_journey_onward_availability();
void draw_menu_item_list();
int poll_menu_pointer_selection();
int menu_button_list_navigate();
undefined4 journey_onward_load_slot_menu();
undefined2 codewheel_letter_at_index();
int codewheel_index_of_letter();
undefined4 validate_codewheel_word();
undefined4 check_registration_key_saved();
void save_registration_key_validated();
void set_power_status_flag_bit();
void clear_power_status_flag_bit();
undefined4 check_registration_key_dialog();
undefined4 registration_key_dialog_proc();
undefined4 is_product_registered();
undefined4 check_save_disk_space();
int load_level();
undefined4 commit_level_to_save_slot();
void probe_save_slots();
void handle_save_load_menu_action();
undefined4 load_game_from_slot();
undefined4 save_game_to_slot();
undefined4 ensure_save_directory_exists();
undefined4 copy_save_slot_files();
int transition_to_level();
void save_or_restore_level_special_state();
undefined4 blit_fullscreen_bitmap_file();
void hud_vitals_threshold_shake();
void snap_compass_to_heading();
void reset_hud_panel_animation_state();
void redraw_hud_panels();
void release_panel_wipe_grtiles();
void set_hud_status_value();
void hud_panel_redraw_dispatch();
void hud_vitals_bar_tick();
void hud_dragon_reaction_tick();
void hud_compass_needle_tick();
void update_hud_status_icon_frame();
void tick_hud_panel_transition();
void hud_panel_wipe_transition_tick();
void request_weapon_swing_graphic();
byte load_weapon_swing_sprites();
void randomize_weapon_jump_shake();
void advance_action_animation_frame();
bool load_weapon_combat_maneuver_data();
void update_ready_rune_slot_icons();
void update_light_source_color_icons();
void begin_hud_panel_flip();
void redraw_active_hud_panel();
void release_hud_panel_flip_grtiles();
bool advance_hud_panel_flip();
void squash_hud_panel_flip_rows();
void copy_hud_panel_flip_column();
void weapon_swing_draw_tick();
void weapon_overlay_and_full_redraw();
void trigger_terrain_discovery_illustration();
void trigger_inscription_illustration();
void load_shading_level_config();
void load_light_tables();
void toggle_light_table_flicker();
undefined4 recompute_level7_hazard_from_character_level();
void advance_character_level();
undefined4 classify_skill_training_tier();
void advance_skill_training();
undefined4 roll_skill_use_improvement();
void print_single_skill_improvement_message();
void print_skill_improvement_list();
void handle_mantra_chant();
void render_endgame_character_stats();
undefined4 trigger_random_level_special_event();
void apply_rest_status_effects();
void handle_rest_action();
undefined4 adjust_player_hunger();
void handle_game_victory_sequence();
undefined4 spawn_scheduled_door_texture_object();
bool check_scheduled_object_level_match();
void check_scheduled_object_location_callback();
void apply_special_object_use_effect();
void handle_starvation_penalty();
undefined4 roll_container_lockpick_check();
undefined4 roll_container_trap_disarm_check();
undefined4 play_music_track();
void resume_music_playback();
undefined1 get_current_music_track();
undefined4 is_music_playing();
undefined4 is_sound_effects_enabled();
void set_music_enabled();
void set_sound_effects_enabled();
void stop_current_audio_handle();
undefined4 play_positional_sound_effect();
undefined4 play_sound_effect_with_pan();
undefined4 play_sound_effect_at_object();
void stop_movement_sound_handle();
void stop_current_audio_handle_dup();
uint allocate_and_play_sound_channel();
void trigger_sound_sample_note();
void play_musical_instrument();
undefined4 check_secret_tune_match();
void shutdown_sound_effects();
void shutdown_music_module();
void set_pending_music_track();
void pick_random_pending_music_track();
void advance_menu_music_track();
void update_ingame_music_track();
bool advance_menu_music_track_elapsed();
undefined4 get_audio_subsystem_flag();
undefined4 audio_always_true_stub();
undefined4 play_numbered_voice_sample();
void voice_sample_cluster_stub_1();
bool is_voice_sample_finished();
void stop_voice_sample();
void voice_sample_cluster_stub_2();
byte tile_is_no_magic();
void dispatch_tile_special_action();
undefined4 dispatch_special_action();
void adjust_level7_hazard_value();
void adjust_player_hp();
void restore_stat_capped();
void apply_healing_item_effect();
void reduce_item_quality_on_use();
void apply_targeted_spell_effect();
void *spawn_and_prime_spell_effect_object();
undefined4 force_unlock_target_object();
undefined4 cast_single_tile_spell_effect();
undefined4 cast_area_spell_effect();
bool trigger_type_flagged_trap_effect();
undefined4 trigger_tile_damage_trap_effect();
undefined4 morph_tile_object_state();
undefined4 trigger_permanent_object_state_effect();
void apply_tile_morph_variant_2();
void apply_tile_morph_variant_6();
void apply_tile_morph_variant_7();
void scan_area_for_matching_objects();
void scan_area_ahead_of_object();
void for_each_object_of_type();
void cast_cone_damage_spell();
void cast_targeted_search_effect();
void cast_summon_or_spawn_effect();
undefined4 spawn_random_variant_object_at_tile();
void report_detected_creatures_in_direction();
void cast_detect_life_spell();
void complete_pending_player_command_target();
void dispatch_player_command();
void damage_all_objects_at_tile();
undefined4 init_sprite_list_buffers();
void sprite_list_queue_slot_redraw();
int sprite_list_alloc_entry();
int sprite_list_alloc_raw_entry();
undefined4 sprite_list_set_rect();
undefined4 sprite_list_set_position();
undefined4 sprite_list_set_frame_id();
undefined4 sprite_list_set_frame_id_transparent();
undefined4 clear_sprite_list_slot_flag();
void flush_sprite_list_compositor();
undefined4 sprite_list_set_lifetime();
void init_grtile_registry();
undefined4 grtile_alloc_registered();
undefined4 invalidate_grtile_by_key();
undefined4 capture_framebuffer_rect_to_grtile();
undefined4 restore_captured_grtile_backdrop();
void spawn_message_dispatch_thread();
undefined4 create_main_window_and_init_display();
undefined4 window_message_noop_handler();
void store_window_extra_data_ptr();
void dispatch_window_message();
undefined4 blit_framebuffer_to_gx_display();
undefined4 shutdown_game_resources();
undefined4 handle_keyboard_message();
undefined4 handle_mouse_message();
void draw_stats_panel_header();
void draw_stats_panel_attribute_row();
void draw_hp_stat_display();
void draw_mana_stat_display();
void draw_experience_points_display();
void draw_stats_panel_skill_row();
void draw_stats_panel_content();
void handle_stats_panel_skill_scroll_click();
void refresh_stats_panel_if_active();
undefined4 init_string_resource_cache();
void close_strings_pak_file_thunk();
char *get_message_string();
int register_interned_string();
uint overwrite_interned_string();
void reset_string_resource_page();
undefined4 build_object_display_name();
undefined1 *format_object_display_name();
void print_scroll_message_by_id();
void print_scroll_message_concat();
undefined4 open_strings_pak_file();
void close_strings_pak_file();
undefined1 *decode_strings_pak_entry();
undefined1 walk_strings_pak_huffman_tree();
int read_strings_pak_bit();
undefined4 empty_container_into_world();
void drop_creature_inventory_on_death();
void spawn_creature_treasure_drop();
void spawn_creature_special_item_drop();
void spawn_creature_equipment_drop();
void spawn_creature_misc_item_drop();
void spawn_creature_death_loot();
ushort *use_object_on_target();
bool finish_object_use();
short *begin_holding_object_on_cursor();
void complete_use_reagent_on_player();
void complete_use_item_on_player(ushort *param_1, int param_2);
void arm_use_item_on_player_prompt();
void prompt_use_item_on_target(ushort *param_1, code *param_2);
void complete_use_item_on_special_target();
void arm_use_item_on_special_target_prompt();
void complete_use_item_on_quest_target();
void complete_use_item_on_container();
void complete_use_item_skill_check();
void arm_use_item_on_target_prompt();
undefined4 apply_random_roll_to_matched_object();
void complete_use_item_special_quest_event();
void complete_use_item_on_flagged_tile();
void dispatch_use_held_item_by_type();
void use_light_source();
void refuel_light_source_item();
undefined4 use_food_item();
void complete_use_item_scatter_spawn();
void complete_use_item_fill_flask();
void dispatch_use_special_item_by_type();
void use_readable_item();
void dispatch_world_object_interaction_by_family();
undefined4 check_object_combination();
undefined4 trigger_object_use_babl_script();
void trigger_object_trap_or_use_action();
void schedule_door_open_animation();
void adjust_door_close_animation_delay();
void try_empty_container();
void try_combine_or_stow_object();
void complete_cast_spell_on_target();
undefined4 resolve_object_variant_or_special_link();
void clear_object_pending_special_flag();
void consume_linked_special_object_charge();
uint resolve_skill_gated_unlock_or_use();
undefined4 apply_trap_or_link_effect();
int dispatch_trap_type_effect();
void purge_tagged_objects_from_chain();
void refresh_object_link_chain();
undefined4 reset_object_ui_state_callback();
undefined4 dispatch_quest_event_code();
undefined4 create_scripted_trap_pair_at_tile();
void remove_trap_chain_marker();
void free_trap_class_object();
undefined4 check_object_area_for_spawn_block();
undefined4 is_out_of_player_range();
void process_nearby_background_traps();
void tick_ambient_doors_and_scheduler();
void capture_framebuffer_rect_to_grtile_paletted();
void reinstall_active_palette();
void plot_pixel();
void debug_print_init();
void debug_print(char *param_1, ...);
void start_ambient_sound_effect();
void stop_ambient_sound_effect();
void init_ambient_sound_timing();
void clear_ambient_sound_target();
undefined4 debug_noop_checkpoint();
char compute_compass_direction();
void print_message_with_proximity_qualifier();
undefined4 debug_noop_overflow_hook();
bool write_buffer_to_file();
bool read_buffer_from_file();
short read_xor_scrambled_block();
int write_xor_scrambled_block();
void init_msg_scroll_panel();
void check_mouse_over_msg_scroll_panel();
void select_msg_scroll_mode_normal();
void select_msg_scroll_mode_conversation();
void select_msg_scroll_mode_2();
void wait_for_click_to_continue();
undefined4 msg_scroll_draw_edges();
undefined4 draw_conversation_window_decoration();
void msg_scroll_scroll_up_line();
void msg_scroll_more_prompt();
int message_scroll_print_wrapped();
void msg_scroll_split_escape_segments();
void msg_scroll_split_newline_segments();
void msg_scroll_draw_wrapped_span();
void msg_scroll_wrap_split_line();
void msg_scroll_panel_init();
void msg_scroll_panel_reset();
void echo_number_to_scroll();
void echo_yes_no_to_scroll();
undefined4 scroll_text_entry_prompt();
undefined4 prompt_yes_no_scroll();
void scheduler_despawn_entry();
void scheduler_remove_entry();
void scheduler_finish_entry();
void scheduler_relink_entry();
uint scheduler_add_entry();
void scheduler_step_entry();
void scheduler_tick();
void spawn_effect_debris_burst();
undefined4 activate_area_hazard_object();
undefined4 spawn_scheduled_effect_object();
int scheduler_find_entry();
int scheduler_get_delay();
void scheduler_set_delay();
undefined4 scheduler_advance_effect();
undefined4 scheduler_load();
undefined4 scheduler_save();
void entry(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4);
void run_static_initializers();
void call_function_pointer_range();
void terminate_process();
undefined4 register_atexit_handler();
undefined4 register_default_atexit_handler();


/* --- auto-generated overlap/exref aliases --- */
/* _DAT_00085bf0 dropped from here: superseded by the real, hand-traced
   definition near the inventory.c extern block above (this
   auto-generated one referenced a bare DAT_00085bf0 that was never a
   real declared symbol -- the actual storage is g_inventory_hotspot_
   table[288], see there). Conflicting with it broke the build the
   moment inventory.c actually needed this symbol. */
#define _DAT_00086999 (*(unsigned short*)&DAT_00086999)
#define _DAT_0008699b (*(unsigned short*)&DAT_0008699b)
#define _DAT_0008699f (*(unsigned short*)&DAT_0008699f)
#define _DAT_000869a1 (*(unsigned short*)&DAT_000869a1)
#define _DAT_00202bfb (*(unsigned short*)(DAT_00202bf8_backing + 0x03))
#define _DAT_00202c00 (*(unsigned short*)(DAT_00202bf8_backing + 0x08))
#define _DAT_00202c05 (*(unsigned short*)(DAT_00202bf8_backing + 0x0d))
/* The travel-direction stash the movement sweep compares against
   DAT_00201c78: apply_heading_turn writes it as two bytes (DAT_002048a1
   low, DAT_002048a2 high) of that 16-bit angle, so read it back as a
   signed 16-bit -- not a 32-bit word that also pulls in DAT_002048a3/a4
   (junk here) and, with the sign mismatch vs the short DAT_00201c78, made
   the "!=" test fire every frame. That spurious mismatch ran the
   auto-straighten branch on sidestep release and nudged the facing by
   +/-0x400 (the "tiny rotation on strafe release"). */
#define _DAT_002048a1 (*(short*)&DAT_002048a1)
#define _DAT_002048a9 (*(uint*)&DAT_002048a9)
#define _DAT_00204980 (*(uint*)&DAT_00204980)
#define _DAT_0023ce10 (*(uint*)&DAT_0023ce10)
#define ordint_divmod_exref ((void*)&ordint_divmod)

/* Globals defined in uw.c but also used by functions that now live in
   game.c (animate_title_palette_cycle's 14ms throttle timestamp). */

/* Globals defined in uw.c but also used by functions that now live in
   saveload.c (ensure_save_directory_exists's "\*.*" scan wildcard). */

/* Globals defined in uw.c but also used by functions that now live in
   registration.c. */

/* Declarations for the functions that used to live directly in this file
 * but were split out into their own topic .c files this session -- moved
 * to matching headers/*.h so those files (and anything else that only
 * needs one topic's functions) can include just what they need. Included
 * here too so anything that already includes uw.h keeps working
 * unchanged. Safe against the circular #include "uw.h" each of these
 * does themselves, since UW_H is already defined by this point. */
#include "graphics.h"
#include "babl.h"
#include "automap.h"
#include "inventory.h"
#include "combat.h"
#include "bitmap.h"
#include "3d.h"
#include "player.h"
#include "tmap.h"
#include "objects.h"
#include "hud.h"
#include "ai.h"
#include "containers.h"
#include "interact.h"
#include "resources.h"
#include "item_use.h"
#include "movement.h"
#include "visibility.h"
#include "saveload.h"
#include "text.h"
#include "collision.h"
#include "input.h"
#include "object_actions.h"
#include "weapon_swing.h"
#include "level.h"
#include "doors.h"
#include "winfile_wrappers.h"
#include "models.h"
#include "math.h"
#include "game.h"
#include "chargen.h"

/* .E model-parser globals (g_model_known_ext_colors/g_model_parse_point_count/
   g_model_parse_part_count and ~190 bare-literal-address DAT_xxx/string
   constants) -- un-staticed and declared here so parse_e_model_file and
   uw_e_model_strip_cr can be extracted into src/models.c. */

#endif /* UW_H */
