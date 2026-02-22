/// @description Insert description here
// You can write your code in this editor

execute = function(){}
label = "";

switch(action_type){
	//Play game
	case 0: {
		execute = function(){start_game();}
		label = "Play"
		sprite_index = spr_button_long_blue;
	}break;
	
	//Settings
	case 1: {
		label = "Settings"
		execute = function(){
			//show_debug_message("creating");
			if(!instance_exists(obj_settings_controller)){instance_create_layer(576, 224, "Instances", obj_settings_controller);}
			my_controller.suspended = true;
		}
	}break;
	
	//Credits
	case 2: {
		label = "Credits"
		execute = function(){
			if(!instance_exists(obj_credits)){instance_create_layer(576, 544, "Instances", obj_credits);}
			my_controller.suspended = true;
		}
	}break;
	
	//Exit
	case 3: {
		execute = function(){game_end();}
		label = "Exit"
	}break;
}