if(instance_exists(obj_player)){
	x = obj_player.x - cam_origin[0] - (x_offset * -obj_player.x_speed);
	y = obj_player.y - cam_origin[1] - (y_offset * -obj_player.y_speed);
}

var _old_cam_x = camera_get_view_x(cam);
var _old_cam_y = camera_get_view_y(cam);
var _new_cam_x = x;
var _new_cam_y = y;
var _set_cam_x = (_old_cam_x * x_bias + _new_cam_x)/(x_bias + 1);
var _set_cam_y = (_old_cam_y * y_bias + _new_cam_y)/(y_bias + 1);
camera_set_view_pos(cam, _set_cam_x, _set_cam_y);