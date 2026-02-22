/// @description Insert description here
// You can write your code in this editor
if(distance_to_object(obj_player) < 50){
	sprite_index = spr_shopkeeper_highlighted;
	if(keyboard_check_pressed(vk_space) && !obj_player.in_shop && buffer <= 0){
		instance_create_layer(x, y, "Instances", obj_shop_controller);
		obj_player.in_shop = true;
	}
}
else{sprite_index = spr_shopkeeper}

if(buffer > 0){buffer--;}