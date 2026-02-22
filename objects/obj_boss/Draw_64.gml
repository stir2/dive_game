/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_text(600, 10, "Boss");
draw_healthbar(300, 45, 900, 60, (hp/hp_max)*100, c_white, c_maroon, c_red, 0, true, true);
draw_set_halign(fa_left);