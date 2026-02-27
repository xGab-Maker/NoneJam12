draw_set_alpha(qnt);

if (colorido == false){
    draw_set_color(cor);
    draw_rectangle(0, 0, view_get_wport(view_camera[0]), view_get_hport(view_camera[0]), false);
}else{
    shader_set(sh_rainbow);
    var uv = sprite_get_uvs(spr_escol_quad_linha, 0);
    shader_set_uniform_f(_uniUV, uv[0], uv[2]);
    shader_set_uniform_f(_uniSpeed, _speed);
    shader_set_uniform_f(_uniTime, _time);
    shader_set_uniform_f(_uniSaturation, _saturation);
    shader_set_uniform_f(_uniBrightness, _brightness);
    shader_set_uniform_f(_uniSection, _section);
    shader_set_uniform_f(_uniMix, _mix);
    draw_rectangle(0, 0, view_get_wport(view_camera[0]), view_get_hport(view_camera[0]), false);
    shader_reset();
}
draw_set_alpha(1);
draw_set_color(c_white);