player = instance_place(x, y, obj_player);
if(state == "uncollected" && instance_exists(player)){
	global.sanddollars++;
	instance_destroy();
}