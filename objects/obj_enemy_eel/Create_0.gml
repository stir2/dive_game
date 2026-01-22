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

detection_radius = 350;
//attack vars
attack_time = 60;
attack_counter = attack_time;

move_in_direction = function(){
	var _move_angle = point_direction(nodes[node_index].nx, nodes[node_index].ny, nodes[node_target].nx, nodes[node_target].ny);
	x_speed = cos((_move_angle * pi)/180) * move_speed_max;
	y_speed = -sin((_move_angle * pi)/180) * move_speed_max;
	if(x_dist < 0){image_xscale = -1;}
	else if(x_dist > 0){image_xscale = 1;}
}

myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right, bbox_bottom], 1, 10, undefined,0,0,0,[obj_player],,,-1,,60));
 
state_wander = function() { 
	//#region Code for Small up and down motion
	////Check if were slowing down or speeding up
	////Slow down
	//if (slow_down_float) 
	//{
	//	//slow down up code
	//	y_speed = speed_adjust_by(y_speed, -float_speed, 0, directionFloating);
			
	//	//If we reached a speed of zero then flip the direction and speed up
	//	if (y_speed == 0){
	//		directionFloating = -directionFloating;
	//		slow_down_float = false;
	//	}
	//}
	////Speed up
	//else {
	//	//Speed up code
	//	y_speed = speed_adjust_by(y_speed, float_speed, float_speed_max, directionFloating);
		
	//	//If we reached max speed set slow_down_float to true;
	//	if (abs(y_speed) == float_speed_max) slow_down_float = true;
	//}
	//#endregion
	
	//#region Code for left and right movement
	////Check if were slowing down or speeding up
	////Slow down
	//if (slow_down_speed) 
	//{
	//	//slow down up code
	//	x_speed = speed_adjust_by(x_speed, -move_speed, 0, x_movement);
			
	//	//If we reached a speed of zero then flip the direction and speed up
	//	if (x_speed == 0){
	//		x_movement = -x_movement;
	//		slow_down_speed = false;
	//	}
	//}
	////Speed up
	//else {
	//	//Speed up code
	//	x_speed = speed_adjust_by(x_speed, move_speed, move_speed_max, x_movement);
		
	//	//If we reached max speed set slow_down_speed to true;
	//	if (abs(x_speed) == move_speed_max) slow_down_speed = true;
	//}
	
	//set xscale to equal direction were moving
	
	idle_move();
	
	//image_xscale = x_movement;
	//#endregion
	
	#region Scan for player
	var _player = collision_circle(x,y, detection_radius, obj_player, false, false);
	if (instance_exists(_player)) {
		//send projectile
		if(attack_counter == attack_time){
			var _player = collision_circle(x,y, detection_radius, obj_player, false, false);
			if (instance_exists(_player)) {
				instance_create_layer(x, y, "Instances", obj_eel_zap, {angle : point_direction(x, y, _player.x, _player.y)})
			}
		}
		//decrement attack counter
		attack_counter--;
		if(attack_counter <= 0){attack_counter = attack_time;}
	}
	
	#endregion
	//show_debug_message("y_speed = " + string(y_speed));
	
	moveAndCollide();
}

state = state_wander;