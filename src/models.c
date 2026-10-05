/* The 3D "catalog object" model-rendering pipeline: animation-record
 * ticking (resolving a catalog index to its real .E model geometry),
 * emitting a catalog object (door, bridge, decal, sign) as textured
 * model geometry, and door animation-frame emission. Split out of
 * uw.c (the original monolithic decompile) once these functions' real
 * roles were confirmed.
 */
#include "headers/models.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Widened from 32768: load_3d_object_models does
   `ce_memmove(&DAT_00189590,&DAT_00110ff0,0x78580);` (a 492928-byte
   memmove, confirmed by ASAN global-buffer-overflow), matching
   DAT_00189590's own size (985856, an earlier widening pass already
   caught the destination but missed this source).

   Sizing pass: traced 985856's own history back to its first-ever
   widening (commit ac76d8f) -- no comment anywhere ever derived that
   number from anything; every later fix (including this file's own
   comment above) just matched it without re-deriving it. The one
   concrete, confirmed figure in this whole chain is the memmove's own
   literal 0x78580 (492928) byte count -- a fixed constant baked into
   load_3d_object_models, copied unconditionally on every model load
   regardless of which level/model set is active, so it's the real
   size in the original binary, not an estimate. 985856 is exactly
   double that. Shrunk both this array and DAT_00189590_backing below
   to 0x80000 (524288), comfortable headroom above the confirmed need
   without preserving an unexplained 2x. */
static undefined DAT_00110ff0_backing[524288];
#define DAT_00110ff0 DAT_00110ff0_backing[0]
/* Sizing-audit pass: DAT_00110ffc/DAT_0018959c-f's only use is inside
   tick_anim_record's dead legacy address-walk (the same one documented
   at DAT_00110ff0/DAT_00189590's own comment above) -- indexed by
   `catalog*0x3c2c`, which would be a severe overflow against these
   256-byte arrays for any catalog>0, EXCEPT that path is gated behind
   `catalog>0 && catalog<30 && g_anim_model_slot[catalog]!=0`, which
   intercepts every real catalog value before this code ever runs (see
   that comment's own trace). Confirmed dead with real data; left
   as-is rather than resizing dead code. */
static undefined DAT_00110ffc_backing[256];
#define DAT_00110ffc DAT_00110ffc_backing[0]
static undefined1 DAT_00189590_backing[524288];
#define DAT_00189590 DAT_00189590_backing[0]
static undefined DAT_0018959c_backing[256];
#define DAT_0018959c DAT_0018959c_backing[0]
static undefined DAT_0018959d_backing[256];
#define DAT_0018959d DAT_0018959d_backing[0]
static undefined DAT_0018959e_backing[256];
#define DAT_0018959e DAT_0018959e_backing[0]
static undefined DAT_0018959f_backing[256];
#define DAT_0018959f DAT_0018959f_backing[0]
/* Live-tunable door-frame anchor constants (UW_MODEL_TUNER=1) -- see the
   wall-plane fix in emit_catalog_object's own catalog_u==1 block. Three
   real regressions already came from guessing these numbers, rebuilding,
   and only then finding out live whether a guess was right; this lets
   the door panel show tunable rows so a value can be nudged and watched
   change on screen the same frame, with no rebuild. g_tune_wide_center
   is the wide/along-the-wall axis's offset from the tile's own origin;
   g_tune_edge_offset is the wall-perpendicular axis's offset from
   whichever tile edge it's nearest. Live QA confirmed both at 128.0 --
   i.e. the "wall has real thickness, the perpendicular axis sits at
   edge+16" theory (tried and initially reported as an improvement) was
   itself wrong; the real answer is simpler, exact tile center on BOTH
   axes, no wall-thickness concept needed. At edge_offset==128 the near/
   far edge-side branch in the fix below collapses to the same value
   either way (128 or 256-128), so this is equivalent to just always
   centering -- kept as two separately-tunable fields anyway in case a
   future model (not a full-tile-wide one like DFRAME.E) genuinely needs
   something else. */
static double g_tune_wide_center = 128.0;
static double g_tune_edge_offset = 128.0;
/* QA report: "rotation origin is in the middle of the leaf and not the
   hinge, so rotation looks off." The leaf (catalog_u==0xe/0xf, DOOR.E)
   currently shares DFRAME's own anchor exactly (DAT_0023b904/920, set
   once by the catalog_u==1 block above and simply left in place for
   the leaf's own later, separate call to reuse) -- correct for a
   symmetric, full-tile-wide, non-rotating object like the frame, but
   DOOR.E's own local mesh (POINTS span local X 0-128, not symmetric
   around 0) rotates around whatever world point its local origin
   lands on, so sharing the frame's centered anchor puts that pivot
   roughly mid-leaf instead of at the hinge edge. Not yet live-tuned to
   a confirmed-correct value (unlike wide_center/edge_offset above,
   which WERE) -- starts at 0.0 (no change from current behavior) and
   is meant to be nudged live via the object tuner panel (backtick)
   while watching a real door swing, the same successful process
   wide_center/edge_offset themselves were dialed in with, rather than
   guessed and hardcoded blind. Applied along the model's own "wide"
   axis (the same one wide_center offsets) in the leaf-specific rebake
   a few hundred lines below. */
static double g_tune_leaf_hinge_offset = 0.0;
/* General object-tuner state (UW_MODEL_TUNER=1) -- was door-only (the
   panel only populated inside catalog_u==1, and only showed the two
   door-anchor fields above); generalized so ANY catalog this session's
   native mesh path draws (boulder, bridge, door, ...) gets a live panel
   whenever it's on screen, per direct request: "convert the door debug
   tool to a general object debug tool so we can try giving the object
   a rotation offset and view it from all angles." g_tune_rotation_offset
   is added directly to the model's own real final rotation angle
   (sVar13, degrees) right before build_euler_rotation_matrix runs, so
   walking around a normally-facing object and nudging this field is
   equivalent to spinning the OBJECT rather than the camera -- useful
   for exactly the kind of "does this face-order bug only show from
   certain angles" question that motivated adding it. g_tune_last_catalog
   resets the offset to 0 whenever the catalog on screen changes, so a
   leftover rotation from tuning one object (e.g. a boulder) doesn't
   silently carry over and confuse the next one (e.g. a door) -- same
   "reseed on id change" shape the original e-model-texturing tuner used
   for its own per-model fields. */
static double g_tune_rotation_offset = 0.0;
static int g_tune_last_catalog = -1;
/* Debug-panel toggle (dbgui_field_toggle) for pick_object_under_cursor's
   own UW_PICK_DIAG trace -- lets the pick stencil/object-resolution trace
   be flipped on live from the object tuner panel instead of needing a
   relaunch with the env var set. Read alongside getenv("UW_PICK_DIAG") at
   each pick call, not cached, so toggling it mid-session takes effect on
   the very next click. */
int g_uw_debug_pick_diag = 0;
static undefined1 *DAT_000db45c;
static int DAT_000db458;
// was DAT_000d91d0 -- running point count while parse_e_model_file reads
// a .E model's POINTS block (bounded at 600, see the "Too many points"
// error); indexes both the point-scratch arrays and the final per-model
// output buffer's points array.
static int g_model_parse_point_count;
static int DAT_000db4fc;
static int *DAT_000c8b00;
// was DAT_000db430 -- running part (face) count while parse_e_model_file
// reads a .E model's PARTS block (bounded at 0x15e=350, see the "Too many
// polys" error); indexes both the part-scratch arrays and the final
// per-model output buffer's parts array.
static int g_model_parse_part_count;
static int DAT_00084660;
static int DAT_0008465c;
static int DAT_00084670;
static int DAT_0008466c;
// DAT_000db480/DAT_000db470: gate the PARTS block's 'A' (auto-backside)
// handling and an INTERSECTIONS-vs-other-block branch, but neither is
// ever WRITTEN anywhere in this decompile -- always BSS-zero here, which
// makes the 'A' backside-generation code (see vec3_cross's caller,
// parse_e_model_file's "making backside of %d %d" branch) and the
// INTERSECTIONS default path unconditionally taken as if these flags are
// always off. Not renamed: unclear whether that's really how the
// original binary behaves (a hidden writer elsewhere, not yet checked
// via Ghidra the way DAT_00085668 and friends were) or a genuine
// decompile gap, so a confident name isn't warranted yet.
static int DAT_000db480;
static int DAT_000db470;
static int DAT_000db4d4;
static int DAT_000db4d8;
static int DAT_000db4d0;
// DAT_000db494: gates whether parse_e_model_file resolves each PARTS
// entry's EXTENDED_COLORS index against g_model_known_ext_colors (and the
// function's own final scratch-to-scratch color-inheritance pass). Same
// "never written anywhere in this decompile" situation as DAT_000db480/
// DAT_000db470 just above -- always reads BSS-zero here, so this whole
// resolution path is presently dead code for every model regardless of
// whether the file actually has an EXTENDED_COLORS block. Not renamed
// for the same reason.
static int DAT_000db494;
static int DAT_000db4e0;
// was DAT_00084678 -- a fixed table of up to 32 known 24-bit RGB values
// (0x00RRGGBB-shaped ints) that parse_e_model_file's EXTENDED_COLORS
// handling linearly searches to turn each entry's literal RGB (e.g.
// "545454" in ROCKSMAL.E) into a small index, stored per-part -- a
// palette-index lookup, not a raw-color passthrough. Gated dead by
// DAT_000db494 above, so this table is currently never actually
// consulted despite being real, meaningful data.
static undefined4 g_model_known_ext_colors;
static char s_unexpected_EOF___no_END_statemen_000846f8[] = "unexpected EOF - no END statement\n";
static char s________c_0008471c[] = "%*[^}]%c";
static char s___d__00084728[] = "(%d)\n";
/* Sizing-audit pass: a bare NKDbgPrintfW debug-message format string
   (no args), surrounded entirely by short (<40 char) literal strings
   in this same table. Real content confirmed via direct Ghidra memory
   export of UU.exe (tests/fixtures/static_strings.json): "%d ". Sized
   to 64 for headroom; down from 8192. */
static undefined DAT_00084730_backing[64] = "%d ";
#define DAT_00084730 DAT_00084730_backing[0]
static char s_anim__d___d__c__d__d___00084734[] = "anim %d (%d,%c,%d,%d): ";
static char s__d__1s__d__d__1s_0008474c[] = "%d,%1s,%d,%d,%1s";
static char s_ANIMATE_00084760[] = "ANIMATE";
static char s_Error__extended_color_for_part___00084768[] = "Error: extended color for part %d not in Mac color table\n";
/* Was "%lx%1s" -- correct as recovered from the original 32-bit binary,
   where 'long' and 'int' are both 4 bytes, matching the destination
   (parse_e_model_file's `int local_208;`). On this 64-bit host 'long' is 8
   bytes, so vfscanf wrote a full 8-byte value through ce_fscanf into
   that 4-byte stack slot -- a real stack-buffer-overflow (confirmed via
   ASAN), not a truncation-in-the-other-direction case like most of this
   file's other pointer/int-width bugs. Fixed by dropping the 'l' length
   modifier to match the 32-bit-correct destination width instead of
   widening the destination, since every other use of this value in
   parse_e_model_file treats it as a plain 4-byte int. */
static char s__lx_1s_000847a4[] = "%x%1s";
static char s_EXTENDED_COLORS_000847ac[] = "EXTENDED_COLORS";
static char s_INTERSECTIONS_000847bc[] = "INTERSECTIONS";
static char s__c__d__d__d__d__d___c__000847cc[] = "%c,%d,%d,%d,%d,%d (%c)\n";
static char s__1s__d__d__d_1s_000847e4[] = "%1s,%d,%d,%d%1s";
static char s__1s__d__d__d__d__d_1s_000847f4[] = "%1s,%d,%d,%d,%d,%d%1s";
static char s_branch_0008480c[] = "branch ";
/* Sizing-audit pass: an NKDbgPrintfW debug-message format string
   (one %-arg, local_22c), sibling of the "branch"/"leaf" literals
   right around it. Real content confirmed via direct Ghidra memory
   export of UU.exe: "%d\n". Sized to 64 for headroom; down from
   8192. */
static undefined DAT_00084814_backing[64] = "%d\n";
#define DAT_00084814 DAT_00084814_backing[0]
static char s_leaf_00084818[] = "leaf ";
/* Sizing-audit pass: a ce_fscanf format string (`ce_fscanf(pvVar_fh,
   &DAT_00084820,&local_1e4)`, one int destination), sibling of the
   short format-string literals around it (e.g. s__d_1s_000848c8 =
   "%d%1s"). Real content confirmed via direct Ghidra memory export of
   UU.exe: "%1s,". Sized to 64 for headroom; down from 8192. */
static undefined DAT_00084820_backing[64] = "%1s,";
#define DAT_00084820 DAT_00084820_backing[0]
static char s_SUPER_NODES_00084828[] = "SUPER_NODES";
static char s_NODES_00084834[] = "NODES";
static char s_CLUSTERS_0008483c[] = "CLUSTERS";
static char s_making_backside_of__d_____d_00084848[] = "making backside of %d -> %d\n";
static char s_Error__Part__d_is_a_polygon_with_00084868[] = "Error: Part %d is a polygon with only %d points";
static char s_Error__polygon__d__bitmap_must_h_00084898[] = "Error: polygon %d: bitmap must have 4 points\n";
static char s__d_1s_000848c8[] = "%d%1s";
static char s__d__d_000848d0[] = "%d,%d";
static char s_________c_000848d8[] = "%*[^;}]%c";
static char s_got_sphere__d_000848e4[] = "got sphere %d\n";
/* Sizing-audit pass: a ce_fscanf format string (multiple destination
   pointers), sibling of "got sphere %d\n" right above it. Real
   content confirmed via direct Ghidra memory export of UU.exe: "%d,".
   Sized to 64 for headroom; down from 8192. */
static undefined DAT_000848f4_backing[64] = "%d,";
#define DAT_000848f4 DAT_000848f4_backing[0]
static char s_Too_many_polys_000848f8[] = "Too many polys\n";
static char s_Out_of_vertex_list_space_00084908[] = "Out of vertex list space\n";
static char s__d__d__d__d_00084924[] = "%d,%d,%d,%d";
static char s_got_bitmap__d___d_00084930[] = "got bitmap %d: %d\n";
static char s__d__1s__d__x__00084944[] = "%d,%1s,%d,%x,";
static char s___c_1____00084954[] = "%*c%1[}]";
static char s_PARTS_00084960[] = "PARTS";
static char s_Too_many_points___d__00084968[] = "Too many points (%d)\n";
static char s__d__d__d__00084980[] = "%d,%d,%d;";
static char s_POINTS_0008498c[] = "POINTS";
static char s__1s______1s_00084994[] = "%1s%[^\"]%1s";
static char s_NAMES_000849a0[] = "NAMES";
/* Unrecoverable scanf-format string constants (Ghidra never recovered
   their content). Best-effort guesses from call shape, not confirmed
   against real file content the way DAT_000849c8 ("END") was:
   DAT_000849a8 is used identically to the confirmed "%1s"/"%100s%1s"
   format strings right next to it in this same parser (single-char
   token read into a 4-byte buffer, local_260) at most call sites, so
   "%1s". DAT_000849ac is read right after matching the "VERSION" token,
   with a real file's content being "VERSION {0}" (DATA3D/DFRAME.E) --
   guessed as " {%d}" to parse the braced integer. Some call sites pass
   more destination pointers than either guessed format has specifiers
   for (this file's argument-count-per-call-site is already established
   as unreliable throughout the decompile); harmless since vfscanf simply
   won't consume args past what the format string actually specifies. */
/* Sizing-audit pass: recovered/guessed content is 3-4 chars, no
   indexing. Sized to 16; down from 8192. */
static char DAT_000849a8_backing[16] = "%1s";
#define DAT_000849a8 DAT_000849a8_backing[0]
static char DAT_000849ac_backing[16] = "%d";
#define DAT_000849ac DAT_000849ac_backing[0]
static char s_VERSION_000849b0[] = "VERSION";
static char s_error___s__c_000849b8[] = "error: %s,%c\n";
/* Unrecoverable string constant (Ghidra never recovered its content) --
   confirmed "END" by inspecting a real .E model file (DATA3D/DFRAME.E):
   the game's text script parser (parse_e_model_file) brackets every model with
   a BEGIN...END pair (see s_BEGIN_00084a14/s_Input_file_error...), and
   this is the only unresolved string used as the closing-token
   comparison (ce_strcmp(token,&DAT_000849c8) / ce_strncmp with
   length 3 for a truncated-token EOF check) right where a real file's
   content literally ends with the line "END". Leaving it empty meant
   "END" never matched, so every model's parse fell through to the
   unexpected-EOF/malformed-file exit path instead of completing.
   Kept as a backing-array + #define alias (not a plain char[]) because
   call sites take its address with '&DAT_000849c8', which only stays a
   plain char* (not a pointer-to-array) when DAT_000849c8 is itself a
   scalar macro'd to the array's first element, matching every other
   widened-global in this file. */
/* Sizing-audit pass: confirmed real content is "END" (3 chars, see
   comment above), no indexing. Sized to 16; down from 8192. */
static char DAT_000849c8_backing[16] = "END";
#define DAT_000849c8 DAT_000849c8_backing[0]
static char s__100s_1s_000849cc[] = "%100s%1s";
static char s__1s__a_z__1s_000849d8[] = "%1s%[a-z]%1s";
static char s_Input_file_error__BEGIN_statemen_000849e8[] = "Input file error: BEGIN statement missing\n";
static char s_BEGIN_00084a14[] = "BEGIN";
static char s__100s_00084a1c[] = "%100s";
/* Sizing-audit pass: ce_fopen's mode-string argument
   (`ce_fopen(acStack_130,&DAT_00084a24)`). Real content confirmed via
   direct Ghidra memory export of UU.exe: "r". Sized to 16; down from
   8192. */
static undefined DAT_00084a24_backing[16] = "r";
#define DAT_00084a24 DAT_00084a24_backing[0]
/* DAT_000c4c38 (a vertex-data scratch buffer, see parse_e_model_file's ".E"
   model parser: `DAT_000c8b00 = &DAT_000c4c38;` starts a write cursor
   there and walks it forward one 4-byte slot at a time while parsing
   PARTS) was declared as a lone undefined4 scalar -- Ghidra only saw the
   first slot. Its real extent is bounded by DAT_000c8a90, which the
   parser compares the write cursor against ("Out of vertex list space"
   if exceeded) -- but DAT_000c8a90 was ALSO just a lone undefined byte,
   whose only meaning was "whatever address the original 32-bit linker
   happened to place 0x3e58 bytes after DAT_000c4c38" (whatever unrelated
   global that turned out to be). On this 64-bit recompile the two
   globals land wherever the linker wants, nowhere near 0x3e58 bytes
   apart, so the very first vertex written already tripped the
   "&DAT_000c8a90 < DAT_000c8b00" bounds check. Fixed by giving
   DAT_000c4c38 a real backing buffer sized to that same 0x3e58 byte
   span (preserving the original capacity/behavior) and defining
   DAT_000c8a90 as the address exactly one-past-its-end, restoring the
   original relationship. */
static char DAT_000c4c38_backing[0x3e58];
#define DAT_000c4c38 (*(undefined4 *)DAT_000c4c38_backing)
#define DAT_000c8a90 (*(undefined1 *)(DAT_000c4c38_backing + 0x3e58))
/* INTERSECTIONS-block growing undefined4 array (DAT_000db4d0-indexed).
   Sizing pass: this block's own dispatch was unreachable until this
   session's control-flow fix (see the ANIMATE-mismatch `goto
   LAB_check_clusters` comment a few hundred lines down) -- confirmed
   live afterward (UW_DEBUG_MODEL_PARSE_HWM) that none of the 29 real
   loaded models actually have an INTERSECTIONS block, so real usage
   is 0. Sized to 256 bytes (room for a handful of real entries) rather
   than 0, since the block is now genuinely reachable and a future
   model could use it; down from the previous 65536 either way. */
static undefined1 DAT_000c8b08_backing[256];
#define DAT_000c8b08 DAT_000c8b08_backing[0]
/* Base of a growing per-cluster-connection undefined4 array in
   parse_e_model_file's CLUSTERS block (`puVar8 = &DAT_000c8ca0; ... *puVar8 =
   local_1d8; puVar8 = puVar8 + 1;`) -- same undersized-scalar bug as
   DAT_000da868/DAT_000dab90 right above, for the same block.
   Sizing pass: CLUSTERS's own dispatch was unreachable until this
   session's control-flow fix (see the ANIMATE-mismatch comment a few
   hundred lines down) -- confirmed live afterward that real usage
   across all 29 loaded models peaks at 51 undefined4 elements (204
   bytes, from ROCKBIG.E's 50-entry connection list). Sized to 1024
   bytes for headroom, down from 65536. */
static undefined1 DAT_000c8ca0_backing[1024];
#define DAT_000c8ca0 DAT_000c8ca0_backing[0]
/* DAT_000c9540..DAT_000c9555 (22 fields): another per-record byte-field
   cluster in parse_e_model_file's ".E" model parser (NODES block), same
   undersized-scalar bug as DAT_000d2ab0/DAT_000c9dd8/DAT_000c8ca0/
   DAT_000da868/DAT_000dab90 above -- found via a systematic scan of
   every `(&DAT_x)[idx]` pattern in this function after the POINTS/PARTS/
   CLUSTERS instances turned out not to be the only ones (a real model
   file's parse was still corrupting an unrelated global afterward).
   Widened the same way.
   Sizing pass: this whole NODES block was actually unreachable code
   until this session's separate control-flow fix (a mis-targeted
   `goto` in the ANIMATE-mismatch case skipped past CLUSTERS and NODES
   entirely -- see the `goto LAB_check_clusters` comment a few hundred
   lines down) -- confirmed live (UW_DEBUG_MODEL_PARSE_HWM) that real
   model data was being silently dropped: ROCKBIG.E etc. do have real
   NODES content, but it never got as far as this array before the
   fix. With the fix in, real usage across all 29 loaded models peaks
   at 7 records (154 bytes, stride 0x16=22). Sized to 512 for
   headroom, down from 65536. */
static undefined1 DAT_000c9540_backing[512];
#define DAT_000c9540 DAT_000c9540_backing[0]
static undefined1 DAT_000c9541_backing[512];
#define DAT_000c9541 DAT_000c9541_backing[0]
static undefined1 DAT_000c9542_backing[512];
#define DAT_000c9542 DAT_000c9542_backing[0]
static undefined1 DAT_000c9543_backing[512];
#define DAT_000c9543 DAT_000c9543_backing[0]
static undefined1 DAT_000c9544_backing[512];
#define DAT_000c9544 DAT_000c9544_backing[0]
static undefined1 DAT_000c9545_backing[512];
#define DAT_000c9545 DAT_000c9545_backing[0]
static undefined1 DAT_000c9546_backing[512];
#define DAT_000c9546 DAT_000c9546_backing[0]
static undefined1 DAT_000c9547_backing[512];
#define DAT_000c9547 DAT_000c9547_backing[0]
static undefined1 DAT_000c9548_backing[512];
#define DAT_000c9548 DAT_000c9548_backing[0]
static undefined1 DAT_000c9549_backing[512];
#define DAT_000c9549 DAT_000c9549_backing[0]
static undefined1 DAT_000c954a_backing[512];
#define DAT_000c954a DAT_000c954a_backing[0]
static undefined1 DAT_000c954b_backing[512];
#define DAT_000c954b DAT_000c954b_backing[0]
static undefined1 DAT_000c954c_backing[512];
#define DAT_000c954c DAT_000c954c_backing[0]
static undefined1 DAT_000c954d_backing[512];
#define DAT_000c954d DAT_000c954d_backing[0]
static undefined1 DAT_000c954e_backing[512];
#define DAT_000c954e DAT_000c954e_backing[0]
static undefined1 DAT_000c954f_backing[512];
#define DAT_000c954f DAT_000c954f_backing[0]
static undefined1 DAT_000c9550_backing[512];
#define DAT_000c9550 DAT_000c9550_backing[0]
static undefined1 DAT_000c9551_backing[512];
#define DAT_000c9551 DAT_000c9551_backing[0]
static undefined1 DAT_000c9552_backing[512];
#define DAT_000c9552 DAT_000c9552_backing[0]
static undefined1 DAT_000c9553_backing[512];
#define DAT_000c9553 DAT_000c9553_backing[0]
static undefined1 DAT_000c9554_backing[512];
#define DAT_000c9554 DAT_000c9554_backing[0]
static undefined1 DAT_000c9555_backing[512];
#define DAT_000c9555 DAT_000c9555_backing[0]
/* DAT_000c9dd8 through DAT_000c9de3 (12 globals) are byte fields of a
   0x67(103)-byte-stride per-PART record in parse_e_model_file's ".E" model
   parser (`iVar5 = g_model_parse_part_count * 0x67; (&DAT_000c9ddc)[iVar5] = ...`),
   bounded by `if (0x15e < g_model_parse_part_count)` (350 parts) -- same undersized-
   scalar-instead-of-real-table bug as the DAT_000d2ab0-family POINTS
   record right above, just for PARTS. Widened the same way.
   Sizing pass: 350 parts * 103 bytes = 36050 bytes needed at the real
   code-enforced cap (unlike CLUSTERS/NODES/ANIMATE, PARTS has always
   been reachable, so this is a real, currently-reachable bound, not
   just today's data) -- was oversized at 65536. Sized to 49152 for
   headroom above the real cap. */
static undefined1 DAT_000c9dd8_backing[49152];
#define DAT_000c9dd8 DAT_000c9dd8_backing[0]
static undefined1 DAT_000c9dd9_backing[49152];
#define DAT_000c9dd9 DAT_000c9dd9_backing[0]
static undefined1 DAT_000c9dda_backing[49152];
#define DAT_000c9dda DAT_000c9dda_backing[0]
static undefined1 DAT_000c9ddb_backing[49152];
#define DAT_000c9ddb DAT_000c9ddb_backing[0]
static undefined1 DAT_000c9ddc_backing[49152];
#define DAT_000c9ddc DAT_000c9ddc_backing[0]
static undefined1 DAT_000c9ddd_backing[49152];
#define DAT_000c9ddd DAT_000c9ddd_backing[0]
static undefined1 DAT_000c9dde_backing[49152];
#define DAT_000c9dde DAT_000c9dde_backing[0]
static undefined1 DAT_000c9ddf_backing[49152];
#define DAT_000c9ddf DAT_000c9ddf_backing[0]
static undefined1 DAT_000c9de0_backing[49152];
#define DAT_000c9de0 DAT_000c9de0_backing[0]
static undefined1 DAT_000c9de1_backing[49152];
#define DAT_000c9de1 DAT_000c9de1_backing[0]
static undefined1 DAT_000c9de2_backing[49152];
#define DAT_000c9de2 DAT_000c9de2_backing[0]
static undefined1 DAT_000c9de3_backing[49152];
#define DAT_000c9de3 DAT_000c9de3_backing[0]
/* DAT_000c9e0e..DAT_000c9e3e (30 fields): same bug, same parser, same
   systematic-scan discovery as DAT_000c9540 above.
   Sizing pass: same PARTS record as DAT_000c9dd8 above -- see its own
   comment (350-part code-enforced cap, 36050 bytes real need). Sized
   to 49152, down from 65536. */
static undefined1 DAT_000c9e0e_backing[49152];
#define DAT_000c9e0e DAT_000c9e0e_backing[0]
static undefined1 DAT_000c9e0f_backing[49152];
#define DAT_000c9e0f DAT_000c9e0f_backing[0]
static undefined1 DAT_000c9e10_backing[49152];
#define DAT_000c9e10 DAT_000c9e10_backing[0]
static undefined1 DAT_000c9e11_backing[49152];
#define DAT_000c9e11 DAT_000c9e11_backing[0]
static undefined1 DAT_000c9e22_backing[49152];
#define DAT_000c9e22 DAT_000c9e22_backing[0]
static undefined1 DAT_000c9e23_backing[49152];
#define DAT_000c9e23 DAT_000c9e23_backing[0]
static undefined1 DAT_000c9e24_backing[49152];
#define DAT_000c9e24 DAT_000c9e24_backing[0]
static undefined1 DAT_000c9e25_backing[49152];
#define DAT_000c9e25 DAT_000c9e25_backing[0]
static undefined1 DAT_000c9e26_backing[49152];
#define DAT_000c9e26 DAT_000c9e26_backing[0]
static undefined1 DAT_000c9e28_backing[49152];
#define DAT_000c9e28 DAT_000c9e28_backing[0]
static undefined1 DAT_000c9e29_backing[49152];
#define DAT_000c9e29 DAT_000c9e29_backing[0]
static undefined1 DAT_000c9e2b_backing[49152];
#define DAT_000c9e2b DAT_000c9e2b_backing[0]
static undefined1 DAT_000c9e2c_backing[49152];
#define DAT_000c9e2c DAT_000c9e2c_backing[0]
static undefined1 DAT_000c9e2d_backing[49152];
#define DAT_000c9e2d DAT_000c9e2d_backing[0]
static undefined1 DAT_000c9e2e_backing[49152];
#define DAT_000c9e2e DAT_000c9e2e_backing[0]
static undefined1 DAT_000c9e2f_backing[49152];
#define DAT_000c9e2f DAT_000c9e2f_backing[0]
static undefined1 DAT_000c9e30_backing[49152];
#define DAT_000c9e30 DAT_000c9e30_backing[0]
static undefined1 DAT_000c9e31_backing[49152];
#define DAT_000c9e31 DAT_000c9e31_backing[0]
static undefined1 DAT_000c9e32_backing[49152];
#define DAT_000c9e32 DAT_000c9e32_backing[0]
static undefined1 DAT_000c9e33_backing[49152];
#define DAT_000c9e33 DAT_000c9e33_backing[0]
static undefined1 DAT_000c9e34_backing[49152];
#define DAT_000c9e34 DAT_000c9e34_backing[0]
static undefined1 DAT_000c9e35_backing[49152];
#define DAT_000c9e35 DAT_000c9e35_backing[0]
static undefined1 DAT_000c9e36_backing[49152];
#define DAT_000c9e36 DAT_000c9e36_backing[0]
static undefined1 DAT_000c9e37_backing[49152];
#define DAT_000c9e37 DAT_000c9e37_backing[0]
static undefined1 DAT_000c9e38_backing[49152];
#define DAT_000c9e38 DAT_000c9e38_backing[0]
static undefined1 DAT_000c9e39_backing[49152];
#define DAT_000c9e39 DAT_000c9e39_backing[0]
static undefined1 DAT_000c9e3a_backing[49152];
#define DAT_000c9e3a DAT_000c9e3a_backing[0]
static undefined1 DAT_000c9e3b_backing[49152];
#define DAT_000c9e3b DAT_000c9e3b_backing[0]
static undefined1 DAT_000c9e3c_backing[49152];
#define DAT_000c9e3c DAT_000c9e3c_backing[0]
static undefined1 DAT_000c9e3d_backing[49152];
#define DAT_000c9e3d DAT_000c9e3d_backing[0]
static undefined1 DAT_000c9e3e_backing[49152];
#define DAT_000c9e3e DAT_000c9e3e_backing[0]
/* DAT_000d2ab0 through DAT_000d2ad3 (28 globals) are individual byte
   fields of a 0x2c(44)-byte-stride per-POINT record in parse_e_model_file's
   ".E" model parser (`iVar6 = g_model_parse_point_count * 0x2c; (&DAT_000d2ab0)[iVar6]
   = ...;`, bounded by `if (600 < g_model_parse_point_count)`) -- up to 600 points *
   44 bytes = 26400 bytes needed per field, but each was declared as a
   lone `undefined1` scalar. A watchpoint confirmed this overflow
   corrupting an unrelated global (DAT_002029cc, ~26KB+ away) during a
   real model file's parse, which crashed much later and far from the
   actual bad write -- the same "detected at a distance" pattern as the
   STRINGS.PAK heap corruption. Widened with the usual backing-buffer
   pattern.

   Sizing-audit pass: real hard cap is 600 points * 0x2c (44) = 26400
   bytes -- confirmed already comfortably covered by the current 32768
   (24% headroom), tighter than the sibling PARTS family's own 36%
   headroom choice just below. Left as-is rather than churning for a
   marginal gain. */
static undefined1 DAT_000d2ab0_backing[32768];
#define DAT_000d2ab0 DAT_000d2ab0_backing[0]
static undefined1 DAT_000d2ab1_backing[32768];
#define DAT_000d2ab1 DAT_000d2ab1_backing[0]
static undefined1 DAT_000d2ab2_backing[32768];
#define DAT_000d2ab2 DAT_000d2ab2_backing[0]
static undefined1 DAT_000d2ab3_backing[32768];
#define DAT_000d2ab3 DAT_000d2ab3_backing[0]
static undefined1 DAT_000d2ab4_backing[32768];
#define DAT_000d2ab4 DAT_000d2ab4_backing[0]
static undefined1 DAT_000d2ab5_backing[32768];
#define DAT_000d2ab5 DAT_000d2ab5_backing[0]
static undefined1 DAT_000d2ab6_backing[32768];
#define DAT_000d2ab6 DAT_000d2ab6_backing[0]
static undefined1 DAT_000d2ab7_backing[32768];
#define DAT_000d2ab7 DAT_000d2ab7_backing[0]
static undefined1 DAT_000d2ab8_backing[32768];
#define DAT_000d2ab8 DAT_000d2ab8_backing[0]
static undefined1 DAT_000d2ab9_backing[32768];
#define DAT_000d2ab9 DAT_000d2ab9_backing[0]
static undefined1 DAT_000d2aba_backing[32768];
#define DAT_000d2aba DAT_000d2aba_backing[0]
static undefined1 DAT_000d2abb_backing[32768];
#define DAT_000d2abb DAT_000d2abb_backing[0]
static undefined1 DAT_000d2abc_backing[32768];
#define DAT_000d2abc DAT_000d2abc_backing[0]
static undefined1 DAT_000d2abd_backing[32768];
#define DAT_000d2abd DAT_000d2abd_backing[0]
static undefined1 DAT_000d2abe_backing[32768];
#define DAT_000d2abe DAT_000d2abe_backing[0]
static undefined1 DAT_000d2abf_backing[32768];
#define DAT_000d2abf DAT_000d2abf_backing[0]
static undefined1 DAT_000d2ac0_backing[32768];
#define DAT_000d2ac0 DAT_000d2ac0_backing[0]
static undefined1 DAT_000d2ac1_backing[32768];
#define DAT_000d2ac1 DAT_000d2ac1_backing[0]
static undefined1 DAT_000d2ac2_backing[32768];
#define DAT_000d2ac2 DAT_000d2ac2_backing[0]
static undefined1 DAT_000d2ac3_backing[32768];
#define DAT_000d2ac3 DAT_000d2ac3_backing[0]
static undefined1 DAT_000d2ac8_backing[32768];
#define DAT_000d2ac8 DAT_000d2ac8_backing[0]
static undefined1 DAT_000d2ac9_backing[32768];
#define DAT_000d2ac9 DAT_000d2ac9_backing[0]
static undefined1 DAT_000d2aca_backing[32768];
#define DAT_000d2aca DAT_000d2aca_backing[0]
static undefined1 DAT_000d2acb_backing[32768];
#define DAT_000d2acb DAT_000d2acb_backing[0]
static undefined1 DAT_000d2ad0_backing[32768];
#define DAT_000d2ad0 DAT_000d2ad0_backing[0]
static undefined1 DAT_000d2ad1_backing[32768];
#define DAT_000d2ad1 DAT_000d2ad1_backing[0]
static undefined1 DAT_000d2ad2_backing[32768];
#define DAT_000d2ad2 DAT_000d2ad2_backing[0]
static undefined1 DAT_000d2ad3_backing[32768];
#define DAT_000d2ad3 DAT_000d2ad3_backing[0]
static undefined4 DAT_000d95d8;
/* DAT_000d9768..DAT_000d977c (21 fields): same bug, same parser, same
   systematic-scan discovery as the two clusters above.
   Sizing pass: this is the ANIMATE block, which like CLUSTERS/NODES
   was unreachable until this session's control-flow fix -- confirmed
   live afterward that none of the 29 real loaded models actually have
   an ANIMATE block (real usage 0). Sized to 256 bytes (room for a
   handful of real entries, stride 0x15=21) rather than 0, since the
   block is now genuinely reachable; down from 65536 either way. */
static undefined1 DAT_000d9768_backing[256];
#define DAT_000d9768 DAT_000d9768_backing[0]
static undefined1 DAT_000d9769_backing[256];
#define DAT_000d9769 DAT_000d9769_backing[0]
static undefined1 DAT_000d976a_backing[256];
#define DAT_000d976a DAT_000d976a_backing[0]
static undefined1 DAT_000d976b_backing[256];
#define DAT_000d976b DAT_000d976b_backing[0]
static undefined1 DAT_000d976c_backing[256];
#define DAT_000d976c DAT_000d976c_backing[0]
static undefined1 DAT_000d976d_backing[256];
#define DAT_000d976d DAT_000d976d_backing[0]
static undefined1 DAT_000d976e_backing[256];
#define DAT_000d976e DAT_000d976e_backing[0]
static undefined1 DAT_000d976f_backing[256];
#define DAT_000d976f DAT_000d976f_backing[0]
static undefined1 DAT_000d9770_backing[256];
#define DAT_000d9770 DAT_000d9770_backing[0]
static undefined1 DAT_000d9771_backing[256];
#define DAT_000d9771 DAT_000d9771_backing[0]
static undefined1 DAT_000d9772_backing[256];
#define DAT_000d9772 DAT_000d9772_backing[0]
static undefined1 DAT_000d9773_backing[256];
#define DAT_000d9773 DAT_000d9773_backing[0]
static undefined1 DAT_000d9774_backing[256];
#define DAT_000d9774 DAT_000d9774_backing[0]
static undefined1 DAT_000d9775_backing[256];
#define DAT_000d9775 DAT_000d9775_backing[0]
static undefined1 DAT_000d9776_backing[256];
#define DAT_000d9776 DAT_000d9776_backing[0]
static undefined1 DAT_000d9777_backing[256];
#define DAT_000d9777 DAT_000d9777_backing[0]
static undefined1 DAT_000d9778_backing[256];
#define DAT_000d9778 DAT_000d9778_backing[0]
static undefined1 DAT_000d9779_backing[256];
#define DAT_000d9779 DAT_000d9779_backing[0]
static undefined1 DAT_000d977a_backing[256];
#define DAT_000d977a DAT_000d977a_backing[0]
static undefined1 DAT_000d977b_backing[256];
#define DAT_000d977b DAT_000d977b_backing[0]
static undefined1 DAT_000d977c_backing[256];
#define DAT_000d977c DAT_000d977c_backing[0]
/* Sizing pass: live instrumentation (UW_DEBUG_MODEL_PARSE_HWM) across
   the full 19-script regression suite (29 real .E model files loaded)
   showed a real high-water mark of 8 chars for the unbounded %[a-z]
   token this feeds. Sized to 64 bytes for headroom above that. */
static undefined1 DAT_000d98c8_backing[64];
#define DAT_000d98c8 DAT_000d98c8_backing[0]
/* NAMES-block growing string-table cursor base (puVar16/local_258 walk
   forward from here, one null-terminated name per CLUSTER entry).
   Sizing pass: real usage across all 29 loaded models peaks at 270
   bytes. Sized to 1024 for headroom, down from 65536. */
static undefined1 DAT_000da480_backing[1024];
#define DAT_000da480 DAT_000da480_backing[0]
/* Per-CLUSTER pointer/index slot in the same ".E" model parser
   (parse_e_model_file's CLUSTERS block) as DAT_000dab90 right below, same
   "declared as a lone scalar, actually a large indexed table" bug --
   `*(undefined **)(&DAT_000da868 + iVar4) = local_258;` where iVar4
   grows per cluster. Widened the same way, matching DAT_000dab90's
   size.
   Sizing pass: like DAT_000c8ca0/DAT_000c9540 above, this block was
   unreachable until this session's control-flow fix; real usage
   afterward peaks at 8 records (32 bytes, stride 4). Sized to 128 for
   headroom, down from 65536. */
static undefined1 DAT_000da868_backing[128];
#define DAT_000da868 DAT_000da868_backing[0]
static undefined1 DAT_000dab90_backing[128];
#define DAT_000dab90 DAT_000dab90_backing[0]
/* Sizing-audit pass: its only use is
   `ce_fscanf(pvVar_fh,&DAT_000849ac,&DAT_000db454)` where DAT_000849ac
   is the format string "%d" -- a single int destination, not a table.
   Sized to 16 bytes for alignment/type-punning safety, down from
   8192. */
static undefined DAT_000db454_backing[16];
#define DAT_000db454 DAT_000db454_backing[0]
static char s__DATA3D_BED2_E_00085474[] = "\\DATA3D\\BED2.E";
static char s__DATA3D_CHAIRSIM_E_00085484[] = "\\DATA3D\\CHAIRSIM.E";
static char s__DATA3D_BARRCLOS_E_00085498[] = "\\DATA3D\\BARRCLOS.E";
static char s__DATA3D_NITESTAN_E_000854ac[] = "\\DATA3D\\NITESTAN.E";
static char s__DATA3D_CHEST_E_000854c0[] = "\\DATA3D\\CHEST.E";
static char s__DATA3D_TABLF3_E_000854d0[] = "\\DATA3D\\TABLF3.E";
static char s__DATA3D_GATE_E_000854e4[] = "\\DATA3D\\GATE.E";
static char s__DATA3D_TMAP64X64_E_000854f4[] = "\\DATA3D\\TMAP64X64.E";
static char s__DATA3D_TMAP32X32_E_00085508[] = "\\DATA3D\\TMAP32X32.E";
static char s__DATA3D_GRAVE_E_0008551c[] = "\\DATA3D\\GRAVE.E";
static char s__DATA3D_TMAP16X16_E_0008552c[] = "\\DATA3D\\TMAP16X16.E";
static char s__DATA3D_DOOR_E_00085540[] = "\\DATA3D\\DOOR.E";
static char s__DATA3D_NEWPORT_E_00085550[] = "\\DATA3D\\NEWPORT.E";
static char s__DATA3D_SHRINE_E_00085564[] = "\\DATA3D\\SHRINE.E";
static char s__DATA3D_NEWPILL_E_00085578[] = "\\DATA3D\\NEWPILL.E";
static char s__DATA3D_BEAM_E_0008558c[] = "\\DATA3D\\BEAM.E";
static char s__DATA3D_ARROW_E_0008559c[] = "\\DATA3D\\ARROW.E";
static char s__DATA3D_ROCKBIG_E_000855ac[] = "\\DATA3D\\ROCKBIG.E";
static char s__DATA3D_ROCKMED_E_000855c0[] = "\\DATA3D\\ROCKMED.E";
static char s__DATA3D_ROCKSMAL_E_000855d4[] = "\\DATA3D\\ROCKSMAL.E";
static char s__DATA3D_40LOTUS_E_000855e8[] = "\\DATA3D\\40LOTUS.E";
static char s__DATA3D_BENCH_E_000855fc[] = "\\DATA3D\\BENCH.E";
static char s__DATA3D_FBRIDGE_E_0008560c[] = "\\DATA3D\\FBRIDGE.E";
static char s__DATA3D_DFRAME_E_00085620[] = "\\DATA3D\\DFRAME.E";
/* Sizing-audit pass: these ~30 per-model catalog buffers (one per .E
   file, each passed as parse_e_model_file's own param_2) were checked
   for oversizing like every other array in this audit, but turned out
   NOT to be oversized -- they're already reasonably tight. Traced
   every dynamic write into param_2 (PARTS stride 0x60 based at
   0xc14..., POINTS stride 0xc based at +8...) and parsed all 30 real
   data/DATA3D/*.E files directly: worst real case is SHRINE.E (76
   parts, 47 points) at ~10383 bytes -- 63% of the declared 16384, a
   reasonable ~37% margin.

   Separately (NOT a sizing-audit finding, flagging for visibility
   only): the PARTS block's own governing cap is 350 parts
   (`g_model_parse_part_count`), and the per-face vertex-index loop
   feeding +0xc18 has no cap at all tied to this buffer's size, so the
   code's own theoretical reachable worst case (~36791 bytes) exceeds
   16384 -- a latent gap, not a live bug, since no real shipped file
   comes remotely close (76 parts vs the 350 cap; 5 verts/face vs the
   ~23-24 designed slots). Left exactly as-is: this is the one family
   in the whole audit that should arguably grow or gain an explicit
   size guard, not shrink, and that's a separate change from this
   sizing pass. */
static undefined DAT_00114c1c_backing[16384];
#define DAT_00114c1c DAT_00114c1c_backing[0]
static undefined DAT_00118848_backing[16384];
#define DAT_00118848 DAT_00118848_backing[0]
static undefined DAT_0011c474_backing[16384];
#define DAT_0011c474 DAT_0011c474_backing[0]
static undefined DAT_001200a0_backing[16384];
#define DAT_001200a0 DAT_001200a0_backing[0]
undefined DAT_00123ccc_backing[16384];
static undefined DAT_001278f8_backing[16384];
#define DAT_001278f8 DAT_001278f8_backing[0]
static undefined DAT_0012b524_backing[16384];
#define DAT_0012b524 DAT_0012b524_backing[0]
static undefined DAT_0012f150_backing[16384];
#define DAT_0012f150 DAT_0012f150_backing[0]
static undefined DAT_00132d7c_backing[16384];
#define DAT_00132d7c DAT_00132d7c_backing[0]
static undefined DAT_001369a8_backing[16384];
#define DAT_001369a8 DAT_001369a8_backing[0]
static undefined DAT_0013a5d4_backing[16384];
#define DAT_0013a5d4 DAT_0013a5d4_backing[0]
static undefined DAT_0013e200_backing[16384];
#define DAT_0013e200 DAT_0013e200_backing[0]
static undefined DAT_00141e2c_backing[16384];
#define DAT_00141e2c DAT_00141e2c_backing[0]
static undefined DAT_00145a58_backing[16384];
#define DAT_00145a58 DAT_00145a58_backing[0]
static undefined DAT_00149684_backing[16384];
#define DAT_00149684 DAT_00149684_backing[0]
static undefined DAT_0014d2b0_backing[16384];
#define DAT_0014d2b0 DAT_0014d2b0_backing[0]
static undefined DAT_00150edc_backing[16384];
#define DAT_00150edc DAT_00150edc_backing[0]
static undefined DAT_00154b08_backing[16384];
#define DAT_00154b08 DAT_00154b08_backing[0]
static undefined DAT_00158734_backing[16384];
#define DAT_00158734 DAT_00158734_backing[0]
static undefined DAT_0015c360_backing[16384];
#define DAT_0015c360 DAT_0015c360_backing[0]
static undefined DAT_0015ff8c_backing[16384];
#define DAT_0015ff8c DAT_0015ff8c_backing[0]
static undefined DAT_00163bb8_backing[16384];
#define DAT_00163bb8 DAT_00163bb8_backing[0]
static undefined DAT_001677e4_backing[16384];
#define DAT_001677e4 DAT_001677e4_backing[0]
static undefined DAT_0016b410_backing[16384];
#define DAT_0016b410 DAT_0016b410_backing[0]
static undefined DAT_0016f03c_backing[16384];
#define DAT_0016f03c DAT_0016f03c_backing[0]
static undefined DAT_00172c68_backing[16384];
#define DAT_00172c68 DAT_00172c68_backing[0]
static undefined DAT_00176894_backing[16384];
#define DAT_00176894 DAT_00176894_backing[0]
static undefined DAT_0017a4c0_backing[16384];
#define DAT_0017a4c0 DAT_0017a4c0_backing[0]
static undefined DAT_0017e0ec_backing[16384];
#define DAT_0017e0ec DAT_0017e0ec_backing[0]
/* g_anim_model_slot: real fix for tick_anim_record's own address-walk bug
   (see that function's own comment). In the ORIGINAL binary, `DAT_00110ff0`
   and these 29 model buffers are one contiguous array -- load_3d_object_models's own
   29 parse_e_model_file calls fill slots 1..29 in exactly this order, and
   tick_anim_record/emit_catalog_object read a model's data back by walking
   `base + slot*0x3c2c`. This port declares every DAT_XXXXXXXX as its OWN
   separately-allocated C global (confirmed: DAT_00114c1c_backing and
   DAT_00110ff0_backing are unrelated arrays, not adjacent slices of one
   buffer) -- so that walk lands in DAT_00110ff0's own unrelated, always-
   zero memory instead of a real model, and the whole real-mesh path in
   emit_catalog_object was silently dead. Slot 0 is deliberately NULL (no
   parse_e_model_file call ever targets it -- see load_3d_object_models's own call
   list, which starts at slot 1). Order matches that call list exactly. */
static void * const g_anim_model_slot[30] = {
  0,                 /* 0: unused */
  &DAT_00114c1c,     /* 1: DFRAME.E */
  &DAT_00118848,     /* 2: FBRIDGE.E */
  &DAT_0011c474,     /* 3: BENCH.E */
  &DAT_001200a0,     /* 4: 40LOTUS.E */
  &DAT_00123ccc,     /* 5: ROCKSMAL.E */
  &DAT_001278f8,     /* 6: ROCKMED.E */
  &DAT_0012b524,     /* 7: ROCKBIG.E */
  &DAT_0012f150,     /* 8: ARROW.E */
  &DAT_00132d7c,     /* 9: BEAM.E */
  &DAT_001369a8,     /* 10: NEWPILL.E */
  &DAT_0013a5d4,     /* 11: SHRINE.E */
  &DAT_0013e200,     /* 12: NEWPORT.E (1st load) */
  &DAT_00141e2c,     /* 13: NEWPORT.E (2nd load) */
  &DAT_00145a58,     /* 14: DOOR.E (1st load) */
  &DAT_00149684,     /* 15: DOOR.E (2nd load) */
  &DAT_0014d2b0,     /* 16: TMAP16X16.E (1st load) */
  &DAT_00150edc,     /* 17: TMAP16X16.E (2nd load) */
  &DAT_00154b08,     /* 18: TMAP16X16.E (3rd load) */
  &DAT_00158734,     /* 19: GRAVE.E */
  &DAT_0015c360,     /* 20: TMAP16X16.E (4th load) */
  &DAT_0015ff8c,     /* 21: TMAP32X32.E */
  &DAT_00163bb8,     /* 22: TMAP64X64.E */
  &DAT_001677e4,     /* 23: GATE.E */
  &DAT_0016b410,     /* 24: TABLF3.E */
  &DAT_0016f03c,     /* 25: CHEST.E */
  &DAT_00172c68,     /* 26: NITESTAN.E */
  &DAT_00176894,     /* 27: BARRCLOS.E */
  &DAT_0017a4c0,     /* 28: CHAIRSIM.E */
  &DAT_0017e0ec,     /* 29: BED2.E */
};
/* Per-slot working copy for tick_anim_record's real fix -- a fresh
   16384-byte memcpy of the real model buffer, refreshed every call rather
   than reusing the original's incremental per-point "tick" (whose exact
   purpose isn't needed just to get real geometry flowing, and a full fresh
   copy is simpler and can't drift stale). Kept SEPARATE from the real
   g_anim_model_slot buffers (not aliased directly onto them) so
   emit_catalog_object's own writes into a face record's scratch tail
   can never corrupt the same buffer a future real-3D-model consumer might
   also read. */
static unsigned char g_anim_model_scratch[30][16384];
/* Sizing-audit pass: both write loops index it by `iVar29 < uVar21`
   where `uVar21 = catalog_flags & 7` -- max index 6 (7 elements, 14
   bytes real). Sized to 16 for headroom; down from 256 (512 bytes,
   undefined2 element type). */
undefined2 DAT_00189570_backing[16];
#define DAT_00189570 DAT_00189570_backing[0]
char *DAT_00110fc0 = DAT_00110fc0_scratch;
/* Sizing-audit pass: investigated, NOT confidently resolved. The one
   real caller passes `&DAT_00202520 + pcVar15[3]*0x10` into
   decompress_gr_bitmap's param_2 (a .GR tile's compression-mode-4
   "auxiliary nibble->8bit remap table" bank selector); the only
   confirmed direct read of it anywhere in that function is a single
   byte, `param_2[1]` (resources.c's select_gr_bitmap_remap_table
   call) -- every other reference to the shared remap cursor
   (DAT_000b5630) gets reassigned to point into the compressed input
   stream instead before ever being dereferenced. So the real bound
   depends entirely on how many distinct `pcVar15[3]` bank values
   exist across every real mode-4 .GR tile in the shipped assets --
   not derivable from the code alone. Added live instrumentation
   (reusing UW_DEBUG_DUMP_GR, see the call site) to find that bank
   value empirically, but this code path never fired once across the
   full 19-script regression suite (mode-4 .GR tiles aren't exercised
   by that corpus), so no real high-water mark was obtained. Left at
   1024 rather than guess; worth revisiting with a broader live
   session or a direct scan of the shipped .GR files. */
 undefined1 DAT_00202520_backing[1024];
short DAT_000b4620;
static short DAT_00189584;
static undefined2 DAT_00189586;
ushort DAT_0018957a;
/* .data 0x86c08: real billboard-catalog table, 30 records of 4 bytes
   each (byte0=flags/sub-frame-count, bytes1-3=up to 3 more per-entry
   values -- see emit_catalog_object's own use of it), recovered
   directly from UU.exe. Was 4 lone `undefined` scalars Ghidra never
   gave real backing to -- same "split/orphaned data table" class as
   g_inventory_hotspot_table before its own recovery (see
   [[inventory-hotspot-table-recovery]]) -- every reader indexes past
   byte 3 via pointer arithmetic (`(&DAT_00086c08)[catalog_idx*4]`
   etc.), so a plain 4-byte declaration silently truncated every
   catalog entry past the first to out-of-bounds reads. Cross-validated:
   this table's real end (0x86c08+0x78=0x86c80) lines up exactly with
   DAT_00086c80's own real start below, and this whole region was dumped
   in one contiguous pull starting from the already-known-good
   DAT_00086b50_region/DAT_00086c00_arr immediately before it (both
   matched their existing recovered values exactly, confirming the
   address mapping). */
static unsigned char DAT_00086c08_backing[0x78] = {
  0x01,0xec,0x00,0x00, 0x21,0xeb,0x00,0x00, 0x11,0xec,0x00,0x3e, 0x01,0xe4,0x00,0x00,
  0x02,0xb6,0xb0,0x00, 0x02,0x64,0x6c,0x00, 0x02,0x64,0x6c,0x00, 0x02,0x64,0x6c,0x00,
  0x42,0xe8,0xb8,0x00, 0x01,0xe4,0x00,0x00, 0x19,0xe4,0x00,0x60, 0x03,0xa3,0xa4,0xa6,
  0x01,0x68,0x00,0x00, 0x01,0x68,0x00,0x00, 0x11,0xec,0x00,0x00, 0x21,0xec,0x00,0x00,
  0x51,0xb0,0x00,0xe4, 0x51,0xb0,0x00,0xec, 0x11,0xb0,0x00,0xf4, 0x11,0x6a,0x00,0x3c,
  0x51,0xb0,0x00,0x00, 0x11,0xb0,0x00,0x00, 0x21,0xb0,0x00,0x00, 0x83,0x00,0x02,0x04,
  0x02,0xe4,0x68,0x00, 0x02,0xe6,0x68,0x00, 0x01,0xe4,0x00,0x00, 0x02,0xe4,0x6a,0x00,
  0x03,0xe6,0x6a,0x71, 0x03,0xe2,0x62,0xc4,
};
#define DAT_00086c08 DAT_00086c08_backing[0]
#define DAT_00086c09 DAT_00086c08_backing[1]
#define DAT_00086c0a DAT_00086c08_backing[2]
#define DAT_00086c0b DAT_00086c08_backing[3]
/* Sizing pass: these 8 (ce0/e4/e8/ec/f0/f4/f8/fc) are a small, fixed
   bridge-deck heading-offset lookup table, not a growing parser
   output -- emit_catalog_object's own `switch(heading)` picks one of
   4 sibling-pairs, each read at `[uVar21*8]` with uVar21 explicitly
   clamped `if (3 < uVar21) uVar21 = 0;`. Real max index is 3*8=24 (one
   undefined4 element read there); no comment ever justified the
   original 4096-element (16384-byte) size. Sized to 32 elements for
   headroom. */
static undefined4 DAT_00086ce0_backing[32];
#define DAT_00086ce0 DAT_00086ce0_backing[0]
static undefined4 DAT_00086ce4_backing[32];
#define DAT_00086ce4 DAT_00086ce4_backing[0]
static undefined4 DAT_00086ce8_backing[32];
#define DAT_00086ce8 DAT_00086ce8_backing[0]
static undefined4 DAT_00086cec_backing[32];
#define DAT_00086cec DAT_00086cec_backing[0]
static undefined4 DAT_00086cf0_backing[32];
#define DAT_00086cf0 DAT_00086cf0_backing[0]
static undefined4 DAT_00086cf4_backing[32];
#define DAT_00086cf4 DAT_00086cf4_backing[0]
static undefined4 DAT_00086cf8_backing[32];
#define DAT_00086cf8 DAT_00086cf8_backing[0]
static undefined4 DAT_00086cfc_backing[32];
#define DAT_00086cfc DAT_00086cfc_backing[0]
/* Sizing pass: a small fixed lookup table indexed by a 4-bit nibble
   (`(*(byte*)(obj+1)>>1 & 0xf)*2`, a ushort stride) -- real max byte
   offset is 15*2+2=32; no comment ever justified the original 65536-
   byte size. Sized to 64 bytes for headroom. */
static undefined1 DAT_00086d60_backing[64];
#define DAT_00086d60 DAT_00086d60_backing[0]
static short DAT_0018957e;
static short DAT_0018957c;
static short DAT_00189576;




/* Ghidra lost the return value (literal `return 0`), so the sole caller
   (emit_catalog_object) dereferenced NULL at `*(int *)(iVar29 + 4)` -> crash the
   moment an animated tile object (door, etc.) came into view. The
   function ticks animation record `catalog` in place; it returns that
   record's base, &DAT_00189590 + catalog*0x3c2c (== piVar2 before the
   loop walks it).

   REAL FIX: that address-walk formula only works in the original binary,
   where DAT_00110ff0 and the 29 model buffers were one contiguous array
   (see g_anim_model_slot's own comment for the full trace) -- in this
   port every DAT_XXXXXXXX is its own separate C global, so the walk
   lands in unrelated always-zero memory and this whole function would
   silently return an empty record for every catalog. Now resolves
   `catalog` through g_anim_model_slot (the real per-catalog model
   address, in the same order load_3d_object_models loads them) and hands back a
   fresh copy in g_anim_model_scratch -- a real npts/nparts/point-list/
   face-list a caller can actually use, without ever aliasing (and
   risking emit_catalog_object's own scratch writes corrupting) the
   real model buffers. Falls back to the original (harmless, always-
   empty) address-walk behavior for any catalog with no real model --
   e.g. plain sprite/critter catalogs were never meant to reach this
   table at all. */
// was FUN_0001dc04
void *tick_anim_record(catalog)
short catalog;

{
  undefined4 uVar1;
  int *piVar2;
  undefined *puVar3;
  int iVar4;
  int iVar5;
  void *rec_base;

  /* Native 3D catalog-object rendering (doors/frames drawing as real .E
     model geometry instead of flat sprites) is enabled by default --
     no env var needed, unlike this project's earlier, now-removed
     g_model_map hack (which defaulted off). UW_DISABLE_3D_OBJECTS is
     the opt-out, for QA comparison against the pre-this-feature
     behavior, matching the naming convention UW_DISABLE_3D_GEOMETRY
     (this file's own sibling flag for the tile/wall/floor renderer)
     already established. Gated here, tick_anim_record's own single
     choke point for every caller (doors via emit_anim_object_frames,
     bridges/decals via the generic catalog dispatch) -- when set,
     every catalog falls through to the address-walk below exactly as
     it did before this session's fix, which lands in unrelated always-
     zero memory and returns an empty (point_count==0) record, so
     callers draw nothing for these objects rather than a stale flat
     sprite (there's no old sprite path left to fall back to -- see
     object-rendering-findings.txt). */
  { static int _disabled = -1;
    if (_disabled < 0) _disabled = (getenv("UW_DISABLE_3D_OBJECTS") != NULL);
    if (!_disabled && catalog > 0 && catalog < 30 && g_anim_model_slot[catalog] != 0) {
      void *dest = g_anim_model_scratch[catalog];
      memcpy(dest, g_anim_model_slot[catalog], 16384);
      return dest;
    }
  }

  iVar4 = catalog * 0x3c2c;
  piVar2 = (int *)(&DAT_00189590 + iVar4);
  rec_base = piVar2;
  iVar5 = *piVar2;
  if (0 < iVar5) {
    puVar3 = &DAT_00110ff0 + iVar4;
    do {
      iVar5 = iVar5 + -1;
      uVar1 = *(undefined4 *)(puVar3 + 8);
      *(char *)(piVar2 + 2) = (char)uVar1;
      *(char *)((char *)piVar2 + 9) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 10) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0xb) = (char)((uint)uVar1 >> 0x18);
      uVar1 = *(undefined4 *)(&DAT_00110ffc + iVar4);
      (&DAT_0018959c)[iVar4] = (char)uVar1;
      (&DAT_0018959d)[iVar4] = (char)((uint)uVar1 >> 8);
      (&DAT_0018959e)[iVar4] = (char)((uint)uVar1 >> 0x10);
      (&DAT_0018959f)[iVar4] = (char)((uint)uVar1 >> 0x18);
      uVar1 = *(undefined4 *)(puVar3 + 0x10);
      puVar3 = puVar3 + 0xc;
      *(char *)(piVar2 + 4) = (char)uVar1;
      *(char *)((char *)piVar2 + 0x11) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 0x12) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0x13) = (char)((uint)uVar1 >> 0x18);
      piVar2 = piVar2 + 3;
      iVar4 = iVar4 + 0xc;
    } while (iVar5 != 0);
  }
  return rec_base;
}




// WARNING: Removing unreachable block (ram,0x00064024)

// was FUN_00061e60
void emit_catalog_object(catalog,obj,heading,frame_or_texid)
byte catalog;
/* Object-record pointer -- was `uint`, truncating it (same class as
   object_list_insert_head above). */
char *obj;
char heading;
short frame_or_texid;

{
  int uw_ord2005_rem_123 = 0; int uw_ord2005_rem_124 = 0;
  int iVar1;
  int iVar2;
  int iVar3;
  byte catalog_flags;
  byte bVar5;
  byte *pbVar6;
  short sVar7;
  byte bVar8;
  char cVar9;
  undefined2 uVar10;
  ushort tex_w;
  ushort tex_h;
  short sVar13;
  uint catalog_u;
  char *pcVar15;
  int iVar16;
  /* iVar16 stays `int` for its FIRST role (a small face-index scalar,
     `faces_remaining-1`, used only to seed iVar22/local_58 before the
     loop). Inside the loop it gets reassigned to the CURRENT face
     record's address (`_anim + iVar22 + 0xc14`) and used purely as a
     pointer from then on -- a real 64-bit-pointer-truncated-through-a-
     32-bit-int bug (this whole project's own well-established bug
     class -- see DAT_00110fc0/DAT_0023aed0's own history) that never
     triggered here because this loop never ran with real face data
     until tick_anim_record's own fix (see its comment) made local_48/
     faces_remaining nonzero for the first time. Split into its own
     real pointer, `_face_rec`, scoped to exactly its second role. */
  char *_face_rec;
  undefined4 uVar17;
  int iVar18;
  undefined4 uVar19;
  undefined4 uVar20;
  uint uVar21;
  short extraout_r1;
  short extraout_r1_00;
  int extraout_r1_01;
  int extraout_r1_02;
  int iVar22;
  byte *pbVar23;
  undefined1 *puVar24;
  ushort *puVar25;
  undefined4 *puVar26;
  int iVar27;
  undefined4 *puVar28;
  int iVar29;
  char *_anim;
  int iVar30;
  /* Same truncated-pointer bug as _face_rec (see its own comment), one
     variable over: iVar30 has a genuine dual role. In the ceiling-clamp
     pre-pass (catalog_u==1 branch, the do/while over local_60) it's a real
     small vertex-index integer, into a 4-entry table -- left as `int`
     there, untouched. From its first REAL pointer assignment onward
     (`_face_rec + 8` face-record field, dereferenced to build a vertex
     address), it's a full address -- split into its own pointer, `_vptr`. */
  char *_vptr;
  /* DELIBERATE DEVIATION from the real binary. The per-corner UV read
     below is fixed at point.X (U) / point.Y (V) for every face in the
     real ARM code (fsub/fdiv/fmul at 0x63104/0x63108/0x637f4 -- no Z
     term, no flat-face branch), transform_points_by_matrix copies those
     ints verbatim into the arena and the rasterizer interpolates them.
     For a horizontal face (FBRIDGE.E's 256x16x256 deck: all 4 corners at
     Y=16) that gives V=31 on every corner -- one texture row stretched
     along the whole bridge. That IS what the shipped binary drew (the
     draw-list commands the same branch emits -- `2 <reg 0xb>
     DAT_00086d60[flags]`, `0xb2 6` -- have no consumer anywhere in
     UU.exe: the list-cursor accessors FUN_00038624/644/664 have zero
     callers), but per direct request the deck should carry the full
     32x32 plank/slab image like the DOS game. So, PER FACE: when every
     corner shares one Y, take V from point.Z over the model's Z extent
     (computed here the same way parse_e_model_file computes X/Y's);
     every face with any Y variation keeps the exact original mapping.
     An earlier model-wide version of this used Z but still divided by
     the Y extent (16 units) -- V ran -248..248 on a 32-texel texture,
     the "garbage bridge texture" QA report. */
  int _v_offset;
  byte *_floor_tex = (byte *)0x0;
  undefined4 _vmin_bits;
  undefined4 _vext_bits;
  float _model_minz;
  float _model_extz;
  undefined4 *puVar31;
  undefined4 *puVar32;
  ushort local_7c;
  ushort local_7a;
  byte *texptr;
  int local_60;
  byte *local_58;
  int faces_remaining;
  
  catalog_u = (uint)catalog;
  iVar1 = catalog_u * 4;
  catalog_flags = (&DAT_00086c08)[iVar1];
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] emit_catalog_object: catalog_idx=%d heading(heading)=%d frame_or_texid(frame_or_id)=%d DAT_00086c08[idx]=0x%02x\n",
            (int)catalog, (int)heading, (int)frame_or_texid, (unsigned)catalog_flags);
  *DAT_00110fc0 = 2;
  local_7a = 0xffff;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  local_58 = (byte *)0x0;
  uVar10 = get_catalog_sprite_width(10);
  *DAT_00110fc0 = uVar10;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (ushort)DAT_0023bc88 * DAT_00086b30;
  puVar25 = DAT_00110fc0 + 1;
  DAT_00189584 = (ushort)DAT_0023bc88 * DAT_00086b30;
  DAT_00110fc0 = puVar25;
  if ((catalog_flags & 0x20) == 0) {
    if ((catalog_flags & 0x80) == 0) {
      uVar21 = (int)(short)(ushort)catalog_flags & 7;
      if (uVar21 != 0) {
        iVar29 = 0;
        do {
          *puVar25 = 2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          tex_w = get_catalog_sprite_width(iVar29);
          *DAT_00110fc0 = tex_w;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               (ushort)DAT_0023bc88 * DAT_00086b30 * 0x100;
          if (getenv("UW_DEBUG_DOOR"))
            fprintf(stderr, "[billboard] static sub-frame %d: mesh_slot=0x%04x pushed_val=0x%04x (catalog_byte=0x%02x)\n",
                    iVar29, (unsigned)tex_w, (unsigned)*DAT_00110fc0,
                    (unsigned)(byte)(&DAT_00086c09)[iVar29 + iVar1]);
          puVar25 = DAT_00110fc0 + 1;
          DAT_00110fc0 = puVar25;
          (&DAT_00189570)[iVar29] =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               (ushort)DAT_0023bc88 * DAT_00086b30 * 0x100;
          iVar29 = (iVar29 + 1) * 0x10000 >> 0x10;
        } while (iVar29 < (int)uVar21);
      }
    }
    else {
      DAT_0023b804 = 1;
      uVar21 = read_realtime_clock_units();
      tex_w = (ushort)(uVar21 >> 6);
      local_7c = tex_w & 7;
      if ((uVar21 >> 6 & 4) != 0) {
        local_7c = 3 - (tex_w & 3);
      }
      uVar21 = (int)(short)(ushort)catalog_flags & 7;
      puVar25 = DAT_00110fc0;
      if (uVar21 != 0) {
        iVar29 = 0;
        do {
          *puVar25 = 2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          tex_w = get_catalog_sprite_width(iVar29);
          *DAT_00110fc0 = tex_w;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               (*(ushort *)(obj + 6) >> 6 & 0x1ff) + local_7c;
          puVar25 = DAT_00110fc0 + 1;
          DAT_00110fc0 = puVar25;
          (&DAT_00189570)[iVar29] =
               (ushort)(byte)(&DAT_00086c09)[iVar29 + iVar1] +
               ((*(ushort *)(obj + 6) & 0x7fc0) >> 6) + local_7c;
          iVar29 = (iVar29 + 1) * 0x10000 >> 0x10;
        } while (iVar29 < (int)uVar21);
      }
    }
  }
  else {
    local_58 = (byte *)get_texture_page((int)frame_or_texid);
    if (local_58 == (byte *)0x0) {
      /* frame_or_texid out of get_texture_page's 0..0x73 range -- reached with
         (uVar27 & 0xf) + DAT_00202734 (~0x2b8) from emit_tile_objects's
         `(*catalog & 0x30) == 0x30` branch, i.e. a special animated
         object (door frame etc.) whose texture lives in a different bank
         than the wall/floor tile pages this helper knows. Rather than
         dereference NULL (crash the instant such a tile comes into view),
         skip this object's textured billboard. */
      return;
    }
    bVar5 = *local_58;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = get_catalog_sprite_width(0);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)bVar5;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = get_catalog_sprite_width(10);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)DAT_0023b4e0 * DAT_00086b30;
    DAT_00189584 = (ushort)DAT_0023b4e0 * DAT_00086b30;
    puVar25 = DAT_00110fc0 + 1;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_00189570 = (ushort)bVar5;
  }
  iVar29 = (int)frame_or_texid;
  if ((catalog_flags & 0x10) != 0) {
    bVar5 = (&DAT_00086c0b)[iVar1];
    if (frame_or_texid < 0) {
      if (catalog_u == 2) {
        bVar8 = (bVar5 >> 5) + 1;
        if ((*(byte *)(obj + 1) >> 1 & 0xf) < bVar8) {
          DAT_0023b834 = 2;
          /* real ARM idivmod leaves the remainder in r1 (Ghidra's extraout_r1);
             gets it by name off ordint_divmod's own divmod_result now. */
          extraout_r1 = (short)ordint_divmod(bVar8,*(byte *)(obj + 1) >> 1 & 0xf).rem;
          uVar21 = (uint)DAT_00202734;
          *puVar25 = 2;
          iVar29 = (bVar5 & 0x1f) + (int)extraout_r1 + uVar21 + 0x10;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          tex_w = get_catalog_sprite_width(0xb);
          *DAT_00110fc0 = tex_w;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = *(ushort *)(&DAT_00086d60 + (*(byte *)(obj + 1) >> 1 & 0xf) * 2);
          DAT_00110fc0 = DAT_00110fc0 + 1;
          DAT_00189586 = *(undefined2 *)(&DAT_00086d60 + (*(byte *)(obj + 1) >> 1 & 0xf) * 2);
          *DAT_00110fc0 = 0xb2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = 6;
          puVar25 = DAT_00110fc0 + 1;
          DAT_00110fc0 = puVar25;
        }
        else {
          emit_floor_texture_select(0,DAT_0023b4e0,
                       ((*(byte *)(obj + 1) >> 1 & 0xf) - (uint)(bVar5 >> 5)) + -1);
          /* The real branch textures the bridge through draw-list
             commands (0x3e/0xb2) this port has no consumer for -- resolve
             the same floor texture emit_floor_texture_select just selected (index
             +0x30 full-res / +0x6a low-res, its own level threshold)
             directly, so a flags>=2 bridge isn't left with a NULL
             texture. Not live-verified: every level-1 bridge has
             flags 0/1. */
          _floor_tex = (byte *)get_texture_page(
              (((*(byte *)(obj + 1) >> 1 & 0xf) - (uint)(bVar5 >> 5)) + -1) +
              (((int)(DAT_0023b4e0 & 0xff) < (int)DAT_00086b24) ? 0x30 : 0x6a));
          iVar29 = -1;
          *DAT_00110fc0 = 0xb2;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = DAT_0023b81c;
          puVar25 = DAT_00110fc0 + 1;
          DAT_00110fc0 = puVar25;
        }
      }
      else {
        cVar9 = (bVar5 >> 5) + 1;
        if (cVar9 != '\0') {
          extraout_r1_00 = (short)ordint_divmod(cVar9,*(byte *)(obj + 1) >> 1 & 0xf).rem;
          iVar29 = (bVar5 & 0x1f) + (int)extraout_r1_00 + (uint)DAT_00202734 + 0x10;
          if (getenv("UW_DEBUG_DOOR"))
            fprintf(stderr, "[billboard] extra-frame: bVar5=0x%02x cVar9=%d extraout_r1_00=%d DAT_00202734=%d -> iVar29=%d\n",
                    (unsigned)bVar5, (int)cVar9, (int)extraout_r1_00, (int)DAT_00202734, iVar29);
        }
      }
    }
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[billboard] extra-frame check: iVar29=%d (short)(ushort)iVar29=%d -> %s\n",
              iVar29, (int)(short)(ushort)iVar29,
              (-1 < (short)(ushort)iVar29) ? "PUSHED" : "SKIPPED");
    if (-1 < (short)(ushort)iVar29) {
      *puVar25 = 0xc0;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)iVar29;
      DAT_00110fc0 = DAT_00110fc0 + 1;
      *DAT_00110fc0 = (ushort)DAT_0023bc88 * DAT_00086b30;
      puVar25 = DAT_00110fc0 + 1;
      DAT_00110fc0 = puVar25;
    }
    DAT_0023b818 = 0xe0;
  }
  tex_w = DAT_0023b91c;
  if ((catalog_flags & 8) != 0) {
    *puVar25 = 0x4c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x400 - tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x800;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = DAT_000b4620 + 0x30;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (0x400 - tex_w) * 2 - 1;
    puVar25 = DAT_00110fc0 + 1;
    DAT_00110fc0 = puVar25;
  }
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[billboard] position anchor: DAT_0023b904=%d DAT_0023b91c=%d DAT_0023b920=%d\n",
            (int)(short)DAT_0023b904, (int)(short)DAT_0023b91c, (int)(short)DAT_0023b920);
  *puVar25 = 0x18;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b904;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (short)DAT_0023b904 >> 0x10;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b91c;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (short)DAT_0023b91c >> 0x10;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = DAT_0023b920;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (short)DAT_0023b920 >> 0x10;
  cVar9 = DAT_0023b4a0;
  puVar25 = DAT_00110fc0 + 1;
  DAT_00110fc0 = puVar25;
  if (heading < '\0') {
    uw_ord2005_rem_123 = ((int)((*(ushort *)(obj + 2) >> 7 & 7) + (4 - DAT_0023b4a0) * 2)) % (8);
    local_7c = (ushort)((uint)(uw_ord2005_rem_123 << 0x1d) >> 0x10);
  }
  else {
    local_7c = ((short)heading + DAT_0023b4a0 * -4) * 0x1000;
  }
  if (((catalog_flags & 0x40) != 0) && ((catalog_flags & 0x10) == 0)) {
    if (obj < DAT_002046c4) {
      tex_w = ((*(byte *)(obj + 0x14) >> 3) - 0x10) * 0x266;
      uw_ord2005_rem_124 = ((int)((*(ushort *)(obj + 2) >> 2 & 0xe0) + cVar9 * -0x40 +
                         (*(byte *)(obj + 0x18) & 0x1f) + 0x100)) % (0x100);
      local_7c = (ushort)((uint)(uw_ord2005_rem_124 << 0x18) >> 0x10);
    }
    else {
      tex_w = 0;
    }
    *puVar25 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_h = get_catalog_sprite_width(5);
    *DAT_00110fc0 = tex_h;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = tex_w;
    puVar25 = DAT_00110fc0 + 1;
    DAT_00110fc0 = puVar25;
    DAT_0018957a = tex_w;
  }
  if (((catalog_u == 0x10) || (catalog_u == 0x11)) && (DAT_0023b830 == '\0' && DAT_00086b2c == 0)) {
    local_7a = 0;
  }
  else if (((DAT_0023b830 == '\0') && ((*(byte *)(DAT_00086df8 + 0xb5) & 0xf0) == 0x10)) &&
          (catalog_u == 2)) {
    local_7a = 1;
  }
  if (local_7a != 0xffff) {
    *puVar25 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = get_catalog_sprite_width(8);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = local_7a;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_00189580 = local_7a;
  }
  sVar13 = (short)iVar29;
  if ((sVar13 < 0) || ((sVar13 == 0 && (catalog_u == 0xc)))) {
    tex_w = 0x40;
    tex_h = 0x40;
    texptr = (byte *)0x0;
  }
  else if (local_58 == (byte *)0x0) {
    pcVar15 = (char *)lookup_grtile_by_id(iVar29);
    tex_w = (ushort)(byte)pcVar15[1];
    tex_h = (ushort)(byte)pcVar15[2];
    if (*pcVar15 == '\x04') {
      texptr = (byte *)(pcVar15 + 5);
    }
    else {
      if (getenv("UW_DEBUG_DUMP_GR")) {
        fprintf(stderr, "[gr-remap] DAT_00202520 bank=%u\n", (unsigned)(byte)pcVar15[3]);
      }
      texptr = (byte *)decompress_gr_bitmap(pcVar15 + 4,&DAT_00202520 + (uint)(byte)pcVar15[3] * 0x10);
    }
  }
  else {
    texptr = local_58;
    tex_w = DAT_0023b824;
    tex_h = DAT_0023b824;
  }
  if (_floor_tex != (byte *)0x0) {
    texptr = _floor_tex;
    tex_w = DAT_0023b824;
    tex_h = DAT_0023b824;
  }
  _anim = (char *)tick_anim_record(catalog);
  faces_remaining = *(int *)(_anim + 4);
  if (getenv("UW_DEBUG_FACE51") && catalog == 7) {
    static int _dumped_once = 0;
    if (!_dumped_once) {
      _dumped_once = 1;
      int _kk;
      fprintf(stderr, "[face51] model dump: catalog=%d faces_remaining=%d\n", (int)catalog, faces_remaining);
      for (_kk = 0; _kk < faces_remaining; _kk++) {
        int _pc = *(int *)(_anim + 0xc14 + _kk * 0x60);
        fprintf(stderr, "[face51] model k=%d point_count=%d\n", _kk, _pc);
      }
    }
  }
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[billboard] tick_anim_record(catalog=%d) -> _anim=%p point_count=%d face_count(faces_remaining)=%d\n",
            (int)catalog, (void *)_anim, *(int *)_anim, faces_remaining);
  /* DOOR.E's own local X range is [0,128] (confirmed live via the print
     below, and by reading the raw data/DATA3D/DOOR.E file directly) --
     NOT centered on 0, unlike every other model this path draws
     (DFRAME.E's real opening, points 0-7, is exactly [-64,64] -- the
     same 128-unit width, but centered). No per-catalog local offset
     exists anywhere in the real disassembly for this call chain (traced
     emit_anim_object_frames and this function itself, both confirmed
     matching the real ARM instructions) -- DFRAME and DOOR share the
     exact same world anchor and heading with nothing shifting one
     relative to the other. Confirmed live (QA report: "door leaf...
     offset into the door frame and not perfectly in the opening"):
     drawing DOOR.E's raw [0,128] range at the same anchor as DFRAME's
     centered opening leaves half the opening empty and pushes the leaf
     128 units off-axis, half sticking out past the frame into the wall.
     This is a data-convention mismatch specific to this PORT'S OWN .E
     export (the original engine's real door leaf asset was presumably
     already centered, matching how every other model here behaves) --
     not a missing piece of original logic to port, so fix it as a
     narrow compatibility shift using the model's own already-computed
     bounding box (parse_e_model_file's real +0x3c1c min-X/+0x3c20
     extent-X fields) rather than a bare hardcoded -64: re-centers
     whatever this port's own DOOR.E actually contains, and is a no-op
     for every already-correctly-centered model (DFRAME's own full
     [-128,128] bounding box, including its riser posts, centers to a
     0.0 shift). Scoped to catalog==14 only -- every other catalog this
     path draws was already confirmed correctly positioned this
     session, so don't risk perturbing them. */
  if (catalog == 14) {
    int _pcx = *(int *)_anim;
    float _minX = *(float *)(_anim + 0x3c1c);
    float _extX = *(float *)(_anim + 0x3c20);
    float _shiftX = -(_minX + _extX * 0.5f);
    int _px;
    for (_px = 0; _px < _pcx; _px++) {
      *(float *)(_anim + 8 + _px*0xc) += _shiftX;
    }
    /* The per-face U computation just below reads point.X back against
       this SAME model's own +0x3c1c min-X field (see its own comment --
       `(point.X - min_X) / extent_X`, mapped across the texture width).
       Shifting the points without also shifting min-X by the identical
       amount leaves U computed against the model's OLD, now-stale
       origin -- confirmed live (QA report: "door UVs are incorrect...
       U seems offset by half"): half of U's range went negative,
       visibly wrapping the texture's own left/right edges into the
       middle of the door instead of its true edges. extent_X is
       unchanged by a pure translation, so only min-X needs updating. */
    *(float *)(_anim + 0x3c1c) = _minX + _shiftX;
    if (getenv("UW_DEBUG_DOOR_POS"))
      fprintf(stderr, "[doorpos] catalog=14 (DOOR.E) re-centered: minX=%g extX=%g shiftX=%g new_minX=%g\n",
              (double)_minX, (double)_extX, (double)_shiftX, (double)(_minX + _shiftX));
  }
  if (getenv("UW_DEBUG_DOOR_POS")) {
    int _pc2 = *(int *)_anim;
    float _minx = 0.0f, _maxx = 0.0f;
    int _pj;
    for (_pj = 0; _pj < _pc2; _pj++) {
      float _x = *(float *)(_anim + 8 + _pj*0xc);
      if (_pj == 0 || _x < _minx) _minx = _x;
      if (_pj == 0 || _x > _maxx) _maxx = _x;
    }
    fprintf(stderr, "[doorpos] catalog=%d anchor=(%d,%d,%d) heading=%d local_X=[%g,%g] bbox_minX=%g bbox_extX=%g\n",
            (int)catalog, (int)(short)DAT_0023b904, (int)(short)DAT_0023b91c, (int)(short)DAT_0023b920,
            (int)heading, (double)_minx, (double)_maxx,
            (double)*(float *)(_anim + 0x3c1c), (double)*(float *)(_anim + 0x3c20));
  }
  _model_minz = 0.0f;
  _model_extz = 1.0f;
  { int _pc = *(int *)_anim;
    if (_pc > 0) {
      float _maxz = 0.0f;
      int _pi;
      for (_pi = 0; _pi < _pc; _pi++) {
        float _z = *(float *)(_anim + 8 + _pi*0xc + 8);
        if (_pi == 0 || _z < _model_minz) _model_minz = _z;
        if (_pi == 0 || _z > _maxz) _maxz = _z;
      }
      if (_maxz > _model_minz) _model_extz = _maxz - _model_minz;
    }
  }
  iVar16 = faces_remaining + -1;
  if (-1 < iVar16) {
    iVar2 = (int)(short)tex_w;
    iVar3 = (int)(short)tex_h;
    iVar22 = iVar16 * 0x60;
    local_58 = (byte *)(iVar16 * 0x18);
    do {
      sVar7 = DAT_000da47c;
      _face_rec = iVar22 + _anim + 0xc14;
      _v_offset = 0xc;
      _vmin_bits = *(undefined4 *)(_anim + 0x3c24);
      _vext_bits = *(undefined4 *)(_anim + 0x3c28);
      { int _vc = *(int *)_face_rec, _ci, _flat = (_vc > 1);
        float _y0 = *(float *)(_anim + 8 + *(int *)(_face_rec + 4) * 0xc + 4);
        for (_ci = 1; _ci < _vc && _ci < 4; _ci++)
          if (*(float *)(_anim + 8 + *(int *)(_face_rec + 4 + _ci * 4) * 0xc + 4) != _y0) _flat = 0;
        if (_flat) {
          _v_offset = 0x10;
          memcpy(&_vmin_bits, &_model_minz, 4);
          memcpy(&_vext_bits, &_model_extz, 4);
        }
      }
      *(char *)(_face_rec + 0x4c) = (char)DAT_000da47c;
      *(char *)(_face_rec + 0x4d) = (char)((ushort)sVar7 >> 8);
      cVar9 = (char)(sVar7 >> 0xf);
      *(char *)(_face_rec + 0x4e) = cVar9;
      *(char *)(_face_rec + 0x4f) = cVar9;
      cVar9 = (&DAT_00086c09)[iVar1];
      pbVar23 = &DAT_00086c08 + iVar1;
      pbVar6 = (byte *)0x0;
      if (cVar9 != '\0') {
        pbVar23 = (byte *)(uint)(byte)(&DAT_00086c0a)[iVar1];
        pbVar6 = pbVar23;
      }
      if (cVar9 != '\0' && pbVar6 != (byte *)0x0) {
        uVar10 = (undefined2)((uint)pbVar23 >> 8);
        *(char *)(_face_rec + 0x50) = (char)pbVar23;
      }
      else {
        uVar10 = 0;
        *(char *)(_face_rec + 0x50) = cVar9;
      }
      *(char *)(_face_rec + 0x51) = (char)uVar10;
      *(char *)(_face_rec + 0x52) = (char)((ushort)uVar10 >> 8);
      *(undefined1 *)(_face_rec + 0x53) = 0;
      *(char *)(_face_rec + 0x18) = (char)texptr;
      *(char *)(_face_rec + 0x19) = (char)((uint)texptr >> 8);
      *(char *)(_face_rec + 0x1a) = (char)((uint)texptr >> 0x10);
      *(char *)(_face_rec + 0x1b) = (char)((uint)texptr >> 0x18);
      *(char *)(_face_rec + 0x1c) = (char)tex_w;
      *(char *)(_face_rec + 0x1d) = (char)(tex_w >> 8);
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x1e) = (short)tex_w >> 0xf;
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x1f) = (short)tex_w >> 0xf;
      *(char *)(_face_rec + 0x20) = (char)tex_h;
      *(char *)(_face_rec + 0x21) = (char)(tex_h >> 8);
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x22) = (short)tex_h >> 0xf;
                    // WARNING: Store size is inaccurate
      *(short *)(_face_rec + 0x23) = (short)tex_h >> 0xf;
      if (catalog_u == 1) {
        local_60 = 0;
        do {
          iVar27 = (int)(short)DAT_0023b91c;
          iVar30 = *(int *)(_anim + 0xc14 + ((int)local_58 + local_60) * 4 + 4);
          uVar17 = ordfloat_int_to_float2(iVar27);
          uVar17 = ordfloat_add(*(undefined4 *)(iVar30 * 0xc + _anim + 0xc),uVar17);
          iVar18 = ordfloat_gt(uVar17,0x44800000);
          if (iVar18 != 0) {
            uVar17 = ordfloat_int_to_float2(0x400 - iVar27);
            puVar24 = (undefined1 *)((iVar30 + 1) * 0xc + _anim);
            *puVar24 = (char)uVar17;
            puVar24[1] = (char)((uint)uVar17 >> 8);
            puVar24[2] = (char)((uint)uVar17 >> 0x10);
            puVar24[3] = (char)((uint)uVar17 >> 0x18);
          }
          local_60 = (local_60 + 1) * 0x10000 >> 0x10;
        } while (local_60 < 4);
        _vptr = *(int *)(_face_rec + 8) * 0xc + _anim;
        uVar17 = ordfloat_int_to_float2(iVar2 + -1);
        puVar26 = (undefined4 *)(_anim + 0x3c1c);
        uVar19 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar19 = ordfloat_mul(uVar19,0x3b800000);
        ordfloat_mul(uVar19,uVar17);
        uVar19 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x24) = (char)uVar19;
        *(char *)(_face_rec + 0x25) = (char)((uint)uVar19 >> 8);
        *(char *)(_face_rec + 0x26) = (char)((uint)uVar19 >> 0x10);
        *(char *)(_face_rec + 0x27) = (char)((uint)uVar19 >> 0x18);
        uVar19 = ordfloat_int_to_float2(iVar3 + -1);
        puVar28 = (undefined4 *)(_anim + 0x3c24);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        ordfloat_mul(uVar20,uVar19);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x28) = (char)uVar20;
        *(char *)(_face_rec + 0x29) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 7),
                          CONCAT12(*(undefined1 *)(_face_rec + 6),
                                   CONCAT11(*(undefined1 *)(_face_rec + 5),*(undefined1 *)(_face_rec + 4))
                                  )) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        ordfloat_mul(uVar20,uVar17);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x2c) = (char)uVar20;
        *(char *)(_face_rec + 0x2d) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2e) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2f) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        ordfloat_mul(uVar20,uVar19);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x30) = (char)uVar20;
        *(char *)(_face_rec + 0x31) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x32) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x33) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0x13),
                          CONCAT12(*(undefined1 *)(_face_rec + 0x12),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0x11),
                                            *(undefined1 *)(_face_rec + 0x10)))) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        ordfloat_mul(uVar20,uVar17);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x34) = (char)uVar20;
        *(char *)(_face_rec + 0x35) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x36) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x37) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        ordfloat_mul(uVar20,uVar19);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x38) = (char)uVar20;
        *(char *)(_face_rec + 0x39) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x3a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x3b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0xf),
                          CONCAT12(*(undefined1 *)(_face_rec + 0xe),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0xd),
                                            *(undefined1 *)(_face_rec + 0xc)))) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_mul(uVar20,0x3b800000);
        ordfloat_mul(uVar20,uVar17);
        uVar17 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x3c) = (char)uVar17;
        *(char *)(_face_rec + 0x3d) = (char)((uint)uVar17 >> 8);
        *(char *)(_face_rec + 0x3e) = (char)((uint)uVar17 >> 0x10);
        *(char *)(_face_rec + 0x3f) = (char)((uint)uVar17 >> 0x18);
        uVar17 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar17 = ordfloat_mul(uVar17,0x3b800000);
        ordfloat_mul(uVar17,uVar19);
        uVar17 = ordfloat_uint_to_float();
      }
      else if (((catalog_u == 0xe) || (catalog_u == 0xf)) || (catalog_u == 0x13)) {
        _vptr = *(int *)(_face_rec + 0xc) * 0xc + _anim;
        uVar17 = ordfloat_int_to_float2(iVar2 + -1);
        puVar26 = (undefined4 *)(_anim + 0x3c1c);
        uVar19 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        puVar28 = (undefined4 *)(_anim + 0x3c20);
        uVar19 = ordfloat_div(uVar19,*puVar28);
        ordfloat_mul(uVar19,uVar17);
        uVar19 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x24) = (char)uVar19;
        *(char *)(_face_rec + 0x25) = (char)((uint)uVar19 >> 8);
        *(char *)(_face_rec + 0x26) = (char)((uint)uVar19 >> 0x10);
        *(char *)(_face_rec + 0x27) = (char)((uint)uVar19 >> 0x18);
        uVar19 = ordfloat_int_to_float2(iVar3 + -1);
        puVar31 = (undefined4 *)(_anim + 0x3c24);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        puVar32 = (undefined4 *)(_anim + 0x3c28);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        ordfloat_mul(uVar20,uVar19);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x28) = (char)uVar20;
        *(char *)(_face_rec + 0x29) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0x13),
                          CONCAT12(*(undefined1 *)(_face_rec + 0x12),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0x11),
                                            *(undefined1 *)(_face_rec + 0x10)))) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        ordfloat_mul(uVar20,uVar17);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x2c) = (char)uVar20;
        *(char *)(_face_rec + 0x2d) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2e) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2f) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        ordfloat_mul(uVar20,uVar19);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x30) = (char)uVar20;
        *(char *)(_face_rec + 0x31) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x32) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x33) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 7),
                          CONCAT12(*(undefined1 *)(_face_rec + 6),
                                   CONCAT11(*(undefined1 *)(_face_rec + 5),*(undefined1 *)(_face_rec + 4))
                                  )) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        ordfloat_mul(uVar20,uVar17);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x34) = (char)uVar20;
        *(char *)(_face_rec + 0x35) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x36) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x37) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        ordfloat_mul(uVar20,uVar19);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x38) = (char)uVar20;
        *(char *)(_face_rec + 0x39) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x3a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x3b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0xb),
                          CONCAT12(*(undefined1 *)(_face_rec + 10),
                                   CONCAT11(*(undefined1 *)(_face_rec + 9),*(undefined1 *)(_face_rec + 8))
                                  )) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        ordfloat_mul(uVar20,uVar17);
        uVar17 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x3c) = (char)uVar17;
        *(char *)(_face_rec + 0x3d) = (char)((uint)uVar17 >> 8);
        *(char *)(_face_rec + 0x3e) = (char)((uint)uVar17 >> 0x10);
        *(char *)(_face_rec + 0x3f) = (char)((uint)uVar17 >> 0x18);
        uVar17 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar17 = ordfloat_div(uVar17,_vext_bits);
        ordfloat_mul(uVar17,uVar19);
        uVar17 = ordfloat_uint_to_float();
      }
      else {
        _vptr = *(int *)(_face_rec + 8) * 0xc + _anim;
        uVar17 = ordfloat_int_to_float2(iVar2 + -1);
        puVar26 = (undefined4 *)(_anim + 0x3c1c);
        uVar19 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        puVar28 = (undefined4 *)(_anim + 0x3c20);
        uVar19 = ordfloat_div(uVar19,*puVar28);
        ordfloat_mul(uVar19,uVar17);
        uVar19 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x24) = (char)uVar19;
        *(char *)(_face_rec + 0x25) = (char)((uint)uVar19 >> 8);
        *(char *)(_face_rec + 0x26) = (char)((uint)uVar19 >> 0x10);
        *(char *)(_face_rec + 0x27) = (char)((uint)uVar19 >> 0x18);
        uVar19 = ordfloat_int_to_float2(iVar3 + -1);
        puVar31 = (undefined4 *)(_anim + 0x3c24);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        puVar32 = (undefined4 *)(_anim + 0x3c28);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        ordfloat_mul(uVar20,uVar19);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x28) = (char)uVar20;
        *(char *)(_face_rec + 0x29) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 7),
                          CONCAT12(*(undefined1 *)(_face_rec + 6),
                                   CONCAT11(*(undefined1 *)(_face_rec + 5),*(undefined1 *)(_face_rec + 4))
                                  )) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        ordfloat_mul(uVar20,uVar17);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x2c) = (char)uVar20;
        *(char *)(_face_rec + 0x2d) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x2e) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x2f) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        ordfloat_mul(uVar20,uVar19);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x30) = (char)uVar20;
        *(char *)(_face_rec + 0x31) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x32) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x33) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0x13),
                          CONCAT12(*(undefined1 *)(_face_rec + 0x12),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0x11),
                                            *(undefined1 *)(_face_rec + 0x10)))) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        ordfloat_mul(uVar20,uVar17);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x34) = (char)uVar20;
        *(char *)(_face_rec + 0x35) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x36) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x37) = (char)((uint)uVar20 >> 0x18);
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar20 = ordfloat_div(uVar20,_vext_bits);
        ordfloat_mul(uVar20,uVar19);
        uVar20 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x38) = (char)uVar20;
        *(char *)(_face_rec + 0x39) = (char)((uint)uVar20 >> 8);
        *(char *)(_face_rec + 0x3a) = (char)((uint)uVar20 >> 0x10);
        *(char *)(_face_rec + 0x3b) = (char)((uint)uVar20 >> 0x18);
        _vptr = CONCAT13(*(undefined1 *)(_face_rec + 0xf),
                          CONCAT12(*(undefined1 *)(_face_rec + 0xe),
                                   CONCAT11(*(undefined1 *)(_face_rec + 0xd),
                                            *(undefined1 *)(_face_rec + 0xc)))) * 0xc + _anim;
        uVar20 = ordfloat_sub(*(undefined4 *)(_vptr + 8),*puVar26);
        uVar20 = ordfloat_div(uVar20,*puVar28);
        ordfloat_mul(uVar20,uVar17);
        uVar17 = ordfloat_uint_to_float();
        *(char *)(_face_rec + 0x3c) = (char)uVar17;
        *(char *)(_face_rec + 0x3d) = (char)((uint)uVar17 >> 8);
        *(char *)(_face_rec + 0x3e) = (char)((uint)uVar17 >> 0x10);
        *(char *)(_face_rec + 0x3f) = (char)((uint)uVar17 >> 0x18);
        uVar17 = ordfloat_sub(*(undefined4 *)(_vptr + _v_offset),_vmin_bits);
        uVar17 = ordfloat_div(uVar17,_vext_bits);
        ordfloat_mul(uVar17,uVar19);
        uVar17 = ordfloat_uint_to_float();
      }
      *(char *)(_face_rec + 0x40) = (char)uVar17;
      *(char *)(_face_rec + 0x41) = (char)((uint)uVar17 >> 8);
      *(char *)(_face_rec + 0x42) = (char)((uint)uVar17 >> 0x10);
      *(char *)(_face_rec + 0x43) = (char)((uint)uVar17 >> 0x18);
      local_58 = (byte *)((char *)local_58 + -0x18);
      iVar22 = iVar22 + -0x60;
      faces_remaining = faces_remaining + -1;
    } while (faces_remaining != 0);
  }
  uVar17 = ordfloat_int_to_float2((int)(short)DAT_0023b904);
  *(char *)(_anim + 0xc08) = (char)uVar17;
  *(char *)(_anim + 0xc09) = (char)((uint)uVar17 >> 8);
  *(char *)(_anim + 0xc0a) = (char)((uint)uVar17 >> 0x10);
  *(char *)(_anim + 0xc0b) = (char)((uint)uVar17 >> 0x18);
  uVar17 = ordfloat_int_to_float2((int)(short)DAT_0023b91c);
  *(char *)(_anim + 0xc0c) = (char)uVar17;
  *(char *)(_anim + 0xc0d) = (char)((uint)uVar17 >> 8);
  *(char *)(_anim + 0xc0e) = (char)((uint)uVar17 >> 0x10);
  *(char *)(_anim + 0xc0f) = (char)((uint)uVar17 >> 0x18);
  uVar17 = ordfloat_int_to_float2((int)(short)DAT_0023b920);
  *(char *)(_anim + 0xc10) = (char)uVar17;
  *(char *)(_anim + 0xc11) = (char)((uint)uVar17 >> 8);
  *(char *)(_anim + 0xc12) = (char)((uint)uVar17 >> 0x10);
  *(char *)(_anim + 0xc13) = (char)((uint)uVar17 >> 0x18);
  if (((catalog_u != 0xe) && (catalog_u != 0xf)) && (catalog_u != 0xc)) goto LAB_000640ec;
  uVar21 = (int)((*(ushort *)(obj + 2) >> 7 & 7) + 1) >> 1;
  if (3 < uVar21) {
    uVar21 = 0;
  }
  switch(((uw_mobile_object_t *)g_player_object)->hdr.heading) {
  case 0:
    break;
  case 1:
    goto LAB_00064070;
  case 2:
LAB_00064070:
    uVar19 = (&DAT_00086cec)[uVar21 * 8];
    uVar17 = (&DAT_00086ce8)[uVar21 * 8];
    goto LAB_000640c0;
  case 3:
    goto LAB_00064088;
  case 4:
LAB_00064088:
    uVar19 = (&DAT_00086cf4)[uVar21 * 8];
    uVar17 = (&DAT_00086cf0)[uVar21 * 8];
    goto LAB_000640c0;
  case 5:
    goto LAB_0006409c;
  case 6:
LAB_0006409c:
    uVar19 = (&DAT_00086cfc)[uVar21 * 8];
    uVar17 = (&DAT_00086cf8)[uVar21 * 8];
    goto LAB_000640c0;
  case 7:
    break;
  default:
    goto switchD_00064038_default;
  }
  uVar19 = (&DAT_00086ce4)[uVar21 * 8];
  uVar17 = (&DAT_00086ce0)[uVar21 * 8];
LAB_000640c0:
  apply_model_position_offset(_anim,uVar17,0,uVar19);
switchD_00064038_default:
  scale_model_part_offsets(_anim,0x3f800000,0x3f99999a,0x3f800000);
LAB_000640ec:
  if (sVar13 < 0) {
    if (catalog_u == 7) {
      scale_model_part_offsets(_anim,0x40200000,0x40200000,0x40200000);
    }
    if ((sVar13 < 0) && ((catalog_u == 0x1b || (catalog_u == 0x19)))) {
      scale_model_part_offsets(_anim,0x40000000,0x40000000,0x40000000);
    }
  }
  if ((catalog_u == 0xe) || (catalog_u == 0xf)) {
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] swing: catalog=%d DAT_0018957a=%d local_7c(before)=%d\n",
              (int)catalog_u, (int)(short)DAT_0018957a, (int)(short)local_7c);
    uVar17 = ordfloat_int_to_float2((int)(short)DAT_0018957a);
    uVar19 = ordfloat_int_to_float2((int)(short)local_7c);
    ordfloat_add(uVar17,uVar19);
    local_7c = ordfloat_uint_to_float();
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] swing: local_7c(after)=%d\n", (int)(short)local_7c);
  }
  uVar17 = ordfloat_int_to_float2((int)(short)local_7c);
  uVar17 = ordfloat_mul(uVar17,0x38000000);
  ordfloat_mul(uVar17,0x43340000);
  for (sVar13 = ordfloat_uint_to_float(); 0x168 < sVar13; sVar13 = sVar13 + -0x168) {
  }
  for (; sVar13 < 0; sVar13 = sVar13 + 0x168) {
  }
  /* General object tuner (UW_MODEL_TUNER=1) -- runs for every catalog
     this path draws, not just doors, so whatever real .E-model object
     is currently on screen (boulder, bridge, door frame, ...) gets a
     live rotation_offset field. Reset to 0 whenever the catalog on
     screen changes so a leftover rotation from tuning one object
     doesn't silently carry into the next. Applied directly to the
     model's own real final rotation angle (degrees) before it's handed
     to build_euler_rotation_matrix -- nudging this while walking around
     an object spins the OBJECT, letting every face's true orientation
     be checked without needing to physically walk a full circle around
     it in the level (not always possible -- against a wall, etc). Door-
     specific fields (wide_center/edge_offset) stay conditional on
     catalog_u==1 in the SAME panel/dbgui_begin call, since dbgui_begin
     resets the field list each time it's called and only one object's
     panel can be shown per frame anyway (whichever ran last). */
  if ((int)catalog_u != g_tune_last_catalog) {
    g_tune_last_catalog = (int)catalog_u;
    g_tune_rotation_offset = 0.0;
  }
  /* Was gated behind UW_MODEL_TUNER=1 -- on unconditionally now, per
     direct request ("turn the debug panel on by default instead of
     needing an env var"), so no relaunch-with-env-var step is needed
     to use it. Still only POPULATES the field list here; the panel
     itself stays hidden until backtick (dbgui_visible()/g_visible in
     debug_ui.c, unchanged), so this has zero effect on normal play or
     any of the regression demo scripts -- none of them press backtick. */
  { char _tune_title[48];
    snprintf(_tune_title, sizeof(_tune_title), "Object Tuner (catalog=%d)", (int)catalog_u);
    dbgui_begin(_tune_title);
    dbgui_field_double("rotation_offset", &g_tune_rotation_offset, 5.0);
    /* HACK: was `if (catalog_u == 1)` / `if (catalog_u == 0xe || 0xf)`
       separately -- each door-related tunable only showed up in the
       panel on whichever exact catalog happened to be the LAST thing
       drawn in the whole frame (dbgui_begin's own field list resets on
       every single catalog change, not once per door), so with a
       frame/leaf pair (or any other scene content) drawing in between,
       the panel would show catalog=1's row often and catalog=0xe/0xf's
       hardly ever, or vice versa, depending on draw order -- confirmed
       live via QA report ("only able to tune leaf_hinge_offset on
       doors of type 14, not 1"). Show every door-family tunable
       together whenever ANY door catalog (frame or either leaf id)
       last drew, instead of splitting them by exact catalog, so
       whichever one happens to land last this frame still exposes the
       whole set. */
    if ((catalog_u == 1) || (catalog_u == 0xe) || (catalog_u == 0xf)) {
      dbgui_field_double("wide_center", &g_tune_wide_center, 1.0);
      dbgui_field_double("edge_offset", &g_tune_edge_offset, 1.0);
      dbgui_field_double("leaf_hinge_offset", &g_tune_leaf_hinge_offset, 8.0);
    }
    dbgui_field_button("dump_3d_frame", uw_debug_request_3d_frame_dump);
    dbgui_field_toggle("hide_walls", &g_uw_hide_walls);
    dbgui_field_toggle("pick_diag", &g_uw_debug_pick_diag);
    dbgui_end();
  }
  sVar13 = (short)((int)sVar13 + (int)g_tune_rotation_offset);
  for (; 0x168 < sVar13; sVar13 = sVar13 + -0x168) {
  }
  for (; sVar13 < 0; sVar13 = sVar13 + 0x168) {
  }
  /* Real fix for the QA report "door frame... offset 16 units into the
     wall... depending on direction" -- the generic per-object anchor
     emit_tile_features computed is a floor-item slot position (one of
     8 sub-tile slots, 32 units apart); it can land near a tile's true
     center (128 from the tile's own origin) but, with only 8 discrete
     slots, can never land exactly ON it (the two closest slots, 3 and
     4, are 112/144 -- each 16 units off from 128, confirmed live via
     UW_DEBUG_DOOR_POS's tile-grid dump). A full-tile-wide object like
     DFRAME.E needs its along-the-wall axis at the tile's EXACT center,
     not a slot approximation -- confirmed via a fresh Ghidra decompile
     of process_visible_tile_cell that wall vertices themselves sit at
     exact tile boundaries (`tileIndex * 256`), never slot-quantized.
     Recompute both axes from the tile grid index: the axis DFRAME.E's
     own wide local X rotates into (from the model's real final rotation
     angle, not assumed) gets the tile's exact center; the wall-
     perpendicular axis the model's thin local Z rotates into.

     The perpendicular axis is ALSO the tile's exact center, not an
     edge-relative offset -- live QA via the tuner (g_tune_wide_center/
     g_tune_edge_offset below) confirmed both at 128.0 look correct once
     a separate real bug (the anchor being baked into this model's own
     scratch buffer BEFORE this fix used to run, so only the leaf's
     later, separate call ever picked up an edited value -- see that
     fix's own commit) stopped masking whether the frame was actually
     responding. The earlier "wall has real thickness, perpendicular
     axis sits at edge+16" theory was itself wrong, arrived at while
     that masking bug made the frame look like it needed a different
     number than the leaf when actually neither did -- it just wasn't
     visibly moving. At edge_offset==128 the near/far edge-side branch
     below collapses to the same value either way (128 or 256-128), so
     this is really just "exact tile center on both axes," the edge-
     relative framing kept only because a future non-full-tile-width
     model might genuinely need it. Scoped to catalog_u==1 (DFRAME,
     always drawn first) since DFRAME and the leaf share this same
     anchor. */
  if (catalog_u == 1) {
    /* wide_center/edge_offset are now populated by the general object-
       tuner panel above (see its own comment) -- kept live-editable via
       the SAME globals, just no longer with their own separate
       dbgui_begin call here. */
    double _rad = (double)sVar13 * (3.14159265358979 / 180.0);
    int _wideIsX = fabs(cos(_rad)) > fabs(sin(_rad));
    int _tileOriginX = (int)DAT_0023b4e4 * 256;
    int _tileOriginZ = (int)DAT_0023b4e8 * 256;
    int _wide = (int)g_tune_wide_center;
    int _edge = (int)g_tune_edge_offset;
    if (_wideIsX) {
      DAT_0023b904 = (short)(_tileOriginX + _wide);
      DAT_0023b920 = (short)(_tileOriginZ +
          (((int)(short)DAT_0023b920 - _tileOriginZ < 128) ? _edge : 256 - _edge));
    } else {
      DAT_0023b920 = (short)(_tileOriginZ + _wide);
      DAT_0023b904 = (short)(_tileOriginX +
          (((int)(short)DAT_0023b904 - _tileOriginX < 128) ? _edge : 256 - _edge));
    }
    if (getenv("UW_DEBUG_DOOR_POS"))
      fprintf(stderr, "[doorpos] wall-plane fix: angle=%d wideIsX=%d tileOrigin=(%d,%d) wide=%d edge=%d -> anchor=(%d,%d)\n",
              (int)sVar13, _wideIsX, _tileOriginX, _tileOriginZ, _wide, _edge,
              (int)(short)DAT_0023b904, (int)(short)DAT_0023b920);
    /* REAL BUG (found via QA: "this seems to just tune the door leaf
       position, not the door frame"): the world anchor was already
       baked into THIS model's own scratch buffer (_anim + 0xc08..0xc13,
       the translation build_euler_rotation_matrix/transform_points_by_
       matrix actually apply) several dozen lines above, from whatever
       DAT_0023b904/920 held BEFORE this fix ran -- so adjusting the
       globals here came too late to affect the frame's (catalog_u==1)
       own transform this same call; only the LEAF's separate call
       (catalog_u==14, later, re-running this same bake with the
       by-then-already-modified globals) ever picked up the change.
       Re-bake right here with the corrected values so this call's own
       transform (a few lines below) actually uses them -- same
       ordfloat_int_to_float2 float-encode + byte-split writes as the original
       bake, just re-run after the correction instead of before it. */
    uVar17 = ordfloat_int_to_float2((int)(short)DAT_0023b904);
    *(char *)(_anim + 0xc08) = (char)uVar17;
    *(char *)(_anim + 0xc09) = (char)((uint)uVar17 >> 8);
    *(char *)(_anim + 0xc0a) = (char)((uint)uVar17 >> 0x10);
    *(char *)(_anim + 0xc0b) = (char)((uint)uVar17 >> 0x18);
    uVar17 = ordfloat_int_to_float2((int)(short)DAT_0023b91c);
    *(char *)(_anim + 0xc0c) = (char)uVar17;
    *(char *)(_anim + 0xc0d) = (char)((uint)uVar17 >> 8);
    *(char *)(_anim + 0xc0e) = (char)((uint)uVar17 >> 0x10);
    *(char *)(_anim + 0xc0f) = (char)((uint)uVar17 >> 0x18);
    uVar17 = ordfloat_int_to_float2((int)(short)DAT_0023b920);
    *(char *)(_anim + 0xc10) = (char)uVar17;
    *(char *)(_anim + 0xc11) = (char)((uint)uVar17 >> 8);
    *(char *)(_anim + 0xc12) = (char)((uint)uVar17 >> 0x10);
    *(char *)(_anim + 0xc13) = (char)((uint)uVar17 >> 0x18);
  }
  /* See g_tune_leaf_hinge_offset's own comment: the leaf currently
     shares DFRAME's own centered anchor as-is (baked into _anim above,
     on catalog_u==1's own earlier call, and simply left in place for
     this call to reuse) -- offset it here, along the same "wide" axis
     wide_center itself offsets, by a live-tunable amount so the pivot
     can be walked over to the real hinge edge visually instead of
     guessed. Zero by default: no behavior change until tuned. */
  if (((catalog_u == 0xe) || (catalog_u == 0xf)) && (g_tune_leaf_hinge_offset != 0.0)) {
    double _rad = (double)sVar13 * (3.14159265358979 / 180.0);
    int _wideIsX = fabs(cos(_rad)) > fabs(sin(_rad));
    int _off = (int)g_tune_leaf_hinge_offset;
    short _hx = DAT_0023b904;
    short _hz = DAT_0023b920;
    if (_wideIsX) {
      _hx = (short)(_hx + _off);
    } else {
      _hz = (short)(_hz + _off);
    }
    if (getenv("UW_DEBUG_DOOR_POS"))
      fprintf(stderr, "[doorpos] leaf hinge offset: angle=%d wideIsX=%d off=%d anchor=(%d,%d)->(%d,%d)\n",
              (int)sVar13, _wideIsX, _off, (int)DAT_0023b904, (int)DAT_0023b920, (int)_hx, (int)_hz);
    uVar17 = ordfloat_int_to_float2((int)_hx);
    *(char *)(_anim + 0xc08) = (char)uVar17;
    *(char *)(_anim + 0xc09) = (char)((uint)uVar17 >> 8);
    *(char *)(_anim + 0xc0a) = (char)((uint)uVar17 >> 0x10);
    *(char *)(_anim + 0xc0b) = (char)((uint)uVar17 >> 0x18);
    uVar17 = ordfloat_int_to_float2((int)_hz);
    *(char *)(_anim + 0xc10) = (char)uVar17;
    *(char *)(_anim + 0xc11) = (char)((uint)uVar17 >> 8);
    *(char *)(_anim + 0xc12) = (char)((uint)uVar17 >> 0x10);
    *(char *)(_anim + 0xc13) = (char)((uint)uVar17 >> 0x18);
  }
  { int _rec_start = DAT_0023b83c;
  int _vtx_start = DAT_0023b838;
  build_euler_rotation_matrix(_anim,0,(int)sVar13,0);
  transform_points_by_matrix(&DAT_000a85d0,_anim);
  DAT_0023b83c = DAT_000a85d4;
  DAT_0023b838 = DAT_000a85d0;
  if (getenv("UW_DEBUG_DOOR_POS"))
    fprintf(stderr, "[doorpos] catalog=%d emitted records [%d,%d) vtx [%d,%d) faces_remaining_was=%d\n",
            (int)catalog, _rec_start, (int)DAT_0023b83c, _vtx_start, (int)DAT_0023b838, faces_remaining);
  /* transform_points_by_matrix is original, unmodified code -- it has no
     idea g_tile_texptr_emit[] exists. It copies each face's texture
     pointer (texptr) into the arena record's own byte offset +0x18..+0x1b,
     but that's only a 32-bit field, truncating this platform's real 64-bit
     pointer (the SAME bug class as _face_rec/_vptr above, just baked into
     original code this time). This codebase's own rasterizer doesn't even
     read that embedded field for this record format -- EVERY other writer
     of this same 0x60-byte-stride record instead populates the side-
     channel g_tile_texptr_emit[record_index], which this original
     function was never taught to do. Backfill it for every record this
     call just added. */
  { int _ti; for (_ti = _rec_start; _ti < DAT_0023b83c; _ti++) {
      if ((unsigned)_ti < UW_MAX_VIS_TILES) g_tile_texptr_emit[_ti] = texptr;
    }
  }
  /* QA report: "backwards object model face sorting in a boulder
     object... a portion of the floor shows through the boulder,
     because far faces are drawn but near faces are hidden." This
     engine has no z-buffer and no backface culling (confirmed
     repeatedly this session), so a model's own faces are painted in
     whatever order its .E file happens to list its parts -- a face
     physically BEHIND another one, if listed later, simply overdraws
     it, reading as "a hole in the model" with no geometry/winding/UV
     bug involved. This exact fix (depth-sort a model's own just-
     emitted records, farthest-from-camera first, right after they're
     written) was already built, tested, and confirmed live for the
     OLD emit_model_object/g_model_map path this session (git log
     79e78aa on this project's own e-model-texturing branch) -- ported
     here rather than re-invented, adapted only for this function's own
     record range tracking (_rec_start/DAT_0023b83c, already present
     above for the texptr backfill) since the underlying arena record
     format (&DAT_000acde4 family, 0x60-byte stride) and vertex-position
     storage (DAT_000a85d0_backing, 0xc-byte stride) are the exact same
     shared structures transform_points_by_matrix just wrote into --
     confirmed by reading its own field offsets, not assumed. Opt-out
     via UW_MODEL_NO_DEPTH_SORT=1 for A/B comparison; on by default. */
  if (getenv("UW_MODEL_NO_DEPTH_SORT") == 0 && DAT_0023b83c > _rec_start) {
    double _eye_x = *(float *)&DAT_000db438, _eye_y = *(float *)&DAT_000db43c, _eye_z = *(float *)&DAT_000db440;
    int _n = DAT_0023b83c - _rec_start;
    if (_n <= 64) {
      double _dist[64];
      int _order[64];
      int _k;
      for (_k = 0; _k < _n; _k++) {
        int rec = _rec_start + _k;
        int rb = rec * 0x60;
        int iv0 = *(int *)(&DAT_000acde8 + rb);
        int iv1 = *(int *)(&DAT_000acdec + rb);
        int iv2 = *(int *)(&DAT_000acdf0 + rb);
        int iv3 = *(int *)(&DAT_000acdf4 + rb);
        float *p0 = (float *)((char *)DAT_000a85d0_backing + 8 + iv0*0xc);
        float *p1 = (float *)((char *)DAT_000a85d0_backing + 8 + iv1*0xc);
        float *p2 = (float *)((char *)DAT_000a85d0_backing + 8 + iv2*0xc);
        float *p3 = (float *)((char *)DAT_000a85d0_backing + 8 + iv3*0xc);
        double cx = (p0[0]+p1[0]+p2[0]+p3[0]) * 0.25;
        double cy = (p0[1]+p1[1]+p2[1]+p3[1]) * 0.25;
        double cz = (p0[2]+p1[2]+p2[2]+p3[2]) * 0.25;
        double dx = cx - _eye_x, dy = cy - _eye_y, dz = cz - _eye_z;
        _dist[_k] = dx*dx + dy*dy + dz*dz;
        _order[_k] = _k;
        if (getenv("UW_DEBUG_FACE51") && (_k == 50 || _k == 51 || _k == 52)) {
          fprintf(stderr, "[face51] catalog=%d k=%d iv=(%d,%d,%d,%d) p0=(%g,%g,%g) p1=(%g,%g,%g) p2=(%g,%g,%g) p3=(%g,%g,%g)\n",
                  (int)catalog, _k, iv0, iv1, iv2, iv3,
                  p0[0], p0[1], p0[2], p1[0], p1[1], p1[2],
                  p2[0], p2[1], p2[2], p3[0], p3[1], p3[2]);
        }
      }
      /* Small N -- plain insertion sort, descending distance (farthest
         first, so nearer faces paint last and correctly cover them). */
      { int _a;
        for (_a = 1; _a < _n; _a++) {
          int _oi = _order[_a]; double _od = _dist[_oi];
          int _b = _a - 1;
          while (_b >= 0 && _dist[_order[_b]] < _od) { _order[_b+1] = _order[_b]; _b--; }
          _order[_b+1] = _oi;
        }
      }
      if (getenv("UW_DEBUG_MODEL")) {
        int _changed = 0, _kk;
        for (_kk = 0; _kk < _n; _kk++) if (_order[_kk] != _kk) _changed = 1;
        fprintf(stderr, "[model-depthsort] catalog=%d n=%d order_changed=%d order=[", (int)catalog, _n, _changed);
        for (_kk = 0; _kk < _n; _kk++) fprintf(stderr, "%d ", _order[_kk]);
        fprintf(stderr, "] dist=[");
        for (_kk = 0; _kk < _n; _kk++) fprintf(stderr, "%.0f ", _dist[_kk]);
        fprintf(stderr, "]\n");
      }
      /* Apply via cycle-sort in place, whole-record memcpy plus the
         parallel g_tile_texptr_emit[] side channel. */
      { unsigned char _tmp[0x60]; void *_tmp_tex;
        unsigned char _done[64] = {0};
        int _a;
        for (_a = 0; _a < _n; _a++) {
          int _cur, _src;
          if (_done[_a] || _order[_a] == _a) { _done[_a] = 1; continue; }
          _cur = _a;
          memcpy(_tmp, (char *)&DAT_000acde4 + (_rec_start+_a)*0x60, 0x60);
          _tmp_tex = g_tile_texptr_emit[_rec_start+_a];
          while (!_done[_cur]) {
            _src = _order[_cur];
            _done[_cur] = 1;
            if (_src == _a) break;
            memcpy((char *)&DAT_000acde4 + (_rec_start+_cur)*0x60, (char *)&DAT_000acde4 + (_rec_start+_src)*0x60, 0x60);
            g_tile_texptr_emit[_rec_start+_cur] = g_tile_texptr_emit[_rec_start+_src];
            _cur = _src;
          }
          memcpy((char *)&DAT_000acde4 + (_rec_start+_cur)*0x60, _tmp, 0x60);
          g_tile_texptr_emit[_rec_start+_cur] = _tmp_tex;
        }
      }
      if (getenv("UW_DEBUG_MODEL"))
        fprintf(stderr, "[model-depthsort] catalog=%d rec=[%d,%d) eye=(%g,%g,%g)\n",
                (int)catalog, _rec_start, (int)DAT_0023b83c, _eye_x, _eye_y, _eye_z);
    }
  }
  }
  if (local_7a != 0xffff) {
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    tex_w = get_catalog_sprite_width(8);
    *DAT_00110fc0 = tex_w;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = local_7a - 1 & 1;
    DAT_00189580 = local_7a - 1 & 1;
    DAT_00110fc0 = DAT_00110fc0 + 1;
  }
  *DAT_00110fc0 = 0x18;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  return;
}



// WARNING: Removing unreachable block (ram,0x000647ac)

// was FUN_00064384
void emit_anim_object_frames(door_type,obj)
uint door_type;
ushort * obj;

{
  short sVar1;
  int iVar3;
  byte bVar4;
  undefined2 uVar5;
  ushort uVar6;
  ushort uVar7;
  int iVar8;
  undefined4 uVar9;
  uint uVar10;
  uint uVar11;
  bool bVar12;
  char local_38;
  char local_37;
  ushort local_36;
  short local_34;
  short local_32;
  char local_30;
  short local_28;
  short sVar2;
  
  door_type = door_type & 7;
  if (getenv("UW_DEBUG_DOOR"))
    fprintf(stderr, "[door] emit_anim_object_frames: door_type(cond_idx)=%d rec_word0=0x%04x rec_b1=0x%02x\n",
            door_type, (unsigned)*obj, (unsigned)*(byte *)((char *)obj + 1));
  local_38 = '\0';
  local_37 = '\x01';
  local_34 = -1;
  DAT_0023b834 = 1;
  if (door_type == 6) {
    local_34 = DAT_0023b91c;
    local_38 = '\x01';
    local_37 = -1;
    local_32 = DAT_0023b91c + (short)((*(byte *)((char *)obj + 1) & 0xe) >> 1) * -0x30;
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    uVar5 = get_catalog_sprite_width(5);
    *DAT_00110fc0 = uVar5;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = *(byte *)((char *)obj + 1) >> 1 & 7;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    DAT_0018957a = (undefined2)((*(byte *)((char *)obj + 1) & 0xe) >> 1);
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] anim_frames(type6): obj0=0x%04x bVar1=0x%02x DAT_0018957a=%d\n",
              (unsigned)*obj, (unsigned)*(byte *)((char *)obj + 1), (int)(short)DAT_0018957a);
    *DAT_00110fc0 = 0x4c;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (*(byte *)((char *)obj + 1) >> 1 & 7) * -0x30 + 0xd0;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = 0x400;
    sVar1 = local_32;
  }
  else {
    if (((*obj & 0xe00) != 0) || ((*obj & 0x1c0) == 0x1c0)) {
      DAT_0023b91c = DAT_0023b91c + -0xc0;
    }
    sVar1 = DAT_0023b91c;
    bVar4 = *(byte *)((char *)obj + 1);
    *DAT_00110fc0 = 2;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    /* Reverting the previous "quality" HACK here: fresh Ghidra headless
       decompiles of this exact function (FUN_00064384) and
       scheduler_step_entry (scheduler_step_entry) from the real UU.exe binary
       (Ghidra project /Users/ccuddigan/Projects/UW1/decomp) prove this
       line's original form -- `(bVar4 >> 1 & 7)` -- was always correct,
       and the earlier "fix" (substituting a fabricated quality-derived
       0/1-times-5 value) was itself the bug, not a fix. `bVar4 >> 1 & 7`
       reads bits 9-11 of the door's own word0 -- the exact bits
       scheduler_step_entry's class-flag-bit-2 branch (`uVar8 == 4` a
       few hundred lines down) directly increments by the elapsed-ticks
       parameter every tick it runs, merged back via the same `& 0xe00`
       / `& 0x1e00` masks. Confirmed live (UW_DEBUG_DOOR): doors' real
       loaded class-7 behavior flags are 0x84 -- bit 2 (0x04) set, bit 0
       (0x01, the quality-ramp path this session's earlier fix wrongly
       assumed doors used) NOT set. Quality (obj[3] & 0x3f) really does
       just flip +8/-8 open/closed in one step (via open_door_object/
       scheduler_finish_entry) -- that part of the earlier analysis was
       right -- it's simply not what drives the swing angle at all; the
       gradual six-to-eight-step sweep the original game shows comes
       entirely from this word0 field via the bit-2 path instead, which
       was already correctly implemented elsewhere in this file and
       simply never got a chance to work because this line was
       overriding its result with a fixed, oversized substitute instead
       of reading it. */
    iVar8 = ((bVar4 >> 5 & 1) * 2 + -1) * (bVar4 >> 1 & 7);
    uVar5 = get_catalog_sprite_width(5);
    *DAT_00110fc0 = uVar5;
    DAT_00110fc0 = DAT_00110fc0 + 1;
    *DAT_00110fc0 = (ushort)((uint)(iVar8 * 0x10000000) >> 0x10);
    DAT_0018957a = (undefined2)((iVar8 * 0x10000 >> 0x10) << 0xc);
    if (getenv("UW_DEBUG_DOOR"))
      fprintf(stderr, "[door] anim_frames: door_type=%u obj0=0x%04x bVar4(obj+1)=0x%02x openbits=%d sign=%d iVar8=%d DAT_0018957a=%d quality(obj[3]&0x3f)=%d obj[3]=0x%04x\n",
              door_type, (unsigned)*obj, (unsigned)bVar4, (bVar4 >> 1 & 7), (bVar4 >> 5 & 1), iVar8, (int)(short)DAT_0018957a,
              (int)(obj[3] & 0x3f), (unsigned)obj[3]);
  }
  local_36 = 0x330 - sVar1;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x4c;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = local_36;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = 0x800;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  if (((*(byte *)((char *)obj + 1) & 0xe) == 0) || (local_34 != -1)) goto LAB_000647e4;
  uVar7 = (obj[1] >> 7) + DAT_0023b4a0 * -2;
  iVar8 = ((int)DAT_0023b904 - (int)g_current_view->view_x) * 0x10000;
  iVar3 = ((int)DAT_0023b920 - (int)g_current_view->view_y) * 0x10000;
  uVar6 = uVar7 & 3;
  if (uVar6 == 0) {
LAB_00064794:
    if (iVar3 < 0) {
LAB_0006479c:
      iVar8 = 1;
    }
    else {
LAB_00064754:
      iVar8 = 0;
    }
  }
  else {
    sVar1 = (short)((uint)iVar8 >> 0x10);
    sVar2 = (short)((uint)iVar3 >> 0x10);
    if (uVar6 == 1) {
      bVar12 = SBORROW4((int)sVar1,-(int)sVar2);
      iVar8 = (int)sVar1 + (int)sVar2;
LAB_00064750:
      if (iVar8 < 0 != bVar12) goto LAB_0006479c;
      goto LAB_00064754;
    }
    iVar3 = iVar8;
    if (uVar6 == 2) goto LAB_00064794;
    if (uVar6 == 3) {
      bVar12 = SBORROW4((int)sVar1,(int)sVar2);
      iVar8 = (int)sVar1 - (int)sVar2;
      goto LAB_00064750;
    }
    iVar8 = (int)local_32;
  }
  if (((int)(((uint)(*(byte *)((char *)obj + 1) >> 5) + (int)((short)(uVar7 & 7) >> 2) + iVar8) *
            0x10000) >> 0x10 & 1U) == 0) {
    local_37 = -1;
    local_38 = '\x01';
  }
LAB_000647e4:
  *DAT_00110fc0 = 2;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  uVar7 = get_catalog_sprite_width(3);
  *DAT_00110fc0 = uVar7;
  DAT_00110fc0 = DAT_00110fc0 + 1;
  *DAT_00110fc0 = (*(byte *)((char *)obj + 1) >> 1 & 7) + (ushort)(-1 < local_34);
  DAT_00110fc0 = DAT_00110fc0 + 1;
  DAT_00189576 = (short)((*(byte *)((char *)obj + 1) & 0xe) >> 1) + (ushort)(-1 < local_34);
  uVar10 = (uint)local_38;
  if (uVar10 < 2) {
    do {
      if ((int)uVar10 < 0) {
        return;
      }
      if (uVar10 == 0) {
        if (DAT_0023b818 < '\x01') {
          emit_diagonal_wall_texture_select(0,DAT_0023bc88,DAT_0023b91c >> 6 & 0xff,g_current_tile->wall_tex);
        }
        *DAT_00110fc0 = 2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = (short)((uint)((int)DAT_0023b824 * (int)DAT_0023b824) >> 8) * local_36 - 1;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = 2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        uVar7 = get_catalog_sprite_width(7);
        *DAT_00110fc0 = uVar7;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_0023b824 * DAT_0023b824 - 1;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = 2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        uVar7 = get_catalog_sprite_width(6);
        *DAT_00110fc0 = uVar7;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        DAT_0018957e = DAT_0023b824 * DAT_0023b824 + -1;
        DAT_0018957c = DAT_000b4620 + DAT_0023b81c * 8;
        if (DAT_0023b830 != 0) {
          *DAT_00110fc0 = 0xae;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = (g_current_tile->wall_tex) + 0xc0;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          DAT_000da47c = (g_current_tile->wall_tex) + 0xc0;
        }
        *DAT_00110fc0 = 0xb2;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        *DAT_00110fc0 = DAT_0023b81c;
        DAT_00110fc0 = DAT_00110fc0 + 1;
        uVar9 = 1;
        uVar11 = g_current_tile->wall_tex;
LAB_00064cdc:
        emit_catalog_object(uVar9,obj,(obj[1] >> 7 & 7) << 1,uVar11);
      }
      else {
        if (DAT_0023b830 != 0) {
          *DAT_00110fc0 = 0xae;
          DAT_00110fc0 = DAT_00110fc0 + 1;
          *DAT_00110fc0 = DAT_0023b830 - 1;
          DAT_000da47c = DAT_0023b830 - 1;
          DAT_00110fc0 = DAT_00110fc0 + 1;
        }
        if (local_34 < 0) {
          local_28 = (short)door_type;
          if (local_28 == 7) {
            if (DAT_0023b818 < '\x01') {
              emit_diagonal_wall_texture_select(0,DAT_0023bc88,DAT_0023b91c >> 6 & 0xff,
                           g_current_tile->wall_tex);
            }
            *DAT_00110fc0 = 0xb2;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = DAT_0023b81c;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = 2;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = DAT_000b4620 + DAT_0023b81c * 8;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            *DAT_00110fc0 = DAT_0023b824 * DAT_0023b824 - 1;
            DAT_00110fc0 = DAT_00110fc0 + 1;
            uVar9 = 0xf;
            uVar11 = g_current_tile->wall_tex;
          }
          else {
            /* Was `DAT_00202734 + door_type + 0x30` -- matches
               load_door_frames's own (fixed) scratch base; see that
               function's comment for why the original binary's
               formula collided with the HUD icon preload range, and
               why the base moved again from 60000 to 20000 (the first
               fix broke a DIFFERENT thing: emit_catalog_object's own
               `frame_or_texid < 0` sentinel check, a signed 16-bit
               comparison -- 60000 wrapped negative as a short and got
               silently reinterpreted as "no frame, use the catalog's
               internal animation" instead of a real frame index). */
            uVar11 = 20000 + door_type;
            uVar9 = 0xe;
          }
          if (getenv("UW_DEBUG_DOOR"))
            fprintf(stderr, "[door] emit_anim_object_frames: local_34=%d local_28=%d -> emit_catalog_object(catalog=%d, heading=%d, frame_or_id=%d)\n",
                    (int)local_34, (int)local_28, (int)uVar9, (int)((obj[1] >> 7 & 7) << 1), (int)uVar11);
          goto LAB_00064cdc;
        }
        DAT_0023b91c = local_34;
        if (getenv("UW_DEBUG_DOOR"))
          fprintf(stderr, "[door] emit_anim_object_frames: local_34=%d -> emit_catalog_object(catalog=0xc, heading=%d, frame_or_id=0)\n",
                  (int)local_34, (int)((obj[1] >> 7 & 7) << 1));
        emit_catalog_object(0xc,obj,(obj[1] >> 7 & 7) << 1,0);
        DAT_0023b91c = local_32;
      }
      local_30 = (char)uVar10;
      uVar10 = ((int)local_37 + (int)local_30) * 0x1000000 >> 0x18;
    } while ((int)uVar10 < 2);
  }
  return;
}



// was FUN_0001e594 -- adds a per-axis float offset (param_2/3/4, each an
// int converted to float via ordfloat_int_to_float2) to the model animation
// block's own stored position floats at offsets 0xc08/0xc0c/0xc10 (x/y/z).
// The one real caller (emit_catalog_object, src/models.c) uses it to
// apply a heading-dependent directional offset (looked up from the
// DAT_00086cXX direction tables) before scale_model_part_offsets below
// applies its own per-axis scale -- together these look like the
// position+scale setup for a swinging door/portcullis model's visual
// offset from its tile-grid position.
void apply_model_position_offset(param_1,param_2,param_3,param_4)
char *param_1;  /* was `int` -- truncated the real _anim pointer
                   emit_catalog_object passes in, latent until the
                   DAT_00202c9X object-property fix let real property
                   data reach a nonzero case here */
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;

{
  undefined4 uVar1;
  
  uVar1 = ordfloat_int_to_float2(param_2);
  uVar1 = ordfloat_add(*(undefined4 *)(param_1 + 0xc08),uVar1);
  *(char *)(param_1 + 0xc08) = (char)uVar1;
  *(char *)(param_1 + 0xc09) = (char)((uint)uVar1 >> 8);
  *(char *)(param_1 + 0xc0a) = (char)((uint)uVar1 >> 0x10);
  *(char *)(param_1 + 0xc0b) = (char)((uint)uVar1 >> 0x18);
  uVar1 = ordfloat_int_to_float2(param_3);
  uVar1 = ordfloat_add(*(undefined4 *)(param_1 + 0xc0c),uVar1);
  *(char *)(param_1 + 0xc0c) = (char)uVar1;
  *(char *)(param_1 + 0xc0d) = (char)((uint)uVar1 >> 8);
  *(char *)(param_1 + 0xc0e) = (char)((uint)uVar1 >> 0x10);
  *(char *)(param_1 + 0xc0f) = (char)((uint)uVar1 >> 0x18);
  uVar1 = ordfloat_int_to_float2(param_4);
  uVar1 = ordfloat_add(*(undefined4 *)(param_1 + 0xc10),uVar1);
  *(char *)(param_1 + 0xc10) = (char)uVar1;
  *(char *)(param_1 + 0xc11) = (char)((uint)uVar1 >> 8);
  *(char *)(param_1 + 0xc12) = (char)((uint)uVar1 >> 0x10);
  *(char *)(param_1 + 0xc13) = (char)((uint)uVar1 >> 0x18);
  return;
}



// was FUN_0001e6f0 -- multiplies (ordfloat_mul, float MULTIPLY) a model
// animation block's own position floats by per-axis scale factors
// (param_2/3/4). param_1[0] is read as a sub-part count; each iteration
// scales the 3 floats at the current element's own offsets +8/+0xc/+0x10
// (bytes) and then advances by 3 ints (12 bytes) to the next element --
// so this walks an array of per-part transform records, scaling each
// part's position in place. Real call sites (emit_catalog_object,
// src/models.c) use it for door/portcullis-family catalog objects,
// scaling by (1.0,1.2,1.0), (2.5,2.5,2.5) or (2.0,2.0,2.0) depending on
// the specific catalog id -- the exact per-part record layout beyond
// these 3 float fields isn't otherwise confirmed.
void scale_model_part_offsets(param_1,param_2,param_3,param_4)
int * param_1;
undefined4 param_2;
undefined4 param_3;
undefined4 param_4;

{
  undefined4 uVar1;
  int *piVar2;
  int iVar3;
  
  iVar3 = 0;
  piVar2 = param_1;
  if (0 < *param_1) {
    do {
      uVar1 = ordfloat_mul(piVar2[2],param_2);
      *(char *)(piVar2 + 2) = (char)uVar1;
      *(char *)((char *)piVar2 + 9) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 10) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0xb) = (char)((uint)uVar1 >> 0x18);
      uVar1 = ordfloat_mul(CONCAT13(*(undefined1 *)((char *)piVar2 + 0xf),
                                    CONCAT12(*(undefined1 *)((char *)piVar2 + 0xe),
                                             CONCAT11(*(undefined1 *)((char *)piVar2 + 0xd),
                                                      (char)piVar2[3]))),param_3);
      *(char *)(piVar2 + 3) = (char)uVar1;
      *(char *)((char *)piVar2 + 0xd) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 0xe) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0xf) = (char)((uint)uVar1 >> 0x18);
      uVar1 = ordfloat_mul(CONCAT13(*(undefined1 *)((char *)piVar2 + 0x13),
                                    CONCAT12(*(undefined1 *)((char *)piVar2 + 0x12),
                                             CONCAT11(*(undefined1 *)((char *)piVar2 + 0x11),
                                                      (char)piVar2[4]))),param_4);
      *(char *)(piVar2 + 4) = (char)uVar1;
      iVar3 = iVar3 + 1;
      *(char *)((char *)piVar2 + 0x11) = (char)((uint)uVar1 >> 8);
      *(char *)((char *)piVar2 + 0x12) = (char)((uint)uVar1 >> 0x10);
      *(char *)((char *)piVar2 + 0x13) = (char)((uint)uVar1 >> 0x18);
      piVar2 = piVar2 + 3;
    } while (iVar3 < *param_1);
  }
  return;
}


// was FUN_00038680 -- loads every catalog 3D object model (.E files:
// door frame, footbridge, bench, lotus, rocks, arrow, beam, shrine,
// doors, tilemap decals, grave, gate, table, chest, nightstand,
// barrel/closet, chair, bed) via parse_e_model_file into their
// respective geometry buffers, then decompresses a final large shared
// data block. The one-time 3D model-catalog init.
void load_3d_object_models()

{
  parse_e_model_file(s__DATA3D_DFRAME_E_00085620,&DAT_00114c1c,1);
  parse_e_model_file(s__DATA3D_FBRIDGE_E_0008560c,&DAT_00118848,1);
  parse_e_model_file(s__DATA3D_BENCH_E_000855fc,&DAT_0011c474,0);
  parse_e_model_file(s__DATA3D_40LOTUS_E_000855e8,&DAT_001200a0,0);
  parse_e_model_file(s__DATA3D_ROCKSMAL_E_000855d4,&DAT_00123ccc,0);
  parse_e_model_file(s__DATA3D_ROCKMED_E_000855c0,&DAT_001278f8,0);
  parse_e_model_file(s__DATA3D_ROCKBIG_E_000855ac,&DAT_0012b524,1);
  parse_e_model_file(s__DATA3D_ARROW_E_0008559c,&DAT_0012f150,0);
  parse_e_model_file(s__DATA3D_BEAM_E_0008558c,&DAT_00132d7c,0);
  parse_e_model_file(s__DATA3D_NEWPILL_E_00085578,&DAT_001369a8,0);
  parse_e_model_file(s__DATA3D_SHRINE_E_00085564,&DAT_0013a5d4,0);
  parse_e_model_file(s__DATA3D_NEWPORT_E_00085550,&DAT_0013e200,0);
  parse_e_model_file(s__DATA3D_NEWPORT_E_00085550,&DAT_00141e2c,0);
  parse_e_model_file(s__DATA3D_DOOR_E_00085540,&DAT_00145a58,0);
  parse_e_model_file(s__DATA3D_DOOR_E_00085540,&DAT_00149684,0);
  parse_e_model_file(s__DATA3D_TMAP16X16_E_0008552c,&DAT_0014d2b0,0);
  parse_e_model_file(s__DATA3D_TMAP16X16_E_0008552c,&DAT_00150edc,0);
  parse_e_model_file(s__DATA3D_TMAP16X16_E_0008552c,&DAT_00154b08,0);
  parse_e_model_file(s__DATA3D_GRAVE_E_0008551c,&DAT_00158734,0);
  parse_e_model_file(s__DATA3D_TMAP16X16_E_0008552c,&DAT_0015c360,0);
  parse_e_model_file(s__DATA3D_TMAP32X32_E_00085508,&DAT_0015ff8c,0);
  parse_e_model_file(s__DATA3D_TMAP64X64_E_000854f4,&DAT_00163bb8,0);
  parse_e_model_file(s__DATA3D_GATE_E_000854e4,&DAT_001677e4,0);
  parse_e_model_file(s__DATA3D_TABLF3_E_000854d0,&DAT_0016b410,0);
  parse_e_model_file(s__DATA3D_CHEST_E_000854c0,&DAT_0016f03c,0);
  parse_e_model_file(s__DATA3D_NITESTAN_E_000854ac,&DAT_00172c68,0);
  parse_e_model_file(s__DATA3D_BARRCLOS_E_00085498,&DAT_00176894,0);
  parse_e_model_file(s__DATA3D_CHAIRSIM_E_00085484,&DAT_0017a4c0,0);
  parse_e_model_file(s__DATA3D_BED2_E_00085474,&DAT_0017e0ec,0);
  ce_memmove(&DAT_00189590,&DAT_00110ff0,0x78580);
  return;
}


// was FUN_00020a74 -- parses one DATA3D/*.E text-format 3D model script
// (param_1 = file path, param_2 = ~16KB per-model output buffer) into
// point positions and per-part (per-face) vertex-index lists. Called 29
// times from load_3d_object_models at startup, once per model file. Point count
// lives at output offset 0, part count at offset 4, points at
// `8 + i*0xc` (3 back-to-back floats), parts at `0xc14 + p*0x60` (a
// vertex count then that many vertex-index ints from offset +4) -- see
// emit_catalog_object's own use of this layout. Despite computing a real
// per-face normal (vec3_sub + vec3_cross, see vec3_cross's comment) and
// resolving per-face color (EXTENDED_COLORS against g_model_known_ext_
// colors), neither survives into this output buffer -- confirmed by
// tracing the whole function, including the real ARM disassembly at the
// normal's call site, not just this decompile. Only point positions and
// vertex-index lists persist. Full writeup: object-rendering-findings.txt
// UPDATE (7)/(8).
/* Every .E model file in data/DATA3D/ is CRLF-terminated (confirmed via
   `xxd` on ROCKBIG.E: the PARTS block's last entry ends "...8);\r\n}\r\n").
   This parser's own end-of-PARTS-block check (s___c_1____00084954,
   "%*c%1[}]" -- skip exactly one character, then test for '}') was
   written assuming the ORIGINAL DOS/CE C runtime's text-mode fopen()
   would already have collapsed that \r\n to a single \n, leaving %*c's
   one-character skip landing exactly on '}'. POSIX fopen() never does
   that translation regardless of mode string, so on this port the raw
   \r survives, %*c skips it, and %1[}] then fails to match the '\n'
   that follows -- the parser concludes there's ANOTHER part still to
   read and parses one phantom extra PARTS entry off of "}\r\n\nNODES
   {\r\n..." garbage (a degenerate 1-vertex "face" that reliably fails
   to rasterize at runtime, confirmed live via UW_DEBUG_FACE51: every
   .E model tested gets its real face count plus exactly one broken
   trailing entry). Root-caused, not guessed: bisected with UW_DEBUG_
   NEARCLIP_RANGE that the failing record's own point count is 1 before
   near-clip ever touches it, then UW_DEBUG_EPARSE showed the parser
   itself emitting a 53rd part (vertcount=1) for ROCKBIG.E's 52-entry
   PARTS block. Fixed at the real root: strip \r from the file's own
   byte stream before scanning, replicating the text-mode translation
   the recovered scanf patterns were always written to expect, rather
   than reworking every parser call site individually. */
static void *uw_e_model_strip_cr(void *raw_fh) {
  FILE *f = (FILE *)raw_fh;
  long sz;
  char *buf;
  size_t n, r, w;
  FILE *clean;
  if (!f) return NULL;
  if (fseek(f, 0, SEEK_END) != 0) return f;
  sz = ftell(f);
  fseek(f, 0, SEEK_SET);
  if (sz <= 0) return f;
  buf = (char *)malloc((size_t)sz + 1);
  if (!buf) return f;
  n = fread(buf, 1, (size_t)sz, f);
  fclose(f);
  for (r = 0, w = 0; r < n; r++) {
    if (buf[r] != '\r') buf[w++] = buf[r];
  }
  buf[w] = 0;
  /* fmemopen keeps a reference to buf, not a copy -- intentionally never
     freed (one small per-model leak at load time, ~29 models total,
     same tolerance this codebase already extends to other load-time
     scratch allocations). */
  clean = fmemopen(buf, w, "r");
  return clean ? clean : f;
}

void parse_e_model_file(param_1,param_2,flip_winding)
char *param_1;
undefined1 * param_2;
int flip_winding; /* HACK: not part of the original recovered signature --
                      see its own use site (the "HACK: flip_winding"
                      comment, right before the PARTS block's per-face
                      vertex-reversal) for the full rationale. */

{
  char stack0xffdc3228_buf [256];
  char *stack0xffdc3228_ptr;
  undefined1 uVar1;
  char *pcVar2;
  int iVar3;
  int iVar4;
  int iVar5;
  int iVar6;
  undefined4 uVar7;
  undefined4 *puVar8;
  int *piVar9;
  int iVar10;
  undefined4 *puVar11;
  int *piVar12;
  undefined4 extraout_r3;
  undefined1 *puVar13;
  undefined1 *puVar14;
  undefined4 extraout_r3_00;
  char *pcVar15;
  undefined *puVar16;
  int *piVar17;
  char cVar18;
  int iVar19;
  int *piVar20;
  undefined4 *****pppppuVar21;
  char local_260 [4];
  /* local_25c/pvVar_fh hold the real fopen() handle from ce_fopen,
     used across the whole function's ce_fscanf (fscanf) calls -- were
     declared int, truncating the pointer on this 64-bit host. iVar3 is
     reused throughout this function for unrelated numeric work
     interleaved with "restore the file handle" (iVar3 = local_25c;)
     idioms right before each ce_fscanf call, so it couldn't just be
     retyped in place -- pvVar_fh takes over only those restore/use
     sites. */
  void *local_25c;
  void *pvVar_fh;
  undefined *local_258;
  int local_254;
  undefined4 local_250;
  undefined1 auStack_24c [4];
  undefined4 local_248;
  undefined4 ***pppuStack_244;
  undefined4 ****local_240;
  int local_23c;
  undefined4 local_238;
  undefined4 local_234;
  undefined4 local_230;
  undefined4 local_22c;
  int local_228;
  int local_224;
  int local_220;
  undefined1 local_21c [4];
  undefined4 local_218;
  undefined4 ***local_214;
  int local_210;
  int local_20c;
  int local_208;
  int local_204;
  undefined4 local_200;
  int local_1fc;
  undefined4 ****local_1f8;
  int local_1f4;
  undefined4 local_1f0;
  undefined1 auStack_1ec [4];
  int local_1e8;
  int local_1e4;
  int local_1e0;
  undefined4 ***local_1dc;
  undefined4 local_1d8;
  undefined4 ***local_1d4;
  undefined4 local_1d0;
  int local_1cc;
  undefined1 auStack_1c8 [104];
  undefined1 auStack_160 [16];
  undefined1 auStack_150 [16];
  undefined1 auStack_140 [16];
  char acStack_130 [260];

  local_258 = &DAT_000da480;
  ce_memset(acStack_130,0,0x104);
  pcVar2 = &DAT_0023cca8;
    stack0xffdc3228_ptr = acStack_130;
  do {
    cVar18 = *pcVar2;
    *stack0xffdc3228_ptr = cVar18; stack0xffdc3228_ptr = stack0xffdc3228_ptr + 1;
    pcVar2 = pcVar2 + 1;
  } while (cVar18 != '\0');
  ce_strcat(acStack_130,param_1);
  pvVar_fh = ce_fopen(acStack_130,&DAT_00084a24);
  pvVar_fh = uw_e_model_strip_cr(pvVar_fh);
  local_25c = pvVar_fh;
  /* This whole function's 11 fatal-error checks (NKDbgPrintfW message +
     terminate_process, killing the entire process) originally treated any
     malformed/unparseable ".E" model script as unrecoverable. That's far
     too strict for a recompile whose parser for this text format is
     itself reconstructed best-effort (see DAT_000849a8/DAT_000849ac/
     DAT_000849c8's declaration comments -- several of this parser's own
     format strings and keywords were unrecoverable and had to be
     inferred from a real file's content), so a wrong guess anywhere in
     this parser previously took the whole game down instead of just
     this one model. Redirected to the function's own cleanup label
     (fclose + bookkeeping) instead, so a bad/partially-understood model
     is skipped rather than fatal. */
  if (pvVar_fh == 0) {
    goto LAB_0002263c;
  }
  param_2[0xc08] = 0;
  param_2[0xc09] = 0;
  param_2[0xc0a] = 0;
  param_2[0xc0b] = 0;
  param_2[0xc0c] = 0;
  param_2[0xc0d] = 0;
  param_2[0xc0e] = 0;
  param_2[0xc0f] = 0;
  param_2[0xc10] = 0;
  param_2[0xc11] = 0;
  param_2[0xc12] = 0;
  param_2[0xc13] = 0;
  ce_fscanf(pvVar_fh,s__100s_00084a1c,auStack_1c8);
  iVar4 = ce_strcmp(auStack_1c8,s_BEGIN_00084a14);
  if (iVar4 != 0) {
    NKDbgPrintfW(s_Input_file_error__BEGIN_statemen_000849e8);
    goto LAB_0002263c;
  }
  pppppuVar21 = (undefined4 *****)&pppuStack_244;
  pcVar15 = &DAT_000d98c8;
  ce_fscanf(pvVar_fh,s__1s__a_z__1s_000849d8,auStack_24c,&DAT_000d98c8,pppppuVar21);
  /* Sizing-pass instrumentation (NEEDS_LIVE_INSTRUMENTATION): the %[a-z]
     conversion above has no width limit, so DAT_000d98c8's real need is
     whatever the longest actual token in the shipped .E model files is,
     not a value derivable from the format string alone. Reusing the
     existing model-parse debug var to find a true high-water mark. */
  if (getenv("UW_DEBUG_MODEL_PARSE_HWM")) {
    fprintf(stderr, "[model-parse-hwm] DAT_000d98c8 token_len=%d\n", (int)ce_strlen(&DAT_000d98c8));
  }
  pcVar2 = pcVar15;
  if (DAT_000db45c == (undefined1 *)0x0) {
    do {
      cVar18 = *pcVar15;
      pcVar15 = pcVar15 + 1;
      if (cVar18 != ' ') {
        *pcVar2 = cVar18;
        pcVar2 = pcVar2 + 1;
      }
    } while (cVar18 != '\0');
    DAT_000db45c = &DAT_000d98c8;
  }
  piVar20 = (int *)&DAT_000c9dd8;
  while( true ) {
    pvVar_fh = local_25c;
    iVar4 = ce_fscanf(local_25c,s__100s_1s_000849cc,auStack_1c8,local_260,pppppuVar21);
    /* Real .E files are inconsistent about a space before a block
       keyword's opening brace -- confirmed directly against the
       shipped files (data/DATA3D/ROCKBIG.E: "CLUSTERS {" with a space;
       data/DATA3D/BARRCLOS.E: "CLUSTERS{", "NODES{", "EXTENDED_COLORS{",
       "SCALE_SHIFT{" with none, even though its own POINTS/PARTS use
       the spaced form). The %100s half of this scanf includes a glued
       brace in the token itself, so every keyword strcmp below fails
       to match it, and %1s goes on to consume the block's own first
       real content byte in place of the delimiter this loop's error
       check expects -- confirmed live (UW_DEBUG_MODEL_PARSE_HWM showed
       zero NODES/CLUSTERS/ANIMATE/INTERSECTIONS records ever parsed
       across the full regression suite despite 12 of the 29 loaded
       models having real CLUSTERS+NODES content) and in a live run's
       own "error:_CLUSTERS{,(" / "error:_NODES{,L" console output.
       Normalize: split a trailing '{' off the token and push the
       wrongly-consumed byte back onto the stream so the block-specific
       parser below still sees it, exactly as if the file had the
       spaced form. */
    if (iVar4 == 2) {
      size_t _tklen = ce_strlen(auStack_1c8);
      if (_tklen > 0 && ((char *)auStack_1c8)[_tklen - 1] == '{') {
        ((char *)auStack_1c8)[_tklen - 1] = '\0';
        ungetc(local_260[0], (FILE *)local_25c);
        local_260[0] = '{';
      }
    }
    if (getenv("UW_DEBUG_MODEL_TOKENS"))
      fprintf(stderr, "[model-token] file=%s iVar4=%d token='%s' delim='%c'\n", param_1, iVar4, auStack_1c8, local_260[0]);
    if (((iVar4 == -1) && (iVar5 = ce_strncmp(auStack_1c8,&DAT_000849c8,3), iVar5 == 0)) ||
       ((iVar4 != 0 && (iVar5 = ce_strcmp(auStack_1c8,&DAT_000849c8), iVar5 == 0))))
    goto LAB_0002263c;
    if (iVar4 == -1) break;
    if ((iVar4 != 2) || (local_260[0] != '{')) {
      NKDbgPrintfW(s_error___s__c_000849b8,auStack_1c8,(int)local_260[0]);
    }
    iVar4 = ce_strcmp(auStack_1c8,s_VERSION_000849b0);
    if (iVar4 == 0) {
      ce_fscanf(pvVar_fh,&DAT_000849ac,&DAT_000db454);
      pcVar2 = &DAT_000849a8;
LAB_00022604:
      iVar4 = ce_fscanf(pvVar_fh,pcVar2,local_260);
    }
    else {
      iVar4 = ce_strcmp(auStack_1c8,s_NAMES_000849a0);
      if (iVar4 == 0) {
        puVar16 = &DAT_000da480;
        do {
          pppppuVar21 = (undefined4 *****)&pppuStack_244;
          local_1cc = ce_fscanf(pvVar_fh,s__1s______1s_00084994,auStack_24c,puVar16,pppppuVar21);
          uVar7 = 0;
          if (local_1cc != 0) {
            iVar4 = ce_strlen(puVar16);
            puVar16 = puVar16 + iVar4 + 1;
            uVar7 = extraout_r3;
          }
          iVar4 = ce_fscanf(pvVar_fh,&DAT_000849a8,local_260,uVar7,pppppuVar21);
          DAT_000db458 = DAT_000db458 + 1;
        } while (local_260[0] == ';');
      }
      else {
        iVar4 = ce_strcmp(auStack_1c8,s_POINTS_0008498c);
        if (iVar4 == 0) {
          iVar5 = -10000;
          iVar3 = 10000;
          g_model_parse_point_count = 0;
          iVar4 = iVar3;
          iVar10 = iVar5;
          while( true ) {
            pppppuVar21 = (undefined4 *****)&local_214;
            iVar6 = ce_fscanf(local_25c,s__d__d__d__00084980,&local_204,&local_224,pppppuVar21);
            iVar19 = g_model_parse_point_count;
            if (iVar6 != 3) break;
            iVar6 = g_model_parse_point_count * 0x2c;
            (&DAT_000d2ab0)[iVar6] = (char)local_204;
            if (local_204 < iVar4) {
              iVar4 = local_204;
            }
            (&DAT_000d2ab1)[iVar6] = (char)((uint)local_204 >> 8);
            if (iVar10 < local_204) {
              iVar10 = local_204;
            }
            (&DAT_000d2ab2)[iVar6] = (char)((uint)local_204 >> 0x10);
            if (local_224 < iVar3) {
              iVar3 = local_224;
            }
            (&DAT_000d2ab3)[iVar6] = (char)((uint)local_204 >> 0x18);
            (&DAT_000d2ab4)[iVar6] = (char)local_224;
            if (iVar5 < local_224) {
              iVar5 = local_224;
            }
            (&DAT_000d2ab5)[iVar6] = (char)((uint)local_224 >> 8);
            (&DAT_000d2ab6)[iVar6] = (char)((uint)local_224 >> 0x10);
            (&DAT_000d2ab7)[iVar6] = (char)((uint)local_224 >> 0x18);
            (&DAT_000d2ab8)[iVar6] = (char)local_214;
            (&DAT_000d2ab9)[iVar6] = (char)((uint)local_214 >> 8);
            (&DAT_000d2aba)[iVar6] = (char)((uint)local_214 >> 0x10);
            (&DAT_000d2abb)[iVar6] = (char)((uint)local_214 >> 0x18);
            (&DAT_000d2ac8)[iVar6] = 8;
            (&DAT_000d2ac9)[iVar6] = 0;
            (&DAT_000d2aca)[iVar6] = 0;
            (&DAT_000d2acb)[iVar6] = 0;
            (&DAT_000d2abc)[iVar6] = 0;
            (&DAT_000d2abd)[iVar6] = 0;
            (&DAT_000d2abe)[iVar6] = 0;
            (&DAT_000d2abf)[iVar6] = 0;
            (&DAT_000d2ad0)[iVar6] = 0;
            (&DAT_000d2ad1)[iVar6] = 0;
            (&DAT_000d2ad2)[iVar6] = 0;
            (&DAT_000d2ad3)[iVar6] = 0;
            (&DAT_000d2ac0)[iVar6] = 0;
            (&DAT_000d2ac1)[iVar6] = 0;
            (&DAT_000d2ac2)[iVar6] = 0;
            (&DAT_000d2ac3)[iVar6] = 0;
            /* Was `ordfloat_int_to_float2()` with the argument dropped -- the two
               sibling conversions right below it (Y=local_224, Z=local_214)
               both pass their value explicitly; this one, the X coordinate,
               did not. Confirmed via a raw memory dump of the parsed
               ROCKSMAL.E buffer: every point's first float came out as a
               constant 3.0 (ordfloat_int_to_float2((float)x)'s bit pattern for x=3,
               whatever this build's calling convention happened to leave in
               the argument register) while Y/Z matched the source file
               exactly. Same "dropped argument, register-leftover idiom
               doesn't survive a literal recompile" bug class as everywhere
               else in this file. */
            uVar7 = ordfloat_int_to_float2(local_204);
            param_2[iVar19 * 0xc + 8] = (char)uVar7;
            param_2[iVar19 * 0xc + 9] = (char)((uint)uVar7 >> 8);
            param_2[iVar19 * 0xc + 10] = (char)((uint)uVar7 >> 0x10);
            param_2[iVar19 * 0xc + 0xb] = (char)((uint)uVar7 >> 0x18);
            uVar7 = ordfloat_int_to_float2(local_224);
            puVar13 = param_2 + (g_model_parse_point_count + 1) * 0xc;
            *puVar13 = (char)uVar7;
            puVar13[1] = (char)((uint)uVar7 >> 8);
            puVar13[2] = (char)((uint)uVar7 >> 0x10);
            puVar13[3] = (char)((uint)uVar7 >> 0x18);
            uVar7 = ordfloat_int_to_float2(local_214);
            iVar19 = g_model_parse_point_count;
            param_2[g_model_parse_point_count * 0xc + 0x10] = (char)uVar7;
            param_2[iVar19 * 0xc + 0x11] = (char)((uint)uVar7 >> 8);
            param_2[iVar19 * 0xc + 0x12] = (char)((uint)uVar7 >> 0x10);
            param_2[iVar19 * 0xc + 0x13] = (char)((uint)uVar7 >> 0x18);
            g_model_parse_point_count = g_model_parse_point_count + 1;
            if (getenv("UW_DEBUG_MODEL_PARSE_HWM")) {
              static int hwm_points = -1;
              if (g_model_parse_point_count > hwm_points) {
                hwm_points = g_model_parse_point_count;
                fprintf(stderr, "[model-parse-hwm] points: %d\n", hwm_points);
              }
            }
            if (600 < g_model_parse_point_count) {
              NKDbgPrintfW(s_Too_many_points___d__00084968);
              goto LAB_0002263c;
            }
          }
          DAT_000db4fc = g_model_parse_point_count;
          param_2[1] = (char)((uint)g_model_parse_point_count >> 8);
          *param_2 = (char)iVar19;
          param_2[2] = (char)((uint)iVar19 >> 0x10);
          param_2[3] = (char)((uint)iVar19 >> 0x18);
          uVar7 = ordfloat_int_to_float2(iVar4);
          param_2[0x3c1c] = (char)uVar7;
          param_2[0x3c1d] = (char)((uint)uVar7 >> 8);
          param_2[0x3c1e] = (char)((uint)uVar7 >> 0x10);
          param_2[0x3c1f] = (char)((uint)uVar7 >> 0x18);
          uVar7 = ordfloat_int_to_float2(iVar10 - iVar4);
          param_2[0x3c20] = (char)uVar7;
          param_2[0x3c21] = (char)((uint)uVar7 >> 8);
          param_2[0x3c22] = (char)((uint)uVar7 >> 0x10);
          param_2[0x3c23] = (char)((uint)uVar7 >> 0x18);
          uVar7 = ordfloat_int_to_float2(iVar3);
          param_2[0x3c24] = (char)uVar7;
          param_2[0x3c25] = (char)((uint)uVar7 >> 8);
          param_2[0x3c26] = (char)((uint)uVar7 >> 0x10);
          param_2[0x3c27] = (char)((uint)uVar7 >> 0x18);
          uVar7 = ordfloat_int_to_float2(iVar5 - iVar3);
          pcVar2 = &DAT_000849a8;
          param_2[0x3c28] = (char)uVar7;
          param_2[0x3c29] = (char)((uint)uVar7 >> 8);
          param_2[0x3c2a] = (char)((uint)uVar7 >> 0x10);
          param_2[0x3c2b] = (char)((uint)uVar7 >> 0x18);
          pvVar_fh = local_25c;
          goto LAB_00022604;
        }
        iVar4 = ce_strcmp(auStack_1c8,s_PARTS_00084960);
        if (iVar4 == 0) {
          DAT_000c8b00 = &DAT_000c4c38;
          g_model_parse_part_count = 0;
          do {
            iVar5 = ce_fscanf(pvVar_fh,s___c_1____00084954,local_260);
            iVar4 = 1;
            if (iVar5 != 1) {
              puVar13 = local_21c;
              pppppuVar21 = (undefined4 *****)&local_1dc;
              ce_fscanf(pvVar_fh,s__d__1s__d__x__00084944,&local_23c,&local_254,pppppuVar21,puVar13)
              ;
              iVar4 = g_model_parse_part_count;
              iVar5 = g_model_parse_part_count * 0x67;
              (&DAT_000c9e2f)[iVar5] = (char)local_1dc;
              (&DAT_000c9e30)[iVar5] = (char)((uint)local_1dc >> 8);
              (&DAT_000c9e31)[iVar5] = (char)((uint)local_1dc >> 0x10);
              (&DAT_000c9e32)[iVar5] = (char)((uint)local_1dc >> 0x18);
              (&DAT_000c9e28)[iVar5] = (undefined1)local_254;
              (&DAT_000c9e0e)[iVar5] = (char)iVar4;
              (&DAT_000c9e0f)[iVar5] = (char)((uint)iVar4 >> 8);
              (&DAT_000c9e10)[iVar5] = (char)((uint)iVar4 >> 0x10);
              (&DAT_000c9e11)[iVar5] = (char)((uint)iVar4 >> 0x18);
              (&DAT_000c9e37)[iVar5] = 0xff;
              (&DAT_000c9e38)[iVar5] = 0xff;
              (&DAT_000c9e39)[iVar5] = 0xff;
              (&DAT_000c9e3a)[iVar5] = 0xff;
              (&DAT_000c9e33)[iVar5] = 0xff;
              (&DAT_000c9e34)[iVar5] = 0xff;
              (&DAT_000c9e35)[iVar5] = 0xff;
              (&DAT_000c9e36)[iVar5] = 0xff;
              param_2[iVar4 * 0x60 + 0xc6c] = 1;
              param_2[iVar4 * 0x60 + 0xc6d] = 0;
              param_2[iVar4 * 0x60 + 0xc6e] = 0;
              param_2[iVar4 * 0x60 + 0xc6f] = 0;
              puVar14 = param_2 + (g_model_parse_part_count + 0x21) * 0x60;
              *puVar14 = 0xe0;
              puVar14[1] = 0;
              puVar14[2] = 0;
              puVar14[3] = 0;
              iVar4 = g_model_parse_part_count;
              iVar5 = g_model_parse_part_count * 0x67;
              if (local_23c == 4) {
                (&DAT_000c9e2b)[iVar5] = local_21c[0];
                (&DAT_000c9e2c)[iVar5] = local_21c[1];
                (&DAT_000c9e2d)[iVar5] = local_21c[2];
                (&DAT_000c9e2e)[iVar5] = local_21c[3];
                (&DAT_000c9de0)[iVar5] = 0xff;
                (&DAT_000c9de1)[iVar5] = 0xff;
                (&DAT_000c9de2)[iVar5] = 0xff;
                (&DAT_000c9de3)[iVar5] = 0xff;
                NKDbgPrintfW(s_got_bitmap__d___d_00084930);
                iVar4 = g_model_parse_part_count;
              }
              else {
                (&DAT_000c9e29)[iVar5] = local_21c[1];
                (&DAT_000c9de0)[iVar5] = local_21c[0];
                (&DAT_000c9de1)[iVar5] = 0;
                (&DAT_000c9de2)[iVar5] = 0;
                (&DAT_000c9de3)[iVar5] = 0;
              }
              iVar5 = local_23c;
              puVar16 = local_258;
              iVar10 = iVar4 * 0x67;
              if ((&DAT_000c9e26)[iVar10] == '\0') {
                uVar1 = 0xff;
                if (local_254 != 0x58) {
                  uVar1 = 0;
                }
                (&DAT_000c9e26)[iVar10] = uVar1;
              }
              if (iVar4 < DAT_000db458) {
                (&DAT_000c9e22)[iVar10] = (char)local_258;
                (&DAT_000c9e23)[iVar10] = (char)((uint)local_258 >> 8);
                (&DAT_000c9e24)[iVar10] = (char)((uint)local_258 >> 0x10);
                (&DAT_000c9e25)[iVar10] = (char)((uint)local_258 >> 0x18);
                iVar4 = ce_strlen(local_258);
                puVar16 = puVar16 + iVar4 + 1;
                local_258 = puVar16;
              }
              else {
                (&DAT_000c9e22)[iVar10] = 0;
                (&DAT_000c9e23)[iVar10] = 0;
                (&DAT_000c9e24)[iVar10] = 0;
                puVar16 = (undefined *)0x0;
                (&DAT_000c9e25)[iVar10] = 0;
              }
              piVar17 = DAT_000c8b00;
              if (iVar5 == 0) {
LAB_000218b8:
                piVar12 = DAT_000c8b00 + 1;
                (&DAT_000c9dd8)[iVar10] = (char)piVar12;
                (&DAT_000c9dd9)[iVar10] = (char)((uint)piVar12 >> 8);
                iVar5 = 0;
                DAT_000c8b00 = piVar12;
                (&DAT_000c9dda)[iVar10] = (char)((uint)piVar12 >> 0x10);
                (&DAT_000c9ddb)[iVar10] = (char)((uint)piVar12 >> 0x18);
                iVar4 = ce_fscanf(local_25c,&DAT_000849a8,local_260,(uint)piVar12 >> 0x18,
                                     pppppuVar21,puVar13);
                iVar3 = 0;
                do {
                  iVar19 = iVar3;
                  ce_fscanf(local_25c,s__d_1s_000848c8,&local_210,local_260);
                  iVar3 = iVar19 + 1;
                  *DAT_000c8b00 = local_210;
                  DAT_000c8b00 = DAT_000c8b00 + 1;
                  iVar10 = g_model_parse_part_count * 0x18 + iVar5;
                  iVar5 = iVar5 + 1;
                  puVar13 = param_2 + (iVar10 + 0x306) * 4;
                  *puVar13 = (char)local_210;
                  puVar13[1] = (char)((uint)local_210 >> 8);
                  puVar13[2] = (char)((uint)local_210 >> 0x10);
                  puVar13[3] = (char)((uint)local_210 >> 0x18);
                  iVar10 = g_model_parse_part_count;
                } while (local_260[0] == ',');
                param_2[g_model_parse_part_count * 0x60 + 0xc14] = (char)iVar5;
                param_2[iVar10 * 0x60 + 0xc15] = (char)((uint)iVar5 >> 8);
                param_2[iVar10 * 0x60 + 0xc16] = (char)((uint)iVar5 >> 0x10);
                param_2[iVar10 * 0x60 + 0xc17] = (char)((uint)iVar5 >> 0x18);
                /* HACK: flip_winding (new parameter, not part of the
                   original recovered signature) -- caller-supplied,
                   per-model opt-in to reverse every face's just-read
                   vertex list. Added because several models' faces render
                   backward: raster_triangle has a real, working backface
                   cull (confirmed this session via its left/right edge-
                   assignment gate in raster_textured_span -- not a bug, a
                   legitimate cheap cull the original engine relies on),
                   so a backward-wound face silently disappears depending
                   on which side of it the camera ends up on. A real
                   per-face fix would need each face's own normal compared
                   against the mesh's shape (tried, reverted per explicit
                   instruction: too complicated for what's just a handful
                   of known-bad models, and unreliable besides -- see
                   object-rendering-findings.txt milestone 13, where that
                   approach's own centroid heuristic gave the wrong answer
                   for the boulder) -- a flat "flip everything in this
                   file" flag, opted into only for the specific models
                   confirmed backward BY EYE (not the offline heuristic --
                   see milestone 13/14), is simpler and does the same job
                   for these models specifically (see the call sites in
                   the .E load list for which ones pass 1). */
                if (flip_winding && 1 < iVar3) {
                  int _flip_lo = 0, _flip_hi = iVar3 - 1;
                  while (_flip_lo < _flip_hi) {
                    int *_flip_pa = (int *)(param_2 + (g_model_parse_part_count * 0x18 + _flip_lo + 0x306) * 4);
                    int *_flip_pb = (int *)(param_2 + (g_model_parse_part_count * 0x18 + _flip_hi + 0x306) * 4);
                    int _flip_tmp = *_flip_pa;
                    *_flip_pa = *_flip_pb;
                    *_flip_pb = _flip_tmp;
                    _flip_lo++; _flip_hi--;
                  }
                }
                if (getenv("UW_DEBUG_EPARSE"))
                  fprintf(stderr, "[eparse] %s part=%d vertcount=%d\n", param_1, g_model_parse_part_count, iVar5);
                iVar5 = *(int *)(param_2 + g_model_parse_part_count * 0x60 + 0xc18);
                iVar10 = *(int *)(param_2 + g_model_parse_part_count * 0x60 + 0xc20);
                vec3_sub(param_2 + iVar5 * 0xc + 8,
                             param_2 + *(int *)(param_2 + g_model_parse_part_count * 0x60 + 0xc1c) * 0xc + 8,
                             auStack_150);
                vec3_sub(param_2 + iVar5 * 0xc + 8,param_2 + iVar10 * 0xc + 8,auStack_160);
                vec3_cross(auStack_160,auStack_150,auStack_140);
                if ((local_23c == 4) && (iVar3 != 4)) {
                  NKDbgPrintfW(s_Error__polygon__d__bitmap_must_h_00084898,g_model_parse_part_count);
                }
                if (iVar3 < 3) {
                  NKDbgPrintfW(s_Error__Part__d_is_a_polygon_with_00084868,g_model_parse_part_count,iVar3);
                }
                iVar5 = g_model_parse_part_count * 0x67;
                (&DAT_000c9ddc)[iVar5] = (char)iVar3;
                (&DAT_000c9ddd)[iVar5] = (char)((uint)iVar3 >> 8);
                (&DAT_000c9dde)[iVar5] = (char)((uint)iVar3 >> 0x10);
                (&DAT_000c9ddf)[iVar5] = (char)((uint)iVar3 >> 0x18);
                *piVar17 = iVar3;
                if (local_254 == 0x46) {
                  iVar5 = iVar3;
                  if (iVar3 < 0) {
                    iVar5 = iVar19 + 2;
                  }
                  iVar5 = iVar5 >> 1;
                  if (iVar5 != 0) {
                    puVar11 = (undefined4 *)
                              (*(int *)(&DAT_000c9dd8 + g_model_parse_part_count * 0x67) + iVar5 * 4);
                    puVar8 = (undefined4 *)
                             (*(int *)(&DAT_000c9dd8 + g_model_parse_part_count * 0x67) + (iVar3 - iVar5) * 4);
                    do {
                      iVar5 = iVar5 + -1;
                      uVar7 = puVar11[-1];
                      puVar11 = puVar11 + -1;
                      *puVar11 = *puVar8;
                      *puVar8 = uVar7;
                      puVar8 = puVar8 + 1;
                    } while (iVar5 != 0);
                  }
                }
                g_model_parse_part_count = g_model_parse_part_count + 1;
                if (getenv("UW_DEBUG_MODEL_PARSE_HWM")) {
                  static int hwm_parts = -1;
                  if (g_model_parse_part_count > hwm_parts) {
                    hwm_parts = g_model_parse_part_count;
                    fprintf(stderr, "[model-parse-hwm] parts: %d\n", hwm_parts);
                  }
                }
                if (0x15e < g_model_parse_part_count) {
                  NKDbgPrintfW(s_Too_many_polys_000848f8);
                  goto LAB_0002263c;
                }
                if (&DAT_000c8a90 < DAT_000c8b00) {
                  NKDbgPrintfW(s_Out_of_vertex_list_space_00084908);
                  goto LAB_0002263c;
                }
                ce_fscanf(local_25c,&DAT_000849a8,local_260);
                pvVar_fh = local_25c;
              }
              else if (iVar5 == 1) {
                iVar4 = ce_fscanf(pvVar_fh,s__d__d_000848d0,&local_1e0,&local_20c,pppppuVar21,
                                     puVar13);
                piVar17 = DAT_000c8b00;
                iVar5 = g_model_parse_part_count * 0x67;
                (&DAT_000c9ddc)[iVar5] = 2;
                (&DAT_000c9ddd)[iVar5] = 0;
                (&DAT_000c9dde)[iVar5] = 0;
                (&DAT_000c9ddf)[iVar5] = 0;
                *piVar17 = 2;
                iVar5 = g_model_parse_part_count * 0x67;
                piVar17 = DAT_000c8b00 + 1;
                DAT_000c8b00 = piVar17;
                (&DAT_000c9dd8)[iVar5] = (char)piVar17;
                (&DAT_000c9dd9)[iVar5] = (char)((uint)piVar17 >> 8);
                (&DAT_000c9dda)[iVar5] = (char)((uint)piVar17 >> 0x10);
                (&DAT_000c9ddb)[iVar5] = (char)((uint)piVar17 >> 0x18);
                *piVar17 = local_1e0;
                DAT_000c8b00 = DAT_000c8b00 + 1;
                iVar5 = local_20c;
LAB_00021838:
                *DAT_000c8b00 = iVar5;
                DAT_000c8b00 = DAT_000c8b00 + 1;
                if (&DAT_000c8a90 < DAT_000c8b00) {
                  NKDbgPrintfW(s_Out_of_vertex_list_space_00084908);
                  goto LAB_0002263c;
                }
                g_model_parse_part_count = g_model_parse_part_count + 1;
                if (getenv("UW_DEBUG_MODEL_PARSE_HWM")) {
                  static int hwm_parts = -1;
                  if (g_model_parse_part_count > hwm_parts) {
                    hwm_parts = g_model_parse_part_count;
                    fprintf(stderr, "[model-parse-hwm] parts: %d\n", hwm_parts);
                  }
                }
                if (0x15e < g_model_parse_part_count) {
                  NKDbgPrintfW(s_Too_many_polys_000848f8);
                  goto LAB_0002263c;
                }
                ce_fscanf(pvVar_fh,&DAT_000849a8,local_260);
              }
              else {
                if (1 < iVar5) {
                  if (iVar5 < 4) {
                    if (iVar5 == 2) {
                      (&DAT_000c9e3b)[iVar10] = 0;
                      (&DAT_000c9e3c)[iVar10] = 0;
                      (&DAT_000c9e3d)[iVar10] = 0;
                      puVar14 = (undefined1 *)0x0;
                      (&DAT_000c9e3e)[iVar10] = 0;
                    }
                    else {
                      ce_fscanf(pvVar_fh,&DAT_000848f4,&local_218,puVar16,pppppuVar21,puVar13);
                      NKDbgPrintfW(s_got_sphere__d_000848e4,local_218);
                      iVar4 = g_model_parse_part_count * 0x67;
                      puVar14 = &DAT_000c9dd8 + iVar4;
                      (&DAT_000c9e3b)[iVar4] = (char)local_218;
                      (&DAT_000c9e3c)[iVar4] = (char)((uint)local_218 >> 8);
                      (&DAT_000c9e3d)[iVar4] = (char)((uint)local_218 >> 0x10);
                      (&DAT_000c9e3e)[iVar4] = (char)((uint)local_218 >> 0x18);
                    }
                    iVar4 = ce_fscanf(pvVar_fh,&DAT_000849ac,&local_1f4,puVar14,pppppuVar21,puVar13)
                    ;
                    piVar17 = DAT_000c8b00;
                    iVar5 = g_model_parse_part_count * 0x67;
                    (&DAT_000c9ddc)[iVar5] = 1;
                    (&DAT_000c9ddd)[iVar5] = 0;
                    (&DAT_000c9dde)[iVar5] = 0;
                    (&DAT_000c9ddf)[iVar5] = 0;
                    *piVar17 = 1;
                    iVar5 = g_model_parse_part_count * 0x67;
                    DAT_000c8b00 = DAT_000c8b00 + 1;
                    (&DAT_000c9dd8)[iVar5] = (char)DAT_000c8b00;
                    (&DAT_000c9dd9)[iVar5] = (char)((uint)DAT_000c8b00 >> 8);
                    (&DAT_000c9dda)[iVar5] = (char)((uint)DAT_000c8b00 >> 0x10);
                    (&DAT_000c9ddb)[iVar5] = (char)((uint)DAT_000c8b00 >> 0x18);
                    iVar5 = local_1f4;
                    goto LAB_00021838;
                  }
                  if (iVar5 == 4) goto LAB_000218b8;
                  if (iVar5 == 5) {
                    piVar12 = &local_220;
                    pppppuVar21 = (undefined4 *****)&local_1d4;
                    iVar4 = ce_fscanf(pvVar_fh,s__d__d__d__d_00084924,&local_1fc,&local_228,
                                         pppppuVar21,piVar12);
                    piVar17 = DAT_000c8b00;
                    if (DAT_00084660 < local_228) {
                      DAT_00084660 = local_228;
                    }
                    iVar3 = -local_228;
                    if (iVar3 < DAT_0008465c) {
                      DAT_0008465c = iVar3;
                    }
                    if (DAT_00084670 < local_228) {
                      DAT_00084670 = local_228;
                    }
                    if (iVar3 < DAT_0008466c) {
                      DAT_0008466c = iVar3;
                    }
                    if (DAT_00084660 < local_220) {
                      DAT_00084660 = local_220;
                    }
                    iVar3 = -local_220;
                    if (iVar3 < DAT_0008465c) {
                      DAT_0008465c = iVar3;
                    }
                    if (DAT_00084670 < local_220) {
                      DAT_00084670 = local_220;
                    }
                    if (iVar3 < DAT_0008466c) {
                      DAT_0008466c = iVar3;
                    }
                    iVar3 = g_model_parse_part_count * 0x67;
                    (&DAT_000c9ddc)[iVar3] = 2;
                    (&DAT_000c9ddd)[iVar3] = 0;
                    (&DAT_000c9dde)[iVar3] = 0;
                    (&DAT_000c9ddf)[iVar3] = 0;
                    *piVar17 = 2;
                    iVar3 = g_model_parse_part_count * 0x67;
                    piVar17 = DAT_000c8b00 + 1;
                    DAT_000c8b00 = piVar17;
                    (&DAT_000c9dd8)[iVar3] = (char)piVar17;
                    (&DAT_000c9dd9)[iVar3] = (char)((uint)piVar17 >> 8);
                    (&DAT_000c9dda)[iVar3] = (char)((uint)piVar17 >> 0x10);
                    (&DAT_000c9ddb)[iVar3] = (char)((uint)piVar17 >> 0x18);
                    *piVar17 = local_1fc;
                    DAT_000c8b00 = DAT_000c8b00 + 1;
                    *DAT_000c8b00 = (int)local_1d4;
                    iVar3 = g_model_parse_part_count;
                    piVar17 = DAT_000c8b00 + 1;
                    iVar5 = g_model_parse_part_count * 0x67;
                    DAT_000c8b00 = piVar17;
                    (&DAT_000c9e33)[iVar5] = (char)local_228;
                    (&DAT_000c9e34)[iVar5] = (char)((uint)local_228 >> 8);
                    (&DAT_000c9e35)[iVar5] = (char)((uint)local_228 >> 0x10);
                    (&DAT_000c9e36)[iVar5] = (char)((uint)local_228 >> 0x18);
                    (&DAT_000c9e37)[iVar5] = (char)local_220;
                    (&DAT_000c9e38)[iVar5] = (char)((uint)local_220 >> 8);
                    (&DAT_000c9e39)[iVar5] = (char)((uint)local_220 >> 0x10);
                    (&DAT_000c9e3a)[iVar5] = (char)((uint)local_220 >> 0x18);
                    if (&DAT_000c8a90 < piVar17) {
                      NKDbgPrintfW(s_Out_of_vertex_list_space_00084908);
                      goto LAB_0002263c;
                      iVar3 = g_model_parse_part_count;
                    }
                    g_model_parse_part_count = iVar3 + 1;
                    uVar7 = 0x15e;
                    if (0x15e < g_model_parse_part_count) {
                      NKDbgPrintfW(s_Too_many_polys_000848f8);
                      goto LAB_0002263c;
                      uVar7 = extraout_r3_00;
                    }
                    ce_fscanf(local_25c,&DAT_000849a8,local_260,uVar7,pppppuVar21,piVar12);
                    pvVar_fh = local_25c;
                    goto LAB_00021bec;
                  }
                }
                iVar4 = ce_fscanf(pvVar_fh,s_________c_000848d8,local_260,puVar16,pppppuVar21,
                                     puVar13);
              }
            }
LAB_00021bec:
            iVar5 = g_model_parse_part_count;
          } while (local_260[0] == ';');
          iVar10 = 0;
          param_2[5] = (char)((uint)g_model_parse_part_count >> 8);
          param_2[4] = (char)iVar5;
          param_2[6] = (char)((uint)iVar5 >> 0x10);
          param_2[7] = (char)((uint)iVar5 >> 0x18);
          iVar3 = g_model_parse_part_count;
          iVar5 = g_model_parse_part_count;
          piVar17 = piVar20;
          if (0 < g_model_parse_part_count) {
            do {
              if (((((char)piVar17[0x14] == 'A') && (DAT_000db480 == 0)) && (DAT_000db470 == 0)) &&
                 (iVar19 = piVar17[1], 2 < iVar19)) {
                NKDbgPrintfW(s_making_backside_of__d_____d_00084848,iVar10,iVar5);
                iVar6 = g_model_parse_part_count * 0x67;
                iVar5 = piVar17[2];
                (&DAT_000c9de0)[iVar6] = (char)iVar5;
                (&DAT_000c9de1)[iVar6] = (char)((uint)iVar5 >> 8);
                (&DAT_000c9de2)[iVar6] = (char)((uint)iVar5 >> 0x10);
                (&DAT_000c9de3)[iVar6] = (char)((uint)iVar5 >> 0x18);
                (&DAT_000c9ddc)[iVar6] = (char)iVar19;
                (&DAT_000c9ddd)[iVar6] = (char)((uint)iVar19 >> 8);
                (&DAT_000c9dde)[iVar6] = (char)((uint)iVar19 >> 0x10);
                (&DAT_000c9ddf)[iVar6] = (char)((uint)iVar19 >> 0x18);
                uVar7 = *(undefined4 *)((char *)piVar17 + 0x4a);
                (&DAT_000c9e22)[iVar6] = (char)uVar7;
                (&DAT_000c9e23)[iVar6] = (char)((uint)uVar7 >> 8);
                (&DAT_000c9e24)[iVar6] = (char)((uint)uVar7 >> 0x10);
                (&DAT_000c9e25)[iVar6] = (char)((uint)uVar7 >> 0x18);
                uVar7 = *(undefined4 *)((char *)piVar17 + 0x36);
                (&DAT_000c9e0e)[iVar6] = (char)uVar7;
                (&DAT_000c9e0f)[iVar6] = (char)((uint)uVar7 >> 8);
                (&DAT_000c9e10)[iVar6] = (char)((uint)uVar7 >> 0x10);
                (&DAT_000c9e11)[iVar6] = (char)((uint)uVar7 >> 0x18);
                (&DAT_000c9e28)[iVar6] = (char)piVar17[0x14];
                (&DAT_000c9e26)[iVar6] = 0;
                iVar5 = *piVar17;
                *DAT_000c8b00 = iVar19;
                iVar6 = g_model_parse_part_count;
                piVar12 = (int *)(iVar5 + iVar19 * 4);
                piVar9 = DAT_000c8b00 + 1;
                iVar5 = g_model_parse_part_count * 0x67;
                DAT_000c8b00 = piVar9;
                (&DAT_000c9dd8)[iVar5] = (char)piVar9;
                (&DAT_000c9dd9)[iVar5] = (char)((uint)piVar9 >> 8);
                (&DAT_000c9dda)[iVar5] = (char)((uint)piVar9 >> 0x10);
                (&DAT_000c9ddb)[iVar5] = (char)((uint)piVar9 >> 0x18);
                for (; iVar19 != 0; iVar19 = iVar19 + -1) {
                  piVar12 = piVar12 + -1;
                  *piVar9 = *piVar12;
                  piVar9 = DAT_000c8b00 + 1;
                  DAT_000c8b00 = piVar9;
                  iVar6 = g_model_parse_part_count;
                }
                g_model_parse_part_count = iVar6 + 1;
                iVar5 = g_model_parse_part_count;
                if (0x15e < g_model_parse_part_count) {
                  NKDbgPrintfW(s_Too_many_polys_000848f8);
                  goto LAB_0002263c;
                  iVar5 = g_model_parse_part_count;
                }
              }
              iVar10 = iVar10 + 1;
              piVar17 = (int *)((char *)piVar17 + 0x67);
            } while (iVar10 < iVar3);
          }
        }
        else if (DAT_000db480 == 0) {
LAB_0002226c:
          iVar4 = ce_strcmp(auStack_1c8,s_INTERSECTIONS_000847bc);
          if (iVar4 == 0) {
            do {
              iVar4 = ce_fscanf(pvVar_fh,s__d_1s_000848c8,&local_1d0,local_260);
              if (iVar4 == 2) {
                *(undefined4 *)(&DAT_000c8b08 + DAT_000db4d0 * 4) = local_1d0;
                DAT_000db4d0 = DAT_000db4d0 + 1;
                if (getenv("UW_DEBUG_MODEL_PARSE_HWM")) {
                  static int hwm_intersections = -1;
                  if (DAT_000db4d0 > hwm_intersections) {
                    hwm_intersections = DAT_000db4d0;
                    fprintf(stderr, "[model-parse-hwm] intersections: %d\n", hwm_intersections);
                  }
                }
              }
            } while (local_260[0] == ',');
          }
          else {
            iVar4 = ce_strcmp(auStack_1c8,s_EXTENDED_COLORS_000847ac);
            if (iVar4 == 0) {
              iVar5 = 0;
              piVar17 = piVar20;
              do {
                iVar4 = ce_fscanf(pvVar_fh,s__lx_1s_000847a4,&local_208,local_260);
                if (DAT_000db494 != 0) {
                  piVar12 = &g_model_known_ext_colors;
                  iVar10 = 0;
                  do {
                    if (local_208 == *piVar12) {
                      *(char *)(piVar17 + 2) = (char)iVar10;
                      *(char *)((char *)piVar17 + 9) = (char)((uint)iVar10 >> 8);
                      *(char *)((char *)piVar17 + 10) = (char)((uint)iVar10 >> 0x10);
                      *(char *)((char *)piVar17 + 0xb) = (char)((uint)iVar10 >> 0x18);
                      break;
                    }
                    iVar10 = iVar10 + 1;
                    piVar12 = piVar12 + 1;
                  } while (iVar10 < 0x20);
                  if (iVar10 == 0x20) {
                    NKDbgPrintfW(s_Error__extended_color_for_part___00084768,iVar5);
                    goto LAB_0002263c;
                  }
                  iVar5 = iVar5 + 1;
                  piVar17 = (int *)((char *)piVar17 + 0x67);
                }
              } while (local_260[0] == ',');
            }
            else {
              iVar4 = ce_strcmp(auStack_1c8,s_ANIMATE_00084760);
              /* BUG FIX: was an unconditional `goto LAB_00022604` (the
                 generic "skip this unrecognized block" tail) on ANY
                 ANIMATE mismatch -- but CLUSTERS and NODES (their own
                 real, already-written handling sits right after this
                 whole if/else-if chain closes, as the `else` of the
                 outer `if (DAT_000db480 == 0)`) were never actually
                 reachable as a result: every token that wasn't VERSION/
                 NAMES/POINTS/PARTS/INTERSECTIONS/EXTENDED_COLORS/ANIMATE
                 got silently skipped right here, before ever trying
                 CLUSTERS or NODES. Confirmed live (UW_DEBUG_MODEL_
                 PARSE_HWM): zero NODES/CLUSTERS/ANIMATE/INTERSECTIONS
                 records ever parsed across the full regression suite,
                 despite several of the 29 real loaded models having
                 genuine CLUSTERS+NODES content (data/DATA3D/ROCKBIG.E
                 etc.). Falls through to the CLUSTERS check instead;
                 the real "give up and skip" case now lives at NODES's
                 own final mismatch below, where it belongs. */
              if (iVar4 != 0) {
                goto LAB_check_clusters;
              }
              piVar17 = &DAT_000d95d8;
              do {
                puVar13 = auStack_1ec;
                pppppuVar21 = &local_1f8;
                iVar5 = 0;
                iVar4 = ce_fscanf(pvVar_fh,s__d__1s__d__d__1s_0008474c,&local_200,local_260,
                                     pppppuVar21,&local_1f0,puVar13);
                iVar3 = DAT_000db4e0;
                if ((iVar4 != 1) || (iVar4 = 1, local_260[0] != '}')) {
                  iVar4 = DAT_000db4e0 * 0x15;
                  (&DAT_000d977c)[iVar4] = local_260[0];
                  (&DAT_000d9768)[iVar4] = (char)local_200;
                  (&DAT_000d9769)[iVar4] = (char)((uint)local_200 >> 8);
                  (&DAT_000d976a)[iVar4] = (char)((uint)local_200 >> 0x10);
                  (&DAT_000d976b)[iVar4] = (char)((uint)local_200 >> 0x18);
                  (&DAT_000d9774)[iVar4] = (char)local_1f8;
                  (&DAT_000d9775)[iVar4] = (char)((uint)local_1f8 >> 8);
                  (&DAT_000d9776)[iVar4] = (char)((uint)local_1f8 >> 0x10);
                  (&DAT_000d9777)[iVar4] = (char)((uint)local_1f8 >> 0x18);
                  (&DAT_000d9778)[iVar4] = (char)local_1f0;
                  (&DAT_000d9779)[iVar4] = (char)((uint)local_1f0 >> 8);
                  (&DAT_000d977a)[iVar4] = (char)((uint)local_1f0 >> 0x10);
                  (&DAT_000d977b)[iVar4] = (char)((uint)local_1f0 >> 0x18);
                  pppppuVar21 = (undefined4 *****)local_1f8;
                  uVar7 = local_1f0;
                  NKDbgPrintfW(s_anim__d___d__c__d__d___00084734,iVar3,local_200,local_260,local_1f8
                               ,local_1f0);
                  pvVar_fh = local_25c;
                  iVar4 = DAT_000db4e0 * 0x15;
                  (&DAT_000d9770)[iVar4] = (char)piVar17;
                  (&DAT_000d9771)[iVar4] = (char)((uint)piVar17 >> 8);
                  (&DAT_000d9772)[iVar4] = (char)((uint)piVar17 >> 0x10);
                  (&DAT_000d9773)[iVar4] = (char)((uint)piVar17 >> 0x18);
                  do {
                    ce_fscanf(pvVar_fh,s__d_1s_000848c8,&local_1e8,local_260,pppppuVar21,uVar7,
                                 puVar13);
                    iVar5 = iVar5 + 1;
                    iVar10 = DAT_000db4e0 + 1;
                    *piVar17 = local_1e8;
                    iVar4 = local_1e8 * 0x2c;
                    piVar17 = piVar17 + 1;
                    (&DAT_000d2ad0)[iVar4] = (char)iVar10;
                    (&DAT_000d2ad1)[iVar4] = (char)((uint)iVar10 >> 8);
                    (&DAT_000d2ad2)[iVar4] = (char)((uint)iVar10 >> 0x10);
                    (&DAT_000d2ad3)[iVar4] = (char)((uint)iVar10 >> 0x18);
                    NKDbgPrintfW(&DAT_00084730);
                  } while (local_260[0] == ',');
                  iVar4 = DAT_000db4e0 * 0x15;
                  (&DAT_000d976c)[iVar4] = (char)iVar5;
                  (&DAT_000d976d)[iVar4] = (char)((uint)iVar5 >> 8);
                  (&DAT_000d976e)[iVar4] = (char)((uint)iVar5 >> 0x10);
                  (&DAT_000d976f)[iVar4] = (char)((uint)iVar5 >> 0x18);
                  NKDbgPrintfW(s___d__00084728,iVar5);
                  DAT_000db4e0 = DAT_000db4e0 + 1;
                  if (getenv("UW_DEBUG_MODEL_PARSE_HWM")) {
                    static int hwm_animate = -1;
                    if (DAT_000db4e0 > hwm_animate) {
                      hwm_animate = DAT_000db4e0;
                      fprintf(stderr, "[model-parse-hwm] animate records: %d\n", hwm_animate);
                    }
                  }
                  iVar4 = ce_fscanf(pvVar_fh,&DAT_000849a8,local_260);
                  if (iVar4 != 1) break;
                }
                pvVar_fh = local_25c;
              } while (local_260[0] == ';');
            }
          }
        }
        else {
LAB_check_clusters:
          iVar4 = ce_strcmp(auStack_1c8,s_CLUSTERS_0008483c);
          if (iVar4 == 0) {
            puVar8 = (undefined4 *)&DAT_000c8ca0;
            do {
              cVar18 = '\0';
              iVar4 = ce_fscanf(pvVar_fh,&DAT_000849a8,local_260);
              puVar16 = local_258;
              if ((iVar4 != 1) || (iVar4 = 1, local_260[0] != '}')) {
                iVar4 = DAT_000db4d4 * 4;
                if (DAT_000db4d4 + g_model_parse_part_count < DAT_000db458) {
                  *(undefined **)(&DAT_000da868 + iVar4) = local_258;
                  iVar5 = ce_strlen(local_258);
                  local_258 = puVar16 + iVar5 + 1;
                }
                else {
                  *(undefined4 *)(&DAT_000da868 + iVar4) = 0;
                }
                *(undefined4 **)(&DAT_000dab90 + iVar4) = puVar8;
                puVar8 = puVar8 + 1;
                do {
                  ce_fscanf(pvVar_fh,s__d_1s_000848c8,&local_1d8,local_260);
                  cVar18 = cVar18 + '\x01';
                  *puVar8 = local_1d8;
                  puVar8 = puVar8 + 1;
                } while (local_260[0] == ',');
                **(char **)(&DAT_000dab90 + DAT_000db4d4 * 4) = cVar18;
                DAT_000db4d4 = DAT_000db4d4 + 1;
                if (getenv("UW_DEBUG_MODEL_PARSE_HWM")) {
                  static int hwm_clusters = -1;
                  static long hwm_names_bytes = -1, hwm_conn_elems = -1;
                  long names_used = (long)((char *)local_258 - (char *)&DAT_000da480);
                  long conn_used = (long)(puVar8 - (undefined4 *)&DAT_000c8ca0);
                  if (DAT_000db4d4 > hwm_clusters) {
                    hwm_clusters = DAT_000db4d4;
                    fprintf(stderr, "[model-parse-hwm] clusters: %d\n", hwm_clusters);
                  }
                  if (names_used > hwm_names_bytes) {
                    hwm_names_bytes = names_used;
                    fprintf(stderr, "[model-parse-hwm] NAMES bytes used: %ld\n", names_used);
                  }
                  if (conn_used > hwm_conn_elems) {
                    hwm_conn_elems = conn_used;
                    fprintf(stderr, "[model-parse-hwm] cluster-connection undefined4 elements used: %ld\n", conn_used);
                  }
                }
                iVar4 = ce_fscanf(pvVar_fh,&DAT_000849a8,local_260);
                if (iVar4 != 1) break;
              }
            } while (local_260[0] == ';');
          }
          else {
            iVar4 = ce_strcmp(auStack_1c8,s_NODES_00084834);
            /* BUG FIX: was `goto LAB_0002226c`, re-entering this same
               INTERSECTIONS/EXTENDED_COLORS/ANIMATE/CLUSTERS/NODES
               cascade from the top with the SAME already-mismatched
               token -- which can only mismatch every one of them again
               (nothing re-reads a token in between), re-arriving right
               back here in an unbounded loop. This is genuinely the
               "none of the known block keywords matched" case (e.g. a
               real file's own SCALE_SHIFT block, which isn't one of
               the types this parser understands); use the same
               skip-to-this-block's-closing-brace tail VERSION/NAMES/
               POINTS/ANIMATE's own real matches share, so an unknown
               block is skipped once and the outer loop moves on to the
               next token instead of spinning. */
            if ((iVar4 != 0) &&
               (iVar4 = ce_strcmp(auStack_1c8,s_SUPER_NODES_00084828), iVar4 != 0)) {
              pcVar2 = s________c_0008471c;
              goto LAB_00022604;
            }
            iVar4 = ce_strcmp(auStack_1c8,s_SUPER_NODES_00084828);
            iVar5 = -1;
            if (iVar4 != 0) {
              iVar5 = 0;
            }
            do {
              iVar4 = ce_fscanf(pvVar_fh,&DAT_00084820,&local_1e4);
              iVar10 = DAT_000db4d8;
              if (local_260[0] != '}') {
                (&DAT_000c9540)[DAT_000db4d8 * 0x16] = (char)local_1e4;
                if (local_1e4 == 0x4c) {
                  NKDbgPrintfW(s_leaf_00084818);
                  iVar4 = ce_fscanf(pvVar_fh,s__d_1s_000848c8,&local_22c,local_260);
                  NKDbgPrintfW(&DAT_00084814,local_22c);
                  iVar10 = DAT_000db4d8 * 0x16;
                  (&DAT_000c9542)[iVar10] = (char)local_22c;
                  (&DAT_000c9543)[iVar10] = (char)((uint)local_22c >> 8);
                  (&DAT_000c9544)[iVar10] = (char)((uint)local_22c >> 0x10);
                  (&DAT_000c9545)[iVar10] = (char)((uint)local_22c >> 0x18);
                  iVar10 = DAT_000db4d8;
                }
                else if (local_1e4 == 0x42) {
                  NKDbgPrintfW(s_branch_0008480c);
                  if (iVar5 == 0) {
                    iVar4 = ce_fscanf(pvVar_fh,s__1s__d__d__d_1s_000847e4,&local_234,&local_250,
                                         &local_238,&local_230,local_260);
                    local_240 = (undefined4 *****)0xffffffff;
                    local_248 = 0xffffffff;
                  }
                  else {
                    iVar4 = ce_fscanf(pvVar_fh,s__1s__d__d__d__d__d_1s_000847f4,&local_234,
                                         &local_250,&local_248,&local_240,&local_238,&local_230,
                                         local_260);
                  }
                  pppppuVar21 = (undefined4 *****)local_240;
                  NKDbgPrintfW(s__c__d__d__d__d__d___c__000847cc,local_234,local_250,local_248,
                               local_240,local_238,local_230,(int)local_260[0]);
                  iVar10 = DAT_000db4d8 * 0x16;
                  (&DAT_000c9541)[iVar10] = (undefined1)local_234;
                  (&DAT_000c9542)[iVar10] = (char)local_250;
                  (&DAT_000c9543)[iVar10] = (char)((uint)local_250 >> 8);
                  (&DAT_000c9544)[iVar10] = (char)((uint)local_250 >> 0x10);
                  (&DAT_000c9545)[iVar10] = (char)((uint)local_250 >> 0x18);
                  (&DAT_000c954e)[iVar10] = (char)local_248;
                  (&DAT_000c954f)[iVar10] = (char)((uint)local_248 >> 8);
                  (&DAT_000c9550)[iVar10] = (char)((uint)local_248 >> 0x10);
                  (&DAT_000c9551)[iVar10] = (char)((uint)local_248 >> 0x18);
                  (&DAT_000c9552)[iVar10] = (char)local_240;
                  (&DAT_000c9553)[iVar10] = (char)((uint)local_240 >> 8);
                  (&DAT_000c9554)[iVar10] = (char)((uint)local_240 >> 0x10);
                  (&DAT_000c9555)[iVar10] = (char)((uint)local_240 >> 0x18);
                  (&DAT_000c9546)[iVar10] = (char)local_238;
                  (&DAT_000c9547)[iVar10] = (char)((uint)local_238 >> 8);
                  (&DAT_000c9548)[iVar10] = (char)((uint)local_238 >> 0x10);
                  (&DAT_000c9549)[iVar10] = (char)((uint)local_238 >> 0x18);
                  (&DAT_000c954a)[iVar10] = (char)local_230;
                  (&DAT_000c954b)[iVar10] = (char)((uint)local_230 >> 8);
                  (&DAT_000c954c)[iVar10] = (char)((uint)local_230 >> 0x10);
                  (&DAT_000c954d)[iVar10] = (char)((uint)local_230 >> 0x18);
                  iVar10 = DAT_000db4d8;
                }
                DAT_000db4d8 = iVar10 + 1;
                if (getenv("UW_DEBUG_MODEL_PARSE_HWM")) {
                  static int hwm_nodes = -1;
                  if (DAT_000db4d8 > hwm_nodes) {
                    hwm_nodes = DAT_000db4d8;
                    fprintf(stderr, "[model-parse-hwm] nodes: %d\n", hwm_nodes);
                  }
                }
              }
            } while (local_260[0] == ';');
          }
        }
      }
    }
    if ((iVar4 == 0) || (local_260[0] != '}')) {
      goto LAB_0002263c;
    }
  }
  NKDbgPrintfW(s_unexpected_EOF___no_END_statemen_000846f8);
LAB_0002263c:
  /* ce_fclose is fclose-shaped, closing the handle ce_fopen (fopen)
     opened at the top of this function -- was called with iVar3 (reused
     throughout this function for unrelated numeric work, and not
     reliably holding the handle by this point even before the
     local_25c/pvVar_fh pointer-width fix), should be the real handle. */
  ce_fclose(local_25c);
  iVar3 = g_model_parse_part_count;
  if ((DAT_000db494 != 0) && (iVar4 = 0, 0 < g_model_parse_part_count)) {
    do {
      if (*(int *)((char *)piVar20 + 0x36) != iVar4) {
        uVar7 = *(undefined4 *)(&DAT_000c9de0 + *(int *)((char *)piVar20 + 0x36) * 0x67);
        *(char *)(piVar20 + 2) = (char)uVar7;
        *(char *)((char *)piVar20 + 9) = (char)((uint)uVar7 >> 8);
        *(char *)((char *)piVar20 + 10) = (char)((uint)uVar7 >> 0x10);
        *(char *)((char *)piVar20 + 0xb) = (char)((uint)uVar7 >> 0x18);
      }
      iVar4 = iVar4 + 1;
      piVar20 = (int *)((char *)piVar20 + 0x67);
    } while (iVar4 < iVar3);
  }
  return;
}
