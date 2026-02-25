depth = -99999;

show_debug_overlay(true);

#region Barra Progressão

bar_prog = {
    fundo : spr_bar_prog_fundo,
    borda : spr_bar_prog_borda,
    cont  : spr_bar_prog_cont,
    
    xs   : 1,
    ys   : 1,
    ang  : 0,
    alp  : 1,
    
    prog        : global.progressao,
    
    xs_prog     : 0,
    xs_prog_ret : 0,
    
    ys_prog : 1,
}

var _width = sprite_get_width(bar_prog.borda);
var _width_prog = sprite_get_width(bar_prog.cont);

bar_prog.xs_prog_ret = (_width/_width_prog)*bar_prog.prog;

bar_prog.xs_prog = bar_prog.xs_prog_ret;
    
retarda_barra_tras = function()
{
    bar_prog.xs_prog = lerp(bar_prog.xs_prog, bar_prog.xs_prog_ret, .08);
}

desenha_bar_prog = function()
{
    bar_prog.prog = global.progressao;
    
    var _offy_fundo = 7;
    
    var _width_fund = sprite_get_width(bar_prog.fundo)*bar_prog.xs;
    
    var _real_width_fund = sprite_get_width(bar_prog.fundo);
    
    var _height_fund = sprite_get_height(bar_prog.fundo);
    
    var _x_bar = 375;
    var _y_bar = _height_fund/2+_offy_fundo;
    
    draw_sprite_ext(bar_prog.fundo, 0, _x_bar, _y_bar, bar_prog.xs, bar_prog.ys, bar_prog.ang, c_white, bar_prog.alp);
    
    var _width_prog = sprite_get_width(bar_prog.cont);
    
    bar_prog.xs_prog_ret = (_real_width_fund/_width_prog)*bar_prog.prog;
    
    shader_set(sh_multi_color);
    draw_sprite_ext(bar_prog.cont, 0, _x_bar-_width_fund/2, _y_bar-1, bar_prog.xs_prog_ret*bar_prog.xs, bar_prog.ys_prog*bar_prog.ys, bar_prog.ang, c_white, bar_prog.alp);
    shader_reset();
    
    draw_sprite_ext(bar_prog.cont, 0, _x_bar-_width_fund/2, _y_bar-1, bar_prog.xs_prog*bar_prog.xs, bar_prog.ys_prog*bar_prog.ys, bar_prog.ang, c_white, bar_prog.alp);

    draw_sprite_ext(bar_prog.borda, 0, _x_bar, _y_bar, bar_prog.xs, bar_prog.ys, bar_prog.ang, c_white, bar_prog.alp);
    
    retarda_barra_tras();
}

#endregion


#region UI Lateral

lat = {
    fund : spr_outro_ui,
}

dsenha_ui_lateral = function()
{
    var _x_lat = 0;
    var _y_lat = 0;
    
    draw_sprite_ext(lat.fund, 0, _x_lat, _y_lat, 1, 1, 0, c_white, 1);
}

#endregion


#region Gerais

reseta_vars = function()
{
    bar_prog.xs = elastic("bar_progxs", bar_prog.xs, 1);
    bar_prog.ys = elastic("bar_progys", bar_prog.ys, 1);    
}

limita_vars = function()
{
    global.progressao = clamp(global.progressao, 0, 1);
}

#endregion