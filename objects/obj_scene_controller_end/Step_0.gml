if(keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)){
	scene++;
	
	if(scene > last_scene){
		room_goto(rm_main_menu);
	}
}

if(instance_exists(obj_scenes_end)){
	obj_scenes_end.image_index = scene;
}