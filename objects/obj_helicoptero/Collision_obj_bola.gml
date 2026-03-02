if (estado == estado_morre_sobe or estado == estado_morre_desce) exit;

instance_destroy(other);

vida_perd++;

play_sound(snd_hit, .7, 1.4, false);

xscale = 1.4;
yscale = .6;

al_white = 1;

if (vida_predio == noone){
    vida_predio = instance_create_depth(x, y-sprite_height/2, -9999, obj_mostra_vida);
    
    vida_predio.depth = depth-1;
    
    vida_predio.vida = vida;
    vida_predio.vida_perd = vida_perd;
    
    vida_predio.pai = id;
}else{
    vida_predio.vida_perd = vida_perd;
}