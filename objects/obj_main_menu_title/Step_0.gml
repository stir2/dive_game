
/// @description Insert description here
// You can write your code in this editor

if(angle_speed == 0){				
	//show_debug_message("\nNEW DIRECTION");
				
	//Define new target
	//Choose a random range for both x and y that will be -WANDER_STRENGTH & +WANDER_STRENGTH
	wander_target_x = random_range(-wander_range + spawn.x, wander_range + spawn.x);
	wander_target_y = random_range(-wander_range + spawn.y, wander_range + spawn.y);
	//show_debug_message("X Target: " + string(wander_target_x));
	//show_debug_message("Y Target: " + string(wander_target_y));
	wander_slow_down = false;
	wander_counter = wander_time;
							
	//if ((wander_target_x - x) != 0) image_xscale = sign(wander_target_x - x);
				
}
			
			
//Calc Movements needed
if (wander_slow_down) { 
	//slow down
	angle_speed = speed_adjust_by(angle_speed, -move_speed, 0, 1);
}
else { 
	//Increase speed
	angle_speed = speed_adjust_by(angle_speed, move_speed, move_speed_max, 1);
}

wander_distance = point_distance(x, y, wander_target_x, wander_target_y);
if (scrCalculateDistanceSlowingDown(angle_speed, move_speed) >= wander_distance || wander_counter < 1){
	wander_slow_down = true;
}
else wander_counter--;

set_speed_at_angle(angle_speed, point_direction(x, y, wander_target_x, wander_target_y));

x += x_speed;
y += y_speed;
//show_debug_message("xSpeed : " + string(x_speed));
//show_debug_message("ySpeed : " + string(y_speed));