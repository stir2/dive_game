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
draw_text(x, bbox_top - 40, description);
draw_text(x, bbox_top - 16, "Level " + string(curr_level));
if(curr_level >= max_level){draw_text(x, bbox_bottom + 16, "???")}
else{draw_text(x, bbox_bottom + 16, "$" + string(price));}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);