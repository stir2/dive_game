/// @description Insert description here
// You can write your code in this editor

//left = 0;
//right = 0;
//up = 0;
//down = 0;
//select = 0;

on_exit = false;

using_controller = (obj_controller.controllerPad != -1);

items = [];
for(var _i = 0; _i < instance_number(obj_shop_item); _i++){
	var _item = instance_find(obj_shop_item, _i);
	array_push(items, _item);
}

item_active = 0;
buffer = 10;