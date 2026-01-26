if(!initialized){
	if(instance_exists(obj_camera)){
		cam_origin[0] = obj_camera.cam_origin[0];
		cam_origin[1] = obj_camera.cam_origin[1];
		initialized = true;
	} else {
		return;
	}
}

x = bg_origin[0] + (camera_get_view_x(view_camera[0]) - cam_origin[0]) * PARALLAX_RATIO;
y = bg_origin[1] + (camera_get_view_y(view_camera[0]) - cam_origin[1]) * PARALLAX_RATIO;