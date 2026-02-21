/// @description Insert description here
// You can write your code in this editor
if(!my_controller.using_controller && position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)){
	execute();
}else if(my_controller.select && buffer <= 0){
	execute();
}

if(buffer > 0){buffer--};