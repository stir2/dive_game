
#region JavaDoc
/** @desc Constructor for objHitBox
/// @param {array} _hurtBoxArg Input an array of argurments for the Hurtbox Constructor. 
Refrence the HurtBox Constructor for arguments. Please ensure to follow order. 

/// @param {any*} _dmgToDo The amount of damage the hitbox will do.

/// @param {any*} _knockBack The speed at which the hitbox will send objects at.
///@param {any*} _knockAng The angle, from 0 - 90 degrees, at which the hitbox will send objects to, 
this requires _knockBack to be filled.

/// @param {any*} _knockXDirect the xDirection the Hitbox will send objects at. This should be labeled as 1 or -1.

/// @param {any*} _knockYDirect the yDirection the Hitbox will send objects at. This should be labeled as 1 or -1.

/// @param {any*} _hitStunFrames The amount of frames an object will go into the stun state, if 
they have a stun state.

/// @param {array} _objectsToHitArr This is an Array of objects, this concats with the current predefined array.

/// @param {array} [_statesToCheck] An array of strings of state variable names from the 
objects you inputed in _objectsToHitArr. The hitbox will ignore any instance equaling the states
specfied in the array. This will concat with the predefined array.

/// @param {id.instance} [_masterID] An ID of another hitbox. Inputing an ID will have this hitbox work
with the master to not allow itself to hit the same instance twice. Best practice would 
be to make the oldest instance the Master

/// @param {any*} _duration How long the hitbox will last for. Set to negative one to last indefinitely.

/// @param {array} [_statesAllowedIn] An array of strings of state variable names from the hitboxes User. 
The hitbox will delete itself if the User exits the specified states.

/// @param {any*} _hurtResetTime The amount of frames till the hitbox allows itself to 
damage the same instance again. Setting to a number 0 and below will stop it from counting


*/
#endregion

function HitBox (_hurtBoxArg, _dmgToDo, _knockBack, _knockAng, _knockXDirect, _knockYDirect, _hitStunFrames, _objectsToHitArr = [], _statesToCheck = [],
_masterID = noone, _duration = 1, _statesAllowedIn = [], _hurtResetTime = -1) : HurtBox(_hurtBoxArg[0], _hurtBoxArg[1], _hurtBoxArg[2], _hurtBoxArg[3], _hurtBoxArg[4], _hurtBoxArg[5]) constructor {
	
	//Values for the DMG function
	dmgValue = _dmgToDo;
	knockVal = _knockBack;
	knockAng =  _knockAng;
	knockXDirection = _knockXDirect;
	knockYDirection = _knockYDirect
	stunTime = _hitStunFrames;
	
	arrayObjsToHit = _objectsToHitArr;
	conditionsArray = _statesToCheck;
	
	
	//Values for the Boxes behaviors 
	masterHB = _masterID;
	hitBoxTime = _duration;
	statesAllowed = _statesAllowedIn;
	hurtOnceResetTime = _hurtResetTime; 

	hurtOnce = true;
}

#region Predefined Types

#region JavaDoc
/** @desc Constructor for objHitBox, has predefined objects that players should hit.
/// @param {array} _hurtBoxArg Input an array of argurments for the Hurtbox Constructor. 
Refrence the HurtBox Constructor for arguments. Please ensure to follow order. 

/// @param {any*} _dmgToDo The amount of damage the hitbox will do.

/// @param {any*} _knockBack The speed at which the hitbox will send objects at.
///@param {any*} _knockAng The angle, from 0 - 90 degrees, at which the hitbox will send objects to, 
this requires _knockBack to be filled.

/// @param {any*} _knockXDirect the xDirection the Hitbox will send objects at. This should be labeled as 1 or -1.

/// @param {any*} _knockYDirect the yDirection the Hitbox will send objects at. This should be labeled as 1 or -1.

/// @param {any*} _hitStunFrames The amount of frames an object will go into the stun state, if 
they have a stun state.

/// @param {array} _objectsToHitArr This is an Array of objects, this concats with the current predefined array.

/// @param {array} [_statesToCheck] An array of strings of state variable names from the 
objects you inputed in _objectsToHitArr. The hitbox will ignore any instance equaling the states
specfied in the array. This will concat with the predefined array.

/// @param {id.instance} [_masterID] An ID of another hitbox. Inputing an ID will have this hitbox work
with the master to not allow itself to hit the same instance twice. Best practice would 
be to make the oldest instance the Master

/// @param {any*} _duration How long the hitbox will last for. Set to negative one to last indefinitely.

/// @param {array} [_statesAllowedIn] An array of strings of state variable names from the hitboxes User. 
The hitbox will delete itself if the User exits the specified states.

/// @param {any*} _hurtResetTime The amount of frames till the hitbox allows itself to 
damage the same instance again. Setting to a number 0 and below will stop it from counting


*/
#endregion

function HitBoxPlayer (_hurtBoxArg, _dmgToDo, _knockBack, _knockAng, _knockXDirect, _knockYDirect, _hitStunFrames, _objectsToHitArr = [], _statesToCheck = [],
_masterID = noone, _duration = 1, _statesAllowedIn = [], _hurtResetTime = -1) : HurtBox(_hurtBoxArg[0], _hurtBoxArg[1], _hurtBoxArg[2], _hurtBoxArg[3], _hurtBoxArg[4], _hurtBoxArg[5]) constructor {
	
	//Values for the DMG function
	dmgValue = _dmgToDo;
	knockVal = _knockBack;
	knockAng =  _knockAng;
	knockXDirection = _knockXDirect;
	knockYDirection = _knockYDirect
	stunTime = _hitStunFrames;
	
	arrayObjsToHit = [objEnemyObject];
	arrayObjsToHit = array_concat(arrayObjsToHit, _objectsToHitArr);
	
	conditionsArray = [];
	conditionsArray = array_concat(conditionsArray, _statesToCheck);
	
	
	//Values for the Boxes behaviors 
	masterHB = _masterID;
	hitBoxTime = _duration;
	statesAllowed = _statesAllowedIn;
	hurtOnceResetTime = _hurtResetTime; 

	hurtOnce = true;
}


#region JavaDoc
/** @desc Constructor for objHitBox, has predefined objects that enemies should hit.
/// @param {array} _hurtBoxArg Input an array of argurments for the Hurtbox Constructor. 
Refrence the HurtBox Constructor for arguments. Please ensure to follow order. 

/// @param {any*} _dmgToDo The amount of damage the hitbox will do.

/// @param {any*} _knockBack The speed at which the hitbox will send objects at.
///@param {any*} _knockAng The angle, from 0 - 90 degrees, at which the hitbox will send objects to, 
this requires _knockBack to be filled.

/// @param {any*} _knockXDirect the xDirection the Hitbox will send objects at. This should be labeled as 1 or -1.

/// @param {any*} _knockYDirect the yDirection the Hitbox will send objects at. This should be labeled as 1 or -1.

/// @param {any*} _hitStunFrames The amount of frames an object will go into the stun state, if 
they have a stun state.

/// @param {array} _objectsToHitArr This is an Array of objects, this concats with the current predefined array.

/// @param {array} [_statesToCheck] An array of strings of state variable names from the 
objects you inputed in _objectsToHitArr. The hitbox will ignore any instance equaling the states
specfied in the array. This will concat with the predefined array.

/// @param {id.instance} [_masterID] An ID of another hitbox. Inputing an ID will have this hitbox work
with the master to not allow itself to hit the same instance twice. Best practice would 
be to make the oldest instance the Master

/// @param {any*} _duration How long the hitbox will last for. Set to negative one to last indefinitely.

/// @param {array} [_statesAllowedIn] An array of strings of state variable names from the hitboxes User. 
The hitbox will delete itself if the User exits the specified states.

/// @param {any*} _hurtResetTime The amount of frames till the hitbox allows itself to 
damage the same instance again. Setting to a number 0 and below will stop it from counting


*/
#endregion

function HitBoxEnemy (_hurtBoxArg, _dmgToDo, _knockBack, _knockAng, _knockXDirect, _knockYDirect, _hitStunFrames, _objectsToHitArr = [], _statesToCheck = [],
_masterID = noone, _duration = 1, _statesAllowedIn = [], _hurtResetTime = -1) : HurtBox(_hurtBoxArg[0], _hurtBoxArg[1], _hurtBoxArg[2], _hurtBoxArg[3], _hurtBoxArg[4], _hurtBoxArg[5]) constructor {
	
	//Values for the DMG function
	dmgValue = _dmgToDo;
	knockVal = _knockBack;
	knockAng =  _knockAng;
	knockXDirection = _knockXDirect;
	knockYDirection = _knockYDirect
	stunTime = _hitStunFrames;
	
	arrayObjsToHit = [objPlayerActor];
	arrayObjsToHit = array_concat(arrayObjsToHit, _objectsToHitArr);
	
	conditionsArray = [];
	conditionsArray = array_concat(conditionsArray, _statesToCheck);
	
	
	//Values for the Boxes behaviors 
	masterHB = _masterID;
	hitBoxTime = _duration;
	statesAllowed = _statesAllowedIn;
	hurtOnceResetTime = _hurtResetTime; 

	hurtOnce = true;
}

#endregion