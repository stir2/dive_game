/// @description Insert description here
// You can write your code in this editor

up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);
select = keyboard_check_pressed(vk_space);

if(using_controller && !suspended){
	if(down){button_active = clamp(button_active + 1, 0, array_length(buttons) - 1);}
	if(up){button_active = clamp(button_active - 1, 0, array_length(buttons) - 1);}
	
	if(select && suspension_buffer <= 0){buttons[button_active].execute();}
}

if(suspension_buffer > 0){suspension_buffer--;}