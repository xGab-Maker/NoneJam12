xini = 90;
yini = 15;

atual = 0;
atual_mostre = 0;

alp_mostra = 0;

#region Cria Upgrades


cria_upgrade = function(_spr, _desc, _title, _preco) constructor
{
    spr = _spr;
    
    desc = _desc;
    
    title = _title;
    
    preco = _preco;
    
    xs  = 1;
    ys  = 1;
    ang = 0;
    alp = 1;
    
    al_white = 0;
    al_selec = 0;
    
    sele_xs  = 1;
    sele_ys  = 1;
    sele_ang = 0;
    
    w = sprite_get_width(_spr);
    h = sprite_get_height(_spr);
}

up_ricoche = new cria_upgrade(spr_richocete, "Bum bum Guloso hahaha", "Oloco", 30);
up_combus  = new cria_upgrade(spr_combustivel, "Batatao legal kkk", "Olo422", 30);
up_dano    = new cria_upgrade(spr_dano, "Faz alguma coisa", "Bobalhao", 30);
up_protect = new cria_upgrade(spr_protect, "Bum bum Gulosdsds", "Ke isso", 30);
up_velatir = new cria_upgrade(spr_rapido_tiro, "Bum bum Gulofsfsso hahaha", "+alguma coisa", 30);
up_2projet = new cria_upgrade(spr_2projeteis, "Bum bum Guloso hfsahaha", "Slabro", 30);
up_velplay = new cria_upgrade(spr_vel, "Bum bum Guloso hahahhga", "Wtfsf", 30);
up_veltiro = new cria_upgrade(spr_vel_projetel, "Bum bum Gulohhso hahaha", "bom dia2 ze", 30);

upg = [up_2projet, up_combus, up_dano, up_protect, up_ricoche, up_velatir, up_velplay, up_veltiro];


#endregion


seleciona_item = function(_qual, _x, _y, _indice)
{
    var _col = point_in_rectangle(mouse_x, mouse_y, _x-_qual.w/2, _y-_qual.h/2, _x+_qual.w/2, _y+_qual.h/2);
    
    if (_col){
        if (atual != _indice){
            upg[_indice].sele_xs = 1.6;
            upg[_indice].sele_ys = .5;
            upg[_indice].sele_ang = random_range(-2, 2);
            
            upg[_indice].xs = 1.1;
            upg[_indice].ys = .8;
            upg[_indice].ang = random_range(-10, 10);
        }
        
        atual_mostre = _indice;
        atual = _indice;
    }else{
        if (atual == _indice){
            atual = -1;
        }
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
    
    var _txt_title = _qual.title;
    
    var _height_title = string_height(_txt_title);
    
    var _posx = 367;
    var _posy = 33;
    
    var _width = 221;
    var _height = 251;
    
    var _margem = 10;
     
    draw_set_halign(1);
    draw_set_valign(1);
    draw_set_font(fnt_louja);
    
    draw_set_color(global.cores.black);
    draw_text_transformed(_posx+_width/2, _posy+_height_title+2, _txt_title, .35, .35, 0);
    draw_set_color(global.cores.white);
    draw_text_transformed(_posx+_width/2, _posy+_height_title, _txt_title, .35, .35, 0);
    
    draw_set_color(global.cores.black);
    draw_rectangle(_posx+_margem/2, _posy+_height/5, _posx-_margem/2+_width, _posy+_height/5+2, false);
    draw_set_color(global.cores.white);
    draw_rectangle(_posx+_margem/2, _posy+_height/5, _posx-_margem/2+_width, _posy+_height/5, false);
    
    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_color(global.cores.black);
    draw_text_ext_transformed(_posx+_margem, _posy+_height/4+2, _qual.desc, 60, _posx+_width-_margem, .35, .35, 0);
    draw_set_color(global.cores.white);
    draw_text_ext_transformed(_posx+_margem, _posy+_height/4, _qual.desc, 60, _posx+_width-_margem, .35, .35, 0);
    
    draw_set_color(global.cores.black);
    draw_rectangle(_posx+_margem/2, _posy+_height/2, _posx-_margem/2+_width, _posy+_height/2+2, false);
    draw_set_color(global.cores.white);
    draw_rectangle(_posx+_margem/2, _posy+_height/2, _posx-_margem/2+_width, _posy+_height/2, false);
    
    draw_set_halign(1);
    draw_set_valign(2);
    draw_set_color(global.cores.black);
    draw_text_transformed(_posx+_width/2, _posy+_height/1.45+2, string(_qual.preco), .35, .35, 0);
    draw_set_color(global.cores.white);
    draw_text_transformed(_posx+_width/2, _posy+_height/1.45, string(_qual.preco), .35, .35, 0);
    
    draw_set_color(global.cores.black);
    draw_rectangle(_posx+_margem/2, _posy+_height/1.25, _posx-_margem/2+_width, _posy+_height/1.25+2, false);
    draw_set_color(global.cores.white);
    draw_rectangle(_posx+_margem/2, _posy+_height/1.25, _posx-_margem/2+_width, _posy+_height/1.25, false);
    
    draw_set_halign(1);
    draw_set_valign(2);
    draw_set_color(global.cores.black);
    draw_text_transformed(_posx+_width/2, _posy+_height/1.05+2, string(_qual.preco), .35, .35, 0);
    draw_set_color(global.cores.white);
    draw_text_transformed(_posx+_width/2, _posy+_height/1.05, string(_qual.preco), .35, .35, 0);
    
    draw_set_color(c_white);
    draw_set_font(-1);
    draw_set_halign(-1);
    draw_set_valign(-1);
    
    draw_set_alpha(1);
}

reseta_vars = function(_indice)
{
    upg[_indice].xs = elastic("upgxs" + string(_indice), upg[_indice].xs, 1, , .2);
    upg[_indice].ys = elastic("upgys" + string(_indice), upg[_indice].ys, 1, , .2);
    upg[_indice].ang = elastic("upgang" + string(_indice), upg[_indice].ang, 0, , .2);
    
    upg[_indice].sele_xs = elastic("upgselexs" + string(_indice), upg[_indice].sele_xs, 1, , .2);
    upg[_indice].sele_ys = elastic("upgseleys" + string(_indice), upg[_indice].sele_ys, 1, , .2);
    upg[_indice].sele_ang = elastic("upgseleang" + string(_indice), upg[_indice].sele_ang, 0, , .2);
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
            draw_sprite_ext(_who.spr, 0, xini+(_xi*_multix), yini+(_addy*_multiy), _who.xs, _who.ys, _who.ang, c_white, _who.alp); 
            shader_reset();
        }
        
        if (_who.al_selec > 0){
            draw_sprite_ext(spr_selec, 0, _x, _y, _who.sele_xs, _who.sele_ys, _who.sele_ang, c_white, _who.al_selec);
        }
        
        seleciona_item(_who, _x, _y, i);
        reseta_vars(i);
    }    
    
    mostra_desc(upg[atual_mostre]);
}