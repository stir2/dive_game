

if (!instance_exists(myUser)) 
{
	instance_destroy();
	followUser = false;
	exit;
}

if (followUser)
{
	x = myUser.x + xOffset;
	y = myUser.y + yOffset;
	image_angle = myUser.image_angle;
}

