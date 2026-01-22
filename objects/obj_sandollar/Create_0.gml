spawn = new vec2(x, y);
vel = new vec2(0, 0);
target_vel = new vec2(0, 0);

state = "uncollected";

VEL_TRANSITION_MULT = 0.005;
WANDER_COOLDOWN = 1 * 60;
WANDER_STRENGTH = 1;
SPAWN_LOCATION_INFLUENCE = 0.7;

mask_index = spr_sandollar;

function vec2(_x, _y) constructor {
    x = _x;
    y = _y;
}