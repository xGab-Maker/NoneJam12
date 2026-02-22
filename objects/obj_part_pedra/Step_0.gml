image_alpha -= .01;

if (image_alpha <= .01){
    instance_destroy(self);
}

x += hspd;
y += vspd;

image_angle += hspd*10;

if (y >= limite){
    vspd = -vspd/1.8;
    
    hspd = hspd/1.3;
}else{
    vspd += grav;
}
