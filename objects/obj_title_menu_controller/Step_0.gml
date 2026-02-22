/// @description Insert description here
// You can write your code in this editor

//up = keyboard_check_pressed(vk_up);
//down = keyboard_check_pressed(vk_down);
//select = keyboard_check_pressed(vk_space);

using_controller = (obj_controller.controllerPad != -1);

if(using_controller && !suspended){
	if(obj_controller.check_input_pressed(Inputs.Down)){button_active = clamp(button_active + 1, 0, array_length(buttons) - 1);}
	if(obj_controller.check_input_pressed(Inputs.Up)){button_active = clamp(button_active - 1, 0, array_length(buttons) - 1);}
	
	if(obj_controller.check_input_pressed(Inputs.Confirm) && suspension_buffer <= 0){buttons[button_active].execute();}
}

if(suspension_buffer > 0){suspension_buffer--;}