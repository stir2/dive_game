if (keyboard_check_pressed(vk_space)) start_screen_shake(30);
var _x_offset = 0;
var _y_offset = 0
if (screenShakeCounter > 0) { 
	screenShakeCounter--;
	_x_offset = random_range(-screenShakeRange, screenShakeRange);
	_y_offset = random_range(-screenShakeRange, screenShakeRange);
	
	
}

if(instance_exists(instance_focusing) && room != Shop){
	x = instance_focusing.x - cam_origin[0] - (x_offset * -instance_focusing.x_speed);
	y = instance_focusing.y - cam_origin[1] - (y_offset * -instance_focusing.y_speed);


	var _old_cam_x = camera_get_view_x(cam);
	var _old_cam_y = camera_get_view_y(cam);
	var _new_cam_x = clamp(x, 0, room_width);
	var _new_cam_y = clamp(y, 0, room_height);
	var _set_cam_x = (_old_cam_x * x_bias + _new_cam_x)/(x_bias + 1);
	var _set_cam_y = (_old_cam_y * y_bias + _new_cam_y)/(y_bias + 1);
	
	camera_set_view_pos(cam, _set_cam_x, _set_cam_y);
}

camera_set_view_pos(cam, clamp(camera_get_view_x(cam) + _x_offset, 0, room_width), clamp(camera_get_view_y(cam) + _y_offset, 0, room_height));