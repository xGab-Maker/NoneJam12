function inicia_brilho()
{
    xscale  = 1;
    yscale  = 1;
    img_ang = 0;
    dir     = 1;
    
    alpha_brilho = 0;
    cor_brilho   = c_white;
}

function reseta_brilho(_amt = .1)
{
    alpha_brilho = lerp(alpha_brilho, 0, _amt);
}

function seta_brilho(_alp, _cor = c_white)
{
    alpha_brilho = _alp;
    cor_brilho = _cor
}

function desenha_brilho()
{
    shader_set(sh_multi_color);
    draw_sprite_ext(sprite_index, image_index, x, y, xscale*dir, yscale, img_ang, cor_brilho, alpha_brilho);
    shader_reset();
}