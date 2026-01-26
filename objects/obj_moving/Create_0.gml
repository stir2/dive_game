/// @description Insert description here
// You can write your code in this editor
//Direction of movement (either -1, 0, or 1)
x_movement = 0;
y_movement = 0;
//If were moving or not (should be 0 or 1)
angle_movement = 0;
//angle your heading at
angle_direction = 0;

//Speed of movement
x_speed = 0;
y_speed = 0;
angle_speed = 0;

in_water = false;

/**
/// @desc Returns a changed speed value, and ensures said speed value does not go over its limit.
/// @param {any} _varSpeed The speed you wish to increase and return back
/// @param {any*} a_acceleration The speed you want to increase by
/// @param {any*} _max_speed The top speed to stop by
/// @param {any*} _direction The firection the current instance is heading
*/
speed_adjust_by = function (_varSpeed, _acceleration, _max_speed, _direction) {
	if (sign(_direction * _acceleration) == 1) {
		//Check if the current varSpeed + acceleration value will NOT surpass the max speed
		if !(_varSpeed + _acceleration * _direction > _max_speed * _direction) _varSpeed += _acceleration * _direction;
		// If varSpeed isnt greater than max_speed or equal to max_speed
		else if (_varSpeed <= _max_speed * _direction) _varSpeed = _max_speed * _direction;
	}
	else if (sign(_direction * _acceleration) == -1) { 
		//Check if the current varSpeed + acceleration value will NOT surpass the max speed
		if !(_varSpeed + _acceleration * _direction < _max_speed * _direction) _varSpeed += _acceleration * _direction;
		// If varSpeed isnt greater than max_speed or equal to max_speed
		else if (_varSpeed >= _max_speed * _direction) _varSpeed = _max_speed * _direction;
	}
	return _varSpeed;
}

set_speed_at_angle = function(_speedWanted, _angle){
	//First we should check if speed is a negative, as we cant square root a negative,
	//if so then flip the angle by adding 180
	
	//Then if angle is NOT inbetween 180 <-> -180
	//while (_angle > 180) _angle -= 360;
	//while (_angle < -180) _angle += 360;
	////show_debug_message(_angle);
	
	//if (sign(_speedWanted) == -1) _angle = -_angle;
	
	//var _xAngle = -(abs(_angle) - 90);
	//var _yAngle = -(_angle);
	
	
	////angle - 180 * sign(_angle) for y
	////angle - 90 * sign(_angle) for x
	//var _x_speedSquared = ((sqr(_speedWanted) * (_xAngle))/90);
	//var _y_speedSquared = sqr(_speedWanted) - abs(_x_speedSquared); 
	
	//show_debug_message("y_speed^2 = " + string(_y_speedSquared));
	//show_debug_message("x_speed^2 = " + string(_x_speedSquared));
	
	
	//y_speed = sqrt(abs(_y_speedSquared)) * sign(_yAngle);
	//x_speed = sqrt(abs(_x_speedSquared)) * sign(_xAngle);
	
	y_speed = -dsin(_angle) * _speedWanted;
	x_speed = dcos(_angle) * _speedWanted;
	
	//show_debug_message("y_speed = " + string(y_speed));
	//show_debug_message("x_speed = " + string(x_speed));
	
}

collideWith = function (_collidingWith = []) {
	//Store angle temporarly 
	var _angle_held = image_angle;
	//--Apply Any defaults arrays aneeded here--
	_collidingWith = array_concat(_collidingWith, [obj_solid]);
	//-----------------------------------------
	
	
	#region---- Create the Collison rectangle lists ----
	//-----Left/Right aka X
	var _recLRList = ds_list_create();
	if (x_speed != 0)
	{
		//Keeps track if the list has a value
		var _direction = bbox_left;
		if (sign(x_speed) == 1 || x_speed == 0 && image_xscale == 1) _direction = bbox_right;
		var _xSpd = x_speed;
		if (abs(_xSpd) < 1) _xSpd = 1 * sign(x_speed);	//NOTE IF WE WANT THIS TOGGABLE IN THE FUTURE MAKE A BOOLEAN AS AN ARGUMENT AND PUT IT IN THE IF STATMENT
		
		//Scan for collisions and add to list
		collision_rectangle_list(_direction, bbox_bottom, _direction + _xSpd, bbox_top, _collidingWith, false, true, _recLRList, true);
		
		//Check if top object is valid
		var _passed = false;
		while(!_passed && ds_list_size(_recLRList) != 0) {
			var _inst = _recLRList[| 0];
			//If instance is the same
			if (_inst == id)
			{
				//show_debug_message(object_get_name(_inst.object_index));
				ds_list_delete(_recLRList, 0);
				continue; //Go to next loop
			}
			
			//!!APPLY ANY OTHER NEEDED CONSTRAINTS FOR COLLISIONS HERE!!//
			
			
			//No continues hit then passed
			_passed = true;
		}
		
	}
		
	//-----Top/Bottom
	var _recTBList = ds_list_create();
	if (y_speed != 0) {
		//If y_speed equals 0 then make it equal one so it can constantly check below
	
		//Keeps track if the list has a value
		var _direction = bbox_bottom;
		if (sign(y_speed) == -1) _direction = bbox_top;
		var _ySpd = y_speed;
		//if (abs(_ySpd) < 1) _ySpd = 1 * sign(y_speed);
	
		//Scan for collisions and add to list
		collision_rectangle_list(bbox_left, _direction, bbox_right, _direction + _ySpd, _collidingWith, false, true, _recTBList, true);	
		
		//Check if top object is valid
		var _passed = false;
		while(!_passed && ds_list_size(_recTBList) != 0) {
			var _inst = _recTBList[| 0];
				
			//If instance is the same
			if (_inst == id)
			{
				//show_debug_message(object_get_name(_inst.object_index));
				ds_list_delete(_recTBList, 0);
				continue; //Go to next loop
			}
			
			//!!APPLY ANY OTHER NEEDED CONSTRAINTS FOR COLLISIONS HERE!!//
			
			
			//If none of the continue checks are hit then break loop
			_passed = true;
				
		}

	}
	
	#endregion
	
	#region---- Collide with first object found ----
	//------Left/Right aka X
	//var _x = x;
	//var _x_movement = true; //Will be checked later to see if theirs any movement we need to adjust for again
	//Check to see if we found something 
	var _objXColliding = noone;
	var _objYColliding = noone;
	var _collisionMade = false;
	
	if (ds_list_size(_recLRList) != 0)
	{
		
		_objXColliding = _recLRList[| 0];
		
		var _direction = bbox_left;
		if (sign(x_speed) == 1 || x_speed == 0 && image_xscale == 1) _direction = bbox_right;
		
		var _objbbox = _objXColliding.bbox_right;
		if (_direction == bbox_right) _objbbox = _objXColliding.bbox_left;
		
		x = _objbbox + (x - _direction); //get diffrence of x and bbox direction in order to get the x in the correct spot
		x_speed = 0;
		_collisionMade = true;
	}
		
		
	
	//------Top/Bottom
	//var _y = y;
	//var _y_movement = true; //Will be checked later to see if theirs any movement we need to adjust for again
	//Check to see if we found something 
	if (ds_list_size(_recTBList) != 0)
	{	
		//Find which direction were heading 
		var _direction = bbox_bottom;
		if (sign(y_speed) == -1) _direction = bbox_top;
		
		_objYColliding = _recTBList[| 0];//get first object that was found
		
		if (_objYColliding != _objXColliding) //If we are colloding with the same wall we are likely in a corner so only work with x_speed this frame
		{
			var _objbbox = _objYColliding.bbox_bottom;
			if (_direction == bbox_bottom) _objbbox = _objYColliding.bbox_top;
			
			y = _objbbox + (y - _direction); //get diffrence of y and bbox direction in order to get the y in the correct spot
			y_speed = 0;
			_collisionMade = true;
		}
	}// else _y_movement = false;
		
	#endregion
	
	ds_list_destroy(_recLRList);
	ds_list_destroy(_recTBList);
	
	//return angle amount
	image_angle = _angle_held;
	
	//Return results of collision 
	return _collisionMade;
}

moveAndCollide = function (_collidingWithArr = []) {
	
	//Run Collision check first, the function modifies the speeds were adding
	var _result = collideWith(_collidingWithArr);
	
	//Add Speeds to respective values second
	x += x_speed;
	y += y_speed;
	
	return _result;
}

// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

/**
 * Function Uses an instances bottom hitbox to determine if on a solid or not
 * @param {array} _platformsArr Array of containing Solids to check onSolid for
 * @param {Instance} _instanceSearch Instance looking for, if filled will return true if instance is on top of this instance
 * @returns {bool} Returns a boolean depending if instance is on a specfied solid. 
 */
onSolid = function(_platformsArr = pointer_null, _instanceSearch = noone)
{
	
	//Default for most 
	if (_platformsArr == pointer_null) _platformsArr = [obj_solid];
	
	//Check if any of the following surfaces are below the user
	//if so the make onSolid true and return it
	var _onSolid = false;
	
	var _disToCheck = 1;
	
	//Look for instances
	var _inst = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom + 1, _platformsArr, false, false);	
	if (_inst) {
		//Check if we are above the instance we stand on
		if (round(bbox_bottom) <= round(_inst.bbox_top) && round(y_speed) >= 0) {
			//See if we have a valid _instanceSearch value
			if (instance_exists(_instanceSearch)) {
				//If so then check if we found the instance
				if(_inst == _instanceSearch) _onSolid = true;
			}
			//Regular behavior is to set onSolid to true
			else _onSolid = true; 
		} else {
			//show_debug_message("");
		}
	}
	
	//show_debug_message("On Solid = " + string(_onSolid));
	return _onSolid;
}
	

