depth = -99999;

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

cria_poder = function(_sprite, _txt) constructor 
{
    spr = _sprite;
    
    texto = _txt;
}

fogo     = new cria_poder(spr_fogo, "Por alguns segundos, a bola incendeia todos os blocos que toca, fazendo com que eles percam vida lentamente (como um dano ao longo do tempo).");
vermelho = new cria_poder(spr_bola_vermelha, string("Ao segurar o botão \"{0}\", a barra dispara lasers retos para cima que podem destruir blocos. Ótimo para aqueles blocos teimosos no topo.", string("E")));
laser    = new cria_poder(spr_laser, "A bola atravessa um bloco e continua, em vez de ricochetear. Ela só ricocheteia ao atingir a parede ou o teto. Perfeita para fileiras densas.");
explode  = new cria_poder(spr_explode, "Ao atingir um bloco, ela explode e pequenas partículas (ou mini-bolas) voam em todas as direções, destruindo blocos vizinhos.");
triple   = new cria_poder(spr_tres_bolas, "Cria uma ou mais bolas extras. O caos reina! (É clássico por um motivo).");

lat = {
    fund : spr_outro_ui,
    
    all_up : [fogo, vermelho, laser, explode, triple],
    
    up_at : noone,
    up_xs : 1,
    up_ys : 1,
    up_an : 1,
    up_al : 1,
    
    let_exs  : 1,
    let_eys  : 1,
    let_eal  : 0,
    let_eady : 0,
}

lat.up_at = lat.all_up[0];

dsenha_ui_lateral = function()
{
    var _x_lat = 0;
    var _y_lat = 0;
    
    draw_sprite_ext(lat.fund, 0, _x_lat, _y_lat, 1, 1, 0, c_white, 1);
    
    var _x_up = 98;
    var _y_up = 261;
    
    if (lat.up_at != noone){
        lat.let_eady = lerp(lat.let_eady, -10, .15);
        lat.let_eal = lerp(lat.let_eal, 1, .15);
        
        draw_sprite_ext(lat.up_at.spr, 0, _x_up, _y_up, lat.up_xs, lat.up_ys, lat.up_an, c_white, lat.up_al);
    }else{
        lat.let_eal = lerp(lat.let_eal, 0, .15);
        lat.let_eady = lerp(lat.let_eady, 0, .15);
    }
    
    var _offy = sprite_get_height(spr_botao_e)*1.9;
    var _offx = sprite_get_width(spr_botao_e)/2;
    
    draw_sprite_ext(spr_botao_e, 0, _x_up+_offx, (_y_up+_offy)+lat.let_eady, lat.let_exs, lat.let_eys, 0, c_white, lat.let_eal);
    
    if (keyboard_check_pressed(vk_enter)){
        if (lat.up_at == noone){
            lat.up_at = lat.all_up[irandom(array_length(lat.all_up)-1)];
        }else{
            lat.up_at = noone;
        }
    }
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