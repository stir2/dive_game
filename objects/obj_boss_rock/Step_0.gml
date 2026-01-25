/// @description Insert description here
// You can write your code in this editor

if(y > 1340 && !bubble_made){instance_create_layer(x, y, "Instances", obj_bubble_medium); bubble_made = true;}
y += yspeed;
lifetime--;
if(lifetime <= 0){instance_destroy();}