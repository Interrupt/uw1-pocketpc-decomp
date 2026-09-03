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

/* Forward declaration needed because FUN_00041708 (much earlier in uw.c)
   calls this before its own definition later in the file -- see its
   definition, right after FUN_00076a2c, for why it exists. */
void *uw_alloc_grtile();

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




void FUN_00011000();
void FUN_00011040();
void FUN_00011060();
int FUN_000112a0();
undefined4 FUN_000112fc();
void FUN_000113b4();
undefined4 FUN_00011478();
void FUN_000114e4();
void FUN_0001156c();
void set_draw_color();
void FUN_000116a4();
void FUN_000116dc();
void rect_fill_or_save_restore();
void FUN_00011b34();
void FUN_00011c10();
void bitmap_blit_to_framebuffer();
void FUN_000120c8();
void FUN_000122d4();
void FUN_00012444();
void FUN_000125a8();
void FUN_00012850();
void FUN_00012948();
void FUN_0001294c();
void thunk_FUN_0003c310();
void FUN_00012958();
undefined4 FUN_00012970();
undefined8 FUN_000129d4();
byte *FUN_000129f8();
uint FUN_000130e0();
void FUN_00013108();
void FUN_00013170();
void FUN_000132c4();
int FUN_00013774();
void FUN_000137c0();
void FUN_00013904();
void FUN_00013b8c();
void FUN_0001422c();
void FUN_00014258();
void FUN_00014294();
void FUN_00014324();
void FUN_0001433c();
void FUN_00014350();
int FUN_00014868();
void FUN_000148c8();
void FUN_00014ef4();
void FUN_0001548c();
bool FUN_00015870();
byte FUN_00015a58();
bool FUN_00015b94();
undefined2 FUN_0001613c();
int FUN_0001629c();
void FUN_00016354();
undefined4 FUN_00016434();
undefined4 FUN_000164e4();
void FUN_0001651c();
void FUN_000165bc();
void FUN_000165d0();
undefined4 FUN_000167d4();
void FUN_00016940();
void FUN_00016948();
void FUN_00016c70();
char *FUN_00016d7c();
void FUN_00016ef8();
void FUN_0001765c();
void FUN_00017768();
void FUN_0001786c();
void FUN_00017908();
void FUN_00017b38();
void FUN_00017be8();
void FUN_00017c1c();
undefined1 FUN_00017e10();
undefined1 FUN_00017e90();
undefined4 FUN_00017eec();
ushort FUN_000181a4();
void FUN_00018230();
void FUN_0001825c();
void FUN_000182b4();
undefined1 FUN_00018370();
undefined4 FUN_00018430();
void FUN_0001853c();
void FUN_000188fc();
uint *FUN_00018ac8();
void FUN_00018ccc();
int FUN_00018f34();
undefined4 FUN_00019120();
void FUN_0001927c();
undefined4 FUN_00019470();
void FUN_00019660();
int FUN_000196c0();
bool FUN_000196e8();
undefined4 FUN_000197c0();
undefined4 FUN_000197fc();
void FUN_000198e8();
void FUN_0001998c();
int FUN_000199d4();
int FUN_00019a80();
undefined4 FUN_00019aa0();
int FUN_00019d00();
undefined4 FUN_00019e58();
void FUN_0001a1a4();
undefined4 FUN_0001a1c8();
void FUN_0001a5bc();
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
int FUN_0001ada8();
int FUN_0001adc4();
void FUN_0001ade4();
int FUN_0001ae04();
void FUN_0001ae28();
void FUN_0001aebc();
void FUN_0001afe4();
void FUN_0001b0a4();
void FUN_0001b288();
void FUN_0001b474();
void FUN_0001b7c0();
void FUN_0001b89c();
int FUN_0001b900();
int FUN_0001b9a4();
void FUN_0001ba48();
void FUN_0001baa0();
void FUN_0001bb04();
undefined4 FUN_0001bef4();
void FUN_0001bf9c();
void FUN_0001c1c8();
void FUN_0001c268();
undefined4 FUN_0001c2c4();
void FUN_0001c420();
undefined4 FUN_0001c538();
undefined4 FUN_0001c57c();
void FUN_0001c79c();
void FUN_0001c85c();
undefined4 FUN_0001ca78();
void FUN_0001cd3c();
int FUN_0001cf20();
undefined4 FUN_0001cfa8();
int FUN_0001d170();
int FUN_0001d1c0();
void FUN_0001d258();
void FUN_0001d3ac();
undefined4 FUN_0001da00();
undefined4 FUN_0001da88();
undefined4 FUN_0001dab8();
undefined4 FUN_0001dc04();
void FUN_0001dd2c();
void FUN_0001de0c();
void FUN_0001dfe8();
void FUN_0001e274();
void FUN_0001e594();
void FUN_0001e6f0();
void FUN_0001e848();
void FUN_0001ecb0();
void FUN_0001f370();
void FUN_00020370();
void FUN_00020a74();
undefined4 FUN_000226e8();
undefined4 FUN_0002273c();
bool FUN_000227b8();
undefined4 FUN_000227d4();
undefined4 FUN_00022810();
undefined4 FUN_00022850();
undefined4 FUN_0002285c();
undefined4 FUN_00022884();
uint FUN_000228ac();
void FUN_000228d4();
undefined4 FUN_00022910();
uint FUN_0002294c();
undefined *FUN_0002295c();
undefined *FUN_00022998();
void FUN_000229e0();
void FUN_00022abc();
void FUN_00022b54();
void FUN_00022f0c();
void FUN_0002310c();
void FUN_000232b0();
void FUN_000232ec();
undefined4 FUN_000238b4();
void FUN_00023a00();
void FUN_00023b38();
int FUN_00023c90();
void FUN_00023cdc();
void FUN_00023de8();
undefined4 FUN_0002431c();
uint FUN_0002454c();
uint FUN_00024840();
undefined4 character_generator_loop();
int FUN_00025608();
undefined4 FUN_000259a0();
void FUN_000259c0();
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
void FUN_00028c00();
void FUN_00028ffc();
int FUN_00029358();
void FUN_000295b4();
void FUN_00029708();
void FUN_0002977c();
void FUN_000297dc();
void FUN_00029850();
undefined4 FUN_000298d8();
int FUN_0002990c();
undefined4 FUN_000299b0();
int FUN_00029a58();
bool FUN_00029b60();
undefined4 FUN_00029cc8();
undefined4 FUN_00029e34();
void FUN_00029f38();
void FUN_00029f4c();
undefined4 FUN_00029fb0();
ushort FUN_0002a1fc();
byte FUN_0002a258();
undefined4 FUN_0002a27c();
void FUN_0002a2c8();
undefined4 FUN_0002a35c();
void FUN_0002a8e0();
bool FUN_0002af88();
void FUN_0002b258();
int FUN_0002b47c();
void FUN_0002b63c();
int FUN_0002b7a0();
undefined4 FUN_0002b960();
undefined4 FUN_0002bbec();
undefined4 FUN_0002bc9c();
undefined4 FUN_0002bd70();
undefined4 FUN_0002bdac();
undefined4 FUN_0002c8e0();
undefined4 FUN_0002cb14();
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
void FUN_0002e58c();
void FUN_0002ee80();
void FUN_0002efa0();
void FUN_0002f124();
void FUN_0002f818();
void FUN_0002fba8();
void FUN_0002fcec();
void FUN_0002ff94();
undefined4 FUN_00030364();
void FUN_00030874();
undefined4 FUN_00030aac();
undefined4 FUN_00030be0();
undefined4 FUN_00030e50();
void FUN_00030fe8();
void FUN_00031214();
uint FUN_000318d8();
void FUN_00031a94();
void FUN_00031dbc();
void FUN_00031fa8();
undefined4 FUN_00032180();
undefined4 FUN_00032410();
undefined4 FUN_0003276c();
int FUN_0003298c();
void FUN_00032aa4();
undefined4 FUN_00032d38();
void FUN_00033880();
undefined4 FUN_00034044();
undefined4 FUN_00034270();
int FUN_0003431c();
void FUN_000343d8();
void FUN_000344a4();
undefined4 FUN_000345b8();
undefined4 FUN_00034634();
undefined4 FUN_000346a0();
undefined4 FUN_0003495c();
void FUN_000349bc();
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
void FUN_0003bc40();
void FUN_0003bcb8();
void FUN_0003bd50();
void FUN_0003bee4();
void FUN_0003c038();
undefined4 FUN_0003c194();
void FUN_0003c310();
void FUN_0003c318();
void FUN_0003c3b4();
void FUN_0003c3c8();
void FUN_0003c4a8();
bool FUN_0003c4dc();
void FUN_0003c524();
void FUN_0003c6ac();
undefined4 FUN_0003c7f4();
void FUN_0003ce04();
void FUN_0003cff8();
void FUN_0003d438();
void FUN_0003d94c();
void FUN_0003dba0();
void FUN_0003dbd8();
void FUN_0003dc04();
void FUN_0003dc6c();
void FUN_0003dc78();
void FUN_0003dca4();
void FUN_0003def4();
void FUN_0003df28();
void FUN_0003e0b4();
void FUN_0003e2a4();
void FUN_0003e404();
void FUN_0003e44c();
void FUN_0003e4cc();
void FUN_0003e644();
undefined4 FUN_0003e694();
uint FUN_0003e83c();
undefined4 FUN_0003e8b0();
ushort *FUN_0003ec00();
void FUN_0003ed6c();
void FUN_0003ee10();
void FUN_0003ee90();
void FUN_0003f128();
void thunk_FUN_00048764();
void FUN_0003f14c();
void FUN_0003f2c4();
void FUN_0003f368();
void FUN_0003f420();
void FUN_0003f648();
void FUN_0003f7e0();
void FUN_0003f95c();
void FUN_0003f99c();
void FUN_0003fa1c();
void FUN_0003faa0();
void FUN_0003fd14();
void FUN_0003ff10();
void FUN_00040004();
void FUN_000400a0();
bool FUN_000400dc();
undefined4 FUN_00040130();
undefined4 FUN_00040160();
void FUN_00040440();
undefined4 FUN_000404a0();
undefined4 FUN_00040770();
undefined4 FUN_0004083c();
void *FUN_000408fc();
void FUN_00040918();
char *FUN_000409f8();
uint FUN_00040aa8();
void FUN_00040b0c();
void FUN_00040bc0();
void FUN_00040be0();
int FUN_00040c5c();
undefined4 FUN_00040cd4();
bool FUN_00040d00();
void thunk_FUN_00057118();
void FUN_00040df0();
bool FUN_00040e24();
bool FUN_00040efc();
void FUN_00040f34();
void FUN_00040f64();
void FUN_000411b8();
void FUN_000411cc();
void FUN_000411e0();
void FUN_00041210();
undefined4 FUN_00041260();
undefined4 FUN_00041304();
void FUN_000414c8();
uint FUN_000414f4();
bool FUN_00041708();
undefined4 FUN_00041770();
uint FUN_000417b4();
undefined4 FUN_00041910();
undefined4 FUN_00041960();
undefined4 FUN_00041990();
undefined4 FUN_000419c8();
void FUN_00041a18();
undefined4 FUN_00041a78();
undefined4 FUN_00041aac();
void FUN_00041db0();
void FUN_00041e40();
void FUN_00041f34();
void FUN_00041fe4();
int FUN_0004202c();
int FUN_0004213c();
void FUN_0004221c();
void FUN_0004251c();
void FUN_00042758();
void FUN_00042870();
void FUN_00042a44();
void FUN_00042aa8();
void FUN_00042b38();
void FUN_00042c5c();
void FUN_00042d70();
void FUN_00042e30();
void FUN_00043100();
void FUN_00043614();
void FUN_0004365c();
undefined4 FUN_00043734();
bool FUN_00043b78();
void FUN_00043d40();
void FUN_00043e20();
bool FUN_00043fd8();
void FUN_000440d0();
void FUN_000441d8();
int FUN_00044294();
int FUN_000442bc();
void FUN_000442dc();
void FUN_00044398();
void FUN_000444b0();
void FUN_00044538();
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
undefined4 FUN_00045054();
undefined4 FUN_0004506c();
int FUN_000451b0();
ushort *FUN_000452dc();
int FUN_00045538();
undefined4 FUN_00045678();
undefined4 FUN_00045708();
void FUN_00045720();
void FUN_00045728();
undefined4 FUN_00045730();
undefined4 FUN_000459d8();
undefined4 FUN_00045a7c();
undefined4 FUN_00045b20();
ushort *FUN_00045b48();
undefined4 FUN_00045f9c();
undefined4 FUN_00046030();
uint FUN_00046260();
bool FUN_00046358();
void FUN_0004638c();
void FUN_00046414();
void FUN_000465c8();
void FUN_00046698();
void FUN_00046a94();
undefined4 FUN_00046b88();
void FUN_00046bfc();
void FUN_00046eec();
void FUN_00046ff4();
undefined1 *FUN_000470fc();
uint FUN_000472c4();
void FUN_00047a7c();
undefined4 FUN_00047ae0();
undefined4 FUN_00047b38();
undefined4 FUN_00047cfc();
void FUN_00048110();
void FUN_00048198();
bool FUN_00048514();
int FUN_000485f4();
void FUN_00048764();
undefined4 FUN_00048b6c();
undefined4 FUN_00048bf0();
void FUN_00048e8c();
void FUN_00049008();
void FUN_000492bc();
void FUN_000493cc();
void FUN_00049404();
void FUN_000495d0();
undefined4 FUN_000496b0();
void FUN_000497cc();
void FUN_00049818();
void FUN_00049924();
undefined4 FUN_00049940();
void FUN_00049948();
undefined4 FUN_0004994c();
undefined4 FUN_00049954();
void FUN_0004995c();
undefined4 FUN_00049960();
void FUN_000499a4();
int FUN_000499c0();
int FUN_00049b04();
void FUN_00049c64();
uint FUN_00049cc0();
void FUN_00049ce8();
int FUN_00049db8();
int FUN_00049eb8();
int FUN_00049fb4();
void FUN_0004a02c();
bool FUN_0004a110();
void FUN_0004a210();
void FUN_0004a510();
bool FUN_0004a588();
undefined4 FUN_0004a69c();
void FUN_0004ac98();
ushort *FUN_0004ad10();
undefined4 FUN_0004b288();
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
uint FUN_00050984();
int FUN_00050aa8();
bool FUN_00050b30();
bool FUN_00050c18();
void FUN_00050d78();
void FUN_00051320();
void FUN_00051658();
void FUN_000518c0();
void FUN_00051cf8();
void FUN_00051dd0();
undefined4 FUN_00051fa0();
undefined4 FUN_000522f0();
void FUN_000523d0();
undefined4 FUN_00052450();
undefined4 FUN_00052674();
undefined4 FUN_000528a8();
void FUN_00052960();
undefined4 FUN_00052af4();
undefined4 FUN_00052bac();
undefined4 FUN_00052c5c();
undefined4 FUN_00052d24();
void FUN_00052d68();
int FUN_00052f28();
void FUN_00053004();
void FUN_000530c4();
void FUN_000531a0();
void FUN_00053274();
ushort *FUN_00053334();
void FUN_000533e4();
void FUN_000534a8();
int FUN_00053514();
int FUN_0005358c();
int FUN_000535fc();
int FUN_00053644();
undefined4 FUN_00053728();
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
void FUN_00054a00();
undefined4 FUN_00054f6c();
ushort *FUN_00055610();
void FUN_0005578c();
ushort *FUN_0005596c();
void FUN_00055ef8();
ushort *FUN_00055f98();
void FUN_000564f8();
void FUN_00056640();
void FUN_00056688();
void FUN_000566dc();
void FUN_00056724();
void FUN_000567c0();
void FUN_000567ec();
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
undefined4 FUN_00056f28();
int FUN_00056fe8();
undefined4 FUN_000570b4();
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
void FUN_00057604();
int FUN_000576d0();
void FUN_00057788();
void FUN_000577f0();
int FUN_00057888();
undefined4 FUN_000578fc();
uint FUN_00057904();
uint FUN_000579e4();
undefined4 FUN_00057a70();
undefined4 FUN_00057a78();
int FUN_00057a80();
int FUN_00057af0();
void FUN_00057bb0();
void FUN_00057c5c();
void FUN_00057cac();
undefined4 FUN_00057d1c();
void FUN_00057dc0();
void FUN_00057e54();
void FUN_00057ff0();
void FUN_00058438();
void FUN_000584c0();
void FUN_0005857c();
void FUN_00058734();
uint FUN_00058738();
void FUN_0005878c();
void FUN_00058878();
void FUN_0005898c();
undefined4 FUN_00058e08();
void FUN_0005932c();
void FUN_000593c0();
void FUN_00059488();
int FUN_000595d4();
undefined4 FUN_0005989c();
void FUN_00059b7c();
void FUN_00059c38();
void FUN_00059d20();
undefined4 FUN_0005a348();
undefined4 FUN_0005a550();
uint FUN_0005a630();
uint FUN_0005a6bc();
void FUN_0005ad18();
undefined4 FUN_0005aea0();
undefined4 FUN_0005b010();
undefined4 FUN_0005b054();
bool FUN_0005b188();
undefined4 FUN_0005b298();
void FUN_0005b36c();
void FUN_0005b514();
void FUN_0005b660();
void FUN_0005b758();
void FUN_0005b828();
void FUN_0005b890();
void FUN_0005b8ac();
void FUN_0005bac0();
void FUN_0005bb5c();
void FUN_0005bbe0();
undefined4 FUN_0005bc38();
void FUN_0005bdcc();
void FUN_0005bf40();
void FUN_0005c0c4();
void FUN_0005c16c();
undefined4 FUN_0005c214();
undefined4 FUN_0005c70c();
void FUN_0005cacc();
void FUN_0005cf74();
void FUN_0005d13c();
void FUN_0005d290();
void FUN_0005d2ac();
void FUN_0005d2b0();
void FUN_0005d704();
void FUN_0005d9cc();
void FUN_0005dd84();
void FUN_0005debc();
void FUN_0005dff4();
void FUN_0005e12c();
void FUN_0005e3c0();
void FUN_0005e604();
void FUN_00060aa0();
void FUN_00061e60();
void FUN_00064384();
void FUN_00064d34();
void FUN_00064e3c();
void FUN_00064ec8();
void FUN_00064f10();
void FUN_0006508c();
void FUN_00065128();
void FUN_00065210();
void FUN_000652e8();
void FUN_00065348();
void FUN_00065394();
void FUN_00065b90();
void FUN_00065d4c();
void FUN_00065eb4();
void FUN_00065ff0();
void FUN_000660d4();
undefined4 FUN_000661b0();
void FUN_000664bc();
void FUN_00066594();
void FUN_00066634();
int FUN_0006674c();
void FUN_000667cc();
void FUN_00066c90();
void FUN_00066cb4();
void FUN_00066e90();
void FUN_0006764c();
void FUN_000678e0();
void FUN_00067950();
void FUN_000679f4();
void FUN_00067a44();
void FUN_00067b98();
void FUN_00067d10();
void FUN_00067e2c();
void FUN_00067e40();
void FUN_00067f1c();
int FUN_00068100();
undefined4 FUN_00068138();
void FUN_00068260();
void FUN_000682f0();
void FUN_000685e8();
void FUN_00068884();
void FUN_000689a0();
void FUN_00068ad4();
void FUN_00068c1c();
void FUN_00068cac();
void FUN_0006907c();
void FUN_00069424();
void FUN_00069470();
void FUN_00069938();
undefined4 FUN_00069b68();
void FUN_00069bd0();
void FUN_00069e30();
bool FUN_00069eb0();
void FUN_00069f2c();
void FUN_0006a034();
int FUN_0006a058();
bool FUN_0006a0c8();
void FUN_0006a168();
void FUN_0006a1c4();
void FUN_0006a200();
void FUN_0006a3d8();
int FUN_0006ac38();
int FUN_0006af3c();
undefined4 FUN_0006b178();
undefined2 FUN_0006b3dc();
int FUN_0006b408();
undefined4 FUN_0006b448();
undefined4 FUN_0006b718();
void FUN_0006b838();
void FUN_0006b8c0();
void FUN_0006b920();
undefined4 FUN_0006b980();
undefined4 FUN_0006ba54();
undefined4 FUN_0006baf8();
undefined4 FUN_0006bb64();
int FUN_0006bc28();
undefined4 FUN_0006bcd4();
void FUN_0006bde0();
void FUN_0006bfec();
undefined4 FUN_0006c0c0();
undefined4 FUN_0006c264();
undefined4 FUN_0006c560();
undefined4 FUN_0006c670();
int FUN_0006c79c();
void FUN_0006c834();
undefined4 FUN_0006c98c();
void FUN_0006ca4c();
void FUN_0006cb74();
void FUN_0006cbf0();
void FUN_0006cca8();
void thunk_FUN_0006edb8();
void FUN_0006cff4();
void FUN_0006d284();
void FUN_0006d4a4();
void FUN_0006d894();
void FUN_0006df70();
void FUN_0006e038();
void FUN_0006e130();
void FUN_0006e1d4();
void FUN_0006e360();
byte FUN_0006e3ac();
void FUN_0006e554();
void FUN_0006e648();
bool FUN_0006e89c();
void FUN_0006e96c();
void FUN_0006ea54();
void FUN_0006eb64();
void FUN_0006ed0c();
void FUN_0006edb8();
bool FUN_0006edfc();
void FUN_0006f6e0();
void FUN_0006fa28();
void FUN_0006fcb0();
void FUN_0006fea4();
void FUN_0006fed4();
void FUN_0006fee8();
void FUN_0006ff08();
void FUN_00070118();
void FUN_00070224();
undefined4 FUN_000703a0();
void FUN_00070464();
undefined4 FUN_00070524();
void FUN_00070548();
undefined4 FUN_0007067c();
void FUN_000707c8();
void FUN_0007080c();
void FUN_000708bc();
void FUN_00070c90();
undefined4 FUN_0007129c();
void FUN_0007141c();
void FUN_00071510();
undefined4 FUN_00071b08();
void FUN_00071b94();
undefined4 FUN_00071e20();
bool FUN_00072084();
void FUN_0007213c();
void FUN_00072288();
undefined4 FUN_00072598();
undefined4 FUN_0007266c();
undefined4 FUN_00072910();
void FUN_00072aac();
undefined1 FUN_00072b2c();
undefined4 FUN_00072b3c();
undefined4 FUN_00072b58();
void FUN_00072b74();
void FUN_00072c10();
void FUN_00072c44();
undefined4 FUN_00072c74();
undefined4 FUN_00072f30();
undefined4 FUN_00072fc8();
void FUN_0007305c();
void thunk_FUN_00072c44();
uint FUN_00073064();
void FUN_00073140();
void FUN_0007328c();
undefined4 FUN_00073474();
void FUN_0007355c();
void FUN_00073560();
void FUN_000735b0();
void FUN_000735c0();
void FUN_000735fc();
void FUN_00073634();
bool FUN_00073870();
undefined4 FUN_000738ac();
undefined4 FUN_000738bc();
undefined4 FUN_000738c4();
void FUN_00073ac0();
bool FUN_00073ac4();
void FUN_00073aec();
void FUN_00073b0c();
byte FUN_00073b18();
void FUN_00073b40();
undefined4 FUN_00073b74();
void FUN_00073e14();
void FUN_00073ec0();
void FUN_00073f60();
void FUN_00073fc4();
void FUN_00074028();
void FUN_000740b0();
int FUN_00074150();
undefined4 FUN_000741f0();
undefined4 FUN_000742c0();
undefined4 FUN_00074380();
bool FUN_00074474();
undefined4 FUN_000744e0();
undefined4 FUN_0007455c();
undefined4 FUN_00074614();
void FUN_000746b0();
void FUN_000746d4();
void FUN_000746f8();
void FUN_0007471c();
void FUN_00074ad0();
void FUN_00074be8();
void FUN_00074c64();
void FUN_00074cc8();
void FUN_00074d20();
undefined4 FUN_00075248();
void FUN_000753a0();
void FUN_0007541c();
void FUN_000756c8();
void FUN_00075808();
void FUN_00075a88();
undefined4 FUN_00075be0();
void FUN_00075cb8();
int FUN_00076078();
int FUN_00076194();
undefined4 FUN_000762c4();
undefined4 FUN_00076338();
undefined4 FUN_00076390();
undefined4 FUN_00076404();
undefined4 FUN_00076488();
void FUN_00076508();
undefined4 FUN_0007699c();
void FUN_000769e8();
undefined4 FUN_00076a2c();
undefined4 FUN_00076b24();
undefined4 FUN_00076b8c();
undefined4 FUN_00076e98();
undefined4 FUN_00077004();
void FUN_000773ac();
undefined4 FUN_00077408();
undefined4 FUN_00077860();
void FUN_00077868();
void FUN_00077878();
undefined4 FUN_000778fc();
undefined4 FUN_00077a38();
undefined4 FUN_00077b2c();
undefined4 FUN_00077dd0();
void FUN_00077f30();
void FUN_0007802c();
void FUN_00078088();
void FUN_00078118();
void FUN_000781a0();
void FUN_0007821c();
void FUN_0007830c();
void FUN_00078434();
void FUN_00078550();
undefined4 FUN_0007856c();
void thunk_FUN_00078e28();
char *FUN_0007863c();
int FUN_0007873c();
uint FUN_00078918();
void FUN_00078a04();
undefined4 FUN_00078b18();
undefined1 *FUN_00078bfc();
void FUN_00078c80();
void FUN_00078c94();
undefined4 FUN_00078d18();
void FUN_00078e28();
undefined1 *FUN_00078e60();
undefined1 FUN_0007907c();
int FUN_000790e0();
undefined4 FUN_00079144();
void FUN_0007931c();
void FUN_00079350();
void FUN_0007955c();
void FUN_000795cc();
void FUN_00079784();
void FUN_000798c4();
ushort *FUN_00079984();
bool FUN_00079d08();
short *FUN_00079dec();
void FUN_00079e64();
void FUN_00079f1c();
void FUN_00079f90();
void FUN_00079ff0();
void FUN_0007a0cc();
void FUN_0007a180();
void FUN_0007a198();
void FUN_0007a3a8();
void FUN_0007a418();
void FUN_0007a478();
undefined4 FUN_0007a53c();
void FUN_0007a598();
void FUN_0007a704();
void FUN_0007a7fc();
void FUN_0007a990();
void FUN_0007abbc();
undefined4 FUN_0007acd4();
void FUN_0007b2f0();
void FUN_0007b5a4();
void FUN_0007b72c();
void FUN_0007baf0();
void FUN_0007bcdc();
undefined4 FUN_0007bf38();
undefined4 FUN_0007c1bc();
void FUN_0007c2ec();
void FUN_0007c3f4();
void FUN_0007c4a8();
void FUN_0007c580();
void FUN_0007c708();
void FUN_0007c814();
void FUN_0007c84c();
void FUN_0007c93c();
void FUN_0007ca0c();
undefined4 FUN_0007ca50();
void FUN_0007cc30();
void FUN_0007cc78();
uint FUN_0007cdbc();
undefined4 FUN_0007d074();
int FUN_0007d0b0();
void FUN_0007deec();
void FUN_0007dfd8();
undefined4 FUN_0007e0d8();
undefined4 FUN_0007e12c();
undefined4 FUN_0007e2dc();
void FUN_0007e558();
void FUN_0007e610();
undefined4 FUN_0007e694();
undefined4 FUN_0007e6e0();
void FUN_0007e778();
void FUN_0007e85c();
void FUN_0007e998();
void FUN_0007e99c();
void FUN_0007e9c4();
void FUN_0007ea30();
void FUN_0007ea34(char *param_1, ...);
void FUN_0007ea44();
void FUN_0007eb34();
void FUN_0007eb70();
void FUN_0007ec1c();
undefined4 FUN_0007ec50();
char FUN_0007ec58();
void FUN_0007ed20();
undefined4 FUN_0007edec();
bool FUN_0007edf4();
bool FUN_0007ee4c();
short FUN_0007ee9c();
int FUN_0007ef78();
void FUN_0007f044();
void FUN_0007f094();
void FUN_0007f0e0();
void FUN_0007f110();
void FUN_0007f140();
void FUN_0007f170();
undefined4 FUN_0007f208();
undefined4 FUN_0007f290();
void FUN_0007f340();
void FUN_0007f454();
int FUN_0007f570();
void FUN_0007f6fc();
void FUN_0007f770();
void FUN_0007f7cc();
void FUN_0007fb2c();
void FUN_0007fc8c();
void FUN_0007fce8();
void FUN_0007fe20();
void FUN_0007fee8();
undefined4 FUN_0007ffa8();
undefined4 FUN_00080828();
void FUN_0008097c();
void FUN_000809cc();
void FUN_00080a98();
void FUN_00080e00();
uint FUN_00080ed4();
void FUN_00081034();
void FUN_0008128c();
void FUN_00081388();
undefined4 FUN_000816e0();
undefined4 FUN_00081814();
int FUN_000819f0();
int FUN_00081a84();
void FUN_00081abc();
undefined4 FUN_00081af4();
undefined4 FUN_00081ce4();
undefined4 FUN_00081d74();
void entry(undefined4 param_1,undefined4 param_2,undefined4 param_3,undefined4 param_4);
void FUN_00082328();
void FUN_00082358();
void FUN_00082388();
undefined4 FUN_00082448();
undefined4 FUN_000824f0();


/* --- auto-generated overlap/exref aliases --- */
#define _DAT_00085bf0 (*(uint*)&DAT_00085bf0)
#define _DAT_00086999 (*(uint*)&DAT_00086999)
#define _DAT_0008699b (*(uint*)&DAT_0008699b)
#define _DAT_0008699f (*(uint*)&DAT_0008699f)
#define _DAT_000869a1 (*(uint*)&DAT_000869a1)
#define _DAT_00202978 (*(uint*)&DAT_00202978)
#define _DAT_00202bfb (*(uint*)&DAT_00202bfb)
#define _DAT_00202c00 (*(uint*)&DAT_00202c00)
#define _DAT_00202c05 (*(uint*)&DAT_00202c05)
#define _DAT_002035cf (*(uint*)&DAT_002035cf)
#define _DAT_002048a1 (*(uint*)&DAT_002048a1)
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
