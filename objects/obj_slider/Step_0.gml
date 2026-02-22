/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(my_controller)){instance_destroy();}
else{
	if(!my_controller.using_controller){
		if (position_meeting(mouse_x, mouse_y, id) && mouse_check_button(mb_left)){
			var _normal = clamp((mouse_x - boundaries.x_min)/length, 0, 1);
		    currVal = round(_normal * valMax);
			slider_x = _normal * length;
			if(sfx){
				obj_settings.change_sfx_vol(currVal);
				if(!audio_is_playing(sfx_bubble_pop)){audio_play_sound(sfx_bubble_pop, 3, false);}
			}
			else{obj_settings.change_music_vol(currVal);}
		}
	}
}