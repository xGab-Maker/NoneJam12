screen_shake(2);

estado = noone;

atingidos = [];

image_yscale = 0;
image_xscale = 0;

lado = 0;

aumenta_cima = function()
{
    image_yscale += 2;

    image_yscale = min(image_yscale, 60);
}

estado_aumenta = function()
{
    screen_shake(1);
    
    image_xscale = lerp(image_xscale, 3, .15);
    
    if (image_xscale >= 2.9){
        estado = estado_morre;
    }
}

estado_morre = function()
{
    image_xscale -= .3;
    
    if (image_xscale <= 0){
        instance_destroy(self);
    }
}

estado = estado_aumenta;