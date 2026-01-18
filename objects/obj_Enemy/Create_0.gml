// Inherit the parent event
event_inherited();

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