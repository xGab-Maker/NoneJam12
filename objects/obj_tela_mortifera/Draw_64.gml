display_set_gui_size(640, 360);

if (al_draw > 0){
    draw_set_alpha(al_draw);
    draw_set_color(global.cores.gray);
    draw_rectangle(0, 0, view_get_wport(view_camera[0])*2, view_get_hport(view_camera[0]), false);
    draw_set_color(global.cores.white);
    draw_set_alpha(1);
}

if (al_draw >= .5){
    alp_txts = lerp(alp_txts, 1, .15);
    
    draw_set_alpha(alp_txts);
    
    draw_set_font(fnt_louja);    
    draw_set_halign(1);
    draw_set_valign(1);
    
    var _corzinha = global.cores.red;
    
    if (texto_grande == "Você Eliminou Toda a Cidade\nParabéns!!") _corzinha = global.cores.green;
    
    draw_set_color(global.cores.black);
    draw_text_transformed(room_width/2, room_height/2-98+sine_between(current_time/1000, 4, -4, 4), texto_grande, .7, .7, 0);
    draw_set_color(_corzinha);
    draw_text_transformed(room_width/2, room_height/2-100+sine_between(current_time/1000, 4, -4, 4), texto_grande, .7, .7, 0);
    draw_set_color(global.cores.white);
    
    draw_set_color(global.cores.black);
    draw_text_transformed(room_width/2, room_height/2+2, "Tentar Novamente", .3*tent_xs, .3*tent_ys, tent_an);
    draw_set_color(global.cores.white);
    draw_text_transformed(room_width/2, room_height/2, "Tentar Novamente", .3*tent_xs, .3*tent_ys, tent_an);
    
    if (alp_txts >= .9){
        if (point_in_rectangle(mouse_x, mouse_y, room_width/2-(string_width("Tentar Novamente")*.3)/2, room_height/2-(string_height("Tentar Novamente")*.3)/2, room_width/2+(string_width("Tentar Novamente")*.3)/2, room_height/2+(string_height("Tentar Novamente")*.3)/2)){
            if (atual != 0){
                tent_xs = 1.3;
                tent_ys = .8;
                
                tent_an = random_range(-10, 10);
            }
            
            if (mouse_check_button(mb_left)){
                tent_nxs = .9;
                tent_nys = .9;
            }
            
            if (mouse_check_button_pressed(mb_left)){
                tent_nxs = 1;
                tent_nys = 1;
                
                tent_an = random_range(-20, 20);
                
                transciona(rm_menu, 0);
                
                global.mapa = [];

                global.mapa = array_create(global.height_map, []);
                
                for (var i = 0; i < global.height_map; i++) {
                    global.mapa[i] = array_create(global.width_map, 0);
                }
                
                global.quais = array_create(8, 0);
                
                global.upg = {
                    qnt_col : 4,
                    dmg     : 1,
                    combus  : 1,
                    protect : 1,
                    vel_ati : 1,
                    tiroqnt : 1,
                    velplay : 1,
                    vel_tir : 5
                }
                
                global.last_pos = {
                    py : 324,
                    px : 0,
                    gridpx : 0,
                    gridpy : 0,
                    sobep  : 0
                }
                
                global.numwave = 0;
                
                global.combus_qnt = 1;
                
                global.money = {
                    brain : 0,
                    star  : 0    
                }
            }
            
            atual = 0;
        }else{
            if (atual == 0){
                atual = -1;
                
                tent_nxs = 1;
                tent_nys = 1;
            }
        }
    }
    
    draw_set_color(global.cores.black);
    draw_text_transformed(room_width/2, room_height/2+48, "Sair do Jogo", .3*sai_xs, .3*sai_ys, sai_an);
    draw_set_color(global.cores.white);
    draw_text_transformed(room_width/2, room_height/2+50, "Sair do Jogo", .3*sai_xs, .3*sai_ys, sai_an);
    
    if (alp_txts >= .9){
        if (point_in_rectangle(mouse_x, mouse_y, room_width/2-(string_width("Sair do Jogo")*.3)/2, room_height/2+50-(string_height("Sair do Jogo")*.3)/2, room_width/2+(string_width("Sair do Jogo")*.3)/2, room_height/2+50+(string_height("Sair do Jogo")*.3)/2)){
            if (atual != 1){
                sai_xs = 1.3;
                sai_ys = .8;
                
                sai_an = random_range(-10, 10);
            }
            
            if (mouse_check_button(mb_left)){
                sai_nxs = .9;
                sai_nys = .9;
            }
            
            if (mouse_check_button_pressed(mb_left)){
                sai_nxs = 1;
                sai_nys = 1;
                
                sai_an = random_range(-20, 20);
                
                game_end();
            }
            
            atual = 1;
        }else{
            if (atual == 1){
                atual = -1;
                
                sai_nxs = 1;
                sai_nys = 1;
            }
        }
    }
    
    draw_set_alpha(1);
    
    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_font(-1);
}