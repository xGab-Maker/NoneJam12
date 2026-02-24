estado = noone;

alpha_dano = 1;

vida = 0;
vida_perd = 0;

xscale_dano = 1.5;
yscale_dano = .6;

vspd = -.2;

estado_parado = function()
{
    alpha_dano = lerp(alpha_dano, 1, .15);
    
    vspd = lerp(vspd, 0, .05);
}

estado_morre = function()
{
    vspd = lerp(vspd, 0, .05);
    
    if (vspd >= -.07){
        alpha_dano = lerp(alpha_dano, 0, .15);
        
        if (alpha_dano <= .01){
            instance_destroy(self);
        }
    }
}

estado = estado_parado;