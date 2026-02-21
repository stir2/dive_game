/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(instance_exists(myAnchor)){
	angle_direction += angle_difference(point_direction(x, y, myAnchor.x, myAnchor.y), angle_direction)/10;
	set_speed_at_angle(my_speed, angle_direction);
	if (place_meeting(x, y, myAnchor)) { 
		obj_hud.sanddollars += add_amount;
		instance_destroy(myAnchor);
	}
}
else{instance_destroy();}
instance_create_depth(x, y, -1000, obj_sprite_effect, {sprite_index : effect_sprite});

x += x_speed;
y += y_speed;