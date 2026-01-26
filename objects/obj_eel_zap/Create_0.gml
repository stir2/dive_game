
default_palette = spr_palette_enemy;
current_palette = spr_palette_enemy;

movement_speed = 15;
life_time = 30;
life_counter = life_time;
myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right, bbox_bottom], 1, 10, undefined,0,0,0,[obj_player],,,-1,,60));
image_angle = angle;