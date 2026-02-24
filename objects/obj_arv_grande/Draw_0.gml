draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, image_blend, image_alpha);

shader_set(sh_multi_color);
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, c_white, alpha_branco);
shader_reset();

if (predio != noone){
    draw_sprite_ext(predio, num_predio, x, y-(sprite_height*yscale)/2, xscale, yscale, angle, image_blend, image_alpha);
    
    shader_set(sh_multi_color);
    draw_sprite_ext(predio, num_predio, x, y-(sprite_height*yscale)/2, xscale, yscale, angle, c_white, alpha_branco);
    shader_reset();
}

var _tam = 9;

var _x = x+sprite_width/2;
var _y = y+sprite_height/2;

//draw_text(x, y-sprite_height/2, vida-vida_perdida);

//draw_text(x, y, array_length(conjunto)-1);