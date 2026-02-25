/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(!instance_exists(my_controller)){instance_destroy();}
else {
	draw_self();
	draw_text_transformed_color(x, y, label, .7, .7, 0, #001146, #001146, #001146, #001146, 1);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);