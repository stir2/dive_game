if (!sprite_exists(logo)) { 
	draw_self();
	//Set alignment
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(font_main);

	draw_text(x, y, label);
	
	draw_set_font(font_sub);
	draw_text(x, y + 16, sub_text);



	draw_set_font(font_main);
	//Reset alignment
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
} 
else { 
	draw_sprite(logo, 0, x, y);
}