wall_layers = [ layer_get_id("Tile_Walls_1"), 
				layer_get_id("Tile_Walls_2"),
				layer_get_id("Tile_Walls_3") ];
				
stalagmite_layers = [	layer_get_id("Tile_Stalagmites_1"), 
						layer_get_id("Tile_Stalagmites_2"),
						layer_get_id("Tile_Stalagmites_3") ];
						
function disable_all_layers(){
	for(i = 0; i < array_length(wall_layers); i++){
		layer_set_visible(wall_layers[i], false);
		layer_set_visible(stalagmite_layers[i], false);
	}
}