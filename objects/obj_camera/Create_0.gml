w_scale = 1200;
h_scale = 675;

scale = .75;
if(room == Boss){scale = 1;}

view_visible[0] = true;
view_enabled = true;

cam = view_camera; //camera_create_view(0, 0, w_scale * scale, h_scale * scale);
view_set_camera(0, cam);
camera_set_view_size(cam, w_scale * scale, h_scale * scale);

cam_origin = [camera_get_view_width(cam)/2, camera_get_view_height(cam)/2];

surface_resize(application_surface, w_scale * scale, h_scale * scale);


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

instance_focusing = obj_player;
