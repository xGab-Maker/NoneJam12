repeat (3) {
    cria_particula(spr_explosao_insana, x+random_range(-sprite_width/2, sprite_width/2), y+random_range(-sprite_height/2, sprite_height/2), -y);	
}

play_sound(snd_explode, .7, 1.4, false);
