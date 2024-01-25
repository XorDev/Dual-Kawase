///@desc Blur + movement

//Update blur level.
level += (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space)) * (hover<.7);
level -= mouse_check_button_pressed(mb_right) * (hover<.7);
level = (level+max_level) % max_level;

//Scroll to the right.
pos--;

//Move the helicopter.
hspeed = hspeed*.9+.01*(640-360*dcos(pos*.6)-x);
vspeed = vspeed*.9+.01*(360-160*dsin(pos)-y);

//Update tip ui values.
hover = hover*.7+.3*point_in_circle(mouse_x,mouse_y,640-32,32,32)*tip;
window_set_cursor(hover>.8? cr_handpoint: cr_default);
tip *= !(mouse_check_button_pressed(mb_left) && hover>.7);