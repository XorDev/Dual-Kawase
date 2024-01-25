varying vec2 v_coord;

uniform vec4 texel;

void main()
{
	const vec2 z = vec2(0);
	const vec2 s = vec2(-1,1);
	const vec2 a = vec2(0,2);
    gl_FragColor = (texture2D(gm_BaseTexture, v_coord + texel.xy*s.xx)+
					texture2D(gm_BaseTexture, v_coord + texel.xy*s.yx)+
					texture2D(gm_BaseTexture, v_coord + texel.xy*s.xy)+
					texture2D(gm_BaseTexture, v_coord + texel.xy*s.yy))*(1./6.)+
				   (texture2D(gm_BaseTexture, v_coord + texel.xy*a.xy)+
					texture2D(gm_BaseTexture, v_coord - texel.xy*a.xy)+
					texture2D(gm_BaseTexture, v_coord + texel.xy*a.yx)+
					texture2D(gm_BaseTexture, v_coord - texel.xy*a.yx))*(1./12.);
}