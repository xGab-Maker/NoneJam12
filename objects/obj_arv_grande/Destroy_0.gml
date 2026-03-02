global.mapa[cord[1]][cord[0]] = 0;

delete fogo;

play_sound(snd_destroi_predio, 1.4, .6, false);

instance_create_depth(x, y, depth-1, choose(obj_dinheiro2));

global.blocos_quebrados++;