if(keyboard_check_pressed(vk_anykey)){
	scene++;
	
	if(scene > last_scene){
		room_goto(Level1);
	}
}

if(instance_exists(obj_scenes_end)){
	obj_scenes_end.image_index = scene;
}