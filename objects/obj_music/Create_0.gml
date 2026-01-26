//Load Audio
audio_group_load(ag_bgm);
audio_group_load(ag_sfx);

musicPlaying = noone;
musicPlayingArray = [];

currentMusicTransitioningFrom = noone;
musicFadingToStopArray = [];

musicFadedArray = [];

transitionTime = 0;
transitionTimer = 0;