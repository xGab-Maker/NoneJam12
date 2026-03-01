draw_sprite_ext(sprite_index, image_index, x, y, xscale*multi_x, yscale*multi_y, angle, image_blend, image_alpha);

if (al_white > 0){
    shader_set(sh_multi_color);
    draw_sprite_ext(sprite_index, image_index, x, y, xscale*multi_x, yscale*multi_y, angle, image_blend, al_white);
    shader_reset();
}