
if (audio_sound_get_asset(getMusicPlaying()) != bgm_boss) {
	stopMusic();
	playMusic(bgm_boss);
}