draw_set_halign(1);
draw_set_valign(1);
draw_set_font(fnt_base);

var _offy = 110;
draw_set_alpha(alp_txt);
draw_set_color(global.cores.black);
draw_text_transformed(room_width/2+64, room_height/2-_offy+2, escrita, .3*xscale, .3*yscale, 0);
draw_set_color(global.cores.white);
draw_text_transformed(room_width/2+64, room_height/2-_offy, escrita, .3*xscale, .3*yscale, 0);
draw_set_alpha(1);
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);