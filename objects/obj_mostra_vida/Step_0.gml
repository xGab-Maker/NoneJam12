vspd = lerp(vspd, 0, .05);

y += vspd;


if (vspd >= -.07){
    alpha_dano = lerp(alpha_dano, 0, .15);
    
    if (alpha_dano <= .01){
        instance_destroy(self);
    }
}

xscale_dano = elastic("xs_dan", xscale_dano, 1);
yscale_dano = elastic("ys_dan", yscale_dano, 1);