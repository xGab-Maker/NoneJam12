cooldown_play = game_get_speed(gamespeed_fps)*.1;

//pisca(.2, #F76F44);

screen_shake(5);

estado = noone;

atingidos = [];

image_yscale = 0;
image_xscale = 0;

lado = 0;

pitch = random_range(.2, 1);

aumenta_cima = function()
{
    image_yscale += 2;

    image_yscale = min(image_yscale, 60);
}

estado_aumenta = function()
{
    cooldown_play--;
    cooldown_play = clamp(cooldown_play, 0, infinity);
    
        pitch += .05;
        
        play_sound(snd_laser, pitch, pitch);
        
        cooldown_play = game_get_speed(gamespeed_fps)*.02;
    
    image_xscale = lerp(image_xscale, 5, .15);
    
    if (image_xscale >= 4.6){
        estado = estado_morre;
    }
}

estado_morre = function()
{
    cooldown_play--;
    cooldown_play = clamp(cooldown_play, 0, infinity);
    
        pitch -= .05;
        
        play_sound(snd_laser, pitch, pitch);
        
        cooldown_play = game_get_speed(gamespeed_fps)*.02;
    
    image_xscale -= .3;
    
    if (image_xscale <= 0){
        instance_destroy(self);
    }
}

estado = estado_aumenta;