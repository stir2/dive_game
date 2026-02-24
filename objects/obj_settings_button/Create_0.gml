/// @description Insert description here
// You can write your code in this editor

execute = function(){}
label = "";

switch(action_type){
	//Fullscreen
	case 0: {
		execute = function(){
			obj_settings.toggle_fullscreen();
			audio_play_sound(sfx_input_confirm, 3, false);
		}
		label = "Fullscreen";
	}break;
	
	//Exit Settings
	case 1: {
		label = "Exit Settings"
		sprite_index = spr_button_long_blue;
		execute = function(){
			my_controller.my_controller.suspended = false;
			my_controller.my_controller.suspension_buffer = 10;
			audio_play_sound(sfx_input_confirm, 3, false);
			if(instance_exists(my_controller)){my_controller.destroy_self();}
		}
	}break;
	
	//Resume
	case 2: {
		label = "Resume";
		sprite_index = spr_button_long_blue;
		execute = function(){
			//TODO: Add resume function
			if (instance_exists(obj_settings)) { 
				obj_pause.togglePause();
				instance_destroy();
			}
			audio_play_sound(sfx_input_confirm, 3, false);
		}
	}break;
	
	//Main Menu
	case 3: {
		execute = function(){
			room_goto(rm_main_menu_new);
			audio_play_sound(sfx_input_confirm, 3, false);
		}
		label = "Main Menu";
	}break;
}