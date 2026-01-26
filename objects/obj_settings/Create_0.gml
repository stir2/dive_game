//Toggle FullScreen Status 
is_full_screen = window_get_fullscreen();

toggle_fullscreen = function() { 
	window_set_fullscreen(is_full_screen);
	is_full_screen = window_get_fullscreen();
	
}

//Volume Control Variables 
music_vol = 50; 
sfx_vol = 100; 
master_vol = 100;
change_music_vol = function(_value = 0) { 
	music_vol += _value;
	music_vol = clamp(music_vol, 0, 100);
	audio_group_set_gain(ag_bgm, music_vol/100);
}

change_sfx_vol = function(_value = 0) { 
	sfx_vol += _value;
	sfx_vol = clamp(sfx_vol, 0, 100);
	audio_group_set_gain(ag_sfx, sfx_vol/100);
}

change_master_vol = function(_value = 0) { 
	master_vol += _value;
	master_vol = clamp(master_vol, 0, 100);
	audio_master_gain(master_vol/100);
}

audio_group_set_gain(ag_bgm, music_vol/100);
audio_group_set_gain(ag_sfx, sfx_vol/100);
audio_master_gain(master_vol/100);

//SFX toggle status
isEffectsOn = true; 

toggle_effects = function() { 
	isEffectsOn = !isEffectsOn;	
}

