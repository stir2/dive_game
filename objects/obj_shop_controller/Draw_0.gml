/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_main);
if(on_exit){
	draw_sprite(spr_menu_button_proto, 0, items[2].x, items[2].bbox_bottom + 96);
	draw_sprite(spr_button_long_selection, image_index, items[2].x, items[2].bbox_bottom + 96);
	draw_text_transformed_color(items[2].x, items[2].bbox_bottom + 96, "Exit Shop", .7, .7, 0, #001146, #001146, #001146, #001146, 1);
}
else{
	draw_sprite(spr_shop_selection, image_index, items[item_active].x, items[item_active].y);
	
	draw_sprite(spr_menu_button_proto, 0, items[2].x, items[2].bbox_bottom + 96);

	draw_text_transformed_color(items[2].x, items[2].bbox_bottom + 96, "Exit Shop", .7, .7, 0, #001146, #001146, #001146, #001146, 1);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);