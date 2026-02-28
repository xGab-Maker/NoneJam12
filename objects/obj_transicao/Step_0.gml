depth = -9999999;

if (room != local){
    alpha += .05;
    
    if (alpha >= 2){
        room_goto(local);
    }
}else{
    alpha -= .05;
    
    if (alpha <= .01){
        instance_destroy(self);
    }
}