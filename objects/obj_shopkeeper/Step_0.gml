/// @description Insert description here
// You can write your code in this editor

using_controller = (obj_controller.controllerPad != -1);
if (using_controller) {
	if(distance_to_object(obj_player) < 50){
		sprite_index = spr_shopkeeper_highlighted;
		if (obj_controller.check_input_pressed(Inputs.Confirm) && !obj_player.in_shop && buffer <= 0){
			instance_create_layer(x, y, "Instances", obj_shop_controller);
			obj_player.in_shop = true;
		}
	}
	else{sprite_index = spr_shopkeeper}

	if(buffer > 0){buffer--;}
}