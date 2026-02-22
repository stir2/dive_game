/// @description Insert description here
// You can write your code in this editor

up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
select = keyboard_check_pressed(vk_space);

if(using_controller){
	//if this is a pause menu, then once resume is reached, right and left should switch between resume and main menu,
	//and up should take either back to fullscreen
	//otherwise, business as usual
	if(pause_menu){
		if(button_active < 3){
			if(down){button_active = clamp(button_active + 1, 0, array_length(buttons) - 1);}
			if(up){button_active = clamp(button_active - 1, 0, array_length(buttons) - 1);}
		}
		else{
			if(right){button_active = 4;}
			if(left){button_active = 3;}
			if(up){button_active = 2;}
		}
	}
	else{
		if(down){button_active = clamp(button_active + 1, 0, array_length(buttons) - 1);}
		if(up){button_active = clamp(button_active - 1, 0, array_length(buttons) - 1);}
	}
	
	//if left or right and button_active is 0 (sfx slider) or 1 (music slider), push the slider left or right.
	if((left || right) && (button_active == 0 || button_active == 1)){
		if(left){buttons[button_active].decrease();}
		else if(right){buttons[button_active].increase();}
	}
	if(select && !(button_active == 0 || button_active == 1)){
		//if paused, execute if on exit or fullscrren
		//if not paused, execute if on exit, fullsceen or resume
		buttons[button_active].execute();
	}
}