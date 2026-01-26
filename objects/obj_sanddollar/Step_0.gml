player = instance_place(x, y, obj_player);
if(state == "uncollected" && instance_exists(player)){
	player.sanddollars++;
	instance_destroy();
}