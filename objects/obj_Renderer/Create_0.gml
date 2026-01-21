gpu_set_texfilter(false);

in_water = false;

distort1_str = 0;
distort2_str = 0;
glint_color =  [ 0.00,0.00,0.00,0 ];
glow_str = 0;

latest_transition_t = -1000;
blur_str = 0;

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

// Effect constants for when the player is in air
DISTORT1_STR_AIR = 0.1;
DISTORT2_STR_AIR = 0.1;
GLINT_COLOR_AIR = [ 0.00,0.00,0.00,0 ];
GLOW_STR_AIR = 0.1;

fx_glow = layer_get_fx("Effect_Glow");
fx_underwater = layer_get_fx("Effect_Underwater");
fx_blur = layer_get_fx("Effect_Blur");

params_glow = fx_get_parameters(fx_glow);
params_underwater = fx_get_parameters(fx_underwater);
params_blur = fx_get_parameters(fx_blur);

params_glow.g_GlowQuality = GLOW_QUALITY;
params_glow.g_GlowRadius = GLOW_RADIUS;

fx_set_parameters(fx_glow, params_glow);

show_debug_message(fx_get_parameter_names(fx_underwater));