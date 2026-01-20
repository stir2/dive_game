spawn = new vec2(x, y);
vel = new vec2(0, 0);
target_vel = new vec2(0, 0);

latest_t_popped = -1000;
latest_t_unpopped = -1000;
latest_t_wandered = -1000;
state = "unpopped";
in_water = true;

VEL_TRANSITION_MULT = 0.005;
BOUNCE_STRENGTH = 0.7;
RESPAWN_COOLDOWN = 10 * 60;
WANDER_COOLDOWN = 1 * 60;
WANDER_STRENGTH = 1;
SPAWN_LOCATION_INFLUENCE = 0.7;
POP_ANIM_LENGTH = 8;

mask_index = spr_bubble;

function vec2(_x, _y) constructor {
    x = _x;
    y = _y;
}

function random_range(_a, _b){
	return random(_a - _b) - _b;
}

function pop(){
	state = "popped";
	latest_t_popped = global.t;
	mask_index = sprNoHitBox;
	// begin pop animation
}

function respawn(){
	state = "respawning";
	latest_t_unpopped = global.t;
	x = spawn.x;
	y = spawn.y;
	visible = true;
	// begin reverse pop animation
}

function animBuffer(){
	if(state == "popped"){
		if(global.t - latest_t_popped > POP_ANIM_LENGTH){
			visible = false;
		}
	} else if(state == "respawning") {
		if(global.t - latest_t_unpopped > POP_ANIM_LENGTH){
			mask_index = spr_bubble;
			state = "unpopped";
		}
	}
}