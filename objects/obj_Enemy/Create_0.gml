// Inherit the parent event
event_inherited();

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


calculate_move = function(){
	x_dist = (nodes[node_target].nx - x);
	y_dist = (nodes[node_target].ny - y);
	var _move_angle = point_direction(x, y, nodes[node_target].nx, nodes[node_target].ny);
	x_speed = cos((_move_angle * pi)/180) * move_speed_max;
	y_speed = -sin((_move_angle * pi)/180) * move_speed_max;
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
			//bubble type wander code goes here (all enemies should float if node info is unavailable)
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


//State for when the enemy is supposed to die
stateDead = function(){
	
}

state = stateIdle; 