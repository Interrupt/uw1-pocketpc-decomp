# Open mysteries

Things we've traced as far as the compiled binary (and Ghidra's read of
it) will take us, without a satisfying answer. Unlike the many "dropped
argument" / "truncated pointer" bugs found and fixed throughout this
project, these are cases where the real, original mechanism appears to
be **genuinely absent** from this port — not hidden, not mis-decompiled,
just not there. Recorded here (rather than only in memory.md) since
they're standing open questions someone might resume, not a single
session's blow-by-blow log.

---

## Mystery 1: How did the game originally dispatch object draws to different renderers? (UPDATE: dispatch mechanism confirmed real, see below)

**UPDATE (DOS decompile cross-check, 2026-09-13):** a separate, independent
decompile of the DOS original (`uw1-decomp`, checked out at
`~/Github/uw1-decomp`) has fully recovered this dispatch, and it's the same
on-disk field our own `comobj.dat` loader already reads.

- DOS's `COMOBJ.DAT` is 512 rows x 11 bytes on disk. Byte offset **+9**, bits
  0-1, is a "draw arm" selector: 0=sprite, 1=critter, **2=dispatch to real
  3D geometry (or a door)**, 3=table (`UW1_VIEW_DRAW_TABLE` -- correction,
  see UPDATE 2 below: this does NOT mean unused/dead code, only that this
  arm doesn't index OBJECTS.GR the way arm 0 does; it draws real decal
  objects through a different image source).
  (`uw1-decomp/port/uw1_view.h:548-579`, `uw1_view.c:2202-2207`, ported from
  the original's `dialog_script_event` at `3bdd:0005`.)
- For arm 2, `DGROUP:0x682` (`uw1_view_model_row_of_item[]`,
  `uw1-decomp/port/uw1_view_models.c:183-187`) maps `item_id - 0x150` (23
  entries, ids `0x150`-`0x166`) to a row index; `DGROUP:0x60a`
  (`uw1_view_model_row[][4]`, `uw1_view_models.c:144-180`, 32 rows) maps that
  row to a geometry "bank" -- real embedded display-list data baked into
  `UW.EXE` at segment `0x5723`.
- **This is the same field we already read.** Our `comobj.dat` loader stores
  an 11-byte on-disk record into a 13-byte (`0xd`) in-memory stride, with
  confirmed padding at mem offsets 4 and 0xc (see the comment at
  `uw.c:1417-1430`). Walking through that padding: our "render class" byte
  `DAT_00202c9a` sits at mem offset `0xa`, which lands on **disk offset 9**
  once the one padding byte before it (offset 4) is subtracted out --
  byte-for-byte the same field DOS uses. Our own independent dump of a
  placed boulder (id `0x154`) found it carrying render-class **2**, DOS's
  exact "dispatch" value, which corroborates this is literally the same
  original game data, not a coincidence of format.
- What this means in practice: `object-rendering-findings.txt`'s "no id/model
  field exists anywhere in comobj.dat" finding was checking for a *direct*
  id-to-model field -- correct, there isn't one -- but missed that the
  *render-class* field it had already found and named doubles as the
  dispatch gate for an *indirect* id-through-row-through-bank table, exactly
  like DOS's. Our whole `g_model_map`/`lookup_object_model` mechanism (see
  below) was us rediscovering, one object family at a time via
  `UW_DUMP_NAMES` trial-and-error, pieces of this same original dispatch --
  because we didn't have this cross-reference before now.
- **We don't need DOS's raw geometry.** Our own `DATA3D/*.E` files are more
  complete (all 29 loaded) than what `uw1-decomp` has decoded so far (only
  ~10 of 32 banks have real geometry bytes transcribed; most of
  `uw1_view_model_head[]` is still `-1`, "not carried"). What we gain from
  their table is the **id-to-identity mapping**: which of our own
  already-loaded `.E` files a given id should use.
- Cross-referencing `uw1_view_model_row_of_item[]` against
  `uw1-decomp/docs/graphs/uw-playable/nodes/n-07-06-pillars-bridges-decals.md`:
  id `0x164` "a_bridge" -> row 2 -> bank `0x62`, matching our existing
  `FBRIDGE` entry exactly (independent confirmation it's correct); id `0x160`
  "a_pillar" -> row `0xa` -> bank `0x6a` (DOS has real geometry for this
  bank) -- we already load `NEWPILL.E` into `DAT_001369a8` but never wired it
  up. The rest of the 23-item table points at banks DOS hasn't decoded yet,
  or -- per their own `n-07-06` doc -- belong to a *different* "decal"
  wall-texture-quad class (rows `0x10`-`0x1f`, banks `0x70`-`0x7f`) rather
  than a freestanding 3D model.

**UPDATE 2 (decal dispatch, 2026-09-13):** the decal half of that same
table is now wired too, and it turned out this file had *already*
independently rebuilt the right indexing scheme for it without knowing --
it just had no real per-id image data to put behind it. `uw1_view.h:1519-
1543` gives the real per-row image formula for the `flags & 0x10` arm:
`image = TMOBJ_base + (b3&0x1f) + object_flags % ((b3>>5)+1)`, where
`object_flags` is the object's own word0 bits 9-12 (so the SAME id can draw
one of several real images depending on the placed instance, not a fixed
per-id picture). Our own `emit_tile_objects` class-2 `id&0x30 != 0` branch
already computes `iVar17 = (id&0x3f)-0x10` -- byte-for-byte DOS's own
`DGROUP:0x682` index (`item_id-0x150`) -- but had no real table behind it
(`DAT_00086c80` has no writer anywhere in this decompile, so every sign
guessed the same hardcoded frame; see `object-rendering-findings.txt`).
Name-confirmed via our own `UW_DUMP_NAMES` (not trusted from DOS alone) and
wired with the real formula for four ids: `0x161` "a_lever" (row `0x10` ->
TMOBJ frames 4-11), `0x162` "a_switch&switches" (row `0x11` -> 12-19),
`0x166` "some_writing" (row `0x12` -> 20-27 -- matching DOS's own doc prose
verbatim, pulled independently from two unrelated binaries' string
tables), `0x165` "a_gravestone" (row `0x13` -> 28-29). Verified against
real placed objects, not just DOS's table: our own `UW_DUMP_OBJECTS_FILE`
census shows four real `a_lever`s in one puzzle room carrying word0 bits
9-12 = 1,2,3,4 (resolving to four genuinely different TMOBJ frames, 664-
667, confirmed live via `UW_DEBUG_DECAL=1`) and `some_writing` instances
spanning flags 0,1,7,8,9 -- real per-instance variation, not a constant.
Visually confirmed: a lever now draws a small, distinct wall-mounted plate
graphic where before every sign in the game (including this one) drew the
same placeholder "message/plaque" frame. The remaining ~26 `iVar17` slots
(ids DOS hasn't cross-checked, or hasn't decoded the bank body for on its
own side yet) keep the old no-data fallback.

Also found while reading this: this port's `emit_tile_objects` render-class
**3** branch (`DAT_00202c9a & 3 == 3`) already calls `emit_object_billboard`
with the exact catalog ids (`0x14`, `0x16`) DOS's own arm-3 body uses for
the two remaining decal families -- `0x170`-`0x17f` (buttons/switches/
lever/pull-chains straight out of TMFLAT, `image=[TMFLAT_base]+(id&0xf)`)
and `0x16d`-`0x16f` (force field/special tmap obj, image from the level's
own texture list) -- using `DAT_00202734`, the same live TMFLAT-load-cursor
snapshot the formula above needs. This matches DOS's structure well enough
that it was very likely written by someone translating the same real ARM
dispatch, not invented -- and `emit_object_billboard`'s own effect catalog
(`DAT_00086c08`) turned out to have the identical "no writer anywhere"
problem that broke the door catalog elsewhere in this file.

**UPDATE 3 (`DAT_00086c08` traced and fixed, 2026-09-15):** at the user's
request, traced how the DOS decompile populates the equivalent of this
table rather than guessing again. `dialog_action_object`'s real body
(`uw1-decomp/docs/decompilation/functions/dialog_action_object.c:20`)
reads `*(byte*)(param_1*4 + 0x60a)` -- the EXACT same access shape as this
file's `(&DAT_00086c08)[param_1*4]`, into the SAME `DGROUP:0x60a` /
`uw1_view_model_row[][4]` table already recovered and used above.
`emit_object_billboard` and the class-2 sign branch are two different
WinCE-decompiled call shapes of the one original `dialog_action_object`,
not two separate mechanisms. Confirmed the bit layout matches exactly
(byte0: bit `0x20`=texture-page mode, bit `0x80`=direction-dependent
animation, bits 0-2=frame count; byte3: the same image formula) and that
no real row's frame count exceeds 3, so nothing spills past its own
4-byte slot. Every current caller (door jamb-overlay/open-swing frames,
plus these two decal families) was reading all-zero -> 0 frames -> drew
nothing, so there was no working behavior to regress. Fixed by aliasing
`DAT_00086c08` onto a real 128-byte array holding all 32 rows verbatim
(uw.c ~4067, same technique as the earlier `DAT_00086c80`/comobj.dat
fixes). Verified: a real "special tmap obj" (force field, id `0x16e`) at
tiles (31,1)/(32,1) right next to spawn now draws a small blue/cyan patch
on the wall that wasn't there before -- thematically correct for a force
field.

**Correction (2026-09-16):** checked whether this fix could affect the
door jamb-overlay/open-swing paths (catalog ids `1`/`0xc`/`0xe`/`0xf`,
inside `emit_anim_object_frames`) -- it can't. `emit_anim_object_frames`
(uw.c ~53015, `was FUN_00064384`) has **zero callers anywhere in this
file** (confirmed via grep -- only its own definition and its own debug
comments reference it), and Ghidra's own decompile flags the block right
before it as an unreachable block. So this fix has no live effect on
doors at all today, for better or worse -- the only two catalog ids this
fix actually exercises at runtime are the reachable ones,
`emit_tile_objects`'s class-3 branch's direct `0x14`/`0x16` calls (the
TMFLAT/TMAP decal families verified above). Nothing else in the object-
rendering flow reads `DAT_00086c08`, so there's no risk of this fix
regressing the model-map path (boulders/bridge/shrine/pillar/doors'
frame+leaf, which never touches this table) or the earlier lever/switch/
writing/gravestone fix (a different table, `DAT_00086c80`, in a different
function).

**UPDATE 4 (`emit_anim_object_frames` wired, found still dead, 2026-09-16):**
traced DOS's real caller of the door-drawing logic
(`dialog_action_here`, `uw1-decomp/docs/decompilation/functions/
dialog_action_here.c` -- confirmed as the counterpart since its body calls
`dialog_action_object` with the same 1/0xc/0xe/0xf constants
`emit_anim_object_frames` already has) and wired the missing call into
`emit_tile_objects`'s door branch (`uw.c` ~52001), gated behind
`UW_DOOR_ANIM_FRAMES=1`. A/B-tested it at every real door on level 1 --
zero visual difference anywhere. Root cause: `lookup_object_model()`
(`uw.c` ~51360), called long before this branch is ever reached, already
matches every door id and returns via the real `DFRAME.E`/`DOOR.E` 3D
model first -- so this whole branch (not just the new call) is
unreachable for every door in the game, superseded by the newer
model-map fix. Left in place as an accurate, verified-correct-but-dormant
record; see `object-rendering-findings.txt`'s matching entry for the full
trace.

**UPDATE 5 (`g_model_map` disabled by default; the real reason the jamb
pass draws nothing, 2026-09-16):** `g_model_map` is now disabled by
default (`UW_ENABLE_MODEL_RENDER=1` to turn it back on) so the traced
dispatch above can actually be observed rather than masked. With it off,
the door leaf renders again via this project's own pre-existing sprite
fix, confirming the branch is live -- but `UW_DOOR_ANIM_FRAMES` still
changed nothing, even at that confirmed-visible door. Traced why:
`emit_object_billboard`'s screen-projection call (`transform_points_by_
matrix`, `uw.c` ~53031) is hard-gated to catalog ids `0xe`/`0xf`/`0xc`
only (`uw.c` ~52968) -- catalog `1` (jamb) never reaches it, confirmed
live that this isn't a data failure (`get_texture_page(24)` returns a
real pointer for the jamb call). DOS's own `dialog_action_object` has no
such gate -- for any catalog it just writes an opcode stream into a
named bank and leaves rendering to a separate, generic display-list
interpreter, the same bank system Mystery 1 already covers. This port's
`emit_object_billboard` looks like a compiler-specialized version of
just that interpreter's hot path (ordinary animated sprite billboards);
whatever handled catalog 1's real frame geometry generically either
never existed in this build or wasn't recovered. Not a bug to fix here --
it's the same "no true 3D-model dispatch" gap Mystery 1 already
identified, and `g_model_map`'s `DFRAME.E` is the working answer to it.
Full trace in `object-rendering-findings.txt`.

**UPDATE 6 (generic display-list interpreter ported, 2026-09-16):** at
the user's request, ported uw1-decomp's own generic bank interpreter
(`port/uw1_dlist.c`/`.h`) into `uw.c`, plus bank 0x61's real 259-word
bytecode (extracted programmatically from `uw1_view_model_words[]`, not
hand-copied). Wired as an opt-in test call (`UW_DLIST_DOOR=1`). It runs
correctly -- 9 real faces decoded from the real bytecode, a real
scale-responsive change confirmed on screen via pixel diff -- proving
the mechanism works, but the bank's own coordinate convention isn't
calibrated yet, so it doesn't yet look like a clean door frame. Full
detail and next steps in `object-rendering-findings.txt`'s matching
entry.

**UPDATE 7 (does `UU.exe` itself carry baked bank data? no -- plus the
real vertex-drop bug fixed, 2026-09-17):** two follow-ups.

First, the user asked whether our own WinCE `UU.exe` might carry baked
display-list geometry as *data*, even with no code reading it (proven in
UPDATE 6's four-way check above), which would let calibration use
native WinCE-scaled geometry instead of reconciling DOS's independently-
extracted bank data. A naive opcode-value-density scan found a
misleading hit; a proper structural scan (reusing this project's own
`uwdl_record_length`/opcode-length table to look for long chains of
valid opcode->length->next-opcode records, the only way real bytecode
could show up) found a maximum chain of 5 records anywhere in the whole
882KB binary -- indistinguishable from chance matches against a sparse
~44-value opcode space. Conclusively no baked bank data exists in
`UU.exe`, as code or as data; `uw1-decomp`'s DOS-side bank recovery and
this project's own `.E` files remain the only two geometry sources.
Full methodology in `object-rendering-findings.txt`.

Second, and more importantly: found and fixed the actual bug behind
UPDATE 6's "not yet a clean door frame" result. `uwdl_face_vertex` was
silently dropping any vertex referencing a slot the interpreter's walk
never marked `placed`, reindexing the face's vertex list around the
gap -- corrupting connectivity (confirmed 28 of 288, 9.7%, vertex-slot
references affected for bank 0x61). Reading `uw1-decomp`'s real
`face_vertex` (`port/uw1_dlist.c:484-501`) showed the actual design:
never drop -- always append the vertex with a `placed` flag, and let the
*caller* reject the whole face if it isn't a fully-placed quad (`if
(f->count != 4) continue;` / `if (!f->placed[j]) break;`, in both
`uw1_view_door_faces` and `uw1_view_model_faces`,
`port/uw1_view.c:2647-2691,2766-2781`) -- a partially-placed face is a
declined branch's leftover, not a smaller polygon to salvage. Ported
that exact behavior (added a `placed[]` array to `uwdl_face`, stopped
dropping/reindexing in `uwdl_face_vertex`, made `uwdl_same_face` compare
`placed[]` per DOS's own `same_face`, and rejected any non-quad or
partially-placed face in `emit_dlist_bank_object`). Result: bank 0x61
now decodes 11 real faces (up from 9) and, verified visually with
`UW_DLIST_DOOR_ONLY=1` (real door leaf hidden) at a real door, produces
a clean, recognizable rectangular doorway opening with real stone-wall
texture on the frame -- not the banded/discontinuous fragment from
before (7028 differing pixels vs. baseline, in a coherent doorway-shaped
region, vs. UPDATE 6's 140 scattered pixels). Screenshots and full
methodology in `object-rendering-findings.txt`.

**UPDATE 8 (texture-mapping bug: alternating transparent columns, fixed,
2026-09-18):** the user reported the new textured path drawing every
other screen column (of the real 320x240 framebuffer) as transparent.
Two real bugs, both fixed:
1. `emit_dlist_bank_object`'s texture-size field (written into the
   arena's `ace00`/`ace04` slots) was hardcoded to `16` regardless of
   the real bound texture. The real tile-wall render path (`uw.c`
   ~50276-50277) writes the texture's *actual* pixel width there
   (64/32/16, matching `get_texture_page`'s own size classes) for the
   exact same wall-index expression the door path reuses --
   `raster_textured_span`'s per-pixel texel-address wraparound (`uw.c`
   ~7499) uses this field as the real buffer's pitch, so writing 16
   against an actually-64-wide bound buffer ran the wraparound on the
   wrong pitch. Fixed with a new `uwdl_texture_width()` helper
   mirroring `get_texture_page`'s exact thresholds, threaded through as
   a real parameter instead of a constant.
2. The bigger one: DOS's own UV words are genuinely sign-extended
   (`uwdl_sign16`, matching `uw1_dlist.c`'s own `sign16` exactly --
   checked directly against the DOS source, not assumed), so a raw
   `0xffff` word (which some of bank 0x61's real corners carry) decodes
   to `-1`, not `65535`. Live per-face dumps (new `UW_DEBUG_DLIST_UV=1`
   flag) showed exactly this: faces with corners like
   `u=(-16384,-1,-1,-16384)`. This port's `raster_textured_span` gates
   its texel fetch on `-1 < iVar12`, where `iVar12` comes straight from
   the interpolated V accumulator -- a per-vertex V sitting at or
   barely below zero rides right on that boundary, and fixed-point/
   perspective-divide rounding flips it across the boundary pixel to
   pixel, which is exactly the reported checkerboard. Ordinary tile
   walls never exercise this because their own UV is always >= 0 by
   construction. Fixed by shifting each face's own u/v so its own
   minimum corner is exactly 0 before scaling -- a pure additive
   rephase of a tiling texture (changes nothing about the face's own
   relative UV shape), done in `emit_dlist_bank_object` right before
   the scale-to-pixel-units step. Re-verified with an isolated,
   nearest-neighbor pixel dump of the affected region before/after: the
   block-shaped texture patches separated by black gaps are gone,
   replaced by a continuous, correctly textured stone surface. Full
   detail in `object-rendering-findings.txt`.

**UPDATE 9 (row gaps after UPDATE 8's fix -- stopped reusing DOS's raw UV
words entirely, matched this renderer's own working convention instead,
2026-09-18):** the user reported rows now showing gaps instead of
columns, and asked directly: can this just reuse the same texturing
tile walls already use? Good call -- corner-only UV rephasing
(UPDATE 8) didn't guarantee interior-interpolated values along a whole
scanline stayed non-negative, just the 4 corners. Checked every real
UV-writing site in this file by grep (ordinary walls, the diagonal-wall
branch, the sprite/decal LOD branch): U is unconditionally `0` at every
single one, no exception -- this renderer never varies U per vertex;
horizontal tiling comes entirely from the rasterizer's own scanline
setup. Only V varies, always derived from the vertex's own real height/
position, never from externally-sourced data. Stopped using DOS's raw
bytecode UV words for texture coordinates at all: U is now always 0,
and V is each vertex's own real height, normalized per-face to its own
minimum so it's always >= 0 -- the same shape as the wall path's own
non-negative guarantee, computed directly. Re-verified with a dark-
pixel ASCII map of the affected region: irregular, natural-looking
noise (silhouette edges, mortar shading), no more regular gap pattern.
Full detail in `object-rendering-findings.txt`.

**UPDATE 10 (the real root cause: arena UV fields hold a plain
truncated int, not a float bit pattern -- found by testing right in
front of a door instead of from a few tiles back, 2026-09-20):** the
user tested standing directly in front of a door frame (every previous
screenshot in this investigation was taken from further away) and
reported random static/garbling -- a real, worse bug UPDATE 8/9 had
missed because the verification distance hid it. Instrumented the real
consumer directly (new `UW_DEBUG_RASTER_UV` flag on
`raster_textured_span`) instead of guessing again: the per-pixel V step
was `-1904738304` (~1.9 billion) and the interpolated value swung
billions within a single scanline, landing on effectively random texel
addresses -- textbook static. Traced why: `Ordinal_2032` (int->float,
confirmed by reading `ordinal_stubs.c` directly) converts these arena
UV fields from a *plain int* on the read side; the real wall-populate
code's own last write step is `Ordinal_2020(x)` = `(long)
ordfloat_bits_to_float(x)` -- a genuine float-to-int truncation, not a
bit-reinterpret -- so the field holds a plain truncated integer the
whole time. This session's code had been writing a raw C `float` bit
pattern instead ever since UPDATE 6 first added texturing; every later
fix (UPDATE 7/8/9) was built on top of that mistake, which is why each
one still produced *some* visible corruption no matter what the UV
*values* were. Fixed by storing a plain `int32_t` instead of a `float`
cast. Re-verified live at the user's own reported position
(tile 33.23,8.68): per-pixel V step dropped to `-15380`, texel addresses
now vary smoothly within the valid range, and the random static is
completely gone -- a coherent, correctly textured surface on both
jambs. Not yet perfectly scaled (visibly more texture repeats than a
real wall shows), but that's an ordinary calibration question now, not
corruption. Full detail in `object-rendering-findings.txt`.

**UPDATE 11 (U=0 was the wrong generalization -- real door frame
texture now works in both axes, 2026-09-20):** the user's next report:
vertical looked right, but the frame looked like a single texture
column stretched across X. UPDATE 9's "U is unconditionally 0" was
correctly read off every real wall-populate site, but the
generalization was wrong for this case: U=0 works for walls because
each wall quad only covers about one texel-column of real width (many
narrow quads make up a wide wall); this bank's own faces are wide
single quads (bbox x=[-112,144], several texture repeats, vs. z=[0,8],
just the frame's thickness), so U=0 sampled the same column across the
whole 256-unit width. Fixed by varying U the same way V already does --
each vertex's own local X (the real "width" axis for this thin-in-Z
geometry), normalized per-face to a non-negative minimum, stored as a
plain int. Re-verified at the user's reported position: a real,
correctly-proportioned stone-brick pattern varying naturally in both
directions on both jambs -- the first result in this investigation that
looks like an actual door frame, not a proof-of-mechanism fragment.
Full detail in `object-rendering-findings.txt`.

**UPDATE 12 (missing lintel geometry: never seeded the "rise" origin
slot DOS's own prologue always sets up, 2026-09-20):** the user reported
scaling/positioning looking off against the DOS reference. Re-read
`door_model` (uw1-decomp port/uw1_view.c ~2528-2586) line by line and
found DOS never runs a bank's bytecode raw -- it always wraps it in a
synthesized prologue that stores `(0, 0, rise)` into slot `0x800`
(`rise = UW1_VIEW_DOOR_LINTEL_TOP(0x330) - org[2]`) and then calls into
the real bank. Confirmed this isn't academic: bank 0x61's own bytecode
references slot 0x800 directly, four times, via `vertex_sum`
instructions -- and `vertex_sum` refuses to store its result if either
source slot is unplaced. Since this interpreter never seeded slot 0x800,
those four destinations were permanently unplaced, and combined with
the earlier "whole face must be fully placed" fix, every face that
depended on them was silently dropped -- real missing geometry (the
lintel top), not a coordinate offset. Fixed by seeding slot 0x800 with
`(0, 0, 0x330 - ah)` at the start of every branch-exploration pass.
Verified: vertex-drop count went from 28/288 to 0/288, and the frame's
bounding box grew from y=[0,208] to y=[0,384] -- visibly taller,
filling in what was previously an empty gap at the top of the archway.

**UPDATE 13 (UV scale was 1:1 raw world units; should be
`(texwidth-1)/256`, 2026-09-20):** immediately after, the user reported
the texture repeating 3-4x too densely. Every previous UV fix had
gotten storage type and non-negativity right but never revisited
magnitude -- U/V were raw world-unit deltas with no scale-down. The
real wall-populate V formula (traced earlier, root-causing the
float-vs-int static bug) is `((1024.0 - height) / 256.0) * (texwidth -
1)` -- irrelevant additive term aside (each face is already normalized
to its own minimum), the real coefficient is `(texwidth-1)/256.0`, ~4x
smaller than the 1:1 scale this code was using, matching the user's own
"3-4x too dense" report closely. Fixed by applying that coefficient to
both U and V after normalization. Full detail on both fixes in
`object-rendering-findings.txt`.

**UPDATE 14 (wired the door leaf, bank 0x6e, not just the frame,
2026-09-20):** user request: render the leaf model too. Required more
than a second bank constant -- bank 0x6e's own head is an 8-word stub
that CALLs a body shared with other banks elsewhere in the region, so
extracting it as an isolated slice (what this project did for bank
0x61) breaks its self-relative call displacements. Fixed by replacing
the single-bank `g_dlist_bank_0x61` array with the FULL assembled
4286-word region (the same assembly `door_model` itself performs),
verified against the old array byte-for-byte for the overlapping range,
and threading a `head` parameter through the interpreter so a caller
can start anywhere in the region. New `UW_DLIST_DOOR_LEAF=1` flag emits
the leaf alongside the frame. Verified: bank 0x6e decodes to exactly 6
faces (matching uw1-decomp's own documented count) with 0 vertex drops,
confirming the cross-bank call resolves correctly. The leaf now renders
as a real, recognizably door-shaped panel -- geometry is correct.
Texture is NOT yet correct: DOS binds a completely different sprite
source for leaf faces (not the wall texture the frame legitimately
shares), which this session didn't trace -- left as an open follow-up,
either flat-shaded grey (structurally right, uncoloured) or reusing the
wall texture (wrong) depending on flags. Full detail in
`object-rendering-findings.txt`.

**UPDATE 15 (found the real door-sprite texture, and a real game-wide
bug silently breaking it, 2026-09-20):** user: "The Door sprite was
drawing with the correct texture before the door model was wired up,
it's probably that resource." Traced the ordinary sprite path's own
texture call (`FUN_00040770(uVar27, shade)`) and confirmed against DOS
source that the leaf specifically should bind its own decoded sprite
(`s->pixels`), not the wall texture. Wiring it up still failed
(width=0/height=0) until tracing two compounding, pre-existing bugs
(not introduced this session, not specific to the leaf feature):
1. This project's own earlier `uVar27 = 60000 + (uVar27 & 7)` fix feeds
   a value >= 32768 into FUN_00040770's `short param_1`, which silently
   truncates/reinterprets 60000 as -5536 -- accidentally still negative
   (so it takes the "literal absolute frame" escape hatch) but the
   WRONG absolute frame, nowhere near where load_door_frames actually
   registered the sprite. Fixed by moving the scratch base to 30000
   (comfortably inside `short`'s positive range).
2. Even fixed in magnitude, a POSITIVE value goes through ordinary
   id-range bucketing instead of the escape hatch -- it needs to be
   NEGATIVE on purpose, matching this file's own established TMOBJ sign
   fix. Fixed by negating at all three call sites that can receive this
   id range, including a previously-dormant one in `emit_model_object`
   whose own comment says it "made the leaf disappear" when first
   tried -- very likely this exact bug.

VERIFICATION: FUN_00040770 now resolves real sprite data (32x64,
matching load_door_frames's own documented door-sized dimensions
exactly). At a confirmed real closed door, the door now renders with
its real wooden texture -- visible plank grain, metal bands, a lock
plate -- where it previously showed nothing (an empty passage). With
the ordinary sprite hidden (UW_DLIST_DOOR_ONLY=1), this session's own
new leaf geometry independently shows the same real wood texture,
confirming the fix applies to the new 3D leaf specifically, not just
the pre-existing billboard. This fix's scope is broader than the leaf
feature: the same call is what every closed door in the game already
used for its ordinary sprite, so this fixes real door rendering
game-wide, not just this session's new geometry. Full detail in
`object-rendering-findings.txt`.

**UPDATE 16 (leaf rendered ~2x too large -- tiling-density UV scale
applied to a sprite that should stretch to fit, 2026-09-20):** user,
right after confirming the real texture: "seemingly 2x as large as they
should be." The leaf's UV was reusing the frame/wall's tiling-density
scale (`(texwidth-1)/256`, texels per world unit -- correct for a small
repeating wall texture), but the leaf's bound texture is a single,
complete decoded sprite, not a repeating pattern -- tiling one image at
roughly half the face's real width reads exactly like "the image looks
2x too big." Fixed by stretch-fitting each face's own real coordinate
span directly onto the sprite's real pixel dimensions instead, which
needed a new `texheight` parameter threaded through (previously only
width existed, since wall textures are always square). Verified: the
leaf now renders as a single, properly-proportioned panel contained
within the frame. Full detail in `object-rendering-findings.txt`.

**UPDATE 17 (V-direction flip, confirmed; leaf-height question left
open for the user, 2026-09-20):** user: "the scale is correct but the
vertical panning seems off now." Confirmed and fixed: world Y increases
upward but a sprite's V increases downward from its top row -- the
un-flipped mapping showed the sprite's top-edge band near the opening's
top, a real gap in the middle, and the bottom-edge band again near the
bottom (verified the leaf's 2 textured faces are the door's whole front
and back, not two half-panels needing a seam alignment, ruling that
theory out first). A/B tested before committing -- flipped is a single,
continuous, correctly-oriented door. Same "invisible on symmetric
stone, real on an asymmetric sprite" story as the earlier scale bug, so
almost certainly present in the frame's own V too, just never visible.

Next report: "seems to be drawing a small vertical section... not the
full height." Added DOS's own flat-leaf-face skip for a shut door
(confirmed correct against uw1_view_door_faces's own logic) -- verified
it changed nothing visually, so not the cause. Checked whether the
leaf needs the same lintel-relative "rise" positioning bank 0x61 does
(UPDATE 12): confirmed directly against the real assembled region that
slot `0x800` is referenced only by bank 0x61 and bank 0x6a (pillar),
never by the leaf -- its 208-unit height is genuinely complete, not a
truncated result of a missing seed, and DOS's own door_model call
passes the same rise to both banks uniformly regardless. A direct
scale-up test (~1.85, matching the frame's own height ratio) made the
result visibly worse, ruling out "just needs a bigger scale."

Left open: the frame's own 384-unit height almost certainly includes
its solid lintel structure, not just the clear opening a leaf needs to
fill -- if so, 208 could be geometrically correct and the visible "gap
of stone above the door" may be the real lintel textured like the
jambs, not missing geometry. This needs real-game visual knowledge this
investigation can't resolve from the DOS source alone -- flagged to the
user rather than guessed at further. Full detail in
`object-rendering-findings.txt`.

**UPDATE 18 (user confirmed real doors fill the whole opening -- Y-only
scale fixes the leaf's height, 2026-09-20):** asked directly rather than
guessing further; confirmed real UW1 doors have no lintel gap, so the
208-vs-384 mismatch is a real problem. The earlier uniform-scale test
had already shown WHY a plain scale is wrong -- applied to X too, it
made the door visibly too wide. Fixed with an independent Y-only scale
(new `yscale` param to `emit_dlist_bank_object`, applied only to the
vertical vertex term) -- the frame's own calls keep `yscale=scale`
(unchanged, already correct), the leaf gets its own
`UW_DLIST_LEAF_YSCALE`, defaulting to `384/208` (the direct ratio).
Verified: the door now reaches nearly the full opening height at the
correct width, a continuous panel from near the top down to the floor.
A small residual gap remains at the very top for next time. Full detail
in `object-rendering-findings.txt`.

**UPDATE 19 (correction: the Y-scale was wrong -- frame's own face data
proves 208 is the real door-opening height, 2026-09-20):** user, after
UPDATE 18: "it should fit the gap of just the door area, not go into
the lintel" -- overturning the previous update's reading of "whole
opening" as the frame's full 384. Checked properly this time: dumped
bank 0x61's own 11 faces by real position. Face 1 (the lintel's
underside) sits at exactly y=208; the outer jamb faces (the door
opening's real sides) all span y=[0,208]; the lintel's own front/back
faces (already correctly textured, real UV) are the separate
y=[208,384] band above. The frame's real door opening is y=[0,208] --
exactly the leaf's own original, unscaled native height. Reverted
`_leaf_yscale`'s default from `384/208` back to `1.0` (the mechanism
itself stays, since a uniform scale really was proven wrong in
principle -- just this specific default was). Verified: the leaf now
fills exactly the door opening, with the frame's own already-textured
lintel correctly visible above it -- not a gap, not missing texture,
DOS's own real geometry. Full detail in `object-rendering-findings.txt`.

**UPDATE 20 (old 2D sprite billboard still drawing alongside the new
3D leaf, 2026-09-20):** user: "This path seems to be emitting an extra
door sprite still that shouldn't be there after the door model
addition." The door branch always fell through to the ordinary 2D
camera-facing billboard path after drawing the leaf, regardless of
whether the leaf actually drew -- a real duplicate (a billboard always
faces the camera; the leaf is a fixed-orientation 3D panel, so they
don't overdraw identically, they visibly double up). Fixed by
returning once the leaf's own block actually runs, instead of falling
through -- scoped so UW_DLIST_DOOR alone (frame only, no leaf) still
falls through as before, since nothing replaced the sprite in that
case. Full detail in `object-rendering-findings.txt`.

**UPDATE 21 (reverted the Y-scale detour entirely, at the user's
request, 2026-09-20):** "Revert our door scale changes here, to start
fresh on the door model scaling." Reverted UPDATE 18's independent
`yscale` mechanism and UPDATE 19's correction of it -- both the
`emit_dlist_bank_object` `yscale` parameter and `UW_DLIST_LEAF_YSCALE`
are gone. The leaf is back to this bank's plain, uniform `_leaf_scale`,
same as right after the leaf was first wired. The other fixes made in
the same stretch of work (UV stretch-to-fit, V-flip, flat-face skip,
sprite-duplicate fix) are untouched -- each independently evidenced and
unrelated to this specific geometric scale question. The underlying
data point stays true for whenever this is revisited: the frame's real
door opening is y=[0,208] (confirmed by its own outer jamb faces),
already matching the leaf's native height exactly -- "scale the leaf up
to 384" is a confirmed-wrong direction, not just an abandoned one. Full
detail in `object-rendering-findings.txt`.

**UPDATE 22 (the real bug: ace04 used texwidth instead of texheight,
silently halving the sampled sprite height, 2026-09-20):** user: "the
vertical door UVs might be the problem: it is only showing a small
piece of the door... Either that, or it is getting the door sprite
height incorrect." Checked both against real data: a new
UW_DEBUG_DLIST_FINALUV dump showed the written UV corners already span
the full 0..32/0..64 range (not a UV-assignment bug), and the real
DOORS.GR file's own header bytes independently confirm the sprite
really is 32x64 (not a wrong-dimension-source bug). Found the actual
cause with the existing UW_DEBUG_RASTER_UV instrumentation: the
wraparound total was 1024, not 2048 (32x64=2048 bytes). Traced to
`emit_dlist_bank_object` writing `ace04 = texwidth` (same as ace00) --
correct for every real WALL texture (always square, so the coincidence
was invisible) but wrong for the leaf's genuinely rectangular sprite,
where ace04 needs the real HEIGHT for the wraparound math
(`param_7 = ace04*ace00`). The bug folded every row past 32 back into
the top half of the buffer -- the bottom half of the door was
mathematically unreachable, not just under-scaled. Both of the user's
hypotheses were pointing at the same real defect. Fixed by writing the
real texheight into ace04. Verified: wraparound total now reports 2048,
and the door's previously-cut-off lower detail (the lock plate, more of
the panel) is now visible. Full detail in
`object-rendering-findings.txt`.

**UPDATE 23 (QA pass, three findings -- fixed the horizontal shift,
sink and rotation still open, 2026-09-20):** user QA: (1) door sunk into
the ground ~20-25%, (2) door frame+leaf shifted left instead of
centered, (3) door directions don't match expected rotations, most face
the same way. Fixed (2): `emit_model_object`'s own working DFRAME.E+
DOOR.E calibration already solved this exact problem for the same
object family (`xoff_local=-64.0`, applied to local X before rotation,
its own comment explaining DOOR.E's local X wasn't naturally centered).
Confirmed this bank family has the identical situation via
UW_DEBUG_DLIST's own bbox output: bank 0x61 (frame) and bank 0x6e
(leaf) both center at exactly +16, not 0 -- measured, not assumed.
Added the same `xoff` mechanism, defaulting to -16.0. Not fixed (1):
checked history first -- yoff=-100 (DFRAME's own value) was already
tried earlier this session and made things WORSE ("half stuck in the
ground"), so reverting to it now would be a regression, not a fix; the
current smaller sink needs its own investigation. Not fixed (3): pulled
real per-door raw_heading values live (0,1,5,1,5,5,1,1 across 8 doors)
-- DOS's own source states real doors only ever use EVEN headings
(0,2,4,6); seeing odd values here is the concrete lead for next time.
Full detail in `object-rendering-findings.txt`.

**UPDATE 24 (the real sink/height bug: ~20% blank padding at the top of
the door sprite's own buffer, 2026-09-20):** briefly tried `yoff=100`
live as a fix for the sink -- looked right, but the user correctly
caught it as a workaround: "yoff=0 seems correct. What seems incorrect
is the vertical texture UV mapping for the door leaf, it still does
not seem to be scaling 100% to the full height of the door." Reverted
yoff to 0 immediately. Checked the sprite's own real pixel content
instead of the UV math again: a row-by-row scan of the decoded buffer
found rows 0-12 of 64 are completely blank -- real content only starts
at row 13 (13/64 ~= 20%, matching BOTH the "sunk ~20%" and "not full
height" reports -- the same bug seen twice). This is leftover from the
sprite's original 2D-billboard design (anchored at the bottom, blank
headroom above so the art could scale up without redrawing) -- our
stretch-to-fit mapping has no concept of an anchor point, so it
stretched the blank rows right along with the real content. Fixed by
trimming the blank top rows before binding the leaf's texture
(advancing texptr past them, reducing the height used for both the
stretch scale and the wraparound field). Verified: the door's texture
now reaches the top of the opening with no gap, continuous to the
floor -- the first fully correct result in this whole effort. Full
detail in `object-rendering-findings.txt`.

**UPDATE 25 (QA pass 2 -- fixed the real rotation bug, a one-bit
heading-field misread, and tuned xoff down, 2026-09-20):** user: UV
fixed; doors shifted "just a tiny bit too far" now (clips into wall);
"there is a door rotated 45 degrees which never happens in the original
binary." Got the exact repro position straight from the running game's
own always-on [playerpos] log line, no scripted repro needed. Traced
the 45-degree bug to a real, root-level bug, not a calibration miss:
this file's own heading extraction reads `(*(short*)(param_1+2) >> 6) &
7` (word1 bits 6-8), but DOS's own real object struct (uw1-decomp
port/uw1_level.h:572, cited to real ARM disassembly) puts `heading` at
word1 bits 7-9 -- one bit too low, silently pulling in the adjacent
zpos field's own low bit and corrupting parity per-door (sometimes
even/correct, sometimes odd/wrong, depending on that unrelated bit).
This also explains why the earlier `-3` heading-offset step was ever
"confirmed" -- odd step on a sometimes-corrupted raw value coincidentally
looked right for whichever doors got screenshot-tested at the time.
Fixed the shift (`>>6` to `>>7`), which makes raw_heading always even,
and re-derived the offset step fresh (now needs to be even too, to
preserve parity) -- `-4` confirmed correct at two different real doors.
Also reduced `xoff` (the horizontal centering fix from the previous QA
round) from -16.0 to -8.0 per the user's own live report that the full
value overshoots. Full detail in `object-rendering-findings.txt`.

**UPDATE 26 (leaf + real texture now default-on, 2026-09-20):** both
were still opt-in (`UW_DLIST_DOOR_LEAF=1`/`UW_DLIST_DOOR_TEXTURE=1`)
purely because they'd started life as calibration flags -- by this
point both are independently confirmed correct (real per-vertex UV
bank, blank-row-trimmed sprite, duplicate-billboard suppression all
verified above), so requiring two more env vars on top of
`UW_DLIST_DOOR=1` no longer served a purpose. Flipped the default to
on, same var names now work as an explicit opt-out (`=0`), matching
this file's existing `UW_DISABLE_*`-style default-on convention
(`UW_DISABLE_PICK_RERENDER`/`UW_DISABLE_TILE_FEATURES`). Verified live:
`UW_DLIST_DOOR=1` alone now draws the textured leaf with no other env
vars. Commit `f36e8b6`.

**UPDATE 27 (added `UW_DLIST_ZOFF`, a depth-axis tuning knob, 2026-09-20):**
`xoff`/`yoff` already existed for the horizontal and vertical local
axes, but nothing let the door move along its own local Z (into/out of
the wall plane) -- a real gap, since a depth-axis position error reads
on screen as a lateral shift at a steep, near-side-on viewing angle
(parallax), which could fully explain why no `UW_DLIST_XOFF` value
tried during the still-open "shifted right, black gap" QA report (see
`object-rendering-findings.txt`) closed it: it may never have been an
X problem. Added the same way as `xoff` (added to local Z before
rotation, in `emit_dlist_bank_object`'s own vertex loop), 0.0 default
(no measured bias the way X has one). Verified live at the repro
position: `UW_DLIST_ZOFF=-16`/`+16` both produce a real, distinct shift
along the door's own depth axis, different in character from `xoff`'s
effect -- confirms the mechanism works; the QA gap itself is still
unresolved and this is now the next axis to try against it.

**UPDATE 28 (the real fix for "xoff's sign flips per camera-yaw quadrant"
-- it needed zoff too, not a sign flip; UV-flip isolated as a separate,
still-open issue, 2026-09-20):** user QA: (1) `UW_DLIST_XOFF=-32`
"perfectly centers" the door at one viewing angle; (2) the correction's
needed SIGN flips depending on which 45-degree camera-yaw quadrant
(`DAT_0023b4a0`) the player is in; (3) the UV mapping also flips
horizontally with view angle. User separately asked for the opcode
draw-list debug output to print post-transform (after the camera-
quadrant handling), to simplify reasoning about this -- added
`UW_DEBUG_DLIST_XFORM`, printing each vertex's real, final `vf[]` world
position (the same one written into the shared arena) next to its
source local coordinate and the active quadrant/heading. Commit
`2f6e601`.

Used it to find the real cause of (1)/(2): `xoff`/`zoff` are added to
local X/Z *before* the heading rotation (`ca,sa = cos/sin(heading*45)`),
so their combined effect on SCREEN X is `ca*xoff - sa*zoff`. Confirmed
live for this exact door across two real camera quadrants: at
heading=0, `ca=1,sa=0` -- only `xoff` moves screen X, `zoff` does
nothing. At heading=6 (same door, one camera quadrant over, `DAT_
0023b4a0` incremented by 1), `ca=0,sa=-1` -- that INVERTS: `xoff` now
does nothing and `zoff` controls screen X entirely. An X-only
correction was chasing a moving target, landing its whole effect on
whichever axis isn't even being corrected once heading passes 45°/
135°/etc -- exactly the "sign needs to flip" symptom, and exactly why
this had no single, quadrant-stable value.

The real fix: use the model's own actual 2D local bias, both axes
together, so the correction rotates *with* the geometry and cancels
correctly at any heading by construction. `UW_DEBUG_DLIST`'s own bbox
print already had this measured on both axes, not just X: bank 0x61
(frame) bbox `x=[-112,144] z=[0,8]` and bank 0x6e (leaf) bbox
`x=[-48,80] z=[0,8]` -- both center at exactly `(+16,+4)`, not just
`(+16,0)`. Set `xoff=-16, zoff=-4` (both defaults). Verified
mathematically AND live with `UW_DEBUG_DLIST_XFORM`: with this pair,
the frame's full local X span maps to world X range `[4112,4368]`
(center exactly `4240` = the real anchor) at heading=0, and to world X
range `[3660,3668]` (center exactly `3664` = the real anchor) at
heading=6 -- both quadrants land exactly centered on the anchor, same
`(xoff,zoff)`, no sign flip anywhere. (The earlier "-16 overshoots,
halved to -8" QA finding was real, but was a symptom of testing an
X-only correction across multiple headings/doors before `zoff` existed
to catch the axis the correction was actually landing on -- not
evidence -16 was the wrong X magnitude.) Confirmed visually at the QA3
repro position: door and frame sit centered with no gap or wall clip.

(3), the UV flip, is confirmed to be a genuinely separate issue, not
explained by this fix: `UW_DEBUG_DLIST_FINALUV`'s own u/v output is
byte-identical between the two camera quadrants for the same door/face
(checked directly) -- the UV math (`u0 = (f->p[s0][0]-umin)*uscale`
etc.) reads only the raw, untransformed local bytecode coordinates and
never touches heading, `ca`/`sa`, `xoff`, or `zoff` at all, so it is
mathematically incapable of varying with camera angle as currently
written. If the rendered texture still visibly flips with view angle,
the cause has to be downstream of this UV computation -- most likely in
how the shared triangle rasterizer associates `u0..u3` with actual
on-screen quad corners, which does depend on the quad's final,
heading-dependent screen-space vertex order/winding. Leading
hypothesis, not yet confirmed: viewing what is effectively the BACK of
a single-sided textured quad (a legitimate 3D-geometry situation once
heading crosses certain thresholds) without the rasterizer mirroring
or culling for that case -- consistent with the still-open
`DAT_000db480`-family "double-sided face" flags noted elsewhere in this
document as dead/unwritten code. Not fixed this round; flagged as the
next thing to chase, separately from the now-resolved xoff/zoff issue.

**UPDATE 29 (real backface culling added, opt-in -- confirms the UV-flip
hypothesis above; scale-sign hypothesis ruled out, 2026-09-20):** user,
following up on UPDATE 28's open UV-flip question: "Backface culling
for these models is flipped" and "Still seeing a flip when quadrants
change -- is the scale sign changing?"

Scale: ruled out directly by code inspection, no live testing needed --
`_scale`/`_leaf_scale` are fixed literal `1.0` (only overridden by the
`UW_DLIST_SCALE`/`UW_DLIST_LEAF_SCALE` env vars), with no code path
anywhere that derives or flips their sign from heading or
`DAT_0023b4a0`. Not the cause.

Backface culling: traced DOS's own bytecode format (uw1-decomp `port/
uw1_dlist.c` opcodes `0x0064`/`0x0066`/`0x0068` "cull_side_x/y/z" --
"half-space test on x/y/z; the sign word says which half", `0x0058`/
`0x005e`/`0x0060`/`0x0062` "cull_plane_*") -- these are real,
documented opcodes confirming the ORIGINAL engine does perform
backface culling. But neither this file's ported interpreter
(`uwdl_transfer`'s `kind=3` branches for these opcodes are never
resolved, always fall through) nor uw1-decomp's OWN port implements the
actual geometric test -- uw1-decomp's own comment says so directly
(`port/uw1_view.c` ~2493): "every face the bank can build is drawn and
the depth buffer settles the overlap." Checked whether we have an
equivalent safety net: we don't -- grep confirms no z-buffer/depth
buffer anywhere in this renderer. So every face (both sides of what
should be a single-sided panel) gets drawn in fixed bytecode order
regardless of view, and whichever one is emitted LAST simply overdraws
the other on screen -- exactly consistent with a visually "flipped"
symptom that tracks camera quadrant, even though draw order itself
never changes (the geometry's orientation relative to that fixed order
does, as heading rotates).

Implemented a standard cross-product face-normal test instead of
reverse-engineering the undocumented original opcode handler (not
available without real x86 disassembly access): for each face, compute
its normal from two edges of its own already-transformed world
vertices, dot it against the vector from a camera-proxy position to
the face centroid, cull if negative. New env vars `UW_DLIST_CULL=1`
(opt-in) and `UW_DLIST_CULL_FLIP=1` (inverts the sign, since the
correct polarity wasn't assumed). One wrong turn during this: first
tried treating two existing quadrant-indexed globals as a camera
position, but their own use elsewhere (`uw.c` ~57378, multiplying
tile-row/column indices) shows they're grid-step constants, not a
position -- ruled out rather than left in. Fell back to `(0,0)` in X/Z,
the natural candidate given the whole point of the `DAT_0023b4a0`
quadrant pre-rotation is to put the camera at a fixed, simple spot in
this canonical frame.

Verified with `UW_DEBUG_DLIST_CULL`: the SAME physical face of the same
real door gets the SAME cull decision (keep/cull) whether viewed from
camera quadrant 1 or 2 (two different look directions from the same
standing position) -- exactly the self-consistency a correct test
should have, and exactly what the old always-both-sides behavior
lacked. Confirmed live with a screenshot at the QA3 repro position that
enabling the cull doesn't break the known-good close-up door (renders
identically, nothing missing). Tried a second, differently-oriented
door (tile=24.5,6.5 yaw=270) as a generalization check; that view
turned out to show identical geometry with cull on, off, or flipped --
a pre-existing rendering situation at that specific spot unrelated to
this change, not evidence either way on polarity.

Left `UW_DLIST_CULL` OPT-IN rather than defaulting it on: confirmed
self-consistent and non-regressive on the cases reachable from
teleport-based testing, but the real test this needs -- walking to the
genuinely other side of a door, where the correct visible face
actually should change -- isn't reachable that way without knowing the
dungeon layout. Matches this whole investigation's established
pattern: add opt-in, let the user's own broader live testing calibrate
polarity/defaults, as already worked for xoff/zoff/leaf/texture above.
Standard run-regressions.sh: 6/6 clean.

**UPDATE 30 (revived the REAL cull_side_x/y/z opcodes -- the generic
cross-product substitute from UPDATE 29 didn't work; this does,
confirmed live, and is now default-on, 2026-09-21):** user: "This fixed
backface culling does not seem to work for the doors and door frames,
all faces seem to be wound the same way. Revive the culling opcodes."

Confirmed why the cross-product test couldn't have worked: this
model's faces don't have real opposing-winding front/back pairs for a
normal test to tell apart -- the correct set is selected at
CONSTRUCTION time by the bytecode's own `cull_side_x/y/z` opcodes
(0x0064/0x0066/0x0068), confirmed live to be heavily used by this exact
bank (`UW_DEBUG_DLIST_OPCODES`: 1288-1472 hits each, more than the
face-emitting opcodes themselves) -- not a theoretical feature, the
actual gate on most of this bank's geometry.

Reverse-engineered the real operand layout empirically rather than
guessing blind (the real x86 handler at `16e7:3f7b` etc. isn't
available in either project's disassembly listings -- checked, not
assumed): dumped every live `cull_side_*` instruction's raw operand
words with a new `UW_DEBUG_DLIST_CULLOP`. `r[2]` came back as *always*
exactly `0x7fff` or `0x8001` -- the two extremes a signed 16-bit word
can hold -- and `uwdl_slot_at(r[2])` never resolved to a valid slot
(`off % stride != 0` every time), ruling out "named cell reference" for
`r[2]` and confirming it really is a bare sign marker, matching the
doc's own words ("the sign word says which half") exactly. `r[3]` came
back as small, plausible coordinate-unit values (-208, -128, 48, -80,
-16, -24, 0) -- a literal threshold, not a slot reference either. So
the real test compares this bytecode's own current accumulated-
translation origin (`m->t[axis]`, state `0x004a`/`translate` already
maintains) against that literal threshold, with `r[2]`'s sign picking
which side survives -- a pure construction-time half-space test, not a
runtime camera check.

Implemented the real evaluation in `uwdl_walk` itself (not a
downstream heuristic this time): computes and stores `m->cull_take`
right in the opcode-dispatch switch, then the existing `kind==3`
branch-decision code (previously *only* the generic "policy" fallback,
which never resolves for these opcodes and always falls through) now
takes the real branch for `cull_side_x/y/z` specifically, leaving
`skip_if_le`/`skip_if_ge`'s own existing door-open/shut handling
untouched. `UW_DLIST_REAL_CULL_FLIP` inverts the polarity for
calibration.

VERIFIED, not just assumed: `UW_DLIST_REAL_CULL_FLIP=1` renders a
visibly broken door (missing frame panels, a gaping unintended void)
while the un-flipped polarity renders a complete, correct door at the
QA3 repro position -- decisive, not ambiguous. Confirmed no regression
at a second, differently-oriented door too. Culling removes roughly
30% of this bank's guarded faces (215 of 688 decisions across one
render, at the repro position) with zero visible change to the correct
case -- exactly what a correct construction-time selector redundant-
face removal should look like. Defaulted `UW_DLIST_REAL_CULL_OPCODES`
on (opt-out via `=0`, matching this file's convention) given the
decisive confirmation. Removed UPDATE 29's cross-product substitute
entirely rather than leaving it as dead/confusing code, now that the
real mechanism is working. Standard run-regressions.sh: 6/6 clean.

**UPDATE 31 (CORRECTION -- UPDATE 30's default-on was wrong; reverted
to opt-in, the real bug is structural, not a polarity nit,
2026-09-21):** user, live-testing UPDATE 30's default: "Backface
culling seems to be flipped when faces are visible" and "Faces
disappear based on yaw quadrant."

UPDATE 30's own verification (one screenshot at one position looking
visually complete, plus a flip-test showing the opposite polarity
looks obviously broken) was NOT rigorous enough -- it never checked the
actual face COUNT, only visual plausibility. `UW_DEBUG_DLIST`'s own
`faces=N` print exposes the real bug directly: this bank builds 11
faces with culling off (the repeatedly-confirmed baseline throughout
this whole investigation), but only **5** survive with UPDATE 30's
cull logic on -- a 54% over-cull, not a minor sign issue. Confirmed
this is fully quadrant-INVARIANT (the identical 5 faces are kept at
every camera angle tested, byte-for-byte identical decisions) -- which
is exactly consistent with the live report: different viewing angles
need different ones of the 6 permanently-missing faces, so it reads as
"faces disappear based on yaw" even though the underlying decision set
never actually changes with view.

Tried to find a working polarity systematically before giving up:
swept all 16 combinations of an origin-sign flip and independent
per-axis (X/Y/Z) flips. Confirmed the individual per-instruction
decisions genuinely do change between combinations (9 of 12 decisions
differ between the unflipped baseline and the fully-flipped case) --
but every single one of the 16 combinations still produces exactly
**5** frame faces. This rules out a simple comparison-polarity bug
entirely; flipping signs cannot fix this. One structural clue found
along the way: two `cull_side_z` instructions turned out to sit
back-to-back with the first one's own skip target landing EXACTLY on
the second one's address -- suggestive of an if/else-if CHAIN of
mutually exclusive alternatives (only one of several should ever
"win") rather than independent per-face AND-gates, which would mean
this interpreter's "skip = exclude entirely" semantics may be
structurally wrong for this opcode family even with a theoretically
correct comparison.

Not chased further this round: the real x86 handler (`16e7:3f7b` for
`cull_side_x`, etc.) isn't in either this project's or uw1-decomp's own
disassembly listings (checked directly, zero hits) -- getting the
control-flow SHAPE right (not just the comparison's sign) without that
access risks more wasted effort for no confirmed gain, the same lesson
UPDATE 29's cross-product dead-end already taught once this session.

REVERTED `UW_DLIST_REAL_CULL_OPCODES` to opt-in (confirmed back to the
correct 11/6 baseline face counts with no env vars set). The real
opcode evaluation code stays in place, gated off by default, as a
documented, ready-to-resume experiment for whoever next has real
disassembly access -- not deleted, since the operand-layout reverse-
engineering (sign word / threshold / axis mapping) in UPDATE 30 is
still solid, verified evidence even though the branch-taking semantics
built on top of it aren't yet right. Standard run-regressions.sh:
6/6 clean.

**UPDATE 32 (follow-up: confirmed the if/else-if chain theory is right;
narrowed the whole deficit to 4 specific instructions where m->t[axis]
is provably the wrong quantity, 2026-09-21):** user: "Resume, keep
looking into how to revive the control flow."

CONFIRMED THE CHAIN THEORY, not just suspected: computed every logged
instruction's real branch target directly (`tgt = at+4+d/2`, using the
already-known `consumed=3` for these opcodes) and found every single
one lands EXACTLY on the address of the next cull instruction in
sequence (e.g. `at=201 d=18 -> tgt=214`, and 214 IS the next
`cull_side_y`; `at=3073 d=96 -> tgt=3125`, landing exactly on the next
`cull_side_z`). This is decisive evidence of an if/else-if chain, not a
guess.

Added `UW_DEBUG_DLIST_FACEAT` (logs the address of every face-emit
opcode actually reached) and used it to check whether this file's
EXISTING "skip on fail, fall through on pass" semantics for `kind==3`
already implements that chain shape correctly. It does -- diffing
which face addresses get reached with culling on vs off narrows the
ENTIRE 6-face deficit to exactly four specific instructions:
`at=3015`/`3028`/`3041` (each independently gating one `face_flat`)
and `at=3073` (gating a 3-face `0x00b4` group). Every other cull site
in this bank already evaluates correctly -- this was a much smaller,
more precise problem than "over-culls everything."

All four bad instances share one property: `m->t[axis]` ("origin") is
exactly 0 at that point in the walk (no `0x004a translate` has touched
that axis yet on this code path), compared against thresholds (48,
-208, -80, -16) nowhere near zero -- no sign convention can ever make
0 satisfy any of these, which is exactly why the 16-way sign sweep from
UPDATE 31 could never have found a fix here. Tried one more targeted
hypothesis a sign-only sweep couldn't have caught: an X/Z axis-swap
(`UW_DLIST_CULL_SWAP_XZ`, since vertex-placement opcodes elsewhere use
word order x,z,y rather than x,y,z) -- also still gives `faces=5`.

CONCLUSION: `m->t[axis]` is very likely not the right quantity these
four specific tests compare against -- some other accumulator, an
unseeded external reference, or a genuinely different operand reading
for this exact opcode pairing is the remaining unknown. Not resolvable
further without the real x86 handler, which is absent from both this
project's and uw1-decomp's own disassembly listings (checked directly
again). Real, meaningful progress though: the chain control-flow shape
and the operand layout (sign word, threshold) are now both solid,
confirmed findings, not guesses -- the remaining mystery is narrowed
from "the whole mechanism might be wrong" down to "these four specific
tests reference the wrong piece of VM state." `UW_DLIST_REAL_CULL_
OPCODES` stays opt-in, unchanged. Standard run-regressions.sh: 6/6
clean.

**UPDATE 33 (the "wrong VM state" from UPDATE 32 identified and fixed
-- these are FACE-PLANE opcodes, not a bare threshold test; real
per-viewpoint culling working for the first time, still opt-in pending
a better eye reference, 2026-09-21):** user found and shared a genuine
external reference: an independent third-party UW1 model decoder
(Draxinusom/UWXtract, `MDLXtract.cpp`, GitHub), decoding the SAME
opcode family straight out of the real `UW.EXE`, unrelated to this
project or uw1-decomp.

That decoder's own case for `0x0064` (its `M3_UW_FACE_PLANE_X`) reads
word[1] as a length, word[2] as a normal component, and word[3] as a
real plane "Dist" -- i.e. these are FACE-PLANE opcodes (normal +
distance), not the bare sign+threshold test UPDATE 30 modeled. This
directly explains why word[2] is always the extreme signed-16 value
(0x7fff/0x8001, already confirmed via UW_DEBUG_DLIST_CULLOP): it's a
fixed-point unit normal component, correct for an axis-aligned
specialization where the normal has no other choice, not an arbitrary
sign marker. And it means the correct comparison is a genuine
half-space test against the EYE -- exactly matching uw1-decomp's own
doc gloss ("drop the faces pointing away from the eye"), which
`m->t[axis]` (UPDATE 30/32's model, with no view-dependence at all)
could never have satisfied.

IMPLEMENTED: the camera/eye position, expressed in this bank's own
pre-rotation local body space -- the inverse of the forward per-vertex
transform -- computed once per `emit_dlist_bank_object` call and seeded
into the VM (`m->eye[]`) before the walk begins, the same pattern
already used for seeding "rise" into slot 0x800. The cull test now
compares `m->eye[axis]` against the plane's own threshold.

CALIBRATING THE EYE REFERENCE, live: world eye = (0,0,0) (the canonical
frame's own origin, the same candidate UPDATE 20's removed cross-
product substitute used) renders a visibly BROKEN door -- the leaf
panel disappears entirely -- because it puts the eye thousands of
units from geometry that only spans a few hundred, so the comparison's
outcome ends up decided almost entirely by the normal's sign rather
than a real spatial relationship. World eye = the object's own anchor
(i.e. eye coincident with the door) renders a complete, correct door.
Made anchor the default. Important caveat, not glossed over: eye=anchor
is mathematically degenerate (`eye - anchor` is identically zero every
time, regardless of heading), so it's exactly as quadrant-invariant as
the reverted `m->t[axis]` model was -- a better STATIC approximation
for typical close-up views, not proof of genuine per-viewpoint culling
working yet. `UW_DLIST_EYE_X/Y/Z` stay available to try a real
player-relative candidate once this renderer's own player-position
global is identified.

Confirmed via user's own live gameplay insight, not just this file's
own math: a door leaf is a thin rectangular panel, and from any single
real viewpoint at most 3 of its faces should ever be visible at once
(front/back can't both show, and only some edges are ever visible) --
the leaf's new face count under this fix (3, down from the no-cull
baseline's 6) matches that exactly, and is a genuine confirmation this
direction is right, not merely a coincidence in the count.

`UW_DLIST_REAL_CULL_OPCODES` stays opt-in (confirmed back to the safe
11/6 baseline with zero env vars). Standard run-regressions.sh: 6/6
clean.

**UPDATE 34 (real player-relative eye wired up; genuine per-viewpoint
culling working and confirmed at three independent camera positions --
DEFAULT-ON, 2026-09-21):** user: "Wire up the real eye position next,"
then "Try using the player position as the eye position."

Found the renderer's own real camera-position globals,
`DAT_000db438/43c/440`, via `build_view_matrix`'s own comment ("build
the view/camera matrix ... from the camera translation"). Tried them
raw first -- still rendered a broken door (leaf missing). Traced why:
`sync_camera_from_player`'s own formula adds a bare `+0x1000` to X but
not Z, an asymmetry the object anchor's own computation has no
equivalent of; first assumed this was a bug and subtracted it back
out -- that made things WORSE (the corrected eye collapsed to nearly
the same broken magnitude as the earlier failed `(0,0,0)` guess),
proving the `+0x1000` is a load-bearing reference constant, not an
error to strip.

The real remaining bug turned out to be the COMPARISON, not the eye
value: the original `if (sign>0) origin>=thresh else origin<=thresh`
branch (built when UPDATE 33 first modeled these as face-plane
opcodes) could never work correctly once the eye genuinely varies by
viewpoint -- confirmed by testing an unconditional `origin <= thresh`
(ignoring the sign word's direction entirely) against the real camera
eye: the door rendered **complete and correct**. Verified at three
independent camera positions with genuinely different eye values
(not a fixed/degenerate case this time), plus two more positions whose
appearance matches their own already-documented pre-existing
characteristics (not new regressions). This is the first time this
mechanism has shown real, working per-viewpoint behavior rather than a
static approximation that merely looked plausible from one angle.

Made this the new default (`UW_DLIST_REAL_CULL_OPCODES` now default-on
again, opt-out via `=0`) -- unlike the previous default-on attempt
(UPDATE 30/entry 21, reverted after a 54% over-cull), this one is
backed by: an independent third-party confirmation of the opcode
semantics (UPDATE 33), a genuinely view-dependent eye source, and
multi-angle live verification, not a single screenshot. Why the sign
word (r[2]) is encoded at all if the comparison doesn't use it remains
an open, but no longer blocking, question. Standard run-regressions.sh:
6/6 clean; confirmed door renders correctly with zero env vars set.

**UPDATE 35 (CORRECTION -- UPDATE 34's default-on breaks doors
completely in ~half of all camera-yaw quadrants; reverted; root cause
narrowed to the real-camera global likely lacking the same "which
tile" component object anchors have, 2026-09-21):** user, live-testing
UPDATE 34's default: "Doors render fine from some yaw quadrants,
including backface culling, but are missing in the other 50%. Is the
backface culling flipping based on the view quadrant?" -- then, when
asked to clarify "quadrant": "quadrant = yaw quadrant, like in other
rendering cases" (confirming `DAT_0023b4a0`, the same camera-yaw
quadrant this whole investigation has used throughout).

REPRODUCED EXACTLY: full yaw sweep at the QA3 repro tile with
`UW_DEBUG_DLIST` on. `quadrant=1`: `faces=8` (correct, matches UPDATE
34's own verification). `quadrant=2`: `faces=0` -- the ENTIRE bank,
every single face, gone. Not partial loss like UPDATE 30's bug -- a
complete blackout in this quadrant. `UW_DEBUG_DLIST_CULLOP` confirmed
all 12 of this bank's cull tests evaluate CULL simultaneously at
quadrant=2, none at quadrant=1.

RULED OUT the obvious suspects before reverting blind: (1) the eye's
own inverse-rotation formula -- round-trip verified (apply the SAME
forward vertex transform to the computed `eye_local`, using the SAME
`ca`/`sa`/anchor/scale) EXACTLY recovers the original real camera world
position, at the broken quadrant too, not approximately -- the
rotation math itself is provably self-consistent, not the bug. (2) A
mismatch between the anchor's and the camera's own quadrant-rotation
formulas -- compared them side by side and they are byte-for-byte
identical (same four-case structure, same roles for each variable),
confirmed not the bug either.

NARROWED to something more specific: the anchor's own X/Z (`DAT_
0023b904`/`920`) preserve a HIGH BYTE across the quadrant-rotation code
(`DAT_0023b904 = (DAT_0023b904 & 0xff00) + local_54` -- only the LOW
byte, the sub-tile fraction, gets rotated by that code; the high byte,
presumably "which tile" this object is in relative to the player, come
from somewhere else entirely, not yet traced). Checked the real
anchor values used in both the working and broken case: the high byte
genuinely differs between quadrants for the SAME real door (X: 4096 at
quadrant=1 vs 3584 at quadrant=2; Z: 512 vs 0) -- expected, if it's a
real "which tile" delta that itself rotates with viewing quadrant. But
the real camera position's own equivalent constants
(`DAT_0023bf30`/`34`/`38`) have no writer anywhere in this file
(confirmed earlier, UPDATE 34) -- they're always 0, meaning the camera
position has NO "which tile" component at all, just a bounded sub-tile
fraction plus a fixed constant. This is a real, structural asymmetry:
the anchor's own high byte moves with the real world layout as
quadrant changes; the camera value's equivalent doesn't move at all.
Likely conclusion, not yet proven: `DAT_000db438` etc. are a narrower,
view-matrix-specific quantity (fine for building the camera's own
projection matrix) rather than a general "player world position in the
same convention as object anchors" -- the assumption UPDATE 34 was
built on.

REVERTED `UW_DLIST_REAL_CULL_OPCODES` back to opt-in immediately
(confirmed: with it off, the same quadrant=2 case correctly falls back
to the safe faces=11/faces=6 geometry, door visible from every angle
again). The face-plane opcode semantics and operand layout (UPDATE 33)
remain solid, confirmed findings; the eye-position source is the piece
that needs a real fix -- most likely computing a genuine "which tile
is the player in, relative to this object" delta the same way the
anchor's own high byte does, rather than trusting the camera-matrix
globals to already have it. Standard run-regressions.sh: 6/6 clean.

**UPDATE 36 (continued tracing: reverse-engineered and VERIFIED the
real anchor formula; two candidate player-eye values derived from it
both tested and still broken; the real fix needs a deeper trace than
completed this round, 2026-09-21):** user: "keep tracing this."

FULLY TRACED AND VERIFIED the object anchor's real construction, not
just its later low-byte quadrant tweak. Found the initial computation
in `emit_tile_features` (uw.c ~57476): `DAT_0023b904 = (per-object
byte + sign_extended_fraction(DAT_0023b4e4)) * 0x20 + 0x10` (Z
symmetric via `DAT_0023b4e8`/`bb9a`). Added debug instrumentation
(`UW_DEBUG_OBJPOS`, extended to cover door ids) and captured the real
inputs for the SAME door at both the working and broken quadrant.
Plugging the real observed `DAT_0023b4e4`/`e8`/`bb99`/`bb9a` into this
formula recovers the exact known anchor values (4240/688 at quadrant=1,
3664/144 at quadrant=2) to the unit -- the formula itself is now
proven correct, not assumed.

TWO CANDIDATE "player canonical eye" VALUES BUILT ON TOP OF IT, BOTH
TESTED LIVE AND BOTH STILL BROKEN: (a) naively assuming the ring-walk
index pivots at 0x10 for "the player's own tile" gives a fixed
(4112,4112) -- tested at the broken quadrant, still faces=0-1. (b)
solving algebraically for the fixed rotation CENTER using the two real
known anchor values (since architecturally the player's own position
should be exactly the point the whole canonical frame rotates around)
gives a cleaner-looking (4224,128) -- also tested, also still broken
(eye_local lands far outside the working range). Neither guess
survived contact with real data.

A SIGNIFICANT CORRECTION found while investigating further: `bb99`/
`bb9a` (added into the anchor formula above) are NOT a per-tile
position delta at all -- this file's own struct-recovery comment (uw.c
~4420-4429) documents `DAT_0023bb98[i*4+0/1/2]` as "per-object
BILLBOARD X/Y/Z offsets," a small per-object cosmetic nudge (so
multiple sprites on the same tile don't perfectly overlap), indexed by
sort order (`DAT_0023b8c8`), not tile position. The formula's own
arithmetic still checks out (these offsets are small, a few units),
but the "which tile" component comes entirely from the ring-walk
indices (`DAT_0023b4e4`/`e8`), not from bb99/bb9a as first assumed --
correcting that mental model.

ALSO FOUND, re-reading the ring-walk's own loop structure closely: its
two inner loops (`e4` ascending 0->15, then descending 32->17) never
actually visit `e4=16` -- that specific value is handled by a separate,
single call outside both inner loops, once per outer (`e8`) iteration,
strongly suggesting `e4=16` is each row's own CENTER column. And the
outer loop on `e8` explicitly stops before reaching 0 (`while (-1 <
iVar4-1)`, i.e. processes down to `e8=1` only) -- meaning "ring depth
0" (the player's own row) may never get an anchor computed via this
exact code path at all in normal operation, which would explain why
no clean, directly-observable "player's own anchor" value exists to
extract this way.

STATUS: real, verifiable progress on the underlying mechanism (the
anchor formula is now fully understood and proven correct; a real
misunderstanding about its inputs was found and corrected), but the
actual "player canonical eye" value the cull fix needs remains
unresolved -- both derived candidates failed live testing, and the
ring-walk's real depth-to-distance mapping (specifically what happens
at ring depth 0, and how `g_visibility_ring_depth` relates to real
tile distance) needs its own dedicated trace, not completed this
round. `UW_DLIST_REAL_CULL_OPCODES` remains reverted to opt-in, safe.
`UW_DLIST_EYE_PLAYER_CANONICAL=1` kept as a documented, confirmed-not-
sufficient diagnostic for whoever continues this. Standard
run-regressions.sh: 6/6 clean.

**UPDATE 37 (checked a real, well-motivated alternative hypothesis --
cull opcode axis LETTERS swapped, not just the eye source wrong --
tested directly and ruled out, 2026-09-21):** user: "Is this genuinely
the anchor x / z and not anchor x / y? This coordinate system seems to
be Z up."

A sharp, independently-worth-checking question: UWXtract's own
`#define`s label opcode `0x0066` "Z" and `0x0068` "Y" (`M3_UW_FACE_
PLANE_Z`/`_Y` respectively) -- the OPPOSITE of the "cull_side_y"/
"cull_side_z" letters this file's own code took from uw1-decomp's
naming for the exact same two opcode numbers. Independently confirmed
this engine really is Z-up, not just plausible: DOS's own door-lintel
formula (traced much earlier this investigation) explicitly calls
`org[2]` -- the THIRD component -- "height" in its own source comment,
directly confirming Z (not Y) is the vertical axis in this engine's
real convention.

Rather than trust either label, tested the SWAP directly and let real
data decide (`UW_DLIST_CULL_SWAP_YZ`, swaps which array slot opcodes
`0x0066`/`0x0068` read from): at quadrant=1 (previously correct,
faces=8), swapping makes it WORSE (faces=5). At quadrant=2 (the broken
case), swapping doesn't help at all (still faces=0). This rules the
hypothesis out empirically, not just by argument -- this file's
EXISTING axis mapping (0x0066 -> the height/unrotated slot, 0x0068 ->
the other horizontal/rotated slot) is the one that's actually correct
for THIS bytecode source.

Best understanding of why UWXtract's letters don't transfer directly:
UWXtract decodes model data read straight out of a table embedded in
the compiled UW.EXE (its own header comment: "models are buried deep
inside the executable") -- a DIFFERENT data source than the display-
list BANK bytecode this file actually uses (separately decoded by
uw1-decomp and assembled into `g_dlist_region`). The two apparently
share some opcode numbers (a related or shared underlying format) but
not necessarily the same per-opcode word-order convention -- this
file's own already-established, extensively visually-verified vertex
placement (`uwdl_place`, reads bytecode words in (x,z,y) order, proven
correct by every working door screenshot this whole investigation)
is the more directly-applicable ground truth for THIS specific data,
and the axis-swap test just confirmed the cull opcodes' own axis
letters follow that same, already-correct convention, not UWXtract's.
`UW_DLIST_CULL_SWAP_YZ` kept as a documented, tested-and-ruled-out
diagnostic. `UW_DLIST_REAL_CULL_OPCODES` unchanged, still opt-in.
Standard run-regressions.sh: 6/6 clean.

**UPDATE 38 (implemented the world-space reformulation the diagram's
own closing callout pointed at -- rebuilt the cull comparison to
happen in post-rotation world space instead of pulling the eye back
into local body space; verified equivalent, not a fix by itself, 2026-
09-21):** user: "Make that fix: the eye position passed to model
rendering should be in the same post-rotation world space."

REBUILT THE COMPARISON'S OWN ARCHITECTURE, not just its inputs. The
previous approach pulled the camera's world position BACKWARD through
the inverse of the per-vertex rotation, into this bank's own pre-
rotation local body space, then compared it against the plane's fixed
local threshold directly. The new approach does the opposite: it
leaves the eye in world space completely untouched, and instead pushes
each face-plane's own local axis-aligned normal and threshold FORWARD
into the exact same post-rotation world space real vertices land in
(`world = anchor + R(heading)*local*scale`) -- the same `ca`/`sa`/
anchor/scale the per-vertex loop itself uses, now threaded into the
VM (`m->ca`, `m->sa`, `m->anchor[]`, `m->scale`) and used to compute a
world-space normal and plane constant per cull test.

Caught and fixed one real subtlety doing this that a naive port would
have missed: the plane's own threshold is authored in RAW bytecode-
local coordinates, but the real forward vertex transform adds `xoff`/
`zoff` (horizontal) and `yoff` (vertical) to local coordinates BEFORE
rotating/translating. Folded these into an ADJUSTED anchor
(`adj_anchor = anchor + scale*R(heading)*(xoff,zoff)` for the
horizontal pair, `ah+yoff` for height) computed once per call, so
`world = adj_anchor + R(heading)*local*scale` exactly reproduces the
real vertex transform for any local point, `xoff`/`zoff`/`yoff`
included -- omitting this would have silently mismatched the new
world-space formula against the geometry it's supposed to be testing.

VERIFIED LIVE, decisively: quadrant=1 (previously `faces=8`, correct)
stays exactly `faces=8` -- the reformulation doesn't disturb the
already-working case, confirming it's a faithful re-derivation, not a
different (and coincidentally compatible) test. quadrant=2 (the broken
case) is STILL `faces=0` -- completely unchanged. This is the useful
result, not a null one: it's a live, empirical confirmation (not just
algebra) that the two formulations really are mathematically
equivalent, which means the earlier finding stands confirmed rather
than superseded -- the bug was never about which coordinate space the
comparison happens in. It is specifically that the eye VALUE itself
(`DAT_000db438`/`43c`/`440`, the renderer's own camera-matrix globals)
does not carry a correct "which tile" world-position component at
every quadrant, exactly as UPDATE 36 found by tracing the anchor's own
formula. `UW_DLIST_REAL_CULL_OPCODES` remains reverted to opt-in
(confirmed: door still renders correctly, faces=11/6, with zero env
vars). Standard run-regressions.sh: 6/6 clean. This world-space
formulation is kept as the new implementation going forward -- it's
the architecturally cleaner one (matches the pattern real vertices
already use, one fewer inverse-transform for an error to hide in) --
but the actual remaining fix is unchanged: find or construct a real
"which tile is the camera in, relative to this object" value, the same
way the object anchor's own preserved high byte already does.

**UPDATE 39 (traced sync_camera_from_player, tried and falsified a
concrete fix, ruled out a quadrant-phase-mismatch alternative,
2026-09-21):** user: "Yes, make this fix now" (after being walked
through the "which tile" theory above). Traced `sync_camera_from_player`
directly for the first time -- confirmed it masks the player's real
position to its low byte (`&0xff`, the 0-255 fine sub-tile fraction)
before quadrant-rotating it, and adds a fixed baseline: a literal
`+0x1000` (4096) for X, and `+DAT_0023bf30/38` (a dead camera-shake/
bob-offset family, confirmed no writer anywhere in the file, always 0)
for X/Z -- i.e. Z effectively gets no baseline at all, while X's
existing `+0x1000` lands within 16 units of what the object-anchor
formula's own implicit center works out to (16<<3<<5 + 0x10 = 4112, at
the ring-walk's center index). Hypothesized Z was missing the same
kind of baseline X already has, and added a scoped `+0x1000` to the
cull test's own eye Z (not the shared camera global) to test it.

TESTED LIVE, FALSIFIED: the known-good quadrant (faces=8/3) dropped to
faces=2/1 -- worse, not fixed. Reverted immediately. The already-
correct eye Z (243) was close enough to this door's own anchor Z (688)
to pass every test; a flat +4096 badly overshoots. A fixed per-axis
constant is not the right shape of correction.

Also checked, and ruled out, a second plausible theory while here:
compared `sync_camera_from_player`'s own quadrant-swap against
`build_frame_draw_list`'s separate quadrant-swap of the real player
struct (applied immediately after, for the rest of the frame) case by
case for all four quadrants -- byte-for-byte identical in every case.
No phase/ordering mismatch between the two.

Two independent "replace/shift the eye by a fixed amount" attempts
have now failed (the earlier (4112,4112) candidate and this pass's
flat Z bias). This is real evidence the fix isn't a constant -- the
eye's own coarse term likely needs to be computed per-object, the same
walk-relative way the anchor's own e4/e8 term is, not applied
uniformly. `UW_DLIST_REAL_CULL_OPCODES` remains reverted to opt-in;
confirmed restored to faces=8/3 after the revert. run-regressions.sh:
6/6 clean. Next step, unchanged: trace `sprite_partition_by_depth`/
`DAT_0023b8c8`'s real semantics.

**UPDATE 40 (the most direct possible test: real world space, real
player position, 2026-09-21):** user: "Is there a way to do this
calculation entirely in world space? We could use the player's
position as the eye position for a quick test." Implemented exactly
that: captured the player's true, full-precision, unmasked, unrotated
world position at the top of `sync_camera_from_player` (before its own
masking and before `build_frame_draw_list`'s later truncation of the
same struct fields), wired it in as a new opt-in diagnostic
(`UW_DLIST_EYE_TRUE_PLAYER_POS=1`) that bypasses `DAT_000db438/43c/440`
entirely.

Result: `eye_world=(8179,804,2299)` against `anchor=(4240,640,688)`
(quadrant=1) and the same eye against `anchor=(3664,640,144)`
(quadrant=2) -- nearly double the anchor's X, more than 3x its Z.
Completely different scale. quadrant=1 (previously the known-good
faces=8/3) dropped to faces=0; quadrant=2 went from faces=0 to faces=2
(neither a known-correct value). This directly confirms, with real
numbers rather than inference, that the object anchor is NOT expressed
in real map-wide coordinates -- it's built entirely relative to a
fixed, arbitrary "the player's own tile always sits at ~4096" reference
point that the ring-walk silently re-establishes every frame. There is
no true absolute coordinate space in this render path for a raw player
position to land in correctly; a genuine world-space comparison would
need the object's own real absolute tile position reconstructed too,
not just its already-windowed anchor.

Kept as a documented, tested-and-ruled-out diagnostic, off by default.
`UW_DLIST_REAL_CULL_OPCODES` still opt-in; default rendering confirmed
unaffected (faces=11/6). run-regressions.sh: 6/6 clean. Three
independent eye substitutions have now failed in three different,
informative ways ((4112,4112), flat Z bias, true absolute position) --
converging evidence the fix needs the object's real position
reconstructed, not the eye guessed at. Next step unchanged: trace
`sprite_partition_by_depth`/`DAT_0023b8c8` and the ring-walk's real
tile-indexing scheme.

**UPDATE 41 (BREAKTHROUGH -- the first exact match this investigation
has produced, 2026-09-21):** user: "This misses the other half of this
approach - can the cull plane also be in world coordinates? If both
are in the same coordinate system, then we can do a compare" -- then,
mid-turn: "That might need a conversion from the object space back to
world space." Exactly right on both counts.

Reconstructed the anchor's own X/Z into the same real world space
`g_true_player_pos` already lives in. First attempt assumed the ring-
walk's two indices (`DAT_0023b4e4` for X, `DAT_0023b4e8` for Z) share
the same reference point (both structurally feed the anchor formula
identically). Re-reading `walk_visible_tiles` (uw.c ~51209-51255)
specifically to check disproved that: `DAT_0023b4e4` genuinely sweeps
a signed range centered on the player (0..15 then 32..17, +-16 around
a skipped center of 16 -- reference = 4112). `DAT_0023b4e8` is seeded
from `g_visibility_ring_depth` and counted DOWN to 0 every outer-loop
pass -- a one-directional depth-from-player counter, not a symmetric
sweep at all. Its own zero is ring-index 0, not 16 -- reference = 16,
not 4112. Using the wrong shared constant (4112 for both) the first
time produced a reconstructed anchor over 13 tiles from a door the
player was standing directly in front of; using the correct asymmetric
references fixed that immediately.

Result: quadrant=1 (real camera-quadrant `DAT_0023b4a0=1`, confirmed
by instrumenting it into the debug line) now reproduces `faces=8/3`
**exactly** -- byte-identical to the known-good baseline, not just
closer. First exact match this whole investigation has produced from
principled reconstruction. Quadrant=2 (`DAT_0023b4a0=2`) is still
broken (`faces=2`), but differently than before: swept all 4 possible
per-quadrant rotations of the reconstructed delta
(`UW_DLIST_ANCHOR_DELTA_CASE=0..3`) -- every one regresses quadrant=1
and none change quadrant=2 at all, so the delta's own orientation isn't
the remaining problem. Per-instruction tracing shows why: axis=0 (X)
now correctly passes every test at quadrant=2 too (real progress); it's
axis=1 (height -- never rotated, never windowed, and identical between
both quadrants since it's the same real player/door) and axis=2
(Z/depth) that cull everything. Height failing differently between two
runs with the identical real height strongly implies the bytecode's
own if/else-if chain is walking a genuinely different branch at
quadrant=2, not hitting shared arithmetic with a different result.

`UW_DLIST_ANCHOR_DELTA_CASE` kept as a documented, swept-and-ruled-out
diagnostic (default -1, no transform -- the value that produces the
exact match). `UW_DLIST_REAL_CULL_OPCODES` still opt-in; default
rendering confirmed unaffected (faces=11/6). run-regressions.sh: 6/6
clean. Next step: trace which bytecode offsets the height/Z cull tests
actually come from at quadrant=1 vs quadrant=2 for the same logical
face, to check whether the if/else-if chain takes a different path.

**The question:** Ultima Underworld draws several visually distinct
kinds of objects in the 3D view — small item billboards, doors, and (at
least in the original PC release) real 3D models with actual geometry
(boulders, bridges, shrines, door frames+leaves). Somewhere, the engine
must decide "this object id renders as a sprite" vs "this object id
renders as a 3D model." We never found that decision anywhere in this
binary.

**What we found instead:**
- This WinCE/Pocket-PC port loads all 29 `.E` 3D-model files
  (`DATA3D/*.E`) at startup into persistent buffers
  (`parse_e_model_file`, was `FUN_00020a74`, called from `FUN_00038680`
  at uw.c ~24980) — real, working file parsing, confirmed byte-correct
  against the source `.E` text.
- **Nothing in the compiled binary ever reads those buffers again.**
  This was checked four independent ways before concluding it, not
  assumed:
  1. A full Ghidra cross-reference search against the real `UU.exe` for
     all 29 buffer addresses found zero references anywhere except the
     loader itself.
  2. A raw byte-pattern scan across every initialized memory block (in
     case a compile-time pointer table held one of the 29 addresses
     without a Ghidra-recognized reference — the exact bug class that
     hid `DAT_00085668`'s dispatch table elsewhere in this project)
     found nothing.
  3. A full `.text` undefined-byte-gap scan found zero gaps larger than
     16 bytes anywhere in the executable region, so there's no room for
     an undiscovered, un-disassembled consumer function either.
  4. `emit_tile_objects`'s (was `FUN_00060aa0`) actual render-class
     dispatch was re-decompiled fresh from `UU.exe` and confirmed to be
     a genuinely exhaustive 2-bit (0–3) if-chain matching what's already
     in `uw.c` — not a `switch` that got collapsed by an earlier editing
     pass.
- Conclusion at the time (documented in memory.md and
  `object-rendering-findings.txt`): **this Pocket PC port shipped the
  model loader but never wired a renderer to it.** The dispatch we were
  looking for isn't lost — it was never built for this platform. The
  PC/DOS original may well have had one; this decompile target doesn't.

**What we did about it:** rather than recover a dispatch that doesn't
exist, this session *wrote a new one* — `emit_model_object` pushes each
model's faces into the same shared 3D-geometry arena
(`DAT_000a85d0_backing`, see [[3d-view-arena-limits]]) that tile
wall/floor geometry already uses, with a hand-built `lookup_object_model`
table mapping specific object
ids (boulders, bridges, the shrine, door frames+leaves) to model files —
not a recovered mechanism, an equivalent one built from scratch. Only
that hand-picked subset of objects is wired up; extending it to the
other ~25 loaded `.E` files (doors' furniture, tables, beds, etc.) is
still just "add another table entry," per [[milestone-3d-tiles-render]]
and the boulder-milestone memory entry.

**Still open:** whether the *original* (non-WinCE) Ultima Underworld
really did have a live id→model dispatch that this port's build simply
dropped, or whether even the DOS original always billboard-rendered
most of these and only used real geometry for a handful of special
objects — we have no DOS-binary evidence either way, only the negative
result for this specific compiled target.

---

## Mystery 2: How was the automap wired to player view distance — and did light level ever actually limit it? (RESOLVED, see update below)

**UPDATE (resolved):** point 2 below (the "hard-coded ceiling of 16
passes... verified this is original... byte-for-byte identical...
flat constant with no reference to light") was **wrong** — or at least
incomplete. User-supplied evidence (real bytes read straight out of
`SHADES.DAT`) showed record 0 is six 16-bit fields `56, 5, -3, 3, 16,
16`, and field 3 (value 3) is exactly the per-level view-distance
default already being parsed correctly by `FUN_0006ff08` into
`DAT_0023bca0` — it was just never *consumed* anywhere meaningful
before now (its only two call sites were the dead
`build_visibility_light_grid` and two dropped-argument calls). Fields
4/5 (both 16) are a separate, already-fixed pair of texture-LOD
distance thresholds — easy to conflate with the ring-pass ceiling
since they're also 16, but they're a different field entirely.
Renamed `DAT_0023bca0` to `g_visibility_max_ring_passes` and wired it
into `extend_visibility_ray_row`'s ring-pass check in place of the
flat `0x11`. Verified live: passes now cap at 4 (field value 3, +1 for
the pre-incremented counter) instead of running to 16, and a single
`REVEAL` from spawn now lights a small bounded patch instead of a
sprawling room cluster. Commit `59f9aa7`.

This does NOT fully explain the original "reveals a whole room
cluster" symptom described below (point 3 already identified that the
dominant cause, in the level-1 spawn room specifically, was doorway
tiles being ordinary open floor regardless of door state, since real
walls stopped the flood at ring depth 8, well under the old 16-pass
ceiling). The ring-pass ceiling fix mainly matters in *larger* open
areas where the flood would otherwise run past the intended per-level
distance before hitting a wall at all. The rest of this section's
findings (light-grid is still fully dead code, no torch wiring exists)
are unaffected by this correction and remain accurate.

**The question:** the automap's "reveal" flood currently marks an
entire connected, wall-bounded room cluster the instant you enter it —
far more than "just around the player." We traced *why* in depth this
session; the deeper question is whether the original game constrained
this some other way (distance, light radius) that this port lost.

**What actually gates how far the flood spreads today**, traced end to
end (`run_visibility_flood` → `advance_visibility_ray` →
`extend_visibility_ray_row` → `walk_visible_tiles` →
`process_visible_tile_cell`, the family renamed this session from its
original, disproven "creature reaction" naming — see memory.md's
automap-reveal sections and the git log around commit `97fe3e6`):

1. **Real walls.** The flood is a genuine portal/beam-trace walk over
   the level's static wall geometry. It correctly stops at solid walls.
2. **A ceiling on ring-passes** in `extend_visibility_ray_row`. This WAS
   a hard-coded `0x11` (16, i.e. count < 17), confirmed byte-for-byte
   identical back to `989ae23` (the raw Ghidra baseline) -- but that
   turned out to be a case of "the literal really is in the
   disassembly" while missing that it should have been a *read of a
   per-level config value* instead, per the RESOLVED update above. Now
   reads `g_visibility_max_ring_passes`, loaded per-level from
   `SHADES.DAT` (commit `59f9aa7`).
3. **Nothing else.** In this specific level-1 spawn-room repro, real
   walls stop the flood well before the 16-pass ceiling would ever
   matter (measured ring depth: 8). The over-reveal comes from doorway
   tiles being ordinary open floor in the static geometry regardless of
   the door object's own open/closed state (a separate, currently
   unfixed gap — see the `objects` branch's own conversation history),
   not from anything related to distance or light.

**The light-level system exists — and is functionally dead:**
- `build_visibility_light_grid(radius)` builds a real 17×33 radial
  shade-lookup table (`DAT_0023b039`): for each cell, Euclidean distance
  from a corner point vs `radius`, clamped/shaded via a small
  precomputed distance→shade curve. This is exactly the shape of code
  you'd want for "torch light radius fades to black." **Nothing in the
  entire file ever reads `DAT_0023b039` back.** Confirmed via a full
  grep of every reference to it: the two writes inside the function
  that builds it are the *only* mentions anywhere. It's real, correct-
  looking, fully dead output.
- Its only two call sites: a one-time `build_visibility_light_grid(8)`
  hardcoded at program startup (`FUN_0005b828`, before any level is
  even loaded), and inside `FUN_0006ff08` — which loads a per-level
  light-level record from `SHADES.DAT` (index × 12 bytes) into the
  shade-curve constants (`DAT_0025063c`/`DAT_0025064c`/`DAT_002506dc`)
  and the LOD-distance globals (`DAT_0023bca0`/`DAT_00086b24`/
  `DAT_00086b28`), then calls `build_visibility_light_grid` with that
  loaded radius.
- `FUN_0006ff08` itself has exactly three callers: dungeon-entry init
  (`FUN_00066e90`, param 0, the level default), and two more
  (`FUN_000667cc`, gated on an unidentified global `DAT_002020d8`; and
  `FUN_00067e40`, a position/targeting-looking function that sets a
  cluster of `DAT_0023beXX` fields, possibly a spell or special-effect
  trigger — neither has been named or root-caused). **None of the three
  call sites are the torch.**
- Traced `use_light_source` (the function that lights/extinguishes a
  torch) fully: it toggles the object's own lit/unlit icon bit,
  decrements its fuel, and moves it into a readied backpack slot. It
  never calls `FUN_0006ff08`, never touches any of the six globals
  above. **Lighting a torch changes zero values that the shading/fog
  system reads.**
- Directly tested whether the automap reveal is at least gated by
  *some* distance/light budget even without the torch connection: force
  the per-step light-attenuation-like counter (`local_atten_step` in
  `advance_visibility_ray`, itself the subject of a real signed-char-
  overflow bug fixed this session — see `f7cf1a6`) to an artificially
  huge value, guaranteed to saturate within ~4 tiles in every direction.
  **The revealed bitmap came out byte-for-byte identical.** That
  counter isn't light at all — cross-referencing the same struct offset
  in `extend_visibility_ray_row` (formerly `reactions_should_merge`)
  shows it's a Y-position/DDA fractional-position tracker for the ray-
  marching math, unrelated to any light budget. There is no distance-
  based soft fade anywhere in the reveal decision, full stop.

**Unused / dead pieces catalogued along the way:**
- `DAT_0023b039` (the light-radius grid) — built, never read.
- `FUN_0006ff08`'s two non-init call sites (`FUN_000667cc`'s
  `DAT_002020d8`-gated branch, `FUN_00067e40`) — unnamed, unclear
  purpose, not obviously torch-related; whatever they actually do has
  not been chased down.
- The whole `run_visibility_flood`/`advance_visibility_ray` family was
  itself found to be **misidentified for a long time**: the original
  investigation read `extend_visibility_ray_row` (then
  `reactions_should_merge`) as creature-AI/sound-cue bookkeeping,
  deliberately stubbed it to `return 0`, and that stub is *why* the
  automap only ever revealed a single tile for a long stretch of this
  project's history — see the git history around `bd2f9ad` (stubbed,
  reveals one tile) → `97fe3e6` (un-stubbed for real 3D-view visibility,
  reveals the whole room cluster as a side effect, never fixed back down
  since).

**UPDATE 2 (DOS decompile cross-check, 2026-09-13):** the first "still open"
question below is now answered -- **no, the genuine 1992 DOS engine never
wired a carried light source to view or reveal radius either.** Checked
against `uw1-decomp` (`~/Github/uw1-decomp`):
- View/render distance there is a flat constant read from `SHADES.DAT`
  (`UW1_VIEW_DRAW_DISTANCE`), used as-is at its one call site
  (`uw1-decomp/port/uw_main.c:778`), independent of any light source. Their
  own header states this outright: "there is no per-tile light level in
  Underworld's world renderer at all. A torch lights the world by being an
  object the object pass draws... it does not brighten the wall behind it."
  (`uw1-decomp/port/uw1_view.h:81-89`.)
- Their automap reveal is driven by the exact same fixed-radius cell loop
  as the 3D view (`render_tile_faces.c:34-38`, `render_world_view.c:91`,
  `render_tile_rows.c:84-92` in `uw1-decomp/docs/decompilation/functions/`)
  -- no wall-flood, no light-source check anywhere in that path.
- The torch object's own brightness is entirely self-contained: a separate
  16-row "light sources" `OBJECTS.DAT` table, read only by the torch-class
  object's own draw code
  (`uw1-decomp/docs/uw-playable/object-properties.md:89-92`), matching
  exactly what we'd already found in our own `use_light_source` trace above.
- No hits for "torch" anywhere across DOS's 1817 decompiled functions
  outside that one object-draw path, confirming there's no missed
  connection to chase.

Conclusion: the whole-room automap reveal (and the flat, light-independent
view distance) is a genuine original design property of Ultima Underworld's
1992 engine, not something either this port or the DOS decompile lost or
broke. The infrastructure (`SHADES.DAT`, the radial shade grid) exists for
per-level ambient presets, not a carried-light mechanic -- there never was
one to recover.

**Still open (DOS confirms no, see UPDATE 2 above for the resolved half):**
- ~~Was there ever a real, original connection from carried light source
  → view/reveal radius~~ -- answered above: no.
- What do `FUN_000667cc`'s `DAT_002020d8` gate and `FUN_00067e40`
  actually do? Neither has been named or traced to a real trigger.
- Whether fixing this (giving automap reveal its own real, bounded
  criterion, decoupled from the 3D view's full flood extent) should
  also finally wire the torch in, now that we know the plumbing for
  "radius → shade grid" exists but has no consumer on either end.

---

## Mystery 3: How did the game render models with textures and UVs, when there's no UV data?

**The question:** could the .E 3D-model format (bridges, boulders,
shrine, door frames+leaves) ever have been texture-mapped the way the
tile walls/floors and 2D object sprites are?

**Short answer, reasonably confidently reached: no — it was never
designed to be.** Full trace in `object-rendering-findings.txt`
("UPDATE 2026-09-11 (7)" and "(8)"):

- `parse_e_model_file` (was `FUN_00020a74`) computes a **real per-face
  normal** right after reading each PARTS entry's vertex list (a
  genuine cross-product of two real edge vectors, verified against the
  actual `UU.exe` disassembly at the call site, not a decompile
  artifact) — **and then never stores or uses it anywhere.** The
  original binary computes it and throws it away.
- Read the entire rest of the format (PARTS/CLUSTERS/NODES/
  EXTENDED_COLORS/SCALE_SHIFT/END) end to end. There is no UV/texcoord
  block anywhere in the `.E` format across any of the 29 model files,
  and no field in a PARTS entry has room for one — each entry is
  exactly a flag byte (always 0 in practice), a 1-character code (a
  double-sided-face marker, confirmed via the parser's own debug
  strings — not UV-related), a part index, and a color value, then the
  vertex-index list.
- Went further and checked whether even flat per-face **color**
  survives: both the raw material index and the resolved
  `EXTENDED_COLORS` RGB value get computed in scratch memory but are
  never copied into the buffer `emit_model_object` actually reads.
  Normal, color, and UV are *all* absent from the final persisted model
  data — only point positions and each part's vertex-index list survive.
- Conclusion: the `.E` format's real design intent looks like flat-per-
  face shading (refined by a palette-index color system, typical of
  low-poly models from this era), not bitmap texture mapping at all.
  That's consistent with — and reframes — an earlier dead end this
  session hit trying to *add* texturing:
  - Wiring a door leaf's real sprite texture onto its model face made
    the leaf **disappear** rather than show detail. Root cause: this
    renderer's shared rasterizer (`render_visible_tile_list`, fed by
    `near_clip_visible_tiles`) derives each vertex's texture-sample
    coordinate from its **projected screen position**, not a real
    per-vertex UV — confirmed the same root cause as this project's
    much older 2D-sprite "LAST GAP" finding (object-rendering-
    findings.txt, top of file). That happens to look fine for a large,
    continuously-tiling wall texture (screen position always lands
    somewhere valid) but a small finite sprite mostly samples outside
    its own bounds, reads as transparent, and vanishes.
  - Wiring a door frame's real wall texture didn't make it disappear
    (large enough to always sample validly) but showed **zero texture
    detail** — flat, uniform color. Traced deeper: real wall-rendering
    code doesn't treat its vertices' Y/Z fields as plain world
    coordinates at all — for walls specifically, those fields are
    blended with a texture-repeat lookup table
    (`DAT_00086bb0`/`DAT_00086bb1`, indexed by wall segment) baked
    directly into the position encoding. It's a scheme specific to
    axis-aligned wall spans; it doesn't obviously generalize to
    arbitrary rotated model geometry, and nothing else in this
    renderer implements per-vertex UV as a distinct concept from
    "projected screen position."

**UPDATE (DOS decompile cross-check, 2026-09-13):** the first "still open"
question below is answered -- **yes, the genuine 1992 DOS engine's model
format really did have real per-vertex UV mapping**, checked directly
against `uw1-decomp` (`~/Github/uw1-decomp`):
- Its display-list bytecode has distinct textured-face opcodes (`0x00a8`
  `face_textured`, `0x00b4`/`0x00ce` `face_textured_same`/`_shaded`) where
  each vertex entry carries an explicit vertex-slot plus **u** and **v**
  words, alongside a separate untextured `0x007e face_flat` opcode colored
  via a flat `0x00bc colour` cell+shade pair
  (`uw1-decomp/port/uw1_dlist.h:117-160`, `uw1_dlist.c:145-181,646-660`).
  Textured and flat faces coexist on the same object.
- These aren't a theoretical opcode -- they're used on real architectural
  3D objects: the door leaf/doorway banks decode as "2 textured, 4 flat"
  and "6 textured, 5 flat" faces respectively
  (`uw1-decomp/docs/graphs/uw-playable/nodes/n-07-05-door-from-models.md:46-49`),
  and the UV data survives all the way into the renderer's own draw struct
  (`uw1_view_door_faces()`, `uw1-decomp/port/uw1_view.c` ~line 2736-2815,
  copies `has_uv`/`u[]`/`v[]` straight through).

So this was a real, designed original-engine feature -- our own conclusion
above (no UV field anywhere in the `.E` format, models "never designed to be
texture mapped") is only true of *this Pocket PC port's own* `.E` text
format specifically, not of the underlying Ultima Underworld model concept
in general. Whoever built this WinCE port's asset pipeline evidently
stripped UV data out (along with the per-face normal and resolved color,
already noted above as computed-then-discarded) when exporting these models
to the simplified `.E` text format -- a deliberate simplification for this
platform, not evidence the original never had it.

Porting real texturing into our renderer from here would mean re-deriving
per-face UVs for our own independently-encoded `.E` models from scratch --
DOS's display-list bytecode and our `.E` POINTS/PARTS text format are two
unrelated encodings with no shared vertex/face numbering to translate
through, so this isn't a quick lookup the way the render-dispatch table
(Mystery 1) was. Left as a real, confirmed-but-unsolved follow-up, not
attempted this round.

**Still open:**
- `DAT_000db480`/`DAT_000db470`/`DAT_000db494` (the flags gating the
  double-sided-face and `EXTENDED_COLORS` resolution logic) have no
  writer anywhere in this decompile — always BSS-zero. Flagged but not
  chased with the same reference/byte-pattern-search rigor as Mystery
  1's dispatch-table hunt; could be another `DAT_00085668`-class hidden
  writer, or could genuinely be dead in this build too.
- Getting real per-model shading (even flat-color, using the normal/
  color data the format *does* have but this parser discards) would
  need actually storing what `parse_e_model_file` already computes and
  throws away — a much smaller, well-scoped follow-up distinct from the
  "solve UV mapping" dead end.
