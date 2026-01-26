
if (audio_sound_get_asset(getMusicPlaying()) != bgm_dive_song) {
	stopMusic();
	playMusic(bgm_dive_song);
}