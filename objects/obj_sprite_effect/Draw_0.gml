/// @description Insert description here
// You can write your code in this editor
if (defaultPalette != noone && swappingPalette != noone) { 
	scrSetPaletteSwapShader(defaultPalette, image_alpha, swappingPalette);
}

draw_self();

shader_reset();