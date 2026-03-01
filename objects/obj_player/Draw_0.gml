draw_sprite_ext(spr_sombra, image_index, sombrax, sombray+sprite_height/2+2, xscale, yscale, 0, image_blend, image_alpha/2);

draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, image_blend, image_alpha);

//draw_text(x, y+15, sobe);
//draw_text(room_width/2, room_height/2, string("ladx {0}\nlady {1}", indicex, indicey));
//
draw_text(x, y-15, global.combus_qnt);