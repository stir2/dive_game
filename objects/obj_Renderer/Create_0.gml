gpu_set_texfilter(false);

in_water = false;

distort1_str = 0;
distort2_str = 0;
glint_color =  [ 0.00,0.00,0.00,0 ];
vignette_edges = [0, 0];
glow_str = 0;

latest_transition_t = -1000;
blur_str = 0;

// GUI constants
//CURRENCY_UI_POS = vec2(20, view_hport - 120);

//Effect constants for all times
GLOW_QUALITY = 3;
GLOW_RADIUS = 256;

// Effect constants for blur transition
TRANSITION_DURATION = 0.5 * 60;
TRANSITION_BLUR_STR = 4;
NORMAL_BLUR_STR = 0;
TRANSITION_MULT = 0.2;

// Effect constants for when the player is in water
DISTORT1_STR_WATER = 1;
DISTORT2_STR_WATER = 1;
GLINT_COLOR_WATER = [ 0.00,0.00,0.00,0 ];
GLOW_STR_WATER = 0.225;
VIGNETTE_EDGES_WATER = [ 0.67,1.30 ];

// Effect constants for when the player is in air
DISTORT1_STR_AIR = 0.1;
DISTORT2_STR_AIR = 0.1;
GLINT_COLOR_AIR = [ 0.00,0.00,0.00,0 ];
GLOW_STR_AIR = 0.075;
VIGNETTE_EDGES_AIR = [ 0.95,1.30 ];

function fx_undefined(){
	return fx_glow == noone
	|| fx_underwater == noone
	|| fx_blur == noone
	|| fx_vignette == noone
	
	|| fx_glow == -1
	|| fx_underwater == -1
	|| fx_blur == -1
	|| fx_vignette == -1
}

function vec2(_x, _y) constructor {
    x = _x;
    y = _y;
}

function fx_detect(){
	fx_glow = layer_get_fx("Effect_Glow");
	fx_underwater = layer_get_fx("Effect_Underwater");
	fx_blur = layer_get_fx("Effect_Blur");
	fx_vignette = layer_get_fx("Effect_Vignette");
	
	if(fx_undefined()){
		return;
	}
	
	params_glow = fx_get_parameters(fx_glow);
	params_underwater = fx_get_parameters(fx_underwater);
	params_blur = fx_get_parameters(fx_blur);
	params_vignette = fx_get_parameters(fx_vignette);
}

function fx_display(){
	all_layers = layer_get_all();
	show_debug_message("Blur:" + string(fx_blur) + ", Params: " + string(params_blur));
	show_debug_message("Glow:" + string(fx_glow) + ", Params: " + string(params_glow));
	show_debug_message("Vignette:" + string(fx_blur) + ", Params: " + string(params_vignette));
	show_debug_message("Underwater:" + string(fx_glow) + ", Params: " + string(params_underwater));
}

fx_glow = layer_get_fx("Effect_Glow");
fx_underwater = layer_get_fx("Effect_Underwater");
fx_blur = layer_get_fx("Effect_Blur");
fx_vignette = layer_get_fx("Effect_Vignette");

if(fx_undefined()){
	exit;
}

params_glow = fx_get_parameters(fx_glow);
params_underwater = fx_get_parameters(fx_underwater);
params_blur = fx_get_parameters(fx_blur);
params_vignette = fx_get_parameters(fx_vignette);

params_glow.g_GlowQuality = GLOW_QUALITY;
params_glow.g_GlowRadius = GLOW_RADIUS;
fx_set_parameters(fx_glow, params_glow);