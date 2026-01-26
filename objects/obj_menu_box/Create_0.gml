
//Create buttons and disperse evenly 
var _yIncrease = ((bbox_top) - (bbox_bottom))/array_length(buttons_array);

var _arrayExtras = [];
for (var _i = 0; _i < array_length(buttons_array); _i++) { 
	var _button = buttons_array[_i];
	//Set x and y then deactivate till this box is open
	_button.x = x; 
	_button.y = bbox_top - _yIncrease * (_i + .5);
	_button.depth = depth - 20;
	
	instance_deactivate_object(_button);
}

array_concat(buttons_array, _arrayExtras);

visible = false;

toggle_menu_box = function(_val = !open) { 
	open = !_val;
	
	if (open) { 
		//Deactivate instance, we are closing
		for (var _i = 0; _i < array_length(buttons_array); _i++) { 
			var _button = buttons_array[_i];
			
			if (_button.object_index == obj_button_left_right_action) { 
				instance_deactivate_object(_button.left_button);
		
				instance_deactivate_object(_button.right_button);
		
			}
			
			instance_deactivate_object(_button);
		}
		
		visible = false;
	}
	else { 
		//activate instances, we are opening
		for (var _i = 0; _i < array_length(buttons_array); _i++) { 
			var _button = buttons_array[_i];
			instance_activate_object(_button);
			
			if (_button.object_index == obj_button_left_right_action) { 
				instance_activate_object(_button.left_button);
		
				instance_activate_object(_button.right_button);
		
			}
		}
		
		visible = true;
	}
	
	//toggle open
	open = !open;
}