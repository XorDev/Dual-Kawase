///@desc kawase_draw()
///@arg level - Blur level
///@arg [x] - Optional x-offset
///@arg [y] - Optional y-offset

/// Dual-Kawase blur implementation by @XorDev
/*	
	Draws blur result at input level of detail. Each consecutive LOD is 2x the last radius.
	Currently only supports home number LODs, but perhaps I'll revisit this later.
*/

//Inputs
var _lvl,_x,_y;
_lvl = round(argument[0]);
_x = (argument_count>1)? argument[1] : 0;
_y = (argument_count>2)? argument[2] : 0;

//Remember the filter setting.
var filter;
filter = gpu_get_tex_filter();

gpu_set_tex_filter(1);
gpu_set_blendenable(0);

var lod,surf1,surf2;
lod = 1;
surf1 = surf_ping;
surf2 = surf_pong;

//Downscale for LOD.
shader_set(shd_kawase_downscale);
for(var i = 0; i<_lvl; i++)
{
	lod *= 2;
	surf1 = i%2 ? surf_ping : surf_pong;
	surf2 = i%2 ? surf_pong : surf_ping;
	
	surface_resize(surf1,w_2/lod,h_2/lod);
	surface_set_target(surf1);

	shader_set_uniform_f(uni_d_texel,texel_w*lod,texel_h*lod,w_ratio,h_ratio);
	draw_surface_ext(surf2,0,0,1/2,1/2,0,-1,1);
	surface_reset_target();
}

//Upscale for LOD.
shader_set(shd_kawase_upscale);
for(var i = _lvl; i>0; i--)
{
	lod /= 2;
	surf1 = i%2 ? surf_ping : surf_pong;
	surf2 = i%2 ? surf_pong : surf_ping;

	surface_resize(surf1,w_2/lod,h_2/lod);
	surface_set_target(surf1);
	shader_set_uniform_f(uni_u_texel,texel_w*lod,texel_h*lod,w_ratio,h_ratio);
	draw_surface_ext(surf2,0,0,2,2,0,-1,1);

	surface_reset_target();
}
shader_reset();

gpu_set_blendenable(1);
gpu_set_tex_filter(filter);

//Draw the result
draw_surface(surf1,_x,_y);