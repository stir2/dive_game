/// @description Insert description here
// You can write your code in this editor
up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);
left = keyboard_check_pressed(vk_left);
right = keyboard_check_pressed(vk_right);
select = keyboard_check_pressed(vk_space);

if(right && !on_exit){item_active = clamp(item_active + 1, 0, array_length(items) - 1);}
if(left && !on_exit){item_active = clamp(item_active - 1, 0, array_length(items) - 1);}
if(up){on_exit = false;}
if(down){on_exit = true;}
	
if(select && buffer <= 0){
	if(!on_exit){items[item_active].buy();}
	else{
		obj_player.in_shop = false;
		obj_shopkeeper.buffer = 10;
		instance_destroy();
	}
}

if(buffer > 0){buffer--;}