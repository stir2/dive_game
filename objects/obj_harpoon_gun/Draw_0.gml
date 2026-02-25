/// @description Insert description here
// You can write your code in this editor
draw_self();
//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
//draw_circle(x, y, 2, true);

if (obj_controller.controllerPad != -1) {
	draw_sprite(spr_reticle, 0, 
	x + lengthdir_x(100, image_angle), 
	y + lengthdir_y(100, image_angle));
}