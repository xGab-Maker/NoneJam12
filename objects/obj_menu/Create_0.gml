play_music(msc_menu);

randomize();

//Variaveis de mudanca
escala = .70;

originx = room_width/2;
originy = room_height/2+70;

halign = 1;
valign = 1;

//Criando mascara do mouse
if (!instance_exists(obj_clicador)){
    instance_create_depth(mouse_x, mouse_y, 0, obj_clicador);
}

hitbox = false;

estados = noone;

lines1 = [["Jogar"], ["Opcoes"], ["Sair", "Confirmar?", global.cores.red]];
lines2 = [["Visuais", "Efeitos Visuais", global.cores.blue],["Voltar", "Confirmar?", global.cores.red]];
lines3 = [["Impacto", "slider", "shake_qnt"], ["Window", "bool", "window"], ["Pisca", "bool", "piscadas"], ["Voltar", "Confirmar?", global.cores.red]];

lines = [lines1, lines2, lines3];

new_line    = 0;
linha_atual = 0;
atual       = 0;    

sepy = 60*escala;

indice_anim = 0;

click      = noone;
click_hold = noone;
click_rele = noone;

#region // Cria variaveis do texto \\

var _tam_line = array_length(lines);

nlines_xs      = array_create(_tam_line, noone);
nlines_ys      = array_create(_tam_line, noone);
nlines_ang     = array_create(_tam_line, noone);
nlines_alp_w   = array_create(_tam_line, noone);
nlines_alp_all = array_create(_tam_line, noone);
nlines_addy_an = array_create(_tam_line, noone);
nlines_addx_an = array_create(_tam_line, noone);

lines_xs      = array_create(_tam_line, noone);
lines_ys      = array_create(_tam_line, noone);
lines_ang     = array_create(_tam_line, noone);
lines_alp_w   = array_create(_tam_line, noone);
lines_alp_all = array_create(_tam_line, noone);
lines_addy_an = array_create(_tam_line, noone);
lines_addx_an = array_create(_tam_line, noone);
lines_color   = array_create(_tam_line, noone);

nslider_y   = array_create(_tam_line, noone);
nslider_xs  = array_create(_tam_line, noone);
nslider_ys  = array_create(_tam_line, noone);
nslider_ang = array_create(_tam_line, noone);

if (!variable_global_exists("slider_x")){
    global.nslider_x  = array_create(_tam_line, noone);
    global.slider_x   = array_create(_tam_line, noone);
    global.slider_qnt = array_create(_tam_line, noone);
    
    for (var i = 0; i < _tam_line; i++) {
        var _tam_line_i = array_length(lines[i]);
        
        global.nslider_x[i]  = array_create(_tam_line_i, 0);
    	global.slider_x[i]   = array_create(_tam_line_i, 0);
        global.slider_qnt[i] = array_create(_tam_line_i, 0);
    }
}

slider_y    = array_create(_tam_line, noone);
slider_xs   = array_create(_tam_line, noone);
slider_ys   = array_create(_tam_line, noone);
slider_ang  = array_create(_tam_line, noone);
slider_hold = array_create(_tam_line, noone);
slider_ante = array_create(_tam_line, noone);
slider_alpg = array_create(_tam_line, noone);
slider_alpr = array_create(_tam_line, noone);

slider_pod = true;

nbool_xs   = array_create(_tam_line, noone);
nbool_ys   = array_create(_tam_line, noone);
nbool_ang  = array_create(_tam_line, noone);
nbool_alp  = array_create(_tam_line, 1);
nbool_addx = array_create(_tam_line, 0);
nbool_alpg = array_create(_tam_line, 0);
nbool_alpr = array_create(_tam_line, 0);

bool_xs   = array_create(_tam_line, noone);
bool_ys   = array_create(_tam_line, noone);
bool_ang  = array_create(_tam_line, 0);
bool_alp  = array_create(_tam_line, 1);
bool_addx = array_create(_tam_line, 0);
bool_alpg = array_create(_tam_line, 0);
bool_alpr = array_create(_tam_line, 0);

num_atual = array_create(_tam_line, noone);

for (var i = 0; i < _tam_line; i++) {
    var _tam_line_i = array_length(lines[i]);
    
	nlines_xs[i]      = array_create(_tam_line_i, 1*escala);
	nlines_ys[i]      = array_create(_tam_line_i, 1*escala);
	nlines_ang[i]     = array_create(_tam_line_i, 0);
    nlines_alp_w[i]   = array_create(_tam_line_i, 0);
    nlines_alp_all[i] = array_create(_tam_line_i, 0);
    nlines_addy_an[i] = array_create(_tam_line_i, 0);
    nlines_addx_an[i] = array_create(_tam_line_i, 0);
    
    lines_xs[i]      = array_create(_tam_line_i, 1*escala);
    lines_ys[i]      = array_create(_tam_line_i, 1*escala);
    lines_ang[i]     = array_create(_tam_line_i, 0);
    lines_alp_w[i]   = array_create(_tam_line_i, 0);
    lines_alp_all[i] = array_create(_tam_line_i, 0);
    lines_color[i]   = array_create(_tam_line_i, global.cores.white);
    lines_addy_an[i] = array_create(_tam_line_i, 0);
    lines_addx_an[i] = array_create(_tam_line_i, 0);
    
    nslider_y[i]   = array_create(_tam_line_i, 0);
    nslider_ys[i]  = array_create(_tam_line_i, 1*escala);
    nslider_xs[i]  = array_create(_tam_line_i, 1*escala);
    nslider_ang[i] = array_create(_tam_line_i, 0);
    
    slider_y[i]    = array_create(_tam_line_i, 0);
    slider_xs[i]   = array_create(_tam_line_i, 1*escala);
    slider_ys[i]   = array_create(_tam_line_i, 1*escala);
    slider_ang[i]  = array_create(_tam_line_i, 0);
    slider_hold[i] = array_create(_tam_line_i, false);
    slider_ante[i] = array_create(_tam_line_i, 0);
    slider_alpg[i] = array_create(_tam_line, 0);
    slider_alpr[i] = array_create(_tam_line, 0);
    
    nbool_xs[i]   = array_create(_tam_line_i, 1*escala);
    nbool_ys[i]   = array_create(_tam_line_i, 1*escala);
    nbool_ang[i]  = array_create(_tam_line_i, 0);
    nbool_alp[i]  = array_create(_tam_line_i, 0);
    nbool_addx[i] = array_create(_tam_line_i, 0);
    nbool_alpg[i] = array_create(_tam_line_i, 0);
    nbool_alpr[i] = array_create(_tam_line_i, 0);
    
    bool_xs[i]   = array_create(_tam_line_i, 1*escala);
    bool_ys[i]   = array_create(_tam_line_i, 1*escala);
    bool_ang[i]  = array_create(_tam_line_i, 0);
    bool_alp[i]  = array_create(_tam_line_i, 0);
    bool_addx[i] = array_create(_tam_line_i, 0);
    bool_alpg[i] = array_create(_tam_line_i, 0);
    bool_alpr[i] = array_create(_tam_line_i, 0);
    
    num_atual[i] = array_create(_tam_line_i, 0);    
}

refcooldown_pass_anim = game_get_speed(gamespeed_fps)*.05;
cooldown_pass_anim    = refcooldown_pass_anim;

for (var i = 0; i < array_length(lines[linha_atual]); i++) {
    nlines_alp_all[linha_atual][i] = 1;
    lines_alp_all[linha_atual][i] = 1;
}     

#endregion

inputs = function()
{
    click_hold = mouse_check_button(mb_left);
    click_rele = mouse_check_button_released(mb_left);
    click = mouse_check_button_pressed(mb_left);
}

realiza_acao = function(_indice)
{
    switch (lines[linha_atual][_indice][0]) {
    	case "Jogar":
            transciona(rm_1, 1);
        break;
        
        case "Opcoes":
            muda_linha(1);
        break;
        
        case "Sair":
            game_end();
        break;
        
        case "Voltar":
            switch (linha_atual) {
            	case 1: muda_linha(0) break;
                case 2: muda_linha(1) break;
                case 3: muda_linha(1) break;
            }
        break;
        
        case "Visuais":
            muda_linha(2);
        break;
    }
}

reseta_variaveis = function(_indice)
{
    lines_xs[linha_atual][_indice] = elastic("lines_xs" + string(linha_atual) + string(_indice), lines_xs[linha_atual][_indice], nlines_xs[linha_atual][_indice], , .15);
    lines_ys[linha_atual][_indice] = elastic("lines_ys" + string(linha_atual) + string(_indice), lines_ys[linha_atual][_indice], nlines_xs[linha_atual][_indice], , .15);
    lines_ang[linha_atual][_indice] = elastic("lines_ang" + string(linha_atual) + string(_indice), lines_ang[linha_atual][_indice], nlines_ang[linha_atual][_indice], , .2);
    
    lines_alp_w[linha_atual][_indice] = lerp(lines_alp_w[linha_atual][_indice], nlines_alp_w[linha_atual][_indice], .3);
    lines_alp_all[linha_atual][_indice] = lerp(lines_alp_all[linha_atual][_indice], nlines_alp_all[linha_atual][_indice], .2);
    
    lines_addy_an[linha_atual][_indice] = lerp(lines_addy_an[linha_atual][_indice], nlines_addy_an[linha_atual][_indice], .15);
    lines_addx_an[linha_atual][_indice] = lerp(lines_addx_an[linha_atual][_indice], nlines_addx_an[linha_atual][_indice], .15);
    sepy = lerp(sepy, 60*escala, .1);
    
    global.slider_x[linha_atual][_indice] = lerp(global.slider_x[linha_atual][_indice], global.nslider_x[linha_atual][_indice], .3);
    slider_y[linha_atual][_indice] = lerp(slider_y[linha_atual][_indice], nslider_y[linha_atual][_indice], .5);
    slider_xs[linha_atual][_indice] = lerp(slider_xs[linha_atual][_indice], nslider_xs[linha_atual][_indice], .2);
    slider_ys[linha_atual][_indice] = lerp(slider_ys[linha_atual][_indice], nslider_ys[linha_atual][_indice], .2);
    slider_ang[linha_atual][_indice] = lerp(slider_ang[linha_atual][_indice], nslider_ang[linha_atual][_indice], .2);
    
    bool_xs[linha_atual][_indice] = elastic("bool_xs" + string(linha_atual) + string(_indice), bool_xs[linha_atual][_indice], nbool_xs[linha_atual][_indice], , .15);
    bool_ys[linha_atual][_indice] = elastic("bool_ys" + string(linha_atual) + string(_indice), bool_ys[linha_atual][_indice], nbool_ys[linha_atual][_indice], , .15);
    bool_ang[linha_atual][_indice] = elastic("bool_ang" + string(linha_atual) + string(_indice), bool_ang[linha_atual][_indice], nbool_ang[linha_atual][_indice], , .15);
    bool_alp[linha_atual][_indice] = lerp(bool_alp[linha_atual][_indice], nbool_alp[linha_atual][_indice], .3);
    bool_addx[linha_atual][_indice] = lerp(bool_addx[linha_atual][_indice], nbool_addx[linha_atual][_indice], .1);
    bool_alpg[linha_atual][_indice] = lerp(bool_alpg[linha_atual][_indice], nbool_alpg[linha_atual][_indice], .15);
    bool_alpr[linha_atual][_indice] = lerp(bool_alpr[linha_atual][_indice], nbool_alpr[linha_atual][_indice], .15);
}

muda_linha = function(_new_linha)
{
    new_line = _new_linha;
    
    estados = estado_anim_suma;
}

click_mouse = function(_indice)
{
    var _pode = true;
    
    if (array_length(lines[linha_atual][_indice]) > 1){
        if (lines[linha_atual][_indice][1] == "slider" or lines[linha_atual][_indice][1] == "bool"){
            _pode = false;
        }
        
        if (lines[linha_atual][_indice][1] == "bool"){
            window_set_cursor(cr_drag);
        }
    }
    
    if (_pode == false) exit;
    
    window_set_cursor(cr_drag);
    
    if (click_hold){
        nlines_xs[linha_atual][_indice] = .8*escala;
        nlines_ys[linha_atual][_indice] = .8*escala;
    }
    
    if (click_rele){
        play_sound(snd_clica, .6, 1.2);
        
        nlines_xs[linha_atual][_indice] = 1*escala;
        nlines_ys[linha_atual][_indice] = 1*escala;
        
        if (num_atual[linha_atual][_indice] <= 0){
            lines_xs[linha_atual][_indice] = 1.5*escala;
        }
        
        lines_ys[linha_atual][_indice] = .4;
        lines_ang[linha_atual][_indice] = random_range(5, -5);
        
        if (array_length(lines[linha_atual][_indice]) > 1 and lines[linha_atual][_indice][1] != "slider"){
            if (num_atual[linha_atual][_indice] == 1){
                realiza_acao(_indice);
            }else{
                if (array_length(lines[linha_atual][_indice]) > 2){ 
                    lines_color[linha_atual][_indice] = lines[linha_atual][_indice][2];
                }
            
                num_atual[linha_atual][_indice] = 1;
            }
        }else{
            realiza_acao(_indice);
        }
    }
}

coloca_define_col = function(_x, _y, _txt, _halign, _valign, _indice)
{
    var _find = true;
    
    for (var i = 0; i < array_length(slider_hold[linha_atual]); i++) {
    	if (slider_hold[linha_atual][i]){
            _find = false;
            
            break;
        }
    }
    
    if (_find == false) exit;
    
    var _colx1 = _x-(string_width(_txt)*escala)/2;
    var _colx2 = _x+(string_width(_txt)*escala)/2;
    
    var _coly1 = _y-(string_height(_txt)*escala)/2;
    var _coly2 = _y+(string_height(_txt)*escala)/2;
    
    //Definindo de acordo com o halign
    switch (_halign) {
        case -1: 
            _colx1 = _x;
            _colx2 = _x+(string_width(_txt)*escala);
        break;
        
        case 0: 
            _colx1 = _x;
            _colx2 = _x+(string_width(_txt)*escala);
        break;
        
        case 2:
            _colx1 = _x-(string_width(_txt)*escala);
            _colx2 = _x;
        break;
    }
    
    //Definindo de acordo com o valign
    switch (_valign) {
        case -1: 
            _coly1 = _y;
            _coly2 = _y+(string_height(_txt)*escala);
        break;
        
        case 0: 
            _coly1 = _y;
            _coly2 = _y+(string_height(_txt)*escala);
        break;
        
        case 2:
            _coly1 = _y-(string_height(_txt)*escala);
            _coly2 = _y;
        break;
    }
    
    var _col = collision_rectangle(_colx1, _coly1, _colx2, _coly2, obj_clicador, false, false);
     
    if (hitbox){
        draw_set_alpha(.5);
        draw_set_color(global.cores.red);
        draw_rectangle(_colx1, _coly1, _colx2, _coly2, false);
        draw_set_color(c_white);
        draw_set_alpha(1);
    }
    
    //Colidir com o mouse
    colide_mouse(_col, _indice);
}

colide_mouse = function(_colisao, _indice)
{
    if (_colisao and estados == estado_normal){
        if (atual != _indice){
            lines_xs[linha_atual][_indice] = 1.5*escala;
            lines_ys[linha_atual][_indice] = .6*escala;
            
            play_sound(snd_selec, .9, 1.5);
        }
        
        click_mouse(_indice);
        
        atual = _indice;
    }else{
        if (atual == _indice){
            atual = -1;
            
            window_set_cursor(cr_default);
            
            if (num_atual[linha_atual][_indice] == 1){
                lines_xs[linha_atual][_indice] = 1.5*escala;
                lines_ys[linha_atual][_indice] = .4*escala;
                lines_ang[linha_atual][_indice] = random_range(10, -10);
            }
            
            lines_color[linha_atual][_indice] = global.cores.white;
            num_atual[linha_atual][_indice] = 0;
        }
        
        nlines_xs[linha_atual][_indice] = 1*escala;
        nlines_ys[linha_atual][_indice] = 1*escala;
    }
}

define_acao_i = function(_indice)
{
    if (atual == _indice){
        nlines_alp_w[linha_atual][_indice] = 1;
        nlines_addy_an[linha_atual][_indice] = -5*escala;
    }else{
        nlines_alp_w[linha_atual][_indice] = 0;
        nlines_addy_an[linha_atual][_indice] = 0;
    }
}

anim_alpha = function(_alph)
{
    for (var i = 0; i <= indice_anim; i++) {
        nlines_alp_all[linha_atual][i] = _alph;
        nlines_addy_an[linha_atual][i] = 0;
    }
    
    if (indice_anim == array_length(lines[linha_atual])-1){
        if (_alph == 0){
            if (lines_alp_all[linha_atual][indice_anim] <= .05){
                linha_atual = new_line;
                
                indice_anim = clamp(indice_anim, 0, array_length(lines[linha_atual])-1);
                
                for (var i = 0; i < array_length(lines[linha_atual])-1; i++) {
                    nlines_alp_all[linha_atual][i] = 0;
                    lines_alp_all[linha_atual][i] = 0;
                    lines_addy_an[linha_atual][i] = -30;
                    nlines_addy_an[linha_atual][i] = -30;
                }
                
                indice_anim = 0;
                
                cooldown_pass_anim = refcooldown_pass_anim;
                
                estados = estados_anim_aparece;
                
                exit;
            }
        }else{
            if (lines_alp_all[linha_atual][indice_anim] >= .95){    
                new_line = 0;
                
                for (var i = 0; i < array_length(lines[linha_atual])-1; i++) {
                    nlines_alp_all[linha_atual][i] = 1;
                    lines_alp_all[linha_atual][i] = 1;
                    lines_addy_an[linha_atual][i] = 0;
                    nlines_addy_an[linha_atual][i] = 0;
                }               
                
                cooldown_pass_anim = refcooldown_pass_anim;
                
                estados = estado_normal;
                
                exit;
            }
        }
    }
    
    cooldown_pass_anim--;
    cooldown_pass_anim = clamp(cooldown_pass_anim, 0, infinity);
    
    if (cooldown_pass_anim <= 0){
        if (indice_anim < array_length(lines[linha_atual])-1){
            indice_anim++;
        }
        
        indice_anim = clamp(indice_anim, 0, array_length(lines[linha_atual])-1);
        
        cooldown_pass_anim = refcooldown_pass_anim;
    }
    
    show_debug_message(indice_anim);
}

desenha_slider = function(_x, _y, _txt, _halign, _valign, _indice, _cor)
{
    var _rec_width = 20*escala;
    var _rec_height = 20*escala;
    
    var _height_line = 4*escala;
    var _width_line = 150*escala;
    var _offy = 30*escala;
    
    var _slgxmid = _x;
    var _slgymid = _y+_rec_height/2;
    
    //Definindo x de acordo com o halign 
    switch (_halign) {
        case -1: 
            _slgxmid = _x+_width_line/2;
        break;
        
        case 0: 
            _slgxmid = _x+_width_line/2;
        break;
        
        case 2:
            _slgxmid = _x-_width_line/2;
        break;
    }
    
    switch (_valign) {
    	case -1:
            _slgymid = _y+_rec_height;
        break;
        
        case 0: 
            _slgymid = _y+_rec_height;
        break;
        
        case 2:
            _slgymid = _y-_rec_height/2;
        break;
    }
    
    draw_set_alpha(lines_alp_all[linha_atual][_indice]);
    
    draw_set_color(global.cores.black);
    draw_rectangle(_slgxmid+_width_line/2+(1.5*escala), _slgymid+_offy+(2*escala)-_height_line/2, _slgxmid-_width_line/2+(1.5*escala), _slgymid+_offy+(2*escala)+_height_line/2, false);
    draw_set_color(global.cores.gray);
    draw_rectangle(_slgxmid+_width_line/2, _slgymid+_offy-_height_line/2, _slgxmid-_width_line/2, _slgymid+_offy+_height_line/2, false);
    draw_set_alpha(lines_alp_w[linha_atual][_indice]*lines_alp_all[linha_atual][_indice]);
    draw_set_color(global.cores.white);
    draw_rectangle(_slgxmid+_width_line/2, _slgymid+_offy-_height_line/2, _slgxmid-_width_line/2, _slgymid+_offy+_height_line/2, false);

    draw_set_alpha(lines_alp_all[linha_atual][_indice]);
    
    draw_set_color(global.cores.black);
    draw_rectangle(_slgxmid-_rec_width/2+global.slider_x[linha_atual][_indice]+(2*escala), _slgymid+_offy-_rec_height/2+(2*escala), _slgxmid+_rec_width/2+(2*escala)+global.slider_x[linha_atual][_indice], _slgymid+_offy+_rec_height/2+(2*escala), false);
    
    draw_set_color(global.cores.gray);
    draw_rectangle(_slgxmid-_rec_width/2+global.slider_x[linha_atual][_indice], _slgymid+_offy-_rec_height/2, _slgxmid+_rec_width/2+global.slider_x[linha_atual][_indice], _slgymid+_offy+_rec_height/2, false);
    
    draw_set_alpha(lines_alp_w[linha_atual][_indice]*lines_alp_all[linha_atual][_indice]);
    draw_set_color(global.cores.white);
    draw_rectangle(_slgxmid-_rec_width/2+global.slider_x[linha_atual][_indice], _slgymid+_offy-_rec_height/2, _slgxmid+_rec_width/2+global.slider_x[linha_atual][_indice], _slgymid+_offy+_rec_height/2, false);
    
    var _colix1 = _slgxmid-_rec_width/2;
    var _colix2 = _slgxmid+_rec_width/2;
    
    var _coliy1 = _slgymid+_offy-_rec_height/2;
    var _coliy2 = _slgymid+_offy+_rec_height/2;
    
    var _coli = collision_rectangle(_colix1+global.slider_x[linha_atual][_indice], _coliy1, _colix2+global.slider_x[linha_atual][_indice], _coliy2, obj_clicador, false, false);
    
    if (hitbox){
        draw_set_alpha(.5);
        draw_set_color(global.cores.red);
        draw_rectangle(_colix1+global.slider_x[linha_atual][_indice], _coliy1, _colix2+global.slider_x[linha_atual][_indice], _coliy2, false);
        draw_set_color(c_white);
        draw_set_alpha(1);
    }
    
    var _multi_slider = 1;
    
    if (_halign == 2){
        _multi_slider = -1;
    }
    
    var _realx_slider = (global.slider_x[linha_atual][_indice]+_slgxmid);
    var _inicio_barra = _slgxmid-((_width_line/2)*_multi_slider);
    
    var _porc = ((_realx_slider)-(_inicio_barra))/_width_line;
    
    global.slider_qnt[linha_atual][_indice] = ((_porc*100)*_multi_slider);
    
    if (round(global.slider_qnt[linha_atual][_indice]) == 99){
        global.slider_qnt[linha_atual][_indice] = 100;
    }
    
    if (variable_global_exists(lines[linha_atual][_indice][2])){ 
        variable_global_set(lines[linha_atual][_indice][2], global.slider_qnt[linha_atual][_indice]/25);
    }
    
    var _txt_slider = "<" + string(round(global.slider_qnt[linha_atual][_indice])) + "%>";
    
    var _addx_txt = _width_line/2+(string_width(_txt_slider)*escala)/1.5;
    
    switch (_halign) {
        case -1:
            _addx_txt = (_width_line+(string_width(_txt_slider)*escala)/2)/2.1;
        break;
        
    	case 0:
            _addx_txt = (_width_line+(string_width(_txt_slider)*escala)/2)/2.1;
        break;
        
        case 2:
            _addx_txt = ((_width_line+(string_width(_txt_slider)*escala)/2)/2.1)*-1;
        break;
    }
    
    draw_set_color(global.cores.black);
    draw_text_transformed(_slgxmid+_addx_txt, _slgymid+_offy+4*escala, _txt_slider, slider_xs[linha_atual][_indice], slider_ys[linha_atual][_indice], slider_ang[linha_atual][_indice]);
    draw_set_color(global.cores.white);
    draw_text_transformed(_slgxmid+_addx_txt, _slgymid+_offy, _txt_slider, slider_xs[linha_atual][_indice], slider_ys[linha_atual][_indice], slider_ang[linha_atual][_indice]);
    
    draw_set_color(c_white);
    
    if (_coli and slider_pod){
        if (click_hold){
            play_sound(snd_clica, .6, 1.2);
            
            slider_hold[linha_atual][_indice] = true;
            
            slider_pod = false;
        }
    }
    
    if (!click_hold){
        if (slider_hold[linha_atual][_indice]){
            slider_pod = true;
            
            if (lines[linha_atual][_indice][2] == "shake_qnt"){
                screen_shake(2);
            }
        }
        
        slider_hold[linha_atual][_indice] = false;
    }
    
    if (slider_hold[linha_atual][_indice]){
        global.nslider_x[linha_atual][_indice] = mouse_x-(_slgxmid);
        
        global.nslider_x[linha_atual][_indice] = clamp(global.nslider_x[linha_atual][_indice], -_width_line/2, _width_line/2);
        
        if (atual != _indice){
            image_xscale = .99;
        }
        
        atual = _indice;
    }
    
    draw_set_alpha(1);
}    

desenha_bool = function(_x, _y, _txt, _indice, _halign, _valign )
{
    var _bool_trade = "On";
    
    var _addx = sin(current_time * 0.002 + _indice * 0.2);
    var _addy = cos(current_time * 0.003 + _indice * 0.2)*2;
    
    if (variable_global_get(lines[linha_atual][_indice][2]) == false){
        _bool_trade = "Off";
    }
    
    var _texto = "<" + _bool_trade + ">";
    
    var _str_height = string_height(_texto)*escala;
    var _str_width = string_width(_texto)*escala;
    
    var _boolx = _x+bool_addx[linha_atual][_indice]+_addx;
    var _booly = (_y-_str_height/4)+_addy;
    
    draw_set_alpha(bool_alp[linha_atual][_indice]);
    draw_set_color(global.cores.black);
    draw_text_transformed(_boolx, _booly+(4*escala), _texto, bool_xs[linha_atual][_indice], bool_ys[linha_atual][_indice], bool_ang[linha_atual][_indice]);
    
    draw_set_color(global.cores.gray);
    draw_text_transformed(_boolx, _booly, _texto, bool_xs[linha_atual][_indice], bool_ys[linha_atual][_indice], bool_ang[linha_atual][_indice]);
    
    draw_set_alpha((lines_alp_w[linha_atual][_indice]*lines_alp_all[linha_atual][_indice])*bool_alp[linha_atual][_indice]);
    draw_set_color(global.cores.white);
    draw_text_transformed(_boolx, _booly, _texto, bool_xs[linha_atual][_indice], bool_ys[linha_atual][_indice], bool_ang[linha_atual][_indice]);
    
    draw_set_alpha(bool_alpg[linha_atual][_indice]);
    draw_set_color(global.cores.green);
    draw_text_transformed(_boolx, _booly, _texto, bool_xs[linha_atual][_indice], bool_ys[linha_atual][_indice], bool_ang[linha_atual][_indice]);
    
    draw_set_alpha(bool_alpr[linha_atual][_indice]);
    draw_set_color(global.cores.red);
    draw_text_transformed(_boolx, _booly, _texto, bool_xs[linha_atual][_indice], bool_ys[linha_atual][_indice], bool_ang[linha_atual][_indice]);
    
    draw_set_alpha(1);
    draw_set_color(c_white);
    
    if (atual == _indice){
        if (click_hold){
            nlines_xs[linha_atual][_indice] = .8*escala;
            nlines_ys[linha_atual][_indice] = .8*escala;
        }else{
            nlines_xs[linha_atual][_indice] = 1*escala;
            nlines_ys[linha_atual][_indice] = 1*escala;
        }
        
        if (click_rele){
            lines_xs[linha_atual][_indice] = 1.2*escala;
            lines_ys[linha_atual][_indice] = .4;
            lines_ang[linha_atual][_indice] = random_range(5, -5);
            
            play_sound(snd_clica, .6, 1.2);
            
            bool_xs[linha_atual][_indice] = 1.1;
            bool_ys[linha_atual][_indice] = .5;
            bool_ang[linha_atual][_indice] = random_range(10, -10);
            
            var _booleano = variable_global_get(lines[linha_atual][_indice][2]);
            
            if (!_booleano == true){
                bool_alpg[linha_atual][_indice] = 2;    
                
                if (lines[linha_atual][_indice][2] == "piscadas"){
                    pisca(1, global.cores.yellow);
                }
            }else{
                bool_alpr[linha_atual][_indice] = 2;
            }
            
            variable_global_set(lines[linha_atual][_indice][2], !_booleano);
        }
        
        var _multi = 1;
        
        if (_halign == 2){
            _multi = -1;
        }
        
        nbool_addx[linha_atual][_indice] = (_str_width+(string_width(_txt)*escala)/2)*_multi;
        nbool_alp[linha_atual][_indice] = 1;
    }else{
        nbool_addx[linha_atual][_indice] = 0;
        nbool_alp[linha_atual][_indice] = 0;
        
        nlines_xs[linha_atual][_indice] = 1*escala;
        nlines_ys[linha_atual][_indice] = 1*escala;
    }
}

draw_seletores = function()
{
    var _halign = halign;
    var _valign = valign;
    
    draw_set_halign(_halign);
    draw_set_valign(_valign);
    draw_set_font(fnt_menu);
    
    var _extra = false;
    
    var _addy_sl = 0;
    
    var _offy_somb = 4;
    
    for (var i = 0; i < array_length(lines[linha_atual]); i++) {
        _extra = "";
        
        if (array_length(lines[linha_atual][i]) > 1){
            _extra = lines[linha_atual][i][1];
        }
        
        //Define o que o atual vai mudar
        define_acao_i(i);
        
        var x_offset = sin(current_time * 0.002 + i * 0.2);
        var y_offset = cos(current_time * 0.005 + i * .25) * 2;
        
        var _txt = lines[linha_atual][i][num_atual[linha_atual][i]];
        
        //Alinhador de texto 
        var _addy = ((array_length(lines[linha_atual])/2)*sepy)-((string_height(_txt)/2)*i);
        
        var _txts_x = originx+x_offset;
        var _txts_y = originy+(sepy*i)-_addy-y_offset;
        
        draw_set_alpha(lines_alp_all[linha_atual][i]);
        
        draw_set_color(global.cores.black);
        draw_text_transformed(_txts_x+lines_addx_an[linha_atual][i], _txts_y+(_offy_somb*lines_ys[linha_atual][i])+lines_addy_an[linha_atual][i], _txt, lines_xs[linha_atual][i], lines_ys[linha_atual][i], lines_ang[linha_atual][i]);
        draw_set_color(global.cores.gray);
        draw_text_transformed(_txts_x+lines_addx_an[linha_atual][i], _txts_y+lines_addy_an[linha_atual][i], _txt, lines_xs[linha_atual][i], lines_ys[linha_atual][i], lines_ang[linha_atual][i]);
        
        draw_set_alpha(lines_alp_w[linha_atual][i]*lines_alp_all[linha_atual][i]);
        draw_set_color(lines_color[linha_atual][i]);
        
        draw_text_transformed(_txts_x, _txts_y+lines_addy_an[linha_atual][i], _txt, lines_xs[linha_atual][i], lines_ys[linha_atual][i], lines_ang[linha_atual][i]);
        
        draw_set_color(c_white);
        draw_set_alpha(1);
        
        coloca_define_col(_txts_x, _txts_y, _txt, _halign, _valign, i);
        
        switch (_extra) {
        	case "slider":
                desenha_slider(_txts_x, _txts_y, _txt, _halign, _valign, i, lines_color[linha_atual][i]);
            break;
            
            case "bool":
                desenha_bool(_txts_x, _txts_y, _txt, i, _halign, _valign);
            break;
        }
        
        reseta_variaveis(i);
    }    
    
    draw_set_font(-1);
    draw_set_valign(-1);
    draw_set_halign(-1);
    
    linha_atual = clamp(linha_atual, 0, array_length(lines));
}

estado_normal = function() {}

estado_anim_suma = function()
{
    anim_alpha(0);
}

estados_anim_aparece = function()
{
    anim_alpha(1);
}

estados = estado_normal;