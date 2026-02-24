/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(my_controller)){instance_destroy();}
else {
	draw_self();
	draw_sprite(sprShell, 0, slider_x + boundaries.x_min, y)
	draw_text(x, bbox_top - 16, label + ": " + string(currVal));
	//draw_text_colour(x + 40, bbox_top - 16, slider_x, c_black, c_black, c_black, c_black, 1);
}