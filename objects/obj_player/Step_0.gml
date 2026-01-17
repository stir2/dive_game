// Check control keys for this frame
for(c = 0; c < array_length(controls); c++){
	key_down[c] = keyboard_check(controls[c]);
	key_pressed[c] = keyboard_check_pressed(controls[c]);
	if(key_pressed[c]){
		latest_t_pressed[c] = global.t;
	}
}

// Set water/air physics constants
if(in_water){
	accel = ACCEL_WATER;
	jump_height = JUMP_HEIGHT_WATER;
	grav = GRAV_WATER;
	decel = DECEL_WATER;
} else {
	accel = ACCEL_AIR;
	jump_height = JUMP_HEIGHT_AIR;
	grav = GRAV_AIR;
	decel = DECEL_AIR;
}

// Jump / rise in water only
if(key_pressed[UP] && grounded){
	vel.y -= jump_height;
} else if(key_down[UP]){
	vel.y -= accel.y;
}

// Sink in water only
if (key_down[DOWN] && !key_down[UP]){
	vel.y += max(accel.y, grav);
} else {
	vel.y += grav;
}

// Move left or right based on the latest key pressed
if(latest_t_pressed[RIGHT] > latest_t_pressed[LEFT]){
	
	vel.x = vel.x + (key_down[RIGHT] ? 1 : (key_down[LEFT] ? -1 : 0)) * accel.x;
} else if (latest_t_pressed[RIGHT] < latest_t_pressed[LEFT]){
	
	vel.x = vel.x + (key_down[LEFT] ? -1 : (key_down[RIGHT] ? 1 : 0)) * accel.x;
} else {
	// Both right/left been pressed at the same time, do nothing
}

// Apply velocity decel
vel.x *= decel.x;
vel.y *= decel.y;

// Split movement into steps, stopping if the next step will collide with a solid.
steps = 100;
for(i = 0; i < abs(vel.y) * steps; i++){
	if(!place_meeting(x, y + sign(vel.y) / steps, obj_solid)){
		y += sign(vel.y) / steps;
		grounded = false;
	} else {
		vel.y = 0;
		grounded = true;
		break;
	}
}

for(i = 0; i < abs(vel.x) * steps; i++){
	if(!place_meeting(x + sign(vel.x) / steps, y, obj_solid)){
		x += sign(vel.x) / steps;
	} else {
		vel.x = 0;
		break;
	}
}

// Testing water/air boundaries
in_water = x < 700;

// Increase/decrease air level depending on area
if(in_water){
	if(global.t % 16 == 0){
		air_level--;
	}
} else {
	air_level = min(air_level + 1, tank_size);
}
show_debug_message("Air level: " + string(air_level));