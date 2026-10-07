#ifndef UW_H
#define UW_H

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <strings.h>
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
/* Ghidra's pseudo-type for "executable code" reached through a function pointer. */
typedef void code();
/* Same idea as 'code', but for call-through-pointer sites whose result is
 * actually used as a value (Ghidra's jump tables mix void and value-
 * returning targets under the same 'code' label). */
typedef undefined4 codeval();
/* Same idea as 'codeval', but for call-through-pointer sites whose result is a real pointer (e.g.
   an allocator callback) rather than a 4-byte scalar -- returning through 'codeval' truncates the
   pointer on 64-bit hosts. */
typedef void *codeptr();


/* Object / tile record structs. This WinCE port keeps the exact same bit-packed layout LEV.ARK uses
   on disk for its object table and tilemap, in memory, at runtime -- not just at load time. */
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
    unsigned short quality    : 6;  /* bits 0-5: for a uw_mobile_object_t, this same byte is exposed to the
                                        babl VM as "npc_xhome" instead (confirmed via babl.c's
                                        sync_conv_vars_from_npc, which reads ->quality straight into that
                                        variable) -- same kind of dual meaning as link/is_quant below */
    unsigned short next       : 10; /* bits 6-15: next object slot index in this tile's/container's chain */

    /* word 0x06 */
    unsigned short owner      : 6;  /* bits 0-5: owner / special property (context-dependent); for a
                                        uw_mobile_object_t this is babl's "npc_yhome" (see ->quality above) */
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

    /* NOTE: babl.c's sync_conv_vars_from_npc (the definitive source for this struct's other
       confirmed NPC offsets) exposes the babl VM variables "npc_xhome"/"npc_yhome" from
       uw_object_hdr_t.quality/owner instead, not from this word -- so the names below, inherited
       from the wiki's own offset table, are unconfirmed and may not be what this word really
       holds. Left as originally named pending a real call site that reads/writes it. */
    unsigned short _pad16_lo  : 4;  /* offset 0x16, bits 0-3: not in the wiki's own table */
    unsigned short npc_yhome  : 6;  /* bits 4-9 */
    unsigned short npc_xhome  : 6;  /* bits 10-15 */

    unsigned char  npc_heading : 5; /* offset 0x18, bits 0-4 (rest of byte unused per wiki) */
    unsigned char  npc_hunger  : 7; /* offset 0x19, bits 0-6 -- NOTE: bit 7 of this same byte is a
                                        separate, real boolean confirmed via babl.c's
                                        sync_conv_vars_to_npc/sync_conv_vars_from_npc (set when the
                                        babl "npc_hunger" variable is < 0x20, read back as a
                                        two-value 0x10/0xc0 split), not part of this 7-bit value and
                                        not currently given its own field here -- and a second,
                                        unrelated bit (bit 6, inside npc_hunger's own declared span)
                                        gets unconditionally OR'd in the npc_attitude>=4 branch of
                                        that same function, which doesn't fit a monotonic 0-127
                                        hunger value either. This field's real bit layout is less
                                        certain than it looks; left exactly as the wiki names it
                                        pending a closer read of that function. */
    unsigned char  npc_whoami;      /* offset 0x1a, full byte */
} uw_mobile_object_t;  /* 0x1b (27) bytes total */

/* 4-byte level tilemap record (wiki section 4.2). DAT_002029cc is the level's flat 64x64 array of
   these (tilemap_lookup, uw.c ~58433, is the single shared accessor behind 70+ call sites: index =
   tileX + tileY*0x40). */
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

/* Shared 16-bit "chain word" shape used by three different fields across the two record types
   above: uw_object_hdr_t.next (word 0x04), uw_object_hdr_t.link (word 0x06), and uw_tile_t.obj_head
   (word 0x02) are all a 6-bit field the caller already knows the meaning of (quality/owner/wall_tex)
   packed with a 10-bit object-slot-chain index in bits 6-15. object_list_insert_head/
   object_list_unlink/object_list_append_tail/resolve_object_link (objects.c) all take a raw pointer
   to one of these three words interchangeably -- that's why they're still byte-pointer/ushort-
   pointer parameters rather than uw_object_hdr_t-pointer/uw_tile_t-pointer, since a bitfield
   member has no address to pass. This
   type lets their own internal bit math read as a named field instead, without changing any call
   site's pointer arithmetic (object+4, object+6, tile_ptr+1, ... all stay exactly as they are). */
typedef struct __attribute__((packed)) {
    unsigned short low6  : 6;  /* preserved field: quality / owner / wall_tex, meaning depends on which word this is */
    unsigned short chain : 10; /* bits 6-15: next/link/obj_head object-slot-chain index */
} uw_chain_word_t;

/* 0xd (13)-byte comobj.dat per-object-type property record. DAT_00202c90_backing is the flat array
   (base DAT_00202c90, stride 0xd), indexed by an object's type id (obj_hdr.item_id & 0x1ff). */
typedef struct __attribute__((packed)) {
    unsigned char _unk00;        /* offset 0x00: a numeric stat (fed into ordint_divmod/roll-style calls in several places) -- not yet confirmed */

    /* offsets 0x01-0x02: 16-bit little-endian packed field (read as `*(ushort*)(&DAT_00202c91 +
       type*0xd)` at several call sites). */
    unsigned short collision_radius : 3; /* bits 0-2 (&7): CONFIRMED -- a symmetric collision/placement half-width in eighths-of-a-tile, read identically (and always as a plain radius, never a lookup index) by collision_add_candidate_object/collision_sample_floor_height (src/collision.c), the tile-boundary-crossing check in emit_tile_features (src/tmap.c, "& 8"-gated block a few lines below), src/ai.c, src/combat.c, src/movement.c and src/object_actions.c. Independently corroborated by uw1-decomp's own from-scratch disassembly of the original DOS binary, which names the analogous player-entity field "the player's radius word" and confirms it is consumed as a plain radial distance (collision.json: "wall_rest_is_radius_determined"). */
    unsigned short _unk01_b3        : 1; /* bit 3 (&8): confirmed used as a standalone flag gating a billboard/sprite-partition branch in src/tmap.c (`(&DAT_00202c91)[type*0xd] & 8`), not yet named */
    unsigned short unit_weight       : 12; /* bits 4-15 (the remaining 4 bits of offset 0x01 plus all of offset 0x02): CONFIRMED -- src/objects.c's calculate_object_weight (was FUN_00046260) names this exact `>>4` value its own "per-class base weight", multiplied by quantity for stackable items or summed with container contents */

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

/* ~0x2e-byte "current view" scratch record: the screen-space eye/ camera transform (world
   x/y/elevation, facing, and a camera-shake offset pair), written once per frame by
   update_current_view_from_subject from the live player state -- or... */
// was FUN_00069470
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


void emit_object_billboard();


#define ordint_divmod_exref ((void*)&ordint_divmod)

/* Declarations for the functions and owned globals that used to live directly in this file but were
   split out into their own topic .c files this session... */
#include "helpers.h"
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
#include "audio.h"
#include "registration.h"
#include "scheduler.h"
#include "traps.h"
#include "main.h"
#include "demomode.h"

/* .E model-parser globals (g_model_known_ext_colors/g_model_parse_point_count/
   g_model_parse_part_count and ~190 bare-literal-address DAT_xxx/string constants)... */

#endif /* UW_H */
