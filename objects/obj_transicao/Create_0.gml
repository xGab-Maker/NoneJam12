local = noone;

alpha = 0;

indini  = 0;
indprox = 0;

planeta1 = {
    spr : spr_planeta1,
    x   : room_width/2-120,
    y   : room_height/2+20,
}

planeta2 = {
    spr : spr_planeta2,
    x   : room_width/2+80,
    y   : room_height/2-80,
}

planetas = [planeta1, planeta2];

switch (indini) {
	case 0: indprox = 1 break;
	case 1: indprox = 0 break;
}

planeta_ini  = planetas[indini];
planeta_prox = planetas[indprox];

nave_p = {
    spr : spr_player,
    x   : planeta_ini.x,
    y   : planeta_ini.y,
}

roda_first = false;