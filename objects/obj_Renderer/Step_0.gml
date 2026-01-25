if(layer_exists("Effect_Glow") && layer_exists("Effect_Underwater") && layer_exists("Effect_Underwater") && layer_exists("Effect_Underwater")){
	if(in_water != obj_player.in_water){
		latest_transition_t = global.t;
		blur_str = 0;
	}

	if(global.t - latest_transition_t < TRANSITION_DURATION / 2){
		fx_blur.visible = true;
		blur_str += (TRANSITION_BLUR_STR - blur_str) * TRANSITION_MULT;
		params_blur.g_Radius = blur_str;
		fx_set_parameters(fx_blur, params_blur);
	} else if(global.t - latest_transition_t < TRANSITION_DURATION){
		fx_blur.visible = true;
		blur_str += (NORMAL_BLUR_STR - blur_str) * TRANSITION_MULT;
		params_blur.g_Radius = blur_str;
		fx_set_parameters(fx_blur, params_blur);
	} else {
		fx_blur.visible = false;
		params_blur.g_Radius = 0;
		fx_set_parameters(fx_blur, params_blur);
	}

	in_water = obj_player.in_water;

	if(in_water){
		distort1_str += (DISTORT1_STR_WATER - distort1_str) * TRANSITION_MULT;
		distort1_str += (DISTORT2_STR_WATER - distort2_str) * TRANSITION_MULT;
		glow_str += (GLOW_STR_WATER - glow_str) * TRANSITION_MULT;
	
		for(i = 0; i < array_length(vignette_edges); i++){
			vignette_edges[i] += (VIGNETTE_EDGES_WATER[i] - vignette_edges[i]) * TRANSITION_MULT;
		}
	} else {
		distort1_str += (DISTORT1_STR_AIR - distort1_str) * TRANSITION_MULT;
		distort1_str += (DISTORT2_STR_AIR - distort2_str) * TRANSITION_MULT;
		glow_str += (GLOW_STR_AIR - glow_str) * TRANSITION_MULT;
	
		for(i = 0; i < array_length(vignette_edges); i++){
			vignette_edges[i] += (VIGNETTE_EDGES_AIR[i] - vignette_edges[i]) * TRANSITION_MULT;
		}
	}

	params_underwater.g_Distort1Amount = distort1_str;
	params_underwater.g_Distort2Amount = distort2_str;
	params_underwater.g_GlintCol = glint_color;
	params_glow.g_GlowIntensity = glow_str;
	params_vignette.g_VignetteEdges = vignette_edges;

	fx_set_parameters(fx_underwater, params_underwater);
	fx_set_parameters(fx_glow, params_glow);
	fx_set_parameters(fx_vignette, params_vignette);
}
show_debug_message(vignette_edges);