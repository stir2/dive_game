/// @description Insert description here
// You can write your code in this editor
show_debug_message(async_load[? "event_type"]);

switch(async_load[? "event_type"])             // Parse the async_load map to see which event has been triggered
{
	case ("gamepad discovered"): 
	{	
		// A game pad has been discovered
		var _pad = async_load[? "pad_index"];       // Get the pad index value from the async_load map
		gamepad_set_axis_deadzone(_pad, 0.1);       // Set the "deadzone" for the axis
		gamepad_set_button_threshold(_pad, 0.1);    // Set the "threshold" for the triggers
		show_debug_message(gamepad_get_description(_pad));
		if (string_upper(gamepad_get_description(_pad)) == "XINPUT STANDARD GAMEPAD") //Check to see if gamepad is valid
		{
			
			//Assign pad to controller if not assigned 
			if (controllerPad == -1) controllerPad = _pad;
			
			//Add to global controller
			//array_push(objUniversalController.padArray, _pad);    //Assign Pad Number to controller
			////objUniversalController.setToDefault(); //Run default inputs code
			//show_debug_message("Player " + string(_i + 1) + " = " + string(_player.pad));
			show_debug_message(gamepad_get_mapping(_pad));
			show_debug_message("-----Controller connection complete------");
		}
		else if (string_upper(gamepad_get_description(_pad)) == "STANDARD GAMEPAD") //Check to see if gamepad is valid
		{
			
			//Assign pad to controller if not assigned 
			if (controllerPad == -1) controllerPad = _pad;
			
			//Add to global controller
			//array_push(objUniversalController.padArray, _pad);    //Assign Pad Number to controller
			////objUniversalController.setToDefault(); //Run default inputs code
			//show_debug_message("Player " + string(_i + 1) + " = " + string(_player.pad));
			show_debug_message(gamepad_get_mapping(_pad));
			show_debug_message("-----Controller connection complete------");
		}
		else if(string_upper(gamepad_get_description(_pad)) == string_upper("Nintendo Switch Pro Controller")) //Check to see if gamepad is valid
		{
			//Assign pad to controller if not assigned 
			if (controllerPad == -1) controllerPad = _pad;
			
			//Add to global controller
			//array_push(objUniversalController.padArray, _pad);  
			//show_debug_message("Player " + string(_i + 1) + " = " + string(_player.pad));
			//show_debug_message(gamepad_get_mapping(_pad));
			//gamepad_remove_mapping(_pad);	
			//show_debug_message(gamepad_get_mapping(_pad));
					
			//var _mapping = gamepad_get_guid(_pad) + "," + gamepad_get_description(_pad) + "," + "a:b1,b:b2,back:b8,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,dpup:h0.1,guide:b12,leftshoulder:b4,leftstick:b10,lefttrigger:a3,leftx:a0,lefty:a1,rightshoulder:b5,rightstick:b11,righttrigger:a4,rightx:a2,righty:a5,start:b9,x:b0,y:b3,",;
			//var _newMapping = gamepad_test_mapping(_pad, _mapping);
			//show_debug_message(_mapping);
					
			//show_debug_message("-----Controller connection complete------");
		}
		else {/*show_debug_message(gamepad_get_mapping(_pad)); show_debug_message("-----Controller not assigned------");*/}
	} break;
	case ("gamepad lost"):                         // Gamepad has been removed or otherwise disabled
	{
		var _pad = async_load[? "pad_index"];       // Get the pad index
		controllerPad = -1;
		//for (var _i = 0; _i < array_length(playerArray); _i++)
		//{
		//	//Reset pad to -1
		//	controllerPad = -1;
			
			//Remove the pad from the array. 
			
			//var _player = playerArray[_i];
			//if (_player.pad == _pad)  //Check too see if playerslot holds the id 
			//{ 
			//	//array_delete(objUniversalController.padArray, _i, 1);
			//	_player.pad = noone;    //Unassign controller
			//	//show_debug_message("Player " + string(_i + 1) + " = " + string(_player.pad));
			//	//show_debug_message("Player " + string(_i + 1) + " disconnected");
			//	break;  //END THE LOOP, CONTROLLER REMOVAL SUCCESS
			//}
		//}
	}break;


}