/// @description Insert description here
// You can write your code in this editor

if (instance_exists(myInstance)) { 
	//show_debug_message("AAAAAH");
	var _tempX = myInstance.x_speed; 
	var _tempY = myInstance.y_speed;
	
	with (myInstance) { 
		set_speed_at_angle(other.angSpeed, other.angle);
		other.angSpeed = speed_adjust_by(other.angSpeed, other.decaySpeed, 0, 1);
		
		var _results = moveAndCollide();
		if (_results) {
			other.angle = -other.angle;
			other.angSpeed = other.angSpeed/3;
		}
		x += x_speed;
		y += y_speed;
		
		x_speed = _tempX;
		y_speed = _tempY;
	}	
	
	if (angSpeed == 0){
		instance_destroy();
	}
}