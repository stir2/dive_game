/// @description Insert description here
// You can write your code in this editor

execute = function(){}
label = "";

switch(action_type){
	//Fullscreen
	case 0: {
		execute = function(){obj_settings.toggle_fullscreen();}
		label = "Toggle Fullscreen"
	}break;
	
	//Exit Settings
	case 1: {
		label = "Exit Settings"
		execute = function(){
			my_controller.my_controller.suspended = false;
			my_controller.my_controller.suspension_buffer = 10;
			if(instance_exists(my_controller)){my_controller.destroy_self();}
		}
	}break;
	
	//Resume
	case 2: {
		label = "Resume"
		execute = function(){
			//TODO: Add resume function
		}
	}break;
	
	//Main Menu
	case 3: {
		execute = function(){room_goto(rm_main_menu_new);}
		label = "Main Menu"
	}break;
}