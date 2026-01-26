/// @description Insert description here
// You can write your code in this editor
//event_inherited();

//draw_self();
if (damage_shake_counter > 0) { 
	//Decrement Timer 
	damage_shake_counter--;
	//Give shake_angle a random angle that falls inbetween a range
	shake_angle = random_range(shake_range, -shake_range);	
}
else {
	shake_angle = 0;
}

scrSetPaletteSwapShader(default_palette, image_alpha, current_palette, (damage_shake_counter > 0)? spr_palette_hit : spr_palette_blank);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 
	image_angle + shake_angle, (damage_shake_counter > 0) ? 
	make_colour_hsv(170, 150, 255) : c_white, image_alpha);
	
shader_reset();
