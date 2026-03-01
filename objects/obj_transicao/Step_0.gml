switch (indini) {
	case 0: indprox = 1 break;
	case 1: indprox = 0 break;
}

planeta_ini  = planetas[indini];
planeta_prox = planetas[indprox];

if (roda_first == false){
    nave_p.x = planeta_ini.x;
    nave_p.y = planeta_ini.y;
    
    roda_first = true;
}

if (room != local){
    alpha += .05;
    
    if (alpha >= 2){
        room_goto(local);
    }
}else{
    alpha -= .05;
    
    if (alpha <= .01){
        instance_destroy(self);
    }
}

