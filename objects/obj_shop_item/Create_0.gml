/// @description Insert description here
// You can write your code in this editor
enum ITEM {
	tank_up,
	air_use_down,
	reel_up,
	attack_speed_up,
	attack_power_up
}
image_index = item_type;
curr_level = global.item_levels[item_type];
max_level = global.item_level_cap;
price = global.item_prices[item_type];

description = "";
switch(item_type){
	case ITEM.tank_up: {description = "Tank Capacity";} break;
	case ITEM.air_use_down: {description = "Air Usage";} break;
	case ITEM.reel_up: {description = "Reel Speed";} break;
	case ITEM.attack_speed_up: {description = "Attack Speed";} break;
	case ITEM.attack_power_up: {description = "Attack Power";} break;
}

buy = function(){
	if(obj_player.sanddollars >= price){
		obj_player.sanddollars -= price;
		curr_level++;
		global.item_levels[item_type] = curr_level;
		price *= 3;
		global.item_prices[item_type] = price;
	}
}