global.progress_pred = 0;

xini = 90;
yini = 15;

atual = 0;
atual_mostre = 0;

alp_mostra = 0;

txt_xs = 1;
txt_ys = 1;

txt_xs_up = 1;
txt_ys_up = 1;

txt_xs_title = 1;
txt_ys_title = 1;

din_xs = [1];
din_ys = [1];

sai_xs     = 1;
sai_ys     = 1;
sai_nxs    = 1;
sai_nys    = 1;
sai_ang    = 0;
selec_sai  = false;
al_sai     = 0;

#region Cria Upgrades


cria_upgrade = function(_spr, _desc, _title, _money, _preco, _melhora) constructor
{
    spr = _spr;
    
    desc = _desc;
    
    title = _title;
    
    preco = _preco;
    
    melhora = _melhora;
    
    dinheiro = _money;
    
    xs  = 1;
    ys  = 1;
    nxs  = 1;
    nys  = 1;
    
    ang = 0;
    alp = 1;
    
    al_white = 0;
    al_red   = 0;
    al_selec = 0;
    
    sele_xs  = 1;
    sele_ys  = 1;
    sele_ang = 0;
    
    w = sprite_get_width(_spr);
    h = sprite_get_height(_spr);
}

up_ricoche = new cria_upgrade(spr_richocete, "Bum bum Guloso hahaha", "[c_yellow]Elasticidade", "brain", [30, 2], [0, 50, 150]);
up_combus  = new cria_upgrade(spr_combustivel, "Batatao legal kkk", "[c_maroon]Gasolina", "brain", [25, 2], [2, 7, 12]);
up_dano    = new cria_upgrade(spr_dano, "Faz alguma coisa", "[c_red]Força", "brain", [150], [0, 100]);
up_protect = new cria_upgrade(spr_protect, "Bum bum Gulosdsds", "[c_blue]Escudo", "brain", [22], [0, 100]);
up_velatir = new cria_upgrade(spr_rapido_tiro, "Bum bum Gulofsfsso hahaha", "[c_lime]Tiros Rapidos", "brain", [1, 2], [0, 20, 50]);
up_2projet = new cria_upgrade(spr_2projeteis, "Bum bum Guloso hfsahaha", "[c_fuchsia]Mais projeteis", "brain", [22, 2], [0, 100]);
up_velplay = new cria_upgrade(spr_vel, "Bum bum Guloso hahahhga", "[c_orange]Propulsores", "brain", [252, 12], [0, 25, 50]);
up_veltiro = new cria_upgrade(spr_vel_projetel, "Bum bum Gulohhso hahaha", "[c_olive]Rapidez Tiro", "brain", [66, 125], [0, 20, 40]);

upg = [up_2projet, up_combus, up_dano, up_protect, up_ricoche, up_velatir, up_velplay, up_veltiro];


#endregion

seta_func = function(_qual, _indice)
{
    global.quais[_indice]++;
    
    var _pega_melhora = _qual.melhora[global.quais[_indice]];
    
    var _melhora = (_pega_melhora/100)+1;
    
    switch (_qual) {
    	case up_ricoche : global.upg.qnt_col *= _melhora break;
        case up_combus  : global.upg.combus  *= _melhora break;
        case up_dano    : global.upg.dmg     *= _melhora break;
        case up_protect : global.upg.protect *= _melhora break;
        case up_velatir : global.upg.vel_ati *= _melhora break;
        case up_2projet : global.upg.tiroqnt *= _melhora break;
        case up_velplay : global.upg.velplay *= _melhora break;
        case up_veltiro : global.upg.vel_tir *= _melhora break;
    }
    
    txt_xs = 1;
    txt_ys = 1;
    
    txt_xs_up = .6;
    txt_ys_up = 1.4;
    
    txt_xs_title = 1.1;
    txt_ys_title = .9;
}

seleciona_item = function(_qual, _x, _y, _indice, _qnt_quebra, _real_i)
{
    var _col = point_in_rectangle(mouse_x, mouse_y, _x-_qual.w/2, _y-_qual.h/2, _x+_qual.w/2, _y+_qual.h/2);
    
    if (_col){
        if (atual != _indice){
            txt_xs = 1.2;
            txt_ys = .7;
            
            if (instance_exists(obj_camera_louja)){
                with (obj_camera_louja) {
                    objx = room_width/2+_real_i;
                    objy = room_height/2+_qnt_quebra;
                }
            }
            
            txt_xs_up = .7;
            txt_ys_up = 1.2;
            
            txt_xs_title = 1.2;
            txt_ys_title = .7;
            
            upg[_indice].sele_xs = 1.6;
            upg[_indice].sele_ys = .5;
            upg[_indice].sele_ang = random_range(-2, 2);
            
            upg[_indice].xs = 1.1;
            upg[_indice].ys = .8;
            upg[_indice].ang = random_range(-10, 10);
        }
        

        if (mouse_check_button(mb_left)){
            upg[_indice].nxs = .8;
            upg[_indice].nys = .8;
        }
        
        if (mouse_check_button_released(mb_left)){
            upg[_indice].nxs = 1;
            upg[_indice].nys = 1;
            
            upg[_indice].sele_xs = 1.5;
            upg[_indice].sele_ys = .7;
            
            screen_shake(3);
            
            var _r1 = random_range(-30, -10);
            var _r2 = random_range(30, 10);
            
            upg[_indice].ang = choose(_r1, _r2);
            
            var _din_usado = global.money.brain;
            
            if (global.quais[_indice] < array_length(_qual.melhora)-1){
                if (_din_usado >= _qual.preco[global.quais[_indice]]){
                    seta_func(_qual, _indice);
                    
                    upg[_indice].al_white = 1;
                    
                    switch (_qual.dinheiro) {
                    	case "brain": 
                            global.money.brain -= _qual.preco[global.quais[_indice]-1]; 
                            
                            din_xs[0] = .7;
                            din_ys[0] = 1.2;
                        break;
                    }
                }else{
                    upg[_indice].al_red = 1;
                }
            }else{
                upg[_indice].al_red = 1;
            }
        }
        
        atual_mostre = _indice;
        atual = _indice;
    }else{
        if (atual == _indice){
            atual = -1;
        }
        
        upg[_indice].nxs = 1;
        upg[_indice].nys = 1;
    }
    
    if (atual != -1){
        alp_mostra = lerp(alp_mostra, 1, .05);
    }else{
        alp_mostra = lerp(alp_mostra, 0, .05);
    }
}

mostra_desc = function(_qual)
{
    draw_set_alpha(alp_mostra);
    
    var _spr_din = spr_din1;
    
    var _txt_title = string("{0} [/c]- [c_aqua]{1}/{2}", _qual.title, global.quais[atual_mostre]+1, array_length(_qual.melhora));
    
    var _up_item = global.quais[atual_mostre];
    
    var _height_title = string_height(_txt_title);
    
    var _posx = 367;
    var _posy = 33;
    
    var _width = 221;
    var _height = 251;
    
    var _margem = 10;
    
    var _txt_s_title = scribble(_txt_title);
    
    var _scale = .3;
    
    _txt_s_title.transform(_scale*txt_xs_title, _scale*txt_ys_title, 0);

    _txt_s_title.line_spacing("80%");
    _txt_s_title.starting_format("fnt_louja_s", c_white);
    _txt_s_title.shadow(global.cores.black, 1);  
    _txt_s_title.blend(global.cores.white, alp_mostra);
    
    _txt_s_title.align(1, 1);  
    
    _txt_s_title.draw(_posx+_width/2, _posy+_height_title+2);
     
    draw_set_halign(1);
    draw_set_valign(1);
    draw_set_font(fnt_louja);
    
    //draw_set_alpha(alp_mostra);
    //draw_set_color(global.cores.black);
    //draw_text_transformed(_posx+_width/2, _posy+_height_title+2, _txt_title, .3*txt_xs_title, .3*txt_ys_title, 0);
    //draw_set_color(global.cores.white);
    //draw_text_transformed(_posx+_width/2, _posy+_height_title, _txt_title, .3*txt_xs_title, .3*txt_ys_title, 0);
    
    draw_set_alpha(1);
    draw_set_color(global.cores.black);
    draw_rectangle(_posx+_margem/2, _posy+_height/5, _posx-_margem/2+_width, _posy+_height/5+2, false);
    draw_set_color(global.cores.white);
    draw_rectangle(_posx+_margem/2, _posy+_height/5, _posx-_margem/2+_width, _posy+_height/5, false);
    
    draw_set_alpha(alp_mostra);
    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_color(global.cores.black);
    draw_text_ext_transformed(_posx+_margem, _posy+_height/4+2, _qual.desc, 60, _posx+_width-_margem/2, .3*txt_xs, .3*txt_ys, 0);
    draw_set_color(global.cores.white);
    draw_text_ext_transformed(_posx+_margem, _posy+_height/4, _qual.desc, 60, _posx+_width-_margem/2, .3*txt_xs, .3*txt_ys, 0);
    
    draw_set_alpha(1);
    draw_set_color(global.cores.black);
    draw_rectangle(_posx+_margem/2, _posy+_height/2, _posx-_margem/2+_width, _posy+_height/2+2, false);
    draw_set_color(global.cores.white);
    draw_rectangle(_posx+_margem/2, _posy+_height/2, _posx-_margem/2+_width, _posy+_height/2, false);
    
    var _str_up = string("{0}%", _qual.melhora[_up_item]);
    
    if (_up_item < array_length(_qual.melhora)-1) _str_up = string("{0}% -> [#A5CC54]{1}%", _qual.melhora[_up_item], _qual.melhora[_up_item+1]);
    
    var _txt = scribble(_str_up);
    
    var _scale2 = .35;
    
    _txt.transform(_scale2*txt_xs_up, _scale2*txt_ys_up, 0);

    _txt.line_spacing("80%");
    _txt.starting_format("fnt_louja_s", c_white);
    _txt.shadow(global.cores.black, 1);  
    _txt.blend(global.cores.white, alp_mostra);
    
    _txt.align(1, 2);  
    
    _txt.draw(_posx+_width/2, _posy+_height/1.45);
    
    //draw_set_halign(1);
    //draw_set_valign(2);
    //draw_set_color(global.cores.black);
    //draw_text_transformed(+2, _str_up, .35, .35, 0);
    //draw_set_color(global.cores.white);
    //draw_text_transformed(_posx+_width/2, _posy+_height/1.45, _str_up, .35, .35, 0);
    
    draw_set_color(global.cores.black);
    draw_rectangle(_posx+_margem/2, _posy+_height/1.25, _posx-_margem/2+_width, _posy+_height/1.25+2, false);
    draw_set_color(global.cores.white);
    draw_rectangle(_posx+_margem/2, _posy+_height/1.25, _posx-_margem/2+_width, _posy+_height/1.25, false);
    
    var _str_preco = "";
    
    var _xs = .35*txt_xs_up;
    
    if (_up_item < array_length(_qual.melhora)-1){
        _str_preco = string(resume_numeros(_qual.preco[_up_item]));
        
        draw_sprite_ext(_spr_din, 0, _posx+_width/2-(string_width(_str_preco)*_xs)/2-sprite_get_width(_spr_din)/2-5, _posy+_height/1.05+2-sprite_get_height(_spr_din)/2, txt_xs_up, txt_ys_up, 0, c_white, alp_mostra);
    }
    
    draw_set_alpha(alp_mostra);
    
    draw_set_halign(1);
    draw_set_valign(2);
    draw_set_color(global.cores.black);
    draw_text_transformed(_posx+_width/2, _posy+_height/1.05+2, _str_preco, _xs, .35*txt_ys_up, 0);
    draw_set_color(global.cores.white);
    draw_text_transformed(_posx+_width/2, _posy+_height/1.05, _str_preco, _xs, .35*txt_ys_up, 0);
    
    draw_set_color(c_white);
    draw_set_font(-1);
    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_alpha(1);
}

reseta_vars = function(_indice)
{
    upg[_indice].xs = elastic("upgxs" + string(_indice), upg[_indice].xs, upg[_indice].nxs, , .2);
    upg[_indice].ys = elastic("upgys" + string(_indice), upg[_indice].ys, upg[_indice].nys, , .2);
    upg[_indice].ang = elastic("upgang" + string(_indice), upg[_indice].ang, 0, , .2);
    
    upg[_indice].sele_xs = elastic("upgselexs" + string(_indice), upg[_indice].sele_xs, 1, , .2);
    upg[_indice].sele_ys = elastic("upgseleys" + string(_indice), upg[_indice].sele_ys, 1, , .2);
    upg[_indice].sele_ang = elastic("upgseleang" + string(_indice), upg[_indice].sele_ang, 0, , .2);
    
    upg[_indice].al_white = lerp(upg[_indice].al_white, 0, .15);
    upg[_indice].al_red = lerp(upg[_indice].al_red, 0, .15);
}

desenha_louja = function()
{
    var _qnt_quebra = 4;
    var _addy = 0;
    var _offx = 15;
    var _offy = 10;
    
    for (var i = 0; i < array_length(upg); i++) {
        var _who = upg[i];
        
        if (atual == i){
            _who.al_selec = lerp(_who.al_selec, 1, .6);
        }else{
            _who.al_selec = lerp(_who.al_selec, 0, .6);
        }
        
        var _xi = i mod _qnt_quebra;
        
        if (i mod _qnt_quebra == 0){
            _addy++;
        }
        
        var _multix = _who.w+_offx;
        var _multiy = _who.h+_offy;
        
        var _x = xini+(_xi*_multix);
        var _y = yini+(_addy*_multiy);
        
        draw_sprite_ext(_who.spr, 0, _x, _y, _who.xs, _who.ys, _who.ang, c_white, _who.alp); 
        
        if (_who.al_white > 0){
            shader_set(sh_multi_color);
            draw_sprite_ext(_who.spr, 0, xini+(_xi*_multix), yini+(_addy*_multiy), _who.xs, _who.ys, _who.ang, c_white, _who.al_white); 
            shader_reset();
        }
        
        if (_who.al_red > 0){
            shader_set(sh_multi_color);
            draw_sprite_ext(_who.spr, 0, xini+(_xi*_multix), yini+(_addy*_multiy), _who.xs, _who.ys, _who.ang, c_red, _who.al_red); 
            shader_reset();
        }
        
        if (_who.al_selec > 0){
            draw_sprite_ext(spr_selec, 0, _x, _y, _who.sele_xs, _who.sele_ys, _who.sele_ang, c_white, _who.al_selec);
        }
        
        seleciona_item(_who, _x, _y, i, _addy, _xi);
        reseta_vars(i);
    }    
    
    var _x1 = 41+sprite_get_width(spr_din1)/2;
    var _y1 = 304+sprite_get_height(spr_din1)/2;
    
    draw_set_halign(-1);
    draw_set_valign(1);
    draw_set_font(fnt_louja);
    
    var _brain_money = resume_numeros(global.money.brain);
    
    draw_sprite_ext(spr_din1, 0, _x1, _y1, 1, 1, 0, c_white, 1);
    draw_set_color(global.cores.black);
    draw_text_transformed(_x1+sprite_get_width(spr_din2)/2+10, _y1+2, string(_brain_money), .3*din_xs[0], .3*din_ys[0], 0);
    draw_set_color(global.cores.white);
    draw_text_transformed(_x1+sprite_get_width(spr_din2)/2+10, _y1, string(_brain_money), .3*din_xs[0], .3*din_ys[0], 0);
    
    draw_set_valign(-1);
    draw_set_halign(-1);
    draw_set_font(-1);
    
    mostra_desc(upg[atual_mostre]);
    
    var _bwidth = sprite_get_width(spr_botao_volta);
    var _bheight = sprite_get_height(spr_botao_volta);
    
    var _boffy = 10;
    
    var _bx = 588-_bwidth/2;
    var _by = 286+_bheight/2+_boffy;
    
    draw_sprite_ext(spr_botao_volta, 0, _bx, _by, sai_xs, sai_ys, sai_ang, c_white, 1);
    
    if (al_sai > 0){
        shader_set(sh_multi_color);
        draw_sprite_ext(spr_botao_volta, 0, _bx, _by, sai_xs, sai_ys, sai_ang, c_white, al_sai);
        shader_reset();
    }
    
    var _col = point_in_rectangle(mouse_x, mouse_y, _bx-_bwidth/2, _by-_bheight/2, _bx+_bwidth/2, _by+_bheight/2);
    
    if (_col){
        if (!selec_sai){
            sai_xs = 1.2;
            sai_ys = .7;
            sai_ang = random_range(-10, 10);
        }
        
        if (mouse_check_button(mb_left) and !instance_exists(obj_transicao)){
            sai_nxs = .8;
            sai_nys = .8;
        }
        
        if (mouse_check_button_released(mb_left) and !instance_exists(obj_transicao)){
            sai_nxs = 1;
            sai_nys = 1;
            
            sai_xs = .8;
            sai_ys = 1.3;
            
            al_sai = 1;
            
            sai_ang = random_range(-30, 30);
            
            transciona(rm_1);
        }
        
        selec_sai = true;
    }else{
        if (selec_sai){
            sai_nxs = 1;
            sai_nys = 1;
            
            selec_sai = false;
        }
    }
    
    txt_xs_up = elastic("txt_xs_up", txt_xs_up, 1, , .2);
    txt_ys_up = elastic("txt_ys_up", txt_ys_up, 1, , .2);
    
    txt_xs = elastic("txt_xs", txt_xs, 1, , .2);
    txt_ys = elastic("txt_ys", txt_ys, 1, , .2);
    
    txt_xs_title = elastic("txt_xs_title", txt_xs_title, 1, , .2);
    txt_ys_title = elastic("txt_ys_title", txt_ys_title, 1, , .2);
    
    sai_xs = elastic("sai_xs", sai_xs, sai_nxs, , .2);
    sai_ys = elastic("sai_ys", sai_ys, sai_nxs, , .2);
    sai_ang = elastic("sai_ang", sai_ang, 0, , .2);
    
    al_sai = lerp(al_sai, 0, .1);
    
    for (var i = 0; i < array_length(din_xs); i++) { 
        din_xs[i] = elastic("din_xs" + string(i), din_xs[i], 1, , .2);
        din_ys[i] = elastic("din_ys" + string(i), din_ys[i], 1, , .2);
    }
}