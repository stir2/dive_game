// Inherit the parent event
event_inherited();

default_palette = spr_palette_enemy;
current_palette = spr_palette_enemy_test;

enum Movement_Type{
	wander,
	bounce,
	loop
}

if(array_length(nodes) > 0){
	x = nodes[0].nx;
	y = nodes[0].ny;
}

forward = true;
node_index = 0;
node_target = 0;
x_dist = 0;
y_dist = 0;
x_move = 0;
y_move = 0;


spawn = {x, y};
wander_range = 100;
wander_target_x = random_range(-wander_range + spawn.x, wander_range + spawn.x);
wander_target_y = random_range(-wander_range + spawn.y, wander_range + spawn.y);

wander_distance = 0;

wander_time = 60;
wander_counter = 60;

wander_slow_down = false;


//Enemies set this speed in their create events
move_speed = .1;
move_speed_max = 1;

calculate_move = function(){
	x_dist = (nodes[node_target].nx - x);
	y_dist = (nodes[node_target].ny - y);
	var _move_angle = point_direction(x, y, nodes[node_target].nx, nodes[node_target].ny);
	
	//Get the distance that will be covered when slowing down
	var _slow_down_distance = scrCalculateDistanceSlowingDown(angle_speed, move_speed);
	
	//If that distance is going to surpassing or equal to the distance we are from the target
	if (_slow_down_distance >= point_distance(x, y, nodes[node_target].nx,  nodes[node_target].ny)){
		//slow down
		angle_speed = speed_adjust_by(angle_speed, -move_speed, 0, 1);
	}
	else { 
		//Increase speed
		angle_speed = speed_adjust_by(angle_speed, move_speed, move_speed_max, 1);
	}
	// Set Speed at move_angle
	x_speed = cos((_move_angle * pi)/180) * angle_speed;
	y_speed = -sin((_move_angle * pi)/180) * angle_speed;
	
	//Set image_xscale to be direction moving in
	if(x_dist < 0){image_xscale = -1;}
	else if(x_dist > 0){image_xscale = 1;}
}

//moves the enemy in whichever way is denoted
idle_move = function(){
	switch(movement_type){
		case Movement_Type.bounce : {
			if(array_length(nodes) <= 1){break;}
			//if we have reached the target node
			//(if x/y dist is pos/neg and we have reached or gone past it)
			if(((x_dist >= 0 && x >= nodes[node_target].nx) || (x_dist < 0 && x <= nodes[node_target].nx)) && ((y_dist >= 0 && y >= nodes[node_target].ny) || (y_dist < 0 && y <= nodes[node_target].ny))){
				node_index = node_target;
				///if going forward
				if(forward){
					////if we've reached the end of the node string
					if(node_index == array_length(nodes) - 1){
						/////set forward to false
						forward = false;
						/////set next node to the previous index
						node_target = node_index - 1;
					}
					////if we've not reached the end, set next node to next index
					else{node_target = node_index + 1;}
				}
				///if going backward
				else{
					////if we've reached the beginning of the node string
					if(node_index == 0){
						/////set forward to true
						forward = true;
						/////set next node to next index
						node_target = node_index + 1;
					}
					////if we've not reached the beginning, set next node to previous index
					else{node_target = node_index - 1;}
				}				
			}
			calculate_move();
			
		}break;
		case Movement_Type.loop : {
			if(array_length(nodes) <= 1){break;}
			//if we have reached the target node
			//(if x/y dist is pos/neg and we have reached or gone past it)
			if(((x_dist >= 0 && x >= nodes[node_target].nx) || (x_dist <= 0 && x <= nodes[node_target].nx)) && ((y_dist >= 0 && y >= nodes[node_target].ny) || (y_dist <= 0 && y <= nodes[node_target].ny))){
				node_index = node_target;
				////if we've reached the end of the node string
				if(node_index == array_length(nodes) - 1){
					/////set next node to the first index
					node_target = 0;
				}
				////if we've not reached the end, set next node to next index
				else{node_target = node_index + 1;}
			}
			calculate_move();
		}break;
		default : {
			//show_debug_message(wander_distance);
			//bubble type wander code goes here (all enemies should float if node info is unavailable)
			//Choose a random point to wander once we reach a angle_speed of zero.
			if(angle_speed == 0){				
				show_debug_message("\nNEW DIRECTION");
				
				//Define new target
				//Choose a random range for both x and y that will be -WANDER_STRENGTH & +WANDER_STRENGTH
				wander_target_x = random_range(-wander_range + spawn.x, wander_range + spawn.x);
				wander_target_y = random_range(-wander_range + spawn.y, wander_range + spawn.y);
				show_debug_message("X Target: " + string(wander_target_x));
				show_debug_message("Y Target: " + string(wander_target_y));
				wander_slow_down = false;
				wander_counter = wander_time;
							
				if ((x - wander_target_x) != 0) image_xscale = sign(wander_target_x - x);
				
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


			set_speed_at_angle(angle_speed, point_direction(x, y, wander_target_x, wander_target_y));
			//show_debug_message("xSpeed : " + string(x_speed));
			//show_debug_message("ySpeed : " + string(y_speed));
		}
	}
}

damage_shake_time = 10;
damage_shake_counter = damage_shake_time;
shake_angle = 0;
shake_range = 10;
tookDamage = function() { 
	//Start Shake time
	damage_shake_counter = damage_shake_time;
	
}

//Hurtbox Creation
hp = 1;
myHurtbox = instance_create_depth(x, y, 0, obj_HurtBox, new HurtBox(id, true, bbox_left, bbox_top, bbox_right, bbox_bottom));

//States of code that will switched out with the state variable
//IdleState for when your object does nothing
stateIdle = function(){
	
}

state_wander = function() { 
}

//State for when the enemy is supposed to die
stateDead = function(){
	//make death effect - replace lol
	instance_create_layer(x, y, "Instances", obj_ridiculous_explosion);
	
	//spawn air if low
	if(obj_player.air_level < obj_player.tank_size/2){
		instance_create_layer(x, y, "Instances", obj_bubble_medium);
	}
	//spawn sand dollars
	else{
		var _sd_spacing = 50;
		for(var _i = 0; _i < drop_amount; _i++){
			instance_create_layer(x + random(_sd_spacing), y + random(_sd_spacing), "Instances", obj_sanddollar);
		}
	}
	instance_destroy();
}

state = stateIdle; 