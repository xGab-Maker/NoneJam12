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
    draw_text_transformed(room_width/2, room_height/2+2, "Sair do Jogo", .3*sai_xs, .3*sai_ys, sai_an);
    draw_set_color(global.cores.white);
    draw_text_transformed(room_width/2, room_height/2, "Sair do Jogo", .3*sai_xs, .3*sai_ys, sai_an);
    
    if (alp_txts >= .9){
        if (point_in_rectangle(mouse_x, mouse_y, room_width/2-(string_width("Sair do Jogo")*.3)/2, room_height/2-(string_height("Sair do Jogo")*.3)/2, room_width/2+(string_width("Sair do Jogo")*.3)/2, room_height/2+(string_height("Sair do Jogo")*.3)/2)){
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