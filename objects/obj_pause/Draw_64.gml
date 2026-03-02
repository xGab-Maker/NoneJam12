display_set_gui_size(640, 360);

if (al_1 > 0){
    draw_set_alpha(al_1);
    
    draw_set_color(global.cores.gray);
    draw_rectangle(0, 0, view_get_wport(view_camera[0])*2, view_get_hport(view_camera[0])*2, false);
    draw_set_color(global.cores.white);
    
    draw_set_alpha(1);
    draw_set_alpha(al_2);
    
    draw_set_font(fnt_louja);
    draw_set_halign(1);
    draw_set_valign(1);
    draw_set_color(global.cores.black);
    draw_text_transformed(room_width/2, room_height/2+2, "Pausado\nClique ESC para despausar", .5, .5, 0);
    draw_set_color(global.cores.white);
    draw_text_transformed(room_width/2, room_height/2, "Pausado\nClique ESC para despausar", .5, .5, 0);
    draw_set_halign(-1);
    draw_set_valign(-1);
    draw_set_font(-1);
    
    draw_set_alpha(1);
}