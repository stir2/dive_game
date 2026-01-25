/// @description Insert description here
// You can write your code in this editor

//Find the side of the harpoon gun at an angle 


var _gun_side_x = 0;
var _gun_side_y = 0;

with (my_gun) { 
	_gun_side_x = bbox_right;
	_gun_side_y = y;
	
	_gun_side_x = x + dcos(image_angle) * (x - bbox_left);
	_gun_side_y = y - dsin(image_angle) * (x - bbox_left);
	
	var _angle_holder = image_angle;
}

var _angle_to_gun = point_direction(_gun_side_x, _gun_side_y, x, y);

draw_sprite_ext(spr_harpoon_rope, 0, x, y, 
point_distance(_gun_side_x, _gun_side_y, x, y)/7, 1, _angle_to_gun, c_white, 1);
//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
//draw_circle(x, y, 2, true);

draw_self();
