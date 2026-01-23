// Inherit the parent event
event_inherited();

float_speed = .01;
float_speed_max = .5;
directionFloating = -1;
slow_down = false;

myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right, bbox_bottom], 1, knock_back_amount, undefined,0,0,0,[obj_player],,,-1,,60))
//Urchin floats around in water... that it all it does is float for now 
state_float = function() { 
	//Check if were slowing down or speeding up
	//Slow down
	if (slow_down) 
	{
		//slow down up code
		y_speed = speed_adjust_by(y_speed, -float_speed, 0, directionFloating);
			
		//If we reached a speed of zero then flip the direction and speed up
		if (y_speed == 0){
			directionFloating = -directionFloating;
			slow_down = false;
		}
	}
	//Speed up
	else {
		//Speed up code
		y_speed = speed_adjust_by(y_speed, float_speed, float_speed_max, directionFloating);
		
		//If we reached max speed set slow_down to true;
		if (abs(y_speed) == float_speed_max) slow_down = true;
	}
	
	//show_debug_message("y_speed = " + string(y_speed));
	//idle_move();
	
	x += x_speed; 
	y += y_speed;
}

state = state_float;