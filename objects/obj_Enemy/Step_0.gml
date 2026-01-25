event_inherited();
if(hp <= 0){state = stateDead;}

if (state != state_wander) spawn = {x, y};
wander_distance = point_distance(x, y, wander_target_x, wander_target_y);
if (scrCalculateDistanceSlowingDown(angle_speed, move_speed) >= wander_distance || wander_counter < 1){
	wander_slow_down = true;
}
else wander_counter--;
