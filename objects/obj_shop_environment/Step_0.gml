var tiles_active = clamp(global.levels_beaten - 1, 0, 2);


disable_all_layers(); // Set only the tile layers visible for this level
layer_set_visible(wall_layers[tiles_active], true);
layer_set_visible(stalagmite_layers[tiles_active], true);

if(instance_exists(obj_background_shop)){
	switch(tiles_active){
		case 0: obj_background_shop.sprite_index = spr_airbg1; break;
		case 1: obj_background_shop.sprite_index = spr_airbg2; break;
		case 2: obj_background_shop.sprite_index = spr_airbg3; break;
	}
}
