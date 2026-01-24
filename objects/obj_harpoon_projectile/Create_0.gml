
event_inherited();
/// @description Insert description here
// You can write your code in this editor
//vars:
//These varaibles control what direction the harpoon will face
target_x = mouse_x;
target_y = mouse_y;
//throw_distance_total = 0;
//throw_distance_passed = 0;
angle = 0;
throw_speed = 26;
reel_speed = 7.5;
on_player = true;
x_movement = 0;
y_movement = 0;

depth = -100;


//idle state for harpoon, points in the direction of the player's mouse
state_point = function(){
	x = my_player.x;
	y = my_player.y
	target_x = mouse_x;
	target_y = mouse_y;
	
	//set angle so that throw and reel can access it
	angle = point_direction(my_player.x, my_player.y, target_x, target_y);
	
	image_angle = angle;
	sprite_index = spr_harpoon;
}

//throwing towards target point
move_time = 10;
move_counter = move_time;
decelration_speed = -.8;
reel_thresh_hold = 2;
reel_thresh_meter = 0;

state_throw = function(){
	//if on_player is still true (throw just happened) set total distance
	if(on_player){
		//throw_distance_total = point_distance(x, y, target_x, target_y);
		
		//tell harpoon that it isn't on the player anymore
		on_player = false;
	}
	
	//Check if harpoon should still move
	if (move_counter > 0) { 
		//Decrement timer
		move_counter--;
		//Set speed to be full speed for harpoon
		angle_speed = throw_speed;
	} 
	else {
		//Slow down once timer is hit
		angle_speed = speed_adjust_by(angle_speed, decelration_speed, 0, 1);
	}
	
	if(mouse_check_button(mb_left)){ 
		reel_thresh_meter ++;
	}
	else reel_thresh_meter = 0;
	
	if (reel_thresh_hold <= reel_thresh_meter){
		//Slow down once timer is hit
		angle_speed = speed_adjust_by(angle_speed, -2, 0, 1);
	}
	
	//calculate movement based on current speed
	//x_movement = cos((angle * pi)/180) * throw_speed;
	//y_movement = -sin((angle * pi)/180) * throw_speed;
	set_speed_at_angle(angle_speed, angle);
	
	
	//throw_distance_passed += point_distance(x, y, x + x_movement, y + y_movement);
	//move towards the target direction
	
	//If a wall is reached or movement is stopped, reset vars and set to state_reel
	if ((place_meeting(x, y, obj_solid) && ! place_meeting(x, y, obj_player)) || angle_speed == 0){
		throw_distance_passed = 0;
		state = state_reel;
		if (place_meeting(x, y, obj_solid))	sprite_index = spr_harpoon_wiggle;
		image_index = 0;
	}
	
	
	x += x_speed;
	y += y_speed;
	
	//if((throw_distance_total >= 0 && throw_distance_passed > throw_distance_total) || (throw_distance_total <= 0 && throw_distance_passed < throw_distance_total)){
	//	throw_distance_passed = 0;
	//	state = state_reel;
	//}
}

//come back to player
state_reel = function(){
	if(mouse_check_button(mb_left)){
		angle = point_direction(x, y, my_player.x, my_player.y);
		image_angle = angle - 180;
		x_movement = cos((angle * pi)/180) * reel_speed;
		y_movement = -sin((angle * pi)/180) * reel_speed;
		x += x_movement;
		y += y_movement;
	}
	
	//once back to player, set back to idle state
	if(place_meeting(x, y, my_player)){
		on_player = true;
		state = state_point;
		instance_destroy(myHitBox);
		
		//Set the guns boolean to be true
		my_gun.harpoon_loaded = true;
	}
}

state = state_point;
