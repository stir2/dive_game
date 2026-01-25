if (sprite_index == spr_harpoon_gun_shoot) { 
	sprite_index = spr_harpoon_gun;
}

if (sprite_index == spr_harpoon_gun_stab) { 
		state = state_point;
		instance_destroy(myHitBox);
		
		//Set loaded variable to true for next attack
		harpoon_loaded = true;
		
		sprite_index = spr_harpoon_gun_loaded;
}