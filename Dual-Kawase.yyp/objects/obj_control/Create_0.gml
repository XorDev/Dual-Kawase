///@desc Initialize

//Set the blur surface size.
kawase_init(1280,720);

//Blur level variables:
level = 0;
max_level = 6;


//Set the demo font.
draw_set_font(fnt_main);
//We'll draw the app surface manually through the blur effect.
application_surface_draw_enable(0);

//Start the helicopter at the left-center.
x = 240;
y = 360;

//Parallax scrolling position.
pos = 0;

//Tip UI variables:
tip = 1;
hover = 0;