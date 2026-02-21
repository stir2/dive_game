/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

effect_sprite = spr_sanddollar_collect_pink;
if(sprite_index == spr_sanddollar_yellow){effect_sprite = spr_sanddollar_collect_yellow;}
if(sprite_index == spr_sanddollar_blue){effect_sprite = spr_sanddollar_collect_blue;}

event_inherited();
if(instance_exists(obj_hud)){
angle_direction = random_range(0, 360);
my_speed = 13;
myAnchor = instance_create_layer(obj_hud.x, obj_hud.y, "Instances", obj_sanddollar_collect_anchor)
}else{instance_destroy();}