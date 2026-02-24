/// @description Insert description here
// You can write your code in this editor

execute = function(){
	my_controller.suspended = false;
	my_controller.suspension_buffer = 10;
	audio_play_sound(sfx_bubble_pop, 3, false);
	instance_destroy();
}

buffer = 10;