draw_self();
//Set alignment
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_font(font_main);

draw_text(x, y, label);

//Reset alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);