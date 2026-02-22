/// @description Insert description here
// You can write your code in this editor
if(on_exit){
	draw_sprite(spr_menu_button_proto, 0, items[2].x, items[2].bbox_bottom + 96);
	draw_sprite(spr_title_menu_button_highlight, 0, items[2].x, items[2].bbox_bottom + 96);
	draw_text_transformed(items[2].x, items[2].bbox_bottom + 96, "Exit Shop", .5, .5, 0);
}
else{
	draw_sprite(spr_shop_item_marker, 0, items[item_active].x, items[item_active].y);
	
	draw_sprite(spr_menu_button_proto, 0, items[2].x, items[2].bbox_bottom + 96);
	draw_text_transformed(items[2].x, items[2].bbox_bottom + 96, "Exit Shop", .5, .5, 0);
}
