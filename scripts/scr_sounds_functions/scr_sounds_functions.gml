// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//Enum that will be the reference for priority
enum SFXTypes {
	MenuSound,
	EnviormentSound,
	FeedbackSound,
	ItemSound,
	WeaponSound,
	EnemySound,
	PlayerSound
}

//SFX Type is just a stand in for pirioty number

/// @desc Plays a sound effect
/// @param {any} _sfxIndex The ID of the sound effect
/// @param {real} _sfxType The type of SFX, use SFXTypes enum. This acts as the priority for the sound
/// @param {real} [_pitchChange] The change of the pitch of this sound
/// @param {bool} [_looping] If this sound will be looping 
function playSFX(_sfxIndex, _sfxType, _pitchChange = 1, _looping = false) { 
	with (obj_sfx) {
		//Check if _sfxIndex is a string or an asset, if so get asset
		if (is_string(_sfxIndex)) _sfxIndex = asset_get_index(_sfxIndex);
		
		if (!_looping) {
			//If the current sound is playing stop playing it and play the new sound 
			if (audio_is_playing(_sfxIndex)) audio_stop_sound(_sfxIndex);
			audio_play_sound(_sfxIndex, _sfxType, false, 1 ,0 ,_pitchChange);
		}
		else { 
			//if (audio_is_playing(_sfxIndex)) audio_stop_sound(_sfxIndex);
			if (!audio_is_paused(_sfxIndex)) audio_play_sound(_sfxIndex, _sfxType, true, , ,_pitchChange);
			else audio_resume_sound(_sfxIndex);
		} 
		
		
	}
}


/**
 * @desc Plays music, allowing for tranistions and fadeouts
 * @param {asset.gmsound} _musicID The ID of the background music
 * @param {real} [_time] the time it takes to fade in/out the music that will be coming in/leaving.
 * @param {real} [_timeStamp] The time stamp (in seconds) for when the song should play, use getMusicPlayingTrackPosistion().
 */
function playMusic(_musicID, _time = 0, _timeStamp = 0) { 
	with (obj_music) { 
		//Convert time from miliseconds to frames
		_time *= 100;
		
		if (audio_get_name(_musicID) != audio_get_name(musicPlaying))
			//If audio is playing fade it out
			//Put all songs on to stop track if requested
			fadeoutMusic(_time/100);
			
			//Check if no music is playing or if the current track isnt the same
			if (musicPlaying == noone && array_length(musicFadedArray) == 0) {
			
				//show_debug_message("Playing track");
			
				var _musicInstance = audio_play_sound(_musicID, 10, true, 0);
			
				//If the wanted track isnt playing play it and fade it in
				musicPlaying = _musicInstance;
				audio_sound_gain(_musicInstance, 1, _time);
				audio_sound_set_track_position(_musicInstance, _timeStamp);
			
				//show_debug_message(audio_get_name(_musicInstance));
			}
			else { 
				//Play musicID
				//Check if it is already playing
				if (audio_is_playing(_musicID)) { 
				
					//If it is playing check if it is faded out 
					var _musicFadedID = getMusicFaded(_musicID);
				
					//show_debug_message(audio_get_name(_musicFadedID));
				
					if (_musicFadedID != noone) {
						//show_debug_message("Resuming track");
					
					
						removeMusicFaded(_musicFadedID);
					
						//If music is still playing just fade it in
						audio_sound_gain(_musicFadedID, 1, _time);
						audio_sound_set_track_position(_musicFadedID, _timeStamp);
					
				
						//If this is in the musicFadingToStopArray then remove it 
						if (array_get_index(musicFadingToStopArray, _musicFadedID) != -1)
						{array_delete(musicFadingToStopArray, array_get_index(musicFadingToStopArray, _musicFadedID), 1);}
				
						//If not in playing array put it in there 
						musicPlaying = _musicFadedID;
					} 
				}
				else { 
					//The music isnt playing add it to the array and play
					//show_debug_message("Adding to track");
				
					var _musicInstance = audio_play_sound(_musicID, 10, true, 0);
				
					//If the wanted track isnt playing play it and fade it in
					musicPlaying = _musicInstance;
					audio_sound_gain(_musicInstance, 1, _time);
					audio_sound_set_track_position(_musicInstance, _timeStamp);
				}
			}
	}
}


/**
 * Stops Music
 * @param {real} [_time] Time for music to fade out
 * @param {id.instance} [_musicToStopID] You can input a specfic song you want to stop instead of all
 */
function stopMusic(_time = 0, _musicToStopID = noone) { 
	with (obj_music) { 
		//Convert time from miliseconds to frames
		_time *= 100;
		
		
		if (_musicToStopID == noone || audio_get_name(_musicToStopID) == audio_get_name(musicPlaying)) { 
			//Remove from playing array and then move to fading 
			if (audio_exists(musicPlaying)) {
				audio_sound_gain(musicPlaying, 0, _time);
				array_push(musicFadingToStopArray, musicPlaying);
				musicPlaying = noone;
			}
		}
		else { 
			var _fadedTrack = getMusicFaded(_musicToStopID);
			if (_fadedTrack != noone) { 
				audio_sound_gain(_fadedTrack, 0, _time);
				array_push(musicFadingToStopArray, musicPlaying);
				musicPlaying = _fadedTrack;
				
			}
		}
	}
}
	
/**
 * Fades out music
 * @param {real} [_time] Time for music to fade out
 * @param {id.instance} [_musicToFadeOutID] You can input a specfic song you want to fade out instead of all
 */
function fadeoutMusic(_time = 0, _musicToFadeOutID = noone) { 
	with (obj_music) { 
		//Convert time from miliseconds to frames
		_time *= 100;
		
		//if music is playing, fade it out 
		if (_musicToFadeOutID == noone || audio_get_name(_musicToFadeOutID) == audio_get_name(musicPlaying)) { 
			if (audio_exists(musicPlaying)) {
				//Remove from playing and then move to fading 
				audio_sound_gain(musicPlaying, 0, _time);
				array_push(musicFadedArray, musicPlaying);
				musicPlaying = noone;
			}
		}
		else { 
			var _fadedTrack = getMusicFaded(_musicToStopID);
			if (_fadedTrack != noone) { 
				audio_sound_gain(_fadedTrack, 0, _time);
				array_push(musicFadedArray, musicPlaying);
				musicPlaying = _fadedTrack;
				
			}
		}
	}
}
	
//function isMusicPlaying(_musicID = noone) { 
//	if (_musicID == noone) {
//		if (array_length(musicPlayingArray) == 0) return false;
//		return true;
//	}
//	audio_get_type()
//}

function getMusicPlaying() {
	return obj_music.musicPlaying;
}

function getMusicFaded(_musicID) { 
	with (obj_music) {
		for (var _i = 0; _i < array_length(musicFadedArray); _i++) {
			var _itemChecking = musicFadedArray[_i];
		
			if (audio_is_playing(_itemChecking) && audio_get_name(_itemChecking) == audio_get_name(_musicID)) return _itemChecking;
		}
	
		return noone;
	}
}

function removeMusicFaded(_musicID) {
	with (obj_music) {
		for (var _i = 0; _i < array_length(musicFadedArray); _i++) {
			var _itemChecking = musicFadedArray[_i];
		
			if (audio_get_name(_itemChecking) == audio_get_name(_musicID)) {array_delete(musicFadedArray, _i, 1); break;}
		}
	}
}
