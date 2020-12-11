///@desc kawase_set()

/// Dual-Kawase blur implementation by @XorDev
/*	
	Sets the kawase surface.
	Use this to draw to the blur surface and then reset!
*/

//Make sure the surfaces exist!
if !surface_exists(surf_ping)
{
	surf_ping = surface_create(w_2,h_2);
}
if !surface_exists(surf_pong)
{
	surf_pong = surface_create(w_2,h_2);
}

//Update texel variables.
var tex = surface_get_texture(surf_ping);
texel_w = texture_get_texel_width(tex);
texel_h = texture_get_texel_height(tex);

surface_set_target(surf_ping);