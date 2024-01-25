///@desc Parallax background

//Draw all the background layers.
draw_sprite_tiled_ext(spr_background,0,pos*0,0,10,10,-1,1);
draw_sprite_tiled_ext(spr_background,1,pos*1,0,10,10,-1,1);
draw_sprite_tiled_ext(spr_background,2,pos*2,0,10,10,-1,1);
draw_sprite_tiled_ext(spr_background,3,pos*3,0,10,10,-1,1);
draw_sprite_tiled_ext(spr_background,4,pos*4,0,10,10,-1,1);
draw_sprite_tiled_ext(spr_background,5,pos*5,0,10,10,-1,1);

//Helicopter shadow.
draw_sprite_ext(spr_helicopter,abs(pos+y/9)/3,x,y,10,10,-5-hspeed,0,1);