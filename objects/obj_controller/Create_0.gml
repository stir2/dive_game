/// @description Insert description here
// You can write your code in this editor
controllerPad = -1;
rightStickAngle = 0;
rightStickXAxis = 0;
rightStickYAxis = 0;

//Jump/ Swim - Up stick or d pad up
//Left/Right - left/right stick or d pad up
//Down - down stick or d pad down

//Shoot - Trigger R/L
//Reel - Trigger R/L
//Stab - Bumper R/L


enum Inputs { 
	Up,
	Down,
	Left,
	Right,
	Attack1,
	Attack2,
	Pause,
	Confirm
}

check_input = function (_inputType) { 
	switch (_inputType) { 
		case (Inputs.Up) : { 
			//If no controller connected use keyboard
			if (controllerPad == -1) { 
				return keyboard_check(ord("W"));
			}
			else { 
				//Check for stick up or DPad up
				return (gamepad_axis_value(controllerPad, gp_axislv) < -0.3) || 
					gamepad_button_check(controllerPad, gp_padu);
			}
		}
		break;
		
		case (Inputs.Down): {
			//If no controller connected use keyboard
			if (controllerPad == -1) { 
				return keyboard_check(ord("S"));
			}
			else { 
				//Check for stick down or DPad down
				return (gamepad_axis_value(controllerPad, gp_axislv) > 0.3) || 
					gamepad_button_check(controllerPad, gp_padd);
			}
			
		}
		break;
		
		case (Inputs.Right) : { 
			//If no controller connected use keyboard
			if (controllerPad == -1) { 
				return keyboard_check(ord("D"));
			}
			else { 
				//Check for stick right or DPad right
				return (gamepad_axis_value(controllerPad, gp_axislh) > 0.3) || 
					gamepad_button_check(controllerPad, gp_padr);
			}
		}
		break;
		
		case (Inputs.Left) : { 
			//If no controller connected use keyboard
			if (controllerPad == -1) { 
				return keyboard_check(ord("A"));
			}
			else { 
				//Check for stick left or DPad left
				return (gamepad_axis_value(controllerPad, gp_axislh) < -0.3) || 
					gamepad_button_check(controllerPad, gp_padl);
			}			
		}
		break;
		
		case (Inputs.Attack1) : { 
			//If no controller connected use keyboard
			if (controllerPad == -1) { 
				return mouse_check_button(mb_left);
			}
			else { 
				//Check for either shoulder button
				return gamepad_button_check(controllerPad, gp_shoulderrb) || 
					gamepad_button_check(controllerPad, gp_shoulderlb);
			}	
		}
		break;
		
		case (Inputs.Attack2) : { 
			if (controllerPad == -1) { 
				return mouse_check_button(mb_right);
			}
			else { 
				//Check for either shoulder trigger
				return gamepad_button_check(controllerPad, gp_shoulderr) || 
				gamepad_button_check(controllerPad, gp_shoulderl);
			}
		}
		break;
		
		case (Inputs.Pause): { 
			if (controllerPad == -1) { 
				return keyboard_check(vk_escape);
			}
			else { 
				//Check for start
				return gamepad_button_check(controllerPad, gp_start);
			}
		}
		break;
		
		default:
		show_debug_message("ERROR: NO SUCH INPUT " + string(_inputType) +  " EXISTS \n PLEASE USE ENUM: Inputs");
	}
}


stickUpPressed = false;
stickDownPressed = false;
stickRightPressed = false;
stickLeftPressed = false;

check_input_pressed = function (_inputType) { 
	switch (_inputType) { 
		case (Inputs.Up) : { 
			//If no controller connected use keyboard
			if (controllerPad == -1) { 
				return keyboard_check_pressed(ord("W"));
			}
			else { 
				//Check for stick up or DPad up AND Ensure if stick it isnt 
				return ((gamepad_axis_value(controllerPad, gp_axislv) < -0.3) && !stickUpPressed)|| 
					gamepad_button_check_pressed(controllerPad, gp_padu);
			}
		}
		break;
		
		case (Inputs.Down): {
			//If no controller connected use keyboard
			if (controllerPad == -1) { 
				return keyboard_check_pressed(ord("S"));
			}
			else { 
				//Check for stick up or DPad up
				return ((gamepad_axis_value(controllerPad, gp_axislv) > 0.3) && !stickDownPressed) || 
					gamepad_button_check_pressed(controllerPad, gp_padd);
			}
			
		}
		break;
		
		case (Inputs.Right) : { 
			//If no controller connected use keyboard
			if (controllerPad == -1) { 
				return keyboard_check_pressed(ord("D"));
			}
			else { 
				//Check for stick up or DPad up
				return ((gamepad_axis_value(controllerPad, gp_axislh) > 0.3) && !stickRightPressed) || 
					gamepad_button_check_pressed(controllerPad, gp_padr);
			}
		}
		break;
		
		case (Inputs.Left) : { 
			//If no controller connected use keyboard
			if (controllerPad == -1) { 
				return keyboard_check_pressed(ord("A"));
			}
			else { 
				//Check for stick up or DPad up
				return ((gamepad_axis_value(controllerPad, gp_axislh) < -0.3) && !stickLeftPressed) || 
					gamepad_button_check_pressed(controllerPad, gp_padl);
			}			
		}
		break;
		
		case (Inputs.Attack1) : { 
			//If no controller connected use keyboard
			if (controllerPad == -1) { 
				return mouse_check_button_pressed(mb_left);
			}
			else { 
				//Check for stick up or DPad up
				return gamepad_button_check_pressed(controllerPad, gp_shoulderrb) || 
					gamepad_button_check_pressed(controllerPad, gp_shoulderlb);
			}	
		}
		break;
		
		case (Inputs.Attack2) : { 
			if (controllerPad == -1) { 
				return mouse_check_button_pressed(mb_right);
			}
			else { 
				//Check for stick up or DPad up
				return gamepad_button_check_pressed(controllerPad, gp_shoulderr) ||
				gamepad_button_check_pressed(controllerPad, gp_shoulderl);
			}
		}
		break;
		
		case (Inputs.Pause): { 
			if (controllerPad == -1) { 
				return keyboard_check_pressed(vk_escape);
			}
			else { 
				//Check for stick up or DPad up
				return gamepad_button_check_pressed(controllerPad, gp_start);
			}
		}
		break;
		
		case (Inputs.Confirm): { 
			if (controllerPad == -1) { 
				return keyboard_check_pressed(vk_enter);
			}
			else { 
				//Check for stick up or DPad up
				return gamepad_button_check_pressed(controllerPad, gp_face1);
			}
		}
		break;
		
		default:
		show_debug_message("ERROR: NO SUCH INPUT " + string(_inputType) +  " EXISTS \n PLEASE USE ENUM: Inputs");
	}
}