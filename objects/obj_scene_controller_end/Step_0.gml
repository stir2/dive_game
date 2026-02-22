if((keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any)) && next_buff <= 0){
	scene++;
    next_buff = buffer_time;
	
	if(scene > last_scene){
		room_goto(rm_main_menu_new);
	}
}

if(instance_exists(obj_scenes_end)){
	obj_scenes_end.image_index = scene;
}

if(next_buff > 0){next_buff--;}