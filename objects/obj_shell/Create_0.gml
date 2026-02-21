/// @description Insert description here
// You can write your code in this editor

event_inherited();

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
move_speed_max = .5;