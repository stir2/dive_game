/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(my_controller)){instance_destroy();}
else if (my_controller.pause_menu) { 
	draw_self();
	draw_text(x, y, label);
}