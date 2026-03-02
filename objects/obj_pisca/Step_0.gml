qnt = lerp(qnt, 0, .1);

if (qnt <= .01){
    instance_destroy(self);
}