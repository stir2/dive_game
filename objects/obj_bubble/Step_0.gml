

if(global.t - latest_t_wandered > WANDER_COOLDOWN){
	target_vel.x = random_range(-1 * WANDER_STRENGTH, WANDER_STRENGTH) * (1 - SPAWN_LOCATION_INFLUENCE);
	target_vel.y= random_range(-1 * WANDER_STRENGTH, WANDER_STRENGTH) * (1 - SPAWN_LOCATION_INFLUENCE);
	
	vec_to_spawn = new vec2(x - spawn.x, y - spawn.y);
	dist_to_spawn = sqrt(vec_to_spawn.x * vec_to_spawn.x
						+ vec_to_spawn.y * vec_to_spawn.y);
						
	if(dist_to_spawn >= 0.005){
		uvec_to_spawn = new vec2(vec_to_spawn.x / dist_to_spawn * WANDER_STRENGTH, 
								vec_to_spawn.y / dist_to_spawn * WANDER_STRENGTH);
	
		target_vel.x -= (uvec_to_spawn.x * SPAWN_LOCATION_INFLUENCE);
		target_vel.y -= (uvec_to_spawn.y * SPAWN_LOCATION_INFLUENCE);
	}						
	
	latest_t_wandered = global.t;
}

if(state == "popped"){
	if(global.t - latest_t_popped > RESPAWN_COOLDOWN){
	respawn();
	} else {
		animBuffer();
		//return;
	}
}else{

	vel.x += (target_vel.x - vel.x) * VEL_TRANSITION_MULT;
	vel.y += (target_vel.y - vel.y) * VEL_TRANSITION_MULT;

	
	x_speed = vel.x;
	y_speed = vel.y;
	
	moveAndCollide();
	
	//NOTE: Had to comment this out cause of perfomance issues
	// Split movement into steps, stopping if the next step will collide with a solid.
	//steps = 100;
	//for(i = 0; i < abs(vel.y) * steps; i++){
	//	if(!place_meeting(x, y + sign(vel.y) / steps, obj_solid)
	//	&& !place_meeting(x, y + sign(vel.y) / steps, obj_bubble)){
	//		y += sign(vel.y) / steps;
	//		grounded = false;
	//	} else {
	//		vel.y *= -1 * BOUNCE_STRENGTH;
	//		latest_t_wandered = global.t; // bubbles cannot wander directly after a bounce
	//		break;
	//	}
	//}

	//for(i = 0; i < abs(vel.x) * steps; i++){
	//	if(!place_meeting(x + sign(vel.x) / steps, y, obj_solid)
	//	&& !place_meeting(x + sign(vel.x) / steps, y, obj_bubble)){
	//		x += sign(vel.x) / steps;
	//	} else {
	//		vel.x *= -1 * BOUNCE_STRENGTH; 
	//		latest_t_wandered = global.t; // bubbles cannot wander directly after a bounce
	//		break;
	//	}
	//}

	if(place_meeting(x, y, obj_player)){
		add_player_air(air_amount);
		pop();
	}

	if(!in_water){
		pop();
	}

	// Unsquish bubbles
	var tries = 0;
	while (place_meeting(x, y, obj_bubble) && tries < 50) {
	    x += irandom_range(-0.5 * tries, 0.5 * tries);
	    y += irandom_range(-0.5 * tries, 0.5 * tries);
	    tries++;
		show_debug_message("UNSQUISH");
	}

	animBuffer();
}