//As long as timer is active do the following
if (damage_shake_counter > 0) { 
	//Decrement Timer 
	damage_shake_counter--;
	//Give shake_angle a random angle that falls inbetween a range
	shake_angle = random_range(shake_range, -shake_range);	
}
else {
	shake_angle = 0;
}
draw_sprite_ext(sprite_index, image_number, x, y, image_xscale, image_yscale, image_angle + shake_angle,  (damage_shake_counter > 0) ? make_colour_hsv(170, 150, 255) : c_white, image_alpha);