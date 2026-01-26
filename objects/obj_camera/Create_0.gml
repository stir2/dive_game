scale = .75
if(room == Boss){scale = 1;}
cam = camera_create_view(0, 0, 1200 * scale, 675 * scale);
view_visible[0] = true;
view_enabled[0] = true;
view_set_camera(0, cam);

cam_origin = [camera_get_view_width(cam)/2, camera_get_view_height(cam)/2];


x_offset = 32;
y_offset = 23;

x_speed = 0;
y_speed = 0;

// this value is how much the camera prefers its previous position, making transitions smoother
x_bias = 20;
y_bias = 16;

if(instance_exists(obj_player)){
	if(room != Shop){
		x = obj_player.x;
		y = obj_player.y;
		camera_set_view_pos(cam, x, y);
	}else{
		camera_set_view_pos(cam, 1148, 732);
	}
}
