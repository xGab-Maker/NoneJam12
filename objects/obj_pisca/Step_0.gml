qnt = lerp(qnt, 0, .1);

if (colorido){
    _time += .5 / game_get_speed(gamespeed_fps);
}

if (qnt <= .01){
    instance_destroy(self);
}