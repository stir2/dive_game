/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Objhitboxe's Code

countDown = false;
if (hitBoxTime > -1 && sign(hitBoxTime)) countDown = true;

hitBoxTimer = hitBoxTime; //Set active timer
hurtBoxHitArray = [[],[]];

countDownHurtOnce = false;
if (hurtOnceResetTime > -1)
{
	countDownHurtOnce = true;
}
resetHurtOnce = function()
{hurtBoxHitArray = [[],[]];}

destroyMe = function()
{instance_destroy();}
if (!instance_exists(myUser)) destroyMe();

reshapeBox = function(_newX, _newY, _newWidth, _newHeight)
{
	if (instance_exists(myUser)) {
		x = myUser.x;
		y = myUser.y;
		xDesired = _newX;
		yDesired = _newY;
		width = (_newWidth) - xDesired;
		height = (_newHeight) - yDesired;
	
	
		xOffset = (xDesired - (myUser.x)); //Get Offset by finding the distance between desired x and player x
		yOffset = (yDesired - (myUser.y));
		x += xOffset;
		y += yOffset;

		image_xscale = (width);
		image_yscale = (height);
	}
}

//Information Gathering Methods 
hitMade = false;
getHitMade = function() {return hitMade;}





