/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(!instance_exists(my_controller)){instance_destroy();}
else if(my_controller.pause_menu) {
	draw_self();
	draw_sprite_part(spr_slider_empty, 0, 0, 0, slider_x + padding, sprite_get_height(spr_slider_empty), x - sprite_width/2,  y - sprite_height/2);
	draw_roundrect(x - 80, bbox_top - 24, x + 80, bbox_top - 8, false);
	draw_sprite(spr_slider_button, 0, slider_x + boundaries.x_min, y);
	draw_text_transformed_color(x, bbox_top - 16, label + ": " + string(currVal), .5, .5, 0, #001146, #001146, #001146, #001146, 1);
	//draw_text_colour(x + 40, bbox_top - 16, slider_x, c_black, c_black, c_black, c_black, 1);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
