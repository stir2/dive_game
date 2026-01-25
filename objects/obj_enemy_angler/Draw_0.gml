// Inherit the parent event
event_inherited();

if (sprite_index != spr_enemy_angler_attack) {
	draw_sprite_ext(spr_enemy_angler_bubble, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
}