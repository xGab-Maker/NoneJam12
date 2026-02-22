depth = -y;

if (instance_exists(conjunto[0])){
    vida_perdida = conjunto[0].vida_perdida;
}

estados();

angle = elastic("ang", angle, 0, 1, .15);
alpha_branco = lerp(alpha_branco, 0, .15);

vida = array_length(conjunto); 

if (inven){
    cooldown_dano--;
    cooldown_dano = clamp(cooldown_dano, 0, infinity);
    
    if (cooldown_dano <= 0){
        inven = false;
        
        cooldown_dano = game_get_speed(gamespeed_fps)*.1;
    }
}
