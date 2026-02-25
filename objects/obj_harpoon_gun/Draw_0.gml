/// @description Insert description here
// You can write your code in this editor
draw_self();
//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
//draw_circle(x, y, 2, true);


if ( obj_controller.controllerPad != -1  ) { 
	if (harpoon_loaded) {
		reticle_alpha = clamp(reticle_alpha + .1, 0, 1);
	}
	else { 
	
		reticle_alpha = clamp(reticle_alpha - .1, 0, 1);
	}

	draw_sprite_ext(spr_reticle, 0, x + lengthdir_x(60, image_angle), y + lengthdir_y(60, image_angle), 1, 1, image_angle, c_white, reticle_alpha);
}