// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Function Sets the current shader to the palette swap shader. Make sure to call shader_reset when finished. 
/// @param {asset.gmsprite} _defaultPalette An image of the palette that will be referenced by the shader.
/// @param {real} [_alphaVal] The current alpha of the sprite, you can simply input image_alpha here.
/// @param {asset.gmsprite, array} [_swappingPalette] The palette the shader will swap the sprite to. If you are inputing an array insert the sprite as the first element and the image_index of the second element.
/// @param {asset.gmsprite, array} [_effectPalette1] This acts an extra palette swap. The higher the number the higher the priority. If you are inputing an array insert the sprite as the first element and the image_index of the second element.
/// @param {asset.gmsprite, array} [_effectPalette2] This acts an extra palette swap. The higher the number the higher the priority. If you are inputing an array insert the sprite as the first element and the image_index of the second element.
/// @param {asset.gmsprite, array} [_overlayColor] This will be a color that is overlayed over the entire sprite. If you are inputing an array insert the sprite as the first element and the image_index of the second element.
function scrSetPaletteSwapShader(_defaultPalette, _alpha = 1, _swappingPalette = _defaultPalette, 
_effectPalette1 = spr_palette_blank, _effectPalette2 = spr_palette_blank, _overlayColor = spr_palette_blank){
	//Call Shader Set
	shader_set(shdPalleteSwap);
	
	//--Set Base Pallete--//
	var _uBasePallete =  shader_get_sampler_index(shdPalleteSwap, "uBasePallete");
	var _spr = sprite_get_texture(_defaultPalette, 0);
	texture_set_stage(_uBasePallete, _spr);
	
	
	//--Set Alpha value--// 
	var _uAlpha = shader_get_uniform(shdPalleteSwap, "uAlpha");
	shader_set_uniform_f(_uAlpha, _alpha);
	
	
	//--Set Replacement Pallete--//
	var _uSwapPallete =  shader_get_sampler_index(shdPalleteSwap, "uPalleteSwaping");
	
	//If array was inputed, access the elements in it.
	if (is_array(_swappingPalette)) var _spr = sprite_get_texture(_swappingPalette[0], _swappingPalette[1]); 
	//Default use case
	else var _spr = sprite_get_texture(_swappingPalette, 0);
	
	//Set the texture Stage
	texture_set_stage(_uSwapPallete, _spr);



	//--Set Effect Pallete 1--//
	var _uEffectPallete =  shader_get_sampler_index(shdPalleteSwap, "uPalleteEffect");
	
	//If array was inputed, access the elements in it.
	if (is_array(_effectPalette1)) var _spr = sprite_get_texture(_effectPalette1[0], _effectPalette1[1]); 
	//Default use case
	else var _spr = sprite_get_texture(_effectPalette1, 0);
	
	//Set the texture Stage
	texture_set_stage(_uEffectPallete, _spr);
	
	
	//--Set Effect Pallete 2--//
	var _uEffectPallete2 =  shader_get_sampler_index(shdPalleteSwap, "uPalleteEffect2");
	
	//If array was inputed, access the elements in it.
	if (is_array(_effectPalette2)) var _spr = sprite_get_texture(_effectPalette2[0], _effectPalette2[1]); 
	//Default use case
	else var _spr = sprite_get_texture(_effectPalette2, 0);
	
	//Set the texture Stage
	texture_set_stage(_uEffectPallete2, _spr);
	
	
	//--Set The Overlay Color--//
	var _uColorOverlay =  shader_get_sampler_index(shdPalleteSwap, "uColorOverlay");
	
	//If array was inputed, access the elements in it.
	if (is_array(_overlayColor)) var _spr = sprite_get_texture(_overlayColor[0], _overlayColor[1]); 
	//Default use case
	else var _spr = sprite_get_texture(_overlayColor, 0);
	
	//Set the texture Stage
	texture_set_stage(_uColorOverlay, _spr);


}