display_set_gui_size(640, 360);

draw_set_alpha(alpha);

//draw_rectangle_color(0, 0, room_width, room_height, #141527, #141527, #141527, #141527, false);

draw_sprite(spr_fundo_stars, 0, 0, 0);

draw_sprite(planeta1.spr, 0, planeta1.x, planeta1.y);
draw_sprite(planeta2.spr, 0, planeta2.x, planeta2.y);

draw_sprite_ext(nave_p.spr, 0, nave_p.x, nave_p.y, 1, 1, sine_between(current_time/1000, 1, -10, 10), c_white, alpha);

draw_set_alpha(1);
