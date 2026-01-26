if (instance_position(mouse_x, mouse_y, obj_button) == id) {
	sprite_index = spr_menu_button_hover_proto;
	if (mouse_check_button_pressed(mb_left)) click_action();
	if (mouse_check_button(mb_left)) hold_counter--;
	else hold_counter = hold_time;
	if (hold_counter < 0) hold_action();
}
else sprite_index = spr_menu_button_proto;