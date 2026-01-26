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
		switch(item_type){
			case ITEM.tank_up: {
				//Action
				obj_player_data.player_tank_size += 10 * curr_level;
			} 
			break;
			case ITEM.air_use_down: {
				//Action
				obj_player_data.player_air_use_time += 10 * curr_level;
			} 
			break;
			case ITEM.reel_up: {
				//Action
				obj_player_data.player_harpoon_reel_speed += 2 * curr_level;
			} 
			break;
			case ITEM.attack_speed_up: {
				//Action
				obj_player_data.player_harpoon_attack_speed += 2 * curr_level;
			} 
			break;
			case ITEM.attack_power_up: {
				//Action
				obj_player_data.player_harpoon_damage = 1.5 * curr_level;
			} 
			break;
		}
		
		obj_player_data.apply_changes_to_player();
		
		//Update the purchase level item and hike price accordinly
		curr_level++;
		global.item_levels[item_type] = curr_level;
		price *= 3;
		global.item_prices[item_type] = price;
	}
}