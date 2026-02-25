estado();

xscale_dano = elastic("xs_dan", xscale_dano, 1);
yscale_dano = elastic("ys_dan", yscale_dano, 1);

y += vspd;

cooldown_some--;
cooldown_some = clamp(cooldown_some, 0, infinity);

if (cooldown_some <= 0 and estado != estado_morre){
    estado = estado_morre;
    
    if (pai != noone){
        if (instance_exists(pai)){
            if (pai.vida_predio != noone){
                pai.vida_predio = noone;
            }
        }
    }
}