/// @description Insert description here
// You can write your code in this editor
//Set angle speed using function
angle_speed = speed_adjust_by(angle_speed, .1, 20, 1);

//Use speed at angle to ensure the distance covered stays the same.
set_speed_at_angle(angle_speed, angle_direction);
angle_direction += 20;

//And speed values
y += y_speed;
x += x_speed;