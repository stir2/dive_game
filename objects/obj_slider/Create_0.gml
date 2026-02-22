/// @description Insert description here
// You can write your code in this editor
//my_slider_bar = instance_create_layer(x, y, "Instances", obj_slider_button);
valMin = 0;
valMax = 100;
currVal = 0;
slider_x = 0;

padding = 30;

boundaries = {
	x_min : bbox_left + padding,
	x_max : bbox_right - padding
}

length = boundaries.x_max - boundaries.x_min;

if(sfx){
	currVal = obj_settings.sfx_vol;
	slider_x = clamp(currVal/valMax * length, 0, length);
}
else{
	currVal = obj_settings.music_vol;
	slider_x = clamp(currVal/valMax * length, 0, length);
}

decrease = function(){
	currVal = clamp(currVal - 1, valMin, valMax);
	slider_x = clamp(currVal/valMax * length, 0, length);
	if(sfx){
		obj_settings.change_sfx_vol(currVal);
		if(!audio_is_playing(sfx_bubble_pop)){audio_play_sound(sfx_bubble_pop, 3, false);}
	}
	else{obj_settings.change_music_vol(currVal);}
}

increase = function(){
	currVal = clamp(currVal + 1, valMin, valMax);
	slider_x = clamp(currVal/valMax * length, 0, length);
	if(sfx){
		obj_settings.change_sfx_vol(currVal);
		if(!audio_is_playing(sfx_bubble_pop)){audio_play_sound(sfx_bubble_pop, 3, false);}
	}
	else{obj_settings.change_music_vol(currVal);}
}

label = sfx ? "SFX" : "Music";