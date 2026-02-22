/// @description Insert description here
// You can write your code in this editor
draw_set_font(font_main);

if (using_controller) {
	draw_text_transformed(room_width - 250, room_height - 50, "Press \"A\" to continue...", .5, .5, 0);
}
else draw_text_transformed(room_width - 250, room_height - 50, "Any key to continue...", .5, .5, 0);