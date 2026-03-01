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
    
    star_need : global.waves_qnt[global.numwave],
    addy_star : 0,
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
    bar_prog.star_need = global.waves_qnt[global.numwave];
    
    global.progressao = global.money.star/bar_prog.star_need;
    
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
    
    var _starx = _x_bar+_width_fund/2+sprite_get_width(spr_din2)/1.5;
    var _stary = _y_bar;
    
    draw_sprite_ext(spr_din2, 0, _starx, _stary+bar_prog.addy_star/2, 1, 1, 0, c_white, 1);
    
    bar_prog.addy_star = sine_between(current_time/1000, 6, -1, 1);
    
    draw_set_halign(-1);
    draw_set_valign(1);
    draw_set_font(fnt_louja);
    draw_set_color(global.cores.black);
    draw_text_transformed(_starx+16, _stary+2+bar_prog.addy_star, bar_prog.star_need, .3, .3, 0);
    draw_set_color(global.cores.white);
    draw_text_transformed(_starx+15, _stary+bar_prog.addy_star, bar_prog.star_need, .3, .3, 0);
    draw_set_font(-1);
    draw_set_valign(-1);
    draw_set_halign(-1);
    
    if (global.money.star >= bar_prog.star_need){
        global.numwave++;
        
        global.numwave = clamp(global.numwave, 0, array_length(global.waves_qnt)-1);
    }
    
    global.progressao = clamp(global.progressao, 0, 1);
}

#endregion



#region UI Lateral

cria_poder = function(_sprite, _type, _txt) constructor 
{
    spr = _sprite;
    
    texto = _txt;
    
    tipo = _type;
}

fogo     = new cria_poder(spr_fogo, PODER.FOGO, "Por alguns segundos, a bola incendeia todos os blocos que toca, fazendo com que eles percam vida lentamente (como um dano ao longo do tempo).");
laser    = new cria_poder(spr_bola_vermelha, PODER.LASER, string("Ao segurar o botão \"{0}\", a barra dispara lasers retos para cima que podem destruir blocos. Ótimo para aqueles blocos teimosos no topo.", string("E")));
perfura  = new cria_poder(spr_laser, PODER.PERF, "A bola atravessa um bloco e continua, em vez de ricochetear. Ela só ricocheteia ao atingir a parede ou o teto. Perfeita para fileiras densas.");
explode  = new cria_poder(spr_explode, PODER.FRAG, "Ao atingir um bloco, ela explode e pequenas partículas (ou mini-bolas) voam em todas as direções, destruindo blocos vizinhos.");
triple   = new cria_poder(spr_tres_bolas, PODER.MULTI, "Cria uma ou mais bolas extras. O caos reina! (É clássico por um motivo).");

lat = {
    fund : spr_outro_ui,
    
    all_up : [fogo, laser, perfura, explode, triple],
    
    up_at : noone,
    up_xs : 1,
    up_ys : 1,
    up_an : 1,
    up_al : 1,
    
    let_exs  : 1,
    let_eys  : 1,
    let_eal  : 0,
    let_eady : 0,
    
    txt_addy  : 0,
    txt_ad_mx : 0,
    
    sl_qnt : 0,
    sl_spr : spr_slider,
    sl_sc  : [1, 1],
    sl_x   : 113,
    sl_y   : 288,
    nsl_y  : 288,
    sl_w   : 0,
    sl_h   : 0,
    sl_ini : 288,
    sl_end : 328,
    sl_in  : false,
    sl_segue : false,
}

lat.sl_w = sprite_get_width(lat.sl_spr);
lat.sl_h = sprite_get_height(lat.sl_spr);

lat.up_at = lat.all_up[0];

bar_pred = {
    spr : spr_barra_pred,
    
    x : 64,
    y : 223,
    
    qnt : global.progress_pred,
    
    xs : 0,
    ys : 1,
    
    sc_xs : 1,
    sc_ys : 1,
    
    max_ys : 87,
    
    obj_xs : 0,
    
    w : 0,
    h : 0,
}

bar_pred.w = sprite_get_width(bar_pred.spr);
bar_pred.h = sprite_get_height(bar_pred.spr);

bar_pred.obj_xs = (bar_pred.max_ys/bar_pred.w)*bar_pred.qnt;

bar_pred.xs = bar_pred.obj_xs;

money_info = {
    objs : [spr_din1, spr_din2],
    
    x : [20, 21],
    y : [169, 194],
    
    xs : [1, 1],
    ys : [1, 1],
    
    txt_xs : [1, 1],
    txt_ys : [1, 1],
    
    qnts : [global.money.brain, global.money.star]
}

bar_combus = {
    spr : spr_comb_bar,
    
    x : 15,
    y : 117,
    
    xs     : 1,
    obj_xs : 1,
    ys     : 1,
    
    max_xs : 100,
    
    sc_xs : 1,
    sc_ys : 1,
    
    qnt : global.combus_qnt,
    
    w : 0,
    h : 0
}

bar_combus.w = sprite_get_width(bar_combus.spr);
bar_combus.h = sprite_get_height(bar_combus.spr);

bar_combus.obj_xs = (bar_combus.max_xs/bar_combus.w)*bar_combus.qnt;

bar_combus.xs = bar_combus.obj_xs;

wd = {
    wspr : spr_caveira,
    wx   : 110,
    wy   : 144,
    
    dspr : spr_explosao,
    dx   : 44,
    dy   : 144,
}

desenha_wd = function()
{
    draw_sprite(wd.wspr, 0, wd.wx, wd.wy);
    draw_sprite(wd.dspr, 0, wd.dx, wd.dy);
    
    draw_set_halign(2);
    draw_set_valign(1);
    draw_set_color(global.cores.black);
    draw_text_transformed(wd.wx-10, wd.wy+2, global.numwave, .3, .3, 0);
    draw_set_color(global.cores.white);
    draw_text_transformed(wd.wx-10, wd.wy, global.numwave, .3, .3, 0);
    
    draw_set_color(global.cores.black);
    draw_text_transformed(wd.dx-11, wd.dy+2, global.upg.dmg, .3, .3, 0);
    draw_set_color(global.cores.white);
    draw_text_transformed(wd.dx-11, wd.dy, global.upg.dmg, .3, .3, 0);
    draw_set_halign(-1);
    draw_set_valign(-1);
}

desenha_combustivel = function()
{
    bar_combus.qnt = global.combus_qnt;
    
    bar_combus.obj_xs = (bar_combus.max_xs/bar_combus.w)*bar_combus.qnt;
    
    shader_set(sh_multi_color);
    draw_sprite_ext(bar_combus.spr, 0, bar_combus.x, bar_combus.y, bar_combus.obj_xs*bar_combus.sc_xs, bar_combus.ys*bar_combus.sc_ys, 0, c_white, 1);
    shader_reset();
    
    draw_sprite_ext(bar_combus.spr, 0, bar_combus.x, bar_combus.y, bar_combus.xs*bar_combus.sc_xs, bar_combus.ys*bar_combus.sc_ys, 0, c_white, 1);
    
    bar_combus.xs = lerp(bar_combus.xs, bar_combus.obj_xs, .1);
    
    bar_combus.sc_xs = elastic("bar_combusscsx", bar_combus.sc_xs, 1, , .2);
    bar_combus.sc_ys = elastic("bar_combusscsy", bar_combus.sc_ys, 1, , .2);    
    
    draw_sprite(spr_fundo_comb, 0, 63, 118);
    
    global.combus_qnt = clamp(global.combus_qnt, 0, 1);
}

slider_txts = function()
{
    var _col = point_in_rectangle(mouse_x, mouse_y, lat.sl_x-lat.sl_w/2, lat.sl_y-lat.sl_h/2, lat.sl_x+lat.sl_w/2, lat.sl_y+lat.sl_h/2);
    
    if (_col or lat.sl_segue){
        if (!lat.sl_in){
            lat.sl_sc[0] = 1.2;
            lat.sl_sc[1] = .7;
        }
        
        if (mouse_check_button_pressed(mb_left)){
            lat.sl_sc[0] = .7;
            lat.sl_sc[1] = 1.2;
        }
        
        if (mouse_check_button(mb_left)){
            lat.sl_segue = true;
            
            global.entra_other = true;
        }else{
            lat.sl_segue = false;
            
            global.entra_other = false;
        }
        
        lat.sl_in = true;
    }else{
        if (lat.sl_in and !lat.sl_segue){
            lat.sl_in = false;
            
            global.entra_other = false;
        }
    }
    
    draw_line_width_color(lat.sl_x-1, lat.sl_ini, lat.sl_x-1, lat.sl_end, 2, #43222B, #43222B);
    
    draw_sprite_ext(lat.sl_spr, 0, lat.sl_x, lat.sl_y, lat.sl_sc[0], lat.sl_sc[1], 0, c_white, 1);
    
    if (lat.sl_segue){
        lat.nsl_y = mouse_y;
    }
    
    lat.sl_sc[0] = elastic("latsl_scx", lat.sl_sc[0], 1, 1.5, .15);
    lat.sl_sc[1] = elastic("latsl_scy", lat.sl_sc[1], 1, 1.5, .15);
    
    lat.sl_y = lerp(lat.sl_y, lat.nsl_y, .2);
    
    lat.sl_y = clamp(lat.sl_y, lat.sl_ini, lat.sl_end);
    
    lat.sl_qnt = (lat.sl_y - lat.sl_ini) / (lat.sl_end - lat.sl_ini);
}

barra_predios = function()
{
    bar_pred.qnt = global.progress_pred;
    
    bar_pred.obj_xs = (bar_pred.max_ys/bar_pred.w)*bar_pred.qnt;
    
    shader_set(sh_multi_color);
    draw_sprite_ext(bar_pred.spr, 0, bar_pred.x, bar_pred.y, bar_pred.obj_xs*bar_pred.sc_xs, bar_pred.ys*bar_pred.sc_ys, 0, c_white, 1);
    shader_reset();
    
    draw_sprite_ext(bar_pred.spr, 0, bar_pred.x, bar_pred.y, bar_pred.xs*bar_pred.sc_xs, bar_pred.ys*bar_pred.sc_ys, 0, c_white, 1);
    
    bar_pred.xs = lerp(bar_pred.xs, bar_pred.obj_xs, .1);
    
    bar_pred.sc_xs = elastic("bar_predscsx", bar_pred.sc_xs, 1, , .2);
    bar_pred.sc_ys = elastic("bar_predscsy", bar_pred.sc_ys, 1, , .2);
    
    add_prog_p(global.add_bar_pred+(global.blocos_quebrados/500));
}

mostra_dinheiro = function()
{
    money_info.qnts = [global.money.brain, global.money.star];
    
    for (var i = 0; i < array_length(money_info.objs); i++) {
    	draw_sprite_ext(money_info.objs[i], 0, money_info.x[i], money_info.y[i], money_info.xs[i], money_info.ys[i], 0, c_white, 1);
        draw_set_valign(1);
        draw_set_halign(-1);
        draw_set_font(fnt_base);
        draw_set_color(global.cores.black);
        draw_text_transformed(money_info.x[i]+23, money_info.y[i]+1, resume_numeros(money_info.qnts[i]), money_info.txt_xs[i]/3.3, money_info.txt_ys[i]/3.3, 0);
        draw_set_color(global.cores.white);
        draw_text_transformed(money_info.x[i]+23, money_info.y[i]-1, resume_numeros(money_info.qnts[i]), money_info.txt_xs[i]/3.3, money_info.txt_ys[i]/3.3, 0);
        draw_set_font(fnt_base);
        draw_set_halign(-1);
        draw_set_valign(-1);
        
        money_info.xs[i] = elastic("money_info.xs" + string(i), money_info.xs[i], 1, , .2);
        money_info.ys[i] = elastic("money_info.ys" + string(i), money_info.ys[i], 1, , .2);
        
        money_info.txt_xs[i] = elastic("money_info.txt_xs" + string(i), money_info.txt_xs[i], 1, , .25);
        money_info.txt_ys[i] = elastic("money_info.txt_ys" + string(i), money_info.txt_ys[i], 1, , .25);
    }
}

desenha_ui_lateral = function()
{
    var _x_lat = 0;
    var _y_lat = 0;
    
    draw_sprite_ext(lat.fund, 0, _x_lat, _y_lat, 1, 1, 0, c_white, 1);
    
    var _x_up = 98;
    var _y_up = 261;
    
    if (lat.up_at != noone){
        var _txt_inix = 64;
        var _txt_iniy = 286;
        
        var _txt_limx = 87;
        
        var _txt = scribble(lat.up_at.texto);
        
        var _scale = .17;
        
        _txt.transform(_scale, _scale, 0);
        
        _txt.wrap(_txt_limx/_scale, , false);
        _txt.line_spacing("80%");
        _txt.starting_format("fnt_escrita", c_white);
        _txt.shadow(global.cores.black, 1);  
        _txt.blend(global.cores.white, 1);
        
        _txt.align(1);  
        
        lat.txt_ad_mx = (_txt.get_height()/1.5)*_scale;
        
        lat.txt_addy = lat.txt_ad_mx*lat.sl_qnt;
        
        _txt.draw(_txt_inix, _txt_iniy-5-lat.txt_addy);
        
        draw_sprite(spr_outro_ui_baix, 0, 0, 0);
        draw_sprite(spr_outro_ui_sup, 0, 0, 0);
    }
    
    slider_txts();
    
    if (lat.up_at != noone){
        lat.let_eady = lerp(lat.let_eady, -10, .15);
        lat.let_eal = lerp(lat.let_eal, 1, .15);
        
        draw_sprite_ext(lat.up_at.spr, 0, _x_up, _y_up, lat.up_xs, lat.up_ys, lat.up_an, c_white, lat.up_al);
    }else{
        lat.let_eal = lerp(lat.let_eal, 0, .15);
        lat.let_eady = lerp(lat.let_eady, 0, .15);
    }
    
    var _offy = sprite_get_height(spr_botao_e)/2.3;
    var _offx = sprite_get_width(spr_botao_e)/1.5;
    
    draw_sprite_ext(spr_botao_e, 0, _x_up-_offx, (_y_up-_offy)+lat.let_eady, lat.let_exs, lat.let_eys, 0, c_white, lat.let_eal);
    
    if (keyboard_check_pressed(vk_enter)){
        if (lat.up_at == noone){
            lat.up_at = lat.all_up[irandom(array_length(lat.all_up)-1)];
        }else{
            lat.up_at = noone;
        }
    }
    
    if (instance_exists(obj_seta)){
        if (lat.up_at != noone){
            obj_seta.tipo_bola = lat.up_at.tipo;
        }else{
            obj_seta.tipo_bola = PODER.NORMAL;
        }
    }
    
    barra_predios();
    
    mostra_dinheiro();
    
    desenha_combustivel();
    
    desenha_wd();
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