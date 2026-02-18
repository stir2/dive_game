/// @description Insert description here
// You can write your code in this editor
draw_self();
if(curr_level >= max_level){
	draw_set_alpha(0.8);
	draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_dkgrey, c_dkgrey, c_black, c_black, false);
	draw_set_alpha(1);
}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_main);

draw_set_alpha(0.6);
draw_roundrect(bbox_left - 8, bbox_top - 48, bbox_right + 8, bbox_top - 8, false);
draw_set_alpha(1);
draw_text_transformed_colour(x, bbox_top - 35, description, .8, .8, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_colour(x, bbox_top - 20, "Level " + string(curr_level), 1, 1, 0, c_black, c_black, c_black, c_black, 1);
draw_set_alpha(0.6);
draw_roundrect(bbox_left, bbox_bottom + 4, bbox_right, bbox_bottom + 30, false);
draw_set_alpha(1);
if(curr_level >= max_level){draw_text_color(x, bbox_bottom + 16, "???", c_black, c_black, c_black, c_black, 1);}
else{draw_text_color(x, bbox_bottom + 16, "$" + string(price), c_black, c_black, c_black, c_black, 1);}
draw_set_halign(fa_left);
draw_set_valign(fa_top);