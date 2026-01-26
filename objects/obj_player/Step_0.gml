event_inherited();
setAnimationFrame();

if(air_level <= 0){
	if(death_timer <= 0){room_restart();}
	death_timer--;
	return;
}

// Check control keys for this frame
for(c = 0; c < array_length(controls); c++){
	key_down[c] = keyboard_check(controls[c]);
	key_pressed[c] = keyboard_check_pressed(controls[c]);
	if(key_pressed[c]){
		latest_t_pressed[c] = global.t;
	}
}

// KEEP
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
// END KEEP

// Jump / rise in water only
if(key_pressed[UP] && onSolid()){
	y_speed -= jump_height;
} else if(key_down[UP]){
	y_speed -= accel.y;
}

// Sink in water only
if (key_down[DOWN] && !key_down[UP]){
	y_speed += max(accel.y, grav);
} else {
	y_speed += grav;
}

// Move left or right based on the latest key pressed
if(latest_t_pressed[RIGHT] > latest_t_pressed[LEFT]){
	
	horiz_input = (key_down[RIGHT] ? 1 : (key_down[LEFT] ? -1 : 0));
} else if (latest_t_pressed[RIGHT] < latest_t_pressed[LEFT]){
	
	horiz_input = (key_down[LEFT] ? -1 : (key_down[RIGHT] ? 1 : 0));
} else {
	horiz_input = 0;
}

x_speed += horiz_input * accel.x;

// Apply velocity decel
x_speed *= decel.x;
y_speed *= decel.y;

// Testing water/air boundaries
//in_water = x < 700;


//// Split movement into steps, stopping if the next step will collide with a solid.
//steps = 100;
//for(i = 0; i < abs(vel.y) * steps; i++){
//	if(!place_meeting(x, y + sign(vel.y) / steps, obj_solid)){
//		y += sign(vel.y) / steps;
//		grounded = false;
//	} else {
//		vel.y = 0;
//		grounded = true;
//		break;
//	}
//}

//for(i = 0; i < abs(vel.x) * steps; i++){
//	if(!place_meeting(x + sign(vel.x) / steps, y, obj_solid)){
//		x += sign(vel.x) / steps;
//	} else {
//		vel.x = 0;
//		break;
//	}
//}

moveAndCollide()

// Increase/decrease air level depending on area
if(in_water){
	if(global.t % 40 == 0){
		air_level--;
	}
} else {
	air_level = min(air_level + 1, tank_size);
}
show_debug_message("X: " + string(x) + ", Y: " + string(y));