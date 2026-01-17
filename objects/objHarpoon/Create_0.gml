/// @description Insert description here
// You can write your code in this editor
//vars:
startX = x;
startY = y;
targetX = x;
targetY = y;
angle = 0;
onPlayer = true;
xMovement = 0;
yMovement = 0;

//Hitbox Variable 
myHitbox = noone;
true_bbox_left = sprite_get_bbox_left(sprite_index);
true_bbox_right = sprite_get_bbox_right(sprite_index);
true_bbox_top = sprite_get_bbox_top(sprite_index);
true_bbox_bottom = sprite_get_bbox_bottom(sprite_index);


//idle state for harpoon, points in the direction of the player's mouse
statePoint = function(){
	targetX = mouse_x;
	targetY = mouse_y;
	//set angle so that throw and reel can access it
	angle = point_direction(startX, startY, targetX, targetY);
	//make harpoon sprite point towards target
	image_angle = angle;
	
	//on left click, if on player, throw
	if(mouse_check_button_pressed(mb_left) && onPlayer){
		state = stateThrow;
		
		//Store angle for short time to get size right
		var _temp_angle = image_angle;
		image_angle = 0;
		myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right, bbox_bottom], 1, 0, 0, 0, 0, 0, [obj_Enemy],,,-1));
		image_angle = _temp_angle;
	}

	//on right click, close attack
	if(mouse_check_button_pressed(mb_right) && onPlayer){
		state = stateHit;
		var _temp_angle = image_angle;
		image_angle = 0;
		myHitBox = instance_create_depth(x, y, 0, obj_Hitbox, new HitBox([id, true, bbox_left, bbox_top, bbox_right, bbox_bottom], 1, 0, 0, 0, 0, 0, [obj_Enemy],,,-1));
		image_angle = _temp_angle;
	}
	sprite_index = sprHarpoon;
}

throwTime = 30;
throwCounter = throwTime;
//throwing towards target point
stateThrow = function(){
	//if onPlayer is still true (throw just happened, set xMovement and yMovement)
	if(onPlayer){
		xMovement = (targetX - startX)/throwTime;
		yMovement = (targetY - startY)/throwTime;
	}
	//tell harpoon that it isn't on the player anymore
	onPlayer = false;
	
	//move towards the target direction until target is reached
	x += xMovement;
	y += yMovement;
	throwCounter--;
	
	//once target is reached, reset vars and set to stateReel
	if(throwCounter <= 0){
		throwCounter = throwTime;
		state = stateReel;
	}
}

//come back to player
stateReel = function(){
	if(mouse_check_button(mb_left) && x != startX && y != startY){
		x -= xMovement;
		y -= yMovement;
	}
	
	//once back to player, set back to idle state
	if((x > startX - 3 && x < startX + 3) + (y > startY - 3 && y < startY + 3)){ //floating point cushioning
		x = startX;
		y = startY;
		onPlayer = true;
		state = statePoint;
		instance_destroy(myHitBox);
	}
	sprite_index = sprHarpoonReel;
}

hitTime = 8;
hitCounter = hitTime;
//for a certain number of frames, do hit animation
stateHit = function(){
	hitCounter--;
	image_angle += 3;
	
	//once animation is over, reset vars and go back to idle state
	if(hitCounter <= 0){
		hitCounter = hitTime;
		state = statePoint;
		instance_destroy(myHitBox);
	}
}

state = statePoint;