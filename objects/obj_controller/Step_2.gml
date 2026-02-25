/// @description Insert description here
// You can write your code in this editor
if (check_input(Inputs.Up)) { 
	//show_debug_message("UP");
	stickUpPressed = true;
}
else stickUpPressed = false;

if (check_input(Inputs.Left)) { 
	//show_debug_message("Left");
	stickLeftPressed = true;
}
else stickLeftPressed = false;

if (check_input(Inputs.Right)) { 
	//show_debug_message("Right");
	stickRightPressed = true;
}
else stickRightPressed = false;

if (check_input(Inputs.Down)) { 
	//show_debug_message("Down");
	stickDownPressed = true;
}
else stickDownPressed = false;