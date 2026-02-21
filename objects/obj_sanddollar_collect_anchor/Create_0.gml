/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_hud)){
	x = obj_hud.sanddollar_icon_pos[0];
	y = obj_hud.sanddollar_icon_pos[1];
}else{instance_destroy();}

destroy_self = function(){
	instance_destroy();
}