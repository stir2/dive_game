tiles_active = global.levels_beaten - 1;
if (tiles_active < 0) tiles_active = 1;

disable_all_layers(); // Set only the tile layers visible for this level
layer_set_visible(wall_layers[tiles_active], true);
layer_set_visible(stalagmite_layers[tiles_active], true);