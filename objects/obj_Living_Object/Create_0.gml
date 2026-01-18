event_inherited();


hp = 1; 
iFrames = 0;

tookDamage = function() { 
	if (hp == 0) instance_destroy();
}


takeDamage = function (_id, _dmg, _knockBackSpd = 0, _knockBackAng = 0, _xDirection = 0, _yDirection = 0, _sfx = undefined) {
	//We Will work on this later when the game is more solidfied
	//Here is how take damage should work 
	var _iFrames = iFrames;
		
	takeKnockback(_id, _knockBackSpd, _knockBackAng, _xDirection);
	
	if (variable_instance_exists(_id, "hp") && _dmg > 0) {		
		if (_iFrames <= 0) {
			//Subtract HP
			_id.hp -= _dmg;
			
			//Make sure HP wont go below 0
			_id.hp = clamp(_id.hp, 0, infinity);
			if (variable_instance_exists(_id, "tookDamage")) _id.tookDamage();
			
			//if (!is_undefined(_sfx) && is_string(_sfx) || is_array(_sfx)) objSFX.playSFX(_sfx);
		}
	}
}


takeKnockback = function(_id, _knockBackSpd, _knockBackAng = 0, _xDirection = 0) {
	if (_knockBackSpd == noone || _knockBackSpd == undefined || _knockBackSpd == 0) return;
	
	//Alter variables if using defaults
	//If direction is defined then modify angle to go into that direction 
	while (_knockBackAng > 270) _knockBackAng -= 360;
	while (_knockBackAng < -90) _knockBackAng += 360;
	
	if (_xDirection != 0) { 
		if (sign(_xDirection) == 1) { 
			//If not within 90 to -90
			_knockBackAng -= 90;
			_knockBackAng = -abs(_knockBackAng);
			_knockBackAng += 90;
		}
		else { 
			//If not within 90 to 270
			_knockBackAng -= 90;
			_knockBackAng = abs(_knockBackAng);
			_knockBackAng += 90;
		}
	}
	//show_debug_message(_knockBackAng);
	var _newKnockback = instance_create_depth(x, y, 0, objExternalForce, {myInstance : id, angSpeed : _knockBackSpd, angle : _knockBackAng, decaySpeed : -.5});
	
	//Rework notes 
	//Just use the SetSpeedToAngle Function
	//Additonally consider making those momentum objects as well. 
	//if (variable_instance_exists(_id, "xSpeedK"))
	//{
	//	 if (variable_instance_exists(_id, "ySpeedK"))
	//	 {
	//		 ySpeedK = (_yKnckSpd * _knockBackAng/90);
	//		 _xKnckSpd = (_xKnckSpd * (90 - _knockBackAng)/90);
			 
	//	 } 
		 
	//	 xSpeedK = _xKnckSpd;
	//}
	//else if (variable_instance_exists(_id, "ySpeedK")) //If xSpeed isnt there then it checks only for ySpeed
	//{
	//	ySpeedK = _yKnckSpd;
	//}
	//else 
	//{
	//	ySpeed = (_yKnckSpd * _knockBackAng/90);
	//	_xKnckSpd = (_xKnckSpd * (90 - _knockBackAng)/90);
	//	xSpeed = _xKnckSpd;
	//}
	
	if (_knockBackSpd != 0 && variable_instance_exists(_id, "tookKnockback")) _id.tookKnockback();
}