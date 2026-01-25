/// @description Insert description here
// You can write your code in this editor

event_inherited();
state();
if(hp <= hp_max/2 && !attack_speed_adjusted_half_health){
	attack_cooldown = 4*60;
	attack_speed_adjusted_half_health = true;
}

if(hp <= hp_max/2 && !attack_speed_adjusted_fourth_health){
	attack_cooldown = 3*60;
	attack_speed_adjusted_fourth_health = true;
}