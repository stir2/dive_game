/// @description Insert description here
// You can write your code in this editor
if (position_meeting(obj_player.x, obj_player.bbox_top + 1, obj_water_zone)) { 
	mask_index = spr_boss_wall;
	visible = true;
}
else {
	mask_index = spr_palette_blank;
	visible = false;
}
