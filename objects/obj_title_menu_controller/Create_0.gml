/// @description Insert description here
// You can write your code in this editor
using_controller = true;
button_active = 0;
suspension_buffer = 0;

//if something else using the controller rn
suspended = false;

up = 0;
down = 0;
select = 0;

button_height = 96;

buttons = [];

for(var _i = 0; _i < 4; _i++){
	var _b = instance_create_layer(x, y + (_i * button_height), "Instances", obj_title_menu_button, {action_type : _i});
	array_push(buttons, _b);
	//show_debug_message("pushed");
}