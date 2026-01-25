/// @description Insert description here
// You can write your code in this editor
lifetime = 100;
yspeed = 20;
bubble_made = false;
myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left + 20, bbox_top + 35, bbox_right - 20, bbox_bottom - 35], 1, 15, undefined,0,0,0,[obj_player],,,-1,,60));