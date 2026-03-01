if (estado == estado_morre_sobe or estado == estado_morre_desce or array_get_index(other.atingidos, id) != -1) exit;

vida_perd++;

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

array_push(other.atingidos, id);