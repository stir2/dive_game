if(keyboard_check_pressed(vk_anykey)){
	scene++;
	
	if(scene > last_scene){
		room_goto(Level1);
	}
}

if(instance_exists(obj_scenes_intro)){
	obj_scenes_intro.image_index = scene;
}