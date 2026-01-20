/// 
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//@description ObjHurtBox's Functions
hurtUser = function(_hitBoxID, _dmg, _knockbackSpd, _knockbackAng, _xDir, _yDir, _hitStunTime, _sfx) {
	//for (var _i = 0; _i < array_length(_arrayEffects); _i++)
	//{
	//	var _effect = _arrayEffects[_i];
	//	switch (_effect)
	//	{
	//		case (Effects.Stunned):
	//		{
	//			with (myUser) {state = stateStunned;}
	//			if (variable_instance_exists(myUser, "setStunTimer"))
	//			{with (myUser) {setStunTimer();}}
	//			xSpeed = 0;
	//			ySpeed = 0;
	//		} break;
	//	}
	//}
	
	//Check to see if knock angle equals anything, if not then get the hurt boxes user and get the
	//angle its coming at
	if (instance_exists(_hitBoxID)) { 
		var _centerX = x;
		var _centerY = y; 
		var _hbCenterX = _hitBoxID.x;
		var _hbCenterY = _hitBoxID.y;
	
		
		_knockbackAng ??= point_direction(_hbCenterX, _hbCenterY, _centerX, _centerY);
		show_debug_message(_knockbackAng);
	}
	
	if (instance_exists(myUser)){
		show_debug_message(object_get_name(myUser.object_index) + " got hit by " + object_get_name(_hitBoxID.myUser.object_index));
		with (myUser) 
		{
			//var _func = variable_instance_get(id, "takeDamage");
			//if (_func != undefined) takeDamage(_dmg, _knockBack);
			//else
			takeDamage(self, _dmg, _knockbackSpd, _knockbackAng, _xDir, _yDir, _sfx);
		}
	} 
	else {instance_destroy();}
}



