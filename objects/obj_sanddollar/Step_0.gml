player = instance_place(x, y, obj_player);
if(state == "uncollected" && instance_exists(player)){
	player.sanddollars++;
	if(audio_is_playing(sfx_sanddollar_pickup)){audio_stop_sound(sfx_sanddollar_pickup);}
	audio_play_sound(sfx_sanddollar_pickup, 1, false, , , power(2, choose(-5, 0, 3)/12));
	instance_create_layer(x, y, "Instances", obj_sanddollar_collect_effect, {sprite_index : sprite_index});
	instance_destroy();
}