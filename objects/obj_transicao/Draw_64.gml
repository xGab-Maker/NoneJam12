display_set_gui_size(640, 360);

draw_set_color(#141527);
draw_set_alpha(alpha);
draw_rectangle(0, 0, view_get_wport(view_camera[0])*5, view_get_hport(view_camera[0])*5, false);

draw_sprite(planeta1.spr, 0, planeta1.x, planeta1.y);
draw_sprite(planeta2.spr, 0, planeta2.x, planeta2.y);

draw_sprite_ext(nave_p.spr, 0, nave_p.x, nave_p.y, 1, 1, sine_between(current_time/1000, 1, -10, 10), c_white, alpha);

draw_set_color(c_white);
draw_set_alpha(1);