draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, c_white, image_alpha);

if (fogo.alp_fogoso > 0){
    draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, c_orange, fogo.alp_fogoso);
}

shader_set(sh_multi_color);
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, c_white, alpha_branco);
shader_reset();

if (fogo.alp_icon > 0){
    draw_sprite_ext(spr_fogo, 0, x, y-sprite_height*yscale+sine_between(current_time/1000, 2, -2, 2), xscale, yscale, 0, c_white, fogo.alp_icon);
}

var _tam = 9;

var _x = x+sprite_width/2;
var _y = y+sprite_height/2;

//draw_text(x, y-sprite_height/2, vida-vida_perdida);

//draw_text(x, y, array_length(conjunto)-1);