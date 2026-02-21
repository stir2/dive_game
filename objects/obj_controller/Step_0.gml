/// @description Insert description here
// You can write your code in this editor
if (controllerPad = -1) { 
	//show_message("NO CONTROLLER");
	
} else 
{
	//if (gamepad_button_check(controllerPad, gp_face1)) { 
	//	show_message("A");
	//	show_debug_message("A");
	//}
	var haxis = gamepad_axis_value(0, gp_axisrh);
	var vaxis = gamepad_axis_value(0, gp_axisrv);
	if (haxis != 0 || vaxis != 0 && (haxis == sign(haxis) && vaxis == sign(vaxis)))
		rightStickAngle = point_direction(0, 0, haxis, vaxis);
}


//if (check_input_pressed(Inputs.Up)) { 
//	show_debug_message("UP");
//}

//if (check_input_pressed(Inputs.Left)) { 
//	show_debug_message("Left");
//}

//if (check_input_pressed(Inputs.Right)) { 
//	show_debug_message("Right");
//}

//if (check_input_pressed(Inputs.Down)) { 
//	show_debug_message("Down");
//}

//if (check_input_pressed(Inputs.Attack1)) { 
//	show_debug_message("Attack1");
//}

//if (check_input_pressed(Inputs.Attack2)) { 
//	show_debug_message("Attack2");
//}