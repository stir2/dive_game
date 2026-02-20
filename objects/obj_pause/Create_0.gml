/// @description Insert description here
// You can write your code in this editor
paused = false;
pauseSprite = undefined;

arrayReactivate = [obj_music, obj_sfx, obj_camera];

togglePause = function() { 
    if (!paused) //PAUSE
	{
        var _width = surface_get_width(application_surface); 
        var _height = surface_get_height(application_surface); 
		//draw_surface(application_surface, 0, 0);
		
        pauseSprite = sprite_create_from_surface(application_surface, 0, 0, 
        _width, _height, false, false, 0, 0);
		
		audio_pause_all(); //Pause sound
		
		if (instance_exists(obj_boss)) { 
			//show_debug_message("Boss Exitst");
			if (layer_sequence_exists("Instances", obj_boss.curr_seq)) {
				//show_debug_message("sequence exits, pause seqeunce");
				layer_sequence_pause(obj_boss.curr_seq);
			}
		}
		
    	instance_deactivate_all(true);	//Deactivae all instances
    	instance_activate_layer("GameObjects");	//reactivate the stuff in game objects
        for (var _i = 0; _i < array_length(arrayReactivate); _i++){ 
            //show_debug_message("hey");
            instance_activate_object(arrayReactivate[_i]);
		}
		//objScreen.pauseScreenShake(); //Pause screen shake;
		
		paused = true; //Set Paused to true to show are game is now paused
	} else //UNPAUSE
    {
		//Resume all
        audio_resume_all();
		
		instance_activate_all();
		
		if (instance_exists(obj_boss)) { 
			if (layer_sequence_exists("Instances", obj_boss.curr_seq)) layer_sequence_play(obj_boss.curr_seq);
		}
        
		paused = false; //Set our pause to false
	
	}
}