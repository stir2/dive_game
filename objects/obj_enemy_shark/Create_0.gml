// Inherit the parent event
event_inherited();

//Set HP 
hp = 5;

// Up and down motion
float_speed = .01;
float_speed_max = .5;
directionFloating = -1;
slow_down_float = false;
//Left and right motion
move_speed = .01;
move_speed_max = 1.5;
slow_down_speed = false;
x_movement = 1;

myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right, bbox_bottom], 1, 10, undefined,0,0,0,[obj_player],,,-1,,60))
//Urchin floats around in water... that it all it does is float for now 
state_wander = function() { 
	#region Code for Small up and down motion
	//Check if were slowing down or speeding up
	//Slow down
	if (slow_down_float) 
	{
		//slow down up code
		y_speed = speed_adjust_by(y_speed, -float_speed, 0, directionFloating);
			
		//If we reached a speed of zero then flip the direction and speed up
		if (y_speed == 0){
			directionFloating = -directionFloating;
			slow_down_float = false;
		}
	}
	//Speed up
	else {
		//Speed up code
		y_speed = speed_adjust_by(y_speed, float_speed, float_speed_max, directionFloating);
		
		//If we reached max speed set slow_down_float to true;
		if (abs(y_speed) == float_speed_max) slow_down_float = true;
	}
	#endregion
	
	#region Code for left and right movement
	//Check if were slowing down or speeding up
	//Slow down
	if (slow_down_speed) 
	{
		//slow down up code
		x_speed = speed_adjust_by(x_speed, -move_speed, 0, x_movement);
			
		//If we reached a speed of zero then flip the direction and speed up
		if (x_speed == 0){
			x_movement = -x_movement;
			slow_down_speed = false;
		}
	}
	//Speed up
	else {
		//Speed up code
		x_speed = speed_adjust_by(x_speed, move_speed, move_speed_max, x_movement);
		
		//If we reached max speed set slow_down_speed to true;
		if (abs(x_speed) == move_speed_max) slow_down_speed = true;
	}
	
	//set xscale to equal direction were moving
	image_xscale = -x_movement;
	#endregion
	
	#region Scan for player
	var _player = collision_circle(x,y, 200, obj_player, false, false);
	if (instance_exists(_player)) {
		//Set variables for ready attack state
		chargeTimer = chargeTime;
		targetPlayer = _player
		
		//Go into ready attack state
		state = state_ready_attack;
	}
	
	#endregion
	//show_debug_message("y_speed = " + string(y_speed));
	
	moveAndCollide();
}


//ready attack State 
chargeTime = 60;
chargeTimer = chargeTime;
targetPlayer = noone;
state_ready_attack = function() { 
	if (chargeTimer < 1) { 
		//Go into attak state
		attack_counter = attack_time;
		state = state_attack;
	}
	else {
		//Decrement timer
		chargeTimer--;
		
		//Aim self at player
		angle_direction = point_direction(x, y, targetPlayer.x, targetPlayer.y);
		image_angle = angle_direction;
		
	}
	
	image_xscale = -1;
	
	if (dcos(image_angle != 0))	image_yscale = sign(dcos(image_angle));
	
}
	
//attack state 
attack_speed = 10;
attack_time = 30;
attack_counter = attack_time;
state_attack = function() { 
	//Check if timer is hit
	if (attack_counter < 1) { 
		//Decelerate
		angle_speed = speed_adjust_by(angle_speed, -1, 0, 1);
		//Divide speed by angle
		set_speed_at_angle(angle_speed, angle_direction);
		
		if (angle_speed == 0) {
			state = state_wander;
			image_xscale = -sign(dcos(image_angle));
			image_yscale = 1;
			image_angle = 0;
		}
	}
	else {
		//Decrement Timer
		attack_counter--;
		
		//Move at max speed
		angle_speed = attack_speed;
		set_speed_at_angle(angle_speed, angle_direction);
	}
	
	moveAndCollide();
}

state = state_wander;