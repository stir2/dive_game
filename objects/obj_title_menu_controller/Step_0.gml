/// @description Insert description here
// You can write your code in this editor

up = keyboard_check(vk_up);
down = keyboard_check(vk_down);
select = keyboard_check_pressed(vk_space);

if(using_controller && !suspended){
	if(down && input_buff <= 0){button_active = clamp(button_active + 1, 0, array_length(buttons) - 1);}
	if(up && input_buff <= 0){button_active = clamp(button_active - 1, 0, array_length(buttons) - 1);}
	
	if(up || down){input_buff = input_buffer_time;}
	if(input_buff > 0){input_buff--;}
	
	if(select){buttons[button_active].execute();}
}