depth = -y;

if (!rodou){
    auto_tile();
    
    rodou = true;
}

if (instance_exists(conjunto[0])){
    vida_perdida = conjunto[0].vida_perdida;
}

vida = array_length(conjunto); 

estados();

angle = elastic("ang", angle, 0, 1, .15);
alpha_branco = lerp(alpha_branco, 0, .15);

if (vida_predio != noone){
    if (vida_predio.vida_perd != vida_perdida){
        vida_predio.xscale_dano = random_range(.5, 1.5);    
        vida_predio.yscale_dano = random_range(.5, 1.5);    
    }
    
    vida_predio.vida = vida;
    vida_predio.vida_perd = vida_perdida;
}

if (inven){
    cooldown_dano--;
    cooldown_dano = clamp(cooldown_dano, 0, infinity);
    
    if (cooldown_dano <= 0){
        inven = false;
        
        cooldown_dano = game_get_speed(gamespeed_fps)*.1;
    }
}
