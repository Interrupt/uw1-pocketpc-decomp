#ifndef UW_H
#define UW_H

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <stdlib.h>
#include "src/headers/ghidra_intrinsics.h"
#include "src/headers/ordinal_stubs.h"
#include "src/headers/gx_stub.h"
#include "src/headers/file_io.h"

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

/* Forward declaration needed because FUN_00041708 (much earlier in uw.c)
   calls this before its own definition later in the file -- see its
   definition, right after grtile_alloc_registered, for why it exists. */
void *uw_alloc_grtile();

/* Forward declaration needed because main_menu_loop (now in game.c) takes
   this LAB_ callback's address to pass to load_gr_resource_entries; its own
   definition stays in uw.c (see LAB_000415b0/LAB_000416e8's matching
   comment for what this callback family does). */
void *LAB_0006a0ac();

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
    unsigned char _unk00;        /* offset 0x00: a numeric stat (fed into Ordinal_2005/roll-style calls in several places) -- not yet confirmed */
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
extern undefined2 DAT_000891b0_backing[76800];
#define DAT_000891b0 DAT_000891b0_backing[0]
extern int g_ambient_bias_reduction;
/* Globals defined in uw.c but also used by functions that now live in
   graphics.c (expand_pals_bytes, build_rgb565_palette,
   palette_cycle_range) -- extern'd here so both translation units see
   the same storage. */
extern int DAT_0024af70;
extern undefined1 DAT_00084a40_backing[32768];
#define DAT_00084a40 DAT_00084a40_backing[0]
extern undefined2 DAT_00242010_backing[32768];
#define DAT_00242010 DAT_00242010_backing[0]
extern undefined2 DAT_00248418_backing[20 * 256];
#define DAT_00248418 DAT_00248418_backing[0]
extern undefined1 DAT_001005cc;
extern undefined1 DAT_001005cd;
extern undefined1 DAT_001005ce;
/* Globals defined in uw.c but also used by functions that now live in
   automap.c (pick_closer_note_label, handle_automap_note_click,
   draw_automap_notes, save_automap_notes_to_archive,
   load_automap_notes_from_archive, switch_automap_level_display) --
   extern'd here so both translation units see the same storage. */
extern short DAT_000bbef0;
extern undefined2 DAT_000b99c8;
extern undefined1 DAT_000ba9d8_backing[32768];
#define DAT_000ba9d8 DAT_000ba9d8_backing[0]
extern undefined1 DAT_000baa0a;
extern undefined1 DAT_000baa0b;
extern undefined1 DAT_000baa0c;
extern undefined1 DAT_000baa0d;
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
extern undefined2 DAT_00201b6c;
extern int DAT_00201c98;
extern char *DAT_0023bf6c;
extern char *DAT_0023bf70;
extern char *g_weapon_swing_current_frame;
extern char *g_weapon_swing_startup_scratch_buffer;
extern ushort DAT_0023c448;
extern char *DAT_0023c44c;
extern undefined4 DAT_0023c540;
extern undefined2 DAT_0023c59e;
extern undefined2 DAT_0023c5a0;
extern int DAT_0023c5b0;
extern undefined4 DAT_0023c648;
extern void *DAT_0023c7a0_arr[0x140];
#define DAT_0023c7a0 DAT_0023c7a0_arr[0]
extern char *DAT_0023cca0;
extern char *DAT_0023cca4;
extern undefined1 DAT_0023cca8_backing[32768];
#define DAT_0023cca8 DAT_0023cca8_backing[0]
extern char *DAT_0023cef0;
extern char *DAT_00248410;
extern char *DAT_0024ad58;
extern int DAT_0024af60;
extern short DAT_0024af6c;
extern int g_text_use_palette_color;
extern byte *DAT_0024af78;
extern byte *DAT_0024af7c;
extern char s__DATA_CREDIT1_BYT_00086ed0[];
extern char s__DATA_CREDIT2_BYT_00086ebc[];
extern char s__DATA_CREDIT3_BYT_00086ea8[];
extern char s__DATA_lev_ark_00085734[];
extern char s__DATA_opscr_byt_00086eec[];
extern char s__SAVE0_lev_ark_000842fc[];
extern char s_FONT5X6P_SYS_00084e9c[];
extern char s_FONTBIG_SYS_00085454[];
extern char s_opbtn_00086ee4[];
extern unsigned short u_Ultima_Under_World_00087690[];
extern unsigned short u_UltimaUW_00087678[];
/* Globals defined in uw.c but also used by functions that now live in
   saveload.c (open_level_archive, close_level_archive,
   write_archive_entry, read_archive_entry) -- extern'd here so both
   translation units see the same storage. */
extern char s__arc_tmp_000842b4[];
extern undefined DAT_000b78b8_backing[8192];
#define DAT_000b78b8 DAT_000b78b8_backing[0]
extern undefined1 DAT_000b98b8_backing[32768];
#define DAT_000b98b8 DAT_000b98b8_backing[0]
extern undefined1 DAT_000b98b9_backing[32768];
#define DAT_000b98b9 DAT_000b98b9_backing[0]
extern undefined1 DAT_000b58b8_backing[16384];
#define DAT_000b58b8 DAT_000b58b8_backing[0]
/* Globals defined in uw.c but also used by functions that now live in
   chargen.c (character_generator_start, run_character_generator,
   character_generator_loop) -- extern'd here so both translation units
   see the same storage. */
extern char *DAT_00086df8;
extern char *DAT_000fb858;
extern undefined1 DAT_000fb860_backing[256];
#define DAT_000fb860 DAT_000fb860_backing[0]
/* chrbtns.gr cumulative per-entry offset table (built by LAB_000255d0).
   DAT_000fb8c4 is an alias into it starting at element 17 -- the same
   relationship DAT_000fb884 (element 1) has, matching the 0xfb8c4 vs
   0xfb880 symbol addresses (0x44 = 17*4). Elements 17..26 are the
   full-body figure offsets read by character_generator_loop case 4. */
extern undefined4 DAT_000fb880_backing[4096];
#define DAT_000fb8c4 (((undefined1 *)DAT_000fb880_backing)[0x44])
extern undefined1 DAT_000fb8f0_backing[1680];
#define DAT_000fb8f0 DAT_000fb8f0_backing[0]
extern char *DAT_001005c4;
extern char *DAT_001005c8;
extern char *g_chargen_textfield_buf;
/* LAB_000255b4/LAB_000255d0: orphaned callbacks Ghidra never recognized
   as real functions (only reached indirectly, via addresses passed to
   load_gr_resource_entries) -- their definitions stay in uw.c (see their own comment
   there for the full recovery story), forward-declared here because
   run_character_generator (chargen.c) takes their addresses. */
char *LAB_000255b4();
undefined4 LAB_000255d0();
extern short DAT_001005c0;
extern char s__DATA_CHARGEN_BYT_00084eac[];
extern char s_FONTCHAR_SYS_00084ec0[];
extern char s__DATA_chrgen_dat_00084ed0[];
extern char s__DATA_skills_dat_00084ee4[];
extern char s_chrbtns_00084ef8[];
/* Globals defined in uw.c but also used by functions that now live in
   babl.c (the conversation/dialogue scripting VM) -- extern'd here so
   both translation units see the same storage. */
extern char DAT_000845a8[];
extern char DAT_00085240_backing[8192];
#define DAT_00085240 DAT_00085240_backing[0]
extern char DAT_00085244_backing[32768];
#define DAT_00085244 DAT_00085244_backing[0]
extern char DAT_00085248_backing[32768];
#define DAT_00085248 DAT_00085248_backing[0]
extern undefined4 DAT_00085c54;
extern intptr_t DAT_000bbf00;
extern intptr_t DAT_000bbf0c;
extern int DAT_000bbf10;
extern intptr_t DAT_000bbf14;
extern char * DAT_000bbf18;
extern short DAT_000bbf1c;
extern short DAT_000bbf24;
extern short DAT_000bbf2c;
extern intptr_t DAT_000bbf70;
extern short DAT_000bbf74;
extern short DAT_000bbf78;
extern short DAT_000bbf7c;
extern char * DAT_000bbf80;
extern short DAT_000bbf84;
extern undefined2 DAT_000bbf8c;
extern undefined4 DAT_000bbf98;
extern undefined2 DAT_000bbfa8_backing[8192];
#define DAT_000bbfa8 DAT_000bbfa8_backing[0]
extern undefined2 DAT_000bbfb0_backing[8192];
#define DAT_000bbfb0 DAT_000bbfb0_backing[0]
extern undefined2 DAT_000bbfb8;
extern undefined2 DAT_000bbfbc;
extern undefined2 DAT_000bbfc0_backing[8192];
#define DAT_000bbfc0 DAT_000bbfc0_backing[0]
extern undefined2 DAT_000bbfc8_backing[8192];
#define DAT_000bbfc8 DAT_000bbfc8_backing[0]
extern undefined2 DAT_000bbfd0;
extern undefined2 DAT_000bbfe8;
extern undefined4 DAT_000bbff0;
extern char * DAT_000bc000;
extern short DAT_000bc004;
extern undefined1 DAT_000bc008;
extern char * DAT_000bc020;
extern short DAT_000bc024;
extern char * DAT_00100670;
extern ushort * DAT_00100674;
extern undefined1 DAT_00100678;
extern undefined1 DAT_00100680_backing[65536];
#define DAT_00100680 DAT_00100680_backing[0]
extern undefined1 DAT_001006d8_backing[65536];
#define DAT_001006d8 DAT_001006d8_backing[0]
extern char * DAT_00100728_backing[256];
#define DAT_00100728 DAT_00100728_backing[0]
#define DAT_0010072c DAT_00100728_backing[1]
#define DAT_00100730 DAT_00100728_backing[2]
#define DAT_00100734 DAT_00100728_backing[3]
#define DAT_00100738 DAT_00100728_backing[4]
#define DAT_0010073c DAT_00100728_backing[5]
extern short DAT_00100770_backing[32768];
#define DAT_00100770 DAT_00100770_backing[0]
extern char * DAT_00100784;
extern short DAT_00100788;
extern short DAT_0010078c;
extern undefined2 DAT_00100790;
extern short DAT_00100794;
extern undefined1 DAT_001007a0_backing[65536];
#define DAT_001007a0 DAT_001007a0_backing[0]
extern char DAT_001007b4;
extern char * DAT_001007b8;
extern char * DAT_001007c0;
extern ushort DAT_001007c4;
extern undefined DAT_001007d5_backing[8192];
#define DAT_001007d5 DAT_001007d5_backing[0]
extern undefined DAT_001007d9_backing[8192];
#define DAT_001007d9 DAT_001007d9_backing[0]
extern undefined DAT_001007dd;
extern undefined DAT_001007e3;
extern undefined DAT_001007fd;
extern short DAT_00201b68;
extern short DAT_00201c74;
extern undefined2 DAT_002020a0;
extern undefined2 DAT_002020a4;
extern short DAT_002020c4;
extern intptr_t DAT_00202948;
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
extern undefined DAT_001007d4_backing[8192];
#define g_monster_max_stats_table DAT_001007d4_backing[0]
#define DAT_001007da DAT_001007d4_backing[6]
#define DAT_001007e2 DAT_001007d4_backing[0xe]
#define DAT_001007ed DAT_001007d4_backing[0x19]
extern short g_mouse_x;
extern short g_mouse_y;
extern ushort * g_player_object;
undefined4 LAB_0001a120();
char * LAB_00028688();
undefined4 LAB_000286a4();
extern char s__DATA_cnv_ark_00084fc8[];
extern char s__SAVE0_bglobals_dat_00084538[];
extern char s__DATA_babglobs_dat_0008454c[];
extern uint *DAT_000bbf04;
/* Globals defined in uw.c but also used by functions that now live in
   babl.c (init_barter_ui) -- extern'd here so both translation units
   see the same storage. */
extern undefined4 DAT_000bc028;
extern undefined4 DAT_000bc010;
extern undefined1 DAT_000845b8;
extern undefined1 DAT_000845ba;
extern undefined1 DAT_000845d8;
extern undefined1 DAT_000845da;
extern undefined2 DAT_000bbfd8;
extern undefined2 DAT_000bbfdc;
extern undefined DAT_001007de_backing[8192];
#define DAT_001007de DAT_001007de_backing[0]
extern undefined2 DAT_000bbfe0;
extern undefined *PTR_DAT_000845c8;
extern undefined1 DAT_000845e8_backing[65536];
#define DAT_000845e8 DAT_000845e8_backing[0]
/* Globals defined in uw.c but also used by functions that now live in
   models.c (tick_anim_record, emit_catalog_object,
   emit_anim_object_frames) -- extern'd here so both translation units
   see the same storage. */
extern unsigned char DAT_00086c08_backing[0x78];
#define DAT_00086c08 DAT_00086c08_backing[0]
#define DAT_00086c09 DAT_00086c08_backing[1]
#define DAT_00086c0a DAT_00086c08_backing[2]
#define DAT_00086c0b DAT_00086c08_backing[3]
extern undefined4 DAT_00086ce0;
extern undefined4 DAT_00086ce4;
extern undefined4 DAT_00086ce8;
extern undefined4 DAT_00086cec;
extern undefined4 DAT_00086cf0;
extern undefined4 DAT_00086cf4;
extern undefined4 DAT_00086cf8;
extern undefined4 DAT_00086cfc;
extern undefined1 DAT_00086d60_backing[65536];
#define DAT_00086d60 DAT_00086d60_backing[0]
extern short DAT_000b4620;
extern char *DAT_00110fc0;
extern undefined DAT_00110ff0_backing[985856];
#define DAT_00110ff0 DAT_00110ff0_backing[0]
extern undefined DAT_00110ffc;
extern undefined1 DAT_00189590_backing[985856];
#define DAT_00189590 DAT_00189590_backing[0]
extern undefined DAT_0018959c;
extern undefined DAT_0018959d;
extern undefined DAT_0018959e;
extern undefined DAT_0018959f;
extern void * const g_anim_model_slot[30];
extern unsigned char g_anim_model_scratch[30][16384];
extern undefined2 DAT_00189570;
extern short DAT_00189576;
extern undefined2 DAT_00189578;
extern ushort DAT_0018957a;
extern short DAT_0018957c;
extern short DAT_0018957e;
extern ushort DAT_00189580;
extern short DAT_00189584;
extern undefined2 DAT_00189586;
extern undefined2 DAT_00202734;
extern undefined4 DAT_0023b804;
extern ushort DAT_0023b81c;
extern ushort DAT_0023b904;
extern ushort DAT_0023b91c;
extern ushort DAT_0023b920;
extern byte DAT_0023bc88;
extern double g_tune_edge_offset;
extern int g_tune_last_catalog;
extern double g_tune_leaf_hinge_offset;
extern double g_tune_rotation_offset;
extern double g_tune_wide_center;
extern int g_uw_debug_pick_diag;
extern const undefined1 DAT_00086d68_region[64];
#define DAT_00086d68 (*(const undefined1 *)DAT_00086d68_region)
#define DAT_00086d69 (*(const undefined1 *)(DAT_00086d68_region + 1))
extern undefined1 g_tile_feature_records_b92e_backing[65536];
#define DAT_0023b92e g_tile_feature_records_b92e_backing[0]
/* Globals defined in uw.c but also used by functions that now live in
   player.c (reset_player_derived_state) -- extern'd here so both
   translation units see the same storage. */
extern undefined1 DAT_0020330c;
extern char DAT_00086db0;
extern char DAT_00086db1;
extern undefined1 DAT_0010060c;
extern undefined1 DAT_0010060d;
extern undefined1 DAT_0010060e;
extern undefined1 DAT_0010060f;
extern undefined4 DAT_0023bc9c;
extern undefined4 DAT_0023bc98;
extern undefined4 DAT_002020d0;
extern undefined4 DAT_002020dc;
extern undefined4 DAT_002020d8;
extern undefined4 DAT_002020d4;
extern int DAT_0023bc94;
extern byte DAT_002046cc;
/* Globals defined in uw.c but also used by functions that now live in
   visibility.c (load_floor_texture_arenas) -- extern'd here so both
   translation units see the same storage. */
extern ushort DAT_0023adc0;
extern char s__DATA_f16_tr_00086dd8[];
extern char s__DATA_f32_tr_00086de8[];
extern char *DAT_0023ae34;
extern char *DAT_0023ae30;
extern char DAT_00086db4;
extern int DAT_00086db8;
extern undefined DAT_00086dc8_backing[16];
#define DAT_00086dc8 DAT_00086dc8_backing[0]
extern undefined g_object_weight_table_backing[2048];
#define g_object_weight_table g_object_weight_table_backing[0]
extern undefined2 DAT_0023beb8;
extern undefined2 DAT_0023be8c;
extern int g_npc_tick_enabled;
extern undefined DAT_00028bfc_backing[8192];
#define DAT_00028bfc DAT_00028bfc_backing[0]
void debug_adjust_view_heading();
void debug_force_rest_action();
undefined4 print_debug_stat_message();
extern undefined2 DAT_0023be6c;
extern undefined2 DAT_0023be68;
extern undefined2 DAT_0023be70;
extern undefined2 DAT_0023be7c;
extern undefined2 DAT_0023be84;
extern undefined2 DAT_0023be78;
extern undefined2 DAT_0023be60;
extern undefined2 DAT_0023bd7c;
extern char s_Lev__d____2_2u__1_1u__2_2u__1_1u_00086e08[];
extern byte DAT_0023bd84;
extern undefined1 DAT_00086e05;
extern undefined1 DAT_00086e06;
extern undefined DAT_00086e00_backing[8192];
#define DAT_00086e00 DAT_00086e00_backing[0]
extern short DAT_0023be90;
extern short DAT_0023be92;
extern short DAT_0023be94;
extern short DAT_0023bf00;
extern undefined2 DAT_0023bf02;
extern int DAT_000db500;
extern undefined2 DAT_0023bf04;
extern byte DAT_0023beb0;
extern byte DAT_0023beac;
extern undefined2 DAT_0023bea0;
extern short DAT_0023bea4;
extern short DAT_0023bf08;
extern undefined DAT_00086e38;
extern undefined DAT_00086e48;
extern undefined DAT_00086e58;
extern char DAT_00086e84;
extern char *DAT_00087944;
extern char *DAT_00087948;
extern char *DAT_0008794c;
extern char *DAT_00087950;
extern undefined2 DAT_0023be9a;
extern undefined2 DAT_0023be9c;
extern undefined2 DAT_0023be9e;
extern byte DAT_0023bf10;
extern char DAT_0023bf14;
extern char DAT_0023bf18;
extern short DAT_0023bf30;
extern short DAT_0023bf34;
extern short DAT_0023bf38;
extern short DAT_0023bf3c;
extern short DAT_0023bf40;
extern uint DAT_0023bf5c;
extern char DAT_0023bf60;
extern int DAT_0023bf64;
#define DAT_002048a5 DAT_00204880_backing[0x25]
#define DAT_002048a6 DAT_00204880_backing[0x26]
extern char *g_menu_button_bitmaps[16];
extern undefined DAT_00086e87_backing[64];
#define DAT_00086e87 DAT_00086e87_backing[0]
extern char s_font5x6i_sys_00086e98[];
extern int DAT_0024af8c;
extern byte DAT_0024af80;
extern undefined4 DAT_0024af88;
extern undefined1 DAT_0024bfa0_backing[1052672];
#define DAT_0024bfa0 DAT_0024bfa0_backing[0]
extern undefined1 DAT_0024bfa1_backing[1052672];
#define DAT_0024bfa1 DAT_0024bfa1_backing[0]
extern undefined1 DAT_0024bfa2_backing[1052672];
#define DAT_0024bfa2 DAT_0024bfa2_backing[0]
extern undefined1 DAT_0024bfa3_backing[1052672];
#define DAT_0024bfa3 DAT_0024bfa3_backing[0]
extern undefined1 DAT_0024bfa4_backing[1052672];
#define DAT_0024bfa4 DAT_0024bfa4_backing[0]
extern undefined1 DAT_0024bfa5_backing[1052672];
#define DAT_0024bfa5 DAT_0024bfa5_backing[0]
extern undefined1 DAT_0024c7a2_backing[1052672];
#define DAT_0024c7a2 DAT_0024c7a2_backing[0]
extern undefined1 DAT_0024c7a3_backing[1052672];
#define DAT_0024c7a3 DAT_0024c7a3_backing[0]
extern undefined4 DAT_0024bf98;
extern unsigned short *DAT_0024cfb8;
extern char *DAT_0024cfa8;
extern char *g_bfa2_real_ptrs[263168];
extern short DAT_0024cfc0;
extern char s_strings_pak_000878c0[];
extern short DAT_0024cfb4;
extern undefined2 DAT_000878bc;
extern undefined1 DAT_0024af98_backing[4096];
#define DAT_0024af98 DAT_0024af98_backing[0]
extern undefined2 DAT_0024cfbc_backing[8192];
#define DAT_0024cfbc DAT_0024cfbc_backing[0]
extern char *g_despawn_creature_record;
extern undefined1 DAT_002034b5_backing[8192];
#define DAT_002034b5 DAT_002034b5_backing[0]
extern undefined DAT_002027d2_backing[8192];
#define DAT_002027d2 DAT_002027d2_backing[0]
extern undefined4 DAT_002046b4;
extern char s_on_what__000878e0[];
extern undefined1 DAT_000878ec_backing[32768];
#define DAT_000878ec DAT_000878ec_backing[0]
extern undefined DAT_00085ce0_backing[8192];
#define DAT_00085ce0 DAT_00085ce0_backing[0]
extern char s_You_read_the_00085ce8[];
extern undefined4 DAT_0024cfc8;
extern undefined4 DAT_0024cfcc;
extern undefined1 DAT_0024cfe0_backing[8192];
#define DAT_0024cfe0 DAT_0024cfe0_backing[0]
extern char *DAT_0024cff4;
extern ushort *DAT_0024cff0;
extern char s_Look__it_s_a_text_trap_00087918[];
extern short DAT_0024cfd0;
extern short DAT_0024cfd8;
extern undefined4 DAT_0024cff8;
extern undefined4 DAT_0024cfd4;
extern undefined DAT_0007e644_backing[8192];
#define DAT_0007e644 DAT_0007e644_backing[0]
extern undefined DAT_00088640_backing[8192];
#define DAT_00088640 DAT_00088640_backing[0]
extern short DAT_002506f0;
extern char *DAT_002506ec;
extern undefined2 DAT_0024d00c;
extern ushort DAT_0024fa18;
extern undefined1 DAT_0024d008;
extern undefined1 DAT_0024fa10;
extern undefined1 DAT_0024d010;
extern char DAT_0024d000;
extern undefined1 DAT_0024f90c;
extern char DAT_0024fa28;
extern undefined2 DAT_0024fa14;
extern undefined2 DAT_002029c8;
extern char s_very_near_00087954[];
extern undefined1 g_msg_scroll_panel_state_conv_backing[65536];
#define g_msg_scroll_panel_state_conv g_msg_scroll_panel_state_conv_backing[0]
extern short DAT_00250728;
extern short DAT_0025070c;
extern char s_No_0008799c[];
extern char s_Yes_000879a0[];
extern undefined s_dash_000879a4_backing[8192];
#define s_dash_000879a4 s_dash_000879a4_backing[0]
extern undefined s_scroll_prompt_arrow_000879a8_backing[8192];
#define s_scroll_prompt_arrow_000879a8 s_scroll_prompt_arrow_000879a8_backing[0]
extern int g_text_input_active;
extern byte *DAT_000b4624;
extern byte *DAT_000b462c;
extern byte *DAT_000b4618;
extern undefined1 DAT_00250730_backing[65536];
#define DAT_00250730 DAT_00250730_backing[0]
#define DAT_00250732 DAT_00250730_backing[2]
#define DAT_00250733 DAT_00250730_backing[3]
extern int DAT_002508fc;
/* Globals defined in uw.c but also used by functions that now live in
   tmap.c (update_wall_partition_phase) -- extern'd here so both
   translation units see the same storage. */
extern undefined2 DAT_0023b908_backing[8192];
#define DAT_0023b908 DAT_0023b908_backing[0]
extern undefined2 DAT_0023b928_backing[8192];
#define DAT_0023b928 DAT_0023b928_backing[0]
extern undefined DAT_0023b90a_backing[8192];
#define DAT_0023b90a DAT_0023b90a_backing[0]
extern undefined1 DAT_0023b940_backing[65536];
#define DAT_0023b940 DAT_0023b940_backing[0]
extern char s_add_to_npc_inv_0008507c[];
extern char s_babl_ask_000851ec[];
extern char s_babl_fmenu_00085214[];
extern char s_babl_menu_00085220[];
extern char s_charhead_00084fe0[];
extern char s_check_inv_quality_000850ec[];
extern char s_converse_00084ff4[];
extern char s_count_inv_000850d0[];
extern char s_do_decline_00085168[];
extern char s_do_demand_00085174[];
extern char s_do_inv_create_00085110[];
extern char s_do_inv_delete_00085100[];
extern char s_do_judgement_00085158[];
extern char s_do_offer_00085180[];
extern char s_dungeon_level_000852b0[];
extern char s_end_barter_0008514c[];
extern char s_find_barter_00085024[];
extern char s_find_barter_total_00085010[];
extern char s_find_inv_000851c0[];
extern char s_font5x6p_sys_0008430c[];
extern char s_game_days_0008528c[];
extern char s_game_mins_00085298[];
extern char s_game_time_000852a4[];
extern char s_genhead_00084fd8[];
extern char s_get_quest_00085208[];
extern char s_give_ptr_npc_00085000[];
extern char s_give_to_npc_000851cc[];
extern char s_gronk_door_000850c4[];
extern char s_heads_00084fec[];
extern char s_identify_inv_0008518c[];
extern char s_new_player_exp_0008527c[];
extern char s_npc_arms_00085374[];
extern char s_npc_attitude_000845f8[];
extern char s_npc_goal_0008535c[];
extern char s_npc_gtarg_00085350[];
extern char s_npc_health_00085388[];
extern char s_npc_hp_00085380[];
extern char s_npc_hunger_00085394[];
extern char s_npc_level_00085334[];
extern char s_npc_name_00085310[];
extern char s_npc_power_00085368[];
extern char s_npc_talkedto_00085340[];
extern char s_npc_whoami_000853a0[];
extern char s_npc_xhome_00085328[];
extern char s_npc_yhome_0008531c[];
extern char s_pause_00085134[];
extern char s_place_object_0008506c[];
extern char s_play_arms_000852e4[];
extern char s_play_drawn_00085258[];
extern char s_play_health_000852f8[];
extern char s_play_hp_000852f0[];
extern char s_play_hunger_00085304[];
extern char s_play_level_000852c0[];
extern char s_play_mana_000852cc[];
extern char s_play_name_0008524c[];
extern char s_play_poison_00085264[];
extern char s_play_power_000852d8[];
extern char s_play_sex_00085270[];
extern char s_print_000851e4[];
extern char s_remove_talker_0008505c[];
extern char s_respond_000845ac[];
extern undefined s_scroll_newline_0008522c_backing[8192];
#define s_scroll_newline_0008522c s_scroll_newline_0008522c_backing[0]
extern char s_set_attitude_000850b4[];
extern char s_set_inv_quality_000850dc[];
extern char s_set_likes_dislikes_00085120[];
extern char s_set_quest_000851fc[];
extern char s_set_race_attitude_000850a0[];
extern char s_setup_to_barter_0008513c[];
extern char s_sex_000851f8[];
extern char s_show_inv_000851d8[];
extern char s_take_from_npc_000851b0[];
extern char s_take_from_npc_inv_0008508c[];
extern char s_take_id_from_npc_0008519c[];
extern char s_x_obj_pos_00085030[];
extern char s_x_obj_stuff_0008503c[];
extern char s_x_skills_00085050[];
extern char s_x_traps_00085048[];
/* Globals defined in uw.c but also used by functions that now live in
   automap.c (the automap screen) -- extern'd here so both translation
   units see the same storage. */
extern const unsigned char DAT_000842c0_real_table[64];
#define DAT_000842c0 (*(undefined1 *)DAT_000842c0_real_table)
extern const unsigned char DAT_000842f0_real_table[4];
#define DAT_000842f0 (*(undefined1 *)DAT_000842f0_real_table)
extern const signed char DAT_000842f4_real_table[4];
#define DAT_000842f4 (*(undefined1 *)DAT_000842f4_real_table)
extern const signed char DAT_000842f8_real_table[4];
#define DAT_000842f8 (*(undefined1 *)DAT_000842f8_real_table)
extern undefined1 DAT_000878d0_backing[256];
#define DAT_000878d0 DAT_000878d0_backing[0]
extern undefined2 DAT_000b99c0;
extern undefined4 DAT_000b99c4;
extern undefined1 DAT_000b99d0_backing[8192];
#define DAT_000b99d0 DAT_000b99d0_backing[0]
extern short DAT_000ba9d0;
extern char DAT_000ba9d4;
extern undefined4 DAT_000bbef4;
extern int DAT_000bbefc;
extern char * DAT_002029cc;
extern char s__DATA_blnkmap_byt_00084338[];
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
extern undefined DAT_00101444;
extern undefined DAT_00101448;
extern undefined4 DAT_00101734;
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
extern ushort *DAT_0023c414;
extern char *DAT_0023c410;
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
extern short DAT_0023b8c4;
extern char DAT_0023bb94;
extern undefined1 DAT_0023bb98_backing[512];
#define DAT_0023bb98 DAT_0023bb98_backing[0]
#define DAT_0023bb99 DAT_0023bb98_backing[1]
#define DAT_0023bb9a DAT_0023bb98_backing[2]
extern char DAT_0023c3e0;
extern char * DAT_0023c3e4;
extern char * DAT_0023c3e8;
extern char * DAT_0023c3ec;
extern short DAT_0023c3f4;
extern ushort DAT_0023c400;
extern char * DAT_0023c40c;
extern undefined2 DAT_0023c41c;
extern void *g_grtile_registry[65536];
extern undefined4 DAT_000bbf20;
extern undefined1 DAT_000bbf30;
extern undefined2 DAT_000bbf88;
extern char s_append_0008457c[];
extern char s_compare_000845a0[];
extern char s_contains_00084584[];
extern char s_copy_00084574[];
extern char s_find_0008456c[];
extern char s_length_00084564[];
extern char s_plural_00084590[];
extern char s_random_00084598[];
extern char s_val_00084560[];
/* Globals defined in uw.c but also used by functions that now live in
   3d.c (the 3D transform/rasterization pipeline) -- extern'd here so
   both translation units see the same storage. */
#define UW_MAX_VIS_TILES 2048
extern void * g_tile_texptr_emit[UW_MAX_VIS_TILES];
extern void * g_tile_texptr_out[UW_MAX_VIS_TILES];
extern char DAT_000842b0;
extern undefined4 DAT_00084608;
extern undefined4 DAT_000b5638_backing[160];
#define DAT_000b5638 DAT_000b5638_backing[0]
extern undefined DAT_000bc038_backing[32768];
#define DAT_000bc038 DAT_000bc038_backing[0]
extern void * DAT_000c4838_backing[4096];
#define DAT_000c4838 DAT_000c4838_backing[0]
extern undefined4 DAT_000c8ac0_mtx[16];
#define DAT_000c8ac0 DAT_000c8ac0_mtx[0]
extern int DAT_000c8c98;
extern undefined2 DAT_000da47c;
extern undefined4 DAT_000db438;
extern undefined4 DAT_000db43c;
extern undefined4 DAT_000db440;
extern int DAT_000db448;
extern int DAT_000db44c;
extern int DAT_000db450;
extern char DAT_0023b830;
extern undefined4 DAT_000d9930_arr[512];
extern undefined4 DAT_000d9ed8_arr[512];
#define DAT_000bc039 DAT_000bc038_backing[1]
#define DAT_000bc03a DAT_000bc038_backing[2]
#define DAT_000bc03b DAT_000bc038_backing[3]
#define DAT_000bc044 DAT_000bc038_backing[0xc]
#define DAT_000bc07c DAT_000bc038_backing[0x44]
#define DAT_000bc07d DAT_000bc038_backing[0x45]
#define DAT_000bc07e DAT_000bc038_backing[0x46]
#define DAT_000bc07f DAT_000bc038_backing[0x47]
#define DAT_000bc0a0 DAT_000bc038_backing[0x68]
#define DAT_000bc0a1 DAT_000bc038_backing[0x69]
#define DAT_000bc0a2 DAT_000bc038_backing[0x6a]
#define DAT_000bc0a3 DAT_000bc038_backing[0x6b]
#define DAT_000bc0a4 DAT_000bc038_backing[0x6c]
#define DAT_000bc0a5 DAT_000bc038_backing[0x6d]
#define DAT_000bc0a6 DAT_000bc038_backing[0x6e]
#define DAT_000bc0a7 DAT_000bc038_backing[0x6f]
#define DAT_000bc0a8 DAT_000bc038_backing[0x70]
#define DAT_000bc0a9 DAT_000bc038_backing[0x71]
#define DAT_000bc0aa DAT_000bc038_backing[0x72]
#define DAT_000bc0ab DAT_000bc038_backing[0x73]
#define DAT_000bc0ac DAT_000bc038_backing[0x74]
#define DAT_000bc0ad DAT_000bc038_backing[0x75]
#define DAT_000bc0ae DAT_000bc038_backing[0x76]
#define DAT_000bc0af DAT_000bc038_backing[0x77]
#define DAT_000bc0b0 DAT_000bc038_backing[0x78]
#define DAT_000bc0b1 DAT_000bc038_backing[0x79]
#define DAT_000bc0b2 DAT_000bc038_backing[0x7a]
#define DAT_000bc0b3 DAT_000bc038_backing[0x7b]
#define DAT_000bc0b4 DAT_000bc038_backing[0x7c]
#define DAT_000bc0b5 DAT_000bc038_backing[0x7d]
#define DAT_000bc0b6 DAT_000bc038_backing[0x7e]
#define DAT_000bc0b7 DAT_000bc038_backing[0x7f]
#define DAT_000bc0b8 DAT_000bc038_backing[0x80]
#define DAT_000bc0b9 DAT_000bc038_backing[0x81]
#define DAT_000bc0ba DAT_000bc038_backing[0x82]
#define DAT_000bc0bb DAT_000bc038_backing[0x83]
#define DAT_000bc0bc DAT_000bc038_backing[0x84]
#define DAT_000bc0bd DAT_000bc038_backing[0x85]
#define DAT_000bc0be DAT_000bc038_backing[0x86]
#define DAT_000bc0bf DAT_000bc038_backing[0x87]
#define DAT_000c8ac4 DAT_000c8ac0_mtx[1]
#define DAT_000c8ac8 DAT_000c8ac0_mtx[2]
#define DAT_000c8ad0 DAT_000c8ac0_mtx[4]
#define DAT_000c8ad4 DAT_000c8ac0_mtx[5]
#define DAT_000c8ad8 DAT_000c8ac0_mtx[6]
#define DAT_000c8ae0 DAT_000c8ac0_mtx[8]
#define DAT_000c8ae4 DAT_000c8ac0_mtx[9]
#define DAT_000c8ae8 DAT_000c8ac0_mtx[10]
#define DAT_000c8af0 DAT_000c8ac0_mtx[12]
#define DAT_000c8af4 DAT_000c8ac0_mtx[13]
#define DAT_000c8af8 DAT_000c8ac0_mtx[14]
#define DAT_000d9930 (DAT_000d9930_arr[0])
#define DAT_000d9ed8 (DAT_000d9ed8_arr[0])
/* Globals defined in uw.c but also used by functions that now live in
   player.c (player state/movement/save persistence) -- extern'd here
   so both translation units see the same storage. */
extern undefined4 DAT_000858a0;
extern undefined1 DAT_00085d20_backing[65536];
#define DAT_00085d20 DAT_00085d20_backing[0]
extern undefined1 DAT_00086da8;
extern byte DAT_001013a4;
extern short DAT_00201c70;
extern undefined2 DAT_00201c78;
extern short DAT_00202080;
extern short DAT_00202088;
extern undefined4 DAT_002020d8;
extern uint DAT_002020e4;
extern byte DAT_002020e8;
extern byte * DAT_00202c6c;
extern undefined1 DAT_00203303;
extern undefined2 DAT_00203304;
extern undefined2 DAT_002048b0_backing[8192];
#define DAT_002048b0 DAT_002048b0_backing[0]
extern undefined2 DAT_002048b2;
extern undefined1 * DAT_002048b8;
extern char * DAT_0023b82c;
extern undefined4 DAT_0023bc98;
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
extern const undefined1 DAT_00086c00_arr[8];
extern const unsigned char DAT_00086bf0_real_table[16];
extern undefined4 DAT_00084610;
extern undefined4 DAT_0008462c;
extern undefined4 DAT_00084630;
extern undefined4 DAT_00084634;
extern undefined4 DAT_00084638;
extern undefined4 DAT_00086b20;
extern short DAT_00086b24;
extern short DAT_00086b28;
extern char DAT_000872a0;
extern char *DAT_0024fa2c;
extern char s__DATA_shades_dat_000872a4[];
extern char s__DATA_mono_dat_000872b8[];
extern char s__DATA_light_dat_000872c8[];
extern char s__DATA_xfer_dat_000872d8[];
extern char s_cLightTabs_allocation_error_____000872e8[];
extern undefined1 DAT_0008730c_backing[8192];
#define DAT_0008730c DAT_0008730c_backing[0]
extern undefined1 DAT_0008730d;
extern undefined DAT_00087308_arr[3];
#define DAT_00087308 DAT_00087308_arr[0]
extern char s_and_00087310[];
extern undefined DAT_00087318;
extern char s_Chant_the_mantra__0008731c[];
extern char s_fontchar_sys_00087330[];
extern byte DAT_00085730;
extern char s__DATA_win1_byt_00087350[];
extern char DAT_0023c27c;
extern char s__DATA_win2_byt_00087340[];
extern undefined DAT_001c2000_backing[8192];
#define DAT_001c2000 DAT_001c2000_backing[0]
extern undefined1 DAT_0024fa38_backing[3072];
#define DAT_0024fa38 DAT_0024fa38_backing[0]
extern undefined2 DAT_00086b30;
extern char DAT_00087938;
#define DAT_000a85d0 DAT_000a85d0_backing[0]
extern char * DAT_00110fc0;
extern char * DAT_0023aecc;
extern undefined2 DAT_0023b4d0;
extern code * DAT_0023b4d4;
extern ushort DAT_0023b4d8;
extern byte DAT_0023b4e0;
extern short DAT_0023b4e4;
extern short DAT_0023b4e8;
extern byte * DAT_0023b4ec;
extern char * DAT_0023b4f0;
extern code * DAT_0023b4f4;
extern char * DAT_0023b808;
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
#define DAT_00086c00 (*(const undefined1 *)DAT_00086c00_arr)
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
extern char * DAT_00202a44;
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
extern const unsigned short DAT_000858a8_real[8];
extern const unsigned short DAT_000858b8_real[8];
extern code * DAT_00086b38_fnptrs[6];
extern undefined1 DAT_000870f0_backing[32];
extern undefined1 DAT_00087112_backing[32];
extern const unsigned short DAT_000871b8_arr[14];
extern undefined1 DAT_0023c11c_arr[2];
extern undefined1 DAT_0023c118_arr[9];
extern undefined1 DAT_0023c12c_arr[2];
extern char DAT_0023c240_vitals[16];
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
extern HWND__ *DAT_0023c548;
extern unsigned short u_Software_Apps_ZIO_Interactive_Ul_000877a4[];
extern char s__Program_Files_ZIO_Interactive_U_00087804[];
extern unsigned short u_InstlDir_00087838[];
extern unsigned short u_Software_Apps_ZIO_Interactive_Ul_0008784c[];
extern unsigned short u_HP_Jornada_540_000876cc[];
extern char s__Program_Files_ZIO_Interactive_U_000876ec[];
extern unsigned short u_Software_Apps_ZIO_Interactive_Ul_0008771c[];
extern char s__Program_Files_ZIO_Interactive_U_00087774[];
extern undefined1 DAT_000830b0_backing[65536];
#define DAT_000830b0 DAT_000830b0_backing[0]
#define UNK_000830b4 DAT_000830b0_backing[4]
extern undefined1 DAT_0023c128_arr[9];
extern void (*const g_hud_panel_handlers_table[13])(void);
/* Globals defined in uw.c but also used by functions that now live in
   ai.c (NPC AI) -- extern'd here so both translation units see the
   same storage. */
extern undefined DAT_00084f20_backing[8192];
#define DAT_00084f20 DAT_00084f20_backing[0]
extern undefined1 DAT_000853b0;
extern undefined1 DAT_000853b1;
extern ushort DAT_000853b8;
extern undefined DAT_000853d8;
extern undefined DAT_000868c0;
extern undefined1 DAT_001007d0_backing[6144];
#define DAT_001007d0 DAT_001007d0_backing[0]
extern undefined4 DAT_001013fc;
extern ushort DAT_00101414;
extern ushort DAT_0010141c;
extern undefined1 DAT_0010142c;
extern byte DAT_00101434;
extern char * DAT_00101438;
extern undefined4 DAT_00101440;
extern byte DAT_00101450;
extern byte DAT_00101458;
extern undefined1 DAT_00101460;
extern undefined1 DAT_001014e0;
extern undefined1 DAT_001014e1;
extern undefined4 DAT_00101560;
extern undefined DAT_00101568_backing[8192];
#define DAT_00101568 DAT_00101568_backing[0]
extern undefined DAT_00101569;
extern void * DAT_0010172c;
extern byte DAT_00101730;
extern undefined1 DAT_00101738;
extern char DAT_00101740_backing[8192];
#define DAT_00101740 DAT_00101740_backing[0]
extern char DAT_00101741;
extern undefined1 DAT_00101743;
extern undefined2 DAT_00101744;
extern undefined1 DAT_00101746;
extern undefined1 DAT_00101747;
extern undefined1 DAT_00101748;
extern byte DAT_001018fc;
extern char * DAT_00101904;
extern ushort DAT_00101910;
extern undefined4 DAT_00101914;
extern undefined4 DAT_0010191c;
extern undefined4 DAT_00101920;
extern char DAT_00101928;
extern short DAT_00101938;
extern short DAT_0010193c;
extern undefined4 DAT_00101944;
extern char DAT_00101948;
extern undefined DAT_002027d1_backing[8192];
#define DAT_002027d1 DAT_002027d1_backing[0]
extern short DAT_002046b0;
extern byte * DAT_002046c0;
extern byte * DAT_002046c8;
extern undefined2 DAT_002048c0_backing[32768];
#define DAT_002048c0 DAT_002048c0_backing[0]
extern undefined1 DAT_002048f0_backing[65536];
#define DAT_002048f0 DAT_002048f0_backing[0]
extern undefined DAT_00204920_backing[8192];
#define DAT_00204920 DAT_00204920_backing[0]
extern undefined1 DAT_00204950_backing[65536];
#define DAT_00204950 DAT_00204950_backing[0]
extern undefined1 DAT_00204980_backing[65536];
#define DAT_00204980 DAT_00204980_backing[0]
extern undefined2 DAT_00204990_backing[32768];
#define DAT_00204990 DAT_00204990_backing[0]
extern undefined2 DAT_002049a0_backing[8192];
#define DAT_002049a0 DAT_002049a0_backing[0]
extern undefined2 DAT_002049b0_backing[32768];
#define DAT_002049b0 DAT_002049b0_backing[0]
extern undefined1 DAT_0023cf08_backing[40960];
#define DAT_0023cf08 DAT_0023cf08_backing[0]
extern undefined DAT_0023cf09;
extern undefined DAT_0023cf0a;
extern undefined DAT_0023cf0b;
extern undefined DAT_0023cf0c;
extern char s_named_00085d18[];
/* Globals defined in uw.c but also used by functions that now live in
   containers.c (the open-container/backpack view stack) -- extern'd
   here so both translation units see the same storage. */
extern undefined1 DAT_00085c88_backing[32768];
#define DAT_00085c88 DAT_00085c88_backing[0]
extern undefined4 DAT_002028a0_backing[64];
#define DAT_002028a0 DAT_002028a0_backing[0]
extern undefined DAT_00202978_backing[8192];
#define DAT_00202978 DAT_00202978_backing[0]
extern undefined2 DAT_00202980;
extern ushort DAT_00202986;
extern short g_player_carry_weight;
extern char s_is_empty__0008790c[];
#define DAT_002028ec DAT_002028e8_backing[1]
#define DAT_00202951 g_backpack_slot_table[1]
#define g_backpack_widget_to_slot_plus1 g_backpack_widget_to_slot_backing[1]
#define g_current_container_link (*(ushort *)&g_backpack_slot_table[56])
/* Globals defined in uw.c but also used by functions that now live in
   interact.c (object interaction dispatch) -- extern'd here so both
   translation units see the same storage. */
extern short DAT_000858c4;
extern char * DAT_002020b0;
extern int DAT_002020e0;
extern undefined4 DAT_002020ec;
/* Globals defined in uw.c but also used by functions that now live in
   resources.c (.GR bitmap loading, flip-grtile slots, door frames) --
   extern'd here so both translation units see the same storage. */
extern undefined4 DAT_00202514;
extern undefined DAT_00202518_backing[8192];
#define DAT_00202518 DAT_00202518_backing[0]
extern undefined4 DAT_00202728;
extern ushort DAT_00202744;
extern undefined2 DAT_00202748;
extern char * DAT_0020274c;
extern undefined1 DAT_0023b840_backing[8192];
#define DAT_0023b840 DAT_0023b840_backing[0]
extern char * DAT_0023c3fc;
extern undefined4 * DAT_0023c404;
extern void * g_grtile_real_ptrs[320];
extern char s__DATA__00085970[];
extern char s_doors_00085a64[];
/* Globals defined in uw.c but also used by functions that now live in
   item_use.c (item use) -- extern'd here so both translation units
   see the same storage. */
extern undefined1 DAT_00202a28_backing[256];
#define g_food_effect_table DAT_00202a28_backing[0]
extern undefined4 g_weapon_overlay_enabled;
extern char s_is_locked__000878fc[];
extern char s_That_000878f4[];
extern char s_UNNAMED_00084f24[];
/* Globals defined in uw.c but also used by functions that now live in
   movement.c (the movement collision sweep) -- extern'd here so both
   translation units see the same storage. */
extern unsigned char DAT_002049c8_backing[64];
extern unsigned char DAT_00086998_backing[16];
extern undefined1 DAT_00086986_backing[65536];
#define DAT_00086986 DAT_00086986_backing[0]
extern short DAT_00086980;
extern short DAT_00086982;
extern short DAT_00086984;
extern short DAT_0008698a;
extern ushort DAT_0008698c;
extern short DAT_0008698e;
extern short DAT_00086990;
extern ushort DAT_00086992;
extern short DAT_00086994;
extern short DAT_00086996;
extern unsigned char DAT_000869a8_backing[16];
#define DAT_000869a8 DAT_000869a8_backing[0]
extern undefined DAT_00202c32;
extern undefined1 DAT_00202c38_backing[8192];
#define DAT_00202c38 DAT_00202c38_backing[0]
extern undefined1 DAT_00202c39_backing[8192];
#define DAT_00202c39 DAT_00202c39_backing[0]
extern undefined1 DAT_00202c3a_backing[8192];
#define DAT_00202c3a DAT_00202c3a_backing[0]
extern undefined1 DAT_00202c3b_backing[8192];
#define DAT_00202c3b DAT_00202c3b_backing[0]
extern undefined1 DAT_00202c3c_backing[65536];
#define DAT_00202c3c DAT_00202c3c_backing[0]
extern undefined1 DAT_00202c3d_backing[8192];
#define DAT_00202c3d DAT_00202c3d_backing[0]
extern int DAT_00204870;
extern char * DAT_00204874;
extern undefined4 DAT_00204878;
extern char * DAT_002048bc;
extern undefined * DAT_00204988;
extern undefined * DAT_00204998;
extern undefined1 * DAT_002049a8;
extern undefined * DAT_002049b8;
extern char DAT_002049bc;
extern undefined1 DAT_002049c0;
extern short * g_sweep_foot_pos;
extern short * g_sweep_velocity;
#define DAT_00086987 DAT_00086986_backing[1]
#define DAT_00086998  (*(signed char *)(DAT_00086998_backing + 0))
#define DAT_00086999  (DAT_00086998_backing[1])
#define DAT_0008699a  (DAT_00086998_backing[2])
#define DAT_0008699b  (DAT_00086998_backing[3])
#define DAT_0008699f  (DAT_00086998_backing[7])
#define DAT_000869a1  (DAT_00086998_backing[9])
#define DAT_000869a2  (DAT_00086998_backing[10])
#define DAT_002049c8 (*(short *)(DAT_002049c8_backing + 0x00))
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
extern undefined1 g_visibility_ray_table_backing[1024];
extern const undefined1 DAT_00086af0_arr[4];
extern const undefined1 DAT_00086af8_region[12];
extern short DAT_00086b2c;
extern undefined DAT_00086b34;
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
extern int DAT_0023aec8;
extern undefined2 * DAT_0023aed0;
extern undefined2 DAT_0023aed4;
extern undefined2 DAT_0023b020;
extern undefined1 DAT_0023b028;
extern undefined * DAT_0023b02c;
extern undefined1 DAT_0023b039_backing[4096];
#define DAT_0023b039 DAT_0023b039_backing[0]
extern undefined1 DAT_0023b4a8_backing[65536];
#define DAT_0023b4a8 DAT_0023b4a8_backing[0]
extern ushort DAT_0023b4c8;
extern short DAT_0023b4cc;
extern undefined4 DAT_0023b804;
extern undefined1 DAT_0023b841;
extern undefined1 DAT_0024f090;
extern undefined1 DAT_0024f0ca;
extern short DAT_0025063c;
extern short DAT_0025064c;
extern short DAT_002506dc;
extern undefined4 g_dungeon_view_active;
extern short g_visibility_max_ring_passes;
extern char * g_visibility_ray_realptr[24];
extern char * g_visibility_ray_realptr2[24];
#define g_visibility_ray_table g_visibility_ray_table_backing[0]
extern undefined1 g_visibility_ring_done;
extern char s__DATA_terrain_dat_000869ec[];
extern char s_bad_tmap_ids_size_000869b7[];
extern char s_R__lu_P__lu_S__lu_F__d__d_00086b04[];
#define DAT_00086a18 (*(undefined1 *)(DAT_00086a00_region + 0x18))
#define DAT_00086a60 (*(undefined1 *)(DAT_00086a00_region + 0x60))
#define DAT_00086af0 (*(undefined1 *)DAT_00086af0_arr)
#define DAT_00086af8 (*(undefined1 *)(DAT_00086af8_region + 0))
#define DAT_00086afc (*(undefined1 *)(DAT_00086af8_region + 4))
#define DAT_00086b00 (*(undefined1 *)(DAT_00086af8_region + 8))
#define DAT_0023aee1 g_visibility_ray_table_backing[1]
#define DAT_0023aee3 g_visibility_ray_table_backing[3]
#define DAT_0023aee5 g_visibility_ray_table_backing[5]
#define DAT_0023aee6 g_visibility_ray_table_backing[6]
#define DAT_0023aee7 g_visibility_ray_table_backing[7]
#define DAT_0023aee8 g_visibility_ray_table_backing[8]
#define DAT_0023aee9 g_visibility_ray_table_backing[9]
#define DAT_0023aeea (*(undefined2 *)&g_visibility_ray_table_backing[0xa])
#define DAT_0023aeec g_visibility_ray_table_backing[0xc]
#define DAT_0023aeed g_visibility_ray_table_backing[0xd]
#define DAT_0023aeee (*(undefined2 *)&g_visibility_ray_table_backing[0xe])
#define DAT_0023aef0 g_visibility_ray_table_backing[0x10]
#define DAT_0023aef5 g_visibility_ray_table_backing[0x15]
#define DAT_0023aef6 (*(undefined2 *)&g_visibility_ray_table_backing[0x16])
#define DAT_0023aef8 (*(undefined2 *)&g_visibility_ray_table_backing[0x18])
#define DAT_0023aefa g_visibility_ray_table_backing[0x1a]
#define DAT_0023aefb g_visibility_ray_table_backing[0x1b]
#define DAT_0023aefc g_visibility_ray_table_backing[0x1c]
#define DAT_0023aefd g_visibility_ray_table_backing[0x1d]
#define DAT_0023aefe (*(undefined2 *)&g_visibility_ray_table_backing[0x1e])
#define DAT_0023af00 (*(undefined2 *)&g_visibility_ray_table_backing[0x20])
#define DAT_0023af02 g_visibility_ray_table_backing[0x22]
/* Globals defined in uw.c but also used by functions that now live in
   saveload.c (save/load) -- extern'd here so both translation units
   see the same storage. */
extern undefined2 DAT_000868dc;
extern undefined DAT_00087030_backing[8192];
#define DAT_00087030 DAT_00087030_backing[0]
extern undefined DAT_00087084_backing[8192];
#define DAT_00087084 DAT_00087084_backing[0]
extern short DAT_002046f0;
extern char s__6_Save_Game_Descriptions_0008703c[];
extern char s__DATA_OPSCR_BYT_00086efc[];
extern char s__not_used_yet__00087020[];
extern char s__PLAYER_DAT_00087088[];
extern char s__SAVE0_desc_00087078[];
extern char s_I__00087074[];
extern char s_II__0008706c[];
extern char s_III__00087064[];
extern char s_IV__0008705c[];
extern char s_Please_enter_a_Save_Game_file_an_00087094[];
extern undefined s_scroll_color_reset_00087038_backing[8192];
#define s_scroll_color_reset_00087038 s_scroll_color_reset_00087038_backing[0]
/* Globals defined in uw.c but also used by functions that now live in
   text.c (text/font rendering) -- extern'd here so both translation
   units see the same storage. */
extern undefined2 DAT_000890b0_backing[32768];
#define DAT_000890b0 DAT_000890b0_backing[0]
extern undefined2 DAT_000a85b0;
extern short DAT_000a85b8;
extern undefined4 DAT_0020250c;
extern char * g_font_glyph_data_base;
extern ushort g_font_line_height;
extern short g_font_row_stride;
extern undefined2 g_text_flat_color;
/* Globals defined in uw.c but also used by functions that now live in
   collision.c (collision geometry) -- extern'd here so both
   translation units see the same storage. */
extern undefined1 DAT_00202bf8_backing[32768];
#define DAT_00202bf8 DAT_00202bf8_backing[0]
extern undefined1 DAT_00202c70_backing[65536];
#define DAT_00202c70 DAT_00202c70_backing[0]
extern ushort * _DAT_00202c34;
extern char DAT_00202c18;
extern char DAT_00202c1c;
extern char DAT_00202c20;
extern char DAT_00202c24;
extern char DAT_00202c28;
extern char DAT_00202c2c;
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
#define DAT_00202c78 (*(unsigned short *)(DAT_00202c70_backing + 8))
/* Globals defined in uw.c but also used by functions that now live in
   input.c (key bindings, movement commands, mouse) -- extern'd here
   so both translation units see the same storage. */
#define DAT_00086e68 15
extern void (*g_keybind_handler[512])(int);
extern int g_keybind_handler_n;
extern void (*g_click_region_handler[128])(int);
extern int g_click_region_handler_n;
extern undefined2 DAT_00085a70;
extern short DAT_00086968;
extern undefined2 DAT_0008696a;
extern undefined2 DAT_0008696c;
extern short DAT_0008696e;
extern short DAT_00086974;
extern undefined DAT_00086e70;
extern short * DAT_000876c4;
extern int DAT_000879ac;
extern undefined4 DAT_000bbef8;
extern short DAT_00202078;
extern short DAT_0020207a;
extern short DAT_0020207c;
extern ushort DAT_00202084;
extern byte DAT_0020208c;
extern undefined4 DAT_002020d4;
extern undefined2 DAT_0020288c;
extern char * DAT_00202890;
extern undefined2 DAT_00202898;
extern char * DAT_0020289c;
extern short DAT_00204700;
extern short DAT_00204708;
extern undefined2 DAT_0020470c;
extern undefined2 DAT_00204710;
extern short DAT_00204778;
extern short DAT_0020477c;
extern short DAT_00204780;
extern short DAT_00204788;
extern undefined2 DAT_00204830;
extern undefined2 DAT_00204834;
extern short DAT_00204840;
extern short DAT_00204850;
extern int DAT_0020485c;
extern int DAT_00204864;
extern short DAT_0023bf48;
extern short DAT_0023bf4c;
extern undefined4 DAT_0023bf50;
extern undefined4 DAT_0023bf54;
extern byte DAT_0023bf58;
extern undefined DAT_00250658;
extern int g_click_region_handler_n;
extern int g_keybind_handler_n;
extern short g_movement_mode;
/* Globals defined in uw.c but also used by functions that now live in
   object_actions.c (object action dispatch, critter sprite tier/page,
   placement/combination checks) -- extern'd here so both translation
   units see the same storage. */
extern ushort DAT_002022f8;
extern int DAT_002022fc;
extern ushort DAT_00202300;
extern ushort DAT_00202304;
extern ushort DAT_00202508;
#define DAT_00202c9b DAT_00202c90_backing[0xb]
extern undefined1 DAT_0023ce70_backing[8192];
#define DAT_0023ce70 DAT_0023ce70_backing[0]
extern undefined1 DAT_0023ce71;
extern ushort g_player_max_carry_weight;
extern char s_belonging_to_00085c90[];
extern char s_You_see_000858fc[];
/* Globals defined in uw.c but also used by functions that now live in
   weapon_swing.c (weapon swing animation) -- extern'd here so both
   translation units see the same storage. */
#define UW_WEAPON_SWING_FRAME_COUNT 28
extern void * g_weapon_swing_raw_frames[UW_WEAPON_SWING_FRAME_COUNT];
extern undefined1 DAT_000870e0;
extern short DAT_000870e4;
extern undefined2 DAT_000870e8;
extern short DAT_0023c1ec;
extern undefined1 g_weapon_swing_frame_y_offset_backing[256];
#define g_weapon_swing_frame_y_offset g_weapon_swing_frame_y_offset_backing[0]
extern undefined1 g_weapon_swing_frame_x_offset_backing[256];
#define g_weapon_swing_frame_x_offset g_weapon_swing_frame_x_offset_backing[0]
extern char s__DATA_weapons_dat_00087268[];
extern char s__DATA_weapons_cm_00087284[];
extern undefined1 DAT_00202700_backing[256];
#define DAT_00202700 DAT_00202700_backing[0]
extern char s_weapons_0008727c[];
/* Globals defined in uw.c but also used by functions that now live in
   level.c (level loading) -- extern'd here so both translation units
   see the same storage. */
extern undefined1 DAT_00088d98_backing[1536];
#define DAT_00088d98 DAT_00088d98_backing[0]
extern undefined4 DAT_002029d0;
extern char * DAT_002046a0;
extern char * DAT_002046ac;
extern undefined1 g_scheduler_count;
extern char *g_scheduler_table;
#define DAT_00250778 g_scheduler_table[0]
#define DAT_00250779 g_scheduler_table[1]
#define DAT_0025077a g_scheduler_table[2]
#define DAT_0025077b g_scheduler_table[3]
#define DAT_0025077c g_scheduler_table[4]
#define DAT_0025077d g_scheduler_table[5]
extern char s__DATA_main_byt_000857a8[];
extern short DAT_00084f10;
extern char DAT_000870d8;
extern char DAT_000870dc;
extern undefined1 DAT_000870ec_backing[4];
#define DAT_000870ec DAT_000870ec_backing[0]
#define DAT_000870f0 DAT_000870f0_backing[0]
extern short DAT_00087130_arr[16];
#define DAT_00087130 DAT_00087130_arr[0]
extern short DAT_00087150_arr[16];
#define DAT_00087150 DAT_00087150_arr[0]
extern short DAT_00087170_arr[2];
#define DAT_00087170 DAT_00087170_arr[0]
extern short DAT_00087174_arr[2];
#define DAT_00087174 DAT_00087174_arr[0]
extern char DAT_00087178_arr[16];
#define DAT_00087178 DAT_00087178_arr[0]
extern char DAT_00087188_arr[16];
#define DAT_00087188 DAT_00087188_arr[0]
extern short DAT_000871b4_arr[4];
#define DAT_000871b4 DAT_000871b4_arr[0]
extern unsigned short DAT_000871d4_arr[2];
#define DAT_000871d4 DAT_000871d4_arr[0]
extern unsigned short DAT_000871d8_arr[2];
#define DAT_000871d8 DAT_000871d8_arr[0]
extern short DAT_00087254_arr[2];
#define DAT_00087254 DAT_00087254_arr[0]
extern undefined DAT_00087298_backing[8192];
#define DAT_00087298 DAT_00087298_backing[0]
extern int DAT_00088950;
extern int DAT_00088954;
extern int DAT_00088958;
extern int DAT_0008895c;
extern undefined2 DAT_00189578;
extern ushort DAT_00189580;
extern undefined2 DAT_00189582;
extern undefined2 DAT_00201b60;
extern short DAT_00201b64;
extern short DAT_00201c84;
extern undefined2 DAT_00201c90;
extern undefined2 DAT_00201c8c;
extern code *DAT_00201c9c;
extern char s_At__d__d_00087360[];
extern char s_Unable_to_defuse_trap__0008736c[];
extern char s_Your_bumbling_attempts_have_set_o_00087384[];
extern char s_was_successfully_dearmed__000873b0[];
extern char s_on_the_000873cc[];
extern undefined1 DAT_00087414_backing[65536];
#define DAT_00087414 DAT_00087414_backing[0]
extern char s__SOUND__0008750c[];
extern char s_uw00_mod_00087514[];
extern int DAT_00087448;
extern int DAT_00087454;
extern byte DAT_0023c3a8;
extern undefined4 *DAT_0023c3b8;
extern undefined1 DAT_0023c384;
extern undefined4 DAT_0023c280;
extern undefined4 DAT_0023c330;
extern short DAT_0023c32c;
extern undefined1 DAT_0023c3dc;
extern undefined1 DAT_0023c3d8;
extern uint DAT_00202094;
extern char *DAT_00202098;
extern undefined1 DAT_00087604_backing[65536];
#define DAT_00087604 DAT_00087604_backing[0]
extern undefined *PTR_FUN_00087614;
extern undefined DAT_0008762c_backing[8192];
#define DAT_0008762c DAT_0008762c_backing[0]
#define DAT_00087630 DAT_0008762c_backing[4]
#define DAT_00087634 DAT_0008762c_backing[8]
extern int DAT_00087450;
extern undefined4 DAT_0008744c;
extern undefined DAT_0023c2b0_backing[8192];
#define DAT_0023c2b0 DAT_0023c2b0_backing[0]
extern undefined DAT_0023c2b1_backing[8192];
#define DAT_0023c2b1 DAT_0023c2b1_backing[0]
extern undefined DAT_0023c2b2_backing[8192];
#define DAT_0023c2b2 DAT_0023c2b2_backing[0]
extern undefined DAT_0023c2b3_backing[8192];
#define DAT_0023c2b3 DAT_0023c2b3_backing[0]
extern byte g_sound_channel_state[4];
extern ushort g_sound_channel_group[4];
extern byte DAT_0023c39c;
extern undefined DAT_0023c3d4_backing[8192];
#define DAT_0023c3d4 DAT_0023c3d4_backing[0]
extern int DAT_0023c3bc;
extern int DAT_0023c378;
extern undefined1 DAT_000873e0_backing[65536];
#define DAT_000873e0 DAT_000873e0_backing[0]
extern undefined4 DAT_00087458;
extern undefined1 DAT_00087520_backing[32768];
#define DAT_00087520 DAT_00087520_backing[0]
extern undefined1 DAT_00087531_backing[210];
#define DAT_00087531 DAT_00087531_backing[0]
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
extern byte DAT_0023c11a;
extern undefined1 DAT_0023c11b;
#define DAT_0023c11c DAT_0023c11c_arr[0]
extern undefined DAT_0023c124;
#define DAT_0023c128 DAT_0023c128_arr[0]
extern byte DAT_0023c12a;
#define DAT_0023c12c DAT_0023c12c_arr[0]
extern undefined1 DAT_0023c130;
extern byte DAT_0023c150;
extern ushort DAT_0023c1d8;
extern ushort DAT_0023c1dc;
extern ushort DAT_0023c1e0;
extern undefined2 DAT_0023c1e4_arr[2];
#define DAT_0023c1e4 DAT_0023c1e4_arr[0]
#define DAT_0023c1e6 DAT_0023c1e4_arr[1]
extern short DAT_0023c1e8_arr[2];
#define DAT_0023c1e8 DAT_0023c1e8_arr[0]
#define DAT_0023c1ea DAT_0023c1e8_arr[1]
extern undefined1 DAT_0023c1f0_backing[65536];
#define DAT_0023c1f0 DAT_0023c1f0_backing[0]
extern undefined1 DAT_0023c1f8_backing[65536];
#define DAT_0023c1f8 DAT_0023c1f8_backing[0]
extern int DAT_0023c20c;
extern short DAT_0023c21c;
extern undefined2 DAT_0023c220;
extern short DAT_0023c224_arr[2];
#define DAT_0023c224 DAT_0023c224_arr[0]
extern short DAT_0023c228;
extern short DAT_0023c22c;
extern short DAT_0023c230_arr[2];
#define DAT_0023c230 DAT_0023c230_arr[0]
extern short DAT_0023c234_arr[2];
#define DAT_0023c234 DAT_0023c234_arr[0]
extern short DAT_0023c238_arr[2];
#define DAT_0023c238 DAT_0023c238_arr[0]
extern int DAT_0023c23c;
#define DAT_0023c240 DAT_0023c240_vitals[0]
extern short DAT_0023c250;
extern short DAT_0023c254;
extern short DAT_00087258;
extern short DAT_0023c258;
extern int DAT_0023c260;
extern undefined2 DAT_0023c140;
extern int DAT_0023c278;
extern undefined2 DAT_0023c148;
extern undefined2 DAT_0023c14c;
extern undefined2 DAT_0023c144;
extern byte g_flip_grtile_cache_ready;
extern short DAT_0023c134;
extern byte DAT_0023c208;
extern short DAT_0023c138;
extern short DAT_0023c13c;
extern short DAT_0023c110;
extern unsigned short u_dgijjjigd_G__000871e0[16];
extern byte DAT_0023c25c;
extern short DAT_0023c268_arr[3];
#define DAT_0023c268 DAT_0023c268_arr[0]
extern short DAT_0023c270_arr[3];
#define DAT_0023c270 DAT_0023c270_arr[0]
extern const undefined2 DAT_00087210_arr[3];
#define DAT_00087210 DAT_00087210_arr[0]
extern const undefined2 DAT_00087218_arr[3];
#define DAT_00087218 DAT_00087218_arr[0]
extern undefined4 DAT_0023c200_arr[3];
#define DAT_0023c200 DAT_0023c200_arr[0]
#define DAT_0023c202 DAT_0023c200_arr[1]
#define DAT_0023c204 DAT_0023c200_arr[2]
extern void * DAT_0023c430;
extern short DAT_0023c63c;
extern undefined * DAT_00250704;
extern undefined4 DAT_00250708;
extern short DAT_00250710;
extern undefined2 DAT_00250714;
extern undefined4 DAT_0025071c;
extern undefined4 DAT_00250720;
extern short DAT_00250724;
extern int g_force_flush;
extern int g_force_redraw_no_xp;
extern undefined1 g_msg_scroll_panel_state_backing[65536];
#define g_msg_scroll_panel_state g_msg_scroll_panel_state_backing[0]
extern undefined4 g_scroll_control_codes_enabled;
extern int g_suppress_frame_timed_flush;
extern unsigned int g_uw_frame_clock_units;
extern char PTR_DAT_00087198_arr[16];
#define PTR_DAT_00087198 PTR_DAT_00087198_arr[0]
extern char PTR_DAT_000871a8_arr[16];
#define PTR_DAT_000871a8 PTR_DAT_000871a8_arr[0]
extern char s__MORE__00087994[];
extern char s_init_gamedisp_goes_000858e8[];
extern char s_panels_00087260[];
#define DAT_000858a8 (*(undefined1 *)DAT_000858a8_real)
#define DAT_000858b8 (*(undefined1 *)DAT_000858b8_real)
#define DAT_00086b38 (DAT_00086b38_fnptrs[0])
#define DAT_00086b40 (DAT_00086b38_fnptrs[2])
#define DAT_00086b48 (DAT_00086b38_fnptrs[4])
#define DAT_00086b50  DAT_00086b50_at(0x00)
#define DAT_00086b52  DAT_00086b50_at(0x02)
#define DAT_000870f2 (*(short *)(DAT_000870f0_backing + 2))
#define DAT_00087114 (*(short *)(DAT_00087112_backing + 2))
#define DAT_000871b8 (*(undefined1 *)DAT_000871b8_arr)
#define DAT_0023c11d DAT_0023c11c_arr[1]
#define DAT_0023c11f DAT_0023c118_arr[7]
#define DAT_0023c120 DAT_0023c118_arr[8]
#define DAT_0023c12d DAT_0023c12c_arr[1]
#define DAT_0023c244 DAT_0023c240_vitals[4]
#define DAT_0023c248 DAT_0023c240_vitals[8]
#define DAT_0023c24c DAT_0023c240_vitals[12]
#define DAT_0023cdb8 (*(int *)(DAT_0023cdb0_backing + 8))
#define DAT_0023cdbc (*(int *)(DAT_0023cdb0_backing + 0xc))
#define DAT_0023cdc0 (*(int *)(DAT_0023cdb0_backing + 0x10))
#define g_committed_hud_panel DAT_0023c128_arr[6]
#define DAT_0023c12f DAT_0023c128_arr[7]
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
void thunk_FUN_0003c310();
void reset_viewport_to_fullscreen();
undefined4 render_dungeon_view();
undefined8 compute_view_y_bound();
byte *decompress_gr_bitmap();
uint merge_byte_into_word();
void FUN_00013108();
void blit_sprite_row_remapped();
void FUN_000132c4();
int FUN_00013774();
void FUN_000137c0();
void FUN_00013904();
void FUN_00013b8c();
void FUN_0001422c();
void FUN_00014258();
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
undefined4 LAB_000415d0(void *buf, unsigned size, int idx);
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
void FUN_0001a1a4();
undefined4 FUN_0001a1c8();
void save_npc_conversation_variables();
void FUN_0001a5e0();
void FUN_0001a628();
void FUN_0001a654();
void FUN_0001a69c();
void FUN_0001a6e4();
void FUN_0001a74c();
void FUN_0001a7b4();
void FUN_0001a808();
void FUN_0001a85c();
void FUN_0001a8a4();
void FUN_0001a8ec();
void FUN_0001a934();
void FUN_0001a97c();
void FUN_0001a9c4();
void FUN_0001aa0c();
bool FUN_0001aa54();
void FUN_0001aa88();
void FUN_0001aab4();
void FUN_0001aaf8();
void FUN_0001ab30();
void FUN_0001aba0();
void FUN_0001ac48();
void FUN_0001acf8();
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
void FUN_0001dd2c();
void build_view_matrix();
void translate_verts_to_camera_space();
void project_verts_through_view_matrix();
void FUN_0001e594();
void FUN_0001e6f0();
void build_euler_rotation_matrix();
void transform_points_by_matrix();
void near_clip_visible_tiles();
void render_visible_tile_list();
void FUN_00020a74();
undefined4 win_file_exists();
undefined4 open_existing_file_rw();
bool close_file_handle();
undefined4 open_file_for_read();
undefined4 open_existing_file_rw_alt();
undefined4 seek_file_handle();
undefined4 read_file_handle();
undefined4 write_file_handle();
uint FUN_000228ac();
void FUN_000228d4();
undefined4 rand_below();
uint read_realtime_clock_units();
undefined *FUN_0002295c();
undefined *FUN_00022998();
void FUN_000229e0();
void expand_pals_bytes();
void build_rgb565_palette();
void flush_dirty_rect_to_display();
void flush_dirty_rect_to_display_240();
void FUN_000232b0();
void FUN_000232ec();
undefined4 FUN_000238b4();
void FUN_00023a00();
void FUN_00023b38();
int FUN_00023c90();
void FUN_00023cdc();
void FUN_00023de8();
undefined4 FUN_0002431c();
uint character_generator_touch_select();
uint FUN_00024840();
void palette_cycle_range();
undefined4 FUN_00025a98();
int FUN_00025b84();
void FUN_00025ed8();
undefined4 FUN_00026194();
int FUN_00026570();
void FUN_00026858();
undefined4 FUN_00026eb4();
void FUN_0002702c();
undefined4 FUN_000270d0();
int FUN_000271dc();
undefined4 FUN_000272c0();
void FUN_000273f8();
void FUN_000275e0();
void FUN_0002764c();
void FUN_00027694();
void FUN_00027708();
void FUN_00027b3c();
int FUN_00027ce0();
void FUN_00027f14();
void FUN_00028004();
int FUN_0002805c();
undefined4 FUN_0002822c();
bool FUN_00028254();
undefined4 FUN_000282ac();
void FUN_00028488();
void FUN_000286cc();
void FUN_00028bac();
void start_npc_conversation();
void FUN_00028ffc();
int babl_menu(); // was LAB_0002912c, a no-op stub -- see its own comment in uw.c next to FUN_00029358 (babl_fmenu)
int FUN_00029358();
void FUN_000295b4();
void FUN_00029708();
void FUN_0002977c();
void FUN_000297dc();
void FUN_00029850();
undefined4 babl_builtin_pause();
int FUN_0002990c();
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
void FUN_0002a2c8();
undefined4 FUN_0002a35c();
void sync_conv_vars_from_npc();
bool sync_conv_vars_to_npc();
void FUN_0002b258();
int mobile_object_tick(); // was FUN_0002b47c
void FUN_0002b63c();
int build_collision_height_field_for_object(); // was FUN_0002b7a0
undefined4 FUN_0002b960();
undefined4 FUN_0002bbec();
undefined4 FUN_0002bc9c();
undefined4 apply_placement_collision_sweep(); // was FUN_0002bd70
undefined4 tile_pair_los_blocked();
undefined4 FUN_0002c8e0();
undefined4 creature_find_path_to_tile();
void FUN_0002d110();
int FUN_0002d1e0();
undefined4 FUN_0002d4e8();
undefined4 FUN_0002d9f4();
undefined4 FUN_0002db4c();
void FUN_0002dba4();
void FUN_0002dbf4();
undefined4 FUN_0002dd4c();
undefined4 FUN_0002de40();
undefined4 FUN_0002df2c();
void FUN_0002e104();
undefined4 FUN_0002e3b4();
void FUN_0002e454();
void npc_walk_toward_tile();
void FUN_0002ee80();
void FUN_0002efa0();
void npc_idle_behavior_tick();
void npc_combat_approach_tick();
void npc_wander_return_home_tick();
void npc_notice_and_idle_tick();
void npc_combat_engage_close_tick();
undefined4 npc_combat_set_stance();
void FUN_00030874();
undefined4 FUN_00030aac();
undefined4 FUN_00030be0();
undefined4 FUN_00030e50();
void npc_combat_engage_wide_tick();
void npc_combat_position_tick();
uint FUN_000318d8();
void npc_combat_disengage_tick();
void FUN_00031dbc();
void npc_wander_return_home_exact_tick();
undefined4 FUN_00032180();
undefined4 FUN_00032410();
undefined4 FUN_0003276c();
int FUN_0003298c();
void FUN_00032aa4();
undefined4 npc_ai_tick(); // was FUN_00032d38
void FUN_00033880();
undefined4 FUN_00034044();
undefined4 FUN_00034270();
int FUN_0003431c();
void npc_set_goal();
void npc_clear_special_goal();
undefined4 FUN_000345b8();
undefined4 FUN_00034634();
undefined4 FUN_000346a0();
undefined4 object_tick_is_due(); // was FUN_0003495c
void tick_mobile_objects(); // was FUN_000349bc
void FUN_00034ac4();
void FUN_00034af0();
undefined4 FUN_00034ba8();
void FUN_00034c10();
undefined4 FUN_00034fa4();
void FUN_0003513c();
undefined4 FUN_000352d0();
undefined4 FUN_00035340();
undefined4 FUN_00035394();
undefined4 FUN_00035894();
void FUN_000358e8();
void FUN_00035960();
void FUN_000359f4();
undefined4 FUN_00035a18();
void FUN_00035cb0();
undefined4 FUN_00035dd8();
void FUN_00035df8();
void thunk_FUN_0007ec1c();
void FUN_00035e00();
undefined2 FUN_00035ec4();
uint FUN_00035f24();
void FUN_00035fdc();
void FUN_0003601c();
undefined4 FUN_000360f4();
undefined4 FUN_00036460();
undefined4 FUN_0003651c();
undefined4 FUN_000366a0();
void FUN_000366bc();
void FUN_0003671c();
void FUN_00037c14();
void FUN_00037d50();
void FUN_00037d6c();
undefined4 FUN_00037f1c();
undefined4 FUN_00037fe8();
undefined4 FUN_00038028();
undefined4 FUN_000382cc();
undefined4 FUN_00038374();
bool FUN_00038418();
void FUN_00038680();
void FUN_0003894c();
int FUN_00038a8c();
void FUN_00038ab0();
void FUN_00038acc();
void FUN_00038ae8();
void FUN_00038c14();
undefined4 FUN_00038d4c();
undefined4 FUN_000396a0();
undefined4 FUN_00039790();
undefined4 FUN_00039bd8();
undefined4 FUN_00039d1c();
undefined4 FUN_00039d78();
void FUN_00039f04();
void FUN_0003a0e8();
void FUN_0003a29c();
void FUN_0003a2b0();
void FUN_0003a398();
void FUN_0003a4a0();
void FUN_0003a57c();
void FUN_0003a5ec();
undefined4 FUN_0003a604();
void FUN_0003a654();
undefined4 FUN_0003a73c();
int FUN_0003a924();
uint FUN_0003a99c();
void FUN_0003ab90();
undefined4 FUN_0003ae00();
void FUN_0003aea8();
undefined4 FUN_0003af28();
void FUN_0003b0e4();
uint FUN_0003b31c();
uint FUN_0003b344();
void FUN_0003b3a8();
void FUN_0003b48c();
void FUN_0003b54c();
void FUN_0003b608();
void FUN_0003b770();
void FUN_0003b7f4();
void FUN_0003b80c();
void FUN_0003b820();
void FUN_0003baf4();
void FUN_0003bb60();
void FUN_0003bb84();
void FUN_0003bc08();
void FUN_0003bc1c();
void set_game_mode();
void change_game_mode();
void enter_dungeon_view();
void FUN_0003bee4();
void FUN_0003c038();
undefined4 dungeon_view_anim_tick();
void FUN_0003c310();
void FUN_0003c318();
void FUN_0003c3b4();
void FUN_0003c3c8();
void FUN_0003c4a8();
bool apply_swim_wade_pose();
void set_locomotion_state();
void FUN_0003c6ac();
undefined4 begin_directional_move();
void apply_heading_turn();
void set_player_tile_position();
void commit_player_move();
void demo_set_player_pos(double x, double y, double z, double yaw_deg, double pitch_deg);
void debug_print_player_position(const char *label);
void resolve_move_vector();
void FUN_0003dba0();
void FUN_0003dbd8();
void FUN_0003dc04();
void FUN_0003dc6c();
void FUN_0003dc78();
void FUN_0003dca4();
void toggle_stats_panel();
void FUN_0003df28();
void FUN_0003e0b4();
void FUN_0003e2a4();
void FUN_0003e404();
void enter_dungeon_view_hud_init();
void sync_player_stats_to_hud();
void FUN_0003e644();
undefined4 target_in_range();
uint object_chain_max_barrier();
undefined4 target_line_of_sight();
ushort *pick_object_under_cursor();
void describe_picked_terrain();
void FUN_0003ee10();
void interact_default();
void interact_talk_npc();
void dispatch_object_action();
void interact_look();
void interact_use();
void interact_attack();
void FUN_0003f420();
void FUN_0003f648();
void handle_inventory_panel_normal_click();
void inventory_panel_click_region();
void mode_icon_highlight_on();
void mode_icon_highlight_off();
void cursor_mode_button_click();
void cursor_mode_button_click_restricted();
void ready_weapon();
void unready_weapon();
void toggle_weapon_ready();
bool FUN_000400dc();
undefined4 FUN_00040130();
undefined4 FUN_00040160();
void FUN_00040440();
undefined4 FUN_000404a0();
undefined4 FUN_00040770();
undefined4 FUN_0004083c();
void *FUN_000408fc();
void blit_object_sprite_by_frame();
char *decode_gr_entry_bitmap();
uint resolve_sprite_id_to_frame();
void draw_sprite_by_id();
void FUN_00040bc0();
void sprite_list_flush_blit_raw();
void *get_texture_page();
undefined4 FUN_00040cd4();
bool select_active_font();
void thunk_FUN_00057118();
void FUN_00040df0();
bool load_pals_bank();
bool set_palette_bank();
void FUN_00040f34();
void FUN_00040f64();
void FUN_000411b8();
void FUN_000411cc();
void FUN_000411e0();
void FUN_00041210();
undefined4 FUN_00041260();
undefined4 open_gr_resource_file();
void FUN_000414c8();
uint FUN_000414f4();
bool FUN_00041708();
undefined4 FUN_00041770();
uint load_gr_resource_entries();
unsigned char *uw_get_default_palette(const char *gr_name);
undefined4 FUN_00041910();
undefined4 FUN_00041960();
undefined4 load_tmflat_gr();
undefined4 FUN_000419c8();
void FUN_00041a18();
undefined4 FUN_00041a78();
undefined4 FUN_00041aac();
void load_door_frames();
void load_armor_variant_tables();
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
void FUN_00043614();
void FUN_0004365c();
undefined4 auto_place_in_container();
bool FUN_00043b78();
void sum_container_weight();
void build_player_save_record();
bool write_player_save_record();
void serialize_inventory_link_chain();
void encode_equipped_item_index();
void *alloc_save_record_slot();
void *save_record_slot_from_index();
void decode_equipped_item_index();
void deserialize_inventory_link_chain();
void FUN_000444b0();
void restore_player_save_record();
undefined4 FUN_00044624();
undefined4 FUN_0004479c();
void FUN_00044814();
void FUN_00044848();
void FUN_000448a8();
void FUN_00044920();
void FUN_0004497c();
void FUN_00044bcc();
void FUN_00044bd8();
void FUN_00044d14();
undefined4 FUN_00044e74();
undefined4 FUN_00044e9c();
void FUN_0004503c();
void *get_equipped_item_at_slot();
undefined4 place_object_in_backpack_slot();
int FUN_000451b0();
ushort *FUN_000452dc();
char *find_object_in_link_chain();
ushort *FUN_00045678();
ushort *FUN_00045708();
void deplete_object_count();
void decrement_object_count();
undefined4 reduce_object_count();
ushort *FUN_000459d8();
ushort *FUN_00045a7c();
ushort *extract_and_refresh_slot_item();
ushort *extract_matching_object_from_slot();
undefined4 FUN_00045f9c();
undefined4 FUN_00046030();
uint FUN_00046260();
bool check_object_carry_weight();
void FUN_0004638c();
void FUN_00046414();
void FUN_000465c8();
void handle_inventory_panel_click();
void attach_picked_up_object_to_cursor();
undefined4 load_armor_overlay_frame();
void redraw_armor_overlay_widgets();
void redraw_inventory_widget();
void swap_cursor_and_slot_item();
undefined1 *FUN_000470fc();
uint check_object_fits_in_slot();
void handle_backpack_slot_click();
undefined4 place_held_item_in_empty_slot();
undefined4 FUN_00047b38();
undefined4 handle_backpack_slot_interact();
void FUN_00048110();
void redraw_inventory_widget_range();
bool FUN_00048514();
int hit_test_inventory_widget();
void dispatch_object_action_dup();
undefined4 FUN_00048b6c();
undefined4 FUN_00048bf0();
void FUN_00048e8c();
void FUN_00049008();
void FUN_000492bc();
void FUN_000493cc();
void build_creature_look_text();
void FUN_000495d0();
undefined4 FUN_000496b0();
void main_loop_hud_flush();
void dispatch_sticky_mode_handlers();
void FUN_00049924();
undefined4 FUN_00049940();
void FUN_00049948();
undefined4 alloc_flip_grtile_slot();
void *resolve_flip_grtile_slot();
void FUN_0004995c();
undefined4 init_level_object_arena();
void FUN_000499a4();
int load_level_object_table();
int FUN_00049b04();
void heading_to_sine_cosine();
uint pack_angle_byte();
void angle_to_screen_delta();
int FUN_00049db8();
int FUN_00049eb8();
int FUN_00049fb4();
void load_light_food_effect_tables();
bool compute_drop_aim_from_cursor();
void FUN_0004a210();
void FUN_0004a510();
bool FUN_0004a588();
undefined4 drop_held_object_near_player();
void FUN_0004ac98();
ushort *spawn_object_near_player();
undefined4 check_object_drop_height();
undefined4 FUN_0004b600();
void FUN_0004b644();
undefined4 FUN_0004b66c();
undefined4 FUN_0004b948();
undefined1 *FUN_0004bc94();
undefined4 FUN_0004c958();
void FUN_0004c97c();
undefined4 FUN_0004ca50();
undefined4 FUN_0004cfc8();
bool FUN_0004d050();
void FUN_0004d79c();
undefined4 FUN_0004e324();
void FUN_0004e6e0();
void FUN_0004ecd4();
void FUN_0004edf8();
void FUN_0004ee60();
void FUN_0004f0ac();
void FUN_0004f2f0();
void FUN_0004f4ec();
int FUN_0004f560();
bool FUN_0004f594();
undefined4 FUN_0004f6b0();
undefined4 FUN_0004f748();
void FUN_0004f7e0();
void FUN_0004f7f0();
void FUN_0004f828();
undefined1 FUN_0004f858();
void FUN_0004f874();
void FUN_0004f9a0();
void FUN_0004faf4();
void FUN_0004fb38();
void FUN_0004fc64();
undefined1 *FUN_0004fcd4();
void FUN_0004fd18();
void FUN_0004fd68();
void FUN_0004fda4();
void FUN_0004fef8();
void FUN_0004ff68();
void FUN_0004ffb8();
void FUN_0004fff4();
void FUN_00050148();
void FUN_000501b8();
void FUN_00050208();
void FUN_00050244();
void FUN_00050370();
void FUN_000503e0();
undefined4 FUN_00050430();
undefined4 FUN_00050454();
undefined4 FUN_00050478();
undefined4 FUN_0005049c();
void FUN_000504c0();
void FUN_000504cc();
void FUN_000504fc();
void FUN_0005056c();
undefined4 FUN_000505bc();
void FUN_000505e0();
void FUN_00050604();
void FUN_00050648();
void FUN_00050678();
void FUN_000506a8();
void FUN_00050718();
undefined4 FUN_00050768();
void FUN_0005078c();
void FUN_000507b8();
void FUN_000507fc();
void FUN_00050828();
void FUN_00050860();
void FUN_000508b0();
void FUN_000508dc();
void FUN_0005090c();
void FUN_00050948();
uint collision_sample_floor_height();
int FUN_00050aa8();
bool FUN_00050b30();
bool collision_corner_flags();
void collision_build_height_field();
void resolve_wall_slide_corner();
void FUN_00051658();
void collision_height_envelope();
void FUN_00051cf8();
void FUN_00051dd0();
undefined4 FUN_00051fa0();
undefined4 place_object_in_world();
undefined4 drop_object_near_target();
undefined4 find_object_placement();
undefined4 FUN_00052674();
void *get_scanned_object_class_effect_ptr();
void reset_level_object_arena();
undefined4 FUN_00052af4();
undefined4 FUN_00052bac();
undefined4 roll_object_destroy_chance();
undefined4 FUN_00052d24();
void FUN_00052d68();
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
void *FUN_000535fc();
int FUN_00053644();
undefined4 object_ptr_in_arena();
void FUN_00053750();
void FUN_00053774();
ushort *FUN_000537d0();
undefined4 FUN_00053920();
int FUN_000539b0();
undefined4 FUN_00053ab0();
void FUN_00053c74();
undefined4 FUN_0005404c();
void FUN_000541d0();
undefined4 FUN_000542f8();
undefined4 FUN_0005448c();
void FUN_000545ac();
undefined4 FUN_000546c4();
void build_object_placement_snapshot(); // was FUN_00054a00
undefined4 sync_object_tile_position(); // was FUN_00054f6c
ushort *reallocate_object_to_arena();
void compute_object_placement_fields();
ushort *settle_mobile_to_immobile(); // was FUN_0005596c
void FUN_00055ef8();
ushort *settle_dropped_object();
void FUN_000564f8();
void FUN_00056640();
void FUN_00056688();
void FUN_000566dc();
void close_ui_panel_return_to_game();
void FUN_000567c0();
void draw_save_load_slot_list();
void FUN_00056838();
void FUN_00056864();
void FUN_0005693c();
void FUN_000569c0();
void FUN_00056a18();
void FUN_00056a70();
void FUN_00056b48();
void FUN_00056bdc();
void FUN_00056c88();
void FUN_00056cc8();
void FUN_00056cf8();
void FUN_00056d38();
void FUN_00056d6c();
void FUN_00056ebc();
undefined4 init_cursor_subsystem();
int FUN_00056fe8();
undefined4 cursor_show_idle_tick();
void FUN_00057118();
void FUN_00057188();
undefined4 FUN_000571c0();
void FUN_0005721c();
void FUN_00057460();
void FUN_00057504();
void FUN_00057528();
void FUN_00057570();
void FUN_0005758c();
void FUN_00057590();
int FUN_000575c4();
void wait_for_click_release();
int FUN_000576d0();
void set_cursor_confine_rect();
void reset_cursor_confine_rect();
int poll_mouse_event();
undefined4 FUN_000578fc();
uint FUN_00057904();
uint poll_input_event();
undefined4 next_input_event();
undefined4 peek_input_event();
int FUN_00057a80();
int FUN_00057af0();
void FUN_00057bb0();
void FUN_00057c5c();
void FUN_00057cac();
undefined4 FUN_00057d1c();
void FUN_00057dc0();
void FUN_00057e54();
void update_mouse_state();
void FUN_00058438();
void FUN_000584c0();
void draw_idle_mouse_cursor();
void FUN_00058734();
uint FUN_00058738();
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
undefined4 FUN_0005aea0();
undefined4 FUN_0005b010();
undefined4 reset_texture_id_lists();
bool load_level_texture_ids();
undefined4 FUN_0005b298();
void FUN_0005b36c();
void load_texture_arena();
void load_terrain_texture_props();
void FUN_0005b758();
void FUN_0005b828();
void draw_command_list_rewind();
void free_frame_geometry_buffers();
void FUN_0005bac0();
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
void FUN_0005d2b0();
void emit_hud_draw_commands();
void walk_visible_tiles();
void FUN_0005dd84();
void FUN_0005debc();
void FUN_0005dff4();
void emit_floor_texture_select();
void FUN_0005e3c0();
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
void thunk_FUN_00078e28();
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
void complete_use_item_on_player();
void arm_use_item_on_player_prompt();
void prompt_use_item_on_target();
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
void FUN_0007c580();
void FUN_0007c708();
void FUN_0007c814();
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
#define _DAT_00202978 (*(uint*)&DAT_00202978)
#define _DAT_00202bfb (*(unsigned short*)(DAT_00202bf8_backing + 0x03))
#define _DAT_00202c00 (*(unsigned short*)(DAT_00202bf8_backing + 0x08))
#define _DAT_00202c05 (*(unsigned short*)(DAT_00202bf8_backing + 0x0d))
#define _DAT_002035cf (*(uint*)&DAT_002035cf)
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
#define _DAT_002048c2 (*(uint*)&DAT_002048c2)
#define _DAT_00204980 (*(uint*)&DAT_00204980)
#define _DAT_00204982 (*(uint*)&DAT_00204982)
#define _DAT_00204986 (*(uint*)&DAT_00204986)
#define _DAT_00204992 (*(uint*)&DAT_00204992)
#define _DAT_0023aee1 (*(uint*)&DAT_0023aee1)
#define _DAT_0023aee3 (*(uint*)&DAT_0023aee3)
#define _DAT_0023af02 (*(uint*)&DAT_0023af02)
#define _DAT_0023c5ac (*(uint*)&DAT_0023c5ac)
#define _DAT_0023ce10 (*(uint*)&DAT_0023ce10)
#define Ordinal_2005_exref ((void*)&Ordinal_2005)

/* Globals defined in uw.c but also used by functions that now live in
   game.c (animate_title_palette_cycle's 14ms throttle timestamp). */
extern ushort DAT_0023bf74;

/* Globals defined in uw.c but also used by functions that now live in
   saveload.c (ensure_save_directory_exists's "\*.*" scan wildcard). */
extern undefined DAT_000870c8_backing[8192];
#define DAT_000870c8 DAT_000870c8_backing[0]

/* Globals defined in uw.c but also used by functions that now live in
   registration.c. */
extern int DAT_00086f0c;
extern unsigned short u_BuildNo_00086f5c[];
extern unsigned short u_Software_ZIO_Interactive_Ultima_U_00086f6c[];
extern int DAT_0023c108;
extern undefined DAT_0023bf78_backing[8192];
#define DAT_0023bf78 DAT_0023bf78_backing[0]

/* Declarations for the functions that used to live directly in this file
 * but were split out into their own topic .c files this session -- moved
 * to matching headers/*.h so those files (and anything else that only
 * needs one topic's functions) can include just what they need. Included
 * here too so anything that already includes uw.h keeps working
 * unchanged. Safe against the circular #include "../uw.h" each of these
 * does themselves, since UW_H is already defined by this point. */
#include "src/headers/graphics.h"
#include "src/headers/babl.h"
#include "src/headers/automap.h"
#include "src/headers/inventory.h"
#include "src/headers/combat.h"
#include "src/headers/bitmap.h"
#include "src/headers/3d.h"
#include "src/headers/player.h"
#include "src/headers/tmap.h"
#include "src/headers/objects.h"
#include "src/headers/hud.h"
#include "src/headers/ai.h"
#include "src/headers/containers.h"
#include "src/headers/interact.h"
#include "src/headers/resources.h"
#include "src/headers/item_use.h"
#include "src/headers/movement.h"
#include "src/headers/visibility.h"
#include "src/headers/saveload.h"
#include "src/headers/text.h"
#include "src/headers/collision.h"
#include "src/headers/input.h"
#include "src/headers/object_actions.h"
#include "src/headers/weapon_swing.h"
#include "src/headers/level.h"
#include "src/headers/doors.h"
#include "src/headers/winfile_wrappers.h"
#include "src/headers/models.h"
#include "src/headers/math.h"
#include "src/headers/game.h"
#include "src/headers/chargen.h"

#endif /* UW_H */
