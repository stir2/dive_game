depth = -1000;

//This should always be made in the top left corner of the object that is using it 
if (!instance_exists(myUser)) 
{
	instance_destroy();
	exit;
}
xOffset = (xDesired - (myUser.x)); //Get Offset by finding the distance between desired x and player x
yOffset = (yDesired - (myUser.y));
x += xOffset;
y += yOffset;

image_xscale = (width)/2;
image_yscale = (height)/2;

reshapeBox = function(_newX, _newY, _newWidth, _newHeight)
{
	if (instance_exists(myUser))
	{
		x = myUser.x;
		y = myUser.y;
		xDesired = _newX;
		yDesired = _newY;
		width = (_newWidth) - xDesired;
		height = (_newHeight) - yDesired;
	
	
		xOffset = 0//(xDesired - (myUser.x)); //Get Offset by finding the distance between desired x and player x
		yOffset = 0//(yDesired - (myUser.y));
		x += xOffset;
		y += yOffset;

		image_xscale = (width)/2;
		image_yscale = (height)/2;
	}
}

getUser = function()
{
	return myUser;
}


