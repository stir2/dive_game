// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Constructor for HurtBox
/// @param {id} _userId ID of the instance using this HurtBox.
/// @param {bool} _followUser If set to true, hurtbox follow the Users x and y posistion. 
/// @param {any} _x1 The x coordinate for the top left of the HurtBox
/// @param {any} _y1 The y coordinate for the top left of the HurtBox
/// @param {any} _x2 The x coordinate for the bottom right of the HurtBox
/// @param {any} _y2 The y coordinate for the bottom right of the HurtBox 
function HurtBox (_userId, _followUser, _x1, _y1, _x2, _y2) constructor
{
	myUser = _userId;
	followUser = _followUser;
	xDesired = (_x1);
	yDesired = (_y1);
	width = (_x2) - xDesired;
	height = (_y2) - yDesired;
}

