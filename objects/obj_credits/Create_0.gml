/// @description Insert description here
// You can write your code in this editor

execute = function(){
	if(instance_exists(obj_credits)){instance_destroy(obj_credits);}
	my_controller.suspended = false;
	instance_destroy();
}

buffer = 10;