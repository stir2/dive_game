/// @description Insert description here
// You can write your code in this editor
show_debug_message("created");
depth = 105;
button_active = 0;

up = 0;
down = 0;
left = 0;
right = 0;
select = 0;

button_height = 96;

buttons = [];

//create them
sfx_sldr = instance_create_layer(x, y, "Instances", obj_slider, {sfx : true});
array_push(buttons, sfx_sldr);
mus_sldr = instance_create_layer(x, y + button_height, "Instances", obj_slider, {sfx : false});
array_push(buttons, mus_sldr);
fullscr_btn = instance_create_layer(x, y + button_height * 2, "Instances", obj_settings_button, {action_type : 0});
array_push(buttons, fullscr_btn);

// if im a main menu, create exit button, if im a pause menu, create resume and main menu buttons
if(!pause_menu){
	exit_btn = instance_create_layer(x, y + button_height * 3, "Instances", obj_settings_button, {action_type : 1});
	array_push(buttons, exit_btn);
}
else{
	resume_btn = instance_create_layer(x - 150, y + button_height * 3, "Instances", obj_settings_button, {action_type : 2});
	array_push(buttons, resume_btn);
	main_menu_btn = instance_create_layer(x + 150, y + button_height * 3, "Instances", obj_settings_button, {action_type : 3});
	array_push(buttons, main_menu_btn);
}

destroy_self = function(){instance_destroy();}