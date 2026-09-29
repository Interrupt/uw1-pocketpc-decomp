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
// player's own facing) before dispatching to allocate_and_play_sound_channel with the
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
    uVar4 = allocate_and_play_sound_channel(param_1,(&DAT_0023c2b0)[iVar10],(&DAT_0023c2b1)[iVar10],uVar3 & 0xff,uVar7,
                         *(undefined2 *)(&DAT_0023c2b3 + iVar10));
  }
  return uVar4;
}






// was FUN_00072f30 -- play_positional_sound_effect's non-positional
// sibling: plays sound effect param_1 with an explicit pan (param_2,
// passed straight through) and a volume boost (param_3, added to the
// per-id base volume DAT_0023c2b2[id] and clamped to 0..0x7f) rather
// than deriving pan/volume from a world position.
undefined4 play_sound_effect_with_pan(param_1,param_2,param_3)
uint param_1;
undefined1 param_2;
uint param_3;

{
  uint uVar1;
  undefined4 uVar2;
  uint uVar3;
  int iVar4;
  
  if ((DAT_00087450 == 0) || (DAT_0008744c == 0)) {
    uVar2 = 0xff;
  }
  else {
    iVar4 = (param_1 & 0xff) * 5;
    uVar1 = (int)(((param_3 & 0xff) + (uint)(byte)(&DAT_0023c2b2)[iVar4]) * 0x10000) >> 0x10;
    uVar3 = uVar1;
    if (0x7f < uVar1) {
      uVar3 = 0x7f;
    }
    if (0x7f < uVar1 && (int)(uVar1 - 0x7f) < 0) {
      uVar3 = 0;
    }
    uVar2 = allocate_and_play_sound_channel(param_1,(&DAT_0023c2b0)[iVar4],(&DAT_0023c2b1)[iVar4],uVar3 & 0xff,param_2,
                         *(undefined2 *)(&DAT_0023c2b3 + iVar4));
  }
  return uVar2;
}



// was FUN_00072fc8 -- play_positional_sound_effect's convenience
// wrapper taking an object pointer (param_2) instead of raw
// coordinates: extracts the object's world position and forwards to
// play_positional_sound_effect.
undefined4 play_sound_effect_at_object(param_1,param_2,param_3)
undefined4 param_1;
int param_2;
undefined4 param_3;

{
  undefined4 uVar1;
  
  if ((DAT_00087450 == 0) || (DAT_0008744c == 0)) {
    uVar1 = 0xff;
  }
  else {
    uVar1 = play_positional_sound_effect(param_1,((*(ushort *)(param_2 + 0x16) & 0xfc00) >> 7) +
                                 (uint)(*(byte *)(param_2 + 3) >> 5),
                         (*(byte *)(param_2 + 3) >> 2 & 7) +
                         ((*(ushort *)(param_2 + 0x16) & 0x3f0) >> 1),param_3);
  }
  return uVar1;
}






// was FUN_0007305c -- currently a no-op stub (Ghidra recovered an
// empty body). Its two call sites, both in movement.c's per-tick
// footstep/jump sound handling, call it right before resetting
// DAT_00086e84 (a sound-handle-in-progress marker) to -1, so this was
// most plausibly meant to stop that in-progress movement sound.
void stop_movement_sound_handle()

{
  return;
}



// was thunk_FUN_00072c44 -- byte-for-byte identical body to
// stop_current_audio_handle (this project's established split-symbol/
// naming-collision bug class -- see that function's own comment; kept
// as a separately-named/addressed function per this project's
// convention of preserving what Ghidra recovered).
void stop_current_audio_handle_dup()

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






// was FUN_00073064 -- allocates a free sound channel slot (bit-scanned
// from DAT_0023c39c, 4 channels) and maps sound-effect id param_1 to a
// "sound group" value (4/8/0x10, ids 3/0x16 -> 4, 4/0x10 -> 0x10, else
// 8; ids <7 fail outright, returning 0xff) stored per-channel in
// g_sound_channel_state/g_sound_channel_group (see their own
// declaration comment -- BUG FIX: was raw hardcoded-address writes),
// then dispatches the actual sample trigger via trigger_sound_sample_note.
// Called by play_positional_sound_effect and siblings as their final
// low-level step.
uint allocate_and_play_sound_channel(param_1,param_2,param_3,param_4)
byte param_1;
undefined4 param_2;
undefined4 param_3;
undefined1 param_4;

{
  byte bVar1;
  uint uVar2;
  undefined2 uVar3;
  byte bVar4;
  
  bVar1 = 1;
  bVar4 = DAT_0023c39c & 1;
  for (uVar2 = 0; (bVar4 != 0 && (uVar2 < 4)); uVar2 = uVar2 + 1 & 0xff) {
    bVar1 = bVar1 << 1;
    bVar4 = DAT_0023c39c & bVar1;
  }
  if (param_1 == 3) {
LAB_00073104:
    uVar3 = 4;
    goto LAB_00073108;
  }
  if (param_1 == 4) {
LAB_000730fc:
    uVar3 = 0x10;
  }
  else {
    if (param_1 < 7) {
      return 0xff;
    }
    if (8 < param_1) {
      if (param_1 == 0x10) goto LAB_000730fc;
      if (param_1 != 0x15) {
        if (param_1 != 0x16) {
          return 0xff;
        }
        goto LAB_00073104;
      }
    }
    uVar3 = 8;
  }
LAB_00073108:
  DAT_0023c39c = DAT_0023c39c | bVar1;
  g_sound_channel_state[uVar2] = 2;
  g_sound_channel_group[uVar2] = uVar3;
  trigger_sound_sample_note(param_1,param_4);
  return uVar2;
}



// was FUN_00073140 -- the low-level sound-sample trigger: lazily
// reloads the current music module if playback had stopped
// (DAT_00087448==0) and lazily allocates the sample-set handle
// (DAT_0023c3bc) on first use, then triggers sample id param_1+800
// as a one-shot note into the module player (FUN_0004b66c/
// FUN_0004f594/FUN_0004f6b0), all through the audio interface
// DAT_0023c3b8.
void trigger_sound_sample_note(param_1)
int param_1;

{
  char cVar1;
  int iVar2;
  undefined4 local_18;
  
  if (DAT_0023c3b8 != (undefined4 *)0x0) {
    if (DAT_00087448 == 0) {
      FUN_0004cfc8(DAT_0023c3b8);
      if (DAT_0023c3b8 != (undefined4 *)0x0) {
        (**(code **)*DAT_0023c3b8)(DAT_0023c3b8,1);
      }
      iVar2 = Ordinal_1095(0x10581);
      if (iVar2 == 0) {
        DAT_0023c3b8 = (undefined4 *)0x0;
      }
      else {
        Ordinal_177(&local_18,&DAT_0023c3d4);
        DAT_0023c3b8 = (undefined4 *)FUN_0004bc94(iVar2,local_18);
      }
      FUN_0004ca50();
      DAT_0023c280 = read_realtime_clock_units();
      DAT_0023c330 = *(undefined4 *)(&DAT_00087414 + (uint)DAT_0023c3a8 * 4);
    }
    if (DAT_0023c3bc == 0) {
      iVar2 = Ordinal_1095(0x1a);
      if (iVar2 == 0) {
        DAT_0023c3bc = 0;
      }
      else {
        DAT_0023c3bc = FUN_0004b600();
      }
    }
    FUN_0004f748(DAT_0023c3b8,0);
    cVar1 = FUN_0004b66c(DAT_0023c3bc,DAT_0023c540,param_1 + 800);
    if (cVar1 != '\0') {
      FUN_0004f594(DAT_0023c3b8,DAT_0023c3bc,0);
      FUN_0004f6b0(DAT_0023c3b8,0);
    }
  }
  return;
}
