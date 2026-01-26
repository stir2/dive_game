
//Create buttons and disperse evenly 
var _yIncrease = ((bbox_top) - (bbox_bottom))/array_length(buttons_array);

for (var _i = 0; _i < array_length(buttons_array); _i++) { 
	var _button = buttons_array[_i];
	//Set x and y then deactivate till this box is open
	_button.x = x; 
	_button.y = bbox_top - _yIncrease * (_i + .5);
	_button.depth = depth - 10;
	instance_deactivate_object(_button);
}

visible = false;

toggle_menu_box = function() { 
	if (open) { 
		//Deactivate instance, we are closing
		for (var _i = 0; _i < array_length(buttons_array); _i++) { 
			var _button = buttons_array[_i];
			instance_deactivate_object(_button);
		}
		
		visible = false;
	}
	else { 
		//activate instances, we are opening
		for (var _i = 0; _i < array_length(buttons_array); _i++) { 
			var _button = buttons_array[_i];
			instance_activate_object(_button);
		}
		
		visible = true;
	}
	
	//toggle open
	open = !open;
}