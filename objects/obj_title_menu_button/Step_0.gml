/// @description Insert description here
// You can write your code in this editor
if(!my_controller.using_controller && !my_controller.suspended && position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)){
	execute();
}