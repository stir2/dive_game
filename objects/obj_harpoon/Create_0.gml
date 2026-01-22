/// @description Insert description here
// You can write your code in this editor
//vars:
target_x = mouse_x;
target_y = mouse_y;
throw_distance_total = 0;
throw_distance_passed = 0;
angle = 0;
throw_speed = 15;
reel_speed = 7.5;
on_player = true;
x_movement = 0;
y_movement = 0;


//idle state for harpoon, points in the direction of the player's mouse
state_point = function(){
	x = my_player.x;
	y = my_player.y
	target_x = mouse_x;
	target_y = mouse_y;
	//set angle so that throw and reel can access it
	angle = point_direction(my_player.x, my_player.y, target_x, target_y);
	//make harpoon sprite point towards target
	image_angle = angle;
	
	//on left click, if on player, throw
	if(mouse_check_button_pressed(mb_left) && on_player){
		state = state_throw;
		
		//Store angle for short time to get size right
		var _temp_angle = image_angle;
		image_angle = 0;
		myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right, bbox_bottom], 1, 0, 0, 0, 0, 0, [obj_Enemy],,,-1));
		image_angle = _temp_angle;
	}

	//on right click, close attack
	if(mouse_check_button_pressed(mb_right) && on_player){
		state = state_hit;
		var _temp_angle = image_angle;
		image_angle = 0;
		myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right, bbox_bottom], 1, 0, 0, 0, 0, 0, [obj_Enemy],,,-1));
		image_angle = _temp_angle;
	}
	sprite_index = spr_harpoon;
}

//throwing towards target point
state_throw = function(){
	//if on_player is still true (throw just happened) set total distance
	if(on_player){
		throw_distance_total = point_distance(x, y, target_x, target_y);
		
		//tell harpoon that it isn't on the player anymore
		on_player = false;
	}
	
	
	//calculate movement based on current speed
	x_movement = cos((angle * pi)/180) * throw_speed;
	y_movement = -sin((angle * pi)/180) * throw_speed;
	
	throw_distance_passed += point_distance(x, y, x + x_movement, y + y_movement);
	//move towards the target direction until target is reached
	x += x_movement;
	y += y_movement;
	
	//once target is reached, reset vars and set to state_reel
	if((throw_distance_total >= 0 && throw_distance_passed > throw_distance_total) || (throw_distance_total <= 0 && throw_distance_passed < throw_distance_total)){
		throw_distance_passed = 0;
		state = state_reel;
	}
	/* This killed enemy reward bubbles instantly
	var bubble_touching = instance_place(x, y, obj_bubble);
	if(instance_exists(bubble_touching)){
		bubble_touching.pop();
	}*/
}

//come back to player
state_reel = function(){
	if(mouse_check_button(mb_left)){
		angle = point_direction(x, y, my_player.x, my_player.y);
		image_angle = angle;
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
	}
}

hit_time = 8;
hit_counter = hit_time;
//for a certain number of frames, do hit animation
state_hit = function(){
	x = my_player.x;
	y = my_player.y;
	hit_counter--;
	image_angle += 3;
	
	//once animation is over, reset vars and go back to idle state
	if(hit_counter <= 0){
		hit_counter = hit_time;
		state = state_point;
		instance_destroy(myHitBox);
	}
}

state = state_point;
