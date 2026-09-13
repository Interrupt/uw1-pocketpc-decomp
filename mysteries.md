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

## Mystery 1: How did the game originally dispatch object draws to different renderers?

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

## Mystery 2: How was the automap wired to player view distance — and did light level ever actually limit it?

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
2. **A hard-coded ceiling of 16 passes**, in `extend_visibility_ray_row`
   (`if (iVar5 * 0x1000000 >> 0x18 < 0x11)`, i.e. count < 17). **Verified
   this is original**, not something introduced by any fix this
   session: it's byte-for-byte identical in `989ae23`, the very first
   raw Ghidra baseline commit before any decompile fixes at all. It's a
   flat constant with no reference to light, torches, or any other game
   state anywhere in the function.
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

**Still open:**
- Was there ever a real, original connection from carried light source
  → view/reveal radius, or did the genuine 1992 engine also just reveal
  whole rooms at once and rely on darkness/fog for *rendering* only
  (never automap reveal)? We have infrastructure (`SHADES.DAT`, the
  radial grid) that strongly suggests SOME light-radius concept existed
  in the data, but zero evidence it was ever wired to the player's
  equipped light source specifically, as opposed to per-level ambient
  presets.
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

**Still open:**
- Whether the genuine 1992 PC engine's model renderer worked
  differently (real UV mapping with a format this WinCE port's `.E`
  parser simply doesn't expose/use) — we only have evidence about *this
  parser and this data*, not about whatever the original DOS renderer
  might have assumed.
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
