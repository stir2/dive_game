event_inherited();

spawn = new vec2(x, y);
vel = new vec2(0, 0);
target_vel = new vec2(0, 0);

sprite_index = choose(spr_sanddollar_yellow, spr_sanddollar_blue, spr_sanddollar_pink);

state = "uncollected";

VEL_TRANSITION_MULT = 0.005;
WANDER_COOLDOWN = 1 * 60;
WANDER_STRENGTH = 1;
SPAWN_LOCATION_INFLUENCE = 0.7;

mask_index = spr_sanddollar_yellow;

function vec2(_x, _y) constructor {
    x = _x;
    y = _y;
}

player = noone;



spawn = {x, y};
wander_range = 10;
wander_target_x = random_range(-wander_range + spawn.x, wander_range + spawn.x);
wander_target_y = random_range(-wander_range + spawn.y, wander_range + spawn.y);

wander_distance = 0;

wander_time = infinity;
wander_counter = infinity;

wander_slow_down = false;


//Enemies set this speed in their create events
move_speed = .001;
move_speed_max = 1;