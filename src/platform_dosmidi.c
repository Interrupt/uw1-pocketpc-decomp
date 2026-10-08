/* Optional DOS-audio backend: the original DOS game's XMI music rendered
 * through OPL3 synthesis (Sound Blaster Pro FM), as an alternative to the
 * WinCE port's converted .MOD files.
 *
 * This is the only file that includes libADLMIDI. See
 * src/headers/platform_dosmidi.h for why the surface is kept this narrow,
 * and third_party/libadlmidi/VENDORING.md for the vendoring and licensing.
 *
 * The DOS original drove music through Miles AIL: XMI files plus a timbre
 * bank, fed to whichever .ADV driver matched the player's sound card
 * (SBPFM.ADV for SB Pro FM). libADLMIDI happens to cover both halves of
 * that -- it reads XMI directly and ships a converted AIL Underworld
 * instrument bank -- so this file is mostly bookkeeping around it. */
#include "headers/platform_dosmidi.h"
#include "headers/debug.h"
#include "adlmidi.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <strings.h>

static struct ADL_MIDIPlayer *g_synth;
static int g_song_loaded;

/* UW_AUDIO_MODE=dos, matching the existing UW_LIGHT_MODE=dos convention
 * (3d.c, player.c): case-insensitive, anything else means "leave the
 * default behavior alone". Read in platform_dosmidi_init rather than
 * cached in a static, because the synth handle below is already the
 * authoritative "is DOS mode live" answer and a second cached copy would
 * only be able to disagree with it. */
static int dos_mode_requested(void)
{
  const char *mode = getenv("UW_AUDIO_MODE");
  return (mode && strcasecmp(mode, "dos") == 0) ? 1 : 0;
}

/* A live synth is the one and only signal that DOS mode is actually in
 * effect: platform_dosmidi_init only creates one when the mode was asked
 * for AND everything it needs was present. */
int platform_dos_audio_enabled(void)
{
  return g_synth != NULL;
}

int platform_dosmidi_init(int sample_rate)
{
  if (!dos_mode_requested()) {
    return 0; /* not asked for -- silent, this is the normal case */
  }
  if (g_synth) {
    return 1;
  }
  if (!getenv("UW_DOS_DATA_DIR")) {
    DEBUG(WARN, "[audio] UW_AUDIO_MODE=dos but UW_DOS_DATA_DIR is unset -- "
                "falling back to the converted .MOD music\n");
    return 0;
  }

  g_synth = adl_init(sample_rate);
  if (!g_synth) {
    DEBUG(WARN, "[audio] adl_init failed: %s -- falling back to the converted .MOD music\n",
          adl_errorString());
    return 0;
  }

  /* Resolve the instrument bank by NAME, never by index: the index shifts
   * between libADLMIDI's full and no-grey bank databases (this build uses
   * the no-grey one -- see VENDORING.md), so a hardcoded number would
   * silently select some unrelated game's instruments. */
  int bank = -1;
  int count = adl_getBanksCount();
  const char *const *names = adl_getBankNames();
  for (int i = 0; i < count; i++) {
    if (names[i] && strstr(names[i], "Underworld")) {
      bank = i;
      break;
    }
  }
  if (bank < 0 || adl_setBank(g_synth, bank) < 0) {
    DEBUG(WARN, "[audio] no AIL Underworld instrument bank available (%d banks searched) -- "
                "falling back to the converted .MOD music\n", count);
    adl_close(g_synth);
    g_synth = NULL;
    return 0;
  }

  /* The DOS original is a Miles AIL game and libADLMIDI models AIL's own
   * volume curve specifically. Set explicitly rather than left on AUTO so
   * the choice is documented and can't drift with a library update --
   * though measuring all 15 models over 20s of UW01.XMI showed AUTO
   * resolving to byte-identical output (peak 7005, RMS 567), i.e. the
   * library independently agrees this is the right model for these files.
   *
   * Worth knowing before "fixing" the level here: this track opens very
   * quietly (~970 peak over its first 5 seconds) and only reaches ~7000
   * later on, which is in the same range as the .MOD backend's own output.
   * A short sample of the opening looks about 7x too quiet and is not. */
  adl_setVolumeRangeModel(g_synth, ADLMIDI_VolumeModel_AIL);
  /* audio.c owns track changes and re-issues play_music_track when a track
   * should repeat (see update_ingame_music_track / the DAT_00087414
   * duration table), so the synth must not loop behind its back. */
  adl_setLoopEnabled(g_synth, 0);

  DEBUG(INFO, "[audio] DOS audio mode ready: OPL3 at %dHz, bank %d \"%s\"\n",
        sample_rate, bank, names[bank]);
  return 1;
}

int platform_dosmidi_xmi_path(const char *win_mod_path, char *out, unsigned int out_sz)
{
  const char *root = getenv("UW_DOS_DATA_DIR");
  if (!root || !*root || !win_mod_path || !out || out_sz == 0) {
    return 0;
  }

  /* Take the basename: audio.c hands us a Windows-style game path such as
   * "\SOUND\uw01.mod". */
  const char *base = win_mod_path;
  for (const char *p = win_mod_path; *p; p++) {
    if (*p == '\\' || *p == '/') {
      base = p + 1;
    }
  }

  /* Stem = basename without its extension, upper-cased: the DOS install
   * ships UW01.XMI where the port ships uw01.mod. */
  const char *dot = strrchr(base, '.');
  size_t stem_len = dot ? (size_t)(dot - base) : strlen(base);
  if (stem_len == 0 || stem_len >= 32) {
    return 0;
  }
  char stem[32];
  for (size_t i = 0; i < stem_len; i++) {
    char c = base[i];
    stem[i] = (c >= 'a' && c <= 'z') ? (char)(c - 'a' + 'A') : c;
  }
  stem[stem_len] = '\0';

  int n = snprintf(out, out_sz, "%s/SOUND/%s.XMI", root, stem);
  return (n > 0 && (unsigned int)n < out_sz) ? 1 : 0;
}

int platform_dosmidi_load_file(const char *real_path)
{
  if (!g_synth || !real_path) {
    return 0;
  }
  if (adl_openFile(g_synth, real_path) < 0) {
    DEBUG(WARN, "[audio] could not load DOS music %s: %s\n", real_path, adl_errorInfo(g_synth));
    return 0;
  }
  g_song_loaded = 1;
  DEBUG(INFO, "[audio] loaded DOS XMI track %s\n", real_path);
  return 1;
}

int platform_dosmidi_render(short *stream, int frames)
{
  if (!g_synth || !g_song_loaded || !stream || frames <= 0) {
    return 0;
  }
  /* adl_play counts individual samples, not stereo frames. */
  int got = adl_play(g_synth, frames * 2, stream);
  return got > 0 ? got / 2 : 0;
}

void platform_dosmidi_rewind(void)
{
  if (g_synth && g_song_loaded) {
    adl_positionRewind(g_synth);
  }
}

void platform_dosmidi_shutdown(void)
{
  if (g_synth) {
    adl_close(g_synth);
    g_synth = NULL;
  }
  g_song_loaded = 0;
}
