/// @description Insert description here
// You can write your code in this editor
using_controller = (obj_controller.controllerPad != -1);

if (using_controller) {
	//up = keyboard_check_pressed(vk_up);
	//down = keyboard_check_pressed(vk_down);
	//left = keyboard_check_pressed(vk_left);
	//right = keyboard_check_pressed(vk_right);
	//select = keyboard_check_pressed(vk_space);

	if(obj_controller.check_input_pressed(Inputs.Right) && !on_exit){item_active = clamp(item_active + 1, 0, array_length(items) - 1);}
	if(obj_controller.check_input_pressed(Inputs.Left) && !on_exit){item_active = clamp(item_active - 1, 0, array_length(items) - 1);}
	if(obj_controller.check_input_pressed(Inputs.Up)){on_exit = false;}
	if(obj_controller.check_input_pressed(Inputs.Down)){on_exit = true;}
	
	if(obj_controller.check_input_pressed(Inputs.Confirm) && buffer <= 0){
		if(!on_exit){
			audio_play_sound(sfx_sanddollar_pickup, 3, false);
			items[item_active].buy();}
		else{
			audio_play_sound(sfx_bubble_pop, 3, false);
			obj_player.in_shop = false;
			obj_shopkeeper.buffer = 10;
			instance_destroy();
		}
	}

	if(buffer > 0){buffer--;}
}
else instance_destroy()