if (other.bolhado == noone){
    other.xscale += .4;
    other.yscale -= .3;
    
    global.combus_qnt -= .1;
    
    instance_destroy(self);
    
    screen_shake(5);
    
    pisca(.5, c_red);
    
    other.alp_branco = 1;
    
    play_sound(snd_hit, .9, 1.5);
}else{
    instance_destroy(other.bolhado);
    
    play_sound(snd_estoura_bolha, .9, 1.5);
}