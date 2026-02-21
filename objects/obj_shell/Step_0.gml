/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x, y, obj_player)){
	obj_player.sanddollars += 50;
	audio_play_sound(sfx_shell_pickup, 1, false);
	for(var _i = 0; _i < 10; _i++){
			instance_create_layer(x, y, "Instances", obj_sanddollar_collect_effect, {sprite_index : choose(spr_sanddollar_pink, spr_sanddollar_blue, spr_sanddollar_collect_yellow), add_amount : 5});
	}
	instance_destroy();
}