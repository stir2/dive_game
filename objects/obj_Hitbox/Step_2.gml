/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Obj hitboxe's code 

if (instance_exists(masterHB))
{
	//Borrow hit box
	hurtBoxHitArray = masterHB.hurtBoxHitArray; 
}

//Set the collision made check boolean to false.
hitMade = false;

//Check if we are in the state we are supposed to be in 
if (array_length(statesAllowed) > 0 && scrStateCheck(myUser, statesAllowed, false)) {instance_destroy(); exit;}

//Check/Count Down Timer 
if (countDown && hitBoxTimer < 1) {instance_destroy(); exit;}
else hitBoxTimer--;

//Subtract timer 
if (countDownHurtOnce && !instance_exists(masterHB))
{
	for (var _i = 0; _i < array_length(hurtBoxHitArray[0]); _i++)
	{
		var _time = hurtBoxHitArray[1][_i]; //Get timer for the instance stored at i
		_time--; //Subtract timer
		
		if (_time < 1) { //If timer below 1 than remove it from array
			array_delete(hurtBoxHitArray[0], _i, 1); //Delete ID 
			array_delete(hurtBoxHitArray[1], _i, 1); //Delete Timer
		} else hurtBoxHitArray[1][_i] = _time; //Set new subtracted timer variabe if timer is above 0
	}
}

//Do Damage here 

var _hurtBoxList = ds_list_create();	//Create List to store all hurt boxes found

//Check if circle is being used 
instance_place_list(x, y, obj_HurtBox, _hurtBoxList, true); //Check for any hurt boxes


var _hurtBoxHitList = ds_list_create();	//We will put any valid hurtboxes in here, we will do damage to them later

//show_debug_message("HurtBox Size: " + string(ds_list_size(_hurtBoxList)));
//Below is a condition testing loop, only passing hurtboxes will be damaged
for (var _i = 0; _i < ds_list_size(_hurtBoxList); _i++) //Loop through all items found
{
	var _passed = true; //We will set this to false if the hurtb fails a test 
	var _hurtb = _hurtBoxList[| _i]; //Get Instance of hurtbox
	var _instID = _hurtb.getUser(); //Get User ID
	
	//show_debug_message("NEW INSTANCE");
	
	if (!instance_exists(_instID)) _passed = false;
	//show_debug_message("testOne: " + string(_passed));
	if (!_passed) continue; //Failed go on to next interation
	
	//show_debug_message("Object Name:" + string(object_get_name(_instID.object_index)));
	//show_debug_message("Interation " + string(_i));
	
	//We check this first because it gets rid of most trash first, lessining iterations
	//Loop throught and see if the hurtboxs user is one of the objects we want to hit
	for (var _i2 = 0; _i2 < array_length(arrayObjsToHit); _i2++) 
	{
		var _objectID = arrayObjsToHit[_i2];
		
		if (_objectID == _instID.object_index) //Check to see if the indexs are the same 
		{
			_passed = true;
			break;
		} 
		else if(object_is_ancestor(_instID.object_index, _objectID)) //Account for parents
		{
			_passed = true;
			break;
		} else _passed = false;
		
		//show_debug_message(_passed);
	}
	//show_debug_message("testTwo: " + string(_passed));
	if (!_passed) continue; //Failed go on to next interation
	
	//Check this second, to rid of more trash.
	_passed = true;//scrStateCheck(_instID, conditionsArray, false);
	//show_debug_message("testThree: " + string(_passed));
	if (!_passed) continue; //Failed go on to next interation
	
	//Check 3rd
	//Check if hurtbox is not in this array 
	if (hurtOnce && array_contains(hurtBoxHitArray[0], _hurtb)) _passed = false;
	//show_debug_message("testFour: " + string(_passed));
	if (!_passed) continue; //Failed go on to next interation
	
	
	//PASSED
	if (_passed) ds_list_add(_hurtBoxHitList, _hurtb); //If we passed everything then we add to damage list
}

ds_list_destroy(_hurtBoxList); //DESTROY LIST 

for (var _i = 0; _i < ds_list_size(_hurtBoxHitList); _i++) //Loop through all items passed
{
	var _hurtB = _hurtBoxHitList[| _i];
	
	//Perform Damage
	_hurtB.hurtUser(id, dmgValue, knockVal, knockAng, knockXDirection, knockYDirection, stunTime, soundEffect);
	
	//Check if we want to hurt once 
	if (hurtOnce)
	{
		array_insert(hurtBoxHitArray[0], -1, _hurtB); //ADD TO ARRAY, stop from damaging again
		if (countDownHurtOnce) array_insert(hurtBoxHitArray[1], -1, hurtOnceResetTime); //ADD TO ARRAY, stop from damaging again
	}
	
	//Set the collision made check boolean to true, as a hit has been made.
	hitMade = true;
	
}

ds_list_destroy(_hurtBoxHitList);

if (instance_exists(masterHB))
{
	//Give back hitbox
	masterHB.hurtBoxHitArray = hurtBoxHitArray; 
}


