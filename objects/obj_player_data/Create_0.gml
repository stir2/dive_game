player_tank_size = 40;
player_air_use_time = 40;
player_harpoon_damage = 1;
player_harpoon_attack_speed = 1;
player_harpoon_reel_speed = 7.5;
currency_count = 0;

reset_player_data = function() { 
	player_tank_size = 40;
	player_air_use_time = 40;
	player_harpoon_damage = 1;
	player_harpoon_attack_speed = 1;
	player_harpoon_reel_speed = 7.5;
	currency_count = 0;
}

apply_changes_to_player = function () { 
	if (instance_exists(obj_player)){
		with (obj_player) {
			tank_size = obj_player_data.player_tank_size;
			air_use_time = obj_player_data.player_air_use_time;
			harpoon_damage = obj_player_data.player_harpoon_damage;
			harpoon_speed = obj_player_data.player_harpoon_attack_speed;
			harpoon_reel_speed = obj_player_data.player_harpoon_reel_speed;
		}
	}
}