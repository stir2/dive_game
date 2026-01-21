// Inherit the parent event
event_inherited();


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