
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

harpoon_loaded = true;

my_projectile = instance_create_depth(x, y, -10, obj_harpoon_projectile, {my_player : my_player, my_gun : id});

depth = -100;


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
	
	#region Attack choices
	//on left click, if on player, throw
	if(mouse_check_button_pressed(mb_left) && on_player && harpoon_loaded){
		//We have launched the harpoon, we must say the variable is false. Harpoon Projectile will handle the rest
		if (sprite_index != spr_harpoon_gun_shoot) { 
			sprite_index = spr_harpoon_gun_shoot;
			image_index = 0;
		}
		
		harpoon_loaded = false;
	}

	//on right click, close attack
	if(mouse_check_button_pressed(mb_right) && on_player && harpoon_loaded){
		
		if (sprite_index != spr_harpoon_gun_stab) { 
			sprite_index = spr_harpoon_gun_stab;
			image_index = 0;
		}
		
		//We are charging our attack, we must state this variable is false
		harpoon_loaded = false;
	}
	#endregion
	
	#region Animation transition handling 
	//Shooting is about to begin
	if (sprite_index == spr_harpoon_gun_shoot && scrCheckAnimationFrame(4)) { 
		
		if (my_projectile.state != my_projectile.state_throw){
			with (my_projectile) { 
				state = state_throw;
			
				//Create hitbox
				//Store angle for short time to get size right
				var _temp_angle = image_angle;
				image_angle = 0;
	
				myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right, bbox_bottom], 1, 0, 0, 0, 0, 0, [obj_Enemy],,,-1));
				image_angle = _temp_angle;
			
				//Reset timer
				move_counter = move_time;
			}
		}
	} else if (sprite_index == spr_harpoon_gun_stab && scrCheckAnimationFrame(6)) { 
		
		
		state = state_hit;
		
		x = my_player.x + cos((image_angle * pi)/180) * 60;
		y = my_player.y + -sin((image_angle * pi)/180) * 60;
				
		//Create effect object
		instance_create_depth(x, y, -10, obj_sprite_effect, {sprite_index : spr_effect_harpoon_stab, image_angle : image_angle});
		
		//Create hitbox
		var _temp_angle = image_angle;
		image_angle = 0;
		myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right + 100, bbox_bottom], 1, 0, 0, 0, 0, 0, [obj_Enemy],,,-1));
		myHitBox.image_angle = _temp_angle;
		image_angle = _temp_angle;
	}
	
	
	//If neither gun shoot or melee is performed then just have normal logic 
	if (sprite_index != spr_harpoon_gun_shoot && sprite_index != spr_harpoon_gun_stab) {
		if (harpoon_loaded) sprite_index = spr_harpoon_gun_loaded;
		else sprite_index = spr_harpoon_gun;
	}
	
	#endregion
	
	image_yscale = sign(dcos(image_angle));
}

////throwing towards target point
//move_time = 10;
//move_counter = move_time;
//decelration_speed = -.8;
//reel_thresh_hold = 2;
//reel_thresh_meter = 0;
#region Unused Throw state

//state_throw = function(){
//	//if on_player is still true (throw just happened) set total distance
//	if(on_player){
//		//throw_distance_total = point_distance(x, y, target_x, target_y);
		
//		//tell harpoon that it isn't on the player anymore
//		on_player = false;
//	}
	
//	//Check if harpoon should still move
//	if (move_counter > 0) { 
//		//Decrement timer
//		move_counter--;
//		//Set speed to be full speed for harpoon
//		angle_speed = throw_speed;
//	} 
//	else {
//		//Slow down once timer is hit
//		angle_speed = speed_adjust_by(angle_speed, decelration_speed, 0, 1);
//	}
	
//	if(mouse_check_button(mb_left)){ 
//		reel_thresh_meter ++;
//	}
//	else reel_thresh_meter = 0;
	
//	if (reel_thresh_hold <= reel_thresh_meter){
//		//Slow down once timer is hit
//		angle_speed = speed_adjust_by(angle_speed, -2, 0, 1);
//	}
	
//	//calculate movement based on current speed
//	//x_movement = cos((angle * pi)/180) * throw_speed;
//	//y_movement = -sin((angle * pi)/180) * throw_speed;
//	set_speed_at_angle(angle_speed, angle);
	
	
//	//throw_distance_passed += point_distance(x, y, x + x_movement, y + y_movement);
//	//move towards the target direction
	
//	//If a wall is reached or movement is stopped, reset vars and set to state_reel
//	if ((place_meeting(x, y, obj_solid) && ! place_meeting(x, y, obj_player)) || angle_speed == 0){
//		throw_distance_passed = 0;
//		state = state_reel;
//	}
	
	
//	x += x_speed;
//	y += y_speed;
	
//	//if((throw_distance_total >= 0 && throw_distance_passed > throw_distance_total) || (throw_distance_total <= 0 && throw_distance_passed < throw_distance_total)){
//	//	throw_distance_passed = 0;
//	//	state = state_reel;
//	//}
//}
#endregion

#region Unused reel state
//come back to player
//state_reel = function(){
//	if(mouse_check_button(mb_left)){
//		angle = point_direction(x, y, my_player.x, my_player.y);
//		image_angle = angle;
//		x_movement = cos((angle * pi)/180) * reel_speed;
//		y_movement = -sin((angle * pi)/180) * reel_speed;
//		x += x_movement;
//		y += y_movement;
//	}
	
//	//once back to player, set back to idle state
//	if(place_meeting(x, y, my_player)){
//		on_player = true;
//		state = state_point;
//		instance_destroy(myHitBox);
//	}
//}
#endregion

hit_time = 8;
hit_counter = hit_time;
//for a certain number of frames, do hit animation
state_hit = function(){
	x = my_player.x + cos((image_angle * pi)/180) * 60;
	y = my_player.y + -sin((image_angle * pi)/180) * 60;
	
}

state = state_point;
