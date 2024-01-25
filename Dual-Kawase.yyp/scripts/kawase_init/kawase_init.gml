///@desc kawase_init()
///@arg width - Blur surface width
///@arg height - Blur surface height
function kawase_init() {

	/// Dual-Kawase blur implementation by @XorDev
	/*	
		Initializes blur surface dimensions and internal shader, surface variables.
	*/

	//Input dimensions.
	var _w,_h;
	_w = argument[0];
	_h = argument[1];

	w_2 = power_of_2(_w);
	h_2 = power_of_2(_h);

	texel_w = 1/w_2;
	texel_h = 1/h_2;

	w_ratio = _w/w_2;
	h_ratio = _h/h_2;

	surf_ping = -1;
	surf_pong = -1;

	uni_d_texel = shader_get_uniform(shd_kawase_downscale,"texel");
	uni_u_texel = shader_get_uniform(shd_kawase_upscale,"texel");


}
