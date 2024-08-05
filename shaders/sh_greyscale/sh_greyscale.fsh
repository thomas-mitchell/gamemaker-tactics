//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    float gray = (texColor.r + texColor.g + texColor.b) / 3.0;
    gl_FragColor = v_vColour * vec4(gray, gray, gray, texColor.a);
}
