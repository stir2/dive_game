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

scrSetPaletteSwapShader(default_palette, image_alpha, current_palette, (damage_shake_counter > 0)? spr_palette_hit : spr_palette_blank);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 
	image_angle + shake_angle, (damage_shake_counter > 0) ? 
	make_colour_hsv(170, 150, 255) : c_white, image_alpha);

//draw_text(x, y, string(node_index) + ", " + string(node_target));
//draw_text(x, y+10, "[" + string(nodes[node_index].nx) + ", " + string(nodes[node_index].ny) + "]");
//draw_text(x, y+20, "[" + string(x) + ", " + string(y) + "]");
//draw_text(x, y+30, "[" + string(nodes[node_target].nx) + ", " + string(nodes[node_target].ny) + "]");
//draw_text(x, y+40, "x_dist: " + string(x_dist));
//draw_text(x, y+50, "y_dist: " + string(y_dist));

//draw_circle(x, y, 2, false);
//for (var _i = 0; _i < array_length(nodes); _i++) { 
//    draw_circle_colour(nodes[_i].nx, nodes[_i].ny, 2, c_red, c_orange, false);
//}

//draw_text(x, y, angle_speed);
//draw_text(x, y, scrCalculateDistanceSlowingDown(angle_speed, -move_speed) );
//draw_text(x, y + 10, wander_distance);
//draw_circle(wander_target_x, wander_target_y, 10, true);

//if (scrCalculateDistanceSlowingDown(angle_speed, move_speed) >= wander_distance) { 
//	//slow down
//	draw_text(x, y + 50, "Slow down");
//}
//else { 
//	//Increase speed
//	draw_text(x, y + 50, "Speed up");
//}

	
shader_reset();
