varying vec2 v_coord;

uniform vec4 texel;

void main()
{
	const vec2 z = vec2(0);
	const vec2 s = vec2(-1,1);
    gl_FragColor =  texture2D(gm_BaseTexture, v_coord)*0.5+
				   (texture2D(gm_BaseTexture, v_coord + texel.xy*s.xx)+
					texture2D(gm_BaseTexture, v_coord + texel.xy*s.yx)+
					texture2D(gm_BaseTexture, v_coord + texel.xy*s.xy)+
					texture2D(gm_BaseTexture, v_coord + texel.xy*s.yy))*0.125;
}