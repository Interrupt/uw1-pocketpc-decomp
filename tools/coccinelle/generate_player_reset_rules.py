"""Fold the exact zero-based player reset into its final named state.

The complete function body must match: added calls, escaping/live temporaries,
volatile storage, or a different clear size prevent conversion. ce_memset is
verified as the ordinary memory-only wrapper in ordinal_stubs.c.
"""
from pathlib import Path
HERE = Path(__file__).resolve().parent

ORIGINAL = """ushort uVar1;

  ce_memset(g_player_object,0,0x1b);
  g_player_object->hdr.position_word_high = g_player_object->hdr.owner;
  g_player_object->hdr.link_word_high = 0;
  g_player_object->status_word_low = 0xfd;
  uVar1 = g_player_object->hdr.type_flags;
  g_player_object->hdr.type_flags = (ushort)(uVar1 & 0x7fff);
  uVar1 = g_player_object->hdr.type_flags;
  g_player_object->hdr.type_flags_low = (byte)(char)uVar1;
  g_player_object->hdr.type_flags_high = (byte)(uVar1 >> 8) | 0x20;
  uVar1 = g_player_object->hdr.type_flags;
  g_player_object->hdr.type_flags = (ushort)(uVar1 & 0xbfff);
  uVar1 = g_player_object->hdr.position_word;
  g_player_object->hdr.type_flags_high = (byte)(char)(uVar1 & 0xfc7f);
  g_player_object->hdr.position_word_high = (byte)(char)((uVar1 & 0xfc7f) >> 8);
  g_player_object->goal_word_high = g_player_object->heading_flags & 0xe0;
  uVar1 = g_player_object->hdr.chain_word;
  g_player_object->hdr.position_word_low = (byte)(char)(uVar1 & 0xffc0);
  g_player_object->hdr.chain_word_high = (byte)(char)((uVar1 & 0xffc0) >> 8);
  g_player_object->hdr.position_word_low = g_player_object->hdr.quality;
  g_player_object->hdr.chain_word_high = 0;
  uVar1 = g_player_object->hdr.link_word;
  g_player_object->hdr.position_word_high = (byte)(char)(uVar1 & 0xffc0);
  g_player_object->hdr.link_word_high = (byte)(char)((uVar1 & 0xffc0) >> 8);
  g_player_object->hdr.position_word_high = g_player_object->hdr.owner;
  g_player_object->hdr.link_word_high = 0;
  g_player_object->recent_damage = 0;
  uVar1 = g_player_object->hdr.type_flags;
  g_player_object->hdr.type_flags_low = 0x7f;
  g_player_object->hdr.type_flags_high = (byte)(uVar1 >> 8) & 0xfe;
  return;"""


def generate():
    prefix = """@player_reset_state disable optional_qualifier, drop_cast, bitand_comm, bitor_comm, plus_comm, mult_comm, plus_assoc, minus_assoc, plus_minus_assoc1, plus_minus_assoc2, times_assoc@
identifier F =~ "^reset_player_object_record$";
typedef byte, ushort, uw_mobile_object_t;
@@
void F() {
"""
    final = """
+ ce_memset(g_player_object, 0, sizeof(*g_player_object));
+ g_player_object->hdr.object_id = 0x7f;
+ g_player_object->status_word = 0x00fd;
+ return;
}
"""
    return prefix + '\n'.join('- '+line if line else '-' for line in ORIGINAL.splitlines()) + final


if __name__ == '__main__':
    (HERE / 'player-reset-fields.cocci').write_text(generate())
