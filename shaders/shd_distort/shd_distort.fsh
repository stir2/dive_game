//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Variable for distortion wiggling over time
uniform float u_time;
uniform float u_strength;

void main()
{
    vec2 uv = v_vTexcoord;

    uv.x += sin(uv.y * 20.0 + u_time * 2.0) * 0.01 * u_strength;
    uv.y += cos(uv.x * 15.0 + u_time * 1.5) * 0.01 * u_strength;
	
	

    gl_FragColor = texture2D(gm_BaseTexture, uv);
}
