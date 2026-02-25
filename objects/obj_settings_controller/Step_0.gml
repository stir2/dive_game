/// @description Insert description here
// You can write your code in this editor

//up = keyboard_check_pressed(vk_up);
//down = keyboard_check_pressed(vk_down);
//left = keyboard_check(vk_left);
//right = keyboard_check(vk_right);
//select = keyboard_check_pressed(vk_space);

using_controller = (obj_controller.controllerPad != -1);

if(using_controller){
	//if this is a pause menu, then once resume is reached, right and left should switch between resume and main menu,
	//and up should take either back to fullscreen
	//otherwise, business as usual
	//if(pause_menu){
	//	if(button_active < 3){
	//		if(obj_controller.check_input_pressed(Inputs.Down)){button_active = clamp(button_active + 1, 0, array_length(buttons) - 1);}
	//		if(obj_controller.check_input_pressed(Inputs.Up)){button_active = clamp(button_active - 1, 0, array_length(buttons) - 1);}
	//	}
	//	else{
	//		if(obj_controller.check_input_pressed(Inputs.Right)){button_active = 4;}
	//		if(obj_controller.check_input_pressed(Inputs.Left)){button_active = 3;}
	//		if(obj_controller.check_input_pressed(Inputs.Up)){button_active = 2;}
	//	}
	//}
	//else{
		if(obj_controller.check_input_pressed(Inputs.Down)){button_active = clamp(button_active + 1, 0, array_length(buttons) - 1);}
		if(obj_controller.check_input_pressed(Inputs.Up)){button_active = clamp(button_active - 1, 0, array_length(buttons) - 1);}
	//}
	
	//if left or right and button_active is 0 (sfx slider) or 1 (music slider), push the slider left or right.
	if((obj_controller.check_input(Inputs.Left) || obj_controller.check_input(Inputs.Right)) && (button_active == 0 || button_active == 1)){
		if(obj_controller.check_input(Inputs.Left)){buttons[button_active].decrease();}
		else if(obj_controller.check_input(Inputs.Right)){buttons[button_active].increase();}
	}
	if(obj_controller.check_input_pressed(Inputs.Confirm) && !(button_active == 0 || button_active == 1)){
		//if paused, execute if on exit or fullscrren
		//if not paused, execute if on exit, fullsceen or resume
		buttons[button_active].execute();
	}
}