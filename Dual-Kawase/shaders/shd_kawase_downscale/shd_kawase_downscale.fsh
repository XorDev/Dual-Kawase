varying vec2 v_coord;

uniform vec4 texel;

void main()
{
	const vec2 z = vec2(0);
	const vec2 s = vec2(-1,1);
    gl_FragColor =  texture2D(gm_BaseTexture, v_coord)/2.+
				   (texture2D(gm_BaseTexture, clamp(v_coord + texel.xy*s.xx, z, texel.zw))+
					texture2D(gm_BaseTexture, clamp(v_coord + texel.xy*s.yx, z, texel.zw))+
					texture2D(gm_BaseTexture, clamp(v_coord + texel.xy*s.xy, z, texel.zw))+
					texture2D(gm_BaseTexture, clamp(v_coord + texel.xy*s.yy, z, texel.zw)))/8.;
}