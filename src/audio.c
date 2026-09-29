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
// stop_current_audio_handle_dup to clean up), param_1!=0 enables it.
void set_sound_effects_enabled(param_1)
int param_1;

{
  if (DAT_00087450 != 0) {
    if (param_1 == 0) {
      DAT_0008744c = 0;
      stop_current_audio_handle_dup();
    }
    else {
      DAT_0008744c = 1;
    }
  }
  return;
}






// was FUN_00072c44 -- stops the current sound/music handle
// (FUN_0004cfc8(DAT_0023c3b8)) if the audio subsystem is initialized
// and a "handle" check passes. That check itself looks like a Ghidra
// decompilation artifact rather than real original logic: it reads
// DAT_00087448 (elsewhere in this file a plain int on/off flag, e.g.
// is_music_playing) as if it were a pointer value, which only makes
// sense as a mis-inferred type from this one call site -- left as
// literally decompiled (not "fixed" to a guessed real condition) since
// the practical effect (stop the handle whenever DAT_00087454 and
// DAT_00087448 are both nonzero) matches every other gate in this
// cluster and no live bug has been observed from it.
void stop_current_audio_handle()

{
  undefined4 *puVar1;

  puVar1 = &DAT_00087448;
  if (DAT_00087454 != 0) {
    puVar1 = DAT_00087448;
  }
  if (DAT_00087454 != 0 && puVar1 != (undefined4 *)0x0) {
    FUN_0004cfc8(DAT_0023c3b8);
  }
  return;
}






// was FUN_00072c74 -- plays sound effect param_1 positioned at world
// coordinates (param_2,param_3), with a base volume/id-derived
// parameter block param_4: computes the distance from the player
// (FUN_00013774, a sqrt-shaped distance function) and, if within range
// (uVar3<=0x30, else fails outright), derives a distance-attenuated
// volume and a stereo pan (via heading_to_sine_cosine against the
// player's own facing) before dispatching to FUN_00073064 with the
// per-sound-effect-id parameter table entries (DAT_0023c2b0/b1/b2/b3,
// 5-byte stride per id). Fails (returns 0xff) if the sound-effects
// subsystem is disabled or the sound is out of range.
undefined4 play_positional_sound_effect(param_1,param_2,param_3,param_4)
uint param_1;
short param_2;
short param_3;
uint param_4;

{
  short sVar1;
  short sVar2;
  uint uVar3;
  undefined4 uVar4;
  int iVar5;
  int iVar6;
  undefined1 uVar7;
  uint uVar8;
  uint uVar9;
  int iVar10;
  short local_28;
  short local_26;
  
  if ((DAT_00087450 == 0) || (DAT_0008744c == 0)) {
LAB_00072f24:
    uVar4 = 0xff;
  }
  else {
    iVar10 = (param_1 & 0xff) * 5;
    uVar9 = (int)param_2 -
            ((int)(((*(ushort *)((char *)g_player_object + 0x16) >> 7 & 0x1f8) +
                   (uint)(*(byte *)((char *)g_player_object + 3) >> 5)) * 0x10000) >> 0x10);
    uVar8 = (int)param_3 -
            ((int)(((*(ushort *)((char *)g_player_object + 0x16) >> 1 & 0x1f8) +
                   ((*(byte *)((char *)g_player_object + 3) & 0x1c) >> 2)) * 0x10000) >> 0x10);
    uVar3 = FUN_00013774(uVar8 * uVar8 + uVar9 * uVar9);
    uVar3 = uVar3 & 0xffff;
    if (uVar3 == 0) {
      uVar7 = 0x40;
      iVar5 = ((param_4 & 0xff) + (uint)(byte)(&DAT_0023c2b2)[iVar10]) * 0x10000;
    }
    else {
      if (uVar8 == uVar3) {
        sVar1 = 0x7f;
      }
      else if (-uVar3 == uVar8) {
        sVar1 = 0x80;
      }
      else {
        sVar1 = Ordinal_2005(uVar3,uVar8 * 0x80);
      }
      if (uVar9 == uVar3) {
        sVar2 = 0x7f;
      }
      else if (-uVar3 == uVar9) {
        sVar2 = 0x80;
      }
      else {
        sVar2 = Ordinal_2005(uVar3,uVar9 * 0x80);
      }
      heading_to_sine_cosine(((0x40 - (*(byte *)((char *)g_player_object + 0x18) & 0x1f)) * 4 -
                   ((int)*(short *)((char *)g_player_object + 2) & 0x380U)) * 0x40,&local_28,&local_26);
      iVar5 = (int)local_28;
      iVar6 = (int)local_26;
      local_28 = (short)(char)((ushort)local_28 >> 8);
      local_26 = (short)(char)((ushort)local_26 >> 8);
      iVar6 = 0x40 - (short)((uint)((iVar6 >> 8) * (int)sVar1 - (iVar5 >> 8) * (int)sVar2) >> 8);
      iVar5 = iVar6 * 0x10000 >> 0x10;
      if (0x7f < iVar5) {
        iVar6 = 0x7f;
      }
      uVar7 = (undefined1)iVar6;
      iVar6 = iVar5 + -0x7f;
      if (iVar5 < 0x80) {
        iVar6 = iVar5;
      }
      iVar5 = ((param_4 & 0xff) + (uint)(byte)(&DAT_0023c2b2)[iVar10]) * 0x10000;
      if (iVar6 < 0) {
        uVar7 = 0;
      }
      if (0x30 < uVar3) goto LAB_00072f24;
      if (7 < uVar3) {
        iVar5 = Ordinal_2005(0x28,(0x30 - uVar3) * (int)(short)((uint)iVar5 >> 0x10));
        iVar5 = iVar5 << 0x10;
      }
    }
    uVar3 = iVar5 >> 0x10;
    iVar5 = (int)(short)((uint)iVar5 >> 0x10);
    if (0x7f < iVar5) {
      uVar3 = 0x7f;
      iVar5 = iVar5 + -0x7f;
    }
    if (iVar5 < 0) {
      uVar3 = 0;
    }
    uVar4 = FUN_00073064(param_1,(&DAT_0023c2b0)[iVar10],(&DAT_0023c2b1)[iVar10],uVar3 & 0xff,uVar7,
                         *(undefined2 *)(&DAT_0023c2b3 + iVar10));
  }
  return uVar4;
}
