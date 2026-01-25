//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
//vec4 black = vec4(0., 0., 0., 1.);
//vec4 white = vec4(1., 1., 1., 1.);

uniform sampler2D uBasePallete; //The Pallete to reference colors from 
uniform sampler2D uPalleteSwaping; //The Pallete to swap colors to, set 

//Effect Palletes effect the final color, uses the mix function at the end. 
uniform sampler2D uPalleteEffect; //Effect Pallete will blend with the final color
uniform sampler2D uPalleteEffect2; //Effect Pallete will blend with the final color
uniform sampler2D uColorOverlay; //Effect Pallete will blend with the final color

//Will be devided by the current color alpha. 
uniform float uAlpha; //Set this to the uAlpha value of the object using this shader


float uPalleteSize = 50.0;
float MAX_PALLETE = 50.0;
int colorMatches = 0; //Boolean
float indexToSwap = 0.0;
//float redShift = (6./23.);

/* Potetial Solutions to Pallete swap issue. 
 * 1.
 * Have a limit of colors we can use, such as a max pallete of 50 or something and use a for loop with a set iteration count
 * Yeah this seems like the best option :) 
 * 2. 
 * IDK I think idea one is the best tbh :/
*/

void main() {
	// get the current color and use it as our index for our index recolor
	vec4 currentColor = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 color = texture2D(uBasePallete, vec2(0, 0));
	
	for (float i = 0.0; i <= MAX_PALLETE; i += 1.0) { 
		//Check the colorsMatche boolean, if true then stop changes
		indexToSwap = (colorMatches == 0)? (i/uPalleteSize) : indexToSwap;
		color = (colorMatches == 0)? texture2D(uBasePallete, vec2(indexToSwap, 0)) : color;
		colorMatches = (color == currentColor)? 1 : 0; //If colors match set to true to stop changes
	} 
	
	
	
	//Use indexToSwap to swap out the color were currently on
	vec4 newColor = texture2D(uPalleteSwaping, vec2(indexToSwap, 0));
	newColor = (colorMatches == 1)? newColor : currentColor;	
	
	//Get the effect pattern
	vec4 effectColor = texture2D(uPalleteEffect, vec2(indexToSwap, 0));
	effectColor = (colorMatches == 1)? effectColor : vec4(0.);
	
	//Get the 2nd effect pattern
	vec4 effectColor2 = texture2D(uPalleteEffect2, vec2(indexToSwap, 0));
	effectColor2 = (colorMatches == 1)? effectColor2 : vec4(0.);
	
	//get the overlay color, this will be added last
	vec4 colorOverlay = texture2D(uColorOverlay, vec2(0, 0));
	//colorOverlay = (colorMatches == 1)? colorOverlay : vec4(0.);
	
	//color = (nextColor == 1)? texture2D(uBasePallete, vec2((index.r + index.g + index.b)/3. + (1./23.), 0)) : color;
	
	//color = (color.rgb != index.rgb)? vec4(1., 1., 1., 1.) : color;
	
	//
	//vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
	//vec4 palColor = texColor;
	//palColor.rgb = texture2D(orginalPallete, vec2(0.7, 0.)).rgb;
	//texColor = palColor;
	//texColor = (((1. - texColor.r) + (1. - texColor.g) + (1. - texColor.b) + (1. - texColor.a)) == 3.)? white : texColor;
	//texColor = (0. == 0.)? white : texColor;
	//texColor = vec4(1., 1., 1., 1.);
	
    gl_FragColor = vec4(newColor.rgb, newColor.a * uAlpha);
	
	//Blend in the effect palette
	gl_FragColor.rgb = mix(gl_FragColor.rgb, effectColor.rgb, effectColor.a);
	
	//Blend in the second effect palette
	gl_FragColor.rgb = mix(gl_FragColor.rgb, effectColor2.rgb, effectColor2.a);
	
	//Add the overlay color. 
	gl_FragColor.rgb = mix(gl_FragColor.rgb, colorOverlay.rgb, colorOverlay.a);
}
