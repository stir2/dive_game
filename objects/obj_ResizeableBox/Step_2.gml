

if (!instance_exists(myUser)) 
{
	instance_destroy();
	followUser = false;
	exit;
}

if (followUser)
{
	//Change angle to users angle 
	image_angle = myUser.image_angle;
	
	////Calculate the alterations need for xOffset 
	var _alter_x = myUser.x + dcos(image_angle) * (xOffset) + dsin(image_angle) * (yOffset);
	var _alter_y = myUser.y - dsin(image_angle) * (xOffset) + dcos(image_angle) * (yOffset);
	
	x = _alter_x;
	y = _alter_y;
}

