/* Background music track playback: loads and plays a numbered MOD
 * tracker file (\SOUND\uwNN.mod) through the game's COM-style audio
 * interface. Split out of uw.c (the original monolithic decompile)
 * once these functions' real roles were confirmed.
 */
#include "headers/audio.h"
#include "headers/debug.h"
#include <stdio.h>
#include <stdlib.h>





// was FUN_00072910 -- plays background music track param_1 (patched
// into the "uw%02d.mod" filename template, played from \SOUND\): no-op
// if the audio subsystem isn't initialized (DAT_00087454/DAT_00087448)
// or the track is already playing (param_1==DAT_0023c3a8). Stops any
// currently-playing module via its COM-style interface (DAT_0023c3b8),
// opens and loads the new one via the MOD-player ordinals
// (Ordinal_1095/177/FUN_0004bc94), and -- if param_2!=0 -- starts
// playback (FUN_0004ca50) and records the start time and volume
// (DAT_00087414-indexed per-track table) for later use.
undefined4 play_music_track(param_1,param_2)
byte param_1;
int param_2;

{
  char stack0xffdc3238_buf [256];
  char *stack0xffdc3238_ptr;
  char cVar1;
  char *pcVar2;
  int iVar3;
  undefined4 uVar4;
  /* Was declared as just 2 bytes -- Ghidra only recovered the first
     access, but this is filled from the 9-byte "uw00.mod\0" template
     right below and local_12e/local_12d (now folded in as direct indexed
     writes) patch the two '0' digits in place at offsets 2/3, so it needs
     to hold the whole string. */
  undefined1 auStack_130 [16];
  undefined1 local_127;
  undefined4 local_124;
  char acStack_120 [260];

  Ordinal_1044(auStack_130,s_uw00_mod_00087514,9);
  local_127 = 0;
  if ((DAT_00087454 == 0) || (DAT_00087448 == 0)) {
    uVar4 = 0;
  }
  else {
    if (param_1 != DAT_0023c3a8) {
      pcVar2 = &DAT_0023cca8;
    stack0xffdc3238_ptr = stack0xffdc3238_buf;
      auStack_130[2] = (param_1 >> 3) + 0x30;
      auStack_130[3] = (param_1 & 7) + 0x30;
      do {
        cVar1 = *pcVar2;
        *stack0xffdc3238_ptr = cVar1; stack0xffdc3238_ptr = stack0xffdc3238_ptr + 1;
        pcVar2 = pcVar2 + 1;
      } while (cVar1 != '\0');
      Ordinal_1063(acStack_120,s__SOUND__0008750c);
      Ordinal_1063(acStack_120,auStack_130);
      if (DAT_0023c3b8 != (undefined4 *)0x0) {
        FUN_0004cfc8();
        if (DAT_0023c3b8 != (undefined4 *)0x0) {
          (**(code **)*DAT_0023c3b8)(DAT_0023c3b8,1);
        }
        DAT_0023c3b8 = (undefined4 *)0x0;
      }
      iVar3 = Ordinal_1095(0x10581);
      if (iVar3 == 0) {
        DAT_0023c3b8 = (undefined4 *)0x0;
      }
      else {
        Ordinal_177(&local_124,acStack_120);
        DAT_0023c3b8 = (undefined4 *)FUN_0004bc94(iVar3,local_124);
      }
    }
    DAT_0023c384 = 0;
    DAT_0023c3a8 = param_1;
    if (param_2 != 0) {
      FUN_0004ca50(DAT_0023c3b8);
      DAT_0023c280 = read_realtime_clock_units();
      DAT_0023c330 = *(undefined4 *)(&DAT_00087414 + (uint)DAT_0023c3a8 * 4);
      DAT_00087448 = 1;
    }
    uVar4 = 1;
  }
  return uVar4;
}







// was FUN_00072aac -- restarts/resumes playback of the currently-loaded
// music module (same start-playback steps as the tail of play_music_track,
// minus the load), gated on the audio subsystem being initialized and
// DAT_0023c32c (an open-module handle) being valid.
void resume_music_playback()

{
  if ((DAT_00087454 != 0) && (DAT_00087448 != 0)) {
    if (DAT_0023c32c != -1) {
      FUN_0004ca50(DAT_0023c3b8);
      DAT_0023c280 = read_realtime_clock_units();
      DAT_0023c330 = *(undefined4 *)(&DAT_00087414 + (uint)DAT_0023c3a8 * 4);
      DAT_00087448 = 1;
    }
  }
  return;
}



// was FUN_00072b2c -- returns the currently-playing music track number.
undefined1 get_current_music_track()

{
  return DAT_0023c3a8;
}



// was FUN_00072b3c -- returns whether music is currently playing
// (false if the audio subsystem isn't initialized).
undefined4 is_music_playing()

{
  undefined4 uVar1;

  uVar1 = DAT_00087448;
  if (DAT_00087454 == 0) {
    uVar1 = 0;
  }
  return uVar1;
}



// was FUN_00072b58 -- is_music_playing's counterpart for the sound-
// effects subsystem (DAT_0008744c/DAT_00087450).
undefined4 is_sound_effects_enabled()

{
  undefined4 uVar1;

  uVar1 = DAT_0008744c;
  if (DAT_00087450 == 0) {
    uVar1 = 0;
  }
  return uVar1;
}



// was FUN_00072b74 -- enables (param_1!=0: resumes playing
// DAT_0023c384, the current/pending track) or disables (param_1==0:
// stops playback via FUN_0004cfc8) background music.
void set_music_enabled(param_1)
int param_1;

{
  uint uVar1;
  
  if (DAT_00087454 != 0) {
    if (param_1 == 0) {
      uVar1 = 1;
    }
    else {
      if (DAT_00087448 == 0) {
        DAT_00087448 = 1;
        FUN_000735c0();
        play_music_track(DAT_0023c384,1);
        return;
      }
      uVar1 = 0;
    }
    if (((DAT_00087448 & uVar1) != 0) && (DAT_0023c32c != -1)) {
      DAT_00087448 = 0;
      FUN_0004cfc8(DAT_0023c3b8);
      DAT_00087448 = 0;
    }
  }
  return;
}



// was FUN_00072c10 -- set_music_enabled's counterpart for the sound-
// effects subsystem: param_1==0 disables it (also calling
// thunk_FUN_00072c44 to clean up), param_1!=0 enables it.
void set_sound_effects_enabled(param_1)
int param_1;

{
  if (DAT_00087450 != 0) {
    if (param_1 == 0) {
      DAT_0008744c = 0;
      thunk_FUN_00072c44();
    }
    else {
      DAT_0008744c = 1;
    }
  }
  return;
}
