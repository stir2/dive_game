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
	rightStickXAxis = gamepad_axis_value(controllerPad, gp_axisrh);
	rightStickYAxis = gamepad_axis_value(controllerPad, gp_axisrv);
	if (rightStickXAxis != 0 || rightStickYAxis != 0) { 
		if (ds_queue_size(rightStickAngleQueue) >= 2) ds_queue_dequeue(rightStickAngleQueue);
		
		rightStickAngle = point_direction(0, 0, rightStickXAxis, rightStickYAxis);
		//ds_queue_enqueue(rightStickAngleQueue ,rightStickAngle);
	}
	else {
		if (ds_queue_size(rightStickAngleQueue) >= 2) { 
			//rightStickAngle = ds_queue_enqueue(rightStickAngleQueue);
		}
	}
}


if (check_input_pressed(Inputs.Up)) { 
	//show_debug_message("UP");
}

if (check_input_pressed(Inputs.Left)) { 
	//show_debug_message("Left");
}

if (check_input_pressed(Inputs.Right)) { 
	//show_debug_message("Right");
}

if (check_input_pressed(Inputs.Down)) { 
	//show_debug_message("Down");
}

//if (check_input_pressed(Inputs.Attack1)) { 
//	show_debug_message("Attack1");
//}

//if (check_input_pressed(Inputs.Attack2)) { 
//	show_debug_message("Attack2");
//}