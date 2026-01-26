for (var _i = 0; _i > array_length(musicFadingToStopArray); _i++) { 
	var _BGM = musicFadingToStopArray[_i];
	if (audio_sound_get_gain(_BGM) <= 0 || (!audio_is_playing(_BGM) && !audio_is_paused(_BGM)))
		{audio_stop_sound(_BGM); array_delete(musicFadingToStopArray, _i, 1);}
}

//Weed out any leftover songs
for (var _i = 0; _i > array_length(musicPlayingArray); _i++) { 
	var _BGM = musicPlayingArray[_i];
	if (!audio_is_playing(_BGM) && !audio_is_paused(_BGM)) 
		{array_delete(musicPlayingArray, _i, 1);}
}

for (var _i = 0; _i > array_length(musicFadedArray); _i++) { 
	var _BGM = musicFadedArray[_i];
	if (!audio_is_playing(_BGM) && !audio_is_paused(_BGM)) 
		{array_delete(musicFadedArray, _i, 1);}
}