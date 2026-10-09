#ifndef HEADERS_MODELS_DOS_H
#define HEADERS_MODELS_DOS_H

/* The DOS asset set's 3D object models, read out of UW.EXE.
 *
 * The Pocket PC port ships its models as DATA3D/*.E -- Looking Glass's ASCII
 * authoring format (BEGIN / POINTS / PARTS / END), which models.c's
 * parse_e_model_file reads. An original DOS install has no DATA3D directory
 * and not one byte of .E text anywhere in UW.EXE: DOS kept the models
 * COMPILED INTO the executable as a little bytecode, which is what this file
 * decodes.
 *
 * Rather than fill parse_e_model_file's output buffer directly, the decoded
 * geometry is emitted as an equivalent .E script and handed to that same
 * parser (see uw_dos_model_script below). That keeps one implementation of
 * the buffer layout -- points are floats at 8 + i*0xc, part records are at
 * 0xc14 + p*0x60, there is a float bounding box at 0x3c1c, faces get normals
 * computed and winding applied -- instead of two that have to agree, and it
 * makes the decoder testable as plain text.
 *
 * See src/models_dos.c's own block comment for the bytecode format, where
 * the model table lives, and the evidence behind the coordinate convention. */

/* Does the data directory hold a DOS UW.EXE with a recognisable built-in
 * model table? Reads and caches the executable on the first call. Safe (and
 * false) when the data directory is the Pocket PC set instead, which has no
 * UW.EXE at all -- its executable is UU.exe and holds no models. */
int uw_dos_models_available(void);

/* Emits DOS built-in model `dos_index` (0..31) as a .E script into `out`,
 * NUL-terminated. Returns the script's length in bytes, or 0 when the model
 * slot is empty (several are: the Lotus easter egg and the three UW2-only
 * models decode to nothing in UW1), the index is out of range, or the script
 * would not fit.
 *
 * The port's own model slots map to `dos_index` = slot + 1; see
 * load_3d_object_models in models.c. */
int uw_dos_model_script(int dos_index, char *out, unsigned int out_sz);

/* Releases the cached copy of UW.EXE. Call after model loading; a later
 * uw_dos_model_script would simply read it again. */
void uw_dos_models_release(void);

#endif
