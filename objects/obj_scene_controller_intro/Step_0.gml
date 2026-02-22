if((keyboard_check_pressed(vk_anykey) || mouse_check_button_pressed(mb_any) || obj_controller.check_input_pressed(Inputs.Confirm)) && next_buff <= 0){
	scene++;
	next_buff = buffer_time;
	
	if(scene > last_scene){
		room_goto(Level1);
	}
}

if(instance_exists(obj_scenes_intro)){
	obj_scenes_intro.image_index = scene;
}

if(next_buff > 0){next_buff--;}