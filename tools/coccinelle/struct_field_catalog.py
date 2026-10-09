"""Documented UW1 packed fields already present in src/headers/uw.h.

Entries are (bit offset, width, field). Reserved/padding fields are excluded.
This is a conversion catalog, not a second definition of the binary layouts;
object_layout validates the actual structs against independently indexed bytes.
"""
WORDS = {
    'type_flags': [(0, 9, 'object_id'), (9, 3, 'flags_res'),
                   (12, 1, 'enchanted'), (13, 1, 'doordir'),
                   (14, 1, 'invisible'), (15, 1, 'is_quant')],
    'position_word': [(0, 7, 'zpos'), (7, 3, 'heading'),
                      (10, 3, 'ypos'), (13, 3, 'xpos')],
    'chain_word': [(0, 6, 'quality'), (6, 10, 'next')],
    'link_word': [(0, 6, 'owner'), (6, 10, 'link')],
    'goal_word': [(0, 4, 'npc_goal'), (4, 8, 'npc_gtarg'),
                  (12, 4, 'npc_animation_frame')],
    'status_word': [(0, 4, 'npc_level'), (13, 1, 'npc_talkedto'),
                    (14, 2, 'npc_attitude')],
    'target_word': [(0, 6, 'npc_target_tile_x'), (6, 6, 'npc_target_tile_y'),
                    (12, 4, 'npc_swing_charge')],
    'tile_word': [(0, 4, 'npc_path_slot'), (4, 6, 'npc_yhome'),
                  (10, 6, 'npc_xhome')],
    'tile_position': [(4, 6, 'tile_y'), (10, 6, 'tile_x')],
    'size_weight': [(0, 3, 'collision_radius'), (3, 1, 'animated'),
                    (4, 12, 'unit_weight')],
}
BYTES = {
    'owner_flags': [(7, 1, 'can_have_owner')],
    'description_flags': [(0, 4, 'quality_type'), (4, 1, 'has_look_description')],
    'heading_flags': [(0, 5, 'npc_heading')],
    # npc_hunger is a legacy format label. The live AI flag semantics are
    # not yet documented sufficiently to replace npc_ai_flags masks with it.
    'pitch_flags': [(3, 5, 'pitch')],
}
