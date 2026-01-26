/// @description Insert description here
// You can write your code in this editor

var _temp_angle = image_angle;
image_angle = 0;
myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right, bbox_bottom], 1, knock_back_amount, undefined,0,0,0,[obj_player],,,-1,,60))
image_angle = _temp_angle;
depth = -5;