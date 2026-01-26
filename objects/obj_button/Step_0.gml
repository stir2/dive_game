if (instance_position(mouse_x, mouse_y, obj_button) == id) {
	sprite_index = spr_menu_button_hover_proto;
	if (mouse_check_button_pressed(mb_left)) click_action();
}
else sprite_index = spr_menu_button_proto;