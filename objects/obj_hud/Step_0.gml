/// @description Insert description here
// You can write your code in this editor
start_pos = [camera_get_view_x(obj_camera.cam) + x_offset, camera_get_view_y(obj_camera.cam)  + y_offset];
if(instance_exists(obj_player)){
	sanddollars = obj_player.sanddollars;
	air_level = obj_player.air_level;
	max_air_level = obj_player.tank_size;
}


sanddollar_icon_pos = [start_pos[0] + x_offset + sanddollar_offset, start_pos[1] + y_offset];
sanddollar_text_pos = [start_pos[0] + x_offset + text_x_offset + sanddollar_offset,start_pos[1] + y_offset];
air_level_icon_pos = [start_pos[0] + x_offset, start_pos[1] + y_offset];
air_level_text_pos = [start_pos[0] + x_offset + text_x_offset, start_pos[1] + y_offset];

air_bubble_height = (air_level/max_air_level) * sprite_get_height(spr_hud_tank_bubbles);
air_bubble_start = sprite_get_height(spr_hud_tank_bubbles) - air_bubble_height;

anim_timer++;