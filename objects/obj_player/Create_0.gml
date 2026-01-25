event_inherited();

{ // Define input macros
	#macro RIGHT 0
	#macro LEFT 1
	#macro UP 2
	#macro DOWN 3
	#macro SH_ATK 4
	#macro LN_ATK 5
	#macro PROPEL 6
}

hp = infinity;

death_timer = 60;

//Rewrite tookdamage script 
tookDamage = function() {
	air_level -= 5;
	latest_t_hurt = global.t;
	image_index = 0; // Reset animation frame just in case we were hurt previously
}

myHurtbox = instance_create_depth(x, y, 0, obj_HurtBox, new HurtBox(id, true, bbox_left, bbox_top, bbox_right, bbox_bottom));


// Define control constants
controls = [
	ord("D"),
	ord("A"),
	ord("W"),
	ord("S"),
	mb_left,
	mb_right,
	vk_space
];

// key_down(KEY) is true when KEY is held
key_down = [false, false, false, false, false, false];
// key_pressed(KEY) is true for one frame when KEY is pressed
key_pressed = [false, false, false, false, false, false];
// latest_t_pressed(KEY) last time each key was pressed.
// Useful for conflicting keys like left/right.
latest_t_pressed = [-1000, -1000, -1000, -1000, -1000, -1000];
latest_t_hurt = -1000;

// 2D vector structs are so useful
function vec2(_x, _y) constructor {
    x = _x;
    y = _y;
}

max_speed = new vec2(3, 10);
in_water = true;
grounded = false;
tank_size = 5000;

// Vars for the player's current state, whether in water or air, set these each step
//vel = new vec2(0, 0);
accel = new vec2(0, 0);
decel = new vec2(0, 0);
jump_height = 0;
grav = 0;
air_level = tank_size;

// Misc constats for all times
COYOTE_FRAMES = 4;
JUMP_BUFFER = 4;
HURT_ANIM_DURATION = 47;
PLAYER_SCALE = 1;

// Physics constants to use when the player is in water
ACCEL_WATER = new vec2(0.5, 0.6);
DECEL_WATER = new vec2(0.9, 0.9);
JUMP_HEIGHT_WATER = 10;
GRAV_WATER = 0.2;

// Physics constants to use when the player is in air
ACCEL_AIR = new vec2(0.6, 0);
DECEL_AIR = new vec2(0.9, 0.95);
JUMP_HEIGHT_AIR = 10;
GRAV_AIR = 0.6;

// Time counter to increment every frame
t = 0;

horiz_input = 0;


//Create harpoon object with this obj as anchor
instance_create_layer(x, y, "Instances", obj_harpoon, {my_player : id});

function setAnimationFrame(){
	
	var index_before = sprite_index;
	
	if(in_water){
		if(key_down[UP] && abs(y_speed) > abs(x_speed)){
			sprite_index = spr_diver_swim_up;
		} else if (horiz_input == 0){
			sprite_index = spr_diver_swim_idle;
		} else {
			sprite_index = spr_diver_swim_right;
		}
	} else {
		if(horiz_input == 0){
			sprite_index = spr_diver_air_idle;
		} else {
			sprite_index = spr_diver_walk_right;
		}
	}
	
	if(global.t - latest_t_hurt < HURT_ANIM_DURATION){
		sprite_index = spr_diver_hurt;
	}
	
	if(air_level <= 0){
		sprite_index = spr_diver_death;
	}
	
	if(horiz_input != 0) image_xscale = horiz_input;
	//mask_index = spr_diver_swim_idle
	
	
	
	if(index_before != sprite_index){
		image_index = 0; // Reset animation frame each time it switches
	}
}
//Create instance of camera
instance_create_layer(x, y, "Instances", obj_camera);
